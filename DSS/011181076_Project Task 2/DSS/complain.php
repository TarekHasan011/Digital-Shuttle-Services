<?php
session_start();

if(isset($_SESSION['isloggedin']) && $_SESSION['isloggedin']==true)
{
  ?>
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="utf-8">
      <title>Complain Box</title>
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
      <div id="complainbody">
        <h3 align="center">
          <a href="userprofile.php">Home</a>
          <a href="addComplain.php">Write new Complain</a>
        </h3>
        <table>
          <thead>
            <tr>
              <th>Complain ID</th>
              <th>Content</th>
              <th>Category</th>
              <th>Last Modified</th>
              <th>Update/Delete</th>
            </tr>
          </thead>
          <tbody>
              <?php
                  $uname = $_SESSION['uname'];

                  try {
                    $conn=new PDO("mysql:host=localhost:3306;dbname=dss","root","");
                    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                  } catch (PDOException $e) {
                    ?>
                    <script>
                      location.assign('userprofile.php')
                    </script>
                    <?php
                  }

                  $mysqlquery = "select complain_id as c_id, content, DATE_FORMAT(date_time,'%D %M, %Y %l:%i %p') as date from complain where username='$uname' order by date_time DESC";
                  //echo $mysqlquery;

                  try {
                      $ret = $conn->query($mysqlquery);
                  } catch (Exception $e) {
                    ?>
                    <script>
                      location.assign('userprofile.php')
                    </script>
                    <?php
                  }

                  $table = $ret->fetchAll();

                  for($i=0;$i<count($table);$i++)
                  {
                    $row=$table[$i];
                    $c_id = $row['c_id'];
                    $mysqlquery = "select category from category where complain_id=$c_id order by category";
                    try
                    {
                      $ret_temp = $conn->query($mysqlquery);
                    } catch (Exception $e)
                    {
                      ?>
                      <script>
                        location.assign('userprofile.php')
                      </script>
                      <?php
                    }
                    $table_temp = $ret_temp->fetchAll();
                    $n = count($table_temp);
                    $row_temp = $table_temp[0];
                  ///  print_r( $row_temp);
                    ?>
                    <tr>
                      <td><?php echo $row['c_id'] ?></td>

                      <td><?php echo $row['content'] ?></td>

                      <td>
                        <?php
                            for($it=0;$it<$n;$it++){
                              if($it==0){
                                ?>
                                  <div style="margin:0;padding:0;background-color:transparent;">
                                    <?php echo $table_temp[$it]['category'] ?>
                                  </div>
                                <?php
                              }
                              else{
                              ?>
                                <div style="margin:0;padding:0;background-color:transparent;border-top:.5px solid blue;">
                                  <?php echo $table_temp[$it]['category'] ?>
                                </div>
                              <?php
                              }
                            }
                        ?>

                      </td>

                      <td><?php echo $row['date'] ?></td>

                      <td>
                      <!---update and delete--->
                      <form action="updateComplain.php" method="post" style="display:inline;">
                        <input type="hidden" name="c_id" value="<?php echo $row['c_id'] ?>">
                        <input type="submit" name="update" value="Update">
                      </form>
                      <form action="deleteComplain.php" method="post" style="display:inline;">
                        <input type="hidden" name="c_id" value="<?php echo $row['c_id'] ?>">
                        <input type="submit" name="delete" value="Delete">
                      </form>
                      </td>
                    </tr>

                    <?php
                  }
               ?>
          </tbody>
        </table>
      </div>
    </body>
  </html>
  <?php
}
else
{
  ?>
  <script>
    location.assign(login.php)
  </script>
  <?php
}
 ?>
