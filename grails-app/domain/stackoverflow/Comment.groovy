package stackoverflow

class Comment extends Post {

    static belongsTo = [answer: Answer, question: Question]

    static constraints = {

        // Personalized validator to be associated to a question OR an answer.
        answer(validator: {val, obj ->
            if(question != null)
                return false
        })

        question(validator: {val, obj ->
            if(answer != null)
                return false
        })
    }
}
