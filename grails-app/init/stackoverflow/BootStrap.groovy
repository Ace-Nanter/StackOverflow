package stackoverflow

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()
        def anonymousRole = new Role(authority: 'ROLE_ANONYMOUS').save()

        def testUser = new User(username: 'me', password: 'password').save()
       // def anonymousUser = new User (username:'anonymous', password: '1234').save()

        UserRole.create testUser, adminRole
        //UserRole.create anonymousUser, anonymousRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 1
        assert Role.count() == 3
        assert UserRole.count() == 1

        // Stub data
        if (Environment.current == Environment.DEVELOPMENT
                || Environment.current == Environment.TEST) {

            new Question(text: "Everything is said in the title : what is the meaning of life ?",
                    vote: 0,
                    created: new Date(),
                    edited: new Date(),
                    title: "What is the meaning of life ?",
                    views: 0,
                    resolved: false).save(failOnError: true)
        }

    }
    def destroy = {
    }

    // TODO : créer un stub de données. Penser à mettre un if(mode = dev)



}
