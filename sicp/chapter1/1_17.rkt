#lang sicp

(#%require rackunit)

(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (* a b)
        (cond ((= b 1) a)
            ((even? b) (* (double a) (halve b)))
            (else (+ a (* a (- b 1))))))

(check-equal? (* 5 3) 15)
