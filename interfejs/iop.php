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
        <h1>Informacje o pacjentach</h1>
        <?php
           require_once "connect.php";
        
            $polaczenie = @new mysqli($host, $db_u, $db_p, $db_n);
        
            $zapytanie = "SELECT * from info_pacjencji";
            
            $result=mysqli_query($polaczenie,$zapytanie);
            
            echo "<table class='tabela'>";
            
             echo "<tr class='naglowek_tabeli'><td>ID</td><td>Imię</td><td>Nazwisko</td><td>Płeć</td><td>PESEL</td><td>Data urodzenia</td><td>Telefon</td><td>E-mail</td><td>Data rejestracji</td><td>Ubez?</td><td>Miasto</td><td>Kod pocztowy</td><td>Ulica</td><td>Nr budynku</td><td>Nr mieszkania</td></tr>";
            
            while($row = mysqli_fetch_row($result))
            {
                echo "<tr><td>".$row[1]."</td>"."<td>".$row[2]."</td>"."<td>".$row[3]."</td>"."<td>".$row[4]."</td>"."<td>".$row[5]."</td>"."<td>".$row[6]."</td>"."<td>".$row[7]."</td>"."<td>".$row[8]."</td>"."<td>".$row[9]."</td>"."<td>".$row[10]."</td>"."<td>".$row[13]."</td>"."<td>".$row[14]."</td>"."<td>".$row[15]."</td>"."<td>".$row[16]."</td>"."<td>".$row[17]."</td>"."</tr>";
            }
            echo "</table>"
        ?>
        </div>
    
    
</body>
</html>