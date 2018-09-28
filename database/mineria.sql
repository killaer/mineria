--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

-- Started on 2018-09-28 13:53:55 -04

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
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 190 (class 1259 OID 16957)
-- Name: entidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entidad (
    id integer NOT NULL,
    tipo_e integer NOT NULL,
    cod_e character varying(255) NOT NULL,
    activo_e boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.entidad OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16955)
-- Name: entidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entidad_id_seq OWNER TO postgres;

--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 189
-- Name: entidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entidad_id_seq OWNED BY public.entidad.id;


--
-- TOC entry 186 (class 1259 OID 16924)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16922)
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
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 185
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 192 (class 1259 OID 16972)
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16970)
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
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 191
-- Name: perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perfil_id_seq OWNED BY public.perfil.id;


--
-- TOC entry 188 (class 1259 OID 16949)
-- Name: tipo_entidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_entidad (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.tipo_entidad OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16947)
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
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 187
-- Name: tipo_entidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_entidad_id_seq OWNED BY public.tipo_entidad.id;


--
-- TOC entry 193 (class 1259 OID 16978)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_e integer NOT NULL,
    correo character varying(255) NOT NULL,
    password character varying(64) NOT NULL,
    username character varying(255) NOT NULL,
    active boolean DEFAULT false NOT NULL,
    remember_token character varying(60)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16999)
-- Name: usuario_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_perfil (
    id integer NOT NULL,
    id_e integer NOT NULL,
    id_perfil integer NOT NULL
);


ALTER TABLE public.usuario_perfil OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16997)
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
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 194
-- Name: usuario_perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_perfil_id_seq OWNED BY public.usuario_perfil.id;


--
-- TOC entry 2036 (class 2604 OID 16960)
-- Name: entidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entidad ALTER COLUMN id SET DEFAULT nextval('public.entidad_id_seq'::regclass);


--
-- TOC entry 2034 (class 2604 OID 16927)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 16975)
-- Name: perfil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil ALTER COLUMN id SET DEFAULT nextval('public.perfil_id_seq'::regclass);


--
-- TOC entry 2035 (class 2604 OID 16952)
-- Name: tipo_entidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_entidad ALTER COLUMN id SET DEFAULT nextval('public.tipo_entidad_id_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 17002)
-- Name: usuario_perfil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil ALTER COLUMN id SET DEFAULT nextval('public.usuario_perfil_id_seq'::regclass);


--
-- TOC entry 2185 (class 0 OID 16957)
-- Dependencies: 190
-- Data for Name: entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.entidad (id, tipo_e, cod_e, activo_e, created_at, updated_at) VALUES (1, 2, 'USUARIO_1', true, '2018-09-28 15:11:47', '2018-09-28 15:11:47');


--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 189
-- Name: entidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entidad_id_seq', 1, true);


--
-- TOC entry 2181 (class 0 OID 16924)
-- Dependencies: 186
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations (id, migration, batch) VALUES (1, '2018_09_27_230552_create_entidad_schema', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (2, '2018_09_27_230559_create_usuario_schema', 1);


--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 185
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 2, true);


--
-- TOC entry 2187 (class 0 OID 16972)
-- Dependencies: 192
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perfil (id, descripcion) VALUES (1, 'administrador');
INSERT INTO public.perfil (id, descripcion) VALUES (2, 'tecnico');
INSERT INTO public.perfil (id, descripcion) VALUES (3, 'propietario');


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 191
-- Name: perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perfil_id_seq', 1, false);


--
-- TOC entry 2183 (class 0 OID 16949)
-- Dependencies: 188
-- Data for Name: tipo_entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_entidad (id, descripcion) VALUES (1, 'maquina');
INSERT INTO public.tipo_entidad (id, descripcion) VALUES (2, 'locacion');
INSERT INTO public.tipo_entidad (id, descripcion) VALUES (3, 'usuario');


--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 187
-- Name: tipo_entidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_entidad_id_seq', 1, false);


--
-- TOC entry 2188 (class 0 OID 16978)
-- Dependencies: 193
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario (id_e, correo, password, username, active, remember_token) VALUES (1, 'snavarro169@gmail.com', '$2y$10$5rv7PziUsyNYNmaDZkcQnudWMAMUfeB.13beL4QKIgaHoYAfaF6U.', 'emroy', false, '08TsXMkzBonqCaXVDZJ87tnjguCQ5BT5Q5xmDXwuqtBE8nChyLT8YfOp7Hf0');


--
-- TOC entry 2190 (class 0 OID 16999)
-- Dependencies: 195
-- Data for Name: usuario_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 194
-- Name: usuario_perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_perfil_id_seq', 1, false);


--
-- TOC entry 2047 (class 2606 OID 16963)
-- Name: entidad entidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entidad
    ADD CONSTRAINT entidad_pkey PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 16929)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2049 (class 2606 OID 16977)
-- Name: perfil perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id);


--
-- TOC entry 2044 (class 2606 OID 16954)
-- Name: tipo_entidad tipo_entidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_entidad
    ADD CONSTRAINT tipo_entidad_pkey PRIMARY KEY (id);


--
-- TOC entry 2052 (class 2606 OID 16993)
-- Name: usuario usuario_id_e_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_e_unique UNIQUE (id_e);


--
-- TOC entry 2058 (class 2606 OID 17004)
-- Name: usuario_perfil usuario_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_pkey PRIMARY KEY (id);


--
-- TOC entry 2054 (class 2606 OID 16986)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_e);


--
-- TOC entry 2056 (class 2606 OID 16996)
-- Name: usuario usuario_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_username_unique UNIQUE (username);


--
-- TOC entry 2045 (class 1259 OID 16969)
-- Name: entidad_cod_e_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entidad_cod_e_index ON public.entidad USING btree (cod_e);


--
-- TOC entry 2050 (class 1259 OID 16994)
-- Name: usuario_correo_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_correo_index ON public.usuario USING btree (correo);


--
-- TOC entry 2059 (class 2606 OID 16964)
-- Name: entidad entidad_tipo_e_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entidad
    ADD CONSTRAINT entidad_tipo_e_foreign FOREIGN KEY (tipo_e) REFERENCES public.tipo_entidad(id);


--
-- TOC entry 2060 (class 2606 OID 16987)
-- Name: usuario usuario_id_e_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_e_foreign FOREIGN KEY (id_e) REFERENCES public.entidad(id);


--
-- TOC entry 2061 (class 2606 OID 17005)
-- Name: usuario_perfil usuario_perfil_id_e_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_id_e_foreign FOREIGN KEY (id_e) REFERENCES public.usuario(id_e);


--
-- TOC entry 2062 (class 2606 OID 17010)
-- Name: usuario_perfil usuario_perfil_id_perfil_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_id_perfil_foreign FOREIGN KEY (id_perfil) REFERENCES public.perfil(id);


-- Completed on 2018-09-28 13:53:56 -04

--
-- PostgreSQL database dump complete
--

