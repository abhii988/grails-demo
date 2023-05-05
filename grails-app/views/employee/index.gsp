<%@ page import="org.springframework.validation.FieldError" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="list-employee" class="content container mt-2 scaffold-list" role="main">
            <br/>
            <div class="container text-center">
                <div class="row align-items-center">
                    <div class="col text-start">
                        <h3><g:message code="default.list.label" args="[entityName]" /></h3>
                    </div>
                    <div class="col text-end">
                        <g:form resource="${this.employee}" method="POST">
                            Export Data: <g:link action="download"><i class="fa-regular fa-file-excel"></i></g:link>
                        </g:form>
                    </div>
                </div>
            </div>
            <g:if test="${flash.message}">
                <div class="alert alert-success alert-dismissible fade show pl-4" role="alert">
                    <i class="fa fa-check-circle-o" ></i>
                    ${flash.message}
                </div>
            </g:if>
            <g:if test="${flash.error}">
                <div class="alert alert-danger alert-dismissible fade show pl-4" role="alert">
                    <i class="fa fa-check-circle-o" ></i>
                    ${flash.error}
                </div>
            </g:if>
            <div class="container mt-5">
                <div class="row">
                    <table class="table table-striped table-bordered table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>S.No.</th>
                                <g:sortableColumn property="name" title="Employee Name" />
                                <g:sortableColumn property="age" title="Employee Age" />
                                <g:sortableColumn property="position" title="Employee Position" />
                                <g:sortableColumn property="department.name" title="Department Name" />
%{--                                <th>Age</th>--}%
%{--                                <th>Position</th>--}%
%{--                                <th>Department Name</th>--}%
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <g:each var="employee" in="${employeeList}" status="i">
                                <tr>
                                    <td>${i+1}</td>
                                    <td>${employee.name}</td>
                                    <td>${employee.age}</td>
                                    <td>${employee.position}</td>
                                    <td>${employee.department.name}</td>
                                    <td>
                                        <g:link action="show" id="${employee.id}"><i class="fa fa-solid fa-eye"></i></g:link>
                                        <g:link action="edit" id="${employee.id}"><i class="fa fa-pen-to-square"></i></g:link>
                                    </td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
                <div class="pagination">
                    <g:paginate total="${employeeCount ?: 0}" />
                </div>
            </div>
        </div>
    </body>
</html>