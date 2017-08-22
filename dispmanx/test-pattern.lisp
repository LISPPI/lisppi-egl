;;(defpackage #:test  (:use #:dispmanx #:cffi #:cl))

(in-package :lisppi-dispmanx)
;;==============================================================================
;; A literal tranlation of
;; https://github.com/raspberrypi/firmware/blob/master/opt/vc/src/hello_pi/hello_dispmanx/dispmanx.c
;;
;;


(defstruct rect-vars display info image update resource element)
(defparameter *vars* (make-rect-vars))


(defun align32 (num)
  (logand (+ num 31) #xFFFFFFE0))

(defun test-pattern ()
  (bcm-host-init)
  (init)
  (with (
	 (resource bg-resource +IMAGE-RGBA32+ 1 1)
	 (resource resource +IMAGE-RGBA32+ 2 2)
	 (rect src-rect 0 0 1 1)
	 (rect dst-rect 0 0 1 1)
	 (buffer background :uint32 (:initial-element 0) )
	 (buffer image :uint32 (:initial-contents
				'(#xFF0000FF #xFF00FFFF 0 0  0 0 0 0
				  0 0 0 0 0 0 0 0
				  #xFFFF0000 #xFFFFFF00 0 0  0 0 0 0
				  0 0 0 0 0 0 0 0
				  )))
	 (alpha alpha 1 255 0))
    (let (update
	  ;;(alpha (foreign-alloc '(:struct vc-alpha-t)))
	  bgElement element)
       
      ;; (rect-set 0 0 1 1 dst-rect)
   
      (resource-write-data bg-resource       ;write to bg-resource
			   +IMAGE-RGBA32+   ;src-type 32bpp
			   4                ;src-pitch 
			   background       ;src-address
			   dst-rect         ;(0 0 1 1)
			   ) 
            
       
       (rect-set 0 0 2 2 dst-rect)
       (resource-write-data resource
			    +IMAGE-RGBA32+
			    64;;src-pitch, 16x4
			    image
			    dst-rect)
       
       ;; see /opt/vc/include/interface/vmcs_host/vc_dispmanx_types.h
       	 
       (setf update (update-start 0))
       (rect-set 0 0 0 0 dst-rect)

 
       (setf bgElement (element-add update
				    (disp-handle dx::*DISP*)
				    1 ;; layer
				    dst-rect
				    bg-resource
				    src-rect
				    0 ;protection
				    alpha
				    (cffi:null-pointer)
				    0;; DISPMANX_NO_ROTATE
				    ))

	 ;;====================================================================

       (rect-set 0 0 (ash 2 16) (ash 2 16) src-rect ;131072 131072 src-rect
		 )
       (rect-set (/ (- 1920 1080) 2)
		 0
		 1080
		 1080
		 dst-rect)

       (setf element (element-add update
				   (disp-handle dx::*DISP*)
				  2;; layer
				  dst-rect
				  resource
				  src-rect
				  0 ;protection
				  alpha
				  (cffi:null-pointer)
				  0;; DISPMANX_NO_ROTATE
				  ))

	 ;;====================================================================

       (update-submit-sync update)
	 ;;====================================================================
	 ;; keypress wait here...

       (format t "elements: ~A ~A ~&" element bgElement)
       (sleep 2)
       (setf update (update-start 0))
       (element-remove update element)
       (element-remove update bgElement)
       (update-submit-sync update)
       
       (format t "resources: ~A ~A ~&" bg-resource resource))
    (format t "rects: ~A ~A ~&" src-rect dst-rect)
        
    (uninit)

   
  ))

