(in-package :cl-user)

(defpackage #:my-first-lisp-package
  (:nicknames #:firstpack)
  (:use :cl :cl-user)
  (:export #:mad-adder))

(in-package :my-first-lisp-package)

(defvar *private-var* "not exported from package")

(defun mad-adder (n &rest rest)
  "addition function for firstpack"
  (apply #'+ n rest))
