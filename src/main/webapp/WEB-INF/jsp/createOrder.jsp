<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }
            #parentContainer{
                display: flex;
                justify-content: space-around;
                padding: 20px 100px;
                gap: 5px;
            }

            #container {
                width: 50%;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            #container div{
                margin: 10px 0;
            }

            #selected{
                width: 50%;
                text-align: center;
                align-content: center;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #222831;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            #selected ul{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            #selected ul li{
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 50%;
            }

            select {
                width: 100%;
                padding: 8px;
                border-radius: 3px;
                border: 1px solid #ccc;
                font-size: 14px;
                margin-top: 5px;
            }

            label {
                font-weight: bold;
                margin-bottom: 5px;
                display: block;
            }

            button {
                padding: 10px 20px;
                background-color: #4CAF50;
                border: none;
                border-radius: 3px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                margin-top: 10px;
            }

            button:hover {
                background-color: #45a049;
            }
        </style>
        <script>
            function showSelected(e) {
                var selectedDiv = document.querySelector("#selected ul");
                var selectedCode = "<li>" + e.value + "-" + e.options[e.selectedIndex].innerHTML + "</li>"
                selectedDiv.innerHTML += selectedCode
            }

            function optionClicked(e) {
                e.disabled = true
                var value = e.value;
                var option = e.options[e.selectedIndex];
                var nextLevel = option.getAttribute("data-nextlevel");
                showSelected(e)
                var code = document.getElementById("ppkCode").value
                if (code === "") {
                    document.getElementById("ppkCode").value = value;
                } else {
                    document.getElementById("ppkCode").value += "-" + value;
                }
                getNextData(nextLevel)
            }

            function getNextData(nextLevelValue) {
                fetch("getNextLevel/" + nextLevelValue).then(resp => {
                    if (!resp.ok) {
                        throw new Error('Ajax call failed');
                    }
                    return resp.json();
                }).then(data => {
                    if (data[0].code === 'stop') {
                        var submit = '<div><button onClick="submitHandle()" >Place Order</button></div>'
                        document.getElementById("container").innerHTML += submit;
                        return
                    }
                    createNextInputField(data)
                }).catch(error => {
                    console.error('Fetch error:', error);
                });
            }

            function createNextInputField(data) {
                const optionsHTML = data.map(item => '<option value="' + item.code + '" data-nextlevel="' + item.nextLevel + '">' + item.desc + '</option>').join('');
                const fieldName = data[0].fieldName
                const template = `<div><label id="` + fieldName + `">` + fieldName + `</label><select class="item" onClick="optionClicked(this)">` + optionsHTML + `</select></div>`;
                document.getElementById("container").innerHTML += template
            }

            function submitHandle() {
                document.getElementById("ppkForm").submit();
            }

            function handleReselect() {
                window.location.reload()
            }
        </script>
    </head>
    <body >
        <%@ include file="./index.jsp" %>
        <div id="parentContainer">
            <div id="container">
                <div><button onClick="handleReselect()" >Reselect All</button></div>
                <div>CHOOSE ITEMS</div>
                <div>
                    <label id="${fieldName}">${fieldName}</label>
                    <select id="item" onClick="optionClicked(this)">
                        <c:forEach items="${itemList}" var="item" >
                            <option  value="${item.code}"  data-nextlevel="${item.nextLevel}" >${item.desc}</option>
                        </c:forEach >
                    </select>
                </div>
            </div>
            <div id="selected">
                <ul>
                    <li>SELECTED ITEMS<li>
                </ul>
            </div>
        </div>
        <form:form name="ppkCode" id="ppkForm" method="POST" action="placeOrder.htm" >
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="ppkCode" id="ppkCode" value=""/>
        </form:form>
    </body>
</html>

