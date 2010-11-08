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

SELECT pg_catalog.setval('assets_id_seq', 5, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('categories_id_seq', 1163, true);


--
-- Name: category_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_interests_id_seq', 4, true);


--
-- Name: category_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_translations_id_seq', 1161, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('countries_id_seq', 21, true);


--
-- Name: country_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_interests_id_seq', 2, true);


--
-- Name: email_template_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_template_translations_id_seq', 20, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 10, true);


--
-- Name: lead_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_purchases_id_seq', 63, true);


--
-- Name: lead_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_translations_id_seq', 525, true);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('leads_id_seq', 517, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('settings_id_seq', 22, true);


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

SELECT pg_catalog.setval('users_id_seq', 1290, true);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count) FROM stdin;
1162	Test category 1	\N	2010-11-08 12:11:15.395926	2010-11-08 12:11:15.395926	\N	1	2	\N	0
1163	Test category 2	\N	2010-11-08 12:11:15.41442	2010-11-08 12:11:15.41442	\N	3	4	\N	0
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
1160	1162	dk	\N	Test category 1	2010-11-08 12:11:15.40692	2010-11-08 12:11:15.40692
1161	1163	dk	\N	Test category 2	2010-11-08 12:11:15.417704	2010-11-08 12:11:15.417704
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
20	Denmark	2010-11-08 12:11:15.4494	2010-11-08 12:11:15.4494
21	United Kingdom	2010-11-08 12:11:15.454196	2010-11-08 12:11:15.454196
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
17	9	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-08 12:11:15.485893	2010-11-08 12:11:15.485893
18	9	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-08 12:11:15.497858	2010-11-08 12:11:15.497858
19	10	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-08 12:11:15.507277	2010-11-08 12:11:15.507277
20	10	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-08 12:11:15.51662	2010-11-08 12:11:15.51662
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
9	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-08 12:11:15.477496	2010-11-08 12:11:15.495027
10	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-08 12:11:15.504166	2010-11-08 12:11:15.513904
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

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, lead_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address) FROM stdin;
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
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
18	level_one_certification_threshold	--- 0\n	2010-11-08 12:11:15.426165	2010-11-08 12:11:15.426165
19	level_two_certification_threshold	--- 0\n	2010-11-08 12:11:15.431549	2010-11-08 12:11:15.431549
20	level_three_certification_threshold	--- 0\n	2010-11-08 12:11:15.434231	2010-11-08 12:11:15.434231
21	default_payout_delay	--- 0\n	2010-11-08 12:11:15.437095	2010-11-08 12:11:15.437095
22	default_leads_per_page	--- 5\n	2010-11-08 12:11:15.440181	2010-11-08 12:11:15.440181
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
1288	blazejek@gmail.com	29afdf3612297bc01c115a9aaa6ca2005f174fb8ea6cc10025148a0a00aeff7e991137b376c333bd05cfa5b598bea28bf0c23798717453b229939855917fb692	DhkkgahhGHzo2Kb8_UJ1	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-08 12:11:15.835037	2010-11-08 12:11:15.553179	\N	2010-11-08 12:11:15.553459	2010-11-08 12:11:15.835365	1	Shaniya	Adams	168-627-1197	admin1	Schaden Point	Smithamside	73092-6950	Greater Manchester	1	\N	\N	\N	\N	0	\N	\N	\N	\N	6CtfutIgxGNTirVlXo3Bg2UAz6TksZpn95icF5aL903bj1oHQe9EDAEYw9Yu5u	f	\N
1289	buyer@gmail2.com	6328f018e240112874329a0baf5bc6d14036a9e68dc39b8a96a83569d7ebcd4f2d9b867c9aab061ad29c6abaeb1c729916ded293f4051fec1afccd9db566742c	BZXzm9ead5UZKu7Y0rlR	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-08 12:11:15.889715	2010-11-08 12:11:15.866034	\N	2010-11-08 12:11:15.866266	2010-11-08 12:11:15.890013	112	Micaela	Little	(302)307-4065 x5027	Tiffany Koelpin	Lang Rapids	West Modesta	54508	County Down	1	\N	\N	\N	\N	0	\N	\N	\N	\N	nsb9U8CkpPXLT9p1PhpsQxSun6aHgTDae2i8pJkAosHWLxTPpXfLf0fa0UCWY2	f	\N
1290	agent@gmail2.com	ddc139b6abc150f6a2963c415de2244b73231a84071a0cdb86ec8e53578fa62b464c85efadfae5719da56f8d3811ed2a20664966dabf11a5c68833bac6b5f21b	aTWjA5DQEpo9iSZIhNDK	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-08 12:11:16.071343	2010-11-08 12:11:16.047128	\N	2010-11-08 12:11:16.047357	2010-11-08 12:11:16.071675	2	Claude	Heidenreich	105-083-4327	Era Vandervort	Kertzmann Lake	Lake Jamarcus	71830	West Yorkshire	20	\N	0	\N	\N	0	\N	\N	\N	\N	5sryLLkXm6DikzZq5SjwizaiKH0cMTCD5G7v6OTMhnxFcsvq6x9Qjq9J8WyGTA	f	\N
\.


--
-- PostgreSQL database dump complete
--

