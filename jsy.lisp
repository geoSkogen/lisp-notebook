
(defun just-say-yes (thislist)
  (setf yes-like '(yeah sure OK alright certainly absolutely affirmative ofcourse whynot letsdothis yes indeed verywell))
  (mapcar #'(lambda (arg) (if (not (member arg yes-like)) 'yes arg)) thislist)
) 