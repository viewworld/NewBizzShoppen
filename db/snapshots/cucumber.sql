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

SELECT pg_catalog.setval('addresses_id_seq', 5, true);


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

COPY addresses (id, address_line_1, address_line_2, address_line_3, zip_code, country_id, addressable_type, addressable_id, created_at, updated_at) FROM stdin;
1	Jesse Row	Lake Jaronland	Fife	44082-6399	1	BankAccount	1	2011-02-16 11:29:59.617971	2011-02-16 11:29:59.643778
2	Jessyca Plaza	Joanchester	Cheshire	46558-8038	1	User::Admin	1	2011-02-16 11:30:00.091148	2011-02-16 11:30:00.187858
3	Price Court	Wiltonbury	County Tyrone	24193-5925	1	User::Agent	2	2011-02-16 11:30:00.455625	2011-02-16 11:30:00.498257
4	King Knoll	North Krystalchester	Rutland	91030-6819	1	User::Admin	3	2011-02-16 11:30:01.259185	2011-02-16 11:30:01.298022
5	Rempel Vista	West Jenningsshire	Dyfed	36399	1	User::Customer	4	2011-02-16 11:30:01.357664	2011-02-16 11:30:01.41176
\.


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-16 11:30:01.660177	2011-02-16 11:30:01.660177
2	1	en	About us	About us	2011-02-16 11:30:01.682138	2011-02-16 11:30:01.682138
3	2	dk	Privacy	Privacy	2011-02-16 11:30:01.751611	2011-02-16 11:30:01.751611
4	2	en	Privacy	Privacy	2011-02-16 11:30:01.770476	2011-02-16 11:30:01.770476
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-16 11:30:01.822921	2011-02-16 11:30:01.822921
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-16 11:30:01.842103	2011-02-16 11:30:01.842103
7	4	dk	Blurb sign up	Blurb sign up	2011-02-16 11:30:01.896312	2011-02-16 11:30:01.896312
8	4	en	Blurb sign up	Blurb sign up	2011-02-16 11:30:01.917951	2011-02-16 11:30:01.917951
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-16 11:30:01.969574	2011-02-16 11:30:01.969574
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-16 11:30:01.986764	2011-02-16 11:30:01.986764
11	6	dk	Blurb agent home	Blurb agent home	2011-02-16 11:30:02.0333	2011-02-16 11:30:02.0333
12	6	en	Blurb agent home	Blurb agent home	2011-02-16 11:30:02.054708	2011-02-16 11:30:02.054708
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-16 11:30:02.102202	2011-02-16 11:30:02.102202
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-16 11:30:02.121308	2011-02-16 11:30:02.121308
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-16 11:30:02.164245	2011-02-16 11:30:02.164245
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-16 11:30:02.183919	2011-02-16 11:30:02.183919
17	9	dk	Blurb currencies	Blurb currencies	2011-02-16 11:30:02.230301	2011-02-16 11:30:02.230301
18	9	en	Blurb currencies	Blurb currencies	2011-02-16 11:30:02.249001	2011-02-16 11:30:02.249001
19	10	dk	Reset password	Reset password	2011-02-16 11:30:02.294573	2011-02-16 11:30:02.294573
20	10	en	Reset password	Reset password	2011-02-16 11:30:02.312835	2011-02-16 11:30:02.312835
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-02-16 11:30:01.647571	2011-02-16 11:30:01.690969	about_us	0	t	2011-02-16 11:30:01.690798
2	Article::Cms	2011-02-16 11:30:01.745953	2011-02-16 11:30:01.776241	privacy	0	t	2011-02-16 11:30:01.776133
3	Article::Cms	2011-02-16 11:30:01.816969	2011-02-16 11:30:01.847815	terms_conditions	0	t	2011-02-16 11:30:01.847709
4	Article::Cms	2011-02-16 11:30:01.891055	2011-02-16 11:30:01.925151	blurb_sign_up	1	t	2011-02-16 11:30:01.92501
5	Article::Cms	2011-02-16 11:30:01.963696	2011-02-16 11:30:01.993386	blurb_buyer_home	1	t	2011-02-16 11:30:01.993257
6	Article::Cms	2011-02-16 11:30:02.027725	2011-02-16 11:30:02.060425	blurb_agent_home	1	t	2011-02-16 11:30:02.06032
7	Article::Cms	2011-02-16 11:30:02.096688	2011-02-16 11:30:02.127256	blurb_purchase_manager_home	1	t	2011-02-16 11:30:02.127145
8	Article::Cms	2011-02-16 11:30:02.156778	2011-02-16 11:30:02.190275	blurb_start_page_role_selection	1	t	2011-02-16 11:30:02.190174
9	Article::Cms	2011-02-16 11:30:02.224706	2011-02-16 11:30:02.255857	blurb_currencies	1	t	2011-02-16 11:30:02.255736
10	Article::Cms	2011-02-16 11:30:02.289236	2011-02-16 11:30:02.318442	reset_password	2	t	2011-02-16 11:30:02.318323
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
1	Default Bank	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-16 11:29:59.639011	2011-02-16 11:29:59.639011	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Consequuntur et sunt illo occaecati.Ipsa veniam est et.	2011-02-16 11:30:00.262797	2011-02-16 11:30:00.262797	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Ipsum aliquam voluptas quas libero est et.Ipsum provident possimus distinctio voluptatum quo et.	2011-02-16 11:30:00.324887	2011-02-16 11:30:00.324887	\N	3	4	\N	0	2-leisure	f	0
3	Business	Voluptas cum est quaerat quo doloremque recusandae molestiae.Incidunt inventore tempore blanditiis quisquam modi quia fugit.	2011-02-16 11:30:00.377744	2011-02-16 11:30:01.173011	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Consequuntur et sunt illo occaecati.Ipsa veniam est et.	Electronics	2011-02-16 11:30:00.274665	2011-02-16 11:30:00.274665
2	1	dk	\N	Electronics	2011-02-16 11:30:00.309771	2011-02-16 11:30:00.309771
3	2	en	Ipsum aliquam voluptas quas libero est et.Ipsum provident possimus distinctio voluptatum quo et.	Leisure	2011-02-16 11:30:00.33024	2011-02-16 11:30:00.33024
4	2	dk	\N	Leisure	2011-02-16 11:30:00.355378	2011-02-16 11:30:00.355378
5	3	en	Voluptas cum est quaerat quo doloremque recusandae molestiae.Incidunt inventore tempore blanditiis quisquam modi quia fugit.	Business	2011-02-16 11:30:00.384283	2011-02-16 11:30:00.384283
6	3	dk	\N	Business	2011-02-16 11:30:00.412474	2011-02-16 11:30:00.412474
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-16 11:29:59.584127	2011-02-16 11:29:59.584127
2	United Kingdom	2011-02-16 11:29:59.595701	2011-02-16 11:29:59.595701
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
1	Euro	&euro;	%u%n	t	2011-02-16 11:30:00.225541	2011-02-16 11:30:00.225541
2	PLN	&pln;	%u%n	t	2011-02-16 11:30:00.234617	2011-02-16 11:30:00.234617
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-16 11:29:59.687757	2011-02-16 11:29:59.687757
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-16 11:29:59.715345	2011-02-16 11:29:59.715345
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-16 11:29:59.735851	2011-02-16 11:29:59.735851
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-16 11:29:59.759826	2011-02-16 11:29:59.759826
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-16 11:29:59.77868	2011-02-16 11:29:59.77868
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-16 11:29:59.804337	2011-02-16 11:29:59.804337
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-16 11:29:59.823312	2011-02-16 11:29:59.823312
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-16 11:29:59.841729	2011-02-16 11:29:59.841729
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-16 11:29:59.861214	2011-02-16 11:29:59.861214
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-16 11:29:59.881471	2011-02-16 11:29:59.881471
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-16 11:29:59.899752	2011-02-16 11:29:59.899752
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-16 11:29:59.91825	2011-02-16 11:29:59.91825
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-16 11:29:59.9402	2011-02-16 11:29:59.9402
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-16 11:29:59.958538	2011-02-16 11:29:59.958538
15	8	en	<p></p>	Question	2011-02-16 11:29:59.981583	2011-02-16 11:29:59.981583
16	8	dk	<p></p>	[DK] Question	2011-02-16 11:30:00.000523	2011-02-16 11:30:00.000523
17	9	en	<p></p>	Invoice	2011-02-16 11:30:00.027003	2011-02-16 11:30:00.027003
18	9	dk	<p></p>	[DK] Invoice	2011-02-16 11:30:00.046058	2011-02-16 11:30:00.046058
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-16 11:29:59.676743	2011-02-16 11:29:59.708286
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-16 11:29:59.730011	2011-02-16 11:29:59.749951
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-16 11:29:59.772832	2011-02-16 11:29:59.798634
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-16 11:29:59.817423	2011-02-16 11:29:59.836547
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-16 11:29:59.855078	2011-02-16 11:29:59.875762
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-16 11:29:59.894339	2011-02-16 11:29:59.912474
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-16 11:29:59.93225	2011-02-16 11:29:59.952913
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-16 11:29:59.973092	2011-02-16 11:29:59.994863
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-16 11:30:00.019392	2011-02-16 11:30:00.040318
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

COPY lead_translations (id, lead_id, locale, hidden_description, header, description, created_at, updated_at) FROM stdin;
1	1	dk	Aut fuga sit sunt possimus.Ipsam nesciunt fugiat qui ea laudantium.	Big deal on printers	Perspiciatis nemo sint nisi maxime soluta voluptatum.Non quia voluptatem enim rerum est debitis vel.	2011-02-16 11:30:00.60962	2011-02-16 11:30:00.60962
2	2	dk	Eos sed illo vitae consequatur recusandae.Aperiam natus placeat officia id quo ea dolorem similique.	Drills required	Laudantium explicabo eos nihil voluptatum repellendus illo.Cupiditate et quia corporis molestiae voluptatem.	2011-02-16 11:30:00.70852	2011-02-16 11:30:00.70852
3	3	dk	Cupiditate sunt non reiciendis.Ab pariatur voluptatem aut repellendus odio voluptas omnis enim.	Need assistance in selling a car	Necessitatibus facilis molestiae ad quibusdam inventore voluptates.Sapiente corrupti et nisi quam ad.	2011-02-16 11:30:00.804201	2011-02-16 11:30:00.804201
4	4	dk	Et sit et voluptatum.Qui non aut non ipsam voluptatum laboriosam id.	Ipod shipment	Ad unde quis aut.Voluptatem maiores cupiditate eligendi quas.	2011-02-16 11:30:00.90495	2011-02-16 11:30:00.90495
5	5	dk	Qui voluptas quis fugiat omnis qui ullam voluptatem.Aliquam doloremque aut sit.	Trip to amazonia - looking for offer	Esse voluptatem possimus accusamus consequuntur qui aut qui.Tempore quam voluptatum aliquam enim itaque quo.	2011-02-16 11:30:00.996705	2011-02-16 11:30:00.996705
6	6	dk	Laborum minus beatae enim atque omnis.Et eius non et.	LCD - Huge amounts	Itaque debitis facilis corporis ut eum nulla illo.Mollitia repellendus autem nihil expedita.	2011-02-16 11:30:01.08829	2011-02-16 11:30:01.08829
7	7	dk	Ratione excepturi ex eum fuga odit qui alias enim.Atque accusamus et ipsam enim eveniet odit pariatur.	GPS receivers required	Minima omnis expedita blanditiis odio qui sunt.Quod et et ex ipsam rerum et et autem.	2011-02-16 11:30:01.182053	2011-02-16 11:30:01.182053
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Perspiciatis nemo sint nisi maxime soluta voluptatum.Non quia voluptatem enim rerum est debitis vel.	Aut fuga sit sunt possimus.Ipsam nesciunt fugiat qui ea laudantium.	2	User::Agent	0	466.0	675.0	1	Kiehn	Jamar Roberts	160.789.0923	noemie@collins.uk	2011-02-16 11:30:00.557494	2011-02-16 11:30:00.557494	2011-02-21	Houston129785580045285 Beahan	1	t	\N	0	0	f	f	-1	1	2011-02-16 11:30:00.569086	\N	\N	536 Ashleigh Extensions	\N	\N	Hettiemouth	57132-5263	Leicestershire
2	Drills required	3	Laudantium explicabo eos nihil voluptatum repellendus illo.Cupiditate et quia corporis molestiae voluptatem.	Eos sed illo vitae consequatur recusandae.Aperiam natus placeat officia id quo ea dolorem similique.	2	User::Agent	0	674.0	103.0	1	Johnson	Aryanna Sauer	181-255-8284 x921	brown@emmerichstamm.biz	2011-02-16 11:30:00.663672	2011-02-16 11:30:00.663672	2011-02-21	Houston129785580045285 Beahan	1	t	\N	0	0	f	f	-1	1	2011-02-16 11:30:00.671585	\N	\N	78149 Kertzmann Junctions	\N	\N	Port Deangelo	98384-2432	Kent
3	Need assistance in selling a car	3	Necessitatibus facilis molestiae ad quibusdam inventore voluptates.Sapiente corrupti et nisi quam ad.	Cupiditate sunt non reiciendis.Ab pariatur voluptatem aut repellendus odio voluptas omnis enim.	2	User::Agent	0	15.0	896.0	1	Padbergokuneva	Veda Beier	(782)536-1853 x483	patience@toy.us	2011-02-16 11:30:00.758456	2011-02-16 11:30:00.758456	2011-02-21	Houston129785580045285 Beahan	1	t	\N	0	0	f	f	-1	1	2011-02-16 11:30:00.768239	\N	\N	89277 Schoen Lock	\N	\N	New Cristian	29929-2529	Somerset
4	Ipod shipment	3	Ad unde quis aut.Voluptatem maiores cupiditate eligendi quas.	Et sit et voluptatum.Qui non aut non ipsam voluptatum laboriosam id.	2	User::Agent	0	388.0	317.0	1	Lakin	Romaine Fritsch	(601)913-9334	heath@johnston.us	2011-02-16 11:30:00.861312	2011-02-16 11:30:00.861312	2011-02-21	Houston129785580045285 Beahan	1	t	\N	0	0	f	f	-1	1	2011-02-16 11:30:00.869829	\N	\N	700 Ilene Turnpike	\N	\N	West Hildaburgh	33927	Cheshire
5	Trip to amazonia - looking for offer	3	Esse voluptatem possimus accusamus consequuntur qui aut qui.Tempore quam voluptatum aliquam enim itaque quo.	Qui voluptas quis fugiat omnis qui ullam voluptatem.Aliquam doloremque aut sit.	2	User::Agent	0	946.0	796.0	1	Lebsack	Alvina Eichmann	(440)839-7357 x5854	nella@spinka.info	2011-02-16 11:30:00.954198	2011-02-16 11:30:00.954198	2011-02-21	Houston129785580045285 Beahan	1	t	\N	0	0	f	f	-1	1	2011-02-16 11:30:00.962705	\N	\N	896 West Avenue	\N	\N	Kautzerbury	51618	Greater Manchester
6	LCD - Huge amounts	3	Itaque debitis facilis corporis ut eum nulla illo.Mollitia repellendus autem nihil expedita.	Laborum minus beatae enim atque omnis.Et eius non et.	2	User::Agent	0	964.0	211.0	1	Crist	Krystal Glover	548.768.8402	kieran_reichel@hermanwisoky.uk	2011-02-16 11:30:01.046551	2011-02-16 11:30:01.046551	2011-02-21	Houston129785580045285 Beahan	1	t	\N	0	0	f	f	-1	1	2011-02-16 11:30:01.054477	\N	\N	27791 Baron Ridges	\N	\N	Torphyburgh	82931	Lothian
7	GPS receivers required	3	Minima omnis expedita blanditiis odio qui sunt.Quod et et ex ipsam rerum et et autem.	Ratione excepturi ex eum fuga odit qui alias enim.Atque accusamus et ipsam enim eveniet odit pariatur.	2	User::Agent	0	533.0	636.0	1	Weimannwatsica	Kaylin Hamill	259-016-6308	adeline_zboncak@okunevamoen.biz	2011-02-16 11:30:01.139963	2011-02-16 11:30:01.139963	2011-02-21	Houston129785580045285 Beahan	1	t	\N	0	0	f	f	-1	1	2011-02-16 11:30:01.148201	\N	\N	76420 Furman Walk	\N	\N	South Harmonville	90735-8184	West Sussex
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
1	default_payout_delay	--- 0\n	2011-02-16 11:29:59.469688	2011-02-16 11:29:59.469688
2	default_leads_per_page	--- 5\n	2011-02-16 11:29:59.48094	2011-02-16 11:29:59.48094
3	certification_level_1	--- 10\n	2011-02-16 11:29:59.49327	2011-02-16 11:29:59.49327
4	certification_level_2	--- 20\n	2011-02-16 11:29:59.510896	2011-02-16 11:29:59.510896
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-16 11:29:59.522959	2011-02-16 11:29:59.522959
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-16 11:29:59.530949	2011-02-16 11:29:59.530949
7	invoicing_seller_name	--- Fairleads\n	2011-02-16 11:29:59.538801	2011-02-16 11:29:59.538801
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-16 11:29:59.546566	2011-02-16 11:29:59.546566
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-16 11:29:59.554358	2011-02-16 11:29:59.554358
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-16 11:29:59.563416	2011-02-16 11:29:59.563416
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
1	blazejek@gmail.com	7f6f298896030c58dbfc072676d9c09c7f418d7184ca20d847adef5a56b75c9021aedab018e02a857f01b597c0cfb64e6c1b68821f456aac113bd56b042ca2af	44hOA-dRK3QgDh_7CPkP	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 11:30:00.196414	2011-02-16 11:30:00.103642	\N	2011-02-16 11:30:00.111349	2011-02-16 11:30:00.19711	1	Helga	Lynch	(591)502-8091 x71211	root	\N	\N	\N	\N	0	\N	\N	\N	\N	wrbZaD12ZEHTaWy6RGA4MmpmsnAWwfSslHvEwPAEDwfurpzEO15fQommtQKK2o	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
2	agent@nbs.com	34a1c236a53d935b03a2237464953425afe13cafddd8b273538fdf286aaa30198f1ff920eac71415885eb86180c19358bb84803f7d519dd56506fa0113c8e376	_I8mggKRL4rn-Ukh_Kky	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 11:30:00.505204	2011-02-16 11:30:00.467611	\N	2011-02-16 11:30:00.473275	2011-02-16 11:30:00.505622	2	Houston129785580045285	Beahan	798.768.1002	Kyla Green129785580045267	\N	0	\N	\N	0	\N	\N	\N	\N	N5pK4N1OE0u1vuuK2KxLuSPtEVlGZILTEIeib13IUMHGxHoj51Kg0ogWqolENx	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
3	admin@nbs.com	7458525c3a0e11e8bdf787ef405ebfb08129fc3e74224c295fa9d1c665c820b139b2d247204de3e2624cb2294199b2fabb7fe3bbe2318f4254c7a021699ad956	hFlyLIEYGqkNPRqG9kEc	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 11:30:01.30421	2011-02-16 11:30:01.270944	\N	2011-02-16 11:30:01.27647	2011-02-16 11:30:01.304899	1	Miles	Douglas	733-819-6390 x44672	Ronny Bogan DVM129785580125637	\N	\N	\N	\N	0	\N	\N	\N	\N	BBG7X02yEmxSc5u4OYCUIXuYFZXButenJbXos7aqTLJd5HzCRDyeXuXMBIy02X	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
4	buyer@nbs.com	5ba29a7cc6b48071e2d08e3e1a884a8c0f0c4e011be25ded0852129f76ce4992ca254d00948421a6f21b860ffaa7ef3611452c16cce57cc1222177640ecc7b82	BXFhgvoXmhPTEGiOzFVM	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 11:30:01.417966	2011-02-16 11:30:01.382585	\N	2011-02-16 11:30:01.388128	2011-02-16 11:30:01.418382	48	Regan	Ebert	1-518-747-7984 x2676	Bart O'Reilly129785580135471	\N	\N	\N	\N	0	\N	\N	\N	\N	t1mHb5bXXqldRNttl4L9nlM4jxHc1EXwojNtG9aCPPQDTPlYG69jFUHPT4NcAZ	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
5	leaduser@nbs.com	759e33087ca0ea5284c06e46ecacf4946849fed47f14106d121dfb541c7fc6f3d2318e9a0d2ea422219191bc136574b4cf6546fbe8eae14586a7dd53239b5b0e	QNDCGTpLe42mX5Ofm6Vn	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 11:30:01.500377	2011-02-16 11:30:01.468796	\N	2011-02-16 11:30:01.469107	2011-02-16 11:30:01.530389	64	Fabian	Cummerata	1-843-698-0820 x69707	Lincoln Wisoky129785580146306	\N	\N	4	\N	0	\N	\N	\N	\N	7e0vqSCwE0H4uQG2XVHJJD3hTTXYml0Ww7LFcpdykScJEAULTWCbkhN79kSSY5	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	\N
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

