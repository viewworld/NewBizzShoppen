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
1	Test category 1	\N	2010-11-22 11:18:49.283186	2010-11-22 11:18:49.283186	\N	1	2	\N	0
2	Test category 2	\N	2010-11-22 11:18:49.299988	2010-11-22 11:18:49.299988	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-11-22 11:18:49.292122	2010-11-22 11:18:49.292122
2	2	en	\N	Test category 2	2010-11-22 11:18:49.303303	2010-11-22 11:18:49.303303
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-11-22 11:18:49.338998	2010-11-22 11:18:49.338998
2	United Kingdom	2010-11-22 11:18:49.343688	2010-11-22 11:18:49.343688
3	Scotland	2010-11-22 11:18:49.937221	2010-11-22 11:18:49.937221
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-22 11:18:49.367571	2010-11-22 11:18:49.367571
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-22 11:18:49.379217	2010-11-22 11:18:49.379217
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-22 11:18:49.38819	2010-11-22 11:18:49.38819
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-22 11:18:49.397037	2010-11-22 11:18:49.397037
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-22 11:18:49.405734	2010-11-22 11:18:49.405734
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-22 11:18:49.414588	2010-11-22 11:18:49.414588
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-22 11:18:49.359461	2010-11-22 11:18:49.376379
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-22 11:18:49.384787	2010-11-22 11:18:49.394208
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-11-22 11:18:49.402639	2010-11-22 11:18:49.411942
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
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
1	level_one_certification_threshold	--- 0\n	2010-11-22 11:18:49.31378	2010-11-22 11:18:49.31378
2	level_two_certification_threshold	--- 0\n	2010-11-22 11:18:49.318952	2010-11-22 11:18:49.318952
3	level_three_certification_threshold	--- 0\n	2010-11-22 11:18:49.321635	2010-11-22 11:18:49.321635
4	default_payout_delay	--- 0\n	2010-11-22 11:18:49.324271	2010-11-22 11:18:49.324271
5	default_leads_per_page	--- 5\n	2010-11-22 11:18:49.326821	2010-11-22 11:18:49.326821
6	certification_level_1	--- 10\n	2010-11-22 11:18:49.329579	2010-11-22 11:18:49.329579
7	certification_level_2	--- 20\n	2010-11-22 11:18:49.332175	2010-11-22 11:18:49.332175
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
1	blazejek@gmail.com	c38deba1b9adfa945b2cad077e2edb011c72729083654d19ff72cfe57d5848529824e2049a6bdd0b78e562245933f2add732566fe97fe4bef0aa8e7cee64dd0d	J5W2OMChqUMKHa-3gKmF	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-22 11:18:49.735606	2010-11-22 11:18:49.448789	\N	2010-11-22 11:18:49.449039	2010-11-22 11:18:49.735901	1	Lucius	Williamson	1-179-858-3298 x36679	admin1	Verda Ridge	South Yvetteshire	07356-0040	Nottinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	fwRnv2Uf5Ecsf2ISETHZz6hOBJfuGJZ08LzA36b2o0Fmf5okQA09JmKe00dJah	f	\N
2	buyer@gmail2.com	b58268526cd6f6b2f41feddf8199ec20ecf911c52878c8da85a6ec27d97cf9e79ba54d7df222fa8b6da9dbe66f2f04249b16480273e74d57b7b351c4b66315b7	YOT-BFOaEcc1QUJuQUJf	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-22 11:18:49.788942	2010-11-22 11:18:49.765384	\N	2010-11-22 11:18:49.765622	2010-11-22 11:18:49.78927	112	Jake	Lockman	1-981-632-5780	Ayden Mayert	Rubie Neck	West Harley	10838	Merseyside	1	\N	\N	\N	\N	0	\N	\N	\N	\N	uiLdt67P5cfGV4Uisq2O4iGDTjArxZRcnmZM0bfLpaa0CZfAlXzWPrgdMaUZmf	f	\N
3	agent@gmail2.com	8dfb42c70b7b7a3b05245f146c5dc4dd69b60787c641b0269949e415fd04b1c358fcaee87755a815f97956411db2c0d95f773cf5c0a282d6af9a40a89a188ac5	amBjghfPh2aK1ewStzuI	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-22 11:18:49.967112	2010-11-22 11:18:49.943559	\N	2010-11-22 11:18:49.943771	2010-11-22 11:18:49.967411	2	Garfield	Wunsch	1-442-958-2344 x47177	Mr. Jodie Corkery	Conn Route	Port Lyda	79354-6810	Leicestershire	3	\N	0	\N	\N	0	\N	\N	\N	\N	mnQlmaIxwVv4SAJJ44ZRrorpPxe4Ddlm2hjdtFaB6dCLRT1mk2jh6r7eUjl2CU	f	\N
\.


--
-- PostgreSQL database dump complete
--

