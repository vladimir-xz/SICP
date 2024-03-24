#lang sicp

(#%require rackunit)

(define (filtered-accumulate combiner null-value term a next b filter)
        (define (iter a null-value)
                (cond ((> a b) null-value)
                    ((filter a) (iter (next a) (combiner null-value (term a))))
                    (else (iter (next a) null-value))))
        (iter a null-value))

(define (inc n) (+ n 1))

(define (square x) (* x x))

(define (identity x) x)

#| a. (filtered-accumulate * 1 square 1 inc 10 prime?) |#
#| b. (filtered-accumulate * 1 square 1 inc n (not (= (remainder n a) 0))) |#

(check-equal? (filtered-accumulate * 1 square 1 inc 3 odd?) 9)
(check-equal? (filtered-accumulate * 1 identity 3 inc 5 odd?) 15)
(check-equal? (filtered-accumulate + 0 identity 1 inc 10 odd?) 25)