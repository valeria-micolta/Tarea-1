<?php 
	include_once 'connection.php'; //INCLUYO ARCHIVO DE CONEXIÓN
	$query = "SELECT * FROM curso ORDER BY id_curso ASC";
	$resultQuery = mysqli_query($con,$query);
?>

<!DOCTYPE html>
<html>
	<head>
	<title></title>
	</head>
<BODY>
	<form action="consultas_materias.php" method="post">
	Materia:</br>
	<select name="materia">
		<?php 
		while ($row = mysqli_fetch_array($resultQuery)) {
		echo "<option value='".$row['id_curso']."'>".$row['nombre_curso'] ."</option>"; 
		echo "<p>hola</p>";
		}
		?>

	</select>
		  <input type="submit" value="Enviar">
		  
		</form>
		</BODY>
		</html>