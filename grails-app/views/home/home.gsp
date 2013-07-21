<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Southwalk Bin Days (Yeah that awesome)</title>
    <r:require modules="home"/>

    <script>
        (function(){
            function install(ev) {
                ev.preventDefault();
                // define the manifest URL
                var manifest_url = "/manifest/manifest.webapp";
                // install the app
                var myapp = navigator.mozApps.install(manifest_url);
                myapp.onsuccess = function(data) {
                    // App is installed, remove button
                    this.parentNode.removeChild(this);
                };
                myapp.onerror = function() {
                    // App wasn't installed, info is in this.error.name
                    console.log('Install failed, error: ' + this.error.name);
                };
            };
            // get a reference to the button and call install() on click
            var button = document.getElementById('install');
            button.addEventListener('click', install, false);
        })();
    </script>
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
                        <input type="text" required data-bind="value: postcode" class="span2 search-query"
                               name="postcode" ng-model="postcode" ng-change="fetchAddress()">
                    </div>
                </div>
            </div>
        </div>
        <br/>

        <div class="row" ng-show="addresses.length > 0">
            <div class="span8">
                <select ng-model="address" ng-options="address.address for address in addresses" ng-change='showAddress()'></select><br>
            </div>
        </div>

         <ul class="unstyled">
             <li ng-repeat='binDay in binDays' style="position: relative; height: 100px;">
                 <a href="{{binDay.calendarEntry}}"><img src="{{binDay.imgHref}}" alt="{{binDay.type}}" class="img-circle" style="float:left"></a>
                 <b>{{binDay.type}} </b>  <br />
                 {{binDay.nextCollection}}

             </li>
         </ul>



        <button id="install">
            Install BinDays!
        </button>

    </div>
</div>
</body>
</html>