
; solution 1
(define-macro (switch expr cases)
    (let ((val (eval expr)))
    	(cons 'cond 
    		(map (lambda (case)
    		(cons (eq? val (car case))(cdr case))
    		)cases)))
)

