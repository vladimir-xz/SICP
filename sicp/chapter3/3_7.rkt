#lang sicp

(#%require rackunit)

(define (make-joint acc old-pass new-pass)
  (define password new-pass)
  (define attempt-counter 0)
  (define (call-the-cops) (error "Cops called"))
  (define (check-pass new)
    (cond [(eq? new password) (set! attempt-counter 0)]
          [(>= attempt-counter 7) (call-the-cops)]
          [else (set! attempt-counter (+ attempt-counter 1)) (error "Wrong password")]))

  (lambda (pass m)
    (check-pass pass)
    (acc old-pass m)))

