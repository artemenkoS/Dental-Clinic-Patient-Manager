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
    procedure integer,
    author integer
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

COPY public.visit (id, "visitDate", "doctorId", "patientId", procedure, author) FROM stdin;
247	2023-10-11 17:50:00+05	4	1	1	3
248	2023-10-11 17:50:00+05	7	1	1	3
249	2023-10-11 14:30:00+05	4	6	2	3
250	2023-10-11 16:30:00+05	4	3	2	3
251	2023-10-11 16:30:00+05	4	3	2	3
252	2023-10-11 16:30:00+05	4	3	2	3
253	2023-10-11 17:30:00+05	4	4	1	3
254	2023-10-12 17:30:00+05	7	4	1	3
255	2023-10-12 17:30:00+05	4	3	2	3
256	2023-10-12 19:30:00+05	10	3	2	3
257	2023-10-12 14:30:00+05	10	3	2	3
258	2023-10-12 14:30:00+05	10	3	2	3
259	2023-10-12 14:30:00+05	10	3	2	3
260	2023-10-12 14:30:00+05	7	1	3	3
261	2023-10-12 14:30:00+05	7	1	3	3
262	2023-10-12 14:30:00+05	4	1	3	3
263	2023-10-12 14:30:00+05	7	1	3	3
264	2023-10-12 14:30:00+05	8	1	3	3
265	2023-10-12 22:00:00+05	4	2	2	3
266	2023-10-12 22:00:00+05	4	4	3	3
267	2023-10-12 22:00:00+05	8	3	2	7
268	2023-10-12 22:00:00+05	8	3	2	7
269	2023-10-12 22:00:00+05	10	3	2	7
270	2023-10-12 22:00:00+05	10	5	2	3
271	2023-10-12 22:00:00+05	4	5	1	3
272	2023-10-13 20:00:00+05	4	1	3	3
273	2023-10-24 17:00:00+05	10	1	3	3
274	2023-11-23 19:30:00+05	4	3	1	3
275	2023-12-03 17:00:00+05	7	3	1	3
276	2023-12-03 17:00:00+05	7	3	1	3
277	2023-12-03 20:30:00+05	7	3	1	3
278	2023-12-03 18:00:00+05	7	3	1	3
279	2023-10-12 18:00:00+05	7	2	1	3
280	2023-10-28 17:30:00+05	7	2	1	3
281	2023-10-28 22:00:00+05	7	2	1	3
282	2023-10-13 23:30:00+05	7	2	1	3
284	2023-10-12 17:00:00+05	4	1	1	3
285	2023-10-12 20:00:00+05	7	2	2	3
286	2023-10-20 20:00:00+05	8	2	3	3
287	2023-10-12 17:30:00+05	10	1	2	3
289	2023-10-12 19:30:00+05	7	6	2	3
291	2023-10-12 20:00:00+05	4	6	3	3
292	2023-10-12 22:30:00+05	7	7	2	3
294	2023-10-12 20:30:00+05	7	5	2	3
295	2023-10-12 21:00:00+05	7	1	2	3
296	2023-10-16 20:00:00+05	7	2	3	3
297	2023-10-19 20:30:00+05	4	1	2	3
298	2023-10-13 22:30:00+05	7	4	2	3
299	2023-10-12 23:00:00+05	7	1	3	7
301	2023-10-12 17:00:00+05	7	1	3	7
302	2023-10-20 22:00:00+05	7	2	1	7
303	2023-10-12 19:30:00+05	4	2	3	7
304	2023-10-13 22:00:00+05	7	2	3	7
305	2023-10-12 22:30:00+05	8	1	2	7
306	2023-10-12 15:30:00+05	4	5	3	7
307	2023-10-12 17:00:00+05	7	4	2	7
308	2023-10-12 23:00:00+05	4	6	3	7
309	2023-10-12 22:30:00+05	4	1	2	7
310	2023-10-12 18:00:00+05	8	5	1	7
312	2023-10-12 23:30:00+05	8	2	2	3
313	2023-10-13 17:00:00+05	4	1	2	3
314	2023-10-12 17:00:00+05	7	1	2	3
315	2023-10-12 23:00:00+05	8	6	3	3
316	2023-10-12 18:30:00+05	4	1	3	3
317	2023-10-13 18:00:00+05	8	4	1	3
318	2023-10-05 20:00:00+05	4	2	2	3
319	2023-10-12 20:30:00+05	4	1	3	3
320	2023-10-12 17:00:00+05	7	1	3	3
321	2023-10-12 20:30:00+05	8	5	2	3
322	2023-10-12 16:00:00+05	7	1	2	3
323	2023-10-21 16:00:00+05	4	5	2	3
324	2023-10-12 20:30:00+05	4	7	3	3
325	2023-11-23 22:30:00+05	8	5	3	3
326	2023-10-12 21:00:00+05	8	2	2	3
327	2023-10-13 19:00:00+05	8	1	3	3
328	2023-10-13 19:00:00+05	7	4	1	3
329	2023-10-13 23:00:00+05	7	2	3	3
330	2023-10-13 21:00:00+05	4	5	1	3
331	2023-10-13 21:30:00+05	7	3	1	3
332	2023-10-13 15:00:00+05	4	2	3	3
333	2023-10-13 19:00:00+05	4	4	2	3
334	2023-10-12 22:00:00+05	8	2	1	3
335	2023-10-12 22:00:00+05	10	1	2	3
336	2023-10-13 21:00:00+05	8	5	1	3
337	2023-10-13 20:30:00+05	7	5	3	3
338	2023-10-13 22:00:00+05	8	2	2	3
339	2023-10-13 21:30:00+05	8	3	1	3
340	2023-10-13 16:30:00+05	7	2	3	3
341	2023-10-13 19:30:00+05	7	1	1	3
342	2023-10-13 18:30:00+05	4	2	3	3
343	2023-10-14 21:00:00+05	7	3	1	3
344	2023-10-13 20:30:00+05	4	3	1	3
345	2023-10-13 22:30:00+05	4	4	2	3
346	2023-10-13 16:30:00+05	4	4	3	3
347	2023-10-13 18:30:00+05	7	2	3	3
348	2023-10-13 23:00:00+05	4	3	2	3
349	2023-10-13 18:00:00+05	7	3	1	3
350	2023-10-13 14:30:00+05	10	2	2	3
351	2023-10-13 15:00:00+05	10	4	2	3
352	2023-10-13 19:00:00+05	10	6	2	3
353	2023-10-13 23:30:00+05	4	3	2	3
354	2023-10-13 22:30:00+05	10	7	1	3
355	2023-10-13 20:00:00+05	10	4	1	3
356	2023-10-13 20:30:00+05	8	4	1	3
357	2023-10-13 20:30:00+05	10	3	1	3
358	2023-10-13 17:30:00+05	8	3	1	3
359	2023-10-13 17:30:00+05	7	3	2	3
360	2023-10-13 23:30:00+05	4	4	1	3
361	2023-10-13 21:30:00+05	10	2	2	3
362	2023-10-13 22:30:00+05	8	4	1	3
363	2023-10-13 23:00:00+05	10	2	3	3
364	2023-10-13 21:00:00+05	7	4	1	3
365	2023-10-13 17:00:00+05	7	3	1	3
366	2023-10-13 18:30:00+05	8	7	2	3
367	2023-10-13 23:00:00+05	8	7	1	3
368	2023-10-13 17:30:00+05	7	6	2	3
369	2023-10-13 18:30:00+05	10	4	1	7
370	2023-10-13 15:30:00+05	7	2	2	3
371	2023-10-24 22:30:00+05	7	6	2	3
372	2023-10-13 23:30:00+05	8	4	1	3
373	2023-10-14 18:30:00+05	4	5	3	3
374	2023-10-14 21:00:00+05	8	4	1	3
375	2023-10-14 20:30:00+05	10	4	2	3
376	2023-10-14 15:00:00+05	10	4	1	3
377	2023-10-14 17:30:00+05	8	3	1	3
378	2023-10-14 22:30:00+05	7	6	1	3
379	2023-10-15 20:30:00+05	7	3	1	3
380	2023-10-15 23:00:00+05	7	2	1	3
381	2023-10-15 18:30:00+05	8	2	2	3
382	2023-10-15 15:30:00+05	8	3	1	3
383	2023-10-16 20:00:00+05	8	2	2	3
384	2023-10-16 16:00:00+05	8	4	2	3
385	2023-10-16 20:30:00+05	7	4	2	3
386	2023-10-16 20:30:00+05	10	2	3	3
387	2023-10-16 23:30:00+05	7	2	2	3
388	2023-10-16 18:30:00+05	7	2	1	3
389	2023-10-16 23:00:00+05	8	2	1	3
390	2023-10-16 21:00:00+05	10	3	2	3
391	2023-10-16 21:00:00+05	7	4	2	3
392	2023-10-16 23:00:00+05	10	2	1	3
393	2023-10-16 23:30:00+05	10	1	2	3
394	2023-10-16 14:30:00+05	7	1	2	3
395	2023-10-16 14:30:00+05	4	6	2	3
396	2023-10-16 17:30:00+05	7	1	1	3
397	2023-10-01 17:30:00+05	7	1	1	3
398	2023-10-16 19:30:00+05	7	2	2	3
399	2023-10-16 15:00:00+05	7	6	1	3
400	2023-10-16 22:00:00+05	7	3	2	3
401	2023-10-12 15:00:00+05	4	1	2	3
402	2023-10-16 22:30:00+05	7	1	2	3
403	2023-10-16 17:30:00+05	8	2	1	3
404	2023-10-16 22:30:00+05	8	1	2	3
405	2023-10-16 17:30:00+05	4	1	2	3
406	2023-10-16 18:00:00+05	4	2	2	3
407	2023-10-16 23:00:00+05	4	6	2	3
408	2023-10-16 19:00:00+05	4	1	1	3
409	2023-10-16 23:30:00+05	4	6	2	3
410	2023-10-16 20:00:00+05	4	2	2	3
411	2023-10-16 22:00:00+05	4	2	2	3
412	2023-10-16 23:00:00+05	7	1	2	3
413	2023-10-16 19:30:00+05	8	1	2	3
414	2023-10-16 20:30:00+05	4	1	2	3
415	2023-10-16 22:30:00+05	4	1	2	3
416	2023-10-16 15:30:00+05	8	1	2	3
417	2023-10-16 15:30:00+05	7	1	2	3
418	2023-10-16 17:00:00+05	7	6	1	3
419	2023-10-16 17:30:00+05	11	7	2	3
420	2023-10-16 19:30:00+05	10	1	1	3
421	2023-10-16 18:00:00+05	10	2	2	3
422	2023-10-16 23:00:00+05	11	6	1	3
423	2023-10-16 18:30:00+05	8	1	2	3
424	2023-10-16 19:00:00+05	8	7	2	3
425	2023-10-16 18:00:00+05	7	2	3	3
426	2023-10-16 20:30:00+05	8	1	1	3
427	2023-10-16 23:30:00+05	8	2	3	3
428	2023-10-16 19:30:00+05	11	6	1	3
429	2023-10-16 21:30:00+05	7	6	1	3
430	2023-10-16 18:30:00+05	11	6	2	3
431	2023-10-16 19:00:00+05	10	1	2	3
432	2023-10-16 21:30:00+05	8	6	2	3
433	2023-10-16 22:00:00+05	8	6	2	3
434	2023-10-16 22:30:00+05	10	2	2	3
435	2023-10-16 19:00:00+05	7	1	2	3
436	2023-10-16 14:30:00+05	8	1	2	3
437	2023-10-16 16:00:00+05	7	1	3	3
438	2023-10-16 16:30:00+05	7	6	3	3
439	2023-10-16 22:00:00+05	11	1	1	3
440	2023-10-16 20:30:00+05	11	1	2	3
441	2023-10-16 14:30:00+05	10	1	2	3
442	2023-10-16 20:00:00+05	10	1	3	3
443	2023-10-16 17:00:00+05	8	7	1	3
444	2023-10-16 18:00:00+05	8	2	2	3
445	2023-10-16 21:30:00+05	10	8	2	3
446	2023-10-16 20:00:00+05	11	11	3	3
447	2023-10-16 16:30:00+05	8	11	3	3
448	2023-10-16 21:00:00+05	8	11	2	3
449	2023-10-16 15:00:00+05	8	11	1	3
450	2023-10-16 22:00:00+05	10	9	2	3
451	2023-10-20 20:30:00+05	7	8	2	3
452	2023-10-20 23:30:00+05	7	11	2	3
453	2023-10-16 23:30:00+05	11	11	2	3
454	2023-10-16 17:30:00+05	10	11	1	3
455	2023-10-16 15:30:00+05	11	11	2	3
456	2023-10-16 22:30:00+05	11	11	1	3
458	2023-10-16 19:30:00+05	4	11	2	3
459	2023-10-16 17:00:00+05	11	11	1	3
460	2023-10-16 21:00:00+05	4	10	2	11
461	2023-10-16 16:00:00+05	10	9	1	7
462	2023-10-16 18:30:00+05	4	8	2	7
463	2023-10-16 21:00:00+05	11	8	2	7
464	2023-10-16 18:00:00+05	11	16	1	7
465	2023-10-16 21:30:00+05	11	17	2	11
466	2023-10-20 18:00:00+05	10	19	2	7
468	2023-10-16 18:30:00+05	10	22	3	3
469	2023-10-16 17:00:00+05	10	10	3	3
471	2023-10-16 17:00:00+05	4	23	1	3
472	2023-10-16 15:00:00+05	11	24	1	3
473	2023-10-16 15:30:00+05	10	27	2	3
474	2023-10-16 21:30:00+05	4	28	2	3
477	2023-10-16 15:00:00+05	10	30	1	3
503	2023-10-17 20:00:00+05	10	17	2	3
507	2023-10-17 19:30:00+05	8	33	2	3
508	2023-10-19 18:30:00+05	4	33	2	3
509	\N	\N	\N	\N	\N
521	2023-10-18 18:00:00+05	8	29	2	7
\.


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patient_id_seq', 33, true);


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

SELECT pg_catalog.setval('public.visit_id_seq', 521, true);


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

CREATE INDEX fki_c ON public.visit USING btree (procedure);


--
-- Name: fki_visit_author_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_visit_author_fkey ON public.visit USING btree (author);


--
-- Name: users users_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);


--
-- Name: visit visit_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_author_fkey FOREIGN KEY (author) REFERENCES public.users(id) NOT VALID;


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
    ADD CONSTRAINT visit_procedure_fkey FOREIGN KEY (procedure) REFERENCES public.procedure(id) MATCH FULL NOT VALID;


--
-- PostgreSQL database dump complete
--

