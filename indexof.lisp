(defun indexof (thisin listin)
 (if (member thisin listin)
    (- (length listin) (length (member thisin listin)))
    ()
 )
)
