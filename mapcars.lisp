(defun flipthis (arg)
  (cond ((equal arg 'down) (setf arg 'up))
        ((equal arg 'up) (setf arg 'down))
        ('middle))
)

(defun flipthese (listin)
  (mapcar #'flipthis listin)
)
