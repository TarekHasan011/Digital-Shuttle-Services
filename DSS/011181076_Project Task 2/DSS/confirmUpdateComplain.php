<?php
session_start();
if(isset($_SESSION['isloggedin']) && $_SESSION['isloggedin']==true)
{
  $c_id = $_POST['c_id'];
  $content = $_POST['content'];
  $category = $_POST['category'];
  $content = trim($content);
  $category = trim($category);

  if(strlen($content) && strlen($category))
  {
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
    $mysqlquery = "update complain set content='$content',date_time=NULL where complain_id=$c_id";
    //echo $mysqlquery;
    try
    {
      $conn->exec($mysqlquery);
    } catch (Exception $e) {
      ?>
      <script>
        location.assign('complain.php')
      </script>
      <?php
    }

    $mysqlquery = "delete from category where complain_id=$c_id";
    try
    {
      $conn->exec($mysqlquery);
    } catch (Exception $e)
    {
      ?>
      <script>
        location.assign('complain.php')
      </script>
      <?php
    }

    $categories = explode(",",$category);
    for($i=0;$i<count($categories);$i++)
    {
      $mysqlquery = "insert into category values ($c_id,'$categories[$i]')";
      try
      {
        $conn->exec($mysqlquery);
      } catch (Exception $e)
      {
        ?>
        <script>
          location.assign('complain.php')
        </script>
        <?php
      }
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
      location.assign('complain.php')
    </script>
    <?php
  }
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
