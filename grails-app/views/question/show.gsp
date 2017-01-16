<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>

<body>
    <div>
        <div class="jumbotron">
            <h1 class="text-center">${question.title}</h1>
        </div>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div>
            <p>${question.text}</p>
        </div>
        <hr/>
        <g:form action="/answer/save" method="post">
            <g:textField name="text" value="" />
            <g:submitButton name="submitButton" value="Submit" />
        </g:form>

</div>
</body>
</html>
