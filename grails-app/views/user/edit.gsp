<sec:ifNotSwitched>
	<sec:ifAllGranted roles='${securityConfig.ui.switchUserRoleName}'>
	<g:set var='username' value='${uiPropertiesStrategy.getProperty(user, 'username')}'/>
	<g:if test='${username}'>
	<g:set var='canRunAs' value='${true}'/>
	</g:if>
	</sec:ifAllGranted>
</sec:ifNotSwitched>
<html>
<head>
	<meta name="layout" content="${gspLayout ?: 'main'}"/>
	<title><g:message code="login.title.title" default="Log in - Stack Overflow"/></title>
</head>
<body>
<div class="container top-margin-50">

    <h1 class="text-center"><g:message code="user.profile.title" args="[user.username]" default="${user.username}'s profile"/></h1>

    <!-- Reputation -->
    <div>
        <label>Reputation</label>
        <span class="label label-success">
            ${user.reputation}
        </span>

        <br/>
        <label>Badges</label>
    </div>

    <!-- User information -->
    <g:isOwner owner="${user}">
        <div class="panel panel-default top-margin-50">
            <div class="panel-heading">
                <h3>User information</h3>
            </div>
            <div class="panel-body">
                <form>
                    <div class="row">
                        <label class="col-md-4">Username : </label>
                        <input name="${usernameParameter ?: 'username'}" type="text" id="username" pattern="^[\w]{3,16}$" autofocus="autofocus"
                               class="col-md-8" placeholder="${message(code: 'login.field.username', default: 'Enter your username')}"/>

                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Email : </label>
                        </div>
                        <div class="col-md-8">
                            <input name="${emailParameter ?: 'email'}" type="email" id="email"
                                   placeholder="${message(code: 'login.field.email', default: 'Enter your email')}"/>
                        </div>

                    </div>
                    <div class="row">
                        <label class="col-md-4">Password</label>
                        <input name="${passwordParameter ?: 'password'}" type="password" required="required" id="password"
                               placeholder="${message(code: 'login.field.password', default: 'Enter your username')}" class="col-md-8"/>
                    </div>
                </form>
            </div>
        </div>
    </g:isOwner>

    <!-- Questions -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3>Questions</h3>
        </div>
        <div class="panel-body">
            <table class="table">
                <thead>
                    <tr>
                        <th>Votes</th>
                        <th>Question</th>
                        <th>Tags</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${user.questions}" var="question">
                        <tr>
                            <td>${question.vote}</td>
                            <td>${question.title}</td>
                            <td>
                                <g:each in="${question.tags}" var="tag">
                                    <div class="label label-default">
                                        ${tag.name}
                                    </div>
                                </g:each>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Answers -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3>Answers</h3>
        </div>
        <div class="panel-body">
            <table class="table">
                <thead>
                <tr>
                    <th>Votes answers</th>
                    <th>Votes question</th>
                    <th>Question</th>
                    <th>Tags</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${user.answers}" var="answer">
                    <tr>
                        <td>${answer.vote}</td>
                        <td>${answer.question.vote}</td>
                        <td>${answer.question.title}</td>
                        <td>
                            <g:each in="${answer.question.tags}" var="tag">
                                <div class="label label-default">
                                    ${tag.name}
                                </div>
                            </g:each>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>