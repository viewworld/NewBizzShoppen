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

SELECT pg_catalog.setval('email_template_translations_id_seq', 8, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 4, true);


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
1	Test category 1	\N	2010-11-24 10:12:00.789359	2010-11-24 10:12:00.789359	\N	1	2	\N	0
2	Test category 2	\N	2010-11-24 10:12:00.805397	2010-11-24 10:12:00.805397	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-11-24 10:12:00.798004	2010-11-24 10:12:00.798004
2	2	en	\N	Test category 2	2010-11-24 10:12:00.808423	2010-11-24 10:12:00.808423
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-11-24 10:12:00.839612	2010-11-24 10:12:00.839612
2	United Kingdom	2010-11-24 10:12:00.844255	2010-11-24 10:12:00.844255
3	Northern Ireland	2010-11-24 10:12:01.450757	2010-11-24 10:12:01.450757
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-24 10:12:00.867466	2010-11-24 10:12:00.867466
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-24 10:12:00.878931	2010-11-24 10:12:00.878931
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-24 10:12:00.887578	2010-11-24 10:12:00.887578
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-24 10:12:00.896329	2010-11-24 10:12:00.896329
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-24 10:12:00.906566	2010-11-24 10:12:00.906566
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-24 10:12:00.917436	2010-11-24 10:12:00.917436
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-11-24 10:12:00.926455	2010-11-24 10:12:00.926455
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-11-24 10:12:00.935183	2010-11-24 10:12:00.935183
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-24 10:12:00.859698	2010-11-24 10:12:00.876232
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-24 10:12:00.884434	2010-11-24 10:12:00.893585
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-11-24 10:12:00.90255	2010-11-24 10:12:00.914534
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-11-24 10:12:00.923189	2010-11-24 10:12:00.932476
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline) FROM stdin;
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
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	level_one_certification_threshold	--- 0\n	2010-11-24 10:12:00.816483	2010-11-24 10:12:00.816483
2	level_two_certification_threshold	--- 0\n	2010-11-24 10:12:00.821594	2010-11-24 10:12:00.821594
3	level_three_certification_threshold	--- 0\n	2010-11-24 10:12:00.824168	2010-11-24 10:12:00.824168
4	default_payout_delay	--- 0\n	2010-11-24 10:12:00.826656	2010-11-24 10:12:00.826656
5	default_leads_per_page	--- 5\n	2010-11-24 10:12:00.829278	2010-11-24 10:12:00.829278
6	certification_level_1	--- 10\n	2010-11-24 10:12:00.831769	2010-11-24 10:12:00.831769
7	certification_level_2	--- 20\n	2010-11-24 10:12:00.834245	2010-11-24 10:12:00.834245
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
1	blazejek@gmail.com	a3a2cd8c44ea943f5a363f3f8242322dc00cb1c60e5025a179121b2b288607f8c5a1625d5443e0ff2834a67cabae8decfe5b68ef34df4bb6e62051b0205f4bda	y5Pe9lJSjJmuBhyGy8d_	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-24 10:12:01.249071	2010-11-24 10:12:00.969544	\N	2010-11-24 10:12:00.96977	2010-11-24 10:12:01.249369	1	Andreanne	Wisoky	(312)008-7372 x33367	admin1	Carrie Orchard	Friesenfort	14406	Northamptonshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	COqfXcnlkIR7wIFgbYHOw0bKoaqH2NlL6QtEbDSSqNkZot9UTCtQhRvj6eBlti	f	\N
2	buyer@gmail2.com	be2a686c9002c822f5f3e5713bd9f1308882aa96ea4f311cf31f48b7ee41b679b577ded193cb8a2214f4e416a04ce39e1f2884f0437e0d9b2222c0a9ccc7e3aa	s5Hm-LRnMFmEq7a6vRlG	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-24 10:12:01.301209	2010-11-24 10:12:01.277805	\N	2010-11-24 10:12:01.278039	2010-11-24 10:12:01.301526	112	Noemy	Quitzon	(503)331-2811 x1582	Kyler Hegmann	Steuber Via	Gerholdbury	74758-4204	Clwyd	1	\N	\N	\N	\N	0	\N	\N	\N	\N	5YxayIo0rJCFugTk9iPYwxAP2mdLEFCbfwQnwjORx7h0ElJQ4Z2CyAC5iUwwcL	f	\N
3	agent@gmail2.com	0c3c4d29a5cc32c4fe538b774f7c63c95feac9f615e9b69b60b081dd4ad44a1c961a5548cbad1ec34cdac1575920a25a753926f429b6fbe853840fe22b525333	ne8w-WVdPQ6VOcjsJcZt	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-24 10:12:01.480442	2010-11-24 10:12:01.457348	\N	2010-11-24 10:12:01.457571	2010-11-24 10:12:01.480729	2	Fredy	Hintz	586-090-6706 x5132	Jeremie Jones	Gleichner Forge	Kiehnchester	70003	Avon	3	\N	0	\N	\N	0	\N	\N	\N	\N	wl1y7X52wPpCvajOenlfLb3XBIKXnhEQQLBmPGWFVBec4vVEDmR9oZPWsbUYwN	f	\N
4	leaduser@gmail2.com	b3bf0786b7ed2423811fe5d9a6126f3d2d4cb0ab4a137dfc9c14674be11d391684db7b0b10e1feb9748753a9c80b995c0c8756a7c35cd78e657e3df7a8e3b87a	Ne6C0ONMc23D1EoNdqhl	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-24 10:12:01.531487	2010-11-24 10:12:01.508231	\N	2010-11-24 10:12:01.50846	2010-11-24 10:12:01.531768	64	Bradly	Walter	967.506.7673 x74601	Lily Herzog	Schmitt Mountain	South Zion	65600	Powys	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Ur781PiJHKWIksM63vpDJDGgQVYzNeoEZGAbb2QX1kVuDwbzmojEg5dSgHHdS9	f	\N
\.


--
-- PostgreSQL database dump complete
--

