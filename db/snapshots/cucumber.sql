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
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sellers_id_seq', 1, false);


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
1	1	dk	About us	About us	2011-02-11 15:45:40.957816	2011-02-11 15:45:40.957816
2	1	en	About us	About us	2011-02-11 15:45:41.313538	2011-02-11 15:45:41.313538
3	2	dk	Privacy	Privacy	2011-02-11 15:45:41.364229	2011-02-11 15:45:41.364229
4	2	en	Privacy	Privacy	2011-02-11 15:45:41.386577	2011-02-11 15:45:41.386577
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-11 15:45:41.459297	2011-02-11 15:45:41.459297
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-11 15:45:41.491135	2011-02-11 15:45:41.491135
7	4	dk	Blurb sign up	Blurb sign up	2011-02-11 15:45:41.608188	2011-02-11 15:45:41.608188
8	4	en	Blurb sign up	Blurb sign up	2011-02-11 15:45:41.628722	2011-02-11 15:45:41.628722
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-11 15:45:41.682587	2011-02-11 15:45:41.682587
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-11 15:45:41.712417	2011-02-11 15:45:41.712417
11	6	dk	Blurb agent home	Blurb agent home	2011-02-11 15:45:42.223692	2011-02-11 15:45:42.223692
12	6	en	Blurb agent home	Blurb agent home	2011-02-11 15:45:42.258789	2011-02-11 15:45:42.258789
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-11 15:45:42.307321	2011-02-11 15:45:42.307321
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-11 15:45:42.325049	2011-02-11 15:45:42.325049
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-11 15:45:42.370359	2011-02-11 15:45:42.370359
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-11 15:45:42.391051	2011-02-11 15:45:42.391051
17	9	dk	Blurb currencies	Blurb currencies	2011-02-11 15:45:42.438194	2011-02-11 15:45:42.438194
18	9	en	Blurb currencies	Blurb currencies	2011-02-11 15:45:42.481762	2011-02-11 15:45:42.481762
19	10	dk	Blurb category home	Blurb category home	2011-02-11 15:45:42.533591	2011-02-11 15:45:42.533591
20	10	en	Blurb category home	Blurb category home	2011-02-11 15:45:42.552192	2011-02-11 15:45:42.552192
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-11 15:45:42.627187	2011-02-11 15:45:42.627187
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-11 15:45:42.64559	2011-02-11 15:45:42.64559
23	12	dk	Reset password	Reset password	2011-02-11 15:45:42.767485	2011-02-11 15:45:42.767485
24	12	en	Reset password	Reset password	2011-02-11 15:45:42.938137	2011-02-11 15:45:42.938137
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id, views_count) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-11 15:45:40.930238	2011-02-11 15:45:41.319079	about_us	t	2011-02-11 15:45:41.318979	\N	\N	0
2	Article::Cms::MainPageArticle	2011-02-11 15:45:41.35859	2011-02-11 15:45:41.393255	privacy	t	2011-02-11 15:45:41.393148	\N	\N	0
3	Article::Cms::MainPageArticle	2011-02-11 15:45:41.439115	2011-02-11 15:45:41.55337	terms_conditions	t	2011-02-11 15:45:41.553226	\N	\N	0
4	Article::Cms::InterfaceContentText	2011-02-11 15:45:41.599991	2011-02-11 15:45:41.635188	blurb_sign_up	t	2011-02-11 15:45:41.635064	\N	\N	0
5	Article::Cms::InterfaceContentText	2011-02-11 15:45:41.675803	2011-02-11 15:45:41.788432	blurb_buyer_home	t	2011-02-11 15:45:41.788244	\N	\N	0
6	Article::Cms::InterfaceContentText	2011-02-11 15:45:42.218095	2011-02-11 15:45:42.265942	blurb_agent_home	t	2011-02-11 15:45:42.265793	\N	\N	0
7	Article::Cms::InterfaceContentText	2011-02-11 15:45:42.301883	2011-02-11 15:45:42.330925	blurb_purchase_manager_home	t	2011-02-11 15:45:42.330814	\N	\N	0
8	Article::Cms::InterfaceContentText	2011-02-11 15:45:42.364455	2011-02-11 15:45:42.396702	blurb_start_page_role_selection	t	2011-02-11 15:45:42.396597	\N	\N	0
9	Article::Cms::InterfaceContentText	2011-02-11 15:45:42.43149	2011-02-11 15:45:42.489571	blurb_currencies	t	2011-02-11 15:45:42.489445	\N	\N	0
10	Article::Cms::InterfaceContentText	2011-02-11 15:45:42.52731	2011-02-11 15:45:42.572161	blurb_category_home	t	2011-02-11 15:45:42.571976	\N	\N	0
11	Article::Cms::InterfaceContentText	2011-02-11 15:45:42.619587	2011-02-11 15:45:42.651549	blurb_leads_listing	t	2011-02-11 15:45:42.651396	\N	\N	0
12	Article::Cms::HelpPopup	2011-02-11 15:45:42.71324	2011-02-11 15:45:44.2188	reset_password	t	2011-02-11 15:45:44.218616	\N	\N	0
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-11 15:45:38.66809	2011-02-11 15:45:38.66809	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Doloribus aut maxime ut et odit saepe.Cum omnis qui ipsa fuga a.	2011-02-11 15:45:39.429646	2011-02-11 15:45:39.429646	\N	1	2	\N	0	electronics	f	0
2	Leisure	Qui ab et debitis et laboriosam voluptas doloribus neque.Natus ipsam a sit minus aut officiis omnis.	2011-02-11 15:45:39.503285	2011-02-11 15:45:39.503285	\N	3	4	\N	0	leisure	f	0
3	Business	Nostrum incidunt occaecati eos est illo ea est.Non recusandae possimus ut minus.	2011-02-11 15:45:39.557128	2011-02-11 15:45:40.406884	\N	5	6	\N	7	business	f	7
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
1	1	en	Doloribus aut maxime ut et odit saepe.Cum omnis qui ipsa fuga a.	Electronics	2011-02-11 15:45:39.445563	2011-02-11 15:45:39.445563
2	1	dk	\N	Electronics	2011-02-11 15:45:39.487456	2011-02-11 15:45:39.487456
3	2	en	Qui ab et debitis et laboriosam voluptas doloribus neque.Natus ipsam a sit minus aut officiis omnis.	Leisure	2011-02-11 15:45:39.508862	2011-02-11 15:45:39.508862
4	2	dk	\N	Leisure	2011-02-11 15:45:39.540699	2011-02-11 15:45:39.540699
5	3	en	Nostrum incidunt occaecati eos est illo ea est.Non recusandae possimus ut minus.	Business	2011-02-11 15:45:39.562597	2011-02-11 15:45:39.562597
6	3	dk	\N	Business	2011-02-11 15:45:39.592141	2011-02-11 15:45:39.592141
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-11 15:45:38.639587	2011-02-11 15:45:38.639587
2	United Kingdom	2011-02-11 15:45:38.650407	2011-02-11 15:45:38.650407
3	Wales129743913963199	2011-02-11 15:45:39.633645	2011-02-11 15:45:39.633645
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
1	Euro	&euro;	%u%n	t	2011-02-11 15:45:39.3881	2011-02-11 15:45:39.3881
2	PLN	&pln;	%u%n	t	2011-02-11 15:45:39.396873	2011-02-11 15:45:39.396873
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-11 15:45:38.721796	2011-02-11 15:45:38.721796
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-11 15:45:38.746684	2011-02-11 15:45:38.746684
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-11 15:45:38.766814	2011-02-11 15:45:38.766814
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-11 15:45:38.784515	2011-02-11 15:45:38.784515
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-11 15:45:38.803409	2011-02-11 15:45:38.803409
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-11 15:45:38.823465	2011-02-11 15:45:38.823465
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-11 15:45:38.846144	2011-02-11 15:45:38.846144
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-11 15:45:38.864236	2011-02-11 15:45:38.864236
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-11 15:45:38.884022	2011-02-11 15:45:38.884022
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-11 15:45:38.904645	2011-02-11 15:45:38.904645
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-11 15:45:38.935016	2011-02-11 15:45:38.935016
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-11 15:45:38.959642	2011-02-11 15:45:38.959642
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-11 15:45:38.977281	2011-02-11 15:45:38.977281
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-11 15:45:39.00263	2011-02-11 15:45:39.00263
15	8	en	<p></p>	Question	2011-02-11 15:45:39.021189	2011-02-11 15:45:39.021189
16	8	dk	<p></p>	[DK] Question	2011-02-11 15:45:39.038077	2011-02-11 15:45:39.038077
17	9	en	<p></p>	Invoice	2011-02-11 15:45:39.055871	2011-02-11 15:45:39.055871
18	9	dk	<p></p>	[DK] Invoice	2011-02-11 15:45:39.07508	2011-02-11 15:45:39.07508
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-11 15:45:38.707808	2011-02-11 15:45:38.74072
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-11 15:45:38.760997	2011-02-11 15:45:38.779497
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-11 15:45:38.797275	2011-02-11 15:45:38.816539
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-11 15:45:38.83876	2011-02-11 15:45:38.858628
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-11 15:45:38.877951	2011-02-11 15:45:38.896875
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-11 15:45:38.925863	2011-02-11 15:45:38.953989
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-11 15:45:38.971745	2011-02-11 15:45:38.990086
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-11 15:45:39.015955	2011-02-11 15:45:39.033093
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-11 15:45:39.050406	2011-02-11 15:45:39.069344
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

COPY lead_translations (id, lead_id, locale, hidden_description, header, description, created_at, updated_at) FROM stdin;
1	1	dk	Dolorem eum est natus dolor et quo perferendis.Vero et et sed iusto nulla.	Big deal on printers	Incidunt nihil corporis illo repellat veniam quas consequatur.Omnis enim et qui nihil id consequatur est similique.	2011-02-11 15:45:39.806104	2011-02-11 15:45:39.806104
2	2	dk	Dolorum eos modi dicta ut labore non.Quam sed enim magni laboriosam quis.	Drills required	Ipsa sit maxime rerum quasi ut ullam explicabo et.Et totam aperiam consectetur qui natus quod earum.	2011-02-11 15:45:39.920736	2011-02-11 15:45:39.920736
3	3	dk	Quidem assumenda commodi ut molestiae consequatur qui numquam.Modi error expedita minus sapiente officiis.	Need assistance in selling a car	Autem laborum magnam sunt.Corrupti saepe minima officiis earum.	2011-02-11 15:45:40.016331	2011-02-11 15:45:40.016331
4	4	dk	Explicabo ut ut optio reiciendis.Quam et omnis consectetur omnis.	Ipod shipment	Vitae quisquam natus aliquam in numquam totam quia et.Illo ut a dolore quae quasi eum consequatur dolorum.	2011-02-11 15:45:40.122941	2011-02-11 15:45:40.122941
5	5	dk	Aperiam cumque delectus fuga exercitationem et repellendus facilis est.Quasi ullam et eos nisi quod alias quo minima.	Trip to amazonia - looking for offer	Sed architecto sint voluptatibus enim atque.Harum eum eos qui quia quia.	2011-02-11 15:45:40.227668	2011-02-11 15:45:40.227668
6	6	dk	Ut iste neque ipsum.Suscipit et nobis consectetur ut laudantium.	LCD - Huge amounts	Modi voluptatibus eum voluptas placeat porro ducimus nam et.Sit debitis assumenda ducimus recusandae.	2011-02-11 15:45:40.320989	2011-02-11 15:45:40.320989
7	7	dk	Quo quas est quia saepe esse rerum autem.Quo non tenetur labore quos nisi.	GPS receivers required	Ipsam accusamus aut odit voluptas aliquam error natus voluptates.Omnis corporis ipsa consectetur quis ad praesentium necessitatibus.	2011-02-11 15:45:40.416273	2011-02-11 15:45:40.416273
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Incidunt nihil corporis illo repellat veniam quas consequatur.Omnis enim et qui nihil id consequatur est similique.	Dolorem eum est natus dolor et quo perferendis.Vero et et sed iusto nulla.	2	User::Agent	0	785.0	360.0	1	Feest	Nellie Dooley	697.202.6464 x920	nelda.gaylord@macejkovicstark.name	2011-02-11 15:45:39.74764	2011-02-11 15:45:39.74764	2011-02-16	Lilla129743913963118 Blanda	1	t	\N	0	0	f	f	-1	1	2011-02-11 15:45:39.76181	\N	\N	4631 Kayla Mission	\N	\N	Jeromystad	81674	West Yorkshire	\N	\N	\N	\N	t
2	Drills required	3	Ipsa sit maxime rerum quasi ut ullam explicabo et.Et totam aperiam consectetur qui natus quod earum.	Dolorum eos modi dicta ut labore non.Quam sed enim magni laboriosam quis.	2	User::Agent	0	670.0	653.0	1	Auer	Buddy Hansen	1-616-654-1836	coy.hahn@gislason.biz	2011-02-11 15:45:39.877162	2011-02-11 15:45:39.877162	2011-02-16	Lilla129743913963118 Blanda	1	t	\N	0	0	f	f	-1	1	2011-02-11 15:45:39.88605	\N	\N	46086 Price Curve	\N	\N	Hudsonbury	75979	Lancashire	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Autem laborum magnam sunt.Corrupti saepe minima officiis earum.	Quidem assumenda commodi ut molestiae consequatur qui numquam.Modi error expedita minus sapiente officiis.	2	User::Agent	0	129.0	447.0	1	Breitenberg	Antonia Botsford	970-667-2931 x43944	elmira_daugherty@morar.us	2011-02-11 15:45:39.970425	2011-02-11 15:45:39.970425	2011-02-16	Lilla129743913963118 Blanda	1	t	\N	0	0	f	f	-1	1	2011-02-11 15:45:39.979861	\N	\N	902 Raegan Village	\N	\N	Lake Rubyetown	79336-3830	Isle of Wight	\N	\N	\N	\N	t
4	Ipod shipment	3	Vitae quisquam natus aliquam in numquam totam quia et.Illo ut a dolore quae quasi eum consequatur dolorum.	Explicabo ut ut optio reiciendis.Quam et omnis consectetur omnis.	2	User::Agent	0	856.0	601.0	1	Koeppgreenholt	Frederick Kassulke	(327)001-2532	duncan_johnston@labadie.info	2011-02-11 15:45:40.069362	2011-02-11 15:45:40.069362	2011-02-16	Lilla129743913963118 Blanda	1	t	\N	0	0	f	f	-1	1	2011-02-11 15:45:40.077832	\N	\N	5353 Frami Port	\N	\N	Baumbachfurt	99012-9444	County Antrim	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Sed architecto sint voluptatibus enim atque.Harum eum eos qui quia quia.	Aperiam cumque delectus fuga exercitationem et repellendus facilis est.Quasi ullam et eos nisi quod alias quo minima.	2	User::Agent	0	914.0	324.0	1	Trantowhoeger	Roberta Waelchi	(268)045-3886 x996	joey.runolfsdottir@schmelerpfeffer.us	2011-02-11 15:45:40.181238	2011-02-11 15:45:40.181238	2011-02-16	Lilla129743913963118 Blanda	1	t	\N	0	0	f	f	-1	1	2011-02-11 15:45:40.190781	\N	\N	5728 Vincenza Mill	\N	\N	Mitchelltown	42119-8420	Greater Manchester	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Modi voluptatibus eum voluptas placeat porro ducimus nam et.Sit debitis assumenda ducimus recusandae.	Ut iste neque ipsum.Suscipit et nobis consectetur ut laudantium.	2	User::Agent	0	296.0	317.0	1	Heidenreich	Zechariah Sauer III	1-286-352-3685	lauriane.brown@sengeremmerich.us	2011-02-11 15:45:40.277156	2011-02-11 15:45:40.277156	2011-02-16	Lilla129743913963118 Blanda	1	t	\N	0	0	f	f	-1	1	2011-02-11 15:45:40.285509	\N	\N	475 Savanna Road	\N	\N	Suzanneshire	09038-1731	Durham	\N	\N	\N	\N	t
7	GPS receivers required	3	Ipsam accusamus aut odit voluptas aliquam error natus voluptates.Omnis corporis ipsa consectetur quis ad praesentium necessitatibus.	Quo quas est quia saepe esse rerum autem.Quo non tenetur labore quos nisi.	2	User::Agent	0	122.0	66.0	1	Jacobson	Glennie Rempel	610.886.7744 x97320	kimberly@schusterdavis.biz	2011-02-11 15:45:40.371113	2011-02-11 15:45:40.371113	2011-02-16	Lilla129743913963118 Blanda	1	t	\N	0	0	f	f	-1	1	2011-02-11 15:45:40.381357	\N	\N	640 Sherman Port	\N	\N	Paytonburgh	29231	Grampian	\N	\N	\N	\N	t
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
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2011-02-11 15:45:38.525435	2011-02-11 15:45:38.525435
2	default_leads_per_page	--- 5\n	2011-02-11 15:45:38.555788	2011-02-11 15:45:38.555788
3	certification_level_1	--- 10\n	2011-02-11 15:45:38.566073	2011-02-11 15:45:38.566073
4	certification_level_2	--- 20\n	2011-02-11 15:45:38.575385	2011-02-11 15:45:38.575385
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-11 15:45:38.581403	2011-02-11 15:45:38.581403
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-11 15:45:38.587202	2011-02-11 15:45:38.587202
7	invoicing_seller_name	--- Fairleads\n	2011-02-11 15:45:38.593385	2011-02-11 15:45:38.593385
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-11 15:45:38.5997	2011-02-11 15:45:38.5997
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-11 15:45:38.607661	2011-02-11 15:45:38.607661
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-11 15:45:38.620278	2011-02-11 15:45:38.620278
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
1	blazejek@gmail.com	f6b07731faaf8e97e0ef17d6974986da9e707adb4536d0172701b452bf48e73f1ed8aa5e4928ea9e857a0a1951116050aaa8473bce3f5ef1f52f5be9eef445fc	cNhTacT1BHFvDg_xFfZ-	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-11 15:45:39.357789	2011-02-11 15:45:39.198301	\N	2011-02-11 15:45:39.208977	2011-02-11 15:45:39.358575	1	Monserrate	Hermann	1-605-584-4923	root	Bednar Ferry	Natmouth	56127-9451	County Fermanagh	1	\N	\N	\N	\N	0	\N	\N	\N	\N	m8zZ5B62wTLw4llcrDj9ICwlncOEyBga7vVSK7yRq3AG5v6zohzRx9PPpxgQ6G	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	0242cb200d2fdb9490287a702d7ee8edac86e787e825412808c4369c15bb7a5838cf6c32f39a1dec0ee24046e2b1ad7f8e25a9827f3fd8b34e1921735ba61799	iXB8XKGEl8_g6eAC6QMS	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-11 15:45:39.680889	2011-02-11 15:45:39.646114	\N	2011-02-11 15:45:39.649144	2011-02-11 15:45:39.681418	2	Lilla129743913963118	Blanda	(788)749-4942	Frederique Weissnat129743913963083	Edgardo Throughway	New Delfinatown	05495-1220	County Armagh	1	\N	0	\N	\N	0	\N	\N	\N	\N	IfdpRjmgFAdsBGvFJECaU5A75ZTpNydXRzufcUhM0ZpXu0VgnR6TaF52tTZa20	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	01e55c434542327248114ec3028643dc0442adb2f279a5b654d0dcc2a78c51e835398bf2e09daaaf39c923fb17f9fad0cd698b9d3a2fc47940275902cf1a8e94	edW8dFhx-M9kZgKVcVdK	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-11 15:45:40.53104	2011-02-11 15:45:40.500369	\N	2011-02-11 15:45:40.503046	2011-02-11 15:45:40.531508	1	Joany	Homenick	620-816-5586 x4205	Mr. Laura Romaguera129743914049251	Kub Street	Arnulfofort	97987	Norfolk	1	\N	\N	\N	\N	0	\N	\N	\N	\N	CFx7WV2v1eqeH6u2ZbqRmkmLVOjFzsSDEKEHs4bwQqB7rTOzMkSQvogrIHa5Ro	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	907a7685236892e5952de77b3cbca546f07b9d5956f210b9e499a97679c88d5aedeed1a85b5c69be7c89bc9628392b46dd314b15be66227c97a9221b207e23e0	PD2BbB7Kk707mju3ecdu	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-11 15:45:40.617673	2011-02-11 15:45:40.581887	\N	2011-02-11 15:45:40.584657	2011-02-11 15:45:40.618505	48	Ana	Bogisich	1-832-848-6215 x9622	Ardith Bode129743914057244	Antone Well	New Katelynfurt	73272-1864	Lothian	1	\N	\N	\N	\N	0	\N	\N	\N	\N	mA3XlHKS6XvR92YpbEHbka3O9lIpTN2xcGRDPNaJgqYOr3VndLDAezV3eKqvhQ	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	2d1cb850586c2bfacbd85e0754081c614136935973b1facf7dfaacb7e947e34e8b4bbb6ead0eb5c5fb9106122e9162c3b49fdce977f134272c2d0520664d7495	oQS-xhAxRhujUmD8aXx6	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-11 15:45:40.709331	2011-02-11 15:45:40.671831	\N	2011-02-11 15:45:40.674871	2011-02-11 15:45:40.73827	64	Justine	Russel	714.121.7385	Bertrand Steuber129743914066229	Estrella Cove	Demarcusview	75866	Clwyd	1	\N	\N	4	\N	0	\N	\N	\N	\N	4HzAuGioBzADdaRL2Zt6wgsyjHfTUIx3s2tvDmZhWCY60gDAcpBtchEC7KtigK	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

