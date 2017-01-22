<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <!--
        <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
        -->
        <title><g:message code="question.list.title" default="Question List" /> - Stack Overflow</title>
    </head>
    <body>
        <div id="list-question" class="content scaffold-list" role="main">

            <div class="jumbotron">
                <h1 class="text-center">
                    ${message(code: 'question.home.title', default:'Question asked')}
                </h1>
            </div>

            <g:if test="${flash.message}">
                <div class="alert alert-warning text-center" role="status">${flash.message}</div>
            </g:if>

            <sec:ifLoggedIn>
                <div class="pull-right" style="margin-bottom: 20px">
                    <g:link controller="question" action="create" class="btn btn-success">
                        <span class="glyphicon glyphicon-plus"></span>
                        <span class="text-center">Ask a question</span>
                    </g:link>
                </div>
            </sec:ifLoggedIn>
            <div>
                <table class="table table-striped">
                    <tbody>
                        <g:each in="${questionList}" var="q">
                            <tr>
                                <td class="text-center">
                                    <strong>${q.vote}</strong>
                                </td>
                                <td class="text-center">
                                    <g:link action="show" id="${q.id}">${q.title}</g:link>
                                </td>
                                <td class="text-center">
                                    <g:each in="${q.tags}" var="tag">
                                        <g:link controller="tag" action="show" id="${tag.id}">
                                            <div class="label label-default right-margin-10">
                                                ${tag.name}
                                            </div>
                                            <div class="label label-default right-margin-10">
                                                ${tag.name}
                                            </div>
                                        </g:link>
                                    </g:each>
                                </td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <div>
                <g:paginate total="${questionCount ?: 0}" />
            </div>
        </div>
    </body>
</html>