(defun emphasize (list)
  (cond ((equal (first list) 'good) (cons 'amazing (rest list)))
        ((equal (first list) 'bad) (cons 'appalling (rest list)))
        (t (cons 'very list))
  )
)
