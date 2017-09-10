(setf ranks '(
	ace
	two
	three
	four
	five
	six
	seven
	eight
	nine
	ten
	jack
	queen
	king
))

(setf suits '(spades clubs hearts diamonds))
(setf colors '(black black red red))

(setf deck nil)

(defun indexof (thisin listin)
 (if (member thisin listin)
    (- (length listin) (length (member thisin listin)))
    ()
 )
)

(defun shuffle ()
  (setf deck nil)
  (makedeck ranks suits)
)

(defun makedeck (ranks suits)
  (setf newsuit nil)
  (setf newcons 'none)
  (loop for suit in suits do
    (setf newsuit nil)	
	(loop for rank in ranks do
	  (setf newcons (cons rank (list suit)))
	  (setf newsuit (append newsuit (list newcons)))
	)
	  (setf deck (append deck (list newsuit)))
	)
	deck
)

(defun getsuit (arg1 arg2)
  arg2
)

(defun getrank (arg1 arg2)
  arg1
)

(defun getcolor (arg1 arg2) 
 (nth (indexof arg2 suits) colors) 
)

(defun deal (n)
  (if (equal nil deck) (format nil "type (shuffle) first" nil) (go-dealhand n))
)

(defun go-dealhand (n) 
  (setf card "none")
  (setf r -1)
  (setf s -1)
  (setf hand nil)
  (loop for i from 1 to n do 
    (setf s (random (length deck)))
	(setf r (random (length (nth s deck))))
	(setf card (nth r (nth s deck)))
	(setf (nth s deck) (remove card (nth s deck) :test #'equal))
    (setf hand (append hand (list card)))		
  )	
  hand
)

()

;find out how to write a function which accepts a proc as an argument
(defun selectby (arg hand **your-function-here**)
  (setf selectedcards nil)
  (loop for card in hand do 
    (if (equal arg (**your-function-here** (car card) (cadr card)))
	  (setf selectedcards (append selectedcards (list card)))
	  nil
	)  
  )
  selectedcards
)

(defun colorcards (colorarg hand)
  (setf cardsofcolor nil)
  (loop for card in hand do
	(if (equal colorarg (getcolor (car card) (cadr card)))
      (setf cardsofcolor (append cardsofcolor (list card)))
	  nil
	)
  )
  cardsofcolor	 
)

(defun getranks (suitarg hand)
  (setf cardsofsuit nil)
  (loop for card in hand do 
    (if (equal suitarg (getsuit (car card) (cadr card)))
	  (setf cardsofsuit (append cardsofsuit (list card)))
	  nil
	)
  )
  cardsofsuit  
)

(defun highcard (hand)
  
)

(defun getgreatest (intlist)
  (loop for int in intlist do
    (setq track 0)
    (loop for other in intlist do
      (if (> int other) (incf track))
    )
    (if (equal track (- (length intlist) 1)) (setq greatest int))
  )
  greatest  
 )  