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
INSERT INTO modelo_Vehiculos (nombre_modelo, anio_fabricacion, tipo_vehiculo, marca, modelo)
VALUES ('Sedan', 2019, 'Automóvil', 'Toyota', 'Corolla'),
       ('SUV', 2020, 'Camioneta', 'Jeep', 'Wrangler'),
       ('Hatchback', 2018, 'Automóvil', 'Honda', 'Civic'),
       ('Pickup', 2021, 'Camioneta', 'Ford', 'F-150');

-- Insert data into estadisticas_sucursal table
INSERT INTO estadisticas_sucursal (id_tiempo,
                                   id_sucursal,
                                   balance_general,
                                   porc_ingresos_egresos,
                                   porc_vehiculos_utilizados,
                                   porc_vehiculos_disponibles,
                                   porc_satisfaccion_cliente,
                                   top_metodo_pago_utilizado,
                                   top_modelo_vehiculo_alquilado,
                                   modelo_veces_alquilado,
                                   modelo_porcentaje_alquilado,
                                   modelo_vehiculo_id_modelo,
                                   metodo_pago_id_metodo,
                                   ingresos,
                                   egresos,
                                   duracion_promedio_alquiler,
                                   total_alquileres)
VALUES (1, 1, 1000.50, 75.0, 80.0, 20.0, 95.0, 'Tarjeta de crédito', 'Sedan', 10, 50.0, 1, 1, 5000.0, 4000.0,
        5.0, 75.0),
       (2, 1, 1500.00, 80.0, 70.0, 30.0, 90.0, 'Transferencia bancaria', 'SUV', 12, 60.0, 2, 2, 6000.0, 5000.0,
        6.0, 80.0),
       (3, 1, 2000.00, 85.0, 60.0, 40.0, 85.0, 'Efectivo', 'Hatchback', 8, 40.0, 3, 3, 7000.0, 6000.0, 7.0,
        90.0),
       (4, 1, 2500.00, 90.0, 50.0, 50.0, 80.0, 'PayPal', 'Pickup', 15, 75.0, 4, 4, 8000.0, 7000.0, 8.0, 100.0);