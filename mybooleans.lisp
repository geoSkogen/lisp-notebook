(defun mynand (x y)
  (not (and x y))
)

(defun mynor (x y)
  (not (or x y))
)

(defun nandor (x y)
  (mynand (mynand x x) (mynand y y))
)

(defun nandand (x y)
  (mynand (mynand x y) (mynand x y))
)

(defun nornot (x)
  (mynor x x)
)

(defun norand (x y)
  (mynor (mynor x nil) (mynor y nil))
)
