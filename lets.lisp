;(let ((x 'val1)(y 'val2)(z 'val3))
;(format t "x = ~a y = ~a z = ~a" x y z))

;(let ((a 76)(b 86)(c 96))
;(format t "a = ~2d b = ~2d c = ~2d" a b c))

;(let ((one 2) (two 2) (three 3))
;(+ one two three))

;((lambda (x) (let ((sum (+ x x)) (product (* x x))) (values sum product))) 10)

(defun avgtwo (x y)
  (let ((sum (+ x y)))
  (/ sum 2))
)
