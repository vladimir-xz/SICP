#lang sicp

(#%require rackunit)

(define (f n)
  (if (< n 3) 
        n
        [+ (f (- n 1)) 
            (f (- n 2)) 
            (f (- n 3))]))

(define (f-iter-in a b c count)
    (if (< count 3)
        a
        (f-iter-in (+ a b c)
                a
                b
                (- count 1))))

(define (f-iter n)
    (f-iter-in 3 2 1 n))


(check-equal? (f 4) 6)
(check-equal? (f-iter 4) 11)
(check-equal? (f 3) 4)
(check-equal? (f-iter 1) 1)