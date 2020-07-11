<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Login</title>
  </head>
  <body>
      <div id="loginbody" align="center">
            <h1>Login</h1>
            <form action="verifylogin.php" method="post">
                <h3>username : <input type="text" id="uname" name="uname" required> <br></h3>
                <h3>password : <input type="password" id="upass" name="upass" required> <br></h3>
                <br>
                <input type="submit" name="submit" value="Login">
            </form>
      </div>
  </body>
</html>
