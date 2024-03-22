#lang sicp

(#%require rackunit)

(define (report-prime elapsed-time n)
        (newline)
        (display n)
        (display " *** *****")
        (display (- (runtime) elapsed-time))
        (newline))

(define (square x) (* x x))

(define (next x)
        (if (= x 2) 3 (+ x 2)))

(define (smallest-divisor n)
        (find-divisor n 2 (runtime)))

(define (find-divisor n test-divisor time)
        (cond ((> (square test-divisor) n) (report-prime time n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor) time))))

(define (divides? a b)
(= (remainder b a) 0))

(check-equal? (smallest-divisor 10007) 10007)
(check-equal? (smallest-divisor 10009) 10009)
(check-equal? (smallest-divisor 10037) 10037)
(check-equal? (smallest-divisor 100003) 100003)
(check-equal? (smallest-divisor 100019) 100019)
(check-equal? (smallest-divisor 100043) 100043)
(check-equal? (smallest-divisor 1000003) 1000003)
(check-equal? (smallest-divisor 1000033) 1000033)
(check-equal? (smallest-divisor 1000037) 1000037)


#| 10007 - |#
#| 10009 - |#
#| 10037 - |#
#| 100003 - |#
#| 100019 - |#
#| 100043 - |#
#| 1000003 - |#
#| 1000033 - |#
#| 1000037 - |#