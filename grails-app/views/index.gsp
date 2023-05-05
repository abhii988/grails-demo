<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Demo Project</title>
    <asset:link rel="icon" href="favicon.jpg" type="image/x-ico" />
</head>
<body>
<div id="list-employee" class="content container mt-2 scaffold-list" role="main">
    <br/>
    <h3>User-Department List</h3>
    <g:if test="${flash.message}">
        <div class="alert alert-success alert-dismissible fade show pl-4" role="alert">
            <i class="fa fa-check-circle-o" ></i>
            ${flash.message}
        </div>
    </g:if>
    <g:hasErrors bean="${this.employee}">
        <div class="alert alert-danger bg-danger alert-dismissible fade show pl-4" role="alert">
            <ul class="errors list-unstyled text-white pl-3" >
                <g:eachError bean="${this.employee}" var="error">
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
                    <th>Employee name</th>
                    <th>Age</th>
                    <th>Position</th>
                    <th>Department Name</th>
                    <th>Department Manager</th>
                    <th>Department Unit</th>
                </tr>
                </thead>
                <tbody class="table-group-divider">
                <g:each var="employee" in="${employeeList}" status="i">
                    <tr>
                        <td>${i+1}</td>
                        <td>${employee.name}</td>
                        <td>${employee.age}</td>
                        <td>${employee.position}</td>
                        <td>${employee.department_name}</td>
                        <td>${employee.department_manager}</td>
                        <td>${employee.department_unit}</td>
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
