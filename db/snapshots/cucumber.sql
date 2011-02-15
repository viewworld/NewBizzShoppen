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
-- Name: category_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_users_id_seq', 1, false);


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
1	1	dk	About us	About us	2011-02-14 14:44:44.938001	2011-02-14 14:44:44.938001
2	1	en	About us	About us	2011-02-14 14:44:45.092833	2011-02-14 14:44:45.092833
3	2	dk	Privacy	Privacy	2011-02-14 14:44:45.126725	2011-02-14 14:44:45.126725
4	2	en	Privacy	Privacy	2011-02-14 14:44:45.138383	2011-02-14 14:44:45.138383
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-14 14:44:45.170332	2011-02-14 14:44:45.170332
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-14 14:44:45.181927	2011-02-14 14:44:45.181927
7	4	dk	Blurb sign up	Blurb sign up	2011-02-14 14:44:45.217846	2011-02-14 14:44:45.217846
8	4	en	Blurb sign up	Blurb sign up	2011-02-14 14:44:45.229663	2011-02-14 14:44:45.229663
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-14 14:44:45.258726	2011-02-14 14:44:45.258726
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-14 14:44:45.271307	2011-02-14 14:44:45.271307
11	6	dk	Blurb agent home	Blurb agent home	2011-02-14 14:44:45.302382	2011-02-14 14:44:45.302382
12	6	en	Blurb agent home	Blurb agent home	2011-02-14 14:44:45.315821	2011-02-14 14:44:45.315821
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-14 14:44:45.345246	2011-02-14 14:44:45.345246
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-14 14:44:45.357561	2011-02-14 14:44:45.357561
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-14 14:44:45.386671	2011-02-14 14:44:45.386671
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-14 14:44:45.398611	2011-02-14 14:44:45.398611
17	9	dk	Blurb currencies	Blurb currencies	2011-02-14 14:44:45.427892	2011-02-14 14:44:45.427892
18	9	en	Blurb currencies	Blurb currencies	2011-02-14 14:44:45.439905	2011-02-14 14:44:45.439905
19	10	dk	Blurb category home	Blurb category home	2011-02-14 14:44:45.629946	2011-02-14 14:44:45.629946
20	10	en	Blurb category home	Blurb category home	2011-02-14 14:44:45.642049	2011-02-14 14:44:45.642049
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-14 14:44:45.670199	2011-02-14 14:44:45.670199
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-14 14:44:45.6819	2011-02-14 14:44:45.6819
23	12	dk	Reset password	Reset password	2011-02-14 14:44:45.717744	2011-02-14 14:44:45.717744
24	12	en	Reset password	Reset password	2011-02-14 14:44:45.729291	2011-02-14 14:44:45.729291
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id, views_count) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-14 14:44:44.929414	2011-02-14 14:44:45.095768	about_us	t	2011-02-14 14:44:45.095697	\N	\N	0
2	Article::Cms::MainPageArticle	2011-02-14 14:44:45.122601	2011-02-14 14:44:45.141277	privacy	t	2011-02-14 14:44:45.141206	\N	\N	0
3	Article::Cms::MainPageArticle	2011-02-14 14:44:45.166205	2011-02-14 14:44:45.184829	terms_conditions	t	2011-02-14 14:44:45.184758	\N	\N	0
4	Article::Cms::InterfaceContentText	2011-02-14 14:44:45.211875	2011-02-14 14:44:45.232529	blurb_sign_up	t	2011-02-14 14:44:45.232456	\N	\N	0
5	Article::Cms::InterfaceContentText	2011-02-14 14:44:45.254386	2011-02-14 14:44:45.274385	blurb_buyer_home	t	2011-02-14 14:44:45.274307	\N	\N	0
6	Article::Cms::InterfaceContentText	2011-02-14 14:44:45.297439	2011-02-14 14:44:45.318702	blurb_agent_home	t	2011-02-14 14:44:45.318625	\N	\N	0
7	Article::Cms::InterfaceContentText	2011-02-14 14:44:45.341044	2011-02-14 14:44:45.360612	blurb_purchase_manager_home	t	2011-02-14 14:44:45.360534	\N	\N	0
8	Article::Cms::InterfaceContentText	2011-02-14 14:44:45.382336	2011-02-14 14:44:45.401433	blurb_start_page_role_selection	t	2011-02-14 14:44:45.401355	\N	\N	0
9	Article::Cms::InterfaceContentText	2011-02-14 14:44:45.423745	2011-02-14 14:44:45.442737	blurb_currencies	t	2011-02-14 14:44:45.442664	\N	\N	0
10	Article::Cms::InterfaceContentText	2011-02-14 14:44:45.625887	2011-02-14 14:44:45.64494	blurb_category_home	t	2011-02-14 14:44:45.644864	\N	\N	0
11	Article::Cms::InterfaceContentText	2011-02-14 14:44:45.666172	2011-02-14 14:44:45.684635	blurb_leads_listing	t	2011-02-14 14:44:45.684559	\N	\N	0
12	Article::Cms::HelpPopup	2011-02-14 14:44:45.711583	2011-02-14 14:44:45.732076	reset_password	t	2011-02-14 14:44:45.732001	\N	\N	0
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-14 14:44:42.947224	2011-02-14 14:44:42.947224	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count, is_customer_unique, is_agent_unique) FROM stdin;
1	Electronics	Dolorem ut id blanditiis consequatur.Quasi recusandae autem quia quo corrupti officiis nulla magnam.	2011-02-14 14:44:43.505973	2011-02-14 14:44:43.505973	\N	1	2	\N	0	electronics	f	0	f	f
2	Leisure	Nihil eum nihil fugit.Et exercitationem sint odit sed.	2011-02-14 14:44:43.551988	2011-02-14 14:44:43.551988	\N	3	4	\N	0	leisure	f	0	f	f
3	Business	Facilis tempora rerum nam reiciendis.Odit fugiat tempore vel velit iste saepe quos.	2011-02-14 14:44:43.588309	2011-02-14 14:44:44.456684	\N	5	6	\N	7	business	f	7	f	f
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
1	1	en	Dolorem ut id blanditiis consequatur.Quasi recusandae autem quia quo corrupti officiis nulla magnam.	Electronics	2011-02-14 14:44:43.515024	2011-02-14 14:44:43.515024
2	1	dk	\N	Electronics	2011-02-14 14:44:43.541848	2011-02-14 14:44:43.541848
3	2	en	Nihil eum nihil fugit.Et exercitationem sint odit sed.	Leisure	2011-02-14 14:44:43.556521	2011-02-14 14:44:43.556521
4	2	dk	\N	Leisure	2011-02-14 14:44:43.577738	2011-02-14 14:44:43.577738
5	3	en	Facilis tempora rerum nam reiciendis.Odit fugiat tempore vel velit iste saepe quos.	Business	2011-02-14 14:44:43.593104	2011-02-14 14:44:43.593104
6	3	dk	\N	Business	2011-02-14 14:44:43.755241	2011-02-14 14:44:43.755241
\.


--
-- Data for Name: category_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY category_users (id, category_id, user_id, user_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-14 14:44:42.933559	2011-02-14 14:44:42.933559
2	United Kingdom	2011-02-14 14:44:42.938582	2011-02-14 14:44:42.938582
3	Northern Ireland129769468378554	2011-02-14 14:44:43.786843	2011-02-14 14:44:43.786843
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
1	AUD	A &#36;	%u%n	f	2011-02-14 14:44:43.450961	2011-02-14 14:44:43.450961
2	CAD	C &#36;	%u%n	f	2011-02-14 14:44:43.45524	2011-02-14 14:44:43.45524
3	EUR	&euro;	%u%n	t	2011-02-14 14:44:43.456998	2011-02-14 14:44:43.456998
4	GBP	&pound;	%u%n	f	2011-02-14 14:44:43.458763	2011-02-14 14:44:43.458763
5	JPY	&yen;	%u%n	f	2011-02-14 14:44:43.460424	2011-02-14 14:44:43.460424
6	USD	&#36;	%u%n	f	2011-02-14 14:44:43.462019	2011-02-14 14:44:43.462019
7	NZD	&#36;	%u%n	f	2011-02-14 14:44:43.463647	2011-02-14 14:44:43.463647
8	CHF	CHF	%u %n	f	2011-02-14 14:44:43.465297	2011-02-14 14:44:43.465297
9	HKD	&#36;	%u%n	f	2011-02-14 14:44:43.466874	2011-02-14 14:44:43.466874
10	SGD	&#36;	%u%n	f	2011-02-14 14:44:43.468487	2011-02-14 14:44:43.468487
11	SEK	SEK	%u %n	f	2011-02-14 14:44:43.470152	2011-02-14 14:44:43.470152
12	DKK	DKK	%u %n	t	2011-02-14 14:44:43.472031	2011-02-14 14:44:43.472031
13	PLN	PLN	%u %n	t	2011-02-14 14:44:43.473674	2011-02-14 14:44:43.473674
14	NOK	NOK	%u %n	f	2011-02-14 14:44:43.475273	2011-02-14 14:44:43.475273
15	HUF	HUF	%u %n	f	2011-02-14 14:44:43.476851	2011-02-14 14:44:43.476851
16	CZK	CZK	%u %n	f	2011-02-14 14:44:43.478445	2011-02-14 14:44:43.478445
17	ILS	ILS	%u %n	f	2011-02-14 14:44:43.480041	2011-02-14 14:44:43.480041
18	MXN	MXN	%u %n	f	2011-02-14 14:44:43.481723	2011-02-14 14:44:43.481723
19	PHP	PHP	%u %n	f	2011-02-14 14:44:43.483418	2011-02-14 14:44:43.483418
20	TWD	TWD	%u %n	f	2011-02-14 14:44:43.48501	2011-02-14 14:44:43.48501
21	THB	THB	%u %n	f	2011-02-14 14:44:43.486612	2011-02-14 14:44:43.486612
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-14 14:44:42.977457	2011-02-14 14:44:42.977457
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-14 14:44:42.992511	2011-02-14 14:44:42.992511
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-14 14:44:43.006047	2011-02-14 14:44:43.006047
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-14 14:44:43.018412	2011-02-14 14:44:43.018412
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-14 14:44:43.030992	2011-02-14 14:44:43.030992
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-14 14:44:43.043264	2011-02-14 14:44:43.043264
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-02-14 14:44:43.056084	2011-02-14 14:44:43.056084
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-02-14 14:44:43.06886	2011-02-14 14:44:43.06886
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-14 14:44:43.081537	2011-02-14 14:44:43.081537
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-14 14:44:43.234428	2011-02-14 14:44:43.234428
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-14 14:44:43.246632	2011-02-14 14:44:43.246632
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-14 14:44:43.258861	2011-02-14 14:44:43.258861
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-14 14:44:43.271331	2011-02-14 14:44:43.271331
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-14 14:44:43.28325	2011-02-14 14:44:43.28325
15	8	en	Question	<p></p>	2011-02-14 14:44:43.296536	2011-02-14 14:44:43.296536
16	8	dk	[DK] Question	<p></p>	2011-02-14 14:44:43.309409	2011-02-14 14:44:43.309409
17	9	en	Invoice	<p></p>	2011-02-14 14:44:43.321657	2011-02-14 14:44:43.321657
18	9	dk	[DK] Invoice	<p></p>	2011-02-14 14:44:43.333673	2011-02-14 14:44:43.333673
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-14 14:44:42.96864	2011-02-14 14:44:42.988256
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-14 14:44:43.001378	2011-02-14 14:44:43.014129
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-14 14:44:43.026496	2011-02-14 14:44:43.039115
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-14 14:44:43.051534	2011-02-14 14:44:43.064207
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-14 14:44:43.076997	2011-02-14 14:44:43.230136
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-14 14:44:43.242298	2011-02-14 14:44:43.254597
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-14 14:44:43.266752	2011-02-14 14:44:43.279102
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-14 14:44:43.291771	2011-02-14 14:44:43.305063
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-14 14:44:43.317326	2011-02-14 14:44:43.329689
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at, ean_number, details, bank_account_id) FROM stdin;
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

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
1	1	dk	Et tempore dolorum eveniet blanditiis qui est id veritatis.Quaerat facilis amet aut et et quia qui.	Inventore illum magni sunt.Ratione ab cumque eos.	Big deal on printers	2011-02-14 14:44:43.898809	2011-02-14 14:44:43.898809
2	2	dk	Est fugiat atque quisquam commodi alias occaecati.Est aperiam possimus alias voluptas.	Tempore in est id nihil.Quas et quos facilis repellendus beatae quasi dolores.	Drills required	2011-02-14 14:44:43.971249	2011-02-14 14:44:43.971249
3	3	dk	Maiores occaecati fugit aspernatur dolorem optio.Atque cupiditate adipisci et totam nisi in veniam quam.	Enim dicta perspiciatis reprehenderit ut dolore.Nihil quas saepe eum distinctio corporis ut similique.	Need assistance in selling a car	2011-02-14 14:44:44.039843	2011-02-14 14:44:44.039843
4	4	dk	Explicabo ad enim maiores est ut aut.Est exercitationem qui rem molestias qui sed nemo.	Quia et consectetur dolores itaque.Harum et nihil esse numquam dignissimos veniam.	Ipod shipment	2011-02-14 14:44:44.25334	2011-02-14 14:44:44.25334
5	5	dk	Ut est doloremque sed qui.Exercitationem hic quas aspernatur.	Quas labore et molestias.Reprehenderit ut ut exercitationem voluptas rerum ea veritatis.	Trip to amazonia - looking for offer	2011-02-14 14:44:44.323982	2011-02-14 14:44:44.323982
6	6	dk	Soluta eius voluptatem autem itaque voluptas et labore.Est sed voluptatem quia ut at quos.	Sit et nam magni ut est qui accusantium.Fugiat odit sapiente dicta sunt modi autem quae.	LCD - Huge amounts	2011-02-14 14:44:44.393235	2011-02-14 14:44:44.393235
7	7	dk	Rerum et nobis ut voluptate.Excepturi repellat eos velit.	Laudantium dolor quas necessitatibus nobis eum repudiandae qui vel.Sapiente rem et voluptatem consequuntur et officiis pariatur.	GPS receivers required	2011-02-14 14:44:44.463873	2011-02-14 14:44:44.463873
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Et tempore dolorum eveniet blanditiis qui est id veritatis.Quaerat facilis amet aut et et quia qui.	Inventore illum magni sunt.Ratione ab cumque eos.	2	User::Agent	0	86.0	78.0	1	Terry	Itzel Waters	707.231.5018	johanna@rogahn.co.uk	2011-02-14 14:44:43.857161	2011-02-14 14:44:43.857161	2011-02-19	Ray129769468378434 Cartwright	1	t	\N	0	0	f	f	-1	3	2011-02-14 14:44:43.866827	\N	\N	50372 Daniel Dam	\N	\N	Griffinville	43441-5100	Clwyd	\N	\N	\N	\N	t
2	Drills required	3	Est fugiat atque quisquam commodi alias occaecati.Est aperiam possimus alias voluptas.	Tempore in est id nihil.Quas et quos facilis repellendus beatae quasi dolores.	2	User::Agent	0	682.0	714.0	1	Boylelabadie	Victoria Schaefer III	993-267-8951 x9344	noemie@nadermarquardt.com	2011-02-14 14:44:43.938337	2011-02-14 14:44:43.938337	2011-02-19	Ray129769468378434 Cartwright	1	t	\N	0	0	f	f	-1	3	2011-02-14 14:44:43.945258	\N	\N	545 Quigley Highway	\N	\N	Leannonmouth	16834-6075	Gwynedd County	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Maiores occaecati fugit aspernatur dolorem optio.Atque cupiditate adipisci et totam nisi in veniam quam.	Enim dicta perspiciatis reprehenderit ut dolore.Nihil quas saepe eum distinctio corporis ut similique.	2	User::Agent	0	365.0	406.0	1	Runteankunding	Nyah Volkman	(106)264-4182 x307	ryleigh.paucek@bruen.us	2011-02-14 14:44:44.007818	2011-02-14 14:44:44.007818	2011-02-19	Ray129769468378434 Cartwright	1	t	\N	0	0	f	f	-1	3	2011-02-14 14:44:44.01466	\N	\N	83490 Blanca Gardens	\N	\N	East Gabrielle	45261	Staffordshire	\N	\N	\N	\N	t
4	Ipod shipment	3	Explicabo ad enim maiores est ut aut.Est exercitationem qui rem molestias qui sed nemo.	Quia et consectetur dolores itaque.Harum et nihil esse numquam dignissimos veniam.	2	User::Agent	0	197.0	307.0	1	Reynolds	Ms. Ashleigh Schowalter	283.373.7996 x056	sienna@cartwright.us	2011-02-14 14:44:44.075003	2011-02-14 14:44:44.075003	2011-02-19	Ray129769468378434 Cartwright	1	t	\N	0	0	f	f	-1	3	2011-02-14 14:44:44.081843	\N	\N	60854 Tre Forks	\N	\N	West Ernestland	06095-0656	Wiltshire	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Ut est doloremque sed qui.Exercitationem hic quas aspernatur.	Quas labore et molestias.Reprehenderit ut ut exercitationem voluptas rerum ea veritatis.	2	User::Agent	0	269.0	873.0	1	Kub	Dejah Walsh	1-244-851-5689	lillian_huels@kulas.ca	2011-02-14 14:44:44.290139	2011-02-14 14:44:44.290139	2011-02-19	Ray129769468378434 Cartwright	1	t	\N	0	0	f	f	-1	3	2011-02-14 14:44:44.297039	\N	\N	34887 Rodriguez Run	\N	\N	West Prudenceside	53947	Norfolk	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Soluta eius voluptatem autem itaque voluptas et labore.Est sed voluptatem quia ut at quos.	Sit et nam magni ut est qui accusantium.Fugiat odit sapiente dicta sunt modi autem quae.	2	User::Agent	0	640.0	820.0	1	Quitzonzboncak	Aylin Boehm	038-716-3414	alvis@turcotte.com	2011-02-14 14:44:44.360653	2011-02-14 14:44:44.360653	2011-02-19	Ray129769468378434 Cartwright	1	t	\N	0	0	f	f	-1	3	2011-02-14 14:44:44.367457	\N	\N	0460 Celia Roads	\N	\N	Schuppeland	11562	Somerset	\N	\N	\N	\N	t
7	GPS receivers required	3	Rerum et nobis ut voluptate.Excepturi repellat eos velit.	Laudantium dolor quas necessitatibus nobis eum repudiandae qui vel.Sapiente rem et voluptatem consequuntur et officiis pariatur.	2	User::Agent	0	596.0	220.0	1	Goldner	Blanca King	902-869-3279 x869	conrad@vonrueden.name	2011-02-14 14:44:44.430993	2011-02-14 14:44:44.430993	2011-02-19	Ray129769468378434 Cartwright	1	t	\N	0	0	f	f	-1	3	2011-02-14 14:44:44.437911	\N	\N	2892 Arne Ridge	\N	\N	Port Anabelle	74518-9752	South Glamorgan	\N	\N	\N	\N	t
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
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2011-02-14 14:44:42.899419	2011-02-14 14:44:42.899419
2	default_leads_per_page	--- 5\n	2011-02-14 14:44:42.904985	2011-02-14 14:44:42.904985
3	certification_level_1	--- 10\n	2011-02-14 14:44:42.90916	2011-02-14 14:44:42.90916
4	certification_level_2	--- 20\n	2011-02-14 14:44:42.912263	2011-02-14 14:44:42.912263
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-14 14:44:42.914423	2011-02-14 14:44:42.914423
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-14 14:44:42.916614	2011-02-14 14:44:42.916614
7	invoicing_seller_name	--- Fairleads\n	2011-02-14 14:44:42.918758	2011-02-14 14:44:42.918758
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-14 14:44:42.920844	2011-02-14 14:44:42.920844
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-14 14:44:42.922948	2011-02-14 14:44:42.922948
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-14 14:44:42.925011	2011-02-14 14:44:42.925011
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
1	blazejek@gmail.com	1a361ca7755a817945e08b7a39b56f52a65786fe2e21cb0a7aa8de67c52cf8c2cc0b66a0117076b7bf37c215ef13771e51a54d4f04198439b21c0cf0334b0fea	Y0TZcUDB28cgE5kVZgde	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-14 14:44:43.44064	2011-02-14 14:44:43.372711	\N	2011-02-14 14:44:43.377292	2011-02-14 14:44:43.440936	1	Alicia	Ankunding	964-500-4862	root	Strosin Crossing	North Treva	55610-6848	Northumberland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	pa7e2xnhsh5Uyz8ORjdlqTwLjYqm44ae2bh2xn2WPLapWyfUS5kC8csVG2Z5ac	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	9bae2045a7de8b2bd1994caf75e1f6fb36b8d4f0d9a7fa1a94b73d342ab3a6ab852d00223dd6c688fd23869b3680c383db101a90e0537ad14ff2648c3493896a	CsCQPJS0jyOyae7zja7I	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-14 14:44:43.818776	2011-02-14 14:44:43.793261	\N	2011-02-14 14:44:43.795127	2011-02-14 14:44:43.819086	2	Ray129769468378434	Cartwright	1-099-958-0772 x94723	Annabell Stark129769468378406	Wilderman Circles	Lemkeside	77929	Cornwall	1	\N	0	\N	\N	0	\N	\N	\N	\N	W0Pn98D9UllgjPc2EkqlSLOJwCgNewn4WRf0G9v9bU4OFhZCCYh3Hcirv4DnC0	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	7faa7cc48385b1d35fe0a41dc532b4db2f015124f3cf60ddc2cd480a7e23b04b6def8907f5d19569e178931fb80b63f1f8c89454c112953b8c724affbf1d4dc5	8K1dxP91v9oh8BgFliRG	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-14 14:44:44.543977	2011-02-14 14:44:44.521454	\N	2011-02-14 14:44:44.523187	2011-02-14 14:44:44.544268	1	Eliza	Hermiston	897-361-4372	Moriah Quigley129769468451594	Vergie Manor	Tatestad	29585-5026	Oxfordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Qi79bs4l71QJjTjza31HvVwaQUPYn11rOOASVdNtMlor0qcztUMBwHin3OrSKa	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	06dd9f771d07140085010c65978ed3cddf57b23e8cfc56d7442cdbe46d84e9c0bc0ad83d46cc523d6670a4ba98f1a62373b765d83415981e6e8066573f197cc7	qTIN5eOinLWfwcpOpgYc	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-14 14:44:44.757704	2011-02-14 14:44:44.581075	\N	2011-02-14 14:44:44.582957	2011-02-14 14:44:44.758025	48	Earnestine	Fisher	372-739-4356	Isaias Botsford129769468457473	Amparo Summit	Lake Jeniferside	44300-0078	Cambridgeshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	xgE3bVPs9SaWcLWMe2cZusLebZfNluEH2Z57TETSnlDaG0ixCGnlHTk9yFq7tI	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	37d6927766b8760d94f2bbae81d6cd2ed725eacf026931366740f0149a75976fbe747df5834e63212566ce32d3a97d5034d7be24489af95fdd674ac835be570c	gpbGWbqiM5qNf--N5ONt	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-14 14:44:44.825879	2011-02-14 14:44:44.800399	\N	2011-02-14 14:44:44.802438	2011-02-14 14:44:44.842551	64	Pasquale	Volkman	725.597.4172 x49454	Thaddeus Bruen129769468479334	Gerardo Loaf	Schadenmouth	59081-2404	Essex	1	\N	\N	4	\N	0	\N	\N	\N	\N	ASDeVYvpKdFezrgLKfuqKHvj14tLFwji5cA0fl1ImT1XSQdZ12bzcxLZV1hDwZ	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

