#lang sicp

(#%require rackunit)

(define tolerance 0.000001)

(define (average-dump f) 
        (lambda (x) (/ (+ x (f x)) 2)))

(define (fixed-point f first-guess)
    (define tolerance 0.000001)
    (newline)
    (display first-guess)
    (newline)
    (define (close-enough? v1 v2)
            (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next ((average-dump f) guess)))
        (newline)
        (display guess)
        (newline)
        (if (close-enough? guess next)
            next
            (try next))))
(try first-guess))

(define (log-close x)
    (fixed-point (lambda (y) (/ (log 1000) (log y))) x))

(check-equal? (round (fixed-point (lambda (y) (/ (log 1000) (log y))) 2.0)) 5.0)
(check-equal? (round (* 100 (fixed-point cos 1.0))) 74.0)
(check-equal? (round (* 100 (fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0))) 126.0)