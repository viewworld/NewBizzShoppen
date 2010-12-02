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

SELECT pg_catalog.setval('email_template_translations_id_seq', 14, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 7, true);


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

SELECT pg_catalog.setval('settings_id_seq', 8, true);


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

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug) FROM stdin;
1	Test category 1	\N	2010-12-02 09:56:11.417154	2010-12-02 09:56:11.417154	\N	1	2	\N	0	1-test-category-1
2	Test category 2	\N	2010-12-02 09:56:11.444937	2010-12-02 09:56:11.444937	\N	3	4	\N	0	2-test-category-2
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
1	1	en	\N	Test category 1	2010-12-02 09:56:11.425264	2010-12-02 09:56:11.425264
2	2	en	\N	Test category 2	2010-12-02 09:56:11.448066	2010-12-02 09:56:11.448066
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-02 09:56:11.48779	2010-12-02 09:56:11.48779
2	United Kingdom	2010-12-02 09:56:11.492623	2010-12-02 09:56:11.492623
3	Northern Ireland	2010-12-02 09:56:12.167033	2010-12-02 09:56:12.167033
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-02 09:56:11.60891	2010-12-02 09:56:11.60891
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-02 09:56:11.623068	2010-12-02 09:56:11.623068
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-02 09:56:11.633251	2010-12-02 09:56:11.633251
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-02 09:56:11.642386	2010-12-02 09:56:11.642386
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-02 09:56:11.651802	2010-12-02 09:56:11.651802
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-02 09:56:11.661013	2010-12-02 09:56:11.661013
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-02 09:56:11.670859	2010-12-02 09:56:11.670859
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-02 09:56:11.679964	2010-12-02 09:56:11.679964
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-02 09:56:11.68907	2010-12-02 09:56:11.68907
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-02 09:56:11.69815	2010-12-02 09:56:11.69815
11	6	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-02 09:56:11.707268	2010-12-02 09:56:11.707268
12	6	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-02 09:56:11.716269	2010-12-02 09:56:11.716269
13	7	en	Question	<p></p>	2010-12-02 09:56:11.725505	2010-12-02 09:56:11.725505
14	7	dk	[DK] Question	<p></p>	2010-12-02 09:56:11.734275	2010-12-02 09:56:11.734275
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-02 09:56:11.50893	2010-12-02 09:56:11.618297
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-02 09:56:11.629849	2010-12-02 09:56:11.639642
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-02 09:56:11.648365	2010-12-02 09:56:11.658272
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-02 09:56:11.667414	2010-12-02 09:56:11.677261
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-02 09:56:11.685858	2010-12-02 09:56:11.6954
6	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-02 09:56:11.704047	2010-12-02 09:56:11.713427
7	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-02 09:56:11.722239	2010-12-02 09:56:11.731561
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at) FROM stdin;
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
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	level_one_certification_threshold	--- 0\n	2010-12-02 09:56:11.460754	2010-12-02 09:56:11.460754
2	level_two_certification_threshold	--- 0\n	2010-12-02 09:56:11.466234	2010-12-02 09:56:11.466234
3	level_three_certification_threshold	--- 0\n	2010-12-02 09:56:11.46893	2010-12-02 09:56:11.46893
4	default_payout_delay	--- 0\n	2010-12-02 09:56:11.471505	2010-12-02 09:56:11.471505
5	default_leads_per_page	--- 5\n	2010-12-02 09:56:11.474312	2010-12-02 09:56:11.474312
6	certification_level_1	--- 10\n	2010-12-02 09:56:11.476913	2010-12-02 09:56:11.476913
7	certification_level_2	--- 20\n	2010-12-02 09:56:11.479456	2010-12-02 09:56:11.479456
8	contact_us_email	--- contact@nbs.fake.com\n	2010-12-02 09:56:11.482127	2010-12-02 09:56:11.482127
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter) FROM stdin;
1	blazejek@gmail.com	2c407c089390a30ccd13860ff0e3d6ddea6843deaf90935a16f695ed826e9ff4ca822f0f2b8a676b912ad7e9cfd411e6b0fca4566dbe436f78be0cff511696aa	NKeecKNnFm-CzxjjZ08M	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-02 09:56:12.081838	2010-12-02 09:56:11.770686	\N	2010-12-02 09:56:11.770923	2010-12-02 09:56:12.082148	1	Aliyah	Hudson	469.269.9639 x686	admin1	Champlin Avenue	Port Lizzieville	30976-6473	Rutland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	8WsONpz0nERIhypSNK19vClbVvKf6EboYEcSZacdRzLGnrIPPC72LvA5XcT1k3	f	\N	0	0	0	0	0
2	buyer@gmail2.com	a0824be48d96bfbc44d7fd0214b49a2286196370cb82c73a8a6024d1dc9e513e7dd836b7ae9569e6b35d6ebadddcf701755b864e66c121e5b9af8bcd79f75f67	NMfHojOD9ZfWHwlNyzFg	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-02 09:56:12.13936	2010-12-02 09:56:12.113102	\N	2010-12-02 09:56:12.113353	2010-12-02 09:56:12.139657	48	Francesco	Daugherty	(945)975-2679	Lisa Flatley Sr.	Marvin Motorway	Emieside	55993-3793	Durham	1	\N	\N	\N	\N	0	\N	\N	\N	\N	CkuJAODKVq2NwjtbDYNTRcHgUkBuSqhSkoli45pecHtVxWmzr9VarpWUG9klAl	f	\N	0	0	0	0	0
3	agent@gmail2.com	210a1e9d1edbbd3d4fb41477405a448b69433b7cfe5cd02c590c1d6f0b3eabb56ed0f4866c7daf1dbcfe3308bb5fc8744cec88a7057a3e924eb8b57ac260ee2e	ctVFvWQJ6ZfAIlDRPo26	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-02 09:56:12.197711	2010-12-02 09:56:12.173407	\N	2010-12-02 09:56:12.173636	2010-12-02 09:56:12.197997	2	Noemie	Boyle	871-117-9163 x1365	Emiliano Jacobi	Earl Street	Nicolasborough	27501-1304	Hampshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	0NrN7zRb4rlQkBurX10LzKd5O9egmyNHE7MZ3RX2yxEkFI1C7jxTcFCjEPDT5C	f	\N	0	0	0	0	0
4	leaduser@gmail2.com	a3f249a727c8511d0238f36f5970fe64e77585e23a3d87e8ff44a58293c7a38f63708a07d51fec221d9a96c9fa1ae14d6c1a2279b903757d075ea62278032241	frbx-ruh3xNsfuh10Fya	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-02 09:56:12.252576	2010-12-02 09:56:12.228422	\N	2010-12-02 09:56:12.228645	2010-12-02 09:56:12.252871	64	Mafalda	Carter	037.466.4450 x343	Litzy Nitzsche	Powlowski Pine	South Mosesview	57841-9571	Gwynedd County	1	\N	\N	\N	\N	0	\N	\N	\N	\N	1xZcaPvtkbuJK9BBkUrmvdMahMi17qyxgYKlnYvISmPDu42tL3psCzdALSaLGz	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

