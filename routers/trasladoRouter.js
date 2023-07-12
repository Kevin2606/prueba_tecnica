import { Router } from "express";
import bdConexion from "../middlewares/bdConexion.js";
import { trasladoController } from "../controllers/trasladoController.js";

const router = Router();

router.post("/", bdConexion, trasladoController);

export default router;