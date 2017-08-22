(in-package :dx)
;;==============================================================================
;; Lispy convenience, especially when used with `trivial-with`
;;
;; Context-setting macros following the classic with- pattern...
;;
(defmacro with-display ((name &key (device 0))  &body body)
  "create a display environment"
  `(let ((,name (display-open :device ,device)))
     (declare (ignorable ,name))
     (unwind-protect (progn ,@body)
       (display-close :display ,name))))

;;==============================================================================
(defmacro with-resource ((name type width height) &body body)
  `(let ((,name (hate-0 (resource-create ,type ,width ,height))))
     (unwind-protect (progn ,@body)
       (resource-delete ,name))))

;;==============================================================================
(defmacro with-rect ((name x y w h) &body body)
  "create a rect environment.  If coords (it must be a list with 4 elements; otherwise initialise to a unit rect at (0,0)"
  `(let ((,name (rect-set ,x ,y ,w ,h)))
     (unwind-protect (progn ,@body)
       (foreign-free ,name))) )

;;==============================================================================
(defmacro with-buffer ((name type &rest params) &body body)
  `(let ((,name (foreign-alloc ,type ,@params)))
     (unwind-protect (progn ,@body)
       (foreign-free ,name))))

;;==============================================================================
(defmacro with-alpha ((name flags opacity mask) &body body)
  `(with-foreign-object (,name '(:struct alpha))
     (with-foreign-slots ((flags opacity mask) ,name (:struct alpha))
       (setf flags ,flags
	     opacity ,opacity
	     mask ,mask)
       ,@body)))
;;==============================================================================


(defun test-pattern ()
  (declare (optimize (debug 3)))
  (init)
  (with:all
      ((display (disp))
       (resource (bg-resource :rgba32 1 1))
       (resource (fg-resource :rgba32 2 2))
       (rect (src-rect 0 0 1 1))
       (rect (dst-rect 0 0 2 2))
       (rect (fin-srect 0 0 (ash 2 16) (ash 2 16) ))
       (rect (fin-drect (/ (- 1920 1080) 2) 0 1080 1080))
       (buffer (background :uint32 :initial-element 0) )
       (buffer (image :uint32 :initial-contents
		      '(#xFF0000FF #xFF00FFFF 0 0  0 0 0 0  0 0 0 0 0 0 0 0
			#xFFFF0000 #xFFFFFF00 0 0  0 0 0 0  0 0 0 0 0 0 0 0)))
       (alpha (alpha 1 255 0)))
    (resource-write-data bg-resource :rgba32 4 background src-rect)
    (resource-write-data fg-resource :rgba32 64 image dst-rect)

    (let* ((update (update-start))
	   (bg-element
	    (element-add update 1 dst-rect bg-resource src-rect alpha))
	   (fg-element
	    (element-add update 2 fin-drect fg-resource fin-srect alpha)))
      (update-submit-sync update)
      
      (sleep 2)
    ;;  (break)
      (setf update (update-start))
      (element-remove update fg-element)
      (element-remove update bg-element)
      (update-submit-sync update))
    (deinit)))



;;==============================================================================
;; A common use case - create a full-size native window
(defun init-native ()
  (dx:init)
  (multiple-value-bind (width height) (dx:display-size)
    (display-open)
    (with:all
	((rect (dst-rect 0 0 width height))
	 (rect (src-rect 0 0 (ash width 16) (ash height 16))))
      (let ((update (update-start)))
	(prog1 (make-&native-window
		(element-add update 0
			     dst-rect 0
			     src-rect
			     (null-pointer))
		width height)
	  (update-submit-sync update))))))

(defun uninit-native (native-window)
  (let ((update (update-start)))
    (element-remove update (mem-ref native-window :uint))
    (update-submit-sync update)
    (foreign-free native-window)))
