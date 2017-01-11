<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <!--
        <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />

        -->
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div>
            <div id="list-question" class="content scaffold-list" role="main">

                <div class="jumbotron">
                    <h1 class="text-center">Questions</h1>
                </div>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <table class="table table-bordered">
                    <tbody>
                        <g:each in="${questionList}" var="q">
                            <tr>
                                <td>
                                    <g:link action="show" id="${q.id}">${q.title}</g:link>
                                </td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>

                <div>
                    <g:paginate total="${questionCount ?: 0}" />
                </div>
            </div>
        </div>
    </body>
</html>