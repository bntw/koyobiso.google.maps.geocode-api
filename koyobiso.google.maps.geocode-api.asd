#|
  This file is a part of koyobiso.google.maps.geocode-api project.
  Copyright (c) 2015 Yasuyuki WATANABE (yaz@koyobiso.jp)
|#

#|
  Author: Yasuyuki WATANABE (yaz@koyobiso.jp)
|#

(in-package :cl-user)
(defpackage koyobiso.google.maps.geocode-api-asd
  (:use :cl :asdf))
(in-package :koyobiso.google.maps.geocode-api-asd)

(defsystem koyobiso.google.maps.geocode-api
  :version "0.1"
  :author "Yasuyuki WATANABE"
  :license ""
  :depends-on (:cl-annot
               :cl-ppcre
               :dexador
               :jonathan)
  :components ((:module "src"
                :components
                ((:file "koyobiso.google.maps.geocode-api"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op koyobiso.google.maps.geocode-api-test))))
