    <div class="row">
        <div class="col-xs-2">
            <!-- Part on the right for voting -->
            <g:form action="/answer/upVote" method="post" >
                <g:hiddenField name="id" value="${answer.id}" />
                <g:submitButton name="submitButton" value="" class="glyphicon glyphicon-triangle-top"/>
            </g:form>
            <span>${answer.vote}</span>     <!-- Display the value -->
            <g:form action="/answer/upDown" method="post">
                <g:hiddenField name="id" value="${answer.id}" />
                <g:submitButton name="submitButton" value="" class="glyphicon glyphicon-triangle-bottom"/>
            </g:form>
        </div>
        <div class="col-xs-10">
            <!-- Display of the answer -->
            <p>${answer.text}</p>
        </div>
    </div>
    <!-- Display date -->
    <div class="text-right">
        <p>
            ${message(code: 'answer.date.created', default:'Created : ')}<g:formatDate date="${answer.created}" format="dd-MM-yyyy HH:mm:ss" />
            <br />
            <g:if test="${answer.edited != null}">
                ${message(code: 'answer.date.edited', default:'Edited : ')}<g:formatDate date="${answer.edited}" format="dd-MM-yyyy HH:mm:ss" />
            </g:if>
        </p>
    </div>