(defun binary_search (lst elt)
  (cond ((null lst) nil)
        ((= (car lst) elt) t)
        ((< elt (car lst)) (binary_search (car (cdr lst)) elt))
        ((> elt (car lst)) (binary_search (car (cdr (cdr lst))) elt))))

(binary_search (list 1 3 4 8 1 8 1) 3)