#lang sicp

(#%require rackunit)

(define (same-parity x . z)
        (let (
                (ifEven (even? x))
            )
        (define (iter list)
                (cond ((null? list) '())
                        ((eq? ifEven (even? (car list))) 
                            (cons (car list) (iter (cdr list))))
                        (else (iter (cdr list)))))
        (cons x (iter z))))

(define (even? x)
    (= (remainder x 2) 0))

(check-equal? (same-parity 1 2 3 4 5 6 7) '(1 3 5 7))
(check-equal? (same-parity 2 3 4 5 6 7) '(2 4 6))
(check-equal? (same-parity 1) '(1))