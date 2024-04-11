#lang sicp

(#%require rackunit)

(define (key entry) (car entry))

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (lookup x tree)
        (if (null? tree) 
            false
            (let [
                    (key (key (entry tree)))
                    (value (entry tree))
            ]
            (cond [(= x key) value]
                    [(< x key) (lookup x (left-branch tree))]
                    [(> x key) (lookup x (right-branch tree))]
                    [else (error "key did not find")]))))

(define (make-tree entry left right)
  (list entry left right))

(define test-tree 
  (make-tree '(5 "Five") 
    (make-tree '(3 "Three") 
      (make-tree '(2 "Two") '() '())
      (make-tree '(4 "Four") '() '()))
    (make-tree '(8 "Eight") '() '())))


(check-equal? (lookup 5 test-tree) '(5 "Five"))
(check-equal? (lookup 2 test-tree) '(2 "Two"))
(check-equal? (lookup 6 test-tree) #f)
(check-equal? (lookup 8 test-tree) '(8 "Eight"))