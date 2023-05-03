<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="list-department" class="content container scaffold-list" role="main">
        <br/>
        <h3><g:message code="default.list.label" args="[entityName]" /></h3>
        <g:if test="${flash.message}">
            <div class="alert alert-success alert-dismissible fade show pl-4" role="alert">
                <i class="fa fa-check-circle-o" ></i>
                ${flash.message}
            </div>
        </g:if>
        <g:hasErrors bean="${this.department}">
            <div class="alert alert-danger bg-danger alert-dismissible fade show pl-4" role="alert">
                <ul class="errors list-unstyled text-white pl-3" >
                    <g:eachError bean="${this.department}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                            <i class="fa fa-exclamation-circle" ></i>
                            <g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
        <div class="container mt-5 ">
            <div class="row">

            <table class="table table-striped table-bordered table-hover">
                <thead class="table-dark">
                <tr>
                    <th>S.No.</th>
                    <th>Department name</th>
                    <th>Unit</th>
                    <th>Manager</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody class="table-group-divider">
                    <g:each var="department" in="${departmentList}" status="i">
                        <tr>
                            <td>${i+1}</td>
                            <td>${department.name}</td>
                            <td>${department.unit}</td>
                            <td>${department.manager}</td>
                            <td>
                                <g:link action="show" id="${department.id}"><i class="fa fa-solid fa-eye"></i></g:link>
                                <g:link action="edit" id="${department.id}"><i class="fa fa-pen-to-square"></i></g:link>
                                <g:link action="delete" id="${department.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa-solid fa-trash"></i></g:link>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
                </div>
            </div>
        </div>
            <div class="pagination">
                <g:paginate total="${departmentCount ?: 0}" />
            </div>
    </div>
    </body>
</html>