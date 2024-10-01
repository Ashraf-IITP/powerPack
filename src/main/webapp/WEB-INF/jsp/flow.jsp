<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <script>

            class Tree {

            }

            class Node {
                var itemId;
                var
            }

            function convertToTree() {
                fetch("/getAllItemList").then(resp => resp.json()).then(data => {
                    console.log(data)
                })
            }

            convertToTree()
            function checkInputs(items) {
                for (let item = 0; item < items.length; item++) {
                    if (items[item].value.trim().length === 0)
                        return false;
                }
                return true;
            }

            function fetchCall(items, url) {
                const formData = new FormData();
                formData.append('fieldName', items[0].value);
                formData.append('code', items[1].value);
                formData.append('desc', items[2].value);
                formData.append('levelA', items[3].value);
                formData.append('levelB', items[4].value);
                formData.append('${_csrf.parameterName}', '${_csrf.token}');
                const options = {
                    method: 'POST',
                    body: formData
                };
                fetch(url, options).then(resp => {
                    if (!resp.ok) {
                        throw new Error('Ajax call failed');
                    }
                    return resp.json();
                }).then(data => {
                    window.location.reload()
                }).catch(error => {
                    console.error('Fetch error:', error);
                });
            }

            function addItemBetweenID() {
                var inputs = document.querySelectorAll("#addItemByItemId input");
                if (!checkInputs(inputs)) {
                    return false
                }
                fetchCall(inputs, "/addItemAtId")
            }

            function addItemAtLevelA() {
                var inputs = document.querySelectorAll("#addItem input");
                if (!checkInputs(inputs)) {
                    return false
                }
                if (inputs[3].value >= inputs[4].value) {
                    return false;
                }
                fetchCall(inputs, "/addItemAtA")
            }

            function removeItem() {
                console.log(e)
            }
        </script>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                box-sizing: border-box;
            }

            .container {
                display: flex;
                justify-content: space-around;
                flex-wrap: wrap;
                gap: 20px;
                padding: 20px;
            }

            #container-2 {
                display: flex;
                flex-direction: column;
                gap: 30px;
                width: 300px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            table th, table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            table th {
                background-color: #f4f4f4;
                font-weight: bold;
            }

            .inputItem {
                display: flex;
                flex-direction: column;
                gap: 10px;
                border-radius: 40px;
                background: #222831;
                padding: 20px;
                color: white;

            }

            .inputItem input[type="text"],
            .inputItem input[type="number"] {
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
                width: 100%;
                font-size: 14px;
            }

            .inputItem label {
                font-weight: bold;
            }
            .inputItem span{
                background: #31363F;
                padding: 10px;
                border-radius: 50px;
            }

            button {
                padding: 10px 20px;
                background-color: #4CAF50;
                border: none;
                border-radius: 4px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                align-self: flex-start;
            }

            button:hover {
                background-color: #45a049;
            }

            fieldset {
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 10px;
                background-color: #fff;
            }

            legend {
                font-size: 18px;
                font-weight: bold;
                padding: 0 10px;
                color: white;
                background: #191919;
                border-radius: 30px;
                padding: 5px 15px;
                border: 1px solid #FDFFC2;
            }
        </style>
    </head>
    <body>
        <%@ include file="./index.jsp" %>
        <div class="container">
            <div>
                <fieldset>
                    <legend>PowerPack Selection Flow</legend>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>ITEM ID</th>
                                <th>FIELD NAME</th>
                                <th>CODE</th>
                                <th>DESC</th>
                                <th>LEVEL</th>
                                <th>NEXT LEVEL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${itemList}" var="item" >
                                <tr>
                                    <td>${item.itemId}</td>
                                    <td>${item.fieldName}</td>
                                    <td>${item.code}</td>
                                    <td>${item.desc}</td>
                                    <td>${item.level}</td>
                                    <td>${item.nextLevel}</td>
                                </tr>
                            </c:forEach >
                        </tbody>
                    </table>
                </fieldset>
            </div>
            <div id="container-2">
                <div id="addItem" class="inputItem">
                    <span>Add Item At Given Level (New Path)</span>
                    Field Name: <input type="text" id="fieldName"/>
                    Code: <input type="text" id="code"/>
                    Desc: <input type="text" id="desc"/>
                    LEVEL A: <input type="number" id="levelA"/>
                    NEXT LEVEL: <input type="number" id="levelB"/>
                    <button onClick="addItemAtLevelA()" >Add item at level A </button>
                </div>
                <div id="addItemByItemId" class="inputItem">
                    <span>Add Item between given Item Id's (At existing Path)</span>
                    Field Name: <input type="text" id="fieldName"/>
                    Code: <input type="text" id="code"/>
                    Desc: <input type="text" id="desc"/>
                    Item Id A: <input type="number" id="idA"/>
                    Item Id B: <input type="number" id="idB"/>
                    <button onClick="addItemBetweenID()" >Add item between Id A and Id B</button>
                </div>
                <div id="removeItem" class="inputItem">
                    Item id: <input type="text" id="itemId"/>
                    <button onClick="removeItem()" >Remove item</button>
                </div>
            </div>
        </div>
        <form:form name="addItemForm" id="addItemForm" method="POST" action="addItem.htm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
            <input type="hidden" name="fieldName" id="fieldName" value=""/>
            <input type="hidden" name="code" id="code" value=""/>
            <input type="hidden" name="desc" id="desc" value=""/>
            <input type="hidden" name="levelA" id="levelA" value=""/>
            <input type="hidden" name="levelB" id="levelB" value=""/>
        </form:form >
    </body>
</html>
