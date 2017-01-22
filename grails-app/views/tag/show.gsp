<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <!-- Questions -->
    <div class="container top-margin-50">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>${message(code: 'tag.title', default: 'Questions about tag {0}', args:[tag.name])}</h3>
            </div>
            <div class="panel-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Votes</th>
                        <th>Question</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tag.questions}" var="question">
                        <tr>
                            <td>${question.vote}</td>
                            <td><g:link controller="question" action="show" id="${question.id}"> ${question.title} </g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </body>
</html>
