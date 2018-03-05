--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: nickodelacruz
--

CREATE TABLE projects (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE projects OWNER TO nickodelacruz;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: nickodelacruz
--

CREATE SEQUENCE project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project_id_seq OWNER TO nickodelacruz;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nickodelacruz
--

ALTER SEQUENCE project_id_seq OWNED BY projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: nickodelacruz
--

CREATE TABLE volunteers (
    id integer NOT NULL,
    name character varying,
    project_id integer
);


ALTER TABLE volunteers OWNER TO nickodelacruz;

--
-- Name: volunteer_id_seq; Type: SEQUENCE; Schema: public; Owner: nickodelacruz
--

CREATE SEQUENCE volunteer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE volunteer_id_seq OWNER TO nickodelacruz;

--
-- Name: volunteer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nickodelacruz
--

ALTER SEQUENCE volunteer_id_seq OWNED BY volunteers.id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: nickodelacruz
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('project_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: nickodelacruz
--

ALTER TABLE ONLY volunteers ALTER COLUMN id SET DEFAULT nextval('volunteer_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: nickodelacruz
--

COPY projects (id, title) FROM stdin;
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: nickodelacruz
--

COPY volunteers (id, name, project_id) FROM stdin;
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nickodelacruz
--

SELECT pg_catalog.setval('project_id_seq', 295, true);


--
-- Name: volunteer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nickodelacruz
--

SELECT pg_catalog.setval('volunteer_id_seq', 203, true);


--
-- Name: projects project_pkey; Type: CONSTRAINT; Schema: public; Owner: nickodelacruz
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteer_pkey; Type: CONSTRAINT; Schema: public; Owner: nickodelacruz
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT volunteer_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

