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
    id_tiempo   SERIAL,
    fecha_carga TIMESTAMP DEFAULT now(),
    id_anio     INT,
    id_mes      INT,
    id_dia      INT,
    id_hora     INT,
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
    fecha_carga      TIMESTAMP DEFAULT now(),
    marca            VARCHAR(250),

    CONSTRAINT pk_vehiculo PRIMARY KEY (id_modelo)
);

CREATE TABLE estadisticas_sucursal
(
    id                                     SERIAL,
    id_tiempo                              INT,
    id_sucursal                            INT,
    porc_Satisfaccion_Cliente              FLOAT,
    id_metodo_pago                         INT,
    posicion_top_metodo_pago_utilizado     INT,
    metodo_pago_veces_utilizado            INT,
    porcentaje_utilizacion_metodo_pago     FLOAT,
    id_modelo_vehiculo                     INT,
    posicion_top_modelo_vehiculo_alquilado INT,
    modelo_veces_alquilado                 INT,
    modelo_porcentaje_alquilado            FLOAT,
    ingresos                               FLOAT,
    egresos                                FLOAT,
    porc_ingresos                          FLOAT,
    porc_egresos                           FLOAT,
    ganancia_neta                          FLOAT,
    porc_vehiculos_disponibles             FLOAT,
    duracion_promedio_alquiler             FLOAT,
    total_alquileres                       INT,
    porc_vehiculos_utilizados              FLOAT,


    CONSTRAINT PK_hecho PRIMARY KEY (id),
    CONSTRAINT fk_hecho_vehiculo FOREIGN KEY (id_modelo_vehiculo) references modelo_Vehiculos (id_modelo),
    CONSTRAINT fk_hecho_metodo_pago FOREIGN KEY (id_metodo_pago) references metodo_Pagos (id_metodo),
    CONSTRAINT fk_hecho_tiempo FOREIGN KEY (id_tiempo) references tiempo (id_tiempo),
    CONSTRAINT fk_hecho_sucursal FOREIGN KEY (id_sucursal) references sucursal (id_sucursal)
);