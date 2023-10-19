--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history (
    id integer NOT NULL,
    author integer,
    "visitDate" timestamp with time zone,
    changes json,
    "doctorId" integer
);


ALTER TABLE public.history OWNER TO postgres;

--
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient (
    id integer NOT NULL,
    name character varying(255),
    surname character varying(255),
    phone character varying(255)
);


ALTER TABLE public.patient OWNER TO postgres;

--
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patient_id_seq OWNER TO postgres;

--
-- Name: patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patient_id_seq OWNED BY public.patient.id;


--
-- Name: procedure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.procedure (
    id integer NOT NULL,
    procedure character varying(255)
);


ALTER TABLE public.procedure OWNER TO postgres;

--
-- Name: procedure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.procedure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.procedure_id_seq OWNER TO postgres;

--
-- Name: procedure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.procedure_id_seq OWNED BY public.procedure.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    role character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    surname character varying(255),
    login character varying(255),
    password character varying(255),
    role integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: visit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visit (
    id integer NOT NULL,
    "visitDate" timestamp with time zone,
    "doctorId" integer,
    "patientId" integer,
    "procedureId" integer,
    "authorId" integer
);


ALTER TABLE public.visit OWNER TO postgres;

--
-- Name: visit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visit_id_seq OWNER TO postgres;

--
-- Name: visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visit_id_seq OWNED BY public.visit.id;


--
-- Name: patient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient ALTER COLUMN id SET DEFAULT nextval('public.patient_id_seq'::regclass);


--
-- Name: procedure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.procedure ALTER COLUMN id SET DEFAULT nextval('public.procedure_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit ALTER COLUMN id SET DEFAULT nextval('public.visit_id_seq'::regclass);


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history (id, author, "visitDate", changes, "doctorId") FROM stdin;
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient (id, name, surname, phone) FROM stdin;
1	Serezha	Artemenko	+77055493454
2	Sergei	Artemenko	+77055493454
3	Anton	Artemenko	+77055493454
4	Erzhan	Artemenko	+77055493454
5	Nursultan	Artemenko	+77055493454
6	Dosym	Artemenko	+77055493454
7	Alibek	Dosaev	+77055425454
8	Сережа	Артеменко	+77055493454
9	Серикбол	Артеменко	+777362728
10	Сакен	Сейфуллин\n	+77086872268
11	Тестовый	Пациент	+!!!!!!1!
12	Иван	Иванов	+777732832
13	Петя	Петькин	+77712321
14	Ельдос	Касымов	+77721830
15	Алибек	Алибеков	8888121893
16	Кайрат	Нуртас	+77325874634
17	Нурсултан	Антонов	+7 962 904 63 54
18	Тест	Тест	+77086993671
19	Петя	Петин	+777882912
20	Иванов	Иван	+770554323
21	Сергей Артеменко	Артеменко	+77055493454
22	Роза	Петрова	+77055493454
23	Алибек	Алибеков	1222
24	Ельдос	Досаев	+777717828123
25	Сергей	Ыф	ыф
26	Сергей	Алибеков	77055493454
27	Хан	Шатыр	+776545708
28	Ййй	ЙЙЙ	+7705549499
29	ттттт	ттттт	ттттт
30	Антон	Сидоров	+77255499827
31	Сергей	Сергей	+++++++
32	Гриша	Сыркин	+77055493439
33	Чингиз	Чингизов	+8832299329
34	Игнат	Стрелец	+87773204421
\.


--
-- Data for Name: procedure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.procedure (id, procedure) FROM stdin;
1	Чистка
2	Лечение
3	Удаление
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, role) FROM stdin;
1	administrator
2	doctor
3	admin
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, surname, login, password, role) FROM stdin;
2	\N	\N	amin	$2b$05$A1WCYoJAfMthPEBMzvCC9uivfaZrLGCOA2v0mdQDsVTMQOwL7p1bu	3
3	Admin	Admin	admin	$2b$05$7zIZoDlvLGF53Sx5PIO3uOvZlFiZtLAPYFwn73CEh.dGOScRyF7qG	3
6	Amin	Odin	admin_1	$2b$05$dsGuFukC/ModqyL9iirrcOJKxWWwdIKCAaDKgD96btLzbE2j8OXza	1
4	Doctor	Сорокин	doctor	$2b$05$oS5sYG7pA4etJQbBOeAK5.B5kLpuRhZlqhO0ec3C0NlswY5kKUfnu	2
5	administrator	Бокейханов	administrator	$2b$05$jnKyIXc9M4GflLjnuStwLuvr.5Uuk/RMtpk8mpkKKqB5kYR4easUq	1
7	doc	Иванов	doc	$2b$05$xFp/Q/1F7tG0TD1tp46gIO0LxGdYimBZRkIJxgmUQcddJpDmwpvj2	2
8	doc	Букейханов	doc2	$2b$05$9nbdHocBy0M8nmN0etwWmup3zOM3f7FIqPcHUUvEt1Sb62MQ3BlzW	2
10	do3c	Сыркин	doc3	$2b$05$yL2aPwefkYtKyMbJZySp9uzSbiwq3YP/E0sd/S8gy9eIImkinpMXa	2
11	Doctor	\N	doc54	$2b$05$a7G8YOA/POMFLY6vvoq/vetzx8kKtuhTCYMnxb8n18C8AEtlcSwLm	2
\.


--
-- Data for Name: visit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visit (id, "visitDate", "doctorId", "patientId", "procedureId", "authorId") FROM stdin;
562	2023-10-18 17:00:00+05	8	25	3	7
564	2023-10-18 13:30:00+05	8	30	3	7
561	2023-10-18 18:00:00+05	7	34	2	3
563	2023-10-18 13:30:00+05	7	23	1	7
556	2023-10-18 14:30:00+05	8	26	1	7
565	2023-10-19 14:30:00+05	8	29	2	3
567	2023-10-19 18:00:00+05	7	29	2	3
\.


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patient_id_seq', 34, true);


--
-- Name: procedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.procedure_id_seq', 3, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visit_id_seq', 567, true);


--
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: procedure procedure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.procedure
    ADD CONSTRAINT procedure_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visit visit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_pkey PRIMARY KEY (id);


--
-- Name: fki_c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_c ON public.visit USING btree ("procedureId");


--
-- Name: fki_f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_f ON public.history USING btree ("visitDate");


--
-- Name: fki_history_author_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_history_author_fkey ON public.history USING btree (author);


--
-- Name: fki_visit_author_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_visit_author_fkey ON public.visit USING btree ("authorId");


--
-- Name: history history_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_author_fkey FOREIGN KEY (author) REFERENCES public.users(id) NOT VALID;


--
-- Name: users users_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);


--
-- Name: visit visit_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_author_fkey FOREIGN KEY ("authorId") REFERENCES public.users(id) NOT VALID;


--
-- Name: visit visit_doctorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT "visit_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES public.users(id);


--
-- Name: visit visit_patientId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT "visit_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES public.patient(id);


--
-- Name: visit visit_procedure_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_procedure_fkey FOREIGN KEY ("procedureId") REFERENCES public.procedure(id) MATCH FULL NOT VALID;


--
-- PostgreSQL database dump complete
--

