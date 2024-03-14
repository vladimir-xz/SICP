#lang sicp

(#%require rackunit)

(define (Akkerman x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (Akkerman (- x 1)
                        (Akkerman x (- y 1))))))

(check-equal? (Akkerman 1 10) 1024)
(check-equal? (Akkerman 2 4) 65536)
(check-equal? (Akkerman 3 3) 65536)