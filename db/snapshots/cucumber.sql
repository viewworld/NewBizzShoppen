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
1	Test category 1	\N	2010-11-25 10:42:56.386912	2010-11-25 10:42:56.386912	\N	1	2	\N	0
2	Test category 2	\N	2010-11-25 10:42:56.403269	2010-11-25 10:42:56.403269	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-11-25 10:42:56.395772	2010-11-25 10:42:56.395772
2	2	en	\N	Test category 2	2010-11-25 10:42:56.406248	2010-11-25 10:42:56.406248
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-11-25 10:42:56.443298	2010-11-25 10:42:56.443298
2	United Kingdom	2010-11-25 10:42:56.447914	2010-11-25 10:42:56.447914
3	Northern Ireland	2010-11-25 10:42:57.07914	2010-11-25 10:42:57.07914
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-25 10:42:56.472079	2010-11-25 10:42:56.472079
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-25 10:42:56.483862	2010-11-25 10:42:56.483862
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-25 10:42:56.493214	2010-11-25 10:42:56.493214
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-25 10:42:56.502423	2010-11-25 10:42:56.502423
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-25 10:42:56.511705	2010-11-25 10:42:56.511705
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-25 10:42:56.521383	2010-11-25 10:42:56.521383
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-11-25 10:42:56.530881	2010-11-25 10:42:56.530881
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-11-25 10:42:56.540193	2010-11-25 10:42:56.540193
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-25 10:42:56.549613	2010-11-25 10:42:56.549613
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-25 10:42:56.559065	2010-11-25 10:42:56.559065
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-25 10:42:56.463759	2010-11-25 10:42:56.481119
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-25 10:42:56.489915	2010-11-25 10:42:56.499731
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-11-25 10:42:56.508523	2010-11-25 10:42:56.518387
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-11-25 10:42:56.527331	2010-11-25 10:42:56.537392
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-11-25 10:42:56.546374	2010-11-25 10:42:56.556292
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
1	level_one_certification_threshold	--- 0\n	2010-11-25 10:42:56.414586	2010-11-25 10:42:56.414586
2	level_two_certification_threshold	--- 0\n	2010-11-25 10:42:56.419944	2010-11-25 10:42:56.419944
3	level_three_certification_threshold	--- 0\n	2010-11-25 10:42:56.422445	2010-11-25 10:42:56.422445
4	default_payout_delay	--- 0\n	2010-11-25 10:42:56.425286	2010-11-25 10:42:56.425286
5	default_leads_per_page	--- 5\n	2010-11-25 10:42:56.427819	2010-11-25 10:42:56.427819
6	certification_level_1	--- 10\n	2010-11-25 10:42:56.435046	2010-11-25 10:42:56.435046
7	certification_level_2	--- 20\n	2010-11-25 10:42:56.437769	2010-11-25 10:42:56.437769
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
1	blazejek@gmail.com	147d56ec987c4a06907ab69ffc123a46254ffe644dd8f0bb7db62729e4f5f2bdd28458eae6ae1d9bd9f07c45403ab3ed9c0413d2948e604baad64dc4d2433a57	kV2gVtSoTUb7bwbq7EDa	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 10:42:56.873801	2010-11-25 10:42:56.68708	\N	2010-11-25 10:42:56.687311	2010-11-25 10:42:56.874093	1	Susie	Sipes	(048)187-1638 x5400	admin1	Considine Dam	New Patienceland	07626-9760	Central	1	\N	\N	\N	\N	0	\N	\N	\N	\N	CR9BNyiWTm4CW00RVuYXpV04aq73JvuVmGuvW5t7K0YHLIp6MhCS3Bv9bvVyV3	f	\N
2	buyer@gmail2.com	abea9e27f8f64a8882c424725eebacb0b38b8c1ead8ffb8d6bfa9b76598c28db3223451d0dddbfd7ec241fc0dc2b536ea8341d38a9c10681c181ae08ea573a81	NTIJmYUAqoTmGlTBqvnt	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 10:42:57.054174	2010-11-25 10:42:57.030932	\N	2010-11-25 10:42:57.031161	2010-11-25 10:42:57.054467	48	Emilia	Green	(409)943-9009	Ayana Kulas DDS	Batz Heights	East Demondville	45816	Oxfordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	erMZEO88KGpaxHafxB9YwsLpS8M68NUYnaGHjTK05cU1amMA9gXX5ZnDpPBYhv	f	\N
3	agent@gmail2.com	19cd620ca86db86e186cd519940f67ebdcadcf41e6097793b7462a116bc5c9eab777fbc689749d94f9ca94f524ceaff25a9b1b21f34aefa1ba814c09d7a293bf	kjw-MJFgn3vJ2JLsFm1w	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 10:42:57.108523	2010-11-25 10:42:57.085295	\N	2010-11-25 10:42:57.085519	2010-11-25 10:42:57.108813	2	Manuel	Streich	629-148-7419	Zella Kilback	Witting Pass	Kerlukeborough	47978	Somerset	3	\N	0	\N	\N	0	\N	\N	\N	\N	xf8GXU26rvXMBpGZz3SfNT4zXWRDdq1UCG9az0NFAyeppshzMp63jIzP0Skbhz	f	\N
4	leaduser@gmail2.com	9e9bdf3c378b363842b7e23799cd4e208e0ff2da8c44f3150c6edbf914cce08e6fc4e83231d4457e2c0ba686f55933192bc70c7a7d74c38b5fdb6aebce73d956	cWDdwUjf8JPzFOsQo23P	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 10:42:57.159201	2010-11-25 10:42:57.136361	\N	2010-11-25 10:42:57.136587	2010-11-25 10:42:57.15949	64	Zechariah	Marquardt	1-399-507-4852 x940	Mr. Aisha Jacobi	Deckow Stream	Jacestad	17247	Powys	1	\N	\N	\N	\N	0	\N	\N	\N	\N	ku0nQPi1wniXkp1ddYRGq7Q8uKBrmpyy3zUFz9HzCvZHw2LtrOKr5RAHANuMuS	f	\N
\.


--
-- PostgreSQL database dump complete
--

