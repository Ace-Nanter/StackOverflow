<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
        <title>${question.title} - Stack Overflow</title>
        <g:javascript src="editPostMecanism.js" />
    </head>

<body>
    <div>
        <div class="jumbotron">
            <h1 class="text-center">${question.title}</h1>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-warning text-center" role="status">${flash.message}</div>
        </g:if>

        <div class="row">
            <div class="col-xs-1">
            <!-- Part on the right for voting -->
                <g:form controller="question" action="upVote" method="PUT" resource="${question}" >
                    <h3 style="margin : 0px" class="text-center">
                        <button type="submit" class="btn btn-default">
                            <span class="glyphicon glyphicon-triangle-top"></span>
                        </button>
                    </h3>
                </g:form>
                <!-- Display the value -->
                <h3 style="margin: 0px" class="text-center">
                    <span>
                        ${question.vote}
                    </span>
                </h3>
                <g:form controller="answer" action="downVote" method="PUT" resource="${question}" >
                    <h3 style="margin: 0px" class="text-center">
                        <button type="submit" class="btn btn-default">
                            <span class="glyphicon glyphicon-triangle-bottom"></span>
                        </button>
                    </h3>
                </g:form>
            </div>
            <div class="col-xs-11">
                <!-- Display of the question -->
                <p>${question.text}</p>
            </div>
        </div>
        <!-- Display the user -->
        <div class="pull-right">
            <g:link controller="user" action="edit" id="${question.user.id}">${question.user.username}</g:link>
            <span class="badge">${question.user.reputation}</span><br />
            ${message(code: 'answer.date.created', default:'Created : ')}<g:formatDate date="${question.created}" format="dd-MM-yyyy HH:mm:ss" /><br />
            <g:if test="${question.edited != null}">
                ${message(code: 'answer.date.edited', default:'Edited : ')}<g:formatDate date="${question.edited}" format="dd-MM-yyyy HH:mm:ss" />
            </g:if>
        </div>

        <div class="comments">
            <g:each in="${question.comments}" var="c">
                <tr>
                    <td>
                        <g:render template="/comment/displayComment" model="['comment':c]" />
                    </td>
                </tr>
                <hr />
            </g:each>
        </div>

        <g:form controller="comment" action="addComment" method="post">
            <g:hiddenField name="idQuestion" value="${question.id}" />
            <g:textField name="text" value="" />
            <g:submitButton name="addComment" value="${message(code: 'comment.button.add.label', default: 'Add comment')}" />
        </g:form>

        <h2 class="top-margin-50">${message(code: 'question.show.answers', default: 'Answers')}</h2>
        <hr/>
        <g:each in="${question.answers}" var="a">
            <tr>
                <td>
                    <g:render template="/answer/displayAnswer" model="['answer':a]" />
                </td>

            </tr>
            <div class="comments">
                <g:each in="${a.comments}" var="c">
                    <tr>
                        <td>
                            <g:render template="/comment/displayComment" model="['comment':c]" />
                        </td>
                    </tr>
                    <hr />
                </g:each>
            </div>

            <g:form controller="comment" action="addComment" method="post">
                <g:hiddenField name="idAnswer" value="${a.id}" />
                <g:textField name="text" value="" />
                <g:submitButton name="addComment" value="${message(code: 'comment.button.add.label', default: 'Add comment')}" />
            </g:form>

            <hr />
        </g:each>

        <g:form controller="answer" action="addAnswer" method="post">
            <g:hiddenField name="idQuestion" value="${question.id}" />
            <g:textField name="text" value="" />
            <g:submitButton name="addAnwser" value="${message(code: 'answer.button.add.label', default: 'Add answer')}" />
        </g:form>
    </div>
</body>
</html>