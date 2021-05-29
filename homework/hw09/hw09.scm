
; Tail recursion

(define (replicate x n)
  (define (helper x n k)
    (if (= n 0)
      k
      (helper x (- n 1) (append k (list x)))))
  (helper x n nil)  
  )

(define (accumulate combiner start n term)
  (if (= n 0)
    (combiner start)
    (combiner (accumulate combiner start (- n 1) term) (term n)))
)

(define (accumulate-tail combiner start n term)
    (if (= n 0)
      (combiner start)
    (accumulate-tail combiner (combiner start (term n)) (- n 1) term)))
  

; Streams

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
  (cons-stream 3 (map-stream (lambda (x) (+ 3 x))
    multiples-of-three))
)


(define (nondecreastream s)
    (cond ((null? s) nil)
      ((null? (cdr-stream s)) (cons-stream (cons (car s) nil) nil))
      ((<= (car s) (car (cdr-stream s))) 
        (cons-stream (cons (car s) (car (nondecreastream (cdr-stream s)))) (cdr-stream (nondecreastream (cdr-stream s)))))
      (else (cons-stream (cons (car s) nil) (nondecreastream (cdr-stream s))))))


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))