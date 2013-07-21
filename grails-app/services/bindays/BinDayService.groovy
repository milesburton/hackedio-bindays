package bindays

import com.popcornteam.restclient.RestClient
import mb.QueryStringBuilderService
import org.ccil.cowan.tagsoup.Parser

class BinDayService {

    static transactional = false

    RestClient southwalkClient
    QueryStringBuilderService queryStringBuilderService

    def fetchBinDays(String addressId) {

        String html = fetchHtmlFromFindSummary(addressId)

        html = html.replace('<br>', '')
        html = html + "<br>"

        def tagsoupParser = new Parser()
        def slurper = new XmlSlurper(tagsoupParser)
        def htmlParser = slurper.parseText(html)
        List<Collection> collections = htmlParser.'**'.findAll { it.name() == 'img' }.collect {

            new Collection(
                    imgHref: it."@src"
            )

        }

        htmlParser.'**'.findAll { it.name() == 'a' }.collect { it.text() }.eachWithIndex { String type, int i ->
            collections[i].type = type.trim()
        }


        def matcher = html =~ /Collection:- (.*?)</

        matcher.collect { it[1] }.eachWithIndex { String date, int i ->
            collections[i].nextCollection = date
        }

        collections.collect {
            it.calendarEntry = "calendar/${it.type.encodeAsURL()}/${it.nextCollection.encodeAsURL()}"

            it
        }

    }

    private String fetchHtmlFromFindSummary(String addressId) {
        southwalkClient.get(queryStringBuilderService.asResource('/findSummary.asp', ['id': addressId])).bodyAsString
    }
}

class Collection {
    String type
    String imgHref
    String nextCollection
    String calendarEntry
}