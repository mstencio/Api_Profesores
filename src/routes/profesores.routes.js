import { Router } from "express";
import {
  crearProfesor,
  getProfesores,
  getProfesorById,
  actualizarProfesorById,
  borrarProfesorById,
  defaultProfesor
} from "../controllers/profesores.controller.js";

const router = Router();

//CRUD para la tabla profesor

//C
router.post("/profesores/crearProfesor", crearProfesor);

//R - ejemplo simple
router.get("/profesores/getProfesores", getProfesores);

//R - ejemplo con parametro
router.get("/profesores/getProfesorById/:id", getProfesorById);

//U
router.put("/profesores/actualizarProfesorById/:id", actualizarProfesorById);

//D
router.delete("/profesores/borrarProfesorById/:id", borrarProfesorById);


//Ruta en caso de digitar una erronea
router.get("/Profesor/*", defaultProfesor);

export default router;
