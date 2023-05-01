<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-department" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <h1>Departments</h1>
        <div id="list-department" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table border="1" class="table table-striped">
                <thead>
                <tr>
                    <th>S.No.</th>
                    <th>Department name</th>
                    <th>Unit</th>
                    <th>Manager</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                    <g:each var="department" in="${departmentList}" status="i">
                        <tr>
                            <td>${i+1}</td>
                            <td>${department.name}</td>
                            <td>${department.unit}</td>
                            <td>${department.manager}</td>
                            <td><g:link action="show" id="${department.id}"><i class="fa fa-solid fa-eye">View</i></g:link></td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${departmentCount ?: 0}" />
            </div>
        </div>
    </body>
</html>