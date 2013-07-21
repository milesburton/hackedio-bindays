package bindays

import com.popcornteam.restclient.RestClient
import grails.converters.JSON
import mb.QueryStringBuilderService
import org.ccil.cowan.tagsoup.Parser

import java.util.regex.Matcher

class BinDaysController {

    QueryStringBuilderService queryStringBuilderService
    RestClient southwalkClient

    def dates(String addressId) {

        String html = fetchHtmlFromFindSummary(addressId)

        html = html.replace('<br>','')
        html = html + "<br>"

        def tagsoupParser = new Parser()
        def slurper = new XmlSlurper(tagsoupParser)
        def htmlParser = slurper.parseText(html)
        List<Collection> collections =  htmlParser.'**'.findAll { it.name() == 'img' }.collect {

            new Collection(
                    imgHref: it."@src"
            )

        }

        htmlParser.'**'.findAll { it.name() == 'a' }.collect { it.text() }.eachWithIndex{ String type, int i ->
            collections[i].type = type.trim()
        }


        def matcher = html =~ /Collection:- (.*?)</

        matcher.collect { it[1] }.eachWithIndex{ String date, int i ->
            collections[i].nextCollection = date
        }

         render collections as JSON
    }

    private String fetchHtmlFromFindSummary(String addressId) {
        southwalkClient.get(queryStringBuilderService.asResource('/findSummary.asp', ['id': addressId])).bodyAsString
    }
}

class Collection{
    String type
    String imgHref
    String nextCollection
}