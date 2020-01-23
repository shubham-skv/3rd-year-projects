<%@ page session="true" import="java.util.*, shopping.BOOK" %>
<html>
<head>www.Technicalsymposium.com
<title>BOOK STORE</title>
</head>
<body bgcolor="#33CCFF">
<font face="Times New Roman,Times" size=+3>
BOOK STORE CHECK OUT
</font>
<hr><p>
<center>
<table border="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
<tr>
<td><b>ISBN</b></td>
<td><b>AUTHOR</b></td>
<td><b>TITLE</b></td>
<td><b>PUBLISHER</b></td>
<td><b>EDITION</b></td>
<td><b>PRICE</b></td>
<td><b>QUANTITY</b></td>
<td></td>
</tr>
<%
Vector buylist = (Vector) session.getValue("shopping.shoppingcart");
String amount = (String) request.getAttribute("amount");
for (int i=0; i < buylist.size();i++) {
BOOK anOrder = (BOOK) buylist.elementAt(i);
%>
<tr>
<td><b><%= anOrder.getisbn() %></b></td>
<td><b><%= anOrder.getAuthor() %></b></td>
<td><b><%= anOrder.getTitle() %></b></td>
<td><b><%= anOrder.getPublisher() %></b></td>
<td><b><%= anOrder.getEdition() %></b></td>www.Technicalsymposium.com
<td><b><%= anOrder.getPrice() %></b></td>
<td><b><%= anOrder.getQuantity() %></b></td>
</tr>
<%
}
session.invalidate();
%>
<tr>
<td> </td>
<td> </td>
<td><b>TOTAL</b></td>
<td><b>$<%= amount %></b></td>
<td> </td>
</tr>
</table>
<p>
<a href="Eshop.jsp">Shop some more!</a>
</center>
</body>
</html>