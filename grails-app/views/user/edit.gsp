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
	<div class="row">
		<div class="col-md-10">
			<g:isOwner owner="${user}">
				<input name="${usernameParameter ?: 'username'}" type="text" id="username" pattern="^[\w]{3,16}$" autofocus="autofocus"
					   class="input pass" placeholder="${message(code: 'login.field.username', default: 'Enter your username')}"/>
			</g:isOwner>
			<g:isNotOwner>
				<h1><g:message code="user.profile.title" args="${user.username}" default="${user.username}'s profile"/></h1>
			</g:isNotOwner>
			<br/>
			${user.username}

		</div>
	</div>
	<div id="logbox" class="top-margin-50">
		<form action="${postUrl ?: '/user/save'}" method="POST" name="saveForm" id="saveForm" autocomplete="off">
			<h1><g:message code='register.title.label' default="Create a new account"/></h1>




			<input name="${emailParameter ?: 'email'}" type="email" id="email"
				   class="input pass" placeholder="${message(code: 'login.field.email', default: 'Enter your email')}"/>

			<input name="${passwordParameter ?: 'password'}" type="password" required="required" id="password"
				   placeholder="${message(code: 'login.field.password', default: 'Enter your username')}" class="input pass"/>

			<input type="submit" id="submit" value="${message(code: 'register.input.submit', default: 'Create an account')}" class="inputButton"/>
			<g:hiddenField name="ROLE_USER" value="on"/>

			<div class="text-center">
				<g:link controller="user" action="create">
					<g:message code="register.link.login" default="Register a new account"/>
				</g:link>
			</div>
		</form>
	</div>
</div>
</body>
</html>