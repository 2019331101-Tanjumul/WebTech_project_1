<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% session.setAttribute("role", "teacher"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Teacher</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="styles.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>
	<div> <input type="hidden" id="status" value="<%= request.getAttribute("status") %>"> </div>

    <div class="antialised bg-gradient-to-b from-white to-gray-200 dark-mode:bg-gray-900">
        <div class="flex justify-between items-center w-full text-gray-700 bg-white dark-mode:text-gray-200 dark-mode:bg-gray-800 shadow-lg">
            <div class="flex flex-row items-center justify-between p-4">
                <a href="/WebTechTask3" class="text-xl font-semibold tracking-widest text-gray-900 uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Manager</a>
            </div>
            <div>
                <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                    <a class="px-4 py-2 mt-2 text-md font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/WebTechTask3/loginS.jsp">Student</a>
                    <a class="px-4 py-2 mt-2 text-md font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/WebTechTask3/loginA.jsp">Admin</a>
                    <a class="px-4 py-2 mr-6 mt-2 text-md font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#">About</a>
                </nav>
            </div>
        </div>
        <div class="mt-20"> <!-- for body -->
            <div class="flex flex-1 items-center justify-center">
                <div class="rounded-xl sm:border-2 px-4 lg:px-24 py-16 lg:max-w-xl sm:max-w-md w-full text-center shadow-xl">
                    <form class="text-center" method = "post" action = "login">
                        <h1 class="font-bold tracking-wider text-3xl mb-8 w-full text-gray-600">
                            Login As A Teacher
                        </h1>
                        <div class="py-2 text-left">
                            <input required type="text" name = "username" class="bg-gray-200 border-2 border-gray-100 focus:outline-none bg-gray-100 block w-full py-2 px-4 rounded-lg focus:border-gray-700 " placeholder="Username" />
                        </div>
                        <div class="py-2 text-left">
                            <input required type="password" name = "password" class="bg-gray-200 border-2 border-gray-100 focus:outline-none bg-gray-100 block w-full py-2 px-4 rounded-lg focus:border-gray-700 " placeholder="Password" />
                        </div>
                        <div class="py-2">
                            <button type="submit" class="border-2 border-gray-100 focus:outline-none bg-purple-500 text-white font-bold tracking-wider block w-full p-2 rounded-lg focus:border-gray-700 hover:bg-purple-700">
                                Log In
                            </button>
                        </div>
                    </form>
                    <!-- <div class="text-center">
                        <a href="#" class="hover:underline">Forgot password?</a>
                    </div> -->
                    <div class="text-center mt-12">
                        <span>
                            Don't have an account?
                        </span>
                        <a href="/WebTechTask3/signup.jsp" class="font-light text-md text-purple-600 underline font-semibold hover:text-purple-800">Create One</a>
                    </div>
                </div>
            </div>
        </div>
        <div> <!-- for footer -->
            <footer class="mt-36 w-full bg-white">
                <div class="text-center">
                    <h3> &copy; 2023 Course Manager - All rights reserved</h3>
                </div>
            </footer>
        </div>  
    </div>
    <script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "failed"){
			swal("Sorry", "Your Username or Password is Incorrect!", "error");
		}
	</script>
</body>
</html>