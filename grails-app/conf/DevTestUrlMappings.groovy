import grails.util.Environment

class DevTestUrlMappings {

    static mappings = {

        if(['test','dev'].contains(Environment.current.name)){

           "/fake/southwalk/findAddress.jsp"       (controller:"southwalk", action: 'findAddress')

        }
    }
}
