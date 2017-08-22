(in-package :dx+egl)

(defcstruct (&native-window)
  (element :uint)
  (width  :int)
  (height :int))

(defun make-&native-window (&rest rest)
  (foreign-alloc :int :initial-contents rest))
(export 'make-&native-window)
