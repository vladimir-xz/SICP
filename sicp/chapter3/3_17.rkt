#lang sicp

(#%require rackunit)

(define (count-pairs x)
        (let [
                (array '())
        ]
        (define (present? x arr)
            (cond [(null? arr) #f]
                    [(not (pair? arr)) #t]
                    [(equal? (car array) x) #t]
                    [else (or (present? x (cdr arr))
                                (present? x (car arr)))]))
        (define (add-to-list x)
            (set! array (cons x array)))
        (define (iter x count)
            (if (not (pair? x))
                count
                (if (pair? (car x))
                    (if (present? (car x) array)
                        (iter (cdr x) count)
                        (begin (add-to-list (car x)) 
                            (+ (iter (car x) (+ count 1))
                            (iter (cdr x) count)
                            )))
                    (+ (iter (car x) (+ count 1))
                            (iter (cdr x) count)
                            ))))
(iter x 0)))

(define nil '())
(define p1 (cons 'a nil))
(define p2 (cons p1 nil))
(define p3 (cons p1 p2))
(define p4 (cons p2 p1))
(define p5 (cons p1 p1))
(define p6 (cons p5 p5))


(check-equal? (count-pairs p3) 3)
(check-equal? (count-pairs '()) 0)
