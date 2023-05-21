<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <a href="/landing.html" class="text-xl font-semibold tracking-widest text-gray-900 uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Manager</a>
        </div>
        <div>
            <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                <!-- <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-green-200 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/courseadd.html"><i class="fa-solid fa-plus"></i>  Add Courses</a> -->
                <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-red-200 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/logina.html"><i class="fa-solid fa-right-from-bracket"></i>  Log Out</a>
                <a class="px-4 py-2 mr-6 mt-2 text-md border border-gray hover:border-black font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#"><i class="fa-solid fa-user"></i>  Name </a>
            </nav>
        </div>
    </div>
    <div>
        <div class="mx-10 mt-10 pb-4 text-3xl font-semibold tracking-widest border-b border-gray-400 text-center">
            Students List for this course
        </div>
        <div class="mx-10 overflow-x-hidden flex justify-center border-b border-gray-400">
        <table class="mt-6 leading-normal rounded-lg">
            <thead>
                <tr>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Name
                    </th>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Email
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="px-5 py-2 border-b border-gray-200 bg-white text-sm">
                        <div class="flex justify-left">
                                <div>
                                    <p class="text-gray-900 font-semibold whitespace-no-wrap">
                                        Vera Carpenter
                                    </p>
                                </div>
                            </div>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                        <p class="text-gray-900 whitespace-no-wrap">
                            vera887@gmail.com
                        </p>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </div>
    <div> <!-- for footer -->
        <footer class="mt-20 w-full bg-white flex-col justify-end">
            <div class="text-center">
                <h3> &copy; 2023 Course Manager - All rights reserved</h3>
            </div>
        </footer>
    </div>      
</body>
</html>