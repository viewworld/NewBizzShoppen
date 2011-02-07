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

COPY article_translations (id, article_id, locale, content, title, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-07 13:32:36.99247	2011-02-07 13:32:36.99247
2	1	en	About us	About us	2011-02-07 13:32:37.00778	2011-02-07 13:32:37.00778
3	2	dk	Privacy	Privacy	2011-02-07 13:32:37.041012	2011-02-07 13:32:37.041012
4	2	en	Privacy	Privacy	2011-02-07 13:32:37.054437	2011-02-07 13:32:37.054437
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-07 13:32:37.085944	2011-02-07 13:32:37.085944
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-07 13:32:37.102554	2011-02-07 13:32:37.102554
7	4	dk	Blurb sign up	Blurb sign up	2011-02-07 13:32:37.13278	2011-02-07 13:32:37.13278
8	4	en	Blurb sign up	Blurb sign up	2011-02-07 13:32:37.146101	2011-02-07 13:32:37.146101
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-07 13:32:37.175455	2011-02-07 13:32:37.175455
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-07 13:32:37.187401	2011-02-07 13:32:37.187401
11	6	dk	Blurb agent home	Blurb agent home	2011-02-07 13:32:37.363375	2011-02-07 13:32:37.363375
12	6	en	Blurb agent home	Blurb agent home	2011-02-07 13:32:37.375359	2011-02-07 13:32:37.375359
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-07 13:32:37.403611	2011-02-07 13:32:37.403611
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-07 13:32:37.41533	2011-02-07 13:32:37.41533
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-07 13:32:37.443161	2011-02-07 13:32:37.443161
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-07 13:32:37.454773	2011-02-07 13:32:37.454773
17	9	dk	Blurb currencies	Blurb currencies	2011-02-07 13:32:37.482966	2011-02-07 13:32:37.482966
18	9	en	Blurb currencies	Blurb currencies	2011-02-07 13:32:37.494196	2011-02-07 13:32:37.494196
19	10	dk	Reset password	Reset password	2011-02-07 13:32:37.521737	2011-02-07 13:32:37.521737
20	10	en	Reset password	Reset password	2011-02-07 13:32:37.533282	2011-02-07 13:32:37.533282
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-02-07 13:32:36.983712	2011-02-07 13:32:37.010642	about_us	0	t	2011-02-07 13:32:37.01056
2	Article::Cms	2011-02-07 13:32:37.036564	2011-02-07 13:32:37.057201	privacy	0	t	2011-02-07 13:32:37.057119
3	Article::Cms	2011-02-07 13:32:37.081625	2011-02-07 13:32:37.106225	terms_conditions	0	t	2011-02-07 13:32:37.106083
4	Article::Cms	2011-02-07 13:32:37.128392	2011-02-07 13:32:37.148894	blurb_sign_up	1	t	2011-02-07 13:32:37.148813
5	Article::Cms	2011-02-07 13:32:37.170855	2011-02-07 13:32:37.190172	blurb_buyer_home	1	t	2011-02-07 13:32:37.190091
6	Article::Cms	2011-02-07 13:32:37.359217	2011-02-07 13:32:37.378223	blurb_agent_home	1	t	2011-02-07 13:32:37.37814
7	Article::Cms	2011-02-07 13:32:37.399691	2011-02-07 13:32:37.418089	blurb_purchase_manager_home	1	t	2011-02-07 13:32:37.418008
8	Article::Cms	2011-02-07 13:32:37.439107	2011-02-07 13:32:37.457684	blurb_start_page_role_selection	1	t	2011-02-07 13:32:37.457597
9	Article::Cms	2011-02-07 13:32:37.478975	2011-02-07 13:32:37.497153	blurb_currencies	1	t	2011-02-07 13:32:37.497069
10	Article::Cms	2011-02-07 13:32:37.517856	2011-02-07 13:32:37.536222	reset_password	2	t	2011-02-07 13:32:37.536136
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-07 13:32:35.0289	2011-02-07 13:32:35.0289	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Voluptatem in debitis natus sit minima.Est libero eos cupiditate sed.	2011-02-07 13:32:35.556604	2011-02-07 13:32:35.556604	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Facilis corporis sit ab recusandae.Assumenda quibusdam qui alias perspiciatis animi facilis aut.	2011-02-07 13:32:35.601438	2011-02-07 13:32:35.601438	\N	3	4	\N	0	2-leisure	f	0
3	Business	Sed quam aut dolor error nam repellendus.Et est omnis perferendis.	2011-02-07 13:32:35.635144	2011-02-07 13:32:36.506182	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Voluptatem in debitis natus sit minima.Est libero eos cupiditate sed.	Electronics	2011-02-07 13:32:35.565586	2011-02-07 13:32:35.565586
2	1	dk	\N	Electronics	2011-02-07 13:32:35.591753	2011-02-07 13:32:35.591753
3	2	en	Facilis corporis sit ab recusandae.Assumenda quibusdam qui alias perspiciatis animi facilis aut.	Leisure	2011-02-07 13:32:35.605833	2011-02-07 13:32:35.605833
4	2	dk	\N	Leisure	2011-02-07 13:32:35.625411	2011-02-07 13:32:35.625411
5	3	en	Sed quam aut dolor error nam repellendus.Et est omnis perferendis.	Business	2011-02-07 13:32:35.63949	2011-02-07 13:32:35.63949
6	3	dk	\N	Business	2011-02-07 13:32:35.659279	2011-02-07 13:32:35.659279
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-07 13:32:35.014572	2011-02-07 13:32:35.014572
2	United Kingdom	2011-02-07 13:32:35.01956	2011-02-07 13:32:35.01956
3	Scotland129708555568759	2011-02-07 13:32:35.689262	2011-02-07 13:32:35.689262
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
1	Euro	&euro;	%u%n	t	2011-02-07 13:32:35.534044	2011-02-07 13:32:35.534044
2	PLN	&pln;	%u%n	t	2011-02-07 13:32:35.538347	2011-02-07 13:32:35.538347
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-07 13:32:35.05961	2011-02-07 13:32:35.05961
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-07 13:32:35.074631	2011-02-07 13:32:35.074631
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-07 13:32:35.087332	2011-02-07 13:32:35.087332
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-07 13:32:35.099785	2011-02-07 13:32:35.099785
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-07 13:32:35.112548	2011-02-07 13:32:35.112548
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-07 13:32:35.125054	2011-02-07 13:32:35.125054
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-02-07 13:32:35.138366	2011-02-07 13:32:35.138366
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-02-07 13:32:35.150998	2011-02-07 13:32:35.150998
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-07 13:32:35.16396	2011-02-07 13:32:35.16396
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-07 13:32:35.177027	2011-02-07 13:32:35.177027
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-07 13:32:35.190164	2011-02-07 13:32:35.190164
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-07 13:32:35.202726	2011-02-07 13:32:35.202726
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-07 13:32:35.215902	2011-02-07 13:32:35.215902
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-07 13:32:35.229292	2011-02-07 13:32:35.229292
15	8	en	Question	<p></p>	2011-02-07 13:32:35.242367	2011-02-07 13:32:35.242367
16	8	dk	[DK] Question	<p></p>	2011-02-07 13:32:35.255433	2011-02-07 13:32:35.255433
17	9	en	Invoice	<p></p>	2011-02-07 13:32:35.268846	2011-02-07 13:32:35.268846
18	9	dk	[DK] Invoice	<p></p>	2011-02-07 13:32:35.281484	2011-02-07 13:32:35.281484
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-07 13:32:35.050697	2011-02-07 13:32:35.070512
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-07 13:32:35.082691	2011-02-07 13:32:35.095545
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-07 13:32:35.108015	2011-02-07 13:32:35.120806
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-07 13:32:35.133702	2011-02-07 13:32:35.146626
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-07 13:32:35.159372	2011-02-07 13:32:35.172519
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-07 13:32:35.18519	2011-02-07 13:32:35.198373
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-07 13:32:35.211289	2011-02-07 13:32:35.224719
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-07 13:32:35.237646	2011-02-07 13:32:35.251103
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-07 13:32:35.263875	2011-02-07 13:32:35.277148
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, pkwiu, unit, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
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
1	1	dk	Officiis eos assumenda est eum rem.Itaque est molestias esse dolores quasi quis.	Neque dignissimos id necessitatibus odio a qui corporis eos.Ut aut cum qui.	Big deal on printers	2011-02-07 13:32:35.799202	2011-02-07 13:32:35.799202
2	2	dk	Odio ea molestiae soluta.Magni doloribus et officiis nam.	Quos numquam quisquam et placeat et sit non itaque.Ut veritatis inventore mollitia impedit quia et.	Drills required	2011-02-07 13:32:36.016137	2011-02-07 13:32:36.016137
3	3	dk	Tempore est magnam velit sequi rerum hic deserunt.Sint modi natus expedita omnis itaque voluptatibus dignissimos pariatur.	At dolorum velit consequatur perspiciatis voluptatum quis ut.Quia perspiciatis qui ipsum voluptatem fuga.	Need assistance in selling a car	2011-02-07 13:32:36.088035	2011-02-07 13:32:36.088035
4	4	dk	Quisquam animi impedit quos magnam maxime est.Nam odio similique distinctio.	Ut atque voluptas dignissimos doloremque qui qui sit id.Maxime nostrum et harum qui recusandae omnis est.	Ipod shipment	2011-02-07 13:32:36.159557	2011-02-07 13:32:36.159557
5	5	dk	Modi eos et nihil et sequi.Omnis accusamus delectus recusandae.	Suscipit est quisquam iusto et facilis nisi.Et porro fugiat earum vel neque id quia.	Trip to amazonia - looking for offer	2011-02-07 13:32:36.229645	2011-02-07 13:32:36.229645
6	6	dk	Fugiat suscipit deleniti molestias error ut soluta explicabo.Eveniet delectus cumque qui autem et ut odit.	Nihil reprehenderit eveniet asperiores.Delectus illum alias similique.	LCD - Huge amounts	2011-02-07 13:32:36.299501	2011-02-07 13:32:36.299501
7	7	dk	Laborum explicabo molestiae aperiam.Nihil culpa molestiae esse.	Non asperiores vero incidunt officiis culpa eos.Dolorum commodi assumenda et consequatur.	GPS receivers required	2011-02-07 13:32:36.513601	2011-02-07 13:32:36.513601
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Officiis eos assumenda est eum rem.Itaque est molestias esse dolores quasi quis.	Neque dignissimos id necessitatibus odio a qui corporis eos.Ut aut cum qui.	2	User::Agent	0	176.0	12.0	1	Crooks	Theresa McKenzie	1-292-302-3523	martin@daniel.ca	2011-02-07 13:32:35.757536	2011-02-07 13:32:35.757536	2011-02-12	Adaline129708555568679 Kuvalis	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:32:35.767346	\N	\N	0438 Hyatt Lights	\N	\N	South Daniella	00198-0089	Essex	\N	\N	\N	\N	t
2	Drills required	3	Odio ea molestiae soluta.Magni doloribus et officiis nam.	Quos numquam quisquam et placeat et sit non itaque.Ut veritatis inventore mollitia impedit quia et.	2	User::Agent	0	262.0	952.0	1	Fahey	Daniella Marvin	(432)283-3761 x77251	jeff_dicki@barrowsshanahan.biz	2011-02-07 13:32:35.838592	2011-02-07 13:32:35.838592	2011-02-12	Adaline129708555568679 Kuvalis	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:32:35.988545	\N	\N	56268 Mara Point	\N	\N	New Erich	78403	Cambridgeshire	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Tempore est magnam velit sequi rerum hic deserunt.Sint modi natus expedita omnis itaque voluptatibus dignissimos pariatur.	At dolorum velit consequatur perspiciatis voluptatum quis ut.Quia perspiciatis qui ipsum voluptatem fuga.	2	User::Agent	0	77.0	844.0	1	Osinskijohnson	Chanel Stokes	(320)320-9304 x6111	javon@gusikowski.com	2011-02-07 13:32:36.053932	2011-02-07 13:32:36.053932	2011-02-12	Adaline129708555568679 Kuvalis	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:32:36.061199	\N	\N	35663 Ryan Lock	\N	\N	Malloryhaven	65469-4506	Herefordshire	\N	\N	\N	\N	t
4	Ipod shipment	3	Quisquam animi impedit quos magnam maxime est.Nam odio similique distinctio.	Ut atque voluptas dignissimos doloremque qui qui sit id.Maxime nostrum et harum qui recusandae omnis est.	2	User::Agent	0	565.0	806.0	1	Treutel	Leda Mertz	1-614-806-3576 x593	raheem@adamsstroman.com	2011-02-07 13:32:36.125462	2011-02-07 13:32:36.125462	2011-02-12	Adaline129708555568679 Kuvalis	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:32:36.132567	\N	\N	86572 Satterfield Stravenue	\N	\N	Davonteside	81825	West Sussex	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Modi eos et nihil et sequi.Omnis accusamus delectus recusandae.	Suscipit est quisquam iusto et facilis nisi.Et porro fugiat earum vel neque id quia.	2	User::Agent	0	843.0	662.0	1	Kovacek	Flossie Bednar	365.894.3492 x119	francisco@braun.us	2011-02-07 13:32:36.19625	2011-02-07 13:32:36.19625	2011-02-12	Adaline129708555568679 Kuvalis	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:32:36.203541	\N	\N	005 Kassulke Wall	\N	\N	West Abdul	38184-6121	Cornwall	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Fugiat suscipit deleniti molestias error ut soluta explicabo.Eveniet delectus cumque qui autem et ut odit.	Nihil reprehenderit eveniet asperiores.Delectus illum alias similique.	2	User::Agent	0	544.0	705.0	1	Stiedemann	Ottilie Stehr	1-404-609-6841	laverna@lindgrenerdman.ca	2011-02-07 13:32:36.265913	2011-02-07 13:32:36.265913	2011-02-12	Adaline129708555568679 Kuvalis	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:32:36.272901	\N	\N	52973 Bridget Row	\N	\N	East Anaisbury	00154	Herefordshire	\N	\N	\N	\N	t
7	GPS receivers required	3	Laborum explicabo molestiae aperiam.Nihil culpa molestiae esse.	Non asperiores vero incidunt officiis culpa eos.Dolorum commodi assumenda et consequatur.	2	User::Agent	0	449.0	183.0	1	Dietrichbalistreri	Madonna Schoen	(263)806-8503 x51877	fletcher.bahringer@moen.us	2011-02-07 13:32:36.479196	2011-02-07 13:32:36.479196	2011-02-12	Adaline129708555568679 Kuvalis	1	t	\N	0	0	f	f	-1	1	2011-02-07 13:32:36.486393	\N	\N	2166 Altenwerth Mission	\N	\N	South Taniaview	16672-3217	West Glamorgan	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-07 13:32:34.978485	2011-02-07 13:32:34.978485
2	default_leads_per_page	--- 5\n	2011-02-07 13:32:34.984348	2011-02-07 13:32:34.984348
3	certification_level_1	--- 10\n	2011-02-07 13:32:34.988711	2011-02-07 13:32:34.988711
4	certification_level_2	--- 20\n	2011-02-07 13:32:34.992019	2011-02-07 13:32:34.992019
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-07 13:32:34.994455	2011-02-07 13:32:34.994455
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-07 13:32:34.99662	2011-02-07 13:32:34.99662
7	invoicing_seller_name	--- Fairleads\n	2011-02-07 13:32:34.998764	2011-02-07 13:32:34.998764
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-07 13:32:35.000876	2011-02-07 13:32:35.000876
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-07 13:32:35.003228	2011-02-07 13:32:35.003228
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-07 13:32:35.00541	2011-02-07 13:32:35.00541
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
1	blazejek@gmail.com	1db166d6908aee44ebe9cf2d1304c88b0c012d4a074d40812b979d6d7b4415eb26c215e3133917325ac395edd9880b2a54902ad42c00f5586990b2613c527fed	4P7WBlcknJ0XNFJ5u7Aw	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 13:32:35.523315	2011-02-07 13:32:35.319132	\N	2011-02-07 13:32:35.324126	2011-02-07 13:32:35.523627	1	Lincoln	Mayert	493.988.9814	root	Rosenbaum Coves	Port Tate	17269	East Sussex	1	\N	\N	\N	\N	0	\N	\N	\N	\N	NfEkimDs0ZshdO3JQfl3xk2VuRdj2Ivofu7S8ydARPxHz8R0u2Mm2Sdv9OveGf	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
2	agent@nbs.com	5c9688ee487e297ff38bfac5c6aa6bd45a46f13561a1e4f06e33b6d4bd95fcd9e0182eb0e0bdc2b0817cfeb983f14383e54912894e53970e3540edc19633589a	utRttzb3OgWQM-TvjLNs	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 13:32:35.720688	2011-02-07 13:32:35.695828	\N	2011-02-07 13:32:35.697748	2011-02-07 13:32:35.720984	2	Adaline129708555568679	Kuvalis	(363)029-5456 x18551	Monty Williamson III129708555568651	Jacobi Common	Port Albin	32040	Avon	1	\N	0	\N	\N	0	\N	\N	\N	\N	9UcL6LFRGscz7Dpmm9LYAAx2AneHEaK7J8tWL9mN7um0v36trSPOyHEkwlSQ7l	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
3	admin@nbs.com	450dd3f75025dd919ded734bf9430ff16bd47fa132efc28432936cec5fec8037de28012920e287a6f5427e5eeb02a5b3e2e78848551d9b9d8473e9a25c23dd93	YyXI73_JokkZIK_euGpP	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 13:32:36.596508	2011-02-07 13:32:36.573267	\N	2011-02-07 13:32:36.575094	2011-02-07 13:32:36.596821	1	Joana	Heaney	383-047-6629	Rowena Parker129708555656726	Beier Port	North Brooklynville	01929	Powys	1	\N	\N	\N	\N	0	\N	\N	\N	\N	62BkKMOlXZXXwFKKkvhX7FLvMNh4f0vuii50TEt4elqukAZLxS96GXxIivsZhx	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
4	buyer@nbs.com	2b19818c00fcefd2a5a824fe4ae0dffe2d5d2537c8c1cfd9fdda1e01884e05ba3ad571e111618fa5a0ad244404e560ea26ded951025f7ba8bf7a9e83f254c51c	j5wKx4wx17Ljf9IJ8f5O	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 13:32:36.659893	2011-02-07 13:32:36.634255	\N	2011-02-07 13:32:36.636244	2011-02-07 13:32:36.6602	48	Dillan	Huel	1-413-799-0285	Orville Glover129708555662776	Hahn Avenue	West Earlburgh	56328	Hertfordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	zSrCSdS9HD6RcYetmcZrTImicoOupLhgYpeCSdyJBZD0MkffGBgG2l8oEWp6N3	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
5	leaduser@nbs.com	bc01a6ea116ce7783353d068801c7f0ac9baa18d4c906506dbce3ebec835036caaf5d1986bc44f6f066cb4a2a89bf2827f86b0dae5dbde9119f02da2203ef322	JBIoU77MnrnKjidVfnri	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 13:32:36.720683	2011-02-07 13:32:36.69632	\N	2011-02-07 13:32:36.698104	2011-02-07 13:32:36.736397	64	Jovanny	Keeling	1-817-726-9686	Green Durgan MD129708555669023	Ken Mountains	East Rosaliaborough	79684	Gwent	1	\N	\N	4	\N	0	\N	\N	\N	\N	j2G9JVxmBy5zUiBL3LXOi92IfmFRaU122ebwXAUUBZNFBa4JqzylWQgBNNgjYO	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

