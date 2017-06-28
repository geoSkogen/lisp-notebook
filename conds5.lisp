(defun weirdmath (x)
  (cond ((and (oddp x) (> x 0)) (* x x))
        ((and (oddp x) (< x 0)) (+ x x))
        (t (/ x 2))
  )
)
