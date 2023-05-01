<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-department" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-department" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.department}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.department}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.department}" method="PUT">
                <g:hiddenField name="version" value="${this.department?.version}" />
                <fieldset class="form">
                    <table>
                        <tr>
                            <td width="20%">Id: </td>
                            <td><g:textField name="id" value="${department.id}" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td>Department Name: </td>
                            <td><g:textField name="name" value="${department.name}" autocomplete="off" required="true"/></td>
                        </tr>
                        <tr>
                            <td>Unit: </td>
                            <td><g:textField name="unit" value="${department.unit}" autocomplete="off" required="true"/></td>
                        </tr>
                        <tr>
                            <td>Manager: </td>
                            <td><g:textField name="manager" value="${department.manager}" autocomplete="off" required="true"/></td>
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
