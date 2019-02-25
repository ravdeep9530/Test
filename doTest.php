<?php
include('include/config.php');
include('include/header.php');
 ?>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Select Test</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                  <table class="table">
                    <tr>
                      <th>
                        test Name
                      </th>
                      <th>
                        Total question
                      </th>
                      <th>

                      </th>
                    </tr>
                    <?php
                     
                      $sx=mysqli_query($conn,"SELECT * FROM test_tbl");
                      while($t=mysqli_fetch_assoc($sx))
                      {
                        $test=$t['test_id'];
                        $sc=mysqli_query($conn,"SELECT COUNT(*) as `to` FROM `test_question` WHERE test_id='$test'");
                        $data=mysqli_fetch_assoc($sc);
                          $_SESSION['tname']=$t['quiz_name'];
                        ?>
                        <tr>
                          <th>
                            <?=$t['quiz_name']?>
                          </th>
                          <th>
                            <?=$data['to']?>
                          </th>
                          <th>
                            <a href="start_test.php?testid=<?=$test?>">Start Test</a>
                          </th>
                        </tr>
                        <?php
                      }
                     ?>
                  </table>
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
<?php
include('include/footer.php');
?>
