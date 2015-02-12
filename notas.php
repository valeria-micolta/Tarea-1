<?php 
	include_once 'connection.php'; //INCLUYO ARCHIVO DE CONEXIÓN
	
	//======== CONSULTAR ========= //
	$idMateria = $_POST['materia'];
	$id_estudiante= $_POST ['usuario'];

	$selectJoin = "SELECT * FROM estudiante 
			INNER JOIN estudiante_notas ON estudiante.id_estudiante = estudiante_notas.id_estudiante
			INNER JOIN notas ON notas.id_notas = estudiante_notas.id_notas
			INNER JOIN curso ON curso.id_curso = estudiante_notas.id_curso WHERE curso.id_curso=$idMateria AND estudiante.id_estudiante=$id_estudiante";

	$resultQuery = mysqli_query($con,$selectJoin);
?>


	<table border="1">
	 <tr>
	   <td>Nombre Nota</td>
	   <td>Nota</td> 
	   <td>Porcentaje nota</td>
	   <td>Total</td>
	 </tr>

	<?php
		$varAumento=0;
		$nombre;
		while ($row = mysqli_fetch_array($resultQuery)) {
			$nombre=$row['nombre']." ".$row['apellido'];
			$nombre_curso=$row['nombre_curso'];
				echo "
				  <tr>
				    <td>".$row['nombre_curso']."</td>
				    <td>".$row['float']."</td> 
				    <td>".$row['porcentaje_nota']."</td>
				    <td>".$row['float'] * $row['porcentaje_nota']."</td>
				  </tr>
				";
			$varAumento++;
			$arrayNota[$varAumento]=$row['float'] * $row['porcentaje_nota'];
		}
	?>
</table>

<?php 
	echo $nombre_curso.":";
	echo$arrayNota[1]+$arrayNota[2];
	echo "</br>";
	echo  $nombre;
?>