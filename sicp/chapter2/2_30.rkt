#lang sicp

(#%require rackunit)

(define (square-tree tree )
        (map (lambda (x) (
                if (pair? x)
                    (square-tree x)
                    (* x x)
        )) tree))

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(check-equal? (square-tree tree) '(1 (4 (9 16) 25) (36 49)))