const express = require('express');
const {Pool} = require('pg');
const {ssl} = require("pg/lib/defaults");
require('dotenv').config();

const app = express();

const port = process.env.PORT || 3000;
const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: Number(process.env.DB_PORT),
    ssl: true
});

pool.on('error', (err) => {
    console.error('Unexpected error on idle client', err);
    process.exit(-1);
});

app.get('/', (req, res) => {
    res.json('Hello world!');
})

app.get('/fetch_data', async (req, res) => {
    try {
        const query = `
            SELECT *
            FROM sucursal;
            SELECT *
            FROM modelo_Vehiculos;
            SELECT *
            FROM metodo_Pagos;
            SELECT *
            FROM estadisticas_sucursal es
                     join tiempo t on t.id_tiempo = es.id_tiempo;
        `;

        const client = await pool.connect();
        const result = await client.query(query);
        client.release();

        const [sucursal, modelo_Vehiculos, metodo_Pagos, estadisticas_sucursal] = result;

        const formattedEstadisticas = [];

        // Loop through the results of the estadisticas_sucursal query
        for (let row of estadisticas_sucursal.rows) {
            // Create a new object for each row
            const sucursalObj = {};
            const tiempoObj = {};

            // Add the tiempo object to the sucursal object
            sucursalObj['tiempo'] = tiempoObj;

            // Loop through the keys of the row object
            for (let key in row) {
                if (key === 'id_anio' || key === 'id_mes' || key === 'id_dia' || key === 'id_hora') {
                    tiempoObj[key] = row[key];
                } else if (key === 'id_tiempo' || key === 'id_sucursal' || key === 'id' || key === 'fecha_carga') {
                } else {
                    sucursalObj[key] = row[key];
                }
            }

            // Add the formatted row object to the array
            formattedEstadisticas.push(sucursalObj);
        }


        const data = {
            sucursal: sucursal.rows[0],
            modelo_Vehiculos: modelo_Vehiculos.rows,
            metodo_Pagos: metodo_Pagos.rows,
            estadisticas_sucursal: formattedEstadisticas,
        };

        res.json(data);
    } catch
        (err) {
        console.error('Error querying database: ', err);
        res.status(500).json({message: 'Internal server error'});
    }
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});