(defun all-odd (listin)
  (every #'oddp listin)
)

(defun none-odd (listin)
  (every #'evenp listin)
)

(defun not-all-odd (listin)
  (not (every #'oddp listin))
)

(defun not-none-odd (listin)
  (not (every #'evenp listin))
)

(defun odds-n-evens (listin)
  (and (not (every #'evenp listin)) (not (every #'oddp listin)))
) 

(defun sqrrt (intin limit)
  (setf result nil)
  (loop for i from 1 to limit do
   (if (equal intin (* i i)) (setf result i) ())
  )
  result
)

(defun just-say-yes (thislist)
  (mapcar #'(lambda (arg) (if (not (equal 'yes arg)) 'yes arg)) thislist)
) 