(defun is-sortedp (lst)
  (cond ((or (null lst) (null (cdr lst))) t)
        ((< (car lst) (car (cdr lst))) (is-sortedp (cdr lst)))
        (t nil)))


(defun bubble (lst)
  (cond ((or (null lst) (null (cdr lst))) lst)
        (( < (car lst) (car (cdr lst))) (cons (car lst) (bubble (cdr lst))))
        ( t (cons (car (cdr lst)) (bubble (cons (car lst) (cdr (cdr lst))))))))


(defun bubble-sort (lst)
  (cond ((or (null lst) (null (cdr lst))) lst)
        ((is-sortedp  lst) lst)
        (t (bubble-sort (bubble lst)))))


(print "Enter elements to sort using bubble sort")
(print (bubble-sort (read)))
