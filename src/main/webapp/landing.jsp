<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Manager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="flex justify-between items-center w-full text-gray-700 bg-white dark-mode:text-gray-200 dark-mode:bg-gray-800">
        <div class="flex flex-row items-center justify-between p-4">
            <a href="/WebTechTask3" class="text-xl font-semibold tracking-widest text-gray-900 uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Manager</a>
        </div>
        <div>
            <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                <!-- <a class="px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#">Student</a>
                <a class="px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#">Teacher</a> -->
                <a class="px-4 py-2 mr-6 mt-2 text-md font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#">About</a>
            </nav>
        </div>
    </div>
    <section class="bg-white dark-mode:bg-gray-900 mt-20">
        <div class="grid max-w-screen-xl px-4 py-8 mx-auto lg:gap-8 xl:gap-0 lg:py-16 lg:grid-cols-12">
            <div class="mr-auto place-self-center lg:col-span-7">
                <h1 class="max-w-2xl mb-4 text-4xl font-extrabold leading-none md:text-5xl xl:text-6xl dark-mode:text-white">Manage your courses like a pro!</h1>
                <p class="max-w-2xl mb-6 font-light text-gray-500 lg:mb-8 md:text-lg lg:text-xl dark-mode:text-gray-400">Course Manager is a tool for both Students and Teachers. Now you can explore your courses, choose whichever you are looking for and manage them all in one place.</p>
                <p class="max-w-2xl mb-6 font-bold lg:mb-8 md:text-xl lg:text-xl dark-mode:text-gray-400">What are you?</p>
                <a href="/WebTechTask3/homeS.jsp" class="inline-flex items-center justify-center px-5 py-3 mr-3 text-base font-medium text-center text-white rounded-lg bg-purple-500 hover:bg-purple-800 focus:ring-4 focus:ring-blue-300 dark-mode:focus:ring-blue-900">
                    Student
                    <svg class="w-5 h-5 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </a>
                <a href="/WebTechTask3/homeT.jsp" class="inline-flex items-center justify-center px-5 py-3 mr-3 text-base font-medium text-center text-white rounded-lg bg-purple-500 hover:bg-purple-800 focus:ring-4 focus:ring-blue-300 dark-mode:focus:ring-blue-900">
                    Teacher
                    <svg class="w-5 h-5 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </a>
                <a href="/WebTechTask3/homeA.jsp" class="inline-flex items-center justify-center px-5 py-3 text-base font-medium text-center text-gray-900 border border-gray-300 rounded-lg hover:bg-gray-200 focus:ring-4 focus:ring-gray-100 dark-mode:text-white dark-mode:border-gray-700 dark-mode:hover:bg-gray-700 dark-mode:focus:ring-gray-800">
                    Admin
                </a> 
            </div>
            <div class="hidden lg:mt-0 lg:col-span-5 lg:flex">
                <img src="photos/books.png" alt="mockup">
            </div>                
        </div>
    </section>
    <footer class="mt-24">
        <div class="text-center">
            <h3> &copy; 2023 Course Manager - All rights reserved</h3>
        </div>
    </footer>
</body>
</html>