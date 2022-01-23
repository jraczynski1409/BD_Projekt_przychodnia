<?php
    session_start();
    
    if ((!isset($_POST['login'])) || (!isset($_POST['password'])))
	{
		header('Location: index.php');
		exit();
	}

    require_once "connect.php";

    $polaczenie = @new mysqli($host, $db_u, $db_p, $db_n);
    
    if ($polaczenie->connect_errno!=0)
	{
		echo "Error: ".$polaczenie->connect_errno;
	}
	else
	{
		$login = $_POST['login'];
		$haslo = $_POST['password'];
        
        $login = htmlentities($login, ENT_QUOTES, "UTF-8");
		$haslo = htmlentities($haslo, ENT_QUOTES, "UTF-8");
        
		if ($rezultat = @$polaczenie->query(
		sprintf("SELECT * FROM osoby WHERE Login='%s' AND Haslo='%s'",
		mysqli_real_escape_string($polaczenie,$login),
		mysqli_real_escape_string($polaczenie,$haslo))))
		{
			$ilu_userow = $rezultat->num_rows;
			if($ilu_userow>0)
			{
				$_SESSION['zalogowany'] = true;
				
				$wiersz = $rezultat->fetch_assoc();
				$_SESSION['ID_osoby'] = $wiersz['ID_osoby'];
				$_SESSION['Imie'] = $wiersz['Imie'];
				$_SESSION['Nazwisko'] = $wiersz['Nazwisko'];
				$_SESSION['Plec'] = $wiersz['Plec'];
				$_SESSION['Nr_telefonu'] = $wiersz['Nr_telefonu'];
				$_SESSION['Email'] = $wiersz['Email'];
				$_SESSION['PESEL'] = $wiersz['PESEL'];
				$_SESSION['Data_urodzenia'] = $wiersz['Data_urodzenia'];
				$_SESSION['ID_adresu'] = $wiersz['ID_adresu'];
				
				unset($_SESSION['blad']);
				$rezultat->free_result();
                
				header('Location: main.php');
				
			} 
            else 
            {
				$_SESSION['blad'] = '<span style="color:red; text-align:center;">Nieprawidłowy login lub hasło!</span>';
				header('Location: index.php');
			}
			
		}
		
		$polaczenie->close();
	}
    
?>