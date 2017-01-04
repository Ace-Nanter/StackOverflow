package stackoverflow

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
    }
    def destroy = {
    }
}
