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

SELECT pg_catalog.setval('article_translations_id_seq', 97, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 87, true);


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('assets_id_seq', 5, true);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('bank_accounts_id_seq', 20, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('categories_id_seq', 861, true);


--
-- Name: category_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_interests_id_seq', 6, true);


--
-- Name: category_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_translations_id_seq', 864, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('countries_id_seq', 724, true);


--
-- Name: country_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_interests_id_seq', 2, true);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('currencies_id_seq', 650, true);


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

SELECT pg_catalog.setval('invoice_lines_id_seq', 44, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('invoices_id_seq', 55, true);


--
-- Name: lead_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_purchases_id_seq', 300, true);


--
-- Name: lead_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_translations_id_seq', 662, true);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('leads_id_seq', 661, true);


--
-- Name: payment_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('payment_notifications_id_seq', 16, true);


--
-- Name: payment_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('payment_transactions_id_seq', 30, true);


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

SELECT pg_catalog.setval('users_id_seq', 1549, true);


--
-- Name: vat_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vat_rates_id_seq', 4, true);


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-07 12:19:14.007331	2011-02-07 12:19:14.007331
2	1	en	About us	About us	2011-02-07 12:19:14.034408	2011-02-07 12:19:14.034408
3	2	dk	Privacy	Privacy	2011-02-07 12:19:14.082269	2011-02-07 12:19:14.082269
4	2	en	Privacy	Privacy	2011-02-07 12:19:14.10582	2011-02-07 12:19:14.10582
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-07 12:19:14.155556	2011-02-07 12:19:14.155556
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-07 12:19:14.174755	2011-02-07 12:19:14.174755
7	4	dk	Blurb sign up	Blurb sign up	2011-02-07 12:19:14.226719	2011-02-07 12:19:14.226719
8	4	en	Blurb sign up	Blurb sign up	2011-02-07 12:19:14.247563	2011-02-07 12:19:14.247563
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-07 12:19:14.310915	2011-02-07 12:19:14.310915
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-07 12:19:14.337777	2011-02-07 12:19:14.337777
11	6	dk	Blurb agent home	Blurb agent home	2011-02-07 12:19:14.403325	2011-02-07 12:19:14.403325
12	6	en	Blurb agent home	Blurb agent home	2011-02-07 12:19:14.422447	2011-02-07 12:19:14.422447
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-07 12:19:14.46697	2011-02-07 12:19:14.46697
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-07 12:19:14.492648	2011-02-07 12:19:14.492648
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-07 12:19:14.546393	2011-02-07 12:19:14.546393
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-07 12:19:14.572559	2011-02-07 12:19:14.572559
17	9	dk	Blurb currencies	Blurb currencies	2011-02-07 12:19:14.627977	2011-02-07 12:19:14.627977
18	9	en	Blurb currencies	Blurb currencies	2011-02-07 12:19:14.649615	2011-02-07 12:19:14.649615
19	10	dk	Reset password	Reset password	2011-02-07 12:19:14.696312	2011-02-07 12:19:14.696312
20	10	en	Reset password	Reset password	2011-02-07 12:19:14.714307	2011-02-07 12:19:14.714307
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-02-07 12:19:13.991413	2011-02-07 12:19:14.040149	about_us	0	t	2011-02-07 12:19:14.040041
2	Article::Cms	2011-02-07 12:19:14.07679	2011-02-07 12:19:14.112149	privacy	0	t	2011-02-07 12:19:14.112026
3	Article::Cms	2011-02-07 12:19:14.148915	2011-02-07 12:19:14.181681	terms_conditions	0	t	2011-02-07 12:19:14.181555
4	Article::Cms	2011-02-07 12:19:14.220396	2011-02-07 12:19:14.257831	blurb_sign_up	1	t	2011-02-07 12:19:14.257656
5	Article::Cms	2011-02-07 12:19:14.305422	2011-02-07 12:19:14.345944	blurb_buyer_home	1	t	2011-02-07 12:19:14.345756
6	Article::Cms	2011-02-07 12:19:14.397868	2011-02-07 12:19:14.429381	blurb_agent_home	1	t	2011-02-07 12:19:14.429261
7	Article::Cms	2011-02-07 12:19:14.460869	2011-02-07 12:19:14.499035	blurb_purchase_manager_home	1	t	2011-02-07 12:19:14.498925
8	Article::Cms	2011-02-07 12:19:14.53927	2011-02-07 12:19:14.57924	blurb_start_page_role_selection	1	t	2011-02-07 12:19:14.579096
9	Article::Cms	2011-02-07 12:19:14.617873	2011-02-07 12:19:14.655798	blurb_currencies	1	t	2011-02-07 12:19:14.655626
10	Article::Cms	2011-02-07 12:19:14.689678	2011-02-07 12:19:14.720615	reset_password	2	t	2011-02-07 12:19:14.720501
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-07 12:19:11.796896	2011-02-07 12:19:11.796896	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Et illum qui dignissimos magni.Doloribus et reiciendis accusantium.	2011-02-07 12:19:12.524169	2011-02-07 12:19:12.524169	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Ea in molestiae ea adipisci similique rerum sed et.Sint adipisci quis repudiandae cupiditate itaque occaecati.	2011-02-07 12:19:12.59324	2011-02-07 12:19:12.59324	\N	3	4	\N	0	2-leisure	f	0
3	Business	Modi dolorem vitae neque aut quasi.Occaecati explicabo iusto ut quisquam accusamus.	2011-02-07 12:19:12.6509	2011-02-07 12:19:13.537332	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Et illum qui dignissimos magni.Doloribus et reiciendis accusantium.	Electronics	2011-02-07 12:19:12.53735	2011-02-07 12:19:12.53735
2	1	dk	\N	Electronics	2011-02-07 12:19:12.576746	2011-02-07 12:19:12.576746
3	2	en	Ea in molestiae ea adipisci similique rerum sed et.Sint adipisci quis repudiandae cupiditate itaque occaecati.	Leisure	2011-02-07 12:19:12.604657	2011-02-07 12:19:12.604657
4	2	dk	\N	Leisure	2011-02-07 12:19:12.633792	2011-02-07 12:19:12.633792
5	3	en	Modi dolorem vitae neque aut quasi.Occaecati explicabo iusto ut quisquam accusamus.	Business	2011-02-07 12:19:12.656739	2011-02-07 12:19:12.656739
6	3	dk	\N	Business	2011-02-07 12:19:12.689327	2011-02-07 12:19:12.689327
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-07 12:19:11.764773	2011-02-07 12:19:11.764773
2	United Kingdom	2011-02-07 12:19:11.777976	2011-02-07 12:19:11.777976
3	Northern Ireland129708115273327	2011-02-07 12:19:12.735128	2011-02-07 12:19:12.735128
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
1	Euro	&euro;	%u%n	t	2011-02-07 12:19:12.475674	2011-02-07 12:19:12.475674
2	PLN	&pln;	%u%n	t	2011-02-07 12:19:12.487032	2011-02-07 12:19:12.487032
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-07 12:19:11.854588	2011-02-07 12:19:11.854588
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-07 12:19:11.878652	2011-02-07 12:19:11.878652
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-07 12:19:11.901274	2011-02-07 12:19:11.901274
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-07 12:19:11.92072	2011-02-07 12:19:11.92072
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-07 12:19:11.948705	2011-02-07 12:19:11.948705
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-07 12:19:11.969066	2011-02-07 12:19:11.969066
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-07 12:19:11.987585	2011-02-07 12:19:11.987585
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-07 12:19:12.015609	2011-02-07 12:19:12.015609
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-07 12:19:12.037644	2011-02-07 12:19:12.037644
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-07 12:19:12.058053	2011-02-07 12:19:12.058053
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-07 12:19:12.086673	2011-02-07 12:19:12.086673
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-07 12:19:12.120932	2011-02-07 12:19:12.120932
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-07 12:19:12.142181	2011-02-07 12:19:12.142181
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-07 12:19:12.166157	2011-02-07 12:19:12.166157
15	8	en	<p></p>	Question	2011-02-07 12:19:12.195703	2011-02-07 12:19:12.195703
16	8	dk	<p></p>	[DK] Question	2011-02-07 12:19:12.220907	2011-02-07 12:19:12.220907
17	9	en	<p></p>	Invoice	2011-02-07 12:19:12.247278	2011-02-07 12:19:12.247278
18	9	dk	<p></p>	[DK] Invoice	2011-02-07 12:19:12.268278	2011-02-07 12:19:12.268278
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-07 12:19:11.842806	2011-02-07 12:19:11.872519
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-07 12:19:11.893501	2011-02-07 12:19:11.915276
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-07 12:19:11.940654	2011-02-07 12:19:11.962766
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-07 12:19:11.981261	2011-02-07 12:19:12.007079
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-07 12:19:12.031375	2011-02-07 12:19:12.052817
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-07 12:19:12.077195	2011-02-07 12:19:12.107518
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-07 12:19:12.135633	2011-02-07 12:19:12.159684
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-07 12:19:12.187338	2011-02-07 12:19:12.214844
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-07 12:19:12.240847	2011-02-07 12:19:12.261919
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
1	1	dk	Big deal on printers	Accusantium harum ipsum atque minima possimus voluptatum.At blanditiis et voluptate harum molestiae eos.	Minima laboriosam qui odio incidunt et doloribus quod minus.Praesentium natus voluptas sint ut non quod nulla voluptatem.	2011-02-07 12:19:12.919541	2011-02-07 12:19:12.919541
2	2	dk	Drills required	Vero exercitationem eligendi hic eos corrupti.Animi quis aut molestiae at quod.	Tempora quas enim necessitatibus.Omnis provident molestiae in dolore earum tenetur consequatur.	2011-02-07 12:19:13.035061	2011-02-07 12:19:13.035061
3	3	dk	Need assistance in selling a car	Fuga voluptatem aut et numquam natus et.Expedita voluptatibus aut vero asperiores alias.	Veniam hic consectetur ad fugiat ut consequatur.Ea perspiciatis ut aut earum iste aut.	2011-02-07 12:19:13.135777	2011-02-07 12:19:13.135777
4	4	dk	Ipod shipment	Qui qui non vero consectetur quidem.Odio quas aut voluptatem facere id veniam ex.	Quaerat voluptates repudiandae molestiae non aut.Dolore voluptas veniam non omnis commodi voluptatibus in rerum.	2011-02-07 12:19:13.238111	2011-02-07 12:19:13.238111
5	5	dk	Trip to amazonia - looking for offer	Libero sit iure esse sapiente dolor.Dicta voluptates itaque minus accusantium atque officia harum.	Accusantium quidem voluptatum aut alias blanditiis omnis.Pariatur est rerum voluptatem atque.	2011-02-07 12:19:13.335699	2011-02-07 12:19:13.335699
6	6	dk	LCD - Huge amounts	Qui ea molestiae ut facere aut rerum.Voluptatem quidem illum sunt reiciendis qui modi placeat.	Eaque aut veniam sit culpa qui sunt.Nulla ipsum consequatur repellendus voluptate sint ratione.	2011-02-07 12:19:13.446314	2011-02-07 12:19:13.446314
7	7	dk	GPS receivers required	Aut sunt a sit et nostrum.Sapiente possimus nihil quis eligendi vitae atque.	Dignissimos placeat excepturi est eaque officia quia tempore est.Architecto optio perspiciatis magnam voluptatem qui.	2011-02-07 12:19:13.546974	2011-02-07 12:19:13.546974
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Minima laboriosam qui odio incidunt et doloribus quod minus.Praesentium natus voluptas sint ut non quod nulla voluptatem.	Accusantium harum ipsum atque minima possimus voluptatum.At blanditiis et voluptate harum molestiae eos.	2	User::Agent	0	521.0	696.0	1	Mohr	Dr. Nick Watsica	267-621-4635 x281	catherine_koelpin@pfeffer.com	2011-02-07 12:19:12.857086	2011-02-07 12:19:12.857086	2011-02-12	Jamarcus129708115273236 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-07 12:19:12.869416	\N	\N	317 Forest Alley	\N	\N	Port Arnulfoside	75834	Staffordshire
2	Drills required	3	Tempora quas enim necessitatibus.Omnis provident molestiae in dolore earum tenetur consequatur.	Vero exercitationem eligendi hic eos corrupti.Animi quis aut molestiae at quod.	2	User::Agent	0	654.0	504.0	1	Jastmorissette	Payton Collier	310-410-8136 x33702	luigi@torphy.uk	2011-02-07 12:19:12.986288	2011-02-07 12:19:12.986288	2011-02-12	Jamarcus129708115273236 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-07 12:19:12.994586	\N	\N	49055 Deckow Field	\N	\N	South Jakob	89813-3162	Central
3	Need assistance in selling a car	3	Veniam hic consectetur ad fugiat ut consequatur.Ea perspiciatis ut aut earum iste aut.	Fuga voluptatem aut et numquam natus et.Expedita voluptatibus aut vero asperiores alias.	2	User::Agent	0	154.0	918.0	1	Dickinson	Laurence Lakin	1-044-242-9242 x9994	willis@carter.com	2011-02-07 12:19:13.091245	2011-02-07 12:19:13.091245	2011-02-12	Jamarcus129708115273236 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-07 12:19:13.100911	\N	\N	157 Okuneva Locks	\N	\N	Alvenatown	09548	Warwickshire
4	Ipod shipment	3	Quaerat voluptates repudiandae molestiae non aut.Dolore voluptas veniam non omnis commodi voluptatibus in rerum.	Qui qui non vero consectetur quidem.Odio quas aut voluptatem facere id veniam ex.	2	User::Agent	0	221.0	95.0	1	Casperhansen	Jeromy Waelchi	647-466-8759 x793	jayme_gleason@walshschroeder.uk	2011-02-07 12:19:13.192087	2011-02-07 12:19:13.192087	2011-02-12	Jamarcus129708115273236 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-07 12:19:13.200545	\N	\N	2767 Concepcion Wall	\N	\N	South Orionton	16997-6491	Suffolk
5	Trip to amazonia - looking for offer	3	Accusantium quidem voluptatum aut alias blanditiis omnis.Pariatur est rerum voluptatem atque.	Libero sit iure esse sapiente dolor.Dicta voluptates itaque minus accusantium atque officia harum.	2	User::Agent	0	426.0	128.0	1	Stammosinski	Dewitt Shanahan	521.709.7676 x6921	chance.braun@farrell.ca	2011-02-07 12:19:13.291972	2011-02-07 12:19:13.291972	2011-02-12	Jamarcus129708115273236 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-07 12:19:13.301182	\N	\N	7474 Ericka Coves	\N	\N	Laurietown	94583	Cumbria
6	LCD - Huge amounts	3	Eaque aut veniam sit culpa qui sunt.Nulla ipsum consequatur repellendus voluptate sint ratione.	Qui ea molestiae ut facere aut rerum.Voluptatem quidem illum sunt reiciendis qui modi placeat.	2	User::Agent	0	967.0	407.0	1	Oconnellbosco	Sigmund VonRueden	(342)794-4292	dovie@marks.uk	2011-02-07 12:19:13.400349	2011-02-07 12:19:13.400349	2011-02-12	Jamarcus129708115273236 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-07 12:19:13.410526	\N	\N	24627 Mayert Fields	\N	\N	North Joanne	93392	Bedfordshire
7	GPS receivers required	3	Dignissimos placeat excepturi est eaque officia quia tempore est.Architecto optio perspiciatis magnam voluptatem qui.	Aut sunt a sit et nostrum.Sapiente possimus nihil quis eligendi vitae atque.	2	User::Agent	0	982.0	824.0	1	Pollich	Katelin Lubowitz	983-019-8365 x2656	catharine@krajcikdamore.uk	2011-02-07 12:19:13.501833	2011-02-07 12:19:13.501833	2011-02-12	Jamarcus129708115273236 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-07 12:19:13.510145	\N	\N	4594 Theron Highway	\N	\N	Nettieville	82749	Bedfordshire
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
1	default_payout_delay	--- 0\n	2011-02-07 12:19:11.670601	2011-02-07 12:19:11.670601
2	default_leads_per_page	--- 5\n	2011-02-07 12:19:11.680827	2011-02-07 12:19:11.680827
3	certification_level_1	--- 10\n	2011-02-07 12:19:11.689882	2011-02-07 12:19:11.689882
4	certification_level_2	--- 20\n	2011-02-07 12:19:11.697998	2011-02-07 12:19:11.697998
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-07 12:19:11.705659	2011-02-07 12:19:11.705659
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-07 12:19:11.713427	2011-02-07 12:19:11.713427
7	invoicing_seller_name	--- Fairleads\n	2011-02-07 12:19:11.72031	2011-02-07 12:19:11.72031
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-07 12:19:11.727181	2011-02-07 12:19:11.727181
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-07 12:19:11.735036	2011-02-07 12:19:11.735036
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-07 12:19:11.742802	2011-02-07 12:19:11.742802
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
1	blazejek@gmail.com	924bbca407bfc464074d3314e513740f02095e1b8c69b3b1cfaf620848ef82e07b2927b70180bc2ab0fc0d9b6274f9f7f37848e0fc72fe7a4076877e9facf04e	tDqZ99Q8vGV2BTgQrLU6	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 12:19:12.44629	2011-02-07 12:19:12.333451	\N	2011-02-07 12:19:12.339726	2011-02-07 12:19:12.446745	1	Terrence	Rippin	609-684-7625 x872	root	Littel Club	New Fidel	40108	East Sussex	1	\N	\N	\N	\N	0	\N	\N	\N	\N	2OiEFyVHayCqB9sMv98nHTz4eUsY0obGdzzHbnKkZQmSPsHRapM4M21j1UIcWS	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
2	agent@nbs.com	3f97f40cdd7b2a12abe1ababf4c173bfb83a4dea1e96e39eb0561f11dc008792ea904685a5e0a3443a859561b5858f972abc2c00130a207bf7ece704765624ef	no6ZvW-yL53d9VXwdgMA	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 12:19:12.789016	2011-02-07 12:19:12.746255	\N	2011-02-07 12:19:12.749368	2011-02-07 12:19:12.790364	2	Jamarcus129708115273236	Rosenbaum	1-489-416-9656	Dahlia Blick129708115273208	Wintheiser Common	South Meredithbury	43034	Gwent	1	\N	0	\N	\N	0	\N	\N	\N	\N	fssAUnqaDbjAbNNztfRmmUF9ss7UGbjZHNSO6ScbL6e6UrFGpmDKOAX1qL0xhy	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
3	admin@nbs.com	fe1860ed2e28e4abe7d7d176e38b75fb99ca149f754935ff8953c192d6e5c5f1144440d4931de5e70b516fa0455a863e9a85026f64f5fd8f5dcc881e7a0b8177	PBjqHGEjCaHKfVbylJhq	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 12:19:13.663183	2011-02-07 12:19:13.632939	\N	2011-02-07 12:19:13.635585	2011-02-07 12:19:13.663633	1	Fred	Weber	091.528.4566 x2587	Sadie Dooley129708115362466	Ida Ports	Lambertchester	18748-2845	Shropshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	3pBhuPOGwQ2qd4ijo0f842nBLF9b4tUeTxcMV3ZeUCsx6lqrb7pKDZmFqCUzgW	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
4	buyer@nbs.com	30988e5ec2f2dda5a79097521b5f6dcdcf41acb29ec48e8ba0eaf755a2c887e25e12454351fc685973ca7348478173a245848e9c2c263eff34201835f5d51de3	_Oe2r6ZM5kJETVsUBEBW	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 12:19:13.752903	2011-02-07 12:19:13.713713	\N	2011-02-07 12:19:13.716835	2011-02-07 12:19:13.753368	48	Graham	Cremin	1-443-486-0029	Einar Robel129708115370499	Hane Union	New Omastad	39829	Gwynedd County	1	\N	\N	\N	\N	0	\N	\N	\N	\N	fyXcg03nHF7v1y97vx18kvz5XQcy6NB44rOAYwP27T8VY4C79iPEFJnwB5LKn4	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
5	leaduser@nbs.com	bb3e16c15833ae3405eccb9837136d6397e7585bad2b3e55eec2d2b1f478a029541227ef6a781d25257c37afb39a68ebcbe0212e9a7808a71824ad6e8b231c26	QdrJylPlVjDDfv6Ztcst	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-07 12:19:13.840082	2011-02-07 12:19:13.806614	\N	2011-02-07 12:19:13.809312	2011-02-07 12:19:13.873962	64	Francisca	Abernathy	095-445-5091	Myra Kris129708115379837	Johnathan Centers	Kathrynehaven	68250	Cornwall	1	\N	\N	4	\N	0	\N	\N	\N	\N	YFNotduQq87FDsez3Tq1MMKBVdtsb1VldFt3oegZczL0OsOj1voOL3Uo8JBP04	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

