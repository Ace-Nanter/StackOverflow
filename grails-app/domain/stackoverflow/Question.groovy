package stackoverflow

class Question extends Post {

    String title
    Integer views
    Boolean resolved
    ArrayList<String> tags

    static belongsTo = [user: User]

    static hasMany = [answers: Answer, comments: Comment, tags: Tag]

    static constraints = {
        tags nullable: true
        answers nullable: true
        comments nullable: true
        tags nullable: true
    }

    // Default en bdd

    static mapping = {
        answers order: 'desc', sort: 'vote'
    }
}
