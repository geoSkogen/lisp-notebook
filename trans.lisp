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

(setf currentkey 'c)

(defun normalize (datum listin)
  (if (not (numberp datum)) (setf datum 0) nil)
  (setf llen (length listin))
  (if (> (/ datum llen) 2)
    (setf datum (rem datum llen)) nil)
  (if (> datum llen) (setf datum (- datum llen) ) datum)
  (if (> 1 datum) (setf datum (+ llen datum)))
  datum
)

(defun ints-to-notes (listin)
  (mapcar #'(lambda (elm) (setf elm (cdr (assoc (normalize elm chromatic) chromatic)))) listin)
)

(defun notes-to-ints (listin)
  (mapcar #'(lambda (elm) (setf elm (car (rassoc elm chromatic)))) listin)
)

(defun int-to-note (int)
  (setf note (cdr (assoc (normalize int chromatic) chromatic)))
  note
)

(defun note-to-int (symb)
  (setf int (car (rassoc symb chromatic)))
  int
)

(defun offsetby (intin listin normlist)
  (mapcar #'(lambda (elm) (setf elm (normalize (+ intin elm) normlist))) listin)
)

(defun transpose (listin key newkey)
    (setf newlist nil)
	(setf newtune nil)
    (setf offset 0)
	;convert params from mixed input to all ints
	(if (not (numberp newkey)) (setf newkey (note-to-int newkey)) nil)
	(if (not (numberp key)) (setf key (note-to-int key)) nil)
	(setf offset (- newkey key))
	;convert list from mixed input to all ints
	(setf newlist 
	  (mapcar #'(lambda (elm) 
	    (if (numberp elm) 
		  elm
		  (note-to-int elm)
		))
	   listin))
    (setf newlist (offsetby offset newlist chromatic))
	(setf newtune (ints-to-notes newlist))
    newtune		
)




