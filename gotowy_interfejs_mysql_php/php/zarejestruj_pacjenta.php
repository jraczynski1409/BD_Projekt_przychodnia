<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: index.php');
		exit();
	}
	
?>

<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<title>RATMEDIC</title>
    <link rel="stylesheet" href="main.css">
</head>

<body>
    <div id="menu">
        <p style="padding-top:20px;margin-top:0px; margin-bottom: 2px; font-size: 28px;letter-spacing: 8px; text-transform: uppercase;">Ratmedik</p>
        <p style="margin-top: -8px; font-size: 12px; letter-spacing: 6px; text-transform: uppercase;">Śieć przychodni</p>
        <?php
            echo "<p style='margin:auto;margin-top:40px;margin-bottom:20px;display: block; width: 90%;height: 50px; background-color: #383838;color: #ddd; line-height:25px;border-radius:5px;border:1px solid #111;'>".$_SESSION['Imie']." ".$_SESSION['Nazwisko']."<br>PESEL: ".$_SESSION['PESEL']."</p>";
        ?>
        <a class="menu_ods odstep1" href="ioprac.php">Informacje o pracownikach</a>
        <a class="menu_ods odstep1" href="iop.php">Informacje o pacjentach</a>
        <a class="menu_ods odstep1" href="hb.php">Historia badań</a>
        <a class="menu_ods odstep1" href="ll.php">Lista leków</a>
        <a class="menu_ods odstep1" href="wr.php">Wystawione recepty</a>
        <a class="menu_ods odstep3" href="zarejestruj_pacjenta.php">Zarejestruj pacjenta</a>
        <a class="menu_ods odstep1" href="nowy_pracownik.php">Nowy pracownik</a>
        <a class="menu_ods odstep1" href="wystaw_recepte.php">Wystawianie recepty</a>
        <a class="menu_ods odstep1" href="badanie.php">Badanie</a>
        <a class="menu_ods odstep1" href="nowy_lek.php">Nowy lek</a>
        <a class="menu_ods odstep3" style=" color:#be4b4b;" href="logout.php">Wyloguj się!</a>
        
        <footer>
            2ID14B &copy 2022 Raczynski Kaleta Palus <br>
            <a href="https://github.com/jraczynski1409/BD_Projekt_przychodnia" target="_blank">Github - projekt</a>
        </footer>
    </div>
    <div id="con">
        <h1>Zarejestruj pacjenta</h1>
        
        <form class="formularz" id="dodaj_pac" method="post"action="dodaj_pacj.php">
        <h2>Dodaj pacjenta</h2>
        DANE OSOBOWE:<br>
        <input name="d_imie" placeholder="Imię" required><br>
        <input name="d_nazwisko" placeholder="Nazwisko" ><br>
        <input type="radio" name="d_plec" value="M" required>Meżczyzna
      <input type="radio" name="d_plec" value="K">Kobieta <br>
        <input type="date" name="d_data_ur" placeholder="data_ur" required>Data urodzenia<br>
        <input type="text" name="d_pesel" placeholder="PESEL" required><br>
        <input name="d_telefon" placeholder="Telefon" required><br>
        <input name="d_email" placeholder="E-mail"><br>
        <input type ="radio" name="d_ubez" value="T" required>Ubezpieczony/a
        <input type ="radio" name="d_ubez" value="N">Nieubezpieczony/a
        <br><br>ADRES:<br>
        <input name="d_woj" placeholder="Województwo" required><br>
        <input name="d_mia" placeholder="Miasto" required><br>
        <input name="d_kod" placeholder="Kod_pocztowy" required><br>
        <input name="d_ul" placeholder="Ulica" required><br>
        <input name="d_nb" placeholder="Nr budynku" required><br>
        <input name="d_nm" placeholder="Nr mieszkania"><br>
        <br><br>LOGOWANIE:<br>
        <input name="d_log" placeholder="Login" required><br>
        <input type="password" name="d_has" placeholder="Haslo" required><br>    
        
        <input id="input_dodaj" type="submit" name="wyslij" value="Prześlij"><br>

        </form>
    </div>
    
    
</body>
</html>