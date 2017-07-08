(defun versus (listin)

  (defun setvsset (thislist)
    (setf rightval (rest (member '-vs- thislist)))
    (setf leftval (reverse (rest (member '-vs- (reverse thislist)))))
    (setf bothhalves (list leftval rightval))
    (setf incommon (intersection leftval rightval))
    incommon
  )

  (if (member '-vs- listin)
    (setvsset listin)
    (list 'argument 'must 'be 'a 'list 'containing '-vs-)
  )
)
