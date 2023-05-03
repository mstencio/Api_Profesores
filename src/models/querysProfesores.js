export const querys = {

  //C
  crearProfesor:
    "INSERT INTO profesor VALUES (@nombre, @cedula, @telefono, @direccion, @correo);",

      //R - ejemplo simple
  getProfesores:
   "SELECT * FROM profesor",

     //R - Ejemplo con parametro
  getProfesorById: 
  "SELECT * FROM profesor WHERE id_profesor = @id  ",

    //U
actualizarProfesorById:
"UPDATE profesor SET nombre = @nombre, cedula = @cedula, telefono = @telefono, direccion = @direccion, correo = @correo WHERE id_profesor = @id",

  // D
  borrarProfesorById:
   "DELETE profesor where id_profesor = @id",

};