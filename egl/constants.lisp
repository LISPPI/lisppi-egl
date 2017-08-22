(defpackage #:egl-
  (:use #:cl)
  (:shadow #:read))

(in-package :egl-)

(defconstant default-display 0) ;; 
(defconstant no-context 0) ;; 
(defconstant no-display 0) ;; 
(defconstant no-surface 0) ;; 
(defconstant dont-care -1) ;;

(defconstant success #x3000) ;; 
(export 'success)
(defconstant not-initialized #x3001) ;; 
(export 'not-initialized)
(defconstant bad-access #x3002) ;; 
(export 'bad-access)
(defconstant bad-alloc #x3003) ;; 
(export 'bad-alloc)
(defconstant bad-attribute #x3004) ;; 
(export 'bad-attribute)
(defconstant bad-config #x3005) ;; 
(export 'bad-config)
(defconstant bad-context #x3006) ;; 
(export 'bad-context)
(defconstant bad-current-surface #x3007) ;; 
(export 'bad-current-surface)
(defconstant bad-display #x3008) ;; 
(export 'bad-display)
(defconstant bad-match #x3009) ;; 
(export 'bad-match)
(defconstant bad-native-pixmap #x300A) ;; 
(export 'bad-native-pixmap)
(defconstant bad-native-window #x300B) ;; 
(export 'bad-native-window)
(defconstant bad-parameter #x300C) ;; 
(export 'bad-parameter)
(defconstant bad-surface #x300D) ;; 
(export 'bad-surface)
(defconstant context-lost #x300E) ;; 	/* EGL 1.1 - IMG_power_management */
(export 'context-lost)
(defconstant buffer-size #x3020) ;; 
(export 'buffer-size)
(defconstant alpha-size #x3021) ;; 
(export 'alpha-size)
(defconstant blue-size #x3022) ;; 
(export 'blue-size)
(defconstant green-size #x3023) ;; 
(export 'green-size)
(defconstant red-size #x3024) ;; 
(export 'red-size)
(defconstant depth-size #x3025) ;; 
(export 'depth-size)
(defconstant stencil-size #x3026) ;; 
(export 'stencil-size)
(defconstant config-caveat #x3027) ;; 
(export 'config-caveat)
(defconstant config-id #x3028) ;; 
(export 'config-id)
(defconstant level #x3029) ;; 
(export 'level)
(defconstant max-pbuffer-height #x302A) ;; 
(export 'max-pbuffer-height)
(defconstant max-pbuffer-pixels #x302B) ;; 
(export 'max-pbuffer-pixels)
(defconstant max-pbuffer-width #x302C) ;; 
(export 'max-pbuffer-width)
(defconstant native-renderable #x302D) ;; 
(export 'native-renderable)
(defconstant native-visual-id #x302E) ;; 
(export 'native-visual-id)
(defconstant native-visual-type #x302F) ;; 
(export 'native-visual-type)
(defconstant samples #x3031) ;; 
(export 'samples)
(defconstant sample-buffers #x3032) ;; 
(export 'sample-buffers)
(defconstant surface-type #x3033) ;; 
(export 'surface-type)
(defconstant transparent-type #x3034) ;; 
(export 'transparent-type)
(defconstant transparent-blue-value #x3035) ;; 
(export 'transparent-blue-value)
(defconstant transparent-green-value #x3036) ;; 
(export 'transparent-green-value)
(defconstant transparent-red-value #x3037) ;; 
(export 'transparent-red-value)
(defconstant none #x3038) ;; 	/* Attrib list terminator */
(export 'none)
(defconstant bind-to-texture-rgb #x3039) ;; 
(export 'bind-to-texture-rgb)
(defconstant bind-to-texture-rgba #x303A) ;; 
(export 'bind-to-texture-rgba)
(defconstant min-swap-interval #x303B) ;; 
(export 'min-swap-interval)
(defconstant max-swap-interval #x303C) ;; 
(export 'max-swap-interval)
(defconstant luminance-size #x303D) ;; 
(export 'luminance-size)
(defconstant alpha-mask-size #x303E) ;; 
(export 'alpha-mask-size)
(defconstant color-buffer-type #x303F) ;; 
(export 'color-buffer-type)
(defconstant renderable-type #x3040) ;; 
(export 'renderable-type)
(defconstant match-native-pixmap #x3041) ;; 	/* Pseudo-attribute (not queryable) */
(export 'match-native-pixmap)
(defconstant conformant #x3042) ;; 
(export 'conformant)
(defconstant slow-config #x3050) ;; 	/* EGL_CONFIG_CAVEAT value */
(export 'slow-config)
(defconstant non-conformant-config #x3051) ;; 	/* EGL_CONFIG_CAVEAT value */
(export 'non-conformant-config)
(defconstant transparent-rgb #x3052) ;; 	/* EGL_TRANSPARENT_TYPE value */
(export 'transparent-rgb)
(defconstant rgb-buffer #x308E) ;; 	/* EGL_COLOR_BUFFER_TYPE value */
(export 'rgb-buffer)
(defconstant luminance-buffer #x308F) ;; 	/* EGL_COLOR_BUFFER_TYPE value */
(export 'luminance-buffer)
(defconstant no-texture #x305C) ;; 
(export 'no-texture)
(defconstant texture-rgb #x305D) ;; 
(export 'texture-rgb)
(defconstant texture-rgba #x305E) ;; 
(export 'texture-rgba)
(defconstant texture-2d #x305F) ;; 
(export 'texture-2d)
(defconstant pbuffer-bit #x0001) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'pbuffer-bit)
(defconstant pixmap-bit #x0002) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'pixmap-bit)
(defconstant window-bit #x0004) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'window-bit)
(defconstant vg-colorspace-linear-bit #x0020) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'vg-colorspace-linear-bit)
(defconstant vg-alpha-format-pre-bit #x0040) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'vg-alpha-format-pre-bit)
(defconstant multisample-resolve-box-bit #x0200) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'multisample-resolve-box-bit)
(defconstant swap-behavior-preserved-bit #x0400) ;; 	/* EGL_SURFACE_TYPE mask bits */
(export 'swap-behavior-preserved-bit)
(defconstant opengl-es-bit #x0001) ;; 	/* EGL_RENDERABLE_TYPE mask bits */
(export 'opengl-es-bit)
(defconstant openvg-bit #x0002) ;; 	/* EGL_RENDERABLE_TYPE mask bits */
(export 'openvg-bit)
(defconstant opengl-es2-bit #x0004) ;; 	/* EGL_RENDERABLE_TYPE mask bits */
(export 'opengl-es2-bit)
(defconstant opengl-bit #x0008) ;; 	/* EGL_RENDERABLE_TYPE mask bits */
(export 'opengl-bit)
(defconstant vendor #x3053) ;; 
(export 'vendor)
(defconstant version #x3054) ;; 
(export 'version)
(defconstant extensions #x3055) ;; 
(export 'extensions)
(defconstant client-apis #x308D) ;; 
(export 'client-apis)
(defconstant height #x3056) ;; 
(export 'height)
(defconstant width #x3057) ;; 
(export 'width)
(defconstant largest-pbuffer #x3058) ;; 
(export 'largest-pbuffer)
(defconstant texture-format #x3080) ;; 
(export 'texture-format)
(defconstant texture-target #x3081) ;; 
(export 'texture-target)
(defconstant mipmap-texture #x3082) ;; 
(export 'mipmap-texture)
(defconstant mipmap-level #x3083) ;; 
(export 'mipmap-level)
(defconstant render-buffer #x3086) ;; 
(export 'render-buffer)
(defconstant vg-colorspace #x3087) ;; 
(export 'vg-colorspace)
(defconstant vg-alpha-format #x3088) ;; 
(export 'vg-alpha-format)
(defconstant horizontal-resolution #x3090) ;; 
(export 'horizontal-resolution)
(defconstant vertical-resolution #x3091) ;; 
(export 'vertical-resolution)
(defconstant pixel-aspect-ratio #x3092) ;; 
(export 'pixel-aspect-ratio)
(defconstant swap-behavior #x3093) ;; 
(export 'swap-behavior)
(defconstant multisample-resolve #x3099) ;; 
(export 'multisample-resolve)
(defconstant back-buffer #x3084) ;; 
(export 'back-buffer)
(defconstant single-buffer #x3085) ;; 
(export 'single-buffer)
(defconstant vg-colorspace-s-rgb #x3089) ;; 	/* EGL_VG_COLORSPACE value */
(export 'vg-colorspace-s-rgb)
(defconstant vg-colorspace-linear #x308A) ;; 	/* EGL_VG_COLORSPACE value */
(export 'vg-colorspace-linear)
(defconstant vg-alpha-format-nonpre #x308B) ;; 	/* EGL_ALPHA_FORMAT value */
(export 'vg-alpha-format-nonpre)
(defconstant vg-alpha-format-pre #x308C) ;; 	/* EGL_ALPHA_FORMAT value */
(export 'vg-alpha-format-pre)
(defconstant display-scaling 10000) ;; 
(export 'display-scaling)
(defconstant unknown -1) ;; 
(export 'unknown)
(defconstant buffer-preserved #x3094) ;; 	/* EGL_SWAP_BEHAVIOR value */
(export 'buffer-preserved)
(defconstant buffer-destroyed #x3095) ;; 	/* EGL_SWAP_BEHAVIOR value */
(export 'buffer-destroyed)
(defconstant openvg-image #x3096) ;; 
(export 'openvg-image)
(defconstant context-client-type #x3097) ;; 
(export 'context-client-type)
(defconstant context-client-version #x3098) ;; 
(export 'context-client-version)
(defconstant multisample-resolve-default #x309A) ;; 	/* EGL_MULTISAMPLE_RESOLVE value */
(export 'multisample-resolve-default)
(defconstant multisample-resolve-box #x309B) ;; 	/* EGL_MULTISAMPLE_RESOLVE value */
(export 'multisample-resolve-box)
(defconstant opengl-es-api #x30A0) ;; 
(export 'opengl-es-api)
(defconstant openvg-api #x30A1) ;; 
(export 'openvg-api)
(defconstant opengl-api #x30A2) ;; 
(export 'opengl-api)
(defconstant draw #x3059) ;; 
(export 'draw)
(defconstant read #x305A) ;; 
(export 'read)
(defconstant core-native-engine #x305B) ;; 
(export 'core-native-engine)


(defconstant colorspace vg-colorspace) ;; 
(defconstant alpha-format vg-alpha-format) ;; 
(defconstant colorspace-s-rgb vg-colorspace-s-rgb) ;; 
(defconstant colorspace-linear vg-colorspace-linear) ;; 
(defconstant alpha-format-nonpre vg-alpha-format-nonpre) ;; 
(defconstant alpha-format-pre vg-alpha-format-pre) ;;
(export 'colorspace)
(export 'alpha-format)
(export 'colorspace-s-rgb)
(export 'colorspace-linear)
(export 'alpha-format-nonpre)
(export 'alpha-format-pre)
