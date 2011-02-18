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
1	1	dk	About us	About us	2011-02-18 10:02:17.830582	2011-02-18 10:02:17.830582
2	1	en	About us	About us	2011-02-18 10:02:17.845022	2011-02-18 10:02:17.845022
3	2	dk	Privacy	Privacy	2011-02-18 10:02:17.87662	2011-02-18 10:02:17.87662
4	2	en	Privacy	Privacy	2011-02-18 10:02:17.88855	2011-02-18 10:02:17.88855
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-18 10:02:17.920506	2011-02-18 10:02:17.920506
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-18 10:02:17.932004	2011-02-18 10:02:17.932004
7	4	dk	Blurb sign up	Blurb sign up	2011-02-18 10:02:17.967168	2011-02-18 10:02:17.967168
8	4	en	Blurb sign up	Blurb sign up	2011-02-18 10:02:17.97855	2011-02-18 10:02:17.97855
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-18 10:02:18.006882	2011-02-18 10:02:18.006882
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-18 10:02:18.018428	2011-02-18 10:02:18.018428
11	6	dk	Blurb agent home	Blurb agent home	2011-02-18 10:02:18.048284	2011-02-18 10:02:18.048284
12	6	en	Blurb agent home	Blurb agent home	2011-02-18 10:02:18.060436	2011-02-18 10:02:18.060436
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-18 10:02:18.090794	2011-02-18 10:02:18.090794
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-18 10:02:18.103348	2011-02-18 10:02:18.103348
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-18 10:02:18.284825	2011-02-18 10:02:18.284825
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-18 10:02:18.296722	2011-02-18 10:02:18.296722
17	9	dk	Blurb currencies	Blurb currencies	2011-02-18 10:02:18.328385	2011-02-18 10:02:18.328385
18	9	en	Blurb currencies	Blurb currencies	2011-02-18 10:02:18.340053	2011-02-18 10:02:18.340053
19	10	dk	Blurb category home	Blurb category home	2011-02-18 10:02:18.368795	2011-02-18 10:02:18.368795
20	10	en	Blurb category home	Blurb category home	2011-02-18 10:02:18.380746	2011-02-18 10:02:18.380746
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-18 10:02:18.409751	2011-02-18 10:02:18.409751
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-18 10:02:18.421153	2011-02-18 10:02:18.421153
23	12	dk	Reset password	Reset password	2011-02-18 10:02:18.456256	2011-02-18 10:02:18.456256
24	12	en	Reset password	Reset password	2011-02-18 10:02:18.467624	2011-02-18 10:02:18.467624
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id, views_count) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-18 10:02:17.821887	2011-02-18 10:02:17.847874	about_us	t	2011-02-18 10:02:17.8478	\N	\N	0
2	Article::Cms::MainPageArticle	2011-02-18 10:02:17.872534	2011-02-18 10:02:17.891325	privacy	t	2011-02-18 10:02:17.89125	\N	\N	0
3	Article::Cms::MainPageArticle	2011-02-18 10:02:17.916197	2011-02-18 10:02:17.93477	terms_conditions	t	2011-02-18 10:02:17.934696	\N	\N	0
4	Article::Cms::InterfaceContentText	2011-02-18 10:02:17.961238	2011-02-18 10:02:17.981373	blurb_sign_up	t	2011-02-18 10:02:17.981303	\N	\N	0
5	Article::Cms::InterfaceContentText	2011-02-18 10:02:18.002441	2011-02-18 10:02:18.021352	blurb_buyer_home	t	2011-02-18 10:02:18.021281	\N	\N	0
6	Article::Cms::InterfaceContentText	2011-02-18 10:02:18.044	2011-02-18 10:02:18.063315	blurb_agent_home	t	2011-02-18 10:02:18.063247	\N	\N	0
7	Article::Cms::InterfaceContentText	2011-02-18 10:02:18.086376	2011-02-18 10:02:18.106391	blurb_purchase_manager_home	t	2011-02-18 10:02:18.10631	\N	\N	0
8	Article::Cms::InterfaceContentText	2011-02-18 10:02:18.280231	2011-02-18 10:02:18.299583	blurb_start_page_role_selection	t	2011-02-18 10:02:18.299513	\N	\N	0
9	Article::Cms::InterfaceContentText	2011-02-18 10:02:18.323934	2011-02-18 10:02:18.342941	blurb_currencies	t	2011-02-18 10:02:18.342867	\N	\N	0
10	Article::Cms::InterfaceContentText	2011-02-18 10:02:18.364223	2011-02-18 10:02:18.383672	blurb_category_home	t	2011-02-18 10:02:18.383598	\N	\N	0
11	Article::Cms::InterfaceContentText	2011-02-18 10:02:18.405258	2011-02-18 10:02:18.42397	blurb_leads_listing	t	2011-02-18 10:02:18.423898	\N	\N	0
12	Article::Cms::HelpPopup	2011-02-18 10:02:18.450225	2011-02-18 10:02:18.470302	reset_password	t	2011-02-18 10:02:18.470233	\N	\N	0
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-18 10:02:15.589916	2011-02-18 10:02:15.589916	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count, is_customer_unique, is_agent_unique) FROM stdin;
1	Electronics	Facilis numquam inventore non vitae quisquam illum voluptates.Illo delectus ratione quo sunt nihil est consequatur.	2011-02-18 10:02:16.227473	2011-02-18 10:02:16.227473	\N	1	2	\N	0	electronics	f	0	f	f
2	Leisure	Quibusdam magnam sequi qui aut dignissimos facilis.Enim rem et aut vel qui est architecto.	2011-02-18 10:02:16.283492	2011-02-18 10:02:16.283492	\N	3	4	\N	0	leisure	f	0	f	f
3	Business	Magni ipsum quidem sed aut.Numquam quae fugit quis illo culpa.	2011-02-18 10:02:16.45796	2011-02-18 10:02:17.195192	\N	5	6	\N	7	business	f	7	f	f
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
1	1	en	Facilis numquam inventore non vitae quisquam illum voluptates.Illo delectus ratione quo sunt nihil est consequatur.	Electronics	2011-02-18 10:02:16.237157	2011-02-18 10:02:16.237157
2	1	dk	\N	Electronics	2011-02-18 10:02:16.266329	2011-02-18 10:02:16.266329
3	2	en	Quibusdam magnam sequi qui aut dignissimos facilis.Enim rem et aut vel qui est architecto.	Leisure	2011-02-18 10:02:16.426332	2011-02-18 10:02:16.426332
4	2	dk	\N	Leisure	2011-02-18 10:02:16.447655	2011-02-18 10:02:16.447655
5	3	en	Magni ipsum quidem sed aut.Numquam quae fugit quis illo culpa.	Business	2011-02-18 10:02:16.462263	2011-02-18 10:02:16.462263
6	3	dk	\N	Business	2011-02-18 10:02:16.48329	2011-02-18 10:02:16.48329
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-18 10:02:15.575892	2011-02-18 10:02:15.575892
2	United Kingdom	2011-02-18 10:02:15.58087	2011-02-18 10:02:15.58087
3	England129802333651373	2011-02-18 10:02:16.515178	2011-02-18 10:02:16.515178
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
1	AUD	A &#36;	%u%n	f	2011-02-18 10:02:16.168554	2011-02-18 10:02:16.168554
2	CAD	C &#36;	%u%n	f	2011-02-18 10:02:16.172861	2011-02-18 10:02:16.172861
3	EUR	&euro;	%u%n	t	2011-02-18 10:02:16.174802	2011-02-18 10:02:16.174802
4	GBP	&pound;	%u%n	f	2011-02-18 10:02:16.176536	2011-02-18 10:02:16.176536
5	JPY	&yen;	%u%n	f	2011-02-18 10:02:16.178258	2011-02-18 10:02:16.178258
6	USD	&#36;	%u%n	f	2011-02-18 10:02:16.179881	2011-02-18 10:02:16.179881
7	NZD	&#36;	%u%n	f	2011-02-18 10:02:16.181764	2011-02-18 10:02:16.181764
8	CHF	CHF	%u %n	f	2011-02-18 10:02:16.183411	2011-02-18 10:02:16.183411
9	HKD	&#36;	%u%n	f	2011-02-18 10:02:16.185411	2011-02-18 10:02:16.185411
10	SGD	&#36;	%u%n	f	2011-02-18 10:02:16.188649	2011-02-18 10:02:16.188649
11	SEK	SEK	%u %n	f	2011-02-18 10:02:16.190461	2011-02-18 10:02:16.190461
12	DKK	DKK	%u %n	t	2011-02-18 10:02:16.192108	2011-02-18 10:02:16.192108
13	PLN	PLN	%u %n	t	2011-02-18 10:02:16.193952	2011-02-18 10:02:16.193952
14	NOK	NOK	%u %n	f	2011-02-18 10:02:16.195788	2011-02-18 10:02:16.195788
15	HUF	HUF	%u %n	f	2011-02-18 10:02:16.197405	2011-02-18 10:02:16.197405
16	CZK	CZK	%u %n	f	2011-02-18 10:02:16.199106	2011-02-18 10:02:16.199106
17	ILS	ILS	%u %n	f	2011-02-18 10:02:16.200839	2011-02-18 10:02:16.200839
18	MXN	MXN	%u %n	f	2011-02-18 10:02:16.202519	2011-02-18 10:02:16.202519
19	PHP	PHP	%u %n	f	2011-02-18 10:02:16.204345	2011-02-18 10:02:16.204345
20	TWD	TWD	%u %n	f	2011-02-18 10:02:16.206001	2011-02-18 10:02:16.206001
21	THB	THB	%u %n	f	2011-02-18 10:02:16.207719	2011-02-18 10:02:16.207719
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-18 10:02:15.621083	2011-02-18 10:02:15.621083
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-18 10:02:15.637223	2011-02-18 10:02:15.637223
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-18 10:02:15.65099	2011-02-18 10:02:15.65099
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-18 10:02:15.663628	2011-02-18 10:02:15.663628
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-18 10:02:15.811165	2011-02-18 10:02:15.811165
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-18 10:02:15.825386	2011-02-18 10:02:15.825386
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-02-18 10:02:15.838087	2011-02-18 10:02:15.838087
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-02-18 10:02:15.850403	2011-02-18 10:02:15.850403
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-18 10:02:15.862999	2011-02-18 10:02:15.862999
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-18 10:02:15.875297	2011-02-18 10:02:15.875297
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-18 10:02:15.888349	2011-02-18 10:02:15.888349
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-18 10:02:15.900593	2011-02-18 10:02:15.900593
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-18 10:02:15.913321	2011-02-18 10:02:15.913321
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-18 10:02:15.925326	2011-02-18 10:02:15.925326
15	8	en	Question	<p></p>	2011-02-18 10:02:15.937553	2011-02-18 10:02:15.937553
16	8	dk	[DK] Question	<p></p>	2011-02-18 10:02:15.949671	2011-02-18 10:02:15.949671
17	9	en	Invoice	<p></p>	2011-02-18 10:02:15.962028	2011-02-18 10:02:15.962028
18	9	dk	[DK] Invoice	<p></p>	2011-02-18 10:02:15.974441	2011-02-18 10:02:15.974441
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-18 10:02:15.611884	2011-02-18 10:02:15.632072
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-18 10:02:15.645851	2011-02-18 10:02:15.659371
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-18 10:02:15.672011	2011-02-18 10:02:15.820949
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-18 10:02:15.833578	2011-02-18 10:02:15.846129
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-18 10:02:15.858565	2011-02-18 10:02:15.871073
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-18 10:02:15.883707	2011-02-18 10:02:15.896338
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-18 10:02:15.908674	2011-02-18 10:02:15.921168
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-18 10:02:15.933155	2011-02-18 10:02:15.945586
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-18 10:02:15.95754	2011-02-18 10:02:15.970146
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
1	1	dk	Animi et est nam fugit alias deleniti cumque veniam.Necessitatibus doloribus voluptatem explicabo quod vel omnis.	Suscipit pariatur quasi placeat voluptates.Explicabo quibusdam itaque et quis.	Big deal on printers	2011-02-18 10:02:16.629973	2011-02-18 10:02:16.629973
2	2	dk	Beatae impedit ipsa ut aliquam ipsum.Doloremque officia velit sed quae numquam non.	Est mollitia alias vel nemo facere quis quisquam.Et porro cupiditate minus est.	Drills required	2011-02-18 10:02:16.704129	2011-02-18 10:02:16.704129
3	3	dk	Qui non voluptatem ut.Pariatur iste nemo distinctio quisquam velit.	Officia sit omnis non vitae reprehenderit vel ut.Fugit voluptates sint et ea excepturi libero.	Need assistance in selling a car	2011-02-18 10:02:16.916397	2011-02-18 10:02:16.916397
4	4	dk	Occaecati dolorem molestias quia voluptatem.Debitis laboriosam dolores et.	Natus quis architecto fugit odit optio.Illo deleniti sit ut.	Ipod shipment	2011-02-18 10:02:16.987851	2011-02-18 10:02:16.987851
5	5	dk	Eligendi facilis nisi deserunt.In dolores corrupti quis iste vel.	In neque soluta qui porro sed voluptatem consequatur at.Cum veniam eius numquam et.	Trip to amazonia - looking for offer	2011-02-18 10:02:17.060312	2011-02-18 10:02:17.060312
6	6	dk	Enim omnis voluptatem voluptatem nesciunt cum.Quia mollitia ratione repellat.	Veritatis aspernatur consequatur natus.Velit fuga doloremque incidunt totam.	LCD - Huge amounts	2011-02-18 10:02:17.131953	2011-02-18 10:02:17.131953
7	7	dk	Quisquam amet sint soluta quidem hic.Voluptatem ullam officiis dolorum.	Qui culpa amet perferendis est doloremque reiciendis.Ratione ab illo quas dolorum et assumenda.	GPS receivers required	2011-02-18 10:02:17.202212	2011-02-18 10:02:17.202212
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Animi et est nam fugit alias deleniti cumque veniam.Necessitatibus doloribus voluptatem explicabo quod vel omnis.	Suscipit pariatur quasi placeat voluptates.Explicabo quibusdam itaque et quis.	2	User::Agent	0	791.0	119.0	1	Dare	Collin Bailey	535.224.0346 x7110	lorine.harvey@ullrich.biz	2011-02-18 10:02:16.58855	2011-02-18 10:02:16.58855	2011-02-23	Zella129802333651291 Corwin	1	t	\N	0	0	f	f	-1	3	2011-02-18 10:02:16.597285	\N	\N	78502 Cordelia Causeway	\N	\N	Jordynshire	81005-5489	County Antrim	\N	\N	\N	\N	t
2	Drills required	3	Beatae impedit ipsa ut aliquam ipsum.Doloremque officia velit sed quae numquam non.	Est mollitia alias vel nemo facere quis quisquam.Et porro cupiditate minus est.	2	User::Agent	0	916.0	784.0	1	Okuneva	Ms. Estella Bernier	809.331.7670 x725	cooper.raynor@rice.com	2011-02-18 10:02:16.672514	2011-02-18 10:02:16.672514	2011-02-23	Zella129802333651291 Corwin	1	t	\N	0	0	f	f	-1	3	2011-02-18 10:02:16.678226	\N	\N	62717 Emmy Shores	\N	\N	Romagueraton	92271	Hampshire	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Qui non voluptatem ut.Pariatur iste nemo distinctio quisquam velit.	Officia sit omnis non vitae reprehenderit vel ut.Fugit voluptates sint et ea excepturi libero.	2	User::Agent	0	786.0	625.0	1	Lebsack	Alene Waters	1-823-490-1225	nikko.simonis@schaeferkautzer.biz	2011-02-18 10:02:16.742128	2011-02-18 10:02:16.742128	2011-02-23	Zella129802333651291 Corwin	1	t	\N	0	0	f	f	-1	3	2011-02-18 10:02:16.747897	\N	\N	513 Orval Throughway	\N	\N	Marquardtburgh	68188	Tayside	\N	\N	\N	\N	t
4	Ipod shipment	3	Occaecati dolorem molestias quia voluptatem.Debitis laboriosam dolores et.	Natus quis architecto fugit odit optio.Illo deleniti sit ut.	2	User::Agent	0	338.0	77.0	1	Prosaccoborer	Kaycee Ward	052-576-5521	wilmer.schuppe@koch.ca	2011-02-18 10:02:16.955555	2011-02-18 10:02:16.955555	2011-02-23	Zella129802333651291 Corwin	1	t	\N	0	0	f	f	-1	3	2011-02-18 10:02:16.961281	\N	\N	752 Boyle Via	\N	\N	West Jasperfurt	69530-4044	Worcestershire	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Eligendi facilis nisi deserunt.In dolores corrupti quis iste vel.	In neque soluta qui porro sed voluptatem consequatur at.Cum veniam eius numquam et.	2	User::Agent	0	845.0	241.0	1	Walsh	Claud Lueilwitz I	(560)782-5323 x61729	winifred.senger@gerlachhintz.biz	2011-02-18 10:02:17.027716	2011-02-18 10:02:17.027716	2011-02-23	Zella129802333651291 Corwin	1	t	\N	0	0	f	f	-1	3	2011-02-18 10:02:17.033628	\N	\N	51457 Aylin Plaza	\N	\N	Rhiannastad	77904	Lothian	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Enim omnis voluptatem voluptatem nesciunt cum.Quia mollitia ratione repellat.	Veritatis aspernatur consequatur natus.Velit fuga doloremque incidunt totam.	2	User::Agent	0	431.0	353.0	1	Zboncak	Conner Dibbert	172-657-1116	emiliano.hartmann@boyerwunsch.name	2011-02-18 10:02:17.099512	2011-02-18 10:02:17.099512	2011-02-23	Zella129802333651291 Corwin	1	t	\N	0	0	f	f	-1	3	2011-02-18 10:02:17.10534	\N	\N	3526 Lucius Burgs	\N	\N	Lake Ivy	37263-8428	Lancashire	\N	\N	\N	\N	t
7	GPS receivers required	3	Quisquam amet sint soluta quidem hic.Voluptatem ullam officiis dolorum.	Qui culpa amet perferendis est doloremque reiciendis.Ratione ab illo quas dolorum et assumenda.	2	User::Agent	0	946.0	124.0	1	Jacobi	Ernest Kunze Sr.	(104)925-9336 x0348	krystina@romaguera.co.uk	2011-02-18 10:02:17.16986	2011-02-18 10:02:17.16986	2011-02-23	Zella129802333651291 Corwin	1	t	\N	0	0	f	f	-1	3	2011-02-18 10:02:17.175808	\N	\N	1765 Kautzer Springs	\N	\N	North Herminia	33715	Gwynedd County	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-18 10:02:15.534113	2011-02-18 10:02:15.534113
2	default_leads_per_page	--- 5\n	2011-02-18 10:02:15.545634	2011-02-18 10:02:15.545634
3	certification_level_1	--- 10\n	2011-02-18 10:02:15.54968	2011-02-18 10:02:15.54968
4	certification_level_2	--- 20\n	2011-02-18 10:02:15.552893	2011-02-18 10:02:15.552893
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-18 10:02:15.555611	2011-02-18 10:02:15.555611
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-18 10:02:15.557892	2011-02-18 10:02:15.557892
7	invoicing_seller_name	--- Fairleads\n	2011-02-18 10:02:15.560102	2011-02-18 10:02:15.560102
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-18 10:02:15.562249	2011-02-18 10:02:15.562249
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-18 10:02:15.564628	2011-02-18 10:02:15.564628
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-18 10:02:15.566804	2011-02-18 10:02:15.566804
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
1	blazejek@gmail.com	92417b467d73f5deef6fbf41a1260479311160c35cb9f975ee70d5f1a5dbc36cc07d8ccf95c75bb720e7b4d941fe9d8d6e6adf71828d876ac0b8398ea7ed47e3	xh5DZxMpQZa6eMDt-uyE	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-18 10:02:16.158391	2011-02-18 10:02:16.013513	\N	2011-02-18 10:02:16.018487	2011-02-18 10:02:16.158702	1	Theodora	Kihn	824-777-3845 x8971	root	Hammes Tunnel	Koelpinland	01843	Kent	1	\N	\N	\N	\N	0	\N	\N	\N	\N	6l9wfcfhl1DJQSXQf0OC5LcUoqWwdzlKTVbhuPSrfp8oVbVYMoFduRbBKXJ2xH	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	65701fe62a8151a33b52e048de0d7a78a7d60efcf8c340881b42b451fa023b42bb61f6be4d699ae027335f27682c56a91bc61bef29e9348f5e5c759577c7e6e3	Y1p2Pps0KCT6yBTsQQRG	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-18 10:02:16.547282	2011-02-18 10:02:16.521695	\N	2011-02-18 10:02:16.523906	2011-02-18 10:02:16.547599	2	Zella129802333651291	Corwin	1-945-811-1566 x0778	Florence Morissette129802333651254	Missouri Isle	Marianneborough	25809	County Fermanagh	1	\N	0	\N	\N	0	\N	\N	\N	\N	Ity7NqELnyuXWnVtVDERqPPsxTyfeToGtRQ6bkTBdZ3QwDeIXXMsEXZr2l1AKQ	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	573a4ba8d9d2a896e0ab1e6a76e84a4821e86787f9de9721974ff34c21ca01792ecf517f16297dc75a3803aabe39576ffff9c8306d3b4fb4d5ec620c01113db9	h82logO6T49CFGcgTyjw	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-18 10:02:17.430625	2011-02-18 10:02:17.407055	\N	2011-02-18 10:02:17.408877	2011-02-18 10:02:17.430924	1	Fidel	Thompson	348.867.1787 x10926	Ali Jones129802333725703	Feest Shoals	Lessieville	84292	Suffolk	1	\N	\N	\N	\N	0	\N	\N	\N	\N	GDq0p10uggmIl2Z03uCGETZf0ZevSW20OOVTncVIKI28GqwVZHzc2xn08DX0BV	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	0b8632e79b2d5c6221cb3232e8ac8c2851f2e6885d68f0855933486fd2cb83957317df8b57a825cf4641fdcc46778f8379865539159bc0f418174fcbf6e34689	Ji13eIdPn4w7_sYYspC2	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-18 10:02:17.495276	2011-02-18 10:02:17.469443	\N	2011-02-18 10:02:17.471371	2011-02-18 10:02:17.4958	48	Lowell	Hintz	(101)367-8721	Orland Pouros129802333746284	Arielle Loaf	Pfannerstillland	47119-0374	West Midlands	1	\N	\N	\N	\N	0	\N	\N	\N	\N	PrTwtVJk7KO5xAiNpBjeQHocyMv5dhMXX3Db5hDlI97863jThq2NQwhmrCHZ9e	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	88508a2532b4fccf8d87de53c4fab32fcef3d400c27bba1758dace0cbc2399fe0efa6ffeca95a61fc9529343d755eb04dd8b2d699333b26198a6dcc15f2e8445	dFgr0tRIA9XUgu2Snmc8	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-18 10:02:17.558361	2011-02-18 10:02:17.533256	\N	2011-02-18 10:02:17.535233	2011-02-18 10:02:17.574266	64	Rosa	Ledner	502-696-1712 x9282	Clare Jerde129802333752732	Chance Street	Berthaberg	87510	Bedfordshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	VhZNnp3t4ZedKHO7jmKax0bxqBEl8g2qNyZujAkUoFnERMGrsxW8pAmE9hYB3A	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

