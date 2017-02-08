package stackoverflow

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
@Transactional(readOnly = true)
class QuestionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ANONYMOUS'])
    def index(Integer max) {
        if(Feature.findByName("Question").getEnable()) {
            params.max = Math.min(max ?: 10, 100)
            respond Question.list(params), model:[questionCount: Question.count()]
        } else {
            render status: 503
        }
    }

    @Secured(['ROLE_ANONYMOUS'])
    def show(Question question) {
        if(Feature.findByName("Question").getEnable()) {
            respond question
        } else {
            render status: 503
        }
    }

    def create() {
        def listTags = Tag.list();
        respond new Question(params), model:[listTags: listTags]
    }

    @Transactional
    def addQuestion(){
        if(Feature.findByName("Question").getEnable()) {
            Question question = new Question(
                    title: params.title,
                    text: params.text,
                    resolved: false,
                    vote: 0,
                    created: new Date(),
                    user: (User)getAuthenticatedUser()
            )

            def tags = []
            for(idTag in params.tags) {
                tags << Tag.get(idTag)
            }

            question.tags = tags

            if (question == null) {
                transactionStatus.setRollbackOnly()
                notFound()
                return
            }

            if (question.hasErrors()) {
                transactionStatus.setRollbackOnly()
                respond question.errors, view:'create'
                return
            }

            question.save(failOnError: true)
            Badge.controlBadges(question.user)?.save()

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                    redirect controller: 'Question', action: 'index'
                }
                '*' { respond question, [status: CREATED] }
            }
        } else {
            render status: 503
        }
    }

    @Transactional
    def upVote(Question question){

        if(Feature.findByName("Question").getEnable() && Feature.findByName("Vote").getEnable()) {

            if (question == null) {
                transactionStatus.setRollbackOnly()
                notFound()
                return
            }

            if (question.hasErrors()) {
                transactionStatus.setRollbackOnly()
                respond question.errors, view:'edit'
                return
            }

            question.vote++
            question.user.reputation += User.REPUTATION_COEF
            Badge.controlBadges(question.user)
            question.user.save()
            question.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                    redirect question
                }
                '*'{ respond question, [status: OK] }
            }
        } else {
            render status: 503
        }
    }

    @Transactional
    def downVote(Question question) {

        if(Feature.findByName("Question").getEnable() && Feature.findByName("Vote").getEnable()) {
            if (question == null) {
                transactionStatus.setRollbackOnly()
                notFound()
                return
            }

            if (question.hasErrors()) {
                transactionStatus.setRollbackOnly()
                respond question.errors, view:'edit'
                return
            }

            question.vote--
            question.user.reputation -= User.REPUTATION_COEF
            Badge.controlBadges(question.user)
            question.user.save()
            question.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                    redirect question
                }
                '*'{ respond question, [status: OK] }
            }
        } else {
            render status: 503
        }
    }

    @Secured(['ROLE_ANONYMOUS'])
    @Transactional
    def addView(Question question) {

        if (question == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (question.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond question.errors, view:'edit'
            return
        }
        question.views++
        question.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                redirect question
            }
            '*'{ respond question, [status: OK] }
        }
    }

    @Transactional
    def save(Question question) {
        if (question == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (question.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond question.errors, view:'create'
            return
        }

        question.save(flush: true)
        Badge.controlBadges(question.user)?.save()

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                redirect question
            }
            '*' { respond question, [status: CREATED] }
        }
    }

    @Transactional
    def setResolved(Question question) {
        if(Feature.findByName("Question").getEnable()) {
            if (question == null) {
                transactionStatus.setRollbackOnly()
                notFound()
                return
            }

            if (question.hasErrors()) {
                transactionStatus.setRollbackOnly()
                respond question.errors, view:'edit'
                return
            }
            question.resolved = true
            question.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                    redirect question
                }
                '*'{ respond question, [status: OK] }
            }
        } else {
            render status: 503
        }
    }

    @Transactional
    def updateText(Question question, String title, String text) {
        if(Feature.findByName("Question").getEnable()) {
            if (question == null) {
                transactionStatus.setRollbackOnly()
                notFound()
                return
            }

            if (question.hasErrors()) {
                transactionStatus.setRollbackOnly()
                respond question.errors, view:'edit'
                return
            }

            question.title = title
            question.text = text
            question.edited = new Date()
            question.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                    redirect controller: 'Question', action: 'show', id: question.id
                }
                '*'{ respond question, [status: OK] }
            }
        } else {
            render status: 503
        }
    }

    def edit(Question question) {
        respond question
    }

    @Transactional
    def update(Question question) {
        if (question == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (question.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond question.errors, view:'edit'
            return
        }

        question.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                redirect question
            }
            '*'{ respond question, [status: OK] }
        }
    }

    @Transactional
    def delete(Question question) {
        if(Feature.findByName("Question").getEnable()) {
            if (question == null) {
                transactionStatus.setRollbackOnly()
                notFound()
                return
            }

            question.delete flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
        } else {
            render status: 503
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
