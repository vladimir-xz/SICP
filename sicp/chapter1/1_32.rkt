#lang sicp

(#%require rackunit)

(define (accumulate combiner null-value term a next b)
    (define (iter a null-value)
            (if (> a b)
                null-value
                (iter (next a) (combiner (term a) null-value))))
    (iter a null-value))

(define (accumulate-rec combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (inc n) (+ n 1))

(define (square x) (* x x))

(define (identity x) x)

(check-equal? (accumulate-rec * 1 square 1 inc 3) 36)
(check-equal? (accumulate-rec * 1 identity 3 inc 5) 60)
(check-equal? (accumulate-rec + 0 identity 1 inc 10) 55)
