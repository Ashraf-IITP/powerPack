<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            fieldset {
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 20px; /* Add margin to separate from other content */
            }

            legend {
                font-size: 1.2em;
                font-weight: bold;
                margin-bottom: 10px;
                color: white;
                background: #191919;
                border-radius: 30px;
                padding: 5px 15px;
                border: 1px solid #FDFFC2;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                border: 1px solid #ddd; /* Add border around the table */
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2; /* Light gray background for headers */
                color: #333; /* Darker text color for headers */
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9; /* Alternate row background color */
            }

            tr:hover {
                background-color: #f1f1f1; /* Hover effect for rows */
            }
        </style>
    </head>
    <body>
        <%@ include file="./index.jsp" %>
        <fieldset>
            <legend>Your Orders</legend>
            <table border="1">
                <thead>
                    <tr>
                        <th>ORDER ID</th>
                        <th>PPK CODE</th>
                        <th>CREATION TIME</th>
                        <th>STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${orderList}" var="order" >
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.ppkCode}</td>
                            <td>${order.orderCreationTime}</td>
                            <td>${order.status}</td>
                        </tr>
                    </c:forEach >
                </tbody>
            </table>
        </fieldset>
    </body>
</html>
