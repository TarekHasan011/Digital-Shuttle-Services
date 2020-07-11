<?php
session_start();

if(isset($_SESSION['isloggedin']) && $_SESSION['isloggedin']==true)
{
  $c_id = $_POST['c_id'];
  $content="";
  $tags="";
  try
  {
    $conn=new PDO("mysql:host=localhost:3306;dbname=dss","root","");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (PDOException $e)
  {
    ?>
    <script>
      location.assign('complain.php')
    </script>
    <?php
  }

  $mysqlquery = "select content from complain where complain_id=$c_id";
  try
  {
    $ret = $conn->query($mysqlquery);
    $table = $ret->fetchAll();
    $row = $table[0];
    $content = $row['content'];
    //echo $content."<br>";

    $mysqlquery = "select category from category where complain_id=$c_id";
    $ret = $conn->query($mysqlquery);
    $table = $ret->fetchAll();

    $tags="";
    for($i=0;$i<count($table);$i++)
    {
      $row = $table[$i];
      $tags.=$row['category'];
      if($i+1!=count($table))
      {
        $tags.=",";
      }
    }
    //echo $tags;
  } catch (Exception $e)
  {
    ?>
    <script>
      location.assign('complain.php')
    </script>
    <?php
  }
  ?>
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="utf-8">
      <title></title>
    </head>
    <body>
      <form action="confirmUpdateComplain.php" method="post">
        Complain ID : <input type="text" name="c_id" value="<?php echo $c_id ?>" readonly>
        <br><br>
        <textarea id="content" name="content" rows="10" cols="100" placeholder="Write your complain here..." required><?php echo $content ?></textarea>
        <br>
        Tags : <input type="text" id="category" name="category" style="width: 730px" value="<?php echo $tags ?>"placeholder="Driving,Timing,Poor Service" required>
        <br><br>
        <input type="submit" name="submit" value="Update">
        <button type="submit" name="back"><a href="complain.php">Cancel</a></button>
      </form>

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
