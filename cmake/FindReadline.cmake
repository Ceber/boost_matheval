include(FindPackageHandleStandardArgs)

find_path(READLINE_INCLUDE_DIR NAMES readline/readline.h)

find_library(READLINE_LIBRARY NAMES readline)

find_package_handle_standard_args(Readline DEFAULT_MSG READLINE_LIBRARY READLINE_INCLUDE_DIR)

mark_as_advanced(READLINE_INCLUDE_DIR READLINE_LIBRARY)
