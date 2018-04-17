#
# cppan
#

################################################################################
#
# header
#
################################################################################

include(C:/cppan/storage/etc/static/header.cmake)

#
# cppan
# helper routines
#

################################################################################
#
# cmake setup
#
################################################################################

# Use solution folders.
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

################################################################################
#
# variables
#
################################################################################

if (NOT CPPAN_COMMAND)
    find_program(CPPAN_COMMAND cppan)
    if ("${CPPAN_COMMAND}" STREQUAL "CPPAN_COMMAND-NOTFOUND")
        message(WARNING "'cppan' program was not found. Please, add it to PATH environment variable")
        set_cache_var(CPPAN_COMMAND 0)
    endif()
endif()
set_cache_var(CPPAN_COMMAND ${CPPAN_COMMAND} CACHE STRING "CPPAN program." FORCE)


set_cache_var(XCODE 0)
if (CMAKE_GENERATOR STREQUAL Xcode)
    set_cache_var(XCODE 1)
endif()

set_cache_var(NINJA 0)
if (CMAKE_GENERATOR STREQUAL Ninja)
    set_cache_var(NINJA 1)
endif()

find_program(ninja ninja)
if (NOT "${ninja}" STREQUAL "ninja-NOTFOUND")
    set_cache_var(NINJA_FOUND 1)
elseif()
    find_program(ninja ninja-build)
    if (NOT "${ninja}" STREQUAL "ninja-NOTFOUND")
        set_cache_var(NINJA_FOUND 1)
    endif()
endif()

set_cache_var(VISUAL_STUDIO 0)
if (MSVC AND NOT NINJA)
    set_cache_var(VISUAL_STUDIO 1)
endif()

set_cache_var(CLANG 0)
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" OR "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
    set_cache_var(CLANG 1)
endif()
if (CMAKE_VS_PLATFORM_TOOLSET MATCHES "(v[0-9]+_clang_.*|LLVM-vs[0-9]+.*)")
    set_cache_var(CLANG 1)
endif()

if (VISUAL_STUDIO AND CLANG AND NOT NINJA_FOUND)
    message(STATUS "Warning: Build with MSVC and Clang without ninja will be single threaded - very very slow.")
endif()

if (VISUAL_STUDIO AND CLANG AND NINJA_FOUND AND NOT NINJA)
    set_cache_var(VISUAL_STUDIO_ACCELERATE_CLANG 1)
    #if ("${CMAKE_LINKER}" STREQUAL "CMAKE_LINKER-NOTFOUND")
    #    message(FATAL_ERROR "CMAKE_LINKER must be set in order to accelerate clang build with MSVC!")
    #endif()
endif()

get_configuration(config)
get_configuration_with_generator(config_dir)
get_configuration_unhashed(config_name)
get_configuration_with_generator_unhashed(config_gen_name)
get_number_of_cores(N_CORES)

file_write_once(${PROJECT_BINARY_DIR}/config.cmake "${config_gen_name}")

set_cache_var(CMAKE_C_USE_RESPONSE_FILE_FOR_INCLUDES    1)
set_cache_var(CMAKE_C_USE_RESPONSE_FILE_FOR_OBJECTS     1)
set_cache_var(CMAKE_C_USE_RESPONSE_FILE_FOR_LIBRARIES   1)
set_cache_var(CMAKE_CXX_USE_RESPONSE_FILE_FOR_INCLUDES  1)
set_cache_var(CMAKE_CXX_USE_RESPONSE_FILE_FOR_OBJECTS   1)
set_cache_var(CMAKE_CXX_USE_RESPONSE_FILE_FOR_LIBRARIES 1)
set_cache_var(CMAKE_CXX_RESPONSE_FILE_LINK_FLAG "@")

################################################################################
#
# cmake includes
#
################################################################################


include(CheckCXXSymbolExists)
include(CheckFunctionExists)
include(CheckIncludeFiles)
include(CheckIncludeFile)
include(CheckIncludeFileCXX)
include(CheckLibraryExists)
include(CheckTypeSize)
include(CheckCSourceCompiles)
include(CheckCSourceRuns)
include(CheckCXXSourceCompiles)
include(CheckCXXSourceRuns)
include(CheckStructHasMember)
include(GenerateExportHeader)
include(TestBigEndian)


################################################################################
#
# common checks
#
################################################################################

if (NOT CPPAN_DISABLE_CHECKS)
    set(vars_dir "C:/cppan/storage/cfg")
    set(vars_file "${vars_dir}/${config}.cmake")
    set(vars_file_helper "${vars_dir}//${config}.${config_dir}.cmake")
    if (NOT CPPAN_READ_CHECK_VARS_FILE_ONCE)
        set_once_var(CPPAN_READ_CHECK_VARS_FILE_ONCE)
        read_check_variables_file(${vars_file})
    endif()

    if (NOT DEFINED WORDS_BIGENDIAN)
        test_big_endian(WORDS_BIGENDIAN)
        add_check_variable(WORDS_BIGENDIAN)
    endif()
    set_cache_var(BIG_ENDIAN ${WORDS_BIGENDIAN})
    set_cache_var(BIGENDIAN ${WORDS_BIGENDIAN})
    set_cache_var(HOST_BIG_ENDIAN ${WORDS_BIGENDIAN})

    ################################################################################
    #
    # parallel checks
    #
    ################################################################################

    if (NOT CYGWIN)
        set(tmp_dir "C:/Users/student/AppData/Local/Temp/cppan/vars")
        string(RANDOM LENGTH 8 vars_dir)
        set(tmp_dir "${tmp_dir}/${vars_dir}")

        set(checks_file "E:/Students/PKS-216/L55/CMakeProject1/build/.cppan/cmake/.cppan/checks.yml")

        execute_process(COMMAND ${CMAKE_COMMAND} -E copy_directory ${PROJECT_BINARY_DIR}/CMakeFiles ${tmp_dir}/CMakeFiles/ RESULT_VARIABLE ret)
        if (CPPAN_COMMAND)
            execute_process(COMMAND ${CPPAN_COMMAND}
                            internal-parallel-vars-check
                                \"${CMAKE_COMMAND}\"
                                \"${tmp_dir}\"
                                \"${vars_file}\"
                                \"${checks_file}\"
                                \"${CMAKE_GENERATOR}\"
                                \"${CMAKE_SYSTEM_VERSION}\"
                                \"${CMAKE_GENERATOR_TOOLSET}\"
                                \"${CMAKE_TOOLCHAIN_FILE}\"
                             RESULT_VARIABLE ret)
            check_result_variable(${ret} "COMMAND ${CPPAN_COMMAND}
                            internal-parallel-vars-check
                                \"${CMAKE_COMMAND}\"
                                \"${tmp_dir}\"
                                \"${vars_file}\"
                                \"${checks_file}\"
                                \"${CMAKE_GENERATOR}\"
                                \"${CMAKE_SYSTEM_VERSION}\"
                                \"${CMAKE_GENERATOR_TOOLSET}\"
                                \"${CMAKE_TOOLCHAIN_FILE}\"
                            ")
        endif()
        read_check_variables_file(${tmp_dir}/vars.txt)
        set(CPPAN_NEW_VARIABLE_ADDED 1)

        file(REMOVE_RECURSE ${tmp_dir})
    endif()

    ################################################################################
    #
    # checks
    #
    ################################################################################

    if (NOT DEFINED HAVE_ALIGNED_ALLOC)
        check_function_exists(aligned_alloc HAVE_ALIGNED_ALLOC)
        add_check_variable(HAVE_ALIGNED_ALLOC)
    endif()

    if (NOT DEFINED HAVE_CC_SHA256_INIT)
        check_function_exists(CC_SHA256_Init HAVE_CC_SHA256_INIT)
        add_check_variable(HAVE_CC_SHA256_INIT)
    endif()

    if (NOT DEFINED HAVE_CLOCK_GETTIME)
        check_function_exists(clock_gettime HAVE_CLOCK_GETTIME)
        add_check_variable(HAVE_CLOCK_GETTIME)
    endif()

    if (NOT DEFINED HAVE_FLOOR)
        check_function_exists(floor HAVE_FLOOR)
        add_check_variable(HAVE_FLOOR)
    endif()

    if (NOT DEFINED HAVE_FORK)
        check_function_exists(fork HAVE_FORK)
        add_check_variable(HAVE_FORK)
    endif()

    if (NOT DEFINED HAVE_FSEEKO)
        check_function_exists(fseeko HAVE_FSEEKO)
        add_check_variable(HAVE_FSEEKO)
    endif()

    if (NOT DEFINED HAVE_FUTIMENS)
        check_function_exists(futimens HAVE_FUTIMENS)
        add_check_variable(HAVE_FUTIMENS)
    endif()

    if (NOT DEFINED HAVE_FUTIMES)
        check_function_exists(futimes HAVE_FUTIMES)
        add_check_variable(HAVE_FUTIMES)
    endif()

    if (NOT DEFINED HAVE_FUTIMESAT)
        check_function_exists(futimesat HAVE_FUTIMESAT)
        add_check_variable(HAVE_FUTIMESAT)
    endif()

    if (NOT DEFINED HAVE_GETOPT)
        check_function_exists(getopt HAVE_GETOPT)
        add_check_variable(HAVE_GETOPT)
    endif()

    if (NOT DEFINED HAVE_ISASCII)
        check_function_exists(isascii HAVE_ISASCII)
        add_check_variable(HAVE_ISASCII)
    endif()

    if (NOT DEFINED HAVE_LFIND)
        check_function_exists(lfind HAVE_LFIND)
        add_check_variable(HAVE_LFIND)
    endif()

    if (NOT DEFINED HAVE_MEMALIGN)
        check_function_exists(memalign HAVE_MEMALIGN)
        add_check_variable(HAVE_MEMALIGN)
    endif()

    if (NOT DEFINED HAVE_MEMCMP)
        check_function_exists(memcmp HAVE_MEMCMP)
        add_check_variable(HAVE_MEMCMP)
    endif()

    if (NOT DEFINED HAVE_MEMMOVE)
        check_function_exists(memmove HAVE_MEMMOVE)
        add_check_variable(HAVE_MEMMOVE)
    endif()

    if (NOT DEFINED HAVE_MEMSET)
        check_function_exists(memset HAVE_MEMSET)
        add_check_variable(HAVE_MEMSET)
    endif()

    if (NOT DEFINED HAVE_MMAP)
        check_function_exists(mmap HAVE_MMAP)
        add_check_variable(HAVE_MMAP)
    endif()

    if (NOT DEFINED HAVE_OPEN)
        check_function_exists(open HAVE_OPEN)
        add_check_variable(HAVE_OPEN)
    endif()

    if (NOT DEFINED HAVE_POSIX_FADVISE)
        check_function_exists(posix_fadvise HAVE_POSIX_FADVISE)
        add_check_variable(HAVE_POSIX_FADVISE)
    endif()

    if (NOT DEFINED HAVE_POSIX_MEMALIGN)
        check_function_exists(posix_memalign HAVE_POSIX_MEMALIGN)
        add_check_variable(HAVE_POSIX_MEMALIGN)
    endif()

    if (NOT DEFINED HAVE_POW)
        check_function_exists(pow HAVE_POW)
        add_check_variable(HAVE_POW)
    endif()

    if (NOT DEFINED HAVE_PTHREAD_CONDATTR_SETCLOCK)
        check_function_exists(pthread_condattr_setclock HAVE_PTHREAD_CONDATTR_SETCLOCK)
        add_check_variable(HAVE_PTHREAD_CONDATTR_SETCLOCK)
    endif()

    if (NOT DEFINED HAVE_REALLOC)
        check_function_exists(realloc HAVE_REALLOC)
        add_check_variable(HAVE_REALLOC)
    endif()

    if (NOT DEFINED HAVE_SELECT)
        check_function_exists(select HAVE_SELECT)
        add_check_variable(HAVE_SELECT)
    endif()

    if (NOT DEFINED HAVE_SETLOCALE)
        check_function_exists(setlocale HAVE_SETLOCALE)
        add_check_variable(HAVE_SETLOCALE)
    endif()

    if (NOT DEFINED HAVE_SETMODE)
        check_function_exists(setmode HAVE_SETMODE)
        add_check_variable(HAVE_SETMODE)
    endif()

    if (NOT DEFINED HAVE_SHA256INIT)
        check_function_exists(SHA256Init HAVE_SHA256INIT)
        add_check_variable(HAVE_SHA256INIT)
    endif()

    if (NOT DEFINED HAVE_SHA256_INIT)
        check_function_exists(SHA256_Init HAVE_SHA256_INIT)
        add_check_variable(HAVE_SHA256_INIT)
    endif()

    if (NOT DEFINED HAVE_SQRT)
        check_function_exists(sqrt HAVE_SQRT)
        add_check_variable(HAVE_SQRT)
    endif()

    if (NOT DEFINED HAVE_STRCASECMP)
        check_function_exists(strcasecmp HAVE_STRCASECMP)
        add_check_variable(HAVE_STRCASECMP)
    endif()

    if (NOT DEFINED HAVE_STRCHR)
        check_function_exists(strchr HAVE_STRCHR)
        add_check_variable(HAVE_STRCHR)
    endif()

    if (NOT DEFINED HAVE_STRDUP)
        check_function_exists(strdup HAVE_STRDUP)
        add_check_variable(HAVE_STRDUP)
    endif()

    if (NOT DEFINED HAVE_STRERROR)
        check_function_exists(strerror HAVE_STRERROR)
        add_check_variable(HAVE_STRERROR)
    endif()

    if (NOT DEFINED HAVE_STRNCASECMP)
        check_function_exists(strncasecmp HAVE_STRNCASECMP)
        add_check_variable(HAVE_STRNCASECMP)
    endif()

    if (NOT DEFINED HAVE_STRPTIME)
        check_function_exists(strptime HAVE_STRPTIME)
        add_check_variable(HAVE_STRPTIME)
    endif()

    if (NOT DEFINED HAVE_STRRCHR)
        check_function_exists(strrchr HAVE_STRRCHR)
        add_check_variable(HAVE_STRRCHR)
    endif()

    if (NOT DEFINED HAVE_STRSIGNAL)
        check_function_exists(strsignal HAVE_STRSIGNAL)
        add_check_variable(HAVE_STRSIGNAL)
    endif()

    if (NOT DEFINED HAVE_STRSTR)
        check_function_exists(strstr HAVE_STRSTR)
        add_check_variable(HAVE_STRSTR)
    endif()

    if (NOT DEFINED HAVE_STRTOL)
        check_function_exists(strtol HAVE_STRTOL)
        add_check_variable(HAVE_STRTOL)
    endif()

    if (NOT DEFINED HAVE_STRTOULL)
        check_function_exists(strtoull HAVE_STRTOULL)
        add_check_variable(HAVE_STRTOULL)
    endif()

    if (NOT DEFINED HAVE_USELOCALE)
        check_function_exists(uselocale HAVE_USELOCALE)
        add_check_variable(HAVE_USELOCALE)
    endif()

    if (NOT DEFINED HAVE_UTIME)
        check_function_exists(utime HAVE_UTIME)
        add_check_variable(HAVE_UTIME)
    endif()

    if (NOT DEFINED HAVE_UTIMES)
        check_function_exists(utimes HAVE_UTIMES)
        add_check_variable(HAVE_UTIMES)
    endif()

    if (NOT DEFINED HAVE_VASPRINTF)
        check_function_exists(vasprintf HAVE_VASPRINTF)
        add_check_variable(HAVE_VASPRINTF)
    endif()

    if (NOT DEFINED HAVE_VFORK)
        check_function_exists(vfork HAVE_VFORK)
        add_check_variable(HAVE_VFORK)
    endif()

    if (NOT DEFINED HAVE_VPRINTF)
        check_function_exists(vprintf HAVE_VPRINTF)
        add_check_variable(HAVE_VPRINTF)
    endif()

    if (NOT DEFINED HAVE_VSNPRINTF)
        check_function_exists(vsnprintf HAVE_VSNPRINTF)
        add_check_variable(HAVE_VSNPRINTF)
    endif()

    if (NOT DEFINED HAVE_VSYSLOG)
        check_function_exists(vsyslog HAVE_VSYSLOG)
        add_check_variable(HAVE_VSYSLOG)
    endif()

    if (NOT DEFINED HAVE__ALIGNED_MALLOC)
        check_function_exists(_aligned_malloc HAVE__ALIGNED_MALLOC)
        add_check_variable(HAVE__ALIGNED_MALLOC)
    endif()

    if (NOT DEFINED HAVE__SNPRINTF)
        check_function_exists(_snprintf HAVE__SNPRINTF)
        add_check_variable(HAVE__SNPRINTF)
    endif()

    if (NOT DEFINED HAVE__STRICMP)
        check_function_exists(_stricmp HAVE__STRICMP)
        add_check_variable(HAVE__STRICMP)
    endif()

    if (NOT DEFINED HAVE__STRNICMP)
        check_function_exists(_strnicmp HAVE__STRNICMP)
        add_check_variable(HAVE__STRNICMP)
    endif()

    if (NOT DEFINED HAVE_ASSERT_H)
        check_include_files("assert.h" HAVE_ASSERT_H)
        add_check_variable(HAVE_ASSERT_H)
    endif()

    if (NOT DEFINED HAVE_BYTESWAP_H)
        check_include_files("byteswap.h" HAVE_BYTESWAP_H)
        add_check_variable(HAVE_BYTESWAP_H)
    endif()

    if (NOT DEFINED HAVE_COMMONCRYPTO_COMMONDIGEST_H)
        check_include_files("CommonCrypto/CommonDigest.h" HAVE_COMMONCRYPTO_COMMONDIGEST_H)
        add_check_variable(HAVE_COMMONCRYPTO_COMMONDIGEST_H)
    endif()

    if (NOT DEFINED HAVE_DLFCN_H)
        check_include_files("dlfcn.h" HAVE_DLFCN_H)
        add_check_variable(HAVE_DLFCN_H)
    endif()

    if (NOT DEFINED HAVE_ENDIAN_H)
        check_include_files("endian.h" HAVE_ENDIAN_H)
        add_check_variable(HAVE_ENDIAN_H)
    endif()

    if (NOT DEFINED HAVE_FCNTL_H)
        check_include_files("fcntl.h" HAVE_FCNTL_H)
        add_check_variable(HAVE_FCNTL_H)
    endif()

    if (NOT DEFINED HAVE_IMMINTRIN_H)
        check_include_files("immintrin.h" HAVE_IMMINTRIN_H)
        add_check_variable(HAVE_IMMINTRIN_H)
    endif()

    if (NOT DEFINED HAVE_INTTYPES_H)
        check_include_files("inttypes.h" HAVE_INTTYPES_H)
        add_check_variable(HAVE_INTTYPES_H)
    endif()

    if (NOT DEFINED HAVE_IO_H)
        check_include_files("io.h" HAVE_IO_H)
        add_check_variable(HAVE_IO_H)
    endif()

    if (NOT DEFINED HAVE_LANGINFO_H)
        check_include_files("langinfo.h" HAVE_LANGINFO_H)
        add_check_variable(HAVE_LANGINFO_H)
    endif()

    if (NOT DEFINED HAVE_LIMITS_H)
        check_include_files("limits.h" HAVE_LIMITS_H)
        add_check_variable(HAVE_LIMITS_H)
    endif()

    if (NOT DEFINED HAVE_LOCALE_H)
        check_include_files("locale.h" HAVE_LOCALE_H)
        add_check_variable(HAVE_LOCALE_H)
    endif()

    if (NOT DEFINED HAVE_MALLOC_H)
        check_include_files("malloc.h" HAVE_MALLOC_H)
        add_check_variable(HAVE_MALLOC_H)
    endif()

    if (NOT DEFINED HAVE_MEMORY_H)
        check_include_files("memory.h" HAVE_MEMORY_H)
        add_check_variable(HAVE_MEMORY_H)
    endif()

    if (NOT DEFINED HAVE_MINIX_SHA2_H)
        check_include_files("minix/sha2.h" HAVE_MINIX_SHA2_H)
        add_check_variable(HAVE_MINIX_SHA2_H)
    endif()

    if (NOT DEFINED HAVE_RPC_H)
        check_include_files("rpc.h" HAVE_RPC_H)
        add_check_variable(HAVE_RPC_H)
    endif()

    if (NOT DEFINED HAVE_SEARCH_H)
        check_include_files("search.h" HAVE_SEARCH_H)
        add_check_variable(HAVE_SEARCH_H)
    endif()

    if (NOT DEFINED HAVE_SHA256_H)
        check_include_files("sha256.h" HAVE_SHA256_H)
        add_check_variable(HAVE_SHA256_H)
    endif()

    if (NOT DEFINED HAVE_SHA2_H)
        check_include_files("sha2.h" HAVE_SHA2_H)
        add_check_variable(HAVE_SHA2_H)
    endif()

    if (NOT DEFINED HAVE_STDARG_H)
        check_include_files("stdarg.h" HAVE_STDARG_H)
        add_check_variable(HAVE_STDARG_H)
    endif()

    if (NOT DEFINED HAVE_STDBOOL_H)
        check_include_files("stdbool.h" HAVE_STDBOOL_H)
        add_check_variable(HAVE_STDBOOL_H)
    endif()

    if (NOT DEFINED HAVE_STDDEF_H)
        check_include_files("stddef.h" HAVE_STDDEF_H)
        add_check_variable(HAVE_STDDEF_H)
    endif()

    if (NOT DEFINED HAVE_STDINT_H)
        check_include_files("stdint.h" HAVE_STDINT_H)
        add_check_variable(HAVE_STDINT_H)
    endif()

    if (NOT DEFINED HAVE_STDLIB_H)
        check_include_files("stdlib.h" HAVE_STDLIB_H)
        add_check_variable(HAVE_STDLIB_H)
    endif()

    if (NOT DEFINED HAVE_STRINGS_H)
        check_include_files("strings.h" HAVE_STRINGS_H)
        add_check_variable(HAVE_STRINGS_H)
    endif()

    if (NOT DEFINED HAVE_STRING_H)
        check_include_files("string.h" HAVE_STRING_H)
        add_check_variable(HAVE_STRING_H)
    endif()

    if (NOT DEFINED HAVE_SYSLOG_H)
        check_include_files("syslog.h" HAVE_SYSLOG_H)
        add_check_variable(HAVE_SYSLOG_H)
    endif()

    if (NOT DEFINED HAVE_SYS_CDEFS_H)
        check_include_files("sys/cdefs.h" HAVE_SYS_CDEFS_H)
        add_check_variable(HAVE_SYS_CDEFS_H)
    endif()

    if (NOT DEFINED HAVE_SYS_STAT_H)
        check_include_files("sys/stat.h" HAVE_SYS_STAT_H)
        add_check_variable(HAVE_SYS_STAT_H)
    endif()

    if (NOT DEFINED HAVE_SYS_TIME_H)
        check_include_files("sys/time.h" HAVE_SYS_TIME_H)
        add_check_variable(HAVE_SYS_TIME_H)
    endif()

    if (NOT DEFINED HAVE_SYS_TYPES_H)
        check_include_files("sys/types.h" HAVE_SYS_TYPES_H)
        add_check_variable(HAVE_SYS_TYPES_H)
    endif()

    if (NOT DEFINED HAVE_SYS_WAIT_H)
        check_include_files("sys/wait.h" HAVE_SYS_WAIT_H)
        add_check_variable(HAVE_SYS_WAIT_H)
    endif()

    if (NOT DEFINED HAVE_UNISTD_H)
        check_include_files("unistd.h" HAVE_UNISTD_H)
        add_check_variable(HAVE_UNISTD_H)
    endif()

    if (NOT DEFINED HAVE_VFORK_H)
        check_include_files("vfork.h" HAVE_VFORK_H)
        add_check_variable(HAVE_VFORK_H)
    endif()

    if (NOT DEFINED HAVE_WINSOCK_H)
        check_include_files("winsock.h" HAVE_WINSOCK_H)
        add_check_variable(HAVE_WINSOCK_H)
    endif()

    if (NOT DEFINED HAVE_XLOCALE_H)
        check_include_files("xlocale.h" HAVE_XLOCALE_H)
        add_check_variable(HAVE_XLOCALE_H)
    endif()

    if (NOT DEFINED JSON_C_HAVE_INTTYPES_H)
        check_include_files("inttypes.h" JSON_C_HAVE_INTTYPES_H)
        add_check_variable(JSON_C_HAVE_INTTYPES_H)
    endif()

    if (NOT DEFINED HAVE_CC_SHA256_CTX)
        check_type_size("CC_SHA256_CTX" HAVE_CC_SHA256_CTX)
        add_check_variable(HAVE_CC_SHA256_CTX)
    endif()

    if (HAVE_CC_SHA256_CTX)
        set(SIZE_OF_CC_SHA256_CTX ${HAVE_CC_SHA256_CTX} CACHE STRING "")
        set(SIZEOF_CC_SHA256_CTX ${HAVE_CC_SHA256_CTX} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_INT)
        check_type_size("int" HAVE_INT)
        add_check_variable(HAVE_INT)
    endif()

    if (HAVE_INT)
        set(SIZE_OF_INT ${HAVE_INT} CACHE STRING "")
        set(SIZEOF_INT ${HAVE_INT} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_INT16)
        check_type_size("int16" HAVE_INT16)
        add_check_variable(HAVE_INT16)
    endif()

    if (HAVE_INT16)
        set(SIZE_OF_INT16 ${HAVE_INT16} CACHE STRING "")
        set(SIZEOF_INT16 ${HAVE_INT16} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_INT32)
        check_type_size("int32" HAVE_INT32)
        add_check_variable(HAVE_INT32)
    endif()

    if (HAVE_INT32)
        set(SIZE_OF_INT32 ${HAVE_INT32} CACHE STRING "")
        set(SIZEOF_INT32 ${HAVE_INT32} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_INT32_T)
        check_type_size("int32_t" HAVE_INT32_T)
        add_check_variable(HAVE_INT32_T)
    endif()

    if (HAVE_INT32_T)
        set(SIZE_OF_INT32_T ${HAVE_INT32_T} CACHE STRING "")
        set(SIZEOF_INT32_T ${HAVE_INT32_T} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_INT64_T)
        check_type_size("int64_t" HAVE_INT64_T)
        add_check_variable(HAVE_INT64_T)
    endif()

    if (HAVE_INT64_T)
        set(SIZE_OF_INT64_T ${HAVE_INT64_T} CACHE STRING "")
        set(SIZEOF_INT64_T ${HAVE_INT64_T} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_INT8)
        check_type_size("int8" HAVE_INT8)
        add_check_variable(HAVE_INT8)
    endif()

    if (HAVE_INT8)
        set(SIZE_OF_INT8 ${HAVE_INT8} CACHE STRING "")
        set(SIZEOF_INT8 ${HAVE_INT8} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_LONG)
        check_type_size("long" HAVE_LONG)
        add_check_variable(HAVE_LONG)
    endif()

    if (HAVE_LONG)
        set(SIZE_OF_LONG ${HAVE_LONG} CACHE STRING "")
        set(SIZEOF_LONG ${HAVE_LONG} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_LONG_LONG)
        check_type_size("long long" HAVE_LONG_LONG)
        add_check_variable(HAVE_LONG_LONG)
    endif()

    if (HAVE_LONG_LONG)
        set(SIZE_OF_LONG_LONG ${HAVE_LONG_LONG} CACHE STRING "")
        set(SIZEOF_LONG_LONG ${HAVE_LONG_LONG} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_PTRDIFF_T)
        check_type_size("ptrdiff_t" HAVE_PTRDIFF_T)
        add_check_variable(HAVE_PTRDIFF_T)
    endif()

    if (HAVE_PTRDIFF_T)
        set(SIZE_OF_PTRDIFF_T ${HAVE_PTRDIFF_T} CACHE STRING "")
        set(SIZEOF_PTRDIFF_T ${HAVE_PTRDIFF_T} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_SHA256_CTX)
        check_type_size("SHA256_CTX" HAVE_SHA256_CTX)
        add_check_variable(HAVE_SHA256_CTX)
    endif()

    if (HAVE_SHA256_CTX)
        set(SIZE_OF_SHA256_CTX ${HAVE_SHA256_CTX} CACHE STRING "")
        set(SIZEOF_SHA256_CTX ${HAVE_SHA256_CTX} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_SHA2_CTX)
        check_type_size("SHA2_CTX" HAVE_SHA2_CTX)
        add_check_variable(HAVE_SHA2_CTX)
    endif()

    if (HAVE_SHA2_CTX)
        set(SIZE_OF_SHA2_CTX ${HAVE_SHA2_CTX} CACHE STRING "")
        set(SIZEOF_SHA2_CTX ${HAVE_SHA2_CTX} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_SIGNED_INT)
        check_type_size("signed int" HAVE_SIGNED_INT)
        add_check_variable(HAVE_SIGNED_INT)
    endif()

    if (HAVE_SIGNED_INT)
        set(SIZE_OF_SIGNED_INT ${HAVE_SIGNED_INT} CACHE STRING "")
        set(SIZEOF_SIGNED_INT ${HAVE_SIGNED_INT} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_SIGNED_LONG)
        check_type_size("signed long" HAVE_SIGNED_LONG)
        add_check_variable(HAVE_SIGNED_LONG)
    endif()

    if (HAVE_SIGNED_LONG)
        set(SIZE_OF_SIGNED_LONG ${HAVE_SIGNED_LONG} CACHE STRING "")
        set(SIZEOF_SIGNED_LONG ${HAVE_SIGNED_LONG} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_SIGNED_LONG_LONG)
        check_type_size("signed long long" HAVE_SIGNED_LONG_LONG)
        add_check_variable(HAVE_SIGNED_LONG_LONG)
    endif()

    if (HAVE_SIGNED_LONG_LONG)
        set(SIZE_OF_SIGNED_LONG_LONG ${HAVE_SIGNED_LONG_LONG} CACHE STRING "")
        set(SIZEOF_SIGNED_LONG_LONG ${HAVE_SIGNED_LONG_LONG} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_SIGNED_SHORT)
        check_type_size("signed short" HAVE_SIGNED_SHORT)
        add_check_variable(HAVE_SIGNED_SHORT)
    endif()

    if (HAVE_SIGNED_SHORT)
        set(SIZE_OF_SIGNED_SHORT ${HAVE_SIGNED_SHORT} CACHE STRING "")
        set(SIZEOF_SIGNED_SHORT ${HAVE_SIGNED_SHORT} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_SIZE_T)
        check_type_size("size_t" HAVE_SIZE_T)
        add_check_variable(HAVE_SIZE_T)
    endif()

    if (HAVE_SIZE_T)
        set(SIZE_OF_SIZE_T ${HAVE_SIZE_T} CACHE STRING "")
        set(SIZEOF_SIZE_T ${HAVE_SIZE_T} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_UINT16_T)
        check_type_size("uint16_t" HAVE_UINT16_T)
        add_check_variable(HAVE_UINT16_T)
    endif()

    if (HAVE_UINT16_T)
        set(SIZE_OF_UINT16_T ${HAVE_UINT16_T} CACHE STRING "")
        set(SIZEOF_UINT16_T ${HAVE_UINT16_T} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_UINT32_T)
        check_type_size("uint32_t" HAVE_UINT32_T)
        add_check_variable(HAVE_UINT32_T)
    endif()

    if (HAVE_UINT32_T)
        set(SIZE_OF_UINT32_T ${HAVE_UINT32_T} CACHE STRING "")
        set(SIZEOF_UINT32_T ${HAVE_UINT32_T} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_UINT64_T)
        check_type_size("uint64_t" HAVE_UINT64_T)
        add_check_variable(HAVE_UINT64_T)
    endif()

    if (HAVE_UINT64_T)
        set(SIZE_OF_UINT64_T ${HAVE_UINT64_T} CACHE STRING "")
        set(SIZEOF_UINT64_T ${HAVE_UINT64_T} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_UINT8_T)
        check_type_size("uint8_t" HAVE_UINT8_T)
        add_check_variable(HAVE_UINT8_T)
    endif()

    if (HAVE_UINT8_T)
        set(SIZE_OF_UINT8_T ${HAVE_UINT8_T} CACHE STRING "")
        set(SIZEOF_UINT8_T ${HAVE_UINT8_T} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_UINTPTR_T)
        check_type_size("uintptr_t" HAVE_UINTPTR_T)
        add_check_variable(HAVE_UINTPTR_T)
    endif()

    if (HAVE_UINTPTR_T)
        set(SIZE_OF_UINTPTR_T ${HAVE_UINTPTR_T} CACHE STRING "")
        set(SIZEOF_UINTPTR_T ${HAVE_UINTPTR_T} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_UNSIGNED_CHAR_P)
        check_type_size("unsigned char *" HAVE_UNSIGNED_CHAR_P)
        add_check_variable(HAVE_UNSIGNED_CHAR_P)
    endif()

    if (HAVE_UNSIGNED_CHAR_P)
        set(SIZE_OF_UNSIGNED_CHAR_P ${HAVE_UNSIGNED_CHAR_P} CACHE STRING "")
        set(SIZEOF_UNSIGNED_CHAR_P ${HAVE_UNSIGNED_CHAR_P} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_UNSIGNED_INT)
        check_type_size("unsigned int" HAVE_UNSIGNED_INT)
        add_check_variable(HAVE_UNSIGNED_INT)
    endif()

    if (HAVE_UNSIGNED_INT)
        set(SIZE_OF_UNSIGNED_INT ${HAVE_UNSIGNED_INT} CACHE STRING "")
        set(SIZEOF_UNSIGNED_INT ${HAVE_UNSIGNED_INT} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_UNSIGNED_LONG)
        check_type_size("unsigned long" HAVE_UNSIGNED_LONG)
        add_check_variable(HAVE_UNSIGNED_LONG)
    endif()

    if (HAVE_UNSIGNED_LONG)
        set(SIZE_OF_UNSIGNED_LONG ${HAVE_UNSIGNED_LONG} CACHE STRING "")
        set(SIZEOF_UNSIGNED_LONG ${HAVE_UNSIGNED_LONG} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_UNSIGNED_LONG_LONG)
        check_type_size("unsigned long long" HAVE_UNSIGNED_LONG_LONG)
        add_check_variable(HAVE_UNSIGNED_LONG_LONG)
    endif()

    if (HAVE_UNSIGNED_LONG_LONG)
        set(SIZE_OF_UNSIGNED_LONG_LONG ${HAVE_UNSIGNED_LONG_LONG} CACHE STRING "")
        set(SIZEOF_UNSIGNED_LONG_LONG ${HAVE_UNSIGNED_LONG_LONG} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_UNSIGNED_SHORT)
        check_type_size("unsigned short" HAVE_UNSIGNED_SHORT)
        add_check_variable(HAVE_UNSIGNED_SHORT)
    endif()

    if (HAVE_UNSIGNED_SHORT)
        set(SIZE_OF_UNSIGNED_SHORT ${HAVE_UNSIGNED_SHORT} CACHE STRING "")
        set(SIZEOF_UNSIGNED_SHORT ${HAVE_UNSIGNED_SHORT} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_VOID_P)
        check_type_size("void *" HAVE_VOID_P)
        add_check_variable(HAVE_VOID_P)
    endif()

    if (HAVE_VOID_P)
        set(SIZE_OF_VOID_P ${HAVE_VOID_P} CACHE STRING "")
        set(SIZEOF_VOID_P ${HAVE_VOID_P} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE__BOOL)
        check_type_size("_Bool" HAVE__BOOL)
        add_check_variable(HAVE__BOOL)
    endif()

    if (HAVE__BOOL)
        set(SIZE_OF__BOOL ${HAVE__BOOL} CACHE STRING "")
        set(SIZEOF__BOOL ${HAVE__BOOL} CACHE STRING "")
    endif()

    if (NOT DEFINED HAVE_MEMMOVE)
        check_symbol_exists("memmove" "string.h;" HAVE_MEMMOVE)
        add_check_variable(HAVE_MEMMOVE)
    endif()

    if (HAVE_MEMMOVE)
        set(HAVE_STRING_H 1 CACHE STRING "")
        add_check_variable(HAVE_STRING_H)
    endif()

    if (NOT DEFINED HAVE_SNPRINTF)
        check_symbol_exists("snprintf" "stdio.h;" HAVE_SNPRINTF)
        add_check_variable(HAVE_SNPRINTF)
    endif()

    if (HAVE_SNPRINTF)
        set(HAVE_STDIO_H 1 CACHE STRING "")
        add_check_variable(HAVE_STDIO_H)
    endif()

    if (NOT DEFINED STDC_HEADERS)
        check_c_source_compiles("
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <float.h>
int main() {return 0;}
" STDC_HEADERS)
        add_check_variable(STDC_HEADERS)
    endif()

    if (NOT DEFINED HAVE_DECL_CLOCK_MONOTONIC)
        set(CMAKE_REQUIRED_DEFINITIONS)
        if (HAVE_SYS_TYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_TYPES_H=${HAVE_SYS_TYPES_H})
        endif()
        if (HAVE_SYS_STAT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_STAT_H=${HAVE_SYS_STAT_H})
        endif()
        if (STDC_HEADERS)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DSTDC_HEADERS=${STDC_HEADERS})
        endif()
        if (HAVE_STDLIB_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDLIB_H=${HAVE_STDLIB_H})
        endif()
        if (HAVE_STRING_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRING_H=${HAVE_STRING_H})
        endif()
        if (HAVE_MEMORY_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_MEMORY_H=${HAVE_MEMORY_H})
        endif()
        if (HAVE_STRINGS_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRINGS_H=${HAVE_STRINGS_H})
        endif()
        if (HAVE_INTTYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_INTTYPES_H=${HAVE_INTTYPES_H})
        endif()
        if (HAVE_STDINT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDINT_H=${HAVE_STDINT_H})
        endif()
        if (HAVE_UNISTD_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_UNISTD_H=${HAVE_UNISTD_H})
        endif()
        check_c_source_compiles("

#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
# include <sys/types.h>
#endif
#ifdef HAVE_SYS_STAT_H
# include <sys/stat.h>
#endif
#ifdef STDC_HEADERS
# include <stdlib.h>
# include <stddef.h>
#else
# ifdef HAVE_STDLIB_H
#  include <stdlib.h>
# endif
#endif
#ifdef HAVE_STRING_H
# if !defined STDC_HEADERS && defined HAVE_MEMORY_H
#  include <memory.h>
# endif
# include <string.h>
#endif
#ifdef HAVE_STRINGS_H
# include <strings.h>
#endif
#ifdef HAVE_INTTYPES_H
# include <inttypes.h>
#endif
#ifdef HAVE_STDINT_H
# include <stdint.h>
#endif
#ifdef HAVE_UNISTD_H
# include <unistd.h>
#endif



int main()
{
    (void)
CLOCK_MONOTONIC
    ;
    return 0;
}
" HAVE_DECL_CLOCK_MONOTONIC)
        set(CMAKE_REQUIRED_DEFINITIONS)
        add_check_variable(HAVE_DECL_CLOCK_MONOTONIC)
    endif()

    if (NOT DEFINED HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        if (HAVE_SYS_TYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_TYPES_H=${HAVE_SYS_TYPES_H})
        endif()
        if (HAVE_SYS_STAT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_STAT_H=${HAVE_SYS_STAT_H})
        endif()
        if (STDC_HEADERS)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DSTDC_HEADERS=${STDC_HEADERS})
        endif()
        if (HAVE_STDLIB_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDLIB_H=${HAVE_STDLIB_H})
        endif()
        if (HAVE_STRING_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRING_H=${HAVE_STRING_H})
        endif()
        if (HAVE_MEMORY_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_MEMORY_H=${HAVE_MEMORY_H})
        endif()
        if (HAVE_STRINGS_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRINGS_H=${HAVE_STRINGS_H})
        endif()
        if (HAVE_INTTYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_INTTYPES_H=${HAVE_INTTYPES_H})
        endif()
        if (HAVE_STDINT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDINT_H=${HAVE_STDINT_H})
        endif()
        if (HAVE_UNISTD_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_UNISTD_H=${HAVE_UNISTD_H})
        endif()
        if (HAVE_INFINITY)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_INFINITY=${HAVE_INFINITY})
        endif()
        check_c_source_compiles("

#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
# include <sys/types.h>
#endif
#ifdef HAVE_SYS_STAT_H
# include <sys/stat.h>
#endif
#ifdef STDC_HEADERS
# include <stdlib.h>
# include <stddef.h>
#else
# ifdef HAVE_STDLIB_H
#  include <stdlib.h>
# endif
#endif
#ifdef HAVE_STRING_H
# if !defined STDC_HEADERS && defined HAVE_MEMORY_H
#  include <memory.h>
# endif
# include <string.h>
#endif
#ifdef HAVE_STRINGS_H
# include <strings.h>
#endif
#ifdef HAVE_INTTYPES_H
# include <inttypes.h>
#endif
#ifdef HAVE_STDINT_H
# include <stdint.h>
#endif
#ifdef HAVE_UNISTD_H
# include <unistd.h>
#endif

#ifdef HAVE_INFINITY
# include <INFINITY>
#endif


int main()
{
    (void)
decl
    ;
    return 0;
}
" HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        add_check_variable(HAVE_DECL_DECL)
    endif()

    if (NOT DEFINED HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        if (HAVE_SYS_TYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_TYPES_H=${HAVE_SYS_TYPES_H})
        endif()
        if (HAVE_SYS_STAT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_STAT_H=${HAVE_SYS_STAT_H})
        endif()
        if (STDC_HEADERS)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DSTDC_HEADERS=${STDC_HEADERS})
        endif()
        if (HAVE_STDLIB_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDLIB_H=${HAVE_STDLIB_H})
        endif()
        if (HAVE_STRING_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRING_H=${HAVE_STRING_H})
        endif()
        if (HAVE_MEMORY_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_MEMORY_H=${HAVE_MEMORY_H})
        endif()
        if (HAVE_STRINGS_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRINGS_H=${HAVE_STRINGS_H})
        endif()
        if (HAVE_INTTYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_INTTYPES_H=${HAVE_INTTYPES_H})
        endif()
        if (HAVE_STDINT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDINT_H=${HAVE_STDINT_H})
        endif()
        if (HAVE_UNISTD_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_UNISTD_H=${HAVE_UNISTD_H})
        endif()
        if (HAVE__FINITE)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE__FINITE=${HAVE__FINITE})
        endif()
        check_c_source_compiles("

#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
# include <sys/types.h>
#endif
#ifdef HAVE_SYS_STAT_H
# include <sys/stat.h>
#endif
#ifdef STDC_HEADERS
# include <stdlib.h>
# include <stddef.h>
#else
# ifdef HAVE_STDLIB_H
#  include <stdlib.h>
# endif
#endif
#ifdef HAVE_STRING_H
# if !defined STDC_HEADERS && defined HAVE_MEMORY_H
#  include <memory.h>
# endif
# include <string.h>
#endif
#ifdef HAVE_STRINGS_H
# include <strings.h>
#endif
#ifdef HAVE_INTTYPES_H
# include <inttypes.h>
#endif
#ifdef HAVE_STDINT_H
# include <stdint.h>
#endif
#ifdef HAVE_UNISTD_H
# include <unistd.h>
#endif

#ifdef HAVE__FINITE
# include <_finite>
#endif


int main()
{
    (void)
decl
    ;
    return 0;
}
" HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        add_check_variable(HAVE_DECL_DECL)
    endif()

    if (NOT DEFINED HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        if (HAVE_SYS_TYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_TYPES_H=${HAVE_SYS_TYPES_H})
        endif()
        if (HAVE_SYS_STAT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_STAT_H=${HAVE_SYS_STAT_H})
        endif()
        if (STDC_HEADERS)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DSTDC_HEADERS=${STDC_HEADERS})
        endif()
        if (HAVE_STDLIB_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDLIB_H=${HAVE_STDLIB_H})
        endif()
        if (HAVE_STRING_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRING_H=${HAVE_STRING_H})
        endif()
        if (HAVE_MEMORY_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_MEMORY_H=${HAVE_MEMORY_H})
        endif()
        if (HAVE_STRINGS_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRINGS_H=${HAVE_STRINGS_H})
        endif()
        if (HAVE_INTTYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_INTTYPES_H=${HAVE_INTTYPES_H})
        endif()
        if (HAVE_STDINT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDINT_H=${HAVE_STDINT_H})
        endif()
        if (HAVE_UNISTD_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_UNISTD_H=${HAVE_UNISTD_H})
        endif()
        if (HAVE__ISNAN)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE__ISNAN=${HAVE__ISNAN})
        endif()
        check_c_source_compiles("

#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
# include <sys/types.h>
#endif
#ifdef HAVE_SYS_STAT_H
# include <sys/stat.h>
#endif
#ifdef STDC_HEADERS
# include <stdlib.h>
# include <stddef.h>
#else
# ifdef HAVE_STDLIB_H
#  include <stdlib.h>
# endif
#endif
#ifdef HAVE_STRING_H
# if !defined STDC_HEADERS && defined HAVE_MEMORY_H
#  include <memory.h>
# endif
# include <string.h>
#endif
#ifdef HAVE_STRINGS_H
# include <strings.h>
#endif
#ifdef HAVE_INTTYPES_H
# include <inttypes.h>
#endif
#ifdef HAVE_STDINT_H
# include <stdint.h>
#endif
#ifdef HAVE_UNISTD_H
# include <unistd.h>
#endif

#ifdef HAVE__ISNAN
# include <_isnan>
#endif


int main()
{
    (void)
decl
    ;
    return 0;
}
" HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        add_check_variable(HAVE_DECL_DECL)
    endif()

    if (NOT DEFINED HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        if (HAVE_SYS_TYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_TYPES_H=${HAVE_SYS_TYPES_H})
        endif()
        if (HAVE_SYS_STAT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_STAT_H=${HAVE_SYS_STAT_H})
        endif()
        if (STDC_HEADERS)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DSTDC_HEADERS=${STDC_HEADERS})
        endif()
        if (HAVE_STDLIB_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDLIB_H=${HAVE_STDLIB_H})
        endif()
        if (HAVE_STRING_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRING_H=${HAVE_STRING_H})
        endif()
        if (HAVE_MEMORY_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_MEMORY_H=${HAVE_MEMORY_H})
        endif()
        if (HAVE_STRINGS_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRINGS_H=${HAVE_STRINGS_H})
        endif()
        if (HAVE_INTTYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_INTTYPES_H=${HAVE_INTTYPES_H})
        endif()
        if (HAVE_STDINT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDINT_H=${HAVE_STDINT_H})
        endif()
        if (HAVE_UNISTD_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_UNISTD_H=${HAVE_UNISTD_H})
        endif()
        if (HAVE_ISINF)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_ISINF=${HAVE_ISINF})
        endif()
        check_c_source_compiles("

#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
# include <sys/types.h>
#endif
#ifdef HAVE_SYS_STAT_H
# include <sys/stat.h>
#endif
#ifdef STDC_HEADERS
# include <stdlib.h>
# include <stddef.h>
#else
# ifdef HAVE_STDLIB_H
#  include <stdlib.h>
# endif
#endif
#ifdef HAVE_STRING_H
# if !defined STDC_HEADERS && defined HAVE_MEMORY_H
#  include <memory.h>
# endif
# include <string.h>
#endif
#ifdef HAVE_STRINGS_H
# include <strings.h>
#endif
#ifdef HAVE_INTTYPES_H
# include <inttypes.h>
#endif
#ifdef HAVE_STDINT_H
# include <stdint.h>
#endif
#ifdef HAVE_UNISTD_H
# include <unistd.h>
#endif

#ifdef HAVE_ISINF
# include <isinf>
#endif


int main()
{
    (void)
decl
    ;
    return 0;
}
" HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        add_check_variable(HAVE_DECL_DECL)
    endif()

    if (NOT DEFINED HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        if (HAVE_SYS_TYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_TYPES_H=${HAVE_SYS_TYPES_H})
        endif()
        if (HAVE_SYS_STAT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_STAT_H=${HAVE_SYS_STAT_H})
        endif()
        if (STDC_HEADERS)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DSTDC_HEADERS=${STDC_HEADERS})
        endif()
        if (HAVE_STDLIB_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDLIB_H=${HAVE_STDLIB_H})
        endif()
        if (HAVE_STRING_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRING_H=${HAVE_STRING_H})
        endif()
        if (HAVE_MEMORY_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_MEMORY_H=${HAVE_MEMORY_H})
        endif()
        if (HAVE_STRINGS_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRINGS_H=${HAVE_STRINGS_H})
        endif()
        if (HAVE_INTTYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_INTTYPES_H=${HAVE_INTTYPES_H})
        endif()
        if (HAVE_STDINT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDINT_H=${HAVE_STDINT_H})
        endif()
        if (HAVE_UNISTD_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_UNISTD_H=${HAVE_UNISTD_H})
        endif()
        if (HAVE_ISNAN)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_ISNAN=${HAVE_ISNAN})
        endif()
        check_c_source_compiles("

#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
# include <sys/types.h>
#endif
#ifdef HAVE_SYS_STAT_H
# include <sys/stat.h>
#endif
#ifdef STDC_HEADERS
# include <stdlib.h>
# include <stddef.h>
#else
# ifdef HAVE_STDLIB_H
#  include <stdlib.h>
# endif
#endif
#ifdef HAVE_STRING_H
# if !defined STDC_HEADERS && defined HAVE_MEMORY_H
#  include <memory.h>
# endif
# include <string.h>
#endif
#ifdef HAVE_STRINGS_H
# include <strings.h>
#endif
#ifdef HAVE_INTTYPES_H
# include <inttypes.h>
#endif
#ifdef HAVE_STDINT_H
# include <stdint.h>
#endif
#ifdef HAVE_UNISTD_H
# include <unistd.h>
#endif

#ifdef HAVE_ISNAN
# include <isnan>
#endif


int main()
{
    (void)
decl
    ;
    return 0;
}
" HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        add_check_variable(HAVE_DECL_DECL)
    endif()

    if (NOT DEFINED HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        if (HAVE_SYS_TYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_TYPES_H=${HAVE_SYS_TYPES_H})
        endif()
        if (HAVE_SYS_STAT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_STAT_H=${HAVE_SYS_STAT_H})
        endif()
        if (STDC_HEADERS)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DSTDC_HEADERS=${STDC_HEADERS})
        endif()
        if (HAVE_STDLIB_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDLIB_H=${HAVE_STDLIB_H})
        endif()
        if (HAVE_STRING_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRING_H=${HAVE_STRING_H})
        endif()
        if (HAVE_MEMORY_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_MEMORY_H=${HAVE_MEMORY_H})
        endif()
        if (HAVE_STRINGS_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRINGS_H=${HAVE_STRINGS_H})
        endif()
        if (HAVE_INTTYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_INTTYPES_H=${HAVE_INTTYPES_H})
        endif()
        if (HAVE_STDINT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDINT_H=${HAVE_STDINT_H})
        endif()
        if (HAVE_UNISTD_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_UNISTD_H=${HAVE_UNISTD_H})
        endif()
        if (HAVE_NAN)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_NAN=${HAVE_NAN})
        endif()
        check_c_source_compiles("

#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
# include <sys/types.h>
#endif
#ifdef HAVE_SYS_STAT_H
# include <sys/stat.h>
#endif
#ifdef STDC_HEADERS
# include <stdlib.h>
# include <stddef.h>
#else
# ifdef HAVE_STDLIB_H
#  include <stdlib.h>
# endif
#endif
#ifdef HAVE_STRING_H
# if !defined STDC_HEADERS && defined HAVE_MEMORY_H
#  include <memory.h>
# endif
# include <string.h>
#endif
#ifdef HAVE_STRINGS_H
# include <strings.h>
#endif
#ifdef HAVE_INTTYPES_H
# include <inttypes.h>
#endif
#ifdef HAVE_STDINT_H
# include <stdint.h>
#endif
#ifdef HAVE_UNISTD_H
# include <unistd.h>
#endif

#ifdef HAVE_NAN
# include <nan>
#endif


int main()
{
    (void)
decl
    ;
    return 0;
}
" HAVE_DECL_DECL)
        set(CMAKE_REQUIRED_DEFINITIONS)
        add_check_variable(HAVE_DECL_DECL)
    endif()

    if (NOT DEFINED HAVE_DECL__MM_MOVEMASK_EPI8)
        set(CMAKE_REQUIRED_DEFINITIONS)
        if (HAVE_SYS_TYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_TYPES_H=${HAVE_SYS_TYPES_H})
        endif()
        if (HAVE_SYS_STAT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_SYS_STAT_H=${HAVE_SYS_STAT_H})
        endif()
        if (STDC_HEADERS)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DSTDC_HEADERS=${STDC_HEADERS})
        endif()
        if (HAVE_STDLIB_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDLIB_H=${HAVE_STDLIB_H})
        endif()
        if (HAVE_STRING_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRING_H=${HAVE_STRING_H})
        endif()
        if (HAVE_MEMORY_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_MEMORY_H=${HAVE_MEMORY_H})
        endif()
        if (HAVE_STRINGS_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STRINGS_H=${HAVE_STRINGS_H})
        endif()
        if (HAVE_INTTYPES_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_INTTYPES_H=${HAVE_INTTYPES_H})
        endif()
        if (HAVE_STDINT_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_STDINT_H=${HAVE_STDINT_H})
        endif()
        if (HAVE_UNISTD_H)
        set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DHAVE_UNISTD_H=${HAVE_UNISTD_H})
        endif()
        check_c_source_compiles("

#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
# include <sys/types.h>
#endif
#ifdef HAVE_SYS_STAT_H
# include <sys/stat.h>
#endif
#ifdef STDC_HEADERS
# include <stdlib.h>
# include <stddef.h>
#else
# ifdef HAVE_STDLIB_H
#  include <stdlib.h>
# endif
#endif
#ifdef HAVE_STRING_H
# if !defined STDC_HEADERS && defined HAVE_MEMORY_H
#  include <memory.h>
# endif
# include <string.h>
#endif
#ifdef HAVE_STRINGS_H
# include <strings.h>
#endif
#ifdef HAVE_INTTYPES_H
# include <inttypes.h>
#endif
#ifdef HAVE_STDINT_H
# include <stdint.h>
#endif
#ifdef HAVE_UNISTD_H
# include <unistd.h>
#endif



int main()
{
    (void)
_mm_movemask_epi8
    ;
    return 0;
}
" HAVE_DECL__MM_MOVEMASK_EPI8)
        set(CMAKE_REQUIRED_DEFINITIONS)
        add_check_variable(HAVE_DECL__MM_MOVEMASK_EPI8)
    endif()

    if (NOT DEFINED HAVE_STRUCT_STAT_ST_ATIMENSEC)
        CHECK_STRUCT_HAS_MEMBER("struct stat" st_atimensec "sys/stat.h" HAVE_STRUCT_STAT_ST_ATIMENSEC)
        add_check_variable(HAVE_STRUCT_STAT_ST_ATIMENSEC)
    endif()

    if (NOT DEFINED HAVE_STRUCT_STAT_ST_ATIMESPEC_TV_NSEC)
        CHECK_STRUCT_HAS_MEMBER("struct stat" st_atimespec.tv_nsec "sys/stat.h" HAVE_STRUCT_STAT_ST_ATIMESPEC_TV_NSEC)
        add_check_variable(HAVE_STRUCT_STAT_ST_ATIMESPEC_TV_NSEC)
    endif()

    if (NOT DEFINED HAVE_STRUCT_STAT_ST_ATIM_ST__TIM_TV_NSEC)
        CHECK_STRUCT_HAS_MEMBER("struct stat" st_atim.st__tim.tv_nsec "sys/stat.h" HAVE_STRUCT_STAT_ST_ATIM_ST__TIM_TV_NSEC)
        add_check_variable(HAVE_STRUCT_STAT_ST_ATIM_ST__TIM_TV_NSEC)
    endif()

    if (NOT DEFINED HAVE_STRUCT_STAT_ST_ATIM_TV_NSEC)
        CHECK_STRUCT_HAS_MEMBER("struct stat" st_atim.tv_nsec "sys/stat.h" HAVE_STRUCT_STAT_ST_ATIM_TV_NSEC)
        add_check_variable(HAVE_STRUCT_STAT_ST_ATIM_TV_NSEC)
    endif()

    if (NOT DEFINED HAVE_STRUCT_STAT_ST_UATIME)
        CHECK_STRUCT_HAS_MEMBER("struct stat" st_uatime "sys/stat.h" HAVE_STRUCT_STAT_ST_UATIME)
        add_check_variable(HAVE_STRUCT_STAT_ST_UATIME)
    endif()

    if (CPPAN_NEW_VARIABLE_ADDED)
        write_check_variables_file(${vars_file})
        file(WRITE ${vars_file_helper} "")
        set(CPPAN_NEW_VARIABLE_ADDED 0)
    endif()
endif()

get_configuration(config)
get_configuration_with_generator(config_dir)
get_configuration_unhashed(config_name)
get_configuration_with_generator_unhashed(config_gen_name)
get_number_of_cores(N_CORES)

################################################################################
#
# dummy compiled target b
#
################################################################################

# this target will be always built before any other
if (VISUAL_STUDIO)
    add_custom_target(cppan-d-b ALL DEPENDS cppan_intentionally_missing_file.txt)
elseif(NINJA)
    add_custom_target(cppan-d-b ALL)
else()
    add_custom_target(cppan-d-b ALL)
endif()

set_target_properties(cppan-d-b PROPERTIES FOLDER "CPPAN Targets/Service")

set_target_properties(cppan-d-b PROPERTIES PROJECT_LABEL build-dependencies)

################################################################################
#
# dummy compiled target c
#
################################################################################

# this target will be always built before any other
if (VISUAL_STUDIO)
    add_custom_target(cppan-d-c ALL DEPENDS cppan_intentionally_missing_file.txt)
elseif(NINJA)
    add_custom_target(cppan-d-c ALL)
else()
    add_custom_target(cppan-d-c ALL)
endif()

set_target_properties(cppan-d-c PROPERTIES FOLDER "CPPAN Targets/Service")

set_target_properties(cppan-d-c PROPERTIES PROJECT_LABEL copy-dependencies)
add_dependencies(cppan-d-c cppan-d-b)
