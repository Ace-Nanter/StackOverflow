<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
        <title>${question.title} - Stack Overflow</title>
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
                    <button type="submit">
                        <span class="glyphicon glyphicon-triangle-top"></span>
                    </button>
                </g:form>
                <span class="text-center">${question.vote}</span>     <!-- Display the value -->
                <g:form controller="answer" action="downVote" method="PUT" resource="${question}" >
                    <button type="submit">
                        <span class="glyphicon glyphicon-triangle-bottom"></span>
                    </button>
                </g:form>
            </div>
            <div class="col-xs-11">
                <!-- Display of the answer -->
                <p>${question.text}</p>
            </div>
        </div>
        <hr/>
        <g:each in="${question.answers}" var="a">
            <tr>
                <td>
                    <g:render template="/answer/displayAnswer" model="['answer':a]" />
                </td>
            </tr>
            <hr />
        </g:each>

        <g:form controller="answer" action="addAnswer" method="post">
            <g:hiddenField name="idQuestion" value="${question.id}" />
            <g:textField name="text" value="" />
            <g:submitButton name="addAnwser" value="Submit" />
        </g:form>
    </div>
</body>
</html>