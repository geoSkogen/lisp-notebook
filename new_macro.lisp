;(defun further (int) (if (> int 0) (+ 1 int) (if (equal 0 int) 'oil (- int 1))))

;(defun geteven (int) (if (oddp int) (+ 1 int) 'oil))

;(defun mynot (input) (if (equal t input) nil (if (equal nil input) t 'oil))

(defun mysort (int1 int2) (if (> int1 int2) (list int2 int1) (list int1 int2)))
