(defun tempsafe (invalue scale)

  (defun zones (x)
    (cond ((and (or (equal x 40) (< x 40)) (> x 31)) 'safe-cold-holding)
          ((or (< x 31) (equal x 31)) 'frozen)
          ((or (or (> x 41) (equal x 40)) (< x 140)) 'danger-zone)

          ((or (equal x 212) (> x 212)) 'boiling-point-of-water')
          (t 'whateva)
    )
  )

  (cond ((and (numberp invalue) (or (equal scale 'f) (equal scale 'c)))
         (if (equal scale 'c) (zones (setq newvalue (+ (/ (* 9 invalue) 5) 32))) (zones (setq newvalue invalue))))
        ((not (numberp invalue)) 'first-argument-must-be-a-number)
        ((not (or (equal scale 'f) (equal scale 'c))) 'second-argument-must-be-c-or-f)
        (t 'crazyinput)
  )
)
