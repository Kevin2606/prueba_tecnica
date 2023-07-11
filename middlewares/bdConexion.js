import mysql from "mysql2";

const dbConexion = (req, res, next) => {
    try{
        req.con = mysql.createPool({
            host: "localhost",
            user: "campus",
            password: "campus2023",
            database: "prueba_tecnica_db",
            port: 3306
        });
        next();
    }
    catch(error){
        console.log(errojsonr);
        res.status(500).json({
            message: "Error en la conexión a la base de datos"
        });
    }
};

export default dbConexion;