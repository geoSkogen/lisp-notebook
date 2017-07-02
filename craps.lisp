(setf craps-score 0)
(setf craps-trial 0)
(setf sum 0)

(defun craps ()
  (setf roll 0)
  (setf sum 0)
  (setf report '-)

  (defun throwdice (n)

    (defun rolldie ()
      (setf roll (+ (random 6) 1))
      (setf sum (+ sum roll))
      roll
    )

    (defun gameoverp ()
      (if (not (equal report '-))
        (cond ((equal report 'instant-win) (resetcraps 'win))
              (t (resetcraps 'lose))
        )
        (if (and (equal sum craps-score) (not (equal craps-trial 1))) (resetcraps 'win) '(call (craps) again to play on))
      )
    )

    (defun resetcraps (winloss)
      (setf craps-score 0)
      (setf craps-trial 0)
      (list 'game 'over '- 'you winloss '- 'call '(craps) 'again 'to 'start 'over)
    )

    (defun dumpdata (str)
      (if (equal craps-trial 0)
        (cond ((or (equal sum 7) (equal sum 11)) (setf report 'instant-win))
              ((or (equal sum 12) (equal sum 2) (equal sum 3)) (setf report 'instant-loss))
              (t (setf craps-score sum))
        )
        (if (equal sum 7) (setf report 'game-over))
      )
      (incf craps-trial)
      (list results str 'your-roll= sum report 'trials= craps-trial 'number-to-match= craps-score (gameoverp))
    )

    (if (> n 0) (setf result (list (rolldie))) nil)
    (if (> n 1) (setf results (cons (rolldie) result)) nil)
    (if (> n 2)
      (loop for nextroll from 3 to n
        do (setf results (cons (rolldie) results))
      )
      nil
    )
    (if (> n 0 )
      (if (equal n 1) result
        (if (equal n 2)
          (cond ((and (equal (first results) 1) (equal (cadr results) 1)) (dumpdata 'snake-eyes))
                ((and (equal (first results) 6) (equal (cadr results) 6)) (dumpdata 'boxcars))
                (t (dumpdata '-))
          )
          (dumpdata '-)
        )
      )
     nil
    )
  )

  (throwdice 2)
)
