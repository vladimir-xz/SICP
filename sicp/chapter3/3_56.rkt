#lang sicp


(#%require lazy)
(#%require lazy/force)

(#%require rackunit)
(#%require racket/stream)

(define (cons-stream x s) (cons x s))

(define (stream-null? x) (null? x))

(define (stream-car stream) (car stream))

(define (stream-cdr stream) (! (cdr stream)))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc . list-of-stream)
    (if (null? (car list-of-stream))
        '()
        (cons-stream
            (apply proc 
                   (map (lambda (s)
                            (stream-car s))
                        list-of-stream))
            (apply stream-map 
                   (cons proc (map (lambda (s)
                                       (stream-cdr s))
                                   list-of-stream))))))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (cond ((< s1car s2car)
                  (cons-stream s1car (merge (stream-cdr s1) s2)))
                 ((> s1car s2car)
                  (cons-stream s2car (merge s1 (stream-cdr s2))))
                 (else
                  (cons-stream s1car
                               (merge (stream-cdr s1)
                                      (stream-cdr s2)))))))))

(define S (cons-stream 1 
                (merge (scale-stream S 2)
                        (merge (scale-stream S 3)
                                (scale-stream S 5)))))

(check-equal? (! (stream-ref S 0)) 1)
(check-equal? (! (stream-ref S 1)) 2)
(check-equal? (! (stream-ref S 2)) 3)
(check-equal? (! (stream-ref S 3)) 4)
(check-equal? (! (stream-ref S 4)) 5)
(check-equal? (! (stream-ref S 5)) 6)
(check-equal? (! (stream-ref S 6)) 8)
(check-equal? (! (stream-ref S 7)) 9)
(check-equal? (! (stream-ref S 8)) 10)
(check-equal? (! (stream-ref S 9)) 12)                