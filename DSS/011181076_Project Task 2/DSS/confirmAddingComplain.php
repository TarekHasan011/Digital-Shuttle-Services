<?php
session_start();
if(isset($_SESSION['isloggedin']) && $_SESSION['isloggedin']==true)
{
  $uname = $_SESSION['uname'];
  $content = $_POST['content'];
  $category = $_POST['category'];
  $content = trim($content);
  $category = trim($category);

  if(strlen($content) && strlen($category))
  {
      try {
        $conn=new PDO("mysql:host=localhost:3306;dbname=dss","root","");
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      } catch (PDOException $e) {
        ?>
        <script>
          alert('Database Connection Failed')
          location.assign('complain.php')
        </script>
        <?php
      }

      $mysqlquery = "insert into complain values (NULL,'$uname','$content',NULL)";
      //echo $mysqlquery;

      try {
        $conn->exec($mysqlquery);
        $mysqlquery = "insert into notification_user values (null,'$uname','Your complaint has been recorded. We will consider the issue. Sorry for the bad experience',null)";
        $conn->exec($mysqlquery);
      } catch (Exception $e) {
        ?>
        <script>
          location.assign('complain.php')
        </script>
        <?php
      }

      $mysqlquery= "select max(complain_id) as c_id from complain where username='$uname'";

      try {
        $ret = $conn->query($mysqlquery);
      } catch (Exception $e) {
        ?>
        <script>
          location.assign('complain.php')
        </script>
        <?php
      }

      $table = $ret->fetchAll();
      //print_r($table);
      $row = $table[0];
      $complain_id = $row['c_id'];
      //echo $complain_id;

      $categories = explode(",",$category);

      for($i=0;$i<count($categories);$i++)
      {
        $temp = $categories[$i];
        $temp = trim($temp);
        //echo $temp."<br>";
        $mysqlquery = "insert into category values ('$complain_id','$temp')";

        try {
          $conn->exec($mysqlquery);
        } catch (Exception $e) {
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
