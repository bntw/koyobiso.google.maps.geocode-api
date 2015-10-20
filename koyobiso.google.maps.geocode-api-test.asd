#|
  This file is a part of koyobiso.google.maps.geocode-api project.
  Copyright (c) 2015 Yasuyuki WATANABE (yaz@koyobiso.jp)
|#

(in-package :cl-user)
(defpackage koyobiso.google.maps.geocode-api-test-asd
  (:use :cl :asdf))
(in-package :koyobiso.google.maps.geocode-api-test-asd)

(defsystem koyobiso.google.maps.geocode-api-test
  :author "Yasuyuki WATANABE"
  :license "Private"
  :depends-on (:koyobiso.google.maps.geocode-api
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "koyobiso.google.maps.geocode-api"))))
  :description "Test system for koyobiso.google.maps.geocode-api"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
