#lang sicp

(#%require rackunit)

(define (make-point x y)
    (cons x y))

(define (x-point point)
    (car point))

(define (y-point point)
    (cdr point))

(define (make-segment point-x point-y)
    (cons point-x point-y))

(define (start-segment segment)
        (car segment))

(define (end-segment segment)
        (cdr segment))

(define (midpoint-segment segment)
        (let (
              (start-x (x-point (start-segment segment)))
              (end-x (x-point (end-segment segment)))
              (start-y (y-point (start-segment segment)))
              (end-y (y-point (end-segment segment)))
            )
        (let (
              (mid-x (/ (+ start-x end-x) 2))
              (mid-y (/ (+ start-y end-y) 2))
            )
        (make-point mid-x mid-y))))


(define p1 (make-point 2 3))
(define p2 (make-point 4 5))

(define s (make-segment p1 p2))

(check-equal? (make-segment p1 p2) '((2 . 3) 4 . 5))
(check-equal? (midpoint-segment s) '(3 . 4))
(check-equal? (start-segment s) p1)
(check-equal? (end-segment s) p2)
(check-equal? (x-point p1) 2)
(check-equal? (y-point p2) 5)