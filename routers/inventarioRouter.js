import { Router } from "express";
import bdConexion from "../middlewares/bdConexion.js";
import { postInventario } from "../controllers/inventarioController.js";

const router = Router();

router.post("/", bdConexion, postInventario)

export default router;