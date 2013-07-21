<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Southwalk Bin Days (Yeah that awesome)</title>
    <r:require modules="home" />
</head>

<body>
<div class="navbar navbar-static-top navbar-inverse">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <!-- Logo borrowed, hopefully I wont get into trouble! It's 6:30! -->
            <a class="brand"><img class="logo"
                                  src="http://3.bp.blogspot.com/-KiSu3CP02qI/TZ9pdrFPS1I/AAAAAAAAACk/CK--kiRGva8/s320/bin%2Bman%2Blogo.jpg"/> Bin day?
            </a>

            <div class="nav-collapse">
                <ul class="nav">
                    <li>
                        <a href="#">Home</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="main">
    <div class="container" ng-controller='BinManCtrl'>
        <div class="row">
            <div class="span4">
                <h3>Search</h3>

                <div class="form-search">
                    <div class="input-prepend">
                        <button data-bind="click: search" class="btn">Postcode</button>
                        <input type="text" required data-bind="value: postcode" class="span2 search-query" name="postcode" ng-model="postcode" ng-change="fetchAddress()">
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row" ng-show="{address.length > 0}">
            <div class="span8">
                <div class="btn-group dropdown">
                    <button class="btn">Your Address</button>
                    <button class="btn dropdown-toggle" data-toggle="dropdown">
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li ng-repeat="address in addresses">
                            <a tabindex="-1" href="#">{{address.address}}</a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>