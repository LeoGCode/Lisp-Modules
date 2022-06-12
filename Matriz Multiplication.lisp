;;;; Matrix multiplication
;;; Given two matrices of dimension NxM and MxP, return the matrix product

(princ "Welcome to matrix multiplication!")
(terpri)
(princ "If you want to multiply a matrix of the form")
(terpri)
(princ "| x y ... |")
(terpri)
(princ "| z w ... |")
(terpri)
(princ "| ... ... |")
(terpri)
(princ "Enter the matrix using this notation ((x, y, ...), (z, w, ...), ...) where the letters are any number.")
(terpri)
(
    loop while T do
    (princ "Enter the first matrix: ")
        (loop while T do
        (setq matrix1 (read))
            (if (and (subtypep (type-of matrix1) 'list) (subtypep (type-of (car matrix1)) 'list))
                (loop-finish)
                (princ "Invalid input. Enter the first matrix again: ")))
        (princ "Enter the second matrix: ")
        (loop while T do
        (setq matrix2 (read))
            (if (and (subtypep (type-of matrix2) 'list) (subtypep (type-of (car matrix2)) 'list))
                (loop-finish)
                (princ "Invalid input. Enter the first matrix again: ")))
    
    (if (/= (length (car matrix1)) (length matrix2))
    (princ "Invalid input. The first matrix must have the same number of rows as the second matrix.")
    (loop-finish))
)


(defun matrix-multiply (m1 m2)
    (progn
        (setq r1 (length m1))
        (setq r2 (length m2))
        (setq c1 (length (car m1)))
        (setq c2 (length (car m2)))
        (setq result (make-list r1 :initial-element (make-list c2 :initial-element 0)))
        (setq i 0)
        (dotimes (i r1)
            (dotimes (j c2)
                (setq sum 0)
                (dotimes (k r2)
                    (setq sum (+ sum (* (nth k (nth i m1)) (nth j (nth k m2)))))
                )
                (setf (nth j (nth i result)) sum)
            )
        )   
    result)
)

(setq mr (matrix-multiply matrix1 matrix2))
(princ "The matrix product is: ")
(terpri)
(princ "(")
(princ (car mr))
(mapcar (lambda (row) 
        (progn 
            (terpri))
            (princ " ")
            (princ row)
) (cdr mr))
(princ ")")

