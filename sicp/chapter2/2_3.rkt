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

(define (make-rectangle point-1 point-3)
        (let (
               (x1 (x-point point-1))
               (y1 (y-point point-1))
               (x3 (x-point point-3))
               (y3 (y-point point-3))
            )
        (let (
                (point-2 (make-point x1 y3))
        )
        (cons (make-segment point-1 point-2) (make-segment point-2 point-3)))))

(define (length segment)
        (let (
              (end (end-segment segment))
              (start (start-segment segment))
            )
        (if (= (x-point end) (x-point start))
            (+ (y-point end) (y-point start))
            (+ (x-point end) (x-point start)))))

(define (rectangle-square rect)
        (let (
                (seg1 (car rect))
                (seg2 (cdr rect))
            )
        (* (length seg1) (length seg2))))

(define (rectangle-perimeter rect)
        (let (
                (seg1 (car rect))
                (seg2 (cdr rect))
            )
        (* 2 (+ (length seg1) (length seg2)))))

(define start-point (make-point 0 0))
(define end-point (make-point 2 3))

(define rectangle (make-rectangle start-point end-point))

(check-equal? (rectangle-square rectangle) 6)
(check-equal? (rectangle-perimeter rectangle) 10)