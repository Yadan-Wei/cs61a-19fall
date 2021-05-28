(define (partial-sums stream)
  (define (helper start stream)
	(if (null? stream)
  		nil
  	(cons-stream (+ start (car stream)) (helper (+ start (car stream)) (cdr-stream stream)))))
  (helper 0 stream)
  )
 
