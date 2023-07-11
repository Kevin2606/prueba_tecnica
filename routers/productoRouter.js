import { Router } from "express";
import bdConexion from "../middlewares/bdConexion.js";
import { getAllProductos, postProducto } from "../controllers/productoController.js";

const router = Router();

router.get("/", bdConexion, getAllProductos);
router.post("/", bdConexion, postProducto);

export default router;