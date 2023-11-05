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
    changes json,
    status character varying(255),
    "visitDate" timestamp without time zone,
    "createdAt" timestamp without time zone
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

COPY public.history (id, "authorId", "doctorId", changes, status, "visitDate", "createdAt") FROM stdin;
96	3	10	\N	delete	2023-10-27 10:30:46.519	2023-10-27 15:11:14.319
97	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-27T07:00:00.000Z","patientId":8,"procedureId":1}	edit	2023-10-27 07:00:00	2023-10-27 15:11:46.583
98	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-27T08:00:00.000Z","patientId":8,"procedureId":1}	edit	2023-10-27 08:00:00	2023-10-27 15:11:49.293
99	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-27T12:00:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-27 12:00:00	2023-10-27 15:11:51.834
100	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-27T13:00:00.000Z","patientId":8,"procedureId":1}	edit	2023-10-27 13:00:00	2023-10-27 15:11:54.416
101	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-27T13:30:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-27 13:30:00	2023-10-27 15:11:56.73
102	3	7	\N	delete	2023-10-27 13:30:00	2023-10-27 15:11:58.389
103	3	10	{"doctorId":10,"authorId":3,"visitDate":"2023-10-27T09:30:43.321Z","patientId":29,"procedureId":1}	create	2023-10-27 09:30:43.321	2023-10-27 15:12:06.562
104	3	10	{"doctorId":10,"authorId":3,"visitDate":"2023-10-27T07:00:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-27 07:00:00	2023-10-27 15:13:04.453
105	3	7	\N	delete	2023-10-27 10:30:15.395	2023-10-27 15:13:05.815
106	3	10	\N	delete	2023-10-27 07:00:00	2023-10-27 15:13:07.152
107	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-27T13:30:01.106Z","patientId":29,"procedureId":1}	create	2023-10-27 13:30:01.106	2023-10-27 15:13:13.734
108	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-27T07:00:12.999Z","patientId":12,"procedureId":2}	create	2023-10-27 07:00:12.999	2023-10-27 15:13:21.754
109	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-27T12:00:20.944Z","patientId":26,"procedureId":3}	create	2023-10-27 12:00:20.944	2023-10-27 15:13:39.99
110	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-27T10:30:39.327Z","patientId":10,"procedureId":2}	create	2023-10-27 10:30:39.327	2023-10-27 15:13:51.769
111	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-27T10:00:00.000Z","patientId":29,"procedureId":3}	edit	2023-10-27 10:00:00	2023-10-27 15:13:55.632
112	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-27T10:00:00.000Z","patientId":8,"procedureId":1}	edit	2023-10-27 10:00:00	2023-10-27 15:21:53.745
113	5	8	{"doctorId":8,"authorId":5,"visitDate":"2023-10-11T09:30:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-11 09:30:00	2023-10-27 15:22:10.174
114	5	11	{"doctorId":11,"authorId":5,"visitDate":"2023-10-27T07:30:04.345Z","patientId":29,"procedureId":1}	create	2023-10-27 07:30:04.345	2023-10-27 15:22:17.908
115	5	11	\N	delete	2023-10-27 07:30:04.345	2023-10-27 15:22:20.162
116	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-27T09:30:00.000Z","patientId":29,"procedureId":3}	edit	2023-10-27 09:30:00	2023-10-27 15:46:23.25
117	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-27T11:00:00.000Z","patientId":29,"procedureId":3}	edit	2023-10-27 11:00:00	2023-10-27 15:46:27.388
118	5	7	\N	delete	2023-10-27 11:00:00	2023-10-27 15:46:29.631
119	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-27T05:30:06.610Z","patientId":29,"procedureId":1}	create	2023-10-27 05:30:06.61	2023-10-27 15:47:16.288
120	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-27T09:30:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-27 09:30:00	2023-10-27 15:47:20.527
121	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-28T09:30:32.848Z","patientId":29,"procedureId":1}	create	2023-10-28 09:30:32.848	2023-10-27 20:21:13.816
122	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-28T07:00:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-28 07:00:00	2023-10-27 20:21:17.217
123	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-12T07:00:00.000Z","patientId":30,"procedureId":1}	create	2023-10-12 07:00:00	2023-10-27 20:22:25.944
124	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-28T10:00:24.913Z","patientId":25,"procedureId":2}	create	2023-10-28 10:00:24.913	2023-10-27 20:22:36.01
125	5	10	{"doctorId":10,"authorId":5,"visitDate":"2023-10-28T12:30:35.374Z","patientId":14,"procedureId":2}	create	2023-10-28 12:30:35.374	2023-10-27 20:22:48.89
126	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-28T09:30:00.000Z","patientId":25,"procedureId":2}	edit	2023-10-28 09:30:00	2023-10-27 20:22:53.262
127	5	8	{"doctorId":8,"authorId":5,"visitDate":"2023-10-28T07:30:47.743Z","patientId":8,"procedureId":2}	create	2023-10-28 07:30:47.743	2023-10-27 20:23:08.903
128	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-28T08:00:54.304Z","patientId":29,"procedureId":1}	create	2023-10-28 08:00:54.304	2023-10-27 20:39:05.159
129	7	7	\N	delete	2023-10-28 08:00:54.304	2023-10-27 20:39:07.569
130	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-28T07:30:00.000Z","patientId":14,"procedureId":2}	edit	2023-10-28 07:30:00	2023-10-28 13:25:12.058
131	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-28T09:30:00.000Z","patientId":14,"procedureId":2}	edit	2023-10-28 09:30:00	2023-10-28 13:25:27.371
132	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-28T04:30:00.000Z","patientId":25,"procedureId":2}	edit	2023-10-28 04:30:00	2023-10-28 13:25:38.117
133	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-28T08:00:00.000Z","patientId":25,"procedureId":2}	edit	2023-10-28 08:00:00	2023-10-28 13:25:41.822
134	3	8	\N	delete	2023-10-28 09:30:00	2023-10-28 13:25:43.485
135	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-28T07:30:48.990Z","patientId":8,"procedureId":2}	create	2023-10-28 07:30:48.99	2023-10-28 13:31:00.819
136	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-28T04:30:00.000Z","patientId":8,"procedureId":2}	edit	2023-10-28 04:30:00	2023-10-28 13:31:04.215
137	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-28T10:30:00.000Z","patientId":8,"procedureId":2}	edit	2023-10-28 10:30:00	2023-10-28 13:31:52.916
138	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-28T07:30:00.000Z","patientId":8,"procedureId":2}	edit	2023-10-28 07:30:00	2023-10-28 13:35:13.821
139	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-28T07:00:32.290Z","patientId":29,"procedureId":2}	create	2023-10-28 07:00:32.29	2023-10-28 13:35:41.89
140	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-28T04:30:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-28 04:30:00	2023-10-28 13:42:51.709
141	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-28T09:30:40.749Z","patientId":46,"procedureId":2}	create	2023-10-28 09:30:40.749	2023-10-28 13:44:01.072
142	7	7	\N	delete	2023-10-28 09:30:40.749	2023-10-28 13:44:03.19
143	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-28T07:00:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-28 07:00:00	2023-10-28 13:44:05.691
144	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-28T12:00:17.878Z","patientId":47,"procedureId":1}	create	2023-10-28 12:00:17.878	2023-10-28 13:44:30.527
145	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-28T10:00:34.762Z","patientId":47,"procedureId":1}	create	2023-10-28 10:00:34.762	2023-10-28 13:44:44.557
146	7	7	\N	delete	2023-10-28 12:00:17.878	2023-10-28 13:44:46.35
147	5	8	{"doctorId":8,"authorId":5,"visitDate":"2023-10-28T13:30:26.884Z","patientId":46,"procedureId":1}	create	2023-10-28 13:30:26.884	2023-10-28 13:53:31.53
148	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-28T04:30:00.000Z","patientId":25,"procedureId":2}	edit	2023-10-28 04:30:00	2023-10-28 14:03:06.403
149	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-28T12:30:02.962Z","patientId":29,"procedureId":2}	create	2023-10-28 12:30:02.962	2023-10-28 14:03:14.092
150	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-28T08:00:13.137Z","patientId":29,"procedureId":2}	create	2023-10-28 08:00:13.137	2023-10-28 14:03:21.07
151	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-28T12:00:00.000Z","patientId":25,"procedureId":2}	edit	2023-10-28 12:00:00	2023-10-28 14:03:23.951
152	3	8	\N	delete	2023-10-28 10:30:00	2023-10-28 14:03:26.068
153	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-28T12:30:20.281Z","patientId":46,"procedureId":1}	create	2023-10-28 12:30:20.281	2023-10-28 14:04:30.739
154	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-22T09:30:00.000Z","patientId":29,"procedureId":1}	create	2023-10-22 09:30:00	2023-10-29 12:37:37.111
155	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-29T07:30:36.348Z","patientId":46,"procedureId":2}	create	2023-10-29 07:30:36.348	2023-10-29 12:37:47.062
156	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-29T07:00:55.251Z","patientId":29,"procedureId":2}	create	2023-10-29 07:00:55.251	2023-10-29 12:38:06.882
157	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-29T10:30:15.381Z","patientId":29,"procedureId":3}	create	2023-10-29 10:30:15.381	2023-10-29 12:38:24.583
158	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-29T10:00:40.704Z","patientId":8,"procedureId":2}	create	2023-10-29 10:00:40.704	2023-10-29 12:39:03.441
159	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-29T12:30:00.000Z","patientId":46,"procedureId":2}	create	2023-10-29 12:30:00	2023-10-29 12:40:19.72
160	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-29T11:00:18.585Z","patientId":29,"procedureId":3}	create	2023-10-29 11:00:18.585	2023-10-29 12:40:28.48
161	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-29T09:30:30.135Z","patientId":29,"procedureId":1}	create	2023-10-29 09:30:30.135	2023-10-29 12:46:38.678
162	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-29T05:30:37.803Z","patientId":29,"procedureId":3}	create	2023-10-29 05:30:37.803	2023-10-29 12:46:48.695
163	3	10	{"doctorId":10,"authorId":3,"visitDate":"2023-10-29T12:00:47.825Z","patientId":29,"procedureId":1}	create	2023-10-29 12:00:47.825	2023-10-29 12:46:56.272
164	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-29T12:00:55.336Z","patientId":29,"procedureId":1}	create	2023-10-29 12:00:55.336	2023-10-29 12:47:05.38
165	7	7	\N	delete	2023-10-29 07:30:36.348	2023-10-29 12:50:05.456
166	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-29T12:00:00.000Z","patientId":29,"procedureId":3}	edit	2023-10-29 12:00:00	2023-10-29 12:51:04.55
167	10	10	{"doctorId":10,"authorId":10,"visitDate":"2023-10-29T04:30:18.468Z","patientId":29,"procedureId":2}	create	2023-10-29 04:30:18.468	2023-10-29 12:51:29.249
168	10	10	{"doctorId":10,"authorId":10,"visitDate":"2023-10-29T10:00:28.304Z","patientId":29,"procedureId":2}	create	2023-10-29 10:00:28.304	2023-10-29 12:51:38.286
169	10	10	{"doctorId":10,"authorId":10,"visitDate":"2023-10-29T08:00:39.004Z","patientId":29,"procedureId":1}	create	2023-10-29 08:00:39.004	2023-10-29 12:51:48.581
170	10	10	{"doctorId":10,"authorId":10,"visitDate":"2023-10-29T10:30:48.897Z","patientId":46,"procedureId":1}	create	2023-10-29 10:30:48.897	2023-10-29 12:53:58.618
171	3	10	\N	delete	2023-10-29 04:30:18.468	2023-10-29 12:54:12.782
172	3	10	\N	delete	2023-10-29 10:00:28.304	2023-10-29 12:54:14.678
173	3	10	\N	delete	2023-10-29 08:00:39.004	2023-10-29 12:54:16.346
174	3	10	\N	delete	2023-10-29 10:30:48.897	2023-10-29 12:54:18.443
175	3	7	\N	delete	2023-10-29 12:00:00	2023-10-29 12:54:20.368
176	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-29T08:00:26.486Z","patientId":46,"procedureId":2}	create	2023-10-29 08:00:26.486	2023-10-29 12:55:35.043
177	7	7	\N	delete	2023-10-29 08:00:26.486	2023-10-29 12:55:38.022
178	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-29T04:30:00.000Z","patientId":46,"procedureId":2}	edit	2023-10-29 04:30:00	2023-10-29 12:59:00.065
179	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-29T09:30:00.000Z","patientId":8,"procedureId":2}	edit	2023-10-29 09:30:00	2023-10-29 12:59:11.959
180	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-29T12:00:00.000Z","patientId":8,"procedureId":1}	edit	2023-10-29 12:00:00	2023-10-29 12:59:16.137
181	10	10	{"doctorId":10,"authorId":10,"visitDate":"2023-10-29T10:00:55.054Z","patientId":46,"procedureId":1}	create	2023-10-29 10:00:55.054	2023-10-29 13:06:06.972
182	10	10	{"doctorId":10,"authorId":10,"visitDate":"2023-10-29T07:00:00.000Z","patientId":46,"procedureId":1}	edit	2023-10-29 07:00:00	2023-10-29 13:06:13.52
183	10	10	\N	delete	2023-10-29 07:00:00	2023-10-29 13:06:15.007
184	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-29T07:00:00.000Z","patientId":8,"procedureId":1}	edit	2023-10-29 07:00:00	2023-10-29 13:31:51.618
185	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-29T10:00:00.000Z","patientId":8,"procedureId":3}	edit	2023-10-29 10:00:00	2023-10-29 13:31:58.438
186	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-29T10:00:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-29 10:00:00	2023-10-29 13:32:01.956
187	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-29T09:30:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-29 09:30:00	2023-10-29 13:32:04.528
188	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-29T12:00:00.000Z","patientId":8,"procedureId":1}	edit	2023-10-29 12:00:00	2023-10-29 13:32:07.414
189	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-29T05:00:00.000Z","patientId":29,"procedureId":2}	edit	2023-10-29 05:00:00	2023-10-29 14:26:44.312
190	7	7	\N	delete	2023-10-29 05:00:00	2023-10-29 14:26:47.478
191	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-03T07:00:00.000Z","patientId":29,"procedureId":2}	create	2023-10-03 07:00:00	2023-10-30 09:55:48.141
192	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-30T09:30:41.478Z","patientId":29,"procedureId":2}	create	2023-10-30 09:30:41.478	2023-10-30 10:01:51.606
193	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-30T10:00:31.719Z","patientId":8,"procedureId":2}	create	2023-10-30 10:00:31.719	2023-10-30 11:07:42.461
194	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-30T07:00:28.140Z","patientId":29,"procedureId":2}	create	2023-10-30 07:00:28.14	2023-10-30 11:21:39.076
195	3	10	{"doctorId":10,"authorId":3,"visitDate":"2023-10-30T10:00:38.176Z","patientId":29,"procedureId":2}	create	2023-10-30 10:00:38.176	2023-10-30 11:21:48.377
196	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-30T12:00:52.315Z","patientId":29,"procedureId":2}	create	2023-10-30 12:00:52.315	2023-10-30 11:33:01.965
197	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-30T09:30:00.000Z","patientId":8,"procedureId":2}	edit	2023-10-30 09:30:00	2023-10-30 11:35:52.117
198	3	8	\N	delete	2023-10-30 09:30:41.478	2023-10-30 11:37:56.096
199	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-30T04:30:20.461Z","patientId":29,"procedureId":1}	create	2023-10-30 04:30:20.461	2023-10-30 11:38:29.575
200	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-30T07:30:34.424Z","patientId":29,"procedureId":1}	create	2023-10-30 07:30:34.424	2023-10-30 11:40:43.977
201	7	7	\N	delete	2023-10-30 07:30:34.424	2023-10-30 11:40:48.484
202	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-30T05:00:49.783Z","patientId":29,"procedureId":1}	create	2023-10-30 05:00:49.783	2023-10-30 11:41:00.192
203	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-30T08:00:45.645Z","patientId":29,"procedureId":2}	create	2023-10-30 08:00:45.645	2023-10-30 12:18:06.368
204	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-30T10:30:00.000Z","patientId":8,"procedureId":2}	edit	2023-10-30 10:30:00	2023-10-30 12:50:09.373
205	3	10	\N	delete	2023-10-30 10:00:38.176	2023-10-30 12:50:31.802
206	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-30T04:30:54.904Z","patientId":46,"procedureId":2}	create	2023-10-30 04:30:54.904	2023-10-30 12:54:48.433
207	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-30T07:00:47.264Z","patientId":29,"procedureId":2}	create	2023-10-30 07:00:47.264	2023-10-30 12:54:58.032
208	3	10	{"doctorId":10,"authorId":3,"visitDate":"2023-10-30T07:00:57.403Z","patientId":29,"procedureId":2}	create	2023-10-30 07:00:57.403	2023-10-30 12:55:07.844
209	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-11T09:30:00.000Z","patientId":29,"procedureId":3}	create	2023-10-11 09:30:00	2023-10-30 12:55:19.853
210	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-30T12:00:00.000Z","patientId":45,"procedureId":2}	edit	2023-10-30 12:00:00	2023-10-30 13:01:32.457
211	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-30T12:30:00.000Z","patientId":10,"procedureId":2}	edit	2023-10-30 12:30:00	2023-10-30 13:03:23.639
212	5	8	{"doctorId":8,"authorId":5,"visitDate":"2023-10-30T09:30:05.863Z","patientId":46,"procedureId":1}	create	2023-10-30 09:30:05.863	2023-10-30 13:15:42.498
213	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-30T12:00:40.007Z","patientId":17,"procedureId":1}	create	2023-10-30 12:00:40.007	2023-10-30 13:15:59.199
214	5	8	{"doctorId":8,"authorId":5,"visitDate":"2023-10-30T07:30:07.965Z","patientId":34,"procedureId":1}	create	2023-10-30 07:30:07.965	2023-10-30 13:23:32.024
215	5	8	{"doctorId":8,"authorId":5,"visitDate":"2023-10-30T10:00:05.435Z","patientId":30,"procedureId":3}	create	2023-10-30 10:00:05.435	2023-10-30 14:29:17.61
216	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-31T09:30:05.435Z","patientId":17,"procedureId":1}	create	2023-10-31 09:30:05.435	2023-10-30 14:29:34.47
217	5	11	{"doctorId":11,"authorId":5,"visitDate":"2023-10-31T07:30:05.435Z","patientId":30,"procedureId":2}	create	2023-10-31 07:30:05.435	2023-10-30 14:29:45.941
218	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-31T09:30:27.297Z","patientId":29,"procedureId":1}	create	2023-10-31 09:30:27.297	2023-10-31 11:43:35.687
219	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-31T04:30:27.297Z","patientId":29,"procedureId":1}	create	2023-10-31 04:30:27.297	2023-10-31 11:43:43.84
220	5	10	{"doctorId":10,"authorId":5,"visitDate":"2023-10-31T07:30:27.297Z","patientId":29,"procedureId":2}	create	2023-10-31 07:30:27.297	2023-10-31 11:43:53.533
221	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-31T12:00:27.297Z","patientId":29,"procedureId":2}	create	2023-10-31 12:00:27.297	2023-10-31 11:44:02.346
222	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-31T10:30:27.297Z","patientId":29,"procedureId":1}	create	2023-10-31 10:30:27.297	2023-10-31 11:44:10.545
223	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-31T10:00:27.297Z","patientId":17,"procedureId":1}	create	2023-10-31 10:00:27.297	2023-10-31 11:44:18.895
224	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-31T07:30:27.297Z","patientId":29,"procedureId":1}	create	2023-10-31 07:30:27.297	2023-10-31 11:44:31.252
225	5	10	{"doctorId":10,"authorId":5,"visitDate":"2023-10-31T10:00:27.297Z","patientId":8,"procedureId":1}	create	2023-10-31 10:00:27.297	2023-10-31 11:44:41.741
226	5	8	{"doctorId":8,"authorId":5,"visitDate":"2023-10-31T09:30:27.297Z","patientId":29,"procedureId":1}	create	2023-10-31 09:30:27.297	2023-10-31 11:44:57.158
227	5	8	\N	delete	2023-10-24 04:30:00	2023-11-01 11:35:56.203
228	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-11-02T09:30:20.476Z","patientId":46,"procedureId":2}	create	2023-11-02 09:30:20.476	2023-11-02 18:27:22.884
229	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-11-02T12:00:20.476Z","patientId":46,"procedureId":2}	create	2023-11-02 12:00:20.476	2023-11-02 18:27:31.345
230	7	7	\N	delete	2023-11-02 09:30:20.476	2023-11-02 18:27:37.145
231	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-02T10:00:00.000Z","patientId":29,"procedureId":3}	create	2023-11-02 10:00:00	2023-11-02 18:45:20.102
232	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-30T10:00:00.000Z","patientId":29,"procedureId":2}	edit	2023-10-30 10:00:00	2023-11-02 18:53:31.698
233	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-22T04:30:00.000Z","patientId":29,"procedureId":2}	edit	2023-10-22 04:30:00	2023-11-02 22:05:22.056
234	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-22T10:00:00.000Z","patientId":29,"procedureId":2}	edit	2023-10-22 10:00:00	2023-11-02 22:05:25.769
235	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-31T12:30:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-31 12:30:00	2023-11-02 22:06:58.649
236	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-31T13:00:00.000Z","patientId":29,"procedureId":2}	edit	2023-10-31 13:00:00	2023-11-02 22:07:03.265
237	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-31T08:00:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-31 08:00:00	2023-11-02 22:07:09.659
238	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-31T05:00:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-31 05:00:00	2023-11-02 22:07:18.33
239	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-30T13:30:00.000Z","patientId":30,"procedureId":3}	edit	2023-10-30 13:30:00	2023-11-02 22:09:58.512
240	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-30T12:00:00.000Z","patientId":30,"procedureId":1}	edit	2023-10-30 12:00:00	2023-11-02 22:10:10.201
241	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-30T12:30:00.000Z","patientId":46,"procedureId":1}	edit	2023-10-30 12:30:00	2023-11-02 22:10:14.771
242	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-30T13:30:00.000Z","patientId":30,"procedureId":2}	edit	2023-10-30 13:30:00	2023-11-02 22:11:01.836
243	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-03T13:00:30.290Z","patientId":8,"procedureId":1}	create	2023-11-03 13:00:30.29	2023-11-02 22:11:48.815
244	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-03T13:30:00.000Z","patientId":8,"procedureId":1}	edit	2023-11-03 13:30:00	2023-11-02 22:12:21.534
245	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-31T13:30:00.000Z","patientId":8,"procedureId":1}	edit	2023-10-31 13:30:00	2023-11-02 22:12:31.265
246	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-03T13:30:35.694Z","patientId":29,"procedureId":2}	create	2023-11-03 13:30:35.694	2023-11-02 22:12:49.306
247	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-03T13:00:35.694Z","patientId":8,"procedureId":1}	create	2023-11-03 13:00:35.694	2023-11-02 22:13:01.372
248	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-03T13:00:35.694Z","patientId":29,"procedureId":3}	create	2023-11-03 13:00:35.694	2023-11-02 22:13:12.224
249	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-11-03T13:00:17.282Z","patientId":29,"procedureId":3}	create	2023-11-03 13:00:17.282	2023-11-02 22:13:31.642
250	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-11-01T13:00:17.282Z","patientId":29,"procedureId":1}	create	2023-11-01 13:00:17.282	2023-11-02 22:14:03.276
251	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-01T13:30:17.282Z","patientId":29,"procedureId":2}	create	2023-11-01 13:30:17.282	2023-11-02 22:14:24.76
252	3	10	{"doctorId":10,"authorId":3,"visitDate":"2023-11-03T13:30:29.909Z","patientId":29,"procedureId":1}	create	2023-11-03 13:30:29.909	2023-11-02 22:14:42.526
253	3	4	\N	delete	2023-11-03 13:00:17.282	2023-11-02 22:15:08.171
254	3	7	\N	delete	2023-11-03 13:00:35.694	2023-11-02 22:15:09.765
255	3	7	\N	delete	2023-11-03 13:30:35.694	2023-11-02 22:15:12.027
256	3	8	\N	delete	2023-11-03 13:00:35.694	2023-11-02 22:15:14.973
257	3	8	\N	delete	2023-11-03 13:30:00	2023-11-02 22:15:16.573
258	3	10	\N	delete	2023-11-03 13:30:29.909	2023-11-02 22:15:18.34
259	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-04T13:30:29.909Z","patientId":29,"procedureId":2}	create	2023-11-04 13:30:29.909	2023-11-02 22:15:33.748
260	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-04T13:00:29.909Z","patientId":29,"procedureId":2}	create	2023-11-04 13:00:29.909	2023-11-02 22:15:58.707
261	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-04T04:30:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-04 04:30:00	2023-11-02 22:17:25.722
262	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-04T13:30:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-04 13:30:00	2023-11-02 22:17:28.541
263	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-03T10:00:16.867Z","patientId":29,"procedureId":2}	create	2023-11-03 10:00:16.867	2023-11-02 22:17:38.177
264	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-03T12:00:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-03 12:00:00	2023-11-02 22:17:41.126
265	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-03T13:00:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-03 13:00:00	2023-11-02 22:18:52.679
266	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-31T04:30:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-31 04:30:00	2023-11-02 22:19:16.851
267	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-04T08:00:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-04 08:00:00	2023-11-02 22:20:09.056
268	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-29T07:00:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-29 07:00:00	2023-11-02 22:54:56.149
269	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-29T13:00:00.000Z","patientId":29,"procedureId":3}	edit	2023-10-29 13:00:00	2023-11-02 22:54:59.485
270	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-29T13:30:00.000Z","patientId":8,"procedureId":2}	edit	2023-10-29 13:30:00	2023-11-02 22:55:02.198
271	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-30T09:30:00.000Z","patientId":8,"procedureId":2}	edit	2023-10-30 09:30:00	2023-11-02 22:55:07.868
272	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-10-25T08:00:03.149Z","patientId":26,"procedureId":3}	create	2023-10-25 08:00:03.149	2023-11-02 23:04:03.643
273	5	10	{"doctorId":10,"authorId":5,"visitDate":"2023-10-25T09:30:03.149Z","patientId":43,"procedureId":2}	create	2023-10-25 09:30:03.149	2023-11-02 23:04:25.111
274	5	10	{"doctorId":10,"authorId":5,"visitDate":"2023-10-25T10:00:00.000Z","patientId":43,"procedureId":2}	edit	2023-10-25 10:00:00	2023-11-02 23:04:28.184
275	5	10	{"doctorId":10,"authorId":5,"visitDate":"2023-10-25T13:00:00.000Z","patientId":43,"procedureId":2}	edit	2023-10-25 13:00:00	2023-11-02 23:04:30.664
276	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-31T10:00:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-31 10:00:00	2023-11-02 23:12:22.519
277	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-30T13:00:00.000Z","patientId":29,"procedureId":2}	edit	2023-10-30 13:00:00	2023-11-02 23:12:55.117
278	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-30T13:00:00.000Z","patientId":10,"procedureId":1}	edit	2023-10-30 13:00:00	2023-11-02 23:13:03.78
279	5	7	{"doctorId":7,"authorId":5,"visitDate":"2023-10-30T13:30:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-30 13:30:00	2023-11-02 23:13:07.942
280	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-31T04:30:00.000Z","patientId":10,"procedureId":1}	edit	2023-10-31 04:30:00	2023-11-02 23:13:17.25
281	5	8	{"doctorId":8,"authorId":5,"visitDate":"2023-11-01T12:00:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-01 12:00:00	2023-11-02 23:13:24.659
282	5	8	{"doctorId":8,"authorId":5,"visitDate":"2023-11-01T04:30:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-01 04:30:00	2023-11-02 23:13:27.245
283	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-29T13:30:00.000Z","patientId":29,"procedureId":3}	edit	2023-10-29 13:30:00	2023-11-02 23:13:39.202
284	5	4	{"doctorId":4,"authorId":5,"visitDate":"2023-10-31T13:00:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-31 13:00:00	2023-11-02 23:13:51.693
285	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-01T13:30:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-01 13:30:00	2023-11-02 23:14:27.499
286	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-31T13:30:00.000Z","patientId":29,"procedureId":2}	edit	2023-10-31 13:30:00	2023-11-02 23:14:33.493
287	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-10-30T13:00:00.000Z","patientId":29,"procedureId":1}	edit	2023-10-30 13:00:00	2023-11-02 23:14:38.602
288	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-24T13:30:19.677Z","patientId":29,"procedureId":1}	create	2023-10-24 13:30:19.677	2023-11-02 23:14:57.44
289	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-31T04:30:55.195Z","patientId":29,"procedureId":3}	create	2023-10-31 04:30:55.195	2023-11-02 23:19:23.873
290	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-31T05:00:55.195Z","patientId":29,"procedureId":2}	create	2023-10-31 05:00:55.195	2023-11-02 23:19:32.853
291	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-31T05:30:55.195Z","patientId":46,"procedureId":2}	create	2023-10-31 05:30:55.195	2023-11-02 23:19:44.553
292	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-31T07:00:55.195Z","patientId":29,"procedureId":1}	create	2023-10-31 07:00:55.195	2023-11-02 23:20:00.902
293	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-31T06:00:55.195Z","patientId":46,"procedureId":2}	create	2023-10-31 06:00:55.195	2023-11-02 23:20:26.51
294	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-31T06:30:55.195Z","patientId":29,"procedureId":1}	create	2023-10-31 06:30:55.195	2023-11-02 23:20:42.637
295	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-31T07:30:55.195Z","patientId":29,"procedureId":1}	create	2023-10-31 07:30:55.195	2023-11-02 23:23:55.825
296	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-30T05:00:59.253Z","patientId":46,"procedureId":1}	create	2023-10-30 05:00:59.253	2023-11-02 23:24:13.791
297	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-29T04:30:59.253Z","patientId":29,"procedureId":1}	create	2023-10-29 04:30:59.253	2023-11-02 23:24:31.04
298	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-29T04:30:59.253Z","patientId":29,"procedureId":1}	create	2023-10-29 04:30:59.253	2023-11-02 23:24:43.541
299	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-29T07:30:59.253Z","patientId":29,"procedureId":1}	create	2023-10-29 07:30:59.253	2023-11-02 23:24:54.406
300	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-29T05:00:59.253Z","patientId":29,"procedureId":2}	create	2023-10-29 05:00:59.253	2023-11-02 23:25:01.984
301	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-29T04:30:15.586Z","patientId":29,"procedureId":3}	create	2023-10-29 04:30:15.586	2023-11-02 23:25:32.947
302	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-29T10:00:15.586Z","patientId":29,"procedureId":1}	create	2023-10-29 10:00:15.586	2023-11-02 23:25:44.344
303	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-10-29T05:30:15.586Z","patientId":29,"procedureId":2}	create	2023-10-29 05:30:15.586	2023-11-02 23:25:53.302
304	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-31T09:30:11.400Z","patientId":29,"procedureId":1}	create	2023-10-31 09:30:11.4	2023-11-02 23:26:28.936
305	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-31T08:00:11.400Z","patientId":29,"procedureId":2}	create	2023-10-31 08:00:11.4	2023-11-02 23:26:40.124
306	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-31T05:00:57.525Z","patientId":29,"procedureId":2}	create	2023-10-31 05:00:57.525	2023-11-02 23:27:26.309
307	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-31T05:30:57.525Z","patientId":29,"procedureId":1}	create	2023-10-31 05:30:57.525	2023-11-02 23:27:43.747
308	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-31T06:00:57.525Z","patientId":29,"procedureId":1}	create	2023-10-31 06:00:57.525	2023-11-02 23:27:59.965
309	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-31T06:30:57.525Z","patientId":29,"procedureId":2}	create	2023-10-31 06:30:57.525	2023-11-02 23:28:22.31
310	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-11-03T07:00:36.532Z","patientId":29,"procedureId":2}	create	2023-11-03 07:00:36.532	2023-11-02 23:30:55.412
311	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-11-03T04:30:36.532Z","patientId":29,"procedureId":1}	create	2023-11-03 04:30:36.532	2023-11-02 23:31:11.176
312	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-11-03T13:30:36.532Z","patientId":29,"procedureId":2}	create	2023-11-03 13:30:36.532	2023-11-02 23:31:30.771
313	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-11-03T04:30:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-03 04:30:00	2023-11-02 23:32:11.645
314	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-01T13:00:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-01 13:00:00	2023-11-02 23:32:28.086
315	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-01T13:30:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-01 13:30:00	2023-11-02 23:32:32.196
316	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-01T07:30:00.000Z","patientId":29,"procedureId":2}	edit	2023-11-01 07:30:00	2023-11-02 23:32:35.085
317	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-22T04:30:00.822Z","patientId":46,"procedureId":2}	create	2023-10-22 04:30:00.822	2023-11-02 23:35:35.057
318	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-22T05:00:00.822Z","patientId":29,"procedureId":2}	create	2023-10-22 05:00:00.822	2023-11-02 23:35:45.401
319	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-22T05:30:00.822Z","patientId":29,"procedureId":2}	create	2023-10-22 05:30:00.822	2023-11-02 23:36:11.571
320	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-22T06:00:00.822Z","patientId":29,"procedureId":2}	create	2023-10-22 06:00:00.822	2023-11-02 23:36:22.825
321	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-22T06:30:00.822Z","patientId":29,"procedureId":1}	create	2023-10-22 06:30:00.822	2023-11-02 23:36:31.107
322	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-22T07:00:00.822Z","patientId":29,"procedureId":1}	create	2023-10-22 07:00:00.822	2023-11-02 23:36:42.953
323	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-10-22T04:30:00.822Z","patientId":29,"procedureId":2}	create	2023-10-22 04:30:00.822	2023-11-02 23:37:02.474
324	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-31T08:30:00.842Z","patientId":29,"procedureId":2}	create	2023-10-31 08:30:00.842	2023-11-02 23:45:06.659
325	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-10-31T13:00:00.842Z","patientId":29,"procedureId":2}	create	2023-10-31 13:00:00.842	2023-11-02 23:48:58.234
326	3	8	\N	delete	2023-10-31 09:30:27.297	2023-11-04 02:01:37.074
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
39	test	test	+77055491890
40	Сергей	Нуртас	+77055493454
41	yyyy	yyyy	yyyy
42	ааа	ааа	ааа
43	Сергей	Алибеков	1222
44	Сергей	Касымов	2333
45	Сережа	Сережа	+77055493454
46	nnnn	nnnn	nnnn
47	111	111	111
48	Сергей	Сережа	+7 962 904 63 54
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
697	2023-10-28 13:30:26.884	8	46	1	5
688	2023-10-28 04:30:00	7	25	2	3
699	2023-10-28 08:00:13.137	7	29	2	3
698	2023-10-28 12:00:00	7	25	2	3
624	2023-10-22 07:00:00	8	29	2	5
700	2023-10-28 12:30:20.281	8	46	1	3
701	2023-10-22 09:30:00	7	29	1	7
703	2023-10-29 07:00:55.251	7	29	2	7
634	2023-10-22 08:30:00	7	29	2	7
635	2023-10-22 12:00:00	8	29	2	7
636	2023-10-22 12:30:00	7	29	1	7
710	2023-10-29 12:00:47.825	10	29	1	3
642	2023-10-22 11:00:00	7	9	1	7
643	2023-10-22 08:00:00	8	17	3	7
644	2023-10-22 09:30:00	8	10	2	7
645	2023-10-22 08:00:00	10	10	3	7
648	2023-10-22 13:00:00	7	29	1	7
649	2023-10-22 12:30:00	10	16	1	7
735	2023-10-30 13:30:00	8	30	3	3
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
681	2023-10-27 07:00:12.999	4	12	2	3
785	2023-11-03 07:00:36.532	4	29	2	3
683	2023-10-27 10:30:39.327	8	10	2	3
677	2023-10-27 10:00:00	8	8	1	3
680	2023-10-11 09:30:00	8	29	1	5
727	2023-10-30 13:30:00	4	30	2	3
685	2023-10-27 09:30:00	4	29	1	5
786	2023-11-03 04:30:36.532	4	29	1	3
709	2023-10-29 13:30:00	4	29	3	5
708	2023-10-29 12:00:00	8	8	1	3
687	2023-10-12 07:00:00	4	30	1	5
743	2023-10-31 13:30:00	4	8	1	3
718	2023-10-03 07:00:00	7	29	2	3
724	2023-10-30 04:30:20.461	8	29	1	3
618	2023-10-24 08:30:00	4	21	2	7
721	2023-10-30 10:30:00	7	8	2	3
728	2023-10-30 04:30:54.904	11	46	2	3
729	2023-10-30 07:00:47.264	8	29	2	3
692	2023-10-28 07:30:00	7	8	2	3
693	2023-10-28 07:00:32.29	4	29	2	5
667	2023-10-25 12:00:00	7	29	1	7
670	2023-10-25 10:30:00	7	29	2	7
671	2023-10-25 07:30:29.474	7	41	2	7
730	2023-10-30 07:00:57.403	10	29	2	3
731	2023-10-11 09:30:00	11	29	3	3
686	2023-10-28 07:00:00	7	29	1	7
696	2023-10-28 10:00:34.762	7	47	1	7
738	2023-10-31 13:00:00	4	29	1	5
733	2023-10-30 12:00:40.007	7	17	1	5
672	2023-10-26 09:30:00	7	42	1	3
734	2023-10-30 07:30:07.965	8	34	1	5
736	2023-10-31 09:30:05.435	7	17	1	5
737	2023-10-31 07:30:05.435	11	30	2	5
740	2023-10-31 07:30:27.297	10	29	2	5
745	2023-10-31 10:00:27.297	10	8	1	5
748	2023-11-02 12:00:20.476	7	46	2	7
749	2023-11-02 10:00:00	7	29	3	3
647	2023-10-22 04:30:00	7	29	2	3
650	2023-10-22 10:00:00	7	29	2	3
741	2023-10-31 13:30:00	7	29	2	3
739	2023-10-31 05:00:00	7	29	1	3
755	2023-11-01 13:00:17.282	11	29	1	3
759	2023-11-04 13:00:29.909	8	29	2	3
732	2023-10-30 13:00:00	8	29	1	3
758	2023-11-04 13:30:00	8	29	2	3
763	2023-10-24 13:30:19.677	7	29	1	3
764	2023-10-31 04:30:55.195	11	29	3	3
742	2023-10-31 04:30:00	7	29	1	3
760	2023-11-04 08:00:00	8	29	2	3
711	2023-10-29 07:00:00	11	29	1	3
707	2023-10-29 13:00:00	7	29	3	3
705	2023-10-29 13:30:00	7	8	2	3
720	2023-10-30 09:30:00	7	8	2	3
761	2023-10-25 08:00:03.149	7	26	3	7
765	2023-10-31 05:00:55.195	11	29	2	3
762	2023-10-25 13:00:00	10	43	2	5
723	2023-10-30 13:00:00	4	29	2	5
726	2023-10-30 13:30:00	7	29	1	5
744	2023-10-31 04:30:00	4	10	1	5
766	2023-10-31 05:30:55.195	11	46	2	3
767	2023-10-31 07:00:55.195	11	29	1	3
768	2023-10-31 06:00:55.195	11	46	2	3
769	2023-10-31 06:30:55.195	11	29	1	3
770	2023-10-31 07:30:55.195	7	29	1	3
771	2023-10-30 05:00:59.253	11	46	1	3
772	2023-10-29 04:30:59.253	7	29	1	3
773	2023-10-29 04:30:59.253	11	29	1	3
774	2023-10-29 07:30:59.253	11	29	1	3
775	2023-10-29 05:00:59.253	7	29	2	3
776	2023-10-29 04:30:15.586	4	29	3	3
777	2023-10-29 10:00:15.586	11	29	1	3
778	2023-10-29 05:30:15.586	7	29	2	3
779	2023-10-31 09:30:11.4	11	29	1	3
780	2023-10-31 08:00:11.4	11	29	2	3
781	2023-10-31 05:00:57.525	4	29	2	3
782	2023-10-31 05:30:57.525	4	29	1	3
783	2023-10-31 06:00:57.525	4	29	1	3
784	2023-10-31 06:30:57.525	4	29	2	3
787	2023-11-03 04:30:00	11	29	2	3
756	2023-11-01 07:30:00	8	29	2	3
790	2023-10-22 05:30:00.822	11	29	2	3
788	2023-10-22 04:30:00.822	11	46	2	3
789	2023-10-22 05:00:00.822	11	29	2	3
791	2023-10-22 06:00:00.822	11	29	2	3
792	2023-10-22 06:30:00.822	11	29	1	3
793	2023-10-22 07:00:00.822	11	29	1	3
794	2023-10-22 04:30:00.822	4	29	2	3
795	2023-10-31 08:30:00.842	11	29	2	3
796	2023-10-31 13:00:00.842	11	29	2	3
\.


--
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_id_seq', 326, true);


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patient_id_seq', 48, true);


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

SELECT pg_catalog.setval('public.visit_id_seq', 796, true);


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

