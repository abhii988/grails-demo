<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-department" class="content container mt-2 scaffold-show" role="main">
            <br/>
            <h3>Department Detail</h3>
            <g:if test="${flash.message}">
                <div class="alert alert-success" role="alert">
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
            <div class="offset-2 col-md-8 mt-5 ">
                <div class="card">
                    <div class="card-body">
                        <div class="row m-l-0 m-r-0">
                                <div class="col-sm-4 bg-c-lite-green user-profile">
                                    <div class="card-block text-center text-white">
                                        <div class="m-b-25">
                                            <img src="${resource(dir: 'images', file: 'department.jpg')}"  class="rounded-circle" alt="User-Profile-Image" width="95" height="95">
                                        </div>
                                        <h6 class="f-w-600">${department.name}</h6>
                                        <p>${department.unit}</p>
                                        <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                                    </div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="card-block">
                                        <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Department Details</h6>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Department ID</p>
                                                <h6 class="text-muted f-w-400">${department.id}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Department Name</p>
                                                <h6 class="text-muted f-w-400">${department.name}</h6>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Department Unit</p>
                                                <h6 class="text-muted f-w-400">${department.unit}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Department Manager</p>
                                                <h6 class="text-muted f-w-400">${department.manager}</h6>
                                            </div>
                                            <div class="social-link list-unstyled m-t-40 m-b-10">
                                                <g:form resource="${this.department}" method="DELETE">
                                                    <g:link class="edit mb-3 btn btn-outline-primary float-right btn-large btn-rounded" action="edit" resource="${this.department}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                                    <input class="delete mb-3 btn btn-outline-danger float-right btn-large btn-rounded" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                                </g:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
