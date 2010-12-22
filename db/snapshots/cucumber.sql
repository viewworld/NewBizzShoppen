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

SELECT pg_catalog.setval('currencies_id_seq', 8, true);


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
1	1	dk	About us	About us	2010-12-20 09:16:03.443565	2010-12-20 09:16:03.443565
2	1	en	About us	About us	2010-12-20 09:16:03.458989	2010-12-20 09:16:03.458989
3	2	dk	Privacy	Privacy	2010-12-20 09:16:03.488916	2010-12-20 09:16:03.488916
4	2	en	Privacy	Privacy	2010-12-20 09:16:03.500979	2010-12-20 09:16:03.500979
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-20 09:16:03.530814	2010-12-20 09:16:03.530814
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-20 09:16:03.669426	2010-12-20 09:16:03.669426
7	4	dk	Blurb sign up	Blurb sign up	2010-12-20 09:16:03.697471	2010-12-20 09:16:03.697471
8	4	en	Blurb sign up	Blurb sign up	2010-12-20 09:16:03.709945	2010-12-20 09:16:03.709945
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-20 09:16:03.737263	2010-12-20 09:16:03.737263
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-20 09:16:03.749517	2010-12-20 09:16:03.749517
11	6	dk	Blurb agent home	Blurb agent home	2010-12-20 09:16:03.777335	2010-12-20 09:16:03.777335
12	6	en	Blurb agent home	Blurb agent home	2010-12-20 09:16:03.790053	2010-12-20 09:16:03.790053
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-20 09:16:03.816519	2010-12-20 09:16:03.816519
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-20 09:16:03.828737	2010-12-20 09:16:03.828737
15	8	dk	Blurb currencies	Blurb currencies	2010-12-20 09:16:03.85591	2010-12-20 09:16:03.85591
16	8	en	Blurb currencies	Blurb currencies	2010-12-20 09:16:03.86856	2010-12-20 09:16:03.86856
17	9	dk	Reset password	Reset password	2010-12-20 09:16:03.89766	2010-12-20 09:16:03.89766
18	9	en	Reset password	Reset password	2010-12-20 09:16:03.910306	2010-12-20 09:16:03.910306
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-20 09:16:03.435103	2010-12-20 09:16:03.461929	about_us	0	t	2010-12-20 09:16:03.461863
2	Article::Cms	2010-12-20 09:16:03.484965	2010-12-20 09:16:03.50392	privacy	0	t	2010-12-20 09:16:03.503847
3	Article::Cms	2010-12-20 09:16:03.526699	2010-12-20 09:16:03.672498	terms_conditions	0	t	2010-12-20 09:16:03.672428
4	Article::Cms	2010-12-20 09:16:03.693251	2010-12-20 09:16:03.712905	blurb_sign_up	1	t	2010-12-20 09:16:03.712839
5	Article::Cms	2010-12-20 09:16:03.733209	2010-12-20 09:16:03.752937	blurb_buyer_home	1	t	2010-12-20 09:16:03.752868
6	Article::Cms	2010-12-20 09:16:03.773398	2010-12-20 09:16:03.792961	blurb_agent_home	1	t	2010-12-20 09:16:03.792895
7	Article::Cms	2010-12-20 09:16:03.812632	2010-12-20 09:16:03.831636	blurb_start_page_role_selection	1	t	2010-12-20 09:16:03.83157
8	Article::Cms	2010-12-20 09:16:03.851798	2010-12-20 09:16:03.871759	blurb_currencies	1	t	2010-12-20 09:16:03.871688
9	Article::Cms	2010-12-20 09:16:03.893318	2010-12-20 09:16:03.913361	reset_password	2	t	2010-12-20 09:16:03.913291
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, published_leads_count, is_locked) FROM stdin;
1	Electronics	Eligendi reiciendis id maxime aspernatur qui voluptatem.Suscipit omnis voluptas ea natus ea explicabo consequatur.	2010-12-20 09:16:02.097474	2010-12-20 09:16:02.097474	\N	1	2	\N	0	1-electronics	0	f
2	Leisure	Omnis corporis voluptas fugit necessitatibus.Iusto et eius et sunt autem provident omnis et.	2010-12-20 09:16:02.139791	2010-12-20 09:16:02.139791	\N	3	4	\N	0	2-leisure	0	f
3	Business	Accusamus illum voluptas dicta ut aut sequi.Animi totam id exercitationem soluta repellat.	2010-12-20 09:16:02.172203	2010-12-20 09:16:02.998145	\N	5	6	\N	7	3-business	7	f
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
1	1	en	Eligendi reiciendis id maxime aspernatur qui voluptatem.Suscipit omnis voluptas ea natus ea explicabo consequatur.	Electronics	2010-12-20 09:16:02.106283	2010-12-20 09:16:02.106283
2	1	dk	\N	Electronics	2010-12-20 09:16:02.130735	2010-12-20 09:16:02.130735
3	2	en	Omnis corporis voluptas fugit necessitatibus.Iusto et eius et sunt autem provident omnis et.	Leisure	2010-12-20 09:16:02.143873	2010-12-20 09:16:02.143873
4	2	dk	\N	Leisure	2010-12-20 09:16:02.162885	2010-12-20 09:16:02.162885
5	3	en	Accusamus illum voluptas dicta ut aut sequi.Animi totam id exercitationem soluta repellat.	Business	2010-12-20 09:16:02.176663	2010-12-20 09:16:02.176663
6	3	dk	\N	Business	2010-12-20 09:16:02.195798	2010-12-20 09:16:02.195798
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-20 09:16:01.64179	2010-12-20 09:16:01.64179
2	United Kingdom	2010-12-20 09:16:01.646899	2010-12-20 09:16:01.646899
3	England129283656222017	2010-12-20 09:16:02.221496	2010-12-20 09:16:02.221496
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
1	natus	&euro;	%u%n	t	2010-12-20 09:16:02.406937	2010-12-20 09:16:02.406937
2	optio	$	%u%n	t	2010-12-20 09:16:02.490009	2010-12-20 09:16:02.490009
3	quia	&pound;	%u%n	t	2010-12-20 09:16:02.558848	2010-12-20 09:16:02.558848
4	tenetur	&euro;	%u%n	t	2010-12-20 09:16:02.626482	2010-12-20 09:16:02.626482
5	dicta	&euro;	%u%n	t	2010-12-20 09:16:02.700022	2010-12-20 09:16:02.700022
6	in	&pound;	%u%n	t	2010-12-20 09:16:02.899316	2010-12-20 09:16:02.899316
7	dolor	&pound;	%u%n	t	2010-12-20 09:16:02.967552	2010-12-20 09:16:02.967552
8	Euro	&euro;	%u%n	t	2010-12-20 09:16:03.92989	2010-12-20 09:16:03.92989
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-20 09:16:01.673822	2010-12-20 09:16:01.673822
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-20 09:16:01.68886	2010-12-20 09:16:01.68886
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-20 09:16:01.701338	2010-12-20 09:16:01.701338
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-20 09:16:01.713571	2010-12-20 09:16:01.713571
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-20 09:16:01.725955	2010-12-20 09:16:01.725955
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-20 09:16:01.738454	2010-12-20 09:16:01.738454
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-20 09:16:01.751127	2010-12-20 09:16:01.751127
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-20 09:16:01.763305	2010-12-20 09:16:01.763305
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-20 09:16:01.775926	2010-12-20 09:16:01.775926
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-20 09:16:01.90911	2010-12-20 09:16:01.90911
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-20 09:16:01.921135	2010-12-20 09:16:01.921135
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-20 09:16:01.93372	2010-12-20 09:16:01.93372
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-20 09:16:01.946193	2010-12-20 09:16:01.946193
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-20 09:16:01.95844	2010-12-20 09:16:01.95844
15	8	en	Question	<p></p>	2010-12-20 09:16:01.970659	2010-12-20 09:16:01.970659
16	8	dk	[DK] Question	<p></p>	2010-12-20 09:16:01.98307	2010-12-20 09:16:01.98307
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-20 09:16:01.665281	2010-12-20 09:16:01.68453
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-20 09:16:01.696882	2010-12-20 09:16:01.709333
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-20 09:16:01.721533	2010-12-20 09:16:01.734246
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-20 09:16:01.746627	2010-12-20 09:16:01.759147
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-20 09:16:01.771508	2010-12-20 09:16:01.905071
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-20 09:16:01.916842	2010-12-20 09:16:01.929191
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-20 09:16:01.941686	2010-12-20 09:16:01.954377
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-20 09:16:01.96636	2010-12-20 09:16:01.97898
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, pkwiu, unit, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, payable_id, payable_type, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, header, hidden_description, created_at, updated_at) FROM stdin;
1	1	dk	Qui at error neque sed explicabo consequuntur adipisci.Asperiores et aut eligendi cupiditate odit modi cumque ducimus.	Big deal on printers	Laudantium quaerat est quibusdam impedit aut velit.Voluptatem dignissimos eligendi consectetur alias.	2010-12-20 09:16:02.455818	2010-12-20 09:16:02.455818
2	2	dk	Quibusdam aut magnam libero ut quia eum atque quia.Sint iusto iure modi qui.	Drills required	Rerum perspiciatis reiciendis rerum.At cupiditate et est.	2010-12-20 09:16:02.527243	2010-12-20 09:16:02.527243
3	3	dk	Doloribus praesentium eveniet voluptas accusamus culpa consectetur.Perspiciatis qui delectus ducimus.	Need assistance in selling a car	Est a vel assumenda odit sequi consequatur expedita.Nihil et consequuntur tempora voluptatem voluptatibus omnis.	2010-12-20 09:16:02.59574	2010-12-20 09:16:02.59574
4	4	dk	Vero quis doloribus et et.Facere numquam corrupti voluptas mollitia autem.	Ipod shipment	Sed sint sed deserunt recusandae id ipsum velit.Dolor amet et excepturi.	2010-12-20 09:16:02.668323	2010-12-20 09:16:02.668323
5	5	dk	Tempore a praesentium nostrum et quia.Qui ut odit quis delectus quod iusto a.	Trip to amazonia - looking for offer	Veniam molestiae accusantium aliquam.Sapiente consectetur et quo.	2010-12-20 09:16:02.867354	2010-12-20 09:16:02.867354
6	6	dk	Doloribus suscipit ut dolores qui eos in veniam.Necessitatibus est ut consequuntur sit molestias et dolores.	LCD - Huge amounts	Qui tempora porro praesentium optio veniam quia a.Ut atque autem facere aut accusamus quia corporis.	2010-12-20 09:16:02.9363	2010-12-20 09:16:02.9363
7	7	dk	Ut id asperiores et molestiae.Tenetur voluptate natus rerum consectetur eum velit.	GPS receivers required	Molestias commodi velit atque odit facilis eius.In distinctio sint ut dolorem numquam rerum consequuntur tenetur.	2010-12-20 09:16:03.005518	2010-12-20 09:16:03.005518
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Qui at error neque sed explicabo consequuntur adipisci.Asperiores et aut eligendi cupiditate odit modi cumque ducimus.	Laudantium quaerat est quibusdam impedit aut velit.Voluptatem dignissimos eligendi consectetur alias.	2	User::Agent	0	815.0	336.0	1	Borer	Bethel Rippin	569.652.2760 x406	thalia@predovic.co.uk	68359 Alessandra Inlet	2010-12-20 09:16:02.415952	2010-12-20 09:16:02.415952	2010-12-25	Bradford129283656221931 Halvorson	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Quibusdam aut magnam libero ut quia eum atque quia.Sint iusto iure modi qui.	Rerum perspiciatis reiciendis rerum.At cupiditate et est.	2	User::Agent	0	709.0	21.0	1	Wilkinson	May Streich	(671)354-2254	kellen.dickinson@lubowitzdamore.ca	63404 Mohr Fort	2010-12-20 09:16:02.49602	2010-12-20 09:16:02.49602	2010-12-25	Bradford129283656221931 Halvorson	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Doloribus praesentium eveniet voluptas accusamus culpa consectetur.Perspiciatis qui delectus ducimus.	Est a vel assumenda odit sequi consequatur expedita.Nihil et consequuntur tempora voluptatem voluptatibus omnis.	2	User::Agent	0	512.0	131.0	1	Pfefferglover	Jessyca Kuvalis	375.269.1623 x951	brian.ohara@rutherford.info	700 Elise Ville	2010-12-20 09:16:02.564789	2010-12-20 09:16:02.564789	2010-12-25	Bradford129283656221931 Halvorson	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Vero quis doloribus et et.Facere numquam corrupti voluptas mollitia autem.	Sed sint sed deserunt recusandae id ipsum velit.Dolor amet et excepturi.	2	User::Agent	0	322.0	212.0	1	Macejkovic	Obie Cronin Sr.	503.918.5393 x5842	oscar@bayercorwin.us	170 Ronaldo Island	2010-12-20 09:16:02.632561	2010-12-20 09:16:02.632561	2010-12-25	Bradford129283656221931 Halvorson	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Tempore a praesentium nostrum et quia.Qui ut odit quis delectus quod iusto a.	Veniam molestiae accusantium aliquam.Sapiente consectetur et quo.	2	User::Agent	0	50.0	548.0	1	Donnelly	Janae Ratke	193.676.6654 x85879	leif.jacobs@osinski.info	4523 Edwardo Skyway	2010-12-20 09:16:02.706134	2010-12-20 09:16:02.706134	2010-12-25	Bradford129283656221931 Halvorson	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Doloribus suscipit ut dolores qui eos in veniam.Necessitatibus est ut consequuntur sit molestias et dolores.	Qui tempora porro praesentium optio veniam quia a.Ut atque autem facere aut accusamus quia corporis.	2	User::Agent	0	299.0	669.0	1	Krisnienow	Carmelo McClure	175-558-8252	piper@reinger.name	0581 Crystel Crossroad	2010-12-20 09:16:02.90514	2010-12-20 09:16:02.90514	2010-12-25	Bradford129283656221931 Halvorson	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Ut id asperiores et molestiae.Tenetur voluptate natus rerum consectetur eum velit.	Molestias commodi velit atque odit facilis eius.In distinctio sint ut dolorem numquam rerum consequuntur tenetur.	2	User::Agent	0	830.0	629.0	1	Jewessrosenbaum	Eunice Beier	670.863.5781	urban@schmeler.info	3054 Howell Curve	2010-12-20 09:16:02.973488	2010-12-20 09:16:02.973488	2010-12-25	Bradford129283656221931 Halvorson	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: payment_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY payment_notifications (id, params, buyer_id, status, transaction_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-20 09:16:01.611308	2010-12-20 09:16:01.611308
2	default_leads_per_page	--- 5\n	2010-12-20 09:16:01.616698	2010-12-20 09:16:01.616698
3	certification_level_1	--- 10\n	2010-12-20 09:16:01.61885	2010-12-20 09:16:01.61885
4	certification_level_2	--- 20\n	2010-12-20 09:16:01.620952	2010-12-20 09:16:01.620952
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-20 09:16:01.623	2010-12-20 09:16:01.623
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-20 09:16:01.625011	2010-12-20 09:16:01.625011
7	invoicing_seller_name	--- Fairleads\n	2010-12-20 09:16:01.627021	2010-12-20 09:16:01.627021
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-20 09:16:01.629259	2010-12-20 09:16:01.629259
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-20 09:16:01.63147	2010-12-20 09:16:01.63147
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-20 09:16:01.633545	2010-12-20 09:16:01.633545
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
1	blazejek@gmail.com	fd1bc788a34e6f19f8b976c54bacd756047ff43df23f1e94030fd4ee4924896c2c25d836e3b24585744021026295b71a4d86460866c1c6bb745cb70503231da9	yM9JPi7f8gx1W9ev1Szs	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-20 09:16:02.075974	2010-12-20 09:16:02.016257	\N	2010-12-20 09:16:02.016475	2010-12-20 09:16:02.076237	1	Kurtis	Koepp	009-380-5881	root	Stephany Shore	O'Konville	20455	Kent	1	\N	\N	\N	\N	0	\N	\N	\N	\N	KOYNLEsDAxsZTkApCJ31k3gClyHAF4a1IXsfBmUiPLfz1mU6lMOctSygSm86Jz	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	c22e670c1ba44b684fc7d4632cb3584458dfc4d45b0a305bb3b1fc4d80c057be40b79702a6a0cce26b15cb649e3d423f55e7db41764c70f1e8230783fcca26f1	YBuLyEGLo5uPszjf0VQ_	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-20 09:16:02.249306	2010-12-20 09:16:02.22682	\N	2010-12-20 09:16:02.227028	2010-12-20 09:16:02.249582	2	Bradford129283656221931	Halvorson	(632)446-2328	Cade Hagenes129283656221895	Sallie Station	Ceasarshire	43333	Central	3	\N	0	\N	\N	0	\N	\N	\N	\N	xOZAHSjJTt5rQvx3yLlVeX8A8xQWWWa622gSP9f57x7H2xburBpa0MiYvnPxPM	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	e2bd0a2e466ca4e92cfe306a40ae388ff02c565a96d3545d42b4238ecd5386c99c677c05fed43f0c4553eb9295f76ff1e79ec78268fb54cd95b1d8e275693558	mKyQwuNxBW4xWrXh2IBX	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-20 09:16:03.07942	2010-12-20 09:16:03.059465	\N	2010-12-20 09:16:03.059685	2010-12-20 09:16:03.079689	1	Shirley	Halvorson	1-519-231-3699 x4778	Esta Donnelly129283656305523	Tracy Route	East Leann	11077-3873	County Down	1	\N	\N	\N	\N	0	\N	\N	\N	\N	JqBj4TpwHyEW6577SHQXtdM6JFpikco5GBFkpkIFks4h3lTbvndmqmcV80UWqb	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	fc5d87ad27654aaca6eb99315c3a755ee730a25344c5da2c126a11a55f106e4d43ebf29345c26fb8ec4f1e555d2836eab5ffa19c5ef6ee23dd62d21c1384cff1	GYepPn4qdSY5UXARKWGN	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-20 09:16:03.131154	2010-12-20 09:16:03.109372	\N	2010-12-20 09:16:03.109585	2010-12-20 09:16:03.131428	48	Daren	Prohaska	142-028-0297 x7291	Caden Cruickshank129283656310472	Kling Crest	Goldnerland	99799-9719	Kent	1	\N	\N	\N	\N	0	\N	\N	\N	\N	WV3VXSY6iLYlDPxL7uKq2Z53Tc4kDBCExB2al9s7yrHeZDZmNPonBUxyYVkfRS	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	cac17a8432a63b15ff0861472e22dba54bb383cc35ae309e6faf598b1b8754557ca3c66094a5b9a8eab261cfe7baf558246bc93ee33f6cc369e920a6925725db	oUuVJMzAHgRlvAmcINEZ	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-20 09:16:03.183863	2010-12-20 09:16:03.161896	\N	2010-12-20 09:16:03.162158	2010-12-20 09:16:03.19744	64	Tanya	Hyatt	619.773.8894	Kattie Parker129283656315659	Walter Heights	Lynchstad	39777	Oxfordshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	qIAlYVI64C2XBn3wmKLcIQbD6uK9jvNmB2Gnm8G9cTUuEmkV8bEfqygq2YPGNo	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

