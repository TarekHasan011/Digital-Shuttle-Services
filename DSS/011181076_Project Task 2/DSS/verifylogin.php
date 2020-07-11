<?php
if(isset($_POST['uname']) && isset($_POST['upass']))
{
  $uname = $_POST['uname'];
  $upass = $_POST['upass'];
  try {
    $conn=new PDO("mysql:host=localhost:3306;dbname=dss","root","");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (PDOException $e) {
    ?>
    <script>
      alert('Database Connection Failed')
      location.assign('coverpage.php')
    </script>
    <?php
  }

  if(strlen($uname)==9)
  {
    $mysqlquery = "select * from user where username='$uname' and password='$upass'";
  }
  else if(strlen($uname)==4)
  {
    $mysqlquery = "select * from admin where admin_id='$uname' and password='$upass'";
  }
  else if(strlen($uname)==7)
  {
    $mysqlquery = "select * from driver where employee_id='$uname' and password='$upass'";
  }
  else
  {
    ?>
    <script>
      alert('Invalid Username')
      location.assign('login.php')
    </script>
    <?php
  }

  //echo $mysqlquery;

  try {
    $ret = $conn->query($mysqlquery);
    if($ret->rowCount()==1)
    {
      session_start();
      $_SESSION['isloggedin'] = true;
      $_SESSION['uname'] = $uname;
      if(strlen($uname)==9)
      {
        ?>
        <script>
          location.assign('userprofile.php')
        </script>
        <?php
      }
      else if(strlen($uname)==4)
      {
        ?>
        <script>
          location.assign('adminprofile.php')
        </script>
        <?php
      }
      else if(strlen($uname)==7)
      {
        ?>
        <script>
          location.assign('driverprofile.php')
        </script>
        <?php
      }
    }
    else
    {
      ?>
      <script>
        alert('Incorrect username or password')
        location.assign('login.php')
      </script>
      <?php
    }
  } catch (Exception $e) {
    ?>
    <script>
      alert('Error in query')
      location.assign('login.php')
    </script>
    <?php
  }
}
else
{
  ?>
  <script>
    location.assign('login.php')
  </script>
  <?php
}

 ?>
