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

SELECT pg_catalog.setval('settings_id_seq', 5, true);


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
1	Test category 1	\N	2010-11-09 14:15:10.171618	2010-11-09 14:15:10.171618	\N	1	2	\N	0
2	Test category 2	\N	2010-11-09 14:15:10.192755	2010-11-09 14:15:10.192755	\N	3	4	\N	0
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
1	1	dk	\N	Test category 1	2010-11-09 14:15:10.1843	2010-11-09 14:15:10.1843
2	2	dk	\N	Test category 2	2010-11-09 14:15:10.196	2010-11-09 14:15:10.196
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-11-09 14:15:10.224771	2010-11-09 14:15:10.224771
2	United Kingdom	2010-11-09 14:15:10.229747	2010-11-09 14:15:10.229747
3	Northern Ireland	2010-11-09 14:15:10.827148	2010-11-09 14:15:10.827148
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-09 14:15:10.261757	2010-11-09 14:15:10.261757
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-09 14:15:10.273739	2010-11-09 14:15:10.273739
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-09 14:15:10.283578	2010-11-09 14:15:10.283578
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-09 14:15:10.293457	2010-11-09 14:15:10.293457
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-09 14:15:10.253842	2010-11-09 14:15:10.270787
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-09 14:15:10.279794	2010-11-09 14:15:10.289675
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, header, description, hidden_description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, lead_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20101109140010
20101008111430
20101026111441
20101021134744
20101021134920
20101020102434
20101027073412
20101026091655
20101026101449
20101008094512
20101025102840
20101019123448
20101019124628
20101027080457
20101008135557
20101018111651
20101020071754
20101021072155
20101028094349
20101013104734
20101102123151
20101019121840
20101021072059
20101014083833
20101020082242
20101027081714
20101020145032
20101020084127
20101019095223
20101028110231
20101020125814
20101021071810
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	level_one_certification_threshold	--- 0\n	2010-11-09 14:15:10.204544	2010-11-09 14:15:10.204544
2	level_two_certification_threshold	--- 0\n	2010-11-09 14:15:10.209822	2010-11-09 14:15:10.209822
3	level_three_certification_threshold	--- 0\n	2010-11-09 14:15:10.212422	2010-11-09 14:15:10.212422
4	default_payout_delay	--- 0\n	2010-11-09 14:15:10.215144	2010-11-09 14:15:10.215144
5	default_leads_per_page	--- 5\n	2010-11-09 14:15:10.217642	2010-11-09 14:15:10.217642
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
1	blazejek@gmail.com	e5cf8adb1bd2ca18828978d0817119771fd290d8b5787820d8a53fac3e001b5104d064457884f7ebbc10504e96624f511e2d1b9af88a6575f2de3d2733ee7b73	RNu2BNznY-WxYM1CjGPF	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-09 14:15:10.616283	2010-11-09 14:15:10.328743	\N	2010-11-09 14:15:10.328982	2010-11-09 14:15:10.61668	1	Tate	Jones	(173)871-8670	admin1	Nicholas Bridge	South Denaburgh	87581	Durham	1	\N	\N	\N	\N	0	\N	\N	\N	\N	3DtBdycDgxcvGyckb1czODlA67uGdcl3isuhPkPnCm8dzsCmEvpi64DnNTRKYs	f	\N
2	buyer@gmail2.com	b3a15554fb804fc6e48794bca03636ccd5486f99bfa7976fa137771cc1e4551ebc2104dfa079c8b4155cc808d00f61ab1978389051070907b79dbe9a0bde8a53	VQ3RiixTP5jqTYgE9aEF	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-09 14:15:10.671563	2010-11-09 14:15:10.647494	\N	2010-11-09 14:15:10.647738	2010-11-09 14:15:10.671872	112	Idella	Nikolaus	272.749.4115 x358	Euna Jacobson	Itzel Way	Averytown	48332-2943	Staffordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Q56k7Lax1AMSZxJSr1BnhoLZo7LtheEiwOw0fl47p6lTAMmEqcS6NSnmgI0naM	f	\N
3	agent@gmail2.com	b98b624083dc3d8e31928d1460a8d5040b39d3dc3835683a10d00469f9daa195f26c021dc5cfb338f39ae46093bf98356d105f087f8ed75dcc06cb5d3cc1342c	PL5S3UShzGZphw30MliF	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-09 14:15:10.858667	2010-11-09 14:15:10.834049	\N	2010-11-09 14:15:10.834262	2010-11-09 14:15:10.858951	2	Bettie	Moore	(487)104-7104	Joyce Kuphal	Batz Gardens	Kendallview	95623-2540	Cheshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	EiSjfYTUFB3jlI5gEyuTLdbk0JAXyKkRFev6NHfexe0clbqukUCEYA4HfyET0U	f	\N
\.


--
-- PostgreSQL database dump complete
--

