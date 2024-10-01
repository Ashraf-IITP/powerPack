<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            form {
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 80%;
                max-width: 600px;
                margin: 0 auto;
            }

            form input[type="submit"],
            form input[type="button"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                border: none;
                border-radius: 3px;
                color: white;
                font-size: 16px;
                cursor: pointer;
            }

            form input[type="submit"]:hover,
            form input[type="button"]:hover {
                background-color: #45a049;
            }

            form input[type="text"],
            form select,
            form input[type="radio"] {
                width: calc(100% - 6px);
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 14px;
            }

            form label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
                width: 20%;
            }

            form .form-group {
                margin-bottom: 15px;
            }

            span{
                display: flex;
                flex-direction: row-reverse;
                justify-content: start;
            }
            #username{
            }

        </style>

        <script type="text/javascript">
            function onLoad() {
                document.getElementById("username").disabled = true
            }
        </script>

    </head>
    <body onload="onLoad()" >
        <%@ include file="./index.jsp" %>
        <form:form method="POST" name="editUser" modelAttribute="user" action="editUser.htm" >
            <form:hidden path="userId"/><br/><br/>
            Name : <form:input path="name"/><br/><br/>
            Username : <form:input path="username" id="username" /><br/><br/>
            Role: <form:select path="role" ><form:options items="${roleList}" itemLabel="label" itemValue="id" /></form:select><br/><br/>
            Active: <form:radiobuttons path="active" items="${activeList}" itemLabel="key" itemValue="value"  /><br/><br/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
            <input type="submit" value="Submit" name="submit" id="submit" />&nbsp;&nbsp;&nbsp;<input type="button" value="Cancel" onclick="window.location.href = 'listUser.htm?msg=Cancelled';" name="cancel" id="cancel" />
        </form:form>
        <br/><br/><br/>
        ${msg}
    </body>   
</html>

