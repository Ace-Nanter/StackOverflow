package stackoverflow

class Tag {
    String name

    static belongsTo = [question: Question]

    static constraints = {
    }
}
