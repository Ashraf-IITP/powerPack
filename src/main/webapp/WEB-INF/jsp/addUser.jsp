<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #379777;
            }

            #mssg{
                margin: 0 40%;
                font-size: larger;
                width: max-content;
                padding: 10px 20px;
            }

            form {
                max-width: 600px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 10px;
            }

            input[type="text"], input[type="password"], select {
                width: 100%;
                padding: 8px;
                border-radius: 3px;
                border: 1px solid #ccc;
                font-size: 14px;
                margin-bottom: 10px;
            }

            input[type="submit"], input[type="button"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                border: none;
                border-radius: 3px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                margin-right: 10px;
            }

            input[type="submit"]:hover, input[type="button"]:hover {
                background-color: #45a049;
            }
        </style>
        <script >
            function handleSubmit(e) {
                try {
                    alert("djhdskfhksd")
                    e.preventDefault()
                    var inputs = document.getElementById("addUser")
                    console.log(inputs)
                    if (inputs[0].value.trim().length === 0 || inputs[1].value.trim().length === 0 || inputs[2].value.trim().length === 0) {
                        console.log(inputs[0].value === "")
                        console.log(inputs[1].value === "")
                        console.log(inputs[2].value === "")
                        return false;
                    }
                    return true;
                } catch (error) {
                    e.preventDefault()
                    console.log(error)
                    return false
                }
            }
        </script>
    </head>
    <body >
        <%@ include file="./index.jsp" %>
        <form:form method="POST" name="addUser" id="addUser" modelAttribute="user">
            Name : <form:input path="name"/><br/><br/>
            Username : <form:input path="username" /><br/><br/>
            Role  : <form:select path="role" id="role" items="${roleList}" itemLabel="label" itemValue="id" onchange="showSpecialities();" /><br/><br/><br/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
            <input type="submit" value="Submit" onclick="handleSubmit(e)" name="submit" id="submit" />
            <input type="button" value="Cancel" onclick="window.location.href = 'listUser.htm?msg=Cancelled';" name="cancel" id="cancel" />
        </form:form>
        <br/><br/><br/>
        <div id="mssg">
            ${param.msg}
        </div>
    </body>   
</html>
