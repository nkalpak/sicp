#lang simply-scheme

#|
  Take a sentence as an argument
    Replace "I/me" with "you"
    Replace "you" with "me"
    First word, replace "you" with "I"
|#

#|
  switch (You told me)
    append (You) (butfirst (You told me))
      append (told) (butfirst (told me))
        me -> you
|#

#|
  switch (You told me)
    append (process me) (switch (butlast (You told me)))
|#

(define (consa x xs)
  (append xs (cons x `())))

(define (last-element? xs)
  (if (empty? (butfirst xs)) #t #f))

(define (process-word word)
  (cond ((equal? word 'I) 'you)
        ((equal? word 'me) 'you)
        ((equal? word 'you) 'me)
        (else word)))

(define (process-word-start word)
  (if (equal? word 'You) 'I (process-word word)))

(define (switch sentence)
  (if (last-element? sentence)
      (cons (process-word-start word) `())
      (consa (process-word (last sentence)) (switch (butlast sentence)))))

(switch `(You told me that I should wake you up))