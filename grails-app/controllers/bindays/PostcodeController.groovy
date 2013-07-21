package bindays

import grails.converters.JSON
import mb.QueryStringBuilderService

class PostcodeController {


    FindAddressService findAddressService


    def postcode(String postcode){

        def addresses = findAddressService.fetchAddresses(postcode)

        render addresses as JSON
    }
}


