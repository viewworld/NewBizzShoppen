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
1	1	dk	About us	About us	2011-02-08 09:43:09.826316	2011-02-08 09:43:09.826316
2	1	en	About us	About us	2011-02-08 09:43:09.841117	2011-02-08 09:43:09.841117
3	2	dk	Privacy	Privacy	2011-02-08 09:43:09.873457	2011-02-08 09:43:09.873457
4	2	en	Privacy	Privacy	2011-02-08 09:43:09.885034	2011-02-08 09:43:09.885034
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-08 09:43:10.05938	2011-02-08 09:43:10.05938
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-08 09:43:10.070801	2011-02-08 09:43:10.070801
7	4	dk	Blurb sign up	Blurb sign up	2011-02-08 09:43:10.106372	2011-02-08 09:43:10.106372
8	4	en	Blurb sign up	Blurb sign up	2011-02-08 09:43:10.118516	2011-02-08 09:43:10.118516
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-08 09:43:10.14745	2011-02-08 09:43:10.14745
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-08 09:43:10.159509	2011-02-08 09:43:10.159509
11	6	dk	Blurb agent home	Blurb agent home	2011-02-08 09:43:10.189315	2011-02-08 09:43:10.189315
12	6	en	Blurb agent home	Blurb agent home	2011-02-08 09:43:10.201143	2011-02-08 09:43:10.201143
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-08 09:43:10.229147	2011-02-08 09:43:10.229147
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-08 09:43:10.240812	2011-02-08 09:43:10.240812
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-08 09:43:10.270191	2011-02-08 09:43:10.270191
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-08 09:43:10.282183	2011-02-08 09:43:10.282183
17	9	dk	Blurb currencies	Blurb currencies	2011-02-08 09:43:10.312697	2011-02-08 09:43:10.312697
18	9	en	Blurb currencies	Blurb currencies	2011-02-08 09:43:10.325752	2011-02-08 09:43:10.325752
19	10	dk	Blurb category home	Blurb category home	2011-02-08 09:43:10.356528	2011-02-08 09:43:10.356528
20	10	en	Blurb category home	Blurb category home	2011-02-08 09:43:10.368281	2011-02-08 09:43:10.368281
21	11	dk	Reset password	Reset password	2011-02-08 09:43:10.56161	2011-02-08 09:43:10.56161
22	11	en	Reset password	Reset password	2011-02-08 09:43:10.573323	2011-02-08 09:43:10.573323
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-08 09:43:09.817478	2011-02-08 09:43:09.843886	about_us	t	2011-02-08 09:43:09.843803	\N	\N
2	Article::Cms::MainPageArticle	2011-02-08 09:43:09.868948	2011-02-08 09:43:09.887753	privacy	t	2011-02-08 09:43:09.887672	\N	\N
3	Article::Cms::MainPageArticle	2011-02-08 09:43:10.055285	2011-02-08 09:43:10.073631	terms_conditions	t	2011-02-08 09:43:10.073552	\N	\N
4	Article::Cms::InterfaceContentText	2011-02-08 09:43:10.100176	2011-02-08 09:43:10.121371	blurb_sign_up	t	2011-02-08 09:43:10.121296	\N	\N
5	Article::Cms::InterfaceContentText	2011-02-08 09:43:10.143347	2011-02-08 09:43:10.162429	blurb_buyer_home	t	2011-02-08 09:43:10.162355	\N	\N
6	Article::Cms::InterfaceContentText	2011-02-08 09:43:10.185162	2011-02-08 09:43:10.20392	blurb_agent_home	t	2011-02-08 09:43:10.203845	\N	\N
7	Article::Cms::InterfaceContentText	2011-02-08 09:43:10.225088	2011-02-08 09:43:10.243626	blurb_purchase_manager_home	t	2011-02-08 09:43:10.243547	\N	\N
8	Article::Cms::InterfaceContentText	2011-02-08 09:43:10.265379	2011-02-08 09:43:10.28509	blurb_start_page_role_selection	t	2011-02-08 09:43:10.284909	\N	\N
9	Article::Cms::InterfaceContentText	2011-02-08 09:43:10.308487	2011-02-08 09:43:10.328786	blurb_currencies	t	2011-02-08 09:43:10.328702	\N	\N
10	Article::Cms::InterfaceContentText	2011-02-08 09:43:10.351358	2011-02-08 09:43:10.371197	blurb_category_home	t	2011-02-08 09:43:10.371119	\N	\N
11	Article::Cms::HelpPopup	2011-02-08 09:43:10.39851	2011-02-08 09:43:10.576073	reset_password	t	2011-02-08 09:43:10.575993	\N	\N
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-08 09:43:07.808698	2011-02-08 09:43:07.808698	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Ducimus aliquam ipsa autem ut ex esse perspiciatis quod.Eum ea iure ullam provident ut.	2011-02-08 09:43:08.369235	2011-02-08 09:43:08.369235	\N	1	2	\N	0	electronics	f	0
2	Leisure	Autem voluptatum corporis ut officiis.Omnis qui et dolorum fuga quas aut.	2011-02-08 09:43:08.415065	2011-02-08 09:43:08.415065	\N	3	4	\N	0	leisure	f	0
3	Business	Quidem impedit necessitatibus omnis aut et voluptates aut ut.Et doloremque illo omnis ipsa beatae dolores ut est.	2011-02-08 09:43:08.45001	2011-02-08 09:43:09.327593	\N	5	6	\N	7	business	f	7
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
1	1	en	Ducimus aliquam ipsa autem ut ex esse perspiciatis quod.Eum ea iure ullam provident ut.	Electronics	2011-02-08 09:43:08.378209	2011-02-08 09:43:08.378209
2	1	dk	\N	Electronics	2011-02-08 09:43:08.4051	2011-02-08 09:43:08.4051
3	2	en	Autem voluptatum corporis ut officiis.Omnis qui et dolorum fuga quas aut.	Leisure	2011-02-08 09:43:08.419368	2011-02-08 09:43:08.419368
4	2	dk	\N	Leisure	2011-02-08 09:43:08.439367	2011-02-08 09:43:08.439367
5	3	en	Quidem impedit necessitatibus omnis aut et voluptates aut ut.Et doloremque illo omnis ipsa beatae dolores ut est.	Business	2011-02-08 09:43:08.454183	2011-02-08 09:43:08.454183
6	3	dk	\N	Business	2011-02-08 09:43:08.474474	2011-02-08 09:43:08.474474
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-08 09:43:07.794496	2011-02-08 09:43:07.794496
2	United Kingdom	2011-02-08 09:43:07.799454	2011-02-08 09:43:07.799454
3	Wales129715818850196	2011-02-08 09:43:08.503362	2011-02-08 09:43:08.503362
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
1	Euro	&euro;	%u%n	t	2011-02-08 09:43:08.347024	2011-02-08 09:43:08.347024
2	PLN	&pln;	%u%n	t	2011-02-08 09:43:08.351347	2011-02-08 09:43:08.351347
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-08 09:43:07.839873	2011-02-08 09:43:07.839873
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-08 09:43:07.85517	2011-02-08 09:43:07.85517
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-08 09:43:07.867964	2011-02-08 09:43:07.867964
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-08 09:43:07.881601	2011-02-08 09:43:07.881601
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-08 09:43:07.894641	2011-02-08 09:43:07.894641
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-08 09:43:07.908148	2011-02-08 09:43:07.908148
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-02-08 09:43:07.922053	2011-02-08 09:43:07.922053
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-02-08 09:43:07.935603	2011-02-08 09:43:07.935603
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-08 09:43:07.949468	2011-02-08 09:43:07.949468
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-08 09:43:07.96299	2011-02-08 09:43:07.96299
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-08 09:43:07.977132	2011-02-08 09:43:07.977132
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-08 09:43:07.990053	2011-02-08 09:43:07.990053
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-08 09:43:08.004056	2011-02-08 09:43:08.004056
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-08 09:43:08.15604	2011-02-08 09:43:08.15604
15	8	en	Question	<p></p>	2011-02-08 09:43:08.173087	2011-02-08 09:43:08.173087
16	8	dk	[DK] Question	<p></p>	2011-02-08 09:43:08.185538	2011-02-08 09:43:08.185538
17	9	en	Invoice	<p></p>	2011-02-08 09:43:08.198112	2011-02-08 09:43:08.198112
18	9	dk	[DK] Invoice	<p></p>	2011-02-08 09:43:08.210446	2011-02-08 09:43:08.210446
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-08 09:43:07.830817	2011-02-08 09:43:07.851099
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-08 09:43:07.863308	2011-02-08 09:43:07.876356
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-08 09:43:07.889972	2011-02-08 09:43:07.903751
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-08 09:43:07.917195	2011-02-08 09:43:07.931366
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-08 09:43:07.944664	2011-02-08 09:43:07.958645
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-08 09:43:07.971647	2011-02-08 09:43:07.98567
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-08 09:43:07.999335	2011-02-08 09:43:08.151046
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-08 09:43:08.164642	2011-02-08 09:43:08.181378
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-08 09:43:08.193615	2011-02-08 09:43:08.206211
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
1	1	dk	Dolor ut ratione odit nesciunt voluptatem.Dignissimos porro rerum minima dicta.	Et qui dolore quod ut nulla tenetur in.Vitae cupiditate placeat voluptatem alias.	Big deal on printers	2011-02-08 09:43:08.756833	2011-02-08 09:43:08.756833
2	2	dk	At debitis consectetur in.Ea ut sint ex sapiente maiores tenetur mollitia veniam.	Et fugit ut soluta aut et velit.Qui cum omnis dolore voluptas.	Drills required	2011-02-08 09:43:08.832022	2011-02-08 09:43:08.832022
3	3	dk	Incidunt aspernatur deserunt maxime quibusdam.Est autem aut a rem dolor.	Explicabo quis rerum id ut officiis dolores.Amet ut et similique facilis repellat.	Need assistance in selling a car	2011-02-08 09:43:08.901614	2011-02-08 09:43:08.901614
4	4	dk	Omnis est quam iste repellat nobis.Odio quia temporibus culpa quibusdam velit nemo et ad.	Est autem et dolores est est dolorum quaerat voluptatem.Aspernatur ut mollitia nihil eum odit dolor dolorem dignissimos.	Ipod shipment	2011-02-08 09:43:08.971557	2011-02-08 09:43:08.971557
5	5	dk	Eum aut qui molestiae aperiam consequatur.Dolores sunt reiciendis omnis qui.	Maiores temporibus molestiae quas accusantium magnam impedit perspiciatis.Quia consequatur officia libero vel odit officiis quae.	Trip to amazonia - looking for offer	2011-02-08 09:43:09.192836	2011-02-08 09:43:09.192836
6	6	dk	Rem est consequatur libero ipsam id.Libero sunt tenetur ut temporibus non.	Provident nihil porro quidem.Numquam velit atque harum voluptatem deleniti debitis tempora qui.	LCD - Huge amounts	2011-02-08 09:43:09.263646	2011-02-08 09:43:09.263646
7	7	dk	Qui sequi non voluptas.Veniam neque dicta dolor eius ea assumenda.	Earum magnam porro in culpa eos aut.Earum quasi vitae libero facilis.	GPS receivers required	2011-02-08 09:43:09.335003	2011-02-08 09:43:09.335003
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Dolor ut ratione odit nesciunt voluptatem.Dignissimos porro rerum minima dicta.	Et qui dolore quod ut nulla tenetur in.Vitae cupiditate placeat voluptatem alias.	2	User::Agent	0	260.0	916.0	1	Kerluke	Edmond Aufderhar	788.954.9653	benedict@leffler.com	2011-02-08 09:43:08.714628	2011-02-08 09:43:08.714628	2011-02-13	Carlie129715818850128 Boehm	1	t	\N	0	0	f	f	-1	1	2011-02-08 09:43:08.72468	\N	\N	35374 Cruickshank Shore	\N	\N	Lake Giovanishire	68862-6310	Bedfordshire	\N	\N	\N	\N	t
2	Drills required	3	At debitis consectetur in.Ea ut sint ex sapiente maiores tenetur mollitia veniam.	Et fugit ut soluta aut et velit.Qui cum omnis dolore voluptas.	2	User::Agent	0	318.0	170.0	1	Little	Stefan Thompson Jr.	1-518-736-6575 x25682	reinhold@hyatt.us	2011-02-08 09:43:08.79778	2011-02-08 09:43:08.79778	2011-02-13	Carlie129715818850128 Boehm	1	t	\N	0	0	f	f	-1	1	2011-02-08 09:43:08.804934	\N	\N	01982 Casper Gardens	\N	\N	Raymundoport	83002-5925	West Midlands	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Incidunt aspernatur deserunt maxime quibusdam.Est autem aut a rem dolor.	Explicabo quis rerum id ut officiis dolores.Amet ut et similique facilis repellat.	2	User::Agent	0	717.0	609.0	1	Koeppmann	Mrs. Liza Pouros	1-159-794-4868 x18657	mavis@bauch.uk	2011-02-08 09:43:08.868562	2011-02-08 09:43:08.868562	2011-02-13	Carlie129715818850128 Boehm	1	t	\N	0	0	f	f	-1	1	2011-02-08 09:43:08.875697	\N	\N	646 Schultz Union	\N	\N	Lake Lester	56616-0943	Hampshire	\N	\N	\N	\N	t
4	Ipod shipment	3	Omnis est quam iste repellat nobis.Odio quia temporibus culpa quibusdam velit nemo et ad.	Est autem et dolores est est dolorum quaerat voluptatem.Aspernatur ut mollitia nihil eum odit dolor dolorem dignissimos.	2	User::Agent	0	966.0	935.0	1	Jaskolskistehr	Jimmie Bradtke	1-863-821-3348	ed.waelchi@pouros.info	2011-02-08 09:43:08.937928	2011-02-08 09:43:08.937928	2011-02-13	Carlie129715818850128 Boehm	1	t	\N	0	0	f	f	-1	1	2011-02-08 09:43:08.945113	\N	\N	83531 Hermann Flat	\N	\N	West Mateo	47360-4601	Herefordshire	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Eum aut qui molestiae aperiam consequatur.Dolores sunt reiciendis omnis qui.	Maiores temporibus molestiae quas accusantium magnam impedit perspiciatis.Quia consequatur officia libero vel odit officiis quae.	2	User::Agent	0	559.0	578.0	1	Toy	Cheyenne Lockman	388.758.3573 x8037	lonie@klein.co.uk	2011-02-08 09:43:09.011109	2011-02-08 09:43:09.011109	2011-02-13	Carlie129715818850128 Boehm	1	t	\N	0	0	f	f	-1	1	2011-02-08 09:43:09.018424	\N	\N	2519 Leland Coves	\N	\N	South Bennietown	55843-4816	Dumfries and Galloway	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Rem est consequatur libero ipsam id.Libero sunt tenetur ut temporibus non.	Provident nihil porro quidem.Numquam velit atque harum voluptatem deleniti debitis tempora qui.	2	User::Agent	0	108.0	886.0	1	Padberg	Lacy Champlin	(345)137-1808 x5698	toney_macejkovic@pfannerstillbecker.info	2011-02-08 09:43:09.230181	2011-02-08 09:43:09.230181	2011-02-13	Carlie129715818850128 Boehm	1	t	\N	0	0	f	f	-1	1	2011-02-08 09:43:09.237432	\N	\N	99662 Avis Drives	\N	\N	South Lynnmouth	51423-0030	County Tyrone	\N	\N	\N	\N	t
7	GPS receivers required	3	Qui sequi non voluptas.Veniam neque dicta dolor eius ea assumenda.	Earum magnam porro in culpa eos aut.Earum quasi vitae libero facilis.	2	User::Agent	0	472.0	837.0	1	Parker	Jerel Mann	061-460-3630 x7347	rex.purdy@hillsspinka.info	2011-02-08 09:43:09.300781	2011-02-08 09:43:09.300781	2011-02-13	Carlie129715818850128 Boehm	1	t	\N	0	0	f	f	-1	1	2011-02-08 09:43:09.308126	\N	\N	1123 Name Fort	\N	\N	West Fritz	51294	Dyfed	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-08 09:43:07.758166	2011-02-08 09:43:07.758166
2	default_leads_per_page	--- 5\n	2011-02-08 09:43:07.765004	2011-02-08 09:43:07.765004
3	certification_level_1	--- 10\n	2011-02-08 09:43:07.768915	2011-02-08 09:43:07.768915
4	certification_level_2	--- 20\n	2011-02-08 09:43:07.772223	2011-02-08 09:43:07.772223
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-08 09:43:07.774707	2011-02-08 09:43:07.774707
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-08 09:43:07.776788	2011-02-08 09:43:07.776788
7	invoicing_seller_name	--- Fairleads\n	2011-02-08 09:43:07.779244	2011-02-08 09:43:07.779244
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-08 09:43:07.781343	2011-02-08 09:43:07.781343
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-08 09:43:07.783466	2011-02-08 09:43:07.783466
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-08 09:43:07.785628	2011-02-08 09:43:07.785628
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
1	blazejek@gmail.com	f1b686e9ffed6098cbd160c55fa47254a3384c51e7dedf304e37a11c0370dd304e014b5a73f62864aa021c99c371b7d7fab06e8147d0215a695c1348df3c1828	cfKDV9LHHqn5qGVz_xny	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 09:43:08.337121	2011-02-08 09:43:08.269771	\N	2011-02-08 09:43:08.274567	2011-02-08 09:43:08.337437	1	Salma	Upton	(937)978-6634 x36095	root	Mohamed Mountain	North Allenechester	06566	Nottinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	8rkrZtITMcij38lVEHTolstwd5TvwhwiK2eIZKz7lOUrdaYMR0xJFnKAseMv4j	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
2	agent@nbs.com	d976bca5ad63255d481de97ebcd1c13c0a3566de39d47bef2ffb6c53c2371d18f0a72b0bb44385a81052746dfef752f894532e66f4e66b1a7dcb3d411d78ad41	85Jss4kNeoI_ha8DPw26	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 09:43:08.534341	2011-02-08 09:43:08.509824	\N	2011-02-08 09:43:08.511614	2011-02-08 09:43:08.534644	2	Carlie129715818850128	Boehm	428.169.0551	Mustafa Fay129715818850107	Cummerata Underpass	Haagside	12643-9844	Cleveland	1	\N	0	\N	\N	0	\N	\N	\N	\N	rJWWe6KSQvEyLSq1gWxm9XHupVhNnaiUFO8PLdAV2LkuNcDSTxFY7TmCkelZse	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
3	admin@nbs.com	0a4d4025f04e863663d2b46fe58a183a09da2b9364f6259903f8257d5c45b51e3d4dd2d07e7e3c051c0ca086fcce5cd93c10ed15562534eb0095a89800087978	se4sOvaKmChKa9yhtR0I	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 09:43:09.415239	2011-02-08 09:43:09.392556	\N	2011-02-08 09:43:09.394518	2011-02-08 09:43:09.415535	1	Dan	Pollich	641.261.3820 x4997	Miss Lorenzo Dooley129715818938673	Juwan Bypass	New Francisco	95704	Derbyshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	1tTNCE9VuejkIOkgLLcbzIk2jyzwVscugRwTeCfwuuduRTRkfTCbAEt0op50es	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
4	buyer@nbs.com	15705ac32c2a4008ffb03879483b6624ee13ea8958ef6de9c936cc234698b8eaa28fa2ecab035bf081e58d7855c70ae7b270e76d14c17257bd947e3476c77d91	pQzYqO9Q55aAf90ZkhW3	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 09:43:09.476078	2011-02-08 09:43:09.451808	\N	2011-02-08 09:43:09.453755	2011-02-08 09:43:09.476406	48	Frieda	Bruen	121.334.0033 x9433	Russel O'Conner129715818944535	Mike Expressway	O'Connerchester	19434-4728	Wiltshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Gt7LijIZUbr6fZIcasWcB7nmbC6nM9pqB9XNqPngWAfkMho7e0xqxsszAA7gl2	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
5	leaduser@nbs.com	fa6f2d93c9e1c37f488a15b8643f82a44f5ce8ce3cae25172aeea747e3db50310e2f047bdc9466f8946e1fe8dd834a0a13a550e96cc208d5050ac523f080fada	Q0ua20HoahBekmezF3_M	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 09:43:09.687477	2011-02-08 09:43:09.513984	\N	2011-02-08 09:43:09.5159	2011-02-08 09:43:09.703765	64	Cathryn	Rosenbaum	(481)908-6368 x4263	Ali Hintz129715818950617	Jammie Pike	Crooksside	52933-7885	Cornwall	1	\N	\N	4	\N	0	\N	\N	\N	\N	QnYCEHLTSKq2PH43UKx7CmjSQcxslQeXiArzfsWoKoOkcyZ3kUExX29f4dnTnQ	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

