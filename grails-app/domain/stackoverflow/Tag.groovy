package stackoverflow

class Tag {
    String name

    static hasMany = [questions: Question]
    static belongsTo = [question: Question]

    static constraints = {

    }
}
