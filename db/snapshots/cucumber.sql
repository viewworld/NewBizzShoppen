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

SELECT pg_catalog.setval('categories_id_seq', 3, true);


--
-- Name: category_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_interests_id_seq', 1, false);


--
-- Name: category_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_translations_id_seq', 6, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('countries_id_seq', 3, true);


--
-- Name: country_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_interests_id_seq', 1, false);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('currencies_id_seq', 21, true);


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

SELECT pg_catalog.setval('lead_translations_id_seq', 7, true);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('leads_id_seq', 7, true);


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

SELECT pg_catalog.setval('users_id_seq', 5, true);


--
-- Name: vat_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vat_rates_id_seq', 1, false);


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-16 09:29:06.647845	2011-02-16 09:29:06.647845
2	1	en	About us	About us	2011-02-16 09:29:06.674424	2011-02-16 09:29:06.674424
3	2	dk	Privacy	Privacy	2011-02-16 09:29:06.72804	2011-02-16 09:29:06.72804
4	2	en	Privacy	Privacy	2011-02-16 09:29:06.747614	2011-02-16 09:29:06.747614
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-16 09:29:06.818084	2011-02-16 09:29:06.818084
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-16 09:29:06.836471	2011-02-16 09:29:06.836471
7	4	dk	Blurb sign up	Blurb sign up	2011-02-16 09:29:06.893196	2011-02-16 09:29:06.893196
8	4	en	Blurb sign up	Blurb sign up	2011-02-16 09:29:06.927569	2011-02-16 09:29:06.927569
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-16 09:29:06.97513	2011-02-16 09:29:06.97513
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-16 09:29:07.005205	2011-02-16 09:29:07.005205
11	6	dk	Blurb agent home	Blurb agent home	2011-02-16 09:29:07.0546	2011-02-16 09:29:07.0546
12	6	en	Blurb agent home	Blurb agent home	2011-02-16 09:29:07.073896	2011-02-16 09:29:07.073896
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-16 09:29:07.117436	2011-02-16 09:29:07.117436
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-16 09:29:07.138113	2011-02-16 09:29:07.138113
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-16 09:29:07.192739	2011-02-16 09:29:07.192739
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-16 09:29:07.224547	2011-02-16 09:29:07.224547
17	9	dk	Blurb currencies	Blurb currencies	2011-02-16 09:29:07.270885	2011-02-16 09:29:07.270885
18	9	en	Blurb currencies	Blurb currencies	2011-02-16 09:29:07.291928	2011-02-16 09:29:07.291928
19	10	dk	Blurb category home	Blurb category home	2011-02-16 09:29:07.339078	2011-02-16 09:29:07.339078
20	10	en	Blurb category home	Blurb category home	2011-02-16 09:29:07.363748	2011-02-16 09:29:07.363748
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-16 09:29:07.41459	2011-02-16 09:29:07.41459
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-16 09:29:07.433535	2011-02-16 09:29:07.433535
23	12	dk	Reset password	Reset password	2011-02-16 09:29:07.499008	2011-02-16 09:29:07.499008
24	12	en	Reset password	Reset password	2011-02-16 09:29:07.517965	2011-02-16 09:29:07.517965
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id, views_count) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-16 09:29:06.636199	2011-02-16 09:29:06.683425	about_us	t	2011-02-16 09:29:06.6833	\N	\N	0
2	Article::Cms::MainPageArticle	2011-02-16 09:29:06.722321	2011-02-16 09:29:06.754017	privacy	t	2011-02-16 09:29:06.753899	\N	\N	0
3	Article::Cms::MainPageArticle	2011-02-16 09:29:06.812612	2011-02-16 09:29:06.842263	terms_conditions	t	2011-02-16 09:29:06.842135	\N	\N	0
4	Article::Cms::InterfaceContentText	2011-02-16 09:29:06.885564	2011-02-16 09:29:06.933456	blurb_sign_up	t	2011-02-16 09:29:06.93334	\N	\N	0
5	Article::Cms::InterfaceContentText	2011-02-16 09:29:06.968477	2011-02-16 09:29:07.014511	blurb_buyer_home	t	2011-02-16 09:29:07.014402	\N	\N	0
6	Article::Cms::InterfaceContentText	2011-02-16 09:29:07.04871	2011-02-16 09:29:07.080169	blurb_agent_home	t	2011-02-16 09:29:07.080064	\N	\N	0
7	Article::Cms::InterfaceContentText	2011-02-16 09:29:07.112007	2011-02-16 09:29:07.148308	blurb_purchase_manager_home	t	2011-02-16 09:29:07.148197	\N	\N	0
8	Article::Cms::InterfaceContentText	2011-02-16 09:29:07.187326	2011-02-16 09:29:07.230173	blurb_start_page_role_selection	t	2011-02-16 09:29:07.23007	\N	\N	0
9	Article::Cms::InterfaceContentText	2011-02-16 09:29:07.263846	2011-02-16 09:29:07.298336	blurb_currencies	t	2011-02-16 09:29:07.298227	\N	\N	0
10	Article::Cms::InterfaceContentText	2011-02-16 09:29:07.33308	2011-02-16 09:29:07.370024	blurb_category_home	t	2011-02-16 09:29:07.369901	\N	\N	0
11	Article::Cms::InterfaceContentText	2011-02-16 09:29:07.406883	2011-02-16 09:29:07.441174	blurb_leads_listing	t	2011-02-16 09:29:07.440979	\N	\N	0
12	Article::Cms::HelpPopup	2011-02-16 09:29:07.490676	2011-02-16 09:29:07.523562	reset_password	t	2011-02-16 09:29:07.523432	\N	\N	0
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY bank_accounts (id, country_id, bank_name, bank_address, iban_no, local_bank_number, swift, payment_conditions, country_default, created_at, updated_at, global_default) FROM stdin;
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-16 09:29:03.534751	2011-02-16 09:29:03.534751	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Sit animi in enim autem minima.Quod ex officia excepturi labore ipsa delectus inventore.	2011-02-16 09:29:04.294057	2011-02-16 09:29:04.294057	\N	1	2	\N	0	electronics	f	0
2	Leisure	Facere unde magnam dolore.Fuga distinctio doloremque aliquid.	2011-02-16 09:29:04.360496	2011-02-16 09:29:04.360496	\N	3	4	\N	0	leisure	f	0
3	Business	Corrupti maiores rem sit tempore.Pariatur temporibus cum non nisi architecto.	2011-02-16 09:29:04.41051	2011-02-16 09:29:05.243638	\N	5	6	\N	7	business	f	7
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
1	1	en	Sit animi in enim autem minima.Quod ex officia excepturi labore ipsa delectus inventore.	Electronics	2011-02-16 09:29:04.305628	2011-02-16 09:29:04.305628
2	1	dk	\N	Electronics	2011-02-16 09:29:04.343172	2011-02-16 09:29:04.343172
3	2	en	Facere unde magnam dolore.Fuga distinctio doloremque aliquid.	Leisure	2011-02-16 09:29:04.366157	2011-02-16 09:29:04.366157
4	2	dk	\N	Leisure	2011-02-16 09:29:04.394873	2011-02-16 09:29:04.394873
5	3	en	Corrupti maiores rem sit tempore.Pariatur temporibus cum non nisi architecto.	Business	2011-02-16 09:29:04.418037	2011-02-16 09:29:04.418037
6	3	dk	\N	Business	2011-02-16 09:29:04.457911	2011-02-16 09:29:04.457911
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-16 09:29:03.510005	2011-02-16 09:29:03.510005
2	United Kingdom	2011-02-16 09:29:03.518411	2011-02-16 09:29:03.518411
3	Northern Ireland129784854449979	2011-02-16 09:29:04.50181	2011-02-16 09:29:04.50181
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
1	AUD	A &#36;	%u%n	f	2011-02-16 09:29:04.129672	2011-02-16 09:29:04.129672
2	CAD	C &#36;	%u%n	f	2011-02-16 09:29:04.140203	2011-02-16 09:29:04.140203
3	EUR	&euro;	%u%n	t	2011-02-16 09:29:04.146923	2011-02-16 09:29:04.146923
4	GBP	&pound;	%u%n	f	2011-02-16 09:29:04.153097	2011-02-16 09:29:04.153097
5	JPY	&yen;	%u%n	f	2011-02-16 09:29:04.159713	2011-02-16 09:29:04.159713
6	USD	&#36;	%u%n	f	2011-02-16 09:29:04.166156	2011-02-16 09:29:04.166156
7	NZD	&#36;	%u%n	f	2011-02-16 09:29:04.172497	2011-02-16 09:29:04.172497
8	CHF	CHF	%u %n	f	2011-02-16 09:29:04.179124	2011-02-16 09:29:04.179124
9	HKD	&#36;	%u%n	f	2011-02-16 09:29:04.18481	2011-02-16 09:29:04.18481
10	SGD	&#36;	%u%n	f	2011-02-16 09:29:04.1905	2011-02-16 09:29:04.1905
11	SEK	SEK	%u %n	f	2011-02-16 09:29:04.196874	2011-02-16 09:29:04.196874
12	DKK	DKK	%u %n	t	2011-02-16 09:29:04.205886	2011-02-16 09:29:04.205886
13	PLN	PLN	%u %n	t	2011-02-16 09:29:04.211636	2011-02-16 09:29:04.211636
14	NOK	NOK	%u %n	f	2011-02-16 09:29:04.217348	2011-02-16 09:29:04.217348
15	HUF	HUF	%u %n	f	2011-02-16 09:29:04.223656	2011-02-16 09:29:04.223656
16	CZK	CZK	%u %n	f	2011-02-16 09:29:04.2308	2011-02-16 09:29:04.2308
17	ILS	ILS	%u %n	f	2011-02-16 09:29:04.236359	2011-02-16 09:29:04.236359
18	MXN	MXN	%u %n	f	2011-02-16 09:29:04.241994	2011-02-16 09:29:04.241994
19	PHP	PHP	%u %n	f	2011-02-16 09:29:04.248528	2011-02-16 09:29:04.248528
20	TWD	TWD	%u %n	f	2011-02-16 09:29:04.254752	2011-02-16 09:29:04.254752
21	THB	THB	%u %n	f	2011-02-16 09:29:04.260624	2011-02-16 09:29:04.260624
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-16 09:29:03.597241	2011-02-16 09:29:03.597241
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-16 09:29:03.61933	2011-02-16 09:29:03.61933
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-16 09:29:03.646448	2011-02-16 09:29:03.646448
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-16 09:29:03.66575	2011-02-16 09:29:03.66575
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-16 09:29:03.686197	2011-02-16 09:29:03.686197
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-16 09:29:03.704152	2011-02-16 09:29:03.704152
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-16 09:29:03.721798	2011-02-16 09:29:03.721798
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-16 09:29:03.74157	2011-02-16 09:29:03.74157
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-16 09:29:03.760454	2011-02-16 09:29:03.760454
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-16 09:29:03.778917	2011-02-16 09:29:03.778917
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-16 09:29:03.804249	2011-02-16 09:29:03.804249
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-16 09:29:03.825039	2011-02-16 09:29:03.825039
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-16 09:29:03.847197	2011-02-16 09:29:03.847197
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-16 09:29:03.865921	2011-02-16 09:29:03.865921
15	8	en	<p></p>	Question	2011-02-16 09:29:03.893307	2011-02-16 09:29:03.893307
16	8	dk	<p></p>	[DK] Question	2011-02-16 09:29:03.915964	2011-02-16 09:29:03.915964
17	9	en	<p></p>	Invoice	2011-02-16 09:29:03.939661	2011-02-16 09:29:03.939661
18	9	dk	<p></p>	[DK] Invoice	2011-02-16 09:29:03.958444	2011-02-16 09:29:03.958444
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-16 09:29:03.586418	2011-02-16 09:29:03.613726
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-16 09:29:03.640055	2011-02-16 09:29:03.660341
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-16 09:29:03.680473	2011-02-16 09:29:03.698174
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-16 09:29:03.716369	2011-02-16 09:29:03.73577
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-16 09:29:03.754983	2011-02-16 09:29:03.773609
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-16 09:29:03.79442	2011-02-16 09:29:03.818989
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-16 09:29:03.841354	2011-02-16 09:29:03.860774
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-16 09:29:03.881633	2011-02-16 09:29:03.909141
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-16 09:29:03.932246	2011-02-16 09:29:03.953158
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at, ean_number, details, bank_account_id, seller_id) FROM stdin;
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

COPY lead_translations (id, lead_id, locale, header, hidden_description, description, created_at, updated_at) FROM stdin;
1	1	dk	Big deal on printers	Fuga consequatur aut aperiam.Corporis deleniti voluptatum sint temporibus similique.	Facilis labore et amet vel mollitia.Et veritatis praesentium commodi voluptas est et amet a.	2011-02-16 09:29:04.649094	2011-02-16 09:29:04.649094
2	2	dk	Drills required	Neque et ea esse in doloribus sunt sed.Optio velit culpa non.	Id ducimus non molestiae quibusdam et est ab.Porro rem nobis ut laboriosam.	2011-02-16 09:29:04.758735	2011-02-16 09:29:04.758735
3	3	dk	Need assistance in selling a car	Assumenda voluptatem sint dolorem aliquam quis consequuntur et et.Facilis voluptatem totam temporibus sunt quos.	Assumenda itaque qui veritatis.Quam itaque sed omnis sequi esse.	2011-02-16 09:29:04.861942	2011-02-16 09:29:04.861942
4	4	dk	Ipod shipment	Ex et ipsum et.Perferendis sed tempore recusandae natus animi.	Repellendus quia ut cum et est enim numquam aut.Molestiae atque dolores voluptatibus qui minus.	2011-02-16 09:29:04.974676	2011-02-16 09:29:04.974676
5	5	dk	Trip to amazonia - looking for offer	Qui aspernatur in architecto praesentium tempore necessitatibus nisi nam.Nemo qui consequuntur amet.	Sed quis incidunt ipsa optio assumenda quo voluptas.Dolore aut ut nam molestias.	2011-02-16 09:29:05.070175	2011-02-16 09:29:05.070175
6	6	dk	LCD - Huge amounts	Voluptas esse veritatis velit.Autem aspernatur architecto velit.	Quo quidem esse eveniet voluptatem possimus quam est.Esse aut voluptatibus non omnis.	2011-02-16 09:29:05.160938	2011-02-16 09:29:05.160938
7	7	dk	GPS receivers required	Aut a omnis et.Exercitationem sed aspernatur eius consectetur eum voluptatem ea unde.	Molestias corrupti sed ipsa non rerum quisquam.Sint est tenetur et repellat molestias.	2011-02-16 09:29:05.252996	2011-02-16 09:29:05.252996
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Facilis labore et amet vel mollitia.Et veritatis praesentium commodi voluptas est et amet a.	Fuga consequatur aut aperiam.Corporis deleniti voluptatum sint temporibus similique.	2	User::Agent	0	30.0	573.0	1	Schulist	Jamel Carter	1-493-092-5370 x32646	nathanael@mcdermottterry.com	2011-02-16 09:29:04.596762	2011-02-16 09:29:04.596762	2011-02-21	Amparo129784854449897 Hane	1	t	\N	0	0	f	f	-1	3	2011-02-16 09:29:04.608787	\N	\N	42314 Eugenia Burgs	\N	\N	Port Carlo	07156-0043	Lothian	\N	\N	\N	\N	t
2	Drills required	3	Id ducimus non molestiae quibusdam et est ab.Porro rem nobis ut laboriosam.	Neque et ea esse in doloribus sunt sed.Optio velit culpa non.	2	User::Agent	0	790.0	834.0	1	Bernierokuneva	Ofelia Graham	295-200-7070 x25762	maryam_okeefe@price.info	2011-02-16 09:29:04.711868	2011-02-16 09:29:04.711868	2011-02-21	Amparo129784854449897 Hane	1	t	\N	0	0	f	f	-1	3	2011-02-16 09:29:04.72012	\N	\N	249 Tierra Crossroad	\N	\N	Kingmouth	28185	East Sussex	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Assumenda itaque qui veritatis.Quam itaque sed omnis sequi esse.	Assumenda voluptatem sint dolorem aliquam quis consequuntur et et.Facilis voluptatem totam temporibus sunt quos.	2	User::Agent	0	136.0	645.0	1	Shields	Brannon Volkman	(755)859-9337	mose@emmerichwelch.us	2011-02-16 09:29:04.816668	2011-02-16 09:29:04.816668	2011-02-21	Amparo129784854449897 Hane	1	t	\N	0	0	f	f	-1	3	2011-02-16 09:29:04.825439	\N	\N	94341 Willms Fork	\N	\N	Port Oswaldo	52158-3515	Durham	\N	\N	\N	\N	t
4	Ipod shipment	3	Repellendus quia ut cum et est enim numquam aut.Molestiae atque dolores voluptatibus qui minus.	Ex et ipsum et.Perferendis sed tempore recusandae natus animi.	2	User::Agent	0	691.0	115.0	1	Marks	Zelda Parker	397.155.7862 x62606	teresa@prosacco.us	2011-02-16 09:29:04.915546	2011-02-16 09:29:04.915546	2011-02-21	Amparo129784854449897 Hane	1	t	\N	0	0	f	f	-1	3	2011-02-16 09:29:04.924986	\N	\N	86166 Alysha Extension	\N	\N	Elishire	80130	Gloucestershire	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Sed quis incidunt ipsa optio assumenda quo voluptas.Dolore aut ut nam molestias.	Qui aspernatur in architecto praesentium tempore necessitatibus nisi nam.Nemo qui consequuntur amet.	2	User::Agent	0	206.0	430.0	1	Considine	Norma Lindgren	427.089.7068 x300	leland@stracke.us	2011-02-16 09:29:05.02682	2011-02-16 09:29:05.02682	2011-02-21	Amparo129784854449897 Hane	1	t	\N	0	0	f	f	-1	3	2011-02-16 09:29:05.035556	\N	\N	225 Nestor Pines	\N	\N	West Evalynhaven	97733	Dumfries and Galloway	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Quo quidem esse eveniet voluptatem possimus quam est.Esse aut voluptatibus non omnis.	Voluptas esse veritatis velit.Autem aspernatur architecto velit.	2	User::Agent	0	85.0	541.0	1	Williamsonfunk	Bonnie Lindgren	1-657-583-5043 x77819	sim@kerlukemueller.ca	2011-02-16 09:29:05.118441	2011-02-16 09:29:05.118441	2011-02-21	Amparo129784854449897 Hane	1	t	\N	0	0	f	f	-1	3	2011-02-16 09:29:05.126762	\N	\N	6378 Molly Viaduct	\N	\N	Austynstad	39605	Staffordshire	\N	\N	\N	\N	t
7	GPS receivers required	3	Molestias corrupti sed ipsa non rerum quisquam.Sint est tenetur et repellat molestias.	Aut a omnis et.Exercitationem sed aspernatur eius consectetur eum voluptatem ea unde.	2	User::Agent	0	101.0	162.0	1	Stoltenberg	Raleigh Nienow I	1-061-804-9199 x13381	idella_lehner@hermann.ca	2011-02-16 09:29:05.209663	2011-02-16 09:29:05.209663	2011-02-21	Amparo129784854449897 Hane	1	t	\N	0	0	f	f	-1	3	2011-02-16 09:29:05.21823	\N	\N	652 Rolfson Lights	\N	\N	Port Edna	23207	Bedfordshire	\N	\N	\N	\N	t
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

COPY sellers (id, name, address, vat_no, first_name, last_name, country_id, "default", created_at, updated_at) FROM stdin;
1	Default Seller	Change	111	Change	Change	1	t	2011-02-16 09:29:03.554012	2011-02-16 09:29:03.554012
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2011-02-16 09:29:03.430926	2011-02-16 09:29:03.430926
2	default_leads_per_page	--- 5\n	2011-02-16 09:29:03.443622	2011-02-16 09:29:03.443622
3	certification_level_1	--- 10\n	2011-02-16 09:29:03.452362	2011-02-16 09:29:03.452362
4	certification_level_2	--- 20\n	2011-02-16 09:29:03.461603	2011-02-16 09:29:03.461603
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-16 09:29:03.46678	2011-02-16 09:29:03.46678
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-16 09:29:03.472955	2011-02-16 09:29:03.472955
7	invoicing_seller_name	--- Fairleads\n	2011-02-16 09:29:03.479054	2011-02-16 09:29:03.479054
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-16 09:29:03.484083	2011-02-16 09:29:03.484083
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-16 09:29:03.489013	2011-02-16 09:29:03.489013
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-16 09:29:03.494893	2011-02-16 09:29:03.494893
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers, vat_number, not_charge_vat, bank_account_id, category_id, all_deal_values_enabled) FROM stdin;
1	blazejek@gmail.com	cc6d1928913adfc1f8adf51b19168d709e55fa69201a4a509e0cfdf326f1ce1755a5ed92e3c80b18c42a934221d61600a7283f4a38c8e7f92df080cfd2ecccd9	t1OQHyfll2p1WoM9s1YY	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 09:29:04.10956	2011-02-16 09:29:04.01473	\N	2011-02-16 09:29:04.02084	2011-02-16 09:29:04.110029	1	Maudie	Moore	(385)147-7849	root	Hettinger Vista	East Lyla	08786	Greater Manchester	1	\N	\N	\N	\N	0	\N	\N	\N	\N	d4sAOILVhKvShgPVUfvLCWY16y147rDVEacr38mwO835Jc2vdqlxUpivEjvFaD	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	cf350fbeb753449b9fac746acfcccf2bfeacaceb6cbc95769bf83d80e0cfd156da8bdb97c2fa41d84d9804ab654d955446fad4a4a807cb48da5587245f3740d8	DPlN4aqCbsiX6BjBZ-Ym	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 09:29:04.547757	2011-02-16 09:29:04.513169	\N	2011-02-16 09:29:04.516334	2011-02-16 09:29:04.548221	2	Amparo129784854449897	Hane	1-503-532-4523	Felipe Harvey129784854449865	Tevin Village	West Rebeccafort	90671-6307	Durham	1	\N	0	\N	\N	0	\N	\N	\N	\N	n1QE7hGdn4k5ffGqWaoT39162mkKoxVIYTn1q0DLIQg1n5ekMVcOhr4Tqj6hVN	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	5f50988267760a2d93894fae814ecf6af72f205954268efcbd4c1838eda1fa1e23a1a156617b6883216c5863855f4f4af17cf4c7f6ded45f607b31dba8f7a8f5	ISo29nhq7mPDrfr_CbUh	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 09:29:05.366795	2011-02-16 09:29:05.33415	\N	2011-02-16 09:29:05.337149	2011-02-16 09:29:05.367329	1	Vivienne	Windler	594.246.4548 x58481	Van Eichmann129784854532666	Tremblay Trace	Hageneschester	03392-6103	County Tyrone	1	\N	\N	\N	\N	0	\N	\N	\N	\N	gcIfPcEf3eUyJoF1wDJowZndVqkfDsjfLD0zmkRBBng7vtNdeg1HmEN6OKkenJ	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	f5511093106e0cb7cdfe8ddb15fa4baa795f6c4d3f6eb6a43287e84a223a885344166387c0bb55ef1af1816bfe5958d10e6580722443beade3f375b36d8eaff1	_M2JSi7jg0PeSkf4gD1z	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 09:29:05.451688	2011-02-16 09:29:05.414653	\N	2011-02-16 09:29:05.417387	2011-02-16 09:29:05.452209	48	Alene	Kulas	1-536-289-3709	Alf Upton129784854540623	Kohler Loaf	Bayerburgh	27310-9797	Clwyd	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Q1nbQ9Vzj9KS9yYPLp5g3FPQ3W9vJJd758lYFrbAJWKoTM2xOhajieafAtBUA0	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	0df3ac2553bcf024af510d355889846bdc2efb797614e752111a64302b940c59424bea79f6c09eda1b334be41a3ff546828da5479982b2d2dfc946cbd37c95fc	oyzbOj7xGyrUPT3Dbr8R	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 09:29:06.482722	2011-02-16 09:29:05.773373	\N	2011-02-16 09:29:05.776145	2011-02-16 09:29:06.515323	64	Jevon	Eichmann	1-547-566-0771 x424	Brenda Hamill129784854576528	Weber Falls	Huelmouth	18093-4183	Strathclyde	1	\N	\N	4	\N	0	\N	\N	\N	\N	RcNsjOEzfyyL722gfkCcRAA74ZfQUo7t110DVCZKbBd2BoVIScHB8L2Fr2V4qK	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

