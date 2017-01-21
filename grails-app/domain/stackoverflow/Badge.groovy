package stackoverflow

class Badge {

    String name

    static belongsTo = User
    static hasMany = [users: User]


    static constraints = {
        users nullable: true
    }

    static createAllBadge (){
        new Badge(name:"Ask a question").save()
        new Badge(name:"Give an answer").save()
        new Badge(name:"Comment a question").save()
        new Badge(name:"Comment an answer").save()
        new Badge(name:"Ask 3 questions").save()
    }

    static User controlBadges(User user) {
        if (user != null) {
            if (user.questions != null && user.questions.count(null) == 1) {
                user.addToBadges(get(name: "Ask a question"))
            }

            if (user.questions != null && user.questions.count(null) == 3) {
                user.addToBadges(get(name: "Ask 3 questions"))
            }

            if (user.answers != null && user.answers.count(null) == 1) {
                user.addToBadges(get(name: "Give an answer"))
            }

            if (user.comments != null && user.comments.count({ it.question == null }) == 1) {
                user.addToBadges(get(name: "Comment an answer"))
            }

            if (user.comments != null && user.comments.count({ it.answer == null }) == 1) {
                user.addToBadges(get(name: "Comment a question"))
            }

            if(user.badges != null) {
                user.badges = user.badges.unique { it.name }
            }
        }
        return user
    }
}
