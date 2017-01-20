package stackoverflow

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()
        def anonymousRole = new Role(authority: 'ROLE_ANONYMOUS').save()

        def testUser = new User(username: 'me', password: 'password')
        // def anonymousUser = new User (username:'anonymous', password: '1234').save()

        // Stub data
        if (Environment.current == Environment.DEVELOPMENT
                || Environment.current == Environment.TEST) {


            Question question = new Question(text: "Everything is said in the title : what is the meaning of life ?",
                    vote: 0,
                    created: new Date(),
                    edited: new Date(),
                    title: "What is the meaning of life ?",
                    views: 0,
                    resolved: false,
                    user: testUser)

            Answer answer = new Answer(text: "Everything is said in the title : what is the meaning of life ?",
                    vote: 0,
                    created: new Date(1484751600000),
                    edited: new Date(1484752600000),
                    question: question,
                    user: testUser
            )

            Answer answer2 = new Answer(text: "The answer below wasn't a very serious answer.",
                    vote: 0,
                    created: new Date(),
                    edited: new Date(),
                    question: question,
                    user: testUser
            )

            Comment commentQuest = new Comment(text: "Are you serious ?",
                    vote: 5,
                    created: new Date(),
                    edited: new Date(),
                    question: question,
                    anwser: null,
                    user: testUser
            )

            Comment commentAnsw = new Comment(text: "Go back to Google+, faggot",
                    vote: 0,
                    created: new Date(1484751600000),
                    edited: new Date(1484752600000),
                    question: null,
                    anwser: answer,
                    user: testUser
            )

            Tag tag = new Tag(name: "Life", question:question, questions:[question])

            question.tags = [tag]

            testUser.questions = [question]
            testUser.answers = [answer, answer2]
            testUser.comments = [commentAnsw, commentQuest]

            question.save("failOnError": true)
            answer.save("failOnError": true)
            answer2.save("failOnError": true)
            commentQuest.save("failOnError": true)
            commentAnsw.save("failOnError": true)
            testUser.save("failOnError": true)
            tag.save("failOnError": true)
        }

        UserRole.create testUser, adminRole
        //UserRole.create anonymousUser, anonymousRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 1
        assert Role.count() == 3
        assert UserRole.count() == 1
    }
    def destroy = {
    }

    // TODO : créer un stub de données. Penser à mettre un if(mode = dev)



}
