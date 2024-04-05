#lang sicp

(#%require rackunit)

(define (element-of-set? x set)
        (cond ((null? set) false)
            ((equal? x (car set)) true)
            (else (element-of-set? x (cdr set)))))


(define (union-set set1 set2)
        (cond [(null? set1) set2]
                [(null? set2) set1]
                [(element-of-set? (car set1) set2)
                    (union-set (cdr set1) set2)]
                [else (union-set (cdr set1) (cons (car set1) set2))]))

(define first '(1 0 5 2 9))
(define second '(10 1 19 5 50))
(define result (union-set first second))

(check-equal? (length result) 8)

(check-not-equal? result '(0 1 2 5 9 10 19 50))

(check-not-equal? (member 0 result) #f)
(check-not-equal? (member 2 result) #f)
(check-not-equal? (member 9 result) #f)
(check-not-equal? (member 10 result) #f)
(check-not-equal? (member 1 result) #f)
(check-not-equal? (member 19 result) #f)
(check-not-equal? (member 5 result) #f)
(check-not-equal? (member 50 result) #f)

(check-equal? (union-set first '()) first)
(check-equal? (length (union-set '() second)) (length second))