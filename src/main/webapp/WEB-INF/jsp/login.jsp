<html>
    <head>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background: rgb(17,18,18);
                background: radial-gradient(circle, rgba(17,18,18,1) 27%, rgba(41,148,136,1) 53%, rgba(17,18,18,1) 90%);
                font-family: Arial, sans-serif;
            }

            #loginForm {
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 280px;
            }

            #loginForm input[type="text"],
            #loginForm input[type="password"] {
                width: calc(100% - 20px); /* Full width with padding */
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 14px;
            }

            #loginForm input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                border: none;
                border-radius: 3px;
                color: white;
                font-size: 16px;
                cursor: pointer;
            }

            #loginForm input[type="submit"]:hover {
                background-color: #45a049;
            }

            #loginForm input[type="text"],
            #loginForm input[type="password"],
            #loginForm input[type="submit"] {
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <form name="loginForm" id="loginForm" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
            Username: <input type="text" name="username" id="username" /><br/><br/>
            Password: <input type="password" name="password" id="password" /><br/><br/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>

