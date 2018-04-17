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
# meta config file
#

set(CPPAN_DEBUG_STACK_SPACE "" CACHE STRING "" FORCE)

################################################################################
#
# cmake setup
#
################################################################################

cmake_minimum_required(VERSION 3.2.0)

################################################################################
#
# macros & functions
#
################################################################################

include(C:/cppan/storage/etc/static/functions.cmake)
set(SDIR ${CMAKE_CURRENT_SOURCE_DIR})
set(BDIR ${CMAKE_CURRENT_BINARY_DIR})
set(BDIR_PRIVATE ${BDIR}/cppan_private)
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${BDIR_PRIVATE})

################################################################################
#
# variables
#
################################################################################

clear_once_variables()

set(CPPAN_BUILD 1 CACHE STRING "CPPAN is turned on")

################################################################################
#
# storage dirs
#
################################################################################

set_cache_var(STORAGE_DIR "C:/cppan/storage")
set_cache_var(STORAGE_DIR_ETC "C:/cppan/storage/etc")
set_cache_var(STORAGE_DIR_ETC_STATIC "C:/cppan/storage/etc/static")
set_cache_var(STORAGE_DIR_USR "C:/cppan/storage/usr")

set_cache_var(CMAKE_POSITION_INDEPENDENT_CODE ON)

set_cache_var(${CMAKE_CXX_COMPILER_ID} 1)

if (NOT DEFINED CPPAN_USE_CACHE)
    set_cache_var(CPPAN_USE_CACHE 1)
endif()

if (NOT DEFINED CPPAN_SHOW_IDE_PROJECTS)
    set_cache_var(CPPAN_SHOW_IDE_PROJECTS 0)
endif()

if (NOT DEFINED CPPAN_BUILD_EXECUTABLES_WITH_SAME_CONFIGURATION)
    set_cache_var(CPPAN_BUILD_EXECUTABLES_WITH_SAME_CONFIGURATION 0)
endif()

if (NOT DEFINED CPPAN_BUILD_VERBOSE)
    set_cache_var(CPPAN_BUILD_VERBOSE 1)
endif()
if (NOT DEFINED CPPAN_BUILD_SHARED_LIBS)
    set_cache_var(CPPAN_BUILD_SHARED_LIBS 1)
endif()

if (NOT DEFINED CPPAN_BUILD_WARNING_LEVEL)
    set_cache_var(CPPAN_BUILD_WARNING_LEVEL 0)
endif()
if (NOT DEFINED CPPAN_RC_ENABLED)
    set_cache_var(CPPAN_RC_ENABLED 1)
endif()

if (VISUAL_STUDIO AND CLANG AND NINJA_FOUND AND NOT NINJA)
    set_cache_var(VISUAL_STUDIO_ACCELERATE_CLANG 1)
endif()


get_configuration_variables()

include(helpers.cmake)

################################################################################
#
# references
#
################################################################################

################################################################################
#
# direct dependencies
#
################################################################################

set(pvt_cppan_demo_intel_opencv_highgui_DIR C:/cppan/storage/src/a9/c1/5bf6)

################################################################################
#
# include dependencies (they should be placed at the end)
#
################################################################################

if (CPPAN_USE_CACHE)
    # pvt.cppan.demo.intel.opencv.highgui-3.4.1
    cppan_include("C:/cppan/storage/obj/a9/c1/5bf6/generate.cmake")
else()
    # pvt.cppan.demo.intel.opencv.highgui-3.4.1
    cppan_include("C:/cppan/storage/src/a9/c1/5bf6/include.cmake")
endif()

################################################################################
#
# main library
#
################################################################################

add_library                   (__cppan INTERFACE)
target_link_libraries         (__cppan
    INTERFACE pvt.cppan.demo.intel.opencv.highgui-3.4.1
)
add_dependencies(__cppan cppan-d-c)

export(TARGETS __cppan FILE ${CMAKE_BINARY_DIR}/exports/cppan.cmake)

################################################################################
#
# build dependencies
#
################################################################################

if (CPPAN_USE_CACHE)
    set(CPPAN_GET_CHILDREN_VARIABLES 1)
    get_configuration_with_generator(config)
    if (CPPAN_BUILD_EXECUTABLES_WITH_SAME_CONFIG)
        get_configuration_with_generator(config_exe)
    else()
        get_configuration_exe(config_exe)
    endif()
    set(CPPAN_GET_CHILDREN_VARIABLES 0)

    string(TOUPPER "${CMAKE_BUILD_TYPE}" CMAKE_BUILD_TYPE_UPPER)

    set(this cppan-d-b)

    get_target_property(implib_pvt_cppan_demo_webp_0_6_1 pvt.cppan.demo.webp-0.6.1 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_webp_0_6_1 pvt.cppan.demo.webp-0.6.1 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_webp_0_6_1 pvt.cppan.demo.webp-0.6.1 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_intel_opencv_highgui_3_4_1 pvt.cppan.demo.intel.opencv.highgui-3.4.1 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_intel_opencv_highgui_3_4_1 pvt.cppan.demo.intel.opencv.highgui-3.4.1 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_intel_opencv_highgui_3_4_1 pvt.cppan.demo.intel.opencv.highgui-3.4.1 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_intel_opencv_imgcodecs_3_4_1 pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_intel_opencv_imgcodecs_3_4_1 pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_intel_opencv_imgcodecs_3_4_1 pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_malaterre_gdcm_jpeg8_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_jpeg8_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_malaterre_gdcm_jpeg8_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_mdadams_jasper_2_0_10 pvt.cppan.demo.mdadams.jasper-2.0.10 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_mdadams_jasper_2_0_10 pvt.cppan.demo.mdadams.jasper-2.0.10 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_mdadams_jasper_2_0_10 pvt.cppan.demo.mdadams.jasper-2.0.10 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_intel_opencv_imgproc_3_4_1 pvt.cppan.demo.intel.opencv.imgproc-3.4.1 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_intel_opencv_imgproc_3_4_1 pvt.cppan.demo.intel.opencv.imgproc-3.4.1 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_intel_opencv_imgproc_3_4_1 pvt.cppan.demo.intel.opencv.imgproc-3.4.1 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_openexr_ilmbase_iex_2_2_0 pvt.cppan.demo.openexr.ilmbase.iex-2.2.0 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_openexr_ilmbase_iex_2_2_0 pvt.cppan.demo.openexr.ilmbase.iex-2.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_openexr_ilmbase_iex_2_2_0 pvt.cppan.demo.openexr.ilmbase.iex-2.2.0 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_jpeg_9_2_0 pvt.cppan.demo.jpeg-9.2.0 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_jpeg_9_2_0 pvt.cppan.demo.jpeg-9.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_jpeg_9_2_0 pvt.cppan.demo.jpeg-9.2.0 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_openexr_ilmbase_ilmthread_2_2_0 pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_openexr_ilmbase_ilmthread_2_2_0 pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_openexr_ilmbase_ilmthread_2_2_0 pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_madler_zlib_1_2_11 pvt.cppan.demo.madler.zlib-1.2.11 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_madler_zlib_1_2_11 pvt.cppan.demo.madler.zlib-1.2.11 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_madler_zlib_1_2_11 pvt.cppan.demo.madler.zlib-1.2.11 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_intel_opencv_core_3_4_1 pvt.cppan.demo.intel.opencv.core-3.4.1 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_intel_opencv_core_3_4_1 pvt.cppan.demo.intel.opencv.core-3.4.1 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_intel_opencv_core_3_4_1 pvt.cppan.demo.intel.opencv.core-3.4.1 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_tiff_4_0_9 pvt.cppan.demo.tiff-4.0.9 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_tiff_4_0_9 pvt.cppan.demo.tiff-4.0.9 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_tiff_4_0_9 pvt.cppan.demo.tiff-4.0.9 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_xz_utils_lzma_5_2_3 pvt.cppan.demo.xz_utils.lzma-5.2.3 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_xz_utils_lzma_5_2_3 pvt.cppan.demo.xz_utils.lzma-5.2.3 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_xz_utils_lzma_5_2_3 pvt.cppan.demo.xz_utils.lzma-5.2.3 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_openjpeg_openjp2_2_3_0 pvt.cppan.demo.openjpeg.openjp2-2.3.0 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_openjpeg_openjp2_2_3_0 pvt.cppan.demo.openjpeg.openjp2-2.3.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_openjpeg_openjp2_2_3_0 pvt.cppan.demo.openjpeg.openjp2-2.3.0 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_mgk25_jbig_jbig_2_1_0 pvt.cppan.demo.mgk25.jbig.jbig-2.1.0 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_mgk25_jbig_jbig_2_1_0 pvt.cppan.demo.mgk25.jbig.jbig-2.1.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_mgk25_jbig_jbig_2_1_0 pvt.cppan.demo.mgk25.jbig.jbig-2.1.0 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_mgk25_jbig_ar_2_1_0 pvt.cppan.demo.mgk25.jbig.ar-2.1.0 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_mgk25_jbig_ar_2_1_0 pvt.cppan.demo.mgk25.jbig.ar-2.1.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_mgk25_jbig_ar_2_1_0 pvt.cppan.demo.mgk25.jbig.ar-2.1.0 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_png_1_6_34 pvt.cppan.demo.png-1.6.34 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_png_1_6_34 pvt.cppan.demo.png-1.6.34 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_png_1_6_34 pvt.cppan.demo.png-1.6.34 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_malaterre_gdcm_gdcm_2_6_6 pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_gdcm_2_6_6 pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_malaterre_gdcm_gdcm_2_6_6 pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_openexr_ilmbase_imath_2_2_0 pvt.cppan.demo.openexr.ilmbase.imath-2.2.0 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_openexr_ilmbase_imath_2_2_0 pvt.cppan.demo.openexr.ilmbase.imath-2.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_openexr_ilmbase_imath_2_2_0 pvt.cppan.demo.openexr.ilmbase.imath-2.2.0 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_malaterre_gdcm_jpeg16_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_jpeg16_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_malaterre_gdcm_jpeg16_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_malaterre_gdcm_socketxx_2_6_6 pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_socketxx_2_6_6 pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_malaterre_gdcm_socketxx_2_6_6 pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_malaterre_gdcm_rle_2_6_6 pvt.cppan.demo.malaterre.gdcm.rle-2.6.6 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_rle_2_6_6 pvt.cppan.demo.malaterre.gdcm.rle-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_malaterre_gdcm_rle_2_6_6 pvt.cppan.demo.malaterre.gdcm.rle-2.6.6 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_expat_2_2_5 pvt.cppan.demo.expat-2.2.5 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_expat_2_2_5 pvt.cppan.demo.expat-2.2.5 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_expat_2_2_5 pvt.cppan.demo.expat-2.2.5 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_vbaderks_charls_1_1_0 pvt.cppan.demo.vbaderks.charls-1.1.0 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_vbaderks_charls_1_1_0 pvt.cppan.demo.vbaderks.charls-1.1.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_vbaderks_charls_1_1_0 pvt.cppan.demo.vbaderks.charls-1.1.0 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_json_c_master pvt.cppan.demo.json_c-master IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_json_c_master pvt.cppan.demo.json_c-master IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_json_c_master pvt.cppan.demo.json_c-master IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_malaterre_gdcm_jpeg12_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_jpeg12_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_malaterre_gdcm_jpeg12_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_openssl_crypto_1_10_8 pvt.cppan.demo.openssl.crypto-1.10.8 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_openssl_crypto_1_10_8 pvt.cppan.demo.openssl.crypto-1.10.8 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_openssl_crypto_1_10_8 pvt.cppan.demo.openssl.crypto-1.10.8 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_openexr_ilmimf_2_2_0 pvt.cppan.demo.openexr.ilmimf-2.2.0 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_openexr_ilmimf_2_2_0 pvt.cppan.demo.openexr.ilmimf-2.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_openexr_ilmimf_2_2_0 pvt.cppan.demo.openexr.ilmimf-2.2.0 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(implib_pvt_cppan_demo_openexr_ilmbase_half_2_2_0 pvt.cppan.demo.openexr.ilmbase.half-2.2.0 IMPORTED_IMPLIB_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(imploc_pvt_cppan_demo_openexr_ilmbase_half_2_2_0 pvt.cppan.demo.openexr.ilmbase.half-2.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
    get_target_property(impson_pvt_cppan_demo_openexr_ilmbase_half_2_2_0 pvt.cppan.demo.openexr.ilmbase.half-2.2.0 IMPORTED_SONAME_${CMAKE_BUILD_TYPE_UPPER})

    set(rest "-DCPPAN_BUILD_EXECUTABLES_WITH_SAME_CONFIGURATION=${CPPAN_BUILD_EXECUTABLES_WITH_SAME_CONFIGURATION} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCPPAN_BUILD_VERBOSE=${CPPAN_BUILD_VERBOSE} -DCPPAN_BUILD_WARNING_LEVEL=${CPPAN_BUILD_WARNING_LEVEL} -DCPPAN_RC_ENABLED=${CPPAN_RC_ENABLED} -DCPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT=${CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT} -DN_CORES=${N_CORES} -DXCODE=${XCODE} -DNINJA=${NINJA} -DNINJA_FOUND=${NINJA_FOUND} -DVISUAL_STUDIO=${VISUAL_STUDIO} -DCLANG=${CLANG} ")

    set(ext sh)
if (WIN32)
    set(ext bat)
endif()


    set(file ${BDIR}/cppan_build_deps_$<CONFIG>.${ext})

    #if (NOT CPPAN_BUILD_LEVEL)
    #set(CPPAN_BUILD_LEVEL 0)
#else()
    #math(EXPR CPPAN_BUILD_LEVEL "${CPPAN_BUILD_LEVEL} + 1")
#endif()

set(bat_file_error)
if (WIN32)
    set(bat_file_error "@if %errorlevel% neq 0 goto :cmEnd")
endif()

    set(bd_pvt_cppan_demo_webp_0_6_1 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/cd/e5/3a66/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/cd/e5/3a66/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_intel_opencv_highgui_3_4_1 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/a9/c1/5bf6/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/a9/c1/5bf6/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_intel_opencv_imgcodecs_3_4_1 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/bb/15/375b/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/bb/15/375b/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_malaterre_gdcm_jpeg8_2_6_6 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/cf/02/bec3/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/cf/02/bec3/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_mdadams_jasper_2_0_10 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/60/8e/bdfc/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/60/8e/bdfc/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_intel_opencv_imgproc_3_4_1 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/4c/68/58fe/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/4c/68/58fe/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_openexr_ilmbase_iex_2_2_0 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/2f/bd/e08f/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/2f/bd/e08f/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_jpeg_9_2_0 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/97/2a/155a/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/97/2a/155a/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_openexr_ilmbase_ilmthread_2_2_0 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/66/5b/a0d0/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/66/5b/a0d0/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_madler_zlib_1_2_11 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/d4/78/06ca/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/d4/78/06ca/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_intel_opencv_core_3_4_1 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/b6/1f/8154/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/b6/1f/8154/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_tiff_4_0_9 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/1f/16/f783/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/1f/16/f783/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_xz_utils_lzma_5_2_3 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/a7/68/fa0b/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/a7/68/fa0b/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_openjpeg_openjp2_2_3_0 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/71/a6/8bbe/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/71/a6/8bbe/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_mgk25_jbig_jbig_2_1_0 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/95/15/a371/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/95/15/a371/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_mgk25_jbig_ar_2_1_0 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/79/97/1d02/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/79/97/1d02/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_png_1_6_34 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/b6/10/1c7b/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/b6/10/1c7b/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_malaterre_gdcm_gdcm_2_6_6 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/81/9b/9193/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/81/9b/9193/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_openexr_ilmbase_imath_2_2_0 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/f8/6e/a7fb/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/f8/6e/a7fb/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_malaterre_gdcm_jpeg16_2_6_6 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/08/7c/d2ed/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/08/7c/d2ed/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_malaterre_gdcm_socketxx_2_6_6 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/e5/9d/28fb/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/e5/9d/28fb/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_malaterre_gdcm_rle_2_6_6 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/62/a0/f919/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/62/a0/f919/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_expat_2_2_5 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/41/43/1e65/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/41/43/1e65/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_vbaderks_charls_1_1_0 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/56/f4/579b/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/56/f4/579b/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_json_c_master "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/70/fe/17b6/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/70/fe/17b6/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_malaterre_gdcm_jpeg12_2_6_6 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/fe/2b/fa4f/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/fe/2b/fa4f/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_openssl_crypto_1_10_8 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/62/b9/35cb/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/62/b9/35cb/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_openexr_ilmimf_2_2_0 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/22/1a/cd48/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/22/1a/cd48/build.cmake
${bat_file_error}")
    set(bd_pvt_cppan_demo_openexr_ilmbase_half_2_2_0 "
    @\"${CMAKE_COMMAND}\" -DCONFIG=$<CONFIG> -DBUILD_DIR=C:/cppan/storage/obj/69/ac/4ce8/build/${config} -DEXECUTABLE=0 -DMULTICORE=1 ${rest} -P C:/cppan/storage/obj/69/ac/4ce8/build.cmake
${bat_file_error}")

    set(bat_file_begin)
    if (WIN32)
        set(bat_file_begin @setlocal)
        set(bat_file_error "\n
@exit /b 0
:cmEnd
@endlocal & @call :cmErrorLevel %errorlevel%
:cmErrorLevel
@exit /b %1
")
    else()
        set(bat_file_begin "#!/bin/sh\n")
    endif()
    file(GENERATE OUTPUT ${file} CONTENT "${bat_file_begin}
        ${bd_pvt_cppan_demo_webp_0_6_1}
        ${bd_pvt_cppan_demo_intel_opencv_highgui_3_4_1}
        ${bd_pvt_cppan_demo_intel_opencv_imgcodecs_3_4_1}
        ${bd_pvt_cppan_demo_malaterre_gdcm_jpeg8_2_6_6}
        ${bd_pvt_cppan_demo_mdadams_jasper_2_0_10}
        ${bd_pvt_cppan_demo_intel_opencv_imgproc_3_4_1}
        ${bd_pvt_cppan_demo_openexr_ilmbase_iex_2_2_0}
        ${bd_pvt_cppan_demo_jpeg_9_2_0}
        ${bd_pvt_cppan_demo_openexr_ilmbase_ilmthread_2_2_0}
        ${bd_pvt_cppan_demo_madler_zlib_1_2_11}
        ${bd_pvt_cppan_demo_intel_opencv_core_3_4_1}
        ${bd_pvt_cppan_demo_tiff_4_0_9}
        ${bd_pvt_cppan_demo_xz_utils_lzma_5_2_3}
        ${bd_pvt_cppan_demo_openjpeg_openjp2_2_3_0}
        ${bd_pvt_cppan_demo_mgk25_jbig_jbig_2_1_0}
        ${bd_pvt_cppan_demo_mgk25_jbig_ar_2_1_0}
        ${bd_pvt_cppan_demo_png_1_6_34}
        ${bd_pvt_cppan_demo_malaterre_gdcm_gdcm_2_6_6}
        ${bd_pvt_cppan_demo_openexr_ilmbase_imath_2_2_0}
        ${bd_pvt_cppan_demo_malaterre_gdcm_jpeg16_2_6_6}
        ${bd_pvt_cppan_demo_malaterre_gdcm_socketxx_2_6_6}
        ${bd_pvt_cppan_demo_malaterre_gdcm_rle_2_6_6}
        ${bd_pvt_cppan_demo_expat_2_2_5}
        ${bd_pvt_cppan_demo_vbaderks_charls_1_1_0}
        ${bd_pvt_cppan_demo_json_c_master}
        ${bd_pvt_cppan_demo_malaterre_gdcm_jpeg12_2_6_6}
        ${bd_pvt_cppan_demo_openssl_crypto_1_10_8}
        ${bd_pvt_cppan_demo_openexr_ilmimf_2_2_0}
        ${bd_pvt_cppan_demo_openexr_ilmbase_half_2_2_0}
        ${bat_file_error}
    ")

    if (UNIX)
    set(file chmod u+x ${file} COMMAND ${file})
endif()

    set(bp)
    set(bp ${bp} ${implib_pvt_cppan_demo_webp_0_6_1})
    set(bp ${bp} ${imploc_pvt_cppan_demo_webp_0_6_1})
    set(bp ${bp} ${impson_pvt_cppan_demo_webp_0_6_1})
    set(bp ${bp} ${implib_pvt_cppan_demo_intel_opencv_highgui_3_4_1})
    set(bp ${bp} ${imploc_pvt_cppan_demo_intel_opencv_highgui_3_4_1})
    set(bp ${bp} ${impson_pvt_cppan_demo_intel_opencv_highgui_3_4_1})
    set(bp ${bp} ${implib_pvt_cppan_demo_intel_opencv_imgcodecs_3_4_1})
    set(bp ${bp} ${imploc_pvt_cppan_demo_intel_opencv_imgcodecs_3_4_1})
    set(bp ${bp} ${impson_pvt_cppan_demo_intel_opencv_imgcodecs_3_4_1})
    set(bp ${bp} ${implib_pvt_cppan_demo_malaterre_gdcm_jpeg8_2_6_6})
    set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_jpeg8_2_6_6})
    set(bp ${bp} ${impson_pvt_cppan_demo_malaterre_gdcm_jpeg8_2_6_6})
    set(bp ${bp} ${implib_pvt_cppan_demo_mdadams_jasper_2_0_10})
    set(bp ${bp} ${imploc_pvt_cppan_demo_mdadams_jasper_2_0_10})
    set(bp ${bp} ${impson_pvt_cppan_demo_mdadams_jasper_2_0_10})
    set(bp ${bp} ${implib_pvt_cppan_demo_intel_opencv_imgproc_3_4_1})
    set(bp ${bp} ${imploc_pvt_cppan_demo_intel_opencv_imgproc_3_4_1})
    set(bp ${bp} ${impson_pvt_cppan_demo_intel_opencv_imgproc_3_4_1})
    set(bp ${bp} ${implib_pvt_cppan_demo_openexr_ilmbase_iex_2_2_0})
    set(bp ${bp} ${imploc_pvt_cppan_demo_openexr_ilmbase_iex_2_2_0})
    set(bp ${bp} ${impson_pvt_cppan_demo_openexr_ilmbase_iex_2_2_0})
    set(bp ${bp} ${implib_pvt_cppan_demo_jpeg_9_2_0})
    set(bp ${bp} ${imploc_pvt_cppan_demo_jpeg_9_2_0})
    set(bp ${bp} ${impson_pvt_cppan_demo_jpeg_9_2_0})
    set(bp ${bp} ${implib_pvt_cppan_demo_openexr_ilmbase_ilmthread_2_2_0})
    set(bp ${bp} ${imploc_pvt_cppan_demo_openexr_ilmbase_ilmthread_2_2_0})
    set(bp ${bp} ${impson_pvt_cppan_demo_openexr_ilmbase_ilmthread_2_2_0})
    set(bp ${bp} ${implib_pvt_cppan_demo_madler_zlib_1_2_11})
    set(bp ${bp} ${imploc_pvt_cppan_demo_madler_zlib_1_2_11})
    set(bp ${bp} ${impson_pvt_cppan_demo_madler_zlib_1_2_11})
    set(bp ${bp} ${implib_pvt_cppan_demo_intel_opencv_core_3_4_1})
    set(bp ${bp} ${imploc_pvt_cppan_demo_intel_opencv_core_3_4_1})
    set(bp ${bp} ${impson_pvt_cppan_demo_intel_opencv_core_3_4_1})
    set(bp ${bp} ${implib_pvt_cppan_demo_tiff_4_0_9})
    set(bp ${bp} ${imploc_pvt_cppan_demo_tiff_4_0_9})
    set(bp ${bp} ${impson_pvt_cppan_demo_tiff_4_0_9})
    set(bp ${bp} ${implib_pvt_cppan_demo_xz_utils_lzma_5_2_3})
    set(bp ${bp} ${imploc_pvt_cppan_demo_xz_utils_lzma_5_2_3})
    set(bp ${bp} ${impson_pvt_cppan_demo_xz_utils_lzma_5_2_3})
    set(bp ${bp} ${implib_pvt_cppan_demo_openjpeg_openjp2_2_3_0})
    set(bp ${bp} ${imploc_pvt_cppan_demo_openjpeg_openjp2_2_3_0})
    set(bp ${bp} ${impson_pvt_cppan_demo_openjpeg_openjp2_2_3_0})
    set(bp ${bp} ${implib_pvt_cppan_demo_mgk25_jbig_jbig_2_1_0})
    set(bp ${bp} ${imploc_pvt_cppan_demo_mgk25_jbig_jbig_2_1_0})
    set(bp ${bp} ${impson_pvt_cppan_demo_mgk25_jbig_jbig_2_1_0})
    set(bp ${bp} ${implib_pvt_cppan_demo_mgk25_jbig_ar_2_1_0})
    set(bp ${bp} ${imploc_pvt_cppan_demo_mgk25_jbig_ar_2_1_0})
    set(bp ${bp} ${impson_pvt_cppan_demo_mgk25_jbig_ar_2_1_0})
    set(bp ${bp} ${implib_pvt_cppan_demo_png_1_6_34})
    set(bp ${bp} ${imploc_pvt_cppan_demo_png_1_6_34})
    set(bp ${bp} ${impson_pvt_cppan_demo_png_1_6_34})
    set(bp ${bp} ${implib_pvt_cppan_demo_malaterre_gdcm_gdcm_2_6_6})
    set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_gdcm_2_6_6})
    set(bp ${bp} ${impson_pvt_cppan_demo_malaterre_gdcm_gdcm_2_6_6})
    set(bp ${bp} ${implib_pvt_cppan_demo_openexr_ilmbase_imath_2_2_0})
    set(bp ${bp} ${imploc_pvt_cppan_demo_openexr_ilmbase_imath_2_2_0})
    set(bp ${bp} ${impson_pvt_cppan_demo_openexr_ilmbase_imath_2_2_0})
    set(bp ${bp} ${implib_pvt_cppan_demo_malaterre_gdcm_jpeg16_2_6_6})
    set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_jpeg16_2_6_6})
    set(bp ${bp} ${impson_pvt_cppan_demo_malaterre_gdcm_jpeg16_2_6_6})
    set(bp ${bp} ${implib_pvt_cppan_demo_malaterre_gdcm_socketxx_2_6_6})
    set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_socketxx_2_6_6})
    set(bp ${bp} ${impson_pvt_cppan_demo_malaterre_gdcm_socketxx_2_6_6})
    set(bp ${bp} ${implib_pvt_cppan_demo_malaterre_gdcm_rle_2_6_6})
    set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_rle_2_6_6})
    set(bp ${bp} ${impson_pvt_cppan_demo_malaterre_gdcm_rle_2_6_6})
    set(bp ${bp} ${implib_pvt_cppan_demo_expat_2_2_5})
    set(bp ${bp} ${imploc_pvt_cppan_demo_expat_2_2_5})
    set(bp ${bp} ${impson_pvt_cppan_demo_expat_2_2_5})
    set(bp ${bp} ${implib_pvt_cppan_demo_vbaderks_charls_1_1_0})
    set(bp ${bp} ${imploc_pvt_cppan_demo_vbaderks_charls_1_1_0})
    set(bp ${bp} ${impson_pvt_cppan_demo_vbaderks_charls_1_1_0})
    set(bp ${bp} ${implib_pvt_cppan_demo_json_c_master})
    set(bp ${bp} ${imploc_pvt_cppan_demo_json_c_master})
    set(bp ${bp} ${impson_pvt_cppan_demo_json_c_master})
    set(bp ${bp} ${implib_pvt_cppan_demo_malaterre_gdcm_jpeg12_2_6_6})
    set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_jpeg12_2_6_6})
    set(bp ${bp} ${impson_pvt_cppan_demo_malaterre_gdcm_jpeg12_2_6_6})
    set(bp ${bp} ${implib_pvt_cppan_demo_openssl_crypto_1_10_8})
    set(bp ${bp} ${imploc_pvt_cppan_demo_openssl_crypto_1_10_8})
    set(bp ${bp} ${impson_pvt_cppan_demo_openssl_crypto_1_10_8})
    set(bp ${bp} ${implib_pvt_cppan_demo_openexr_ilmimf_2_2_0})
    set(bp ${bp} ${imploc_pvt_cppan_demo_openexr_ilmimf_2_2_0})
    set(bp ${bp} ${impson_pvt_cppan_demo_openexr_ilmimf_2_2_0})
    set(bp ${bp} ${implib_pvt_cppan_demo_openexr_ilmbase_half_2_2_0})
    set(bp ${bp} ${imploc_pvt_cppan_demo_openexr_ilmbase_half_2_2_0})
    set(bp ${bp} ${impson_pvt_cppan_demo_openexr_ilmbase_half_2_2_0})

    add_custom_target(${this}-d
        COMMAND ${file}
        BYPRODUCTS ${bp}
    )
    add_dependencies(${this} ${this}-d)
    set_target_properties(${this}-d PROPERTIES FOLDER "CPPAN Targets/Service")

    add_dependencies(pvt.cppan.demo.webp-0.6 ${this})
    add_dependencies(pvt.cppan.demo.webp-0 ${this})
    add_dependencies(pvt.cppan.demo.webp ${this})

    add_dependencies(pvt::cppan::demo::webp-0.6 ${this})
    add_dependencies(pvt::cppan::demo::webp-0 ${this})
    add_dependencies(pvt::cppan::demo::webp ${this})

    add_dependencies(pvt.cppan.demo.intel.opencv.highgui-3.4 ${this})
    add_dependencies(pvt.cppan.demo.intel.opencv.highgui-3 ${this})
    add_dependencies(pvt.cppan.demo.intel.opencv.highgui ${this})

    add_dependencies(pvt::cppan::demo::intel::opencv::highgui-3.4 ${this})
    add_dependencies(pvt::cppan::demo::intel::opencv::highgui-3 ${this})
    add_dependencies(pvt::cppan::demo::intel::opencv::highgui ${this})

    add_dependencies(pvt.cppan.demo.intel.opencv.imgcodecs-3.4 ${this})
    add_dependencies(pvt.cppan.demo.intel.opencv.imgcodecs-3 ${this})
    add_dependencies(pvt.cppan.demo.intel.opencv.imgcodecs ${this})

    add_dependencies(pvt::cppan::demo::intel::opencv::imgcodecs-3.4 ${this})
    add_dependencies(pvt::cppan::demo::intel::opencv::imgcodecs-3 ${this})
    add_dependencies(pvt::cppan::demo::intel::opencv::imgcodecs ${this})

    add_dependencies(pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.jpeg8-2 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.jpeg8 ${this})

    add_dependencies(pvt::cppan::demo::malaterre::gdcm::jpeg8-2.6 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::jpeg8-2 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::jpeg8 ${this})

    add_dependencies(pvt.cppan.demo.mdadams.jasper-2.0 ${this})
    add_dependencies(pvt.cppan.demo.mdadams.jasper-2 ${this})
    add_dependencies(pvt.cppan.demo.mdadams.jasper ${this})

    add_dependencies(pvt::cppan::demo::mdadams::jasper-2.0 ${this})
    add_dependencies(pvt::cppan::demo::mdadams::jasper-2 ${this})
    add_dependencies(pvt::cppan::demo::mdadams::jasper ${this})

    add_dependencies(pvt.cppan.demo.intel.opencv.imgproc-3.4 ${this})
    add_dependencies(pvt.cppan.demo.intel.opencv.imgproc-3 ${this})
    add_dependencies(pvt.cppan.demo.intel.opencv.imgproc ${this})

    add_dependencies(pvt::cppan::demo::intel::opencv::imgproc-3.4 ${this})
    add_dependencies(pvt::cppan::demo::intel::opencv::imgproc-3 ${this})
    add_dependencies(pvt::cppan::demo::intel::opencv::imgproc ${this})

    add_dependencies(pvt.cppan.demo.openexr.ilmbase.iex-2.2 ${this})
    add_dependencies(pvt.cppan.demo.openexr.ilmbase.iex-2 ${this})
    add_dependencies(pvt.cppan.demo.openexr.ilmbase.iex ${this})

    add_dependencies(pvt::cppan::demo::openexr::ilmbase::iex-2.2 ${this})
    add_dependencies(pvt::cppan::demo::openexr::ilmbase::iex-2 ${this})
    add_dependencies(pvt::cppan::demo::openexr::ilmbase::iex ${this})

    add_dependencies(pvt.cppan.demo.jpeg-9.2 ${this})
    add_dependencies(pvt.cppan.demo.jpeg-9 ${this})
    add_dependencies(pvt.cppan.demo.jpeg ${this})

    add_dependencies(pvt::cppan::demo::jpeg-9.2 ${this})
    add_dependencies(pvt::cppan::demo::jpeg-9 ${this})
    add_dependencies(pvt::cppan::demo::jpeg ${this})

    add_dependencies(pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2 ${this})
    add_dependencies(pvt.cppan.demo.openexr.ilmbase.ilmthread-2 ${this})
    add_dependencies(pvt.cppan.demo.openexr.ilmbase.ilmthread ${this})

    add_dependencies(pvt::cppan::demo::openexr::ilmbase::ilmthread-2.2 ${this})
    add_dependencies(pvt::cppan::demo::openexr::ilmbase::ilmthread-2 ${this})
    add_dependencies(pvt::cppan::demo::openexr::ilmbase::ilmthread ${this})

    add_dependencies(pvt.cppan.demo.madler.zlib-1.2 ${this})
    add_dependencies(pvt.cppan.demo.madler.zlib-1 ${this})
    add_dependencies(pvt.cppan.demo.madler.zlib ${this})

    add_dependencies(pvt::cppan::demo::madler::zlib-1.2 ${this})
    add_dependencies(pvt::cppan::demo::madler::zlib-1 ${this})
    add_dependencies(pvt::cppan::demo::madler::zlib ${this})

    add_dependencies(pvt.cppan.demo.intel.opencv.core-3.4 ${this})
    add_dependencies(pvt.cppan.demo.intel.opencv.core-3 ${this})
    add_dependencies(pvt.cppan.demo.intel.opencv.core ${this})

    add_dependencies(pvt::cppan::demo::intel::opencv::core-3.4 ${this})
    add_dependencies(pvt::cppan::demo::intel::opencv::core-3 ${this})
    add_dependencies(pvt::cppan::demo::intel::opencv::core ${this})

    add_dependencies(pvt.cppan.demo.tiff-4.0 ${this})
    add_dependencies(pvt.cppan.demo.tiff-4 ${this})
    add_dependencies(pvt.cppan.demo.tiff ${this})

    add_dependencies(pvt::cppan::demo::tiff-4.0 ${this})
    add_dependencies(pvt::cppan::demo::tiff-4 ${this})
    add_dependencies(pvt::cppan::demo::tiff ${this})

    add_dependencies(pvt.cppan.demo.xz_utils.lzma-5.2 ${this})
    add_dependencies(pvt.cppan.demo.xz_utils.lzma-5 ${this})
    add_dependencies(pvt.cppan.demo.xz_utils.lzma ${this})

    add_dependencies(pvt::cppan::demo::xz_utils::lzma-5.2 ${this})
    add_dependencies(pvt::cppan::demo::xz_utils::lzma-5 ${this})
    add_dependencies(pvt::cppan::demo::xz_utils::lzma ${this})

    add_dependencies(pvt.cppan.demo.openjpeg.openjp2-2.3 ${this})
    add_dependencies(pvt.cppan.demo.openjpeg.openjp2-2 ${this})
    add_dependencies(pvt.cppan.demo.openjpeg.openjp2 ${this})

    add_dependencies(pvt::cppan::demo::openjpeg::openjp2-2.3 ${this})
    add_dependencies(pvt::cppan::demo::openjpeg::openjp2-2 ${this})
    add_dependencies(pvt::cppan::demo::openjpeg::openjp2 ${this})

    add_dependencies(pvt.cppan.demo.mgk25.jbig.jbig-2.1 ${this})
    add_dependencies(pvt.cppan.demo.mgk25.jbig.jbig-2 ${this})
    add_dependencies(pvt.cppan.demo.mgk25.jbig.jbig ${this})

    add_dependencies(pvt::cppan::demo::mgk25::jbig::jbig-2.1 ${this})
    add_dependencies(pvt::cppan::demo::mgk25::jbig::jbig-2 ${this})
    add_dependencies(pvt::cppan::demo::mgk25::jbig::jbig ${this})

    add_dependencies(pvt.cppan.demo.mgk25.jbig.ar-2.1 ${this})
    add_dependencies(pvt.cppan.demo.mgk25.jbig.ar-2 ${this})
    add_dependencies(pvt.cppan.demo.mgk25.jbig.ar ${this})

    add_dependencies(pvt::cppan::demo::mgk25::jbig::ar-2.1 ${this})
    add_dependencies(pvt::cppan::demo::mgk25::jbig::ar-2 ${this})
    add_dependencies(pvt::cppan::demo::mgk25::jbig::ar ${this})

    add_dependencies(pvt.cppan.demo.png-1.6 ${this})
    add_dependencies(pvt.cppan.demo.png-1 ${this})
    add_dependencies(pvt.cppan.demo.png ${this})

    add_dependencies(pvt::cppan::demo::png-1.6 ${this})
    add_dependencies(pvt::cppan::demo::png-1 ${this})
    add_dependencies(pvt::cppan::demo::png ${this})

    add_dependencies(pvt.cppan.demo.malaterre.gdcm.gdcm-2.6 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.gdcm-2 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.gdcm ${this})

    add_dependencies(pvt::cppan::demo::malaterre::gdcm::gdcm-2.6 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::gdcm-2 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::gdcm ${this})

    add_dependencies(pvt.cppan.demo.openexr.ilmbase.imath-2.2 ${this})
    add_dependencies(pvt.cppan.demo.openexr.ilmbase.imath-2 ${this})
    add_dependencies(pvt.cppan.demo.openexr.ilmbase.imath ${this})

    add_dependencies(pvt::cppan::demo::openexr::ilmbase::imath-2.2 ${this})
    add_dependencies(pvt::cppan::demo::openexr::ilmbase::imath-2 ${this})
    add_dependencies(pvt::cppan::demo::openexr::ilmbase::imath ${this})

    add_dependencies(pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.jpeg16-2 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.jpeg16 ${this})

    add_dependencies(pvt::cppan::demo::malaterre::gdcm::jpeg16-2.6 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::jpeg16-2 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::jpeg16 ${this})

    add_dependencies(pvt.cppan.demo.malaterre.gdcm.socketxx-2.6 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.socketxx-2 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.socketxx ${this})

    add_dependencies(pvt::cppan::demo::malaterre::gdcm::socketxx-2.6 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::socketxx-2 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::socketxx ${this})

    add_dependencies(pvt.cppan.demo.malaterre.gdcm.rle-2.6 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.rle-2 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.rle ${this})

    add_dependencies(pvt::cppan::demo::malaterre::gdcm::rle-2.6 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::rle-2 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::rle ${this})

    add_dependencies(pvt.cppan.demo.expat-2.2 ${this})
    add_dependencies(pvt.cppan.demo.expat-2 ${this})
    add_dependencies(pvt.cppan.demo.expat ${this})

    add_dependencies(pvt::cppan::demo::expat-2.2 ${this})
    add_dependencies(pvt::cppan::demo::expat-2 ${this})
    add_dependencies(pvt::cppan::demo::expat ${this})

    add_dependencies(pvt.cppan.demo.vbaderks.charls-1.1 ${this})
    add_dependencies(pvt.cppan.demo.vbaderks.charls-1 ${this})
    add_dependencies(pvt.cppan.demo.vbaderks.charls ${this})

    add_dependencies(pvt::cppan::demo::vbaderks::charls-1.1 ${this})
    add_dependencies(pvt::cppan::demo::vbaderks::charls-1 ${this})
    add_dependencies(pvt::cppan::demo::vbaderks::charls ${this})

    add_dependencies(pvt.cppan.demo.json_c ${this})

    add_dependencies(pvt::cppan::demo::json_c ${this})

    add_dependencies(pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.jpeg12-2 ${this})
    add_dependencies(pvt.cppan.demo.malaterre.gdcm.jpeg12 ${this})

    add_dependencies(pvt::cppan::demo::malaterre::gdcm::jpeg12-2.6 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::jpeg12-2 ${this})
    add_dependencies(pvt::cppan::demo::malaterre::gdcm::jpeg12 ${this})

    add_dependencies(pvt.cppan.demo.openssl.crypto-1.10 ${this})
    add_dependencies(pvt.cppan.demo.openssl.crypto-1 ${this})
    add_dependencies(pvt.cppan.demo.openssl.crypto ${this})

    add_dependencies(pvt::cppan::demo::openssl::crypto-1.10 ${this})
    add_dependencies(pvt::cppan::demo::openssl::crypto-1 ${this})
    add_dependencies(pvt::cppan::demo::openssl::crypto ${this})

    add_dependencies(pvt.cppan.demo.openexr.ilmimf-2.2 ${this})
    add_dependencies(pvt.cppan.demo.openexr.ilmimf-2 ${this})
    add_dependencies(pvt.cppan.demo.openexr.ilmimf ${this})

    add_dependencies(pvt::cppan::demo::openexr::ilmimf-2.2 ${this})
    add_dependencies(pvt::cppan::demo::openexr::ilmimf-2 ${this})
    add_dependencies(pvt::cppan::demo::openexr::ilmimf ${this})

    add_dependencies(pvt.cppan.demo.openexr.ilmbase.half-2.2 ${this})
    add_dependencies(pvt.cppan.demo.openexr.ilmbase.half-2 ${this})
    add_dependencies(pvt.cppan.demo.openexr.ilmbase.half ${this})

    add_dependencies(pvt::cppan::demo::openexr::ilmbase::half-2.2 ${this})
    add_dependencies(pvt::cppan::demo::openexr::ilmbase::half-2 ${this})
    add_dependencies(pvt::cppan::demo::openexr::ilmbase::half ${this})
endif()

################################################################################
#
# copy dependencies
#
################################################################################

if (CPPAN_USE_CACHE)
    set(ext sh)
    if (WIN32)
        set(ext bat)
    endif()

    set(file ${BDIR}/cppan_copy_deps_$<CONFIG>.${ext})

    set(copy_content)
    if (WIN32)
        set(copy_content "${copy_content} @setlocal\n")
    else()
        set(copy_content "#!/bin/sh\n")
    endif()
    set(this cppan-d-c)

    set(output_dir ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    if (NOT output_dir)
        set(output_dir ${CMAKE_BINARY_DIR})
    endif()
    if (VISUAL_STUDIO OR XCODE)
        set(output_dir ${output_dir}/$<CONFIG>)
    endif()
    if (CPPAN_BUILD_OUTPUT_DIR)
        set(output_dir ${CPPAN_BUILD_OUTPUT_DIR})
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.webp-0.6.1
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.webp-0.6.1 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.webp-0.6.1> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.webp-0.6.1>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.webp-0.6.1)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.intel.opencv.highgui-3.4.1
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.intel.opencv.highgui-3.4.1 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.intel.opencv.highgui-3.4.1> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.intel.opencv.highgui-3.4.1>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.intel.opencv.highgui-3.4.1)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.mdadams.jasper-2.0.10
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.mdadams.jasper-2.0.10 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.mdadams.jasper-2.0.10> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.mdadams.jasper-2.0.10>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.mdadams.jasper-2.0.10)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.intel.opencv.imgproc-3.4.1
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.intel.opencv.imgproc-3.4.1 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.intel.opencv.imgproc-3.4.1> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.intel.opencv.imgproc-3.4.1>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.intel.opencv.imgproc-3.4.1)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.openexr.ilmbase.iex-2.2.0
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.openexr.ilmbase.iex-2.2.0 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.iex-2.2.0> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.openexr.ilmbase.iex-2.2.0>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.openexr.ilmbase.iex-2.2.0)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.jpeg-9.2.0
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.jpeg-9.2.0 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.jpeg-9.2.0> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.jpeg-9.2.0>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.jpeg-9.2.0)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.madler.zlib-1.2.11
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.madler.zlib-1.2.11 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.madler.zlib-1.2.11> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.madler.zlib-1.2.11>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.madler.zlib-1.2.11)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.intel.opencv.core-3.4.1
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.intel.opencv.core-3.4.1 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.intel.opencv.core-3.4.1> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.intel.opencv.core-3.4.1>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.intel.opencv.core-3.4.1)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.tiff-4.0.9
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.tiff-4.0.9 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.tiff-4.0.9> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.tiff-4.0.9>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.tiff-4.0.9)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.xz_utils.lzma-5.2.3
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.xz_utils.lzma-5.2.3 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.xz_utils.lzma-5.2.3> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.xz_utils.lzma-5.2.3>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.xz_utils.lzma-5.2.3)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.openjpeg.openjp2-2.3.0
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.openjpeg.openjp2-2.3.0 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.openjpeg.openjp2-2.3.0> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.openjpeg.openjp2-2.3.0>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.openjpeg.openjp2-2.3.0)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.mgk25.jbig.jbig-2.1.0
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.mgk25.jbig.jbig-2.1.0 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.mgk25.jbig.jbig-2.1.0> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.mgk25.jbig.jbig-2.1.0>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.mgk25.jbig.jbig-2.1.0)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.mgk25.jbig.ar-2.1.0
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.mgk25.jbig.ar-2.1.0 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.mgk25.jbig.ar-2.1.0> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.mgk25.jbig.ar-2.1.0>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.mgk25.jbig.ar-2.1.0)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.png-1.6.34
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.png-1.6.34 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.png-1.6.34> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.png-1.6.34>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.png-1.6.34)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.openexr.ilmbase.imath-2.2.0
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.openexr.ilmbase.imath-2.2.0 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.imath-2.2.0> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.openexr.ilmbase.imath-2.2.0>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.openexr.ilmbase.imath-2.2.0)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.malaterre.gdcm.rle-2.6.6
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.malaterre.gdcm.rle-2.6.6 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.rle-2.6.6> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.malaterre.gdcm.rle-2.6.6>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.malaterre.gdcm.rle-2.6.6)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.expat-2.2.5
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.expat-2.2.5 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.expat-2.2.5> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.expat-2.2.5>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.expat-2.2.5)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.vbaderks.charls-1.1.0
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.vbaderks.charls-1.1.0 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.vbaderks.charls-1.1.0> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.vbaderks.charls-1.1.0>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.vbaderks.charls-1.1.0)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.json_c-master
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.json_c-master TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.json_c-master> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.json_c-master>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.json_c-master)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.openssl.crypto-1.10.8
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.openssl.crypto-1.10.8 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.openssl.crypto-1.10.8> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.openssl.crypto-1.10.8>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.openssl.crypto-1.10.8)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.openexr.ilmimf-2.2.0
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.openexr.ilmimf-2.2.0 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.openexr.ilmimf-2.2.0> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.openexr.ilmimf-2.2.0>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.openexr.ilmimf-2.2.0)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    ################################################################################
    #
    # Copy pvt.cppan.demo.openexr.ilmbase.half-2.2.0
    #
    ################################################################################

    set(copy 1)
    get_target_property(type pvt.cppan.demo.openexr.ilmbase.half-2.2.0 TYPE)
    if ("${type}" STREQUAL STATIC_LIBRARY)
        set(copy 0)
    endif()

    if (CPPAN_COPY_ALL_LIBRARIES_TO_OUTPUT)
        set(copy 1)
    endif()

    if (copy)
        set(copy_content "${copy_content} @")
        set(copy_content "${copy_content} \"${CMAKE_COMMAND}\" -E copy_if_different $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.half-2.2.0> ${output_dir}//$<TARGET_FILE_NAME:pvt.cppan.demo.openexr.ilmbase.half-2.2.0>\n")
        add_dependencies(cppan-d-c pvt.cppan.demo.openexr.ilmbase.half-2.2.0)
        if (WIN32)
            set(copy_content "${copy_content} @if %errorlevel% neq 0 goto :cmEnd\n")
        endif()
    endif()

    if (WIN32)
        set(copy_content "${copy_content}\n
@exit /b 0
:cmEnd
@endlocal & @call :cmErrorLevel %errorlevel%
:cmErrorLevel
@exit /b %1
")
    endif()
    
file(GENERATE OUTPUT ${file} CONTENT "${copy_content}
")
if (UNIX)
    set(file chmod u+x ${file} COMMAND ${file})
endif()
add_custom_command(TARGET cppan-d-c POST_BUILD
    COMMAND ${file}
)

    if (NINJA)
        get_target_property(imploc_pvt_cppan_demo_webp_0_6_1 pvt.cppan.demo.webp-0.6.1 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_intel_opencv_highgui_3_4_1 pvt.cppan.demo.intel.opencv.highgui-3.4.1 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_intel_opencv_imgcodecs_3_4_1 pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_jpeg8_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_mdadams_jasper_2_0_10 pvt.cppan.demo.mdadams.jasper-2.0.10 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_intel_opencv_imgproc_3_4_1 pvt.cppan.demo.intel.opencv.imgproc-3.4.1 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_openexr_ilmbase_iex_2_2_0 pvt.cppan.demo.openexr.ilmbase.iex-2.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_jpeg_9_2_0 pvt.cppan.demo.jpeg-9.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_openexr_ilmbase_ilmthread_2_2_0 pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_madler_zlib_1_2_11 pvt.cppan.demo.madler.zlib-1.2.11 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_intel_opencv_core_3_4_1 pvt.cppan.demo.intel.opencv.core-3.4.1 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_tiff_4_0_9 pvt.cppan.demo.tiff-4.0.9 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_xz_utils_lzma_5_2_3 pvt.cppan.demo.xz_utils.lzma-5.2.3 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_openjpeg_openjp2_2_3_0 pvt.cppan.demo.openjpeg.openjp2-2.3.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_mgk25_jbig_jbig_2_1_0 pvt.cppan.demo.mgk25.jbig.jbig-2.1.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_mgk25_jbig_ar_2_1_0 pvt.cppan.demo.mgk25.jbig.ar-2.1.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_png_1_6_34 pvt.cppan.demo.png-1.6.34 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_gdcm_2_6_6 pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_openexr_ilmbase_imath_2_2_0 pvt.cppan.demo.openexr.ilmbase.imath-2.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_jpeg16_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_socketxx_2_6_6 pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_rle_2_6_6 pvt.cppan.demo.malaterre.gdcm.rle-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_expat_2_2_5 pvt.cppan.demo.expat-2.2.5 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_vbaderks_charls_1_1_0 pvt.cppan.demo.vbaderks.charls-1.1.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_json_c_master pvt.cppan.demo.json_c-master IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_malaterre_gdcm_jpeg12_2_6_6 pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_openssl_crypto_1_10_8 pvt.cppan.demo.openssl.crypto-1.10.8 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_openexr_ilmimf_2_2_0 pvt.cppan.demo.openexr.ilmimf-2.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})
        get_target_property(imploc_pvt_cppan_demo_openexr_ilmbase_half_2_2_0 pvt.cppan.demo.openexr.ilmbase.half-2.2.0 IMPORTED_LOCATION_${CMAKE_BUILD_TYPE_UPPER})

        set(bp)
        set(bp ${bp} ${imploc_pvt_cppan_demo_webp_0_6_1})
        set(bp ${bp} ${imploc_pvt_cppan_demo_intel_opencv_highgui_3_4_1})
        set(bp ${bp} ${imploc_pvt_cppan_demo_intel_opencv_imgcodecs_3_4_1})
        set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_jpeg8_2_6_6})
        set(bp ${bp} ${imploc_pvt_cppan_demo_mdadams_jasper_2_0_10})
        set(bp ${bp} ${imploc_pvt_cppan_demo_intel_opencv_imgproc_3_4_1})
        set(bp ${bp} ${imploc_pvt_cppan_demo_openexr_ilmbase_iex_2_2_0})
        set(bp ${bp} ${imploc_pvt_cppan_demo_jpeg_9_2_0})
        set(bp ${bp} ${imploc_pvt_cppan_demo_openexr_ilmbase_ilmthread_2_2_0})
        set(bp ${bp} ${imploc_pvt_cppan_demo_madler_zlib_1_2_11})
        set(bp ${bp} ${imploc_pvt_cppan_demo_intel_opencv_core_3_4_1})
        set(bp ${bp} ${imploc_pvt_cppan_demo_tiff_4_0_9})
        set(bp ${bp} ${imploc_pvt_cppan_demo_xz_utils_lzma_5_2_3})
        set(bp ${bp} ${imploc_pvt_cppan_demo_openjpeg_openjp2_2_3_0})
        set(bp ${bp} ${imploc_pvt_cppan_demo_mgk25_jbig_jbig_2_1_0})
        set(bp ${bp} ${imploc_pvt_cppan_demo_mgk25_jbig_ar_2_1_0})
        set(bp ${bp} ${imploc_pvt_cppan_demo_png_1_6_34})
        set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_gdcm_2_6_6})
        set(bp ${bp} ${imploc_pvt_cppan_demo_openexr_ilmbase_imath_2_2_0})
        set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_jpeg16_2_6_6})
        set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_socketxx_2_6_6})
        set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_rle_2_6_6})
        set(bp ${bp} ${imploc_pvt_cppan_demo_expat_2_2_5})
        set(bp ${bp} ${imploc_pvt_cppan_demo_vbaderks_charls_1_1_0})
        set(bp ${bp} ${imploc_pvt_cppan_demo_json_c_master})
        set(bp ${bp} ${imploc_pvt_cppan_demo_malaterre_gdcm_jpeg12_2_6_6})
        set(bp ${bp} ${imploc_pvt_cppan_demo_openssl_crypto_1_10_8})
        set(bp ${bp} ${imploc_pvt_cppan_demo_openexr_ilmimf_2_2_0})
        set(bp ${bp} ${imploc_pvt_cppan_demo_openexr_ilmbase_half_2_2_0})

        add_custom_target(${this}-d
            COMMAND ${file}
            BYPRODUCTS ${bp}
        )
        add_dependencies(${this} ${this}-d)
        set_target_properties(${this}-d PROPERTIES FOLDER "CPPAN Targets/Service")
    endif()
endif()

################################################################################
#
# local project groups
#
################################################################################

if (CPPAN_HIDE_LOCAL_DEPENDENCIES)
endif()

################################################################################
#
# install
#
################################################################################

get_target_property(type pvt.cppan.demo.webp-0.6.1 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.webp-0.6.1> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.webp-0.6.1> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.webp-0.6.1> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.intel.opencv.highgui-3.4.1 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.intel.opencv.highgui-3.4.1> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.intel.opencv.highgui-3.4.1> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.intel.opencv.highgui-3.4.1> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.intel.opencv.imgcodecs-3.4.1> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg8-2.6.6> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.mdadams.jasper-2.0.10 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.mdadams.jasper-2.0.10> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.mdadams.jasper-2.0.10> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.mdadams.jasper-2.0.10> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.intel.opencv.imgproc-3.4.1 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.intel.opencv.imgproc-3.4.1> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.intel.opencv.imgproc-3.4.1> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.intel.opencv.imgproc-3.4.1> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.openexr.ilmbase.iex-2.2.0 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.iex-2.2.0> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.iex-2.2.0> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.openexr.ilmbase.iex-2.2.0> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.jpeg-9.2.0 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.jpeg-9.2.0> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.jpeg-9.2.0> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.jpeg-9.2.0> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.openexr.ilmbase.ilmthread-2.2.0> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.madler.zlib-1.2.11 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.madler.zlib-1.2.11> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.madler.zlib-1.2.11> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.madler.zlib-1.2.11> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.intel.opencv.core-3.4.1 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.intel.opencv.core-3.4.1> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.intel.opencv.core-3.4.1> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.intel.opencv.core-3.4.1> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.tiff-4.0.9 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.tiff-4.0.9> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.tiff-4.0.9> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.tiff-4.0.9> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.xz_utils.lzma-5.2.3 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.xz_utils.lzma-5.2.3> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.xz_utils.lzma-5.2.3> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.xz_utils.lzma-5.2.3> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.openjpeg.openjp2-2.3.0 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openjpeg.openjp2-2.3.0> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openjpeg.openjp2-2.3.0> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.openjpeg.openjp2-2.3.0> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.mgk25.jbig.jbig-2.1.0 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.mgk25.jbig.jbig-2.1.0> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.mgk25.jbig.jbig-2.1.0> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.mgk25.jbig.jbig-2.1.0> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.mgk25.jbig.ar-2.1.0 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.mgk25.jbig.ar-2.1.0> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.mgk25.jbig.ar-2.1.0> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.mgk25.jbig.ar-2.1.0> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.png-1.6.34 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.png-1.6.34> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.png-1.6.34> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.png-1.6.34> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.malaterre.gdcm.gdcm-2.6.6> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.openexr.ilmbase.imath-2.2.0 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.imath-2.2.0> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.imath-2.2.0> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.openexr.ilmbase.imath-2.2.0> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg16-2.6.6> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.malaterre.gdcm.socketxx-2.6.6> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.malaterre.gdcm.rle-2.6.6 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.rle-2.6.6> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.rle-2.6.6> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.malaterre.gdcm.rle-2.6.6> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.expat-2.2.5 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.expat-2.2.5> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.expat-2.2.5> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.expat-2.2.5> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.vbaderks.charls-1.1.0 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.vbaderks.charls-1.1.0> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.vbaderks.charls-1.1.0> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.vbaderks.charls-1.1.0> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.json_c-master TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.json_c-master> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.json_c-master> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.json_c-master> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.malaterre.gdcm.jpeg12-2.6.6> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.openssl.crypto-1.10.8 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openssl.crypto-1.10.8> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openssl.crypto-1.10.8> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.openssl.crypto-1.10.8> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.openexr.ilmimf-2.2.0 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openexr.ilmimf-2.2.0> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openexr.ilmimf-2.2.0> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.openexr.ilmimf-2.2.0> DESTINATION lib)
endif()

get_target_property(type pvt.cppan.demo.openexr.ilmbase.half-2.2.0 TYPE)
if ("${type}" STREQUAL STATIC_LIBRARY)
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.half-2.2.0> DESTINATION lib)
else()
    install(FILES $<TARGET_FILE:pvt.cppan.demo.openexr.ilmbase.half-2.2.0> DESTINATION bin)
    install(FILES $<TARGET_LINKER_FILE:pvt.cppan.demo.openexr.ilmbase.half-2.2.0> DESTINATION lib)
endif()

