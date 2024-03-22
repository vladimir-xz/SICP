#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (prime? n)
        (= n (smallest-divisor n)))

(define (smallest-divisor n)
        (find-divisor n 2))

(define (find-divisor n test-divisor)
        (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
(= (remainder b a) 0))

(define (timed-prime-test n)
        (newline)
        (display n)
        (start-prime-test n (runtime)))

        (define (start-prime-test n start-time)
                (if (prime? n)
                           (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
        (display " *** ")
        (display elapsed-time))

(define (search-for-primes start end) 
   (define (iter n) 
     (cond ((<= n end) (timed-prime-test n) (iter (+ n 2))))) 
   (iter (if (even? start) (+ start 1) start))) 

#| (check-equal? (search-for-primes 1000000 1000080)) |#




