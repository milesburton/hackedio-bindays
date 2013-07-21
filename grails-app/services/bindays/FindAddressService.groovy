package bindays

import com.popcornteam.restclient.RestClient
import mb.QueryStringBuilderService
import org.ccil.cowan.tagsoup.Parser

class FindAddressService {

    static transactional = false

    RestClient southwalkClient
    QueryStringBuilderService queryStringBuilderService

    def fetchAddresses(String postcode) {

        String html = fetchHtmlFromFindAddressPage(postcode)

        convertFindAddressHtmlToAddressIdAssociation(html)

    }

    private List<AddressIdAssociation> convertFindAddressHtmlToAddressIdAssociation(String html) {

        def tagsoupParser = new Parser()
        def slurper = new XmlSlurper(tagsoupParser)
        def htmlParser = slurper.parseText(html)
        htmlParser.'**'.findAll { it.name() == 'option' }.collect {

            String id = it."@value"
            String address = it.text()

            new AddressIdAssociation(
                    id: id,
                    address: address,
                    href: "http://localhost:8080/bindays/binDays/${id}"
            )

        }.findAll { it.id }
    }

    private String fetchHtmlFromFindAddressPage(String postcode) {
        String html = southwalkClient.get(queryStringBuilderService.asResource('/findAddress.asp', ['postcode': postcode])).bodyAsString
        html
    }
}


class AddressIdAssociation {


    String id
    String address
    String href

}