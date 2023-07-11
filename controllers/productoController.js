/*Realizar un EndPoint que permita listar todos los productos en orden
descendente por el campo "Total".
• El campo "Total" es la cantidad de unidades que la empresa tiene
de este producto, considerando la unión de todas las bodegas, es
decir que el dato como tal no existe en la base de datos,sino se debe
calcular. Si la Bodega A tiene 1O unidades, la Bodega B tiene 5
unidades y la Bodega C tiene 3 unidades. Total= 18*/

const getAllProductos = (req, res) => {
    req.con.query(
        `SELECT * FROM productos p, inventarios i WHERE p.id = i.id ORDER BY i.cantidad DESC`,
        (err, data, fils) => {
            console.log(err);
            console.log(data);
            //console.log
            res.status(200).json({
                message: "Productos obtenidos correctamente",
                data: data
            });
        }
    )
};

/*
Realizar un EndPoint que permita insertar un productos y a su vez asigne
una cantidad inicial del mismo en la tabla inventarios en una de las bodegas
por default.
*/

const postProducto = (req, res) => {
    req.con.query(
        `INSERT INTO productos set ?`,
        req.body,
        (err, data) => {
            if(err) throw err;
            req.body.id = data.insertId;
            req.con.query(
                `INSERT INTO inventarios set ?`,
                {
                    id_bodega: 12,
                    id_producto: req.body.id,
                    cantidad: 100,
                },
                (err) => {
                    if (err) throw err
                    res.status(200).json({
                        message: "Producto creado correctamente",
                        data: req.body
                    });
                }
            )
        }
    )
}

export {
    getAllProductos,
    postProducto
}