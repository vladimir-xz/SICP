#lang sicp

(#%require rackunit)

(define (make-account wallet password)
        (define (withdraw amount)
                (if (>= wallet amount)
                    (begin (set! wallet (- wallet amount))
                        wallet)
                    "Insufficient funds"))
        (define (deposit amount)
                (if (> 0 amount)
                "Insufficient funds"
                (begin (set! wallet (+ wallet amount))
                        wallet)))
        (define (dispatch pass prompt)
                (if (not (eq? pass password))
                    (error "Incorrect password")
                    (cond [(eq? prompt 'withdraw) withdraw]
                            [(eq? prompt 'deposit) deposit]
                            [else (error "What do you need?")])))
        dispatch)


(define acc (make-account 100 'secret-password))

(define incorrect-message "Incorrect password")

(define insufficient-message "Insufficient funds")

(check-equal? ((acc 'secret-password 'withdraw) 40) 60)
(check-equal? ((acc 'secret-password 'deposit) 40) 100)
(check-equal? ((acc 'incorrect-secret-password 'withdraw) 40) incorrect-message)
(check-equal? ((acc 'secret-password 'deposit) -10) insufficient-message)