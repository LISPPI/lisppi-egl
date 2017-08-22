(in-package :egl)


(defconstant +false+ 0) ;; 
(defconstant +true+ 1) ;; 
(defconstant +default-display+ 0) ;; 
(defconstant +no-context+ 0) ;; 
(defconstant +no-display+ 0) ;; 
(defconstant +no-surface+ 0) ;; 
(defconstant +dont-care+ -1) ;; 
(defconstant +success+ #x3000) ;; 
(defconstant +not-initialized+ #x3001) ;; 
(defconstant +bad-access+ #x3002) ;; 
(defconstant +bad-alloc+ #x3003) ;; 
(defconstant +bad-attribute+ #x3004) ;; 
(defconstant +bad-config+ #x3005) ;; 
(defconstant +bad-context+ #x3006) ;; 
(defconstant +bad-current-surface+ #x3007) ;; 
(defconstant +bad-display+ #x3008) ;; 
(defconstant +bad-match+ #x3009) ;; 
(defconstant +bad-native-pixmap+ #x300A) ;; 
(defconstant +bad-native-window+ #x300B) ;; 
(defconstant +bad-parameter+ #x300C) ;; 
(defconstant +bad-surface+ #x300D) ;; 
(defconstant +context-lost+ #x300E) ;; 	/* EGL 1.1 - IMG_power_management */
(defconstant +buffer-size+ #x3020) ;; 
(defconstant +alpha-size+ #x3021) ;; 
(defconstant +blue-size+ #x3022) ;; 
(defconstant +green-size+ #x3023) ;; 
(defconstant +red-size+ #x3024) ;; 
(defconstant +depth-size+ #x3025) ;; 
(defconstant +stencil-size+ #x3026) ;; 
(defconstant +config-caveat+ #x3027) ;; 
(defconstant +config-id+ #x3028) ;; 
(defconstant +level+ #x3029) ;; 
(defconstant +max-pbuffer-height+ #x302A) ;; 
(defconstant +max-pbuffer-pixels+ #x302B) ;; 
(defconstant +max-pbuffer-width+ #x302C) ;; 
(defconstant +native-renderable+ #x302D) ;; 
(defconstant +native-visual-id+ #x302E) ;; 
(defconstant +native-visual-type+ #x302F) ;; 
(defconstant +samples+ #x3031) ;; 
(defconstant +sample-buffers+ #x3032) ;; 
(defconstant +surface-type+ #x3033) ;; 
(defconstant +transparent-type+ #x3034) ;; 
(defconstant +transparent-blue-value+ #x3035) ;; 
(defconstant +transparent-green-value+ #x3036) ;; 
(defconstant +transparent-red-value+ #x3037) ;; 
(defconstant +none+ #x3038) ;; 	/* Attrib list terminator */
(defconstant +bind-to-texture-rgb+ #x3039) ;; 
(defconstant +bind-to-texture-rgba+ #x303A) ;; 
(defconstant +min-swap-interval+ #x303B) ;; 
(defconstant +max-swap-interval+ #x303C) ;; 
(defconstant +luminance-size+ #x303D) ;; 
(defconstant +alpha-mask-size+ #x303E) ;; 
(defconstant +color-buffer-type+ #x303F) ;; 
(defconstant +renderable-type+ #x3040) ;; 
(defconstant +match-native-pixmap+ #x3041) ;; 	/* Pseudo-attribute (not queryable) */
(defconstant +conformant+ #x3042) ;; 
(defconstant +slow-config+ #x3050) ;; 	/* EGL_CONFIG_CAVEAT value */
(defconstant +non-conformant-config+ #x3051) ;; 	/* EGL_CONFIG_CAVEAT value */
(defconstant +transparent-rgb+ #x3052) ;; 	/* EGL_TRANSPARENT_TYPE value */
(defconstant +rgb-buffer+ #x308E) ;; 	/* EGL_COLOR_BUFFER_TYPE value */
(defconstant +luminance-buffer+ #x308F) ;; 	/* EGL_COLOR_BUFFER_TYPE value */
(defconstant +no-texture+ #x305C) ;; 
(defconstant +texture-rgb+ #x305D) ;; 
(defconstant +texture-rgba+ #x305E) ;; 
(defconstant +texture-2d+ #x305F) ;;

(defconstant +pbuffer-bit+ #x0001) ;; 	/* EGL_SURFACE_TYPE mask bits */
(defconstant +pixmap-bit+ #x0002) ;; 	/* EGL_SURFACE_TYPE mask bits */
(defconstant +window-bit+ #x0004) ;; 	/* EGL_SURFACE_TYPE mask bits */
(defconstant +vg-colorspace-linear-bit+ #x0020) ;; 	/* EGL_SURFACE_TYPE mask bits */
(defconstant +vg-alpha-format-pre-bit+ #x0040) ;; 	/* EGL_SURFACE_TYPE mask bits */
(defconstant +multisample-resolve-box-bit+ #x0200) ;; 	/* EGL_SURFACE_TYPE mask bits */
(defconstant +swap-behavior-preserved-bit+ #x0400) ;; 	/* EGL_SURFACE_TYPE mask bits */

(defconstant +opengl-es-bit+ #x0001) ;; 	/* EGL_RENDERABLE_TYPE mask bits */
(defconstant +openvg-bit+ #x0002) ;; 	/* EGL_RENDERABLE_TYPE mask bits */
(defconstant +opengl-es2-bit+ #x0004) ;; 	/* EGL_RENDERABLE_TYPE mask bits */
(defconstant +opengl-bit+ #x0008) ;; 	/* EGL_RENDERABLE_TYPE mask bits */

(defconstant +vendor+ #x3053) ;; 
(defconstant +version+ #x3054) ;; 
(defconstant +extensions+ #x3055) ;; 
(defconstant +client-apis+ #x308D) ;; 
(defconstant +height+ #x3056) ;; 
(defconstant +width+ #x3057) ;; 
(defconstant +largest-pbuffer+ #x3058) ;; 
(defconstant +texture-format+ #x3080) ;; 
(defconstant +texture-target+ #x3081) ;; 
(defconstant +mipmap-texture+ #x3082) ;; 
(defconstant +mipmap-level+ #x3083) ;; 
(defconstant +render-buffer+ #x3086) ;; 
(defconstant +vg-colorspace+ #x3087) ;; 
(defconstant +vg-alpha-format+ #x3088) ;; 
(defconstant +horizontal-resolution+ #x3090) ;; 
(defconstant +vertical-resolution+ #x3091) ;; 
(defconstant +pixel-aspect-ratio+ #x3092) ;; 
(defconstant +swap-behavior+ #x3093) ;; 
(defconstant +multisample-resolve+ #x3099) ;; 
(defconstant +back-buffer+ #x3084) ;; 
(defconstant +single-buffer+ #x3085) ;; 
(defconstant +vg-colorspace-s-rgb+ #x3089) ;; 	/* EGL_VG_COLORSPACE value */
(defconstant +vg-colorspace-linear+ #x308A) ;; 	/* EGL_VG_COLORSPACE value */
(defconstant +vg-alpha-format-nonpre+ #x308B) ;; 	/* EGL_ALPHA_FORMAT value */
(defconstant +vg-alpha-format-pre+ #x308C) ;; 	/* EGL_ALPHA_FORMAT value */
(defconstant +display-scaling+ 10000) ;; 
(defconstant +unknown+ -1) ;; 
(defconstant +buffer-preserved+ #x3094) ;; 	/* EGL_SWAP_BEHAVIOR value */
(defconstant +buffer-destroyed+ #x3095) ;; 	/* EGL_SWAP_BEHAVIOR value */
(defconstant +openvg-image+ #x3096) ;; 
(defconstant +context-client-type+ #x3097) ;; 
(defconstant +context-client-version+ #x3098) ;; 
(defconstant +multisample-resolve-default+ #x309A) ;; 	/* EGL_MULTISAMPLE_RESOLVE value */
(defconstant +multisample-resolve-box+ #x309B) ;; 	/* EGL_MULTISAMPLE_RESOLVE value */
(defconstant +opengl-es-api+ #x30A0) ;; 
(defconstant +openvg-api+ #x30A1) ;; 
(defconstant +opengl-api+ #x30A2) ;; 
(defconstant +draw+ #x3059) ;; 
(defconstant +read+ #x305A) ;; 
(defconstant +core-native-engine+ #x305B) ;; 
(defconstant +colorspace+ +vg-colorspace+) ;; 
(defconstant +alpha-format+ +vg-alpha-format+) ;; 
(defconstant +colorspace-s-rgb+ +vg-colorspace-s-rgb+) ;; 
(defconstant +colorspace-linear+ +vg-colorspace-linear+) ;; 
(defconstant +alpha-format-nonpre+ +vg-alpha-format-nonpre+) ;; 
(defconstant +alpha-format-pre+ +vg-alpha-format-pre+) ;;


;;-------------------------------------------------------------
(defun get-display ( display_id)
  (&get-display display_id))
(export 'get-display)

;;-------------------------------------------------------------
(defun initialize ( dpy)
  (with-foreign-objects
      ((major :int)
       (minor :int))
    (errorcheck &initialize dpy major minor)
    (values (mem-aref major :int)
	    (mem-aref minor :int))))
(export 'initialize)

;;-------------------------------------------------------------
(defun terminate ( dpy)
  (&terminate dpy))
(export 'terminate)

;;-------------------------------------------------------------
;; TODO: cleanup
(defun choose-single-config (display &rest attribs)
   "return a config for the attribs specified"
  (let ((attrib-list (foreign-alloc :int :initial-contents attribs)))
    (with-foreign-objects
	((configs-ret :int) ;number of configs returned = 1...
	 (configs :pointer))
      (let ((result (&choose-config display attrib-list configs 1 configs-ret)))
	(foreign-free attrib-list)
	(when (zerop result)
	  (error "choose-config: ~d" (get-error))))
      (cffi:mem-ref configs :uint32))))
(export 'choose-single-config)


;;-------------------------------------------------------------
(defun create-context ( dpy config share-context &rest attribs)
  (let ((attrib-list (if (null attribs)
			 (cffi:null-pointer)
			 (foreign-alloc 'EGLint :initial-contents attribs))))
    (prog1
	(&create-context dpy config share-context attrib-list)
      (foreign-free attrib-list)))
)
(export 'create-context)

;;-------------------------------------------------------------
(defun bind-api ( api)
  (&bind-api api))
(export 'bind-api)

;;-------------------------------------------------------------
(defun create-window-surface (dpy config dxwin &rest attribs)
  (let ((attrib-list (if (null attribs)
			 (cffi:null-pointer)
			 (foreign-alloc 'EGLint :initial-contents attribs))))
    (let ((dxwinx (cffi:convert-to-foreign dxwin '(:struct dxwinx))))
      (prog1
	  (&create-window-surface dpy config dxwinx attrib-list)
	(free-converted-object dxwinx '(:struct dxwinx) nil)
	(foreign-free attrib-list)))))




;;-------------------------------------------------------------
(defun destroy-context ( dpy ctx)
  (&destroy-context dpy ctx))
(export 'destroy-context)




;;-------------------------------------------------------------
(defun get-proc-address ( procname)
  (&get-proc-address procname))
(export 'get-proc-address)

;;-------------------------------------------------------------
(defun copy-buffers ( dpy surface target)
  (&copy-buffers dpy surface target))
(export 'copy-buffers)

;;-------------------------------------------------------------
(defun swap-buffers ( dpy surface)
  (&swap-buffers dpy surface))
(export 'swap-buffers)

;;-------------------------------------------------------------
(defun wait-native ( engine)
  (&wait-native engine))
(export 'wait-native)

;;-------------------------------------------------------------
(defun wait-gl ()
  (&wait-gl))
(export 'wait-gl)

;;-------------------------------------------------------------
(defun query-context ( dpy ctx attribute value)
  (&query-context dpy ctx attribute value))
(export 'query-context)

;;-------------------------------------------------------------
(defun get-current-display ()
  (&get-current-display))
(export 'get-current-display)

;;-------------------------------------------------------------
(defun get-current-surface ( readdraw)
  (&get-current-surface readdraw))
(export 'get-current-surface)

;;-------------------------------------------------------------
(defun get-current-context ()
  (&get-current-context))
(export 'get-current-context)

;;-------------------------------------------------------------
(defun make-current ( dpy draw read ctx)
  (&make-current dpy draw read ctx))
(export 'make-current)



;;-------------------------------------------------------------
(defun swap-interval ( dpy interval)
  (&swap-interval dpy interval))
(export 'swap-interval)

;;-------------------------------------------------------------
(defun release-tex-image ( dpy surface buffer)
  (&release-tex-image dpy surface buffer))
(export 'release-tex-image)

;;-------------------------------------------------------------
(defun bind-tex-image ( dpy surface buffer)
  (&bind-tex-image dpy surface buffer))
(export 'bind-tex-image)

;;-------------------------------------------------------------
(defun surface-attrib ( dpy surface attribute value)
  (&surface-attrib dpy surface attribute value))
(export 'surface-attrib)

;;-------------------------------------------------------------
(defun create-pbuffer-from-client-buffer ( dpy buftype buffer config attrib_list)
  (&create-pbuffer-from-client-buffer dpy buftype buffer config attrib_list))
(export 'create-pbuffer-from-client-buffer)

;;-------------------------------------------------------------
(defun release-thread ()
  (&release-thread))
(export 'release-thread)

;;-------------------------------------------------------------
(defun wait-client ()
  (&wait-client))
(export 'wait-client)

;;-------------------------------------------------------------
(defun query-api ()
  (&query-api))
(export 'query-api)


;;-------------------------------------------------------------
(defun query-surface ( dpy surface attribute value)
  (&query-surface dpy surface attribute value))
(export 'query-surface)

;;-------------------------------------------------------------
(defun destroy-surface ( dpy surface)
  (&destroy-surface dpy surface))
(export 'destroy-surface)

;;-------------------------------------------------------------
(defun create-pixmap-surface ( dpy config pixmap attrib_list)
  (&create-pixmap-surface dpy config pixmap attrib_list))
(export 'create-pixmap-surface)

;;-------------------------------------------------------------
(defun create-pbuffer-surface ( dpy config attrib_list)
  (&create-pbuffer-surface dpy config attrib_list))
(export 'create-pbuffer-surface)


;;-------------------------------------------------------------
(defun get-config-attrib ( dpy config attribute value)
  (&get-config-attrib dpy config attribute value))
(export 'get-config-attrib)


;;-------------------------------------------------------------
(defun get-configs ( dpy configs config_size num_config)
  (&get-configs dpy configs config_size num_config))
(export 'get-configs)

;;-------------------------------------------------------------
(defun query-string ( dpy name)
  (&query-string dpy name))
(export 'query-string)







