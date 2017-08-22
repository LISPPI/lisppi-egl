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
  (sleep 4)
  (deinit)
  )
