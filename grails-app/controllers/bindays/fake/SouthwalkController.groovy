package bindays.fake

import org.codehaus.groovy.grails.web.mapping.LinkGenerator

class SouthwalkController {

    LinkGenerator linkGenerator

    def findAddress() {

        render(text: getClass().getResource("/mb/fixture/findAddress.asp").text)
    }

    def findSummary(){
        render(text: getClass().getResource("/mb/fixture/findSummary.asp").text)
    }
}