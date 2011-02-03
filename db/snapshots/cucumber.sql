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
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('addresses_id_seq', 6, true);


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

SELECT pg_catalog.setval('bank_accounts_id_seq', 1, false);


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

SELECT pg_catalog.setval('countries_id_seq', 2, true);


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
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY addresses (id, street, city, zip_code, county, country_id, addressable_type, addressable_id, created_at, updated_at) FROM stdin;
1	Landen Fort	East Christophe	15968	Nottinghamshire	1	\N	\N	2011-02-03 15:53:41.351311	2011-02-03 15:53:41.351311
2	Rosenbaum Ports	New Fabian	18458	North Yorkshire	1	User::Admin	1	2011-02-03 15:53:42.253766	2011-02-03 15:53:42.373235
3	Lenora Walks	Ericfort	96620	Suffolk	1	User::Agent	2	2011-02-03 15:53:43.07051	2011-02-03 15:53:43.109738
4	Monahan Port	Lockmanhaven	10234	Humberside	1	User::Admin	3	2011-02-03 15:53:43.938828	2011-02-03 15:53:43.974336
5	Hegmann Lodge	Port Anne	93729	Durham	1	User::Customer	4	2011-02-03 15:53:44.035193	2011-02-03 15:53:44.081936
6	Brown Loop	Gregoriabury	22840	Northumberland	1	User::LeadUser	5	2011-02-03 15:53:44.134343	2011-02-03 15:53:44.173883
\.


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-03 15:53:44.345601	2011-02-03 15:53:44.345601
2	1	en	About us	About us	2011-02-03 15:53:44.371539	2011-02-03 15:53:44.371539
3	2	dk	Privacy	Privacy	2011-02-03 15:53:44.431785	2011-02-03 15:53:44.431785
4	2	en	Privacy	Privacy	2011-02-03 15:53:44.454538	2011-02-03 15:53:44.454538
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-03 15:53:44.521736	2011-02-03 15:53:44.521736
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-03 15:53:44.548606	2011-02-03 15:53:44.548606
7	4	dk	Blurb sign up	Blurb sign up	2011-02-03 15:53:44.606159	2011-02-03 15:53:44.606159
8	4	en	Blurb sign up	Blurb sign up	2011-02-03 15:53:44.631717	2011-02-03 15:53:44.631717
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-03 15:53:44.683889	2011-02-03 15:53:44.683889
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-03 15:53:44.706372	2011-02-03 15:53:44.706372
11	6	dk	Blurb agent home	Blurb agent home	2011-02-03 15:53:44.766065	2011-02-03 15:53:44.766065
12	6	en	Blurb agent home	Blurb agent home	2011-02-03 15:53:44.787895	2011-02-03 15:53:44.787895
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-03 15:53:44.856933	2011-02-03 15:53:44.856933
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-03 15:53:44.878807	2011-02-03 15:53:44.878807
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-03 15:53:44.94136	2011-02-03 15:53:44.94136
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-03 15:53:44.969397	2011-02-03 15:53:44.969397
17	9	dk	Blurb currencies	Blurb currencies	2011-02-03 15:53:45.024068	2011-02-03 15:53:45.024068
18	9	en	Blurb currencies	Blurb currencies	2011-02-03 15:53:45.530821	2011-02-03 15:53:45.530821
19	10	dk	Reset password	Reset password	2011-02-03 15:53:45.650496	2011-02-03 15:53:45.650496
20	10	en	Reset password	Reset password	2011-02-03 15:53:45.670901	2011-02-03 15:53:45.670901
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-02-03 15:53:44.333396	2011-02-03 15:53:44.378037	about_us	0	t	2011-02-03 15:53:44.377931
2	Article::Cms	2011-02-03 15:53:44.426183	2011-02-03 15:53:44.465201	privacy	0	t	2011-02-03 15:53:44.465025
3	Article::Cms	2011-02-03 15:53:44.515711	2011-02-03 15:53:44.555513	terms_conditions	0	t	2011-02-03 15:53:44.555409
4	Article::Cms	2011-02-03 15:53:44.60077	2011-02-03 15:53:44.640316	blurb_sign_up	1	t	2011-02-03 15:53:44.640195
5	Article::Cms	2011-02-03 15:53:44.678487	2011-02-03 15:53:44.716903	blurb_buyer_home	1	t	2011-02-03 15:53:44.716775
6	Article::Cms	2011-02-03 15:53:44.760427	2011-02-03 15:53:44.797486	blurb_agent_home	1	t	2011-02-03 15:53:44.797372
7	Article::Cms	2011-02-03 15:53:44.84672	2011-02-03 15:53:44.887053	blurb_purchase_manager_home	1	t	2011-02-03 15:53:44.886937
8	Article::Cms	2011-02-03 15:53:44.933882	2011-02-03 15:53:44.977105	blurb_start_page_role_selection	1	t	2011-02-03 15:53:44.976997
9	Article::Cms	2011-02-03 15:53:45.017263	2011-02-03 15:53:45.60912	blurb_currencies	1	t	2011-02-03 15:53:45.60895
10	Article::Cms	2011-02-03 15:53:45.644868	2011-02-03 15:53:45.678388	reset_password	2	t	2011-02-03 15:53:45.678282
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY bank_accounts (id, bank_name, iban_no, local_bank_number, swift, payment_conditions, country_default, created_at, updated_at, global_default) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Accusantium rerum inventore ratione amet.Expedita velit sunt accusamus occaecati.	2011-02-03 15:53:42.86082	2011-02-03 15:53:42.86082	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Ratione dolor rerum omnis beatae est.Modi voluptatum eaque explicabo eos.	2011-02-03 15:53:42.938054	2011-02-03 15:53:42.938054	\N	3	4	\N	0	2-leisure	f	0
3	Business	Labore quod nisi quia.Enim aut reiciendis vero commodi quas explicabo.	2011-02-03 15:53:42.988883	2011-02-03 15:53:43.848909	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Accusantium rerum inventore ratione amet.Expedita velit sunt accusamus occaecati.	Electronics	2011-02-03 15:53:42.874502	2011-02-03 15:53:42.874502
2	1	dk	\N	Electronics	2011-02-03 15:53:42.923696	2011-02-03 15:53:42.923696
3	2	en	Ratione dolor rerum omnis beatae est.Modi voluptatum eaque explicabo eos.	Leisure	2011-02-03 15:53:42.945146	2011-02-03 15:53:42.945146
4	2	dk	\N	Leisure	2011-02-03 15:53:42.973441	2011-02-03 15:53:42.973441
5	3	en	Labore quod nisi quia.Enim aut reiciendis vero commodi quas explicabo.	Business	2011-02-03 15:53:42.994254	2011-02-03 15:53:42.994254
6	3	dk	\N	Business	2011-02-03 15:53:43.028457	2011-02-03 15:53:43.028457
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-03 15:53:41.312014	2011-02-03 15:53:41.312014
2	United Kingdom	2011-02-03 15:53:41.329638	2011-02-03 15:53:41.329638
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
1	Euro	&euro;	%u%n	t	2011-02-03 15:53:42.823817	2011-02-03 15:53:42.823817
2	PLN	&pln;	%u%n	t	2011-02-03 15:53:42.831707	2011-02-03 15:53:42.831707
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-03 15:53:41.429479	2011-02-03 15:53:41.429479
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-03 15:53:41.463083	2011-02-03 15:53:41.463083
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-03 15:53:41.481563	2011-02-03 15:53:41.481563
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-03 15:53:41.498847	2011-02-03 15:53:41.498847
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-03 15:53:41.518929	2011-02-03 15:53:41.518929
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-03 15:53:41.537364	2011-02-03 15:53:41.537364
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-03 15:53:41.555272	2011-02-03 15:53:41.555272
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-03 15:53:41.572855	2011-02-03 15:53:41.572855
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-03 15:53:41.593688	2011-02-03 15:53:41.593688
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-03 15:53:41.613081	2011-02-03 15:53:41.613081
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-03 15:53:41.631966	2011-02-03 15:53:41.631966
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-03 15:53:41.649542	2011-02-03 15:53:41.649542
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-03 15:53:41.669695	2011-02-03 15:53:41.669695
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-03 15:53:41.688173	2011-02-03 15:53:41.688173
15	8	en	<p></p>	Question	2011-02-03 15:53:41.706235	2011-02-03 15:53:41.706235
16	8	dk	<p></p>	[DK] Question	2011-02-03 15:53:41.723616	2011-02-03 15:53:41.723616
17	9	en	<p></p>	Invoice	2011-02-03 15:53:41.746719	2011-02-03 15:53:41.746719
18	9	dk	<p></p>	[DK] Invoice	2011-02-03 15:53:41.764985	2011-02-03 15:53:41.764985
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-03 15:53:41.413714	2011-02-03 15:53:41.448058
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-03 15:53:41.475801	2011-02-03 15:53:41.493703
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-03 15:53:41.513274	2011-02-03 15:53:41.532249
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-03 15:53:41.54974	2011-02-03 15:53:41.567655
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-03 15:53:41.587478	2011-02-03 15:53:41.607383
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-03 15:53:41.626133	2011-02-03 15:53:41.644375
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-03 15:53:41.663571	2011-02-03 15:53:41.683034
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-03 15:53:41.700503	2011-02-03 15:53:41.718466
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-03 15:53:41.740768	2011-02-03 15:53:41.759839
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
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, header, hidden_description, description, created_at, updated_at) FROM stdin;
1	1	dk	Big deal on printers	Explicabo est laudantium quibusdam nulla cumque dicta perspiciatis nostrum.Et dolores ut voluptas maxime dolor.	Et aut mollitia et neque aperiam occaecati cum.Corrupti eligendi sint nobis.	2011-02-03 15:53:43.232892	2011-02-03 15:53:43.232892
2	2	dk	Drills required	Excepturi omnis aut et quisquam iure omnis quia.Est velit eaque voluptatem.	Minima ipsam culpa consectetur non laudantium magni.Ad et et aut sit qui necessitatibus.	2011-02-03 15:53:43.342288	2011-02-03 15:53:43.342288
3	3	dk	Need assistance in selling a car	Quia sequi dolorem fugit voluptatum dolore id natus explicabo.Repellendus aut iste aut alias asperiores cum sed.	Aut nemo eveniet et iusto possimus.Nobis alias ut voluptate tempore nemo.	2011-02-03 15:53:43.442977	2011-02-03 15:53:43.442977
4	4	dk	Ipod shipment	Sequi nam repudiandae qui asperiores et.Velit aliquid minima tempore nostrum quos omnis vitae dolorem.	Iusto veritatis sit provident corrupti.Magnam enim eligendi laborum necessitatibus.	2011-02-03 15:53:43.548665	2011-02-03 15:53:43.548665
5	5	dk	Trip to amazonia - looking for offer	Commodi recusandae nihil neque ut magni officiis vero ea.Debitis in numquam corrupti culpa.	Laboriosam autem laborum facilis sit.Ut tempora necessitatibus minima.	2011-02-03 15:53:43.653902	2011-02-03 15:53:43.653902
6	6	dk	LCD - Huge amounts	Ea dolores dolorum aspernatur rem magni tempore assumenda.Dolor nam aliquid quia itaque quia.	Rerum earum minus dolorum.Dolores sed tenetur quia alias nam rerum.	2011-02-03 15:53:43.752382	2011-02-03 15:53:43.752382
7	7	dk	GPS receivers required	Optio tenetur et voluptas voluptatem id neque.Quasi et inventore cumque repudiandae dolores ipsam voluptatum.	Provident aspernatur voluptatem quas.Expedita est accusamus cum provident maxime sequi.	2011-02-03 15:53:43.858613	2011-02-03 15:53:43.858613
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Et aut mollitia et neque aperiam occaecati cum.Corrupti eligendi sint nobis.	Explicabo est laudantium quibusdam nulla cumque dicta perspiciatis nostrum.Et dolores ut voluptas maxime dolor.	2	User::Agent	0	721.0	395.0	1	Donnelly	Reba Kessler	(201)912-3338	valentina@vandervortzemlak.info	2011-02-03 15:53:43.173397	2011-02-03 15:53:43.173397	2011-02-08	Caroline129674842306705 Feeney	1	t	\N	0	0	f	f	-1	1	2011-02-03 15:53:43.18693	\N	\N	52087 Kellie Expressway	\N	\N	Port Frieda	86258-9512	South Glamorgan
2	Drills required	3	Minima ipsam culpa consectetur non laudantium magni.Ad et et aut sit qui necessitatibus.	Excepturi omnis aut et quisquam iure omnis quia.Est velit eaque voluptatem.	2	User::Agent	0	70.0	951.0	1	Stammschmitt	Emile Gottlieb	309.603.0958	sandy.kozey@sauer.ca	2011-02-03 15:53:43.295747	2011-02-03 15:53:43.295747	2011-02-08	Caroline129674842306705 Feeney	1	t	\N	0	0	f	f	-1	1	2011-02-03 15:53:43.304424	\N	\N	360 Mattie Ridge	\N	\N	West Presleyville	20962-0355	Worcestershire
3	Need assistance in selling a car	3	Aut nemo eveniet et iusto possimus.Nobis alias ut voluptate tempore nemo.	Quia sequi dolorem fugit voluptatum dolore id natus explicabo.Repellendus aut iste aut alias asperiores cum sed.	2	User::Agent	0	933.0	914.0	1	Bins	Ms. Camden Becker	301-468-4417 x787	kitty@kulas.ca	2011-02-03 15:53:43.396372	2011-02-03 15:53:43.396372	2011-02-08	Caroline129674842306705 Feeney	1	t	\N	0	0	f	f	-1	1	2011-02-03 15:53:43.404727	\N	\N	3594 Graciela Parkway	\N	\N	Klinghaven	20855-9843	South Glamorgan
4	Ipod shipment	3	Iusto veritatis sit provident corrupti.Magnam enim eligendi laborum necessitatibus.	Sequi nam repudiandae qui asperiores et.Velit aliquid minima tempore nostrum quos omnis vitae dolorem.	2	User::Agent	0	194.0	432.0	1	Medhurst	Odell Kilback	656.586.9965 x1502	stanton@okeefe.uk	2011-02-03 15:53:43.499974	2011-02-03 15:53:43.499974	2011-02-08	Caroline129674842306705 Feeney	1	t	\N	0	0	f	f	-1	1	2011-02-03 15:53:43.508324	\N	\N	375 Lon Ports	\N	\N	New Robinshire	02760	Avon
5	Trip to amazonia - looking for offer	3	Laboriosam autem laborum facilis sit.Ut tempora necessitatibus minima.	Commodi recusandae nihil neque ut magni officiis vero ea.Debitis in numquam corrupti culpa.	2	User::Agent	0	90.0	441.0	1	Satterfield	Christy Skiles	(817)996-4087	elena@leuschke.co.uk	2011-02-03 15:53:43.603577	2011-02-03 15:53:43.603577	2011-02-08	Caroline129674842306705 Feeney	1	t	\N	0	0	f	f	-1	1	2011-02-03 15:53:43.611923	\N	\N	48234 Sylvia Avenue	\N	\N	East Stevie	85689	Mid Glamorgan
6	LCD - Huge amounts	3	Rerum earum minus dolorum.Dolores sed tenetur quia alias nam rerum.	Ea dolores dolorum aspernatur rem magni tempore assumenda.Dolor nam aliquid quia itaque quia.	2	User::Agent	0	978.0	784.0	1	Turcotte	Sallie Schmeler	173-701-1501	nina@bashirianhammes.com	2011-02-03 15:53:43.70444	2011-02-03 15:53:43.70444	2011-02-08	Caroline129674842306705 Feeney	1	t	\N	0	0	f	f	-1	1	2011-02-03 15:53:43.713176	\N	\N	33499 Feeney Mills	\N	\N	Lake Alysa	18793	County Fermanagh
7	GPS receivers required	3	Provident aspernatur voluptatem quas.Expedita est accusamus cum provident maxime sequi.	Optio tenetur et voluptas voluptatem id neque.Quasi et inventore cumque repudiandae dolores ipsam voluptatum.	2	User::Agent	0	337.0	956.0	1	Schimmeljenkins	Robbie Daniel	079-605-6170 x8738	wade@hoeger.us	2011-02-03 15:53:43.810426	2011-02-03 15:53:43.810426	2011-02-08	Caroline129674842306705 Feeney	1	t	\N	0	0	f	f	-1	1	2011-02-03 15:53:43.818552	\N	\N	23829 Manley Plains	\N	\N	North Litzyview	08223	Wiltshire
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
1	default_payout_delay	--- 0\n	2011-02-03 15:53:41.021171	2011-02-03 15:53:41.021171
2	default_leads_per_page	--- 5\n	2011-02-03 15:53:41.035109	2011-02-03 15:53:41.035109
3	certification_level_1	--- 10\n	2011-02-03 15:53:41.235958	2011-02-03 15:53:41.235958
4	certification_level_2	--- 20\n	2011-02-03 15:53:41.245202	2011-02-03 15:53:41.245202
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-03 15:53:41.252074	2011-02-03 15:53:41.252074
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-03 15:53:41.259782	2011-02-03 15:53:41.259782
7	invoicing_seller_name	--- Fairleads\n	2011-02-03 15:53:41.267194	2011-02-03 15:53:41.267194
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-03 15:53:41.27395	2011-02-03 15:53:41.27395
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-03 15:53:41.280968	2011-02-03 15:53:41.280968
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-03 15:53:41.288455	2011-02-03 15:53:41.288455
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers, vat_number, not_charge_vat, bank_account_id) FROM stdin;
1	blazejek@gmail.com	86c96a029f19bbe892d08625cd06a8a09b9585f004d7716f7bace96830d1f1ae273e3f74bb8f19be69b3f3e50b6e0ab796cf141e8a5f6c3f6df2eebee23e284c	cR4zzuWG2FekA16PMbj2	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-03 15:53:42.790272	2011-02-03 15:53:42.269014	\N	2011-02-03 15:53:42.270596	2011-02-03 15:53:42.791586	1	Doug	Nader	974-024-5372 x61393	root	\N	\N	\N	\N	0	\N	\N	\N	\N	T3HCeqhDc5O3iTDozTlhUtGGrqj5Puecw7HKXjEUXPW4nFoilCXl1yGKEl0AnK	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	\N
2	agent@nbs.com	1a45337934cfbfbe90ac3018af94b0a423d5f2ec3b7b28c7d48621e8bd641b774c215698e2f386dec7af4a39ccd4ec548ff48f3422f8cac9f90746f45502bcdb	0EYQqtoH7xuTkNHZVA9U	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-03 15:53:43.118945	2011-02-03 15:53:43.083312	\N	2011-02-03 15:53:43.084521	2011-02-03 15:53:43.119534	2	Caroline129674842306705	Feeney	1-835-776-8215 x210	Retha Wisoky129674842306689	\N	0	\N	\N	0	\N	\N	\N	\N	istLcOvCr5P1Cb16R1DiN5mBsWiKhI68HzbwLUw6X5XtxbSAjz4EzZkR3FzOWD	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	\N
3	admin@nbs.com	adb366879aacaac2a9b0cc7bd7aeb210a4a32282802522c5f852287f489ff6c06114aae7111b7703477418f60d5137fb68d8eb5fc7b30e1a37c59d469618e278	mVQrGrnDWxFGKDV622f7	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-03 15:53:43.980454	2011-02-03 15:53:43.950926	\N	2011-02-03 15:53:43.952029	2011-02-03 15:53:43.980931	1	Keenan	Dickinson	1-364-565-5892 x16034	Bobby Donnelly129674842393587	\N	\N	\N	\N	0	\N	\N	\N	\N	QiAnpUJNOIxJpfjvo4XOrej1D1HO37au2qbRBHKW063B1n3SrcKXwNGRH8aZYP	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	\N
4	buyer@nbs.com	c4359501eae360aa69ddf3de7d0cc009c94aa2c43b54d292db0a8cdfd293ebac5d01449a22c30a09c9cb999ee2e66236e5fb16679eb6ac1c93b55971bd4f1050	QomEQbPIlDs6aT8WrD_L	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-03 15:53:44.088033	2011-02-03 15:53:44.052049	\N	2011-02-03 15:53:44.053731	2011-02-03 15:53:44.08846	48	Gaylord	Shields	1-034-725-3852 x641	Cindy Leannon129674842403206	\N	\N	\N	\N	0	\N	\N	\N	\N	Xrj4qJeroUUr35dM9TUWkjkoYd62vkNKIhdKam0jF6KTpcCuyuXZKE6g5zXnB4	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	\N
5	leaduser@nbs.com	6f9863c002f0d9f630193a1f5b9ead81713a851132b5fb49a3e8bebb9072edb72794ef90f75d7154cda923bf7cd0e20fec98f4a21197df318fa6b2e3ed296625	zlA2XtopeDgSB844TfcF	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-03 15:53:44.180997	2011-02-03 15:53:44.148278	\N	2011-02-03 15:53:44.149461	2011-02-03 15:53:44.215937	64	Jane	Connelly	(260)999-3273 x810	Graciela Wuckert129674842413064	\N	\N	4	\N	0	\N	\N	\N	\N	DBSHQ0FZCLcOHNKVzFX4xzeGpMcADnTsXSplT8DeE6pDZijOC69VcWrU33jBxb	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	\N
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

