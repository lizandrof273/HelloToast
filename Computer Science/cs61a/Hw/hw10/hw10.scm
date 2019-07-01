(define (accumulate combiner start n term)
  (if (eq? n 0) start (combiner(accumulate combiner start (- n 1) term) (term n)))
)

(define (accumulate-tail combiner start n term)
  (define (helper-accumulate var count)
    (if (eq? var 0) count (helper-accumulate (- var 1)
     (combiner (term var)))
))
(helper-accumulate n start))

(define (partial-sums stream)
  (define (helper total stream)
  (if (null? stream) nil
   (else cons-stream (+ total) (car-stream stream)
   (+ partial-sums (cdr-streams stream)))))
(helper 0 stream))

(define (rle s)
  (define (helper-rle current data count)
  (cond
  ((null? data)(cons-stream (list current length) nil))
  ((eq? current (car data)) (helper-rle current (cdr-stream data) (+ count 1)))
  (else (cons-stream (list current length) (rle data)))
  )
)
(if (null? s) nil
  (helper-rle (car s) (cdr-stream s ) 1))
)
