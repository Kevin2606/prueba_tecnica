import { Router } from "express";
import bdConexion from "../middlewares/bdConexion.js";
import { getAllBodega,  postCreateBodega } from "../controllers/bodegaController.js";

const router = Router();

router.get("/", bdConexion, getAllBodega);
router.post("/", bdConexion, postCreateBodega);

export default router;