package bindays

import org.joda.time.format.DateTimeFormat
import org.joda.time.format.DateTimeFormatter

class CalendarEntryController {

    def create(String type, String dateStr) {

        dateStr = dateStr.decodeURL()
        type = type.decodeURL()

        //Wednesday 31 July 2013
        DateTimeFormatter fmt = DateTimeFormat.forPattern("EEEE dd MMMM yyyy")
        Date collectionDate = fmt.parseDateTime(dateStr).toDate()



        render(contentType: 'text/calendar') {
            calendar {
                events {
                    event(start: collectionDate,
                            end: collectionDate,
                            description: type,
                            summary: type) {
                        organizer(name: 'Southwalk', email: 'southwalk@the.gov.uk')
                    }
                    event(start: collectionDate,
                            end: collectionDate,
                            description: 'Bin day',
                            summary: 'Bin day',
                            location: '@home',
                            classification: 'private') {
                        organizer(name: 'Southwalk', email: 'southwalk@the.gov.uk')
                    }
                }
            }
        }

    }
}
