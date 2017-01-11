package stackoverflow

class Post {

    String text
    Integer vote
    Date created
    Date edited

    static constraints = {
        edited nullable: true
    }

   /*// Default en BDD
   static mapping = {
        vote defaultValue: "0"
        created defaultValue: "now()"
    }*/
}
