<%@ page session="true" import="java.util.*, shopping.BOOK" %> <%

Vector buylist = (Vector) session.getValue("shopping.shoppingcart"); if (buylist != null && (buylist.size() > 0)) {

%>

<center>

<table border="0" cellpadding="0" width="100%" bgcolor="#FFFFFF"> <tr>

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

for (int index=0; index < buylist.size();index++) { BOOK anOrder = (BOOK) buylist.elementAt(index);

%>

<tr>

<td><b><%= anOrder.getisbn() %></b></td>


www.Technicalsymposium.com
 

<td><b><%= anOrder.getAuthor() %></b></td> <td><b><%= anOrder.getTitle() %></b></td> <td><b><%= anOrder.getPublisher() %></b></td> <td><b><%= anOrder.getEdition() %></b></td> <td><b><%= anOrder.getPrice() %></b></td> <td><b><%= anOrder.getQuantity() %></b></td> <td>

<form name="deleteForm" action="ShoppingServlet" method="POST">

<input type="submit" value="Delete">

<input type="hidden" name= "delindex" value='<%= index %>'> <input type="hidden" name="action" value="DELETE"> </form>

</td>

</tr> <% } %>

</table>

<p>

<form name="checkoutForm" action="ShoppingServlet" method="POST">

<input type="hidden" name="action" value="CHECKOUT"> <input type="submit" name="Checkout" value="Checkout">

</form>

</center> <% } %>
