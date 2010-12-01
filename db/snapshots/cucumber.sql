--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('assets_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('categories_id_seq', 2, true);


--
-- Name: category_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_interests_id_seq', 1, false);


--
-- Name: category_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_translations_id_seq', 2, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('countries_id_seq', 3, true);


--
-- Name: country_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_interests_id_seq', 1, false);


--
-- Name: email_template_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_template_translations_id_seq', 14, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 7, true);


--
-- Name: lead_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_purchases_id_seq', 1, false);


--
-- Name: lead_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_translations_id_seq', 1, false);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('leads_id_seq', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('settings_id_seq', 8, true);


--
-- Name: tolk_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tolk_locales_id_seq', 1, false);


--
-- Name: tolk_phrases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tolk_phrases_id_seq', 1, false);


--
-- Name: tolk_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tolk_translations_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count) FROM stdin;
1	Test category 1	\N	2010-12-01 10:46:26.063244	2010-12-01 10:46:26.063244	\N	1	2	\N	0
2	Test category 2	\N	2010-12-01 10:46:26.079814	2010-12-01 10:46:26.079814	\N	3	4	\N	0
\.


--
-- Data for Name: category_interests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY category_interests (id, category_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: category_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY category_translations (id, category_id, locale, description, name, created_at, updated_at) FROM stdin;
1	1	en	\N	Test category 1	2010-12-01 10:46:26.071156	2010-12-01 10:46:26.071156
2	2	en	\N	Test category 2	2010-12-01 10:46:26.08279	2010-12-01 10:46:26.08279
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-01 10:46:26.117276	2010-12-01 10:46:26.117276
2	United Kingdom	2010-12-01 10:46:26.122128	2010-12-01 10:46:26.122128
3	Northern Ireland	2010-12-01 10:46:26.780706	2010-12-01 10:46:26.780706
\.


--
-- Data for Name: country_interests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY country_interests (id, country_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-01 10:46:26.146019	2010-12-01 10:46:26.146019
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-01 10:46:26.157979	2010-12-01 10:46:26.157979
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-01 10:46:26.167712	2010-12-01 10:46:26.167712
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-01 10:46:26.176936	2010-12-01 10:46:26.176936
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-01 10:46:26.186491	2010-12-01 10:46:26.186491
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-01 10:46:26.195585	2010-12-01 10:46:26.195585
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-01 10:46:26.205254	2010-12-01 10:46:26.205254
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-01 10:46:26.214283	2010-12-01 10:46:26.214283
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-01 10:46:26.314246	2010-12-01 10:46:26.314246
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-01 10:46:26.32402	2010-12-01 10:46:26.32402
11	6	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-01 10:46:26.333227	2010-12-01 10:46:26.333227
12	6	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-01 10:46:26.342524	2010-12-01 10:46:26.342524
13	7	en	Question	<p></p>	2010-12-01 10:46:26.351672	2010-12-01 10:46:26.351672
14	7	dk	[DK] Question	<p></p>	2010-12-01 10:46:26.360695	2010-12-01 10:46:26.360695
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-01 10:46:26.137813	2010-12-01 10:46:26.155069
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-01 10:46:26.164167	2010-12-01 10:46:26.173965
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-01 10:46:26.182976	2010-12-01 10:46:26.192684
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-01 10:46:26.201621	2010-12-01 10:46:26.211372
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-01 10:46:26.220186	2010-12-01 10:46:26.321117
6	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-01 10:46:26.32989	2010-12-01 10:46:26.339511
7	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-01 10:46:26.348296	2010-12-01 10:46:26.357745
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, header, hidden_description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	level_one_certification_threshold	--- 0\n	2010-12-01 10:46:26.090781	2010-12-01 10:46:26.090781
2	level_two_certification_threshold	--- 0\n	2010-12-01 10:46:26.095999	2010-12-01 10:46:26.095999
3	level_three_certification_threshold	--- 0\n	2010-12-01 10:46:26.098777	2010-12-01 10:46:26.098777
4	default_payout_delay	--- 0\n	2010-12-01 10:46:26.101465	2010-12-01 10:46:26.101465
5	default_leads_per_page	--- 5\n	2010-12-01 10:46:26.104123	2010-12-01 10:46:26.104123
6	certification_level_1	--- 10\n	2010-12-01 10:46:26.106613	2010-12-01 10:46:26.106613
7	certification_level_2	--- 20\n	2010-12-01 10:46:26.109099	2010-12-01 10:46:26.109099
8	contact_us_email	--- contact@nbs.fake.com\n	2010-12-01 10:46:26.11175	2010-12-01 10:46:26.11175
\.


--
-- Data for Name: tolk_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tolk_locales (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tolk_phrases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tolk_phrases (id, key, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tolk_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tolk_translations (id, phrase_id, locale_id, text, previous_text, primary_updated, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer) FROM stdin;
1	blazejek@gmail.com	0cb8d224db9e1110b17dd0560d9e07e28b41c0c6e21365e8f11dfc1bb6dae83dae908af686cd1918b8be0192f0948ac9152fafb2a092103219344857b2a58c66	7SGTN5V6E-Kgf7ihCisi	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 10:46:26.581074	2010-12-01 10:46:26.394114	\N	2010-12-01 10:46:26.394339	2010-12-01 10:46:26.581396	1	Josiah	White	432-747-7626 x4425	admin1	Morar Tunnel	Willmstown	45908	Norfolk	1	\N	\N	\N	\N	0	\N	\N	\N	\N	OZbNlNxiHcPJhDDlkcvo3kFVv0pCQWrNxvvBbORG1TwbyHSatoGctA0u4CpuoN	f	\N
2	buyer@gmail2.com	0ea407b4b1df7647a945cfa73074fdc35fc6af4c70417cf60927fe0378448647c0d3fbef71fe76be2001b0102be5be401028b6442a5754b52ca09c9c0bba100b	yIX69DKCFwijgk6v9xM-	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 10:46:26.755471	2010-12-01 10:46:26.732051	\N	2010-12-01 10:46:26.732287	2010-12-01 10:46:26.755759	48	Freida	Walsh	794-992-3659 x96045	Akeem Klein	Hane Views	Brakuschester	30682-3276	Greater Manchester	1	\N	\N	\N	\N	0	\N	\N	\N	\N	qj3IDmuQzDalyN4tX1gUeF1OOWBRfdFfHmwV8G17Nuk4akWk4kKaYlaTejh3Lp	f	\N
3	agent@gmail2.com	70e531094c5232beba49c30431edd39992204b254062f407ed27881464259aa762a06ab35388640642c09ce91867550140aa6dc37db4853db71bfcb87070899e	mU6hTK7MHwCpFZuQpvgI	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 10:46:26.810676	2010-12-01 10:46:26.787104	\N	2010-12-01 10:46:26.787483	2010-12-01 10:46:26.810965	2	Isaiah	Rutherford	(162)973-4918	Monte Russel DVM	Jones Keys	Windlerland	00718	Staffordshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	GTsLufx6LZtcVvU6QsBR5AjygmoGvjEJjVulz1AfMJk0IHCC7RcMbe2RUY85qq	f	\N
4	leaduser@gmail2.com	b5eb8aabda8e044059409d421ab8eb8ce24833288ced8f7fdbc352643f9a2963f0589608e43513a2a6641782fc0ff91150a50a55db138ca4d7995fe013ed36fe	zVejkteY-hcbv05kfe65	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 10:46:26.862117	2010-12-01 10:46:26.838941	\N	2010-12-01 10:46:26.839172	2010-12-01 10:46:26.862431	64	Jordi	Zemlak	(790)340-2080 x0536	Lourdes Nienow	Rau Turnpike	West Jovany	47804	Dyfed	1	\N	\N	\N	\N	0	\N	\N	\N	\N	yEbi1mJJWGSLY206BKDioMVQjV328L08pIrfCB8u83NoezurXh1awsAsVT5bee	f	\N
\.


--
-- PostgreSQL database dump complete
--

