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

SELECT pg_catalog.setval('article_translations_id_seq', 16, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 8, true);


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

SELECT pg_catalog.setval('category_translations_id_seq', 3, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('countries_id_seq', 3, true);


--
-- Name: country_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_interests_id_seq', 1, false);


--
-- Name: email_template_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_template_translations_id_seq', 16, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 8, true);


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
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('settings_id_seq', 5, true);


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

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2010-12-08 15:30:16.450283	2010-12-08 15:30:16.450283
2	1	en	About us	About us	2010-12-08 15:30:16.478167	2010-12-08 15:30:16.478167
3	2	dk	Privacy	Privacy	2010-12-08 15:30:16.527651	2010-12-08 15:30:16.527651
4	2	en	Privacy	Privacy	2010-12-08 15:30:16.548083	2010-12-08 15:30:16.548083
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-08 15:30:16.596557	2010-12-08 15:30:16.596557
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-08 15:30:16.616053	2010-12-08 15:30:16.616053
7	4	dk	Blurb sign up	Blurb sign up	2010-12-08 15:30:16.663605	2010-12-08 15:30:16.663605
8	4	en	Blurb sign up	Blurb sign up	2010-12-08 15:30:16.683563	2010-12-08 15:30:16.683563
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-08 15:30:16.72521	2010-12-08 15:30:16.72521
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-08 15:30:16.963174	2010-12-08 15:30:16.963174
11	6	dk	Blurb agent home	Blurb agent home	2010-12-08 15:30:17.005833	2010-12-08 15:30:17.005833
12	6	en	Blurb agent home	Blurb agent home	2010-12-08 15:30:17.025461	2010-12-08 15:30:17.025461
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-08 15:30:17.070563	2010-12-08 15:30:17.070563
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-08 15:30:17.088613	2010-12-08 15:30:17.088613
15	8	dk	Reset password	Reset password	2010-12-08 15:30:17.130217	2010-12-08 15:30:17.130217
16	8	en	Reset password	Reset password	2010-12-08 15:30:17.148269	2010-12-08 15:30:17.148269
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-08 15:30:16.439523	2010-12-08 15:30:16.483881	about_us	0	t	2010-12-08 15:30:16.483776
2	Article::Cms	2010-12-08 15:30:16.522337	2010-12-08 15:30:16.554782	privacy	0	t	2010-12-08 15:30:16.55468
3	Article::Cms	2010-12-08 15:30:16.591486	2010-12-08 15:30:16.622869	terms_conditions	0	t	2010-12-08 15:30:16.62277
4	Article::Cms	2010-12-08 15:30:16.65875	2010-12-08 15:30:16.690359	blurb_sign_up	1	t	2010-12-08 15:30:16.69026
5	Article::Cms	2010-12-08 15:30:16.720332	2010-12-08 15:30:16.969023	blurb_buyer_home	1	t	2010-12-08 15:30:16.968921
6	Article::Cms	2010-12-08 15:30:17.000328	2010-12-08 15:30:17.034882	blurb_agent_home	1	t	2010-12-08 15:30:17.034761
7	Article::Cms	2010-12-08 15:30:17.06539	2010-12-08 15:30:17.095589	blurb_start_page_role_selection	1	t	2010-12-08 15:30:17.095485
8	Article::Cms	2010-12-08 15:30:17.125114	2010-12-08 15:30:17.154076	reset_password	2	t	2010-12-08 15:30:17.153967
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug) FROM stdin;
1	Electronics	Tempore perspiciatis ea temporibus velit doloribus reprehenderit modi numquam.Est ipsum consequatur debitis.	2010-12-08 15:30:15.125133	2010-12-08 15:30:15.125133	\N	1	2	\N	0	1
2	Leisure	Et et rerum a et consequuntur maxime.Omnis accusamus omnis necessitatibus qui molestiae nesciunt.	2010-12-08 15:30:15.166534	2010-12-08 15:30:15.166534	\N	3	4	\N	0	2
3	Business	Vitae perferendis ut laborum cumque.Aut nesciunt nihil officiis est tempora deleniti.	2010-12-08 15:30:15.198835	2010-12-08 15:30:16.045613	\N	5	6	\N	7	3
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
1	1	dk	Tempore perspiciatis ea temporibus velit doloribus reprehenderit modi numquam.Est ipsum consequatur debitis.	Electronics	2010-12-08 15:30:15.137611	2010-12-08 15:30:15.137611
2	2	dk	Et et rerum a et consequuntur maxime.Omnis accusamus omnis necessitatibus qui molestiae nesciunt.	Leisure	2010-12-08 15:30:15.17209	2010-12-08 15:30:15.17209
3	3	dk	Vitae perferendis ut laborum cumque.Aut nesciunt nihil officiis est tempora deleniti.	Business	2010-12-08 15:30:15.204411	2010-12-08 15:30:15.204411
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-08 15:30:14.544166	2010-12-08 15:30:14.544166
2	United Kingdom	2010-12-08 15:30:14.554392	2010-12-08 15:30:14.554392
3	England129182221524799	2010-12-08 15:30:15.24961	2010-12-08 15:30:15.24961
\.


--
-- Data for Name: country_interests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY country_interests (id, country_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2010-12-08 15:30:14.601944	2010-12-08 15:30:14.601944
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2010-12-08 15:30:14.626246	2010-12-08 15:30:14.626246
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2010-12-08 15:30:14.64709	2010-12-08 15:30:14.64709
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2010-12-08 15:30:14.665241	2010-12-08 15:30:14.665241
5	3	en	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	Somebody shared leads with you	2010-12-08 15:30:14.686151	2010-12-08 15:30:14.686151
6	3	dk	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	[DK] Somebody shared leads with you	2010-12-08 15:30:14.719602	2010-12-08 15:30:14.719602
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2010-12-08 15:30:14.7438	2010-12-08 15:30:14.7438
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2010-12-08 15:30:14.762097	2010-12-08 15:30:14.762097
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2010-12-08 15:30:14.78404	2010-12-08 15:30:14.78404
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2010-12-08 15:30:14.803743	2010-12-08 15:30:14.803743
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2010-12-08 15:30:14.828548	2010-12-08 15:30:14.828548
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2010-12-08 15:30:14.860747	2010-12-08 15:30:14.860747
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2010-12-08 15:30:14.888405	2010-12-08 15:30:14.888405
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2010-12-08 15:30:14.923298	2010-12-08 15:30:14.923298
15	8	en	<p></p>	Question	2010-12-08 15:30:14.949774	2010-12-08 15:30:14.949774
16	8	dk	<p></p>	[DK] Question	2010-12-08 15:30:14.968102	2010-12-08 15:30:14.968102
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-08 15:30:14.583851	2010-12-08 15:30:14.619734
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-08 15:30:14.641332	2010-12-08 15:30:14.659677
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-08 15:30:14.679487	2010-12-08 15:30:14.714261
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-08 15:30:14.738153	2010-12-08 15:30:14.756713
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-08 15:30:14.777441	2010-12-08 15:30:14.798028
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-08 15:30:14.820833	2010-12-08 15:30:14.855023
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-08 15:30:14.88263	2010-12-08 15:30:14.917806
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-08 15:30:14.942864	2010-12-08 15:30:14.962714
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
1	1	dk	Pariatur facere occaecati quis eaque porro recusandae temporibus.Et est perspiciatis beatae.	Consequatur occaecati beatae provident eligendi reprehenderit et earum.Consequatur numquam quaerat qui voluptate.	Big deal on printers	2010-12-08 15:30:15.373429	2010-12-08 15:30:15.373429
2	2	dk	Molestias consequatur et est aliquam hic sunt ut assumenda.Architecto autem amet reprehenderit qui.	Est ut qui ea et.Voluptate est nobis fugiat totam ut qui dolor.	Drills required	2010-12-08 15:30:15.447327	2010-12-08 15:30:15.447327
3	3	dk	Eum nihil laudantium nesciunt architecto numquam.Consequatur dolorem optio et ut eum rerum.	Accusantium aut corporis voluptatem dignissimos excepturi.Dolorem possimus id molestiae aliquam enim officia modi.	Need assistance in selling a car	2010-12-08 15:30:15.513185	2010-12-08 15:30:15.513185
4	4	dk	Inventore labore eos quibusdam cumque facere.Saepe cupiditate necessitatibus quaerat sequi dolor maxime et.	Assumenda amet perferendis hic ducimus est quia.In mollitia ratione molestiae non velit.	Ipod shipment	2010-12-08 15:30:15.582602	2010-12-08 15:30:15.582602
5	5	dk	Et assumenda a et ratione.Unde impedit explicabo voluptas laudantium ut magnam tempore.	Et cupiditate excepturi omnis porro.Consequuntur et voluptatem temporibus accusamus vel.	Trip to amazonia - looking for offer	2010-12-08 15:30:15.65549	2010-12-08 15:30:15.65549
6	6	dk	Veritatis in fugiat vitae voluptatem officiis sunt.Aut voluptatem suscipit omnis qui atque.	Nihil aspernatur maxime consequatur tempora.Sunt quisquam eveniet non et.	LCD - Huge amounts	2010-12-08 15:30:15.98815	2010-12-08 15:30:15.98815
7	7	dk	Eius aspernatur molestias dicta expedita veritatis soluta.Ea fuga provident sit molestiae.	Reprehenderit iste nesciunt quasi sed aut fuga.Et minus magni id itaque.	GPS receivers required	2010-12-08 15:30:16.054607	2010-12-08 15:30:16.054607
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating) FROM stdin;
1	Big deal on printers	3	Pariatur facere occaecati quis eaque porro recusandae temporibus.Et est perspiciatis beatae.	Consequatur occaecati beatae provident eligendi reprehenderit et earum.Consequatur numquam quaerat qui voluptate.	2	User::Agent	0	37.0	321.0	1	Willkoch	Viviane Wolf	309-558-3934 x79471	nadia@herzogmills.com	5406 Emmerich Streets	2010-12-08 15:30:15.334122	2010-12-08 15:30:15.334122	2010-12-13	Janice129182221524698 Rice	1	t	\N	0	0	f	f
2	Drills required	3	Molestias consequatur et est aliquam hic sunt ut assumenda.Architecto autem amet reprehenderit qui.	Est ut qui ea et.Voluptate est nobis fugiat totam ut qui dolor.	2	User::Agent	0	555.0	817.0	1	Hauckmuller	Korey Rogahn DVM	1-777-779-2404	eldora@wehner.uk	9986 Maurine Meadows	2010-12-08 15:30:15.414795	2010-12-08 15:30:15.414795	2010-12-13	Janice129182221524698 Rice	1	t	\N	0	0	f	f
3	Need assistance in selling a car	3	Eum nihil laudantium nesciunt architecto numquam.Consequatur dolorem optio et ut eum rerum.	Accusantium aut corporis voluptatem dignissimos excepturi.Dolorem possimus id molestiae aliquam enim officia modi.	2	User::Agent	0	132.0	96.0	1	Schinner	Adrienne Rosenbaum	104-373-0036 x444	mike@vandervortfritsch.uk	45695 Schuyler Fork	2010-12-08 15:30:15.4815	2010-12-08 15:30:15.4815	2010-12-13	Janice129182221524698 Rice	1	t	\N	0	0	f	f
4	Ipod shipment	3	Inventore labore eos quibusdam cumque facere.Saepe cupiditate necessitatibus quaerat sequi dolor maxime et.	Assumenda amet perferendis hic ducimus est quia.In mollitia ratione molestiae non velit.	2	User::Agent	0	813.0	203.0	1	Kassulke	Jean Schinner	(720)319-5461 x62475	jonas.schuster@schroeder.name	091 Camron Cliffs	2010-12-08 15:30:15.550479	2010-12-08 15:30:15.550479	2010-12-13	Janice129182221524698 Rice	1	t	\N	0	0	f	f
5	Trip to amazonia - looking for offer	3	Et assumenda a et ratione.Unde impedit explicabo voluptas laudantium ut magnam tempore.	Et cupiditate excepturi omnis porro.Consequuntur et voluptatem temporibus accusamus vel.	2	User::Agent	0	869.0	327.0	1	Rath	Giles McCullough	1-400-364-7265 x222	maya@brown.com	66189 Berge Radial	2010-12-08 15:30:15.623149	2010-12-08 15:30:15.623149	2010-12-13	Janice129182221524698 Rice	1	t	\N	0	0	f	f
6	LCD - Huge amounts	3	Veritatis in fugiat vitae voluptatem officiis sunt.Aut voluptatem suscipit omnis qui atque.	Nihil aspernatur maxime consequatur tempora.Sunt quisquam eveniet non et.	2	User::Agent	0	660.0	229.0	1	Wintheiserernser	Henderson Johnston	1-968-418-0793 x726	hollie@davis.biz	31431 Nannie Neck	2010-12-08 15:30:15.957309	2010-12-08 15:30:15.957309	2010-12-13	Janice129182221524698 Rice	1	t	\N	0	0	f	f
7	GPS receivers required	3	Eius aspernatur molestias dicta expedita veritatis soluta.Ea fuga provident sit molestiae.	Reprehenderit iste nesciunt quasi sed aut fuga.Et minus magni id itaque.	2	User::Agent	0	146.0	683.0	1	Olsonmetz	Gardner Okuneva	1-994-533-2136	aric.hintz@morissette.info	1073 Jordy Park	2010-12-08 15:30:16.023527	2010-12-08 15:30:16.023527	2010-12-13	Janice129182221524698 Rice	1	t	\N	0	0	f	f
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-08 15:30:14.490259	2010-12-08 15:30:14.490259
2	default_leads_per_page	--- 5\n	2010-12-08 15:30:14.50134	2010-12-08 15:30:14.50134
3	certification_level_1	--- 10\n	2010-12-08 15:30:14.507071	2010-12-08 15:30:14.507071
4	certification_level_2	--- 20\n	2010-12-08 15:30:14.514628	2010-12-08 15:30:14.514628
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-08 15:30:14.522702	2010-12-08 15:30:14.522702
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter) FROM stdin;
1	blazejek@gmail.com	ed6f4c185a8e2a25162817fc8c1d4c6efc51604677e56b92732ae06acb6c1f19db74f2ddcf3f8b0e1c00258fd671a40bdfd0501e3c92babb866bf247527b1340	kCbUGmvQ9ZVe4o42vwyC	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 15:30:15.097024	2010-12-08 15:30:15.011551	\N	2010-12-08 15:30:15.011849	2010-12-08 15:30:15.097537	1	Esta	Morar	474-017-1251 x8750	root	Gay Valley	Lake Jairofort	31479-7754	Northumberland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	acNeD27t6AXDvukrpNG9u1SLQFoDXzomuqc9NN6BONYLg8QFtIGCjVeNcUijQL	f	\N	0	0	0	0	0
2	agent@nbs.com	4aed47554bd2fca3852e8afe6396778cc73ba9a0208c4d66e59761e68f380b6ccb4627b3d814357edec5118c0ab86e878e14f3938ab0c7ca9f168a84bf5a5499	EoRJEOss_zm7IvteBAik	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 15:30:15.289087	2010-12-08 15:30:15.259021	\N	2010-12-08 15:30:15.259284	2010-12-08 15:30:15.289512	2	Janice129182221524698	Rice	(556)407-1157	Eleazar Hartmann MD129182221524658	Laila Streets	Geneshire	67954	County Antrim	3	\N	0	\N	\N	0	\N	\N	\N	\N	lpfefPNtW6NyF8WyCqDLPgLd6CIAfnsALQWDYpmONyHJzqsn9reinZ6Lmcj6OF	f	\N	0	0	0	0	0
3	admin@nbs.com	5469b3042c8c9fdd9dbcba565ba86f4c4fc604e922ccf54c11db086bc4b0c75bf1aa89e68d5187c8ab4eb5566f92d6829e8c975e00a1fa3c3c6dc1a30c656b3d	2bFCVHPiICg6t3Ka01bD	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 15:30:16.149478	2010-12-08 15:30:16.122435	\N	2010-12-08 15:30:16.12271	2010-12-08 15:30:16.149883	1	Chanelle	Bergstrom	379.788.5968 x624	Hailie Bosco12918222161167	Watson Hill	Jaquelinport	78276	Dyfed	1	\N	\N	\N	\N	0	\N	\N	\N	\N	lKrpClmZ8NL1wkr1ipoeX6gUfX95wlskEmyleo4mfsx3QmNGT82q3Jz0DCR9KA	f	\N	0	0	0	0	0
4	buyer@nbs.com	e9ffa70724361e82d4c0b866b6b7378ad78a8dcf950785eed355e1073ce1918f7717f4eb6a954ff3b5604896dd1684e8919b220e5a39f5fc1e9e89389292936d	IaRZax4k4tF-MWKfDifM	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 15:30:16.232494	2010-12-08 15:30:16.201595	\N	2010-12-08 15:30:16.201883	2010-12-08 15:30:16.232943	48	Akeem	Krajcik	514.317.3039 x22842	Nelda Ortiz129182221619536	Aniya Vista	North Osborneville	43532	County Armagh	1	\N	\N	\N	\N	0	\N	\N	\N	\N	iR6Ww3scZncdo2JMFHJDYfCulDAbFunBPVoPgmavfbQJnZgZN0AluyGnNAt01I	f	t	0	0	0	0	0
5	leaduser@nbs.com	736bdfdf1fa4efbc64a0bb67065aff3e9c882bdefd49922f721a8ebe7ac12e930c00f2bacb530e622d6d48bc436b1dda14a867d458347a2eae70e01706504346	1T_kcsGxeOmX3trKuKxn	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 15:30:16.308606	2010-12-08 15:30:16.277164	\N	2010-12-08 15:30:16.27746	2010-12-08 15:30:16.329944	64	Leatha	Marks	213-294-4168	Gerald Marvin129182221626965	Mohr Port	Johnsmouth	61949-1128	North Yorkshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	WNgGpUKGUiAlMyXVJ6G1yNMYE4wM2p4wfrj1F18YG6wXtkKiUQiXdO1SkKdAqN	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

