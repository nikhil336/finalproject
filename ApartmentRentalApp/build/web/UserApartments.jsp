<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
 %>
<%
    if(request.getSession().getAttribute("um") == null)
    {
        %>
        <script>
            location = "Login.jsp";
        </script>
        <%
    }
    else
    {//onclick="location.href = 'LogOut'"
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apartment Rental Application</title>
        <center><h1><b><font size="10pt" face="Castellar">Apartment Rental Application</font></b></h1></center>	
        <style> 
            body {      background-image: url("the-kelvin-apartments-exterior.jpg");     background-color: #cccccc;     background-size: cover;     background-repeat: no-repeat;  }  
            
            .topnav {
                  overflow: hidden;
                  background-color: #333;
                }

                .topnav a {
                  float: left;
                  color: #f2f2f2;
                  text-align: center;
                  padding: 14px 16px;
                  text-decoration: none;
                  font-size: 17px;
                }

                .topnav a:hover {
                  background-color: #ddd;
                  color: black;
                }

                .topnav a.active {
                  background-color: #4CAF50;
                  color: white;
                }
                td,th {
                    
                    border: 1px solid black;
                    text-align: left;
                    padding: 8px;
                }
                .outer-table {
	padding: 20px;
	float: left;
	background: #f2f2f2;
	opacity: 0.7;
}
.outer-table tr th {

    padding: 10px;
    font-size: 20px;
    text-align: center;
    text-transform: capitalize;
    background: #000;
    color: #fff;
    border: 1px solid;

}
.outer-table tr td img {

    width: 200px;
    height: 200px;
    border: 4px solid #000;

}
.outer-table tr td {

    text-align: center;
    font-size: 20px;

}
.outer-table tr td a {
	padding: 10px;
	color: red;
	text-decoration: navajowhite;
	font-size: 22px;
}
         .first {width: 50%; float: left;  }

.search_form {  float: right;  margin: 0; 	}
	
.search_form input{outline: 0;background: #d3d3d3;border: 0;padding: 14px;box-sizing: border-box;font-size: 17px;  }
	
.search_form button{padding: 15px; color: #fff;font-size: 14px;text-transform: uppercase;border: 0;background: #000;  }

        </style>
    </head>
    <body>
        <hr size="10" color="black">
         <div class="topnav">
             <div class="first">
             <!--<a href="UserPage.jsp">Home</a>-->
             <a class="active" href="UserApartments.jsp">My Apartments</a> 
             <!--<a href="feedback.jsp">FeedBack</a>-->
             <a href="upload.jsp">Upload</a>
             <a href="about.jsp">About</a>
             <a href="RequestServlet">Requests</a>
             </div>
             <div class="first">
             <a style="float:right;" href="SignOut.jsp" >Sign Out</a>
             <form class="search_form" action="SearchApartments" style="float:right;">
             <input type="text" name="search" placeholder="Enter Location">
             <button type="submit">Search</button>
             </form>
             </div>
         </div> 
        <br>
        <br>
        <%@page import ="java.util.ArrayList,Modal.Apartment,javax.servlet.http.HttpSession,java.io.*;"%>
        <%
          session = request.getSession();
          
          ArrayList<Apartment> l = (ArrayList<Apartment>)session.getAttribute("myAlist");
          
          if(l.size() != 0) {
          
        %>    
        <table class='outer-table' style="border-collapse: collapse;width: 100%;">
            <tr>
                <th>S no.</th>
                <th>Image</th>
                <th>Location</th>
                <th>Email</th>
                <th>Mobile No</th>
                <th>flat</th>
                <th>Address</th>
                <th>Action</th>
                <!--<th>Remove Apartment</th>-->
            </tr>
            <%
               //String name = request.getParameter("name"); //to get values from html form.
               
               //String pwd = request.getParameter("pwd");
               
               //String pwd = (String)request.getAttribute("pwd");
               
               //String name = (String)request.getAttribute("name");
               int a = 0;
               
               for(int i=0;i<l.size();i++) {
                   
                    byte[] by = l.get(i).getPic();

                    FileOutputStream fout = new FileOutputStream("C:\\Users\\NIKHIL-PC\\Documents\\NetBeansProjects\\ApartmentRentalApp\\web\\pic"+a+".jpg");

                    fout.write(by);

                    a++;

                    fout.close();
               }    
               
               a = 0;
               
               for(int i=0;i<l.size();i++) {
                   
                %>
                <tr>
                    
                    <td><%=i+1%></td>
                    <td><img src="pic<%=a%>.jpg"></td>
                    <%a++;%>
                    <td><%=l.get(i).getLocation()%></td>
                    <td><%=l.get(i).getEmail()%></td>
                    <td><%=l.get(i).getMobileno()%></td>
                    <td><%=l.get(i).getFlat()%></td>
                    <td><%=l.get(i).getAddress()%></td>
                    <td><a href='removeApartment?id=<%=l.get(i).getAddress()%>'>Remove</a></td>
                </tr>
               <% 
               }
            %>
        </table>
            <%
                }
                else {
            %>   
                
            <p><b><center>NO APARTMENTS UPLOADED!</center></b></p>  
            
    </body>
    <%
        }
    %>
</html>
<%
    }
%>


