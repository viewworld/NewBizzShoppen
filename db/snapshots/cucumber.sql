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

SELECT pg_catalog.setval('addresses_id_seq', 6, true);


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

SELECT pg_catalog.setval('countries_id_seq', 2, true);


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
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY addresses (id, address_line_1, address_line_2, address_line_3, zip_code, country_id, addressable_type, addressable_id, created_at, updated_at) FROM stdin;
1	Jenkins Summit	West Penelope	Lancashire	51880	1	BankAccount	1	2011-02-21 08:55:02.084987	2011-02-21 08:55:02.113046
2	Senger Highway	New Abigale	Somerset	21941	1	Seller	1	2011-02-21 08:55:02.13307	2011-02-21 08:55:02.151781
3	Botsford Village	Pfannerstillmouth	Lancashire	27497	1	User::Admin	1	2011-02-21 08:55:02.59367	2011-02-21 08:55:02.714257
4	Reilly View	East Filibertoland	Bedfordshire	53224	1	User::Agent	2	2011-02-21 08:55:03.101972	2011-02-21 08:55:03.157413
5	Jarod Mountain	Deangeloview	County Antrim	46973-9307	1	User::Admin	3	2011-02-21 08:55:03.911276	2011-02-21 08:55:03.950677
6	Aimee Ports	Claudieton	Tyne and Wear	57847	1	User::Customer	4	2011-02-21 08:55:04.020083	2011-02-21 08:55:04.066747
\.


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-21 08:55:04.341256	2011-02-21 08:55:04.341256
2	1	en	About us	About us	2011-02-21 08:55:04.362655	2011-02-21 08:55:04.362655
3	2	dk	Privacy	Privacy	2011-02-21 08:55:04.414883	2011-02-21 08:55:04.414883
4	2	en	Privacy	Privacy	2011-02-21 08:55:04.433744	2011-02-21 08:55:04.433744
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-21 08:55:04.483698	2011-02-21 08:55:04.483698
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-21 08:55:04.504076	2011-02-21 08:55:04.504076
7	4	dk	Blurb sign up	Blurb sign up	2011-02-21 08:55:04.556616	2011-02-21 08:55:04.556616
8	4	en	Blurb sign up	Blurb sign up	2011-02-21 08:55:04.574619	2011-02-21 08:55:04.574619
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-21 08:55:04.623899	2011-02-21 08:55:04.623899
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-21 08:55:04.650832	2011-02-21 08:55:04.650832
11	6	dk	Blurb agent home	Blurb agent home	2011-02-21 08:55:04.701527	2011-02-21 08:55:04.701527
12	6	en	Blurb agent home	Blurb agent home	2011-02-21 08:55:04.718745	2011-02-21 08:55:04.718745
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-21 08:55:04.769171	2011-02-21 08:55:04.769171
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-21 08:55:04.789658	2011-02-21 08:55:04.789658
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-21 08:55:04.833555	2011-02-21 08:55:04.833555
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-21 08:55:04.8558	2011-02-21 08:55:04.8558
17	9	dk	Blurb currencies	Blurb currencies	2011-02-21 08:55:04.911312	2011-02-21 08:55:04.911312
18	9	en	Blurb currencies	Blurb currencies	2011-02-21 08:55:04.929095	2011-02-21 08:55:04.929095
19	10	dk	Blurb category home	Blurb category home	2011-02-21 08:55:04.980343	2011-02-21 08:55:04.980343
20	10	en	Blurb category home	Blurb category home	2011-02-21 08:55:04.997291	2011-02-21 08:55:04.997291
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-21 08:55:05.048496	2011-02-21 08:55:05.048496
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-21 08:55:05.068555	2011-02-21 08:55:05.068555
23	12	dk	Reset password	Reset password	2011-02-21 08:55:05.123549	2011-02-21 08:55:05.123549
24	12	en	Reset password	Reset password	2011-02-21 08:55:05.147127	2011-02-21 08:55:05.147127
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id, views_count) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-21 08:55:04.330219	2011-02-21 08:55:04.369275	about_us	t	2011-02-21 08:55:04.36916	\N	\N	0
2	Article::Cms::MainPageArticle	2011-02-21 08:55:04.40954	2011-02-21 08:55:04.439231	privacy	t	2011-02-21 08:55:04.439119	\N	\N	0
3	Article::Cms::MainPageArticle	2011-02-21 08:55:04.477468	2011-02-21 08:55:04.509756	terms_conditions	t	2011-02-21 08:55:04.509639	\N	\N	0
4	Article::Cms::InterfaceContentText	2011-02-21 08:55:04.546658	2011-02-21 08:55:04.581306	blurb_sign_up	t	2011-02-21 08:55:04.581193	\N	\N	0
5	Article::Cms::InterfaceContentText	2011-02-21 08:55:04.617418	2011-02-21 08:55:04.658848	blurb_buyer_home	t	2011-02-21 08:55:04.658723	\N	\N	0
6	Article::Cms::InterfaceContentText	2011-02-21 08:55:04.69548	2011-02-21 08:55:04.724278	blurb_agent_home	t	2011-02-21 08:55:04.724183	\N	\N	0
7	Article::Cms::InterfaceContentText	2011-02-21 08:55:04.763642	2011-02-21 08:55:04.795117	blurb_purchase_manager_home	t	2011-02-21 08:55:04.794999	\N	\N	0
8	Article::Cms::InterfaceContentText	2011-02-21 08:55:04.827986	2011-02-21 08:55:04.863746	blurb_start_page_role_selection	t	2011-02-21 08:55:04.86363	\N	\N	0
9	Article::Cms::InterfaceContentText	2011-02-21 08:55:04.903281	2011-02-21 08:55:04.935708	blurb_currencies	t	2011-02-21 08:55:04.93558	\N	\N	0
10	Article::Cms::InterfaceContentText	2011-02-21 08:55:04.975027	2011-02-21 08:55:05.00259	blurb_category_home	t	2011-02-21 08:55:05.002486	\N	\N	0
11	Article::Cms::InterfaceContentText	2011-02-21 08:55:05.042069	2011-02-21 08:55:05.073873	blurb_leads_listing	t	2011-02-21 08:55:05.073776	\N	\N	0
12	Article::Cms::HelpPopup	2011-02-21 08:55:05.115998	2011-02-21 08:55:05.153645	reset_password	t	2011-02-21 08:55:05.153542	\N	\N	0
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
1	Default Bank	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-21 08:55:02.108275	2011-02-21 08:55:02.108275	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Quod aut maiores animi illo est eum et.Repudiandae sed esse quia animi.	2011-02-21 08:55:02.901738	2011-02-21 08:55:02.901738	\N	1	2	\N	0	electronics	f	0
2	Leisure	Ut et ut omnis odit aut quia quos.Et cumque consequatur dolores in architecto ratione dolorum.	2011-02-21 08:55:02.966719	2011-02-21 08:55:02.966719	\N	3	4	\N	0	leisure	f	0
3	Business	Beatae quibusdam ea et quia et corporis.Assumenda aut aut qui.	2011-02-21 08:55:03.024725	2011-02-21 08:55:03.826424	\N	5	6	\N	7	business	f	7
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
1	1	en	Quod aut maiores animi illo est eum et.Repudiandae sed esse quia animi.	Electronics	2011-02-21 08:55:02.912758	2011-02-21 08:55:02.912758
2	1	dk	\N	Electronics	2011-02-21 08:55:02.951213	2011-02-21 08:55:02.951213
3	2	en	Ut et ut omnis odit aut quia quos.Et cumque consequatur dolores in architecto ratione dolorum.	Leisure	2011-02-21 08:55:02.97209	2011-02-21 08:55:02.97209
4	2	dk	\N	Leisure	2011-02-21 08:55:03.004609	2011-02-21 08:55:03.004609
5	3	en	Beatae quibusdam ea et quia et corporis.Assumenda aut aut qui.	Business	2011-02-21 08:55:03.030265	2011-02-21 08:55:03.030265
6	3	dk	\N	Business	2011-02-21 08:55:03.059985	2011-02-21 08:55:03.059985
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-21 08:55:02.057915	2011-02-21 08:55:02.057915
2	United Kingdom	2011-02-21 08:55:02.06624	2011-02-21 08:55:02.06624
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
1	AUD	A &#36;	%u%n	f	2011-02-21 08:55:02.744091	2011-02-21 08:55:02.744091
2	CAD	C &#36;	%u%n	f	2011-02-21 08:55:02.752062	2011-02-21 08:55:02.752062
3	EUR	&euro;	%u%n	t	2011-02-21 08:55:02.757004	2011-02-21 08:55:02.757004
4	GBP	&pound;	%u%n	f	2011-02-21 08:55:02.7619	2011-02-21 08:55:02.7619
5	JPY	&yen;	%u%n	f	2011-02-21 08:55:02.767954	2011-02-21 08:55:02.767954
6	USD	&#36;	%u%n	f	2011-02-21 08:55:02.774414	2011-02-21 08:55:02.774414
7	NZD	&#36;	%u%n	f	2011-02-21 08:55:02.780042	2011-02-21 08:55:02.780042
8	CHF	CHF	%u %n	f	2011-02-21 08:55:02.785753	2011-02-21 08:55:02.785753
9	HKD	&#36;	%u%n	f	2011-02-21 08:55:02.792477	2011-02-21 08:55:02.792477
10	SGD	&#36;	%u%n	f	2011-02-21 08:55:02.798733	2011-02-21 08:55:02.798733
11	SEK	SEK	%u %n	f	2011-02-21 08:55:02.804221	2011-02-21 08:55:02.804221
12	DKK	DKK	%u %n	t	2011-02-21 08:55:02.80972	2011-02-21 08:55:02.80972
13	PLN	PLN	%u %n	t	2011-02-21 08:55:02.816115	2011-02-21 08:55:02.816115
14	NOK	NOK	%u %n	f	2011-02-21 08:55:02.822559	2011-02-21 08:55:02.822559
15	HUF	HUF	%u %n	f	2011-02-21 08:55:02.829371	2011-02-21 08:55:02.829371
16	CZK	CZK	%u %n	f	2011-02-21 08:55:02.837193	2011-02-21 08:55:02.837193
17	ILS	ILS	%u %n	f	2011-02-21 08:55:02.843662	2011-02-21 08:55:02.843662
18	MXN	MXN	%u %n	f	2011-02-21 08:55:02.849967	2011-02-21 08:55:02.849967
19	PHP	PHP	%u %n	f	2011-02-21 08:55:02.855633	2011-02-21 08:55:02.855633
20	TWD	TWD	%u %n	f	2011-02-21 08:55:02.861217	2011-02-21 08:55:02.861217
21	THB	THB	%u %n	f	2011-02-21 08:55:02.867493	2011-02-21 08:55:02.867493
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-21 08:55:02.189012	2011-02-21 08:55:02.189012
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-21 08:55:02.213721	2011-02-21 08:55:02.213721
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-21 08:55:02.235478	2011-02-21 08:55:02.235478
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-21 08:55:02.253163	2011-02-21 08:55:02.253163
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-21 08:55:02.270918	2011-02-21 08:55:02.270918
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-21 08:55:02.297715	2011-02-21 08:55:02.297715
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-21 08:55:02.32874	2011-02-21 08:55:02.32874
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-21 08:55:02.345729	2011-02-21 08:55:02.345729
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-21 08:55:02.367565	2011-02-21 08:55:02.367565
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-21 08:55:02.386429	2011-02-21 08:55:02.386429
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-21 08:55:02.406064	2011-02-21 08:55:02.406064
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-21 08:55:02.427845	2011-02-21 08:55:02.427845
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-21 08:55:02.446757	2011-02-21 08:55:02.446757
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-21 08:55:02.465783	2011-02-21 08:55:02.465783
15	8	en	<p></p>	Question	2011-02-21 08:55:02.485475	2011-02-21 08:55:02.485475
16	8	dk	<p></p>	[DK] Question	2011-02-21 08:55:02.502518	2011-02-21 08:55:02.502518
17	9	en	<p></p>	Invoice	2011-02-21 08:55:02.520897	2011-02-21 08:55:02.520897
18	9	dk	<p></p>	[DK] Invoice	2011-02-21 08:55:02.539463	2011-02-21 08:55:02.539463
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-21 08:55:02.17821	2011-02-21 08:55:02.208576
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-21 08:55:02.228439	2011-02-21 08:55:02.248241
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-21 08:55:02.265438	2011-02-21 08:55:02.289092
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-21 08:55:02.322789	2011-02-21 08:55:02.340649
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-21 08:55:02.360505	2011-02-21 08:55:02.381001
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-21 08:55:02.399821	2011-02-21 08:55:02.421572
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-21 08:55:02.440882	2011-02-21 08:55:02.460203
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-21 08:55:02.479293	2011-02-21 08:55:02.497585
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-21 08:55:02.515194	2011-02-21 08:55:02.533779
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

COPY lead_translations (id, lead_id, locale, header, hidden_description, description, created_at, updated_at) FROM stdin;
1	1	dk	Big deal on printers	Nesciunt facilis eius id odio in.Quia omnis ex et.	Minus cum occaecati et dolor neque esse natus ad.Doloremque non laborum quos necessitatibus quasi expedita qui non.	2011-02-21 08:55:03.271949	2011-02-21 08:55:03.271949
2	2	dk	Drills required	Nostrum eum nam distinctio optio cupiditate.Cupiditate facilis ad quas consequatur eveniet.	Est mollitia est enim eum repudiandae et sit.Ut libero delectus est qui debitis pariatur ea.	2011-02-21 08:55:03.369826	2011-02-21 08:55:03.369826
3	3	dk	Need assistance in selling a car	Error praesentium nobis corrupti explicabo est et.Mollitia error ad aut.	Quas tempora reiciendis accusamus temporibus consequatur amet in ullam.Quia beatae quibusdam fugiat quos amet ut.	2011-02-21 08:55:03.466446	2011-02-21 08:55:03.466446
4	4	dk	Ipod shipment	Et et ex sed accusamus.Fugiat quasi ipsam maxime.	Sint exercitationem hic tenetur excepturi odit nulla est.Non rerum odit eaque eum architecto.	2011-02-21 08:55:03.557498	2011-02-21 08:55:03.557498
5	5	dk	Trip to amazonia - looking for offer	Officia unde possimus quia facere ut ea rerum enim.Sint autem labore laudantium vero totam minima beatae.	Neque soluta et quis dolorem.Nisi perspiciatis harum dolores voluptas animi corporis.	2011-02-21 08:55:03.652703	2011-02-21 08:55:03.652703
6	6	dk	LCD - Huge amounts	Atque ad qui error omnis qui et est.Ab iste sit porro.	Sit qui dolor suscipit vel quos molestias ea aspernatur.Perferendis necessitatibus non et eaque et dolore adipisci.	2011-02-21 08:55:03.742066	2011-02-21 08:55:03.742066
7	7	dk	GPS receivers required	In ea qui modi voluptas quisquam dolorem dolorum.Et dolor maiores perferendis et ut incidunt et.	Quasi sit doloribus fugiat provident dicta aspernatur.Praesentium aut impedit est officia aliquid.	2011-02-21 08:55:03.835641	2011-02-21 08:55:03.835641
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Minus cum occaecati et dolor neque esse natus ad.Doloremque non laborum quos necessitatibus quasi expedita qui non.	Nesciunt facilis eius id odio in.Quia omnis ex et.	2	User::Agent	0	350.0	938.0	1	Hammes	George Schmitt	(288)396-1711 x486	carole@friesenrunolfsson.us	2011-02-21 08:55:03.220585	2011-02-21 08:55:03.220585	2011-02-26	Kavon129827850309926 Lynch	1	t	\N	0	0	f	f	-1	3	2011-02-21 08:55:03.2321	\N	\N	276 Quigley Shores	\N	\N	West Agnes	10861-9411	South Glamorgan	\N	\N	\N	\N	t
2	Drills required	3	Est mollitia est enim eum repudiandae et sit.Ut libero delectus est qui debitis pariatur ea.	Nostrum eum nam distinctio optio cupiditate.Cupiditate facilis ad quas consequatur eveniet.	2	User::Agent	0	71.0	742.0	1	Pacocha	Damion Halvorson	(931)336-9660	jeffry_gottlieb@pfannerstill.us	2011-02-21 08:55:03.324401	2011-02-21 08:55:03.324401	2011-02-26	Kavon129827850309926 Lynch	1	t	\N	0	0	f	f	-1	3	2011-02-21 08:55:03.334114	\N	\N	538 Vanessa Motorway	\N	\N	New Jaynefurt	56569-5388	Staffordshire	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Quas tempora reiciendis accusamus temporibus consequatur amet in ullam.Quia beatae quibusdam fugiat quos amet ut.	Error praesentium nobis corrupti explicabo est et.Mollitia error ad aut.	2	User::Agent	0	918.0	165.0	1	Bode	Helen Veum	347-273-3273 x405	eloise_prosacco@dickinsonward.ca	2011-02-21 08:55:03.424577	2011-02-21 08:55:03.424577	2011-02-26	Kavon129827850309926 Lynch	1	t	\N	0	0	f	f	-1	3	2011-02-21 08:55:03.432683	\N	\N	2983 Grace Station	\N	\N	Marianshire	52799-9160	Tyne and Wear	\N	\N	\N	\N	t
4	Ipod shipment	3	Sint exercitationem hic tenetur excepturi odit nulla est.Non rerum odit eaque eum architecto.	Et et ex sed accusamus.Fugiat quasi ipsam maxime.	2	User::Agent	0	360.0	238.0	1	Hahnbergnaum	Ms. Gus White	974.087.1551 x538	esteban@walker.biz	2011-02-21 08:55:03.515424	2011-02-21 08:55:03.515424	2011-02-26	Kavon129827850309926 Lynch	1	t	\N	0	0	f	f	-1	3	2011-02-21 08:55:03.523498	\N	\N	2049 Cummerata Courts	\N	\N	Port Gust	89292	Herefordshire	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Neque soluta et quis dolorem.Nisi perspiciatis harum dolores voluptas animi corporis.	Officia unde possimus quia facere ut ea rerum enim.Sint autem labore laudantium vero totam minima beatae.	2	User::Agent	0	771.0	625.0	1	Denesikschumm	Nathan Rowe	(902)710-2349 x991	melody_cartwright@grady.biz	2011-02-21 08:55:03.60484	2011-02-21 08:55:03.60484	2011-02-26	Kavon129827850309926 Lynch	1	t	\N	0	0	f	f	-1	3	2011-02-21 08:55:03.614192	\N	\N	055 Ines Underpass	\N	\N	South Vitastad	79756	Dumfries and Galloway	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Sit qui dolor suscipit vel quos molestias ea aspernatur.Perferendis necessitatibus non et eaque et dolore adipisci.	Atque ad qui error omnis qui et est.Ab iste sit porro.	2	User::Agent	0	617.0	659.0	1	Jastebert	Johnathan Gusikowski	621.928.2636	paxton_rolfson@wunsch.name	2011-02-21 08:55:03.700147	2011-02-21 08:55:03.700147	2011-02-26	Kavon129827850309926 Lynch	1	t	\N	0	0	f	f	-1	3	2011-02-21 08:55:03.708323	\N	\N	380 Gaylord Square	\N	\N	Haleystad	76176	Dyfed	\N	\N	\N	\N	t
7	GPS receivers required	3	Quasi sit doloribus fugiat provident dicta aspernatur.Praesentium aut impedit est officia aliquid.	In ea qui modi voluptas quisquam dolorem dolorum.Et dolor maiores perferendis et ut incidunt et.	2	User::Agent	0	636.0	400.0	1	Crooks	Randi Christiansen PhD	511.125.2223 x245	wilson@faheygutkowski.name	2011-02-21 08:55:03.792778	2011-02-21 08:55:03.792778	2011-02-26	Kavon129827850309926 Lynch	1	t	\N	0	0	f	f	-1	3	2011-02-21 08:55:03.801167	\N	\N	621 Donnie Roads	\N	\N	Hardybury	94030-2240	Suffolk	\N	\N	\N	\N	t
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
1	Default Seller	111	Change	Change	t	2011-02-21 08:55:02.147111	2011-02-21 08:55:02.147111
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2011-02-21 08:55:01.968776	2011-02-21 08:55:01.968776
2	default_leads_per_page	--- 5\n	2011-02-21 08:55:01.978974	2011-02-21 08:55:01.978974
3	certification_level_1	--- 10\n	2011-02-21 08:55:01.987377	2011-02-21 08:55:01.987377
4	certification_level_2	--- 20\n	2011-02-21 08:55:01.995618	2011-02-21 08:55:01.995618
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-21 08:55:02.001413	2011-02-21 08:55:02.001413
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-21 08:55:02.007982	2011-02-21 08:55:02.007982
7	invoicing_seller_name	--- Fairleads\n	2011-02-21 08:55:02.014944	2011-02-21 08:55:02.014944
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-21 08:55:02.021933	2011-02-21 08:55:02.021933
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-21 08:55:02.028688	2011-02-21 08:55:02.028688
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-21 08:55:02.036292	2011-02-21 08:55:02.036292
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
1	blazejek@gmail.com	eed6bfae006185b54167470015e6e8c49e2a0a320a80a7c2fcde7a904be1cb0458cb0ce6edafe259053e06e4005c85262a5efa70cb020496a02731ed5a89f34b	nNIch0dOc1pyeiK1PXy4	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-21 08:55:02.721012	2011-02-21 08:55:02.606588	\N	2011-02-21 08:55:02.612206	2011-02-21 08:55:02.721495	1	Duncan	Buckridge	1-734-734-5515 x5493	root	\N	\N	\N	\N	0	\N	\N	\N	\N	AGNSEkOl2mMCNYJyiby3GU3ETkssQAxkTfP0MAO1ppt37mFTKtVcHAsntZ8aOH	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	184f371cf9b2f0caec39776e67631467abd28902cd53eadfa0b57bda35a6b3b1ebb9fec68e20b66f4b38fbb1567063f567541ccc246741c2e4467d0818b3d3be	riTxAQi8XLh5QaVGt4b-	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-21 08:55:03.16727	2011-02-21 08:55:03.114871	\N	2011-02-21 08:55:03.120675	2011-02-21 08:55:03.167735	2	Kavon129827850309926	Lynch	(610)674-3655 x33695	Phoebe Hoppe12982785030991	\N	0	\N	\N	0	\N	\N	\N	\N	xKtDslQPGQxEydjcFxqw9wdd9V3ReiCrAvsx0cJ4D9OyvCxkrOIBybCMxulrlU	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	c40c1f183302d5d3c378e59973b187420f824cc03f9fb7da2519662be306b5f52a0a3cd1070ec2ea35e1674c75c79000780f54dcf8d6522f5b9a87afbfd36ccb	O2igW8frBKXT0srisTHZ	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-21 08:55:03.95764	2011-02-21 08:55:03.923234	\N	2011-02-21 08:55:03.928649	2011-02-21 08:55:03.958173	1	Heber	Hartmann	752-209-7761	Melody Mosciski129827850390839	\N	\N	\N	\N	0	\N	\N	\N	\N	reCKPJFyMGdveHOLxQuUIxp87luU7Bt0HxoCBUa93cLe5hjlSdusTt7zc9whwi	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	19f572ddda3f549ef727bcc75643f1f75809ad561d87ae9a73e4efc4bdeb7ee2ec7b9eb7db61d7eb9e4d39c8f924bd90d3802934142c9f781b2c689be5d39fd6	QRakeUYG7CI9wORcpYpu	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-21 08:55:04.072959	2011-02-21 08:55:04.03452	\N	2011-02-21 08:55:04.041484	2011-02-21 08:55:04.073408	48	Anjali	Schaden	348.187.1815 x58734	Madisen Roberts129827850401634	\N	\N	\N	\N	0	\N	\N	\N	\N	jU7qLe10eP6hgzRnomBdPFTwqWAhnLEqjVVTgM2vQksM1cvuZJTWvEgjD1lyK2	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	989fa9fc643e77799b86ee0865e2de8facb3363bb49f9ff7c747274bf98ab7351bca74e919f0ca812ab736a0b5ef30dd463d1bedbe513736f9ced2c10a7e9725	uWh1eSuskqBGKeqY4RJN	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-21 08:55:04.163995	2011-02-21 08:55:04.123716	\N	2011-02-21 08:55:04.124076	2011-02-21 08:55:04.192986	64	Larissa	Thiel	(315)065-1270 x84985	Evert Donnelly IV129827850411781	\N	\N	4	\N	0	\N	\N	\N	\N	inM0xXyc5IpvqxFFLZgEkTG920QB4jlyydEOr8hInSQl9KkFlGLzStUBD2Hqde	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	\N	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

