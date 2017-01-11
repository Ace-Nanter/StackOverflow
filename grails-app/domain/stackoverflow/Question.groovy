package stackoverflow

class Question extends Post {

    String title
    Integer views
    Boolean resolved
    ArrayList<String> tags

    static hasMany = [answers: Answer, comments: Comment]

    static constraints = {
        tags nullable: true
        answers nullable: true
        comments nullable: true
    }

    // Default en bdd
    /*
    static mapping = {
        views defaultValue: "0"
        resolved defaultValue: "false"
    }*/
}
