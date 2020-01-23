import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import shopping.BOOK;www.Technicalsymposium.com
public class ShoppingServlet extends HttpServlet {
public void init(ServletConfig conf) throws ServletException {
super.init(conf);
}
public void doPost (HttpServletRequest req, HttpServletResponse res)
throws ServletException, IOException {
HttpSession session = req.getSession(false);
if (session == null) {
res.sendRedirect("/error.html");
}
Vector buylist=(Vector)session.getValue("shopping.shoppingcart");
String action = req.getParameter("action");
if (!action.equals("CHECKOUT")) {
if (action.equals("DELETE")) {
String del = req.getParameter("delindex");
int d = (new Integer(del)).intValue();
buylist.removeElementAt(d);
} else if (action.equals("ADD")) {
boolean match=false;
BOOK aCD = getBOOK(req);
if (buylist==null) {
buylist = new Vector(); //first order
buylist.addElement(aCD);
} else { // not first buy
for (int i=0; i< buylist.size(); i++) {
BOOK cd = (BOOK) buylist.elementAt(i);
if (cd.getTitle().equals(aCD.getTitle())) {
cd.setQuantity(cd.getQuantity()+aCD.getQuantity());
buylist.setElementAt(cd,i);
match = true;
} //end of if name matches
} // end of for
if (!match)
buylist.addElement(aCD);
}
}
session.putValue("shopping.shoppingcart", buylist);
String url="/Eshop.jsp";
// ServletContext sc = getServletContext();
RequestDispatcher rd = req.getRequestDispatcher(url);
rd.forward(req, res);
}
else if (action.equals("CHECKOUT")) {
float total =0;
for (int i=0; i< buylist.size();i++) {
BOOK anOrder = (BOOK) buylist.elementAt(i);
float price= anOrder.getPrice();
int qty = anOrder.getQuantity();
total += (price * qty);
}
total += 0.005;
String amount = new Float(total).toString();
int n = amount.indexOf('.');
amount = amount.substring(0,n+3);
req.setAttribute("amount",amount);
String url="/Checkout.jsp";
ServletContext sc = getServletContext();
RequestDispatcher rd = sc.getRequestDispatcher(url);
rd.forward(req,res);
}
}
private BOOK getBOOK(HttpServletRequest req) {
String myBOOK = req.getParameter("BOOK");
String qty = req.getParameter("qty");
StringTokenizer t = new StringTokenizer(myBOOK,"|");
String isbn= t.nextToken();
String author= t.nextToken();
String title = t.nextToken();
String publisher = t.nextToken();
String Edition = t.nextToken();
String price = t.nextToken();
price = price.replace('$',' ').trim();
BOOK book = new BOOK();
book.setisbn(isbn);
book.setAuthor(author);
book.setTitle(title);
book.setPublisher(publisher);
book.setEdition(Edition);
book.setPrice((new Float(price)).floatValue());
book.setQuantity((new Integer(qty)).intValue());
return book;
}
}