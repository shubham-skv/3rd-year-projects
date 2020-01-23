;function for linear search and return the position of item in the list
(defun linear_search(list_ item)
       (loop for pos from 0 and element in list_
             when(eql item element)
                do(return (+ pos 1))
             )
)

(print "Element to search is 2")
(terpri)
(print "Element to search from :")

(print (linear_search (read) 2))
