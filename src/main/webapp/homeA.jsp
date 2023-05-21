<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<%
	if(session.getAttribute("name")==null || !session.getAttribute("role").equals("admin")){
		response.sendRedirect("loginA.jsp");
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/2494fc36bc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="styles.css">
</head>
<body class="overflow-x-hidden">
    <div class="flex justify-between items-center w-full text-gray-700 bg-white dark-mode:text-gray-200 dark-mode:bg-gray-800 shadow-lg">
        <div class="flex flex-row items-center justify-between p-4">
            <a href="/WebTechTask3/homeA.jsp" class="text-xl font-semibold tracking-widest text-gray-900 uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Manager</a>
        </div>
        <div>
            <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-green-200 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/WebTechTask3/courseadd.jsp"><i class="fa-solid fa-plus"></i>  Add Courses</a>
                <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-red-200 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/WebTechTask3/logout"><i class="fa-solid fa-right-from-bracket"></i>  Log Out</a>
                <a class="px-4 py-2 mr-6 mt-2 text-md border border-gray hover:border-black font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#"><i class="fa-solid fa-user"></i>  <%= session.getAttribute("name") %> </a>
            </nav>
        </div>
    </div>
    <div>
        <div class="mx-10 mt-10 pb-4 text-2xl font-semibold tracking-widest border-b border-gray-400">
            Students List:
        </div>
        <div class="px-10 h-60 overflow-x-hidden overflow-y-auto">
        <table class="mt-6 w-full leading-normal">
            <thead>
                <tr>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Name
                    </th>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Username
                    </th>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Email
                    </th>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Password
                    </th>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Action
                    </th>
                </tr>
            </thead>
            <tbody>
            <% try{
                                	Class.forName("com.mysql.cj.jdbc.Driver");
                    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech?useSSL=false","root","mynewpass");
                    				PreparedStatement pst = con.prepareStatement("select * from students");
//                     				PrepareStatement pst2 = con.getPreparedStatement("select count(*) from teachers");
                    				
                    				ResultSet res = pst.executeQuery();
//                     				ResultSet res = pst2.executeStatement();
                                	while(res.next()){ %>
                <tr>
                    <td class="px-5 py-2 border-b border-gray-200 bg-white text-sm">
                        <div class="flex justify-left">
                                <div>
                                    <p class="text-gray-900 font-semibold whitespace-no-wrap">
                                        <%= res.getString("name") %>
                                    </p>
                                </div>
                            </div>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                        <p class="text-gray-900 whitespace-no-wrap"><%= res.getString("username") %></p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                        <p class="text-gray-900 whitespace-no-wrap">
							<%= res.getString("email") %>
                        </p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                        <p class="text-gray-900 whitespace-no-wrap">
                            <%= res.getString("password") %>
                        </p>
                    </td>
                    <td class="px-5 border-b border-gray-200 bg-white text-sm">
                        <button class="bg-red-400 px-4 py-3 rounded-full  border border-[#F0F0F6] shadow-xl hover:bg-red-600 leading-tight">
                            <i class="fa-sharp fa-solid fa-trash"></i>  Remove
                        </button>
                    </td>
                </tr>
                <%}
            		}catch(Exception e){
            			e.printStackTrace();
            		}
                %>
            </tbody>
        </table>
    </div>
    </div>
</div>
</div>
    </div>
    <div>
        <div class="mx-10 mt-10 pb-4 text-2xl font-semibold tracking-widest border-b border-gray-400">
            Teachers List:
        </div>
        <div class="px-10 h-60 overflow-x-hidden overflow-y-auto">
            <table class="mt-6 w-full leading-normal">
                <thead>
                    <tr>
                        <th
                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                            Name
                        </th>
                        <th
                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                            Username
                        </th>
                        <th
                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                            Email
                        </th>
                        <th
                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                            Password
                        </th>
                        <th
                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                            Action
                        </th>
                    </tr>
                </thead>
                <tbody class="overflow-y-auto">
                    <% try{
                                	Class.forName("com.mysql.cj.jdbc.Driver");
                    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech?useSSL=false","root","mynewpass");
                    				PreparedStatement pst = con.prepareStatement("select * from teachers");
//                     				PrepareStatement pst2 = con.getPreparedStatement("select count(*) from teachers");
                    				
                    				ResultSet rs = pst.executeQuery();
//                     				ResultSet res = pst2.executeStatement();
                                	while(rs.next()){ %>
                <tr>
                    <td class="px-5 py-2 border-b border-gray-200 bg-white text-sm">
                        <div class="flex justify-left">
                                <div>
                                    <p class="text-gray-900 font-semibold whitespace-no-wrap">
                                        <%= rs.getString("name") %>
                                    </p>
                                </div>
                            </div>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                        <p class="text-gray-900 whitespace-no-wrap"><%= rs.getString("username") %></p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                        <p class="text-gray-900 whitespace-no-wrap">
							<%= rs.getString("email") %>
                        </p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                        <p class="text-gray-900 whitespace-no-wrap">
                            <%= rs.getString("password") %>
                        </p>
                    </td>
                    <td class="px-5 border-b border-gray-200 bg-white text-sm">
                        <button class="bg-red-400 px-4 py-3 rounded-full  border border-[#F0F0F6] shadow-xl hover:bg-red-600 leading-tight">
                            <i class="fa-sharp fa-solid fa-trash"></i>  Remove
                        </button>
                    </td>
                </tr>
                <%}
            		}catch(Exception e){
            			e.printStackTrace();
            		}
                %>
                </tbody>
            </table>
        </div>
    </div>
    <div>
        <div class="mx-10 mt-10 pb-4 text-2xl font-semibold tracking-widest border-b border-gray-400">
            ALL The Courses:
        </div>
            <div class="flex flex-col md:flex-row space-x-0 md:space-x-8 space-y-12  md:space-y-0 justify-left items-center p-10 overflow-x-auto overflow-y-hidden">
                <% try{
                                	Class.forName("com.mysql.cj.jdbc.Driver");
                    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech?useSSL=false","root","mynewpass");
                    				PreparedStatement pst = con.prepareStatement("select * from courses");
//                     				PrepareStatement pst2 = con.getPreparedStatement("select count(*) from teachers");
                    				
                    				ResultSet rs = pst.executeQuery();
//                     				ResultSet res = pst2.executeStatement();
                                	while(rs.next()){ %>
                <div class="bg-[#ECEEFF] rounded-xl">
                    <div class="flex flex-col p-8 rounded-xl bg-white shadow-xl translate-x-4 translate-y-4 w-96 h-80 md:w-64">
                        <!-- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Ice_logo.svg/138px-Ice_logo.svg.png?20191213230535" class="w-8"> -->
                        <div class="text-md"><%= rs.getString("ccode") %></div>
                        <div class="mt-3 font-semibold text-lg"><%= rs.getString("cname") %></div>
                        <div class="text-sm font-light">Dept. of  <span class="font-semibold"><%= rs.getString("dept") %></span></div>
                        <div class="my-3">
                            <span class="font-light text-base">Course Teacher:</span>
                            <span class="font-semibold text-md"><%= rs.getString("teacher") %></span>
                        </div>
                        <div class="flex justify-around">
                            <button class="bg-blue-400 px-4 py-3 rounded-full  border border-[#F0F0F6] shadow-xl mt-4 hover:bg-blue-600">
                                <i class="fa-solid fa-pen-to-square"></i>  Edit
                            </button>
                            <a href="WebTechTask3/delete">
                            <button type="submit" id = "delButton" class="bg-red-400 px-4 py-3 rounded-full  border border-[#F0F0F6] shadow-xl mt-4 hover:bg-red-600">
                                <i class="fa-sharp fa-solid fa-trash"></i>  Delete
                            </button>
                            </a> 
                        </div>
                        
                    </div>
                </div>
					<%}
            		}catch(Exception e){
            			e.printStackTrace();
            		}
                %>
				
            </div>
        </div>
        <div> <!-- for footer -->
            <footer class="mt-20 w-full bg-white">
                <div class="text-center">
                    <h3> &copy; 2023 Course Manager - All rights reserved</h3>
                </div>
            </footer>
        </div>  
        <script>
        	var button = document.getElementById("delButton");
        	button.onclick = function(){
        		console.log("clicked!");
        	}
        </script>    
</body>
</html>