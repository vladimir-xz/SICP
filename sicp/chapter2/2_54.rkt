#lang sicp

(#%require rackunit)

(define (equal-proc? x y)
        (cond [(and (null? x) (null? y)) #t]
                [(or (null? x) (null? y)) #f]
                [(not (eq? (car x) (car y))) #f]
                [else (equal-proc? (cdr x) (cdr y))]))

(check-equal? (equal? '(this is a list) '(this is a list)) #t)
(check-equal? (equal? '(this is a list) '(this (is a) list)) #f)

(check-equal? (equal-proc? '(this is a list) '(this is a list)) #t)
(check-equal? (equal-proc? '(this is a list) '(this (is a) list)) #f)