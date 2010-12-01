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
-- Name: article_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('article_translations_id_seq', 16, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 8, true);


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

SELECT pg_catalog.setval('email_template_translations_id_seq', 10, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 5, true);


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
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2010-12-01 15:41:54.684105	2010-12-01 15:41:54.684105
2	1	en	About us	About us	2010-12-01 15:41:54.716504	2010-12-01 15:41:54.716504
3	2	dk	Privacy	Privacy	2010-12-01 15:41:54.749151	2010-12-01 15:41:54.749151
4	2	en	Privacy	Privacy	2010-12-01 15:41:54.779593	2010-12-01 15:41:54.779593
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-01 15:41:54.821969	2010-12-01 15:41:54.821969
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-01 15:41:54.844869	2010-12-01 15:41:54.844869
7	4	dk	Contact us	Contact us	2010-12-01 15:41:54.884175	2010-12-01 15:41:54.884175
8	4	en	Contact us	Contact us	2010-12-01 15:41:54.903695	2010-12-01 15:41:54.903695
9	5	dk	Blurb sign up	Blurb sign up	2010-12-01 15:41:54.943495	2010-12-01 15:41:54.943495
10	5	en	Blurb sign up	Blurb sign up	2010-12-01 15:41:54.967927	2010-12-01 15:41:54.967927
11	6	dk	Blurb buyer home	Blurb buyer home	2010-12-01 15:41:55.012231	2010-12-01 15:41:55.012231
12	6	en	Blurb buyer home	Blurb buyer home	2010-12-01 15:41:55.03442	2010-12-01 15:41:55.03442
13	7	dk	Blurb agent home	Blurb agent home	2010-12-01 15:41:55.074942	2010-12-01 15:41:55.074942
14	7	en	Blurb agent home	Blurb agent home	2010-12-01 15:41:55.095366	2010-12-01 15:41:55.095366
15	8	dk	Blurb start page role selection	Blurb start page role selection	2010-12-01 15:41:55.125141	2010-12-01 15:41:55.125141
16	8	en	Blurb start page role selection	Blurb start page role selection	2010-12-01 15:41:55.172845	2010-12-01 15:41:55.172845
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, title, content, created_at, updated_at, key, scope) FROM stdin;
1	Article::Cms	About us	About us	2010-12-01 15:41:54.673149	2010-12-01 15:41:54.712065	about_us	0
2	Article::Cms	Privacy	Privacy	2010-12-01 15:41:54.743907	2010-12-01 15:41:54.772276	privacy	0
3	Article::Cms	Terms & Conditions	Terms & Conditions	2010-12-01 15:41:54.810717	2010-12-01 15:41:54.840078	terms_conditions	0
4	Article::Cms	Contact us	Contact us	2010-12-01 15:41:54.879148	2010-12-01 15:41:54.898777	contact_us	0
5	Article::Cms	Blurb sign up	Blurb sign up	2010-12-01 15:41:54.935209	2010-12-01 15:41:54.962265	blurb_sign_up	1
6	Article::Cms	Blurb buyer home	Blurb buyer home	2010-12-01 15:41:55.006252	2010-12-01 15:41:55.028146	blurb_buyer_home	1
7	Article::Cms	Blurb agent home	Blurb agent home	2010-12-01 15:41:55.068793	2010-12-01 15:41:55.09009	blurb_agent_home	1
8	Article::Cms	Blurb start page role selection	Blurb start page role selection	2010-12-01 15:41:55.119994	2010-12-01 15:41:55.168539	blurb_start_page_role_selection	1
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count) FROM stdin;
1	Test category 1	\N	2010-12-01 15:41:51.924149	2010-12-01 15:41:51.924149	\N	1	2	\N	0
2	Test category 2	\N	2010-12-01 15:41:52.015862	2010-12-01 15:41:52.015862	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-12-01 15:41:51.962429	2010-12-01 15:41:51.962429
2	2	en	\N	Test category 2	2010-12-01 15:41:52.025947	2010-12-01 15:41:52.025947
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-01 15:41:52.439197	2010-12-01 15:41:52.439197
2	United Kingdom	2010-12-01 15:41:52.475952	2010-12-01 15:41:52.475952
3	Northern Ireland	2010-12-01 15:41:54.069196	2010-12-01 15:41:54.069196
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-01 15:41:52.59166	2010-12-01 15:41:52.59166
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-01 15:41:52.644758	2010-12-01 15:41:52.644758
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-01 15:41:52.673379	2010-12-01 15:41:52.673379
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-01 15:41:52.693	2010-12-01 15:41:52.693
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-01 15:41:52.723426	2010-12-01 15:41:52.723426
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-01 15:41:52.745664	2010-12-01 15:41:52.745664
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-01 15:41:52.77312	2010-12-01 15:41:52.77312
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-01 15:41:52.79994	2010-12-01 15:41:52.79994
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-01 15:41:52.830143	2010-12-01 15:41:52.830143
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-01 15:41:52.857827	2010-12-01 15:41:52.857827
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-01 15:41:52.562574	2010-12-01 15:41:52.639862
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-01 15:41:52.667323	2010-12-01 15:41:52.687749
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-01 15:41:52.717644	2010-12-01 15:41:52.740411
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-01 15:41:52.767325	2010-12-01 15:41:52.795416
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-01 15:41:52.824748	2010-12-01 15:41:52.851422
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, hidden_description, description, header, created_at, updated_at) FROM stdin;
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
1	level_one_certification_threshold	--- 0\n	2010-12-01 15:41:52.051287	2010-12-01 15:41:52.051287
2	level_two_certification_threshold	--- 0\n	2010-12-01 15:41:52.063444	2010-12-01 15:41:52.063444
3	level_three_certification_threshold	--- 0\n	2010-12-01 15:41:52.071979	2010-12-01 15:41:52.071979
4	default_payout_delay	--- 0\n	2010-12-01 15:41:52.081604	2010-12-01 15:41:52.081604
5	default_leads_per_page	--- 5\n	2010-12-01 15:41:52.088437	2010-12-01 15:41:52.088437
6	default_news_per_page	--- 5\n	2010-12-01 15:41:52.101545	2010-12-01 15:41:52.101545
7	certification_level_1	--- 10\n	2010-12-01 15:41:52.11194	2010-12-01 15:41:52.11194
8	certification_level_2	--- 20\n	2010-12-01 15:41:52.119115	2010-12-01 15:41:52.119115
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
1	blazejek@gmail.com	4840fdb39d0bf0e2b8689ce506a403bc3ef704051a983f52ecfe4c5caf0f23299d07a7e76779a5c32b8dfd942f525f494e3742466632a756ce3b1503de5cf254	q6orxlUgarLPYRRs3WoS	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 15:41:53.742117	2010-12-01 15:41:52.95915	\N	2010-12-01 15:41:52.959494	2010-12-01 15:41:53.74268	1	Clay	Oberbrunner	(543)067-2537 x02867	admin1	McKenzie Circles	Watersland	32258-7645	Dorset	1	\N	\N	\N	\N	0	\N	\N	\N	\N	IiXXBP5zLiCoS2lKytUsansrg28gF6c27ytjnsbVrzSBUdF59DDcqz2YrgHK26	f	\N
2	buyer@gmail2.com	30a91e94aa9426667e439904ef62a39191541e03534076dff5fdc8b28d44e068debf97df4333cdb37bacb92cd83db3209a4d4e2d5528307d473299e54cd3ffed	wyOxDnq8vjgTYpIZFxuJ	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 15:41:53.966888	2010-12-01 15:41:53.851687	\N	2010-12-01 15:41:53.852376	2010-12-01 15:41:53.967395	48	Winona	Graham	(115)839-9307 x74618	Paris Conroy	Grady Roads	Enolaville	37737	Buckinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	JUfHcZq69QAVvhPAOTDHE2AUcaKm2P6yYVoaHG6rfYWhXN1JkrAQRYLuJ9oHhK	f	\N
3	agent@gmail2.com	c18522ca5bf237c3f76482460bb6c0e854dc4584b20fdb633297a8ea53c4c6c2cfce90436d64c28525b9c7bed8f61e2c426f70b616bd9bb37fa2c722dc6a6cc0	HYtI54AOXB40VrOa35Xv	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 15:41:54.190018	2010-12-01 15:41:54.084354	\N	2010-12-01 15:41:54.084684	2010-12-01 15:41:54.191697	2	Everett	Botsford	376.705.6315 x34035	Lucile Roberts	Zboncak Estates	Port Laurence	95182-1128	Humberside	3	\N	0	\N	\N	0	\N	\N	\N	\N	xGyPHhGbcuxFQy7YlJhgBMljHTUV5rtJ922vd4Qt8Fx3vNylwvPe8N1K5qDjc6	f	\N
4	leaduser@gmail2.com	7725c5bba265bcee1f08cd0e13349bae0cd373c047e3c66d6b3ccc62ec6133b26a0ce6e59c861e4f239b2851e2c1260639f405bda0a7bf24113aabe5b6a91360	ZQZFlzOCNXwQoJCf9upk	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 15:41:54.315427	2010-12-01 15:41:54.239217	\N	2010-12-01 15:41:54.239552	2010-12-01 15:41:54.328055	64	Velda	Jast	(991)654-2687 x15951	Ryley Hills	Meghan Junctions	New Solontown	42775	Oxfordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	PHjgySJBSbH9xFAh9gw4jJHHHWq2eVe8CCrt7PVMcD4OZ5V1WrHkEthl2T5XxC	f	\N
\.


--
-- PostgreSQL database dump complete
--

