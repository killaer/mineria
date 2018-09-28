--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

-- Started on 2018-09-28 04:02:27 WEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 189 (class 1259 OID 16885)
-- Name: entidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entidad (
    id character varying(255) NOT NULL,
    tipo_e integer NOT NULL,
    cod_e character varying(255) NOT NULL,
    activo_e boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.entidad OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16680)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16678)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 185
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 191 (class 1259 OID 16937)
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16935)
-- Name: perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfil_id_seq OWNER TO postgres;

--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 190
-- Name: perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perfil_id_seq OWNED BY public.perfil.id;


--
-- TOC entry 188 (class 1259 OID 16879)
-- Name: tipo_entidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_entidad (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.tipo_entidad OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16877)
-- Name: tipo_entidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_entidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_entidad_id_seq OWNER TO postgres;

--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 187
-- Name: tipo_entidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_entidad_id_seq OWNED BY public.tipo_entidad.id;


--
-- TOC entry 195 (class 1259 OID 16984)
-- Name: username; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.username (
);


ALTER TABLE public.username OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16943)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_e character varying(255) NOT NULL,
    correo character varying(255) NOT NULL,
    password character varying(64) NOT NULL,
    active boolean DEFAULT false,
    username character varying(100)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16959)
-- Name: usuario_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_perfil (
    id integer NOT NULL,
    id_e character varying(255) NOT NULL,
    id_perfil integer NOT NULL
);


ALTER TABLE public.usuario_perfil OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16957)
-- Name: usuario_perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_perfil_id_seq OWNER TO postgres;

--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 193
-- Name: usuario_perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_perfil_id_seq OWNED BY public.usuario_perfil.id;


--
-- TOC entry 2037 (class 2604 OID 16683)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 16940)
-- Name: perfil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil ALTER COLUMN id SET DEFAULT nextval('public.perfil_id_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 16882)
-- Name: tipo_entidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_entidad ALTER COLUMN id SET DEFAULT nextval('public.tipo_entidad_id_seq'::regclass);


--
-- TOC entry 2041 (class 2604 OID 16962)
-- Name: usuario_perfil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil ALTER COLUMN id SET DEFAULT nextval('public.usuario_perfil_id_seq'::regclass);


--
-- TOC entry 2181 (class 0 OID 16885)
-- Dependencies: 189
-- Data for Name: entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.entidad (id, tipo_e, cod_e, activo_e, created_at, updated_at) VALUES ('1-1', 1, 'USUARIO_1', true, '2018-09-28 00:06:47', '2018-09-28 00:06:47');


--
-- TOC entry 2178 (class 0 OID 16680)
-- Dependencies: 186
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations (id, migration, batch) VALUES (2, '2018_09_27_230552_create_entidad_schema', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (3, '2018_09_27_230559_create_usuario_schema', 2);


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 185
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 3, true);


--
-- TOC entry 2183 (class 0 OID 16937)
-- Dependencies: 191
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perfil (id, descripcion) VALUES (1, 'administrador');
INSERT INTO public.perfil (id, descripcion) VALUES (2, 'tecnico');
INSERT INTO public.perfil (id, descripcion) VALUES (3, 'propietario');


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 190
-- Name: perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perfil_id_seq', 1, false);


--
-- TOC entry 2180 (class 0 OID 16879)
-- Dependencies: 188
-- Data for Name: tipo_entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_entidad (id, descripcion) VALUES (1, 'usuario');
INSERT INTO public.tipo_entidad (id, descripcion) VALUES (2, 'locacion');
INSERT INTO public.tipo_entidad (id, descripcion) VALUES (3, 'maquina');
INSERT INTO public.tipo_entidad (id, descripcion) VALUES (4, 'componente');


--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 187
-- Name: tipo_entidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_entidad_id_seq', 1, false);


--
-- TOC entry 2187 (class 0 OID 16984)
-- Dependencies: 195
-- Data for Name: username; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2184 (class 0 OID 16943)
-- Dependencies: 192
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario (id_e, correo, password, active, username) VALUES ('1-1', 'snavarro169@gmail.com', '$2y$10$MLUElz1PFLW9fsd2/N4Tqu6gN2DAHQcrZF14UTqBs.aGJ.72DNg0y', true, 'emroy');


--
-- TOC entry 2186 (class 0 OID 16959)
-- Dependencies: 194
-- Data for Name: usuario_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 193
-- Name: usuario_perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_perfil_id_seq', 1, false);


--
-- TOC entry 2048 (class 2606 OID 16892)
-- Name: entidad entidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entidad
    ADD CONSTRAINT entidad_pkey PRIMARY KEY (id);


--
-- TOC entry 2043 (class 2606 OID 16685)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2050 (class 2606 OID 16942)
-- Name: perfil perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 16884)
-- Name: tipo_entidad tipo_entidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_entidad
    ADD CONSTRAINT tipo_entidad_pkey PRIMARY KEY (id);


--
-- TOC entry 2055 (class 2606 OID 16964)
-- Name: usuario_perfil usuario_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_pkey PRIMARY KEY (id);


--
-- TOC entry 2053 (class 2606 OID 16950)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_e);


--
-- TOC entry 2046 (class 1259 OID 16898)
-- Name: entidad_cod_e_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entidad_cod_e_index ON public.entidad USING btree (cod_e);


--
-- TOC entry 2051 (class 1259 OID 16956)
-- Name: usuario_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_email_index ON public.usuario USING btree (correo);


--
-- TOC entry 2056 (class 2606 OID 16893)
-- Name: entidad entidad_tipo_e_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entidad
    ADD CONSTRAINT entidad_tipo_e_foreign FOREIGN KEY (tipo_e) REFERENCES public.tipo_entidad(id);


--
-- TOC entry 2057 (class 2606 OID 16951)
-- Name: usuario usuario_id_e_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_e_foreign FOREIGN KEY (id_e) REFERENCES public.entidad(id);


--
-- TOC entry 2058 (class 2606 OID 16965)
-- Name: usuario_perfil usuario_perfil_id_e_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_id_e_foreign FOREIGN KEY (id_e) REFERENCES public.usuario(id_e);


--
-- TOC entry 2059 (class 2606 OID 16970)
-- Name: usuario_perfil usuario_perfil_id_perfil_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_id_perfil_foreign FOREIGN KEY (id_perfil) REFERENCES public.perfil(id);


-- Completed on 2018-09-28 04:02:28 WEST

--
-- PostgreSQL database dump complete
--

