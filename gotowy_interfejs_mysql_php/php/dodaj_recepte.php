<?php

require_once "connect.php";

    $polaczenie = @new mysqli($host, $db_u, $db_p, $db_n);
    
    if ($polaczenie->connect_errno!=0)
	{
		echo "Error: ".$polaczenie->connect_errno;
	}
	else
	{
		$d_nazwa = $_POST['d_nazwa'];
		$d_cena = $_POST['d_cena'];
        
        
		
        $insert_leki= "INSERT INTO recepty values (NULL, '$d_nazwa',$d_cena)";
        
        
        if(mysqli_query($polaczenie, $insert_leki))
        {
            
				header('Location: index.php');
                $_SESSION['blad'] = '<span style="color:green; text-align:center;">Dodano pacjenta!</span>';
        }
        else
        {
            
				header('Location: dodaj_prac.php');
                $_SESSION['blad'] = '<span style="color:red; text-align:center;">Nie dodano pacjenta!</span>';
        }
         
		$polaczenie->close();
	}
    
?>