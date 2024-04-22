#lang sicp


(#%require lazy)
(#%require lazy/force)

(#%require rackunit)
(#%require racket/stream)

(define (mul-streams s1 s2)
            (stream-map * s1 s2))

(define factorials (cons-stream 1 (mul-streams factorials (cdr integers))))

(define (cons-stream x s) (cons x s))

(define (stream-car stream) (car stream))

(define (stream-cdr stream) (! (cdr stream)))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define ones (cons-stream 1 ones))

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

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define integers (cons-stream 1 (add-streams ones integers)))


(check-equal? (! (stream-ref (mul-streams integers integers) 0)) 1)
(check-equal? (! (stream-ref (mul-streams integers integers) 1)) 4)

(check-equal? (! (stream-ref factorials 0)) 1)
(check-equal? (! (stream-ref factorials 2)) 6)
(check-equal? (! (stream-ref factorials 3)) 24)