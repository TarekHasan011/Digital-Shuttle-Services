<?php
session_start();

if(isset($_SESSION['isloggedin']) && $_SESSION['isloggedin']==true)
{
    ?>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <title>new Complain</title>
      </head>
      <body>
        <form action="confirmAddingComplain.php" method="post">
        <textarea id="content" name="content" rows="10" cols="100" placeholder="Write your complain here..." required></textarea>
        <br>
        Tags : <input type="text" id="category" name="category" style="width: 730px" placeholder="Driving,Timing,Poor Service" required>
        <br><br>
        <input type="submit" name="submit" value="Add Complain">
      </form>
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
