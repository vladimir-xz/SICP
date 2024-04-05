#lang sicp

(#%require rackunit)

(define (accumulate op initial sequence)
        (if (null? sequence)
                initial
                (op (car sequence)
                (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
        (accumulate (lambda (x y) 
                    (+ x y))
                    0
                    (map (lambda (x) 
                        (if (pair? x)
                            (count-leaves x)
                            1)) t)))

(define x (cons (list 1 2) (list 3 4)))


(check-equal? (count-leaves (list 1 2 (list 3 (list 4 5)))) 5)
(check-equal? (count-leaves (list x x)) 8)
