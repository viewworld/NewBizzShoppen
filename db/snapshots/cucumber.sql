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

SELECT pg_catalog.setval('article_translations_id_seq', 20, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 10, true);


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('assets_id_seq', 1, false);


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

SELECT pg_catalog.setval('settings_id_seq', 11, true);


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
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, content, title, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-02 11:14:07.74445	2011-02-02 11:14:07.74445
2	1	en	About us	About us	2011-02-02 11:14:07.758204	2011-02-02 11:14:07.758204
3	2	dk	Privacy	Privacy	2011-02-02 11:14:07.788662	2011-02-02 11:14:07.788662
4	2	en	Privacy	Privacy	2011-02-02 11:14:07.799679	2011-02-02 11:14:07.799679
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-02 11:14:07.830014	2011-02-02 11:14:07.830014
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-02 11:14:07.841116	2011-02-02 11:14:07.841116
7	4	dk	Blurb sign up	Blurb sign up	2011-02-02 11:14:07.868198	2011-02-02 11:14:07.868198
8	4	en	Blurb sign up	Blurb sign up	2011-02-02 11:14:07.879126	2011-02-02 11:14:07.879126
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-02 11:14:07.908232	2011-02-02 11:14:07.908232
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-02 11:14:07.919656	2011-02-02 11:14:07.919656
11	6	dk	Blurb agent home	Blurb agent home	2011-02-02 11:14:07.950572	2011-02-02 11:14:07.950572
12	6	en	Blurb agent home	Blurb agent home	2011-02-02 11:14:07.962266	2011-02-02 11:14:07.962266
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-02 11:14:07.991308	2011-02-02 11:14:07.991308
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-02 11:14:08.002544	2011-02-02 11:14:08.002544
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-02 11:14:08.031273	2011-02-02 11:14:08.031273
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-02 11:14:08.042623	2011-02-02 11:14:08.042623
17	9	dk	Blurb currencies	Blurb currencies	2011-02-02 11:14:08.2182	2011-02-02 11:14:08.2182
18	9	en	Blurb currencies	Blurb currencies	2011-02-02 11:14:08.229485	2011-02-02 11:14:08.229485
19	10	dk	Reset password	Reset password	2011-02-02 11:14:08.256853	2011-02-02 11:14:08.256853
20	10	en	Reset password	Reset password	2011-02-02 11:14:08.267886	2011-02-02 11:14:08.267886
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-02-02 11:14:07.736011	2011-02-02 11:14:07.760984	about_us	0	t	2011-02-02 11:14:07.760912
2	Article::Cms	2011-02-02 11:14:07.784552	2011-02-02 11:14:07.802389	privacy	0	t	2011-02-02 11:14:07.80232
3	Article::Cms	2011-02-02 11:14:07.825877	2011-02-02 11:14:07.843841	terms_conditions	0	t	2011-02-02 11:14:07.843768
4	Article::Cms	2011-02-02 11:14:07.864157	2011-02-02 11:14:07.881864	blurb_sign_up	1	t	2011-02-02 11:14:07.881793
5	Article::Cms	2011-02-02 11:14:07.904093	2011-02-02 11:14:07.92253	blurb_buyer_home	1	t	2011-02-02 11:14:07.92246
6	Article::Cms	2011-02-02 11:14:07.946285	2011-02-02 11:14:07.965144	blurb_agent_home	1	t	2011-02-02 11:14:07.965069
7	Article::Cms	2011-02-02 11:14:07.987113	2011-02-02 11:14:08.005433	blurb_purchase_manager_home	1	t	2011-02-02 11:14:08.005352
8	Article::Cms	2011-02-02 11:14:08.02714	2011-02-02 11:14:08.045562	blurb_start_page_role_selection	1	t	2011-02-02 11:14:08.045486
9	Article::Cms	2011-02-02 11:14:08.213678	2011-02-02 11:14:08.232248	blurb_currencies	1	t	2011-02-02 11:14:08.232174
10	Article::Cms	2011-02-02 11:14:08.25282	2011-02-02 11:14:08.270649	reset_password	2	t	2011-02-02 11:14:08.270573
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Consequatur quibusdam quo non.Quisquam ea officiis illo libero.	2011-02-02 11:14:06.280239	2011-02-02 11:14:06.280239	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Ut neque temporibus aut ut earum dignissimos aperiam.Quas enim maiores odit ea necessitatibus voluptates ut.	2011-02-02 11:14:06.324879	2011-02-02 11:14:06.324879	\N	3	4	\N	0	2-leisure	f	0
3	Business	Rerum harum numquam eius aut est aut.Voluptatibus temporibus et odit ratione dicta dolorum.	2011-02-02 11:14:06.486568	2011-02-02 11:14:07.180171	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Consequatur quibusdam quo non.Quisquam ea officiis illo libero.	Electronics	2011-02-02 11:14:06.289898	2011-02-02 11:14:06.289898
2	1	dk	\N	Electronics	2011-02-02 11:14:06.31535	2011-02-02 11:14:06.31535
3	2	en	Ut neque temporibus aut ut earum dignissimos aperiam.Quas enim maiores odit ea necessitatibus voluptates ut.	Leisure	2011-02-02 11:14:06.329268	2011-02-02 11:14:06.329268
4	2	dk	\N	Leisure	2011-02-02 11:14:06.47747	2011-02-02 11:14:06.47747
5	3	en	Rerum harum numquam eius aut est aut.Voluptatibus temporibus et odit ratione dicta dolorum.	Business	2011-02-02 11:14:06.490773	2011-02-02 11:14:06.490773
6	3	dk	\N	Business	2011-02-02 11:14:06.508966	2011-02-02 11:14:06.508966
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-02 11:14:05.775945	2011-02-02 11:14:05.775945
2	United Kingdom	2011-02-02 11:14:05.780577	2011-02-02 11:14:05.780577
3	Wales129664524653621	2011-02-02 11:14:06.537537	2011-02-02 11:14:06.537537
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
1	Euro	&euro;	%u%n	t	2011-02-02 11:14:06.2588	2011-02-02 11:14:06.2588
2	PLN	&pln;	%u%n	t	2011-02-02 11:14:06.262822	2011-02-02 11:14:06.262822
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-02 11:14:05.80662	2011-02-02 11:14:05.80662
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-02 11:14:05.821807	2011-02-02 11:14:05.821807
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-02 11:14:05.83475	2011-02-02 11:14:05.83475
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-02 11:14:05.97532	2011-02-02 11:14:05.97532
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-02 11:14:05.987701	2011-02-02 11:14:05.987701
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-02 11:14:05.999744	2011-02-02 11:14:05.999744
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-02-02 11:14:06.012563	2011-02-02 11:14:06.012563
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-02-02 11:14:06.024616	2011-02-02 11:14:06.024616
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-02 11:14:06.037345	2011-02-02 11:14:06.037345
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-02 11:14:06.049682	2011-02-02 11:14:06.049682
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-02 11:14:06.062065	2011-02-02 11:14:06.062065
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-02 11:14:06.074258	2011-02-02 11:14:06.074258
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-02 11:14:06.0866	2011-02-02 11:14:06.0866
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-02 11:14:06.099947	2011-02-02 11:14:06.099947
15	8	en	Question	<p></p>	2011-02-02 11:14:06.112986	2011-02-02 11:14:06.112986
16	8	dk	[DK] Question	<p></p>	2011-02-02 11:14:06.125651	2011-02-02 11:14:06.125651
17	9	en	Invoice	<p></p>	2011-02-02 11:14:06.138613	2011-02-02 11:14:06.138613
18	9	dk	[DK] Invoice	<p></p>	2011-02-02 11:14:06.151423	2011-02-02 11:14:06.151423
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-02 11:14:05.797602	2011-02-02 11:14:05.81741
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-02 11:14:05.83007	2011-02-02 11:14:05.970762
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-02 11:14:05.983277	2011-02-02 11:14:05.995689
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-02 11:14:06.008159	2011-02-02 11:14:06.020424
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-02 11:14:06.032886	2011-02-02 11:14:06.045554
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-02 11:14:06.057686	2011-02-02 11:14:06.069928
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-02 11:14:06.082209	2011-02-02 11:14:06.094528
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-02 11:14:06.108378	2011-02-02 11:14:06.121311
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-02 11:14:06.134019	2011-02-02 11:14:06.146977
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, pkwiu, unit, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at) FROM stdin;
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

COPY lead_template_fields (id, lead_template_id, name, field_type, is_hidden, created_at, updated_at) FROM stdin;
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

COPY lead_templates (id, category_id, name, is_active, is_mandatory, creator_id, creator_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
1	1	dk	Ratione corporis id odit animi facilis.Soluta qui voluptatem laborum.	Cupiditate veniam quia accusantium quae assumenda non commodi.Optio sit at qui eos qui.	Big deal on printers	2011-02-02 11:14:06.644864	2011-02-02 11:14:06.644864
2	2	dk	Nam et magnam labore et inventore.Molestias accusamus amet dolore porro qui ullam.	Aut et velit aut.Velit iste magni laboriosam earum.	Drills required	2011-02-02 11:14:06.714871	2011-02-02 11:14:06.714871
3	3	dk	Tempora aperiam consequatur aut maiores.Qui provident in et unde.	Excepturi fugit voluptatem non quas.Quis nisi quia beatae labore est.	Need assistance in selling a car	2011-02-02 11:14:06.781228	2011-02-02 11:14:06.781228
4	4	dk	Et facilis totam consectetur tempora animi dolores error.Tempora quos vel suscipit.	Iusto sapiente omnis et incidunt.Velit reiciendis ut rem sapiente hic veritatis deleniti.	Ipod shipment	2011-02-02 11:14:06.981881	2011-02-02 11:14:06.981881
5	5	dk	Explicabo non laudantium voluptatibus est omnis aut.Eos qui ut debitis necessitatibus.	Voluptatem et eum sunt reprehenderit rerum.Repellat aut aut in inventore quasi.	Trip to amazonia - looking for offer	2011-02-02 11:14:07.050024	2011-02-02 11:14:07.050024
6	6	dk	Aperiam et eaque ad nobis quo qui asperiores.Unde vel placeat harum quia deserunt.	Possimus maxime tempore numquam.Ut maiores accusantium enim facere reprehenderit in.	LCD - Huge amounts	2011-02-02 11:14:07.120188	2011-02-02 11:14:07.120188
7	7	dk	Sint libero commodi quia omnis similique.Sed id perferendis vel nihil unde atque.	Molestiae perferendis qui molestiae facilis.Nesciunt assumenda mollitia doloremque consequatur.	GPS receivers required	2011-02-02 11:14:07.187021	2011-02-02 11:14:07.187021
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Ratione corporis id odit animi facilis.Soluta qui voluptatem laborum.	Cupiditate veniam quia accusantium quae assumenda non commodi.Optio sit at qui eos qui.	2	User::Agent	0	90.0	509.0	1	Klocko	Hester Mohr	502-677-1637	jalon@douglas.ca	2011-02-02 11:14:06.60407	2011-02-02 11:14:06.60407	2011-02-07	Garrett129664524653543 Fay	1	t	\N	0	0	f	f	-1	1	2011-02-02 11:14:06.613673	\N	\N	132 Fritsch Fall	\N	\N	East Maiastad	48856-5089	South Yorkshire	\N	\N	\N	\N	t
2	Drills required	3	Nam et magnam labore et inventore.Molestias accusamus amet dolore porro qui ullam.	Aut et velit aut.Velit iste magni laboriosam earum.	2	User::Agent	0	955.0	876.0	1	Schaefer	Cortez Mueller MD	1-907-237-1683 x87517	joany_armstrong@lockman.info	2011-02-02 11:14:06.682905	2011-02-02 11:14:06.682905	2011-02-07	Garrett129664524653543 Fay	1	t	\N	0	0	f	f	-1	1	2011-02-02 11:14:06.689695	\N	\N	0111 Joshuah Canyon	\N	\N	Lake Emeraldport	66276	Essex	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Tempora aperiam consequatur aut maiores.Qui provident in et unde.	Excepturi fugit voluptatem non quas.Quis nisi quia beatae labore est.	2	User::Agent	0	338.0	551.0	1	Purdybecker	Winifred Schmitt	883.112.8854	keshaun.davis@lakinprice.biz	2011-02-02 11:14:06.749141	2011-02-02 11:14:06.749141	2011-02-07	Garrett129664524653543 Fay	1	t	\N	0	0	f	f	-1	1	2011-02-02 11:14:06.756014	\N	\N	838 Arvilla Hollow	\N	\N	South Enolabury	92832	Lothian	\N	\N	\N	\N	t
4	Ipod shipment	3	Et facilis totam consectetur tempora animi dolores error.Tempora quos vel suscipit.	Iusto sapiente omnis et incidunt.Velit reiciendis ut rem sapiente hic veritatis deleniti.	2	User::Agent	0	494.0	730.0	1	Sanford	Eleanore Zulauf	641-345-4303 x2510	maryam@greenholt.info	2011-02-02 11:14:06.949357	2011-02-02 11:14:06.949357	2011-02-07	Garrett129664524653543 Fay	1	t	\N	0	0	f	f	-1	1	2011-02-02 11:14:06.956363	\N	\N	4010 Lucas Common	\N	\N	Mosciskiberg	95473	Mid Glamorgan	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Explicabo non laudantium voluptatibus est omnis aut.Eos qui ut debitis necessitatibus.	Voluptatem et eum sunt reprehenderit rerum.Repellat aut aut in inventore quasi.	2	User::Agent	0	203.0	582.0	1	Cormiermcclure	Cara Larkin	1-016-218-3912 x5190	laurine@jacobsonheaney.biz	2011-02-02 11:14:07.01731	2011-02-02 11:14:07.01731	2011-02-07	Garrett129664524653543 Fay	1	t	\N	0	0	f	f	-1	1	2011-02-02 11:14:07.024117	\N	\N	38137 Purdy Mill	\N	\N	Lukasshire	60101	Lancashire	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Aperiam et eaque ad nobis quo qui asperiores.Unde vel placeat harum quia deserunt.	Possimus maxime tempore numquam.Ut maiores accusantium enim facere reprehenderit in.	2	User::Agent	0	469.0	534.0	1	Lindgren	Llewellyn Rosenbaum	295.976.9243	norene_durgan@christiansen.com	2011-02-02 11:14:07.086397	2011-02-02 11:14:07.086397	2011-02-07	Garrett129664524653543 Fay	1	t	\N	0	0	f	f	-1	1	2011-02-02 11:14:07.093172	\N	\N	4986 Gilda Vista	\N	\N	Mackview	56928	Suffolk	\N	\N	\N	\N	t
7	GPS receivers required	3	Sint libero commodi quia omnis similique.Sed id perferendis vel nihil unde atque.	Molestiae perferendis qui molestiae facilis.Nesciunt assumenda mollitia doloremque consequatur.	2	User::Agent	0	214.0	30.0	1	Gleichnersanford	Madelynn Bogan	584-811-9701	gaetano@mann.ca	2011-02-02 11:14:07.154955	2011-02-02 11:14:07.154955	2011-02-07	Garrett129664524653543 Fay	1	t	\N	0	0	f	f	-1	1	2011-02-02 11:14:07.161793	\N	\N	992 Blick Roads	\N	\N	East Janyland	20605-8758	Dorset	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-02 11:14:05.740575	2011-02-02 11:14:05.740575
2	default_leads_per_page	--- 5\n	2011-02-02 11:14:05.746141	2011-02-02 11:14:05.746141
3	certification_level_1	--- 10\n	2011-02-02 11:14:05.749921	2011-02-02 11:14:05.749921
4	certification_level_2	--- 20\n	2011-02-02 11:14:05.752946	2011-02-02 11:14:05.752946
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-02 11:14:05.755123	2011-02-02 11:14:05.755123
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-02 11:14:05.75714	2011-02-02 11:14:05.75714
7	invoicing_seller_name	--- Fairleads\n	2011-02-02 11:14:05.759131	2011-02-02 11:14:05.759131
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-02 11:14:05.761227	2011-02-02 11:14:05.761227
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-02 11:14:05.763285	2011-02-02 11:14:05.763285
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-02-02 11:14:05.765321	2011-02-02 11:14:05.765321
11	invoicing_default_vat_rate	--- 0.15\n	2011-02-02 11:14:05.767468	2011-02-02 11:14:05.767468
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers) FROM stdin;
1	blazejek@gmail.com	7e239648e7df0fc4cb680df2b1e7b4d3e04df16e9262ce8e8021066cc48350e03668f9d63c63c7242f831ee8f436adc69c0d6e3750df9ae0848cacc67b356afd	-cbMnNB8od-Pl5ACbDw6	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 11:14:06.248938	2011-02-02 11:14:06.190024	\N	2011-02-02 11:14:06.190256	2011-02-02 11:14:06.249225	1	Arturo	Paucek	392-747-2089 x37367	root	Ignacio Shoal	Stammmouth	26909	West Yorkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	zQMF8ZuoWVycDQjvGpG9JkGnDuLqm7DUFD16H1RnoklBHKyI1OyMhTn9hx4FI4	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	c884164a8b52212615318aebca775b40e401b944b72641b1530f86bee5461245e7fe32cb546e47f418790488d2009303b9fc5ae56d3589ed9a6322d6f5d232c2	XK8hZVH_X7OI31wqQHqI	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 11:14:06.564469	2011-02-02 11:14:06.542882	\N	2011-02-02 11:14:06.543096	2011-02-02 11:14:06.56476	2	Garrett129664524653543	Fay	286.195.1827 x72354	Armani Stamm129664524653508	Oliver Points	East Madeline	86814	County Antrim	3	\N	0	\N	\N	0	\N	\N	\N	\N	b0E5fqbUfNZNx0WCQ7q676QHdJjzwBYyghcNsmttE4boW6FpHITWWGRukE6Ypj	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	c8d9b31af0829b4e2915e8d6a20fecdbd1f5ff9f6f8fb2070883ed06393066017d71edf9b580e98a2654f1f5895780bbe3ad143fcbf7af486328ec2a3f8a136f	95NS3q30aeaKJMEYTU3G	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 11:14:07.260072	2011-02-02 11:14:07.240424	\N	2011-02-02 11:14:07.240636	2011-02-02 11:14:07.260361	1	Deborah	Feil	172.027.9011	Stuart Lynch129664524723616	Champlin Alley	Summerton	48289-4552	Leicestershire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	uPir7gPTtVQiDibawp1nSBj2mj9ueF1MRv0amOoIEuIZUzMMe63HtTAjBcQjxb	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	e7333c09bf886ef692f239c8acfcb9ae6be4b692720aa1060e65bee75b08774ddc0732036fbdf75cc90258ed138a9507b4b294b39206b97a57a36fb5cb8453d5	F8C1dH2NDQ390IWM6bPp	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 11:14:07.451915	2011-02-02 11:14:07.430388	\N	2011-02-02 11:14:07.430618	2011-02-02 11:14:07.452212	48	Allie	Block	807-684-0215 x1184	Aurelio Kuhn129664524742512	Nitzsche Pike	Franciscaberg	26564	Derbyshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	pgxX0sFc2TeTpbdWaQpAtRZIf3Lf5VgjwtVb072eH01eSiCYfBrw1r5GnotZxv	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	236cc8aa1e0043362ae0d80b8cd59b697172177674e85b1e925da7d054efaa414168e377d297e3b4202d846f4037003bab7d265f404165a3aa559fc8ccc3c3c6	9ioI3v8KyMm_oPscxfJG	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 11:14:07.507343	2011-02-02 11:14:07.485689	\N	2011-02-02 11:14:07.485914	2011-02-02 11:14:07.522391	64	Griffin	Steuber	309-583-9939 x227	Kolby Stoltenberg129664524748074	Jakayla Underpass	New Samantaport	31078-6116	Isle of Wight	1	\N	\N	4	\N	0	\N	\N	\N	\N	qFSs1sPI4ytTfDwhiwlaNU1UuEBK7S5oX37zkZwptOIypLB0AQJEWNWQpSOGMP	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

