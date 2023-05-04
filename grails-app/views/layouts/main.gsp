<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
%{--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/fontawesome.min.css" integrity="sha512-SgaqKKxJDQ/tAUAAXzvxZz33rmn7leYDYfBP+YoMRSENhf3zJyx3SBASt/OfeQwBHA1nxMis7mM3EV/oYT6Fdw==" crossorigin="anonymous" referrerpolicy="no-referrer" />--}%
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <g:layoutHead/>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand font-weight-bold" href="${createLink(uri: '/')}"> <img src="${resource(dir: 'images', file: 'favicon.png')}" alt="EMS" width="40" height="40" class="d-inline-block align-text-top"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarToggler">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${createLink(uri: '/')}" ><i class="fa-solid fa-house-chimney"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <g:link  class="nav-link"  controller="department" action="create"><i class="fa-solid fa-square-plus"></i> Create Department</g:link>
                    </li>
                    <li class="nav-item">
                        <g:link class="nav-link" controller="department" action="index"><i class="fa-solid fa-table-list"></i> List Department</g:link>
                    </li>
                    <li class="nav-item">
                        <g:link class="nav-link" controller="employee" action="create"><i class="fa-solid fa-square-plus"></i> Create Employee</g:link>
                    </li>
                    <li class="nav-item">
                        <g:link class="nav-link" controller="employee" action="index"><i class="fa-solid fa-table-list"></i> List Employee</g:link>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
