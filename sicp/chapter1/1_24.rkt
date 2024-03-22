#lang sicp

(#%require rackunit)


(define (add x) 
        (if (= (remainder x 2) 0) (+ 1 x)
        (+ x 2)))

(define (sub-one x) (- x 1))

(define (square x) (* x x))

(define (expmod base exp m)
        (cond ((= exp 0) 1)
                ((even? exp)
                (remainder (square (expmod base (/ exp 2) m))
                        m))
                (else
                    (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
    (define (try-it a)
            (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
        (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (report-prime elapsed-time)
        (display " *** ")
        (display elapsed-time))
        (display " ***   ")

(define (search-for-primes spectr)
    (iter spectr 3 (runtime)))

(define (iter number amount start-time)
    (newline)
    (display (- (runtime) start-time))
    (newline)
    (cond ((= amount 0) (report-prime (- (runtime) start-time)))
          ((fast-prime? number 4) 
                (display number)
                (iter (add number) (sub-one amount) start-time))
          (else 
                (iter (add number) amount start-time))))

