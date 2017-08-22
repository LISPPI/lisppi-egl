(in-package :dx)
;;-----------------------------------------------------------------------------
;;
;; Exports and improvements
;;
;;-----------------------------------------------------------------------------
;; include/interface/vmcs_host/vc_dispmanx_types.h
(defparameter PROTECTION-NONE 0)
(defparameter PROTECTION-MAX  15)
(defparameter PROTECTION-HDCP 11)
(export 'PROTECTION-NONE)
(export 'PROTECTION-MAX)
(export 'PROTECTION-HDCP)

(defun like-error (result)
  (error "Unexpected result ~A" result)
  )
(defmacro like-0 (&rest rest)
  (let ((result (gensym)))
    `(let ((,result 
	    ,@rest))
      ;; (declare (type fixnum ,result))
       (unless (zerop ,result) (like-error ,result))
       ,result)))

(defmacro hate-0 (&rest rest)
  (let ((result (gensym)))
    `(let ((,result 
	    ,@rest))
     ;;  (declare (type fixnum ,result))
       (when (zerop ,result) (like-error ,result))
       ,result)))

;;-----------------------------------------------------------------------------
(defun init ()
  (&init))
(export 'init)

;;-----------------------------------------------------------------------------
(defun deinit ()
  (&deinit))
(export 'deinit)


;;-----------------------------------------------------------------------------
(defun get-sdram-address ()
  (&get-sdram-address))
(export 'get-sdram-address)

;;-----------------------------------------------------------------------------
(defun get-peripheral-size ()
  (&get-peripheral-size))
(export 'get-peripheral-size)

;;-----------------------------------------------------------------------------
(defun get-peripheral-address ()
  (&get-peripheral-address))
(export 'get-peripheral-address)

;;-----------------------------------------------------------------------------
(defun display-size ( &optional (display_number 0) )
  "return (values width height)"
  (declare (optimize (speed 3) (safety 0)) )
  (with-foreign-objects ((width :int)
			 (height :int))
    (&display-size display_number width height)
    (values (the fixnum (mem-ref  width :int))
	    (the fixnum (mem-ref height :int)))))
(export 'display-size)

;;-----------------------------------------------------------------------------
(defun query-image-formats ( supported_formats)
  (&query-image-formats supported_formats))
(export 'query-image-formats)

;;=============================================================
;;
;; Display
;;https://gist.github.com/AndrewFromMelbourne/aa21944cbef4a8a0ae40
;;
(defparameter *display* nil)
;;-----------------------------------------------------------------------------
(defun display-open (&key (device 0))
  (setf *display*
	(hate-0 (&display-open device))))
(export 'display-open)

(defun display-open-mode (mode &key (device 0))
  (setf *display*
	(hate-0 (&display-open-mode device mode))))
(export 'display-open-mode)

;;-----------------------------------------------------------------------------
(defun display-open-offscreen (dest-res
			       &key (transform :no-rotate))
  (setf *display*
	(hate-0 (&display-open-offscreen dest-res transform))))
(export 'display-open-offscreen)

;;-----------------------------------------------------------------------------
(defun display-close ( &key (display *display*))
  (like-0 (&display-close display)))
(export 'display-close)

;;-----------------------------------------------------------------------------
;; 1.5k without opt, .7k with...
(defun display-get-info (&key (display *display*))
  "return width,height,transform,input-format and display-num"
  (declare (optimize (speed 3) (safety 0)) )
  (with-foreign-object (data '(:struct  modeinfo))
    (like-0 (the fixnum (&display-get-info display data)))
    (with-foreign-slots ((width height transform input-format display-num)
			 data (:struct modeinfo))
      (values (the fixnum width) (the fixnum height)
	      transform input-format (the fixnum display-num)))))
(export 'display-get-info)

#|| a possible way to deal with it is to keep track of types
;;
(defparameter *tt* '(:int :int  transform display-input-format :int))
;; 
;; have a way to retrieve them
;;
(defun get-foreign-values (pointer tlist)
  (loop for type in tlist
     for offset = 0 then (+ offset (foreign-type-size type))
     collect (mem-ref pointer type offset)))
;; s little slower but about 250 bytes
(defun display-get-info (display)
  "return width,height,transform,input-format and display-num"
  (declare (optimize (speed 3) (safety 0)) )
  (with-foreign-object (data :uint 5)
    (declare (type foreign-pointer data))
    (like-0 (&display-get-info display data))
    ()
    (get-foreign-values  data *tt* )
    ))
||#

;;-----------------------------------------------------------------------------
(defun display-set-background ( update red green blue
			       &key (display *display*))
  (&display-set-background update display red green blue))
(export 'display-set-background)

;;-----------------------------------------------------------------------------
(defun display-set-destination (dest &key (display *display*))
  (&display-set-destination display dest))
(export 'display-set-destination)

;;-----------------------------------------------------------------------------
(defun display-reconfigure (mode &key (display *display*))
  (&display-reconfigure display mode))
(export 'display-reconfigure)

;;-----------------------------------------------------------------------------

;;=============================================================
;;
;; Resource
;;

;;-----------------------------------------------------------------------------
(defun resource-create ( type width height )
  (with-foreign-object (native-image-handle :UINT)
    (values
     
     (&resource-create type width height native-image-handle)
     (mem-ref native-image-handle :UINT))))
(export 'resource-create)

;;-----------------------------------------------------------------------------
(defun resource-delete ( res)
  (like-0 (&resource-delete res)))
(export 'resource-delete)

;;-----------------------------------------------------------------------------
(defun resource-set-palette ( handle src_address offset size)
  (&resource-set-palette handle src_address offset size))
(export 'resource-set-palette)

;;-----------------------------------------------------------------------------
(defun resource-get-image-handle ( res)
  (&resource-get-image-handle res))
(export 'resource-get-image-handle)

;;-----------------------------------------------------------------------------
(defun resource-read-data ( handle p_rect dst_address dst_pitch)
  (&resource-read-data handle p_rect dst_address dst_pitch))
(export 'resource-read-data)

;;-----------------------------------------------------------------------------
(defun resource-write-data-handle ( res src_type src_pitch handle offset rect)
  (&resource-write-data-handle res src_type src_pitch handle offset rect))
(export 'resource-write-data-handle)

;;-----------------------------------------------------------------------------
(defun resource-write-data ( res src_type src_pitch src_address rect)
  (like-0
   (&resource-write-data res src_type src_pitch src_address rect)))
(export 'resource-write-data)




;;-----------------------------------------------------------------------------
(defun stop ()
  (&stop))
(export 'stop)


;;=============================================================
;;
;; Update
;;-----------------------------------------------------------------------------

(defun update-start ( &key (priority 0))
  (hate-0 (&update-start priority)))
(export 'update-start)

;;-----------------------------------------------------------------------------
(defun update-submit-sync ( update)
  (like-0 (&update-submit-sync update)))
(export 'update-submit-sync)

;;-----------------------------------------------------------------------------
(defun update-submit ( update cb_func cb_arg)
  (&update-submit update cb_func cb_arg))
(export 'update-submit)



;;=============================================================
;;
;; Element
;;
;;
;;-----------------------------------------------------------------------------
(defun element-add ( update layer dest_rect src src_rect
		    alpha 
		    &key (display *display*)
		      (protection PROTECTION-NONE)
		      (transform :no-rotate)
		      (clamp (null-pointer)))
  (hate-0
   (&element-add update display layer dest_rect src src_rect
		 protection alpha clamp transform)))
(export 'element-add)

;;-----------------------------------------------------------------------------
(defun element-change-attributes
    ( update element change_flags  layer opacity dest_rect
     src_rect mask &key (transform :no-rotate))
  
  (&element-change-attributes update element change_flags layer opacity dest_rect src_rect mask transform))
(export 'element-change-attributes)

;;-----------------------------------------------------------------------------
(defun element-remove ( update element)
  (like-0 (&element-remove update element)))
(export 'element-remove)

;;-----------------------------------------------------------------------------
(defun element-modified ( update element rect)
  (&element-modified update element rect))
(export 'element-modified)

;;-----------------------------------------------------------------------------
(defun element-change-layer ( update element layer)
  (&element-change-layer update element layer))
(export 'element-change-layer)

;;-----------------------------------------------------------------------------
(defun element-change-source ( update element src)
  (&element-change-source update element src))
(export 'element-change-source)



;;=============================================================
(defun rect-set (x y width height &key (rect (foreign-alloc '(:struct rect))))
  "create a rect, or set an existing rect"
  (like-0 (&rect-set rect x y width height))
  rect)
(export 'rect-set)


;;-----------------------------------------------------------------------------
(defun vsync-callback (cb_func cb_arg
		       &key (display *display*))
  (&vsync-callback display cb_func cb_arg))
(export 'vsync-callback)

;;-----------------------------------------------------------------------------
(defun snapshot (snapshot_resource 
		 &key (display *display*)
		   (transform :no-rotate))
  (&snapshot display snapshot_resource transform))
(export 'snapshot)


