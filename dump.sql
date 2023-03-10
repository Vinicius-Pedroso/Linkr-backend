--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    url text NOT NULL,
    title text NOT NULL,
    image text NOT NULL,
    description text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: public.hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."public.hashtags" (
    id integer NOT NULL,
    name text NOT NULL,
    post_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT '2023-03-08 15:54:17.94159'::timestamp without time zone NOT NULL
);


--
-- Name: public.hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."public.hashtags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public.hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."public.hashtags_id_seq" OWNED BY public."public.hashtags".id;


--
-- Name: public.likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."public.likes" (
    id integer NOT NULL,
    "like" boolean DEFAULT false NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL
);


--
-- Name: public.likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."public.likes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public.likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."public.likes_id_seq" OWNED BY public."public.likes".id;


--
-- Name: public.post; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."public.post" (
    id integer NOT NULL,
    url_post text NOT NULL,
    comment character varying(255),
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT '2023-03-08 15:54:18.108288'::timestamp without time zone NOT NULL
);


--
-- Name: public.post_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."public.post_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public.post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."public.post_id_seq" OWNED BY public."public.post".id;


--
-- Name: public.sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."public.sessions" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token text NOT NULL,
    created_at timestamp without time zone DEFAULT '2023-03-10 20:05:23.110827'::timestamp without time zone NOT NULL
);


--
-- Name: public.sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."public.sessions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public.sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."public.sessions_id_seq" OWNED BY public."public.sessions".id;


--
-- Name: public.users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."public.users" (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(50) NOT NULL,
    username character varying(100) NOT NULL,
    picture_url text NOT NULL
);


--
-- Name: public.users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."public.users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public.users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."public.users_id_seq" OWNED BY public."public.users".id;


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: public.hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.hashtags" ALTER COLUMN id SET DEFAULT nextval('public."public.hashtags_id_seq"'::regclass);


--
-- Name: public.likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.likes" ALTER COLUMN id SET DEFAULT nextval('public."public.likes_id_seq"'::regclass);


--
-- Name: public.post id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.post" ALTER COLUMN id SET DEFAULT nextval('public."public.post_id_seq"'::regclass);


--
-- Name: public.sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.sessions" ALTER COLUMN id SET DEFAULT nextval('public."public.sessions_id_seq"'::regclass);


--
-- Name: public.users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.users" ALTER COLUMN id SET DEFAULT nextval('public."public.users_id_seq"'::regclass);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: public.hashtags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: public.likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: public.post; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: public.sessions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: public.users; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 1, false);


--
-- Name: public.hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."public.hashtags_id_seq"', 1, false);


--
-- Name: public.likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."public.likes_id_seq"', 1, false);


--
-- Name: public.post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."public.post_id_seq"', 1, false);


--
-- Name: public.sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."public.sessions_id_seq"', 1, false);


--
-- Name: public.users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."public.users_id_seq"', 1, false);


--
-- Name: public.hashtags hashtags_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.hashtags"
    ADD CONSTRAINT hashtags_pk PRIMARY KEY (id);


--
-- Name: public.likes likes_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.likes"
    ADD CONSTRAINT likes_pk PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: public.post post_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.post"
    ADD CONSTRAINT post_pk PRIMARY KEY (id);


--
-- Name: public.sessions public.sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.sessions"
    ADD CONSTRAINT "public.sessions_token_key" UNIQUE (token);


--
-- Name: public.users public.users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.users"
    ADD CONSTRAINT "public.users_email_key" UNIQUE (email);


--
-- Name: public.sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.sessions"
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: public.users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."public.users"
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

