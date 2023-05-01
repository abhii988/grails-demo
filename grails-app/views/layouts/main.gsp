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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <g:layoutHead/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand font-weight-bold " href="${createLink(uri: '/')}"> <h2 class="font-weight-bold">CG Notes</h2> </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarToggler">
            <ul class="nav navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="${createLink(uri: '/')}" ><i class="fa fa-home"></i> Home</a>
                </li>
                <li class="nav-item">
                    <g:link  class="nav-link"  controller="notes" action="create"><i class="fa fa-plus-square-o"></i> Create Notes</g:link>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" controller="notes" action="index"><i class="fa fa-list-ul"></i> List Notes</g:link>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" controller="category" action="index"><i class="fa fa-list-ul"></i> Category</g:link>
                </li>
            </ul>
        </div>
    </div>
</nav>
%{--    <nav class="navbar navbar-expand-lg navbar-light bg-light">--}%
%{--        <div class="container">--}%
%{--            <a class="navbar-brand font-weight-bold " href="${createLink(uri: '/')}"> <h2 class="font-weight-bold">CG Notes</h2> </a>--}%
%{--            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">--}%
%{--                <span class="navbar-toggler-icon"></span>--}%
%{--            </button>--}%
%{--            <div class="navbar-header">--}%
%{--                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">--}%
%{--                    <span class="sr-only">Toggle navigation</span>--}%
%{--                    <span class="icon-bar"></span>--}%
%{--                    <span class="icon-bar"></span>--}%
%{--                    <span class="icon-bar"></span>--}%
%{--                </button>--}%
%{--                <a class="navbar-brand" href="/#">--}%
%{--                    <i class="fa grails-icon">--}%
%{--                        <asset:image src="grails-cupsonly-logo-white.svg"/>--}%
%{--                    </i> Grails--}%
%{--                </a>--}%
%{--            </div>--}%
%{--            <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">--}%
%{--                <ul class="nav navbar-nav navbar-right">--}%
%{--                    <g:pageProperty name="page.nav" />--}%
%{--                </ul>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </nav>--}%

    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
