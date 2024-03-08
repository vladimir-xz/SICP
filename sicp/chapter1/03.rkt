#lang sicp

(#%require rackunit)

(define (sqr x) (* x x))

(define (final x y z)
    (cond ((and (> x y) (> z y)) (+ (sqr x) (sqr z)))
          ((and (> x z) (> y z)) (+ (sqr x) (sqr y)))
          (else (+ (sqr y) (sqr z)))))


(check-equal? (final 10 0 2) 104 )