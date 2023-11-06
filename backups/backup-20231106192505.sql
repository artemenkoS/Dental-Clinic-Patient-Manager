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
    surname character varying(255),
    name character varying(255),
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
352	3	7	\N	delete	2023-11-05 10:00:00.569	2023-11-05 18:08:02.026
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
356	3	7	\N	delete	2023-11-05 10:00:00.829	2023-11-06 13:08:30.597
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
359	3	11	\N	delete	2023-11-05 10:30:00.377	2023-11-06 13:13:33.86
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
327	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T09:30:00.910Z","patientId":1717,"procedureId":2}	create	2023-11-05 09:30:00.91	2023-11-05 15:40:04.471
328	3	10	{"doctorId":10,"authorId":3,"visitDate":"2023-11-05T09:30:00.910Z","patientId":1933,"procedureId":1}	create	2023-11-05 09:30:00.91	2023-11-05 15:40:33.469
329	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T10:00:00.910Z","patientId":24,"procedureId":2}	create	2023-11-05 10:00:00.91	2023-11-05 15:41:02.389
330	3	7	\N	delete	2023-11-05 10:00:00.91	2023-11-05 15:41:05.03
331	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-04T10:00:00.910Z","patientId":1788,"procedureId":2}	create	2023-11-04 10:00:00.91	2023-11-05 15:49:16.6
332	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-11-05T10:00:00.327Z","patientId":786,"procedureId":1}	create	2023-11-05 10:00:00.327	2023-11-05 15:50:20.895
333	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-05T10:00:00.327Z","patientId":185,"procedureId":2}	create	2023-11-05 10:00:00.327	2023-11-05 15:50:34.534
334	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T10:00:00.000Z","patientId":2714,"procedureId":2}	edit	2023-11-05 10:00:00	2023-11-05 15:53:08.554
335	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-05T12:30:00.712Z","patientId":4546,"procedureId":2}	create	2023-11-05 12:30:00.712	2023-11-05 15:53:20.06
336	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T12:00:00.712Z","patientId":3921,"procedureId":2}	create	2023-11-05 12:00:00.712	2023-11-05 15:56:51.824
337	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T07:00:00.480Z","patientId":828,"procedureId":3}	create	2023-11-05 07:00:00.48	2023-11-05 16:10:14.386
338	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T07:00:00.480Z","patientId":3586,"procedureId":1}	create	2023-11-05 07:00:00.48	2023-11-05 16:10:28.637
339	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T10:00:00.927Z","patientId":1937,"procedureId":2}	create	2023-11-05 10:00:00.927	2023-11-05 16:12:56.371
340	3	10	{"doctorId":10,"authorId":3,"visitDate":"2023-11-05T07:30:00.732Z","patientId":828,"procedureId":2}	create	2023-11-05 07:30:00.732	2023-11-05 16:15:41.353
341	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T07:00:00.732Z","patientId":1717,"procedureId":1}	create	2023-11-05 07:00:00.732	2023-11-05 16:15:56.474
342	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T08:00:00.000Z","patientId":435,"procedureId":1}	create	2023-11-05 08:00:00	2023-11-05 16:16:09.403
343	3	10	{"doctorId":10,"authorId":3,"visitDate":"2023-11-05T10:00:00.732Z","patientId":1192,"procedureId":1}	create	2023-11-05 10:00:00.732	2023-11-05 16:16:22.317
344	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-05T07:30:00.732Z","patientId":2432,"procedureId":2}	create	2023-11-05 07:30:00.732	2023-11-05 16:16:40.571
345	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T09:30:00.732Z","patientId":4652,"procedureId":1}	create	2023-11-05 09:30:00.732	2023-11-05 16:16:55.935
346	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T07:30:00.569Z","patientId":768,"procedureId":2}	create	2023-11-05 07:30:00.569	2023-11-05 16:18:07.609
347	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-05T12:00:00.569Z","patientId":2071,"procedureId":2}	create	2023-11-05 12:00:00.569	2023-11-05 16:18:17.274
348	3	4	{"doctorId":4,"authorId":3,"visitDate":"2023-11-05T10:00:00.569Z","patientId":397,"procedureId":2}	create	2023-11-05 10:00:00.569	2023-11-05 16:18:29.09
349	3	7	{"doctorId":7,"authorId":3,"visitDate":"2023-11-05T10:00:00.569Z","patientId":3193,"procedureId":1}	create	2023-11-05 10:00:00.569	2023-11-05 16:18:37.944
350	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-05T10:30:00.481Z","patientId":2292,"procedureId":3}	create	2023-11-05 10:30:00.481	2023-11-05 16:24:14.407
351	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-11-05T10:00:00.829Z","patientId":232,"procedureId":2}	create	2023-11-05 10:00:00.829	2023-11-05 18:06:50.989
353	3	10	{"doctorId":10,"authorId":3,"visitDate":"2023-11-05T09:30:00.494Z","patientId":943,"procedureId":2}	create	2023-11-05 09:30:00.494	2023-11-05 18:22:01.509
354	3	10	{"doctorId":10,"authorId":3,"visitDate":"2023-11-06T10:00:00.233Z","patientId":875,"procedureId":1}	create	2023-11-06 10:00:00.233	2023-11-06 12:33:01.648
355	3	8	{"doctorId":8,"authorId":3,"visitDate":"2023-11-06T07:30:00.258Z","patientId":2432,"procedureId":1}	create	2023-11-06 07:30:00.258	2023-11-06 12:40:13.791
357	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-11-05T07:00:00.377Z","patientId":167,"procedureId":2}	create	2023-11-05 07:00:00.377	2023-11-06 13:12:37.25
358	3	11	{"doctorId":11,"authorId":3,"visitDate":"2023-11-05T10:30:00.377Z","patientId":129,"procedureId":2}	create	2023-11-05 10:30:00.377	2023-11-06 13:12:54.829
360	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-11-05T10:00:00.000Z","patientId":768,"procedureId":1}	edit	2023-11-05 10:00:00	2023-11-06 13:22:39.066
361	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-11-05T09:30:00.000Z","patientId":4652,"procedureId":1}	edit	2023-11-05 09:30:00	2023-11-06 13:22:47.994
362	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-11-05T10:00:00.000Z","patientId":768,"procedureId":1}	edit	2023-11-05 10:00:00	2023-11-06 13:22:51.401
363	7	7	{"doctorId":7,"authorId":7,"visitDate":"2023-11-06T12:30:00.312Z","patientId":3880,"procedureId":2}	create	2023-11-06 12:30:00.312	2023-11-06 13:28:58.57
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient (id, surname, name, phone) FROM stdin;
1190	Толстова	Людмила	+7-775-091-93-06
1417	Кушумова	Айжан	+7-701-580-82-30
1428	Байдаулетов	Бекбулат	+7-701-393-12-97
1191	Ордабаева	Сауле	+7-701-708-33-36
1192	Исентаева	Нурай  Нуржигитовна	+7-705-817-77-71
1430	Сундетов	Жанбулат	+7-702-695-12-06
1434	Ящанов	Рустем	8-707-330-17-87
1435	Жанаманов	Батыржан	+7-747-324-17-42
1828	Нигметов	Асет	+7-771-599-22-90
1831	Варфоломеева	Александра	8-747-733-88-34
1762	Токтабаев	Омирбой	+7-771-587-23-68
1842	Алиулов	Хабибулла	+7-701-169-14-13
2491	Петрова	Александра	8 747 404 97 44(олег)
3483	Аймагамбетов	Арыстан	542487
4065	Казгулов	Совет	+7-771-024-79-96
4239	Мамедова	Алина	8 775 880 61 60(мама Татьяна)
4321	Яфаров	Константин	96-71-00
1599	Оразова	Мадина	+7-778-411-78-78
1833	Альмухамбетов	Жанбулат	+7-701-778-35-47
1837	Абдулханова	Элла	+7-747-570-51-40
1841	Талдыкбаева	Гульфаризад	+7-705-539-92-92
2255	Балпиев	Раинбек	+7-775-061-66-69
2400	Алыбаев	Талгат	8-702-222-03-11
2403	Жолмурзаева	Анара	+7-701-728-91-51
2404	Попов	Николай	96 96 42 ,8 701 134 43 77
2407	Камашева	Гульмира	+7-702-343-80-64
2410	Шалабаев	Берик	+7-702-533-11-88
2413	Урдабаева	Шара	+7-708-771-81-79
2415	Чухарев	Илья	+7-701-559-43-43
2416	Шакирова	Инкар	+7-705-397-87-50
2417	Кульжанов	Ануар	+7-702-562-56-22
2421	Ермуханова	Лариса	+7-775-225-55-81
2487	Тынышбаев	Рустем	+7-705-983-69-25
2489	Елемесова	Айгерим	+7-705-475-37-12
2490	Шурова	Наталья	+7-777-612-00-23
2496	Хохлова	Людмила	+7-701-392-75-15
2497	Арекешев	Алибек	+7-705-381-90-07
2499	Каймульдинов	Ренат	+7-777-506-12-07
2986	Унаева	Анар	+7-705-183-95-51
2987	Абдрахманова	Сауле	+7-747-116-26-08
2991	Утемисова	Жанна	22-02-88
2992	Кервенбаева	Гульсум	+7-701-195-38-05
3484	Жумашева	Меруерт	+7-775-587-71-04
3489	Алдибаев	Жанибек	+7-747-213-86-77
3650	Сайтиева	Анна	+7-771-229-78-32
3652	Сатанова	Ольга	+7-705-987-88-78
3656	Анисимова	Любовь	+7-707-370-02-15
4069	Мергалиева	Лаура	+7-705-811-05-11
4073	Айбасов	Азамат	+7-702-147-89-71
4075	Ожерельев	Евгений	+7-778-265-54-90
4136	Куслеева	Валентина	+7-777-660-70-41
4137	Варфоломеева	Виктория	8-777-965-05-21
4138	Джалкибаев	Василий	518848
4139	Байсеркешова	Сакып	+7-702-889-90-66
4146	Логинова	Оксана	8-771-225-39-02,99-13-02
4155	Наурызбаева	Татьяна	+7-771-160-14-47
4156	Терликпаев	Мадияр	8-707-456 -91-77
4238	Джанбауов	Темирлан	+7-747-103-79-20
4240	Малюкова	Светлана	+7-705-543-17-37
4315	Дарбеков	Рашид	+7-707-730-11-68
4472	Алекулова	Томирис	+7-705-632-22-71
4473	Сулейманов	Камиль	+7-777-167-28-59
4477	Шелкунов	Сергей	+7-778-598-11-34
4479	Бурушева	Дана	+7-701-465-91-39
4533	Тлебалиев	Жасулан	+7-705-766-20-10
4535	Аленов	Мурат	+7-771-858-68-89
4538	Кервенбаев	Тасбулат	+7-771-185-16-14
4539	Таимов	Ернар	+7-707-883-80-65
4543	Сисенгалиева	Гульнур	+7-701-254-32-73
4545	Канатбаева	Гульжамал	+7-702-653-75-73
4547	Ажигалиева	Клара	8-705-480-73-68
4548	Калиев	Темирбек	+7-707-326-41-66
4551	Куваева	Крестина	+7-778-361-07-00
1351	Алиева	Нургуль	+7-700-550-30-55
1421	Кусаинова	Сания	988283
1422	Айекешова	Гульнур	+7-775-348-93-82
1426	Тлепова	Айсауле	+7-701-489-60-20
1427	Лесов	Жандарбек	+7-776-794-00-77
111	Кунасыл  Искендирова	Аязбаева	+7-705-480-07-32
53	Тогабергенова	Жанар  1985	8-747-846-12-31
63	Кулбаев	Асхат	8-777-112-73-73
64	Камиль	Шапиховч	+7-705-835-54-45
97	Абдраманова	Гульмираш	+7-702-866-67-57
121	Бекбусинова	Сабира	+7-708-407-94-11
126	Ильченко	Ольга	+7-702-632-11-67
160	Утегенов	Алмат	+7-705-288-42-54
167	Ена	Сергей	+7-701-566-48-99
182	Жакипова	Индира	+7-747-245-85-70
199	Омельченко	Александр	+7-747-445-47-01
200	Астаповская	Олеся	21-79-56
324	Мурзанбаева	Зайда	+7-702-349-47-84
219	Хамиуллина	Вера	21-71-40
250	Тажмагамбетов	Куаныш	+7-705-817-40-31
257	Абубакирова	Жанар	8-707-708-06-36
259	Ернияшов	Куанышкали	+7-707-801-45-00
265	Жиенбаев	Айбулат	+7-747-225-25-31
274	Камбар	Нурсауле	+7-708-852-86-90
317	Карина	Гульдана	8-777-039-75-85
328	Жекеева	Гулжанат	8-771-122-64-06
330	Ешкеева	Гульбану	+7-747-753-27-40
353	Светлана	Никитична	+7-702-528-80-26
354	Саркулова	Молдир	+7-702-630-68-88
365	Ингербаев	Булат	+7-705-494-22-02
393	Исбусинова	Нурсулу	+7-702-278-77-60
396	Усенбекова	Рамиза	+7-705-480-33-13
399	Нурболат	Мархабатови	+7-747-101-45-94
538	Сагимбаева	Инта	+7-705-278-79-57
579	Сагитжанова	Асыл	+7-747-321-07-78
414	Кан	Виктор	+7-747-324-32-25
418	Кенжетаева	Молдыр	24 72 66 \\\\ 8 705
424	Лучникова	Светлана	8-702-177-30-02
430	Ермуханбетова	Кулжамига	+7-771-160-19-68
431	Есмаханов	Асан	+7-707-797-58-72
436	Даулетяров	Самат	+7-705-480-83-34
444	Мадиулы	Рысбол	+7-775-645-56-56
447	Картикенов	Барлык	+7-701-728-58-25
456	Любаева	Надежда	+7-702-335-55-71
467	Кушкенова	Бахытгуль	+7-702-539-27-08
472	Карасаев	Багдат	8-747-333-56-59  8-778-586-54-24
473	Иноземцев	Никита	+7-701-606-97-58
475	Кудыма	Людмила	211792
478	Нагира	29.12.1959г	99-47-53
479	Жакбалиева	Жанат	+7-777-194-24-45
484	Панченко	Юрий	+7-702-155-88-95
491	Унгарбаева	Манар	8 775 208 92 58; 98 84 68
505	Отарбай	Гульмимра	981594
509	Жумабаева	Нурзиля	+7-705-630-71-61
531	Зеленцова	Елена	+7-702-345-34-36
565	Бекетова	Айнур	+7-777-928-87-86
566	Лерман	Юлия	+7-707-897-41-60
768	Серикова	Гульжан	+7-702-124-64-69
784	Жардемгалиева	Мерует	+7-705-772-78-35
595	Жолмуратов	Орынбай	+7-771-519-44-44
596	Асаров	Азимбай	211470
613	Фидорус	Татьяна	+7-777-342-77-00
627	Айсаутов	Ахметжан	975907
707	Нодиров	Уринбой	+7-771-784-13-88
730	Жуков	Виктор	968147
737	Ермекбаева	Аида	8 771 701 73 29  / 95 98 66
763	Жумажанова	Омуткен	8 701 503 2297/8 771 119 23 69
770	Левина	Татьяна	+7-701-179-01-92
778	Айсауле	Амандавлет	97-59-56
797	Шынбергенова	Жазира	+7-705-917-13-29
802	Айтуганова	Алтынай	+7-771-122-93-33
803	Имангазин	Амир	+7-778-303-49-48
811	Беркимбаева	Винера	+7-701-455-12-36
828	Уралбаева	Айгуль	8 702 40 777 90;  41 82 31
846	Крыштак	Алексей	969147
857	Киндикужина	Шолпан	8-707-174-10-10
859	Таникулов	Асет	+7-702-105-51-01
865	Жанаманов	Батыржан	+7-777-185-68-67
869	Алдамжарова	Ольга	+7-707-415-03-44
875	Исергишвили	Екатерина	8 701 125 05 69; 51 53 76
882	Александр	Алекс	+7-778-233-30-45
890	Емжарова	Каламкас	990872
926	Жандосова	Шолпан	+7-708-212-76-85
932	Мамбетрзаев	Мадияр	8-702-567-80-70
944	Медетов	Канат	+7-777-506-06-96
952	Сержекенов	Галимат	+7-776-752-66-77
961	Кармишина\r\nКармишина	Валентина	+7-707-880-62-53
963	Шекина	Актоты	+7-777-619-87-18
969	Мазеин	Николай	+7-705-819-37-09
970	Садыков	Тулибай	+7-777-800-03-96
988	Лиясова	Людмила	215355
1006	Тукешева	Умсым	8-702-252-63-16
1007	Карпенко	Галина	8-705-605-11-25
1009	Дуйсенбеков	Бекет	+7-702-378-60-09
1036	Жаналиев	Алмат	+7-775-424-46-40
1043	Зюзина	Тамара	+7-701-147-05-67
1056	Казкенова	Жазгуль	+7-701-140-11-01
1060	Жарков	Александр	+7-705-379-77-42
1076	Лазарева	Надежда	+7-700-308-39-30
1090	Дмитрук	Оксана  1977г	8-700-112-80-91
1103	Жанатанова	Кулитым	8-705-479-43-71
1111	Кильдибаев	Искандер	+7-747-362-48-21
1184	Садыкова	Лаура	+7-776-265-07-87
1217	Колейчук	Валентина	25-11-18
1230	Книсарина	Аня	98 85 20, 8 702 260 16 95
1292	Аманчина	Жумажан	+7-775-505-42-46
1297	Жанаткызы	Жанара	+7-705-750-05-28
1298	Алдияров	Байтак	+7-701-310-74-12
1311	Кудасбаев	Санат	+7-702-395-19-91
1331	Светлана	1975	8-701-659-24-54
1347	Сулейманова	Галия	+7-701-466-31-92
1409	Тлеуова	Маржан	42559
1431	Жолмагамбетова	Самал	+7-702-682-05-82
1392	Светлана	Ильиничнв	21-79-47
1408	Ариф	Набиоглы	+7-702-104-25-48
1466	Зобов	Николай	8-702-638-28-88
1475	Кушбаева	Томирис	+7-702-377-91-54
1500	Наталья	Ильинична	+7-777-362-75-03
1506	Койшыбайт	Айгул	+7-777-120-40-07
1537	Шилгибаев	Бекзат	+7-778-318-18-70
1543	Айтжанова	Дина	+7-702-497-30-00
1548	Жумашева	Гульнар	+7-775-880-22-64
1557	Каюпова	Алма	21-05-09; 8-701-461-19-32
1562	Кулманова	Сагира	8 707 170 02 18;   97 58 43
1601	Кенес	Макпал	8-777-242-78-10
1624	Попов	Александр	+7-705-126-20-60
1643	Жармаганбетова	Гулмира	+7-771-183-55-77
1651	Сагинаева	Салтанат  1991г	8-778-297-23-67
1658	Жетебаева	Дарига	+7-702-446-16-03
1677	Тайман	Толегали	252824
1741	Жолмурзаев	Еркебулан	8-702-986-44-26
1867	Кылышбекова	Лязат	+7-701-382-83-61
1773	Куандыкова	Шолпан    1975г	+7-778-270-55-63
1778	Денисенко	Андрей	+7-775-645-91-21
1791	Карабекова	Сулушаш	+7-705-750-69-50
1817	Кваша	Елена	+7-705-330-07-47
1832	Утекешева	Жанаргуль	8-771-126-00-22
1847	Имантаева	Сабина	+7-701-478-34-26
1873	Жуматаев	Куаныш	+7-702-259-57-09
1907	Казкенова	Марияш	+7-701-140-11-01
1915	Коростылев	Юрий	401079
1918	Шотанова	Умсындык	+7-701-615-17-45
1936	Зеленская	Алия	8-701-391-91-23
1937	Таухабаева	Айнагул	+7-777-803-10-63
2103	Нурмагамбетова	Айнур	+7-705-473-48-06
1960	Омар	1932	988374
1962	Карамулдинова	Зафия	+7-775-724-20-30
1968	Кибирева	Оксана	22-05-17    8-702-663-91-44
1979	Есбергенова	Гульнур  13.08..1991г	41-94-13   8-747-516-25-08
1989	Личковаха	Виталий	8-701-611-72-54
1992	Кольбеев	Руслан	51 94 52      8 707 151 08 98
1996	Султанова	Камшат	+7-707-855-08-16
2000	Байсарина	Талшын	+7-705-381-45-29
2008	Рысжан	Медалина	8 705 604 68 23     /41  97 33
2010	Шукатов	Асан	+7-701-884-64-20
2072	Сексенбаев	Алишер	8-705-547-96-77
2077	Фроловас	Прасковья	214854
2087	Кондратьев	Алексей	+7-747-218-53-76
2102	Костина	Татьяна	+7-707-556-65-98
2119	Жулдуз	Акан	40-42-42; 8-775-880-60-50
2151	Туткушбаева	Латифа	404036
2140	Ильченко	Ольга	8 702 632 11 67; 40 10 71
2159	Флек	Лаура	+7-777-803-05-69
2164	Айтжан	Октябрь	404505
2186	Иноземцева	Татьяна	+7-701-172-49-92
2197	Иманалина	Раиса	+7-701-914-30-14
2213	Есмахан	Алибек	+7-777-159-08-77
2219	Жаренова	Конслу	+7-701-297-81-77
2236	Сахатова	Светлана	+7-778-597-70-71
2240	Зеленцов	Александр	+7-702-345-34-36
2269	Жемсикуглин	Марат  1970	8-776-200-43-13
2273	Табышов	Канибек	+7-778-854-37-31
2299	Аманбаева	Гульжан	8-778-702-61-10
2398	Куандыкова	Айсулу	8 747 121 23 87;779 799
2313	Нысаналина	Жаннур	ул. Кунаева 1 / 7 / 46  ;  8 701 338 02 85
2322	Куанова	Индира	+7-771-149-97-56
2329	Шарипова	Аня	+7-702-285-56-00
2357	Магамадова	Роза	+7-701-686-32-17
2364	Габдуллина	Шолпан	77-95-35
2374	Каскырова	Молдыр	+7-702-945-44-13
2392	Боранова	Акболжан	+7-702-978-97-32
2393	Избасов	Мади	+7-702-800-00-70
2399	Жолгасбаева	Маржан	+7-747-299-76-40
2401	Плотников	Владимир	8-777-274-36-19
2436	Шектыбаева	Жанна	+7-702-214-88-50
2437	Джамбулова	Дарья	+7-702-310-28-51
2458	Макулова	Айнура	+7-701-444-15-00
2462	Тажмагамбетова	Раушан	+7-705-493-29-38
2463	Дышловая	Надежда	514806
2465	Шигабутдинова	Альфия	+7-702-645-71-17
2479	Жуматаева	Айманкуп	448829
2498	Кенжалина	Асель	+7-747-779-97-92
2568	Бакбергенова	Акмарал	+7-775-341-38-80
2537	Рахметова	Сауле	+7-701-341-95-51
2538	Муханбетова	Саржан	8 771 181 47 67 ;24 09 67
2570	Волкова	Юлия	+7-705-656-07-92
2578	Шарипова	Л.М	+7-747-545-44-06
2627	Байкенова	Гуляим  1963г	8-705-240-18-95
2649	Лещенко	Надежда	+7-701-481-54-22
2663	Фартудинова	Оксана	+7-747-303-66-90
2682	Уталин	Кайрат	+7-701-444-44-22
2685	Маиса	Камалкыза	+7-702-148-96-96
2720	Ильясов	Темирбек   1980г	8-702-118-90-80
2725	Уразгалиева	Замзегуль	+7-771-226-11-27
2754	Джанабергенова	Маржамай	+7-778-951-81-14
2737	Актайлаков	Айдос	+7-702-435-35-99
2756	Жиенбаева	Гульнара	8 701 370 21 70; 98 89 67
2769	Королева	Жанна	+7-777-928-03-90
2777	Нуртайкызы	Диана	+7-775-651-10-12
2778	Есенгулова	Жанна	8-771-792-97-80
2784	Кляйн	Алексей	+7-747-787-98-50
2804	Черепушкин	Александр	404439
2809	Саркулова	Молдир	+7-702-632-68-88
2825	Маккаун	Алина	+7-701-549-90-54
2840	Абдрашитов	Булат	+7-775-677-77-97
2842	Жолмурзаева	Асель	+7-775-575-23-25
2852	Досимова	Акумит	+7-701-525-89-51
2860	Бисенгалиева	Гульмира	8 775 691 02 07   96 95 34
2880	Кстауов	Берик	+7-701-650-69-66
2881	Кыдыров	Азамат	+7-702-277-57-88
2902	Нурадинова	Асель	40 00 45  / 8 778 644 52 98
2921	Жалелов	Азиз	8 708 407 95 25    21 04 89
2983	Аделханова	Салтанат	8 702 423 68 73; 99 24 15
2998	Андреева	Алина	8-747-634-10-37
3017	Султанбекова	Людмила	+7-777-928-05-61
3036	Жайнагуль  Тлеубергенова	Толепбергенова	+7-707-334-50-26
2945	Рузиева	Манзура	+7-777-405-50-19
2982	Айтжанов	Насыпкалий	+7-701-522-14-36
2995	Унгарова	Гулсая	+7-777-031-37-23
3023	Отарбай	Аскар	+7-771-844-12-71
3031	Сапарбаева	Зинара	+7-705-397-11-88
3033	Зульфия	Багиткалиевн	+7-775-253-24-37
3035	Намираев	Нуразис	+7-747-217-35-47
3043	Исаналина	Аккияш	919431
3055	Таджимуратова	Галя	+7-775-924-39-13
3062	Байбосинов	Асилбек	+7-775-590-74-92
3077	Ахметжанулы	Бейбарыс	40-13-61  8 747-783-30-98
3083	Кенжегарина	Света	+7-701-454-42-52
3092	Есаева	Динара	+7-707-340-47-01
3105	Садырадинов	Ибраимхан	+7-705-310-20-67
3120	Уркунов	Куандык	+7-702-105-32-91
3124	Нука	Галина	8-707-052-21-17
3129	Баженова	Елена	2615771
3135	Лидия	Витальена	+7-707-372-93-04
3136	Коновалова	Кристина	+7-771-122-07-21
3142	Блимов	Абилхаир	404350
3200	Байминов	Муратбек	8-775-725-84-32
3201	Ибатуллин	Дарын	+7-776-763-87-91
3206	Тулепбаев	Шафхат	+7-707-666-90-07
3252	Калдина	Гулжамал	+7-705-161-27-53
3255	Кистаубаева	Айжан	+7-778-270-40-34
3263	Зотов	Вениамин	22-03-08
3266	Тараканов	Дмитрий	+7-708-920-59-48
3275	Кужбанова	Гульнар	+7-702-488-32-12
3276	Смакулова	Жайнагул	8-778-776-15-59
3292	Нарынбаева	Базаргуль	8-701-123-65-98
3351	Тулепбергенова	Баян	+7-702-282-25-49
3309	Муравьева	Ольга	8-701-384-33-08
3314	Курницкая	Татьяна	+7-771-122-78-70
3324	Багиля	Шамшина	+7-705-835-58-75
3328	Ержанова	Алтын  К.	+7-705-382-37-53
3336	Койшина	Ардак	+7-701-513-86-37
3348	Жумаликова	Набия	+7-701-450-37-18
3356	Алиулов	Хабибулла	+7-701-169-14-13
3360	Кальбеев	Руслан	+7-707-151-08-98
3361	Диярова	Динара	+7-771-108-65-69
3366	Касенова	Айсулу	+7-707-448-73-13
3373	Оралбаева	Эльмира	8-777-800-32-76
3378	Тлеулина	Фарида  12.12.1968	21-33-09   8-771-842-53-03
3379	Кинжи	Назаровнв	+7-778-361-84-75
3380	Новичков	Андрей	8 701 624 85 55    51 33 65
3383	Даулетова	Раушан	+7-702-971-10-05
3390	Абдрахманова	Шайханым	+7-707-925-94-91
3405	Абуов	Галымжан	+7-778-732-54-33
3406	Нурекенова	Гулзар	+7-707-121-99-91
3407	Шакиртах	Михаил	+7-702-184-86-89
3410	Алиев	Шахин Гасым оглы	+7-702-632-46-71
3431	Денис	Анатольевч	8 705 84 24 973; 21 99 30
3462	Саляник	Наталья	8-771-227-44-63
3658	Арыстан	Аймагамбет	542487
3465	Советбаева	Ардак	+7-701-145-59-78
3486	Зоя	Лукинична	54-09-94
3488	Мукушева	Мадина	994846
3493	Искандиров	Нурсултан	+7-778-666-93-01
3504	Ниязова	Асемгуль	+7-776-796-22-54
3513	Елена	Анатольевн	+7-707-849-06-76
3536	Согуйченко	Николай	8-705-495-43-48
3547	Джумашев	Ерболат	+7-775-132-27-47
3562	Егудкина	Райкуль	+7-701-920-34-68
3570	Султанова	Венера	8-705-839-61-67
3586	Жапарбергенова	Айгуль	8-771-346-64-34
3590	Дыма	Александр	228443
3594	Кудряшова	Юлия	21 46 47  \\\\ 8 778 677 05 84
3596	Ашлухамбетова	Кунзия	8-777-660-93-16
3600	Киреев	Жаксылык	8 701 668 00 84;98 52 89
3605	Алданазарова	Гульжанат	+7-705-971-43-84
3614	Хабиб	Людмила	22 03 64
3630	Тлеулина	Фарида	+7-771-842-53-03
3662	Жумабаев	Темирлан	+7-775-684-18-30
3663	Ибадатова	Жадыра	+7-702-627-99-78
3665	Илаева	Татьяна	+7-701-581-13-96
3728	Ильясова	Жангул	+7-702-930-80-13
3669	Еспусинова	Жайнагуль	+7-702-635-22-93
3673	Жайкин	Каир	+7-701-650-72-70
3707	Петр	Васильевич(глухонемой)	8 708 532 79 17 (жена Вера)
3720	Демиденок	Людмила	+7-701-341-85-35
3726	Тасмагамбетова	Венера	+7-702-195-66-66
3769	Косумбетова	Афуза	229253
3794	Дильжанов	Асылжан	+7-775-282-92-19
3808	Зареденова	Молдир	+7-747-552-40-39
3810	Караногаева	Нурай	+7-771-611-07-17
3868	Белова	Татьяна	+7-777-156-94-00
3892	Есендосов	Тасбулат	77 24 47   8 705 378 83 98 (Бауржан внук)
3906	Удайбергенова	Фариза	+7-702-215-38-05
3926	Лекерова	Жанаргуль	+7-707-435-04-28
3927	Назарбаева	Жулдыз	+7-701-730-22-00
3947	Торсбекова	Жанагуль	8-771-686-14-12
3949	Куатбаев	Куаныш	+7-702-195-13-26
3975	Казанева	Екатерина	54 04 51/8 701 367 12 01
3980	Чернокозов	Юрий	+7-702-195-13-26
3994	Алиманова	Жанслу	+7-705-288-68-13
4005	Нургалиева	Наргиз	+7-702-375-08-98
4035	Калиев	Канат	+7-705-730-13-45
4045	Успаноб	Батыр	+7-775-337-79-22
4205	1965	Джумабаева.	98-83-98
4178	Александров	Галина	8 05 604 80 87; 21 50 38
4056	Алиева	Гульнизар	+7-702-900-07-00
4064	Розанова	Ирина	215716
4083	Утениязов	Жетписбай	+7-747-125-90-53
4097	Кальбеева	Оксана	+7-701-663-99-23
4126	Мадаев	Мухатди	+7-778-666-44-25
4149	Макарова	Татьяна	+7-701-303-65-78
4162	Адилбаева	Ардак	+7-778-394-84-40
4173	Атаханова	Наргиза	8-708-981-71-14
4179	Жомартова	Алтынгуль	+7-702-328-83-95
4216	Валеева	Маргарита	+7-701-144-66-13
4221	Мусаха	Асылжан	8-707-266-40-38
4222	Бурбаева	Шолпан	+7-705-820-34-49
4228	Валентина	Кузьминична	214420
4234	Коняева	Галина	+7-702-543-54-09
4248	Наджафов	Алик Мйыл оглы	+7-702-843-41-00
4351	Сисенбаева	Гулжихан	+7-702-517-37-85
4274	Исаев	Асхат	+7-701-222-27-47
4276	Данабек	Канымай	+7-776-151-02-61
4283	Дуйсенбаева	Айсулу	8 776 798 88 99;21 05 32
4301	Лепесов	Нурбол	8-702-220-12-34
4314	Енсегенова	Жанаргуль Аймуратовна (Шынар)	+7-707-907-35-37
4320	Кулмагамбетов	Медет	+7-778-199-05-32
4324	Бимбетова	Айгерим	+7-771-168-68-60
4329	Бахит	Дилара	+7-777-262-61-66
4338	Нурмаганбетова	Баян	+7-702-100-75-54
4344	Туганов	Медет	996463
4352	Жакасова	Шараш	+7-701-189-76-59
4357	Утепов	Дауылбай	8776 396 92 01, 8 701 396 92 01
4362	Карнаков	Арман	99  01 33 /  8 775 250 52 65
4394	Кульмуханова	Алтынай	+7-701-503-82-92
4399	Сулим	Александр	+7-702-188-92-10
4443	Бекбосынов	Жолмурза	+7-701-492-30-62
117	Филатов	Владимир	+7-701-732-76-60
533	Пищальников	Станислав	+7-777-434-34-35
764	Джанасаев	Жолгаз	+7-702-586-74-24
771	Сабитова	Ирина	8 701 301 64 32,90-57-72
773	Кармеева	Елена	+7-702-526-27-43
774	Закаряев	Тимур	8-702-433-58-19
118	Печерский	Максим	+7-705-703-33-91
532	Цыба	Надежда	+7-777-178-55-95
765	Бойко	Виктория	+7-771-230-60-40
766	Карамурзина	Багжамал	+7-707-767-70-00
4454	Бисекова	Нурбикеш	+7-775-679-42-82
534	Курманиязов	Сансызбай	+7-702-552-61-11
4461	Уразгалиев	Орхат	98-54-51   8-708-955-06-00
4476	Мунтургалова	Дина	8-775-103-57-36
4532	Момункулов	Бакытбек	+7-747-413-15-19
4549	Оголь	Василий	+7-771-290-30-04
4583	Комарь	Александр	8-778-256-65-87
4600	Карабаева	Жамиля	+7-747-543-96-72
4637	Каштанова	Алла	+7-705-380-42-26
4651	Абишева	Самал	+7-700-088-06-95
696	Татьяна  Константиновна	Горбань	+7-777-434-37-62
779	Курбангалиева	Марина	+7-701-350-66-99
851	Успанова	Анара	+7-707-213-61-00
853	Оспанова	Бибинур	+7-747-876-04-87
856	Байдаулетов	Бекболат	8-701-393-12-97
1182	Григорьев	Андрей	+7-917-147-52-87
1188	Есмагамбетова	Гульнур	+7-701-688-51-84
848	Сурнина	Марина	+7-705-147-74-08
850	Потапская	Богдана	+7-776-175-58-21
1186	Юрман	Борис	8-701-714-75-06
1187	Фотин	Евгений	+7-707-630-98-89
1194	Кушнаренко	Любовь	+7-771-608-14-32
1419	Сугак	Диана	+7-775-581-83-15
1423	Калташкина	Наталья	+7-777-032-41-03
1597	Синицын	Виктор	+7-961-917-68-42
1598	Лукьяненко	Татьяна	+7-707-845-78-63
1679	Потуга	Анна	+7-777-196-47-16
1763	Павлухина	Лидия	+7-702-543-56-97
1829	Кононец	Виктория	+7-771-293-72-91
1834	Орлиогло	Алла	+7-777-800-33-45
1845	Келина	Марина	21-02-29
2402	Братченко	Алевтина	+7-701-771-97-24
2406	Ивченко	Виктор	+7-771-309-82-60
2409	Барсук	Виталий	+7-775-577-12-00
2411	Дедю	Любовь	96-52-94
2493	Чичерин	Юрий	+7-702-500-01-93
2502	Жаксылык	Улан	8-701-445-88-91; 8-705-473-16-31
2503	Нода	Анастасия	+7-961-938-16-31
2577	Белан	Алексей	+7-776-180-32-20
2579	Хамзина	Айслу	8-707-362-07-13
775	Курманиязов	Таргын	+7-777-405-51-20
1420	Нурторе	Базарбай	+7-708-539-15-53
860	Альмишева	Ляйля	+7-702-286-43-45
863	Амандосов	Сагингали	+7-702-106-58-13
1365	Жалгасбаев	Аслан	+7-777-434-60-88
1838	Эдуард	Кабельский	+7-702-169-33-22
1846	Тимур	Бондаренко	+7-707-883-73-69
2584	Мустояпова	Алтынгуль	+7-701-671-87-33
2586	Бекешев	Арман	+7-701-933-18-46
2729	Бекесов	Кайрат	+7-776-770-06-59
2730	Фахртдинов	Ильдар	+7-705-650-40-95
2738	Орынбасаров	Достан	+7-705-750-00-55
2739	Алимбекова	Дилара	+7-701-512-69-32
2741	Таусаров	Александр	+7-771-227-22-07
2749	Аленов	Мурат	+7-771-858-68-89
2984	Жумагалиев	Салават	+7-701-455-39-28
2985	Бикенова	Айнагуль	41 25 81  / 8 705 418 36 03
2582	Фидорус	Татьяна	+7-777-342-77-00
2585	Куценко	Андрей	+7-705-288-29-10
2732	Руденок	Иван	+7-701-313-64-82
2740	Горбач	Дмитрий	+7-777-506-61-18
2746	Байменчина	Сабина	+7-705-818-82-27
2747	Деменко	Александр	+7-778-393-03-24
3487	Познак	Екатерина	+7-705-839-58-17
3649	Бех	Ирина	+7-778-269-41-90
3659	Горбань	Николай	8-777-43-43-763
4135	Мартынюк	Егор	+7-708-534-56-52
4144	Циммер	Екатерина	+7-771-168-60-75
4147	Гросс	Людмила	+7-701-362-51-62
4317	Голубицкая	Татьяна	+7-777-505-16-51
4322	Вивтоненко	Ольга	+7-777-031-91-98
4475	Шинко	Кристина	+7-777-031-90-11
4478	Домбровская	Лилия	+7-771-290-24-52
4485	Лапшин	Сергей	+7-705-723-06-84
4486	Шишкина	Адель	+7-777-029-67-56
4558	Межебицкая	Наталья	8-701-588-11-31
4559	Кучеренко	Ирина	+7-777-002-34-50
4487	Лариса	Ким	8 771 229 24 40    40 65 03
4560	Вихляев	Виктор	+7-701-778-75-12
4563	Куписова	Галина	+7-707-130-39-32
4567	Кобжанова	Галина	+7-747-238-44-32
4632	Скворцов	Даниил	+7-707-720-24-09
4641	Рахимгалиева	Айя	+7-708-529-10-51
4645	Бримжарова	Майра	+7-701-518-89-97
4646	Захарова	Вера	+7-778-318-50-57
4634	Зинина	Любовь	+7-701-493-81-15
4638	Диденко	Игорь	99-54-82
4642	Верещак	Андрей	+7-700-684-27-75
4643	Бондаренко	Ирина	+7-701-371-95-32
4650	Варава	Луиза	441467
4652	Ким	Сергей	57-28-72
4564	Шанова	Жамагуль	+7-708-710-70-77
4661	Шуииншалиева	Нуржамал	+7-707-730-70-99
4629	Кистаубаева	Айжан	+7-778-270-40-34
4639	Тулеуова	Жанетта	+7-701-742-77-19
8	Бахтегереев	Серик	+7-701-342-88-03
10	Кеулимжаева	Асел	+7-705-472-12-27
19	Манкаева	Жанеля	+7-775-361-82-90
23	Булегенов	Ауез	+7-707-797-81-19
26	Косщанова	Мерует	+7-771-170-75-48
31	Лукпанова	Алия	+7-701-472-94-52
32	Картикенова	Гульзада	+7-777-157-88-74
34	Надырбаева	Айнагуль	+7-775-664-12-10
37	Алдашев	Адил	8-701-383-91-70
38	Иванов	Александр	96-91-33;8-702-380-26-93
2	Ротарь	Ирина	+7-776-233-50-53
4	Карио	Ольга	+7-705-839-59-18
9	Сенишина	Оксана	+7-705-126-77-46
15	Андреади	Павел	+7-701-173-39-53
16	Заранко	Валерий	+7-747-565-57-98
21	Романуша	Виктор	+7-701-288-25-60
33	Инюхин	Владимир	965418
6	Алиева	Хошгадам	8-701-688-05-57
25	Ауесханова	Альбина  Асылхановна	+7-708-981-14-64
12	Елеуов	Ерлан	+7-705-536-11-88
22	Курмашева	Галия	+7-705-735-90-93
14	В.В.	Сыпко	8-705-872-17-90
42	Кичатый	Максм	+7-708-128-12-06
48	Безпалько	Леонид	+7-705-837-00-45
52	Исаналина	Жанар	+7-705-539-25-55
57	Алексеенко	Лидия	+7-701-649-46-44
59	Дуйсенбина	Асемхан	+7-702-378-66-90
65	Хегай	Казима	+7-776-000-13-11
43	Хаметова	Наталья	+7-777-362-75-03
68	Нурсапина	Светлана	+7-777-228-80-96
46	Измукаммедов	Талгат	+7-777-660-19-70
47	Сарсенов	Бауыржан	+7-771-160-88-81
51	Бураканова	Алла	+7-771-818-53-41
70	Деревянченко	Олег	+7-708-121-02-69
81	Крупский	Михаил	+7-705-480-23-86
83	Крамарь	Леонид	+7-707-040-90-71
85	Ордин	Дауренбек	8-777-112-40-05
88	Дёменко	Ольга	+7-778-393-03-24
90	Белая	Наталья	+7-702-665-48-10
92	Харченко	Татьяна	+7-701-774-11-17
56	Мурзабекова	Камшат	+7-707-578-69-03
99	Савчук	Елизавета	+7-777-676-40-13
112	Акмурзина	Сауле	+7-707-386-13-67
61	Дедусева	Оксана	+7-701-611-33-42
76	Орынбасарова	Айкун	+7-775-429-00-06
77	Щербакова	Татьяна	40-21-51; 8-708-187-99-56
79	Абдулаев	Сардор	+7-705-211-38-70
82	Кадиров	Умирбахи	+7-701-362-31-24
89	Богданова	Любовь	511729
94	Байменов	Муратбек	+7-705-495-01-09
98	Батырова	Айша	+7-771-687-55-94
105	Абдримова	Венера	8-701-584-67-18
116	Овчинникова	Надежда	+7-776-140-55-72
58	Цыганкова	Анастасия	+7-777-157-66-21
78	Воронцова	Валентина	+7-775-056-14-56
80	Бекркимбаева	Венера	8-701-455-12-36
93	Шанбатыров	Жаксыбай Мухатай улы	+7-705-971-13-91
115	Ибраев	Шамшадин    Айдуллаевич	+7-778-100-68-63
125	Иваненко	Галина	44-83-81
134	Голушко	Валентина	8-777-623-82-97
138	Турок	Николай	+7-771-650-36-08
145	Ахат	Оралхан	+7-705-346-28-18
149	Еременко	Алёна	+7-701-431-12-43
158	Мажонайте	Марина	+7-705-771-71-21
161	Кенжегарин	Амирхан	+7-708-212-15-17
163	Кучинская	Полина	+7-771-160-61-27
122	Бесчастнова	Сания	76-10-53
164	Важничая	Людмила	+7-777-434-04-88
129	Афанасов	Владимир	967041
174	Данилевский	Станислав	+7-(78-)-506--0-5-
188	Сандыга	Любовь	+7-705-837-97-11
195	Боровец	Сергей	+7-701-322-59-47
202	Ким	Станислав	+7-777-161-18-10
130	Молдашева	Ольга	+7-771-256-66-78
132	Санаева	Ольга	8-775-550-89-98
141	Кудияров	Тугельбай	+7-775-059-58-99
135	Умарова	Гульмира	+7-705-817-72-44
142	Утегулова	Алтынай	+7-(99-)-09--19-67
146	Логинова	Ирина	+7-705-379-45-45
148	Баранбаев	Майранбай	+7-747-785-53-00
152	Купарева	Алина	23-12-51; 8-701-392-29-50; +7-705-472-60-26
153	Кучаев	Ильнур	8-700-500-06-08
154	Федорова	Ирина	8-701-493-02-43
155	Белоусова	Надежда	21-74-26;
157	Мертешев	Марат	+7-701-745-75-73
165	Алимова	Ольга	+7-701-554-02-25
176	Кутуев	Баграт	+7-771-170-48-44
177	Кубесова	Гульнар	+7-701-270-55-95
178	Амантаева	Лаура	+7-778-833-66-77
181	Сакриев	Сергей	+7-707-748-09-68
190	Уразжанов	Олжас	+7-700-720-62-58
196	Радышев	Александр	212257
210	Степаненко	Анна	21-43-18; 8-747-332-37-66
221	Мишина	Ольга	44-85-43
227	Степаненко	Андрей	+7-701-361-39-22
231	Жарко	Лариса	+7-705-253-87-48
233	Лишенко	Данил	8 747 843 12 34  / 51 61 27
206	Узакбаева	Айнагуль	+7-705-536-70-84
242	Дышловой	Роман	+7-777-705-50-55
252	Панасенко	Сергей	8 771 820 40 299(жена)
262	Слипченко	Галина	+7-701-601-45-50
266	Троценко	Аэлита	+7-771-122-87-98
208	Кусбармакова	Айнур	+7-776-790-80-50
269	Губайдуллина	Галина	+7-747-110-52-60
212	Шишнев	Сергей	+7-705-919-60-70
283	Петриенко	Наталья	99 56 32  \\\\\\\\\\\\8 777 779 20 95
214	Жаумбаева	Малика	+7-705-837-67-42
285	Канухина	Вера	+7-(77-)-506--5-5-
225	Курманова	Тания	+7-705-604-51-08
235	Мухамбетов	Арман	+7-705-750-60-61
237	Попова	Лидия	211872
207	Ибрагимова	Малика	+7-701-594-30-69
239	Кукебаева	Мадина	+7-705-971-42-84
232	Жаксыбек	Омар	+7-708-942-95-07
238	Андрей	Сенацкий	+7-(71-)-520--0-9-
241	Бермагамбетова	Айкенже	+7-771-520-37-67
243	Наджафова	Марина	+7-707-440-61-63
245	Смагулов	Адлет	+7-708-212-32-25
246	Бактыбаев	Аман	+7-771-292-69-69
253	Расбаева	Гул	+7-701-126-83-72
258	Жумабаева	Нурзиля	+7-705-630-71-61
268	Жубаназаров	Нурлан	+7-771-294-07-95
271	Валиев	Дамир	+7-701-404-78-05
277	Ершова	Ирина	+7-705-692-16-08
278	Пашаева	Татьяна	+7-702-142-39-47
272	Мирамгуль	Усербай	+7-705-988-40-35
255	Бажирова	Алтын	+7-771-609-57-12
295	Бусурманов	Салимгерей	8-771-844-76-52
296	Кадырова	Карлыга	998132
291	Пащук	Полина	8-705-718-67-90
297	Кошевой	Олег	+7-777-505-93-53
302	Бондаренко	Владимир	51 01 54  8 702 670 11 24
306	Якунин	Иван	+7-705-288-27-69
307	Царенко	Ирина	+7-777-928-23-16
289	София	Борсук	+7-701-357-57-42
311	Заваленная	Анна	+7-771-108-20-56
316	Фомкин	Владимир	8-775-056-28-83
318	Дейна	Татьяна	+7-775-922-74-34
322	Изтилеу	Гульжайнар	+7-705-473-87-00
331	Койшигарин	Совет	+7-701-712-27-09
337	Черный	Алексей	+7-775-717-36-08
350	Хабибулина	Илона	+7-708-495-52-47
360	Аманчин	Нуржан	+7-775-934-50-65
362	Литвиненко	Андрей	8-701-514-10-97
298	Надыров	Эдуард	8-701-775-63-18
364	Мартынюк	Константин	+7-778-361-06-26
299	Хужахмедова	Улмакан	+7-707-208-54-06
304	Шарипова	Альбина	+7-777-928-60-35
314	Вера	Ким	+7-771-187-32-19
308	Акбасова	Улжан	+7-707-609-81-38
312	Еменбаева	Саягуль	+7-778-157-69-09
313	Зобов	Вадим	+7-702-638-28-88
321	Соловьева	Татьяна	+7-777-149-87-87
323	Алиева	Мира	+7-702-375-37-72
326	Казмухаметов	Жанет	+7-776-770-77-01
334	Нагорников	Валерий	8-705-692-46-39
335	Сакриев	Сергей	+7-707-748-09-68
339	Кишибаев	Сайранбек	+7-701-346-98-14
340	Бактыкереева	Салтанат	+7-702-318-17-10
343	Фоминов	Денис	+7-702-708-33-77
358	Шалманов	Асен	+7-775-160-64-41
359	Ермуханов	Нурлан	+7-776-990-00-76
332	Элмуратов	Жеткерген	+7-705-494-42-29
372	Вертей	Ирина	8-701-48-88-728
385	Гильдиш	Яков	40 70 50 \\\\\\\\8 705 917 77 70
387	Белая	Ирина	+7-701-749-58-32
392	Кириченко	Роза	96-53-12 8 775 321 62 00
376	Кайреденова	Алмажан	+7-705-537-71-48
394	Ткачук	Наталья	+7-701-756-71-95
400	Дедю	Татьяна	8 701 816 99 95/ 21 22 57
403	Шецель	Сергей	+7-705-690-51-91
405	Ким	Юлия	+7-777-120-94-20
406	Шевченко	Евгений	+7-778-332-23-33
412	Мысик	Иван	+7-747-583-02-60
434	Межебицкая	Наталья	+7-701-588-11-31
374	Каржауова	Гулмира  Шамшаровна	+7-705-162-81-30
446	Бобырь	Ольга	+7-701-418-04-97
378	Носов	Александр	968471
379	Наушабаева	Оксана	+7-705-479-94-83
381	Алексеева	Галина	211365
382	Абишева	Айнагул	+7-708-327-05-82
383	Тимофеев	Юрий	+7-701-488-87-37
386	Шудатаев	Саят	+7-771-168-14-30
388	Нуржанова	Салтанат	+7-707-417-23-38
390	Советбаева	Гулшат	8-747-403-20-00
395	Балмишев	Нурлан	+7-705-819-44-72
397	Ержанова	Бактыгул	+7-705-623-25-07
401	Шарипова	Жансая	+7-747-357-82-16
402	Аширбекова	Зоя	+7-701-286-14-53
413	Бактияров	Адилбек	+7-747-549-53-99
416	Асаубаев	Артур	+7-778-270-34-99
420	Баков	Лайык	+7-777-167-43-17
423	Грызунов	Юрий	234195
425	Шотанова	Гульсим	+7-775-520-86-18
427	Мамышева	Марьяш	+7-702-587-73-33
435	Ешимов	Нуртай	8-775-801-60-17; 8-771-391-41-73
437	Закляков	Анатолий	963335
441	Есендосова	Алмагул	+7-701-135-56-53
445	Микулова	Людмила	+7-701-468-50-43
417	Сарсенова	Мария	+7-705-860-68-34
432	Сулейменова	Кульмайрам	996382
454	Бондаренко	Владимир	+7-701-721-32-39
461	Сабетбек	Акбота	+7-708-602-63-16
466	Головань	Наталья	+7-702-446-17-05
453	Утепова	Салима	+7-702-406-48-85
455	Балобаева	Лаура	+7-701-339-90-70
470	Ларин	Сергей	21-74-25
481	Сон	Галина	+7-771-108-52-02
490	Сандыга	Людмила	99-64-05
497	Павлиновский	Илья	+7-702-031-62-45
498	Фисенко	Надежда	+7-701-432-07-87
507	Бреннер	Виктор	+7-707-950-51-57
512	Сандыга	Михаил	+7-705-235-44-87
515	Орловская	Валентина	+7-747-405-35-05
518	Деркач	Вадим	8-705-917-55-26
523	Иванченко	Анастасия	+7-705-604-63-99
526	Адилшина	Гульшара	8 777 8 0000 78
460	Есмуханова	Серикпай	+7-705-971-33-88
468	Бибанова	Елена	8-705-539-35-37
482	Актоты	Шекина	+7-777-619-87-18
469	Турарова	Гульжанат	+7-707-466-50-68
471	Иванов	Александр	+7-702-380-26-09
517	Ксения	Хаецкая	8 707 220 41 02; 96 08 88
474	Нарынбаева	Эльмира	+7-771-182-07-62
476	Поляков	Владимир	8-777-497-34-12
486	Мендибаев	Мирхан	+7-777-110-07-35
495	Салфиков	Анвар	+7-705-115-10-01
496	Муравьева	Ольга	8-701-384-33-08
508	Абенова	Жанна	+7-702-449-58-22
510	Алданазарова	Зиба	+7-701-301-49-43
514	Туяшев	Бекет	+7-777-521-62-30
516	Карымсакова	Алтын	+7-775-250-75-54
519	Сарсенгалиев	Жасулан	+7-705-175-85-85
521	Ермекбаева	Лаура	8-747-654-91-72
525	Измукаммедов	Толгат	+7-777-660-19-70
530	Сахитова	Раиса	988328
494	Кадыров	Куаныш	+7-701-644-94-47
506	Кальменова	Айгуль	+7-701-369-49-36
541	Клецко	Элла	+7-701-305-00-88
558	Шурина	Айнура	98 23 63  / 8 701 128 58 48
573	Яновский	Ярослав	+7-701-233-74-72
591	Васенко	Татьяна	+7-771-785-46-87
594	Сорокина	Оксана	+7-777-413-78-14
598	Чупина	Татьяна	8-777-658-97-95
604	Евтушенко	Николай	8-708-984-50-02
606	Зеленский	Сергей	+7-701-872-90-20
614	Нурллина	Айнур	+7-705-275-58-87
545	Дюсенгалиева	Гульзат	+7-771-520-27-89
551	Утарова	Нургуль	+7-777-613-72-59
553	Шаштыбаев	Ракымжан	+7-702-435-23-98
555	Алданов	Жумасеит	+7-705-476-59-87
564	Прокаев	Виктор	+7-701-933-41-60
543	Жангельшбаева	Асель	+7-771-608-72-58
544	Казкенова	Марияш	+7-701-140-11-01
554	Сауле	Тукина	+7-771-791-85-70
568	Кристина  Игоревна	Степаненко	+7-915-449-78-77
576	Райхан	Губайдуллина	219350
572	Емельянов	Максим	+7-747-568-29-67
574	Есеева	Айгерим	+7-701-727-32-76
577	Салихова	Аксаган	+7-708-261-13-75
578	Аяпбергенов	Жандос	+7-771-227-02-22
580	Урманова	Жумагуль	+7-701-688-47-74
584	Бисенгалиева	Алия	8 707 160 61 16 / 8 777 112 6980
585	Шустова	Людмила	22 03 11
586	Салихова	Гузалия	+7-778-389-18-44
587	Тажигалиева	Зина	+7-702-381-90-14
588	Каймульдинов	Мурат	8-771-687-71-59
589	Маслова	Галина	+7-705-917-13-82
593	Журумбаев	Серик	+7-705-397-37-60
601	Аблаева	Толкын	+7-775-497-73-13
603	Басмаганбетова	Гульзат	+7-705-338-33-88
609	Баймуратова	Аклима	+7-707-872-62-04
616	Тажикенова	Маржанкуль	+7-702-510-98-61
597	Тулегенов	Айберик	+7-777-786-37-09
612	Жубаниязова	Гаухар	8771-126-21-05
629	Макаров	Данил	+7-705-480-00-74
619	Бикчурина	Светлана	+7-708-646-90-31
631	Минин	Виктор	+7-702-133-14-91
632	Умарова	Зарина	+7-747-565-48-79
638	Лактина	Лидия	21 44 39\\\\\\\\\\\\ 8 701 385 26 61
645	Фокин	Никита	+7-708-767-53-91
652	Трамбовецкая	Мария	+7-701-596-62-16
657	Мустафина	Накия	+7-702-286-43-34
659	Гончаренко	Марина	+7-701-686-79-04
665	Пишко	Василлий	+7-705-838-81-20
668	Новосельский	Глеб	+7-702-854-88-27
674	Лобан	Виталий	+7-777-167-50-04
691	Ливицкая	Ирина	8-702-155-87-11
633	Саркулов	Тимир	+7-775-051-52-76
635	Абилова	Камила	+7-701-405-67-06
636	Отегенова	Назерке Амирхан кызы	8-702-312-90-80
637	Немчинов	Василий	+7-705-965-59-02
640	Мингулова	Лариса	762933
643	Бисенгалиева	Амангул	8 707 892 21 55  250 350
646	Мухамедьярова	Гульмира	+7-707-460-47-37
648	Кулбараков	Курлан	+7-708-824-82-12
654	Хасаев	Дамир	+7-701-333-54-40
655	Садыкова	Жаннат	+7-701-242-41-44
656	Боранбаева	Камила	+7-778-803-02-35
658	Борзова	Олеся	+7-707-848-75-50
663	Цыганкова	Любовь	8-771-598-07-37
667	Бермаганбетова	Лаура	+7-702-259-11-22
669	Жанабаев	Тимур	8-701-123-48-92
670	Егорова	Лиана	+7-747-102-67-60
673	Худяков	Леонид	+7-705-376-97-77
680	Бубликова	Елена	+7-775-160-53-48
683	Заглядова	Надежда	8-771-18-18-758
684	Дубаева	Алмагуль	+7-705-836-48-81
685	Хохлов	Максим	8-776-792-06-06
689	Кожанова	Малика	+7-747-105-84-73
666	Емшанова	Жумагуль	8-777-167-99-71
676	Омаров	Жумабек	+7-705-636-21-97
700	Мирная	Зинаида	8-701-676-28-83
698	Каржова	Клавдия	+7-701-292-36-20
703	Унайсарова	Алтын	8-702-434-98-37
704	Тимониченко	Ольга	+7-705-919-37-92
711	Сырым	Лира	8-701-340-99-57
728	Доброгорский	Владимир	+7-707-960-24-54
731	Суттер	Александра	+7-747-322-79-57
732	Карпенко	Мария	8-747-176-58-11
753	Слюсарь	Ольга	+7-701-133-09-29
757	Щукина	Людмила	8-778-732-84-05
705	Алмагамбетова	Камшат	+7-705-345-84-58
758	Бутко	Оксана	+7-705-919-25-55
710	Коростелева	Анастасия	+7-705-479-44-77
712	Кадралиев	Илан	+7-777-031-90-11
717	Логинова	Лариса	+7-778-303-36-49
706	Людмила	Тарасенко	8 701 654 58 57; 21 05 93
708	Наталья	Хабиб	+7-705-495-46-20
722	Сагинбаева	Лариса	+7-747-873-10-76
723	Ибрагимова	Гульнараим	+7-778-687-85-08
727	Тлеужанов	Айдын	+7-775-124-32-36
740	Матанова	Улбасын	+7-707-945-75-60
741	Камалутдинова	Светлана	21 11 30
743	Байдимиров	Михаил	8-775-445-19-93 98-81-44
744	Ахметов	Кайрат	+7-775-747-94-09
726	Кобанова	Гульсум	+7-707-703-92-18
746	Машкова	Галина	+7-705-839-56-78
749	Жумашева	Меруерт	+7-775-587-71-04
751	Алдабергенова	Альмира	8-707-374-85-25
754	Амантаева	Айнура	+7-701-191-46-73
759	Рогожникова	Валентина	+7-707-328-83-67
760	Рысмагамбетова	Клара	+7-701-191-46-72
761	Нугуманова	Гульжан	+7-705-919-04-03
748	Шокаманова	Гульнара	+7-705-837-92-31
781	Нурмагамбетов	Нуралы	+7-771-102-13-81
780	Косовская	Клара	+7-777-294-14-43
787	Жаксыбаев	Рахимжан	8-771-183-02-61
785	Айтмухамбет	Айман	+7-708-158-87-97
795	Плаксина	Минзямал	+7-777-554-36-24
796	Катаван	Ольга	+7-747-120-43-60
816	Колягин	Андрей	+7-778-627-61-30
821	Жумаш	Нуржанат	+7-705-750-61-41
823	Крутопейсах	Ирина	8-701-352-66-47
783	Данабек	Дербис	+7-771-047-98-82
824	Рябоконь	Виктор	962524
825	Верещак	Наталья	+7-701-570-24-09
839	Ищенко	Анастасия	+7-700-975-57-72
841	Бойко	Надежда	+7-775-817-21-34
789	Жумагалиева	Айгуль	+7-701-601-29-98
845	Белый	Марк	+7-701-288-29-93
790	Еримбетов	Жумагали	+7-705-605-22-83
792	Кокорев	Анатолий	+7-705-288-52-50
794	Мучипова	Бэлла	+7-702-496-08-42
808	Ержанова	Мизангуль	+7-708-667-96-87
809	Шындагулов	Мухтар	+7-775-844-02-66
813	Уайсова	Дана	+7-708-118-08-18
815	Исенгалиев	Куаныш	+7-775-891-26-30
818	Литвинова	Юлия	+7-701-128-92-16
820	Коротков	Роман	+7-702-273-00-79
799	Каржауова	Айнагуль	+7-775-778-27-38
822	Айекешева	Гулнур	+7-747-246-13-57
800	Туганов	Мидет	996463
805	Канатова	Батима	8 702 391 18 93(дочь Слушаш)
827	Асанбаев	Бекзат	+7-705-836-62-09
829	Медетбаева	Айжамал	+7-707-717-18-26
833	Кишибаев	Моряк	+7-705-418-36-03
847	Салова	Марина	+7-701-419-19-66
810	Топаева	М,Н	+7-701-527-15-82
826	Тлеумагамбетова	Светлана	+7-771-687-06-33
840	Бисенгалиева	Асыл	+7-747-458-61-15
879	Бойко	Николай	+7-707-383-51-75
880	Беличенко	Марина	7-701-675-93-87
891	Панченко	Ирина	+7-705-235-88-47
867	Битлеуова	Гумдузум	+7-705-524-46-34
894	Моор	Алёна	8-776-732-42-80,8 747 533 89 67
898	Корольчук	Виктор	413058
918	Завервальд	Татьяна	29-1-33
920	Туркина	Наталья	+7-701-537-79-64
876	Кунуспаев	Аскар	+7-775-380-68-09
930	Ротарь	Ксения	+7-705-495-56-23
881	Ижибаева	Асемгуль	+7-705-104-73-23
943	Зубаха	Юрий	+7-705-472-92-04
946	Линский	Василий	8 904 606 46 76\\\\\\\\8 747 322 51 94
883	Салыкбаева	Айгуль	8-705-478-86-23
884	Афанасьев	Олег	+7-747-332-34-88
885	Тельнов	Георгий	+7-701-189-79-65
870	Шесенбаев	Мергали	+7-777-022-04-89
889	Короткова	Надежда	460658
895	Ахметова	Гульжайнар	+7-747-357-64-57
897	Шишов	Степан	8-705-750-77-68
899	Терекбаева	Гульманат	+7-775-393-62-61
903	Беспалова	Наталья	+7-777-977-34-10
937	Людмила	Выгоняйло	+7-701-360-65-27
912	Мещерякова	Наталья	+7-701-330-35-02
917	Пустовалов	Андрей	+7-771-609-81-34
919	Абдапов	Полат	+7-771-294-30-77
923	Искалиева	Клара	+7-775-341-97-47
928	Дурнова	Елена	23-16-65; 701-244-41-78
936	Фарафонтов	Владимир	+7-776-751-00-73
945	Молдагереева	Гульсара	+7-747-873-21-44
908	Ермуханова	Жания	8-771-105-85-67
950	Павленко	Ян	+7-700-952-83-32
971	Супрун	Наталья	8-705-235-48-36
980	Усик	Александр	+7-701-288-93-10
984	Кошевой	Николай	8 777 159 57т 60( Сын Николай)
985	Богуславская	Альбина	+7-705-760-49-85
986	Дышловая	Асель	+7-778-525-00-55
1021	Мишутина	Светлана	+7-747-681-25-14
951	Игибаева	Гульжан	+7-701-700-55-68
955	Динмухаметов	Гельус	+7-771-521-32-32
957	Кобыльникова	Надежда	+7-777-280-85-65
948	Орынбасарова	Жумагул	+7-771-496-86-75
976	Ксения	Ховрина	+7-705-474-52-53
959	Кожикова	Жанна	+7-747-476-56-17
954	Петрова	Наталья  Михайловна	+7-701-467-15-16
960	Куракбаева	Дина	+7-701-748-66-70
968	Садирбаева	Тюльпан	+7-701-405-11-05
972	Кайратова	Ардак	+7-776-247-98-86
1019	Максим	Мишин	+7-705-539-88-68
967	Мухтаров	Базарбай	21-44-36
982	Мельников	Станислав	+7-777-480-19-71
993	Абилова	Кульжанат	+7-701-925-31-57
975	Жадигерова	Гульдана	+7-705-819-37-77
996	Кузембаев	Зайрбек	+7-771-170-37-04
997	Скулова	Ирина	+7-707-188-85-02
1003	Оспанова	Динара	+7-705-398-83-88
1011	Тунгушпаева	Нургуль	+7-707-302-51-07
1017	Иванов	Денис	+7-778-666-37-05
1018	Бекесова	Кумисай	+7-776-768-21-28
1020	Салихова	Гузалия	+7-778-389-18-44
1024	Куздыбаев	Мухтар	+7-701-730-49-37
1010	Буранбаева	Рауфия	8-707-244-79-12
1041	Баймукашев	Марат	+7-701-726-15-32
1042	Мочалова	Галина	8701-499-63-899для больных)8 705 560 53 39
1035	Черничкина	Галина	+7-775-880-72-78
1037	Астаповский	Игорь	+7-777-193-28-69
1038	Волынец	Сергей	+7-705-328-64-92
1045	Падалка	Юрий	214413
1047	Штанько	Сергей	+7-777-878-62-86
1048	Истомин	Николай	8-777-514-60-85
1049	Машек	Анатолий	+7-705-839-56-78
1050	Крестьяной	Алексей	+7-705-378-30-17
1067	Мортина	Светлана	+7-708-278-01-97
1069	Каюдина	Нина	98-55-15
1073	Шупик	Наталья	+7-771-791-87-60
1078	Ален	Набат	+7-771-126-16-56
1082	Молкуц	Татьяна	8-777-658-96-97
1086	Шварц	Владимир	+7-700-080-09-57
1053	Тарасова	Марина	+7-776-779-99-53
1095	Миронюк	Ирина	+7-701-529-90-36
1102	Чередниченко	Мария	+7-747-567-57-26
1058	Кисаманов	Файзулла	8-771-229-19-67
1061	Скипидарова	Екатерина	8-708-532-88-45
1107	Жарко	Игорь	+7-777-162-95-63
1070	Даужанова	Гаухар	+7-771-119-86-59
1110	Корабалина	Алмагуль	+7-705-382-98-46
1072	Жанаманова	Галина	+7-(77-)-505--2-3-
1074	Алпамисова	Гульзира	+7-708-828-57-71
1075	Нурмагамбетов	Джамбул	+7-775-733-25-27
1085	Хаирова	Ильмира	+7-701-148-22-45
1092	Бекесова	Даметкен	222001
1094	Есенова	Гульмира	+7-701-589-48-57
1096	Кутуева	Рената	+7-705-982-63-84
1099	Байдаулетов	Бекболат	+7-701-393-12-97
1101	Дуйсенова	Айнур	+7-777-887-55-11
1112	Сапаров	Сабыржан	+7-777-009-41-80
3992	Жекенова	Гаухар	+7-777-872-33-44
1062	Елегенова	Айнагул	+7-778-533-23-31
1113	Панасенко	Александр	+7-771-768-65-55
1116	Смертынюк	Кирилл	+7-701-129-49-17
1114	Фурашова	Клавдия	8 705 378 97 58  \\\\\\\\96 80 03
1115	Корнилов	Максим	+7-771-181-15-97
1118	Савицкий	Константин	+7-701-208-34-70
1121	Вейнгертнер	Елена	+7-701-359-76-87
1133	Ахметов	Алтынбек	+7-777-800-88-06
1125	Мазеина	Яна	+7-702-167-10-62
1134	Канева	Людмила	+7-771-226-14-37
1129	Абдуллина	Дария	8-702-145-85-65
1130	Молдагазина	Айман	+7-701-750-45-06
1135	Сидорик	Алексей	+7-702-117-89-61
1141	Купжанов	Берик	8 771 170 57 40,8 707 302 51 07
1137	Пендещук	Николай	+7-701-431-16-47
1143	Максимча	Евгений	+7-987-810-72-83
1146	Костин	Михаил	+7-707-747-72-10
1150	Ищенко	Наталья	+7-701-348-10-71
1148	Шакиртов	Владимир	+7-776-792-83-32
1151	Куписова	Бибахан	+7-707-757-30-13
1154	Дегай	Татьяна	417468
1156	Пересыпайло	Роман	+7-707-986-01-26
1153	Верховодова	Галина	8-708-628-50-32
1159	Чумбасов	Асхат	+7-702-811-61-49
1160	Михайлова	Майя	+7-702-765-89-98
1164	Борамбаева	Айнур	+7-776-525-87-87
1166	Ешмаханов	Марат	+7-701-626-23-29
1176	Мухамбетьярова	Марзия	+7-777-434-43-30
1157	Галушкин	Альберт	+7-777-244-32-12
1171	Степанько	Нина	21 03 94
1158	Кучкаева	Лия	+7-771-027-30-96
1167	Айтынбетов	Сагинжан	+7-705-381-00-63
1169	Диана	Шурыгина	77-94-29
1174	Набиев	Алишер	+7-771-185-76-29
1197	Шишкина	Айгуль	+7-777-029-67-56
1198	Сейтказенова	Асем	+7-747-362-65-77
1226	Цеплит	Елена	+7-777-679-22-97
1200	Досинова	Асыл	8 702 647 82 45 / 98 23 65
1238	Токаренко	Ирина	+7-701-182-23-04
1243	Ногай	Жасулан	+7-708-674-43-99
1245	Банокина	Алита	+7-701-419-64-46
1257	Павленко	Наталья	+7-777-158-97-57
1203	Канаева	Лейла	+7-778-165-15-19
1258	Пирог	Галина	+7-777-149-88-26
1264	Кобзарь	Светлана	+7-771-187-48-70
1271	Острожной	Михаил	+7-702-124-28-03
1207	Ишпанова	Елизавета	+7-705-730-38-02
1213	Каргалинова	Асель	+7-771-160-05-23
1221	Айбеков	Кайрат	+7-776-776-04-22
1223	Имангалиева	Айгерим	991802
1206	Шишова	Ирина  Ивановна	8 702 748 09 32; 98 41 73
1225	Антамонова	Юлия	+7-701-334-99-39
1235	Оразгалиева	Бекзат	+7-705-744-09-58
1253	Жангул	Бекзада	+7-776-778-87-01
1236	Стройнова	Мария	44-83-06
1241	Тлеулиев	Миербек	+7-707-670-56-96
1251	Барбосынов	Оразбай	+7-778-225-56-71
1254	Алтынбекова	Нонна	8-701-426-67-36
1255	Ситдикова	Равиля	44 83 54   \\\\   8 701 384 22 16
1268	Туганова	Майя	8-771-126-42-55
1270	Королева	Жанна	+7-777-928-03-90
1260	Даниил	Смелевский	+7-747-565-51-53
1269	Полина	Савицкая	51-31-03  8 701 610 66 52
1277	Верещак	Николай	+7-701-556-67-48
1278	Чернухина	Татьяна	+7-777-185-36-11
1285	Павленко	Геннадий	+7-705-873-43-01
1289	Катаван	Юлия	44-81-97; +7-705-579-40-77
1307	Егудкин	Владимир	+7-747-109-65-86
1312	Кабдикар	Жараскан	+7-777-120-39-55
1317	Эрбель	Ирина	8-747-580-89-79
1324	Луцина	Любовь	+7-702-245-60-16
1326	Есалина	Гулсара	+7-702-379-88-00
1354	Подлесный	Данил	+7-775-746-86-50
1276	Мусамбекова	Карашаш	+7-707-361-35-71
1325	Юлия  Фёдоровна	Зинченко	8-776-776-99-70
1279	Капусинова	Раушан	+7-705-750-92-65
1282	Тажыбаев	Асхат	+7-702-342-39-65
1300	Харламов	Даниил	+7-701-922-83-57
1301	Ушкенова	Куляйша	+7-707-987-15-10
1303	Ганбарова	Гюнай Ибрагим кызы	8-701-370-52-20
1284	Муктарова	Роза	+7-701-521-36-65
1318	Момункулов	Бакытбек	8-747-413-15-17
1290	Миронова	Надежда	246224
1291	Алмагамбетова	Айгерим	+7-707-401-55-42
1293	Каирмагамбетова	Алия	+7-777-157-62-52
1296	Басарова	Кулянда	968478
1302	Резванова	Марина	8-702-138-19-78
1309	Сарсенова	Наргиз	+7-775-567-69-02
1310	Маленков	Дмитрий	+7-747-684-74-33
1313	Немчинова	Елена	+7-705-965-59-01
1315	Лятифова	Нина	+7-707-784-23-88
1322	Жалашева	Гаухар	8-702-557-44-74
1327	Пришляков	Александр	+7-701-884-13-58
1332	Каштарова	Валентина	+7-771-299-31-21
1334	Есетова	Джамиля	+7-702-167-26-46
1336	Туяшев	Рауан	8-777-506-55-85
1339	Басаров	Серикбай	+7-701-473-38-63
1341	Кадырбаев	Нурболат	+7-705-536-37-06
1342	Атабаева	Жадыра	+7-747-753-03-22
1344	Талыпова	Карима	8-775-600-70-75
1349	Ниетбаев	Нурлан	+7-705-842-74-32
1350	Мукашев	Бекбол	400422
1361	Проскурина	Людмила	50-16-71
1370	Хилинская	Светлана	+7-705-379-44-77
1371	Тимашенко	Александр	+7-707-606-54-01
1372	Горнбахер	Светлана	+7-702-351-80-39
1362	Корасаев	Жанибек	+7-702-269-92-01
1385	Бойко	Роман	8-702-620-23-29
1394	Фетер	Галина	+7-705-474-51-32
1396	Ким	Полина	+7-701-456-58-02
1366	Захарова	Наталья	+7-701-521-48-82
1397	Игнатенко	Александр	+7-705-412-07-30
1368	Гридасов	Олег	+7-777-149-81-49
1369	Шишов	Сергей	+7-707-728-02-01
1375	Утебаева	Галия	+7-775-924-58-10
1403	Уразалин	Серикбай	+7-702-498-91-60
1406	Байдуллина	Алтынгуль	+7-701-651-57-45
1377	Аухадиева	Альфия	+7-701-303-62-35
1380	Цветков	Валерий	+7-705-235-44-42
1387	Заглядова	Светлана	+7-771-183-41-91
1388	Колдунов	Виталий	+7-747-792-95-14
1389	Айжанова	Айма	+7-702-508-23-72
1390	Талипов	Кенжебек	+7-701-728-92-22
1393	Оспанова	Шарбану	+7-747-419-82-70
1395	Адилова	Алия	8-701-489-24-00
1400	Петрова	Роза	+7-776-030-33-58
1405	Арыстанов	Самурат	+7-778-318-19-04
1383	Туганова	Акпатша	+7-701-135-77-42
1410	Безенкова	Татьяна	+7-701-580-63-30
1386	Таубаев	Кадыргали	8 701 411 04 23; 41 74 38
1411	Айдаров	Ербол	8-705-919-93-70
1412	Бессонов	Алексей	8-771-181-03-34; 96-16-53
1413	Абдурахимова	Айгуль	+7-771-105-64-35
1414	Жансеитов	Талгат	+7-771-769-68-43
1437	Анучина	Людмила	+7-775-410-08-46
1438	Короленко	Наталья	21 46 48  8 747 966 52 62
1511	Левченко	Владимир	+7-701-296-20-07
1518	Снопок	Галина	8-777-167-58-58
1440	Бибаев	Руслан	+7-747-483-83-18
1445	Байтуганов	Малик	+7-701-365-01-88
1446	Бабакаев	Максим	+7-778-884-85-65
1448	Аймаганбетова	Гульмира	+7-771-183-32-07
1449	Каражанов	Алшынбай	+7-705-380-17-49
1463	Таласбаев	Самат	+7-705-212-43-33
1499	Леонид	Титаренко	219061
1456	Валеева	Светлана	+7-701-170-99-07
1460	Санжанов	Алибек	+7 702 108 67 86
1462	Рейсова	Майра	+7-705-202-17-41
1501	Вера	Вельможко	8-778-627-14-08
1471	Тагалов	Канат	+7-778-931-97-88
1472	Таганова	Кульпаршин	99 56 60, 8 701 884 70 10
1473	Нарыкова	Гульнар	+7-701-367-90-44
1482	Туяшева	Назымгуль	+7-747-785-29-51
1483	Муканбеткалиева	Жемис	8-701-670-88-26
1485	Ломоносова	Зоя	77-24-23
1487	Есенбаева	Асемгуль	+7-778-511-11-44
1495	Сергеева	Юлия	+7-775-343-96-43
1498	Байназаров	Сергей	+7-771-792-91-19
1503	Нургалиева	Дина	+7-701-428-02-10
1510	Амангалиева	Улбасын	+7-747-363-21-92
1508	Тажмагамбетова	Гульбахрам	+7-705-127-67-45
1526	Степанько	Андрей	+7-701-361-39-22
1530	Деревянченко	Олег	+7-708-121-02-69
1534	Бондаренко	Елена	+7-701-741-84-15
1546	Сулима	Вероника	+7-707-541-44-81
1560	Курмангазина	Кенже	+7-700-217-17-79
1570	Габидуллин	Серик	8-777-661-22-54
1574	Мухина	Татьяна	+7-701-481-28-73
1575	Стрельченко	Светлана	8-705-838-19-15
1576	Мукаш	Мирболат	+7-771-763-77-77
1581	Личковаха	Виталий	51-10-10
1520	Даулбаева	Гульмира	+7-705-246-47-09
1521	Хабарова	Лидия	+7-701-537-79-51
1596	Трошкина	Галина	+7-701-488-65-33
1524	Сулейманова	Расима	+7-702-136-67-79
1525	Копысова	Майя	+7-926-783-49-38
1549	Шарипа Нагашбай кызы	Жамангарина	8-702-919-22-17
1527	Кунакбаев	Пайзола	+7-701-782-33-72
1522	Баянов	Шимберген	41 61 22 \\\\ 8 701 343 76 53
1563	Алмагомбетова	Камшат	+7-705-345-84-58
1528	Нуржанов	Задыгерей	+7-701-390-13-43
1532	Ярославцева	Галина	+7-747-185-82-46
1542	Бажанова	Лилия	+7-701-230-19-54
1544	Бегунова	Екатерина	+7-701-431-34-26
1561	Мауленова	Марзия	+7-701-855-26-33
1564	Дермуханова	Гульназ	+7-777-120-05-63
1567	Ирмаганбетова	Айсауле	+7-701-939-24-78
1568	Жубатыров	Кантуре	+7-701-250-41-61
1572	Бердибаева	Гульжанат	+7-747-548-08-03
1582	Сеитова	Рулия	+7-701-640-93-80
1586	Сарсенгалиева	Мира	+7-747-667-62-29
1590	Ильясова	Камара	+7-702-572-49-62
1593	Утарова	Бахиткуль	+7-707-281-30-51
1565	Фролов	Андрей	+7-775-506-65-30
1578	-Подойникова	Панкова	+7-705-520-89-29
1587	Куратова	Алена	+7-771-027-30-96
1592	Утянова	Рауза	8-777-031-78-65
1594	Советбаев	Акылбек	+7-701-170-50-77
1608	Бондаренко	Дмитрий	+7-771-225-28-08
1611	Василенко	Татьяна	+7-707-198-82-51
1612	Губайдуллина	Галина	+7-747-110-52-60
1617	Кваша	Виктория	+7-705-288-68-65
1625	Ногай	Владелина	57-28-72
1630	Нарожный	Дмитрий	+7-708-344-53-23
1602	Кулмуханбетова	Жанна	+7-702-376-14-06
1645	Ким	Владислав	+7-775-405-99-02
1646	Зейбель	Виктор	+7-701-499-73-17
1660	Бойко	Зоя	+7-771-290-25-37
1666	Фаст	Наталья	+7-701-427-78-14
1667	Дахно	Константин	+7-701-599-35-29
1672	Бримтай	Жанар	+7-700-967-27-35
1613	Султанов	Ренат	+7-708-981-91-78
1614	Аликулова	Динара	+7-777-505-22-33
1673	Подлесная	Татьяна	+7-701-651-57-08
1675	Головань	Денис	+7-702-446-17-02
1676	Зотина	Ольга	+7-707-770-48-03
1615	Кушбаева	Дамира	+7-(75-)-250--8-4-
1616	Искакова	Гульсим	+7-771-292-35-89
1609	Гусейнова	Фикирназ	+7-702-827-65-11
1639	Вадим  Анатольевич	Бельковец	+7-702-180-56-64
1627	Иванов	Артем	+7-702-670-11-60
1633	Жубаниязов	Ануар	+7-707-699-34-11
1635	Казымбетов	Амангельды	+7-701-471-86-94
1641	Почтарев	Егор	8-707-988-83-33
1642	Леонова	Ольга	+7-705-579-56-36
1652	Овчинников	Виктор	+7-705-378-40-14
1653	Есетова	Ляззат	+7-705-240-18-55
1661	Абдиразакова	Айслу	+7-702-392-53-57
1663	Набокова	Галина	8 771 294 88 02\\\\\\\\\\\\21 31 27
1664	Казиева	Гульбану	+7-701-343-80-11
1665	Ержанов	Сагитжан	+7-776-752-11-57
1668	Молдагиреева	Асель	+7-771-687-48-57
1671	Билпиев	Раинбек	8-775-061-66-94
1628	Кадралиева	Гульнара	8-778-730-58-28
1634	Тлеубаев	Максат	+7-777-120-07-70
1638	Исмаилова	Акжаркын	+7-778-597-25-72
1686	Салим	Любовь	+7-701-389-90-40
1690	Николенко	Василий	+7-705-873-35-33
1695	Янголь	Ольга	+7-777-526-99-68
1711	Кудлай	Ольга	+7-707-302-63-72
1718	Коверец	Оксана	8-776-825-55-20
1719	Пирог	Сергей	96-27-60
1724	Зюзина	Тамара	+7-701-147-05-67
1727	Шарифуллина	Кенжегуль	8-747-114-27-97
1734	Степанченко	Наталья	+7-701-588-30-95
1745	Чередниченко	Владислав	+7-777-800-16-38
1760	Мягкая	Кристина	+7-777-580-10-47
1761	Семенихина	Галина	+7-701-778-75-45
1684	Аботова	Гульхан	+7-778-123-98-30
1693	Кудрявцева	Марина	+7-707-303-52-38
1696	Сагандыкова	Лейла	+7-747-951-71-00
1699	Ермекбаева	Лаура	+7-747-654-91-72
1691	Советбаева	Жанагул	+7-778-644-00-26
1759	Мырзыгали	Картемин	414528
1697	Измагамбетов	Султан Избалар улы	+7-702-565-65-85
1751	Искалиев	Еркин	+7-701-303-44-73
1701	Шалмаханов	Данияр	+7-775-068-84-62
1703	Ордагалиева	Гульжанар	+7-700-184-04-57
1705	Кемалова	Акмарал	+7-771-229-09-28
1706	Бекмухамбетова	Мария	+7-771-102-02-65
1714	Самбурова	Юлия	+7-701-398-43-68
1721	Узбекбаева	Бибинур	8-702-232-72-51
1723	Халбаев	Самат	+7-708-908-80-11
1725	Гусева	Валентина	985762
1728	Наренова	Эльмира	+7-778-341-27-33
1730	Нурушев	Тимур	+7-707-880-50-39
1736	Неверов	Никита	+7-775-469-59-40
1738	Игликов	Саид	22 02 46
1739	Мандыбаев	Нурлан	+7-701-657-78-38
1742	Калдыгулова	Жамал	21-40-26
1744	Логинов	Сергей	+7-771-119-15-26
1750	Морозов	Вадим	+7-777-032-73-53
1757	Сагиндыкова	Мария	+7-705-919-93-79
1717	Храмов	Антон	+7-707-883-96-42
1753	Тулегенова	Мирамгуль	+7-771-168-63-99
1766	Нигматуллина	Элина	+7-747-299-72-10; 44-85-00
1769	Евко	Валентина	556309
1770	Ильина	Татьяна	+7-705-323-86-24
1764	Жунусбекова	Адель	+7-747-788-69-21
1765	Садирбаева	Тюльпан	+7-701-405-11-05
1772	Ильина	Ирина	44-88-13
1767	Кустанов	Аблай	+7-701-347-26-42
1774	Журба	Алексей	+7-707-887-83-79
1775	Павленко	Наталья	+7-777-158-97-57
1782	Лысенко	Илья	+7-702-107-12-20
1790	Мамыш	Серикбол	+7-777-156-93-33
1807	Пономаренко	Николай	+7-705-918-03-41
1822	Мощенко	Александр	+7-771-184-18-41
1823	Жумабек	Нурболат	8-701-370-86-22
1781	Сауанаева	Лейла	+7-701-420-23-98
1824	Шецель	Александр	+7-777-156-87-16
1783	Жанасов	Марат	8-701-382-87-67,8 771 783 57 19
1787	Королева	Елена	+7-705-480-56-18
1792	Турахметова	Асия	+7-771-807-12-12
1784	Лариса	Бенек	7-747-238-70-42
1777	Амирова	Жаннат	8-702-277-87-77
1797	Кобжасаров	Болат	8-771-784-53-55
1798	Шишова	Жанна	+7-747-135-98-50
1803	Ташбулатов	Муллоян	+7-771-185-90-32
1804	Жумагалиев	Серик	+7-705-713-13-02
1811	Былкайрова	Айжан	210192
1812	Кульчикова	Надежда	+7-701-327-67-55
1813	Рожкова	Валентина	+7-701-584-95-40
1814	Алишева	Баян	+7-771-819-60-90
1818	Умирзакова	Сауле	+7-777-491-34-76
1819	Шарипов	Акимгали	8 771 784 73 23(Нуршат дочь)
1821	Игольников	Дмитрий	+7-747-121-23-84
1852	Самбурова	Валерия	+7-771-692-40-68
1853	Пеннер	Ольга	+7-778-366-16-46
1854	Скориков	Александр	8-777-505-82-60
1870	Матказина	Аида	+7-702-392-49-09
1876	Пелешко	Марина	+7-705-823-62-17
1878	Ким	Владислав	+7-708-982-20-30
1855	Енсегенов	Арман	41-37-29   8 701 767 25 99
1860	Киябаев	Альбек	+7-707-894-24-06
1881	Литвиненко	Светлана	8-777-43-48-657
1887	Самара	Василий	+7-701-566-00-50
1893	Тимошенко	евгений	+7-705-444-26-24
1899	Павленко	Татьяна	76 01 40, 8 705 380 1887
1902	Ковганенко	Галина	+7-702-351-96-81
1904	Телюх	Алексей	+7-701-728-15-21
1888	Касимова	Ирина	+7-701-276-82-55
1911	Ивашин	Александр	+7-771-893-53-99
1920	Вихтуренко	Валерия	+7-747-285-32-82
1864	Светлана	Шецель	+7-777-964-95-22
1927	Шершнёв	Вячеслав	969134
1891	Немчинова	Василиса	+7-705-536-47-77
1892	Бочкова	Ия	+7-705-378-54-04
1900	Жумагалиева	Мустахима	+7-701-342-09-71
1901	Тлеубаева	Акерке	+7-777-661-30-84
1903	Кобзев	Сергей	+7-701-495-86-09
1914	Каражанова	Альмира	+7-705-919-44-66
1917	Кантарбаев	Артур	8 707 343 88 07 \\\\  57 25 39
1875	Исимова	Дания	+7-701-888-82-01
1889	Евгений	Голушко	21-97-54; 8-701-384-38-20
1879	Немчинова	Василиса	+7-705-536-47-77
1924	Петрова	Валентина	97-66-63
1894	Суегенов	Азамат	+7-777-966-28-70
1898	Бердиев	Дуйсенбай	+7-775-605-40-67
1939	Насырова	Сазида	+7-771-122-96-41
1934	Барчене	Наталья	448197
1941	Егорова	Лиана	+7-747-102-67-60
1944	Мирная	Светлана	+7-705-242-59-55
1951	Коноплева	Светлана	97 64 55  \\\\  8 771 108 24 90
1945	Трахимчук	Любовь	+7-705-213-50-05
1975	Лисина	Виктория	+7-701-914-30-16
1986	Романюк	Борис	+7-775-685-91-14
1955	Вахидова	Раиса	+7-702-189-89-00
1956	Айбекова	Асем	+7-707-937-93-62
1988	Подгорный	Алексей	+7-777-017-14-82
2003	Куценко	Алексей	+7-701-130-38-14
2011	Бельковец	Наталья	+7-702-889-90-66
1964	Еримбетова	Талшшыбек	+7-702-247-75-78
1963	Ниетбаева	Гулгул	+7-707-668-71-41
1935	Нурмагамбетова	Сулу	8-747-110-40-74
1966	Бочкова	Светлана	+7-702-528-80-26
1970	Багаутдинова	Розалия	217315
1974	Абдурахманов	Юсуф	+7-707-706-80-87
1977	Утемагамбетова	Шынаргуль	8-705-917-48-18
1978	Зайцев	Евгений	+7-707-904-67-99
1981	Касимов	Нурлан	+7-771-108-07-82
1983	Онайбаев	Жасулан	+7-705-917-94-78
1984	Куранова	Александра	+7-777-032-69-39
1991	Паутов	Сергей	+7-701-397-45-25
1993	Бисенова	Айжан	+7-771-108-03-95
1994	Бактияров	Нурлыбек	8-778-337-36-00
1997	Великанова	Елена	+7-777-193-24-82
1999	Телемгенов	Нурсултан	+7-702-404-19-91
2004	Касенов	Султанбек	+7-771-225-44-94
2005	Богданов	Артур	511729
2035	Мельник	Николай	+7-777-193-20-58
2043	Мороз	Ольга	+7-771-160-35-56
2044	Карабалин	Максат	+7-776-905-56-95
2047	Бондаренко	Тамара	+7-777-659-00-94
2012	Романкулова	Жулдыз	+7-705-476-31-51
2055	Данилевская	Оксана	+7-701-618-94-41
2065	Зеленина	Галина	+7-771-225-15-05
2078	Слипченко	Галина	+7-701-601-45-50
2085	Черненко	Вадим	8-701-457-79-96
2058	Светлана  Александровна	Кобзарь	+7-771-187-48-70
2092	нет	Талгат	Жанабаев
2014	Ищанов	Асылбек	+7-778-550-12-47
2049	Асфандиярова	Галина	+7-701-486-94-93
2015	Арыстангалиева	Макен	+7-778-120-55-53
2017	Айтышбетова	Сауле	+7-702-368-65-26
2019	Марченкова	Ирина	+7-701-390-38-80
2023	Антипова	Раиса	+7-701-740-96-05
2025	Сапаргалиев	Бердибек	+7-771-517-20-92
2026	Нилова	Мария	+7-705-235-31-45
2029	Чанчаров	Ренат	+7-771-518-21-11
2031	Такманов	Александр	+7-771-785-55-50
2032	Оспанова	Айнагул	+7-747-791-59-19
2036	Бикенова	Айнагуль	+7-705-418-36-03
2037	Махрачева	Светлана	+7-701-336-05-65
2046	Жакипова	Айнур	87051840
2048	Кожакова	Жанар	8-771-204-26-63
2050	Куккозова	Асел	+7-707-847-35-24
2053	Скачкова	Виктория	8-775-332-58-73
2059	Буркутбаев	Темиртай	+7-775-990-57-82
2060	Белявцева	Галина	+7-777-434-44-85
2061	Есенгалиев	Кабакпай	+7-701-399-77-56
2071	Даутаева	Нурсулу	+7-701-410-76-20
2075	Елюбаев	Жумасеит	+7-778-678-00-06
2076	Кусбармаков	Нурлан	+7-776-780-79-80
2091	Дронов	Алексей	+7-701-527-15-19
2080	Рыскулова	Динара	+7-701-591-39-39
2090	Тургалиев	Курмангали	+7-777-554-69-69; 40-21-63
2093	Жаналина	Гульзат	+7-777-311-78-78
2115	Биндер	Владимир	984175
2122	Кофлер	Сергей	+7-705-158-21-37
2094	Шарипова	Елена	+7-708-278-05-52
2097	Глумов	Станислав	8 701 653 65 93, 97 63 74
2125	Черная	Елена	+7-777-339-98-99
2131	Гаркавый	Николай	+7-747-461-05-40
2133	Бальцер	Максим	+7-705-380-32-01
2137	Ким	Владислав	+7-775-405-99-02
2139	Лесниченко	Сергей	+7-775-847-38-65
2141	Мильдер	Александр	227768
2149	Торопчина	Оксана	+7-708-556-43-59
2156	Локко	Елена	+7-707-618-53-73
2161	Аксеит	Тимур	+7-702-972-54-57
2168	Булах	Сергей	+7-705-171-66-95
2104	Жанбулатова	Молдир	8-701-484-94-84
2100	Шаненова	Г	514850
2106	Кудайбергенова	Мая	+7-747-228-52-67
2109	Скрыльникова	Лариса	+7-771-023-55-86
2112	Плешакова	Людмила	+7-701-789-05-90
2116	Махамбетияров	Бауыржан	+7-708-188-73-03
2121	Женеисов	Терек	+7-702-907-78-64
2142	Климентьева	Ольга	+7-708-260-87-70
2145	Султангалиев	Марат	+7-961-929-11-19
2146	Татеров	Асхат	+7-702-665-66-65
2147	Сакилбаева	Мадина	+7-707-481-06-58
2148	Султангалиева	Марина	+7-775-424-40-37
2160	Барков	Петр	+7-777-577-65-87
2172	Елезаров	Василий	114060
2173	Султанова	Шара	+7-701-182-38-61
2174	Лекерова	Хазира	+7-747-307-47-86
2179	Атабаева	Асем	+7-775-250-85-14
2180	Жумагалиева	Зейнур	40 17 72 / 8747 551 74 03
2181	Ахметова	Гульжайнар	+7-747-357-64-53
2182	Морозова	Роза	+7-701-383-69-69
2196	Пышный	Дмитрий	+7-705-575-95-96
2216	Камынина	Ольга	+7-701-420-63-94
2217	Зейфертас	Ирина	8-701-325-43-00
2228	Резник	Сергей	+7-702-106-39-23
2230	Истомина	Елена	+7-777-779-53-36
2232	Болотских	Виталий	+7-705-630-09-40
2233	Гёкоглу	Альмира	21 99 10 \\\\\\\\8 701 719 30 97
2242	Зозуля	Наталья	+7-777-961-21-50
2251	Тригуб	Наталья	+7-777-658-36-17
2187	Садыкова	Малика	+7-701-222-32-42
2189	Жанакбаев	Берик	+7-705-567-52-81
2195	Имашова	Ризида	+7-775-905-87-88
2198	Мешков	Николай	+7-705-478-25-24
2205	Табибергенова	Гульшат	+7-771-784-60-78
2208	Милокумов	Сергей	8-705-479-34-46
2210	Чернышов	Петр	+7-701-747-26-60
2183	Чингиз	1982	Кутанов
2194	Уркунов	Куандык	+7-702-105-32-91
2212	Мустоянова	Алтынгуль	+7-701-671-87-33
2214	Копысова	Диана	+7-926-783-49-38
2215	Тумышев	Кайрат	+7-708-516-79-01
2223	Карагулова	Карылга	+7-701-659-68-01
2224	Маруев	Анатолий	+7-777-277-10-41
2225	Алмахова	Жадыра	8-702-365-18-29
2227	Ковалева	Татьяна	+7-777-185-34-44
2231	Корнеев	Александр	+7-701-674-03-04
2234	Попов	Николай	8-701-654-22-40
2238	Мингазова	Данна	+7-747-420-37-90
2239	Молдабаев	Басибек	+7-700-244-97-52
2243	Кибирева	Оксана	+7-702-663-91-44
2248	Сарсенова	Сания	+7-705-972-66-76
2252	Ауесов	Замедин	21-51-09
2280	Астаповский	Артем	+7-777-813-54-30
2284	Иваненко	Елена	+7-707-228-95-89
2285	Хайруллина	Роза	+7-775-175-99-11
2291	Долгих	Ольга	+7-701-444-17-83
2292	Серегин	Илья	+7-776-070-29-32
2295	Аккалжан	Аслан	8-771-293-06-31
2302	Полушина	Татьяна	21-99-66
2306	Литвиненко	Галина	+7-705-537-63-85
2309	Боровец	Альфия	+7-701-604-52-59
2316	Аякберген	Алибек	+7-777-800-06-44
2317	Волошин	Юрмй	+7-747-263-26-14
2319	Фокина	Татьяна	+7-705-744-81-49
2326	Терновская	Наталья	+7-771-609-20-15
2266	Кузнецова	Татьяна	+7-701-661-82-53
2271	Туганов	Дин-ислам	+7-707-244-48-17
2272	Татибаева	Жания	+7-701-172-37-33
2275	Болтаев	Сонат	+7-771-248-74-54
2278	Аймуханова	Гулмай	+7-707-415-65-24
2283	Оспанова	Улмекен	+7-707-750-41-41
2286	Лобанова	Татьяна	21-03-60
2290	Мочалов	Дмитрий	+7 911 99 88 711
2293	Шишов	Александр	98-41-73, 87013669359
2296	Бижанов	Малик	403304
2298	Сальникова	Мария	+7-701-490-07-44
2300	Казакова	Юлия	40-80-66: 8-701-716-86-25
2312	Абуова	Нуржамал	+7-701-490-02-40
2315	Габдрахманова	Людмила	+7-777-928-05-61
2323	Залалетдинова	Магафия	40-62-78
2327	Сейтов	Аймурат	8-778-677-70-77
2328	Попова	Людмила	212875
2336	Карамулдинова	Жанна	+7-707-604-86-07
2337	Мурзагулов	Нурлыхан	8-705-967-29-39
2341	Хельгрен	Валентина	+7-777-167-87-20
2345	Руденок	Ирина	+7-701-301-37-40
2358	Хорошайло	Елена	+7-705-839-56-78
2359	Ли	Сергей	217692
2360	Файзулина	Альбина	+7-777-159-23-92
2365	Зотин	Андрей	+7-777-554-48-61
2366	Конакбай	Диана	+7-705-604-23-48
2367	Бычин	Борис	+7-701-661-88-81
2375	Абдина	Акмарал	+7-708-261-37-97
2380	Семьян	Екатерина	+7-747-568-92-19
2342	Салихова	Гузама	+7-778-389-18-44
2381	Коханая	Наталья	+7-701-420-37-06
2385	Герасименко	Любовь	+7-747-320-70-24
2343	Димагамбетова	Жынар	+7-705-820-78-04
2347	Узакпаева	Калима	+7-701-521-50-15
2351	Рейсова	Шынар	+7-778-461-64-61
2355	Воронцов	Игорь	+7-705-479-48-58
2361	Ергалиев	Мурат	8 707 115 31 44/53 03 45
2363	Урманов	Даурен	+7-702-368-98-68
2368	Оспанов	Есет	8-777-678-86-49
2370	Айтмагамбетов	Муслим	+7-701-479-14-20
2372	Шукаева	Айман	+7-701-243-15-44
2376	Аймагамбетова	Сария	+7-701-404-98-67
2377	Жалашев	Малик	8-777-92-82-969
2379	Досмухамбетова	Адия	+7-778-042-73-19
2383	Хукаева	Макка	+7-700-600-00-08
2387	Вагапов	Алексей	+7-707-997-35-96
2388	Актаева	Мирамгуль	+7-771-290-30-21
2391	Матвеев	Юрий	+7-701-244-27-47
2397	Турмашев	Арсен	+7-777-025-51-35
2382	Ткачев	Николай	+7-705-330-02-08
2386	Жалмагамбетова	Асель	8-708-920-64-60
2414	Калманов	Митя	+7-775-418-03-54
2432	Базыгин	Алексей	+7-707-682-84-33
2422	Лобова	Нина	960121
2425	Хасангалиева	Мерей	+7-778-571-48-97
2442	Сёмкин	Юрий	21 08 55
2445	Бондаренко	Ирина	+7-701-347-11-42
2448	Собченко	София	96 84 90\\\\\\\\8 705 495 42 17
2460	Гордиенко	Игорь	+7-701-482-82-80
2464	Зинченко	Наталья	+7-701-316-24-12
2469	Миронюк	Ирина	+7-701-529-90-36
2486	Шамсуллина	Альбина	+7-777-786-02-59
2426	Мешкова	Вера	+7-747-499-49-53
2447	Лия	Марошьян	+7-747-266-64-57
2427	Искиндирова	Алия	+7-707-914-90-00
2435	Сулейменов	Артур	99 63 82/ 8 702 940 44 35
2439	Хожаев	Нурлан	+7-708-693-56-41
2430	Ушанова	Евгения	т. 87773400639
2431	Турегалиева	Камила	+7-705-479-03-38
2433	Алиева	Айнур	+7-702-437-58-20
2434	Жубанова	Фариза	8747-178-16-54
2438	Лапенков	Данил	+7-705-819-70-59
2440	Махтанова	Шынар	+7-775-071-67-12
2443	Джаксымбетова	Карлга	+7-700-550-19-50
2444	Садирова	Акзат	+7-778-533-74-36
2449	Старцев	Михаил	+7-771-184-14-38
2454	Кадралиев	Сергей	+7-701-748-18-14
2455	Турегалиева	Асел	+7-705-380-57-08
2470	Глазунов	Анатолий	44-86-17 . 87024401720
2472	Космагамбетова	Ботагоз	8- 705-377-13-35
2473	Козиев	Адилхан	+7-705-919-15-35
2478	Пищальников	Станислав	+7-777-434-34-35
2482	Зубкова	Татьяна	+7-701-125-65-36
2484	Алданов	Жумасит	+7-705-476-59-87
2451	Сагынгалиева	Алия Конакбай кызы	41-72-39; 8-707-682-42-32
2505	Ли	Виктория	8-705-970-60-70
2519	Гарадаглы	Эльмар	8-777-223-80-48
2520	Солоненко	Ольга	+7-701-153-70-33
2530	Мурзагелдина	Айжан	+7-771-069-50-81
2506	Тлеулиева	Бибисара	+7-705-835-50-77
2507	Атерехова	Ирина	+7-777-506-32-95
2532	Танжарбай	Айбек	+7-700-742-52-24
2543	Савин	Владимир	962949
2544	Таланин	Павел	+7-771-179-53-48
2556	Шабовта	Элеонора	+7-705-313-77-65
2559	Досалин	Асан	+7-701-788-24-95
2563	Гольц	Елена	96-92-51
2569	Сакатина	Марина	8-777-928-75-76
2571	Рой	Валентина	21 92 15 / 8 705 242 60 03
2510	Лекерова	Алмагуль	8-702-379-89-47
2574	Кошкинбай	Анаргул	+7-702-434-03-08
2525	Боранбаев	Майранбай	+7-747-785-53-00
2527	Баркова	Анастасия	+7-777-577-65-87
2551	Акмарал	Анапина	+7-775-480-90-84
2517	Жумашева	Гульнур	+7-775-880-62-64
2531	Варфоломеев	Андрей	8-701-123-48-30
2533	Логинов	Сергей	8-\r\n771-119-15-26
2539	Узюмова	Мадина	+7-701-361-16-74
2545	Федоров	Илья	+7-778-333-35-95
2547	Молдагулов	Аскан	+7-776-772-02-72
2550	Давлетов	Сарсен	+7-705-391-62-05
2553	Бурушев	Азамат	+7-701-879-01-01
2554	Алдашев	Жанибек	+7-701-464-23-63
2558	Попова	Оксана	+7-701-173-39-85
2562	Куликенов	Тлекжан	+7-705-767-81-81
2564	Каирбаева	Бактыгуль	+7-705-539-01-13
2565	Шадияров	Нуржан	25 16 36 \\\\8 701 915 59 37
2575	Желмагамбетова	Телектес	+7-705-327-70-06
2576	Кургаева	Ольга	+7-747-157-80-06
2542	Махатова	Ляззат	+7-777-111-92-22
2593	Биалиева	Светлана	+7-705-478-61-61
2589	Козаченко	Вячеслав	+7-707-170-10-28
2595	Джурамбаева	Жанар	+7-771-520-42-40
2588	Уразбаев	Женис  Тугельваевич	+7-775-891-74-66
2597	Каражанова	Алия	+7-776-769-04-40
2591	Санкеш	Ансар	8 705 837 08 37(папа Ербол)
2592	Бельковец	Александра	+7-747-875-02-10
2600	Ли	Александр	+7-700-683-39-51
2613	Амирова	Жанар	+7-701-389-57-45
2603	Чиликин	Евгений	+7-708-914-51-37
2611	Кузёма	Наталья	+7-778-100-35-07
2645	Островская	Алена	+7-776-772-37-28
2617	Койшибаева	Аружан	+7-771-185-46-10
2618	Ермакова	Валентина	+7-702-115-69-66
2622	Бектасова	Махаббат	+7-707-504-54-90
2605	Вяльцев	Алексей  Викторович	+7-747-108-93-14
2616	Федорова	Кристина	+7-708-188-54-91
2624	Вахитов	Раиль	8-771-230-39-99
2625	Есенжолова	Айнур	8 702 276 33 30,8 747 213 82 38
2628	Имангалиева	Динара	+7-777-760-18-88
2632	Сомова	Алиса	+7-701-293-79-61
2635	Мокрецов	Владимир	+7-701-434-18-45
2662	Лариса	Ким	+7-707-617-04-02
2636	Дермуханов	Даулет	+7-707-376-42-08
2637	Бахиева	Ляззат	+7-702-435-35-99
2639	Ережепова	Гулмира	+7-707-105-27-88
2641	Гнедова	Тамара	+7-747-366-57-91
2643	Логунова	Светлана	+7-707-847-82-08
2648	Баянова	Надия	+7-705-878-68-72
2652	Кармеев	Евгений	+7-776-533-55-38
2653	Соловьева	Анастасия	+7-701-315-22-90
2661	Серикбаева	Жанат	8-702-309-57-00
2665	Бисенгалиева	Алия	+7-707-160-61-16
2656	Исмагулов	Кобланды	+7-701-620-70-30
2659	Жакасов	Серик	+7-701-189-76-59
2673	Оголь	Василий	8-705-917-01-69(ж); 28-5-83; 8-771-290-01-69
2680	Петерсон	Надежда	8-747-546-46-68
2669	Тажибаев	Умирбек	+7-702-155-92-36
2681	Карло	Ольга	+7-705-839-59-18
2695	Тяпкин	Александр	+7-707-241-65-77
2718	Тарасенко	Анна	+7-700-953-61-43
2670	Новиков	Геннадий	+7-777-185-98-48
2674	Жанибекова	Светлана	+7-778-966-67-01
2675	Абенова	Жанылсын	+7-705-288-34-12
2671	Арыстангалиева	Моши	+7-778-120-55-53
2687	Альжанов	Бекбол	+7-775-169-01-87
2678	Валиева	Маргарита	+7-701-144-66-13
2696	Бектемиров	Арслан	8-747-519-70-70
2679	Черткова	Светлана	+7-701-570-80-39
2683	Жуков	Константин	+7-702-364-37-23
2686	Тарасов	Валерий	+7-775-358-40-00
2691	Калмагамбетова	Айжан	+7-778-180-14-94
2693	Сарсенгалиева	Бигайша	+7-705-556-05-09
2697	Борзова	Олеся	21 08 68
2702	Кулетенов	Мурат	+7-775-602-02-25
2703	Усманов	Давид	8-705-479-69-18
2704	Хайрзаманова	Алина	8-775-320-60-43
2708	Рязапова	Елена	+7-701-768-48-75
2715	Нурманова	Нурсулу	8-707-433-86-31
2709	Ешимова	Людмила	+7-771-182-48-50
2710	Фатеев	Василий	+7-701-511-01-49
2712	Балауиева	Анара	22 08 71
2713	Сайтиев	Роберт	+7-701-297-29-60
2716	Картикенов	Барлык	+7-701-728-58-25
2717	Кушкенова	Клара	8-701-620-70-30
2719	Сабашникова	Вера	+7-701-481-37-82
2721	Захарова	Наталья	+7-701-521-48-82
2723	Жубанов	Анет	+7-777-800-31-59
2726	Ильясова	Майра	+7-708-261-62-76
2767	Гирос	Яна	+7-702-167-10-62
2781	Лиманская	Юлия	+7-707-884-11-53
2751	Басаров	Ерлан	+7-707-059-52-33
2782	Карло	Ольга	+7-705-839-59-18
2755	Жансуйгенов	Аким	51-09-14
2794	Фоменко	Раиса	8-705-271-57-40
2760	Кувандыков	Максат	+7-778-100-81-76
2803	Юрман	Борис	+7-701-714-75-06
2807	Долиновская	Анастасия	+7-747-689-49-17
2764	Махатова	Багдагул	8-702-510-96-88
2812	Бондаренко	Татьяна	+7-707-847-20-71
2818	Пинтяк	Оксана	+7-(77-)-156--8-6-
2821	Сандыга	Томара	+7-705-235-44-87
2822	Головань	Екатерина	+7-702-446-17-02
2826	Мустафина	Зауреш	+7-702-997-61-21
2830	Гайдай	Светлана	+7-771-599-55-09
2766	Суегенов	Руслан	8-707-873-95-71
2772	Аймагамбетова	Сария	+7-701-404-98-67
2775	Калниязова	Клара	+7-747-102-07-62
2788	Билалова	Хава	+7-778-577-19-27
2790	Талканбаева	Светлана	+7-747-121-82-72
2792	Цыганков	Александр	8-771-784-48-85
2796	Наурузова	Алмагуль	+7-705-474-60-55
2786	Акбота	Шайхина	+7-771-608-18-75
2798	Уразкулов	Магауле	+7-702-000-14-12
2810	Кушниязова	Сауле	+7-708-119-53-18
2813	Алабаева	Мирамгуль	+7-747-403-40-29
2817	Савельева	Светлана	+7-701-446-96-63
2820	Хасанова	Эльвира	+7-701-483-96-96
2827	Баркова	Татьяна	+7-771-227-72-70
2832	Кожакметова	Акмолдир	+7-747-102-24-27
2833	Клочкова	Ольга	+7-912-225-94-37
2795	Суюндикова	Гульбану	52 2 52
2839	Шкарупа	Наталья	231665
2846	Козявкина	Лидия	214045
2848	Черненко	Елена	8-705-242-59-55
2834	Кыдырбаева	Ляйляш	+7-701-351-20-19
2836	Захарова	Маргарита	+7-701-255-78-20
2854	Власенко	Алексей	8 705 229 35 20,+7 700 683 92 31
2856	Крупская	Алена	23-8-50; 8-771-768-30-43
2851	Ахазаев	Турпал-Али	8-701-666-00-20
2858	Зверян	Глеб	+7-950-187-07-86
2863	Тагыбергенов	Алихан	+7-776-278-90-24
2864	Павлиашвили	Тамази	+7-747-012-95-61,8 705 560 53 39
2884	Кроль	Наталья	+7-701-649-94-16
2904	Никулина	Наталья	+7-747-446-80-38
2911	Панченко	Любовь	+7-778-257-69-51
2912	Щупляк	Леонид	+7-702-336-67-50
2866	Давыдова	Зульфия	+7-701-284-13-57
2869	Жанабергенова	Сания	8-701-503-24-34
2871	Осупов	Имам	+7-776-795-01-95
2915	Аманчин	Нуржан	+7-775-934-50-65
2874	Абдулганиева	Людмила	+7-701-388-47-57
2873	С.М.	Сафина	8-775-887-26-31; 45-26-31
2875	Хамитова	Бибифатима	+7-778-146-76-13
2876	Шарипова	Нуршат	+7-701-311-54-04
2892	Алдабергенов	Аманжол	+7-771-084-44-12
2893	Решетников	Андрей	538104
2894	Дмитриева	Наталья	8-707-897-34-84
2897	Пивоварова	Татьяна	+7-777-307-09-47
2898	Таджимуратова	Галя	+7-775-924-39-13
2900	Жаканова	Марзия	+7-776-777-36-60
2907	Выжленкова	Валерия	+7-778-411-13-80
2908	Грызунов	Юрий	234195
2914	Бейсембаева	Динара	+7-705-630-69-67
2879	Бекешев	Мырзагул	+7-771-187-77-85
2899	Курманова	Гулзира	+7 701 603 4434
2910	Кушкинбаева	Камила  Бауржановна	+7-747-171-07-51
2916	Танькин	Юрий	401113
2920	Михальчевская	Галина	+7-747-544-36-51
2917	Логинов	Евгений	8-702-596-49-37
2924	Бойко	Татьяна	+7-747-351-40-99
2933	Луковенко	Александр	+7-771-168-25-87
2919	Ержанова	Лайла	+7-776-764-90-80
2942	Супрун	Наталья	+7-705-235-48-36
2960	Борисенок	Любовь	+7-771-122-78-48
2961	Нургужин	Алмат	+7-705-803-88-03
2963	Гильдиш	Юлия	+7-701-292-37-70
2970	Сулима	Вероника	8-708-212-23-60
2971	Семенихина	Галина	+7-701-778-75-45
2925	Имашев	Нурлан	+7-771-999-89-88
2981	Дубинина	Раиса	+7-701-791-37-60
2926	Джумагалиев	Марат	+7-747-784-71-51
2928	Тельнова	Татьяна	+7-701-476-29-25
2931	Кушкинбаева	Жанар	+7-775-162-10-76
2932	Бурнитова	Гульнар	+7-775-146-49-79
2936	Балшыманова	Умит	+7-870-730-70-27
2939	Суюбаева	Гульнара	+7-707-473-25-35
2941	Смайлов	Булат	+7-705-818-54-15
2943	Алиева	Айнур	55 24 73   / 8 702 437 58 20
2946	Иноземцев	Сергей	+7-701-380-80-53
2951	Неверова	Ольга	+7-777-928-73-79
2953	Кожикова	Жанагул	+7-707-468-31-91
2965	Ермекбаева	Айша	+7-701-412-61-31
2967	Жанысова	Майра	+7-701-559-17-00
2975	Буранбаев	Бауржан	8-701-570-21-58
2976	Кусаметова	Ляззат	+7-777-343-87-44
2977	Муратов	Мирхат	+7-777-928-08-87
2978	Харламова	Марина	+7-701-755-88-90
2980	Ещанов	Алишер	+7-777-159-32-40
2989	Боронбаев	М.Б	+7-747-785-53-00
3002	Султанова	Орынша	8 702 426 86 48 (сестра Фатима)
3003	Литвинова	Юлия	+7-701-128-92-16
3010	Загорулько	Юлия	+7-705-744-64-16
3011	Решетняк	Николай	+7-776-778-69-73
3026	Гольц	Елена	8 772 687 56 69   96 92 51
3028	Рибун	Юлия	8-701-440-77-91
3045	Жубанияз	Молдир	+7-702-571-58-73
3048	Сидак	Арина	+7-771-784-67-31
3050	Сарбупина	Улмекен	+7-705-398-77-22
3059	Любовенко	Ольга	+7-701-326-81-18
3070	Лисин	Сергей	8-701-343-60-64
3073	Чернухина	Татьяна	+7-777-185-36-11
3075	Мартынюк	Евгений	+7-747-589-87-22
3005	Нахов	Нурдаулет	+7-747-530-76-46
3012	Жиенбаева	Роза	8-702-709-12-56
3013	Косумбетова	Аяулым	22-92-53; 8-707-942-86-10
3014	Тулеубаев	Нуркен	+7-702-400-20-60
3015	Талканбаева	Светлана	+7-747-121-82-72
3021	Вахидова	Гумру	+7-747-570-24-10
3024	Мусаева	Милана	+7-775-331-73-09
3027	Порошкова	Надежда	+7-702-390-93-36
3051	Клочкова	Ольга	23 07 96
3052	Кярюшев	Дамир	+7-707-113-61-02
3020	Балмагамбетова	Марина	+7-771-763-14-03
3029	Жадигерова	Аимкул	+7-705-380-43-54
3032	Чугалова	Жаныл Серик кызы	8-705-383-80-63
3053	Алмагамбетова	Камшат	+7-705-345-84-58
3056	Жубатов	Нурперзент	+7-708-213-11-83
3057	Заглядова	Надежда	+7-771-181-87-58
3060	Барков	Петр	+7-777-577-65-87
3064	Туяшева	Салтанат	+7-771-599-15-77
3067	Сотникова	Юлия	8 701 939 00 40 (мама)
3069	Абжанова	Дильда	+7-702-164-99-55
3076	Маркова	Галина	8-705-480-84-21
3078	Бакитжанова	Гульдарига	+7-701-669-97-76
3074	Айпов	Берик	+7-778-624-04-08
3091	Шевченко	Алена	+7-747-605-92-39
3104	Нурсеит	Арсен	+7-707-328-77-06
3107	Корб	Антон	+7-776-771-65-16
3112	Харченко	Валентина	+7-701-131-96-82
3144	Михайленко	Николай	44-81-50
3084	Ескожаев	Самат	8-705-202-96-95
3150	Усенко	Павел	994542
3153	Унчур	Варвара	+7-702-216-29-22
3155	Гаращенко	Зоя	+7-778-380-50-06
3082	Сукашев	Нурлан	+7-707-955-42-55
3158	Калташкин	Николай	+7-705-480-55-32
3161	Горнбахер	Светлана	21-56-13
3093	Комаров	Станислав	+7-701-695-74-96
3095	Жоголева	Надежда	8-701-617-92-09 ; 21-15-02
3100	Ермоханова	Нургул	+7-701-749-54-22
3103	Урынбасаров	Аслан	8-701-233-86-28
3102	Несебели	Амангелдина	+7-778-539-83-06
3110	Жаксыгулова	Молдир	8-702-658-58-55
3122	Мейрамгул	Мурзагелдина	+7-705-472-81-91
3117	Камалутдинова	Фания	96 35 12  8 777 031 62 72
3138	Арыстан	Кожин	+7-775-169-69-43
3127	Шарафеев	Ринат	+7-701-487-61-94
3128	Алдашева	Гульмира	+7-702-665-43-00
3111	Сартаев	Жаксыбай	+7-701-108-10-59
3130	Елисеева	Любовь	96-33-39
3134	Жазбулганов	Марат	+7-701-536-96-68
3137	Большиманов	Нурбек	+7-705-835-43-06
3139	Савинкова	Светлана	+7-919-852-39-03
3143	Джафарова	Тамила	+7-702-777-36-62
3146	Муканова	Сайрамгуль	+7-771-226-99-75
3147	Садыков	Андрей	+7-702-236-68-92
3154	Васильев	Дмитрий	+7-747-568-28-29
3157	Поляков	Николай	+7-777-491-85-22
3159	Абдирашева	Жанна	8 701 139 21 32; 21 01 33
3160	Закиров	Арман	+7-701-523-55-94
3162	Уразбаев	Азамат Жарыл Гасынович	8-771-122-13-13
3164	Базарбай	Нуртофе	+7-708-539-15-53
3173	Косарин	Виктор	+7-702-126-60-09
3180	Череватенко	Михаил	77 81 65  \\\\ 8 701 163 23 88
3191	Гусаченко	Наталья	+7-705-538-84-55
3192	Средин	Владимир	+7-705-478-13-25
3194	Ракша	Григорий	229112
3196	Марошьян	Надежда	+7-701-174-18-64
3163	Сагитов	Каныбек	+7-705-823-33-29
3198	Корницкая	Светлана	8-747-99-33-145
3165	Жакупов	Абдимурат	+7-777-505-45-04
3199	Сырым	Алмат	+7-705-419-78-48
3167	Ниетбаев	Жалгас	+7-702-780-23-10
3170	Павлова	Елена	+7-702-978-30-44
3205	Гирос	Яна	8-702-167-10-62
3215	Бахур	Ирина	+7-775-575-77-24
3221	Сапижак	Валентина	+7-777-031-50-52
3222	Астаповский	Артем	+7-777-813-54-30
3242	Аким	Кымбат	+7-708-260-65-33
3193	Кузнецов	Василий	+7-777-527-02-73
3171	Дауренбаева	Эльмира	+7-701-509-43-92
3172	Макарова	Татьяна	+7-701-303-65-78
3179	Тулеуова	Айнур	8-702-256-68-67
3181	Шауданова	Жазира	+7-771-122-09-41
3188	Жасанов	Александр	+7-771-181-59-71
3195	Горбачева	Злата	+7-708-860-78-08
3207	Пономарев	Андрей	+7-747-788-48-52
3208	Смолянинова	Евгения	+7-747-906-12-84
3214	Аленов	Мурат	+7-771-858-68-89
3223	Шарипова	Римма	21 41 69  \\\\\\\\8 701 288 25 87
3226	Тасыгулов	Айбек	+7-702-612-72-14
3229	Тукашева	Клара	+7-747-548-09-56
3230	Аханова	Асель	+7-771-170-66-72
3232	Лапенкова	Галина	+7-705-494-11-36
3233	Галькиева	Елена	+7-771-227-45-26
3197	Нурбулатова	Гульназ	+7-705-466-28-37
3213	Шайдакова	Наталья	+7-702-598-73-07
3228	Алиев	Рамиш	+7-701-777-46-01
3260	Сугалина	Раимгуль	+7-702-574-96-21
3264	Кошевой	Николай	+7-705-919-34-46
3311	Горячкин	Алексей	+7-705-324-55-57
3317	Степанченко	Владимир	+7-701-657-10-57
3244	Тынымкулов	Жузимбек	+7-771-187-73-20
3246	Петрушов	Олег	+7-775-554-73-30
3251	Сулейменова	Индира	+7-701-229-27-77
3272	Тажмуратов	Мустахим	+7-705-398-40-05
3279	Купесов	Жасбулат	+7-777-434-53-35
3248	Ниеталиева	Кунар	+7-777-609-59-50
3265	Жаксыбаев	Хабдула	+7-771-294-55-83
3284	Соколова	Надежда	+7-771-784-02-58
3267	Сактаганова	Куляш	+7-702-240-75-45
3271	Абубакирова	Гульжакам	+7-702-350-19-63
3283	Пашкова	Татьяна	+7-705-346-11-70
3290	Тараканов	Максим	8-775-158-01-40 21-77-62
3291	Пономарева	Надежда	+7-775-449-11-15
3293	Сочнев	Иван	+7-747-458-32-74
3297	Айбеков	Серик	+7-776-751-80-80
3298	Тлеулиева	Бибисара	40-45-65. 87058355077
3300	Ермолова	Вера	+7-(77-)-179--1-7-
3301	Жирнова	Ольга	+7-775-069-13-03
3302	Ибадатова	Жадра	+7-776-752-44-66
3310	Ибраева	Самал	8 7-01 366 23 12
3312	Маруев	Анатолий	+7-705-202-49-94
3313	Васильева	Любовь	+7-702-193-75-10
3318	Наурызбаев	Мергенбай	+7-707-730-56-11
3326	Рудаков	Дмитрий	+7-778-539-42-07
3322	Клёсова	А.Н.	+7-(77-)-338--6-1-
3339	Борсук	Людмила	+7-701-357-57-42
3343	Чернышова	Анна	701-244-74-43
3371	Клишин	Вячеслав	540916
3376	Лиманская	Татьяна	+7-707-884-11-52
3344	Боранбаев	Саят	+7-771-059-65-32
3377	Пащенко	Алла	+7-705-108-10-87
3384	Лысенко	Илья	+7-702-107-12-20
3385	Карабалина	Алмагуль	+7-707-282-98-46
3386	Суйналина	Алтынай	8-705-630-13-32
3352	Волков	Сергей	+7-701-468-12-65
3353	Бекешева	Камиля	+7-701-653-77-26
3333	Султанова	Соня	+7-775-321-54-03
3346	Шаханова	Айгерим	+7-777-767-45-27
3354	Ермекбаева	Гуляим	+7-778-360-99-48
3358	Мочалов	Владимир	22 06 94
3364	Юлуева	Роза	55 80 91 \\\\8 701 791 32 15
3370	Амирбекова	Зоя	+7-701-286-14-53
3374	Мухамбетьярова	Дана	+7-708-748-06-36
3375	Чернов	Артем	+7-708-920-83-76
3381	Тулешова	Акнур	+7-747-366-87-05
3382	Базаркулов	Малик	+7-775-569-55-71
3391	Сарсенбаев	Азамат	+7-777-222-10-85
3394	Рязанова	Светлана	+7-707-715-03-04
3396	Исмагамбетова	Аида	+7-705-479-24-49
3398	Агишева	Лилия	+7-747-546-99-56
3401	Гурьянова	Лидия	+7-705-604-80-87
3411	Писецкий	Александр	+7-778-233-30-45
3417	Усенко	Людмила	99-45-42
3420	Крымский	Борис	50 03 95; 8-705-839-17-46
3458	Лаевская	Ольга	566016
3463	Верещак	Тамара	+7-705-514-24-23
3471	Негода	Надежда	+7-705-917-01-69
3476	Торопчина	Оксана	44 85 79,8 708 556 43 59
3477	Уразалина	Алтынай	+7-771-227-02-40
3478	Гмыря	Татьяна	+7-702-226-39-75
3480	Ли	Елена	217692
3414	Жубаниязова	Марзия	+7-707-579-19-66
3415	Испаилов	Руслан	+7-777-112-26-28
3416	Нежданова	Альфия	21-57-80 8-702-598-17-51
3438	Роза	Ерлан	8-77-597-93-60
3419	Ситкалиева	Нагима	+7-771-108-61-54
3460	Сулпаш	1948	Избасова
3421	Басаров	Ерлан	+7-702-059-52-33
3425	Алданов	Даурен	+7-705-605-30-30
3427	Вахитова	Луиза	+7-702-682-69-92
3435	Ермаханова	Гулмира	+7-705-309-67-83
3442	Жусупов	Кенес	219787
3445	Житников	Максим	57-27-98;8-777-695-63-52
3448	Бирюков	Артем	+7-705-549-33-35
3450	Новикова	Ольга	+7-707-244-04-71
3452	Накибаева	Айша	+7-747-266-36-59
3453	Загрединов	Рафис	+7-777-787-19-98
3454	Алписпаев	Елеусиз	+7-777-760-74-46
3455	Житникова	Юлия	+7-701-587-40-08
3456	Ишпанова	Елизавета	+7-705-730-38-02
3461	Абдирашева	Гульшара	+7-702-226-47-50
3482	Варфоломеева	Мария	8-775-33-96-786
3440	Иманбаев	Наурызбай  Максатулы	+7-701-945-07-03
3457	Елюбаева	Айман	+7-777-822-93-93
3494	Трошкин	Николай	+7-701-400-25-34
3496	Кибина	Мария	+7-771-519-30-00
3516	Сметанко	Мария	+7-705-836-86-23
3526	Мягкая	Регина	+7-771-520-73-90
3498	Земсков	Валерий	+7-701-331-04-78
3539	Костенко	Артем	+7-777-786-02-69
3499	Жумажанов	Бауыржан	+7-775-983-19-01
3556	Ерёменко	Алёна	8-702-479-92-33
3502	Акмерей	Жусип	+7-705-788-14-36
3563	Бондаренко	Галина	+7-705-378-72-98
3568	Брагина	Галина	+7-701-481-53-85
3575	Сандыга	Тамара	+7-705-235-44-87
3505	Мулдашева	Зузанна	+7-747-953-17-38
3506	Амантаева	Айнура	+7-701-191-46-73
3507	Глазунова	Надежда	21-45-89; 8-702-368-99-80
3517	Ломов	Максим	+7-776-778-99-30
3519	Канамгареева	Амандык	8-701-452-83-94
3520	Джаксымбетова	Карлга	+7-700-550-19-59
3521	Таутенова	Дана	+7-747-684-49-34
3551	Анет	Нигметуллин	+7-705-440-01-33
3522	Румянцев	Владимир	+7-701-466-98-02
3525	Петухов	Сергей	+7-705-253-89-32
3527	Утарбаева	Айгуль	+7-701-294-06-36
3529	Закиржанов	Малик	8-707-282-09-47
3530	Бекниязов	Булат	+7-701-556-61-83
3532	Дубаева	Алмагуль	+7-771-291-33-70
3533	Сьюов	Едилбай	+7-705-480-73-14
3538	Мырзатаев	Жеткерген	+7-776-888-80-98
3541	Юсупова	Райхан	+7-707-411-00-82
3542	Асанбаев	Даурен	+7-777-800-88-06
3546	Бимагамбетова	Назым	+7-702-748-03-99
3549	Саржанов	Дмитрий	+7-700-683-29-98
3552	Хохлов	Евгений	8-771-186-63-61
3553	Тулепбергенов	Дидар	+7-775-609-94-05
3555	Камалутдинов	Фарид	+7-747-202-57-04
3561	Душпанова	Раиса	+7-701-550-68-84
3580	Язитова	Анар	+7-701-555-03-41
3577	Никель	Юрий	+7-747-677-19-27
3585	Дубинин	Владимир	22-16-34
3608	Литвиненко	Анастасия	8-777-43-48-657(мама)
3589	Жубаниязов	Сергазы	+7-705-101-19-92
3617	Фетер	Александр	+7-705-381-83-29
3591	Биданова	Гульнара	+7-775-068-68-35
3581	Амантаева	Саяжан	+7-771-517-56-50
3621	Федечко	Елена	+7-701-380-82-74
3622	Мустафин	Турибек	+7-775-574-30-88
3625	Завервальд	Анатолий	+7-777-800-66-36
3592	Мешкова	Вера	+7-747-499-49-53
3627	Шишкин	Алексей	8-777-928-32-46
3628	Щеголихина	Ирина	8-701-377-04-64
3629	Перерва	Наталья	+7-701-668-56-13
3631	Косовский	Владимир	+7-777-232-98-43
3639	Вивтоненко	Роман	54-19-99; 8-701-526-26-01
3645	Николайца	Роман	+7-702-407-71-56
3646	Кротенко	Елена	+7-747-238-86-31
3593	Сабаргереева	Гаухар	8-702-151-06-33
3601	Касымов	Тимур	+7-776-711-00-67
3582	Муканбеткалиев	Абат	+7-702-840-80-08
3603	Шарафеева	Алия	+7-701-396-91-14
3584	Зауреш	Губайдуллина	219350
3610	Шатаева	Гульнар	+7-702-140-86-22
3619	Иванов	Владимир	+7-707-184-02-44
3620	Сапаргалиев	Сакпкерей	+7-702-492-20-70
3623	Лисенкова	Ирина	+7-775-425-12-77
3626	Ахтямова	Суфия	219910
3633	Джумакулов	Амандык	+7-747-153-50-66
3638	Кабылова	Аимгуль	+7-775-431-76-26
3641	Сергеева	Любовь	21-74-79
3643	Бекесов	Рустем	+7-702-255-02-57
3602	Гусейнов	Замин Али оглы	8-701-370-52-20
3660	Костин	Михаил	8-707-747-72-10
3664	Чуба	Валентина	+7-702-351-17-54
3667	Бородаенко	Алексей	8-777-228-48-92
3675	Мизецкий	Владимир	+7-985-345-72-50
3680	Туяш	Жулдыз	+7-771-293-91-93
3683	Любинская	Тамила	+7-702-241-77-77
3686	Лобан	Ирина	+7-777-928-83-79
3689	Степаненко	Наталья	8-701-358-47-31
3700	Лещук	Ирина	+7-705-444-30-13
3706	Веселовская	Татьяна	+7-701-496-48-68
3709	Краснощек	Наталья	+7-701-301-58-48
3712	Кашуба	Елена	+7-777-760-33-79
3722	Туяш	Жулдыз	+7-771-293-91-93
3661	Джармагамбетова	Бибигуль	+7-705-494-13-12
3724	Чуба	Валентина	+7-702-351-17-54
3671	Рамазанова	Акмарал	+7-775-550-86-73
3730	Борсук	Виталий	+7-775-577-12-00
3735	Гниппа	Ярослава	+7-707-252-05-68
3676	Черепанова	Елена	+7-707-593-02-08
3677	Гусева	Антонина	+7-951-673-67-18
3679	Рыскалиева	Тамара	+7-701-785-54-23
3681	Ситкалиева	Нагима	+7-771-108-61-54
3694	Мещерякова	Наталья	+7-701-330-35-02
3697	Кожабаева	Дидара	+7-777-660-55-46
3699	Дускалиева	Женесгул	+7-778-725-54-27
3704	Новикова	Надежда	+7-777-112-39-47
3716	Ситникова	Лариса	+7-701-276-85-00
3717	Есенова	Роза	+7-747-679-47-93
3721	Олейникова	Вера	21-29-74
3727	Бектабанов	Мухтар	+7-701-511-01-63
3732	Куатов	Рустам	+7-705-750-20-33
3734	Ткалич	Елена	+7-701-369-33-09
3703	Кобанова	Гульсум	+7-707-703-92-18
3750	Сотникова	Галина	+7-701-939-00-40
3757	Кубаева	Арайын	+7-701-431-90-40
3747	Ниязуллина	Гульайна	+7-705-539-65-37
3748	Ганаган	Анна	+7-771-105-65-16
3749	Габидулина	Галина	403560
3751	Ничипоренко	Ренат	+7-777-246-49-94
3753	Арндт	Виктория	+7-708-747-64-73
3764	Ким	Полина	98-89-47; 701-456-58-02
3767	Харченко	Василий	+7-775-812-22-17
3777	Кобась	Любовь	+7-776-343-38-47
3779	Избастина	Айжан	+7-747-106-12-38
3790	Лях	Андрей	+7-705-383-86-51
3800	Лыгина	Виктория	8 708 261 41 33,8 778 393 03 24
3801	Бондаренко	Валентина	+7-702-922-65-44
3805	Кондратюк	Людмила	+7-701-459-19-39
3758	Шинбаева	Разия	+7-771-102-91-76
3816	Мотькин	Александр	+7-777-611-99-77
3826	Петренчук	Татьяна	+7-701-857-66-41
3763	Курсакбаева	Мадина	8-708-758-03-23
3765	Маханов	Данияр	+7-702-278-19-17
3774	Шынар	Бакыт	+7-777-554-83-83
3770	Алмашева	Гульдария	+7-747-788-73-59
3772	Исмагулов	Даулет	+7-775-922-02-58
3762	Туяшева	Салтанат	99 24 99/   8 771 599 15 77
3782	Жумашева	Айгуль	+7-701-930-19-68
3783	Тогузбаев	Ербулат	83356019
3793	Алданазарова	Айгуль	8 778 184 30 49, 99 65 00
3797	Еналиева	Ирина	+7-777-800-34-12
3806	Виноградова	Антонина	+7-777-506-33-48
3807	Иванов	Эдгар	777-193-07-89; 7-775-607-51-73
3809	Рахметова	Кундыз	+7-778-233-50-87
3811	Блтабанова	Асел	+7-776-760-04-00
3820	Комарова	Анна	+7-701-596-62-31
3780	Гусеинова	Гюнай	+7-708-931-30-40
3784	Манкаева	Галия	701-734-56-85
3785	Тагабергенова	Нуржамал	+7-775-825-35-56
3819	Оркашпаев	Амангос	24 02 21
3830	Кайжанова	Жания	+7-701-423-55-55
3827	Сердюк	Ольга	+7-701-652-82-22
3829	Мацюта	Наталья	+7-701-404-18-58
3847	Жусип	Айсауле	+7-776-787-96-82
3831	Колосов	Дмитрий	+7-705-478-48-61
3836	Арнаутов	Александр	+7-707-414-24-04
3849	Шумахер	Валентина	+7-701-454-08-87
3852	Вивтоненко	Ольга	54 19 99    8 777 031 91 98
3837	Немчинова	Яна	+7-705-382-50-37
3838	Маханбетияров	Руслан	+7-705-494-74-31
3853	Прокопенко	Николай	8-705-823-48-60
3848	Щербакова	Татьяна	+7-708-197-99-56
3869	Бисенова	Данагуль	+7-702-268-56-42
3854	Бурхай	Екатерина	+7-708-749-00-85
3870	Туяшев	Серик	+7-777-031-35-38
3873	Романова	Елена	21 11 03  8 778 233 30 52
3855	Шевчук	Владимир	98-87-67; 8-702-103-84 -34
3872	Трошкин	Николай	+7-701-400-25-34
3882	Щупляк	Ольга	8-701-442-90-32
3887	Носенко	Алексей	+7-747-634-14-33
3902	Шепс	Игорь	8-775-977-14-48
3903	Анучина	Людмила	8-775-983-17-20
3874	Сундетов	Жанбулат	+7-702-695-12-06
3841	Юлия	Черевко	+7-777-112-22-80
3876	Попов	Игорь	8-771-678-06-92
3880	Коновалова	Антонина	+7-777-580-95-62
3881	Багирова	Маиса	+7-702-148-96-96
3889	Айкенова	Лаззат	+7-701-778-16-88
3896	Хасанова	Айгерим	+7-701-643-82-89
3901	Михайлов	Евгений	+7-702-765-59-22
3904	Мингулова	Лариса	8-707-893-52-52
3908	Шарафутдинов	Тимур	+7-747-612-03-25
3910	Матказин	Марат	+7-701-779-32-47
3911	Давлеталина	Венера	+7-778-802-17-11
3912	Хегай	Роман	+7-777-928-62-29
3913	Лукъяненко	Евгений	400326
3909	Кунуспаев	Даурен	+7-777-220-92-10
3919	Каримов	Темирлан	+7-705-839-41-40
3915	Скрыпник	Елена	+7-747-599-50-90
3922	Ельтежин	Рустем	+7-771-518-21-11
3921	Таженов	Болат	+7-775-834-31-32
3931	Каймульдинов	Артем	+7-777-506-00-07
3937	Насибулин	Гарафитин	+7-702-115-23-19
3935	Абуов	Дуйсенали	+7-702-889-95-18
3938	Югай	Юлия	+7-701-988-02-17
3946	Ким	Полина	+7-701-456-58-02
3941	Мокрецова	Марина	96-83-10; 701-488-82-51
3953	Колоджия	Карина	+7-771-508-70-36
3920	Бектурсынов	Алмат	8-705-383-96-34
3961	Жуйко	Елена	+7-701-335-16-55
3943	Егизбаев	Мурат	+7-775-178-43-14
3967	Харчук	Татьяна	8-777-660-14-66; 29-3-31
3969	Кцюк	Ольга	+7-771-304-47-16
3974	Белоконь	Светлана	+7-777-506-30-75
3989	Губер	Евгений	+7-705-567-49-46
3944	Кузнецов	Стас	+7-701-081-72-80
3950	Ибрашева	Наталья	+7-775-492-86-66
3951	Куликова	Инна	+7-707-671-50-19
3956	Жиенбаев	Ардак	8-701-381-11-86
3959	Калимов	Михаил	+7-707-379-50-37
3964	Ельчева	Наталья	+7-702-151-01-78
3965	Алдабергенова	Светлана	+7-701-468-37-65
3979	Масеев	Марис	+7-777-159-49-74
3981	Машимов	Адилхан	+7-771-226-44-53
3982	Сагитаев	Марат	+7-771-517-46-50
3954	Дмитриев	Евгений	8-705-346-27-33
3986	Жангазиева	Аружан	+7-747-251-04-08
3990	Денисов	Леонид  Александрович	+7-771-519-88-53
4002	Калашникова	Надежда	8-777-132-64-88; 8-7132-29-362
3995	Койшигарин	Талгат	+7-701-610-91-91
3998	Сыпко	Татьяна	8-771-105-76-42
4003	Таганаков	Жумабек	8 705 49*4 57 78
4004	Лукавенко	Нина	215096
4009	Черевко	Юрий	+7-702-940-12-85
4025	Чередниченко	Александр	+7-708-761-87-33
4034	Белый	Михаил	+7-701-288-29-94
4037	Хасен	Аян	+7-777-112-18-18
4039	Шох	Александр	8 701 572 50 26    8 775 069 51 26
4043	Лисицына	Татьяна	+7-701-537-81-60
4046	Галюга	Татьяна	8-701-425-40-63
4006	Тлепбергенова	Акбопе	+7-705-522-28-91
4047	Ванцай	Наталья	+7-747-135-90-02
4007	Баркова	Светлана	+7-701-549-91-32
4048	Тукина	Сауле	+7-771-791-85-70
4052	Раковская	Инна	+7-702-492-48-52
4063	Келина	Тамара	+7-707-502-11-19
4008	Жакибаев	Канат	+7-705-989-53-00
4012	Вагапов	Алексей	+7-701-997-35-96
4010	Туяшева	Набат Таутай кызы	+7-877-112-61-56
4014	Емельянова	Вера	+7-701-293-34-22
4017	Мангубаева	Асель	8 747 102 07 62 (Клара)
4021	Агишева	Мафруза	988150
4026	Мендыбаева	Раиса	+7-771-184-07-50
4029	Ниятов	Ерлан	99 58 55 \\\\8 775 334 13 24
4030	Садыкова	Айгуль	+7-705-604-00-45
4036	Ибадатова	Жадыра	+7-776-752-44-66
4042	Иванова	Светлана	+7-777-143-21-70
4044	Наушабаева	Салима	+7-747-139-37-08
4050	Черепанов	Геннадий	968410
4051	Куписов	Данияр	+7-747-310-98-96
4053	Немчинов	Александр	+7-705-536-47-77
4054	Касымов	Тимур	+7-778-533-32-37
4018	Абдигалиева	Кульмайра	+7-701-288-21-46
4027	Куспанова	Акжанат	+7-775-886-25-31
4077	Кибец	Валентина	+7-701-556-64-80
4080	Омирзак	Асылжан	+7-776-722-33-05
4082	Фольц	Юрий	57-05-34,51-50-15(раб.)
4085	Ткаченко	Лариса	+7-707-880-62-33
4090	Подлесный	Виктор	+7-702-963-02-87
4076	Кушбаева	Дамира	+7-775-250-84-99
4092	Никель	Николай	+7-777-537-85-06
4079	Куанышбаева	Нургуль	+7-777-506-19-84
4093	Розбах	Сергей	+7-705-818-06-18
4099	Якобицкая	Земфира	235035
4081	Яковлев	Валерий	8-777-928-21-27
4107	Бальцер	Наталья	99-66-08
4087	Тукенов	Айбек	+7-701-898-88-18
4108	Родькин	Юрий	8-707-103-10-14
4113	Фисенко	Надежда	+7-701-432-07-87
4114	Маханалина	Динара	+7-702-187-86-00
4089	Карыбаева	Айсауле	975956
4094	Жармагамбетова	Сапия	+7-702-492-31-67
4100	Кирьянов	Никита	+7-747-581-38-04
4101	Будников	Виталий	995056
4105	Калимова	Люза	+7-705-288-53-45
4109	Бекмагамбетова	Жадра	+7-705-383-29-92
4110	Наушабаев	Диар	+7-707-987-78-27
4112	Кушбаева	Томирис	+7-702-377-91-54
4120	Ельжанов	Сайлау	+7-705-475-47-06
4121	Айтымбетова	Мадина	+7-747-299-28-55
4123	Мынжасарова	Айжан	+7-702-749-68-67
4125	Канымгазиева	Амандык	+7-701-452-83-94
4131	Висаригова	Анита	+7-707-212-09-95
4132	Бекенова	Асия	+7-701-360-10-42
4134	Федорова	Ирина	+7-777-858-18-89
4111	Сабирова	Кенжегуль	8-702-618-87-23
4158	Морозов	Евгений	+7-705-724-84-11
4166	Лактина	Лидия	21-44-39,8 701 385 26 61
4160	Сатаева	Манар	8-705-288-32-28
4169	Харченко	Ольга	+7-705-702-14-11
4183	Ена	Анжела	+7-776-764-92-80
4186	Летин	Сергей	+7-775-632-81-31
4192	Муртазина	Диана	+7-986-775-70-32
4208	Узакбай	Акбобек	8-778-894-96-63
4209	Кригер	Ольга	8 705 53 99 552   / 50 88 50
4224	Линский	Василий	8-701-537-80-09
4164	Асулбаева	Рида	98- 89- 43
4175	Серикова	Камила	8-707-325-60-40
4180	Бикенов	Уразали	+7-705-169-96-77
4181	Маймахов	Альбек	+7-747-503-37-51
4190	Бубликов	Максим	+7-702-628-60-69
4167	Садирова	Акталап	+7-771-185-35-16
4171	Калжанова	Гульзада  Сактагановна	+7-771-519-57-30
4174	Мукиев	Жансерик	+7-705-819-08-17
4199	Виктория	Смелевская	+7-702-192-68-38
4177	Жубанышева	Багила	+7-705-432-52-28
4191	Аймагамбетов	Айдос	8-771-517-07-01
4198	Щегорцова	Анна	8-777-031-66-93
4202	Камалутдинова	Наиля	+7-771-650-08-48
4203	Аманкосов	Мурат	8-708-627-89-09
4204	Бимагамбетова	Назым	+7-705-539-89-91
4233	Марианна  Любвиговна	Саламатина	+7-778-527-49-54
4211	Колмашева	Сауле	+7-707-705-60-60
4212	Мещерякова	Надежда	+7-702-567-04-53
4213	Ерболатова	Аружан	+7-701-365-97-03
4225	Гнедов	Сергей	+7-747-366-57-92
4229	Белова	Светлана	+7-771-225-35-45
4231	Глазунова	Надежда	21 45 89,8 702 368 99 80
4235	Акынтаева	Сымбат	+7-708-848-63-45
4237	Казмухамбетов	Жанет	+7-776-770-77-01
4241	Байсарина	Аксауле	707-947-43-87
4252	Шевчук	Надежда	+7-705-820-20-78
4268	Шевченко	Татьяна	+7-701-310-50-63
4270	Ведькал	Константин	+7-707-942-10-20
4288	Кузяк	Сергей	+7-701-662-70-36
4308	Белый	Николай	+7-701-288-29-93
4311	Сидельская	Татьяна	233449
4313	Кичатая	Надежда	+7-707-611-03-43
4242	Жакасова	Алия	8-705-266-25-20
4243	Нурбаева	Гаухар	+7-771-119-86-59
4286	Асуан	Мухамедияр	+7-775-071-32-68
4254	Наджафов	Алик Майыл Оглы	+7-707-440-61-64
4244	Моторов	Кирилл	8-771-105-19-26
4258	Оразалиева	Айгуль	8-778-666-25-79
4255	Петухов	Сергей	+7-705-253-89-32
4256	Адилгереева	Альмира	+7-747-540-39-77
4257	Харламов	Геннадий	+7-701-755-88-95
4259	Бахтияров	Роман	+7-705-249-11-44
4318	Ануар Айболат улы	Тобанияз	8-702-737-70-73
4260	Бурзянцев	Дмитрий	8-705-551-72-20
4262	Боранбаева	Камила	+7-778-803-02-35
4264	Имашева	Ария	702-999-27-26
4273	Сариева	Мерует	+7-705-772-78-35
4266	Джанбауов	Жандос	+7-700-217-47-40
4271	Мандаева	Айнур	+7-701-356-46-79
4280	Жандосова	Ардак	+7-707-801-57-87
4282	Моторнов	Кирилл	+7-771-105-19-26
4287	Уртамбаева	Динара	+7-771-122-20-00
4290	Хайрутдинов	Артур	+7-701-543-77-45
4292	Казыбаева	Айгуль	+7-778-952-89-76
4294	Алдашева	Айсулу	8-778-550-98-20
4297	Фахрутдинов	Руслан	44 44 08  \\\\ 8 701 922 48 20
4298	Шарафеев	Карим	+7-771-119-86-66
4303	Амантаева	Лаура	+7-778-833-66-77
4306	Комарова	Анна	+7-701-596-62-31
4310	Бражникова	Анна	21 07 83
4349	Михайленко	Надежда	448150
4353	Аврошко	Дмитрий	51-73-95
4375	Омельченко	Светлана	+7-747-238-41-96
4376	Шох	Татьяна	96-91-50;8-702-966-35-56
4378	Савина	Любовь	+7-702-423-64-21
4382	Пасечная	Наталья	+7-707-183-29-81
4328	Рязанцев	Михаил	+7-771-509-80-67
4385	Непогодина	Ольга	213821
4398	Глушко	Вероника	+7-747-753-22-49
4402	Пирог	Сергей	8-777-470-85-06
4405	Василенко	Даниэль	+7-777-179-73-76
4331	Джусупова	Жанат	+7-707-570-29-76
4335	Казиханов	Шынгысхан	+7-747-019-31-86
4325	Галимжанов	Амир  Орынбасарулы	+7-700-683-78-41
4337	Мырзатаев	Канатбай	+7-705-500-09-50
4340	Чурилова	Наталья	969150
4343	Берикова	Жанар	+7-771-791-09-09
4339	Айнур	Шекина	509303
4348	Куртеков	Артур	8-775-828-32-44
4354	Конырбаева	Гульфайрус	+7-705-918-79-82
4370	Радик	Гарифуллин	+7-777-760-36-62
4356	Любимцев	Андрей	+7-702-168-02-93
4364	Сагандыкова	Амина	+7-776-790-78-81
4366	Третьякова	Александра	8 777 112 77 24\r\n8 777 112 77 24
4368	Умаров	Нурлан	+7-700-683-19-58
4372	Купесова	Раушан	+7-877-707-65-28
4381	Уразкулова	Багдат	+7-702-492-33-12
4386	Есова	Алия	+7-777-120-45-07
4387	Абитова	Жанар	+7-775-057-65-32
4391	Турганбаев	Нурбол	+7-701-653-67-67
4395	Мандаев	Кайрат	8-778-655-41-98
4396	Куздибаев	Мухтар	+7-705-313-03-76
4400	Казбекова	Рахима	+7-701-449-87-98
4401	Петров	Николай	8-776-840-32-58
4404	Кунакбаев	Ерназар	+7-776-964-60-12
4410	Димидченко	Галина	+7-771-784-09-18
4417	Ткачук	Василий	+7-701-244-13-81
4415	Балжан	Бисеналина	+7-705-472-12-27
4419	Кофлер	Сергей	+7-705-158-21-37
4420	Тищенко	Татьяна	54-33-73; 8-777-712-55-55
4424	Шимановская	Зоя	+7-701-618-94-41
4425	Деменко	Сергей	+7-701-755-88-19
4430	Сражина	Элиза	+7-771-167-90-43
4406	Абишева	Женискуль	+7-702-104-75-66
4421	Картпаев	Абай	+7-701-600-57-06
4433	Сугалина	Раимгуль	+7-702-574-96-21
4434	Донченко	Любмила	448766
4435	Новоженин	Валерий	21-02-83; 777-137-22-09
4444	Акчурина	Ольга	+7-701-579-33-89
4445	Искра	Елена	+7-705-475-70-62
4456	Черная	Наталья	8-705-380-40-56
4457	Чичерин	Юрий	+7-701-323-57-01
4464	Коровкина	Светлана	+7-701-785-54-63
4426	Полякова	Елена	+7-707-658-19-39
4427	Алдамжарова	Ольга	+7-707-415-03-44
4437	Утегенова	Дина	+7-702-653-74-90
4447	Джаксымбетова	Кания	237380
4467	Радзимовская	Виктория	+7-705-119-95-07
4448	Ашгалиева	Сауле	+7-701-370-51-12
4449	Аймаганбетов	Балтабек	+7-701-296-92-98
4452	Жубаниязов	Нурлан	+7-707-375-70-58
4453	Давлетов	Талгат	+7-747-624-39-71
4455	Манапова	Наталья	+7-701-147-86-08
4460	Байтуякова	Агжан	8-701-418-98-93
4462	Шукеев	Бауржан	+7-705-383-90-09
4466	Куламанова	Сания	+7-705-345-14-63
4469	Тулепбергенов	Дидар	+7-775-609-34-05
4431	Нурбулатова	Шайзада	+7-705-466-28-37
4441	Жумагалиева	Задагуль	+7-777-413-88-02
4474	Саида	Сафина	40-25-66/  8 775 887 26 31
4488	Степаненко	Василий	+7-707-881-71-19
4494	Лях	Дарья	8-747-231-65-30
4495	Ивченко	Эрна	98 38 31 /8 771 184 88 66
4490	Жулайева	Кинжеш	+7-778-361-84-75
4497	Луцина	Татьяна	+7-701-559-43-43
4500	Федин	Иван	+7-701-643-47-84
4502	Мустафина	Накия	+7-702-286-43-34
4505	Курманалина	Карлагаш	+7-778-610-43-29
4492	Абдулганиева	Ирина	217092
4496	Аленова	Марта	+7-771-858-68-92
4498	Дауренбекова	Жанар	+7-701-492-30-29
4518	Болотина	Анастасия	8-777-434-99-19
4499	Соннов	Владимир	+7 705 136 26 60
4503	Туткушев	Жаксылык	+7-701-775-19-09
4523	Пипко	Светлана	+7-705-324-55-30
4524	Федина	Оксана	+7-702-385-12-32
4504	Карымсакова	Айгерим	8-701-855-09-94
4506	Алманиязова	Гульнара	+7-705-380-43-65
4507	Утепов	Уразбай	+7-707-943-71-42
4510	Черняева	Галина	8-775-635-87-62
4514	Аймишев	Кардирхан	8-771-118-87-67
4515	Тотаева	Нагима	8-775-503-87-35
4517	Шапошников	Степан	8-705-311-44-01
4520	Утемуратов	Байрамбай	+7-775-505-33-84
4521	Сидорова	Людмила	8-777-185-69-50
4522	Медетбаев	Саламат	+7-707-777-88-21
4526	Мухамбетьяров	Мади	+7-707-606-36-61
4528	Ибраева	Жаныл	+7-775-567-88-08
4509	Бибипатима	Исалина	8-775-140-70-30
4508	Халбаева\r\nХалбаева	Айнур	+7-708-261-69-41
4525	Ельжанова	Жамиля	3-90-60
4571	Фоменко	Екатерина	+7-778-004-35-19
4576	Нуртуган	Даурен	+7-776-784-15-66
4579	Грабилина	Светлана	+7-705-480-05-65
4584	Бахур	Валерий	+7-707-721-74-55
4570	Искаков	Жолдыбай	64-3-64
4588	Головань	Андрей	+7-702-446-17-02
4590	Мицих	Денис	+7-777-295-53-15
4591	Сулима	Ольга	+7-700-472-69-48
4597	Надольская	Марина	8-702-40-59-470
4572	Шапошникова	Наталья	+7-702-632-09-76
4608	Абдулин	Руслан	+7-775-212-43-53
4618	Марадудин	Иван	+7-777-159-52-90
4628	Яновская	Анна	+7-708-278-58-62
4574	Айтжанова	Салима	+7-705-253-94-59
4580	Галимжанов	Борис	+7-778-183-92-49
4581	Купесов	Жанболат	+7-777-434-53-35
4573	Каирлапова	Карима	+7-701-276-82-54
4586	Иргалиева	Нуржауган	+7-747-102-47-80
4589	Королев	Иван	+7-705-235-47-82
4602	Новикова	Маргарита	976422
4605	Шаймуханова	Айгуль	77-55-33; 8-777-43-43-193
4582	Дорофеева	Татьяна  Александровна	+7-702-031-62-47
4610	Хаирова	Ильмира	+7-701-148-22-45
4613	Дашкенова	Гульнара	+7-701-420-65-82
4614	Жумагалиев	Хамит	+7-778-242-77-23
4619	Жубанова	Фариза	+7-747-178-16-54
4621	Каржауова	Айнагуль	+7-775-778-27-38
4622	Оспанов	Есет	+7-777-678-86-49
4626	Бахтеева	Регина	+7-707-878-51-96
4627	Алдашев	Нурдаулет	+7-701-398-09-04
4592	Амангосов	Даурен	+7-771-225-90-92
4595	Алдибаев	Оразбай	+7-775-208-38-19
4611	Маштакова	Дания	+7-701-888-82-01
4662	Кульжумирова	Гульназ	+7-771-183-02-56
4664	Атабаева	Жадра	8-747-753-03-22
4667	Бикназаров	Тимур	8-700-403-19-87
4672	Бисмаков	Алмас	+7-702-748-03-99
4675	Сейткалиева	Мейргул	+7-705-636-95-55
4678	Тажанов	Ильнур	+7-705-818-58-53
4680	Куржукова	Эльмира	25 33 03 \\\\8 747 207 22 67
4691	Кобылова	Асель	+7-778-584-09-49
4692	Даулетпаева	Жулдыз	+7-747-280-30-42
4695	Новикова	Надежда	+7-777-112-39-47
4697	Дроголова	Галина	8-777-506-36-99\\\\\\\\\\\\44 80 20
4653	Карамульдина	Алия	+7-708-147-70-97
4659	Молдагазин	Ешим	8-701-559-19-56
4673	Вивтоненко	Светлана	906552
4674	Шумахер	Евгений	+7-701-641-47-30
4677	Нечепуренко	Елена	+7-771-184-84-50
4688	Сутягин	Андрей	+7-705-838-05-30
4693	Абдилдина	Гулмайра	+7-777-434-81-76
4699	Козаченко	Николай	+7-747-207-50-33
4700	Солоненко	Виктор	8-705-261-97-24
4701	Ховрин	Артур	+7-705-478-50-54
4658	Аймакова	Сулушаш	+7-702-391-18-93
4666	Нурманова	Акмоншак	+7-705-548-01-70
4702	Айманова	Кымбат	+7-702-709-57-63
4694	Евгения	Василенко	+7-708-358-69-27
4655	Котнаровская	Любовь	+7-705-917-92-16
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
1	2023-11-05 07:30:00.732	10	828	2	3
2	2023-11-05 07:00:00.732	7	1717	1	3
4	2023-11-05 10:00:00.732	10	1192	1	3
5	2023-11-05 07:30:00.732	8	2432	2	3
7	2023-11-05 07:30:00.569	7	768	2	3
8	2023-11-05 12:00:00.569	8	2071	2	3
9	2023-11-05 10:00:00.569	4	397	2	3
11	2023-11-05 10:30:00.481	8	2292	3	3
13	2023-11-05 09:30:00.494	10	943	2	3
14	2023-11-06 10:00:00.233	10	875	1	3
15	2023-11-06 07:30:00.258	8	2432	1	3
16	2023-11-05 07:00:00.377	11	167	2	3
3	2023-11-05 09:30:00	7	4652	1	7
6	2023-11-05 10:00:00	7	768	1	7
18	2023-11-06 12:30:00.312	7	3880	2	7
\.


--
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_id_seq', 363, true);


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

SELECT pg_catalog.setval('public.visit_id_seq', 18, true);


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
-- Name: visit visit_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT "visit_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public.users(id);


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
-- Name: visit visit_procedureId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT "visit_procedureId_fkey" FOREIGN KEY ("procedureId") REFERENCES public.procedure(id);


--
-- PostgreSQL database dump complete
--

