<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div id="list-department" class="content container mt-2 scaffold-list" role="main">
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
            <div class="container mt-5">
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
                                        <g:link action="show" id="${department.id}" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-solid fa-eye"></i></g:link>
                                        <g:link action="edit" id="${department.id}"><i class="fa fa-pen-to-square"></i></g:link>
                                        <g:link action="delete" id="${department.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa-solid fa-trash"></i></g:link>
                                    </td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
                <div class="pagination">
                <g:paginate total="${departmentCount ?: 0}" />
                </div>
            </div>
        </div>
        <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="show-department" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <%-- <table>
                <tr class="tr2">
                    <td class="table-td-width">Id: </td>
                    <td>${department.id}</td>
                </tr>
                <tr class="tr2">
                    <td>Name: </td>
                    <td>${department.name}</td>
                </tr>
                <tr class="tr2">
                    <td>Unit: </td>
                    <td>${department.unit}</td>
                </tr>
                <tr class="tr2">
                    <td>Manager: </td>
                    <td>${department.manager}</td>
                </tr>
            </table> --%>
        </div>
      </div>
      <div class="modal-footer">
        <g:form resource="${this.department}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.department}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
      </div>
    </div>
  </div>
</div>
    </body>
</html>