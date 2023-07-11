import express from 'express';
import dotenv from 'dotenv';
import bodegaRouter from './routers/bodegaRouter.js';
import productoRouter from './routers/productoRouter.js';
import inventarioRouter from './routers/inventarioRouter.js';

dotenv.config();
const app = express();

app.use(express.json());
app.use("/bodegas", bodegaRouter);
app.use("/productos", productoRouter);
app.use("/inventarios", inventarioRouter);

app.listen(3000, () => {
    console.log(`Server is listening on http://localhost:3000`);
    }
);