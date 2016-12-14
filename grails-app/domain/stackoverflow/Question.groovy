package stackoverflow

class Question extends Post {

    Integer views
    Boolean resolved

    static hasMany = [answers: Answer, comments: Comment]

    static constraints = {
    }
}
