package stackoverflow

class Answer extends Post {

    static belongsTo = [question: Question, user: User]
    static hasMany = [comments: Comment]

    static constraints = {
        comments nullabe:true
    }
}
