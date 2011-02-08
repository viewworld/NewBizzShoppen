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

SELECT pg_catalog.setval('currencies_id_seq', 2, true);


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
1	1	dk	About us	About us	2011-02-08 13:56:57.165795	2011-02-08 13:56:57.165795
2	1	en	About us	About us	2011-02-08 13:56:57.18036	2011-02-08 13:56:57.18036
3	2	dk	Privacy	Privacy	2011-02-08 13:56:57.211966	2011-02-08 13:56:57.211966
4	2	en	Privacy	Privacy	2011-02-08 13:56:57.368787	2011-02-08 13:56:57.368787
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-08 13:56:57.400397	2011-02-08 13:56:57.400397
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-08 13:56:57.411989	2011-02-08 13:56:57.411989
7	4	dk	Blurb sign up	Blurb sign up	2011-02-08 13:56:57.448879	2011-02-08 13:56:57.448879
8	4	en	Blurb sign up	Blurb sign up	2011-02-08 13:56:57.46145	2011-02-08 13:56:57.46145
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-08 13:56:57.490949	2011-02-08 13:56:57.490949
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-08 13:56:57.502752	2011-02-08 13:56:57.502752
11	6	dk	Blurb agent home	Blurb agent home	2011-02-08 13:56:57.533556	2011-02-08 13:56:57.533556
12	6	en	Blurb agent home	Blurb agent home	2011-02-08 13:56:57.545171	2011-02-08 13:56:57.545171
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-08 13:56:57.573818	2011-02-08 13:56:57.573818
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-08 13:56:57.585612	2011-02-08 13:56:57.585612
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-08 13:56:57.615088	2011-02-08 13:56:57.615088
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-08 13:56:57.628996	2011-02-08 13:56:57.628996
17	9	dk	Blurb currencies	Blurb currencies	2011-02-08 13:56:57.658302	2011-02-08 13:56:57.658302
18	9	en	Blurb currencies	Blurb currencies	2011-02-08 13:56:57.670275	2011-02-08 13:56:57.670275
19	10	dk	Blurb category home	Blurb category home	2011-02-08 13:56:57.69976	2011-02-08 13:56:57.69976
20	10	en	Blurb category home	Blurb category home	2011-02-08 13:56:57.711935	2011-02-08 13:56:57.711935
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-08 13:56:57.904485	2011-02-08 13:56:57.904485
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-08 13:56:57.916308	2011-02-08 13:56:57.916308
23	12	dk	Reset password	Reset password	2011-02-08 13:56:57.95396	2011-02-08 13:56:57.95396
24	12	en	Reset password	Reset password	2011-02-08 13:56:57.965741	2011-02-08 13:56:57.965741
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-08 13:56:57.157173	2011-02-08 13:56:57.183162	about_us	t	2011-02-08 13:56:57.183081	\N	\N
2	Article::Cms::MainPageArticle	2011-02-08 13:56:57.207574	2011-02-08 13:56:57.371606	privacy	t	2011-02-08 13:56:57.371529	\N	\N
3	Article::Cms::MainPageArticle	2011-02-08 13:56:57.395908	2011-02-08 13:56:57.415017	terms_conditions	t	2011-02-08 13:56:57.414933	\N	\N
4	Article::Cms::InterfaceContentText	2011-02-08 13:56:57.442863	2011-02-08 13:56:57.464626	blurb_sign_up	t	2011-02-08 13:56:57.464553	\N	\N
5	Article::Cms::InterfaceContentText	2011-02-08 13:56:57.486654	2011-02-08 13:56:57.505548	blurb_buyer_home	t	2011-02-08 13:56:57.505475	\N	\N
6	Article::Cms::InterfaceContentText	2011-02-08 13:56:57.529431	2011-02-08 13:56:57.548005	blurb_agent_home	t	2011-02-08 13:56:57.54793	\N	\N
7	Article::Cms::InterfaceContentText	2011-02-08 13:56:57.569583	2011-02-08 13:56:57.58844	blurb_purchase_manager_home	t	2011-02-08 13:56:57.588366	\N	\N
8	Article::Cms::InterfaceContentText	2011-02-08 13:56:57.610733	2011-02-08 13:56:57.631829	blurb_start_page_role_selection	t	2011-02-08 13:56:57.631756	\N	\N
9	Article::Cms::InterfaceContentText	2011-02-08 13:56:57.654059	2011-02-08 13:56:57.673401	blurb_currencies	t	2011-02-08 13:56:57.673327	\N	\N
10	Article::Cms::InterfaceContentText	2011-02-08 13:56:57.695453	2011-02-08 13:56:57.714887	blurb_category_home	t	2011-02-08 13:56:57.714816	\N	\N
11	Article::Cms::InterfaceContentText	2011-02-08 13:56:57.900091	2011-02-08 13:56:57.919195	blurb_leads_listing	t	2011-02-08 13:56:57.919117	\N	\N
12	Article::Cms::HelpPopup	2011-02-08 13:56:57.947792	2011-02-08 13:56:57.968786	reset_password	t	2011-02-08 13:56:57.968709	\N	\N
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-08 13:56:55.145362	2011-02-08 13:56:55.145362	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Voluptas aspernatur distinctio temporibus dolorem voluptas asperiores dolore.Ex soluta ullam quasi esse reprehenderit rerum est.	2011-02-08 13:56:55.679248	2011-02-08 13:56:55.679248	\N	1	2	\N	0	electronics	f	0
2	Leisure	Illo ea eaque vel libero assumenda voluptatibus culpa.In alias consequatur assumenda omnis repellendus.	2011-02-08 13:56:55.724792	2011-02-08 13:56:55.724792	\N	3	4	\N	0	leisure	f	0
3	Business	Dicta eius et maiores ducimus velit natus eveniet.Soluta voluptatem dolores rerum ullam unde officiis.	2011-02-08 13:56:55.760076	2011-02-08 13:56:56.635819	\N	5	6	\N	7	business	f	7
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
1	1	en	Voluptas aspernatur distinctio temporibus dolorem voluptas asperiores dolore.Ex soluta ullam quasi esse reprehenderit rerum est.	Electronics	2011-02-08 13:56:55.68811	2011-02-08 13:56:55.68811
2	1	dk	\N	Electronics	2011-02-08 13:56:55.714886	2011-02-08 13:56:55.714886
3	2	en	Illo ea eaque vel libero assumenda voluptatibus culpa.In alias consequatur assumenda omnis repellendus.	Leisure	2011-02-08 13:56:55.730102	2011-02-08 13:56:55.730102
4	2	dk	\N	Leisure	2011-02-08 13:56:55.750167	2011-02-08 13:56:55.750167
5	3	en	Dicta eius et maiores ducimus velit natus eveniet.Soluta voluptatem dolores rerum ullam unde officiis.	Business	2011-02-08 13:56:55.764247	2011-02-08 13:56:55.764247
6	3	dk	\N	Business	2011-02-08 13:56:55.78404	2011-02-08 13:56:55.78404
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-08 13:56:55.131573	2011-02-08 13:56:55.131573
2	United Kingdom	2011-02-08 13:56:55.136457	2011-02-08 13:56:55.136457
3	Scotland129717341581257	2011-02-08 13:56:55.813994	2011-02-08 13:56:55.813994
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
1	Euro	&euro;	%u%n	t	2011-02-08 13:56:55.657095	2011-02-08 13:56:55.657095
2	PLN	&pln;	%u%n	t	2011-02-08 13:56:55.661401	2011-02-08 13:56:55.661401
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-08 13:56:55.175602	2011-02-08 13:56:55.175602
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-08 13:56:55.190203	2011-02-08 13:56:55.190203
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-08 13:56:55.203346	2011-02-08 13:56:55.203346
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-08 13:56:55.216204	2011-02-08 13:56:55.216204
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-08 13:56:55.231068	2011-02-08 13:56:55.231068
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-08 13:56:55.244095	2011-02-08 13:56:55.244095
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-02-08 13:56:55.256999	2011-02-08 13:56:55.256999
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-02-08 13:56:55.269446	2011-02-08 13:56:55.269446
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-08 13:56:55.28247	2011-02-08 13:56:55.28247
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-08 13:56:55.295064	2011-02-08 13:56:55.295064
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-08 13:56:55.307896	2011-02-08 13:56:55.307896
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-08 13:56:55.4649	2011-02-08 13:56:55.4649
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-08 13:56:55.477296	2011-02-08 13:56:55.477296
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-08 13:56:55.489159	2011-02-08 13:56:55.489159
15	8	en	Question	<p></p>	2011-02-08 13:56:55.501387	2011-02-08 13:56:55.501387
16	8	dk	[DK] Question	<p></p>	2011-02-08 13:56:55.513204	2011-02-08 13:56:55.513204
17	9	en	Invoice	<p></p>	2011-02-08 13:56:55.525447	2011-02-08 13:56:55.525447
18	9	dk	[DK] Invoice	<p></p>	2011-02-08 13:56:55.539063	2011-02-08 13:56:55.539063
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-08 13:56:55.166499	2011-02-08 13:56:55.186117
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-08 13:56:55.198617	2011-02-08 13:56:55.211702
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-08 13:56:55.224312	2011-02-08 13:56:55.239741
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-08 13:56:55.252255	2011-02-08 13:56:55.265073
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-08 13:56:55.277802	2011-02-08 13:56:55.290645
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-08 13:56:55.303224	2011-02-08 13:56:55.46036
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-08 13:56:55.472806	2011-02-08 13:56:55.485063
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-08 13:56:55.497035	2011-02-08 13:56:55.509132
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-08 13:56:55.521115	2011-02-08 13:56:55.534751
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
1	1	dk	Sint quod praesentium doloribus nihil qui rem.Perferendis voluptatem ullam aspernatur nam consequatur vero.	Maxime quia omnis libero mollitia nobis tenetur.Quis dolores sint ipsa maiores.	Big deal on printers	2011-02-08 13:56:56.066984	2011-02-08 13:56:56.066984
2	2	dk	A ullam velit nihil provident.Est explicabo rerum aliquam omnis minima id ea.	Totam similique ducimus et.Et dolorem nesciunt et.	Drills required	2011-02-08 13:56:56.140672	2011-02-08 13:56:56.140672
3	3	dk	Occaecati beatae eius quo itaque esse.Quidem exercitationem officiis perferendis quaerat amet tempore asperiores qui.	Aut delectus laboriosam nihil consectetur enim officiis in.Placeat enim enim error optio minima incidunt aut.	Need assistance in selling a car	2011-02-08 13:56:56.208723	2011-02-08 13:56:56.208723
4	4	dk	Aut in et unde rerum sequi quod autem.Adipisci enim quam alias et dolores expedita nam ea.	Consequatur suscipit ut enim.Et aut quia in exercitationem.	Ipod shipment	2011-02-08 13:56:56.280172	2011-02-08 13:56:56.280172
5	5	dk	Placeat ut accusantium in ad eum.Minus ratione quo est rerum ut maxime nesciunt quia.	Dolorem molestiae iure tenetur architecto esse non modi.Dignissimos dolores voluptatibus suscipit tempore neque.	Trip to amazonia - looking for offer	2011-02-08 13:56:56.498069	2011-02-08 13:56:56.498069
6	6	dk	Et quis dolorem aut dolor.Dolor eius quia earum laboriosam error.	Nostrum omnis natus qui.Aliquid quia quis ut.	LCD - Huge amounts	2011-02-08 13:56:56.569088	2011-02-08 13:56:56.569088
7	7	dk	Deleniti molestiae libero quod.Expedita ratione quis sint dicta harum et et.	Ratione et ipsa ullam dolor saepe magni explicabo.Aliquid placeat explicabo pariatur ut rerum sit est minus.	GPS receivers required	2011-02-08 13:56:56.642959	2011-02-08 13:56:56.642959
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Sint quod praesentium doloribus nihil qui rem.Perferendis voluptatem ullam aspernatur nam consequatur vero.	Maxime quia omnis libero mollitia nobis tenetur.Quis dolores sint ipsa maiores.	2	User::Agent	0	939.0	726.0	1	Swaniawskizemlak	Ora Ankunding	(532)759-9140 x584	mariam_kautzer@medhurstcollier.ca	2011-02-08 13:56:56.02506	2011-02-08 13:56:56.02506	2011-02-13	Amelie129717341581182 Hansen	1	t	\N	0	0	f	f	-1	1	2011-02-08 13:56:56.035393	\N	\N	1834 Hackett Hollow	\N	\N	East Reginald	69913	Merseyside	\N	\N	\N	\N	t
2	Drills required	3	A ullam velit nihil provident.Est explicabo rerum aliquam omnis minima id ea.	Totam similique ducimus et.Et dolorem nesciunt et.	2	User::Agent	0	211.0	900.0	1	Schroeder	Kirsten Keebler	497-746-2675 x741	blanca.koss@howelldicki.co.uk	2011-02-08 13:56:56.106754	2011-02-08 13:56:56.106754	2011-02-13	Amelie129717341581182 Hansen	1	t	\N	0	0	f	f	-1	1	2011-02-08 13:56:56.113707	\N	\N	620 Marvin Ports	\N	\N	Heaneyberg	55200-4316	Somerset	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Occaecati beatae eius quo itaque esse.Quidem exercitationem officiis perferendis quaerat amet tempore asperiores qui.	Aut delectus laboriosam nihil consectetur enim officiis in.Placeat enim enim error optio minima incidunt aut.	2	User::Agent	0	886.0	390.0	1	Altenwerth	Miss Lia Zboncak	098-841-6455	norene_jaskolski@uptonfritsch.uk	2011-02-08 13:56:56.176251	2011-02-08 13:56:56.176251	2011-02-13	Amelie129717341581182 Hansen	1	t	\N	0	0	f	f	-1	1	2011-02-08 13:56:56.18323	\N	\N	6261 Schneider Roads	\N	\N	Olenhaven	47670-8821	West Sussex	\N	\N	\N	\N	t
4	Ipod shipment	3	Aut in et unde rerum sequi quod autem.Adipisci enim quam alias et dolores expedita nam ea.	Consequatur suscipit ut enim.Et aut quia in exercitationem.	2	User::Agent	0	75.0	48.0	1	Bogisich	Leonel Bailey	020.456.3037	luna@upton.co.uk	2011-02-08 13:56:56.247434	2011-02-08 13:56:56.247434	2011-02-13	Amelie129717341581182 Hansen	1	t	\N	0	0	f	f	-1	1	2011-02-08 13:56:56.254446	\N	\N	6858 Fisher Roads	\N	\N	Durgantown	43204	Rutland	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Placeat ut accusantium in ad eum.Minus ratione quo est rerum ut maxime nesciunt quia.	Dolorem molestiae iure tenetur architecto esse non modi.Dignissimos dolores voluptatibus suscipit tempore neque.	2	User::Agent	0	596.0	652.0	1	Gutmannheller	Elena O'Reilly	1-862-502-1345 x302	sherwood.ward@kuhicmcglynn.name	2011-02-08 13:56:56.464676	2011-02-08 13:56:56.464676	2011-02-13	Amelie129717341581182 Hansen	1	t	\N	0	0	f	f	-1	1	2011-02-08 13:56:56.471831	\N	\N	70517 Roslyn Vista	\N	\N	Port Jessikafurt	95908-1456	Cornwall	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Et quis dolorem aut dolor.Dolor eius quia earum laboriosam error.	Nostrum omnis natus qui.Aliquid quia quis ut.	2	User::Agent	0	404.0	319.0	1	Schuppe	Clifford Eichmann	876-003-5833 x0015	leann@littelkoelpin.biz	2011-02-08 13:56:56.535821	2011-02-08 13:56:56.535821	2011-02-13	Amelie129717341581182 Hansen	1	t	\N	0	0	f	f	-1	1	2011-02-08 13:56:56.542691	\N	\N	34120 Krajcik Plain	\N	\N	Kayceeview	40957	Oxfordshire	\N	\N	\N	\N	t
7	GPS receivers required	3	Deleniti molestiae libero quod.Expedita ratione quis sint dicta harum et et.	Ratione et ipsa ullam dolor saepe magni explicabo.Aliquid placeat explicabo pariatur ut rerum sit est minus.	2	User::Agent	0	599.0	96.0	1	Wilkinson	Garrett Harris V	293-670-5494	jennyfer_ziemann@sipes.info	2011-02-08 13:56:56.607009	2011-02-08 13:56:56.607009	2011-02-13	Amelie129717341581182 Hansen	1	t	\N	0	0	f	f	-1	1	2011-02-08 13:56:56.614258	\N	\N	8757 Margarett Plaza	\N	\N	Flavieton	38941	Clwyd	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-08 13:56:55.094345	2011-02-08 13:56:55.094345
2	default_leads_per_page	--- 5\n	2011-02-08 13:56:55.100065	2011-02-08 13:56:55.100065
3	certification_level_1	--- 10\n	2011-02-08 13:56:55.104129	2011-02-08 13:56:55.104129
4	certification_level_2	--- 20\n	2011-02-08 13:56:55.107403	2011-02-08 13:56:55.107403
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-08 13:56:55.109692	2011-02-08 13:56:55.109692
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-08 13:56:55.111833	2011-02-08 13:56:55.111833
7	invoicing_seller_name	--- Fairleads\n	2011-02-08 13:56:55.11412	2011-02-08 13:56:55.11412
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-08 13:56:55.116397	2011-02-08 13:56:55.116397
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-08 13:56:55.118687	2011-02-08 13:56:55.118687
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-08 13:56:55.120788	2011-02-08 13:56:55.120788
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
1	blazejek@gmail.com	637b880e7067446677a96ef27f4d30fbe1413450676935deee05b21b874f0e779e5864b3d99e1d776822107436377403abf522a30c964702b74c89d0e61670f8	dgqlANouEQ693QyZcUKb	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 13:56:55.646971	2011-02-08 13:56:55.57751	\N	2011-02-08 13:56:55.582195	2011-02-08 13:56:55.64728	1	Ted	Kuhic	416.517.2295 x96411	root	Dexter Village	Brandynbury	63742-3638	Gwent	1	\N	\N	\N	\N	0	\N	\N	\N	\N	tCEGLFbL6Wl51f6JHIoZzI5dyFJG2duekPuRtFOy7lOHOa2c5QLIIKY5H58Z0E	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	f38e09a01cdb63b7323eafbb1f3f7c1863698dbc2d2588e7b6929ec7f6d8613ebf2e5bb1592b50899044a6efb433941b0a2e4fd849eaf552056c05c48b3617a9	hGsI5pvvTNFFvZXxTA1v	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 13:56:55.986799	2011-02-08 13:56:55.820469	\N	2011-02-08 13:56:55.822289	2011-02-08 13:56:55.987102	2	Amelie129717341581182	Hansen	(641)127-2460 x54232	Ashleigh Bauch129717341581158	Gibson Road	Virgilborough	05235-8620	Central	1	\N	0	\N	\N	0	\N	\N	\N	\N	iJpKvlcdMFqrxFSo6URMXKO3JsTtZYsBhbxemVFYXthkbjhTJ4avUE2qwdoDbj	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	eefc3d08e9f4a854a34ff275b8025c766cbac60129efd055d27e7514a6a08bd6b94c85203c066896b63cde6ee58e55fa12ea3397060110f7e331793b32b6efdc	wpA9Qg8ZvAhm2IL8hmNA	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 13:56:56.731838	2011-02-08 13:56:56.707696	\N	2011-02-08 13:56:56.709592	2011-02-08 13:56:56.732141	1	Clinton	Gulgowski	(628)729-5336 x111	Ms. Eric Schuster129717341670163	Hassan Fort	Krisbury	55879-6827	Somerset	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Xuwd7lUtaRgjRtbU4204cZ32WjnzfCHKuYfcxZdhIsk3Soq9nrnEdLSG59RmKW	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	e109bdef4f6ecea0047c80f4cdbe0b42a50c868d7de8812414f95555373f5a05a6b872c22f20c04aaa49b0e8a1ff3aae1a7c9c38e478055bd1913ea54c6717a7	AdLLqvDf7ksUXE8D444d	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 13:56:56.792818	2011-02-08 13:56:56.76833	\N	2011-02-08 13:56:56.770074	2011-02-08 13:56:56.793126	48	Halle	Wiegand	(993)545-9192 x619	Tiana Ziemann129717341676247	Stokes Lake	West Feltonside	86050-4342	North Yorkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	1D9ojTNk8gPUsiOFsTvrERtM0xITf17FSPOkxW049nDDk4OXdYvPDC5bOHJ6KS	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	af9a6d2d51ccaa03fd662c65f07d2ba14bf973ce06eb94215ef05164da4b1da80c41faa52f7c52317fcef938f30b56ea8b886309a009a9b210510cb59be2eecc	0Ix9EBLqhgb9rPhvUpqy	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 13:56:57.009616	2011-02-08 13:56:56.983813	\N	2011-02-08 13:56:56.985694	2011-02-08 13:56:57.028623	64	Isom	Labadie	002.501.8313 x674	Hannah Boehm MD129717341697744	Kulas Crossroad	Brownport	90932	Lancashire	1	\N	\N	4	\N	0	\N	\N	\N	\N	UDhshisUxHPgXjxFL9xbsxLCTPx0fSS9Ft5m9VistmbLqW0dAdzAAXn3IczRrt	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

