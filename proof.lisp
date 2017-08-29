(in-package :native)
;;=====================================================================
;; Proof: use gles commands to clear the buffer to red.
(defcfun ("glClearColor" gl-clear-color) :void
  (red :FLOAT)
  (green :FLOAT)
  (blue :FLOAT)
  (alpha :FLOAT))

(defcfun ("glClear" gl-clear) :void
  (mask :uint))

(defcfun ("glFlush" gl-flush) :void)


(defun proof ()
  (init)
  (gl-clear-color 1.0 0.0 0.0 0.5)
  (gl-clear #x4000); GL_COLOR_BUFFER_BIT
  (gl-flush)
  (egl:swap-buffers *surface*)
  (sleep 0.1)
  (deinit)
  )





(defun ttt ()
  (init :api egl:openvg-api)
  (let ((clear-color (foreign-alloc :float :initial-contents '(1.0 1.0 1.0 1.0))))
    (vg:set-fv :CLEAR-COLOR 4 clear-color)
    (vg:clear 0 0 1200 1080)
    (vg:flush)
    ;;(foreign-free clear-color)a
    )
  (egl:swap-buffers *surface*)
  (sleep 2)
  (deinit))


