<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="create-department" class="content container mt-2 scaffold-create" role="main">
            <br />
            <h3><g:message code="default.create.label" args="[entityName]" /></h3>
            <g:if test="${flash.message}">
                <div class="alert alert-success alert-dismissible fade show pl-4" role="alert">
                    <i class="fa fa-check-circle-o"></i>
                    ${flash.message}
                </div>
            </g:if>
            <g:if test="${flash.error}">
                <div class="alert alert-danger alert-dismissible fade show pl-4" role="alert">
                    <i class="fa fa-check-circle-o" ></i>
                    ${flash.error}
                </div>
            </g:if>
            <g:form class="align-items-center" action="save">
                <div class="container col-md-8 col-md-offset-2 mt-5">
                    <div class="card" >
                        <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label">Department Name</label>
                                <g:textField name="name" type="text" class="notes-title form-control no-outline" placeholder="..." required="true"></g:textField><br />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Department Unit</label>
                                <g:textField name="unit" type="text" class="notes-title form-control no-outline" placeholder="..." required="true"></g:textField><br />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Department Manager</label>
                                <g:textField name="manager" type="text" class="notes-title form-control no-outline" placeholder="..." required="true"></g:textField><br />
                            </div>
                            <g:submitButton name="create" class="save mt-1 btn btn-success float-right btn-large btn-rounded" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </div>
                    </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
