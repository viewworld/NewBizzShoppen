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

SELECT pg_catalog.setval('article_translations_id_seq', 22, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 11, true);


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

COPY article_translations (id, article_id, locale, content, title, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-08 10:51:15.789473	2011-02-08 10:51:15.789473
2	1	en	About us	About us	2011-02-08 10:51:15.804075	2011-02-08 10:51:15.804075
3	2	dk	Privacy	Privacy	2011-02-08 10:51:15.836886	2011-02-08 10:51:15.836886
4	2	en	Privacy	Privacy	2011-02-08 10:51:15.848458	2011-02-08 10:51:15.848458
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-08 10:51:16.022186	2011-02-08 10:51:16.022186
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-08 10:51:16.033781	2011-02-08 10:51:16.033781
7	4	dk	Blurb sign up	Blurb sign up	2011-02-08 10:51:16.069553	2011-02-08 10:51:16.069553
8	4	en	Blurb sign up	Blurb sign up	2011-02-08 10:51:16.08148	2011-02-08 10:51:16.08148
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-08 10:51:16.110667	2011-02-08 10:51:16.110667
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-08 10:51:16.122471	2011-02-08 10:51:16.122471
11	6	dk	Blurb agent home	Blurb agent home	2011-02-08 10:51:16.151001	2011-02-08 10:51:16.151001
12	6	en	Blurb agent home	Blurb agent home	2011-02-08 10:51:16.162844	2011-02-08 10:51:16.162844
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-08 10:51:16.190994	2011-02-08 10:51:16.190994
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-08 10:51:16.202918	2011-02-08 10:51:16.202918
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-08 10:51:16.231913	2011-02-08 10:51:16.231913
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-08 10:51:16.245327	2011-02-08 10:51:16.245327
17	9	dk	Blurb currencies	Blurb currencies	2011-02-08 10:51:16.277849	2011-02-08 10:51:16.277849
18	9	en	Blurb currencies	Blurb currencies	2011-02-08 10:51:16.293195	2011-02-08 10:51:16.293195
19	10	dk	Blurb category home	Blurb category home	2011-02-08 10:51:16.323507	2011-02-08 10:51:16.323507
20	10	en	Blurb category home	Blurb category home	2011-02-08 10:51:16.336881	2011-02-08 10:51:16.336881
21	11	dk	Reset password	Reset password	2011-02-08 10:51:16.535799	2011-02-08 10:51:16.535799
22	11	en	Reset password	Reset password	2011-02-08 10:51:16.547424	2011-02-08 10:51:16.547424
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-08 10:51:15.780092	2011-02-08 10:51:15.807097	about_us	t	2011-02-08 10:51:15.807012	\N	\N
2	Article::Cms::MainPageArticle	2011-02-08 10:51:15.832492	2011-02-08 10:51:15.851228	privacy	t	2011-02-08 10:51:15.851146	\N	\N
3	Article::Cms::MainPageArticle	2011-02-08 10:51:16.01807	2011-02-08 10:51:16.036664	terms_conditions	t	2011-02-08 10:51:16.03658	\N	\N
4	Article::Cms::InterfaceContentText	2011-02-08 10:51:16.063319	2011-02-08 10:51:16.084303	blurb_sign_up	t	2011-02-08 10:51:16.084222	\N	\N
5	Article::Cms::InterfaceContentText	2011-02-08 10:51:16.106474	2011-02-08 10:51:16.12535	blurb_buyer_home	t	2011-02-08 10:51:16.125276	\N	\N
6	Article::Cms::InterfaceContentText	2011-02-08 10:51:16.146816	2011-02-08 10:51:16.165596	blurb_agent_home	t	2011-02-08 10:51:16.165523	\N	\N
7	Article::Cms::InterfaceContentText	2011-02-08 10:51:16.18679	2011-02-08 10:51:16.205793	blurb_purchase_manager_home	t	2011-02-08 10:51:16.205718	\N	\N
8	Article::Cms::InterfaceContentText	2011-02-08 10:51:16.227693	2011-02-08 10:51:16.248889	blurb_start_page_role_selection	t	2011-02-08 10:51:16.248803	\N	\N
9	Article::Cms::InterfaceContentText	2011-02-08 10:51:16.272952	2011-02-08 10:51:16.296262	blurb_currencies	t	2011-02-08 10:51:16.296179	\N	\N
10	Article::Cms::InterfaceContentText	2011-02-08 10:51:16.319226	2011-02-08 10:51:16.340179	blurb_category_home	t	2011-02-08 10:51:16.340102	\N	\N
11	Article::Cms::HelpPopup	2011-02-08 10:51:16.370276	2011-02-08 10:51:16.55067	reset_password	t	2011-02-08 10:51:16.550579	\N	\N
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-08 10:51:13.788247	2011-02-08 10:51:13.788247	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	A dolore quo et.Vero necessitatibus ad quia aut tempore et et.	2011-02-08 10:51:14.329585	2011-02-08 10:51:14.329585	\N	1	2	\N	0	electronics	f	0
2	Leisure	Sit perspiciatis ut dolorem ullam nemo inventore.Provident et ut molestiae dolor recusandae.	2011-02-08 10:51:14.375966	2011-02-08 10:51:14.375966	\N	3	4	\N	0	leisure	f	0
3	Business	Porro ut dolor earum repudiandae qui enim excepturi consectetur.Sequi autem assumenda sit et magni.	2011-02-08 10:51:14.411116	2011-02-08 10:51:15.28499	\N	5	6	\N	7	business	f	7
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
1	1	en	A dolore quo et.Vero necessitatibus ad quia aut tempore et et.	Electronics	2011-02-08 10:51:14.33857	2011-02-08 10:51:14.33857
2	1	dk	\N	Electronics	2011-02-08 10:51:14.36591	2011-02-08 10:51:14.36591
3	2	en	Sit perspiciatis ut dolorem ullam nemo inventore.Provident et ut molestiae dolor recusandae.	Leisure	2011-02-08 10:51:14.380154	2011-02-08 10:51:14.380154
4	2	dk	\N	Leisure	2011-02-08 10:51:14.400799	2011-02-08 10:51:14.400799
5	3	en	Porro ut dolor earum repudiandae qui enim excepturi consectetur.Sequi autem assumenda sit et magni.	Business	2011-02-08 10:51:14.415408	2011-02-08 10:51:14.415408
6	3	dk	\N	Business	2011-02-08 10:51:14.435748	2011-02-08 10:51:14.435748
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-08 10:51:13.773058	2011-02-08 10:51:13.773058
2	United Kingdom	2011-02-08 10:51:13.778114	2011-02-08 10:51:13.778114
3	Northern Ireland129716227446553	2011-02-08 10:51:14.466925	2011-02-08 10:51:14.466925
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
1	Euro	&euro;	%u%n	t	2011-02-08 10:51:14.3068	2011-02-08 10:51:14.3068
2	PLN	&pln;	%u%n	t	2011-02-08 10:51:14.311362	2011-02-08 10:51:14.311362
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-08 10:51:13.818594	2011-02-08 10:51:13.818594
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-08 10:51:13.833345	2011-02-08 10:51:13.833345
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-08 10:51:13.845684	2011-02-08 10:51:13.845684
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-08 10:51:13.858161	2011-02-08 10:51:13.858161
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-08 10:51:13.872357	2011-02-08 10:51:13.872357
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-08 10:51:13.884956	2011-02-08 10:51:13.884956
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-02-08 10:51:13.901046	2011-02-08 10:51:13.901046
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-02-08 10:51:13.917096	2011-02-08 10:51:13.917096
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-08 10:51:13.930929	2011-02-08 10:51:13.930929
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-08 10:51:13.944911	2011-02-08 10:51:13.944911
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-08 10:51:13.958537	2011-02-08 10:51:13.958537
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-08 10:51:13.971884	2011-02-08 10:51:13.971884
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-08 10:51:13.985693	2011-02-08 10:51:13.985693
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-08 10:51:14.138	2011-02-08 10:51:14.138
15	8	en	Question	<p></p>	2011-02-08 10:51:14.150936	2011-02-08 10:51:14.150936
16	8	dk	[DK] Question	<p></p>	2011-02-08 10:51:14.163083	2011-02-08 10:51:14.163083
17	9	en	Invoice	<p></p>	2011-02-08 10:51:14.175683	2011-02-08 10:51:14.175683
18	9	dk	[DK] Invoice	<p></p>	2011-02-08 10:51:14.18782	2011-02-08 10:51:14.18782
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-08 10:51:13.809663	2011-02-08 10:51:13.829172
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-08 10:51:13.84134	2011-02-08 10:51:13.853801
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-08 10:51:13.866549	2011-02-08 10:51:13.880682
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-08 10:51:13.896213	2011-02-08 10:51:13.912664
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-08 10:51:13.926038	2011-02-08 10:51:13.940253
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-08 10:51:13.953732	2011-02-08 10:51:13.967337
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-08 10:51:13.981134	2011-02-08 10:51:14.133595
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-08 10:51:14.146344	2011-02-08 10:51:14.158833
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-08 10:51:14.171251	2011-02-08 10:51:14.183759
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
1	1	dk	Id laboriosam exercitationem asperiores qui.Porro at sed quisquam voluptatum tempore.	Eius voluptatum distinctio voluptas.Quis doloribus quaerat sit at.	Big deal on printers	2011-02-08 10:51:14.718143	2011-02-08 10:51:14.718143
2	2	dk	Ex fugiat sint esse minus dicta repellendus sapiente.Qui ducimus et quisquam sequi consequuntur quam magni.	Iure veniam culpa voluptatum.Modi distinctio dolorum est sed neque velit quasi magni.	Drills required	2011-02-08 10:51:14.793144	2011-02-08 10:51:14.793144
3	3	dk	Corrupti quibusdam tenetur accusantium nostrum asperiores maiores libero.Accusamus quisquam ut ut.	Odit est iusto in quam ea nihil.Nesciunt tenetur repellat accusantium et cumque aut.	Need assistance in selling a car	2011-02-08 10:51:14.862812	2011-02-08 10:51:14.862812
4	4	dk	Rerum esse explicabo nostrum quasi vero quo ut.Voluptates deserunt a voluptate repellat ab repudiandae error.	Minus dolores deleniti necessitatibus modi similique aliquam.Quis ab saepe asperiores et.	Ipod shipment	2011-02-08 10:51:14.931117	2011-02-08 10:51:14.931117
5	5	dk	Quia repudiandae quidem libero commodi sunt quia tenetur fugiat.Magni quo sunt magnam molestiae qui tempora blanditiis.	Voluptatem consectetur error praesentium quo aliquid.Ratione eos quo quis.	Trip to amazonia - looking for offer	2011-02-08 10:51:15.147245	2011-02-08 10:51:15.147245
6	6	dk	Quod dolores magni quia distinctio nam ab et voluptas.Est odio velit saepe ad reprehenderit laudantium repellendus temporibus.	Voluptate iure in qui qui possimus debitis.Et odit hic quasi libero nihil est accusantium.	LCD - Huge amounts	2011-02-08 10:51:15.218694	2011-02-08 10:51:15.218694
7	7	dk	Maiores architecto optio quam perspiciatis.Tempora quasi ut voluptas quia praesentium earum eaque.	Ea non totam nostrum cumque ea incidunt qui.Amet impedit pariatur temporibus.	GPS receivers required	2011-02-08 10:51:15.29193	2011-02-08 10:51:15.29193
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Id laboriosam exercitationem asperiores qui.Porro at sed quisquam voluptatum tempore.	Eius voluptatum distinctio voluptas.Quis doloribus quaerat sit at.	2	User::Agent	0	29.0	134.0	1	Schultz	Austyn Berge	311-749-2590 x4679	karianne@will.co.uk	2011-02-08 10:51:14.676103	2011-02-08 10:51:14.676103	2011-02-13	Lauryn129716227446481 Steuber	1	t	\N	0	0	f	f	-1	1	2011-02-08 10:51:14.685869	\N	\N	2067 River Ferry	\N	\N	Aureliebury	31254-8370	Kent	\N	\N	\N	\N	t
2	Drills required	3	Ex fugiat sint esse minus dicta repellendus sapiente.Qui ducimus et quisquam sequi consequuntur quam magni.	Iure veniam culpa voluptatum.Modi distinctio dolorum est sed neque velit quasi magni.	2	User::Agent	0	512.0	893.0	1	Borer	Jimmy Ritchie	621-808-9182 x44202	jazmin@ullrichbarton.name	2011-02-08 10:51:14.758396	2011-02-08 10:51:14.758396	2011-02-13	Lauryn129716227446481 Steuber	1	t	\N	0	0	f	f	-1	1	2011-02-08 10:51:14.765529	\N	\N	296 Myrtice Orchard	\N	\N	McClureland	43574	South Glamorgan	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Corrupti quibusdam tenetur accusantium nostrum asperiores maiores libero.Accusamus quisquam ut ut.	Odit est iusto in quam ea nihil.Nesciunt tenetur repellat accusantium et cumque aut.	2	User::Agent	0	659.0	626.0	1	Kris	Genesis Runolfsson	(963)644-1820	eulalia_jones@dooleyhowe.co.uk	2011-02-08 10:51:14.829738	2011-02-08 10:51:14.829738	2011-02-13	Lauryn129716227446481 Steuber	1	t	\N	0	0	f	f	-1	1	2011-02-08 10:51:14.836693	\N	\N	0455 Quigley Cliff	\N	\N	South Alessandraberg	62642-7176	Humberside	\N	\N	\N	\N	t
4	Ipod shipment	3	Rerum esse explicabo nostrum quasi vero quo ut.Voluptates deserunt a voluptate repellat ab repudiandae error.	Minus dolores deleniti necessitatibus modi similique aliquam.Quis ab saepe asperiores et.	2	User::Agent	0	569.0	184.0	1	Lebsack	Lavina Schultz	(576)710-0985 x72024	modesta@kihn.uk	2011-02-08 10:51:14.898276	2011-02-08 10:51:14.898276	2011-02-13	Lauryn129716227446481 Steuber	1	t	\N	0	0	f	f	-1	1	2011-02-08 10:51:14.905216	\N	\N	624 Carlee Valleys	\N	\N	North Zoilaville	70433-3349	Dyfed	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Quia repudiandae quidem libero commodi sunt quia tenetur fugiat.Magni quo sunt magnam molestiae qui tempora blanditiis.	Voluptatem consectetur error praesentium quo aliquid.Ratione eos quo quis.	2	User::Agent	0	965.0	459.0	1	Abernathy	Ethyl Hirthe	629.786.5207	elisabeth@erdman.co.uk	2011-02-08 10:51:14.967776	2011-02-08 10:51:14.967776	2011-02-13	Lauryn129716227446481 Steuber	1	t	\N	0	0	f	f	-1	1	2011-02-08 10:51:14.97508	\N	\N	05647 Harber Loop	\N	\N	Hannahport	01186	Northamptonshire	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Quod dolores magni quia distinctio nam ab et voluptas.Est odio velit saepe ad reprehenderit laudantium repellendus temporibus.	Voluptate iure in qui qui possimus debitis.Et odit hic quasi libero nihil est accusantium.	2	User::Agent	0	407.0	727.0	1	Jerdedaugherty	Princess Denesik	644-270-2357	hayley@buckridgeyundt.info	2011-02-08 10:51:15.184348	2011-02-08 10:51:15.184348	2011-02-13	Lauryn129716227446481 Steuber	1	t	\N	0	0	f	f	-1	1	2011-02-08 10:51:15.191321	\N	\N	718 Zboncak Hollow	\N	\N	Port Urielland	61084	Worcestershire	\N	\N	\N	\N	t
7	GPS receivers required	3	Maiores architecto optio quam perspiciatis.Tempora quasi ut voluptas quia praesentium earum eaque.	Ea non totam nostrum cumque ea incidunt qui.Amet impedit pariatur temporibus.	2	User::Agent	0	744.0	286.0	1	Gleichner	Miss Emilia Fadel	1-266-646-5743	ernest@ebert.uk	2011-02-08 10:51:15.255475	2011-02-08 10:51:15.255475	2011-02-13	Lauryn129716227446481 Steuber	1	t	\N	0	0	f	f	-1	1	2011-02-08 10:51:15.26235	\N	\N	37971 Kaylie Mount	\N	\N	Jodieville	12432	South Yorkshire	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-08 10:51:13.738277	2011-02-08 10:51:13.738277
2	default_leads_per_page	--- 5\n	2011-02-08 10:51:13.743828	2011-02-08 10:51:13.743828
3	certification_level_1	--- 10\n	2011-02-08 10:51:13.747687	2011-02-08 10:51:13.747687
4	certification_level_2	--- 20\n	2011-02-08 10:51:13.751285	2011-02-08 10:51:13.751285
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-08 10:51:13.753637	2011-02-08 10:51:13.753637
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-08 10:51:13.755719	2011-02-08 10:51:13.755719
7	invoicing_seller_name	--- Fairleads\n	2011-02-08 10:51:13.757977	2011-02-08 10:51:13.757977
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-08 10:51:13.760088	2011-02-08 10:51:13.760088
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-08 10:51:13.762346	2011-02-08 10:51:13.762346
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-08 10:51:13.764517	2011-02-08 10:51:13.764517
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
1	blazejek@gmail.com	443f43bfe1738a804c2483f89e03f70a1e6e56bd75d619659f0ea5c93e5804a2d0267fd9ab9408cdfcde335313440eaba402c4b425aeb864ff7c0fb05e5c7a58	Ys6_fmxaOGXiW_X2bNUh	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 10:51:14.296484	2011-02-08 10:51:14.227899	\N	2011-02-08 10:51:14.232945	2011-02-08 10:51:14.296784	1	Emmie	Moore	177-893-8047	root	Celine Common	Port Roselynfurt	32612	Isle of Wight	1	\N	\N	\N	\N	0	\N	\N	\N	\N	JYlMz5KqRYvwQKLNUQdfEbf2RgFyWkIplnDgkt8ZSE4K5zxJ7uRCjsqLw1MQEc	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	3a76f1a35e6c8bc0c045da167e1fdf27fffa37186e8e462539fb5a0765ead953887da7666c2f0268e3f92d08040f506108403e334245115fe2f655a1cdc99092	MXLRkoyDMUvKokOZ2vG9	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 10:51:14.498082	2011-02-08 10:51:14.473536	\N	2011-02-08 10:51:14.475485	2011-02-08 10:51:14.498381	2	Lauryn129716227446481	Steuber	(465)620-3251 x050	Alanna Swaniawski129716227446452	Derrick Road	South Opalmouth	28421	Cumbria	1	\N	0	\N	\N	0	\N	\N	\N	\N	hZGdEv1DGuO5cwT2FzRizXVuDEKHw6Uv8ZCAhq5uVoAj5D4SSYfsGR4KYooZoF	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	b3f1bf45c3bf28d86e425ad19de68a823a60fc0479b2367281046227517dea06a4fe58dff546e2cad13ef2796bfc346bcb38eac6671acc9e67b6ad35013db3b0	FzfiT_Y-r3xU_CU9XHrA	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 10:51:15.371671	2011-02-08 10:51:15.349207	\N	2011-02-08 10:51:15.351006	2011-02-08 10:51:15.37196	1	Lydia	O'Connell	783-573-7303	Merle Champlin129716227534331	Freeman Forks	North Annamaeberg	40507	Northamptonshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	OGX8J93pb730MTGiNpP3yfpewybxtwDXYCZiC1H3VQ3S4hA32jT8A1opI4K9qk	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	0b0d58588e4233a1567ad52726629bcecdd2cae459e14b4cf15920794b7eccfc97ec00819913ff9f90df2b10851402845bfbc528bdeb3e26f05e9d5e08c17124	mDJ-nxCk0XTOnHLyGvPZ	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 10:51:15.432915	2011-02-08 10:51:15.408446	\N	2011-02-08 10:51:15.410223	2011-02-08 10:51:15.433255	48	Lavada	Sawayn	553.745.4769	Eunice Eichmann129716227540233	Jeromy Road	Lynchland	38219	Highlands and Islands	1	\N	\N	\N	\N	0	\N	\N	\N	\N	UM8HVllUKGsdtOHHXLFjXs8D4Py3vB9pWZdzhCCTFDubuQkDnaII7qApXRC4JD	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	128dc21f8a16b8babb11285aa5edc5ee134c342618b40820ae84a71d7d55b9c5204d6cbadeb8a79ab160d865188acdb1faceb5c4f7abab447dd29a74326b3ae4	ZfSJFVOkAVTp9g47e5sH	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 10:51:15.640031	2011-02-08 10:51:15.46915	\N	2011-02-08 10:51:15.470927	2011-02-08 10:51:15.65654	64	Lela	Waters	1-460-100-6875 x5425	Samson Davis129716227546331	Schumm Highway	Wuckertstad	21281	Cumbria	1	\N	\N	4	\N	0	\N	\N	\N	\N	rK2Hj4CKKuN85m06AOIHlN0ESKXd0TyfzUeGB8U1reORJKzWM6f1f3KiFxQziw	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

