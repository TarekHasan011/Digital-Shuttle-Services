<?php
session_start();
if(isset($_SESSION['isloggedin']) && $_SESSION['isloggedin']==true)
{
  //echo $_POST['c_id'];
  $c_id = $_POST['c_id'];

  try
  {
    $conn=new PDO("mysql:host=localhost:3306;dbname=dss","root","");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (PDOException $e)
  {
    ?>
    <script>
      alert('Database Connection Failed')
      location.assign('complain.php')
    </script>
    <?php
  }

  $mysqlquery = "delete from category where complain_id=$c_id";
  //echo $mysqlquery;
  try
  {
    $conn->exec($mysqlquery);
    $mysqlquery = "delete from complain where complain_id=$c_id";
    $conn->exec($mysqlquery);
  } catch (Exception $e)
  {
    ?>
    <script>
      location.assign('complain.php')
    </script>
    <?php
  }
  ?>
  <script>
    location.assign('complain.php')
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
