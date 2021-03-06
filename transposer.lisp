(setf modes
  '(ionian dorian phrygian lydian mixolydian aeolian locrian)
)

(setf tonic
  '((one . do)
    (two . re)
    (three.  mi)
    (four . fa)
    (five . so)
    (six . la)
    (seven . ti))
)

(setf chromatic
  '((1 . C)
    (2 . C#)
    (3 . D)
    (4 . D#)
    (5 . E)
    (6 . F)
    (7 . F#)
    (8 . G)
    (9 . G#)
    (10 . A)
    (11 . A#)
    (12 . B))
)

(setf thischromatic chromatic)
(setf thisionian nil)
(setf thismode nil)
(setf currentkey 'c)
(setf currentmode 'ionian)
(setf coffset 0)
(setf moffset 0)

(defun indexof (thisin listin)
 (if (member thisin listin)
    (- (length listin) (length (member thisin listin :test #'equal)))
    ()
 )
)


(defun modechange (mode)
  (if (numberp mode)
    (if (> mode (length modes)) (format t "~A is out of range." mode)
    (transmoder (nth (- mode 1) modes) thisionian))
    (if (not (member mode modes)) (format t "~A is not a known mode." mode)
      (transmoder mode thisionian)
    )
  )
)

(defun keychange (tonic)
  (if (equal nil (rassoc tonic chromatic))
    (format t "~A is not a known pitch." tonic)
    (validkey tonic)
  )
)

(defun validkey (tonic)
  (setf currentkey tonic)
  (setf coffset (- (car (rassoc tonic chromatic)) 1))
  (getkey)
)

(defun getkey ()
  (routetrans coffset)
)

(defun routetrans (coff)
  (setf thischromatic (transposer chromatic coff))
  (setf thisionian (buildionian thischromatic))
  (setf thismode (modechange currentmode))
  (dumpdata thischromatic thismode)
)

(defun dumpdata (alist1 alist2)
  (format t "Key of ~A ~%" currentkey)
  (format t "Chromatic Scale: ~A" alist1)
  (format t "~%" nil)
  (if (not (equal currentmode 'ionian))
    (format t "IONIAN mode: ~A ~%" thisionian)
    (format t "~%" nil)
  )
  (format t "~A Mode: ~A" currentmode alist2)
)

(defun transposer (alist offset)
  (setf thislist nil)
  (setf i 1)
  (loop for elm from i to (length alist)
    do
    (setf lookup (+ i offset))
    (if (> lookup (length alist)) (setf lookup (- lookup (length alist))))
    (setf thislist (append thislist (list (cons i (cdr (assoc lookup alist))))))
    (incf i)
  )
  thislist
)

(defun buildionian (alist)
  (setf ionian nil)
  (setf intervals (list 0 2 4 5 7 9 11))
  (setf i 1)
  (loop for int in intervals
    do
    (setf ionian (append ionian (list (cons i (cdr (nth int alist))))))
    (incf i)
  )
  ionian
)

(defun transmoder (mode alist)
  (setf moffset (indexof mode modes))
  (setf currentmode mode)
  (setf thismode (transposer alist moffset))
  thismode
)

(getkey)
