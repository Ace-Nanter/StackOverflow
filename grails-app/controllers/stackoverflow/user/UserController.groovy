package stackoverflow.user
import grails.plugin.springsecurity.annotation.Secured
import stackoverflow.Feature
import stackoverflow.User

@Secured(['ROLE_ANONYMOUS'])
class UserController extends grails.plugin.springsecurity.ui.UserController {
    def edit_(User user) {
        if(Feature.findByName("User").getEnable()) {
            respond user, view:'edit'
        } else {
            render status: 503
        }
    }
}
