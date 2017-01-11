package stackoverflow

class Answer extends Post {

    static belongsTo = [question: Question]
    static hasMany = [comments: Comment]

    static constraints = {
        question nullable:true
        comments nullabe:true
    }
}
