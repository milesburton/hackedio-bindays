package bindays.fake

import grails.converters.JSON

class SouthwalkController {

    def findAddress() {


        def a = ['bleh': 'asdasd']
        render a as JSON
    }
}
