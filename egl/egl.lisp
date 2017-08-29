(in-package :egl)



;;==============================================================================
;; helper function to make a native attribute list
(defun make-attribs (attribs)
  (unless (listp attribs)
    (error "malformed attribute list ~A" attribs))
  (if attribs
      (foreign-alloc :uint :initial-contents attribs)
      (null-pointer)))


(defmacro with-attribs ((var attribs) &body body)
  `(let ((,var (make-attribs ,attribs)))
     (unwind-protect (progn ,@body)
       (foreign-free ,var))))

;;==============================================================================
;; For a lispier experience, hide things that are most likely to be
;; singletons
(defparameter *display* nil)
(defparameter *config* nil)
(defparameter *context* nil)


;;-------------------------------------------------------------
;; Let's adopt dispmanx terminology to avoid semantic collision
(defun init (&key (display *display*))
  (with-foreign-objects
      ((major :int)
       (minor :int))
    (errorcheck &initialize display major minor)
    (values (mem-aref major :int)
	    (mem-aref minor :int))))
(export 'init)

;;-------------------------------------------------------------
;; Let's adopt dispmanx terminology to avoid semantic collision
(defun deinit (&key (display *display* displayp))
  (errorcheck &terminate display))
(export 'deinit)

;;-------------------------------------------------------------
(defun get-display (&key (display-id default-display)
		      (no-default nil))
  "specify :no-default t to avoid setting *display*"
  (let ((display (&get-display display-id)))
    (unless no-default
      (setf *display* display))))
(export 'get-display)



;;-------------------------------------------------------------
;; TODO: cleanup
(defun choose-single-config (&key (display *display*) attribs)
  "return first config for the attribs specified"
  (with-attribs (atlist attribs)
    (with-foreign-objects
	((configs-ret :int) ;number of configs returned = 1...
	 (configs :pointer))
      (errorcheck &choose-config display atlist configs 1 configs-ret)
      ;; return the first pointer.  The array will be deleted.
      (setf *config*
	    (cffi:mem-ref configs :pointer)))))

(export 'choose-single-config)


;;-------------------------------------------------------------
(defun create-context ( &key
			  (display *display*)
			  (config *config*)
			  (context (null-pointer) no-default)
			  attribs)
  (with-attribs (atlist attribs)
    (let ((context (&create-context display config context atlist)))
      (unless no-default
	(setf *context* context))
      context)))
(export 'create-context)

;;-------------------------------------------------------------
(defun bind-api (&optional (api opengl-es-api))
  (errorcheck &bind-api api))
(export 'bind-api)

;;-------------------------------------------------------------
(defun create-window-surface (dxwin &key
				      (display *display*)
				      (config *config*)
				      attribs)
  (with-attribs (atlist attribs)
    (&create-window-surface display config dxwin atlist)))
(export 'create-window-surface)




;;-------------------------------------------------------------
(defun destroy-context ( &key (display *display*)
			   (context *context* no-default))
  (errorcheck &destroy-context display context)
  (unless no-default
    (setf *context* nil)))
(export 'destroy-context)




;;-------------------------------------------------------------
(defun get-proc-address ( procname)
  (&get-proc-address procname))
(export 'get-proc-address)

;;-------------------------------------------------------------
(defun copy-buffers (surface target
		     &key (display *display*))
  (&copy-buffers display surface target))
(export 'copy-buffers)

;;-------------------------------------------------------------
(defun swap-buffers ( surface &key (display *display*))
  (&swap-buffers display surface))
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
(defun query-context (attribute &key (display *display*)
				  (context *context*))
  (with-foreign-object (val :int)
    (&query-context display context attribute val)
    (mem-ref val :int)))
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
(defun make-current (xdraw xread &key (display *display*)
				  (context *context*))
  (errorcheck &make-current display xdraw xread context))
(export 'make-current)



;;-------------------------------------------------------------
(defun swap-interval (interval &key (display *display*))
  (&swap-interval display interval))
(export 'swap-interval)

;;-------------------------------------------------------------
(defun release-tex-image (surface buffer &key (display *display*))
  (&release-tex-image display surface buffer))
(export 'release-tex-image)

;;-------------------------------------------------------------
(defun bind-tex-image (surface buffer &key (display *display*))
  (&bind-tex-image display surface buffer))
(export 'bind-tex-image)

;;-------------------------------------------------------------
(defun surface-attrib (surface attribute value &key (display *display*))
  (&surface-attrib display surface attribute value))
(export 'surface-attrib)

;;-------------------------------------------------------------
(defun create-pbuffer-from-client-buffer (buftype buffer
					  &key (display *display*)
					    (config *config*)
					    attrib-list)
  (with-attribs (atlist attrib-list)
    (&create-pbuffer-from-client-buffer display buftype buffer config atlist)))
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
(defun query-surface (surface attribute &key (display *display*))
  (with-foreign-object (value :int)
    (&query-surface display surface attribute value)
    (mem-ref value :int)))
(export 'query-surface)

;;-------------------------------------------------------------
(defun destroy-surface (surface &key (display *display*))
  (&destroy-surface display surface))
(export 'destroy-surface)

;;-------------------------------------------------------------
(defun create-pixmap-surface (pixmap &key (display *display*)
				       (config *config*)
				       attrib-list)
  (with-attribs (atlist attrib-list)
    (&create-pixmap-surface display config pixmap atlist)))
(export 'create-pixmap-surface)

;;-------------------------------------------------------------
(defun create-pbuffer-surface ( &key (display *display*)
				       (config *config*)
				       attrib-list)
  (with-attribs (atlist attrib-list)
    (&create-pbuffer-surface display config atlist)))
(export 'create-pbuffer-surface)


;;-------------------------------------------------------------
(defun get-config-attrib (attribute &key (display *display*)
				       (config *config*))
  (with-foreign-object (value :int)
    (&get-config-attrib display config attribute value)
    (mem-ref value :int)))
(export 'get-config-attrib)


;;-------------------------------------------------------------
(defun get-configs (max &key (display *display*))
  "return native array of configs, and count of configs."
  (let ((configs (foreign-alloc :pointer :count max)))
    (with-foreign-object (actual :uint)
      (&get-configs display configs max actual)
      (values configs (mem-ref actual :uint)))))
(export 'get-configs)

;;-------------------------------------------------------------
(defun query-string (name &key (display *display*))
  (&query-string display name))
(export 'query-string)







