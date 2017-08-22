(in-package :egl)


;;==============================================================================
(defparameter *errors* (let ((ht (make-hash-table)))
			 (loop for (key . value) in
			      '((#x3000 . "Success")
				(#x3001 . "Not Initialized")
				(#x3002 . "Access")
				(#x3003 . "Alloc")
				(#x3004 . "Attribute")
				(#x3005 . "Convig")
				(#x3006 . "Context")
				(#x3007 . "Current Surface")
				(#x3008 . "Display")
				(#x3009 . "Match")
				(#x300A . "Native Pixdump")
				(#x300B . "Native Window")
				(#x300C . "Parameter")
				(#x300D . "Surface")
				(#x300D . "Context Lost")
				
				)
			    do (setf (gethash key ht) value))
			 ht))

;; egl errors start at #x3000 plus error number...
(defparameter *error-names*
  (make-array 15
	      :initial-contents
	      '("Success"	"Not Initialized"
		"Access"	"Alloc"
		"Attribute"	"Config"
		"Context"	"Current Surface"
		"Display"	"Match"
		"Native Pixdump" "Native Window"
		"Parameter"	"Surface"
		"Context Lost")))

(defun get-error ()
  (let ((error-number (&get-error)))
    (values (aref *error-names* (- error-number #x3000)) error-number)))
(export 'get-error)

(defmacro errorcheck (fun &rest args)
  `(when (zerop (,fun ,@args))
     (let ((e (get-error)))
       (format t "ERROR ~A~&" e)
       (error "egl ~A returns: Bad ~A" ,(symbol-name fun) e))))

