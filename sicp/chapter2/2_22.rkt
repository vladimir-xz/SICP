#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (square-list items)
        (define (iter things answer)
                    (newline)
                    (display answer)
                (if (null? things)
                    answer
                    (iter (cdr things)
                            (cons (square (car things))
                                    answer))))
        (iter items nil))