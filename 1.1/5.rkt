#lang simply-scheme

(define (last-element? xs)
  (if (empty? (butfirst xs)) #t #f))

(define (parse-word word)
  (if (eq? (last word) 'e) (cons word `()) `()))

(define (ends-e sentence)
  (if
   (last-element? sentence)
   (parse-word sentence)
   (append (parse-word (first sentence)) (ends-e (butfirst sentence)))))

(ends-e `(please put the salami above the blue elephant))

#|
    (please put the salami above) `(please the)
        (append (parse-word please) `(the))
            (append (parse-word put) `(the))
                (append (parse-word the) `())
                    (append `() `())
                        abovt
|#
