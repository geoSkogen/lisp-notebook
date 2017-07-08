(defun palindromep (listin)
  (setf nitsil (reverse listin))
  (setf matchcount 0)
  (cond ((oddp (length listin))
          (setf halvish (- (/ (- (length listin) 1) 2) 1))
        )
        ((evenp (length listin))
         (setf halvish (- (/ (length listin) 2) 1))
        )
        (t 'weirddata)
  )
  (loop for index from 0 to halvish do
    (if (equal (nth index listin) (nth index nitsil)) (incf matchcount))
  )
  (if (equal matchcount (+ halvish 1)) t nil)
)