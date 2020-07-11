<?php
session_start();
if(isset($_SESSION['isloggedin']) && $_SESSION['isloggedin']==true)
{
    //echo " Welcome ".$_SESSION['uname'];
    ?>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <title>Profile</title>
      </head>
      <body>
          <div id='profile_option' align="right">
              <h2><a href="#">Payment</a>
              <a href="notification.php">Notification</a>
              <a href="#">Shuttle Service</a>
              <a href="#">Regular Bus Service</a>
              <a href="complain.php">Complain Box</a>
              <a href="#">Change password</a>
              <a href="logout.php">Logout</a></h2>
          </div>
      </body>
    </html>
    <?php
}
else
{
  ?>
  <script>
    location.assign('coverpage.php')
  </script>
  <?php
}

 ?>
