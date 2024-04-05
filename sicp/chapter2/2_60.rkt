#lang sicp

(#%require rackunit)

(define nill '())

(define (element-of-set? x set)
        (cond ((null? set) false)
            ((equal? x (car set)) true)
            (else (element-of-set? x (cdr set)))))


(define (union-set set1 set2)
        (cond [(null? set1) set2]
                [(null? set2) set1]
                [else (union-set (cons (car set2) set1) (cdr set2))]))

(define (intersection-set set1 set2)
        (cond [(null? set1) nill]
                [(null? set2) nill]
                [(element-of-set? (car set1) set2)
                        (cons (car set1) (intersection-set (cdr set1) set2))]
                [else (intersection-set (cdr set1) set2)]))

(define first '(1 2 3 5 3))
(define second '(3 4 5 6 5))

(check-equal? (union-set first second) '(5 6 5 4 3 1 2 3 5 3))
(check-equal? (intersection-set first second) '(3 5 3))
(check-equal? (intersection-set second first) '(3 5 5))
