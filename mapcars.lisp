(defun flipthis (arg)
  (cond ((equal arg 'down) (setf arg 'up))
        ((equal arg 'up) (setf arg 'down))
        ('middle))
)

(defun flipthese (listin)
  (mapcar #'flipthis listin)
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

(setf thischromatic ())
(setf currentkey 'unset)
(setf offset 0)


(defun keychange (tonic)
  (setf currentkey tonic)
  (setf offset (- (car (rassoc tonic chromatic)) 1))
  (getkey)
)

(defun getkey ()
  (if (equal currentkey 'unset) chromatic (calckey))
)

(defun calckey ()
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


(defun inrangep (listin valuein)
  (find-if
    #'(lambda (elm)
        (and (not (> elm (+ valuein 10))) (not (< elm (- valuein 10))))
      )
    listin)
)
