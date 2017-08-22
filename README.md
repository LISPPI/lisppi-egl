# LISPPI-EGL   Generated with WHAT-THE-FFI

RASPBERRY PI ONLY!

Minimum bindings for native accelerated graphics with no X.  A lispy wrapper for creating native surfaces for OpenGL-ES or OpenVG, or just to gain access to native graphics.

## License

Like all LISPPI projects, this library is distributed under BSD 3-clause license.

## Dependencies

Depends on: cffi trivial-with

## Install

```
git clone https://github.com/LISPPI/lisppi-egl.git

(ql:quickload :lisppi-egl)
```

## Basics

The libraries cover most if not all functionality of DISPMANX and EGL subsystems.  Lisp names are generally created by using - instead of _, downcasing and removing EGL or DISPMANX prefix.  so `eglSwapBuffers` becomes `egl:swap-buffers`

Literal equivalents of the C library functions are prefixed with & and not exported, and stored in the lisp files that end with _.  `eglSwapBuffers` equivalent, `egl::&swap-buffers` is defined in `egl/egl_.lisp` as 

```
;;------------------------------------------------------------------------------
;; (/opt/vc/include/EGL/egl.h:312:31)
;;
(declaim (inline &swap-buffers))
(defcfun ("eglSwapBuffers" &swap-buffers) :UINT
  "see: (/opt/vc/include/EGL/egl.h:312:31)"
  (dpy  (:pointer :VOID)) ;; dpy
  (surface  (:pointer :VOID)) ;; surface
)
```
A lispier form of the same function is defined in `egl/egl.lisp`:
```
;;-------------------------------------------------------------
(defun swap-buffers ( surface &key (display *display*))
  (&swap-buffers display surface))
(export 'swap-buffers)

```
As Lisp programmers expect, commonly used singleton objects, `egl::*display*` in this case, are hidden unless needed, reducing clutter. This allows streamline code like:
```
(egl:get-display)
(egl:init)
(egl:bind-api)
(egl:create-context)
```
All the clutter of keeping track of display-ids, display handles, congi handles etc is eliminated unless required.

## Examples

DISPMANX-only test pattern:

```
(in-package :dispmanx)
(defun test-pattern ()
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
      (setf update (update-start))
      (element-remove update fg-element)
      (element-remove update bg-element)
      (update-submit-sync update))
    (deinit)))
```

Here is a simple program that uses convenient native functions and just-enough OpenGL-ES to paint the screen red for a few seconds.

```
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
  (deinit))
```

