(setf mypath "c\:\/users\/geoseph\/lisp_files\/")

(defun lispload (invalue)
  (setf fullpath (concatenate 'string mypath invalue "\.lisp"))
  (load fullpath)
)

(defun my-new-path-is (invalue)
 (setf mypath invalue)
)
