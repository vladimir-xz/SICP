#lang sicp

(#%require rackunit)

(define (make-interval a b) (cons a b))

(define (lower-bound i)
	(car i))

(define (upper-bound i)
	(cdr i))

(define (make-center-width c w)
        (make-interval (- c w) (+ c w)))

(define (center i)
    (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
    (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
        (let (
               (w (* (/ c 100) p))
            )
        (make-center-width c w)))

(define (percent c)
        (let (
              (centr (center c))
              (width (width c))
            )
        (round (/  width (/ centr 100)))))

(define center-test 4)

(define interval (make-interval 3 5))

(define center-interval (make-center-percent center-test 25))

(define center-test2 100)

(define interval2 (make-interval 90 110))

(define center-interval2 (make-center-percent center-test2 10))


(check-equal? (center interval) center-test)
(check-equal? interval center-interval)
(check-equal? (center interval2) center-test2)
(check-equal? interval2 center-interval2)
(check-equal? (percent interval) 25)
(check-equal? (percent center-interval2) 10)
