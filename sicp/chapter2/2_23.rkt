#lang sicp

(#%require rackunit)

(define nil '())

(for-each (lambda (x) (newline) (display (cons x nil)))
            (list 10 20 30 40))

