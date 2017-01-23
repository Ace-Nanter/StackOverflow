<div class="row">
    <div class="col-xs-1">
        <g:form controller="answer" action="upVote" method="PUT" resource="${comment}" >
            <h4 style="margin : 0px" class="text-center">
                <button type="submit" class="btn btn-default">
                    <span class="glyphicon glyphicon-triangle-top"></span>
                </button>
            </h4>
        </g:form>

        <h5 style="margin: 0px" class="text-center">
            <span>
                ${comment.vote}
            </span>
        </h5>
        <g:form controller="answer" action="downVote" method="PUT" resource="${comment}" >
            <h4 style="margin: 0px" class="text-center">
                <button type="submit" class="btn btn-default">
                    <span class="glyphicon glyphicon-triangle-bottom"></span>
                </button>
            </h4>
        </g:form>
    </div>
    <div class="col-xs-8">
        <!-- Display of the comment -->
        <p style="word-wrap: break-word">
            ${comment.text} -
            <span>
                <g:link controller="user" action="edit" id="${comment.user.id}">${comment.user.username}</g:link>
                <span> | </span>
                <g:formatDate date="${comment.created}" format="dd-MM-yyyy HH:mm:ss" />
            </span>
        </p>
    </div>

    <div class="text-right">
        <!-- Edit area -->
        <g:isOwner owner="${comment.user}">
                <g:link class="btn btn-primary glyphicon-pencil" controller="comment" action="edit" resource="${this.comment}">
                    <g:message code="comment.button.label" default="Edit" />
                </g:link>
        </g:isOwner>
    </div>
</div>
