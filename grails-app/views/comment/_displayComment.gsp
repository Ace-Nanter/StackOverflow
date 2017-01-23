<div class="row editable_post">
    <div class="col-xs-1">
        <g:form controller="answer" action="upVote" method="PUT" resource="${comment}" >
            <h3 style="margin : 0px" class="text-center">
                <button type="submit" class="btn btn-default">
                    <span class="glyphicon glyphicon-triangle-top"></span>
                </button>
            </h3>
        </g:form>

        <h5 style="margin: 0px" class="text-center">
            <span>
                ${comment.vote}
            </span>
        </h5>

        <g:form controller="answer" action="downVote" method="PUT" resource="${comment}" >
            <h3 style="margin: 0px" class="text-center">
                <button type="submit" class="btn btn-default">
                    <span class="glyphicon glyphicon-triangle-bottom"></span>
                </button>
            </h3>
        </g:form>
    </div>
    <div class="col-xs-5">
        <!-- Display of the comment -->
        <g:form controller="comment" action="updateText" method="post" resource="${this.comment}" >
            <g:textField class="editable_display" name="text" value="${comment.text}" readonly="readonly" />
            <span> - </span>
            <span>
                <g:link controller="user" action="edit" id="${comment.user.id}">${comment.user.username}</g:link>
                <span> | </span>
                <g:formatDate date="${question.edited}" format="dd-MM-yyyy HH:mm:ss" />
            </span>
            <g:submitButton class="btn_to_display hidden" name="editComment" value="${message(code: 'comment.button.label', default: 'Edit')}" />
        </g:form>
    </div>

    <div class="col-xs-1">
        <!-- Edit area -->
        <g:isOwner owner="${comment.user}">
            <input type="button" class="btn btn-primary glyphicon-pencil edit_btn" value="${message(code: 'comment.button.label', default: 'Edit')}" />
        </g:isOwner>
    </div>
</div>

