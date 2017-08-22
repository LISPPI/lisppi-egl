;;
;;
(asdf:defsystem #:lisppi-egl
  :description "set me!"
  :author "StackSmith <fpgasm@apple2.x10.mx>"
  :license "BSD 3-clause license"
  :serial t
  :depends-on (:cffi :trivial-with)
  :components ((:file "library")
	       (:file "common")

	       (:file "dispmanx/package")
	       (:file "dispmanx/dispmanx_")
	       (:file "dispmanx/dispmanx")
	       (:file "dispmanx/with")

	       (:file "egl/package")
	       (:file "egl/constants")
	       (:file "egl/egl_")
	       (:file "egl/egl-error")
	       (:file "egl/egl")

	       (:file "native")
	       ))

