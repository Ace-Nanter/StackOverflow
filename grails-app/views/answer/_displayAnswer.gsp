    <div class="row">
        <div class="col-xs-1">
            <!-- Part on the right for voting -->
            <g:form controller="answer" action="upVote" method="PUT" resource="${this.answer}" >
                <button type="submit">
                    <span class="glyphicon glyphicon-triangle-top"></span>
                </button>
            </g:form>
            <span class="text-center">${answer.vote}</span>     <!-- Display the value -->
            <g:form controller="answer" action="downVote" method="PUT" resource="${this.answer}" >
                <button type="submit">
                    <span class="glyphicon glyphicon-triangle-bottom"></span>
                </button>
            </g:form>
        </div>
        <div class="col-xs-11">
            <!-- Display of the answer -->
            <p>${answer.text}</p>
        </div>
    </div>
    <!-- Display date -->
    <div class="row">

        <!-- User -->
        <div class="text-left top-margin-50">
            ${message(code: 'answer.user.by', default:'By : ')} ${answer.user.username}

            <br/>
            <!-- Edit area -->
            <g:isOwner owner="${answer.user}">
                <g:link class="btn btn-primary glyphicon-pencil" url="/answer/edit/${answer.id}">
                    ${message(code: 'buttons.answer.edit', default: ' Edit answer ')}
                </g:link>
            </g:isOwner>
        </div>

        <!-- Dates -->
        <div class="text-right">
            <p>
                ${message(code: 'answer.date.created', default:'Created : ')}<g:formatDate date="${answer.created}" format="dd-MM-yyyy HH:mm:ss" />
                <br />
                <g:if test="${answer.edited != null}">
                    ${message(code: 'answer.date.edited', default:'Edited : ')}<g:formatDate date="${answer.edited}" format="dd-MM-yyyy HH:mm:ss" />
                </g:if>
            </p>
        </div>
    </div>
