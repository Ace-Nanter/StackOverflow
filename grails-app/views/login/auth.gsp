<html>
<head>
	<meta name="layout" content="${gspLayout ?: 'main'}"/>
	<title><g:message code='springSecurity.login.title'/></title>

</head>

<body>

<div>
	<div>
		<div class="fheader"><g:message code='springSecurity.login.header'/></div>

		<g:if test='${flash.message}'>
			<div class="login_message">${flash.message}</div>
		</g:if><!--
        <div class="container">
            <div class="row top-margin-50">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Title to replace</h1>
                    <div class="account-wall">
                        <form class="form-signin top-margin-50">
                            <input type="text" class="form-control" placeholder="Email" required autofocus>
                            <input type="password" class="form-control" placeholder="Password" required>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">
                                Sign in</button>
                            <label class="checkbox pull-left">
                                <input type="checkbox" value="remember-me">
                                Remember me
                            </label>
                        </form>
                    </div>
                    <a href="#" class="text-center new-account">Create an account </a>
                </div>
            </div>
        </div>
-->







        <section>
            <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
                        <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
                    </div>

                    <div class="form-group">
                        <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
                        <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
                    </div>

                    <p id="remember_me_holder">
                        <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                        <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
                    </p>

                    <p>
                        <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
                    </p>
                </div>
            </form>
        </section>
	</div>
</div>
<script>
(function() {
	document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
})();

</script>
</body>
</html>
