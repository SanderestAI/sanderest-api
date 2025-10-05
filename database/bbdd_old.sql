-- Volcando estructura para tabla tpv_e_1es.balanzas DONE
CREATE TABLE IF NOT EXISTS `balanzas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_terminal` int(11) DEFAULT NULL,
  `peso` double(15,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.bancos_cajas DONE
CREATE TABLE IF NOT EXISTS `bancos_cajas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci DEFAULT NULL,
  `entidad` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `agencia` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dc` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cuenta` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `iban` varchar(24) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.caja_cierre DONE
CREATE TABLE IF NOT EXISTS `caja_cierre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `hora_desde` time DEFAULT NULL,
  `hora_hasta` time DEFAULT NULL,
  `id_terminal` int(11) DEFAULT NULL,
  `inicio_caja` double(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.caja_cierre_metodo DONE
CREATE TABLE IF NOT EXISTS `caja_cierre_metodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_caja_cierre` int(11) DEFAULT NULL,
  `id_metodo_pago` int(11) DEFAULT NULL,
  `importe_real` double(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.caja_entradas DONE
CREATE TABLE IF NOT EXISTS `caja_entradas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_terminal` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `importe` double(15,2) DEFAULT NULL,
  `motivo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_cierre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.caja_motivos_entradas DONE
CREATE TABLE IF NOT EXISTS `caja_motivos_entradas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.caja_motivos_salidas DONE
CREATE TABLE IF NOT EXISTS `caja_motivos_salidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.caja_salidas DONE
CREATE TABLE IF NOT EXISTS `caja_salidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_terminal` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `importe` double(15,2) DEFAULT NULL,
  `motivo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_cierre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.categorias DONE
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_idioma` int(11) unsigned NOT NULL DEFAULT '0',
  `descripcion` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_url` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `titulo_meta` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion_meta` varchar(160) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `updated` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `alt` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tittle` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_grupo` int(11) NOT NULL DEFAULT '0',
  `texto_inicio` text COLLATE utf8_spanish_ci,
  `de` int(11) DEFAULT '0',
  `activa` tinyint(4) DEFAULT '0',
  `consumo_interno` tinyint(1) NOT NULL DEFAULT '0',
  `marcar_productos_como_terminados` tinyint(1) NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `inicio` tinyint(1) NOT NULL DEFAULT '0',
  `orden_inicio` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `mostrar_buscador` tinyint(1) NOT NULL DEFAULT '0',
  `mostrar_web` tinyint(1) NOT NULL DEFAULT '1',
  `novedad` tinyint(1) NOT NULL DEFAULT '0',
  `id_grupo_clientes` int(11) DEFAULT NULL,
  `link` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `link_externo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `texto_titulo` text COLLATE utf8_spanish_ci,
  `color_fondo` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '#156772',
  `color_letra` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '#ffffff',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.categorias_elaborados DONE
CREATE TABLE IF NOT EXISTS `categorias_elaborados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.categorias_terminales DONE
CREATE TABLE IF NOT EXISTS `categorias_terminales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL DEFAULT '0',
  `id_terminal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_categoria` (`id_categoria`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.comedores DONE
CREATE TABLE IF NOT EXISTS `comedores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `tipo` tinyint(4) DEFAULT '0',
  `orden` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.configuracion DONE
CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_librador` int(11) NOT NULL DEFAULT '0',
  `id_librador_tak` int(11) NOT NULL DEFAULT '0',
  `servicio_domicilio` tinyint(1) NOT NULL DEFAULT '0',
  `pvp_iva_incluido` tinyint(1) NOT NULL DEFAULT '0',
  `cerrar_documento_flujo` varchar(25) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `segundos_cierre_documento` int(11) NOT NULL DEFAULT '0',
  `mostrar_precios_tpv` tinyint(1) NOT NULL DEFAULT '1',
  `mostrar_mas_vendidos` tinyint(1) NOT NULL DEFAULT '1',
  `modo_camarero` tinyint(1) NOT NULL DEFAULT '0',
  `proteger_edicion` tinyint(1) NOT NULL DEFAULT '0',
  `categorias_por_terminal` tinyint(1) NOT NULL DEFAULT '0',
  `color_letra_botones` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '#ffffff',
  `color_fondo_botones` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '#156772',
  `tipo_menu_superior` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Norma\r\n1 - scroll',
  `filas_menu` tinyint(1) NOT NULL DEFAULT '2',
  `decimales_cantidades` tinyint(1) NOT NULL DEFAULT '2',
  `decimales_importes` tinyint(1) NOT NULL DEFAULT '3',
  `tickets_automaticos` tinyint(1) NOT NULL DEFAULT '0',
  `tickets_automaticos_terminal` int(11) DEFAULT NULL,
  `abrir_cajon_monedas` tinyint(1) NOT NULL DEFAULT '0',
  `boton_cajon_monedas` tinyint(1) NOT NULL DEFAULT '0',
  `sonido_cocina` varchar(25) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `sonido_tpv` varchar(25) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `orden_cocina` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'ASC',
  `orden_cocina_modificaciones` varchar(25) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'no_reordenar',
  `cocina_ocultar_en_entrega` tinyint(1) NOT NULL DEFAULT '0',
  `agrupar_productos_tpv_cocina` tinyint(1) NOT NULL DEFAULT '0',
  `marcar_terminal_login` tinyint(1) NOT NULL DEFAULT '0',
  `mostrar_logo_ticket` tinyint(1) NOT NULL DEFAULT '1',
  `numerar_tras_imprimir` tinyint(1) NOT NULL DEFAULT '0',
  `cambio_usuario_tpv` tinyint(1) NOT NULL DEFAULT '0',
  `obrir_ultim_ticket_identificar` tinyint(1) NOT NULL DEFAULT '0',
  `email_asunto_tiq` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_cuerpo_tiq` text COLLATE utf8_spanish_ci,
  `email_asunto_fac` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_cuerpo_fac` text COLLATE utf8_spanish_ci,
  `email_asunto_alb` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_cuerpo_alb` text COLLATE utf8_spanish_ci,
  `email_asunto_ped` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_cuerpo_ped` text COLLATE utf8_spanish_ci,
  `email_asunto_pre` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_cuerpo_pre` text COLLATE utf8_spanish_ci,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.datos_configuracion_inicial DONE
CREATE TABLE IF NOT EXISTS `datos_configuracion_inicial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `step1` tinyint(4) NOT NULL DEFAULT '0',
  `step2` tinyint(4) NOT NULL DEFAULT '0',
  `step3` tinyint(4) NOT NULL DEFAULT '0',
  `step4` tinyint(4) NOT NULL DEFAULT '0',
  `plan` tinyint(4) NOT NULL DEFAULT '0',
  `porcentaje_carta` int(4) DEFAULT '0',
  `porcentaje_usuarios` int(4) DEFAULT '0',
  `porcentaje_datos_facturacion` int(4) DEFAULT '0',
  `porcentaje_datos_personales` int(4) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.datos_empresa DONE
CREATE TABLE IF NOT EXISTS `datos_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_fiscal` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_comercial` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `nif` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_postal` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `poblacion` varchar(75) COLLATE utf8_spanish_ci NOT NULL,
  `provincia` varchar(75) COLLATE utf8_spanish_ci NOT NULL,
  `tel1` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tel2` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `movil` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `fax` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tarifas` tinyint(4) NOT NULL DEFAULT '1',
  `iva_incluido` tinyint(4) NOT NULL DEFAULT '0',
  `software_sanderest` tinyint(4) DEFAULT NULL,
  `plan_sanderest` tinyint(4) DEFAULT NULL,
  `iban` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `teminales_adicionales` int(4) DEFAULT '0',
  `mostrar_sin_productos` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_inicio_plan` datetime DEFAULT NULL,
  `logo` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `updated` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.descuentos NOT IMPORTED
CREATE TABLE IF NOT EXISTS `descuentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `desde` double(15,2) NOT NULL DEFAULT '0.00',
  `hasta` double(15,2) NOT NULL DEFAULT '0.00',
  `descuento` double(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_1 DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sesion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `so` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `procedencia` varchar(3) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'tpv',
  `tipo_librador` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_librador` int(11) DEFAULT NULL,
  `fecha_documento` date DEFAULT NULL,
  `fecha_entrada` date DEFAULT NULL,
  `fecha_entrega_desde` date DEFAULT NULL,
  `fecha_entrega_hasta` date DEFAULT NULL,
  `numero_registro` int(11) DEFAULT NULL,
  `numero_documento` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `serie_documento` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modalidad_pago` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modalidad_envio` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modalidad_entrega` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `irpf` double(7,2) DEFAULT NULL,
  `importe_irpf` double(15,5) DEFAULT NULL,
  `descuento_pp` double(7,2) DEFAULT NULL,
  `importe_descuento_pp` double(15,5) DEFAULT NULL,
  `descuento_librador` double(7,2) DEFAULT NULL,
  `importe_descuento_librador` double(15,5) DEFAULT NULL,
  `base` double(15,5) DEFAULT NULL,
  `total` double(15,5) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  `bloqueado` tinyint(4) DEFAULT NULL,
  `entregado` tinyint(1) NOT NULL DEFAULT '0',
  `id_usuario` int(10) DEFAULT NULL,
  `comensales` smallint(5) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `hora_entrega` time NOT NULL DEFAULT '00:00:00',
  `id_terminal` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_2 DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) NOT NULL,
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `tipo_librador` varchar(3) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `id_librador` int(11) NOT NULL DEFAULT '0',
  `slug` varchar(250) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `tipo_producto` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` date NOT NULL,
  `fecha_entrega_desde` date NOT NULL,
  `fecha_entrega_hasta` date NOT NULL,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) NOT NULL DEFAULT '0',
  `id_packs` int(11) NOT NULL DEFAULT '0',
  `id_productos_relacionados_grupos` int(11) NOT NULL,
  `descripcion_productos_relacionados_grupos` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `imagen_producto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_producto` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `detalles_producto` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_oferta` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_barras_producto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `referencia_producto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `referencia_librador` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `numero_serie` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `lote` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `caducidad` date NOT NULL,
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `id_unidades` int(11) NOT NULL DEFAULT '0',
  `unidad` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `coste` double(15,5) NOT NULL,
  `importe` double(15,5) NOT NULL DEFAULT '0.00000',
  `fijo` tinyint(1) NOT NULL DEFAULT '0',
  `base_antes_descuento` double(15,5) NOT NULL DEFAULT '0.00000',
  `descuento_base` double(7,2) NOT NULL DEFAULT '0.00',
  `importe_descuento_base` double(15,5) NOT NULL DEFAULT '0.00000',
  `base_despues_descuento` double(15,5) NOT NULL DEFAULT '0.00000',
  `iva` double(7,2) NOT NULL DEFAULT '0.00',
  `importe_iva` double(15,5) NOT NULL DEFAULT '0.00000',
  `recargo` double(7,2) NOT NULL DEFAULT '0.00',
  `importe_recargo` double(15,5) NOT NULL DEFAULT '0.00000',
  `pvp_unidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `pvp_unidad_sin_incrementos` double(15,5) NOT NULL DEFAULT '0.00000',
  `total_antes_descuento` double(15,5) NOT NULL DEFAULT '0.00000',
  `descuento_total` double(7,2) NOT NULL DEFAULT '0.00',
  `importe_descuento_total` double(15,5) NOT NULL DEFAULT '0.00000',
  `total_despues_descuento` double(15,5) NOT NULL DEFAULT '0.00000',
  `id_documento_2_anterior` int(11) NOT NULL DEFAULT '0',
  `id_vendedor` int(11) NOT NULL DEFAULT '0',
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  `id_usuario` int(10) NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `hora` time NOT NULL,
  `id_terminal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_documento` (`id_documentos_1`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_2_modificaciones DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_2_modificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) DEFAULT NULL,
  `id_documentos_2` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `accion` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `cantidad_anterior` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_actual` double(15,5) NOT NULL DEFAULT '0.00000',
  `pvp_unidad_sin_incrementos_anterior` double(15,5) NOT NULL DEFAULT '0.00000',
  `pvp_unidad_sin_incrementos_actual` double(15,5) NOT NULL DEFAULT '0.00000',
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_fiskaly DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_fiskaly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) DEFAULT NULL,
  `fiskaly_invoice_id` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `invoice_compilance` text COLLATE utf8_spanish_ci,
  `status` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `transmission_registration` text COLLATE utf8_spanish_ci,
  `validations` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_iva DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_iva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) DEFAULT NULL,
  `id_documentos_2` int(11) DEFAULT NULL,
  `base` double(15,5) DEFAULT NULL,
  `iva` double(7,2) DEFAULT NULL,
  `importe_iva` double(15,5) DEFAULT NULL,
  `recargo` double(7,2) DEFAULT NULL,
  `importe_recargo` double(15,5) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_libradores DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_libradores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) DEFAULT NULL,
  `codigo_librador` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_1` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_2` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_social` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_comercial` varchar(75) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `nif` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `direccion` varchar(90) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `numero` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `escalera` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `piso` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `puerta` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `localidad` varchar(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `codigo_postal` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `provincia` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `telefono_1` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `telefono_2` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `fax` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `mobil` varchar(11) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `persona_contacto` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `banco` varchar(35) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `entidad` varchar(4) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `agencia` varchar(4) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `dc` varchar(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `cuenta` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `iban` varchar(24) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `id_tarifa_web` int(11) DEFAULT '0',
  `id_tarifa_tpv` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_libradores_envio DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_libradores_envio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) DEFAULT NULL,
  `fecha_documento` date DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `id_librador` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_1` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_2` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_social` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_comercial` varchar(75) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `direccion` varchar(90) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `numero` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `escalera` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `piso` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `puerta` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `localidad` varchar(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `codigo_postal` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `provincia` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `zona` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `telefono_1` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `telefono_2` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `mobil` varchar(11) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `persona_contacto` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `observaciones` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_mesas_juntas DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_mesas_juntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) DEFAULT NULL,
  `id_librador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_observaciones DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_observaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) NOT NULL,
  `id_documentos_2` int(11) NOT NULL,
  `id_documentos_combo` int(11) NOT NULL,
  `observacion` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_productos_costes DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_productos_costes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_2` int(11) NOT NULL,
  `cantidad_base` double(9,3) DEFAULT NULL,
  `id_unidades_base` int(11) DEFAULT NULL,
  `rentabilidad` double(9,3) DEFAULT NULL,
  `id_categoria_elaborados` int(11) DEFAULT NULL,
  `tiempo` int(10) DEFAULT NULL,
  `coste` double(15,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_productos_relacionados DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_productos_relacionados` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_productos_relacionados` int(11) unsigned NOT NULL DEFAULT '0',
  `id_documentos_2` int(11) unsigned NOT NULL DEFAULT '0',
  `id_documentos_combo` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) unsigned NOT NULL DEFAULT '0',
  `id_packs` int(11) unsigned NOT NULL DEFAULT '0',
  `id_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_titulo_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `descripcion` varchar(250) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `id_grupo` int(11) unsigned NOT NULL DEFAULT '0',
  `fijo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `modelo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 - Con / Sin\r\n1 - Normal / Mitad / Sin / Doble\r\n2 - Input cantidad\r\n3 - Unico',
  `cantidad_con` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_mitad` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_sin` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_doble` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar_con` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar_mitad` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar_sin` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar_doble` double(15,5) NOT NULL DEFAULT '0.00000',
  `observaciones` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `por_defecto` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0-con\r\n1-mitad\r\n2-sin\r\n3-doble',
  `mostrar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_documentos_2`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_productos_relacionados_combo DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_productos_relacionados_combo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_documentos_2` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) unsigned NOT NULL DEFAULT '0',
  `id_packs` int(11) unsigned NOT NULL DEFAULT '0',
  `id_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_grupo` int(11) unsigned NOT NULL DEFAULT '0',
  `fijo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar` double(15,5) NOT NULL DEFAULT '0.00000',
  `mostrar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_documentos_2`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_productos_relacionados_elaborados DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_productos_relacionados_elaborados` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_documentos_2` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) unsigned NOT NULL DEFAULT '0',
  `id_packs` int(11) unsigned NOT NULL DEFAULT '0',
  `id_categoria_estadisticas` int(11) unsigned NOT NULL DEFAULT '0',
  `id_producto_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `fijo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `coste` double NOT NULL DEFAULT '0',
  `id_unidad` int(11) unsigned NOT NULL DEFAULT '0',
  `sumar` double(15,5) NOT NULL DEFAULT '0.00000',
  `mostrar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_documentos_2`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_productos_sku_stock DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_productos_sku_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_productos_sku` int(11) NOT NULL DEFAULT '0',
  `lote` varchar(20) COLLATE utf8_spanish_ci DEFAULT '',
  `caducidad` date DEFAULT NULL,
  `numero_serie` varchar(20) COLLATE utf8_spanish_ci DEFAULT '',
  `codigo_barras` varchar(20) COLLATE utf8_spanish_ci DEFAULT '',
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'ela = elaboración\r\npre = presupuesto\r\nped = pedido\r\nalb = albarán\r\nfac = factura\r\ntiq = tiquet',
  `fecha` date DEFAULT NULL,
  `id_documento_1` int(11) NOT NULL DEFAULT '0',
  `id_documento_2` int(11) NOT NULL DEFAULT '0',
  `tipo_librador` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_librador` int(11) DEFAULT '0',
  `coste` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `id_unidades` int(11) NOT NULL DEFAULT '0',
  `unidad` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `importe` double(15,5) NOT NULL DEFAULT '0.00000',
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `lote` (`lote`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_productos_sku_stock_enlace DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_productos_sku_stock_enlace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_ps_stock_inicio` int(11) NOT NULL DEFAULT '0',
  `id_documentos_ps_stock_fin` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_2025_recibos DONE
CREATE TABLE IF NOT EXISTS `documentos_2025_recibos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documento` int(11) DEFAULT NULL,
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `id_librador` int(11) DEFAULT NULL,
  `importe` double(15,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `pagado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_pago` date DEFAULT NULL,
  `hora_pago` time NOT NULL,
  `id_banco_caja_ingreso` int(10) NOT NULL DEFAULT '0',
  `id_metodo_pago` int(10) NOT NULL DEFAULT '0',
  `id_modalidad_pago` int(10) NOT NULL DEFAULT '0',
  `numero_efecto` int(10) NOT NULL DEFAULT '1',
  `id_usuario_pago` int(10) DEFAULT NULL,
  `impreso` tinyint(1) NOT NULL DEFAULT '0',
  `documento_bancario` varchar(15) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `vencimiento_documento_bancario` date DEFAULT NULL,
  `nota` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_automaticos DONE
CREATE TABLE IF NOT EXISTS `documentos_automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_documentos_1` int(11) DEFAULT NULL,
  `fecha_facturacion` date NOT NULL,
  `tipo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'unico,semanal,quincenal,mensual,bimestral,trimestral,cuatrimestral,semestral,anual',
  `pagado` tinyint(1) NOT NULL DEFAULT '0',
  `codigo_suscripcion` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `historial` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_enviar_terminales DONE
CREATE TABLE IF NOT EXISTS `documentos_enviar_terminales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documento_1` int(11) NOT NULL,
  `id_documento_2` int(11) NOT NULL,
  `id_documentos_combo` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `descripcion_producto` varchar(250) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `id_categoria` int(11) NOT NULL DEFAULT '0',
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_modificada` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_modificada_anterior` double(15,5) NOT NULL DEFAULT '0.00000',
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  `alertar` tinyint(1) NOT NULL DEFAULT '0',
  `entregado` tinyint(1) NOT NULL DEFAULT '0',
  `a_marchar` tinyint(1) NOT NULL DEFAULT '0',
  `a_marchar_anterior` tinyint(1) NOT NULL DEFAULT '0',
  `notificado` tinyint(1) NOT NULL DEFAULT '0',
  `hora_entrada` datetime NOT NULL,
  `hora_visto` datetime NOT NULL,
  `hora_pedido` datetime NOT NULL,
  `hora_acabado` datetime NOT NULL,
  `id_terminal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_documento` (`id_documento_1`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_numeraciones DONE
CREATE TABLE IF NOT EXISTS `documentos_numeraciones` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ejercicio` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `consecutivo` tinyint(1) NOT NULL DEFAULT '0',
  `serie` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `numero` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_numeraciones_series DONE
CREATE TABLE IF NOT EXISTS `documentos_numeraciones_series` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `serie` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `comentario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_1 DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sesion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `so` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `procedencia` varchar(3) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'tpv',
  `tipo_librador` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_librador` int(11) DEFAULT NULL,
  `fecha_documento` date DEFAULT NULL,
  `fecha_entrada` date DEFAULT NULL,
  `fecha_entrega_desde` date DEFAULT NULL,
  `fecha_entrega_hasta` date DEFAULT NULL,
  `numero_registro` int(11) DEFAULT NULL,
  `numero_documento` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `serie_documento` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modalidad_pago` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modalidad_envio` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modalidad_entrega` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `irpf` double(7,2) DEFAULT NULL,
  `importe_irpf` double(15,5) DEFAULT NULL,
  `descuento_pp` double(7,2) DEFAULT NULL,
  `importe_descuento_pp` double(15,5) DEFAULT NULL,
  `descuento_librador` double(7,2) DEFAULT NULL,
  `importe_descuento_librador` double(15,5) DEFAULT NULL,
  `base` double(15,5) DEFAULT NULL,
  `total` double(15,5) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  `bloqueado` tinyint(4) DEFAULT NULL,
  `entregado` tinyint(1) NOT NULL DEFAULT '0',
  `id_usuario` int(10) DEFAULT NULL,
  `comensales` smallint(5) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `hora_entrega` time NOT NULL DEFAULT '00:00:00',
  `id_terminal` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_2 DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) NOT NULL,
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `tipo_librador` varchar(3) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `id_librador` int(11) NOT NULL DEFAULT '0',
  `slug` varchar(250) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `tipo_producto` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` date NOT NULL,
  `fecha_entrega_desde` date NOT NULL,
  `fecha_entrega_hasta` date NOT NULL,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) NOT NULL DEFAULT '0',
  `id_packs` int(11) NOT NULL DEFAULT '0',
  `id_productos_relacionados_grupos` int(11) NOT NULL,
  `descripcion_productos_relacionados_grupos` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `imagen_producto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_producto` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `detalles_producto` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_oferta` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_barras_producto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `referencia_producto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `referencia_librador` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `numero_serie` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `lote` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `caducidad` date NOT NULL,
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `id_unidades` int(11) NOT NULL DEFAULT '0',
  `unidad` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `coste` double(15,5) NOT NULL,
  `importe` double(15,5) NOT NULL DEFAULT '0.00000',
  `fijo` tinyint(1) NOT NULL DEFAULT '0',
  `base_antes_descuento` double(15,5) NOT NULL DEFAULT '0.00000',
  `descuento_base` double(7,2) NOT NULL DEFAULT '0.00',
  `importe_descuento_base` double(15,5) NOT NULL DEFAULT '0.00000',
  `base_despues_descuento` double(15,5) NOT NULL DEFAULT '0.00000',
  `iva` double(7,2) NOT NULL DEFAULT '0.00',
  `importe_iva` double(15,5) NOT NULL DEFAULT '0.00000',
  `recargo` double(7,2) NOT NULL DEFAULT '0.00',
  `importe_recargo` double(15,5) NOT NULL DEFAULT '0.00000',
  `pvp_unidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `pvp_unidad_sin_incrementos` double(15,5) NOT NULL DEFAULT '0.00000',
  `total_antes_descuento` double(15,5) NOT NULL DEFAULT '0.00000',
  `descuento_total` double(7,2) NOT NULL DEFAULT '0.00',
  `importe_descuento_total` double(15,5) NOT NULL DEFAULT '0.00000',
  `total_despues_descuento` double(15,5) NOT NULL DEFAULT '0.00000',
  `id_documento_2_anterior` int(11) NOT NULL DEFAULT '0',
  `id_vendedor` int(11) NOT NULL DEFAULT '0',
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  `id_usuario` int(10) NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `hora` time NOT NULL,
  `id_terminal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_documento` (`id_documentos_1`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_iva DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_iva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) DEFAULT NULL,
  `id_documentos_2` int(11) DEFAULT NULL,
  `base` double(15,5) DEFAULT NULL,
  `iva` double(7,2) DEFAULT NULL,
  `importe_iva` double(15,5) DEFAULT NULL,
  `recargo` double(7,2) DEFAULT NULL,
  `importe_recargo` double(15,5) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_libradores DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_libradores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) DEFAULT NULL,
  `codigo_librador` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_1` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_2` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_social` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_comercial` varchar(75) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `nif` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `direccion` varchar(90) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `numero` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `escalera` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `piso` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `puerta` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `localidad` varchar(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `codigo_postal` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `provincia` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `telefono_1` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `telefono_2` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `fax` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `mobil` varchar(11) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `persona_contacto` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `banco` varchar(35) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `entidad` varchar(4) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `agencia` varchar(4) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `dc` varchar(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `cuenta` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `iban` varchar(24) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `id_tarifa_web` int(11) DEFAULT '0',
  `id_tarifa_tpv` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_libradores_envio DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_libradores_envio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) DEFAULT NULL,
  `fecha_documento` date DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `id_librador` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_1` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_2` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_social` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_comercial` varchar(75) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `direccion` varchar(90) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `numero` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `escalera` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `piso` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `puerta` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `localidad` varchar(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `codigo_postal` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `provincia` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `zona` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `telefono_1` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `telefono_2` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `mobil` varchar(11) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `persona_contacto` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `observaciones` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_observaciones DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_observaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) NOT NULL,
  `id_documentos_2` int(11) NOT NULL,
  `id_documentos_combo` int(11) NOT NULL,
  `observacion` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_productos_costes DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_productos_costes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_2` int(11) NOT NULL,
  `cantidad_base` double(9,3) DEFAULT NULL,
  `id_unidades_base` int(11) DEFAULT NULL,
  `rentabilidad` double(9,3) DEFAULT NULL,
  `id_categoria_elaborados` int(11) DEFAULT NULL,
  `tiempo` int(10) DEFAULT NULL,
  `coste` double(15,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_productos_relacionados DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_productos_relacionados` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_productos_relacionados` int(11) unsigned NOT NULL DEFAULT '0',
  `id_documentos_2` int(11) unsigned NOT NULL DEFAULT '0',
  `id_documentos_combo` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) unsigned NOT NULL DEFAULT '0',
  `id_packs` int(11) unsigned NOT NULL DEFAULT '0',
  `id_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_titulo_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `descripcion` varchar(250) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `id_grupo` int(11) unsigned NOT NULL DEFAULT '0',
  `fijo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `modelo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 - Con / Sin\r\n1 - Normal / Mitad / Sin / Doble\r\n2 - Input cantidad\r\n3 - Unico',
  `cantidad_con` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_mitad` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_sin` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_doble` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar_con` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar_mitad` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar_sin` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar_doble` double(15,5) NOT NULL DEFAULT '0.00000',
  `observaciones` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `por_defecto` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0-con\r\n1-mitad\r\n2-sin\r\n3-doble',
  `mostrar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_documentos_2`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_productos_relacionados_combo DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_productos_relacionados_combo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_documentos_2` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) unsigned NOT NULL DEFAULT '0',
  `id_packs` int(11) unsigned NOT NULL DEFAULT '0',
  `id_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_grupo` int(11) unsigned NOT NULL DEFAULT '0',
  `fijo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar` double(15,5) NOT NULL DEFAULT '0.00000',
  `mostrar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_documentos_2`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_productos_relacionados_elaborados DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_productos_relacionados_elaborados` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_documentos_2` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) unsigned NOT NULL DEFAULT '0',
  `id_packs` int(11) unsigned NOT NULL DEFAULT '0',
  `id_categoria_estadisticas` int(11) unsigned NOT NULL DEFAULT '0',
  `id_producto_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `fijo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `coste` double NOT NULL DEFAULT '0',
  `id_unidad` int(11) unsigned NOT NULL DEFAULT '0',
  `sumar` double(15,5) NOT NULL DEFAULT '0.00000',
  `mostrar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_documentos_2`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_productos_sku_stock DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_productos_sku_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_productos_sku` int(11) NOT NULL DEFAULT '0',
  `lote` varchar(20) COLLATE utf8_spanish_ci DEFAULT '',
  `caducidad` date DEFAULT NULL,
  `numero_serie` varchar(20) COLLATE utf8_spanish_ci DEFAULT '',
  `codigo_barras` varchar(20) COLLATE utf8_spanish_ci DEFAULT '',
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'ela = elaboración\r\npre = presupuesto\r\nped = pedido\r\nalb = albarán\r\nfac = factura\r\ntiq = tiquet',
  `fecha` date DEFAULT NULL,
  `id_documento_1` int(11) NOT NULL DEFAULT '0',
  `id_documento_2` int(11) NOT NULL DEFAULT '0',
  `tipo_librador` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_librador` int(11) DEFAULT '0',
  `coste` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `id_unidades` int(11) NOT NULL DEFAULT '0',
  `unidad` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `importe` double(15,5) NOT NULL DEFAULT '0.00000',
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `lote` (`lote`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_recibos DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_recibos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documento` int(11) DEFAULT NULL,
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `id_librador` int(11) DEFAULT NULL,
  `importe` double(15,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `pagado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_pago` date DEFAULT NULL,
  `hora_pago` time NOT NULL,
  `id_banco_caja_ingreso` int(10) NOT NULL DEFAULT '0',
  `id_metodo_pago` int(10) NOT NULL DEFAULT '0',
  `id_modalidad_pago` int(10) NOT NULL DEFAULT '0',
  `numero_efecto` int(10) NOT NULL DEFAULT '1',
  `id_usuario_pago` int(10) DEFAULT NULL,
  `impreso` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.documentos_temp_tienda DONE
CREATE TABLE IF NOT EXISTS `documentos_temp_tienda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documentos_1` int(11) DEFAULT NULL,
  `descripcion_envio` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_envio` int(11) DEFAULT NULL,
  `descripcion_entrega` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_entrega` int(11) DEFAULT NULL,
  `descripcion_pago` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_pago` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.fiskaly_ong DONE
CREATE TABLE IF NOT EXISTS `fiskaly_ong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `api_secret` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bearer_token` varchar(1500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `refresh_token` varchar(1500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `organization_id` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `signer_id` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `client_id` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `creacion_habilitada` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.formatos DONE
CREATE TABLE IF NOT EXISTS `formatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion_final` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.grupos_clientes DONE
CREATE TABLE IF NOT EXISTS `grupos_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `prioritario` tinyint(1) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.identificacion_accesos NOT IMPLEMENTED
CREATE TABLE IF NOT EXISTS `identificacion_accesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_librador` int(11) NOT NULL DEFAULT '0',
  `tipo_librador` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `sesion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.idiomas NOT IMPLEMENTED
CREATE TABLE IF NOT EXISTS `idiomas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idioma` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `bandera` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `updated` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `locale` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `principal` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.irpf DONE
CREATE TABLE IF NOT EXISTS `irpf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `irpf` double(7,2) NOT NULL DEFAULT '0.00',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.libradores DONE
CREATE TABLE IF NOT EXISTS `libradores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_librador` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `tipo` varchar(3) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'cli',
  `id_grupo_clientes` int(11) DEFAULT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_1` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_2` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_social` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_comercial` varchar(75) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `nif` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `direccion` varchar(90) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `numero` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `escalera` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `piso` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `puerta` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `localidad` varchar(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `codigo_postal` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `provincia` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `id_zona` int(11) NOT NULL DEFAULT '0',
  `telefono_1` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `telefono_2` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `fax` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `mobil` varchar(11) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `email2` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `email3` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `email4` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `password_acceso` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `id_categoria_sms` int(11) NOT NULL DEFAULT '0',
  `id_categoria_email` int(11) NOT NULL DEFAULT '0',
  `persona_contacto` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `persona_contacto2` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `persona_contacto3` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `persona_contacto4` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `banco` varchar(35) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `entidad` varchar(4) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `agencia` varchar(4) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `dc` varchar(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `cuenta` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `iban` varchar(24) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `sexo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fecha_nacimiento` date DEFAULT NULL,
  `observaciones` text COLLATE utf8_spanish_ci,
  `id_modalidades_envio` int(10) unsigned NOT NULL DEFAULT '0',
  `id_modalidades_entrega` int(10) unsigned NOT NULL DEFAULT '0',
  `id_modalidades_pago` int(10) unsigned NOT NULL DEFAULT '0',
  `plazo_entrega` int(10) unsigned NOT NULL DEFAULT '0',
  `id_iva` int(11) NOT NULL DEFAULT '0',
  `recargo` tinyint(1) NOT NULL DEFAULT '0',
  `id_irpf` int(11) NOT NULL DEFAULT '0',
  `dia_pago_1` int(10) DEFAULT '0',
  `dia_pago_2` int(10) DEFAULT '0',
  `descuento_pp` double(7,2) DEFAULT '0.00',
  `descuento_librador` double(7,2) DEFAULT '0.00',
  `id_tarifa_web` int(11) DEFAULT '0',
  `id_tarifa_tpv` int(11) DEFAULT '0',
  `procedencia` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `id_cliente_origen` int(11) NOT NULL DEFAULT '0',
  `id_vendedor` int(11) NOT NULL DEFAULT '0',
  `id_nivel_comisiones` int(11) unsigned NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_banco_cobro` int(11) NOT NULL DEFAULT '0',
  `imagen_mesa` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen_mesa_ocupada` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `radio` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_comedores` int(10) unsigned NOT NULL DEFAULT '0',
  `comensales` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enviar_cocina` tinyint(1) NOT NULL DEFAULT '1',
  `ancho_pos` int(10) NOT NULL DEFAULT '0',
  `alto_pos` int(10) NOT NULL DEFAULT '0',
  `ancho` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `alto` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.libradores_emails_envio DONE
CREATE TABLE IF NOT EXISTS `libradores_emails_envio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_librador` int(11) NOT NULL DEFAULT '0',
  `email_asunto_tiq` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_cuerpo_tiq` text COLLATE utf8_spanish_ci,
  `email_asunto_fac` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_cuerpo_fac` text COLLATE utf8_spanish_ci,
  `email_asunto_alb` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_cuerpo_alb` text COLLATE utf8_spanish_ci,
  `email_asunto_ped` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_cuerpo_ped` text COLLATE utf8_spanish_ci,
  `email_asunto_pre` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_cuerpo_pre` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.libradores_envio DONE
CREATE TABLE IF NOT EXISTS `libradores_envio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_librador` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_1` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido_2` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_social` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `razon_comercial` varchar(75) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `direccion` varchar(90) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `numero` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `escalera` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `piso` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `puerta` varchar(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `localidad` varchar(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `codigo_postal` varchar(7) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `provincia` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `id_zona` int(11) NOT NULL DEFAULT '0',
  `telefono_1` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `telefono_2` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `mobil` varchar(11) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `persona_contacto` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `observaciones` text COLLATE utf8_spanish_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.libradores_historico_correos DONE
CREATE TABLE IF NOT EXISTS `libradores_historico_correos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_librador` int(10) unsigned NOT NULL DEFAULT '0',
  `tipo_librador` varchar(3) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'cli',
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'fac',
  `numero_documento` varchar(25) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `mail` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `fecha_envio` datetime DEFAULT NULL,
  `visto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.libradores_lineas DONE
CREATE TABLE IF NOT EXISTS `libradores_lineas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_comedores` int(10) unsigned NOT NULL DEFAULT '0',
  `ancho_pos` int(10) NOT NULL DEFAULT '0',
  `alto_pos` int(10) NOT NULL DEFAULT '0',
  `ancho` int(10) unsigned NOT NULL DEFAULT '0',
  `alto` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.libradores_productos DONE
CREATE TABLE IF NOT EXISTS `libradores_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_librador` int(11) NOT NULL DEFAULT '0',
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `coste_importe` double(15,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.listado_notificaciones_stock DONE
CREATE TABLE IF NOT EXISTS `listado_notificaciones_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_librador` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `notificado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.marcas DONE
CREATE TABLE IF NOT EXISTS `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.metodos_pago DONE
CREATE TABLE IF NOT EXISTS `metodos_pago` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `explicacion` text COLLATE utf8_spanish_ci NOT NULL,
  `interface` varchar(3) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'tpv',
  `prioritario` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_iva` int(10) NOT NULL DEFAULT '0',
  `incremento_pvp` double(4,2) NOT NULL DEFAULT '0.00',
  `incremento_por` double(4,2) NOT NULL DEFAULT '0.00',
  `ruta` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `sistema` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `updated` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `directo` tinyint(1) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.metodos_pago_bans DONE
CREATE TABLE IF NOT EXISTS `metodos_pago_bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_metodo_pago` int(11) NOT NULL DEFAULT '0',
  `correo` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `telefono` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.metodos_pago_gateway DONE
CREATE TABLE IF NOT EXISTS `metodos_pago_gateway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_metodo_pago` int(11) DEFAULT NULL,
  `tipo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'sanderest_stripe,sanderest_paypal,sanderest_redsys',
  `client_id` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `client_secret` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `webhook_secret` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.modalidades_entrega DONE
CREATE TABLE IF NOT EXISTS `modalidades_entrega` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `explicacion` text COLLATE utf8_spanish_ci NOT NULL,
  `prioritario` tinyint(1) NOT NULL DEFAULT '0',
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.modalidades_envio DONE
CREATE TABLE IF NOT EXISTS `modalidades_envio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `explicacion` text COLLATE utf8_spanish_ci NOT NULL,
  `id_iva` int(10) NOT NULL DEFAULT '0',
  `incremento_pvp` double(4,2) NOT NULL DEFAULT '0.00',
  `prioritario` tinyint(1) NOT NULL DEFAULT '0',
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.modalidades_envio_zonas DONE
CREATE TABLE IF NOT EXISTS `modalidades_envio_zonas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_modalidad_envio` int(11) NOT NULL DEFAULT '0',
  `id_zona` int(11) NOT NULL DEFAULT '0',
  `incremento_pvp` double(4,2) NOT NULL DEFAULT '0.00',
  `incremento_por_kilo` double(4,2) NOT NULL DEFAULT '0.00',
  `volumen_maximo_bulto` double(4,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.modalidades_envio_zonas_franjas DONE
CREATE TABLE IF NOT EXISTS `modalidades_envio_zonas_franjas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_modalidad_envio_zona` int(11) NOT NULL DEFAULT '0',
  `incremento_pvp` double(4,2) NOT NULL DEFAULT '0.00',
  `volumen_desde` double(4,2) NOT NULL DEFAULT '0.00',
  `volumen_hasta` double(4,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.modalidades_envio_zonas_franjas_entrega DONE
CREATE TABLE IF NOT EXISTS `modalidades_envio_zonas_franjas_entrega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_modalidad_envio_zf` int(11) NOT NULL DEFAULT '0',
  `id_modalidad_entrega` int(11) NOT NULL DEFAULT '0',
  `incremento_pvp` double(4,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.modalidades_pago DONE
CREATE TABLE IF NOT EXISTS `modalidades_pago` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `explicacion` text COLLATE utf8_spanish_ci NOT NULL,
  `tienda_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `defecto` tinyint(1) NOT NULL DEFAULT '0',
  `id_iva` int(10) NOT NULL DEFAULT '0',
  `incremento_pvp` double(4,2) NOT NULL DEFAULT '0.00',
  `incremento_por` double(4,2) NOT NULL DEFAULT '0.00',
  `prioritario` tinyint(1) NOT NULL DEFAULT '0',
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.modalidades_pago_lineas DONE
CREATE TABLE IF NOT EXISTS `modalidades_pago_lineas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_forma_pago` int(10) NOT NULL DEFAULT '0',
  `dias` int(10) NOT NULL DEFAULT '0',
  `porcentaje` double(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.modelos_impresion_1 DONE
CREATE TABLE IF NOT EXISTS `modelos_impresion_1` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ancho` int(10) NOT NULL,
  `alto` int(10) NOT NULL,
  `interlineado` tinyint(4) NOT NULL DEFAULT '5',
  `marcar_lineas` tinyint(1) NOT NULL DEFAULT '0',
  `lineas_pagina` int(10) NOT NULL DEFAULT '20',
  `tipo_documento` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `serie` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `predeterminado` tinyint(1) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.modelos_impresion_2 DONE
CREATE TABLE IF NOT EXISTS `modelos_impresion_2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_modelos_impresion_1` int(10) NOT NULL,
  `zona` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `campo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inicio_ancho` int(10) NOT NULL DEFAULT '0',
  `inicio_alto` int(10) NOT NULL DEFAULT '0',
  `ancho` int(10) DEFAULT NULL,
  `alto` int(10) DEFAULT NULL,
  `col_r_letra` int(3) NOT NULL DEFAULT '255',
  `col_g_letra` int(3) NOT NULL DEFAULT '255',
  `col_b_letra` int(3) NOT NULL DEFAULT '255',
  `border` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `grueso_borde` int(2) NOT NULL DEFAULT '0',
  `col_r_borde` int(3) NOT NULL DEFAULT '255',
  `col_g_borde` int(3) NOT NULL DEFAULT '255',
  `col_b_borde` int(3) NOT NULL DEFAULT '255',
  `alineacion` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'L',
  `fuente_letra` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Arial',
  `estilo_letra` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `size_letra` varchar(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT '10',
  `mostrar` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.ofertas NOT IMPLEMENTED
CREATE TABLE IF NOT EXISTS `ofertas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_idioma` int(11) NOT NULL DEFAULT '0',
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos DONE
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_idioma` int(11) NOT NULL DEFAULT '0',
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_producto` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'tipo_producto = 0 // normal\r\ntipo_producto = 1 // elaborado\r\ntipo_producto = 2 // compuesto\r\ntipo_producto = 3 // combo manual\r\ntipo_producto = 4 // combo automático',
  `producto_venta` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = producto interno\r\n1 = producto en venta',
  `id_iva` int(11) NOT NULL DEFAULT '0',
  `peso_bruto` double(15,3) NOT NULL DEFAULT '0.000',
  `peso_neto` double(15,3) NOT NULL DEFAULT '0.000',
  `coste` double(15,5) NOT NULL DEFAULT '0.00000',
  `imagen` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen2` varchar(100) COLLATE utf8_spanish_ci DEFAULT '',
  `imagen3` varchar(100) COLLATE utf8_spanish_ci DEFAULT '',
  `video` varchar(100) COLLATE utf8_spanish_ci DEFAULT '',
  `documento` varchar(100) COLLATE utf8_spanish_ci DEFAULT '',
  `updated` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `alt` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tittle` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_categorias DONE
CREATE TABLE IF NOT EXISTS `productos_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL DEFAULT '0',
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_categoria` (`id_categoria`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_costes DONE
CREATE TABLE IF NOT EXISTS `productos_costes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `cantidad_base` double(15,5) DEFAULT NULL,
  `id_unidades_base` int(11) DEFAULT NULL,
  `rentabilidad` double(9,3) DEFAULT NULL,
  `tiempo` double(9,2) DEFAULT NULL,
  `id_categoria_elaborados` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_detalles DONE
CREATE TABLE IF NOT EXISTS `productos_detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_idioma` int(11) NOT NULL DEFAULT '0',
  `detalle` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_detalles_datos DONE
CREATE TABLE IF NOT EXISTS `productos_detalles_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_productos_detalles` int(11) NOT NULL DEFAULT '0',
  `detalle` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_productos_detalles` (`id_productos_detalles`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_detalles_enlazado DONE
CREATE TABLE IF NOT EXISTS `productos_detalles_enlazado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_atributo_principal` int(11) NOT NULL DEFAULT '0',
  `id_dato_principal` int(11) NOT NULL DEFAULT '0',
  `id_atributo_enlazado` int(11) NOT NULL DEFAULT '0',
  `id_dato_enlazado` int(11) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_alta` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_detalles_multiples DONE
CREATE TABLE IF NOT EXISTS `productos_detalles_multiples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_atributo` int(11) NOT NULL DEFAULT '0',
  `id_dato` int(11) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_alta` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_detalles_unicos DONE
CREATE TABLE IF NOT EXISTS `productos_detalles_unicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_atributo` int(11) NOT NULL DEFAULT '0',
  `id_dato` int(11) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_alta` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_embalajes DONE
CREATE TABLE IF NOT EXISTS `productos_embalajes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) unsigned NOT NULL DEFAULT '0',
  `id_producto_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_producto`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_images DONE
CREATE TABLE IF NOT EXISTS `productos_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) DEFAULT '0',
  `id_productos_detalles_multiples` int(11) DEFAULT '0',
  `id_packs` int(11) DEFAULT '0',
  `imagen` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `updated` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `alt` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tittle` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_iva DONE
CREATE TABLE IF NOT EXISTS `productos_iva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iva` double(7,2) NOT NULL DEFAULT '0.00',
  `recargo` double(7,2) NOT NULL DEFAULT '0.00',
  `prioritario` tinyint(1) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_observaciones DONE
CREATE TABLE IF NOT EXISTS `productos_observaciones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `observacion` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_otros DONE
CREATE TABLE IF NOT EXISTS `productos_otros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) NOT NULL DEFAULT '0',
  `id_packs` int(11) NOT NULL DEFAULT '0',
  `control_stock` tinyint(1) NOT NULL DEFAULT '0',
  `stock_optimo` int(10) DEFAULT '0',
  `balanza` tinyint(1) NOT NULL DEFAULT '0',
  `tienda` tinyint(1) NOT NULL DEFAULT '0',
  `url_externa` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_modificacion` date DEFAULT NULL,
  `enviar` int(11) NOT NULL DEFAULT '0',
  `manual` tinyint(1) NOT NULL DEFAULT '0',
  `profesionales` tinyint(1) NOT NULL DEFAULT '0',
  `peso` double(15,5) DEFAULT '0.00000',
  `bultos` double(15,5) DEFAULT '0.00000',
  `gastos` double(15,2) DEFAULT '0.00',
  `envio_gratis` tinyint(1) NOT NULL DEFAULT '0',
  `dias_entrega` int(11) NOT NULL DEFAULT '0',
  `aplicar_descuento` tinyint(1) NOT NULL DEFAULT '0',
  `descuento_maximo` double(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_packs DONE
CREATE TABLE IF NOT EXISTS `productos_packs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) NOT NULL DEFAULT '0',
  `cantidad_pack` double(7,2) DEFAULT NULL,
  `peso` double(15,5) DEFAULT '0.00000',
  `bultos` double(15,5) DEFAULT '0.00000',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_pvp DONE
CREATE TABLE IF NOT EXISTS `productos_pvp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) NOT NULL DEFAULT '0',
  `id_packs` int(11) NOT NULL DEFAULT '0',
  `id_tarifa` int(11) NOT NULL DEFAULT '0',
  `margen` double(15,5) NOT NULL DEFAULT '0.00000',
  `pvp` double(15,5) NOT NULL DEFAULT '0.00000',
  `fecha_modificacion` date DEFAULT NULL,
  `id_ofertas` int(11) NOT NULL DEFAULT '0',
  `oferta_desde` date DEFAULT NULL,
  `oferta_hasta` date DEFAULT NULL,
  `pvp_oferta` double(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_relacionados DONE
CREATE TABLE IF NOT EXISTS `productos_relacionados` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) unsigned NOT NULL DEFAULT '0',
  `id_packs` int(11) unsigned NOT NULL DEFAULT '0',
  `id_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_grupo` int(11) unsigned NOT NULL DEFAULT '0',
  `fijo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `modelo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 - Con / Sin\r\n1 - Normal / Mitad / Sin / Doble\r\n2 - Input cantidad\r\n3 - Unico\r\n4 - No mostrar\r\n5 - Texto',
  `cantidad_con` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_mitad` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_sin` double(15,5) NOT NULL DEFAULT '0.00000',
  `cantidad_doble` double(15,5) NOT NULL DEFAULT '0.00000',
  `observacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `por_defecto` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0-con\r\n1-mitad\r\n2-sin\r\n3-doble',
  `mostrar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_producto`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_relacionados_combo DONE
CREATE TABLE IF NOT EXISTS `productos_relacionados_combo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) unsigned NOT NULL DEFAULT '0',
  `id_packs` int(11) unsigned NOT NULL DEFAULT '0',
  `id_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_grupo` int(11) unsigned NOT NULL DEFAULT '0',
  `fijo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `mostrar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_producto`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_relacionados_combo_incre DONE
CREATE TABLE IF NOT EXISTS `productos_relacionados_combo_incre` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto_rel` int(11) unsigned NOT NULL DEFAULT '0',
  `id_tarifa` int(11) unsigned NOT NULL DEFAULT '0',
  `sumar` double(15,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_producto_rel`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_relacionados_elaborados DONE
CREATE TABLE IF NOT EXISTS `productos_relacionados_elaborados` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) unsigned NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) unsigned NOT NULL DEFAULT '0',
  `id_packs` int(11) unsigned NOT NULL DEFAULT '0',
  `id_categoria_estadisticas` int(11) unsigned NOT NULL DEFAULT '0',
  `id_producto_relacionado` int(11) unsigned NOT NULL DEFAULT '0',
  `fijo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cantidad` double(15,5) NOT NULL DEFAULT '0.00000',
  `id_unidad` int(11) unsigned NOT NULL DEFAULT '0',
  `mostrar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_producto`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_relacionados_elaborados_incre DONE
CREATE TABLE IF NOT EXISTS `productos_relacionados_elaborados_incre` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto_rel` int(11) unsigned NOT NULL DEFAULT '0',
  `id_tarifa` int(11) unsigned NOT NULL DEFAULT '0',
  `sumar` double(15,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_producto_rel`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_relacionados_grupos DONE
CREATE TABLE IF NOT EXISTS `productos_relacionados_grupos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_idioma` int(11) unsigned NOT NULL DEFAULT '0',
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_relacionados_incre DONE
CREATE TABLE IF NOT EXISTS `productos_relacionados_incre` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto_rel` int(11) unsigned NOT NULL DEFAULT '0',
  `id_tarifa` int(11) unsigned NOT NULL DEFAULT '0',
  `sumar_con` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar_mitad` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar_sin` double(15,5) NOT NULL DEFAULT '0.00000',
  `sumar_doble` double(15,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indice` (`id_producto_rel`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_sku DONE
CREATE TABLE IF NOT EXISTS `productos_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) NOT NULL DEFAULT '0',
  `id_packs` int(11) NOT NULL DEFAULT '0',
  `codigo_barras` varchar(20) COLLATE utf8_spanish_ci DEFAULT '',
  `referencia` varchar(20) COLLATE utf8_spanish_ci DEFAULT '',
  `stock` double(10,3) NOT NULL DEFAULT '0.000',
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `codigo_barras` (`codigo_barras`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_titulos DONE
CREATE TABLE IF NOT EXISTS `productos_titulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` tinyint(1) NOT NULL DEFAULT '3',
  `orden` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.productos_titulos_relacionados DONE
CREATE TABLE IF NOT EXISTS `productos_titulos_relacionados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_productos_titulos` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.productos_unidades DONE
CREATE TABLE IF NOT EXISTS `productos_unidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_unidad` int(11) NOT NULL DEFAULT '0',
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  `conversion_principal` double(15,5) NOT NULL DEFAULT '1.00000',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.productos_web_datos DONE
CREATE TABLE IF NOT EXISTS `productos_web_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_enlazado` int(11) NOT NULL DEFAULT '0',
  `id_productos_detalles_multiples` int(11) NOT NULL DEFAULT '0',
  `id_packs` int(11) NOT NULL DEFAULT '0',
  `id_formato` int(11) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `descripcion_larga` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion_url` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `titulo_meta` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion_meta` varchar(160) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_observaciones` int(11) NOT NULL DEFAULT '0',
  `novedad` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.promocion_documentos DONE
CREATE TABLE IF NOT EXISTS `promocion_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activa` tinyint(4) DEFAULT '1',
  `codigo_cupon` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `limite_usos` int(11) DEFAULT '0',
  `aplicar_productos_con_descuento` tinyint(4) DEFAULT '0',
  `id_tarifa` int(11) DEFAULT NULL,
  `fecha_desde` datetime DEFAULT NULL,
  `fecha_hasta` datetime DEFAULT NULL,
  `orden` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.promocion_documentos_acciones DONE
CREATE TABLE IF NOT EXISTS `promocion_documentos_acciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_promocion_documentos` int(11) DEFAULT NULL,
  `tipo` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descuento_total` double(15,5) DEFAULT '0.00000',
  `descuento_porcentaje_total` double(15,5) DEFAULT '0.00000',
  `items_por_items_necesarios` int(11) DEFAULT NULL,
  `items_por_items_pagar` int(11) DEFAULT NULL,
  `descuento_porcentaje_envio` double(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.promocion_documentos_reglas DONE
CREATE TABLE IF NOT EXISTS `promocion_documentos_reglas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_promocion_documentos` int(11) DEFAULT NULL,
  `tipo` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidad` double(15,5) DEFAULT '0.00000',
  `id_grupos_clientes` int(11) DEFAULT '0',
  `total_categorias` double(15,5) DEFAULT '0.00000',
  `total_documento` double(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.promocion_documentos_reglas_categorias DONE
CREATE TABLE IF NOT EXISTS `promocion_documentos_reglas_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_promocion_documentos_reglas` int(11) DEFAULT NULL,
  `id_categorias` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.promocion_documentos_reglas_productos DONE
CREATE TABLE IF NOT EXISTS `promocion_documentos_reglas_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_promocion_documentos_reglas` int(11) DEFAULT NULL,
  `id_productos` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.promocion_productos DONE
CREATE TABLE IF NOT EXISTS `promocion_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activa` tinyint(4) DEFAULT '1',
  `id_tarifa` int(11) DEFAULT NULL,
  `fecha_desde` datetime DEFAULT NULL,
  `fecha_hasta` datetime DEFAULT NULL,
  `orden` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.promocion_productos_acciones DONE
CREATE TABLE IF NOT EXISTS `promocion_productos_acciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_promocion_productos` int(11) DEFAULT NULL,
  `tipo` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descuento_total` double(15,5) DEFAULT '0.00000',
  `descuento_porcentaje_total` double(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.promocion_productos_reglas DONE
CREATE TABLE IF NOT EXISTS `promocion_productos_reglas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_promocion_productos` int(11) DEFAULT NULL,
  `tipo` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.promocion_productos_reglas_categorias DONE
CREATE TABLE IF NOT EXISTS `promocion_productos_reglas_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_promocion_productos_reglas` int(11) DEFAULT NULL,
  `id_categorias` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.promocion_productos_reglas_productos DONE
CREATE TABLE IF NOT EXISTS `promocion_productos_reglas_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_promocion_productos_reglas` int(11) DEFAULT NULL,
  `id_productos` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.rebuts_compte NOT IMPLEMENTED
CREATE TABLE IF NOT EXISTS `rebuts_compte` (
  `codi` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` int(10) DEFAULT NULL,
  `descripcio` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `import` double(15,5) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_client` int(10) DEFAULT NULL,
  `codi_compte_ingres` int(10) DEFAULT NULL,
  `modalitat_cobro` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `usuari` int(10) DEFAULT NULL,
  `caixa` int(10) DEFAULT NULL,
  PRIMARY KEY (`codi`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla tpv_e_1es.sesion_api NOT IMPLEMENTED
CREATE TABLE IF NOT EXISTS `sesion_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sesion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_documento` int(11) DEFAULT NULL,
  `id_librador` int(11) DEFAULT NULL,
  `id_productos_relacionados_grupos` int(11) DEFAULT NULL,
  `ejercicio` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_terminal` int(11) DEFAULT NULL,
  `tipo_librador` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_documento` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.tarifas DONE
CREATE TABLE IF NOT EXISTS `tarifas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_idioma` int(11) NOT NULL DEFAULT '0',
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `prioritaria` tinyint(4) NOT NULL DEFAULT '0',
  `activa` tinyint(4) NOT NULL DEFAULT '1',
  `orden` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.terminales DONE
CREATE TABLE IF NOT EXISTS `terminales` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `mostrar_todo` tinyint(1) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `servicio_domicilio` tinyint(1) DEFAULT NULL,
  `cerrar_documento_flujo` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundos_cierre_documento` int(11) DEFAULT NULL,
  `mostrar_precios_tpv` tinyint(1) DEFAULT NULL,
  `mostrar_mas_vendidos` tinyint(1) DEFAULT NULL,
  `modo_camarero` tinyint(1) DEFAULT NULL,
  `proteger_edicion` tinyint(1) DEFAULT NULL,
  `categorias_por_terminal` tinyint(1) DEFAULT NULL,
  `tipo_menu_superior` tinyint(1) DEFAULT NULL,
  `filas_menu` tinyint(1) DEFAULT NULL,
  `tickets_automaticos` tinyint(1) DEFAULT NULL,
  `tickets_automaticos_terminal` int(11) DEFAULT NULL,
  `abrir_cajon_monedas` tinyint(1) DEFAULT NULL,
  `boton_cajon_monedas` tinyint(1) DEFAULT NULL,
  `id_terminal_visor` int(11) DEFAULT '0',
  `fecha_alta` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.tienda_home DONE
CREATE TABLE IF NOT EXISTS `tienda_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto_principal` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `sobre_nosotros` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `horario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_1` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_1_link` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_2` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_2_link` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_3` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_3_link` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_4` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_4_link` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_5` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_5_link` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_6` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `foto_galeria_6_link` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `iniciar_del_tak` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - No\r\n1 - Si',
  `terminar_movil` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - No\r\n1 - Si',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla tpv_e_1es.tPNSubscription Not implemented
CREATE TABLE IF NOT EXISTS `tPNSubscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_terminal` int(11) NOT NULL DEFAULT '0',
  `endpoint` text NOT NULL,
  `expires` timestamp NULL DEFAULT NULL,
  `subscription` text NOT NULL,
  `useragent` varchar(255) NOT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `endpoint` (`endpoint`(500))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando estructura para tabla tpv_e_1es.unidades DONE
CREATE TABLE IF NOT EXISTS `unidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unidad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `abreviatura` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.usuarios DONE
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) CHARACTER SET latin1 NOT NULL,
  `password` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT '-1',
  `id_empresa` int(11) NOT NULL DEFAULT '-1',
  `id_idioma` int(11) NOT NULL DEFAULT '1',
  `bloqueo` tinyint(4) NOT NULL DEFAULT '0',
  `dark` tinyint(4) NOT NULL DEFAULT '0',
  `saltar_proteccion_documentos_propios` tinyint(4) NOT NULL DEFAULT '0',
  `id_comercial` int(10) unsigned NOT NULL DEFAULT '0',
  `avatar` int(10) unsigned NOT NULL DEFAULT '0',
  `avatar_personalizado` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.usuarios_accesos NOT IMPLEMENTED
CREATE TABLE IF NOT EXISTS `usuarios_accesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `sesion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `dia` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_terminal` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.usuarios_historico NOT IMPLEMENTED
CREATE TABLE IF NOT EXISTS `usuarios_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `dia` date NOT NULL,
  `hora` time NOT NULL,
  `error_password` tinyint(1) NOT NULL DEFAULT '0',
  `sesion` varchar(200) CHARACTER SET latin1 NOT NULL,
  `password` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.usuarios_permisos DONE
CREATE TABLE IF NOT EXISTS `usuarios_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `menu_clientes` tinyint(1) NOT NULL DEFAULT '1',
  `clientes` tinyint(1) NOT NULL DEFAULT '1',
  `presupuestos_clientes` tinyint(1) NOT NULL DEFAULT '1',
  `pedidos_clientes` tinyint(1) NOT NULL DEFAULT '1',
  `albaranes_clientes` tinyint(1) NOT NULL DEFAULT '1',
  `facturas_clientes` tinyint(1) NOT NULL DEFAULT '1',
  `tiquets_clientes` tinyint(1) NOT NULL DEFAULT '1',
  `mesas` tinyint(1) NOT NULL DEFAULT '1',
  `zonas` tinyint(1) NOT NULL DEFAULT '1',
  `modalidades_envio` tinyint(1) NOT NULL DEFAULT '1',
  `modalidades_entrega` tinyint(1) NOT NULL DEFAULT '1',
  `modalidades_pago` tinyint(1) NOT NULL DEFAULT '1',
  `menu_proveedores` tinyint(1) NOT NULL DEFAULT '1',
  `proveedores` tinyint(1) NOT NULL DEFAULT '1',
  `presupuestos_proveedores` tinyint(1) NOT NULL DEFAULT '1',
  `pedidos_proveedores` tinyint(1) NOT NULL DEFAULT '1',
  `albaranes_proveedores` tinyint(1) NOT NULL DEFAULT '1',
  `facturas_proveedores` tinyint(1) NOT NULL DEFAULT '1',
  `tiquets_proveedores` tinyint(1) NOT NULL DEFAULT '1',
  `menu_creditores` tinyint(1) NOT NULL DEFAULT '1',
  `creditores` tinyint(1) NOT NULL DEFAULT '1',
  `presupuestos_creditores` tinyint(1) NOT NULL DEFAULT '1',
  `pedidos_creditores` tinyint(1) NOT NULL DEFAULT '1',
  `albaranes_creditores` tinyint(1) NOT NULL DEFAULT '1',
  `facturas_creditores` tinyint(1) NOT NULL DEFAULT '1',
  `tiquets_creditores` tinyint(1) NOT NULL DEFAULT '1',
  `caja_entradas` tinyint(1) NOT NULL DEFAULT '1',
  `caja_salidas` tinyint(1) NOT NULL DEFAULT '1',
  `caja_cierre` tinyint(1) NOT NULL DEFAULT '1',
  `caja_cierre_consulta` tinyint(1) NOT NULL DEFAULT '1',
  `menu_productos` tinyint(1) NOT NULL DEFAULT '1',
  `productos` tinyint(1) NOT NULL DEFAULT '1',
  `categorias` tinyint(1) NOT NULL DEFAULT '1',
  `categorias_elaborados` tinyint(1) NOT NULL DEFAULT '1',
  `detalles_productos` tinyint(1) NOT NULL DEFAULT '1',
  `grupos` tinyint(1) NOT NULL DEFAULT '1',
  `menu_listados` tinyint(1) NOT NULL DEFAULT '1',
  `stocks_listados` tinyint(1) NOT NULL DEFAULT '1',
  `mas_vendidos_listados` tinyint(1) NOT NULL DEFAULT '1',
  `iva_listados` tinyint(1) NOT NULL DEFAULT '0',
  `mails_listados` tinyint(1) NOT NULL DEFAULT '0',
  `notificaciones_stock_listados` tinyint(1) NOT NULL DEFAULT '0',
  `consumos_listados` tinyint(1) NOT NULL DEFAULT '0',
  `entradas_salidas_listados` tinyint(1) NOT NULL DEFAULT '0',
  `stock_optimo_listados` tinyint(1) NOT NULL DEFAULT '0',
  `tickets_modificados_listados` tinyint(1) NOT NULL DEFAULT '0',
  `ventas_camareros_listados` tinyint(1) NOT NULL DEFAULT '0',
  `ventas_categorias_listados` tinyint(1) NOT NULL DEFAULT '0',
  `cierre_caja_listados` tinyint(1) NOT NULL DEFAULT '0',
  `tarifas_listados` tinyint(1) NOT NULL DEFAULT '0',
  `recepcion_pedidos` tinyint(1) NOT NULL DEFAULT '1',
  `menu_general` tinyint(1) NOT NULL DEFAULT '1',
  `tipos_iva` tinyint(1) NOT NULL DEFAULT '1',
  `tipos_irpf` tinyint(1) NOT NULL DEFAULT '1',
  `bancos_cajas` tinyint(1) NOT NULL DEFAULT '1',
  `tarifas` tinyint(1) NOT NULL DEFAULT '1',
  `usuarios` tinyint(1) NOT NULL DEFAULT '1',
  `idiomas` tinyint(1) NOT NULL DEFAULT '1',
  `datos_empresa` tinyint(1) NOT NULL DEFAULT '1',
  `impresion_documentos` tinyint(1) NOT NULL DEFAULT '1',
  `iconos` tinyint(1) NOT NULL DEFAULT '1',
  `gestor` tinyint(1) NOT NULL DEFAULT '1',
  `terminales` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.valoracion_empresas NOT IMPLEMENTED
CREATE TABLE IF NOT EXISTS `valoracion_empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `valoracion` tinyint(3) unsigned NOT NULL,
  `validar` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.valoracion_productos NOT IMPLEMENTED
CREATE TABLE IF NOT EXISTS `valoracion_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `valoracion` tinyint(3) unsigned NOT NULL,
  `validar` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- Volcando estructura para tabla tpv_e_1es.zonas DONE
CREATE TABLE IF NOT EXISTS `zonas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zona` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;
