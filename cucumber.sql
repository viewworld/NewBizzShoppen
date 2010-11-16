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

SELECT pg_catalog.setval('email_template_translations_id_seq', 4, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 2, true);


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
1	Test category 1	\N	2010-11-15 12:07:16.772299	2010-11-15 12:07:16.772299	\N	1	2	\N	0
2	Test category 2	\N	2010-11-15 12:07:16.790526	2010-11-15 12:07:16.790526	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-11-15 12:07:16.78306	2010-11-15 12:07:16.78306
2	2	en	\N	Test category 2	2010-11-15 12:07:16.793507	2010-11-15 12:07:16.793507
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-11-15 12:07:16.829638	2010-11-15 12:07:16.829638
2	United Kingdom	2010-11-15 12:07:16.834481	2010-11-15 12:07:16.834481
3	Northern Ireland	2010-11-15 12:07:17.405025	2010-11-15 12:07:17.405025
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-15 12:07:16.866202	2010-11-15 12:07:16.866202
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-15 12:07:16.878214	2010-11-15 12:07:16.878214
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-15 12:07:16.887489	2010-11-15 12:07:16.887489
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-15 12:07:16.89653	2010-11-15 12:07:16.89653
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-15 12:07:16.857833	2010-11-15 12:07:16.875199
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-15 12:07:16.884101	2010-11-15 12:07:16.893663
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, lead_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_count, exposures_count) FROM stdin;
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
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	level_one_certification_threshold	--- 0\n	2010-11-15 12:07:16.801508	2010-11-15 12:07:16.801508
2	level_two_certification_threshold	--- 0\n	2010-11-15 12:07:16.806674	2010-11-15 12:07:16.806674
3	level_three_certification_threshold	--- 0\n	2010-11-15 12:07:16.809276	2010-11-15 12:07:16.809276
4	default_payout_delay	--- 0\n	2010-11-15 12:07:16.811765	2010-11-15 12:07:16.811765
5	default_leads_per_page	--- 5\n	2010-11-15 12:07:16.817673	2010-11-15 12:07:16.817673
6	certification_level_1	--- 10\n	2010-11-15 12:07:16.820351	2010-11-15 12:07:16.820351
7	certification_level_2	--- 20\n	2010-11-15 12:07:16.822946	2010-11-15 12:07:16.822946
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
1	blazejek@gmail.com	f7967181d28f8d346911866d90920573fd58fae288b79a3fd9e7967dc9637d01dd1fcfe73d96690be447755f97e6bb38833841a353b5e74cc7b50605e3849e96	IPgj36VCheRf-qkqELCt	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-15 12:07:17.20342	2010-11-15 12:07:17.02236	\N	2010-11-15 12:07:17.022591	2010-11-15 12:07:17.203708	1	Jovan	Lockman	033.009.5405 x687	admin1	Amos Parkways	North Fannie	62562-8539	South Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	crKdFHMibhzlXPdo9NwKpUW3lIkvOk937oi2mhuHfURPnToWVMSnKcRt3ZGniO	f	\N
2	buyer@gmail2.com	42035de52a0e8dc01d398ab46ecb2301cee07bc6d4522c942ce9a9111921768918dce8f5e57192c3925bda39467f30fe6b03088bd54ad330724f0468a5d2b82b	-jqxCYY6DxS2rOAxjbVe	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-15 12:07:17.379513	2010-11-15 12:07:17.232741	\N	2010-11-15 12:07:17.232986	2010-11-15 12:07:17.379791	112	Jake	Keebler	(517)775-6727 x718	Alysa Cole	Roob Fall	Vonchester	05812-7347	Somerset	1	\N	\N	\N	\N	0	\N	\N	\N	\N	aHdalPjAnaVOLoiu7ViLQJAI9reWUqcUL7kYEBz2YNBj5Pw9YeLgU1C4sLkakA	f	\N
3	agent@gmail2.com	d1c657377c08d8aa1ac9b5c2957c5fd7f9f5b17aa998af49923a53ac0f29a10143996600105420c9b9cf5bbf6f34a2dac15cbf991b56d587b96d19a9e44c6308	uoWQd5iJshah6AtEQF2k	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-15 12:07:17.434434	2010-11-15 12:07:17.411229	\N	2010-11-15 12:07:17.411445	2010-11-15 12:07:17.434727	2	Eladio	Russel	373-750-1796 x7832	Karli Cummings	Alberto Vista	Zboncakport	33380-4306	Nottinghamshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	NS5A6FwJMFsU5jQrGTiPbZ554OoN89iMsN0qzmHkNuCdl4fbp0lp6p6CiMLY9H	f	\N
\.


--
-- PostgreSQL database dump complete
--

