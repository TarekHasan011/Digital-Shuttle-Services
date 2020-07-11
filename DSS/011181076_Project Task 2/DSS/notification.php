<?php
session_start();

if(isset($_SESSION['isloggedin']) && $_SESSION['isloggedin']==true)
{
  $uname = $_SESSION['uname'];
  try
  {
    $conn=new PDO("mysql:host=localhost:3306;dbname=dss","root","");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (PDOException $e)
  {
    ?>
    <script>
      alert('Database Connection Failed')
      location.assign('userprofile.php')
    </script>
    <?php
  }
  $mysqlquery = "select content,DATE_FORMAT(date_time,'%D %M, %Y %l:%i %p') as date from notification_user where username='$uname' order by date DESC";

  ///echo $mysqlquery;
  try
  {
    $ret = $conn->query($mysqlquery);
  } catch (Exception $e)
  {
    ?>
    <script>
      alert('Database Connection Failed')
      location.assign('userprofile.php')
    </script>
    <?php
  }
  $table = $ret->fetchAll();
  //print_r($table);
  ?>
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="utf-8">
      <title>Notification</title>
      <style>
        table{
          width: 100%;
        }
        table,td,th{
          border: 1px solid blue;
          border-collapse: collapse;
          text-align: center;
        }
        tr:hover{
            background-color: #6699ff;
        }
      </style>
    </head>
    <body>
      <table>
        <thead>
          <tr>
            <th>Content</th>
            <th>Date/Time</th>
          </tr>
        </thead>

        <tbody>
          <?php
              for($i=0;$i<count($table);$i++)
              {
                $row = $table[$i];
                ?>
                <tr>
                  <td><?php echo $row['content'] ?></td>
                  <td><?php echo $row['date'] ?></td>
                </tr>
                <?php
              }
           ?>
        </tbody>
      </table>
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
