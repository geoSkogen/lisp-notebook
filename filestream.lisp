(defun wofmonkey ()
(with-open-file (s "../../users/geoseph/documents/my_git_repos/lisp-notebook/lisp-notebook/mymonkey.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
  (format s "Come to the Oil Boil, ~%Bernard, ~%And we'll all be boiled in oil"))
)

(defun woflinebreak ()
(with-open-file (s "../../users/geoseph/documents/my_git_repos/lisp-notebook/lisp-notebook/mymonkey.txt" :direction :input)
  (format t "~&;;; ~A" (read-line s)))
)

(defun wofsignature ()
(with-open-file (s "../../users/geoseph/documents/my_git_repos/lisp-notebook/lisp-notebook/mymonkey.txt" :direction :input)
  (do ((line (read-line s) (read-line s nil 'eof)))
      ((eq line 'eof) "-- Doctor Sprugbacher")
      (format t "~&;;; ~A~%" line)))
)