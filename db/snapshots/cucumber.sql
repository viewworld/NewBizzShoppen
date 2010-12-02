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
1	Test category 1	\N	2010-11-25 12:48:22.074845	2010-11-25 12:48:22.074845	\N	1	2	\N	0
2	Test category 2	\N	2010-11-25 12:48:22.099283	2010-11-25 12:48:22.099283	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-11-25 12:48:22.087522	2010-11-25 12:48:22.087522
2	2	en	\N	Test category 2	2010-11-25 12:48:22.104059	2010-11-25 12:48:22.104059
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-11-25 12:48:22.181236	2010-11-25 12:48:22.181236
2	United Kingdom	2010-11-25 12:48:22.194087	2010-11-25 12:48:22.194087
3	Wales	2010-11-25 12:48:22.830502	2010-11-25 12:48:22.830502
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-25 12:48:22.245508	2010-11-25 12:48:22.245508
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-25 12:48:22.263766	2010-11-25 12:48:22.263766
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-25 12:48:22.278805	2010-11-25 12:48:22.278805
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-25 12:48:22.294375	2010-11-25 12:48:22.294375
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-25 12:48:22.310764	2010-11-25 12:48:22.310764
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-25 12:48:22.326198	2010-11-25 12:48:22.326198
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-11-25 12:48:22.340926	2010-11-25 12:48:22.340926
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-11-25 12:48:22.355978	2010-11-25 12:48:22.355978
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-25 12:48:22.371053	2010-11-25 12:48:22.371053
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-25 12:48:22.38743	2010-11-25 12:48:22.38743
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-25 12:48:22.233877	2010-11-25 12:48:22.260099
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-25 12:48:22.273722	2010-11-25 12:48:22.290219
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-11-25 12:48:22.305902	2010-11-25 12:48:22.321885
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-11-25 12:48:22.336598	2010-11-25 12:48:22.352145
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-11-25 12:48:22.366682	2010-11-25 12:48:22.382506
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
1	level_one_certification_threshold	--- 0\n	2010-11-25 12:48:22.119922	2010-11-25 12:48:22.119922
2	level_two_certification_threshold	--- 0\n	2010-11-25 12:48:22.130678	2010-11-25 12:48:22.130678
3	level_three_certification_threshold	--- 0\n	2010-11-25 12:48:22.136359	2010-11-25 12:48:22.136359
4	default_payout_delay	--- 0\n	2010-11-25 12:48:22.142439	2010-11-25 12:48:22.142439
5	default_leads_per_page	--- 5\n	2010-11-25 12:48:22.149969	2010-11-25 12:48:22.149969
6	certification_level_1	--- 10\n	2010-11-25 12:48:22.157275	2010-11-25 12:48:22.157275
7	certification_level_2	--- 20\n	2010-11-25 12:48:22.163811	2010-11-25 12:48:22.163811
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
1	blazejek@gmail.com	b1ab0990c13eafca9d160a22a806f2a9490820300d1161af0726c04ef5039fd3f17d5deb1b76702b1260cc32757c3c6754afb860a35ca1362d3e9363379d02ae	puV_BDv6nxkoRZK3jKKj	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 12:48:22.70113	2010-11-25 12:48:22.436102	\N	2010-11-25 12:48:22.43644	2010-11-25 12:48:22.701905	1	Margaretta	Schuster	146-894-3797	admin1	Brakus Plaza	North Queen	17897	Dorset	1	\N	\N	\N	\N	0	\N	\N	\N	\N	N41DmBllAYGevjj6XKbuDZTbLZeHZRptxuG27ysF1hZKjgaJ7ycGJ0L3s9M6hO	f	\N
2	buyer@gmail2.com	f23e7fa4b6787b19b8b7e70e912564b232ccb51ef0e0c3c259d1d3509df45c0569ebcdd0f7c2131c6d9e0ff9d009a8c97595974937031471f6ee90fc71f31a91	r2Db334ZCw7QGDtuNomk	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 12:48:22.784844	2010-11-25 12:48:22.754406	\N	2010-11-25 12:48:22.754699	2010-11-25 12:48:22.785333	48	Wyman	Gleason	598-759-9430 x665	Mellie Raynor	Kuhlman Skyway	West Wilfrid	26945	Kent	1	\N	\N	\N	\N	0	\N	\N	\N	\N	ZBj6zRXGyyGcx6NMQMb95xbEh0Tj2tabFSKIkl0cjf2IvHHbEGTXCOQONoyuNM	f	\N
3	agent@gmail2.com	3e03fb1709c302e9485c3b58042b9a0dfdc1d5166f235c69a4c9c96b3266592c37ef686ff72b1ed8ec4242b49d56ec6d3d779fa1a7b639925ce29e81f1f60072	FGDIhbfBOKfNa37KmBKK	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 12:48:22.87465	2010-11-25 12:48:22.842224	\N	2010-11-25 12:48:22.842526	2010-11-25 12:48:22.875191	2	Lionel	Hintz	931.137.2858 x73631	Cletus Cruickshank	Kutch Hills	South Wilmertown	84338-8220	Merseyside	3	\N	0	\N	\N	0	\N	\N	\N	\N	7YkbaPAw2Q6x0uB5h4Cs35hnj7lOBoPq794Pca1gUHKkgxpkEpabrIvfCJurG9	f	\N
4	leaduser@gmail2.com	21049ee53d1f73a3948830e2c5372345599bd31f6a2dc92cebec7a8995208d7d71e831a7618cd04e1d7b8d344532466ea9647613111666767cdfacd6e7dfcad3	H-aQoyTvLwzXoxAr86uJ	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 12:48:22.954987	2010-11-25 12:48:22.919307	\N	2010-11-25 12:48:22.919603	2010-11-25 12:48:22.955429	64	Litzy	Dicki	(322)742-5259	Guiseppe O'Reilly	Schowalter Shore	Lake Karine	31356-7433	Bedfordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	u68WKq3sPqPN8RnmB5smGbrBQCUAS5xzr7SyiuoSppNJnEVcuKYskIANVHcT3m	f	\N
\.


--
-- PostgreSQL database dump complete
--

