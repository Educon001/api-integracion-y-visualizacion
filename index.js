const express = require('express');
const { Pool } = require('pg');

const app = express();

const pool = new Pool({
  user: process.env.,
  password: 'your_password',
  host: 'localhost',
  port: 5432,
  database: 'your_database_name',
});

app.get('/sucursal', async (req, res) => {
  try {
    const query = 'SELECT * FROM sucursal';
    const result = await pool.query(query);
    res.json({ sucursal: result.rows[0] });
  } catch (err) {
    console.log(err);
    res.status(500).send('Error retrieving data');
  }
});

app.get('/modelo-vehiculos', async (req, res) => {
  try {
    const query = 'SELECT * FROM modelo_vehiculos';
    const result = await pool.query(query);
    res.json({ modelo_Vehiculos: result.rows });
  } catch (err) {
    console.log(err);
    res.status(500).send('Error retrieving data');
  }
});

app.get('/metodo-pagos', async (req, res) => {
  try {
    const query = 'SELECT * FROM metodo_pagos';
    const result = await pool.query(query);
    res.json({ metodo_Pagos: result.rows });
  } catch (err) {
    console.log(err);
    res.status(500).send('Error retrieving data');
  }
});

app.get('/estadisticas-sucursal', async (req, res) => {
  try {
    const query = 'SELECT * FROM estadisticas_sucursal';
    const result = await pool.query(query);
    res.json({ estadisticas_sucursal: result.rows });
  } catch (err) {
    console.log(err);
    res.status(500).send('Error retrieving data');
  }
});

app.listen(3000, () => {
  console.log('Server running on port 3000');
});