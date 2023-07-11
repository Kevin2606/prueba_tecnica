/*
Realizar un EndPoint que permita insertar registros en la tabla de
inventarios, los parámetros de entrada deben ser
(id_producto,id_bodega,cantidad).
• La tabla no puede repetir la combinación de Bodega I Producto Por lo
tanto será necesario validar si el ingreso que se está realizado ya
existe o es una combinación totalmente nueva.
• Si es una combinación totalmente nueva, se debe hacer un lnsert,
considerando los datos ingresados.
• Si es una combinación existente, entonces se debe hacer un Update
a este registro, considerando la suma de la cantidad existente con la
cantidad nueva.

*/

const postInventario = (req, res) => {
    req.con.query(
        `SELECT * FROM inventarios WHERE id_producto = ? AND id_bodega = ?`,
        [req.body.id_producto, req.body.id_bodega],
        (err, data) => {
            if (err) throw err;
            if (data.length > 0) {
                let cantidad = data[0].cantidad + req.body.cantidad;
                req.con.query(
                    `UPDATE inventarios SET cantidad = ? WHERE id_producto = ? AND id_bodega = ?`,
                    [cantidad, req.body.id_producto, req.body.id_bodega],
                    (err) => {
                        if (err) throw err;
                        res.status(200).json({
                            message: "Inventario actualizado correctamente",
                            data: req.body
                        });
                    }
                )
            } else {
                req.con.query(
                    `INSERT INTO inventarios set ?`,
                    req.body,
                    (err) => {
                        if (err) throw err;
                        res.status(200).json({
                            message: "Inventario creado correctamente",
                            data: req.body
                        });
                    }
                )
            }
        }
    )
}


export {
    postInventario
}
