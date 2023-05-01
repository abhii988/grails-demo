<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-employee" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.employee}" method="PUT">
                <g:hiddenField name="version" value="${this.employee?.version}" />
                <fieldset class="form">
                    <table>
                        <tr>
                            <td width="20%">Id: </td>
                            <td><g:textField name="id" value="${employee.id}" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td>Employee Name: </td>
                            <td><g:textField name="name" value="${employee.name}" autocomplete="off" required="true"/></td>
                        </tr>
                        <tr>
                            <td>Age: </td>
                            <td><g:textField name="age" value="${employee.age}" type="number" autocomplete="off" required="true"/></td>
                        </tr>
                        <tr>
                            <td>Position: </td>
                            <td><g:textField name="position" value="${employee.position}" autocomplete="off" required="true"/></td>
                        </tr>
%{--                        <tr>--}%
%{--                            <td>Department Name: </td>--}%
%{--                            <td> <g:select name="department_id" from="${employee.department.name}" optionKey="id" optionValue="name"></g:select></td>--}%
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
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
