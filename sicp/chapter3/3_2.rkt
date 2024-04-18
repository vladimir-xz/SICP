#lang sicp

(#%require rackunit)

(define (make-monitored f)
        (let [
                (times 0)
        ]
        (define (mf item) 
            (cond [(eq? item 'how-many-calls?) times]
                [(eq? item 'reset-count) 
                    (begin (set! times 0)
                            times)]
                [else (begin (set! times (+ 1 times))
                        (f item))]))
        mf))

(define s (make-monitored sqrt))

(check-equal? (s 100) 10)
(check-equal? (s 25) 5)
(check-equal? (s 'how-many-calls?) 2)
(check-equal? (s 'reset-count) 0)
(check-equal? (s 100) 10)
(check-equal? (s 'how-many-calls?) 1)