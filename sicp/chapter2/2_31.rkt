#lang sicp

(#%require rackunit)

(define nil '())

(define (square-tree tree) (tree-map square tree))

(define (square x) (* x x))

(define (tree-map act tree)
        (map (lambda (x) (
            if (pair? x)
                (tree-map act x)
                (act x)))
            tree))

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(check-equal? (square-tree tree)  '(1 (4 (9 16) 25) (36 49)))