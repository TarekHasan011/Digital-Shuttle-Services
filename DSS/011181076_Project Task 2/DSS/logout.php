<?php
session_start();
if(isset($_SESSION['isloggedin']))
{
  $_SESSION['isloggedin']=false;
  ?>
  <script>
    location.assign('coverpage.php')
  </script>
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
