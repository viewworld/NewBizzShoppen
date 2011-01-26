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
-- Name: lead_template_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_fields_id_seq', 1, false);


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
1	1	dk	About us	About us	2011-01-26 13:42:31.867256	2011-01-26 13:42:31.867256
2	1	en	About us	About us	2011-01-26 13:42:31.882061	2011-01-26 13:42:31.882061
3	2	dk	Privacy	Privacy	2011-01-26 13:42:31.913739	2011-01-26 13:42:31.913739
4	2	en	Privacy	Privacy	2011-01-26 13:42:31.925608	2011-01-26 13:42:31.925608
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-26 13:42:31.956961	2011-01-26 13:42:31.956961
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-26 13:42:32.104191	2011-01-26 13:42:32.104191
7	4	dk	Blurb sign up	Blurb sign up	2011-01-26 13:42:32.133374	2011-01-26 13:42:32.133374
8	4	en	Blurb sign up	Blurb sign up	2011-01-26 13:42:32.145158	2011-01-26 13:42:32.145158
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-26 13:42:32.174679	2011-01-26 13:42:32.174679
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-26 13:42:32.186179	2011-01-26 13:42:32.186179
11	6	dk	Blurb agent home	Blurb agent home	2011-01-26 13:42:32.214353	2011-01-26 13:42:32.214353
12	6	en	Blurb agent home	Blurb agent home	2011-01-26 13:42:32.225606	2011-01-26 13:42:32.225606
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-26 13:42:32.253491	2011-01-26 13:42:32.253491
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-26 13:42:32.26438	2011-01-26 13:42:32.26438
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-26 13:42:32.292812	2011-01-26 13:42:32.292812
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-26 13:42:32.304429	2011-01-26 13:42:32.304429
17	9	dk	Blurb currencies	Blurb currencies	2011-01-26 13:42:32.334759	2011-01-26 13:42:32.334759
18	9	en	Blurb currencies	Blurb currencies	2011-01-26 13:42:32.348207	2011-01-26 13:42:32.348207
19	10	dk	Reset password	Reset password	2011-01-26 13:42:32.383269	2011-01-26 13:42:32.383269
20	10	en	Reset password	Reset password	2011-01-26 13:42:32.395831	2011-01-26 13:42:32.395831
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-26 13:42:31.858539	2011-01-26 13:42:31.884871	about_us	0	t	2011-01-26 13:42:31.884793
2	Article::Cms	2011-01-26 13:42:31.909489	2011-01-26 13:42:31.928325	privacy	0	t	2011-01-26 13:42:31.928251
3	Article::Cms	2011-01-26 13:42:31.952995	2011-01-26 13:42:32.107012	terms_conditions	0	t	2011-01-26 13:42:32.106936
4	Article::Cms	2011-01-26 13:42:32.129054	2011-01-26 13:42:32.148045	blurb_sign_up	1	t	2011-01-26 13:42:32.147964
5	Article::Cms	2011-01-26 13:42:32.169087	2011-01-26 13:42:32.189066	blurb_buyer_home	1	t	2011-01-26 13:42:32.188992
6	Article::Cms	2011-01-26 13:42:32.210056	2011-01-26 13:42:32.228454	blurb_agent_home	1	t	2011-01-26 13:42:32.228372
7	Article::Cms	2011-01-26 13:42:32.249473	2011-01-26 13:42:32.267225	blurb_purchase_manager_home	1	t	2011-01-26 13:42:32.267149
8	Article::Cms	2011-01-26 13:42:32.288795	2011-01-26 13:42:32.307271	blurb_start_page_role_selection	1	t	2011-01-26 13:42:32.307195
9	Article::Cms	2011-01-26 13:42:32.330228	2011-01-26 13:42:32.352173	blurb_currencies	1	t	2011-01-26 13:42:32.352084
10	Article::Cms	2011-01-26 13:42:32.379076	2011-01-26 13:42:32.398818	reset_password	2	t	2011-01-26 13:42:32.398743
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
1	Electronics	Debitis accusamus voluptates est deserunt assumenda.Qui perspiciatis natus explicabo aliquam voluptas voluptates consequatur.	2011-01-26 13:42:30.464607	2011-01-26 13:42:30.464607	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Eius et dolores est omnis incidunt ratione.Quo aut adipisci quia voluptate et molestias et.	2011-01-26 13:42:30.508348	2011-01-26 13:42:30.508348	\N	3	4	\N	0	2-leisure	f	0
3	Business	Consequatur eos cumque molestias sed numquam autem maiores.Consectetur asperiores officiis enim autem.	2011-01-26 13:42:30.545227	2011-01-26 13:42:31.397448	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Debitis accusamus voluptates est deserunt assumenda.Qui perspiciatis natus explicabo aliquam voluptas voluptates consequatur.	Electronics	2011-01-26 13:42:30.473526	2011-01-26 13:42:30.473526
2	1	dk	\N	Electronics	2011-01-26 13:42:30.498971	2011-01-26 13:42:30.498971
3	2	en	Eius et dolores est omnis incidunt ratione.Quo aut adipisci quia voluptate et molestias et.	Leisure	2011-01-26 13:42:30.512641	2011-01-26 13:42:30.512641
4	2	dk	\N	Leisure	2011-01-26 13:42:30.535865	2011-01-26 13:42:30.535865
5	3	en	Consequatur eos cumque molestias sed numquam autem maiores.Consectetur asperiores officiis enim autem.	Business	2011-01-26 13:42:30.549442	2011-01-26 13:42:30.549442
6	3	dk	\N	Business	2011-01-26 13:42:30.567993	2011-01-26 13:42:30.567993
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-26 13:42:29.568173	2011-01-26 13:42:29.568173
2	United Kingdom	2011-01-26 13:42:29.578531	2011-01-26 13:42:29.578531
3	England129604935059725	2011-01-26 13:42:30.598535	2011-01-26 13:42:30.598535
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
1	Euro	&euro;	%u%n	t	2011-01-26 13:42:30.419513	2011-01-26 13:42:30.419513
2	PLN	&pln;	%u%n	t	2011-01-26 13:42:30.423736	2011-01-26 13:42:30.423736
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-26 13:42:29.642121	2011-01-26 13:42:29.642121
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-26 13:42:29.656859	2011-01-26 13:42:29.656859
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-26 13:42:29.669569	2011-01-26 13:42:29.669569
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-26 13:42:29.684509	2011-01-26 13:42:29.684509
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-26 13:42:29.697739	2011-01-26 13:42:29.697739
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-26 13:42:29.73025	2011-01-26 13:42:29.73025
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-26 13:42:29.743915	2011-01-26 13:42:29.743915
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-26 13:42:29.756795	2011-01-26 13:42:29.756795
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-26 13:42:29.788281	2011-01-26 13:42:29.788281
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-26 13:42:29.818447	2011-01-26 13:42:29.818447
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-26 13:42:29.846674	2011-01-26 13:42:29.846674
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-26 13:42:29.890504	2011-01-26 13:42:29.890504
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-26 13:42:30.036336	2011-01-26 13:42:30.036336
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-26 13:42:30.048534	2011-01-26 13:42:30.048534
15	8	en	Question	<p></p>	2011-01-26 13:42:30.060955	2011-01-26 13:42:30.060955
16	8	dk	[DK] Question	<p></p>	2011-01-26 13:42:30.073032	2011-01-26 13:42:30.073032
17	9	en	Invoice	<p></p>	2011-01-26 13:42:30.087169	2011-01-26 13:42:30.087169
18	9	dk	[DK] Invoice	<p></p>	2011-01-26 13:42:30.099083	2011-01-26 13:42:30.099083
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-26 13:42:29.633266	2011-01-26 13:42:29.652416
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-26 13:42:29.665039	2011-01-26 13:42:29.679763
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-26 13:42:29.692861	2011-01-26 13:42:29.706353
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-26 13:42:29.739168	2011-01-26 13:42:29.752224
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-26 13:42:29.783685	2011-01-26 13:42:29.796819
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-26 13:42:29.842037	2011-01-26 13:42:29.886162
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-26 13:42:30.03181	2011-01-26 13:42:30.044227
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-26 13:42:30.05664	2011-01-26 13:42:30.068975
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-26 13:42:30.082536	2011-01-26 13:42:30.094999
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
-- Data for Name: lead_template_fields; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_fields (id, lead_template_id, name, field_type, is_hidden, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_template_values; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_values (id, lead_template_field_id, lead_id, name, field_type, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_templates (id, category_id, name, is_active, is_mandatory, creator_id, creator_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, hidden_description, description, header, created_at, updated_at) FROM stdin;
1	1	dk	Qui aperiam ut aspernatur dolore illo sed voluptate.Omnis ullam enim autem amet ad iure est.	Veniam incidunt est reprehenderit vitae aut.Delectus voluptas qui et non reprehenderit.	Big deal on printers	2011-01-26 13:42:30.837525	2011-01-26 13:42:30.837525
2	2	dk	Placeat totam et nesciunt commodi dolor.Cum odit adipisci reiciendis fuga totam.	Quod earum pariatur occaecati accusamus quis sapiente officia rerum.Recusandae temporibus minima iure est voluptas.	Drills required	2011-01-26 13:42:30.909943	2011-01-26 13:42:30.909943
3	3	dk	Autem cupiditate ipsum sapiente architecto nam magnam.Voluptates numquam quisquam porro.	Aut consequatur ullam fuga accusantium.Corporis et molestiae ad doloremque quis at.	Need assistance in selling a car	2011-01-26 13:42:30.979824	2011-01-26 13:42:30.979824
4	4	dk	Amet nemo doloremque aperiam velit aliquam numquam.Nemo minus qui blanditiis vero dolor magnam aliquam.	Similique vel dolor et non voluptas amet inventore quia.Id et rerum alias temporibus.	Ipod shipment	2011-01-26 13:42:31.053404	2011-01-26 13:42:31.053404
5	5	dk	Voluptatibus laudantium aut consequatur alias non nisi laboriosam.Sit amet ducimus eaque et quos.	Debitis velit similique eum tempore ut.Vitae repudiandae adipisci sit voluptatem maiores beatae.	Trip to amazonia - looking for offer	2011-01-26 13:42:31.266052	2011-01-26 13:42:31.266052
6	6	dk	Omnis eos ipsa natus ut.Quidem minus saepe harum fugiat nam qui.	Voluptatibus qui natus dolorum et rerum iste.Velit fugit laboriosam quos voluptates.	LCD - Huge amounts	2011-01-26 13:42:31.335757	2011-01-26 13:42:31.335757
7	7	dk	Est porro voluptatem laborum quia.Repellendus autem repellat et dolorem ut odit placeat ut.	Optio nulla qui vel natus aut id voluptas.Quia et sint soluta vel distinctio alias.	GPS receivers required	2011-01-26 13:42:31.404319	2011-01-26 13:42:31.404319
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Veniam incidunt est reprehenderit vitae aut.Delectus voluptas qui et non reprehenderit.	Qui aperiam ut aspernatur dolore illo sed voluptate.Omnis ullam enim autem amet ad iure est.	2	User::Agent	0	48.0	761.0	1	Terryrodriguez	Liliana Bernhard	431.797.8657 x3513	terrell.nolan@millerhackett.biz	2011-01-26 13:42:30.795805	2011-01-26 13:42:30.795805	2011-01-31	Lilian129604935059621 Schmeler	1	t	\N	0	0	f	f	-1	1	2011-01-26 13:42:30.805243	\N	\N	23167 Roselyn Alley	\N	\N	East Gretaview	74294	Isle of Wight
2	Drills required	3	Quod earum pariatur occaecati accusamus quis sapiente officia rerum.Recusandae temporibus minima iure est voluptas.	Placeat totam et nesciunt commodi dolor.Cum odit adipisci reiciendis fuga totam.	2	User::Agent	0	596.0	443.0	1	Ankunding	Jonathan Moen DVM	989-659-4678 x32714	waylon.pfannerstill@schinner.com	2011-01-26 13:42:30.877501	2011-01-26 13:42:30.877501	2011-01-31	Lilian129604935059621 Schmeler	1	t	\N	0	0	f	f	-1	1	2011-01-26 13:42:30.884218	\N	\N	4217 Gerry Point	\N	\N	Spinkaton	84287-4145	Somerset
3	Need assistance in selling a car	3	Aut consequatur ullam fuga accusantium.Corporis et molestiae ad doloremque quis at.	Autem cupiditate ipsum sapiente architecto nam magnam.Voluptates numquam quisquam porro.	2	User::Agent	0	83.0	30.0	1	Tromp	Rosina Olson	1-076-886-0641 x2287	vladimir@gorczanyfay.us	2011-01-26 13:42:30.945716	2011-01-26 13:42:30.945716	2011-01-31	Lilian129604935059621 Schmeler	1	t	\N	0	0	f	f	-1	1	2011-01-26 13:42:30.95233	\N	\N	258 Hunter Throughway	\N	\N	Yasminville	58643-6143	East Sussex
4	Ipod shipment	3	Similique vel dolor et non voluptas amet inventore quia.Id et rerum alias temporibus.	Amet nemo doloremque aperiam velit aliquam numquam.Nemo minus qui blanditiis vero dolor magnam aliquam.	2	User::Agent	0	119.0	553.0	1	Wisokymcglynn	Reva Berge	141-366-5529 x7581	joany_ebert@rogahn.uk	2011-01-26 13:42:31.016197	2011-01-26 13:42:31.016197	2011-01-31	Lilian129604935059621 Schmeler	1	t	\N	0	0	f	f	-1	1	2011-01-26 13:42:31.022845	\N	\N	703 Blick Stravenue	\N	\N	Lake Ottis	94634	Derbyshire
5	Trip to amazonia - looking for offer	3	Debitis velit similique eum tempore ut.Vitae repudiandae adipisci sit voluptatem maiores beatae.	Voluptatibus laudantium aut consequatur alias non nisi laboriosam.Sit amet ducimus eaque et quos.	2	User::Agent	0	568.0	0.0	1	Frami	Reginald Orn Sr.	814-671-0711 x1667	polly_hagenes@monahan.name	2011-01-26 13:42:31.092569	2011-01-26 13:42:31.092569	2011-01-31	Lilian129604935059621 Schmeler	1	t	\N	0	0	f	f	-1	1	2011-01-26 13:42:31.102951	\N	\N	845 Mohammed Manor	\N	\N	North Brock	66881-6901	Warwickshire
6	LCD - Huge amounts	3	Voluptatibus qui natus dolorum et rerum iste.Velit fugit laboriosam quos voluptates.	Omnis eos ipsa natus ut.Quidem minus saepe harum fugiat nam qui.	2	User::Agent	0	227.0	720.0	1	Schroeder	Cayla Deckow	1-219-399-1182 x7572	evalyn@hartmann.co.uk	2011-01-26 13:42:31.303234	2011-01-26 13:42:31.303234	2011-01-31	Lilian129604935059621 Schmeler	1	t	\N	0	0	f	f	-1	1	2011-01-26 13:42:31.309904	\N	\N	3466 Muller Glen	\N	\N	Andreston	76461-5640	Borders
7	GPS receivers required	3	Optio nulla qui vel natus aut id voluptas.Quia et sint soluta vel distinctio alias.	Est porro voluptatem laborum quia.Repellendus autem repellat et dolorem ut odit placeat ut.	2	User::Agent	0	850.0	787.0	1	Padberg	Erick Gerlach III	641.231.5010	tremayne_bartell@schowalterbrekke.ca	2011-01-26 13:42:31.371771	2011-01-26 13:42:31.371771	2011-01-31	Lilian129604935059621 Schmeler	1	t	\N	0	0	f	f	-1	1	2011-01-26 13:42:31.378672	\N	\N	27231 Mosciski Lodge	\N	\N	East Adonis	65097	County Armagh
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
1	default_payout_delay	--- 0\n	2011-01-26 13:42:29.503934	2011-01-26 13:42:29.503934
2	default_leads_per_page	--- 5\n	2011-01-26 13:42:29.510026	2011-01-26 13:42:29.510026
3	certification_level_1	--- 10\n	2011-01-26 13:42:29.514684	2011-01-26 13:42:29.514684
4	certification_level_2	--- 20\n	2011-01-26 13:42:29.518321	2011-01-26 13:42:29.518321
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-26 13:42:29.520854	2011-01-26 13:42:29.520854
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-26 13:42:29.523536	2011-01-26 13:42:29.523536
7	invoicing_seller_name	--- Fairleads\n	2011-01-26 13:42:29.526672	2011-01-26 13:42:29.526672
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-26 13:42:29.529029	2011-01-26 13:42:29.529029
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-26 13:42:29.531154	2011-01-26 13:42:29.531154
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-26 13:42:29.53353	2011-01-26 13:42:29.53353
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-26 13:42:29.535795	2011-01-26 13:42:29.535795
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
1	blazejek@gmail.com	45c8057d9038c4d483dc8d217dcc2a1b72d3603f95cc1126de6c48e51107610f3bf054be36630f0797d45ccadb233788903457178ce6547c0a51c040a0ad8bfd	4qvRVP5VJjxgivBqTaEE	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-26 13:42:30.409274	2011-01-26 13:42:30.239475	\N	2011-01-26 13:42:30.239739	2011-01-26 13:42:30.40957	1	Ozella	Pfeffer	408-063-7966 x697	root	Paucek Valleys	Schadenberg	49803-5365	West Midlands	1	\N	\N	\N	\N	0	\N	\N	\N	\N	F4YoSCMjNkx1K93Q8S9LR0l0Aav2MSZIfeLuKEoubcoeZPGEuLp0W3rmkvhQpC	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	b6469fd1c9ad21f0708893368b2bb1631e7d3206a7bebb4e8b0e7b09ae34695006db09817bebabe35edce7f89d8fc58fadc51b9b2b24161be6f5bf5387105003	LIizeMhyDPtoq59duwkg	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-26 13:42:30.625827	2011-01-26 13:42:30.603855	\N	2011-01-26 13:42:30.604059	2011-01-26 13:42:30.626112	2	Lilian129604935059621	Schmeler	1-159-486-8787 x9553	Colleen Ortiz1296049350596	Harber Falls	Lake Lelandport	85053-0197	West Sussex	3	\N	0	\N	\N	0	\N	\N	\N	\N	tkdBCDUySSYuT6Sc1ZlC0O0xxdsBI3spRPjUXq2VppPMSKYmCmzOkXI7q0LBJr	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	b7bd91d877d2bb91326f38b73aa88958c1893f346cceb617be1321bb5cfe95a341946b8678184f56519673a3054e2174d06b065ae6c2b0d2620525b19e4e6317	0QAyiMXjFpPfsnGnvVZg	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-26 13:42:31.482784	2011-01-26 13:42:31.461287	\N	2011-01-26 13:42:31.461613	2011-01-26 13:42:31.483068	1	Assunta	Kovacek	528-506-5806 x48513	Rubye Ledner129604935145631	Goyette Lane	Durganfurt	66097-4810	South Yorkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	aNLCWiPApurtHP2RlcMr5FI7rRVsi5nL5tphDFfjs2FF3FMgp09voiq3BmVP6x	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	faf8bfb980315685566633fff911ef47534b0c84885734479202df9fcd075ff0ee83aa92b55d5d7bd02f7942f4b0974db3909fe2cd4571da924caf1fd0a63651	fyZM7ZcOExELqLpbZock	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-26 13:42:31.540215	2011-01-26 13:42:31.516852	\N	2011-01-26 13:42:31.517078	2011-01-26 13:42:31.540494	48	Tremaine	O'Conner	569.396.7034 x02086	Sherman Bosco129604935151214	O'Keefe Squares	New Ryderview	97714	Suffolk	1	\N	\N	\N	\N	0	\N	\N	\N	\N	LHFKz4FELSHSs2SeFCK5zn8fwTrDFW1gHXQxjsVZIYLUpjezHuAvVArHW8kfvd	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	b197c270d4329c749026eb4eba685f76eb7905d7332e7009dee2c165a23fb0cca4443bb9e648f6866d3ff63f9926d7fa9007af02d9d107a28ad3245ad3b1db69	Jsha0obLdmx4qFM7aNFq	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-26 13:42:31.597743	2011-01-26 13:42:31.57568	\N	2011-01-26 13:42:31.57593	2011-01-26 13:42:31.613097	64	Marcel	Langworth	684.631.6921 x8556	Miss Rashawn Cruickshank129604935156961	Conn Greens	Ziemannfort	17918-3634	Cleveland	1	\N	\N	4	\N	0	\N	\N	\N	\N	gUHr0bTraYAy3RsRL33seWEsvZWcO12aH2dCKiPMREir7bZe3RYfCAXeZdJxyV	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

