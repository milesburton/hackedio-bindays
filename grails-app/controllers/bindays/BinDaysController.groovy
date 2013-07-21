package bindays

import grails.converters.JSON

class BinDaysController {

    BinDayService binDayService


    def dates(String addressId) {

        def collections = binDayService.fetchBinDays(addressId)

        render collections as JSON
    }


}

