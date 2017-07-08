(defun setequal (list1 list2)
  (if (equal (length list1) (length list2))
    (if (and
      (equal (length list1) (length (union list1 list2)))
      (equal (length list1) (length (intersection list1 list2))))
      t
      nil
    )
    (list 'arguments 'must 'be 'lists 'of 'equal 'length)
  )
)


(defun equalsetsp (list1 list2)
  (if (and (subsetp list1 list2) (subsetp list2 list1)) t nil)
)
