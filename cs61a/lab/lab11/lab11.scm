(define (repeatedly-cube n x)
    (if (zero? n)
        x
        (let
            ((y (repeatedly-cube (- n 1) x)))
            (* y y y))))


(define-macro (def func bindings body)
    (list 'define (cons func bindings) body))
