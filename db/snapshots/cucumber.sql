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

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-08 08:24:05.69749	2011-02-08 08:24:05.69749
2	1	en	About us	About us	2011-02-08 08:24:05.718223	2011-02-08 08:24:05.718223
3	2	dk	Privacy	Privacy	2011-02-08 08:24:05.775364	2011-02-08 08:24:05.775364
4	2	en	Privacy	Privacy	2011-02-08 08:24:05.792643	2011-02-08 08:24:05.792643
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-08 08:24:05.839663	2011-02-08 08:24:05.839663
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-08 08:24:05.859527	2011-02-08 08:24:05.859527
7	4	dk	Blurb sign up	Blurb sign up	2011-02-08 08:24:05.909006	2011-02-08 08:24:05.909006
8	4	en	Blurb sign up	Blurb sign up	2011-02-08 08:24:05.926971	2011-02-08 08:24:05.926971
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-08 08:24:05.971119	2011-02-08 08:24:05.971119
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-08 08:24:05.990094	2011-02-08 08:24:05.990094
11	6	dk	Blurb agent home	Blurb agent home	2011-02-08 08:24:06.041242	2011-02-08 08:24:06.041242
12	6	en	Blurb agent home	Blurb agent home	2011-02-08 08:24:06.058677	2011-02-08 08:24:06.058677
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-08 08:24:06.102022	2011-02-08 08:24:06.102022
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-08 08:24:06.119964	2011-02-08 08:24:06.119964
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-08 08:24:06.162736	2011-02-08 08:24:06.162736
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-08 08:24:06.180956	2011-02-08 08:24:06.180956
17	9	dk	Blurb currencies	Blurb currencies	2011-02-08 08:24:06.228559	2011-02-08 08:24:06.228559
18	9	en	Blurb currencies	Blurb currencies	2011-02-08 08:24:06.245867	2011-02-08 08:24:06.245867
19	10	dk	Blurb category home	Blurb category home	2011-02-08 08:24:06.292538	2011-02-08 08:24:06.292538
20	10	en	Blurb category home	Blurb category home	2011-02-08 08:24:06.309328	2011-02-08 08:24:06.309328
21	11	dk	Reset password	Reset password	2011-02-08 08:24:06.368959	2011-02-08 08:24:06.368959
22	11	en	Reset password	Reset password	2011-02-08 08:24:06.388432	2011-02-08 08:24:06.388432
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-08 08:24:05.686656	2011-02-08 08:24:05.724836	about_us	t	2011-02-08 08:24:05.724701	\N	\N
2	Article::Cms::MainPageArticle	2011-02-08 08:24:05.769791	2011-02-08 08:24:05.798082	privacy	t	2011-02-08 08:24:05.797981	\N	\N
3	Article::Cms::MainPageArticle	2011-02-08 08:24:05.834259	2011-02-08 08:24:05.865096	terms_conditions	t	2011-02-08 08:24:05.864978	\N	\N
4	Article::Cms::InterfaceContentText	2011-02-08 08:24:05.901474	2011-02-08 08:24:05.93329	blurb_sign_up	t	2011-02-08 08:24:05.933178	\N	\N
5	Article::Cms::InterfaceContentText	2011-02-08 08:24:05.965581	2011-02-08 08:24:05.996542	blurb_buyer_home	t	2011-02-08 08:24:05.996406	\N	\N
6	Article::Cms::InterfaceContentText	2011-02-08 08:24:06.035961	2011-02-08 08:24:06.064295	blurb_agent_home	t	2011-02-08 08:24:06.064167	\N	\N
7	Article::Cms::InterfaceContentText	2011-02-08 08:24:06.096799	2011-02-08 08:24:06.125426	blurb_purchase_manager_home	t	2011-02-08 08:24:06.125305	\N	\N
8	Article::Cms::InterfaceContentText	2011-02-08 08:24:06.157381	2011-02-08 08:24:06.188073	blurb_start_page_role_selection	t	2011-02-08 08:24:06.187937	\N	\N
9	Article::Cms::InterfaceContentText	2011-02-08 08:24:06.223254	2011-02-08 08:24:06.252202	blurb_currencies	t	2011-02-08 08:24:06.252103	\N	\N
10	Article::Cms::InterfaceContentText	2011-02-08 08:24:06.287267	2011-02-08 08:24:06.314753	blurb_category_home	t	2011-02-08 08:24:06.314623	\N	\N
11	Article::Cms::HelpPopup	2011-02-08 08:24:06.361354	2011-02-08 08:24:06.393712	reset_password	t	2011-02-08 08:24:06.39361	\N	\N
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-08 08:24:03.707213	2011-02-08 08:24:03.707213	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Esse porro ratione nihil praesentium et aspernatur dolor fugit.Porro ut voluptas quo sed.	2011-02-08 08:24:04.332724	2011-02-08 08:24:04.332724	\N	1	2	\N	0	electronics	f	0
2	Leisure	Earum facere similique vitae aut.At deleniti qui autem praesentium sit autem quia fugit.	2011-02-08 08:24:04.394123	2011-02-08 08:24:04.394123	\N	3	4	\N	0	leisure	f	0
3	Business	Aspernatur architecto doloribus voluptatem adipisci dolorum.Ipsum cumque id consequuntur qui sed rerum ut possimus.	2011-02-08 08:24:04.445601	2011-02-08 08:24:05.233	\N	5	6	\N	7	business	f	7
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
1	1	en	Esse porro ratione nihil praesentium et aspernatur dolor fugit.Porro ut voluptas quo sed.	Electronics	2011-02-08 08:24:04.343598	2011-02-08 08:24:04.343598
2	1	dk	\N	Electronics	2011-02-08 08:24:04.378715	2011-02-08 08:24:04.378715
3	2	en	Earum facere similique vitae aut.At deleniti qui autem praesentium sit autem quia fugit.	Leisure	2011-02-08 08:24:04.402153	2011-02-08 08:24:04.402153
4	2	dk	\N	Leisure	2011-02-08 08:24:04.430545	2011-02-08 08:24:04.430545
5	3	en	Aspernatur architecto doloribus voluptatem adipisci dolorum.Ipsum cumque id consequuntur qui sed rerum ut possimus.	Business	2011-02-08 08:24:04.450893	2011-02-08 08:24:04.450893
6	3	dk	\N	Business	2011-02-08 08:24:04.48212	2011-02-08 08:24:04.48212
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-08 08:24:03.675765	2011-02-08 08:24:03.675765
2	United Kingdom	2011-02-08 08:24:03.688712	2011-02-08 08:24:03.688712
3	England129715344452007	2011-02-08 08:24:04.521728	2011-02-08 08:24:04.521728
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
1	Euro	&euro;	%u%n	t	2011-02-08 08:24:04.295427	2011-02-08 08:24:04.295427
2	PLN	&pln;	%u%n	t	2011-02-08 08:24:04.303393	2011-02-08 08:24:04.303393
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-08 08:24:03.748627	2011-02-08 08:24:03.748627
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-08 08:24:03.771492	2011-02-08 08:24:03.771492
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-08 08:24:03.798184	2011-02-08 08:24:03.798184
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-08 08:24:03.815388	2011-02-08 08:24:03.815388
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-08 08:24:03.835999	2011-02-08 08:24:03.835999
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-08 08:24:03.854863	2011-02-08 08:24:03.854863
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-08 08:24:03.876267	2011-02-08 08:24:03.876267
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-08 08:24:03.893004	2011-02-08 08:24:03.893004
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-08 08:24:03.910277	2011-02-08 08:24:03.910277
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-08 08:24:03.928017	2011-02-08 08:24:03.928017
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-08 08:24:03.947581	2011-02-08 08:24:03.947581
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-08 08:24:03.964313	2011-02-08 08:24:03.964313
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-08 08:24:03.981624	2011-02-08 08:24:03.981624
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-08 08:24:03.999207	2011-02-08 08:24:03.999207
15	8	en	<p></p>	Question	2011-02-08 08:24:04.029208	2011-02-08 08:24:04.029208
16	8	dk	<p></p>	[DK] Question	2011-02-08 08:24:04.051925	2011-02-08 08:24:04.051925
17	9	en	<p></p>	Invoice	2011-02-08 08:24:04.069444	2011-02-08 08:24:04.069444
18	9	dk	<p></p>	[DK] Invoice	2011-02-08 08:24:04.090211	2011-02-08 08:24:04.090211
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-08 08:24:03.737984	2011-02-08 08:24:03.764388
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-08 08:24:03.790547	2011-02-08 08:24:03.810203
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-08 08:24:03.829436	2011-02-08 08:24:03.849158
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-08 08:24:03.869807	2011-02-08 08:24:03.888001
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-08 08:24:03.904948	2011-02-08 08:24:03.922788
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-08 08:24:03.941599	2011-02-08 08:24:03.959326
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-08 08:24:03.976293	2011-02-08 08:24:03.994216
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-08 08:24:04.019318	2011-02-08 08:24:04.046586
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-08 08:24:04.064154	2011-02-08 08:24:04.085021
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
1	1	dk	Adipisci error eum provident.Quia velit veritatis est fuga.	Big deal on printers	Qui eos nostrum temporibus fugiat rerum recusandae quaerat.Molestiae inventore ipsum corrupti eius natus.	2011-02-08 08:24:04.671305	2011-02-08 08:24:04.671305
2	2	dk	Corrupti ex asperiores fuga.Sed omnis sint recusandae expedita est porro eligendi.	Drills required	Consequatur voluptas ipsa deleniti eveniet non quia nobis.Iusto asperiores aut neque et velit.	2011-02-08 08:24:04.768415	2011-02-08 08:24:04.768415
3	3	dk	Exercitationem reiciendis aliquid sunt consequatur modi distinctio.Dolor atque aut id ea quia necessitatibus et explicabo.	Need assistance in selling a car	Provident qui veniam libero dicta.Recusandae fugiat enim ipsam.	2011-02-08 08:24:04.864259	2011-02-08 08:24:04.864259
4	4	dk	Ducimus qui ut asperiores iusto iure incidunt accusantium.Aut aliquam non perspiciatis.	Ipod shipment	Autem adipisci rerum esse voluptatem optio ad soluta doloribus.Voluptates totam minus et sed dolorum dolorem aut doloribus.	2011-02-08 08:24:04.955691	2011-02-08 08:24:04.955691
5	5	dk	Accusamus maxime repellat est saepe.Optio non autem et quam adipisci hic.	Trip to amazonia - looking for offer	Rerum est quis delectus atque repellat et commodi.Deleniti et sequi repudiandae est quo debitis architecto.	2011-02-08 08:24:05.04859	2011-02-08 08:24:05.04859
6	6	dk	In sunt autem labore dolore.Ut nesciunt accusantium atque sed et est dolor.	LCD - Huge amounts	Earum nihil sed blanditiis ex.Ipsam quo sunt et excepturi dolorem distinctio.	2011-02-08 08:24:05.146896	2011-02-08 08:24:05.146896
7	7	dk	Officiis delectus aut alias rerum autem possimus aut.Eaque magnam ullam recusandae esse nam et illum.	GPS receivers required	Molestias ipsum distinctio voluptatem ea nostrum eius voluptate.Rem ea doloribus odio saepe accusamus.	2011-02-08 08:24:05.242746	2011-02-08 08:24:05.242746
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Qui eos nostrum temporibus fugiat rerum recusandae quaerat.Molestiae inventore ipsum corrupti eius natus.	Adipisci error eum provident.Quia velit veritatis est fuga.	2	User::Agent	0	874.0	625.0	1	Hintz	Edna Runolfsson	648-295-5366 x645	kristina@donnelly.us	2011-02-08 08:24:04.619446	2011-02-08 08:24:04.619446	2011-02-13	Dejon129715344451921 O'Conner	1	t	\N	0	0	f	f	-1	1	2011-02-08 08:24:04.631236	\N	\N	059 Edwina Rue	\N	\N	Jaredville	73606-2404	Norfolk	\N	\N	\N	\N	t
2	Drills required	3	Consequatur voluptas ipsa deleniti eveniet non quia nobis.Iusto asperiores aut neque et velit.	Corrupti ex asperiores fuga.Sed omnis sint recusandae expedita est porro eligendi.	2	User::Agent	0	825.0	965.0	1	Lednerlarkin	Buster Haley	424-204-8943 x1799	bobby@senger.name	2011-02-08 08:24:04.72476	2011-02-08 08:24:04.72476	2011-02-13	Dejon129715344451921 O'Conner	1	t	\N	0	0	f	f	-1	1	2011-02-08 08:24:04.733206	\N	\N	16379 Greenholt Forges	\N	\N	West Aminashire	26900-1536	Leicestershire	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Provident qui veniam libero dicta.Recusandae fugiat enim ipsam.	Exercitationem reiciendis aliquid sunt consequatur modi distinctio.Dolor atque aut id ea quia necessitatibus et explicabo.	2	User::Agent	0	324.0	392.0	1	Treutelklein	Dr. Miracle Yost	944-673-6168 x765	camryn@harris.ca	2011-02-08 08:24:04.821166	2011-02-08 08:24:04.821166	2011-02-13	Dejon129715344451921 O'Conner	1	t	\N	0	0	f	f	-1	1	2011-02-08 08:24:04.829963	\N	\N	42063 Julianne Extension	\N	\N	Meghanchester	17863-3869	County Armagh	\N	\N	\N	\N	t
4	Ipod shipment	3	Autem adipisci rerum esse voluptatem optio ad soluta doloribus.Voluptates totam minus et sed dolorum dolorem aut doloribus.	Ducimus qui ut asperiores iusto iure incidunt accusantium.Aut aliquam non perspiciatis.	2	User::Agent	0	56.0	729.0	1	Rau	Miss Amaya Muller	690-682-8482	cory@auer.uk	2011-02-08 08:24:04.912774	2011-02-08 08:24:04.912774	2011-02-13	Dejon129715344451921 O'Conner	1	t	\N	0	0	f	f	-1	1	2011-02-08 08:24:04.921212	\N	\N	3532 Nikolaus Common	\N	\N	Emardburgh	67449	South Yorkshire	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Rerum est quis delectus atque repellat et commodi.Deleniti et sequi repudiandae est quo debitis architecto.	Accusamus maxime repellat est saepe.Optio non autem et quam adipisci hic.	2	User::Agent	0	524.0	509.0	1	Flatleylockman	Kaela Bins	(139)477-0988 x10060	josiane@stamm.info	2011-02-08 08:24:05.005748	2011-02-08 08:24:05.005748	2011-02-13	Dejon129715344451921 O'Conner	1	t	\N	0	0	f	f	-1	1	2011-02-08 08:24:05.014381	\N	\N	879 Macejkovic Canyon	\N	\N	Lake Dedric	41571	Cleveland	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Earum nihil sed blanditiis ex.Ipsam quo sunt et excepturi dolorem distinctio.	In sunt autem labore dolore.Ut nesciunt accusantium atque sed et est dolor.	2	User::Agent	0	564.0	900.0	1	Langhilpert	Asha Goldner	784-219-1589	camilla@hettinger.biz	2011-02-08 08:24:05.103609	2011-02-08 08:24:05.103609	2011-02-13	Dejon129715344451921 O'Conner	1	t	\N	0	0	f	f	-1	1	2011-02-08 08:24:05.112233	\N	\N	386 Champlin Divide	\N	\N	Mariohaven	38269	Durham	\N	\N	\N	\N	t
7	GPS receivers required	3	Molestias ipsum distinctio voluptatem ea nostrum eius voluptate.Rem ea doloribus odio saepe accusamus.	Officiis delectus aut alias rerum autem possimus aut.Eaque magnam ullam recusandae esse nam et illum.	2	User::Agent	0	862.0	571.0	1	Lowe	Rosario Ferry	1-395-196-1133 x12369	krystina_gottlieb@vonhoeger.us	2011-02-08 08:24:05.196253	2011-02-08 08:24:05.196253	2011-02-13	Dejon129715344451921 O'Conner	1	t	\N	0	0	f	f	-1	1	2011-02-08 08:24:05.204833	\N	\N	2213 Jacobs River	\N	\N	Port Johnnyhaven	98962-3895	County Fermanagh	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-08 08:24:03.58011	2011-02-08 08:24:03.58011
2	default_leads_per_page	--- 5\n	2011-02-08 08:24:03.590625	2011-02-08 08:24:03.590625
3	certification_level_1	--- 10\n	2011-02-08 08:24:03.599145	2011-02-08 08:24:03.599145
4	certification_level_2	--- 20\n	2011-02-08 08:24:03.612197	2011-02-08 08:24:03.612197
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-08 08:24:03.619082	2011-02-08 08:24:03.619082
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-08 08:24:03.625815	2011-02-08 08:24:03.625815
7	invoicing_seller_name	--- Fairleads\n	2011-02-08 08:24:03.633095	2011-02-08 08:24:03.633095
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-08 08:24:03.640458	2011-02-08 08:24:03.640458
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-08 08:24:03.647278	2011-02-08 08:24:03.647278
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-08 08:24:03.654099	2011-02-08 08:24:03.654099
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers, vat_number, not_charge_vat, bank_account_id, category_id) FROM stdin;
1	blazejek@gmail.com	df68c841c024012e5b205c06126b6293551d3c0ff5574aae5ab56d1c941bcb3a85931bd9adcd114354b0dec94db506836cdbfd1404be6f8eadcd38a86509b9f4	NJpbEGKW2UNcPtkDXVX-	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 08:24:04.272389	2011-02-08 08:24:04.149008	\N	2011-02-08 08:24:04.156644	2011-02-08 08:24:04.273144	1	Armando	Oberbrunner	(453)918-1026	root	Stehr Via	East Rahul	50809-0878	Cambridgeshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	JmxR2JhvIfdxvRMy4XefcGJm21jfkNWjWV4wSD2CgXLoWscsz7ovguCmRWXaCt	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
2	agent@nbs.com	c238b97cda3c4cc9eb375e53d96280397d9fe17fba58211328e7106f2e8a30810274c18d63bc8e74329ace13c415d47bca7e2f7889cecfc6609b5fcddbff940e	BWEofswlrHLMYynIUIhc	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 08:24:04.565523	2011-02-08 08:24:04.533138	\N	2011-02-08 08:24:04.535744	2011-02-08 08:24:04.565994	2	Dejon129715344451921	O'Conner	343.918.9288 x8931	Cindy Barrows129715344451887	Karl Islands	Stammport	19270-3115	Cornwall	1	\N	0	\N	\N	0	\N	\N	\N	\N	3sHqICYEcp0ZKqZESGtBxdz7v1q4aQ5lexx8gzEQa1z1qhJr8WDCbRtOh8tzFN	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
3	admin@nbs.com	c2be572058912b91183bb307ed1fc121a18ab0e827a8d28b646b471f25db47b9b9015cea43176081fa2f53e82405a5cba87ee1f5bdd52ac1a2561646e8816eb7	XHbNAFmWHauaNXtTJLoC	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 08:24:05.359109	2011-02-08 08:24:05.32854	\N	2011-02-08 08:24:05.331112	2011-02-08 08:24:05.359596	1	Chandler	Erdman	261-852-1991	Richmond Jacobson129715344532025	DuBuque Row	Lake Enriquemouth	44861-2899	Wiltshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	zF01TBrmkBB1VbCzoKs4ox1dWvrutRMm8r842mKSNUH4hX8NGF3xGGqNQTaK75	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
4	buyer@nbs.com	1764561f013f9029e5788f79a051c98bcb6db29d18702f4178a8635978c231857c8d514613c891bcfd4beeea2cbb03383ffaa3d308bcaa2dd3d0272fcabda6bc	or5MRxDMhtJdPsxoqIs4	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 08:24:05.442551	2011-02-08 08:24:05.410439	\N	2011-02-08 08:24:05.413025	2011-02-08 08:24:05.443027	48	Jaron	Luettgen	(204)925-2029 x72599	Elmira Lesch129715344540209	Mathilde Trail	New Ladarius	80169-4161	Devon	1	\N	\N	\N	\N	0	\N	\N	\N	\N	jb8gZqcba84ARVAu64y7ZpIoxxPR3SqiuE2rDPp9FdQKjcG1R3QhJtZcKIH9Xm	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
5	leaduser@nbs.com	e08226fc29b73d365b2f804864fe178d83f3f351f542f8ee1556aa8e1555426b1208aa162161f43100e5c2b017b8bf4742be58763ec2f257290951d988d49aaa	ai4D9XVv5vG2Afftf4j9	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 08:24:05.534479	2011-02-08 08:24:05.501435	\N	2011-02-08 08:24:05.504016	2011-02-08 08:24:05.562233	64	Brain	Stark	(298)406-9829 x61271	Marcia Hessel I129715344549359	Abbott Estates	Kipburgh	99938	Dumfries and Galloway	1	\N	\N	4	\N	0	\N	\N	\N	\N	VLQaUL0IrVTcv4IW26YjUlRXzmrO15CXXhJe0iFxbqhG9KcWxnYSaVNrR7QBYj	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

