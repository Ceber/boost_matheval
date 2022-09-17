import os
import re
from conans import ConanFile, tools
from conan.tools.cmake import CMakeDeps, CMakeToolchain, CMake
from conan.tools.layout import cmake_layout


class MathEvalConan(ConanFile):
    name = "MathEval"
    author = "<ERGENSCHAEFFTER, Cédric> <ceber@ergen.fr>"
    url = "https://home.ergen.fr/gitlab/cpp/libs/boost_matheval"
    description = (
        "C++ MathEval 3rd party - Mathematical expressions evalutor."
    )

    settings = "os", "compiler", "build_type", "arch"

    options = {
        "shared": [True, False],
        "fPIC": [True, False],
        "build_tests": [True, False],
        "code_coverage": [True, False],
        "build_doc": [True, False],
        "build_tools": [True, False],
    }

    default_options = {
        "shared": False,
        "fPIC": True,
        "build_tests": False,
        "code_coverage": False,
        "build_doc": False,
        "build_tools": False,
    }

    requires = ("boost/[>=1.65.1], readline")

    exports_sources = [
        "src/*",
        "include/*",
        "cmake/*",
        "tests/*",
        "examples/*",
        "doc/*",
        "README.md",
        "LICENSE_1_0.txt",
        "vcpkg.json",
        "CMakeLists.txt",
    ]

    def set_version(self):
        content = tools.load(os.path.join(self.recipe_folder, "CMakeLists.txt"))

        version_major = (
            re.search(r"[^\)]+VERSION_MAJOR (\d+)[^\)]*\)", content).group(1).strip()
        )
        version_minor = (
            re.search(r"[^\)]+VERSION_MINOR (\d+)[^\)]*\)", content).group(1).strip()
        )
        version_patch = (
            re.search(r"[^\)]+VERSION_PATCH (\d+)[^\)]*\)", content).group(1).strip()
        )

        self.version = "{}.{}.{}".format(version_major, version_minor, version_patch)

    # TODO: Some files like conaninfo.txt, conan.lock
    # should be generated inside the build folder to avoid polluting sources.

    # Defines the build directory among other things.
    def layout(self):
        cmake_layout(self)
        # Override the paths set by cmake_layout and add the architecture to the build folder
        if self.settings.get_safe("arch"):
            self.folders.build = "build/{}-{}-{}-conan-build".format(
                self.settings.os, self.settings.build_type, self.settings.arch
            )
            self.folders.generators = os.path.join(self.folders.build, "conan")

    def generate(self):
        deps = CMakeDeps(self)
        deps.generate()

        toolchain = CMakeToolchain(self)
        toolchain.variables["CONAN_BUILD"] = True
        toolchain.variables[
            "BUILD_TOOLS"
        ] = False  # Cross building ncurses to arm is (currently) not supported
        toolchain.variables["BUILD_TESTS"] = (
            self.options.build_tests == True or self.options.code_coverage == True
        )
        toolchain.variables["BUILD_DOC"] = self.options.build_doc == True
        toolchain.variables["WITH_COVERAGE"] = self.options.code_coverage == True

        # Override BASE_INSTALL_DIR. It is used by CPack.
        toolchain.variables["BASE_INSTALL_DIR"] = self.package_folder

        toolchain.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

        # These target are not supported when cross building to arm.
        # if not tools.cross_building(self):
        #     if self.options.build_doc == "True":
        #         cmake.build(target="doc")
        #     if self.options.code_coverage == "True":
        #         cmake.parallel = False
        #         cmake.build(target="coverage")  # Run tests + coverage

    def package(self):
        cmake = CMake(self)
        cmake.install()


    def package_info(self):
        # These are default values and doesn't need to be adjusted
        self.cpp_info.includedirs = ["include"]
        self.cpp_info.libdirs = ["lib"]
        self.cpp_info.bindirs = ["bin"]
        self.cpp_info.requires = [
            "Boost::spirit",
            "Boost::fusion",
        ]
        self.cpp_info.libs = [
            "matheval",
        ]
