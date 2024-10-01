<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <script>
            function updateUser(userId) {
                document.getElementById("userId").value = userId;
                document.getElementById("updateUserForm").submit()
            }
            function deleteUser(employeeId, addressId) {
                document.getElementById("deleteEmployeeId").value = employeeId;
                document.getElementById("deleteAddressId").value = addressId;
                document.getElementById("deleteEmployeeForm").submit();
            }
        </script>
        <style>

            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            #mssg{
                margin: 0 40%;
                font-size: larger;
                width: max-content;
                padding: 10px 20px;
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

            /* Styling for edit link */
            .edit-link {
                text-decoration: none;
                color: #1e90ff; /* Change link color */
                cursor: pointer;
            }

            .edit-link:hover {
                text-decoration: underline; /* Underline on hover */
            }

        </style>
    </head>
    <body>
        <%@ include file="./index.jsp" %>
        <div id="mssg">
            ${param.msg}
        </div>
        <fieldset>
            <legend>User list</legend>
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Active</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${userList}" var="user" >
                        <tr>
                            <td>${user.name}</td>
                            <td>${user.username}</td>
                            <td>${user.role.label}</td>
                            <td>${user.active}</td>
                            <th>
                                <a href="javascript:updateUser('${user.userId}');" class="edit-link" >Edit</a>
                            </th>
                        </tr>
                    </c:forEach >
                </tbody>
            </table>
        </fieldset>
        <form name="updateUserForm" id="updateUserForm" method="POST" action="showEditUser.htm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
            <input type="hidden" name="userId" id="userId" value=""/>
        </form>

    </body>

</html>
