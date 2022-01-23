<?php

require_once "connect.php";

    $polaczenie = @new mysqli($host, $db_u, $db_p, $db_n);
    
    if ($polaczenie->connect_errno!=0)
	{
		echo "Error: ".$polaczenie->connect_errno;
	}
	else
	{
		$d_koszt = $_POST['d_koszt'];
		$d_opis = $_POST['d_opis'];
		$d_ip = $_POST['d_ip'];
		$d_iw = $_POST['d_iw'];
        
        
		
        $insert_badania= "INSERT INTO badania values (NULL, '$d_koszt','$d_opis', '$d_ip', '$d_iw', NULL)";
        
        
        if(mysqli_query($polaczenie, $insert_badania))
        {
            
				header('Location: index.php');
                $_SESSION['blad'] = '<span style="color:green; text-align:center;">Dodano pacjenta!</span>';
        }
        else
        {
            
				header('Location: badanie.php');
                $_SESSION['blad'] = '<span style="color:red; text-align:center;">Nie dodano pacjenta!</span>';
        }
         
		$polaczenie->close();
	}
    
?>