package bindays

import org.joda.time.DateTime

class CalendarEntryController {

    def create(String type, String date) {

        Date collectionDate = DateTime.parse(date).toDate()
        type = type.decodeURL()

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
                            classification: 'private'){
                        organizer(name: 'Southwalk', email: 'southwalk@the.gov.uk')
                    }
                }
            }
        }

    }
}
