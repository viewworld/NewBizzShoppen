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
1	Test category 1	\N	2010-11-24 12:43:21.687676	2010-11-24 12:43:21.687676	\N	1	2	\N	0
2	Test category 2	\N	2010-11-24 12:43:21.767313	2010-11-24 12:43:21.767313	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-11-24 12:43:21.70265	2010-11-24 12:43:21.70265
2	2	en	\N	Test category 2	2010-11-24 12:43:21.775007	2010-11-24 12:43:21.775007
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-11-24 12:43:21.951267	2010-11-24 12:43:21.951267
2	United Kingdom	2010-11-24 12:43:21.981268	2010-11-24 12:43:21.981268
3	England	2010-11-24 12:43:22.759201	2010-11-24 12:43:22.759201
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-24 12:43:22.025351	2010-11-24 12:43:22.025351
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-24 12:43:22.046021	2010-11-24 12:43:22.046021
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-24 12:43:22.074913	2010-11-24 12:43:22.074913
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-24 12:43:22.09245	2010-11-24 12:43:22.09245
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-24 12:43:22.108191	2010-11-24 12:43:22.108191
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-24 12:43:22.123772	2010-11-24 12:43:22.123772
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-11-24 12:43:22.140051	2010-11-24 12:43:22.140051
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-11-24 12:43:22.157338	2010-11-24 12:43:22.157338
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-24 12:43:22.173404	2010-11-24 12:43:22.173404
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-24 12:43:22.188426	2010-11-24 12:43:22.188426
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-24 12:43:22.014762	2010-11-24 12:43:22.04133
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-24 12:43:22.069627	2010-11-24 12:43:22.08821
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-11-24 12:43:22.103325	2010-11-24 12:43:22.119734
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-11-24 12:43:22.135421	2010-11-24 12:43:22.152837
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-11-24 12:43:22.168324	2010-11-24 12:43:22.184616
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
20101118150731
20101122110450
20101124100329
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	level_one_certification_threshold	--- 0\n	2010-11-24 12:43:21.87955	2010-11-24 12:43:21.87955
2	level_two_certification_threshold	--- 0\n	2010-11-24 12:43:21.889019	2010-11-24 12:43:21.889019
3	level_three_certification_threshold	--- 0\n	2010-11-24 12:43:21.896075	2010-11-24 12:43:21.896075
4	default_payout_delay	--- 0\n	2010-11-24 12:43:21.903263	2010-11-24 12:43:21.903263
5	default_leads_per_page	--- 5\n	2010-11-24 12:43:21.911104	2010-11-24 12:43:21.911104
6	certification_level_1	--- 10\n	2010-11-24 12:43:21.918033	2010-11-24 12:43:21.918033
7	certification_level_2	--- 20\n	2010-11-24 12:43:21.925206	2010-11-24 12:43:21.925206
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
1	blazejek@gmail.com	49aec2f09177da59ee82888ecdd988772aa05ab418716a73a4551631b1482ca05821ee7b0c9e44cb88c813c23b3ea28f0765c7ffadcf1d88c47f4c80b10696e8	LDIIjvbIVZPV8rLvM-fX	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-24 12:43:22.628667	2010-11-24 12:43:22.247007	\N	2010-11-24 12:43:22.247376	2010-11-24 12:43:22.629537	1	Cristobal	Howe	1-600-936-6597 x795	admin1	Earlene Fall	West Zackeryhaven	07529-7503	Dorset	1	\N	\N	\N	\N	0	\N	\N	\N	\N	ccvDvTiutVP5ylmOKvlK8x0s1NwWen06yoi70sUN9gi8If68YNfdiTIZOXg17b	f	\N
2	buyer@gmail2.com	4a7241ab0428644742e86ac5bfe01cc10bb51d97cf27559cc29a2230bbca94b8c9410e33aae7d75e6c151a32591e526e5edf0f40a6670fc7e05487cf4428f978	vRv3L2GXZAZPhAL9qHNR	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-24 12:43:22.711561	2010-11-24 12:43:22.671699	\N	2010-11-24 12:43:22.672026	2010-11-24 12:43:22.712289	112	Peter	Lebsack	1-667-850-0553	Esther Conroy	Wisozk Cove	Lake Mortimer	82168-3388	Cleveland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	mhnXRoByCrnh2pcEbGHBUpoUO9Jv9R0GqObLTinvllj4zDQYHBiqvNZf9vSNzQ	f	\N
3	agent@gmail2.com	2ed2284db78a7c48377ec984544126d7443c1cfeaed6a44f4b9b3af9f92edff0f2a51985bf4c2334bf6a36e7749a5d6fbd4c64e4d2e9be1971273a9edb1b6469	2IMBOjU-mm3XTYc94QS1	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-24 12:43:22.811008	2010-11-24 12:43:22.771878	\N	2010-11-24 12:43:22.772203	2010-11-24 12:43:22.811633	2	Ewald	DuBuque	1-321-121-5144	Kellen Hauck	Savion Pass	Hoegerburgh	20910-7085	County Tyrone	3	\N	0	\N	\N	0	\N	\N	\N	\N	v877uHmBKjSjXfD2Q8ooGe9qjLCzYbxEh8yjrJZHs5SQI65ss3gYVRyablUSnj	f	\N
4	leaduser@gmail2.com	16f378e45cd2ff1f1e74ded9cf6dae762573ce53925cbe6d2d3823dfc8c95d3aae87ab133b1e6471616037baea43445dfaad0c1c393f6c1165eec830903cc929	aDl54b1EebFD7qaI1vou	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-24 12:43:22.931465	2010-11-24 12:43:22.862196	\N	2010-11-24 12:43:22.862534	2010-11-24 12:43:22.932099	64	Martine	Pouros	122.102.5187	Imogene Aufderhar	Ebba Plains	Turcotteland	92205-5421	Gwynedd County	1	\N	\N	\N	\N	0	\N	\N	\N	\N	deTGevhgA31Eylrnbxps6faRk5UW6MzW6XcDTfDV8h03aWC6mrao2fUPamNPZY	f	\N
\.


--
-- PostgreSQL database dump complete
--

