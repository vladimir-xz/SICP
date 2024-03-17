#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (solution x n)
    (fast-expt x n 1 ))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt x n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt x (- n 2) (* a (square x))))
          (else (fast-expt x (- n 1) (* x a)))))

(check-equal? (solution 2 8) 256 )
