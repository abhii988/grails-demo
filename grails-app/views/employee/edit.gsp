<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="edit-employee" class="content container mt-2 scaffold-edit" role="main">
            <br /> 
            <h3><g:message code="default.edit.label" args="[entityName]" /></h3>
            <g:if test="${flash.message}">
                <div class="alert alert-success alert-dismissible fade show pl-4" role="status">
                    <i class="fa fa-check-circle-o"></i>
                    ${flash.message}
                </div>
            </g:if>
            <g:hasErrors bean="${this.employee}">
                <div class="alert bg-danger alert-danger alert-dismissible fade show pl-4" role="alert">
                    <ul class="errors list-unstyled text-white pl-3" >
                        <g:eachError bean="${this.employee}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                                <i class="fa fa-exclamation-circle" ></i>
                                <g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>
            <g:form resource="${this.employee}" method="PUT">
                <g:hiddenField name="version" value="${this.employee?.version}" />
                 <div class="container col-md-8 col-md-offset-2 mt-5">
                    <div class="card" >
                        <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label">Employee ID</label>
                                <g:textField name="id" type="number" value="${employee.id}" class="notes-title form-control no-outline" placeholder="..." disabled="true"></g:textField><br />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Employee Name</label>
                                <g:textField name="name" type="text" value="${employee.name}" class="notes-title form-control no-outline" placeholder="..." required="true"></g:textField><br />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Employee Age</label>
                                <input type="number"  name="age" value="${employee.age}" class="notes-title form-control no-outline" placeholder="..." required="true" min="18" max="60"/><br />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Employee Position</label>
                                <g:textField name="position" type="text" value="${employee.position}" class="notes-title form-control no-outline" placeholder="..." required="true"></g:textField><br />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Department Name</label>
                                <g:select value="${employee.department.id}"name="department_id" from="${departmentList}" optionKey="id" optionValue="name" class="form-select" aria-label="Default select example"></g:select>
                            </div>
                            <g:submitButton name="update" class="save mt-1 btn btn-primary float-right btn-large btn-rounded" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </div>
                    </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
