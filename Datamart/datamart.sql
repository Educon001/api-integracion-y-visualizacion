CREATE DATABASE datamart_equipo1;

\connect datamart_equipo1

CREATE TABLE sucursal
(
    id_sucursal SERIAL,
    nombre      VARCHAR(200),
    fecha_carga TIMESTAMP DEFAULT now(),
    ubicacion   VARCHAR(350),
    longitud    NUMERIC,
    latitud     NUMERIC,
    CONSTRAINT pk_sucursal PRIMARY KEY (id_sucursal)
);

CREATE TABLE tiempo
(
    id_tiempo SERIAL,
    fecha_carga TIMESTAMP DEFAULT now(),
    id_anio   INT,
    id_mes    INT,
    id_dia    INT,
    id_hora   INT,
    CONSTRAINT pk_tiempo PRIMARY KEY (id_tiempo)
);

CREATE TABLE metodo_Pagos
(
    id_metodo   SERIAL,
    nombre      VARCHAR(200),
    fecha_carga TIMESTAMP DEFAULT now(),
    CONSTRAINT pk_metodo_pago PRIMARY KEY (id_metodo)
);

CREATE TABLE modelo_Vehiculos
(
    id_modelo        SERIAL,
    nombre_modelo    VARCHAR(250),
    anio_fabricacion INT,
    tipo_vehiculo    VARCHAR(250),
    fecha_carga      TIMESTAMP DEFAULT now(),
    marca            VARCHAR(250),
    modelo           VARCHAR(250),

    CONSTRAINT pk_vehiculo PRIMARY KEY (id_modelo)
);

CREATE TABLE estadisticas_sucursal
(
    id                            SERIAL,
    id_tiempo                     INT,
    id_sucursal                   INT,
    balance_general               FLOAT,
    porc_ingresos_egresos         FLOAT,
    porc_vehiculos_utilizados     FLOAT,
    porc_vehiculos_disponibles    FLOAT,
    porc_satisfaccion_cliente     FLOAT,
    top_metodo_pago_utilizado     VARCHAR(250),
    top_modelo_vehiculo_alquilado VARCHAR(250),
    modelo_veces_alquilado        INT,
    modelo_porcentaje_alquilado   FLOAT,
    modelo_vehiculo_id_modelo     INT,
    metodo_pago_id_metodo         INT,
    ingresos                      FLOAT,
    egresos                       FLOAT,
    duracion_promedio_alquiler    FLOAT,
    total_alquileres              FLOAT,


    CONSTRAINT PK_hecho PRIMARY KEY (id),
    CONSTRAINT fk_hecho_vehiculo FOREIGN KEY (modelo_vehiculo_id_modelo) references modelo_Vehiculos (id_modelo),
    CONSTRAINT fk_hecho_metodo_pago FOREIGN KEY (metodo_pago_id_metodo) references metodo_Pagos (id_metodo),
    CONSTRAINT fk_hecho_tiempo FOREIGN KEY (id_tiempo) references tiempo (id_tiempo),
    CONSTRAINT fk_hecho_sucursal FOREIGN KEY (id_sucursal) references sucursal (id_sucursal)
);