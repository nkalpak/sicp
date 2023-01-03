#lang simply-scheme

(define (broken xs)
  (or (= (first xs) 0) (broken (butfirst xs))))

(broken `(1 2 0 3))

#|
    (1 2 0)
        (or (= 1 0) (broken (2 0)))
            (or (= 2 0)) (broken (0))
                (or (= 0 0)) (broken `())
|#