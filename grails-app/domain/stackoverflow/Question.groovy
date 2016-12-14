package stackoverflow

class Question extends Post {

    Integer views
    Boolean resolved
    ArrayList<String> tags

    static hasMany = [answers: Answer, comments: Comment]

    static constraints = {
    }
}
