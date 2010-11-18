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

SELECT pg_catalog.setval('email_template_translations_id_seq', 6, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 3, true);


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

SELECT pg_catalog.setval('settings_id_seq', 7, true);


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

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count) FROM stdin;
1	Test category 1	\N	2010-11-17 09:24:45.290378	2010-11-17 09:24:45.290378	\N	1	2	\N	0
2	Test category 2	\N	2010-11-17 09:24:45.306773	2010-11-17 09:24:45.306773	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-11-17 09:24:45.299049	2010-11-17 09:24:45.299049
2	2	en	\N	Test category 2	2010-11-17 09:24:45.309867	2010-11-17 09:24:45.309867
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-11-17 09:24:45.34259	2010-11-17 09:24:45.34259
2	United Kingdom	2010-11-17 09:24:45.347362	2010-11-17 09:24:45.347362
3	Scotland	2010-11-17 09:24:45.840701	2010-11-17 09:24:45.840701
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-17 09:24:45.371391	2010-11-17 09:24:45.371391
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-17 09:24:45.383341	2010-11-17 09:24:45.383341
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-17 09:24:45.392404	2010-11-17 09:24:45.392404
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-17 09:24:45.401125	2010-11-17 09:24:45.401125
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-17 09:24:45.410053	2010-11-17 09:24:45.410053
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-17 09:24:45.418879	2010-11-17 09:24:45.418879
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-17 09:24:45.363162	2010-11-17 09:24:45.380543
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-17 09:24:45.389207	2010-11-17 09:24:45.398495
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-11-17 09:24:45.40684	2010-11-17 09:24:45.416237
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, hidden_description, description, header, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, lead_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20101008094512
20101008111430
20101008135557
20101013104734
20101014083833
20101018111651
20101019095223
20101019121840
20101019123448
20101019124628
20101020071754
20101020082242
20101020084127
20101020102434
20101020125814
20101020145032
20101021071810
20101021072059
20101021072155
20101021134744
20101021134920
20101025102840
20101026091655
20101026101449
20101026111441
20101027073412
20101027080457
20101027081714
20101028094349
20101028110231
20101102123151
20101112143058
20101112144016
20101115115544
20101117080720
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	level_one_certification_threshold	--- 0\n	2010-11-17 09:24:45.31796	2010-11-17 09:24:45.31796
2	level_two_certification_threshold	--- 0\n	2010-11-17 09:24:45.323124	2010-11-17 09:24:45.323124
3	level_three_certification_threshold	--- 0\n	2010-11-17 09:24:45.325722	2010-11-17 09:24:45.325722
4	default_payout_delay	--- 0\n	2010-11-17 09:24:45.328396	2010-11-17 09:24:45.328396
5	default_leads_per_page	--- 5\n	2010-11-17 09:24:45.330861	2010-11-17 09:24:45.330861
6	certification_level_1	--- 10\n	2010-11-17 09:24:45.333454	2010-11-17 09:24:45.333454
7	certification_level_2	--- 20\n	2010-11-17 09:24:45.335931	2010-11-17 09:24:45.335931
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
1	blazejek@gmail.com	0c341412626abcb0e32058175e379bf1f72c7ff71bcdf7a6d3297627dad49dfe283d43609fcc93628bcc78d2cdcb7eff203fa5b1226a021d9fa668a131d66904	FUrbJua5fW52nc0M-1WS	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-17 09:24:45.76468	2010-11-17 09:24:45.452909	\N	2010-11-17 09:24:45.453157	2010-11-17 09:24:45.764971	1	Jarret	Lemke	(074)718-6627	admin1	Pollich Plain	Stoltenbergberg	37476-2730	County Londonderry	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Ksv8XSsg6dhFSOvxh9NaDbVkfsGVjwD0CgtgkKAL6QidDpYpV3lEhUIT5va41T	f	\N
2	buyer@gmail2.com	81f434d9395c23deb861891074d76f54408d29d442d1cdaded040bfc6fcc39ceefdfe8fad4315a613dffd3fbcc28e8ce24a30438ec8287a5a5f9804fa3300451	412b5n2zACWKAwHhM2Gi	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-17 09:24:45.816158	2010-11-17 09:24:45.792991	\N	2010-11-17 09:24:45.793219	2010-11-17 09:24:45.816442	112	Saige	Roberts	(030)603-1292	Tanner Anderson	Cara Gardens	West Annaland	14143-9042	Dumfries and Galloway	1	\N	\N	\N	\N	0	\N	\N	\N	\N	VRhwZgHtxbarrp3XMijcbBbWHNXDDdfbBBcLGLSc3zTAhVWp27ouCR96UsaION	f	\N
3	agent@gmail2.com	f4563d42959efe22909fe52dc566e5d662974745239a6d0c12f45b4a2d9f5499d897a5f9e1c6973d6664238144afc7d2ded8f1eaa7e47defd5be796383ae4943	GPqtfCahs0AT8-uPf1Er	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-17 09:24:45.870297	2010-11-17 09:24:45.846944	\N	2010-11-17 09:24:45.847165	2010-11-17 09:24:45.870579	2	Asa	Lakin	1-039-395-1853 x6336	Annamae Fisher IV	Hills Camp	Monahanton	07181-2332	North Yorkshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	AyAWzVHAXqDfO8cVmv7YoeQrxnWngoMfS5ZMcFeAqsT5X8AiZ4K1js0Jtxjs4x	f	\N
\.


--
-- PostgreSQL database dump complete
--

