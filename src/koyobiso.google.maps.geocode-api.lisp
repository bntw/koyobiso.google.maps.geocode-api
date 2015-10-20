;;; -*- mode:common-lisp; coding:utf-8 -*-
(in-package :cl-user)
(defpackage koyobiso.google.maps.geocode-api
  (:use :cl))
(in-package :koyobiso.google.maps.geocode-api)

(cl-annot:enable-annot-syntax)

@export
(defun address->json (string)
  (dex:get
   (format nil "https://maps.googleapis.com/maps/api/geocode/json?address=~A"
	   (quri:url-encode string))))

@export
(defun address->location (string)
  (let ((data (jonathan:parse (address->json string))))
    (let ((geometry (getf (first (getf data :|results|)) :|geometry|)))
      (let ((location (getf geometry :|location|)))
	(format nil "~A ~A"
		(getf location :|lat|)
		(getf location :|lng|))))))
