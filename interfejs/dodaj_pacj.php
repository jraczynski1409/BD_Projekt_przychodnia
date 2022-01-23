<?php

require_once "connect.php";

    $polaczenie = @new mysqli($host, $db_u, $db_p, $db_n);
    
    if ($polaczenie->connect_errno!=0)
	{
		echo "Error: ".$polaczenie->connect_errno;
	}
	else
	{
		$d_imie = $_POST['d_imie'];
		$d_nazwisko = $_POST['d_nazwisko'];
		$d_plec = $_POST['d_plec'];
		$d_data_ur = $_POST['d_data_ur'];
		$d_pesel = $_POST['d_pesel'];
		$d_telefon = $_POST['d_telefon'];
		$d_email = $_POST['d_email'];
		$d_ubez = $_POST['d_ubez'];
		$d_woj = $_POST['d_woj'];
		$d_mia = $_POST['d_mia'];
		$d_kod = $_POST['d_kod'];
		$d_ul = $_POST['d_ul'];
		$d_nb = $_POST['d_nb'];
		$d_nm = $_POST['d_nm'];
		$d_log = $_POST['d_log'];
		$d_has = $_POST['d_has'];
        
        
		
        $insert_adresy= "INSERT INTO adresy values (NULL, '$d_ul','$d_nb','$d_nm','$d_mia','$d_kod','$d_woj')";
        
        $insert_osoby="insert into osoby values (NULL,'$d_imie','$d_nazwisko','$d_plec','$d_telefon','$d_email','$d_pesel',$d_data_ur,(SELECT LAST_INSERT_ID()),'$d_log','$d_has')";
        
        
        $insert_pacjenci="INSERT INTO pacjenci values  (NULL,CURRENT_DATE,'$d_ubez',(SELECT LAST_INSERT_ID()))";
        
        
        if((mysqli_query($polaczenie, $insert_adresy))&&(mysqli_query($polaczenie, $insert_osoby))&&(mysqli_query($polaczenie, $insert_pacjenci)))
        {
            
				header('Location: index.php');
                $_SESSION['blad'] = '<span style="color:green; text-align:center;">Dodano pacjenta!</span>';
        }
        else
        {
            
				header('Location: index.php');
                $_SESSION['blad'] = '<span style="color:red; text-align:center;">Nie dodano pacjenta!</span>';
        }
         
        
        
        
          
        
        
		
		$polaczenie->close();
	}
    
?>