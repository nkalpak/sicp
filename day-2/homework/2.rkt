#lang simply-scheme

(define (last-element? xs)
  (if (empty? (butfirst xs)) #t #f))

(define (square x) (* x x))

(define (squares xs)
  (if (last-element? xs)
      (cons (square (first xs)) `())
      (cons (square (first xs)) (squares (butfirst xs)))))

#|
  squares (1 2 3)
    = squares (1 2)
      = squares (1)
        = 1
|#

#|
  squares (1 2 3)
    cons (square 1) (squares 2 3)
      cons (square 2) (squares 3)
|#

#|
  squares (1 2 3)
    = append (square 1) (square 2) (square 3)
|#

#|
  squares (1 2 3)
    = append (square (first (1 2 3))) (squares (butfirst (1 2 3)))
|#

#|
  squares (1 2 3)
    = (2 3) + squares (1 2)
      = (2) + squares (1)

  squares (1 2 3)
    = (2 3) + (2, 1)
      = (2, 1) + 1
|#

(squares `(1 2 3))