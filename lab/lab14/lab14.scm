; Lab 14: Final Review

(define (compose-all funcs)
  (lambda (arg) 
  	(if (null? funcs) arg
  		((compose-all (cdr funcs)) ((car funcs) arg))))
)

'if so far contains (car curr) return true, else update so far to include (car curr)'

(define (has-cycle? s)
  (define (pair-tracker seen-so-far curr)
    (cond ((null? curr) #f)
          ((contains? seen-so-far (car curr)) #t)
          (else (pair-tracker (cons-stream (car curr) seen-so-far) (cdr-stream curr)))
    )
   )
  (pair-tracker '() s)
)



'check if lst contains s'

(define (contains? lst s)
  (cond 
  	((null? lst) #f)
  	((= (car lst) s) #t)
  	(else (contains? (cdr-stream lst) s))
  	)
)

