#lang sicp

(#%require rackunit)

(define (gcd a b)
        (if (= b 0)
            a
            (gcd b (remainder a b))))

(define (make-rat n d) (cons n d))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (mul-rat n d)
        (let ((x (gcd n d)))
        (display x)
        (cond ((and (< n 0) (> d 0))
                    (make-rat (- (/ n x)) (abs (/ d x))))
                ((and (> n 0) (< d 0)) 
                        (make-rat (- (/ n x)) (abs (/ d x))))
                (else 
                        (make-rat (abs (/ n x)) (abs (/ d x)))))))

(check-equal? (mul-rat 1 2) '(1 . 2))
(check-equal? (mul-rat (- 1) 2) '(-1 . 2))
(check-equal? (mul-rat (- 1) (- 2)) '(1 . 2))
(check-equal? (mul-rat 1 (- 2)) '(-1 . 2))
(check-equal? (mul-rat 2 4) '(1 . 2))