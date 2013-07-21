import grails.util.Environment

class DevTestUrlMappings {

    static mappings = {


        if(['test','development'].contains(Environment.current.name)){

           "/fake/southwalk/findAddress.asp"       (controller:"southwalk", action: 'findAddress')
           "/fake/southwalk/findSummary.asp"       (controller: "southwalk", action: "findSummary")

        }
    }
}
