#lang sicp

(#%require rackunit)

(define nil '())

(define (append list1 list2)
        (if (null? list1)
            list2
            (cons (car list1) (append (cdr list1) list2))))


 (define (fringe x) 
        (cond ((null? x) nil) 
                ((pair? x) 
                (append (fringe (car x)) 
                        (fringe (cdr x)))) 
                (else (list x)))) 


(define x (list (list 1 2) (list 3 4)))
(define y (list x x))

(check-equal? (fringe x) (list 1 2 3 4))
(check-equal? (fringe y) '(1 2 3 4 1 2 3 4))