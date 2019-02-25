<?php
include "include/config.php";
$tid = mysqli_real_escape_string($conn, $_GET['testid']);
$sc=mysqli_query($conn,"SELECT tq_id FROM `test_question` WHERE test_id='$tid'");
$uid=$_SESSION['user_id'];
while($d=mysqli_fetch_assoc($sc))
{
    $qid=$d['tq_id'];

    mysqli_query($conn,"INSERT INTO test_attempt (test_id,qid,answer,status,user_id) VALUES($tid,$qid,'0','1',$uid)");
}
?>

        <script>
            popitup("test.php?t_id=<?=$tid?>");
            function popitup(a)
            {
               window.location.href=a;
            }
        </script>


