<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #191919;
                margin: 0;
            }

            nav {
                display: flex;
                gap: 20px;
                background-color: #333;
                color: #fff;
                padding: 10px 20px;
                margin-bottom: 10px;
            }

            nav div {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            nav ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }

            nav ul li {
                display: inline-block;
                /*margin-right: 10px;*/
            }

            nav ul li a {
                color: #fff;
                text-decoration: none;
                padding: 5px 10px;
            }

            nav ul li a:hover {
                background-color: #555;
                border-radius: 3px;
            }

            h2 {
                margin-top: 20px;
            }

            div ul {
                list-style-type: none;
                padding: 0;
            }

            div ul li {
                margin-bottom: 5px;
            }
        </style>
    </head>
    <body>
        <sec:authentication property="principal" var="curUser" scope="request"/>
        <nav>
            <div>Welcome, ${curUser.name}</div>
            <ul>
                <li><a href="index.htm">Home</a></li>
                    <sec:authorize access="hasAnyRole('ROLE_BF_MANAGE_USER')">
                    <li><a href="addUser.htm">Add User</a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAnyRole('ROLE_BF_MANAGE_USER')">
                    <li><a href="listUser.htm">Show User List</a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAnyRole('ROLE_BF_CREATE_ORDER')">
                    <li><a href="createOrder.htm">Create Your Order</a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAnyRole('ROLE_BF_MANAGE_ORDER')">
                    <li><a href="listOrder.htm">Show Order List</a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAnyRole('ROLE_BF_CREATE_ORDER')">
                    <li><a href="orders.htm">Your Order List</a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAnyRole('ROLE_BF_FLOW')">
                    <li><a href="items.htm">Create or Edit Flow</a></li>
                    </sec:authorize>
                <li><a href="logout">Logout</a></li>
            </ul>
        </nav>
    </body>
</html>
