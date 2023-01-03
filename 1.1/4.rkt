#lang simply-scheme

#|
    ordered (1 2 3)
        and (is-asc 1 2) (ordered (butfirst (butfirst xs)))
|#

(define (last-element? xs) (if (empty? (butfirst xs)) #t #f))

(define (ordered? xs)
  (if (last-element? xs)
      #t
      (and
       (<= (first xs) (first (butfirst xs)))
       (ordered? (butfirst xs)))))

(ordered? `(8 3 6 9 12))