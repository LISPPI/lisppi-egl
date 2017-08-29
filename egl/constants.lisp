(defpackage #:egl-
  (:use #:cl)
  (:shadow #:read))

(in-package :egl)

(defparameter default-display 0) ;; 
(defparameter no-context (null-pointer))	;;
(export 'no-context)
(defparameter no-display 0) ;; 
(defparameter no-surface (null-pointer)) ;;
(export 'no-surface)
(defparameter dont-care -1) ;;

(defparameter success #x3000) ;; 
(export 'success)
(defparameter not-initialized #x3001) ;; 
(export 'not-initialized)
(defparameter bad-access #x3002) ;; 
(export 'bad-access)
(defparameter bad-alloc #x3003) ;; 
(export 'bad-alloc)
(defparameter bad-attribute #x3004) ;; 
(export 'bad-attribute)
(defparameter bad-config #x3005) ;; 
(export 'bad-config)
(defparameter bad-context #x3006) ;; 
(export 'bad-context)
(defparameter bad-current-surface #x3007) ;; 
(export 'bad-current-surface)
(defparameter bad-display #x3008) ;; 
(export 'bad-display)
(defparameter bad-match #x3009) ;; 
(export 'bad-match)
(defparameter bad-native-pixmap #x300A) ;; 
(export 'bad-native-pixmap)
(defparameter bad-native-window #x300B) ;; 
(export 'bad-native-window)
(defparameter bad-parameter #x300C) ;; 
(export 'bad-parameter)
(defparameter bad-surface #x300D) ;; 
(export 'bad-surface)
(defparameter context-lost #x300E) ;; 	/* EGL 1.1 - IMG_power_management */
(export 'context-lost)
(defparameter buffer-size #x3020) ;; 
(export 'buffer-size)
(defparameter alpha-size #x3021) ;; 
(export 'alpha-size)
(defparameter blue-size #x3022) ;; 
(export 'blue-size)
(defparameter green-size #x3023) ;; 
(export 'green-size)
(defparameter red-size #x3024) ;; 
(export 'red-size)
(defparameter depth-size #x3025) ;; 
(export 'depth-size)
(defparameter stencil-size #x3026) ;; 
(export 'stencil-size)
(defparameter config-caveat #x3027) ;; 
(export 'config-caveat)
(defparameter config-id #x3028) ;; 
(export 'config-id)
(defparameter level #x3029) ;; 
(export 'level)
(defparameter max-pbuffer-height #x302A) ;; 
(export 'max-pbuffer-height)
(defparameter max-pbuffer-pixels #x302B) ;; 
(export 'max-pbuffer-pixels)
(defparameter max-pbuffer-width #x302C) ;; 
(export 'max-pbuffer-width)
(defparameter native-renderable #x302D) ;; 
(export 'native-renderable)
(defparameter native-visual-id #x302E) ;; 
(export 'native-visual-id)
(defparameter native-visual-type #x302F) ;; 
(export 'native-visual-type)
(defparameter samples #x3031) ;; 
(export 'samples)
(defparameter sample-buffers #x3032) ;; 
(export 'sample-buffers)
(defparameter surface-type #x3033) ;; 
(export 'surface-type)
(defparameter transparent-type #x3034) ;; 
(export 'transparent-type)
(defparameter transparent-blue-value #x3035) ;; 
(export 'transparent-blue-value)
(defparameter transparent-green-value #x3036) ;; 
(export 'transparent-green-value)
(defparameter transparent-red-value #x3037) ;; 
(export 'transparent-red-value)
(defparameter none #x3038) ;; 	/* Attrib list terminator */
(export 'none)
(defparameter bind-to-texture-rgb #x3039) ;; 
(export 'bind-to-texture-rgb)
(defparameter bind-to-texture-rgba #x303A) ;; 
(export 'bind-to-texture-rgba)
(defparameter min-swap-interval #x303B) ;; 
(export 'min-swap-interval)
(defparameter max-swap-interval #x303C) ;; 
(export 'max-swap-interval)
(defparameter luminance-size #x303D) ;; 
(export 'luminance-size)
(defparameter alpha-mask-size #x303E) ;; 
(export 'alpha-mask-size)
(defparameter color-buffer-type #x303F) ;; 
(export 'color-buffer-type)
(defparameter renderable-type #x3040) ;; 
(export 'renderable-type)
(defparameter match-native-pixmap #x3041) ;; 	/* Pseudo-attribute (not queryable) */
(export 'match-native-pixmap)
(defparameter conformant #x3042) ;; 
(export 'conformant)
(defparameter slow-config #x3050) ;; 	/* EGL_CONFIG_CAVEAT value */
(export 'slow-config)
(defparameter non-conformant-config #x3051) ;; 	/* EGL_CONFIG_CAVEAT value */
(export 'non-conformant-config)
(defparameter transparent-rgb #x3052) ;; 	/* EGL_TRANSPARENT_TYPE value */
(export 'transparent-rgb)
(defparameter rgb-buffer #x308E) ;; 	/* EGL_COLOR_BUFFER_TYPE value */
(export 'rgb-buffer)
(defparameter luminance-buffer #x308F) ;; 	/* EGL_COLOR_BUFFER_TYPE value */
(export 'luminance-buffer)
(defparameter no-texture #x305C) ;; 
(export 'no-texture)
(defparameter texture-rgb #x305D) ;; 
(export 'texture-rgb)
(defparameter texture-rgba #x305E) ;; 
(export 'texture-rgba)
(defparameter texture-2d #x305F) ;; 
(export 'texture-2d)
(defparameter pbuffer-bit #x0001) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'pbuffer-bit)
(defparameter pixmap-bit #x0002) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'pixmap-bit)
(defparameter window-bit #x0004) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'window-bit)
(defparameter vg-colorspace-linear-bit #x0020) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'vg-colorspace-linear-bit)
(defparameter vg-alpha-format-pre-bit #x0040) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'vg-alpha-format-pre-bit)
(defparameter multisample-resolve-box-bit #x0200) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'multisample-resolve-box-bit)
(defparameter swap-behavior-preserved-bit #x0400) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'swap-behavior-preserved-bit)
(defparameter opengl-es-bit #x0001) ;; 	/* EGL_RENDERABLE_TYPE mask bits */
(export 'opengl-es-bit)
(defparameter openvg-bit #x0002) ;; 	/* EGL_RENDERABLE_TYPE mask bits */
(export 'openvg-bit)
(defparameter opengl-es2-bit #x0004) ;; 	/* EGL_RENDERABLE_TYPE mask bits */
(export 'opengl-es2-bit)
(defparameter opengl-bit #x0008) ;; 	/* EGL_RENDERABLE_TYPE mask bits */
(export 'opengl-bit)
(defparameter vendor #x3053) ;; 
(export 'vendor)
(defparameter version #x3054) ;; 
(export 'version)
(defparameter extensions #x3055) ;; 
(export 'extensions)
(defparameter client-apis #x308D) ;; 
(export 'client-apis)
(defparameter height #x3056) ;; 
(export 'height)
(defparameter width #x3057) ;; 
(export 'width)
(defparameter largest-pbuffer #x3058) ;; 
(export 'largest-pbuffer)
(defparameter texture-format #x3080) ;; 
(export 'texture-format)
(defparameter texture-target #x3081) ;; 
(export 'texture-target)
(defparameter mipmap-texture #x3082) ;; 
(export 'mipmap-texture)
(defparameter mipmap-level #x3083) ;; 
(export 'mipmap-level)
(defparameter render-buffer #x3086) ;; 
(export 'render-buffer)
(defparameter vg-colorspace #x3087) ;; 
(export 'vg-colorspace)
(defparameter vg-alpha-format #x3088) ;; 
(export 'vg-alpha-format)
(defparameter horizontal-resolution #x3090) ;; 
(export 'horizontal-resolution)
(defparameter vertical-resolution #x3091) ;; 
(export 'vertical-resolution)
(defparameter pixel-aspect-ratio #x3092) ;; 
(export 'pixel-aspect-ratio)
(defparameter swap-behavior #x3093) ;; 
(export 'swap-behavior)
(defparameter multisample-resolve #x3099) ;; 
(export 'multisample-resolve)
(defparameter back-buffer #x3084) ;; 
(export 'back-buffer)
(defparameter single-buffer #x3085) ;; 
(export 'single-buffer)
(defparameter vg-colorspace-s-rgb #x3089) ;; 	/* EGL_VG_COLORSPACE value */
(export 'vg-colorspace-s-rgb)
(defparameter vg-colorspace-linear #x308A) ;; 	/* EGL_VG_COLORSPACE value */
(export 'vg-colorspace-linear)
(defparameter vg-alpha-format-nonpre #x308B) ;; 	/* EGL_ALPHA_FORMAT value */
(export 'vg-alpha-format-nonpre)
(defparameter vg-alpha-format-pre #x308C) ;; 	/* EGL_ALPHA_FORMAT value */
(export 'vg-alpha-format-pre)
(defparameter display-scaling 10000) ;; 
(export 'display-scaling)
(defparameter unknown -1) ;; 
(export 'unknown)
(defparameter buffer-preserved #x3094) ;; 	/* EGL_SWAP_BEHAVIOR value */
(export 'buffer-preserved)
(defparameter buffer-destroyed #x3095) ;; 	/* EGL_SWAP_BEHAVIOR value */
(export 'buffer-destroyed)
(defparameter openvg-image #x3096) ;; 
(export 'openvg-image)
(defparameter context-client-type #x3097) ;; 
(export 'context-client-type)
(defparameter context-client-version #x3098) ;; 
(export 'context-client-version)
(defparameter multisample-resolve-default #x309A) ;; 	/* EGL_MULTISAMPLE_RESOLVE value */
(export 'multisample-resolve-default)
(defparameter multisample-resolve-box #x309B) ;; 	/* EGL_MULTISAMPLE_RESOLVE value */
(export 'multisample-resolve-box)
(defparameter opengl-es-api #x30A0) ;; 
(export 'opengl-es-api)
(defparameter openvg-api #x30A1) ;; 
(export 'openvg-api)
(defparameter opengl-api #x30A2) ;; 
(export 'opengl-api)
(defparameter draw #x3059) ;; 
(export 'draw)
(defparameter read #x305A) ;; 
(export 'read)
(defparameter core-native-engine #x305B) ;; 
(export 'core-native-engine)


(defparameter colorspace vg-colorspace) ;; 
(defparameter alpha-format vg-alpha-format) ;; 
(defparameter colorspace-s-rgb vg-colorspace-s-rgb) ;; 
(defparameter colorspace-linear vg-colorspace-linear) ;; 
(defparameter alpha-format-nonpre vg-alpha-format-nonpre) ;; 
(defparameter alpha-format-pre vg-alpha-format-pre) ;;
(export 'colorspace)
(export 'alpha-format)
(export 'colorspace-s-rgb)
(export 'colorspace-linear)
(export 'alpha-format-nonpre)
(export 'alpha-format-pre)
