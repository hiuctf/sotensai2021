<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./login.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web CTF</title>
</head>
<body>
    <section>
        <h1>下のログインフォームからid adminにログインしてFLAGをゲットしよう！</h1>
      <div class="box">
          <form action="checkuser.php" method="POST">
              <div class="user">
                  <label>login id</label>
                  <input type="text" name="userid" value="admin">
              </div>
              <div class="pass">
                <label>login password</label>
                <input type="text" name="password">
            </div>
            <div class="btn">
                <button type="submit">ログイン</button>
            </div>
          </form>
        </div>  
        </section>
      <p>
          <?php
            if(isset($_SESSION['message'])){
                echo '<h2 class="message"> ' . $_SESSION['message'] . '</h2>';
                unset($_SESSION['message']);
            }      
          ?>
      </p>
</body>
</html>