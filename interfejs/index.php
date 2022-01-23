<?php

	session_start();
	
	if ((isset($_SESSION['zalogowany'])) && ($_SESSION['zalogowany']==true))
	{
		header('Location: main.php');
		exit();
	}

?>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="main.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900&display=swap" rel="stylesheet">
    </head>
    <body>
        <header>
            <form id="logowanie" action="login.php" method="post">
                <p style="margin-bottom: 2px; font-size: 28px;letter-spacing: 8px; text-transform: uppercase;">Ratmedik</p>
                <p style="margin-top: -8px; font-size: 12px; letter-spacing: 6px; text-transform: uppercase;">Śieć przychodni</p><br>
                <input class="log" type="text" name="login" id="login" placeholder="Login">
                <input class="log" type="password" name="password" id="password" placeholder="Hasło">
                <input class="submit" type="submit" name="submit" value="Zaloguj się">
                <a href="rejestracja_pacjenta.php" class="ods" style="margin-top: 100px; display: block">Zarejestruj się</a>
            </form>
            
        </header>
        
        <?php
	       if(isset($_SESSION['blad'])) echo $_SESSION['blad'];
        ?>    
        
    </body>
</html>