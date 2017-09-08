(defun flipthis (arg)
  (cond ((equal arg 'down) (setf arg 'up))
        ((equal arg 'up) (setf arg 'down))
        ('middle))
)

(defun flipthese (listin)
  (mapcar #'flipthis listin)
)



(defun inrangep (listin valuein)
  (find-if
    #'(lambda (elm)
        (and (not (> elm (+ valuein 10))) (not (< elm (- valuein 10))))
      )
    listin)
)

(defun thecount (listarg)
	(length (remove-if-not #'(lambda (symb) (equal 'the symb)) listarg))
)

