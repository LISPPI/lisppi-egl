(defpackage #:dx+egl
  (:use #:cffi #:cl)
  (:export)
  )

(in-package #:dx+egl)


(define-foreign-library lib-dispmanx
  (t (:default "libbcm_host")) ;/opt/vc/lib/libbcm_host.so
  )
(use-foreign-library lib-dispmanx)

(load-foreign-library "libGLESv2.so")	;bug workaround.

(define-foreign-library lib-lp-egl
  (t (:default "libEGL")) ;/opt/vc/lib/libbcm_host.so
  )

(use-foreign-library lib-lp-egl)
  
