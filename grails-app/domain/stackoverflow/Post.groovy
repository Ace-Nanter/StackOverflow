package stackoverflow

class Post {

    String text
    Integer vote
    Date created
    Date edited

    static constraints = {
        edited (nullable: true, validator:{
            value, reference ->
                return value == null || value >= reference.created
        })
    }

   /*// Default en BDD
   static mapping = {
        vote defaultValue: "0"
        created defaultValue: "now()"
    }*/
}
