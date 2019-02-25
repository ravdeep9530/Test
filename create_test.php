<?php
include('include/config.php');
if(isset($_POST['save']))
{
  $uid=$_SESSION['user_id'];
  $subject=$_POST['subject'];
  $nm=$_POST['testName'];
  $xc=mysqli_query($conn,"INSERT INTO `test_tbl`(`subject_id`, `quiz_name`, `uploaded_by`)
  VALUES ('$subject','$nm','$uid')");
  $test=mysqli_insert_id($conn);
  header('location:addQuestion.php?testid='.$test);
}
include('include/header.php');
 ?>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Create Test</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
              <div class="col-lg-4">
                <form action="" method="post">
                  <div class="form-group">
                    <label>Subject</label>
                    <select name="subject" required="required" class="form-control">
                    <?php
                        $exc=mysqli_query($conn,"SELECT * FROM subject");
                        while($c=mysqli_fetch_assoc($exc))
                        {
                          ?>
                          <option value="<?=$c['subject_id']?>"><?=$c['subject_name']?></option>
                          <?php
                        }
                     ?>
                   </select>
                  </div>
                  <div class="form-group">
                    <label>Test Name</label>
                    <input type="text" class="form-control" name="testName" />
                  </div>
                  <button type="submit" name="save" class="btn btn-primary form-control">Create Test & Add Question</button>
                </form>
              </div>
              <div class="col-lg-6">
                <table class="table">
                  <tr>
                    <th>
                      test Name
                    </th>
                    <th>
                      Total question
                    </th>
                    <th>
                      Add Question
                    </th>
                  </tr>
                  <?php
                    $uid=$_SESSION['user_id'];
                    $sx=mysqli_query($conn,"SELECT * FROM test_tbl WHERE uploaded_by='$uid'");
                    while($t=mysqli_fetch_assoc($sx))
                    {
                      $test=$t['test_id'];
                      $sc=mysqli_query($conn,"SELECT COUNT(*) as `to` FROM `test_question` WHERE test_id='$test'");
                      $data=mysqli_fetch_assoc($sc);
                      ?>
                      <tr>
                        <th>
                          <?=$t['quiz_name']?>
                        </th>
                        <th>
                          <?=$data['to']?>
                        </th>
                        <th>
                          <a href="addQuestion.php?testid=<?=$test?>">Add Qus</a>
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
