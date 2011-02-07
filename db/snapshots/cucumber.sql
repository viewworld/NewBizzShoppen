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
1	1	dk	About us	About us	2011-02-07 13:29:50.401125	2011-02-07 13:29:50.401125
2	1	en	About us	About us	2011-02-07 13:29:50.429778	2011-02-07 13:29:50.429778
3	2	dk	Privacy	Privacy	2011-02-07 13:29:50.49348	2011-02-07 13:29:50.49348
4	2	en	Privacy	Privacy	2011-02-07 13:29:50.522258	2011-02-07 13:29:50.522258
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-07 13:29:50.583638	2011-02-07 13:29:50.583638
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-07 13:29:50.607561	2011-02-07 13:29:50.607561
7	4	dk	Blurb sign up	Blurb sign up	2011-02-07 13:29:50.66282	2011-02-07 13:29:50.66282
8	4	en	Blurb sign up	Blurb sign up	2011-02-07 13:29:50.682866	2011-02-07 13:29:50.682866
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-07 13:29:50.72979	2011-02-07 13:29:50.72979
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-07 13:29:50.749059	2011-02-07 13:29:50.749059
11	6	dk	Blurb agent home	Blurb agent home	2011-02-07 13:29:50.79869	2011-02-07 13:29:50.79869
12	6	en	Blurb agent home	Blurb agent home	2011-02-07 13:29:50.823363	2011-02-07 13:29:50.823363
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-07 13:29:50.884544	2011-02-07 13:29:50.884544
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-07 13:29:50.903129	2011-02-07 13:29:50.903129
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-07 13:29:50.953538	2011-02-07 13:29:50.953538
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-07 13:29:50.972955	2011-02-07 13:29:50.972955
17	9	dk	Blurb currencies	Blurb currencies	2011-02-07 13:29:51.020524	2011-02-07 13:29:51.020524
18	9	en	Blurb currencies	Blurb currencies	2011-02-07 13:29:51.05078	2011-02-07 13:29:51.05078
19	10	dk	Reset password	Reset password	2011-02-07 13:29:51.106738	2011-02-07 13:29:51.106738
20	10	en	Reset password	Reset password	2011-02-07 13:29:51.128363	2011-02-07 13:29:51.128363
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-02-07 13:29:50.386578	2011-02-07 13:29:50.437683	about_us	0	t	2011-02-07 13:29:50.437537
2	Article::Cms	2011-02-07 13:29:50.486598	2011-02-07 13:29:50.531278	privacy	0	t	2011-02-07 13:29:50.531141
3	Article::Cms	2011-02-07 13:29:50.577032	2011-02-07 13:29:50.615734	terms_conditions	0	t	2011-02-07 13:29:50.615579
4	Article::Cms	2011-02-07 13:29:50.657256	2011-02-07 13:29:50.688649	blurb_sign_up	1	t	2011-02-07 13:29:50.688549
5	Article::Cms	2011-02-07 13:29:50.722622	2011-02-07 13:29:50.756009	blurb_buyer_home	1	t	2011-02-07 13:29:50.75588
6	Article::Cms	2011-02-07 13:29:50.792643	2011-02-07 13:29:50.832659	blurb_agent_home	1	t	2011-02-07 13:29:50.832468
7	Article::Cms	2011-02-07 13:29:50.878983	2011-02-07 13:29:50.909545	blurb_purchase_manager_home	1	t	2011-02-07 13:29:50.909432
8	Article::Cms	2011-02-07 13:29:50.94547	2011-02-07 13:29:50.978772	blurb_start_page_role_selection	1	t	2011-02-07 13:29:50.978665
9	Article::Cms	2011-02-07 13:29:51.012712	2011-02-07 13:29:51.05996	blurb_currencies	1	t	2011-02-07 13:29:51.059779
10	Article::Cms	2011-02-07 13:29:51.100754	2011-02-07 13:29:51.13668	reset_password	2	t	2011-02-07 13:29:51.136495
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-07 13:29:47.661726	2011-02-07 13:29:47.661726	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Non facere beatae aliquid qui pariatur assumenda nisi dignissimos.Eum sit repellat ut reprehenderit esse ut autem repellendus.	2011-02-07 13:29:48.421343	2011-02-07 13:29:48.421343	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Eaque et dolor occaecati nihil aspernatur et vitae.Explicabo ut et est dolorem quia illum.	2011-02-07 13:29:48.502127	2011-02-07 13:29:48.502127	\N	3	4	\N	0	2-leisure	f	0
3	Business	Voluptatum autem ad odio ipsam facilis.Enim tempore nulla ut dolore eum.	2011-02-07 13:29:48.657592	2011-02-07 13:29:49.908569	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Non facere beatae aliquid qui pariatur assumenda nisi dignissimos.Eum sit repellat ut reprehenderit esse ut autem repellendus.	Electronics	2011-02-07 13:29:48.43447	2011-02-07 13:29:48.43447
2	1	dk	\N	Electronics	2011-02-07 13:29:48.483788	2011-02-07 13:29:48.483788
3	2	en	Eaque et dolor occaecati nihil aspernatur et vitae.Explicabo ut et est dolorem quia illum.	Leisure	2011-02-07 13:29:48.508606	2011-02-07 13:29:48.508606
4	2	dk	\N	Leisure	2011-02-07 13:29:48.555584	2011-02-07 13:29:48.555584
5	3	en	Voluptatum autem ad odio ipsam facilis.Enim tempore nulla ut dolore eum.	Business	2011-02-07 13:29:48.666129	2011-02-07 13:29:48.666129
6	3	dk	\N	Business	2011-02-07 13:29:48.785962	2011-02-07 13:29:48.785962
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-07 13:29:47.632671	2011-02-07 13:29:47.632671
2	United Kingdom	2011-02-07 13:29:47.642761	2011-02-07 13:29:47.642761
3	Scotland12970853888868	2011-02-07 13:29:48.890557	2011-02-07 13:29:48.890557
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
1	Euro	&euro;	%u%n	t	2011-02-07 13:29:48.382807	2011-02-07 13:29:48.382807
2	PLN	&pln;	%u%n	t	2011-02-07 13:29:48.395803	2011-02-07 13:29:48.395803
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-07 13:29:47.71373	2011-02-07 13:29:47.71373
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-07 13:29:47.736977	2011-02-07 13:29:47.736977
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-07 13:29:47.759607	2011-02-07 13:29:47.759607
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-07 13:29:47.789196	2011-02-07 13:29:47.789196
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-07 13:29:47.813147	2011-02-07 13:29:47.813147
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-07 13:29:47.84778	2011-02-07 13:29:47.84778
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-07 13:29:47.883008	2011-02-07 13:29:47.883008
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-07 13:29:47.910091	2011-02-07 13:29:47.910091
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-07 13:29:47.936658	2011-02-07 13:29:47.936658
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-07 13:29:47.965077	2011-02-07 13:29:47.965077
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-07 13:29:47.990783	2011-02-07 13:29:47.990783
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-07 13:29:48.016783	2011-02-07 13:29:48.016783
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-07 13:29:48.0465	2011-02-07 13:29:48.0465
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-07 13:29:48.07916	2011-02-07 13:29:48.07916
15	8	en	<p></p>	Question	2011-02-07 13:29:48.101108	2011-02-07 13:29:48.101108
16	8	dk	<p></p>	[DK] Question	2011-02-07 13:29:48.12705	2011-02-07 13:29:48.12705
17	9	en	<p></p>	Invoice	2011-02-07 13:29:48.15413	2011-02-07 13:29:48.15413
18	9	dk	<p></p>	[DK] Invoice	2011-02-07 13:29:48.177169	2011-02-07 13:29:48.177169
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-07 13:29:47.699401	2011-02-07 13:29:47.730977
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-07 13:29:47.752564	2011-02-07 13:29:47.780765
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-07 13:29:47.805731	2011-02-07 13:29:47.836598
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-07 13:29:47.876022	2011-02-07 13:29:47.900737
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-07 13:29:47.927625	2011-02-07 13:29:47.958163
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-07 13:29:47.983661	2011-02-07 13:29:48.009113
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-07 13:29:48.037398	2011-02-07 13:29:48.070971
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-07 13:29:48.094389	2011-02-07 13:29:48.119733
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-07 13:29:48.146309	2011-02-07 13:29:48.170165
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
1	1	dk	Adipisci fugiat enim aut ea vel sed.Eaque voluptas qui praesentium laboriosam odio aut quo.	Big deal on printers	Et aspernatur alias voluptatibus labore dignissimos doloribus perspiciatis sed.Non in labore non veritatis eum illo molestiae.	2011-02-07 13:29:49.08356	2011-02-07 13:29:49.08356
2	2	dk	Delectus voluptas harum explicabo quod aut possimus iste temporibus.Molestiae ad illo et est.	Drills required	Voluptate voluptatibus a reprehenderit sed illo nihil.Maiores eaque id sed id perspiciatis quia modi.	2011-02-07 13:29:49.207239	2011-02-07 13:29:49.207239
3	3	dk	Aperiam explicabo totam perferendis molestiae.Qui eum sunt reprehenderit nobis ea.	Need assistance in selling a car	Est enim provident beatae facere eaque maiores necessitatibus.Tempora ea ut aut impedit quae quia dolore possimus.	2011-02-07 13:29:49.328486	2011-02-07 13:29:49.328486
4	4	dk	Et aut ratione est eaque laudantium a.Ad eligendi ipsum dolores iusto quo sint.	Ipod shipment	Non saepe aspernatur rerum rerum voluptatem reprehenderit incidunt.Dolorem accusamus deserunt sint doloribus a officia.	2011-02-07 13:29:49.435938	2011-02-07 13:29:49.435938
5	5	dk	Sed eius repellendus et harum voluptas aliquam est.Quo esse consequatur doloremque rerum et commodi vero repudiandae.	Trip to amazonia - looking for offer	Autem possimus explicabo aut quia.Officiis quae assumenda facilis repudiandae.	2011-02-07 13:29:49.693253	2011-02-07 13:29:49.693253
6	6	dk	Ut ut omnis harum magni eos sunt minus necessitatibus.Facilis hic reiciendis ratione minima.	LCD - Huge amounts	Voluptatibus et ducimus et accusantium voluptas assumenda praesentium quia.Consequatur excepturi unde laudantium nam sed doloremque.	2011-02-07 13:29:49.8186	2011-02-07 13:29:49.8186
7	7	dk	Et iste rerum nisi vitae.Consequatur nesciunt debitis aut tempora est repellat deleniti minus.	GPS receivers required	Sit facere maxime iusto ut rerum dolorem qui.Quos quo ut magnam rem autem beatae est.	2011-02-07 13:29:49.918595	2011-02-07 13:29:49.918595
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Et aspernatur alias voluptatibus labore dignissimos doloribus perspiciatis sed.Non in labore non veritatis eum illo molestiae.	Adipisci fugiat enim aut ea vel sed.Eaque voluptas qui praesentium laboriosam odio aut quo.	2	User::Agent	0	339.0	415.0	1	Daniel	Camylle Klocko	181.597.4139 x88232	quinten_paucek@durgan.ca	2011-02-07 13:29:49.025465	2011-02-07 13:29:49.025465	2011-02-12	Marlin129708538888486 Price	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:29:49.037862	\N	\N	3966 Erdman Mount	\N	\N	New Clement	77863-5009	West Sussex	\N	\N	\N	\N	t
2	Drills required	3	Voluptate voluptatibus a reprehenderit sed illo nihil.Maiores eaque id sed id perspiciatis quia modi.	Delectus voluptas harum explicabo quod aut possimus iste temporibus.Molestiae ad illo et est.	2	User::Agent	0	450.0	589.0	1	Mertz	Hosea Turner	106.681.6790	ernesto_harris@keelinglowe.us	2011-02-07 13:29:49.159554	2011-02-07 13:29:49.159554	2011-02-12	Marlin129708538888486 Price	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:29:49.168481	\N	\N	8760 Silas Plaza	\N	\N	Bauchside	96735	Cornwall	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Est enim provident beatae facere eaque maiores necessitatibus.Tempora ea ut aut impedit quae quia dolore possimus.	Aperiam explicabo totam perferendis molestiae.Qui eum sunt reprehenderit nobis ea.	2	User::Agent	0	319.0	777.0	1	Willms	Hiram Kling V	(061)489-2570 x15574	victor_armstrong@murphy.co.uk	2011-02-07 13:29:49.273901	2011-02-07 13:29:49.273901	2011-02-12	Marlin129708538888486 Price	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:29:49.284793	\N	\N	9926 Swaniawski Shores	\N	\N	Port Alverafurt	34722-6767	Bedfordshire	\N	\N	\N	\N	t
4	Ipod shipment	3	Non saepe aspernatur rerum rerum voluptatem reprehenderit incidunt.Dolorem accusamus deserunt sint doloribus a officia.	Et aut ratione est eaque laudantium a.Ad eligendi ipsum dolores iusto quo sint.	2	User::Agent	0	577.0	304.0	1	Jewess	Payton Schiller	1-002-699-6571 x658	thomas@carrollreichel.ca	2011-02-07 13:29:49.386664	2011-02-07 13:29:49.386664	2011-02-12	Marlin129708538888486 Price	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:29:49.395676	\N	\N	4230 Halvorson Summit	\N	\N	Drakestad	01321	Gwent	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Autem possimus explicabo aut quia.Officiis quae assumenda facilis repudiandae.	Sed eius repellendus et harum voluptas aliquam est.Quo esse consequatur doloremque rerum et commodi vero repudiandae.	2	User::Agent	0	905.0	855.0	1	Ryantoy	Polly Swift	1-769-457-8590 x129	chaz.beier@wiegand.co.uk	2011-02-07 13:29:49.649277	2011-02-07 13:29:49.649277	2011-02-12	Marlin129708538888486 Price	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:29:49.658224	\N	\N	85290 O'Kon Causeway	\N	\N	South Yesenia	47783-8388	Suffolk	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Voluptatibus et ducimus et accusantium voluptas assumenda praesentium quia.Consequatur excepturi unde laudantium nam sed doloremque.	Ut ut omnis harum magni eos sunt minus necessitatibus.Facilis hic reiciendis ratione minima.	2	User::Agent	0	852.0	727.0	1	Tromp	Cooper Purdy	973.306.1492 x640	ernestina.windler@rogahn.ca	2011-02-07 13:29:49.749563	2011-02-07 13:29:49.749563	2011-02-12	Marlin129708538888486 Price	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:29:49.762177	\N	\N	2566 Parisian Forks	\N	\N	North Reeseshire	95536-2876	Greater Manchester	\N	\N	\N	\N	t
7	GPS receivers required	3	Sit facere maxime iusto ut rerum dolorem qui.Quos quo ut magnam rem autem beatae est.	Et iste rerum nisi vitae.Consequatur nesciunt debitis aut tempora est repellat deleniti minus.	2	User::Agent	0	656.0	398.0	1	Paucek	Mr. Chaim Feest	926-202-5438	nolan_von@cruickshank.co.uk	2011-02-07 13:29:49.869304	2011-02-07 13:29:49.869304	2011-02-12	Marlin129708538888486 Price	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:29:49.879661	\N	\N	7381 Abbott Drive	\N	\N	East Ryleyfurt	39641-0127	Dyfed	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-07 13:29:47.532509	2011-02-07 13:29:47.532509
2	default_leads_per_page	--- 5\n	2011-02-07 13:29:47.543917	2011-02-07 13:29:47.543917
3	certification_level_1	--- 10\n	2011-02-07 13:29:47.554471	2011-02-07 13:29:47.554471
4	certification_level_2	--- 20\n	2011-02-07 13:29:47.56331	2011-02-07 13:29:47.56331
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-07 13:29:47.570048	2011-02-07 13:29:47.570048
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-07 13:29:47.577786	2011-02-07 13:29:47.577786
7	invoicing_seller_name	--- Fairleads\n	2011-02-07 13:29:47.586039	2011-02-07 13:29:47.586039
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-07 13:29:47.593508	2011-02-07 13:29:47.593508
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-07 13:29:47.600408	2011-02-07 13:29:47.600408
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-07 13:29:47.608659	2011-02-07 13:29:47.608659
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers, vat_number, not_charge_vat, bank_account_id) FROM stdin;
1	blazejek@gmail.com	ba6dbcdcacceaa6fa1768b3c4563d8c9829ee32724084f0cd0b668bd9fdd2cbf7b93c267a77644f0822b36862fd1105f91e529b736aef8335cfc1d7e1fb85aa3	H1zf7ErVbYeocStV9USY	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 13:29:48.349646	2011-02-07 13:29:48.23344	\N	2011-02-07 13:29:48.242807	2011-02-07 13:29:48.355397	1	Alejandra	Baumbach	(364)228-8091	root	Tiffany Stream	New Scottiefurt	63581	Berkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	z9FJ3iwK9TL4uoN35E2KdGDGAJJAUPToc3MR7Gwi7FG2gnNARn57Vw0Edsdczr	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
2	agent@nbs.com	afb96542aa1b1c8c86b3e2165fe95388e15db2e5f0e349c89b4e1788923639ba00c2fcadd00e6bff746e66117d0478e83aec11e902b95df389dbe782057d51f3	yIaycVQqRoeycmj4cMUE	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 13:29:48.951171	2011-02-07 13:29:48.907882	\N	2011-02-07 13:29:48.910943	2011-02-07 13:29:48.951911	2	Marlin129708538888486	Price	871-276-5296	Joanne Reynolds129708538888389	Faustino Prairie	Busterstad	06411	Buckinghamshire	1	\N	0	\N	\N	0	\N	\N	\N	\N	QzltfLtij0zaryNH5d1v7J2TuCMeYwe4kQjkcX9CLNrOXD2VrcVXdjLgo7vSus	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
3	admin@nbs.com	2ed98163de93694b24bc4cbf61bb9e9d4e03090f4aa494d8f33bcdda76e690b2e101db0e551756c6464bde8cce4ed69666c487b6504003af38e9f7e13046f4b5	6OVkrv529pqnS4_QIKCt	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 13:29:50.042412	2011-02-07 13:29:50.008333	\N	2011-02-07 13:29:50.011347	2011-02-07 13:29:50.042937	1	Pete	Stokes	071.954.9261 x5270	Trent Lemke129708538999932	Homenick Oval	New Zacheryville	88374-0866	Warwickshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	FK5ngrzTZCUMEb0Kv8PfuCs58DLOlbUeiSZfm5PJK1dSNj8Zq315u3Hd3xWhHv	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
4	buyer@nbs.com	e5a14e71e6ad8b75e7acda45452af8d0f7c502eb1cb7529e74ff08ac4fdc3d2229fdc522d989eb1a527f99c71213da788b9715274ddba7e8a167b38dd5e6dbd6	d8RmqgEgxU7ZOCf0R-Ju	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 13:29:50.13615	2011-02-07 13:29:50.096016	\N	2011-02-07 13:29:50.098831	2011-02-07 13:29:50.136622	48	Twila	Nicolas	586.746.4081 x61974	Chaz Heller129708539008602	Matilde Shore	Arahaven	44838	Gwent	1	\N	\N	\N	\N	0	\N	\N	\N	\N	dAeje9gDFzeHFS43xaOU773rENx2t8FaIgyo8nG0JZw1HLLwVgblUs6nV02CrH	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
5	leaduser@nbs.com	ec2ac34423ca185309f94a34aee7eb64120c3678343869c81a8bd3585667cffafc62681ae4da4b80ffa502e9bc14c3f15b270406640284ca6971d8f725635ba6	erepxO4iTO7zzB2MOO66	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 13:29:50.231077	2011-02-07 13:29:50.187039	\N	2011-02-07 13:29:50.189684	2011-02-07 13:29:50.259264	64	Roderick	Mohr	1-294-742-9551 x307	Leo Hudson129708539017892	Torphy Villages	Cummerataview	59185	Humberside	1	\N	\N	4	\N	0	\N	\N	\N	\N	zxyvpFbOG7ypwev4bfGoMvSOVBRv5PCYkE7Qjf38ZEbP3iOBLr4vn8cUVoVtRL	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

