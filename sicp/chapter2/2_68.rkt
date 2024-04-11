#lang sicp

(#%require rackunit)

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (encode-symbol x tree)
        (if [leaf? tree]
            (if [eq? (symbol-leaf tree) x]
                '()
                (error "symbol not found"))
            (let [
                    (left-symb (symbols (left-branch tree)))
            ]
            (cond [(equal? (list x) left-symb) (list 0)]
                    [else (cons 1 (encode-symbol x (right-branch tree)))]))))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define test-message '(A D A B B C A))

(define encoded-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))


(check-equal? (encode test-message sample-tree) encoded-message)
(check-equal? (encode '(A B C D) sample-tree) '(0 1 0 1 1 1 1 1 0))

