/* 
Realizar un EndPolnt que permita listar todas las bodegas ordenadas
alfabéticamente
*/
const getAllBodega = (req, res) => {
    req.con.query(
        `SELECT * FROM bodegas ORDER BY nombre ASC`,
        (err, data, fils) => {
            console.log(err);
            console.log(data);
            //console.log(fils);
            res.status(200).json({
                message: "Bodegas obtenidas correctamente",
                data: data
            });
        }
    )
};

/*
Realizar un EndPolnt que permita crear una bodegas.(agregar en los
comentarios de la función los datos de entrada).
*/

const postCreateBodega = (req, res) => {
    req.con.query(
        `INSERT INTO bodegas set ?`,
        req.body,
        (err, data, fils) => {
            console.log(err);
            console.log(data);
            //console.log(fils);
            req.body.id = data.insertId;
            res.status(201).json({
                message: "Bodega creada correctamente",
                data: req.body
            });
        }
    )
};


export {
    getAllBodega,
    postCreateBodega
}