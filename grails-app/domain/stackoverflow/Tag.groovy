package stackoverflow

class Tag {
    String name

    static hasMany = [questions: Question]
    static belongsTo = Question
    static mappedBy = [questions: "tags"]

    static mapping = {
        table name: 'Tags'
        id (generator: 'identity')
        questions (
                joinTable: [name: 'Question2Tags', key: 'tagID', column: 'questionID'],
                cascade: 'none'
        )
    }

    static constraints = {

    }
}
