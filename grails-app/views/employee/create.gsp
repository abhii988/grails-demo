<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-employee" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.employee}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.employee}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <table>
                        <tr>
                            <td width="200">Employee Name:* </td>
                            <td><input id="name" type="text" name="name" autocomplete="off" required> </td>
                        </tr>
                        <tr>
                            <td>Age: </td>
                            <td><input id="age" type="text" name="age" autocomplete="off" required> </td>
                        </tr>
                        <tr>
                            <td>Position:* </td>
                            <td><input id="position" type="text" name="position" autocomplete="off" required> </td>
                        </tr>
%{--                        <tr>--}%
%{--                            <td>Department:* </td>--}%
%{--                            <td><input id="department_id" type="text" name="department_id" autocomplete="off" required> </td>--}%
%{--                        </tr>--}%
                        <tr>
                            <td>Department:* </td>
                            <td>
                                <g:select value="department_id" name="department_id" from="${departmentList}" optionKey="id" optionValue="name"></g:select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Crate')}" />
%{--                    <button onclick="storeData()">store</button>--}%
                </fieldset>
            </g:form>
        </div>
    <script>
        function storeData() {
            console.log("stop");
            debugger
            $.ajax({
                url: '<g:createLink controller="employee" action="save"/>',
                type: 'POST',
                data: {
                    name: $('#name').val(),
                    age: $('#age').val(),
                    position: $('#position').val(),
                    department_id: $('#department_id').val(),
                },
                // Handle the successful response here
                success: function(data) {
                    alert("Save success")
                },
                // Handle the error here
                error: function(xhr, status, error) {
                    alert("An error occurred: " + error);
                }
            });

        }
    </script>
    </body>

</html>
