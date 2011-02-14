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
1	1	dk	About us	About us	2011-02-14 10:39:31.946031	2011-02-14 10:39:31.946031
2	1	en	About us	About us	2011-02-14 10:39:31.960345	2011-02-14 10:39:31.960345
3	2	dk	Privacy	Privacy	2011-02-14 10:39:32.1286	2011-02-14 10:39:32.1286
4	2	en	Privacy	Privacy	2011-02-14 10:39:32.140179	2011-02-14 10:39:32.140179
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-14 10:39:32.172559	2011-02-14 10:39:32.172559
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-14 10:39:32.184936	2011-02-14 10:39:32.184936
7	4	dk	Blurb sign up	Blurb sign up	2011-02-14 10:39:32.21987	2011-02-14 10:39:32.21987
8	4	en	Blurb sign up	Blurb sign up	2011-02-14 10:39:32.231279	2011-02-14 10:39:32.231279
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-14 10:39:32.259788	2011-02-14 10:39:32.259788
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-14 10:39:32.271413	2011-02-14 10:39:32.271413
11	6	dk	Blurb agent home	Blurb agent home	2011-02-14 10:39:32.301239	2011-02-14 10:39:32.301239
12	6	en	Blurb agent home	Blurb agent home	2011-02-14 10:39:32.313448	2011-02-14 10:39:32.313448
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-14 10:39:32.342526	2011-02-14 10:39:32.342526
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-14 10:39:32.354523	2011-02-14 10:39:32.354523
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-14 10:39:32.383632	2011-02-14 10:39:32.383632
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-14 10:39:32.395548	2011-02-14 10:39:32.395548
17	9	dk	Blurb currencies	Blurb currencies	2011-02-14 10:39:32.424545	2011-02-14 10:39:32.424545
18	9	en	Blurb currencies	Blurb currencies	2011-02-14 10:39:32.436322	2011-02-14 10:39:32.436322
19	10	dk	Blurb category home	Blurb category home	2011-02-14 10:39:32.619437	2011-02-14 10:39:32.619437
20	10	en	Blurb category home	Blurb category home	2011-02-14 10:39:32.631014	2011-02-14 10:39:32.631014
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-14 10:39:32.659055	2011-02-14 10:39:32.659055
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-14 10:39:32.670444	2011-02-14 10:39:32.670444
23	12	dk	Reset password	Reset password	2011-02-14 10:39:32.706338	2011-02-14 10:39:32.706338
24	12	en	Reset password	Reset password	2011-02-14 10:39:32.718002	2011-02-14 10:39:32.718002
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id, views_count) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-14 10:39:31.937207	2011-02-14 10:39:31.963088	about_us	t	2011-02-14 10:39:31.963018	\N	\N	0
2	Article::Cms::MainPageArticle	2011-02-14 10:39:32.124474	2011-02-14 10:39:32.142909	privacy	t	2011-02-14 10:39:32.142836	\N	\N	0
3	Article::Cms::MainPageArticle	2011-02-14 10:39:32.167321	2011-02-14 10:39:32.187701	terms_conditions	t	2011-02-14 10:39:32.18763	\N	\N	0
4	Article::Cms::InterfaceContentText	2011-02-14 10:39:32.214032	2011-02-14 10:39:32.234219	blurb_sign_up	t	2011-02-14 10:39:32.234141	\N	\N	0
5	Article::Cms::InterfaceContentText	2011-02-14 10:39:32.255561	2011-02-14 10:39:32.274369	blurb_buyer_home	t	2011-02-14 10:39:32.274293	\N	\N	0
6	Article::Cms::InterfaceContentText	2011-02-14 10:39:32.296877	2011-02-14 10:39:32.316276	blurb_agent_home	t	2011-02-14 10:39:32.316197	\N	\N	0
7	Article::Cms::InterfaceContentText	2011-02-14 10:39:32.3382	2011-02-14 10:39:32.357339	blurb_purchase_manager_home	t	2011-02-14 10:39:32.357264	\N	\N	0
8	Article::Cms::InterfaceContentText	2011-02-14 10:39:32.379238	2011-02-14 10:39:32.398527	blurb_start_page_role_selection	t	2011-02-14 10:39:32.398455	\N	\N	0
9	Article::Cms::InterfaceContentText	2011-02-14 10:39:32.420282	2011-02-14 10:39:32.439116	blurb_currencies	t	2011-02-14 10:39:32.439041	\N	\N	0
10	Article::Cms::InterfaceContentText	2011-02-14 10:39:32.615037	2011-02-14 10:39:32.633845	blurb_category_home	t	2011-02-14 10:39:32.633769	\N	\N	0
11	Article::Cms::InterfaceContentText	2011-02-14 10:39:32.655005	2011-02-14 10:39:32.673619	blurb_leads_listing	t	2011-02-14 10:39:32.673531	\N	\N	0
12	Article::Cms::HelpPopup	2011-02-14 10:39:32.700515	2011-02-14 10:39:32.720787	reset_password	t	2011-02-14 10:39:32.720705	\N	\N	0
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-14 10:39:29.967048	2011-02-14 10:39:29.967048	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Et laudantium officiis qui.A consequuntur incidunt accusantium ab aut soluta ducimus rem.	2011-02-14 10:39:30.542171	2011-02-14 10:39:30.542171	\N	1	2	\N	0	electronics	f	0
2	Leisure	Eaque nisi et autem amet nam nostrum.Eaque recusandae illo quam laboriosam ut eveniet et similique.	2011-02-14 10:39:30.588271	2011-02-14 10:39:30.588271	\N	3	4	\N	0	leisure	f	0
3	Business	Natus dolor suscipit nemo beatae est quae.Harum nulla nobis iste fugit velit consequuntur consequatur in.	2011-02-14 10:39:30.622895	2011-02-14 10:39:31.478432	\N	5	6	\N	7	business	f	7
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
1	1	en	Et laudantium officiis qui.A consequuntur incidunt accusantium ab aut soluta ducimus rem.	Electronics	2011-02-14 10:39:30.550934	2011-02-14 10:39:30.550934
2	1	dk	\N	Electronics	2011-02-14 10:39:30.577663	2011-02-14 10:39:30.577663
3	2	en	Eaque nisi et autem amet nam nostrum.Eaque recusandae illo quam laboriosam ut eveniet et similique.	Leisure	2011-02-14 10:39:30.592648	2011-02-14 10:39:30.592648
4	2	dk	\N	Leisure	2011-02-14 10:39:30.613037	2011-02-14 10:39:30.613037
5	3	en	Natus dolor suscipit nemo beatae est quae.Harum nulla nobis iste fugit velit consequuntur consequatur in.	Business	2011-02-14 10:39:30.627088	2011-02-14 10:39:30.627088
6	3	dk	\N	Business	2011-02-14 10:39:30.64807	2011-02-14 10:39:30.64807
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-14 10:39:29.952867	2011-02-14 10:39:29.952867
2	United Kingdom	2011-02-14 10:39:29.957767	2011-02-14 10:39:29.957767
3	Northern Ireland129767997081588	2011-02-14 10:39:30.817259	2011-02-14 10:39:30.817259
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
1	AUD	A &#36;	%u%n	f	2011-02-14 10:39:30.488731	2011-02-14 10:39:30.488731
2	CAD	C &#36;	%u%n	f	2011-02-14 10:39:30.493073	2011-02-14 10:39:30.493073
3	EUR	&euro;	%u%n	t	2011-02-14 10:39:30.494851	2011-02-14 10:39:30.494851
4	GBP	&pound;	%u%n	f	2011-02-14 10:39:30.496476	2011-02-14 10:39:30.496476
5	JPY	&yen;	%u%n	f	2011-02-14 10:39:30.498094	2011-02-14 10:39:30.498094
6	USD	&#36;	%u%n	f	2011-02-14 10:39:30.499853	2011-02-14 10:39:30.499853
7	NZD	&#36;	%u%n	f	2011-02-14 10:39:30.50147	2011-02-14 10:39:30.50147
8	CHF	CHF	%u %n	f	2011-02-14 10:39:30.50305	2011-02-14 10:39:30.50305
9	HKD	&#36;	%u%n	f	2011-02-14 10:39:30.504674	2011-02-14 10:39:30.504674
10	SGD	&#36;	%u%n	f	2011-02-14 10:39:30.506268	2011-02-14 10:39:30.506268
11	SEK	SEK	%u %n	f	2011-02-14 10:39:30.507954	2011-02-14 10:39:30.507954
12	DKK	DKK	%u %n	t	2011-02-14 10:39:30.509577	2011-02-14 10:39:30.509577
13	PLN	PLN	%u %n	t	2011-02-14 10:39:30.511185	2011-02-14 10:39:30.511185
14	NOK	NOK	%u %n	f	2011-02-14 10:39:30.512853	2011-02-14 10:39:30.512853
15	HUF	HUF	%u %n	f	2011-02-14 10:39:30.514586	2011-02-14 10:39:30.514586
16	CZK	CZK	%u %n	f	2011-02-14 10:39:30.516208	2011-02-14 10:39:30.516208
17	ILS	ILS	%u %n	f	2011-02-14 10:39:30.517916	2011-02-14 10:39:30.517916
18	MXN	MXN	%u %n	f	2011-02-14 10:39:30.519529	2011-02-14 10:39:30.519529
19	PHP	PHP	%u %n	f	2011-02-14 10:39:30.52111	2011-02-14 10:39:30.52111
20	TWD	TWD	%u %n	f	2011-02-14 10:39:30.522726	2011-02-14 10:39:30.522726
21	THB	THB	%u %n	f	2011-02-14 10:39:30.524316	2011-02-14 10:39:30.524316
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-14 10:39:29.998219	2011-02-14 10:39:29.998219
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-14 10:39:30.013721	2011-02-14 10:39:30.013721
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-14 10:39:30.027044	2011-02-14 10:39:30.027044
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-14 10:39:30.04113	2011-02-14 10:39:30.04113
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-14 10:39:30.054673	2011-02-14 10:39:30.054673
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-14 10:39:30.069179	2011-02-14 10:39:30.069179
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-02-14 10:39:30.082517	2011-02-14 10:39:30.082517
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-02-14 10:39:30.096331	2011-02-14 10:39:30.096331
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-14 10:39:30.109631	2011-02-14 10:39:30.109631
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-14 10:39:30.12225	2011-02-14 10:39:30.12225
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-14 10:39:30.277228	2011-02-14 10:39:30.277228
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-14 10:39:30.290761	2011-02-14 10:39:30.290761
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-14 10:39:30.303464	2011-02-14 10:39:30.303464
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-14 10:39:30.315795	2011-02-14 10:39:30.315795
15	8	en	Question	<p></p>	2011-02-14 10:39:30.328922	2011-02-14 10:39:30.328922
16	8	dk	[DK] Question	<p></p>	2011-02-14 10:39:30.341078	2011-02-14 10:39:30.341078
17	9	en	Invoice	<p></p>	2011-02-14 10:39:30.353871	2011-02-14 10:39:30.353871
18	9	dk	[DK] Invoice	<p></p>	2011-02-14 10:39:30.366016	2011-02-14 10:39:30.366016
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-14 10:39:29.989184	2011-02-14 10:39:30.009393
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-14 10:39:30.022124	2011-02-14 10:39:30.035697
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-14 10:39:30.050001	2011-02-14 10:39:30.064603
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-14 10:39:30.077826	2011-02-14 10:39:30.091257
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-14 10:39:30.104781	2011-02-14 10:39:30.117896
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-14 10:39:30.130525	2011-02-14 10:39:30.286459
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-14 10:39:30.299115	2011-02-14 10:39:30.31155
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-14 10:39:30.324104	2011-02-14 10:39:30.336972
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-14 10:39:30.349042	2011-02-14 10:39:30.361969
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
1	1	dk	Vero laboriosam qui possimus ex.Minus aliquid rem molestias et.	Nostrum nulla et dolorem quisquam natus et reiciendis consequatur.Unde harum nobis minima blanditiis aut atque illum aliquam.	Big deal on printers	2011-02-14 10:39:30.928495	2011-02-14 10:39:30.928495
2	2	dk	Repudiandae eveniet autem distinctio et totam facere et.Non quia necessitatibus voluptatem et perferendis recusandae.	Ullam est omnis eos.Similique eaque ut hic dignissimos molestiae beatae.	Drills required	2011-02-14 10:39:31.000418	2011-02-14 10:39:31.000418
3	3	dk	Nihil error dolorum quidem quo non alias et rerum.Corporis et asperiores qui enim sed et rerum tenetur.	Mollitia animi debitis culpa repudiandae dolore dolores sunt laboriosam.Deleniti quo pariatur reprehenderit.	Need assistance in selling a car	2011-02-14 10:39:31.067696	2011-02-14 10:39:31.067696
4	4	dk	Fugiat est neque facilis.Repellendus aut accusantium ut maxime iste ea.	A repellat consequatur non fuga.Blanditiis eaque saepe ad ut tempora.	Ipod shipment	2011-02-14 10:39:31.13514	2011-02-14 10:39:31.13514
5	5	dk	Est dolores facere ut numquam aut quia nostrum deserunt.Nisi et amet sequi aliquam et.	Maxime dolore facilis mollitia id qui impedit nesciunt.Fugiat molestias omnis quia.	Trip to amazonia - looking for offer	2011-02-14 10:39:31.34789	2011-02-14 10:39:31.34789
6	6	dk	Quas molestiae sequi quis aspernatur et et.Eius sit quis et nulla.	Enim itaque rerum explicabo ea possimus nam animi.Consequuntur voluptas corporis dolorum est impedit.	LCD - Huge amounts	2011-02-14 10:39:31.417072	2011-02-14 10:39:31.417072
7	7	dk	Repellat amet quisquam ut non eligendi debitis rerum.Facere reiciendis ea dolores magnam nobis.	Ut asperiores rerum molestiae.Laboriosam perferendis sequi sit asperiores cupiditate porro nam iusto.	GPS receivers required	2011-02-14 10:39:31.485531	2011-02-14 10:39:31.485531
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Vero laboriosam qui possimus ex.Minus aliquid rem molestias et.	Nostrum nulla et dolorem quisquam natus et reiciendis consequatur.Unde harum nobis minima blanditiis aut atque illum aliquam.	2	User::Agent	0	79.0	955.0	1	Torp	Mrs. Cleta Keebler	(563)445-7062	julianne.krajcik@wuckertstreich.name	2011-02-14 10:39:30.887228	2011-02-14 10:39:30.887228	2011-02-19	Austen129767997081498 Johnson	1	t	\N	0	0	f	f	-1	3	2011-02-14 10:39:30.896864	\N	\N	243 Bechtelar Mountain	\N	\N	Jaskolskiton	95114-1340	Hampshire	\N	\N	\N	\N	t
2	Drills required	3	Repudiandae eveniet autem distinctio et totam facere et.Non quia necessitatibus voluptatem et perferendis recusandae.	Ullam est omnis eos.Similique eaque ut hic dignissimos molestiae beatae.	2	User::Agent	0	864.0	541.0	1	Langworthreilly	Filomena Jakubowski DVM	119.497.5170 x4914	travis_beatty@harveystreich.ca	2011-02-14 10:39:30.967468	2011-02-14 10:39:30.967468	2011-02-19	Austen129767997081498 Johnson	1	t	\N	0	0	f	f	-1	3	2011-02-14 10:39:30.97434	\N	\N	269 Gordon Plaza	\N	\N	Lake Sigmund	30124	Gwent	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Nihil error dolorum quidem quo non alias et rerum.Corporis et asperiores qui enim sed et rerum tenetur.	Mollitia animi debitis culpa repudiandae dolore dolores sunt laboriosam.Deleniti quo pariatur reprehenderit.	2	User::Agent	0	882.0	465.0	1	Rodriguez	Aron Kunze	(521)914-7646	timmothy.mayert@lehner.co.uk	2011-02-14 10:39:31.035453	2011-02-14 10:39:31.035453	2011-02-19	Austen129767997081498 Johnson	1	t	\N	0	0	f	f	-1	3	2011-02-14 10:39:31.042547	\N	\N	28176 Huels Mews	\N	\N	Chadshire	03327	Isle of Wight	\N	\N	\N	\N	t
4	Ipod shipment	3	Fugiat est neque facilis.Repellendus aut accusantium ut maxime iste ea.	A repellat consequatur non fuga.Blanditiis eaque saepe ad ut tempora.	2	User::Agent	0	869.0	556.0	1	Durgan	Mrs. Laurel Emmerich	746-997-9494	otha.mccullough@prohaska.biz	2011-02-14 10:39:31.102824	2011-02-14 10:39:31.102824	2011-02-19	Austen129767997081498 Johnson	1	t	\N	0	0	f	f	-1	3	2011-02-14 10:39:31.109625	\N	\N	1190 Lauretta Stravenue	\N	\N	Klockoview	03619	Surrey	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Est dolores facere ut numquam aut quia nostrum deserunt.Nisi et amet sequi aliquam et.	Maxime dolore facilis mollitia id qui impedit nesciunt.Fugiat molestias omnis quia.	2	User::Agent	0	684.0	774.0	1	Dicki	Richard Fritsch	(986)860-3998 x0665	janick_okuneva@kihn.info	2011-02-14 10:39:31.314574	2011-02-14 10:39:31.314574	2011-02-19	Austen129767997081498 Johnson	1	t	\N	0	0	f	f	-1	3	2011-02-14 10:39:31.321548	\N	\N	2758 Icie Stream	\N	\N	Jacobsfort	66219-0790	Grampian	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Quas molestiae sequi quis aspernatur et et.Eius sit quis et nulla.	Enim itaque rerum explicabo ea possimus nam animi.Consequuntur voluptas corporis dolorum est impedit.	2	User::Agent	0	555.0	284.0	1	Grimes	Emelie Reinger	1-539-689-3002 x29959	anjali.nicolas@kautzertorphy.name	2011-02-14 10:39:31.384116	2011-02-14 10:39:31.384116	2011-02-19	Austen129767997081498 Johnson	1	t	\N	0	0	f	f	-1	3	2011-02-14 10:39:31.391082	\N	\N	866 Robel Glen	\N	\N	Savanahville	62283	West Midlands	\N	\N	\N	\N	t
7	GPS receivers required	3	Repellat amet quisquam ut non eligendi debitis rerum.Facere reiciendis ea dolores magnam nobis.	Ut asperiores rerum molestiae.Laboriosam perferendis sequi sit asperiores cupiditate porro nam iusto.	2	User::Agent	0	701.0	107.0	1	Bechtelar	Oscar Fay	1-454-555-6281	bell@jewess.info	2011-02-14 10:39:31.452992	2011-02-14 10:39:31.452992	2011-02-19	Austen129767997081498 Johnson	1	t	\N	0	0	f	f	-1	3	2011-02-14 10:39:31.459886	\N	\N	7272 Chris Wall	\N	\N	East Elinor	61391-0917	Tyne and Wear	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-14 10:39:29.918244	2011-02-14 10:39:29.918244
2	default_leads_per_page	--- 5\n	2011-02-14 10:39:29.923982	2011-02-14 10:39:29.923982
3	certification_level_1	--- 10\n	2011-02-14 10:39:29.928026	2011-02-14 10:39:29.928026
4	certification_level_2	--- 20\n	2011-02-14 10:39:29.931202	2011-02-14 10:39:29.931202
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-14 10:39:29.933357	2011-02-14 10:39:29.933357
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-14 10:39:29.935421	2011-02-14 10:39:29.935421
7	invoicing_seller_name	--- Fairleads\n	2011-02-14 10:39:29.937741	2011-02-14 10:39:29.937741
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-14 10:39:29.939884	2011-02-14 10:39:29.939884
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-14 10:39:29.941995	2011-02-14 10:39:29.941995
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-14 10:39:29.944034	2011-02-14 10:39:29.944034
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
1	blazejek@gmail.com	2409ebae43c381386fa4ec9e5da952d8926dd67dfe4eb3101bbc171da4ec999dabd5790b1d395e4c7a043b22247a87d44a80e0bc52ad764fc293aedc9b950a7f	7EvXR--13UQRJX9ByYSV	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-14 10:39:30.473761	2011-02-14 10:39:30.40545	\N	2011-02-14 10:39:30.410293	2011-02-14 10:39:30.474209	1	Nicolette	Becker	(590)860-7255	root	O'Reilly Ports	North Brendan	74931-6928	Warwickshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	8aIlAU2bObQwLyG8NL7Gsh9hyDuonE2YUoUZxbSJNpNsx9uDbc7FywDagnI4I8	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	7dd9789754d89a328f1eef0edb1c03987ebcc5057c5f101b5025fdbdbaad4eb32958b1b10a85a1204d2170ac104b53f08a0e844072bf0067d5e89d9da97c0ae1	DX-d5wXzrkszjO-fQoFq	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-14 10:39:30.848571	2011-02-14 10:39:30.823728	\N	2011-02-14 10:39:30.82552	2011-02-14 10:39:30.848898	2	Austen129767997081498	Johnson	(620)085-3457	Kennedy Kuvalis129767997081464	Eden Fort	Kuhlmanborough	70964	Tayside	1	\N	0	\N	\N	0	\N	\N	\N	\N	PF33X9u97ccpLgt2rNStMiEgatcXKl73akMgyutEfSvrKnHq29v1lFZuOOFwnw	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	2a7e42efca441954d0e8c1c1494756944bc122cd0d9b48cbba211c9d79b86fae8cd95fac8f17d5064aabeb1acea59a906e87dd3fc93b50fee63cf98f89687ca5	xTEeWVqnc_PR5lKCs1jV	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-14 10:39:31.562894	2011-02-14 10:39:31.540504	\N	2011-02-14 10:39:31.542263	2011-02-14 10:39:31.563199	1	Jodie	Robel	1-061-319-2559	Ms. River Witting129767997153516	Collins Vista	Port Jaleel	38773-4709	Nottinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	8FK4yxXN3sPGUcinrbFVMbwDwHHciofGMdfW7I8A0p9NM68ynmvDzs3gpWBhto	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	9950677ee38475528b9a39a478d024b802b6305c0c3a25faed3dcc23d1cd23f4d997db8b299ee4e53a7176cce33e8be98531ddee3effe550efd20a1c216827af	quO0I6muLgVXNOot3Fgk	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-14 10:39:31.624277	2011-02-14 10:39:31.599848	\N	2011-02-14 10:39:31.601728	2011-02-14 10:39:31.624582	48	Rachelle	Mann	102.430.7828	Eliza Jones12976799715938	Heathcote Manor	Jessicamouth	02899	Lincolnshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	KvwLI07vWw7Caf1EiBOqkVVoCU7cw6bBROKYADEk6QE4x4e5QFG43qmXXM4kr1	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	077a5e6f0d9e45cdf389a9433f0613e8462d9e39cdce40396f851e9e3e4ca122ad7e931f5469ed5abe0106b4b62288867571df2470efa0e37e2d790683359815	x71qTaLWaBr0reD2QLTY	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-14 10:39:31.832667	2011-02-14 10:39:31.806212	\N	2011-02-14 10:39:31.808209	2011-02-14 10:39:31.848719	64	Erick	Eichmann	534.159.0277 x5368	Tamara Krajcik129767997180001	Block Trail	Port Shannatown	09396	Dorset	1	\N	\N	4	\N	0	\N	\N	\N	\N	I7zAryt6DARTtCfun0by1mqe5th89XEPfyUiEUXax47rap15N8t8oNbOHg2I20	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

