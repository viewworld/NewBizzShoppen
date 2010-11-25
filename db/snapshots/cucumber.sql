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
1	Test category 1	\N	2010-11-25 09:16:07.55842	2010-11-25 09:16:07.55842	\N	1	2	\N	0
2	Test category 2	\N	2010-11-25 09:16:07.574638	2010-11-25 09:16:07.574638	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-11-25 09:16:07.567109	2010-11-25 09:16:07.567109
2	2	en	\N	Test category 2	2010-11-25 09:16:07.577625	2010-11-25 09:16:07.577625
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-11-25 09:16:07.609497	2010-11-25 09:16:07.609497
2	United Kingdom	2010-11-25 09:16:07.614203	2010-11-25 09:16:07.614203
3	Northern Ireland	2010-11-25 09:16:08.244281	2010-11-25 09:16:08.244281
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-25 09:16:07.637776	2010-11-25 09:16:07.637776
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-25 09:16:07.649993	2010-11-25 09:16:07.649993
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-25 09:16:07.659271	2010-11-25 09:16:07.659271
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-25 09:16:07.668399	2010-11-25 09:16:07.668399
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-25 09:16:07.677584	2010-11-25 09:16:07.677584
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-25 09:16:07.68695	2010-11-25 09:16:07.68695
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-11-25 09:16:07.696523	2010-11-25 09:16:07.696523
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-11-25 09:16:07.706001	2010-11-25 09:16:07.706001
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-25 09:16:07.715133	2010-11-25 09:16:07.715133
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-25 09:16:07.72423	2010-11-25 09:16:07.72423
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-25 09:16:07.629757	2010-11-25 09:16:07.647054
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-25 09:16:07.655926	2010-11-25 09:16:07.665583
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-11-25 09:16:07.674302	2010-11-25 09:16:07.684122
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-11-25 09:16:07.692888	2010-11-25 09:16:07.70316
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-11-25 09:16:07.711783	2010-11-25 09:16:07.721346
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
1	level_one_certification_threshold	--- 0\n	2010-11-25 09:16:07.585901	2010-11-25 09:16:07.585901
2	level_two_certification_threshold	--- 0\n	2010-11-25 09:16:07.590928	2010-11-25 09:16:07.590928
3	level_three_certification_threshold	--- 0\n	2010-11-25 09:16:07.593572	2010-11-25 09:16:07.593572
4	default_payout_delay	--- 0\n	2010-11-25 09:16:07.596196	2010-11-25 09:16:07.596196
5	default_leads_per_page	--- 5\n	2010-11-25 09:16:07.598782	2010-11-25 09:16:07.598782
6	certification_level_1	--- 10\n	2010-11-25 09:16:07.601494	2010-11-25 09:16:07.601494
7	certification_level_2	--- 20\n	2010-11-25 09:16:07.604023	2010-11-25 09:16:07.604023
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
1	blazejek@gmail.com	e83ed11652beaa53bf06b1192b20919c196463453d6c8497110716a91fce79c7b4bb92d7005d1e2a9f1fbb0926632e56ba1d05ee9a68d1906365d60a35125eae	rwfORN7wIhj1_XTDLSoo	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 09:16:08.03554	2010-11-25 09:16:07.850335	\N	2010-11-25 09:16:07.850576	2010-11-25 09:16:08.035842	1	Gillian	Fritsch	577.400.2238	admin1	Feest Roads	O'Harachester	64099	Clwyd	1	\N	\N	\N	\N	0	\N	\N	\N	\N	56NEc2vwsBbd9V5rYZuqyxCA6iJz563yRNJHWK6mdAHMiQwD0skDsNpJ5nkYU5	f	\N
2	buyer@gmail2.com	beae8d14f60121e072bbee1cfeba3c35874908c92bcdab2fce08e0a4189b8da8727ed64147936cc95d0b3ce2dc89a59515f253a525326db97b3ff49ec675f238	KGwN5G3o4Vw4enc7oOwL	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 09:16:08.213264	2010-11-25 09:16:08.189155	\N	2010-11-25 09:16:08.189387	2010-11-25 09:16:08.213569	112	Augustus	McKenzie	919.275.9613 x3568	Mrs. Dedric Konopelski	Streich Curve	Declanfurt	01221	Buckinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	SGMHxpjMu7HPcxUnWIQO1hfadYavTUoo3EUtR5hzHJTNfOIUK7lNyygPK2H1aR	f	\N
3	agent@gmail2.com	c39c5fe07bbf181c5cebcd281f4146c8bbf8a16f7eee2e8858a4249b41a602084fbd8f462b5f944c3cac2beb055764cb3c5b281e4685834b2f695db767b9edc2	lPhL4360-x8D11HmSb1n	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 09:16:08.274937	2010-11-25 09:16:08.251141	\N	2010-11-25 09:16:08.251364	2010-11-25 09:16:08.275239	2	Krystina	Graham	1-376-434-7965 x6955	Maverick Keebler	Schmidt Tunnel	West Hank	25333-2407	Gloucestershire	3	\N	0	\N	\N	0	\N	\N	\N	\N	afQqg8HadFCJWm04Cl1BcwsFd68fvYRIw1phaih6EejRz1SRQ9maPBiw2TZaEi	f	\N
4	leaduser@gmail2.com	d164d75b806e54b48ff91e4e1551db65d34eb44a01759d454fda9c3d424560c0cfc9331189ad7e39f7cc722fb0795c300ecc448eb8ba7449fb7ec3c6423621df	ZkhxtYKPT3vaYAZd9PiY	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-25 09:16:08.327557	2010-11-25 09:16:08.303682	\N	2010-11-25 09:16:08.303903	2010-11-25 09:16:08.327874	64	Mathias	Fritsch	(517)425-1247 x852	Ms. Margaret Veum	O'Conner Mountains	West Zackary	81210	Mid Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	ksUUSo1xZUEQ8sbApaQhSiUrf6szT0M5anefQlCDi8lkWMDThN9jAVUJ7zo0Hd	f	\N
\.


--
-- PostgreSQL database dump complete
--

