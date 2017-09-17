(defpackage #:native
  (:use #:cffi #:cl)
  (:export))

(in-package :native)
;;==============================================================================
;; native-window is a c structure used by egl initialization code.
;;
(defcstruct (&native-window)
  (element :uint);dispmanx element
  (width  :int) ;window width
  (height :int)) ;window height

(defun make-&native-window (&rest rest)
  (foreign-alloc :int :initial-contents rest))
(export 'make-&native-window)

;;==============================================================================
;; A common use case - create a full-size native window
(defun init-dx ()
  "initialize dispmanx, return full-size native window cstruct"
  (dx:init)
  (multiple-value-bind (width height) (dx:display-size)
    (dx:display-open)
    (with:all
	((dx:rect (dst-rect 0 0 width height))
	 (dx:rect (src-rect 0 0 (ash width 16) (ash height 16))))
      (let ((update (dx:update-start)))
	(prog1 (make-&native-window
		(dx:element-add update 0
			     dst-rect 0
			     src-rect
			     (null-pointer)
			     			     )
		width height)
	  (dx:update-submit-sync update))))))

(defun deinit-dx (native-window)
  "uninitialize dispmanx, get rid of native-window"
  (let ((update (dx:update-start)))
    (dx:element-remove update (mem-ref native-window :uint))
    (dx:update-submit-sync update)
    (foreign-free native-window)))


(defun init-egl (&key (api egl:opengl-es-api))
  (egl:get-display)
  (egl:init)
  (egl:choose-single-config :attribs
			    '(#.egl:red-size 8
			      #.egl:green-size 8
			      #.egl:blue-size 8
			      #.egl:alpha-size 8
			      #.egl:surface-type #.egl:window-bit
			    ;;  #.egl:renderable-type #.egl:openvg-bit
			      #.egl:none))
  (egl:bind-api api)
  (egl:create-context))

(defun deinit-egl ()
  ;;  (egl:destroy-context)
  (egl:make-current egl:no-surface egl:no-surface :context egl:no-context)
  (egl:deinit))


(defun egl-from-dispmanx (native-window)
  (let ((surface (egl:create-window-surface native-window)))
    (egl:make-current surface surface)
    surface))

(defparameter *surface* nil)
(defparameter *native* nil)

(defun init (&key (api egl:opengl-es-api))
  (setf *native* (init-dx))
  (init-egl :api api)
  (setf *surface* (egl-from-dispmanx *native*))
  *native*)

(defun deinit ()
  ;;  (egl:destroy-surface *surface*)
 (deinit-egl)
 (deinit-dx *native*))



(defun init-sprite (x y w h)
  "initialize dispmanx, return full-size native window cstruct"
  (dx:init)
  
  (dx:display-open)
  (with:all
      ((dx:rect (dst-rect x y w h))
       (dx:rect (src-rect x y (ash w 16) (ash h 16))))
    (let ((update (dx:update-start)))
      (prog1 (make-&native-window
	      (dx:element-add update 0
			      dst-rect 0
			      src-rect
			      (null-pointer)
			      )
	      w h)
	(dx:update-submit-sync update)))))
