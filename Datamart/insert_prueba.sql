-- Insert data into sucursal table
INSERT INTO sucursal (nombre, ubicacion, longitud, latitud)
VALUES ('Sucursal equipo 1', 'Punta Cana', 18.55988985899647, -68.36807632751487);

-- Insert data into tiempo table
INSERT INTO tiempo (id_anio, id_mes, id_dia, id_hora)
VALUES (2022, 1, 1, 0),
       (2022, 1, 1, 1),
       (2022, 1, 1, 2),
       (2022, 1, 1, 3);

-- Insert data into metodo_Pagos table
INSERT INTO metodo_Pagos (nombre)
VALUES ('Tarjeta de crédito'),
       ('Transferencia bancaria'),
       ('Efectivo'),
       ('PayPal');

-- Insert data into modelo_Vehiculos table
INSERT INTO modelo_Vehiculos (nombre_modelo, anio_fabricacion, marca)
VALUES ('Sedan', 2019, 'Toyota'),
       ('SUV', 2020, 'Jeep'),
       ('Hatchback', 2018, 'Honda'),
       ('Pickup', 2021, 'Ford');

-- Insert data into estadisticas_sucursal table
INSERT INTO estadisticas_sucursal (id_tiempo,
                                   id_sucursal,
                                   porc_Satisfaccion_Cliente,
                                   id_metodo_pago,
                                   posicion_top_metodo_pago_utilizado,
                                   metodo_pago_veces_utilizado,
                                   porcentaje_utilizacion_metodo_pago,
                                   id_modelo_vehiculo,
                                   posicion_top_modelo_vehiculo_alquiladO,
                                   modelo_veces_alquilado,
                                   modelo_porcentaje_alquilado,
                                   ingresos,
                                   egresos,
                                   porc_ingresos,
                                   porc_egresos,
                                   ganancia_neta,
                                   porc_vehiculos_disponibles,
                                   duracion_promedio_alquiler,
                                   total_alquileres,
                                   porc_vehiculos_utilizados)
VALUES (1, 1, 80.50, 1, 4, 5, 95.0, 1, 3, 10, 50.0, 1000, 800, 20, 80, 200, 75.0, 5, 10, 50),
       (2, 1, 75.00, 2, 2, 8, 90.0, 2, 1, 12, 60.0, 750, 540, 28, 72, 210, 80.0, 12, 11, 60),
       (3, 1, 70.00, 3, 1, 6, 85.0, 3, 2, 8, 40.0, 800, 700, 12.5, 87.5, 100, 90.0, 7, 12, 70),
       (4, 1, 85.00, 4, 3, 5, 80.0, 4, 4, 15, 75.0, 1200, 900, 25, 75, 300, 85.0, 9, 12, 80);