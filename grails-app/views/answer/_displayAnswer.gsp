    <div class="row">
        <div class="col-xs-1">
            <!-- Part on the right for voting -->
            <g:form controller="answer" action="upVote" method="PUT" resource="${answer}" >
                <h3 style="margin : 0px" class="text-center">
                    <button type="submit" class="btn btn-default">
                        <span class="glyphicon glyphicon-triangle-top"></span>
                    </button>
                </h3>
            </g:form>
            <!-- Display the value -->
            <h3 style="margin: 0px" class="text-center">
                <span>
                    ${answer.vote}
                </span>
            </h3>
            <g:form controller="answer" action="downVote" method="PUT" resource="${answer}" >
                <h3 style="margin: 0px" class="text-center">
                    <button type="submit" class="btn btn-default">
                        <span class="glyphicon glyphicon-triangle-bottom"></span>
                    </button>
                </h3>
            </g:form>
        </div>
        <div class="col-xs-11">
            <!-- Display of the answer -->
            <p>${answer.text}</p>
        </div>
    </div>
    <div class="text-right">
        <g:link controller="user" action="edit" id="${answer.user.id}">${answer.user.username}</g:link>
        <span class="badge">${answer.user.reputation}</span><br />
        ${message(code: 'answer.date.created', default:'Created : ')}<g:formatDate date="${question.created}" format="dd-MM-yyyy HH:mm:ss" /><br />
        <g:if test="${question.edited != null}">
            ${message(code: 'answer.date.edited', default:'Edited : ')}<g:formatDate date="${question.edited}" format="dd-MM-yyyy HH:mm:ss" />
        </g:if>
    </div>

    <!-- Comments -->
    <div class="comments">
        <g:each in="${answer.comments}" var="c">
            <hr />
            <tr>
                <td>
                    <g:render template="/comment/displayComment" model="['comment':c]" />
                </td>
            </tr>

        </g:each>
    </div>

    <g:form controller="comment" action="addComment" method="post" class="top-margin-25">
        <g:hiddenField name="idAnswer" value="${answer.id}" />
        <g:textField name="text" value="" class="add-comment"
            placeholder="${message(code: 'question.create.comment', default: 'Add a new comment...')}" />
        <button type="submit" class="btn btn-success add-comment">
            <span class="glyphicon glyphicon-plus"/>
        </button>
    </g:form>

    <div class="text-center top-margin-25">
        <!-- Edit area -->
        <g:isOwner owner="${answer.user}">
            <g:link class="btn btn-primary glyphicon-pencil" action="edit" resource="${this.answer}">
                <g:message code="answer.button.label" default=" Edit answer " />
            </g:link>
        </g:isOwner>
    </div>

