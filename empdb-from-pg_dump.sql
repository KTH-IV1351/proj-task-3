--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6 (Ubuntu 13.6-0ubuntu0.21.10.1)
-- Dumped by pg_dump version 13.6 (Ubuntu 13.6-0ubuntu0.21.10.1)

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

--
-- Name: empdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE empdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE empdb OWNER TO postgres;

\connect empdb

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
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    department_id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: dep; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.dep AS
 SELECT department.department_id AS usr_id
   FROM public.department
  ORDER BY (random())
 LIMIT 1;


ALTER TABLE public.dep OWNER TO postgres;

--
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.department ALTER COLUMN department_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.department_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    id character varying(100) NOT NULL,
    name character varying(500),
    department_id integer NOT NULL,
    managers_employee_id integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee ALTER COLUMN employee_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_role (
    employee_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.employee_role OWNER TO postgres;

--
-- Name: laptop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laptop (
    laptop_id integer NOT NULL,
    id character varying(100) NOT NULL,
    model character varying(100),
    employee_id integer,
    department_id integer
);


ALTER TABLE public.laptop OWNER TO postgres;

--
-- Name: laptop_laptop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.laptop ALTER COLUMN laptop_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laptop_laptop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    title character varying(100),
    description character varying(2000)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: non_mgr_role; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.non_mgr_role AS
 SELECT role.role_id AS role
   FROM public.role
  WHERE (((role.title)::text <> 'CEO'::text) AND ((role.title)::text <> 'dep.mgr'::text))
  ORDER BY (random())
 LIMIT 1;


ALTER TABLE public.non_mgr_role OWNER TO postgres;

--
-- Name: phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phone (
    phone_id integer NOT NULL,
    id character varying(100) NOT NULL,
    model character varying(100),
    employee_id integer
);


ALTER TABLE public.phone OWNER TO postgres;

--
-- Name: phone_phone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.phone ALTER COLUMN phone_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.phone_phone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.role ALTER COLUMN role_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: usr; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.usr AS
 SELECT employee.employee_id AS usr_id
   FROM public.employee
  ORDER BY (random())
 LIMIT 1;


ALTER TABLE public.usr OWNER TO postgres;

--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (department_id, name) FROM stdin;
1	support
2	admin
3	sales
4	education
5	develpment
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, id, name, department_id, managers_employee_id) FROM stdin;
1	HYA984230948	Richard Jones	2	\N
2	XFS925542235	Shaine Morgan	1	1
3	JNJ633640389	Chaney Horne	2	1
4	YXW307850738	Kibo Morton	3	1
5	HTU075956647	Mannix Beasley	4	1
6	KCE895573493	Katelyn Love	5	1
7	VFC459279414	Rigel Carver	2	3
8	KMA387801177	Kuame Gibbs	3	4
9	OGX455002327	Dane Murray	3	4
10	HXH746005897	Portia Oliver	3	4
11	AKJ007328133	Tobias Moreno	2	3
12	FSA255585554	Erica Anthony	2	3
13	PGL990711322	Leigh Mcdonald	1	2
14	GTW397526486	Hayden Bailey	1	2
15	RED305748171	Plato Terry	5	6
16	ETP446435317	Winifred Rodriguez	1	2
17	BAN531563647	Bertha Mendoza	4	5
18	PSK762986217	Cassandra Fuentes	1	2
19	FQK963585713	Inez Davidson	5	6
20	XMP881416981	Camden May	1	2
21	IAU461959046	Castor Forbes	2	3
22	IGY588787458	Marcia Mccoy	2	3
23	HTM365338885	Cassidy Townsend	2	3
24	TQX534733457	Kennan O'donnell	1	2
25	AQN417605282	Victoria Lloyd	5	6
26	CEE528442614	Raymond Watkins	1	2
27	EMQ883249410	Gage Mcpherson	4	5
28	AZE094825638	Maris Neal	4	5
29	ORU728726536	Jessica Burnett	4	5
30	IFP122083418	Daniel Cochran	4	5
31	SCH891817583	Caldwell Sargent	4	5
32	TJB776976688	Rafael Reynolds	1	2
33	CBN552655715	Callum Mathews	1	2
34	VEX682346545	Imogene Rogers	5	6
35	BAM214241156	Emerald Wiggins	2	3
36	RVX632547926	Nigel Mcgowan	2	3
37	JUN051126880	Wylie Ware	2	3
38	QIL333526212	Piper Matthews	2	3
39	OBQ234472965	May Ellison	1	2
40	GRB831238496	Hoyt Spears	1	2
41	QER753853776	Dean Hopkins	4	5
42	UWV161452371	Hunter Albert	4	5
43	LKX545244863	Amy Jennings	1	2
44	AIE661428441	Clare Stafford	3	4
45	TNL954544822	Daria Merritt	3	4
46	BXX171358615	Wing Patterson	3	4
47	PII244316911	Vera Rios	1	2
48	NEY472509412	Carissa Booth	1	2
49	AXD757451600	Kibo Lloyd	2	3
50	GQA618477288	Palmer Gilbert	2	3
51	LFV324275123	Abra Stone	5	6
52	UIY107865335	Olympia Zimmerman	5	6
53	HMU210602631	Cheyenne Chan	5	6
54	DMM214357257	Russell Clayton	1	2
55	JFS816005787	Paul Mcclain	1	2
56	CUX634765292	Sarah Cummings	1	2
57	KWB964724962	Alea Decker	4	5
58	NHX441528857	Wing Lynn	2	3
59	WEE154861478	Callie Barry	1	2
60	DLV335883204	Meghan Rios	1	2
61	LDZ564577165	Judith Olson	2	3
62	AXW372461982	Griffith Kaufman	1	2
63	YOQ176065848	Ashton Rose	1	2
64	YWT464161769	Brenda Gray	1	2
65	XKR702914737	Lunea Frazier	2	3
66	QOG146336966	Shana Castaneda	2	3
67	GYP776823313	Mohammad Whitfield	1	2
68	GBF646488857	Avye Strong	1	2
69	EKS746654134	Chaim Mccormick	1	2
70	EGL442232141	Carolyn Mosley	1	2
71	NOW459731712	Fulton Grimes	5	6
72	RMJ475052494	Xaviera Kirkland	3	4
73	EYE421785039	Connor Riddle	3	4
74	BKE858083896	Rylee Osborne	2	3
75	SMO228750316	Azalia Cash	2	3
76	YGD766674157	Mary Gibbs	2	3
77	JMF517837134	Katelyn Albert	2	3
78	SIO521250372	Basil Bender	5	6
79	NSG375132231	Cherokee Lambert	3	4
80	EFM332476751	Cassidy Leblanc	3	4
81	FWC842994142	Eliana O'donnell	4	5
82	IYQ832628747	Roanna Wood	4	5
83	ZTA877282332	Tamara Bridges	1	2
84	KKT796137170	Gil Branch	1	2
85	EDI754452217	Cole Velez	3	4
86	CIF331250832	Jada Johnson	3	4
87	GCB642546598	Talon Evans	4	5
88	NDZ347121587	Cyrus Moses	4	5
89	IYY863293407	Fitzgerald French	1	2
90	LGN251817000	Rhea Ross	5	6
91	ADH378368856	Nehru Goff	5	6
92	DYV221676638	Burton Townsend	5	6
93	NBV503078419	Dora Castaneda	3	4
94	KTQ317513791	Drew Patterson	3	4
95	HRE230896754	Uriel Meyer	3	4
96	BTT324252083	Chadwick Velazquez	1	2
97	EUF675814532	Georgia Dotson	1	2
98	GTN461641937	Tamara Ball	5	6
99	DHQ107112564	Addison Coffey	1	2
100	SVS516853988	Nichole Hartman	2	3
101	JXF757551409	Keaton Cooke	2	3
102	FVH948341568	Sigourney Pruitt	2	3
103	XHD388033772	Nell Frank	1	2
104	SKM695328357	Hiroko Allen	1	2
105	EIF822313817	Dominique Stevens	1	2
106	RXW218148723	Raymond Simpson	1	2
\.


--
-- Data for Name: employee_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_role (employee_id, role_id) FROM stdin;
1	1
2	2
3	2
4	2
5	2
6	2
7	6
8	6
9	5
10	7
11	3
12	8
13	9
14	9
15	3
16	6
17	5
18	4
19	3
20	5
21	10
22	8
23	8
24	9
25	5
26	4
27	10
28	8
29	8
30	10
31	4
32	10
33	4
34	10
35	4
36	7
37	9
38	3
39	10
40	3
41	10
42	8
43	7
44	8
45	6
46	7
47	3
48	10
49	4
50	4
51	9
52	10
53	10
54	10
55	5
56	10
57	3
58	8
59	4
60	7
61	3
62	10
63	5
64	9
65	5
66	7
67	5
68	7
69	8
70	10
71	7
72	9
73	6
74	7
75	3
76	5
77	7
78	4
79	9
80	5
81	7
82	10
83	5
84	5
85	7
86	5
87	10
88	9
89	6
90	8
91	8
92	5
93	5
94	3
95	4
96	8
97	4
98	8
99	3
100	3
101	9
102	6
103	9
104	7
105	9
106	8
\.


--
-- Data for Name: laptop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laptop (laptop_id, id, model, employee_id, department_id) FROM stdin;
1	7EC3368120	Mac	90	\N
2	8GQ8635636	Sony	\N	4
3	8YX6266041	Mac	28	\N
4	2LX5716554	Dell	35	\N
5	4OV9993283	Mac	14	\N
6	3EH6376266	Dell	\N	2
7	3NK2476146	Dell	16	\N
8	7CB6578212	Mac	94	\N
9	3RS1432476	Mac	44	\N
10	5PE0689382	Sony	25	\N
11	2FB8625878	Dell	19	\N
12	5GW5756242	Dell	39	\N
13	8GQ3676152	Sony	52	\N
14	4LR1246884	Dell	\N	3
15	8UB0277744	Sony	91	\N
16	2HC3237576	Sony	80	\N
17	0FP7356417	Sony	25	\N
18	4YG7045969	HP	49	\N
19	8RM5172282	Sony	72	\N
20	5SJ6557755	HP	100	\N
21	8NZ3840182	Mac	29	\N
22	0XJ9783115	Mac	84	\N
23	4MR9112798	Dell	51	\N
24	6BE8634237	HP	\N	4
25	1UK6366974	Mac	5	\N
26	9HT7283080	Dell	2	\N
27	6NC1604363	Mac	16	\N
28	1BY8848277	Dell	32	\N
29	3SP2819583	Mac	30	\N
30	1SM3915554	Sony	40	\N
31	6YY7706744	Sony	23	\N
32	7FO3946826	Dell	42	\N
33	1KD6856334	Dell	22	\N
34	6SY4772812	Mac	21	\N
35	2XG2212599	HP	88	\N
36	8WI5162136	HP	23	\N
37	3YG1588693	HP	83	\N
38	4CQ7582468	Sony	82	\N
39	9ON1120699	Dell	44	\N
40	4DJ9249681	Dell	6	\N
41	5QR2157558	Sony	40	\N
42	1GJ4328268	Sony	69	\N
43	7WH5126466	Mac	92	\N
44	6KI9831148	Mac	49	\N
45	1HW2624336	Dell	4	\N
46	7IM2833778	Sony	64	\N
47	7GK1575543	Mac	104	\N
48	1FN8158437	Sony	69	\N
49	9PY4865025	HP	35	\N
50	4NO6813116	Dell	33	\N
51	9MP3250250	Dell	42	\N
52	1BL6492174	Sony	68	\N
53	1NW4087328	Sony	71	\N
54	3GD8220588	Dell	102	\N
55	7LE6188609	Dell	3	\N
56	1PF3636435	Mac	63	\N
57	1AC7419324	HP	85	\N
58	4JG5339617	Dell	53	\N
59	4UH0743642	Sony	63	\N
60	4EL5565450	HP	63	\N
61	3LT0254780	HP	13	\N
62	1HV1482295	HP	105	\N
63	3PW3289746	Dell	7	\N
64	4WG6071152	Dell	\N	3
65	8TO5001617	Sony	3	\N
66	1QT0563642	Dell	20	\N
67	2IU1110850	Mac	53	\N
68	4GB6354431	Dell	72	\N
69	0TQ8483255	Mac	90	\N
70	5AJ9242251	Sony	18	\N
71	7JJ8464545	Sony	83	\N
72	3RM3338194	Mac	29	\N
73	9KU0765131	Dell	56	\N
74	9IL4875986	Sony	5	\N
75	5XO1888788	HP	42	\N
76	2ZC6637146	Sony	6	\N
77	0SU5883211	Dell	10	\N
78	3CL3839468	Mac	46	\N
79	0RQ3732317	Sony	35	\N
80	7CS3284919	Sony	51	\N
81	1BC7355418	HP	103	\N
82	2JG7166250	HP	93	\N
83	2ZI3177815	Mac	33	\N
84	2RN5416283	Dell	105	\N
85	5RI5787637	Sony	98	\N
86	1DX1212181	Dell	44	\N
87	6HG6592288	Dell	10	\N
88	0CN4336114	Sony	90	\N
89	1GC3818392	Dell	\N	5
90	8MK5195112	Sony	63	\N
91	1JY9786231	Mac	87	\N
92	1VE2284687	Sony	104	\N
93	3DJ5987351	Dell	\N	2
94	8EY6176740	HP	100	\N
95	6VB5629279	Mac	11	\N
96	8JF1772286	Dell	7	\N
97	1MY1755037	Dell	73	\N
98	3PV5519251	Dell	25	\N
99	3GR7407348	Mac	69	\N
100	5KC8571802	HP	81	\N
101	9YL2241848	Mac	33	\N
102	8IO3738383	Dell	\N	5
103	8GE1744005	Sony	\N	3
104	8NK1456756	Mac	12	\N
105	6AY1553258	Sony	91	\N
106	6QT2611079	HP	30	\N
107	2ST9395825	HP	97	\N
108	8MX2881983	Sony	43	\N
109	7TX7877584	HP	35	\N
110	6FJ6123819	Sony	19	\N
111	2HQ6721264	Dell	101	\N
112	5CS6383753	Sony	\N	5
113	6QU2323747	Sony	\N	5
114	5DO7682383	Dell	\N	5
115	2VY2990894	Sony	\N	3
116	6II5739476	Dell	\N	3
117	0NJ2073746	Sony	\N	5
118	9AQ3268068	Mac	21	\N
119	0WJ4093780	Dell	\N	1
120	8BB2465363	Sony	\N	1
121	1QM9787368	Dell	94	\N
122	7UM2667643	Dell	28	\N
123	1VA4472671	Dell	33	\N
124	2HX0598886	Dell	\N	3
125	7PO2426769	Sony	\N	2
126	5RB5764533	Sony	30	\N
127	7LM5630211	Dell	83	\N
128	1DJ8815886	HP	57	\N
129	7JY5724490	Dell	5	\N
130	8BC2289140	Dell	83	\N
131	6KE1593573	HP	9	\N
132	3CZ1115094	Sony	2	\N
133	1LB1481268	Sony	\N	3
134	2GJ5837442	Sony	\N	1
135	0YQ8560431	Dell	\N	2
136	2JF2126681	Dell	76	\N
137	9IH5287382	Dell	87	\N
138	4XF2337611	Dell	75	\N
139	9AK2654138	Mac	104	\N
140	3VN4855131	HP	4	\N
141	3MY8438427	Sony	\N	5
142	0YN3848813	Sony	\N	4
143	3WJ6063961	Sony	\N	2
144	0LH2216425	HP	35	\N
145	5PB3561876	Mac	56	\N
146	2VI5365569	Mac	91	\N
147	8YJ3525151	HP	82	\N
148	1GD7072542	Sony	70	\N
149	2TE7538771	Dell	95	\N
150	0LK9039337	Sony	23	\N
151	1FM5566535	Sony	34	\N
152	5JE2267863	Dell	4	\N
153	1TV1117311	Sony	46	\N
154	3BW7973054	Dell	2	\N
155	4TC6056873	Sony	64	\N
156	2HD3445732	Dell	106	\N
157	2DU2330141	Sony	35	\N
158	4VI6162291	Mac	102	\N
159	6PM1245625	Sony	57	\N
160	2RK0472359	Mac	11	\N
161	5VV4075380	Dell	\N	5
162	9CS4331634	Sony	\N	1
163	6QE2327832	Dell	\N	4
164	9RG2277592	Sony	72	\N
165	6JA1323315	HP	96	\N
166	4AN1112833	HP	37	\N
167	1UI8277930	HP	16	\N
168	4SV9339413	Dell	106	\N
169	8GV7260736	Sony	38	\N
170	6HS6346865	Sony	85	\N
171	6WT2568939	HP	46	\N
172	2FO6087171	Dell	18	\N
173	2GJ5908739	Sony	60	\N
174	1FQ1123473	HP	35	\N
175	5TE2466889	HP	24	\N
176	4HL4874873	Mac	82	\N
177	6QO9467567	Dell	66	\N
178	4EY7552792	HP	98	\N
179	5XL6182538	HP	74	\N
180	1GG8578674	Sony	\N	1
181	8YB2637245	Dell	\N	1
182	1NT2419160	Dell	\N	2
183	8IM7121141	Sony	\N	4
184	5YJ8483833	Dell	\N	1
185	4WU7245961	Sony	\N	4
186	8KY6581815	Dell	\N	5
187	1IN9986282	Dell	\N	4
188	2SD2523741	Sony	\N	1
189	5IJ6075778	Dell	\N	2
190	4TR5268897	Sony	\N	3
191	1IY9824524	Mac	33	\N
192	4KG1753538	Dell	31	\N
193	3XD1717386	Sony	1	\N
194	4JK4276728	Mac	2	\N
195	2IG8121288	HP	42	\N
196	4ED1067099	Sony	7	\N
197	1TS1882846	HP	10	\N
198	2KG5265633	Sony	35	\N
199	4OY7693589	Dell	102	\N
200	5CS5558708	Sony	41	\N
\.


--
-- Data for Name: phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phone (phone_id, id, model, employee_id) FROM stdin;
1	5RI7479538	iPhone14	28
2	4DY3887473	iPhone12	63
3	3VS7824857	iPhone14	52
4	3DR8824051	GalaxyM53	44
5	7VW8829175	GalaxyS21	55
6	7TR8109187	GalaxyS21	11
7	4XE2384822	GalaxyS21	44
8	5XJ2139711	GalaxyS21	86
9	6FM2504617	GalaxyS21	46
10	2HR0836638	GalaxyS21	98
11	4UO7748547	iPhone12	29
12	6OJ1182266	GalaxyS21	90
13	7TF7541864	iPhone14	\N
14	1TP3365817	GalaxyS21	86
15	2RY1767244	GalaxyM53	17
16	1VD8592475	GalaxyM53	95
17	1IG4623255	GalaxyS21	58
18	5HY4132675	GalaxyM53	20
19	3TL6976548	GalaxyM53	49
20	5YU8056993	GalaxyM53	37
21	7WM8109706	GalaxyS21	2
22	7NY7302778	GalaxyM53	33
23	4SU1938496	GalaxyM53	59
24	3XQ7274744	iPhone12	62
25	7KC1683587	GalaxyM53	49
26	8WF9354913	GalaxyM53	8
27	1LJ9257152	GalaxyS21	6
28	2YX2752067	iPhone12	106
29	4XA6166247	GalaxyS21	98
30	0TN9562064	GalaxyM53	22
31	4TP6853216	GalaxyS21	30
32	7UW2610103	GalaxyS21	87
33	3PY5944424	GalaxyM53	40
34	6HD3116636	GalaxyS21	57
35	8YD6598186	GalaxyS21	26
36	5TO1262215	GalaxyM53	86
37	8GM6505276	GalaxyS21	65
38	9JV3445193	iPhone12	\N
39	4QI1677598	iPhone12	105
40	6KC7331676	GalaxyM53	48
41	2XB7546472	iPhone12	18
42	4OL6434717	iPhone12	82
43	1VF8414890	GalaxyM53	68
44	2DF4164717	GalaxyS21	12
45	8BE4229565	iPhone12	80
46	3RN8097633	iPhone12	43
47	1VN3713618	GalaxyM53	103
48	2FI3848846	iPhone14	35
49	1HD7133632	iPhone14	48
50	6PH4557293	iPhone12	101
51	4QY1465433	GalaxyM53	97
52	7JD4273348	iPhone12	95
53	4MS0216183	GalaxyM53	70
54	9FW6424868	iPhone12	21
55	8EI6261723	GalaxyS21	26
56	3DF4117578	GalaxyM53	103
57	3DH5042979	GalaxyS21	14
58	3XW8817473	GalaxyM53	\N
59	4BC6428143	iPhone12	\N
60	8YY5495097	GalaxyM53	96
61	4WU8734414	GalaxyS21	66
62	5EW2486385	iPhone14	80
63	5MN3645028	GalaxyM53	34
64	4EJ4445967	iPhone12	30
65	1MQ1667134	GalaxyM53	19
66	1LG6283062	GalaxyS21	13
67	5TJ9144854	GalaxyM53	43
68	2AE2508256	GalaxyS21	10
69	4IY8941625	GalaxyS21	5
70	9RD6829362	iPhone14	17
71	7UC9113135	GalaxyS21	\N
72	8ON1375357	GalaxyM53	100
73	2FM4121951	GalaxyS21	33
74	4QR1276774	GalaxyS21	30
75	7GB8418269	iPhone14	53
76	2KS8834368	GalaxyS21	82
77	2WP0253803	GalaxyM53	100
78	3YK8277755	iPhone14	24
79	0GM3404988	iPhone12	48
80	9NN2134364	GalaxyS21	70
81	3LB2272727	iPhone14	54
82	5YF1438228	iPhone14	\N
83	0XL4619529	GalaxyM53	93
84	7LN3417886	GalaxyM53	105
85	8NT5014565	iPhone14	55
86	3MX7946277	GalaxyS21	101
87	5EB3755182	GalaxyM53	53
88	8QN6936854	GalaxyS21	8
89	5XJ1675134	GalaxyM53	10
90	8SV6549983	GalaxyS21	44
91	2FD0482244	GalaxyM53	104
92	1NY3527945	GalaxyM53	70
93	6SH4124187	iPhone12	14
94	1XJ4518558	iPhone12	54
95	5EP8672578	GalaxyM53	89
96	8ZV3138406	GalaxyS21	13
97	7UT0328691	iPhone14	13
98	3TP4922183	GalaxyS21	37
99	4OM3533137	GalaxyS21	19
100	8LK8093358	GalaxyM53	40
101	4UF6836131	GalaxyM53	31
102	0XR3605763	GalaxyM53	\N
103	0DB2198394	GalaxyS21	81
104	9IR8787133	GalaxyS21	\N
105	2RF1260217	iPhone14	\N
106	3FT5334862	iPhone12	79
107	8BT2407506	GalaxyS21	39
108	1FO0337160	GalaxyM53	47
109	7GF1518567	GalaxyS21	88
110	2PQ4011071	GalaxyS21	25
111	5IX4072878	GalaxyM53	88
112	7CZ3277386	GalaxyM53	11
113	6JL5533478	GalaxyM53	99
114	2JN0447660	GalaxyS21	2
115	7OO8547076	GalaxyM53	41
116	9DS9142225	GalaxyS21	56
117	8ZI1558853	iPhone14	30
118	6UA7212674	iPhone12	5
119	1QQ6783517	GalaxyM53	52
120	8BS1135872	GalaxyS21	87
121	9UL3326604	GalaxyM53	102
122	6XX4061659	GalaxyS21	69
123	3LU3197830	iPhone12	59
124	2DL1438333	GalaxyM53	89
125	5QG8565661	iPhone14	35
126	1KE5447760	GalaxyS21	86
127	5EY2362044	GalaxyM53	11
128	5WM3616046	GalaxyS21	38
129	8CL6659112	iPhone14	9
130	1ES5595341	iPhone14	79
131	2TM6095024	GalaxyS21	87
132	2PT5588869	GalaxyM53	99
133	1BV8648555	GalaxyM53	68
134	5YM9516425	GalaxyM53	106
135	6HJ5914969	GalaxyM53	81
136	8JC6061161	GalaxyM53	12
137	6QF2622256	GalaxyS21	43
138	4OI5644278	iPhone14	63
139	2UG5034288	GalaxyS21	25
140	1JW1047858	GalaxyS21	79
141	7TN8553424	GalaxyM53	19
142	7EO5467742	GalaxyM53	43
143	3KQ8087566	GalaxyM53	28
144	2ZD2917266	iPhone14	78
145	2II3522737	iPhone14	21
146	1YY8909699	GalaxyM53	16
147	8JT5143362	iPhone14	12
148	5WX2571901	iPhone12	103
149	6YA7528144	iPhone12	75
150	8EN0803610	iPhone12	91
151	7BI4470316	GalaxyS21	86
152	0EF9218655	GalaxyS21	87
153	1HS5251313	GalaxyS21	\N
154	2DE9661981	iPhone12	93
155	9IX8637646	GalaxyS21	63
156	6WW7785367	iPhone12	18
157	5TW1114376	GalaxyM53	17
158	7OC8823725	iPhone14	91
159	5BR8670566	GalaxyM53	90
160	9PW0609961	GalaxyS21	77
161	2QT9751651	GalaxyM53	78
162	3JT4613258	GalaxyS21	84
163	9FY1445243	GalaxyM53	55
164	7EM3491879	iPhone12	26
165	2UM5314562	GalaxyS21	64
166	7VO2768643	iPhone14	5
167	8JC7147407	GalaxyS21	90
168	2WP1981726	GalaxyM53	62
169	2TQ9775288	GalaxyS21	82
170	7MT6418583	GalaxyM53	87
171	4EI4731243	GalaxyM53	48
172	6OG5040438	iPhone14	50
173	1XD1332871	GalaxyM53	100
174	8GT2157455	GalaxyS21	3
175	1KD1431531	iPhone14	99
176	8JF1867273	iPhone14	71
177	7FM0646659	GalaxyS21	26
178	0YE1682348	GalaxyS21	8
179	4YQ5716351	GalaxyS21	87
180	7HV4255517	GalaxyM53	\N
181	8IT7453851	GalaxyM53	26
182	3CV5211172	GalaxyS21	13
183	1GG3258455	GalaxyS21	67
184	6EM6627583	GalaxyS21	56
185	7NG4133444	iPhone14	67
186	4VL8403764	iPhone12	36
187	6RH4128315	GalaxyS21	91
188	5IC3248245	iPhone12	52
189	3IP5808313	GalaxyS21	31
190	3RO2149636	GalaxyS21	30
191	8QO8205371	GalaxyM53	74
192	3DU2825901	GalaxyM53	95
193	3TX8725667	GalaxyS21	97
194	6BJ7642106	GalaxyS21	62
195	2HD4591486	GalaxyS21	38
196	1GN4307739	iPhone14	17
197	3LZ7526692	iPhone12	70
198	4GI2772872	GalaxyM53	80
199	1VP6308475	GalaxyS21	101
200	3GX0555358	GalaxyS21	\N
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (role_id, title, description) FROM stdin;
1	CEO	runs the show
2	dep.mgr	department manager
3	role 1	performs rule one tasks
4	role 2	performs rule two tasks
5	role 3	performs rule three tasks
6	role 4	performs rule four tasks
7	role 5	performs rule five tasks
8	role 6	performs rule six tasks
9	role 7	performs rule seven tasks
10	the rest	just do what they're told
\.


--
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_department_id_seq', 5, true);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 106, true);


--
-- Name: laptop_laptop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laptop_laptop_id_seq', 200, true);


--
-- Name: phone_phone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phone_phone_id_seq', 200, true);


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_role_id_seq', 10, true);


--
-- Name: department pk_department; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT pk_department PRIMARY KEY (department_id);


--
-- Name: employee pk_employee; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT pk_employee PRIMARY KEY (employee_id);


--
-- Name: employee_role pk_employee_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role
    ADD CONSTRAINT pk_employee_role PRIMARY KEY (employee_id, role_id);


--
-- Name: laptop pk_laptop; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laptop
    ADD CONSTRAINT pk_laptop PRIMARY KEY (laptop_id);


--
-- Name: phone pk_phone; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT pk_phone PRIMARY KEY (phone_id);


--
-- Name: role pk_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT pk_role PRIMARY KEY (role_id);


--
-- Name: employee fk_employee_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_0 FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- Name: employee fk_employee_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_1 FOREIGN KEY (managers_employee_id) REFERENCES public.employee(employee_id);


--
-- Name: employee_role fk_employee_role_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role
    ADD CONSTRAINT fk_employee_role_0 FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: employee_role fk_employee_role_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role
    ADD CONSTRAINT fk_employee_role_1 FOREIGN KEY (role_id) REFERENCES public.role(role_id);


--
-- Name: laptop fk_laptop_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laptop
    ADD CONSTRAINT fk_laptop_0 FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: laptop fk_laptop_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laptop
    ADD CONSTRAINT fk_laptop_1 FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- Name: phone fk_phone_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT fk_phone_0 FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- PostgreSQL database dump complete
--

