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
1	Test category 1	\N	2010-11-25 11:51:13.39193	2010-11-25 11:51:13.39193	\N	1	2	\N	0
2	Test category 2	\N	2010-11-25 11:51:13.415377	2010-11-25 11:51:13.415377	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-11-25 11:51:13.403287	2010-11-25 11:51:13.403287
2	2	en	\N	Test category 2	2010-11-25 11:51:13.42164	2010-11-25 11:51:13.42164
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-11-25 11:51:13.500828	2010-11-25 11:51:13.500828
2	United Kingdom	2010-11-25 11:51:13.513077	2010-11-25 11:51:13.513077
3	England	2010-11-25 11:51:14.629059	2010-11-25 11:51:14.629059
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-25 11:51:13.552422	2010-11-25 11:51:13.552422
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-25 11:51:13.572555	2010-11-25 11:51:13.572555
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-25 11:51:13.589725	2010-11-25 11:51:13.589725
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-25 11:51:13.621526	2010-11-25 11:51:13.621526
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-25 11:51:13.65418	2010-11-25 11:51:13.65418
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-25 11:51:13.868964	2010-11-25 11:51:13.868964
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-11-25 11:51:13.894804	2010-11-25 11:51:13.894804
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-11-25 11:51:13.920507	2010-11-25 11:51:13.920507
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-25 11:51:13.941024	2010-11-25 11:51:13.941024
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-25 11:51:13.963964	2010-11-25 11:51:13.963964
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-25 11:51:13.542019	2010-11-25 11:51:13.567675
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-25 11:51:13.585226	2010-11-25 11:51:13.606005
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-11-25 11:51:13.647498	2010-11-25 11:51:13.862172
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-11-25 11:51:13.883829	2010-11-25 11:51:13.916254
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-11-25 11:51:13.93375	2010-11-25 11:51:13.956957
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted) FROM stdin;
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
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	level_one_certification_threshold	--- 0\n	2010-11-25 11:51:13.43661	2010-11-25 11:51:13.43661
2	level_two_certification_threshold	--- 0\n	2010-11-25 11:51:13.446224	2010-11-25 11:51:13.446224
3	level_three_certification_threshold	--- 0\n	2010-11-25 11:51:13.452291	2010-11-25 11:51:13.452291
4	default_payout_delay	--- 0\n	2010-11-25 11:51:13.458483	2010-11-25 11:51:13.458483
5	default_leads_per_page	--- 5\n	2010-11-25 11:51:13.469032	2010-11-25 11:51:13.469032
6	certification_level_1	--- 10\n	2010-11-25 11:51:13.478158	2010-11-25 11:51:13.478158
7	certification_level_2	--- 20\n	2010-11-25 11:51:13.485787	2010-11-25 11:51:13.485787
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
1	blazejek@gmail.com	211860700d19e6926f133ebb26e63200d8344b0067ecda33c029e175f7e3cf58f7249a09d5f38e02e186046bc6ff57ee27c2913bd0d6680c22ba3e3eb9e1f794	9dbE1xYY9Pgenwg3otFU	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 11:51:14.386953	2010-11-25 11:51:14.115868	\N	2010-11-25 11:51:14.116182	2010-11-25 11:51:14.38751	1	Ashtyn	Kirlin	1-851-804-5827 x214	admin1	Gardner Stravenue	New Wilburn	89338-7947	Wiltshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Ye97uN6Iy6rNlEDtqxevJNuuCHcr9PmtbjvyPvfRksidBnzxziNUDnJeJyyaXx	f	\N
2	buyer@gmail2.com	7c85b893911d0a4826b140d49d4e471171612f68769a551667836c07e4c69675a94d432749ef2d1906f729f3fb28851f97130e263e5c85931aed5e2bba14251a	mEDVvEgQqCKiZfSD7XVh	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 11:51:14.587266	2010-11-25 11:51:14.55389	\N	2010-11-25 11:51:14.554225	2010-11-25 11:51:14.587738	112	Grant	Greenfelder	1-582-458-1088 x4802	Lavon Koch	Rodolfo Islands	North Juanita	54154	Warwickshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	K6jLsH7GOLS4xMAdjUMsCk4M1lKeKoZ3Ef6nw14pgNcqa64cJ3Fjyfsfw8pq76	f	\N
3	agent@gmail2.com	d0ae7c7863549fd3f809f084e6ca93fda059cc7f289b942903419f72d465ddae86d9112058d11167b5de115499837b6baf50107631f26017ce608c4a1ba989b6	Wls7FFhy02cer-jSG-Bf	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 11:51:14.67304	2010-11-25 11:51:14.641642	\N	2010-11-25 11:51:14.641942	2010-11-25 11:51:14.673497	2	Wava	Marquardt	818-765-6509	Branson Feeney	Edna Mission	Thompsonshire	58814-5185	Rutland	3	\N	0	\N	\N	0	\N	\N	\N	\N	nbwAyXNsJDgOXgMt9W48bEysj5KGBniXgH5HE7uNucMXFJnPcQ2k2RfAguAbyu	f	\N
4	leaduser@gmail2.com	ff832cee733a0221057baeb73da160c6e33c2960a31820e01de1b47a4c7a02cdc40803c8d409a7c9fb96b79c90bfd52390c32242b400208827dacf5ce27bd93e	QnHEuR434W7blsAmn8sV	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 11:51:14.746451	2010-11-25 11:51:14.7142	\N	2010-11-25 11:51:14.714499	2010-11-25 11:51:14.746951	64	Nels	Mante	(010)654-0113 x940	Timmothy Wilkinson	Mona Road	South Emmett	78952	Cheshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	USdG8l20THWTxLefDMpyHuUhMOWBRScxWTOJvx40ajdsRNe75WhekQuTIwJm44	f	\N
\.


--
-- PostgreSQL database dump complete
--

