(library (match support)
  (export syntax-error
	  with-implicit
	  rec
	  add1
	  sub1)
  (import (rnrs (6)))

  (define syntax-error
    (lambda (obj . msg)
      (error (syntax->datum obj)
	     (if (null? msg)
		 "invalid syntax"
		 (apply string-append msg)))))

  ;; copy from Chez Scheme Version 9 User's Guide Section 11.3. Syntax-Case Transformers
  (define-syntax with-implicit
    (syntax-rules ()
      [(_ (tid id ...) b1 b2 ...)
       (with-syntax ([id (datum->syntax #'tid 'id)] ...)
	 b1 b2 ...)]))

  ;; copy from Chez Scheme Version 9 User's Guide Section 5.3. Recursive Bindings
  (define-syntax rec
    (syntax-rules ()
      [(_ x e) (letrec ((x e)) x)]))

  (define add1 (lambda (x) (+ x 1)))
  (define sub1 (lambda (x) (- x 1)))

)
