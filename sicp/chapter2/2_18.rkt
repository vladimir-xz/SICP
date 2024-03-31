#lang sicp

(#%require rackunit)

(define nil '())

(define (reverse list)
        (define (iter list temp)
                (if (null? list)
                    temp
                    (iter (cdr list) (cons (car list) temp))))
        (iter list '()))

(check-equal? (reverse (list 1)) (list 1))
(check-equal? (reverse (list 2 4 6 9)) (list 9 6 4 2))
(check-equal? (reverse (list 1 4 9 16 25)) '(25 16 9 4 1))