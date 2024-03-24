#lang sicp

(#%require rackunit)

(define (product term a inc b)
  (define (iter a result) 
           (if (> a b)
                result
                (iter (inc a) (* result (term a)))))
    (iter a 1))

(define (product-rec term a inc b) 
           (if (> a b)
                1
                (* (term a) (product-rec term (inc a) inc b))))

(define (factorial a)
    (product identity 1 inc a))

(define (inc n) (+ n 1))

(define (square x) (* x x))

(define (identity x) x)

(check-equal? (product square 1 inc 3) 36)
(check-equal? (product identity 3 inc 5) 60)
(check-equal? (factorial 5) 120)