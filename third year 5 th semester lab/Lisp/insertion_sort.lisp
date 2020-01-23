(defun insert (lst elt)
  (cond ((null lst) (cons elt '()))
        ((<= elt (car lst)) (cons elt lst))
        (t (cons (car lst) (insert (cdr lst) elt)))))

(defun insertion-sort (lst)
  (if (null lst)
    nil
    (insert (insertion-sort (cdr lst)) (car lst))))

(print "Enter Elements:")
(defvar lst (read))
(print (insertion-sort lst))