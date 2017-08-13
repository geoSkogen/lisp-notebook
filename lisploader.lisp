(setf userpath "c\:\/users\/geoseph")
(setf dirpath "\/documents\/my_git_repos\/lisp-notebook\/lisp-notebook\/")

(defun lispload (invalue)
  (setf fullpath (concatenate 'string userpath dirpath invalue "\.lisp"))
  (load fullpath)
)

(defun my-new-path-is (invalue)
 (setf dirpath invalue)
)
