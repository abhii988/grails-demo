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
            <g:hasErrors bean="${this.department}">
                <div class="alert bg-danger alert-danger alert-dismissible fade show pl-4" role="alert">
                    <ul class="errors list-unstyled text-white pl-3" >
                        <g:eachError bean="${this.department}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                                <i class="fa fa-exclamation-circle" ></i>
                                <g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>
            <g:form class="align-items-center" action="save">
%{--                <fieldset class="form">--}%
%{--                    <table>--}%
%{--                        <tr>--}%
%{--                            <td width="200">Department Name:* </td>--}%
%{--                            <td><input type="text" name="name" autocomplete="off" required> </td>--}%
%{--                        </tr>--}%
%{--                        <tr>--}%
%{--                            <td>Unit:* </td>--}%
%{--                            <td><input type="text" name="unit" autocomplete="off" required> </td>--}%
%{--                        </tr>--}%
%{--                        <tr>--}%
%{--                            <td>Manager:* </td>--}%
%{--                            <td><input type="text" name="manager" autocomplete="off" required> </td>--}%
%{--                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">--}%
%{--                        </tr>--}%
%{--                    </table>--}%
%{--                </fieldset>--}%
%{--                <fieldset class="buttons">--}%
%{--                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
%{--                </fieldset>--}%
                <div class="container col-md-8 col-md-offset-2 mt-5 text-center ">
                    <div class="card" >
                        <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <g:textField name="name" type="text" class="notes-title form-control no-outline " placeholder="Department Name Here" required="true"></g:textField><br />
                            </div>
                <div class="mb-3">
                    <label class="form-label">Email address</label>
                    <g:textField name="unit" type="text" class="notes-title form-control no-outline " placeholder="Department Unit Here" required="true"></g:textField><br />
                </div>
                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <g:textField name="manager" type="text" class="notes-title form-control no-outline " placeholder="Department Manager Here" required="true"></g:textField><br />
                            </div>

                            <g:submitButton name="create" class="save mt-1 btn btn-primary float-right btn-large btn-rounded" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </div>
                    </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
