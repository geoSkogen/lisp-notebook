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

(setf thischromatic nil)
(setf thisionian nil)
(setf currentkey 'unset)
(setf coffset 0)
(setf ioffset 0)


(defun keychange (tonic)
  (setf currentkey tonic)
  (setf coffset (- (car (rassoc tonic chromatic)) 1))
  (getkey)
)

(defun getkey ()
  (if (equal currentkey 'unset) (routedata nil) (routetrans coffset))
)

(defun routetrans (coff)
  (setf thischromatic (transposer chromatic coff))
  (setf thisionian (buildionian thischromatic))
  (routedata t)
)

(defun routedata (bool)
  (if (equal t bool) (dumpdata thischromatic thisionian) (dumpdata chromatic ionian))
)

(defun dumpdata (alist1 alist2)
  (format t "~A" alist1)
  (format t "~%" nil)
  (format t "~A" alist2)
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

;notice how this transposer is so much more awkward than the one above
(defun *old*transposer ()
  (setf thischromatic ())
  (setf i 1)
  (setf lookup i)
  (setf thischromatic (cons (cons i currentkey) thischromatic))
  (loop for elm from 1 to (- (length chromatic) 1)
    do
    (incf i)
    (incf lookup)
    (if (> lookup (- (length chromatic) offset)) (setf lookup (- lookup (length chromatic))))
    (setf newcons (cons i (cdr (assoc (+ lookup offset) chromatic))))
    (setf thischromatic (append thischromatic (list newcons)))
  )
  thischromatic
)
