#lang sicp

(#%require rackunit)

(define (last-pair items)
    (define (iter a count)
            (if (null? a)
                count
                (iter (cdr a) (car a))))
    (iter items 0))



(define nil '())

(check-equal? (last-pair (list 1 2 3 4)) 4)
(check-equal? (last-pair '(4 8 12 16 1)) 1)
(check-equal? (last-pair (list 23 72 149 34)) 34)

