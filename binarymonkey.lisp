

(setf monk (list 109 111 110 107 101 121))

(defun binmonk ()
  (with-open-file
    (b "../../users/geoseph/lisp_files/thatmonkey.txt" :direction :output :element-type 'unsigned-byte :if-exists :supersede)
    (loop for myval in monk do
      (write-byte myval b)
    )
  )
)
