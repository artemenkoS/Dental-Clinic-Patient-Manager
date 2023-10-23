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
    "authorId" integer,
    "doctorId" integer,
    "visitDate" character varying(255),
    changes json
);


ALTER TABLE public.history OWNER TO postgres;

--
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.history_id_seq OWNER TO postgres;

--
-- Name: history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_id_seq OWNED BY public.history.id;


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
    "visitDate" timestamp without time zone,
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
-- Name: history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history ALTER COLUMN id SET DEFAULT nextval('public.history_id_seq'::regclass);


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

COPY public.history (id, "authorId", "doctorId", "visitDate", changes) FROM stdin;
1	7	4	2023-10-24 08:00	{"doctorId":4,"authorId":7,"visitDate":"2023-10-24 08:00","patientId":21,"procedureId":2}
2	7	8	2023-10-24 12:00	{"doctorId":8,"authorId":7,"visitDate":"2023-10-24 12:00","patientId":9,"procedureId":2}
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
35	aaa	aaa	aaa
36	Антон	Еее	1222
37	Сергей	Нуртас	23331223
38	Testest	test	+7701117021
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
624	2023-10-22 07:00:00	8	29	2	5
634	2023-10-22 08:30:00	7	29	2	7
635	2023-10-22 12:00:00	8	29	2	7
636	2023-10-22 12:30:00	7	29	1	7
642	2023-10-22 11:00:00	7	9	1	7
643	2023-10-22 08:00:00	8	17	3	7
644	2023-10-22 09:30:00	8	10	2	7
645	2023-10-22 08:00:00	10	10	3	7
647	2023-10-22 06:30:00	7	29	2	7
648	2023-10-22 13:00:00	7	29	1	7
649	2023-10-22 12:30:00	10	16	1	7
650	2023-10-22 05:30:00	7	29	2	7
652	2023-10-22 10:30:00	8	29	1	7
626	2023-10-22 07:30:00	10	8	3	7
627	2023-10-22 07:00:00	7	8	2	7
625	2023-10-22 08:30:00	8	8	1	7
630	2023-10-22 07:30:00	4	29	2	7
653	2023-10-22 09:00:00	7	29	3	3
646	2023-10-22 07:30:00	8	10	2	3
631	2023-10-22 07:30:00	7	29	2	7
654	2023-10-22 12:00:00	7	24	1	7
628	2023-10-22 10:30:00	7	29	1	7
641	2023-10-22 13:30:00	8	29	2	7
656	2023-10-23 10:00:00	10	29	1	7
655	2023-10-23 08:00:00	7	29	2	7
658	2023-10-23 09:30:00	7	8	1	7
659	2023-10-23 09:30:00	8	26	1	7
618	2023-10-24 08:00:00	4	21	2	7
660	2023-10-24 12:00:00	8	9	2	7
\.


--
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_id_seq', 2, true);


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patient_id_seq', 38, true);


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

SELECT pg_catalog.setval('public.visit_id_seq', 660, true);


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
-- Name: fki_visit_author_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_visit_author_fkey ON public.visit USING btree ("authorId");


--
-- Name: history history_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT "history_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public.users(id);


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

