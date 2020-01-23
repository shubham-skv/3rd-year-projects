<%@ page session="true" %> <html>

<head>

<title>BOOK STORE</title> </head>

<body bgcolor="#33CCFF">

<font face="Times New Roman,Times" size="+3">

BOOK STORE </font> <hr><p> <center>

<form name="shoppingForm" action="ShoppingServlet" method="POST">

<b>BOOK:</b> <select name=BOOK>

<option> 10588 | Hans Bergsten | Java Server Pages | O'Reilly | 2 | 34.95</option> <option> 10589 | Deitel | Internet |McGraw Hill | 4 | 44.95</option>

<option> 10590 | Winston | XML BIBLE |Wiley | 2 | 14.95</option> </select>

<b>Quantity: </b><input type="text" name="qty" SIZE="3" value=1> <input type="hidden" name="action" value="ADD">

<input type="submit" name="Submit" value="Add to Cart">

</form>

</center>

<p>

<jsp:include page="Cart.jsp" flush="true" /> </body>

</html>
