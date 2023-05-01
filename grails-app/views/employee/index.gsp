<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <h1>Employees</h1>
        <div id="list-employee" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table border="1" class="table table-striped">
                <thead>
                <tr>
                    <th>S.No.</th>
                    <th>Employee name</th>
                    <th>Age</th>
                    <th>Position</th>
                    <th>Department Name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                    <g:each var="employee" in="${employeeList}" status="i">
                        <tr>
                            <td>${i+1}</td>
                            <td>${employee.name}</td>
                            <td>${employee.age}</td>
                            <td>${employee.position}</td>
                            <td>${employee.department.name}</td>
                            <td><g:link action="show" id="${employee.id}"><i class="fa fa-solid fa-eye">View</i></g:link></td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${employeeCount ?: 0}" />
            </div>
        </div>
    </body>
</html>