(defun mycycle (x)
  (if (< x 0) 'pass-positive-integers-only
    (if (< x 99) (+ 1 x)
      (if (equal 99 x) 1 'accepts-integers-1-through-99-only)
    )
  )
)
