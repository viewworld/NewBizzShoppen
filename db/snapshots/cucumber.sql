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
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('addresses_id_seq', 11, true);


--
-- Name: article_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('article_translations_id_seq', 24, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 12, true);


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('assets_id_seq', 1, false);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('bank_accounts_id_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('categories_id_seq', 8, true);


--
-- Name: category_agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_agents_id_seq', 1, false);


--
-- Name: category_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_customers_id_seq', 1, false);


--
-- Name: category_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_interests_id_seq', 1, false);


--
-- Name: category_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_translations_id_seq', 11, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('countries_id_seq', 2, true);


--
-- Name: country_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_interests_id_seq', 1, false);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('currencies_id_seq', 25, true);


--
-- Name: email_template_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_template_translations_id_seq', 18, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 9, true);


--
-- Name: invoice_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('invoice_lines_id_seq', 1, false);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('invoices_id_seq', 1, false);


--
-- Name: lead_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_purchases_id_seq', 1, false);


--
-- Name: lead_template_field_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_field_translations_id_seq', 1, false);


--
-- Name: lead_template_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_fields_id_seq', 1, false);


--
-- Name: lead_template_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_translations_id_seq', 1, false);


--
-- Name: lead_template_value_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_value_translations_id_seq', 1, false);


--
-- Name: lead_template_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_values_id_seq', 1, false);


--
-- Name: lead_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_templates_id_seq', 1, false);


--
-- Name: lead_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_translations_id_seq', 11, true);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('leads_id_seq', 11, true);


--
-- Name: payment_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('payment_notifications_id_seq', 1, false);


--
-- Name: payment_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('payment_transactions_id_seq', 1, false);


--
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sellers_id_seq', 1, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('settings_id_seq', 10, true);


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

SELECT pg_catalog.setval('users_id_seq', 10, true);


--
-- Name: vat_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vat_rates_id_seq', 1, false);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY addresses (id, address_line_1, address_line_2, address_line_3, zip_code, country_id, addressable_type, addressable_id, created_at, updated_at) FROM stdin;
1	Caleb Knolls	Fritschburgh	Tayside	31144	1	BankAccount	1	2011-02-21 09:03:54.111475	2011-02-21 09:03:54.128303
2	Kurtis Forest	East Paytonmouth	West Midlands	75136-9381	1	Seller	1	2011-02-21 09:03:54.139242	2011-02-21 09:03:54.150933
3	Courtney Crest	North Mollie	Derbyshire	15472-3341	1	User::Admin	1	2011-02-21 09:03:54.461088	2011-02-21 09:03:54.716311
4	Joshua Stream	Bahringermouth	Suffolk	47802	1	User::Agent	2	2011-02-21 09:03:54.926578	2011-02-21 09:03:54.958532
5	Shea Wall	North Dashawnton	Central	67298-6519	1	User::Admin	3	2011-02-21 09:03:55.81112	2011-02-21 09:03:55.841032
6	Buford Wall	Jadeburgh	Highlands and Islands	40498-7361	1	User::Customer	4	2011-02-21 09:03:55.881812	2011-02-21 09:03:55.913138
\.


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-21 09:03:56.248417	2011-02-21 09:03:56.248417
2	1	en	About us	About us	2011-02-21 09:03:56.280272	2011-02-21 09:03:56.280272
3	2	dk	Privacy	Privacy	2011-02-21 09:03:56.311249	2011-02-21 09:03:56.311249
4	2	en	Privacy	Privacy	2011-02-21 09:03:56.322677	2011-02-21 09:03:56.322677
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-21 09:03:56.354195	2011-02-21 09:03:56.354195
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-21 09:03:56.36633	2011-02-21 09:03:56.36633
7	4	dk	Blurb sign up	Blurb sign up	2011-02-21 09:03:56.401204	2011-02-21 09:03:56.401204
8	4	en	Blurb sign up	Blurb sign up	2011-02-21 09:03:56.412561	2011-02-21 09:03:56.412561
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-21 09:03:56.584468	2011-02-21 09:03:56.584468
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-21 09:03:56.596341	2011-02-21 09:03:56.596341
11	6	dk	Blurb agent home	Blurb agent home	2011-02-21 09:03:56.625919	2011-02-21 09:03:56.625919
12	6	en	Blurb agent home	Blurb agent home	2011-02-21 09:03:56.637546	2011-02-21 09:03:56.637546
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-21 09:03:56.665962	2011-02-21 09:03:56.665962
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-21 09:03:56.677523	2011-02-21 09:03:56.677523
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-21 09:03:56.70524	2011-02-21 09:03:56.70524
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-21 09:03:56.716699	2011-02-21 09:03:56.716699
17	9	dk	Blurb currencies	Blurb currencies	2011-02-21 09:03:56.744317	2011-02-21 09:03:56.744317
18	9	en	Blurb currencies	Blurb currencies	2011-02-21 09:03:56.755267	2011-02-21 09:03:56.755267
19	10	dk	Blurb category home	Blurb category home	2011-02-21 09:03:56.783614	2011-02-21 09:03:56.783614
20	10	en	Blurb category home	Blurb category home	2011-02-21 09:03:56.795293	2011-02-21 09:03:56.795293
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-21 09:03:56.82473	2011-02-21 09:03:56.82473
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-21 09:03:56.836833	2011-02-21 09:03:56.836833
23	12	dk	Reset password	Reset password	2011-02-21 09:03:56.873309	2011-02-21 09:03:56.873309
24	12	en	Reset password	Reset password	2011-02-21 09:03:56.885195	2011-02-21 09:03:56.885195
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id, views_count) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-21 09:03:56.239617	2011-02-21 09:03:56.283012	about_us	t	2011-02-21 09:03:56.28294	\N	\N	0
2	Article::Cms::MainPageArticle	2011-02-21 09:03:56.307159	2011-02-21 09:03:56.325466	privacy	t	2011-02-21 09:03:56.325396	\N	\N	0
3	Article::Cms::MainPageArticle	2011-02-21 09:03:56.349976	2011-02-21 09:03:56.36914	terms_conditions	t	2011-02-21 09:03:56.369066	\N	\N	0
4	Article::Cms::InterfaceContentText	2011-02-21 09:03:56.395513	2011-02-21 09:03:56.415373	blurb_sign_up	t	2011-02-21 09:03:56.4153	\N	\N	0
5	Article::Cms::InterfaceContentText	2011-02-21 09:03:56.580242	2011-02-21 09:03:56.599842	blurb_buyer_home	t	2011-02-21 09:03:56.599724	\N	\N	0
6	Article::Cms::InterfaceContentText	2011-02-21 09:03:56.621629	2011-02-21 09:03:56.640267	blurb_agent_home	t	2011-02-21 09:03:56.640194	\N	\N	0
7	Article::Cms::InterfaceContentText	2011-02-21 09:03:56.661888	2011-02-21 09:03:56.680294	blurb_purchase_manager_home	t	2011-02-21 09:03:56.680222	\N	\N	0
8	Article::Cms::InterfaceContentText	2011-02-21 09:03:56.701254	2011-02-21 09:03:56.719451	blurb_start_page_role_selection	t	2011-02-21 09:03:56.71938	\N	\N	0
9	Article::Cms::InterfaceContentText	2011-02-21 09:03:56.740002	2011-02-21 09:03:56.758181	blurb_currencies	t	2011-02-21 09:03:56.758108	\N	\N	0
10	Article::Cms::InterfaceContentText	2011-02-21 09:03:56.779436	2011-02-21 09:03:56.798241	blurb_category_home	t	2011-02-21 09:03:56.798165	\N	\N	0
11	Article::Cms::InterfaceContentText	2011-02-21 09:03:56.820451	2011-02-21 09:03:56.839744	blurb_leads_listing	t	2011-02-21 09:03:56.839667	\N	\N	0
12	Article::Cms::HelpPopup	2011-02-21 09:03:56.867317	2011-02-21 09:03:56.888037	reset_password	t	2011-02-21 09:03:56.887962	\N	\N	0
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY bank_accounts (id, bank_name, iban_no, local_bank_number, swift, payment_conditions, country_default, created_at, updated_at, global_default) FROM stdin;
1	Default Bank	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-21 09:03:54.124509	2011-02-21 09:03:54.124509	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count, is_customer_unique, is_agent_unique) FROM stdin;
1	Electronics	Adipisci eius odit unde.Nam velit nesciunt ducimus adipisci dolores ad.	2011-02-21 09:03:54.787449	2011-02-21 09:03:54.787449	\N	1	2	\N	0	electronics	f	0	f	f
2	Leisure	Rerum atque ut est consequatur deleniti.Facere qui recusandae rerum nemo.	2011-02-21 09:03:54.834677	2011-02-21 09:03:54.834677	\N	3	4	\N	0	leisure	f	0	f	f
3	Business	Et autem hic consequuntur omnis libero eligendi ea quam.Dolorem quae fugit cum possimus.	2011-02-21 09:03:54.870365	2011-02-21 09:03:55.749089	\N	5	6	\N	7	business	f	7	f	f
\.


--
-- Data for Name: category_agents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY category_agents (id, category_id, user_id) FROM stdin;
\.


--
-- Data for Name: category_customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY category_customers (id, category_id, user_id) FROM stdin;
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
1	1	en	Adipisci eius odit unde.Nam velit nesciunt ducimus adipisci dolores ad.	Electronics	2011-02-21 09:03:54.796675	2011-02-21 09:03:54.796675
2	1	dk	\N	Electronics	2011-02-21 09:03:54.824289	2011-02-21 09:03:54.824289
3	2	en	Rerum atque ut est consequatur deleniti.Facere qui recusandae rerum nemo.	Leisure	2011-02-21 09:03:54.839182	2011-02-21 09:03:54.839182
4	2	dk	\N	Leisure	2011-02-21 09:03:54.860228	2011-02-21 09:03:54.860228
5	3	en	Et autem hic consequuntur omnis libero eligendi ea quam.Dolorem quae fugit cum possimus.	Business	2011-02-21 09:03:54.874631	2011-02-21 09:03:54.874631
6	3	dk	\N	Business	2011-02-21 09:03:54.894732	2011-02-21 09:03:54.894732
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-21 09:03:54.093637	2011-02-21 09:03:54.093637
2	United Kingdom	2011-02-21 09:03:54.100778	2011-02-21 09:03:54.100778
\.


--
-- Data for Name: country_interests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY country_interests (id, country_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY currencies (id, name, symbol, format, active, created_at, updated_at) FROM stdin;
1	AUD	A &#36;	%u%n	f	2011-02-21 09:03:54.732072	2011-02-21 09:03:54.732072
2	CAD	C &#36;	%u%n	f	2011-02-21 09:03:54.736459	2011-02-21 09:03:54.736459
3	EUR	&euro;	%u%n	t	2011-02-21 09:03:54.738266	2011-02-21 09:03:54.738266
4	GBP	&pound;	%u%n	f	2011-02-21 09:03:54.739948	2011-02-21 09:03:54.739948
5	JPY	&yen;	%u%n	f	2011-02-21 09:03:54.741653	2011-02-21 09:03:54.741653
6	USD	&#36;	%u%n	f	2011-02-21 09:03:54.743309	2011-02-21 09:03:54.743309
7	NZD	&#36;	%u%n	f	2011-02-21 09:03:54.744947	2011-02-21 09:03:54.744947
8	CHF	CHF	%u %n	f	2011-02-21 09:03:54.746585	2011-02-21 09:03:54.746585
9	HKD	&#36;	%u%n	f	2011-02-21 09:03:54.748194	2011-02-21 09:03:54.748194
10	SGD	&#36;	%u%n	f	2011-02-21 09:03:54.749974	2011-02-21 09:03:54.749974
11	SEK	SEK	%u %n	f	2011-02-21 09:03:54.751633	2011-02-21 09:03:54.751633
12	DKK	DKK	%u %n	t	2011-02-21 09:03:54.753349	2011-02-21 09:03:54.753349
13	PLN	PLN	%u %n	t	2011-02-21 09:03:54.755071	2011-02-21 09:03:54.755071
14	NOK	NOK	%u %n	f	2011-02-21 09:03:54.756731	2011-02-21 09:03:54.756731
15	HUF	HUF	%u %n	f	2011-02-21 09:03:54.758366	2011-02-21 09:03:54.758366
16	CZK	CZK	%u %n	f	2011-02-21 09:03:54.760137	2011-02-21 09:03:54.760137
17	ILS	ILS	%u %n	f	2011-02-21 09:03:54.761748	2011-02-21 09:03:54.761748
18	MXN	MXN	%u %n	f	2011-02-21 09:03:54.76342	2011-02-21 09:03:54.76342
19	PHP	PHP	%u %n	f	2011-02-21 09:03:54.765082	2011-02-21 09:03:54.765082
20	TWD	TWD	%u %n	f	2011-02-21 09:03:54.766804	2011-02-21 09:03:54.766804
21	THB	THB	%u %n	f	2011-02-21 09:03:54.768593	2011-02-21 09:03:54.768593
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-21 09:03:54.178217	2011-02-21 09:03:54.178217
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-21 09:03:54.192704	2011-02-21 09:03:54.192704
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-21 09:03:54.204983	2011-02-21 09:03:54.204983
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-21 09:03:54.216776	2011-02-21 09:03:54.216776
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-21 09:03:54.229681	2011-02-21 09:03:54.229681
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-21 09:03:54.24176	2011-02-21 09:03:54.24176
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-02-21 09:03:54.253918	2011-02-21 09:03:54.253918
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-02-21 09:03:54.266338	2011-02-21 09:03:54.266338
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-21 09:03:54.278986	2011-02-21 09:03:54.278986
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-21 09:03:54.291276	2011-02-21 09:03:54.291276
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-21 09:03:54.304101	2011-02-21 09:03:54.304101
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-21 09:03:54.316459	2011-02-21 09:03:54.316459
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-21 09:03:54.329749	2011-02-21 09:03:54.329749
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-21 09:03:54.342264	2011-02-21 09:03:54.342264
15	8	en	Question	<p></p>	2011-02-21 09:03:54.35497	2011-02-21 09:03:54.35497
16	8	dk	[DK] Question	<p></p>	2011-02-21 09:03:54.367672	2011-02-21 09:03:54.367672
17	9	en	Invoice	<p></p>	2011-02-21 09:03:54.38029	2011-02-21 09:03:54.38029
18	9	dk	[DK] Invoice	<p></p>	2011-02-21 09:03:54.392608	2011-02-21 09:03:54.392608
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-21 09:03:54.169464	2011-02-21 09:03:54.188689
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-21 09:03:54.200523	2011-02-21 09:03:54.212741
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-21 09:03:54.224782	2011-02-21 09:03:54.237639
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-21 09:03:54.249538	2011-02-21 09:03:54.262133
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-21 09:03:54.27452	2011-02-21 09:03:54.287075
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-21 09:03:54.299507	2011-02-21 09:03:54.312254
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-21 09:03:54.32471	2011-02-21 09:03:54.337977
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-21 09:03:54.350371	2011-02-21 09:03:54.363428
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-21 09:03:54.375779	2011-02-21 09:03:54.388352
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at, ean_number, details, bank_account_id, seller_id) FROM stdin;
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason, accessible_from) FROM stdin;
\.


--
-- Data for Name: lead_template_field_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_field_translations (id, lead_template_field_id, locale, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_template_fields; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_fields (id, lead_template_id, name, field_type, is_hidden, created_at, updated_at, is_mandatory) FROM stdin;
\.


--
-- Data for Name: lead_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_translations (id, lead_template_id, locale, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_template_value_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_value_translations (id, lead_template_value_id, locale, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_template_values; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_values (id, lead_template_field_id, lead_id, field_type, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_templates (id, category_id, name, is_active, is_mandatory, creator_id, creator_type, created_at, updated_at, is_global) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, header, hidden_description, created_at, updated_at) FROM stdin;
1	1	dk	Molestiae enim qui excepturi nisi dolore quibusdam.Maiores dolorem et veniam est.	Big deal on printers	Voluptate similique dicta id facilis cum.Nam rem dicta ad aliquid.	2011-02-21 09:03:55.044863	2011-02-21 09:03:55.044863
2	2	dk	Omnis tenetur quas aliquam ea.Minima totam natus qui.	Drills required	Voluptatem ut ut excepturi molestiae.Incidunt quaerat ea odio dolore.	2011-02-21 09:03:55.259352	2011-02-21 09:03:55.259352
3	3	dk	Corporis ut sunt ab assumenda porro odit.Est voluptates natus quas magnam.	Need assistance in selling a car	Assumenda fugiat iusto velit ipsum.Eius nemo dolorem deserunt officiis eos.	2011-02-21 09:03:55.329831	2011-02-21 09:03:55.329831
4	4	dk	Ratione et voluptate eos et architecto quo illum.Atque eos enim nostrum omnis aut ut.	Ipod shipment	Necessitatibus sunt nobis quis rerum consequatur error reprehenderit.Excepturi ut repellendus dolorem placeat iure perspiciatis eaque.	2011-02-21 09:03:55.400156	2011-02-21 09:03:55.400156
5	5	dk	Eligendi corporis autem est maiores modi quia et sit.Ipsam perspiciatis ea consectetur.	Trip to amazonia - looking for offer	Cupiditate sunt porro nostrum maiores quidem.Molestiae libero incidunt perspiciatis blanditiis eligendi aspernatur sit occaecati.	2011-02-21 09:03:55.469345	2011-02-21 09:03:55.469345
6	6	dk	Id reprehenderit necessitatibus dolore nostrum.Voluptatem eos impedit ad minus eveniet tempore occaecati.	LCD - Huge amounts	Vel nemo voluptates dolore nulla voluptas perferendis.Nobis omnis sed est consequatur rem totam.	2011-02-21 09:03:55.684549	2011-02-21 09:03:55.684549
7	7	dk	Exercitationem et quisquam id et qui.Velit et eligendi ea maiores.	GPS receivers required	Aut nostrum quia quo quas dolor.Quia sit iure veritatis neque ipsam veniam modi facilis.	2011-02-21 09:03:55.755978	2011-02-21 09:03:55.755978
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Molestiae enim qui excepturi nisi dolore quibusdam.Maiores dolorem et veniam est.	Voluptate similique dicta id facilis cum.Nam rem dicta ad aliquid.	2	User::Agent	0	606.0	857.0	1	Schadendouglas	August Batz	(747)810-2916 x008	elbert_lemke@littel.us	2011-02-21 09:03:55.004506	2011-02-21 09:03:55.004506	2011-02-26	Jayce129827903492424 Klein	1	t	\N	0	0	f	f	-1	3	2011-02-21 09:03:55.013043	\N	\N	15225 Arch Well	\N	\N	Weberland	75120	Nottinghamshire	\N	\N	\N	\N	t
2	Drills required	3	Omnis tenetur quas aliquam ea.Minima totam natus qui.	Voluptatem ut ut excepturi molestiae.Incidunt quaerat ea odio dolore.	2	User::Agent	0	963.0	982.0	1	Mante	Keara Abernathy	271-961-1415 x11004	theodore@murphy.name	2011-02-21 09:03:55.226658	2011-02-21 09:03:55.226658	2011-02-26	Jayce129827903492424 Klein	1	t	\N	0	0	f	f	-1	3	2011-02-21 09:03:55.232541	\N	\N	41072 Wunsch Curve	\N	\N	Port Ona	12099	County Antrim	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Corporis ut sunt ab assumenda porro odit.Est voluptates natus quas magnam.	Assumenda fugiat iusto velit ipsum.Eius nemo dolorem deserunt officiis eos.	2	User::Agent	0	813.0	120.0	1	Smitham	Shanelle Altenwerth	389-433-4039	mathew.boyer@strackejohns.us	2011-02-21 09:03:55.298081	2011-02-21 09:03:55.298081	2011-02-26	Jayce129827903492424 Klein	1	t	\N	0	0	f	f	-1	3	2011-02-21 09:03:55.30384	\N	\N	316 Lebsack Divide	\N	\N	Kuhlmanland	74873	Gwynedd County	\N	\N	\N	\N	t
4	Ipod shipment	3	Ratione et voluptate eos et architecto quo illum.Atque eos enim nostrum omnis aut ut.	Necessitatibus sunt nobis quis rerum consequatur error reprehenderit.Excepturi ut repellendus dolorem placeat iure perspiciatis eaque.	2	User::Agent	0	429.0	979.0	1	Hermann	Zaria Hegmann	1-200-941-8877	emelia.hettinger@hilll.name	2011-02-21 09:03:55.368669	2011-02-21 09:03:55.368669	2011-02-26	Jayce129827903492424 Klein	1	t	\N	0	0	f	f	-1	3	2011-02-21 09:03:55.374443	\N	\N	1389 Batz Parks	\N	\N	Emmerichport	13647	Lincolnshire	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Eligendi corporis autem est maiores modi quia et sit.Ipsam perspiciatis ea consectetur.	Cupiditate sunt porro nostrum maiores quidem.Molestiae libero incidunt perspiciatis blanditiis eligendi aspernatur sit occaecati.	2	User::Agent	0	567.0	530.0	1	Kochcrooks	Schuyler Ward	(520)771-0479	deontae_lowe@wymanschiller.uk	2011-02-21 09:03:55.438339	2011-02-21 09:03:55.438339	2011-02-26	Jayce129827903492424 Klein	1	t	\N	0	0	f	f	-1	3	2011-02-21 09:03:55.444003	\N	\N	875 Ondricka Ramp	\N	\N	Gleasonview	07778	Cornwall	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Id reprehenderit necessitatibus dolore nostrum.Voluptatem eos impedit ad minus eveniet tempore occaecati.	Vel nemo voluptates dolore nulla voluptas perferendis.Nobis omnis sed est consequatur rem totam.	2	User::Agent	0	319.0	63.0	1	Ondricka	Leda Conn	164-123-7575 x3418	amari@mullermedhurst.name	2011-02-21 09:03:55.507282	2011-02-21 09:03:55.507282	2011-02-26	Jayce129827903492424 Klein	1	t	\N	0	0	f	f	-1	3	2011-02-21 09:03:55.513187	\N	\N	354 Prosacco Course	\N	\N	Schroederstad	25839	Gwent	\N	\N	\N	\N	t
7	GPS receivers required	3	Exercitationem et quisquam id et qui.Velit et eligendi ea maiores.	Aut nostrum quia quo quas dolor.Quia sit iure veritatis neque ipsam veniam modi facilis.	2	User::Agent	0	644.0	486.0	1	Bartoletti	Zachary Fisher	900-103-7318 x0239	sean@strosin.ca	2011-02-21 09:03:55.723728	2011-02-21 09:03:55.723728	2011-02-26	Jayce129827903492424 Klein	1	t	\N	0	0	f	f	-1	3	2011-02-21 09:03:55.729415	\N	\N	6976 Rau Common	\N	\N	Wilburnstad	12436	Essex	\N	\N	\N	\N	t
\.


--
-- Data for Name: payment_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY payment_notifications (id, params, buyer_id, status, transaction_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: payment_transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY payment_transactions (id, invoice_id, payment_notification_id, type, paid_at, amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sellers (id, name, vat_no, first_name, last_name, "default", created_at, updated_at) FROM stdin;
1	Default Seller	111	Change	Change	t	2011-02-21 09:03:54.147675	2011-02-21 09:03:54.147675
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2011-02-21 09:03:53.922948	2011-02-21 09:03:53.922948
2	default_leads_per_page	--- 5\n	2011-02-21 09:03:53.928864	2011-02-21 09:03:53.928864
3	certification_level_1	--- 10\n	2011-02-21 09:03:54.068727	2011-02-21 09:03:54.068727
4	certification_level_2	--- 20\n	2011-02-21 09:03:54.071927	2011-02-21 09:03:54.071927
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-21 09:03:54.074105	2011-02-21 09:03:54.074105
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-21 09:03:54.076261	2011-02-21 09:03:54.076261
7	invoicing_seller_name	--- Fairleads\n	2011-02-21 09:03:54.078415	2011-02-21 09:03:54.078415
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-21 09:03:54.080584	2011-02-21 09:03:54.080584
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-21 09:03:54.082733	2011-02-21 09:03:54.082733
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-21 09:03:54.084886	2011-02-21 09:03:54.084886
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers, vat_number, not_charge_vat, bank_account_id, category_id, all_deal_values_enabled) FROM stdin;
1	blazejek@gmail.com	2f6757d332dc48958f26c781e6575049506d47236274d53053cb44f2213718b2609f3064dde38774f3877c9a8db7a30a66075fbb669470b538530c42910715e5	oK2THStMNN5QnKk98cKQ	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-21 09:03:54.719763	2011-02-21 09:03:54.475834	\N	2011-02-21 09:03:54.480269	2011-02-21 09:03:54.720063	1	Garnet	Padberg	001.997.6402	root	\N	\N	\N	\N	0	\N	\N	\N	\N	2hYSTwsxbwTZWq29NFVNq1SmoFH3G8IjcTQ5YmxZYBVh1GYUqyeJwp2dIY7Zql	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	33536556998b6d74a73cd05b1b74d42b1a12f80b2381859ce7e5d158e83572eee69608bcd7e40e58c9b13d86b1bb25053c28825908de86c3fd849efd06c1a31d	3FRN5FtjaaNG78WTwz0z	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-21 09:03:54.962108	2011-02-21 09:03:54.934325	\N	2011-02-21 09:03:54.938865	2011-02-21 09:03:54.962399	2	Jayce129827903492424	Klein	059.295.9737 x2642	Jaunita Eichmann129827903492397	\N	0	\N	\N	0	\N	\N	\N	\N	U41nIRB8usKylF92yTw1dQwUIcXjgJwYJPxsyTLPkHFgeM8c7iigGZ7LyIohny	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	ddadaf9ea7dff51ad3b2b50d670f135adec0d9116e3128b4f8c9ca083f698c0a3cf470c47ac5b60a77c4a63b0c5e0eb83cc6378dc7741e46099a42186de1a8cf	3pjdSx8uv0gXd2fsihTf	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-21 09:03:55.844324	2011-02-21 09:03:55.818352	\N	2011-02-21 09:03:55.823069	2011-02-21 09:03:55.844663	1	Chaim	Monahan	251.062.5417	Desmond Gleichner129827903580874	\N	\N	\N	\N	0	\N	\N	\N	\N	r5HBcCLkDV7Ik8h1AFoLBFQqkmT6TwhmbafGbXIS5w590mEJbgXBf82ZwTrWzT	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	564911ad876320e25d30c5369555c29ea88a57670661f3822fee5627739e1b40b0ed0fb8de130ea2c418335deb8798495bab3f8db7654d7411f1577ba9d0bd45	ThqNQjDCS7t_NdQ2nCKT	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-21 09:03:55.916616	2011-02-21 09:03:55.889191	\N	2011-02-21 09:03:55.893523	2011-02-21 09:03:55.916895	48	Jameson	Crooks	425-478-0390	Amie Ondricka129827903587901	\N	\N	\N	\N	0	\N	\N	\N	\N	br719SbEB1NJJkAHxmmA6ohuHu2mzQK4kqHFf5eh4RFcJreuHJ142KMaZhkdKg	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	9bd373a0ffd8fa2e02c2c938b572bb9b9245e02e3dc81bd54af804f73827ec89927b03cf132ed1a59aff375fa8884728774a45b391334c198ba87be3dfc3119d	j-vMmxt0MWRzNKuc47CL	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-21 09:03:55.974246	2011-02-21 09:03:55.952317	\N	2011-02-21 09:03:55.95257	2011-02-21 09:03:55.989343	64	Grover	Lakin	510-298-7738	Cade Klein129827903594828	\N	\N	4	\N	0	\N	\N	\N	\N	Qxtr3j84TxOG0Gxk2a8UzkLmz92plbfLEYXenjcmqLMrn4ALByZWN2qocJaT2W	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	\N	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

