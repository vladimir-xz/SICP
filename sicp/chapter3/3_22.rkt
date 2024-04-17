#lang sicp

(#%require rackunit)

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((null? front-ptr)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair)
               dispatch)
              (else
                (set-cdr! rear-ptr new-pair)
                (set! rear-ptr new-pair)
                dispatch))))
    (define (delete-queue!)
              (set! front-ptr (cdr front-ptr))
              dispatch)
    (define (dispatch m)
            (cond [(eq? m 'insert-queue!) insert-queue!]
                    [(eq? m 'delete-queue!) (delete-queue!)]
                    [(eq? m 'front-queue) (car front-ptr)]
                    [else (error "what do you mean?")]))
    dispatch))

(define q (make-queue))

((q 'insert-queue!) 'a)
(check-equal? (q 'front-queue) 'a)

((q 'insert-queue!) 'b)
(check-equal? (q 'front-queue) 'a)

(q 'delete-queue!)
(check-equal? (q 'front-queue) 'b)