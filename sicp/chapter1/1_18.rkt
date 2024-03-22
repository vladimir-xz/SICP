#lang sicp

(#%require rackunit)

(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (mul-iter x y)
    (define (fast-mult x y z) 
        (cond ((= y 0) z)
              ((= y 1) (+ x z))
              ((even? y) (fast-mult (double x) (halve y) z))
              (else (fast-mult x (- y 1) (+ z x)))))
    (fast-mult x y 0))

(check-equal? (mul-iter 20 3) 60)