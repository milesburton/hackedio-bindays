<!DOCTYPE html >
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"  xmlns:ng="http://angularjs.org" ng-app='binman'> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"  xmlns:ng="http://angularjs.org" ng-app='binman'> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"  xmlns:ng="http://angularjs.org" ng-app='binman'> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"  xmlns:ng="http://angularjs.org" ng-app='binman'> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" ng-app='binman'><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <r:require modules="core"/>
    <g:layoutHead/>
    <r:layoutResources/>

    <style>

    .results {
        margin: 10px 0;
        padding: 10px;
    }

    .results .k-widget {
        border-style: none;
    }

    .result {
        margin: 20px;
    }

    .result > :first-child {
        float: left;
        margin-right: 10px;
    }

    .poster {
        width: 100px;
        height: 149px;
    }

    .details {
        margin-left: 110px;
    }

    .title {
        font-weight: bold;
        font-size: 1.2em;
    }

    .logo {
        height: 25px;
        width: 88px;
        margin-top: -10px;
    }

        /* Begin Responsive Styles */

    @media all and (max-width: 980px) {
        .k-pager-numbers, .synopsis {
            display: none;
        }
    }

    </style>
</head>
</body>
<g:javascript library="application"/>
<g:layoutBody/>
<r:layoutResources/>

</body>
</html>