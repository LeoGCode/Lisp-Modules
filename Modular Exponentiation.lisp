;;;; Modular Exponentiation 
;;; Given three non-negative integers from input, a, b and c, such that b > 0 and c >= 2, 
;;; calculate the modulated power a ^ b mod c.

(princ "Welcome to the modular exponentiation calculator.")
(terpri)
(princ "Please enter three non-negative integers, a, b and c, such that c >= 2.")
(terpri)
(princ "a: ")
(setq a (read))
(loop while T do ; loop until a is a integer
        (if (subtypep (type-of a) 'integer)
            (if (> a 0)
                (loop-finish)
                (princ "a must be a positive integer. Please enter a new value for a: "))
            (princ "a must be an integer. Please enter a new value for a: "))
        (setq a (read)))
(princ "b: ")
(setq b (read))
(loop while T do ; loop until b is a positive integer
        (if (subtypep (type-of b) 'integer)
            (if (> b 0)
                (loop-finish)
                (princ "b must be a positive integer. Please enter a new value for b: "))
            (princ "b must be an integer. Please enter a new value for b: "))
        (setq b (read)))
(princ "c: ")
(setq c (read))
(loop while T do ; loop until c is a positive integer greater than 2
        (if (subtypep (type-of c) 'integer)
            (if (>= c 2)
                (loop-finish)
                (princ "c must be >= 2. Please enter a new value for c: "))
            (princ "c must be an integer. Please enter a new value for c: "))
        (setq c (read)))

(defun modular-exponentiation (a b c) ; a ^ b mod c, where a, b and c are integers and c >= 2
    (if (= b 0)
        1
        (mod (* (mod a c) (mod (expt a (- b 1)) c)) c)))

(princ "The modular exponentiation of a ^ b mod c is: ")
(princ (modular-exponentiation a b c))