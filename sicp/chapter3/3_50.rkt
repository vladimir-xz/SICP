#lang sicp

(#%require rackunit)
(#%require racket/stream)

(define (stream-map proc . argstreams)
    (if (stream-null? (car argstreams))
        the-empty-stream
        (stream-cons
            (apply proc (map stream-car argstreams))
            (apply stream-map
                (cons proc (map stream-cdr argstreams))))))

(define (stream-null? s) (stream-empty? s))

(define the-empty-stream empty-stream)

(define (cons-stream first rest) (stream-cons first rest))

(define (stream-car stream) (stream-first stream))

(define (stream-cdr stream) (stream-rest stream))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))



(define first-stream (stream-enumerate-interval 1 5))
(define second-stream (stream-enumerate-interval 6 10))

(define stream-sum (stream-map + first-stream second-stream))
(check-equal? (stream-car stream-sum) 7)
(check-equal? (stream-car (stream-cdr stream-sum)) 9)

(define stream-product (stream-map * first-stream second-stream))
(check-equal? (stream-car stream-product) 6)
(check-equal? (stream-car (stream-cdr stream-product)) 14)