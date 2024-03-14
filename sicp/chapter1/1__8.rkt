#lang sicp

(#%require rackunit)

(define (square x)
    (* x x))

(define (improve guess x)
    (average guess (/ x (square guess))))

(define (average x y)
    (/(+ (* 2 x) y) 3))

(define (good-enough? guess x )
    (< (abs (- (sqr guess) x)) 
     (* 0.0000001 guess)))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
            x)))

(define (cube-root x)
    (sqrt-iter 1.0 x))


(check-equal? (cube-root 27)  3.0)
