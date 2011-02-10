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
1	1	dk	About us	About us	2011-02-10 09:09:18.537168	2011-02-10 09:09:18.537168
2	1	en	About us	About us	2011-02-10 09:09:18.573131	2011-02-10 09:09:18.573131
3	2	dk	Privacy	Privacy	2011-02-10 09:09:18.623278	2011-02-10 09:09:18.623278
4	2	en	Privacy	Privacy	2011-02-10 09:09:18.641492	2011-02-10 09:09:18.641492
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-10 09:09:18.693736	2011-02-10 09:09:18.693736
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-10 09:09:18.715131	2011-02-10 09:09:18.715131
7	4	dk	Blurb sign up	Blurb sign up	2011-02-10 09:09:18.773984	2011-02-10 09:09:18.773984
8	4	en	Blurb sign up	Blurb sign up	2011-02-10 09:09:18.796266	2011-02-10 09:09:18.796266
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-10 09:09:18.839952	2011-02-10 09:09:18.839952
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-10 09:09:18.858462	2011-02-10 09:09:18.858462
11	6	dk	Blurb agent home	Blurb agent home	2011-02-10 09:09:18.912491	2011-02-10 09:09:18.912491
12	6	en	Blurb agent home	Blurb agent home	2011-02-10 09:09:18.93207	2011-02-10 09:09:18.93207
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-10 09:09:18.987333	2011-02-10 09:09:18.987333
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-10 09:09:19.005344	2011-02-10 09:09:19.005344
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-10 09:09:19.052673	2011-02-10 09:09:19.052673
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-10 09:09:19.074917	2011-02-10 09:09:19.074917
17	9	dk	Blurb currencies	Blurb currencies	2011-02-10 09:09:19.141907	2011-02-10 09:09:19.141907
18	9	en	Blurb currencies	Blurb currencies	2011-02-10 09:09:19.169422	2011-02-10 09:09:19.169422
19	10	dk	Blurb category home	Blurb category home	2011-02-10 09:09:19.211995	2011-02-10 09:09:19.211995
20	10	en	Blurb category home	Blurb category home	2011-02-10 09:09:19.233947	2011-02-10 09:09:19.233947
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-10 09:09:19.282225	2011-02-10 09:09:19.282225
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-10 09:09:19.301427	2011-02-10 09:09:19.301427
23	12	dk	Reset password	Reset password	2011-02-10 09:09:19.370127	2011-02-10 09:09:19.370127
24	12	en	Reset password	Reset password	2011-02-10 09:09:19.388064	2011-02-10 09:09:19.388064
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id, views_count) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-10 09:09:18.524435	2011-02-10 09:09:18.579625	about_us	t	2011-02-10 09:09:18.579505	\N	\N	0
2	Article::Cms::MainPageArticle	2011-02-10 09:09:18.617842	2011-02-10 09:09:18.648091	privacy	t	2011-02-10 09:09:18.647955	\N	\N	0
3	Article::Cms::MainPageArticle	2011-02-10 09:09:18.688348	2011-02-10 09:09:18.7266	terms_conditions	t	2011-02-10 09:09:18.726466	\N	\N	0
4	Article::Cms::InterfaceContentText	2011-02-10 09:09:18.766273	2011-02-10 09:09:18.801932	blurb_sign_up	t	2011-02-10 09:09:18.801824	\N	\N	0
5	Article::Cms::InterfaceContentText	2011-02-10 09:09:18.834365	2011-02-10 09:09:18.870289	blurb_buyer_home	t	2011-02-10 09:09:18.870178	\N	\N	0
6	Article::Cms::InterfaceContentText	2011-02-10 09:09:18.907069	2011-02-10 09:09:18.939668	blurb_agent_home	t	2011-02-10 09:09:18.939562	\N	\N	0
7	Article::Cms::InterfaceContentText	2011-02-10 09:09:18.979776	2011-02-10 09:09:19.011486	blurb_purchase_manager_home	t	2011-02-10 09:09:19.01138	\N	\N	0
8	Article::Cms::InterfaceContentText	2011-02-10 09:09:19.047189	2011-02-10 09:09:19.087716	blurb_start_page_role_selection	t	2011-02-10 09:09:19.087595	\N	\N	0
9	Article::Cms::InterfaceContentText	2011-02-10 09:09:19.121595	2011-02-10 09:09:19.175561	blurb_currencies	t	2011-02-10 09:09:19.175458	\N	\N	0
10	Article::Cms::InterfaceContentText	2011-02-10 09:09:19.206577	2011-02-10 09:09:19.240469	blurb_category_home	t	2011-02-10 09:09:19.240362	\N	\N	0
11	Article::Cms::InterfaceContentText	2011-02-10 09:09:19.276956	2011-02-10 09:09:19.307128	blurb_leads_listing	t	2011-02-10 09:09:19.306997	\N	\N	0
12	Article::Cms::HelpPopup	2011-02-10 09:09:19.362514	2011-02-10 09:09:19.396582	reset_password	t	2011-02-10 09:09:19.396412	\N	\N	0
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-10 09:09:16.485585	2011-02-10 09:09:16.485585	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Corporis velit voluptas iure praesentium.Consequuntur est aliquam molestiae quidem quibusdam atque exercitationem.	2011-02-10 09:09:17.105315	2011-02-10 09:09:17.105315	\N	1	2	\N	0	electronics	f	0
2	Leisure	Aliquam autem natus consequuntur quis omnis.Maxime alias vitae veritatis consequatur.	2011-02-10 09:09:17.174716	2011-02-10 09:09:17.174716	\N	3	4	\N	0	leisure	f	0
3	Business	Vitae placeat amet fugit repudiandae tempora similique.Et laboriosam consequatur adipisci voluptatum itaque voluptates velit quas.	2011-02-10 09:09:17.22673	2011-02-10 09:09:18.041463	\N	5	6	\N	7	business	f	7
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
1	1	en	Corporis velit voluptas iure praesentium.Consequuntur est aliquam molestiae quidem quibusdam atque exercitationem.	Electronics	2011-02-10 09:09:17.116566	2011-02-10 09:09:17.116566
2	1	dk	\N	Electronics	2011-02-10 09:09:17.156486	2011-02-10 09:09:17.156486
3	2	en	Aliquam autem natus consequuntur quis omnis.Maxime alias vitae veritatis consequatur.	Leisure	2011-02-10 09:09:17.180382	2011-02-10 09:09:17.180382
4	2	dk	\N	Leisure	2011-02-10 09:09:17.210811	2011-02-10 09:09:17.210811
5	3	en	Vitae placeat amet fugit repudiandae tempora similique.Et laboriosam consequatur adipisci voluptatum itaque voluptates velit quas.	Business	2011-02-10 09:09:17.232456	2011-02-10 09:09:17.232456
6	3	dk	\N	Business	2011-02-10 09:09:17.26123	2011-02-10 09:09:17.26123
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-10 09:09:16.451708	2011-02-10 09:09:16.451708
2	United Kingdom	2011-02-10 09:09:16.464996	2011-02-10 09:09:16.464996
3	England129732895730226	2011-02-10 09:09:17.304236	2011-02-10 09:09:17.304236
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
1	Euro	&euro;	%u%n	t	2011-02-10 09:09:17.063185	2011-02-10 09:09:17.063185
2	PLN	&pln;	%u%n	t	2011-02-10 09:09:17.071735	2011-02-10 09:09:17.071735
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-10 09:09:16.525413	2011-02-10 09:09:16.525413
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-10 09:09:16.546081	2011-02-10 09:09:16.546081
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-10 09:09:16.567977	2011-02-10 09:09:16.567977
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-10 09:09:16.586139	2011-02-10 09:09:16.586139
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-10 09:09:16.603518	2011-02-10 09:09:16.603518
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-10 09:09:16.620132	2011-02-10 09:09:16.620132
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-10 09:09:16.638349	2011-02-10 09:09:16.638349
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-10 09:09:16.656208	2011-02-10 09:09:16.656208
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-10 09:09:16.673433	2011-02-10 09:09:16.673433
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-10 09:09:16.690085	2011-02-10 09:09:16.690085
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-10 09:09:16.711866	2011-02-10 09:09:16.711866
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-10 09:09:16.73159	2011-02-10 09:09:16.73159
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-10 09:09:16.749006	2011-02-10 09:09:16.749006
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-10 09:09:16.773824	2011-02-10 09:09:16.773824
15	8	en	<p></p>	Question	2011-02-10 09:09:16.791895	2011-02-10 09:09:16.791895
16	8	dk	<p></p>	[DK] Question	2011-02-10 09:09:16.809819	2011-02-10 09:09:16.809819
17	9	en	<p></p>	Invoice	2011-02-10 09:09:16.832634	2011-02-10 09:09:16.832634
18	9	dk	<p></p>	[DK] Invoice	2011-02-10 09:09:16.854538	2011-02-10 09:09:16.854538
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-10 09:09:16.514663	2011-02-10 09:09:16.540647
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-10 09:09:16.562662	2011-02-10 09:09:16.581175
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-10 09:09:16.598019	2011-02-10 09:09:16.615193
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-10 09:09:16.633129	2011-02-10 09:09:16.651242
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-10 09:09:16.668105	2011-02-10 09:09:16.685172
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-10 09:09:16.70303	2011-02-10 09:09:16.725919
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-10 09:09:16.743741	2011-02-10 09:09:16.766424
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-10 09:09:16.786689	2011-02-10 09:09:16.804543
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-10 09:09:16.825378	2011-02-10 09:09:16.847803
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

COPY lead_translations (id, lead_id, locale, hidden_description, header, description, created_at, updated_at) FROM stdin;
1	1	dk	Aut in ea est assumenda voluptates.Aspernatur nisi numquam odit aut atque eos aut.	Big deal on printers	Ratione illo odit voluptatem eos atque eius tempore.Modi odio incidunt aut quod ut.	2011-02-10 09:09:17.460308	2011-02-10 09:09:17.460308
2	2	dk	Officia doloribus optio impedit aut similique.Labore quaerat pariatur sit nobis provident deleniti.	Drills required	Ipsa quia fugit et quis est sed.Ullam blanditiis repudiandae esse et sed tempora.	2011-02-10 09:09:17.562858	2011-02-10 09:09:17.562858
3	3	dk	Harum deleniti quia laborum quasi qui dolorem.Dolorum pariatur ad commodi.	Need assistance in selling a car	Ex est minus eveniet veniam qui ipsum dolorem facilis.Reiciendis iste asperiores nihil accusantium quia eveniet vel.	2011-02-10 09:09:17.65381	2011-02-10 09:09:17.65381
4	4	dk	Debitis laboriosam quos voluptatem sed enim dicta.Similique cumque voluptates architecto culpa.	Ipod shipment	In sed qui omnis et velit ipsum.Sit ab sapiente aspernatur quidem et quam.	2011-02-10 09:09:17.753144	2011-02-10 09:09:17.753144
5	5	dk	Sunt autem explicabo nulla impedit ducimus.Dignissimos voluptatibus sint maxime minima quod omnis aut earum.	Trip to amazonia - looking for offer	Delectus eos officia qui debitis a consequatur rerum.Est ad magni natus nisi modi.	2011-02-10 09:09:17.854195	2011-02-10 09:09:17.854195
6	6	dk	Harum aut ea molestias facere.Voluptatem cumque veritatis dolores et aut nemo occaecati sint.	LCD - Huge amounts	Corporis eligendi accusantium inventore voluptatem facilis maiores vel.Nisi vero est laborum alias officia.	2011-02-10 09:09:17.947433	2011-02-10 09:09:17.947433
7	7	dk	Et sit totam ut soluta.Illo illum nisi excepturi ad aliquam omnis.	GPS receivers required	Sunt ut ut quaerat et porro minima quis.Alias omnis et qui.	2011-02-10 09:09:18.051873	2011-02-10 09:09:18.051873
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Ratione illo odit voluptatem eos atque eius tempore.Modi odio incidunt aut quod ut.	Aut in ea est assumenda voluptates.Aspernatur nisi numquam odit aut atque eos aut.	2	User::Agent	0	634.0	737.0	1	Muellerruecker	Shayne Morissette	(802)072-3075 x1813	jed_okon@kub.com	2011-02-10 09:09:17.401759	2011-02-10 09:09:17.401759	2011-02-15	Joshuah129732895730127 Kertzmann	1	t	\N	0	0	f	f	-1	1	2011-02-10 09:09:17.413451	\N	\N	915 Hilll Plains	\N	\N	Jonesside	10700-6042	Durham	\N	\N	\N	\N	t
2	Drills required	3	Ipsa quia fugit et quis est sed.Ullam blanditiis repudiandae esse et sed tempora.	Officia doloribus optio impedit aut similique.Labore quaerat pariatur sit nobis provident deleniti.	2	User::Agent	0	164.0	858.0	1	Collierconroy	Chadrick Hilpert	696.621.1450 x501	edd_wisoky@johns.name	2011-02-10 09:09:17.514545	2011-02-10 09:09:17.514545	2011-02-15	Joshuah129732895730127 Kertzmann	1	t	\N	0	0	f	f	-1	1	2011-02-10 09:09:17.523713	\N	\N	85663 Devan Station	\N	\N	South Madgeland	79245	South Glamorgan	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Ex est minus eveniet veniam qui ipsum dolorem facilis.Reiciendis iste asperiores nihil accusantium quia eveniet vel.	Harum deleniti quia laborum quasi qui dolorem.Dolorum pariatur ad commodi.	2	User::Agent	0	788.0	995.0	1	Quigley	Mrs. Aglae Hahn	(990)219-7705 x9638	tatum.eichmann@dare.name	2011-02-10 09:09:17.612207	2011-02-10 09:09:17.612207	2011-02-15	Joshuah129732895730127 Kertzmann	1	t	\N	0	0	f	f	-1	1	2011-02-10 09:09:17.620364	\N	\N	153 Douglas Lock	\N	\N	Port Aurore	63845	Oxfordshire	\N	\N	\N	\N	t
4	Ipod shipment	3	In sed qui omnis et velit ipsum.Sit ab sapiente aspernatur quidem et quam.	Debitis laboriosam quos voluptatem sed enim dicta.Similique cumque voluptates architecto culpa.	2	User::Agent	0	916.0	959.0	1	Treutel	Jarred Sporer	914.588.0503 x059	tyrell@langoshprice.com	2011-02-10 09:09:17.704655	2011-02-10 09:09:17.704655	2011-02-15	Joshuah129732895730127 Kertzmann	1	t	\N	0	0	f	f	-1	1	2011-02-10 09:09:17.715108	\N	\N	017 Pfeffer Courts	\N	\N	East Melbaton	03795	Gloucestershire	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Delectus eos officia qui debitis a consequatur rerum.Est ad magni natus nisi modi.	Sunt autem explicabo nulla impedit ducimus.Dignissimos voluptatibus sint maxime minima quod omnis aut earum.	2	User::Agent	0	75.0	803.0	1	Turcotte	Noemi Feest	1-554-203-8196	solon.jerde@ferry.info	2011-02-10 09:09:17.811055	2011-02-10 09:09:17.811055	2011-02-15	Joshuah129732895730127 Kertzmann	1	t	\N	0	0	f	f	-1	1	2011-02-10 09:09:17.819741	\N	\N	63855 O'Connell Run	\N	\N	West Justus	83176	Cheshire	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Corporis eligendi accusantium inventore voluptatem facilis maiores vel.Nisi vero est laborum alias officia.	Harum aut ea molestias facere.Voluptatem cumque veritatis dolores et aut nemo occaecati sint.	2	User::Agent	0	387.0	352.0	1	Klocko	Mr. Berneice Mayer	1-364-837-5516	bethany_bashirian@eichmannwalker.uk	2011-02-10 09:09:17.903215	2011-02-10 09:09:17.903215	2011-02-15	Joshuah129732895730127 Kertzmann	1	t	\N	0	0	f	f	-1	1	2011-02-10 09:09:17.911331	\N	\N	052 Elvis Knolls	\N	\N	Hahnberg	15061	Durham	\N	\N	\N	\N	t
7	GPS receivers required	3	Sunt ut ut quaerat et porro minima quis.Alias omnis et qui.	Et sit totam ut soluta.Illo illum nisi excepturi ad aliquam omnis.	2	User::Agent	0	816.0	704.0	1	Rempelbednar	Kaylah Deckow	545.818.6224 x45591	jimmy_collins@kreiger.us	2011-02-10 09:09:18.007189	2011-02-10 09:09:18.007189	2011-02-15	Joshuah129732895730127 Kertzmann	1	t	\N	0	0	f	f	-1	1	2011-02-10 09:09:18.016413	\N	\N	856 Ward Gardens	\N	\N	Metzport	17917-5442	Lincolnshire	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-10 09:09:16.247664	2011-02-10 09:09:16.247664
2	default_leads_per_page	--- 5\n	2011-02-10 09:09:16.365777	2011-02-10 09:09:16.365777
3	certification_level_1	--- 10\n	2011-02-10 09:09:16.376399	2011-02-10 09:09:16.376399
4	certification_level_2	--- 20\n	2011-02-10 09:09:16.387919	2011-02-10 09:09:16.387919
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-10 09:09:16.396187	2011-02-10 09:09:16.396187
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-10 09:09:16.402993	2011-02-10 09:09:16.402993
7	invoicing_seller_name	--- Fairleads\n	2011-02-10 09:09:16.409655	2011-02-10 09:09:16.409655
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-10 09:09:16.41735	2011-02-10 09:09:16.41735
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-10 09:09:16.424983	2011-02-10 09:09:16.424983
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-10 09:09:16.431412	2011-02-10 09:09:16.431412
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
1	blazejek@gmail.com	acf5d550801f9613df9f49858ec4b5eb8c967fcb88a85ce1d8213bd049755b843a25fa2ff4849247639ce62077721c7b0d2543ec287b15b7407013b5a1d7a11a	JIaGJ4mtHeUC6bEB1Ztz	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-10 09:09:17.036632	2011-02-10 09:09:16.914182	\N	2011-02-10 09:09:16.920383	2011-02-10 09:09:17.03716	1	Ivory	Fadel	(716)729-5528	root	Trent Freeway	North Ceciliaport	25646	Norfolk	1	\N	\N	\N	\N	0	\N	\N	\N	\N	IRyHHuzGRv5c6C2mEcLXh5kYw8EiEg53bE3Ja8XV7CSqpGnflRYxfZfNBYzup8	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	79d59444ba092369b28bf2392f913d3df36a0ab2b1013fd0c0e868f7da0184cdc7bb8bd8c45351ffc111c57f9874ee9f8a4591a5e7662636e40bdddb8ab84b4e	uUTGJfIjUnRL0SlqtEHM	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-10 09:09:17.349506	2011-02-10 09:09:17.31538	\N	2011-02-10 09:09:17.317946	2011-02-10 09:09:17.349982	2	Joshuah129732895730127	Kertzmann	921-961-5703	Cierra Hodkiewicz129732895730089	Remington Rapids	Rathtown	44379	Tyne and Wear	1	\N	0	\N	\N	0	\N	\N	\N	\N	mCUBw3eHlmJaf2JMWqaWFmeFKmHJn4cpXFKY8XglyzPplBzyRi93yZ6HRBiPDn	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	9899002472060a630be4ecb9af205db5623d03a7a550f8b0d94213931c2ac09d8c463b83f7b2417e9b4e0c784da236ccd61b6710245785e21f2e2a1e8e45db37	FPBY2yTOTkBGlIiYfix0	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-10 09:09:18.181601	2011-02-10 09:09:18.148839	\N	2011-02-10 09:09:18.151571	2011-02-10 09:09:18.18206	1	Verna	Gerlach	056.057.3778	Pattie Murazik DVM129732895814096	Dicki Springs	South Mathildeland	00389-4406	Wiltshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	dGdgXkApVzS8TB0HbaNOhKbL8K6M4tx4kB8X6XNhDbAECntuqiIXPovfuYjP2b	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	5f830eac91f01d8ffcca560575eb49ed851ee11675fbd37218de9ed6824b60ef3ee998d934116a7ca36d7f6ac6b5a3a8e82243199c6a0be8cd4e10e064a19754	D5VBdMCk8nO6lhLFbzvY	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-10 09:09:18.271906	2011-02-10 09:09:18.238621	\N	2011-02-10 09:09:18.241746	2011-02-10 09:09:18.272454	48	Walton	Grady	1-228-183-8452 x2866	Ms. Abe Kerluke129732895823047	Lela Summit	Port Joanny	84774-6023	West Sussex	1	\N	\N	\N	\N	0	\N	\N	\N	\N	V41X0DF9mcnxqNWeTUjTiV4GrX2IogMyFQs0YmhyOkGWLuiaps7LXh9ShTV796	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	e9862a6486bf3e090e180fa30f964d5ade8eeeccdf8abe1ba5fe8b2c588f68c8e481ffe652beac29eafd9ede3b4096bd32d92db9ac6bde597cffc8131170d0ef	byyb_YLI-V0qeV8kbIXQ	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-10 09:09:18.355728	2011-02-10 09:09:18.32249	\N	2011-02-10 09:09:18.325084	2011-02-10 09:09:18.38258	64	Rhett	Zulauf	1-958-185-4618 x51727	Johnathan Gusikowski129732895831468	Davis Falls	Port Christophe	60900	Durham	1	\N	\N	4	\N	0	\N	\N	\N	\N	ZiCbVl7QO3qxZTQoK8CGtPUgQPlwmkWN7auiN734L3jKRTa9tQuGNkP8M4wsNb	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

