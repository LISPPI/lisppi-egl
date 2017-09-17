(in-package #:dx)
;;==============================================================================
;;
;; Keep hacking...
 

;;------------------------------------------------------------------------------
;; (/opt/vc/include/bcm_host.h:48:10)
;;
(declaim (inline &get-sdram-address))
(defcfun ("bcm_host_get_sdram_address" &get-sdram-address) :UINT
  "see: (/opt/vc/include/bcm_host.h:48:10)"
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/bcm_host.h:47:10)
;;
(declaim (inline &get-peripheral-size))
(defcfun ("bcm_host_get_peripheral_size" &get-peripheral-size) :UINT
  "see: (/opt/vc/include/bcm_host.h:47:10)"
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/bcm_host.h:46:10)
;;
(declaim (inline &get-peripheral-address))
(defcfun ("bcm_host_get_peripheral_address" &get-peripheral-address) :UINT
  "see: (/opt/vc/include/bcm_host.h:46:10)"
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/bcm_host.h:42:9)
;;
(declaim (inline &display-size))
(defcfun ("graphics_get_display_size" &display-size) :INT
  "see: (/opt/vc/include/bcm_host.h:42:9)"
  (display-number  :USHORT) ;; display_number
  (width  (:pointer :UINT)) ;; width
  (height  (:pointer :UINT)) ;; height
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/bcm_host.h:40:6)
;;
(declaim (inline &deinit))
(defcfun ("bcm_host_deinit" &deinit) :VOID
  "see: (/opt/vc/include/bcm_host.h:40:6)"
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/bcm_host.h:39:6)
;;
(declaim (inline &init))
(defcfun ("bcm_host_init" &init) :VOID
  "see: (/opt/vc/include/bcm_host.h:39:6)"
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:136:22)
;;
(declaim (inline &vsync-callback))
(defcfun ("vc_dispmanx_vsync_callback" &vsync-callback) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:136:22)"
  (display  :UINT) ;; display
  (cb-func  :POINTER) ;; cb_func
  (cb-arg  (:pointer :VOID)) ;; cb_arg
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:132:22)
;;
(declaim (inline &resource-set-palette))
(defcfun ("vc_dispmanx_resource_set_palette" &resource-set-palette) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:132:22)"
  (handle  :UINT) ;; handle
  (src-address  (:pointer :VOID)) ;; src_address
  (offset  :INT) ;; offset
  (size  :INT) ;; size
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx_types.h:73:9)
;;
(defcenum transform ;; DISPMANX_TRANSFORM
  (:no-rotate #x0) ;;DISPMANX_NO_ROTATE
  (:rotate-90 #x1) ;;DISPMANX_ROTATE_90
  (:rotate-180 #x2) ;;DISPMANX_ROTATE_180
  (:rotate-270 #x3) ;;DISPMANX_ROTATE_270
  (:flip-hriz #x10000) ;;DISPMANX_FLIP_HRIZ
  (:flip-vert #x20000) ;;DISPMANX_FLIP_VERT
  (:stereoscopic-invert #x80000) ;;DISPMANX_STEREOSCOPIC_INVERT
  (:stereoscopic-none #x0) ;;DISPMANX_STEREOSCOPIC_NONE
  (:stereoscopic-mono #x100000) ;;DISPMANX_STEREOSCOPIC_MONO
  (:stereoscopic-sbs #x200000) ;;DISPMANX_STEREOSCOPIC_SBS
  (:stereoscopic-tb #x300000) ;;DISPMANX_STEREOSCOPIC_TB
  (:stereoscopic-mask #xF00000) ;;DISPMANX_STEREOSCOPIC_MASK
  (:snapshot-no-yuv #x1000000) ;;DISPMANX_SNAPSHOT_NO_YUV
  (:snapshot-no-rgb #x2000000) ;;DISPMANX_SNAPSHOT_NO_RGB
  (:snapshot-fill #x4000000) ;;DISPMANX_SNAPSHOT_FILL
  (:snapshot-swap-red-blue #x8000000) ;;DISPMANX_SNAPSHOT_SWAP_RED_BLUE
  (:snapshot-pack #x10000000) ;;DISPMANX_SNAPSHOT_PACK
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:127:22)
;;
(declaim (inline &snapshot))
(defcfun ("vc_dispmanx_snapshot" &snapshot) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:127:22)"
  (display  :UINT) ;; display
  (snapshot-resource  :UINT) ;; snapshot_resource
  (transform  transform) ;; transform
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:119:27)
;;
(declaim (inline &resource-get-image-handle))
(defcfun ("vc_dispmanx_resource_get_image_handle" &resource-get-image-handle) :UINT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:119:27)"
  (res  :UINT) ;; res
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vctypes/vc_image_types.h:39:16)
;;
(defcstruct rect ;; tag_VC_RECT
  (x  :INT) ;; x
  (y  :INT) ;; y
  (width  :INT) ;; width
  (height  :INT) ;; height
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:108:22)
;;
(declaim (inline &element-change-attributes))
(defcfun ("vc_dispmanx_element_change_attributes" &element-change-attributes) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:108:22)"
  (update  :UINT) ;; update
  (element  :UINT) ;; element
  (change-flags  :UINT) ;; change_flags
  (layer  :INT) ;; layer
  (opacity  :UCHAR) ;; opacity
  (dest-rect  (:pointer (:struct rect))) ;; dest_rect
  (src-rect  (:pointer (:struct rect))) ;; src_rect
  (mask  :UINT) ;; mask
  (transform  transform) ;; transform
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:105:22)
;;
(declaim (inline &query-image-formats))
(defcfun ("vc_dispmanx_query_image_formats" &query-image-formats) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:105:22)"
  (supported-formats  (:pointer :UINT)) ;; supported_formats
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:103:22)
;;
(declaim (inline &update-submit-sync))
(defcfun ("vc_dispmanx_update_submit_sync" &update-submit-sync) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:103:22)"
  (update  :UINT) ;; update
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:101:22)
;;
(declaim (inline &update-submit))
(defcfun ("vc_dispmanx_update_submit" &update-submit) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:101:22)"
  (update  :UINT) ;; update
  (cb-func  :POINTER) ;; cb_func
  (cb-arg  (:pointer :VOID)) ;; cb_arg
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:99:22)
;;
(declaim (inline &element-remove))
(defcfun ("vc_dispmanx_element_remove" &element-remove) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:99:22)"
  (update  :UINT) ;; update
  (element  :UINT) ;; element
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:97:22)
;;
(declaim (inline &element-modified))
(defcfun ("vc_dispmanx_element_modified" &element-modified) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:97:22)"
  (update  :UINT) ;; update
  (element  :UINT) ;; element
  (rect  (:pointer (:struct rect))) ;; rect
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:94:22)
;;
(declaim (inline &element-change-layer))
(defcfun ("vc_dispmanx_element_change_layer" &element-change-layer) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:94:22)"
  (update  :UINT) ;; update
  (element  :UINT) ;; element
  (layer  :INT) ;; layer
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:91:22)
;;
(declaim (inline &element-change-source))
(defcfun ("vc_dispmanx_element_change_source" &element-change-source) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:91:22)"
  (update  :UINT) ;; update
  (element  :UINT) ;; element
  (src  :UINT) ;; src
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx_types.h:100:9)
;;
(defcenum flags-alpha ;; DISPMANX_FLAGS_ALPHA
  (:alpha-from-source #x0) ;;DISPMANX_FLAGS_ALPHA_FROM_SOURCE
  (:alpha-fixed-all-pixels #x1) ;;DISPMANX_FLAGS_ALPHA_FIXED_ALL_PIXELS
  (:alpha-fixed-non-zero #x2) ;;DISPMANX_FLAGS_ALPHA_FIXED_NON_ZERO
  (:alpha-fixed-exceed-0x07 #x3) ;;DISPMANX_FLAGS_ALPHA_FIXED_EXCEED_0X07
  (:alpha-premult #x10000) ;;DISPMANX_FLAGS_ALPHA_PREMULT
  (:alpha-mix #x20000) ;;DISPMANX_FLAGS_ALPHA_MIX
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx_types.h:117:9)
;;
(defcstruct alpha ;; VC_DISPMANX_ALPHA
  (flags  flags-alpha) ;; flags
  (opacity  :UINT) ;; opacity
  (mask  :UINT) ;; mask
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx_types.h:123:9)
;;
(defcenum flags-clamp ;; DISPMANX_FLAGS_CLAMP
  (:clamp-none #x0) ;;DISPMANX_FLAGS_CLAMP_NONE
  (:clamp-luma-transparent #x1) ;;DISPMANX_FLAGS_CLAMP_LUMA_TRANSPARENT
  (:clamp-chroma-transparent #x2) ;;DISPMANX_FLAGS_CLAMP_CHROMA_TRANSPARENT
  (:clamp-transparent #x3) ;;DISPMANX_FLAGS_CLAMP_TRANSPARENT
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx_types.h:135:9)
;;
(defcenum flags-keymask ;; DISPMANX_FLAGS_KEYMASK
  (:keymask-override #x1) ;;DISPMANX_FLAGS_KEYMASK_OVERRIDE
  (:keymask-smooth #x2) ;;DISPMANX_FLAGS_KEYMASK_SMOOTH
  (:keymask-cr-inv #x4) ;;DISPMANX_FLAGS_KEYMASK_CR_INV
  (:keymask-cb-inv #x8) ;;DISPMANX_FLAGS_KEYMASK_CB_INV
  (:keymask-yy-inv #x10) ;;DISPMANX_FLAGS_KEYMASK_YY_INV
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx_types.h:144:3)
;;
(defcstruct yuv ;; s_yuv
  (yy-upper  :UCHAR) ;; yy_upper
  (yy-lower  :UCHAR) ;; yy_lower
  (cr-upper  :UCHAR) ;; cr_upper
  (cr-lower  :UCHAR) ;; cr_lower
  (cb-upper  :UCHAR) ;; cb_upper
  (cb-lower  :UCHAR) ;; cb_lower
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx_types.h:152:3)
;;
(defcstruct rgb ;; s_rgb
  (red-upper  :UCHAR) ;; red_upper
  (red-lower  :UCHAR) ;; red_lower
  (blue-upper  :UCHAR) ;; blue_upper
  (blue-lower  :UCHAR) ;; blue_lower
  (green-upper  :UCHAR) ;; green_upper
  (green-lower  :UCHAR) ;; green_lower
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx_types.h:143:9)
;;
(defcunion clamp-keys ;; DISPMANX_CLAMP_KEYS
  (yuv  (:struct yuv)) ;; yuv
  (rgb  (:struct rgb)) ;; rgb
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx_types.h:162:9)
;;
(defcstruct clamp ;; DISPMANX_CLAMP
  (mode  flags-clamp) ;; mode
  (key-mask  flags-keymask) ;; key_mask
  (key-value  (:union clamp-keys)) ;; key_value
  (replace-value  :UINT) ;; replace_value
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:85:44)
;;
(declaim (inline &element-add))
(defcfun ("vc_dispmanx_element_add" &element-add) :UINT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:85:44)"
  (update  :UINT) ;; update
  (display  :UINT) ;; display
  (layer  :INT) ;; layer
  (dest-rect  (:pointer (:struct rect))) ;; dest_rect
  (src  :UINT) ;; src
  (src-rect  (:pointer (:struct rect))) ;; src_rect
  (protection  :UINT) ;; protection
  (alpha  (:pointer (:struct alpha))) ;; alpha
  (clamp  (:pointer (:struct clamp))) ;; clamp
  (transform  transform) ;; transform
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:83:43)
;;
(declaim (inline &update-start))
(defcfun ("vc_dispmanx_update_start" &update-start) :UINT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:83:43)"
  (priority  :INT) ;; priority
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:79:22)
;;
(declaim (inline &display-close))
(defcfun ("vc_dispmanx_display_close" &display-close) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:79:22)"
  (display  :UINT) ;; display
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vctypes/vc_display_types.h:36:9)
;;
(defcenum display-input-format ;; VCOS_DISPLAY_INPUT_FORMAT
  (:format-invalid #x0) ;;VCOS_DISPLAY_INPUT_FORMAT_INVALID
  (:format-rgb888 #x1) ;;VCOS_DISPLAY_INPUT_FORMAT_RGB888
  (:format-rgb565 #x2) ;;VCOS_DISPLAY_INPUT_FORMAT_RGB565
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx_types.h:169:9)
;;
(defcstruct modeinfo ;; DISPMANX_MODEINFO
  (width  :INT) ;; width
  (height  :INT) ;; height
  (transform  transform) ;; transform
  (input-format  display-input-format) ;; input_format
  (display-num  :UINT) ;; display_num
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:77:22)
;;
(declaim (inline &display-get-info))
(defcfun ("vc_dispmanx_display_get_info" &display-get-info) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:77:22)"
  (display  :UINT) ;; display
  (pinfo  (:pointer (:struct modeinfo))) ;; pinfo
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:74:22)
;;
(declaim (inline &display-set-background))
(defcfun ("vc_dispmanx_display_set_background" &display-set-background) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:74:22)"
  (update  :UINT) ;; update
  (display  :UINT) ;; display
  (red  :UCHAR) ;; red
  (green  :UCHAR) ;; green
  (blue  :UCHAR) ;; blue
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:72:22)
;;
(declaim (inline &display-set-destination))
(defcfun ("vc_dispmanx_display_set_destination" &display-set-destination) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:72:22)"
  (display  :UINT) ;; display
  (dest  :UINT) ;; dest
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:70:22)
;;
(declaim (inline &display-reconfigure))
(defcfun ("vc_dispmanx_display_reconfigure" &display-reconfigure) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:70:22)"
  (display  :UINT) ;; display
  (mode  :UINT) ;; mode
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:68:44)
;;
(declaim (inline &display-open-offscreen))
(defcfun ("vc_dispmanx_display_open_offscreen" &display-open-offscreen) :UINT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:68:44)"
  (dest  :UINT) ;; dest
  (orientation  transform) ;; orientation
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:66:44)
;;
(declaim (inline &display-open-mode))
(defcfun ("vc_dispmanx_display_open_mode" &display-open-mode) :UINT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:66:44)"
  (device  :UINT) ;; device
  (mode  :UINT) ;; mode
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:64:44)
;;
(declaim (inline &display-open))
(defcfun ("vc_dispmanx_display_open" &display-open) :UINT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:64:44)"
  (device  :UINT) ;; device
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:60:22)
;;
(declaim (inline &resource-delete))
(defcfun ("vc_dispmanx_resource_delete" &resource-delete) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:60:22)"
  (res  :UINT) ;; res
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:54:22)
;;
(declaim (inline &resource-read-data))
(defcfun ("vc_dispmanx_resource_read_data" &resource-read-data) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:54:22)"
  (handle  :UINT) ;; handle
  (p-rect  (:pointer (:struct rect))) ;; p_rect
  (dst-address  (:pointer :VOID)) ;; dst_address
  (dst-pitch  :UINT) ;; dst_pitch
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vctypes/vc_image_types.h:54:9)
;;
(defcenum image-type ;; VC_IMAGE_TYPE
  (:min #x0) ;;VC_IMAGE_MIN
  (:rgb565 #x1) ;;VC_IMAGE_RGB565
  (:1bpp #x2) ;;VC_IMAGE_1BPP
  (:yuv420 #x3) ;;VC_IMAGE_YUV420
  (:48bpp #x4) ;;VC_IMAGE_48BPP
  (:rgb888 #x5) ;;VC_IMAGE_RGB888
  (:8bpp #x6) ;;VC_IMAGE_8BPP
  (:4bpp #x7) ;;VC_IMAGE_4BPP
  (:3d32 #x8) ;;VC_IMAGE_3D32
  (:3d32b #x9) ;;VC_IMAGE_3D32B
  (:3d32mat #xA) ;;VC_IMAGE_3D32MAT
  (:rgb2x9 #xB) ;;VC_IMAGE_RGB2X9
  (:rgb666 #xC) ;;VC_IMAGE_RGB666
  (:pal4-obsolete #xD) ;;VC_IMAGE_PAL4_OBSOLETE
  (:pal8-obsolete #xE) ;;VC_IMAGE_PAL8_OBSOLETE
  (:rgba32 #xF) ;;VC_IMAGE_RGBA32
  (:yuv422 #x10) ;;VC_IMAGE_YUV422
  (:rgba565 #x11) ;;VC_IMAGE_RGBA565
  (:rgba16 #x12) ;;VC_IMAGE_RGBA16
  (:yuv-uv #x13) ;;VC_IMAGE_YUV_UV
  (:tf-rgba32 #x14) ;;VC_IMAGE_TF_RGBA32
  (:tf-rgbx32 #x15) ;;VC_IMAGE_TF_RGBX32
  (:tf-float #x16) ;;VC_IMAGE_TF_FLOAT
  (:tf-rgba16 #x17) ;;VC_IMAGE_TF_RGBA16
  (:tf-rgba5551 #x18) ;;VC_IMAGE_TF_RGBA5551
  (:tf-rgb565 #x19) ;;VC_IMAGE_TF_RGB565
  (:tf-ya88 #x1A) ;;VC_IMAGE_TF_YA88
  (:tf-byte #x1B) ;;VC_IMAGE_TF_BYTE
  (:tf-pal8 #x1C) ;;VC_IMAGE_TF_PAL8
  (:tf-pal4 #x1D) ;;VC_IMAGE_TF_PAL4
  (:tf-etc1 #x1E) ;;VC_IMAGE_TF_ETC1
  (:bgr888 #x1F) ;;VC_IMAGE_BGR888
  (:bgr888-np #x20) ;;VC_IMAGE_BGR888_NP
  (:bayer #x21) ;;VC_IMAGE_BAYER
  (:codec #x22) ;;VC_IMAGE_CODEC
  (:yuv-uv32 #x23) ;;VC_IMAGE_YUV_UV32
  (:tf-y8 #x24) ;;VC_IMAGE_TF_Y8
  (:tf-a8 #x25) ;;VC_IMAGE_TF_A8
  (:tf-short #x26) ;;VC_IMAGE_TF_SHORT
  (:tf-1bpp #x27) ;;VC_IMAGE_TF_1BPP
  (:opengl #x28) ;;VC_IMAGE_OPENGL
  (:yuv444i #x29) ;;VC_IMAGE_YUV444I
  (:yuv422planar #x2A) ;;VC_IMAGE_YUV422PLANAR
  (:argb8888 #x2B) ;;VC_IMAGE_ARGB8888
  (:xrgb8888 #x2C) ;;VC_IMAGE_XRGB8888
  (:yuv422yuyv #x2D) ;;VC_IMAGE_YUV422YUYV
  (:yuv422yvyu #x2E) ;;VC_IMAGE_YUV422YVYU
  (:yuv422uyvy #x2F) ;;VC_IMAGE_YUV422UYVY
  (:yuv422vyuy #x30) ;;VC_IMAGE_YUV422VYUY
  (:rgbx32 #x31) ;;VC_IMAGE_RGBX32
  (:rgbx8888 #x32) ;;VC_IMAGE_RGBX8888
  (:bgrx8888 #x33) ;;VC_IMAGE_BGRX8888
  (:yuv420sp #x34) ;;VC_IMAGE_YUV420SP
  (:yuv444planar #x35) ;;VC_IMAGE_YUV444PLANAR
  (:tf-u8 #x36) ;;VC_IMAGE_TF_U8
  (:tf-v8 #x37) ;;VC_IMAGE_TF_V8
  (:max #x38) ;;VC_IMAGE_MAX
  (:force-enum-16bit #xFFFF) ;;VC_IMAGE_FORCE_ENUM_16BIT
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:53:22)
;;
(declaim (inline &resource-write-data-handle))
(defcfun ("vc_dispmanx_resource_write_data_handle" &resource-write-data-handle) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:53:22)"
  (res  :UINT) ;; res
  (src-type  image-type) ;; src_type
  (src-pitch  :INT) ;; src_pitch
  (handle  :INT) ;; handle
  (offset  :UINT) ;; offset
  (rect  (:pointer (:struct rect))) ;; rect
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:52:22)
;;
(declaim (inline &resource-write-data))
(defcfun ("vc_dispmanx_resource_write_data" &resource-write-data) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:52:22)"
  (res  :UINT) ;; res
  (src-type  image-type) ;; src_type
  (src-pitch  :INT) ;; src_pitch
  (src-address  (:pointer :VOID)) ;; src_address
  (rect  (:pointer (:struct rect))) ;; rect
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:50:45)
;;
(declaim (inline &resource-create))
(defcfun ("vc_dispmanx_resource_create" &resource-create) :UINT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:50:45)"
  (type  image-type) ;; type
  (width  :UINT) ;; width
  (height  :UINT) ;; height
  (native-image-handle  (:pointer :UINT)) ;; native_image_handle
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:47:22)
;;
(declaim (inline &rect-set))
(defcfun ("vc_dispmanx_rect_set" &rect-set) :INT
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:47:22)"
  (rect  (:pointer (:struct rect))) ;; rect
  (x-offset  :UINT) ;; x_offset
  (y-offset  :UINT) ;; y_offset
  (width  :UINT) ;; width
  (height  :UINT) ;; height
)
;;------------------------------------------------------------------------------
;; (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:45:23)
;;
(declaim (inline &stop))
(defcfun ("vc_dispmanx_stop" &stop) :VOID
  "see: (/opt/vc/include/interface/vmcs_host/vc_dispmanx.h:45:23)"
)
(defparameter CHANGE-LAYER 1)
(defparameter CHANGE-OPACITY 2)
(defparameter CHANGE-DEST-RECT 4)
(defparameter CHANGE-SRC-RECT 8)
(defparameter CHANGE-MASK-RES #x10)
(defparameter CHANGE-TRANSFORM #x20)
(export '(change-layer change-opacity change-dest-rect change-src-rect change-mask-res change-transform))
