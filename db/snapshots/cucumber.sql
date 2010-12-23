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

SELECT pg_catalog.setval('article_translations_id_seq', 18, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 9, true);


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

SELECT pg_catalog.setval('email_template_translations_id_seq', 16, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 8, true);


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
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, content, title, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2010-12-23 11:59:39.612298	2010-12-23 11:59:39.612298
2	1	en	About us	About us	2010-12-23 11:59:39.626518	2010-12-23 11:59:39.626518
3	2	dk	Privacy	Privacy	2010-12-23 11:59:39.656768	2010-12-23 11:59:39.656768
4	2	en	Privacy	Privacy	2010-12-23 11:59:39.667923	2010-12-23 11:59:39.667923
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-23 11:59:39.828012	2010-12-23 11:59:39.828012
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-23 11:59:39.840105	2010-12-23 11:59:39.840105
7	4	dk	Blurb sign up	Blurb sign up	2010-12-23 11:59:39.86838	2010-12-23 11:59:39.86838
8	4	en	Blurb sign up	Blurb sign up	2010-12-23 11:59:39.879941	2010-12-23 11:59:39.879941
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-23 11:59:39.908464	2010-12-23 11:59:39.908464
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-23 11:59:39.919577	2010-12-23 11:59:39.919577
11	6	dk	Blurb agent home	Blurb agent home	2010-12-23 11:59:39.947612	2010-12-23 11:59:39.947612
12	6	en	Blurb agent home	Blurb agent home	2010-12-23 11:59:39.958699	2010-12-23 11:59:39.958699
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-23 11:59:39.986065	2010-12-23 11:59:39.986065
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-23 11:59:39.997507	2010-12-23 11:59:39.997507
15	8	dk	Blurb currencies	Blurb currencies	2010-12-23 11:59:40.026208	2010-12-23 11:59:40.026208
16	8	en	Blurb currencies	Blurb currencies	2010-12-23 11:59:40.037905	2010-12-23 11:59:40.037905
17	9	dk	Reset password	Reset password	2010-12-23 11:59:40.066176	2010-12-23 11:59:40.066176
18	9	en	Reset password	Reset password	2010-12-23 11:59:40.077748	2010-12-23 11:59:40.077748
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-23 11:59:39.603721	2010-12-23 11:59:39.629193	about_us	0	t	2010-12-23 11:59:39.629115
2	Article::Cms	2010-12-23 11:59:39.652756	2010-12-23 11:59:39.670752	privacy	0	t	2010-12-23 11:59:39.670678
3	Article::Cms	2010-12-23 11:59:39.823987	2010-12-23 11:59:39.843046	terms_conditions	0	t	2010-12-23 11:59:39.842964
4	Article::Cms	2010-12-23 11:59:39.864224	2010-12-23 11:59:39.883057	blurb_sign_up	1	t	2010-12-23 11:59:39.882979
5	Article::Cms	2010-12-23 11:59:39.90452	2010-12-23 11:59:39.922505	blurb_buyer_home	1	t	2010-12-23 11:59:39.922427
6	Article::Cms	2010-12-23 11:59:39.943412	2010-12-23 11:59:39.961531	blurb_agent_home	1	t	2010-12-23 11:59:39.961452
7	Article::Cms	2010-12-23 11:59:39.982115	2010-12-23 11:59:40.000465	blurb_start_page_role_selection	1	t	2010-12-23 11:59:40.000353
8	Article::Cms	2010-12-23 11:59:40.021909	2010-12-23 11:59:40.040736	blurb_currencies	1	t	2010-12-23 11:59:40.04066
9	Article::Cms	2010-12-23 11:59:40.062127	2010-12-23 11:59:40.080509	reset_password	2	t	2010-12-23 11:59:40.080432
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
1	Electronics	At voluptate eius fuga alias qui eos quis.Dolor dolorem consequatur modi laudantium sed.	2010-12-23 11:59:38.280628	2010-12-23 11:59:38.280628	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Totam omnis distinctio odit nisi est.Quaerat mollitia sed consequatur amet culpa.	2010-12-23 11:59:38.326197	2010-12-23 11:59:38.326197	\N	3	4	\N	0	2-leisure	f	0
3	Business	Occaecati qui in sapiente explicabo.Laboriosam non repudiandae cupiditate praesentium velit voluptatibus illo quae.	2010-12-23 11:59:38.361434	2010-12-23 11:59:39.170821	\N	5	6	\N	7	3-business	f	7
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
1	1	en	At voluptate eius fuga alias qui eos quis.Dolor dolorem consequatur modi laudantium sed.	Electronics	2010-12-23 11:59:38.290249	2010-12-23 11:59:38.290249
2	1	dk	\N	Electronics	2010-12-23 11:59:38.316475	2010-12-23 11:59:38.316475
3	2	en	Totam omnis distinctio odit nisi est.Quaerat mollitia sed consequatur amet culpa.	Leisure	2010-12-23 11:59:38.330968	2010-12-23 11:59:38.330968
4	2	dk	\N	Leisure	2010-12-23 11:59:38.351821	2010-12-23 11:59:38.351821
5	3	en	Occaecati qui in sapiente explicabo.Laboriosam non repudiandae cupiditate praesentium velit voluptatibus illo quae.	Business	2010-12-23 11:59:38.366006	2010-12-23 11:59:38.366006
6	3	dk	\N	Business	2010-12-23 11:59:38.385444	2010-12-23 11:59:38.385444
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-23 11:59:37.806509	2010-12-23 11:59:37.806509
2	United Kingdom	2010-12-23 11:59:37.811401	2010-12-23 11:59:37.811401
3	Northern Ireland129310557853846	2010-12-23 11:59:38.539788	2010-12-23 11:59:38.539788
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
1	Euro	&euro;	%u%n	t	2010-12-23 11:59:38.258636	2010-12-23 11:59:38.258636
2	PLN	&pln;	%u%n	t	2010-12-23 11:59:38.263037	2010-12-23 11:59:38.263037
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-23 11:59:37.841295	2010-12-23 11:59:37.841295
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-23 11:59:37.856414	2010-12-23 11:59:37.856414
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-23 11:59:37.869121	2010-12-23 11:59:37.869121
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-23 11:59:37.881515	2010-12-23 11:59:37.881515
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-23 11:59:37.894253	2010-12-23 11:59:37.894253
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-23 11:59:38.034406	2010-12-23 11:59:38.034406
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-23 11:59:38.046809	2010-12-23 11:59:38.046809
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-23 11:59:38.058895	2010-12-23 11:59:38.058895
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-23 11:59:38.071102	2010-12-23 11:59:38.071102
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-23 11:59:38.083111	2010-12-23 11:59:38.083111
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-23 11:59:38.095397	2010-12-23 11:59:38.095397
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-23 11:59:38.107371	2010-12-23 11:59:38.107371
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-23 11:59:38.119847	2010-12-23 11:59:38.119847
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-23 11:59:38.131872	2010-12-23 11:59:38.131872
15	8	en	Question	<p></p>	2010-12-23 11:59:38.14435	2010-12-23 11:59:38.14435
16	8	dk	[DK] Question	<p></p>	2010-12-23 11:59:38.156314	2010-12-23 11:59:38.156314
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-23 11:59:37.828277	2010-12-23 11:59:37.852047
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-23 11:59:37.864728	2010-12-23 11:59:37.87719
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-23 11:59:37.889556	2010-12-23 11:59:38.030004
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-23 11:59:38.042562	2010-12-23 11:59:38.054931
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-23 11:59:38.066819	2010-12-23 11:59:38.079007
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-23 11:59:38.090952	2010-12-23 11:59:38.103404
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-23 11:59:38.115585	2010-12-23 11:59:38.127909
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-23 11:59:38.139968	2010-12-23 11:59:38.152284
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

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, hidden_description, description, header, created_at, updated_at) FROM stdin;
1	1	dk	Consequuntur fuga placeat et sed labore.Vel aliquid quaerat quasi quis et.	Blanditiis adipisci repellendus quis eligendi aliquam enim.Tempore quas mollitia non rerum dicta.	Big deal on printers	2010-12-23 11:59:38.644207	2010-12-23 11:59:38.644207
2	2	dk	Cumque qui reprehenderit ut quibusdam et.Dolorum qui et voluptatem nobis.	Saepe rem perferendis aut quae sint necessitatibus laborum eligendi.Magni esse rerum similique.	Drills required	2010-12-23 11:59:38.713402	2010-12-23 11:59:38.713402
3	3	dk	Consequatur sed consectetur assumenda sed sequi esse.Aut pariatur quo impedit neque dolorum harum numquam et.	Explicabo libero aut et.Perferendis non laborum inventore.	Need assistance in selling a car	2010-12-23 11:59:38.778486	2010-12-23 11:59:38.778486
4	4	dk	Possimus et sapiente est officia eaque a.Dolorum nesciunt vel voluptatibus minus qui suscipit ducimus.	Rerum ipsum eligendi sint blanditiis.Debitis illum nam neque in explicabo omnis.	Ipod shipment	2010-12-23 11:59:38.847325	2010-12-23 11:59:38.847325
5	5	dk	Voluptatibus perspiciatis dolore cupiditate et est corporis.Eum rerum in iste autem molestias voluptatem.	Qui ut consequatur quae.Eum officia praesentium nulla et.	Trip to amazonia - looking for offer	2010-12-23 11:59:39.044901	2010-12-23 11:59:39.044901
6	6	dk	Velit et aut numquam.Non expedita recusandae similique numquam pariatur.	Nihil iure dignissimos et magni aut.Et expedita voluptas aut illum quis corrupti temporibus.	LCD - Huge amounts	2010-12-23 11:59:39.111247	2010-12-23 11:59:39.111247
7	7	dk	Expedita voluptas magni repellat.Nihil rem commodi tenetur omnis consequatur.	Quos fugit alias iste dicta qui perferendis minus laboriosam.Error id non quaerat.	GPS receivers required	2010-12-23 11:59:39.177684	2010-12-23 11:59:39.177684
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Blanditiis adipisci repellendus quis eligendi aliquam enim.Tempore quas mollitia non rerum dicta.	Consequuntur fuga placeat et sed labore.Vel aliquid quaerat quasi quis et.	2	User::Agent	0	608.0	521.0	1	Bechtelar	Mattie Graham	687-929-1400 x465	julien@kulas.co.uk	33133 Matilda Tunnel	2010-12-23 11:59:38.6043	2010-12-23 11:59:38.6043	2010-12-28	Leslie129310557853765 Ruecker	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Saepe rem perferendis aut quae sint necessitatibus laborum eligendi.Magni esse rerum similique.	Cumque qui reprehenderit ut quibusdam et.Dolorum qui et voluptatem nobis.	2	User::Agent	0	786.0	707.0	1	Kerluke	Dr. Tess Runolfsson	(363)858-9926 x238	taya_erdman@haucknienow.biz	10360 Turner Motorway	2010-12-23 11:59:38.681957	2010-12-23 11:59:38.681957	2010-12-28	Leslie129310557853765 Ruecker	1	t	\N	0	0	f	f	-1	1
3	Need assistance in selling a car	3	Explicabo libero aut et.Perferendis non laborum inventore.	Consequatur sed consectetur assumenda sed sequi esse.Aut pariatur quo impedit neque dolorum harum numquam et.	2	User::Agent	0	582.0	803.0	1	Daugherty	Dr. Leonel Prohaska	628.203.2455 x001	alda@homenickkuhn.ca	637 Emie Shore	2010-12-23 11:59:38.747609	2010-12-23 11:59:38.747609	2010-12-28	Leslie129310557853765 Ruecker	1	t	\N	0	0	f	f	-1	1
4	Ipod shipment	3	Rerum ipsum eligendi sint blanditiis.Debitis illum nam neque in explicabo omnis.	Possimus et sapiente est officia eaque a.Dolorum nesciunt vel voluptatibus minus qui suscipit ducimus.	2	User::Agent	0	661.0	721.0	1	Bradtke	Anna Abshire	(445)461-1098 x19014	clair_collins@frami.name	9974 Florencio Forest	2010-12-23 11:59:38.813004	2010-12-23 11:59:38.813004	2010-12-28	Leslie129310557853765 Ruecker	1	t	\N	0	0	f	f	-1	1
5	Trip to amazonia - looking for offer	3	Qui ut consequatur quae.Eum officia praesentium nulla et.	Voluptatibus perspiciatis dolore cupiditate et est corporis.Eum rerum in iste autem molestias voluptatem.	2	User::Agent	0	517.0	324.0	1	Kohleremmerich	Lillie Reichel	(306)995-1782 x6214	timothy_harber@bechtelar.us	60063 Senger Extension	2010-12-23 11:59:39.01296	2010-12-23 11:59:39.01296	2010-12-28	Leslie129310557853765 Ruecker	1	t	\N	0	0	f	f	-1	1
6	LCD - Huge amounts	3	Nihil iure dignissimos et magni aut.Et expedita voluptas aut illum quis corrupti temporibus.	Velit et aut numquam.Non expedita recusandae similique numquam pariatur.	2	User::Agent	0	30.0	336.0	1	Ullrich	Dina Rohan	(287)732-2858 x85846	trevor@vandervort.biz	2104 Mckenzie Mall	2010-12-23 11:59:39.079778	2010-12-23 11:59:39.079778	2010-12-28	Leslie129310557853765 Ruecker	1	t	\N	0	0	f	f	-1	1
7	GPS receivers required	3	Quos fugit alias iste dicta qui perferendis minus laboriosam.Error id non quaerat.	Expedita voluptas magni repellat.Nihil rem commodi tenetur omnis consequatur.	2	User::Agent	0	122.0	492.0	1	Mante	Winnifred Wolf	500-983-2666	janet@herman.info	8446 Cronin Islands	2010-12-23 11:59:39.146093	2010-12-23 11:59:39.146093	2010-12-28	Leslie129310557853765 Ruecker	1	t	\N	0	0	f	f	-1	1
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
1	default_payout_delay	--- 0\n	2010-12-23 11:59:37.774775	2010-12-23 11:59:37.774775
2	default_leads_per_page	--- 5\n	2010-12-23 11:59:37.78022	2010-12-23 11:59:37.78022
3	certification_level_1	--- 10\n	2010-12-23 11:59:37.782533	2010-12-23 11:59:37.782533
4	certification_level_2	--- 20\n	2010-12-23 11:59:37.784586	2010-12-23 11:59:37.784586
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-23 11:59:37.786867	2010-12-23 11:59:37.786867
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-23 11:59:37.78892	2010-12-23 11:59:37.78892
7	invoicing_seller_name	--- Fairleads\n	2010-12-23 11:59:37.791235	2010-12-23 11:59:37.791235
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-23 11:59:37.793522	2010-12-23 11:59:37.793522
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-23 11:59:37.795689	2010-12-23 11:59:37.795689
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-23 11:59:37.797943	2010-12-23 11:59:37.797943
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, linkedin_url, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information) FROM stdin;
1	blazejek@gmail.com	d0f8e8212b8881841097e9e41e9aa240f6a514e31c657936b0d468363600ca626ec4dba6ef1ed5cc4b4f5ec81b6dee38178038e7f3ad26f6bb81823d55902421	m_hMrXQ7AGmm4ezgES5I	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 11:59:38.248949	2010-12-23 11:59:38.188771	\N	2010-12-23 11:59:38.189	2010-12-23 11:59:38.249266	1	Rosalia	Corkery	(397)754-9223 x09534	root	Borer Shore	Bayerview	26676	Cleveland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	HbC32GBMLLGGHyYdfZE4G7948WvRLAqQBL46KFBYAImRn8k5UdRJm9Vkin323i	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	4ea0879ee762fb6b5a8f92275228b4bfca625071ef12f73fb16cb4be317a64f89d13804ae9e742ff04cae9ffb4edc38e375efa7ea8bb60df18f4f95a55ae12ad	t6vJkGYPXVUEPdpIMC90	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 11:59:38.567863	2010-12-23 11:59:38.545151	\N	2010-12-23 11:59:38.545371	2010-12-23 11:59:38.568132	2	Leslie129310557853765	Ruecker	248-056-2635 x31698	Libbie Johnston129310557853731	Queenie Viaduct	West Telly	98581-6694	Surrey	3	\N	0	\N	\N	0	\N	\N	\N	\N	AtSeK2LSzxmVuQUVHH6ukN1eJtnnqTduFRR2i2PvsHh062j3Zs8H8JkMH8MKzO	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	eab23f2f56e54af0786a6f9451992434e6f4e23c7ac271277a2f69092376b0fb950db322453fc3330d374d87038921361239a48ba51079f0f3282680a0e23953	RoaAW18LXuU3zS119CVT	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 11:59:39.2531	2010-12-23 11:59:39.233154	\N	2010-12-23 11:59:39.23337	2010-12-23 11:59:39.253368	1	Emily	Satterfield	(120)288-4827 x527	Carlie Fisher12931055792286	Jakubowski Tunnel	Stokeston	73161	Cleveland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	858CNvVkuJDJ6RTmAozQBJAreqRUctvdlAbBvvFYjAkSIoIYAin55vqVTcmSn8	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	8a6fe8835935db69dac5e63c3bc7b1176d6348c87a2694c8d4183addd440a559a483ebfc5487c4f4878c3c033b2963793b32971162825f1509c02647cdbb9968	BD-ycTnXR7TekmzHhpuL	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 11:59:39.305419	2010-12-23 11:59:39.282871	\N	2010-12-23 11:59:39.28309	2010-12-23 11:59:39.305691	48	Tess	Russel	1-131-655-4621	Emmet Kovacek129310557927829	Murray Squares	Koeppburgh	04103-7010	Lincolnshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	U6OG83R7aluQLaBBQgeLWqLHUgmhxu42s48vicLOfeETEzcu1fE8cH4JUcdR1B	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	db10de450a2a10cce771a21f6d0c3bf899f17ca8460b1060ca0a42ba0e84d8a5691f9c24c06d23218c30d7ec4b12c27620a7871a848a432ecb9366668106e316	hhqI4bIQS43w3RUJkNsF	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 11:59:39.491888	2010-12-23 11:59:39.335492	\N	2010-12-23 11:59:39.335759	2010-12-23 11:59:39.506387	64	Lauriane	Deckow	309-063-8660 x92944	Raphael Mayert129310557933039	Kaylin Creek	Gradytown	55958-3770	Kent	1	\N	\N	4	\N	0	\N	\N	\N	\N	wVA44NKkHpSfA11qkFJQEsfu4MeUQz7p09l2b9iv628dO9GPEKdkhw1cE66Uau	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

