<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<%
	if(session.getAttribute("name")==null || !session.getAttribute("role").equals("teacher")){
		response.sendRedirect("loginT.jsp");
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
<body>
    <div class="flex justify-between items-center w-full text-gray-700 bg-white dark-mode:text-gray-200 dark-mode:bg-gray-800 shadow-lg">
        <div class="flex flex-row items-center justify-between p-4">
            <a href="/WebTechTask3/homeT.jsp" class="text-xl font-semibold tracking-widest text-gray-900 uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Manager</a>
        </div>
        <div>
            <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                <!-- <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-green-200 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/logint.html"><i class="fa-solid fa-plus"></i>  Add Courses</a> -->
                <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-red-300 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/WebTechTask3/logout"><i class="fa-solid fa-right-from-bracket"></i>  Log Out</a>
                <a class="px-4 py-2 mr-6 mt-2 text-md border border-gray hover:border-black font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#"><i class="fa-solid fa-user"></i>  <%= session.getAttribute("name") %> </a>
            </nav>
        </div>
    </div>

    <div>
        <div class="mx-10 mt-10 pb-4 text-2xl font-semibold tracking-widest border-b border-gray-400">
            Your Courses:
        </div>
            <div class="flex flex-col md:flex-row space-x-0 md:space-x-8 space-y-12  md:space-y-0 justify-left items-center p-10 overflow-x-auto overflow-y-hidden">
<% try{
                                	Class.forName("com.mysql.cj.jdbc.Driver");
                    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech?useSSL=false","root","mynewpass");
                    				PreparedStatement pst = con.prepareStatement("select * from acourses where teacher = ?");
                    				
                    				pst.setString(1, String.valueOf(session.getAttribute("name")));
//                     				PrepareStatement pst2 = con.getPreparedStatement("select count(*) from teachers");
                    				
                    				ResultSet rs = pst.executeQuery();
//                     				ResultSet res = pst2.executeStatement();
                                	while(rs.next()){ %>
                <div class="bg-[#ECEEFF] rounded-xl">
                    <div class="flex flex-col p-8 rounded-xl bg-white shadow-xl translate-x-4 translate-y-4 w-96 md:w-64">
                        <!-- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Ice_logo.svg/138px-Ice_logo.svg.png?20191213230535" class="w-8"> -->
                        <div class="text-md"><%= rs.getString("ccode") %></div>
                        <div class="mt-3 font-semibold text-lg"><%= rs.getString("cname") %></div>
                        <div class="text-sm font-light">From dept. of  <span class="font-semibold"><%= rs.getString("dept") %></span></div>
                        <div class="my-4">
                            <span class="font-light text-base">Course Teacher:</span>
                            <span class="font-bold text-md"> <%= rs.getString("teacher") %></span>
                        </div>
                        <div class="flex justify-between">
                            <button class="bg-[#F4F5FA] px-4 py-3 rounded-full  border border-[#F0F0F6] shadow-xl mt-4 hover:bg-gray-200">
                            <i class="fa-solid fa-circle-chevron-down"></i>  Show Student List
                        </button>
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

    <div>
        <div class="mx-10 mt-10 pb-4 text-2xl font-semibold tracking-widest border-b border-gray-400">
            ALL The Courses Assigned To You:
        </div>
            <div class="flex flex-col md:flex-row space-x-0 md:space-x-8 space-y-12  md:space-y-0 justify-left items-center p-10 overflow-x-auto overflow-y-hidden">
               <% try{
                                	Class.forName("com.mysql.cj.jdbc.Driver");
                    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech?useSSL=false","root","mynewpass");
                    				PreparedStatement pst = con.prepareStatement("select * from courses where teacher = ?");
                    				
                    				pst.setString(1, String.valueOf(session.getAttribute("name")));
//                     				PrepareStatement pst2 = con.getPreparedStatement("select count(*) from teachers");
                    				
                    				ResultSet rs = pst.executeQuery();
//                     				ResultSet res = pst2.executeStatement();
                                	while(rs.next()){ %>
                <div class="bg-[#ECEEFF] rounded-xl">
                    <div class="flex flex-col p-8 rounded-xl bg-white shadow-xl translate-x-4 translate-y-4 w-96 md:w-64">
                        <!-- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Ice_logo.svg/138px-Ice_logo.svg.png?20191213230535" class="w-8"> -->
                        <div class="text-md"><%= rs.getString("ccode") %></div>
                        <div class="mt-3 font-semibold text-lg"><%= rs.getString("cname") %></div>
                        <div class="text-sm font-light">From dept. of  <span class="font-semibold"><%= rs.getString("dept") %></span></div>
                        <div class="my-4">
                            <span class="font-light text-base">Course Teacher:</span>
                            <span class="font-bold text-md"> <%= rs.getString("teacher") %></span>
                        </div>
                        <div class="flex justify-between">
                            <a href="/WebTechTask3/accept?ccode=<%= rs.getString("ccode") %>&cname=<%= rs.getString("cname") %>&dept=<%= rs.getString("dept") %>&teacher=<%= rs.getString("teacher") %>">
                        <button class="bg-green-300 px-4 py-3 rounded-full  border border-[#F0F0F6] shadow-xl mt-4 hover:bg-green-400">
                             <i class="fa-solid fa-check"></i> Accept
                        </button>						
                        </a>
                            <button class="bg-red-400 px-3 py-3 rounded-full  border border-[#F0F0F6] shadow-xl mt-4 hover:bg-red-600">
                                <i class="fa-solid fa-x"></i> Decline
                            </button>
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
</body>
</html>
