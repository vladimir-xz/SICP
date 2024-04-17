#lang sicp

(#%require rackunit)

(define (1count-pairs x)
    (begin (display x) (newline) (display (pair? x)) (newline))
    (if (not (pair? x))
        0
        (+ (1count-pairs (car x))
            (1count-pairs (cdr x))
            1)))

(define (count-pairs x)
    (define (iter x temp)
        (begin (display temp) (newline) )
        (if (not (pair? x))
        temp
        (+ (iter (car x) (+ temp 1))
            (iter (cdr x) temp)
            )))
    (iter x 0))

(define x (cons 'a 'b))
(define y (cons 'c 'd))
(define C3 (cons x y))

(check-equal? (count-pairs C3) 4)
