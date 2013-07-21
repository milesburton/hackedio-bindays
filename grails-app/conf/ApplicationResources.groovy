modules = {
    application {
        resource url: 'js/kendo.all.min.js'
        resource url: 'js/bootstrap.min.js'
        resource url: 'js/angular.js'
        resource url: 'js/angular-resource.js'
    }

    core {
        dependsOn 'jquery', 'bootstrap'

        resource url: 'css/kendo.common.min.css'
    }

    home {
        resource url: 'js/modules/home/angular.js'
    }
}