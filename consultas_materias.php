<?php
include 'connection.php';
$idMateria = $_POST['materia'];
//echo $idMateria;

		$selectJoin = "SELECT * FROM estudiante 
			INNER JOIN estudiante_curso ON estudiante.id_estudiante = estudiante_curso.id_estudiante_curso
			INNER JOIN curso ON curso.id_curso = estudiante_curso.id_curso WHERE curso.id_curso=$idMateria";


		$resultQueryJoin = mysqli_query($con,$selectJoin);

		while ($row = mysqli_fetch_array($resultQueryJoin)) {
			echo "  
				<form action='notas.php' method='post'>
					<select name='usuario'>
						<option value='".$row['id_estudiante']."'>".$row['id_estudiante'] ."</option>
					</select>"
					
					." ".
					$row["nombre"]." ".$row["apellido"]
					." ".
				
					"<select name='materia'>
						<option value='".$idMateria."'>".$row['nombre_curso'] ."</option>
					</select>"
					
					." ".
					
					"<input type='submit' value='Ver notas'>
				</form>
			"
			;
 		}
			
 
?>