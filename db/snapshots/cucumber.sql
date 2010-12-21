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
1	1	dk	About us	About us	2010-12-21 08:36:40.442176	2010-12-21 08:36:40.442176
2	1	en	About us	About us	2010-12-21 08:36:40.464069	2010-12-21 08:36:40.464069
3	2	dk	Privacy	Privacy	2010-12-21 08:36:40.514769	2010-12-21 08:36:40.514769
4	2	en	Privacy	Privacy	2010-12-21 08:36:40.533087	2010-12-21 08:36:40.533087
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-21 08:36:40.586704	2010-12-21 08:36:40.586704
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-21 08:36:40.60606	2010-12-21 08:36:40.60606
7	4	dk	Blurb sign up	Blurb sign up	2010-12-21 08:36:40.6488	2010-12-21 08:36:40.6488
8	4	en	Blurb sign up	Blurb sign up	2010-12-21 08:36:40.67016	2010-12-21 08:36:40.67016
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-21 08:36:40.71751	2010-12-21 08:36:40.71751
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-21 08:36:40.737954	2010-12-21 08:36:40.737954
11	6	dk	Blurb agent home	Blurb agent home	2010-12-21 08:36:40.78857	2010-12-21 08:36:40.78857
12	6	en	Blurb agent home	Blurb agent home	2010-12-21 08:36:40.80791	2010-12-21 08:36:40.80791
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-21 08:36:40.855762	2010-12-21 08:36:40.855762
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-21 08:36:40.874574	2010-12-21 08:36:40.874574
15	8	dk	Blurb currencies	Blurb currencies	2010-12-21 08:36:40.920513	2010-12-21 08:36:40.920513
16	8	en	Blurb currencies	Blurb currencies	2010-12-21 08:36:40.944944	2010-12-21 08:36:40.944944
17	9	dk	Reset password	Reset password	2010-12-21 08:36:40.991427	2010-12-21 08:36:40.991427
18	9	en	Reset password	Reset password	2010-12-21 08:36:41.00958	2010-12-21 08:36:41.00958
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-21 08:36:40.431423	2010-12-21 08:36:40.470651	about_us	0	t	2010-12-21 08:36:40.470557
2	Article::Cms	2010-12-21 08:36:40.508942	2010-12-21 08:36:40.539758	privacy	0	t	2010-12-21 08:36:40.539664
3	Article::Cms	2010-12-21 08:36:40.581486	2010-12-21 08:36:40.612748	terms_conditions	0	t	2010-12-21 08:36:40.612655
4	Article::Cms	2010-12-21 08:36:40.643477	2010-12-21 08:36:40.67644	blurb_sign_up	1	t	2010-12-21 08:36:40.676339
5	Article::Cms	2010-12-21 08:36:40.712513	2010-12-21 08:36:40.745754	blurb_buyer_home	1	t	2010-12-21 08:36:40.745631
6	Article::Cms	2010-12-21 08:36:40.783647	2010-12-21 08:36:40.814897	blurb_agent_home	1	t	2010-12-21 08:36:40.814802
7	Article::Cms	2010-12-21 08:36:40.849981	2010-12-21 08:36:40.8802	blurb_start_page_role_selection	1	t	2010-12-21 08:36:40.880106
8	Article::Cms	2010-12-21 08:36:40.913503	2010-12-21 08:36:40.951408	blurb_currencies	1	t	2010-12-21 08:36:40.951314
9	Article::Cms	2010-12-21 08:36:40.98635	2010-12-21 08:36:41.016687	reset_password	2	t	2010-12-21 08:36:41.016591
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
1	Electronics	Omnis et sit eos error veritatis.Non sequi consequatur quibusdam.	2010-12-21 08:36:38.755123	2010-12-21 08:36:38.755123	\N	1	2	\N	0	1-electronics	0	f
2	Leisure	Animi velit et aperiam sequi.Cupiditate id cumque nulla sint aut omnis soluta.	2010-12-21 08:36:38.817901	2010-12-21 08:36:38.817901	\N	3	4	\N	0	2-leisure	0	f
3	Business	Deleniti velit minus debitis quia expedita facilis et quasi.Amet et pariatur enim quo et qui.	2010-12-21 08:36:38.868238	2010-12-21 08:36:40.012741	\N	5	6	\N	7	3-business	7	f
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
1	1	en	Omnis et sit eos error veritatis.Non sequi consequatur quibusdam.	Electronics	2010-12-21 08:36:38.766399	2010-12-21 08:36:38.766399
2	1	dk	\N	Electronics	2010-12-21 08:36:38.803323	2010-12-21 08:36:38.803323
3	2	en	Animi velit et aperiam sequi.Cupiditate id cumque nulla sint aut omnis soluta.	Leisure	2010-12-21 08:36:38.824039	2010-12-21 08:36:38.824039
4	2	dk	\N	Leisure	2010-12-21 08:36:38.852835	2010-12-21 08:36:38.852835
5	3	en	Deleniti velit minus debitis quia expedita facilis et quasi.Amet et pariatur enim quo et qui.	Business	2010-12-21 08:36:38.875889	2010-12-21 08:36:38.875889
6	3	dk	\N	Business	2010-12-21 08:36:38.905918	2010-12-21 08:36:38.905918
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-21 08:36:38.173191	2010-12-21 08:36:38.173191
2	United Kingdom	2010-12-21 08:36:38.189823	2010-12-21 08:36:38.189823
3	England129292059893981	2010-12-21 08:36:38.941633	2010-12-21 08:36:38.941633
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
1	vel	$	%u%n	t	2010-12-21 08:36:39.027349	2010-12-21 08:36:39.027349
2	et	&euro;	%u%n	t	2010-12-21 08:36:39.162201	2010-12-21 08:36:39.162201
3	et	$	%u%n	t	2010-12-21 08:36:39.534241	2010-12-21 08:36:39.534241
4	sit	&euro;	%u%n	t	2010-12-21 08:36:39.634012	2010-12-21 08:36:39.634012
5	veritatis	&pound;	%u%n	t	2010-12-21 08:36:39.75404	2010-12-21 08:36:39.75404
6	dolorem	$	%u%n	t	2010-12-21 08:36:39.860951	2010-12-21 08:36:39.860951
7	quidem	&pound;	%u%n	t	2010-12-21 08:36:39.964955	2010-12-21 08:36:39.964955
8	Euro	&euro;	%u%n	t	2010-12-21 08:36:41.040931	2010-12-21 08:36:41.040931
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2010-12-21 08:36:38.234683	2010-12-21 08:36:38.234683
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2010-12-21 08:36:38.266294	2010-12-21 08:36:38.266294
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2010-12-21 08:36:38.290588	2010-12-21 08:36:38.290588
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2010-12-21 08:36:38.312794	2010-12-21 08:36:38.312794
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2010-12-21 08:36:38.331574	2010-12-21 08:36:38.331574
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2010-12-21 08:36:38.349959	2010-12-21 08:36:38.349959
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2010-12-21 08:36:38.377556	2010-12-21 08:36:38.377556
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2010-12-21 08:36:38.397602	2010-12-21 08:36:38.397602
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2010-12-21 08:36:38.419379	2010-12-21 08:36:38.419379
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2010-12-21 08:36:38.438511	2010-12-21 08:36:38.438511
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2010-12-21 08:36:38.4577	2010-12-21 08:36:38.4577
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2010-12-21 08:36:38.4784	2010-12-21 08:36:38.4784
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2010-12-21 08:36:38.498261	2010-12-21 08:36:38.498261
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2010-12-21 08:36:38.518863	2010-12-21 08:36:38.518863
15	8	en	<p></p>	Question	2010-12-21 08:36:38.542242	2010-12-21 08:36:38.542242
16	8	dk	<p></p>	[DK] Question	2010-12-21 08:36:38.568374	2010-12-21 08:36:38.568374
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-21 08:36:38.221815	2010-12-21 08:36:38.260011
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-21 08:36:38.283481	2010-12-21 08:36:38.307045
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-21 08:36:38.325622	2010-12-21 08:36:38.344402
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-21 08:36:38.368709	2010-12-21 08:36:38.39204
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-21 08:36:38.410995	2010-12-21 08:36:38.432153
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-21 08:36:38.451909	2010-12-21 08:36:38.47116
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-21 08:36:38.492492	2010-12-21 08:36:38.513386
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-21 08:36:38.53308	2010-12-21 08:36:38.562488
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
1	1	dk	Voluptatem mollitia saepe alias sed facere deserunt eum.Fugiat quo voluptatibus inventore.	Beatae molestiae voluptas optio vitae.Maxime et et ab.	Big deal on printers	2010-12-21 08:36:39.107842	2010-12-21 08:36:39.107842
2	2	dk	Quae inventore illum aliquam itaque.Quo consectetur laborum totam delectus qui quaerat doloremque sint.	Magnam eum dolorum autem consectetur aut porro voluptatem et.Ea provident laboriosam eius omnis officiis aliquid.	Drills required	2010-12-21 08:36:39.485761	2010-12-21 08:36:39.485761
3	3	dk	Occaecati itaque autem aut laudantium qui eius consequatur.Necessitatibus nihil ut consectetur esse.	Odio quas rem qui ut maxime sint ratione.Temporibus voluptatem ut quos accusantium distinctio velit.	Need assistance in selling a car	2010-12-21 08:36:39.588049	2010-12-21 08:36:39.588049
4	4	dk	Quam atque et nihil molestiae.Eligendi ut facilis inventore.	Est incidunt qui assumenda quo.Nam ex aliquam omnis.	Ipod shipment	2010-12-21 08:36:39.693035	2010-12-21 08:36:39.693035
5	5	dk	Ut in et tempora aut est dolore eum quod.Nulla sit officiis labore quae consectetur sit ex est.	Sed odio esse iusto rem.Et dolores vel praesentium adipisci perspiciatis natus et aut.	Trip to amazonia - looking for offer	2010-12-21 08:36:39.809923	2010-12-21 08:36:39.809923
6	6	dk	Ea fugiat sit error nobis minima molestias modi.Amet eveniet nemo qui commodi.	Cum eum dolores rerum ut velit sapiente.Vitae minima quibusdam nemo impedit dolores quis.	LCD - Huge amounts	2010-12-21 08:36:39.918483	2010-12-21 08:36:39.918483
7	7	dk	Nihil vitae provident eos totam fuga.Aut quo blanditiis non laborum itaque.	Molestiae provident at sequi illum et praesentium quam.Officia quia omnis perspiciatis corporis quas porro pariatur.	GPS receivers required	2010-12-21 08:36:40.027105	2010-12-21 08:36:40.027105
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Beatae molestiae voluptas optio vitae.Maxime et et ab.	Voluptatem mollitia saepe alias sed facere deserunt eum.Fugiat quo voluptatibus inventore.	2	User::Agent	0	948.0	966.0	1	Pfeffer	Ora Roob	1-035-753-9050 x0283	israel.kris@feest.ca	916 Mathew Meadow	2010-12-21 08:36:39.046251	2010-12-21 08:36:39.046251	2010-12-26	Kailey129292059893878 Graham	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Magnam eum dolorum autem consectetur aut porro voluptatem et.Ea provident laboriosam eius omnis officiis aliquid.	Quae inventore illum aliquam itaque.Quo consectetur laborum totam delectus qui quaerat doloremque sint.	2	User::Agent	0	345.0	893.0	1	Stiedemann	Mr. Norberto Baumbach	649-988-2658	amie@bernier.co.uk	54748 White Locks	2010-12-21 08:36:39.178974	2010-12-21 08:36:39.178974	2010-12-26	Kailey129292059893878 Graham	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Odio quas rem qui ut maxime sint ratione.Temporibus voluptatem ut quos accusantium distinctio velit.	Occaecati itaque autem aut laudantium qui eius consequatur.Necessitatibus nihil ut consectetur esse.	2	User::Agent	0	317.0	46.0	1	Kuhn	Mrs. Samson Crooks	519-262-4078	theresia_trantow@skilestremblay.name	10953 Delpha Pines	2010-12-21 08:36:39.543239	2010-12-21 08:36:39.543239	2010-12-26	Kailey129292059893878 Graham	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Est incidunt qui assumenda quo.Nam ex aliquam omnis.	Quam atque et nihil molestiae.Eligendi ut facilis inventore.	2	User::Agent	0	128.0	605.0	1	Mitchell	Thelma Kohler	832.663.8935 x068	ericka_raynor@bergstrom.uk	957 Diamond Motorway	2010-12-21 08:36:39.643955	2010-12-21 08:36:39.643955	2010-12-26	Kailey129292059893878 Graham	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Sed odio esse iusto rem.Et dolores vel praesentium adipisci perspiciatis natus et aut.	Ut in et tempora aut est dolore eum quod.Nulla sit officiis labore quae consectetur sit ex est.	2	User::Agent	0	969.0	383.0	1	Hanelesch	Lauren Gleason	662-382-7656 x30545	nickolas.metz@johns.us	7411 Cassin Run	2010-12-21 08:36:39.76514	2010-12-21 08:36:39.76514	2010-12-26	Kailey129292059893878 Graham	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Cum eum dolores rerum ut velit sapiente.Vitae minima quibusdam nemo impedit dolores quis.	Ea fugiat sit error nobis minima molestias modi.Amet eveniet nemo qui commodi.	2	User::Agent	0	93.0	643.0	1	Smitham	Zoe Kutch	1-964-455-4989	alvena.hackett@schneider.info	956 Jamie Avenue	2010-12-21 08:36:39.87143	2010-12-21 08:36:39.87143	2010-12-26	Kailey129292059893878 Graham	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Molestiae provident at sequi illum et praesentium quam.Officia quia omnis perspiciatis corporis quas porro pariatur.	Nihil vitae provident eos totam fuga.Aut quo blanditiis non laborum itaque.	2	User::Agent	0	982.0	10.0	1	Parkerkessler	Mya Gusikowski I	(514)142-7417	dorthy@stehr.name	619 Fisher Drives	2010-12-21 08:36:39.975682	2010-12-21 08:36:39.975682	2010-12-26	Kailey129292059893878 Graham	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-21 08:36:38.110848	2010-12-21 08:36:38.110848
2	default_leads_per_page	--- 5\n	2010-12-21 08:36:38.12201	2010-12-21 08:36:38.12201
3	certification_level_1	--- 10\n	2010-12-21 08:36:38.131416	2010-12-21 08:36:38.131416
4	certification_level_2	--- 20\n	2010-12-21 08:36:38.141994	2010-12-21 08:36:38.141994
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-21 08:36:38.150954	2010-12-21 08:36:38.150954
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, linkedin_url) FROM stdin;
1	blazejek@gmail.com	eea277b4994dae120c9be6bed3ef1062250ad7987db588b6ab0643233a2522ed5c7c3d95cef4f3aa6dc0e8f0328a2a29877e4aed3e4b9c65038f6bd3d948ff60	nsdAmK6gUPAuu0ctBKbs	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 08:36:38.714205	2010-12-21 08:36:38.614032	\N	2010-12-21 08:36:38.614328	2010-12-21 08:36:38.714955	1	Reyes	Walker	866.124.2895	root	Evan Radial	Port Alicebury	98839	South Yorkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	COPZR8k2IpHVvAk3XeQH7nXt0DgjCmxchYm4v5XRneowCbsIrt3sjxs3Lqz7P1	f	\N	0	0	0	0	0	\N
2	agent@nbs.com	44081d922158ad6bcbfc11994192f6e3f3165fa171c8cc51414537a86bca8e75d384cf2b9205eb336c2882bae6935d0325f9115ea91545c94cbc8631458373cc	LbHUnU9DcKQBG04QdtpY	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 08:36:38.983182	2010-12-21 08:36:38.951359	\N	2010-12-21 08:36:38.951648	2010-12-21 08:36:38.983618	2	Kailey129292059893878	Graham	543-582-3003 x92636	Kurt Hermiston DVM129292059893845	Weissnat Orchard	Nienowstad	04380-9592	County Fermanagh	3	\N	0	\N	\N	0	\N	\N	\N	\N	1FSerlPoA6R1unjfqHc4sFUE4l1ky31jkA4vYHoPb1PXaprtziCBIAHT5EH0oS	f	\N	0	0	0	0	0	\N
3	admin@nbs.com	52bfdad0f82e01aa7d478114e785d5293889e78e65d45a3d530fd20ea8b03c5ea9a37cda899b4b108b184102b9df81f3b5c8f0b7f2e2f3f44e22a4fa4e970c4f	OAnTybOvJY1D8iaV2uCs	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 08:36:40.136781	2010-12-21 08:36:40.10854	\N	2010-12-21 08:36:40.108826	2010-12-21 08:36:40.137187	1	Ellis	Rippin	1-348-381-1385 x2811	Omer Grimes129292060010297	Shanahan Roads	Reinholdside	29809	Tyne and Wear	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Wfr7xDhAVMhp5CYAeuaupfFBy7Mkgh5DKKH6pMANI2pSGgdM7sq9yPQ9sgzxqe	f	\N	0	0	0	0	0	\N
4	buyer@nbs.com	7dab0a54d1eff63e4bab402d1ab1e7b793ae1b0d0babbd0340f9dcc0ad6f7cae57abaee3a29d4cedab1e717295035dd4e953de43b04931a057bd43ffef8e0013	4HFxeeow5OcUeNYwlGRj	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 08:36:40.21337	2010-12-21 08:36:40.184098	\N	2010-12-21 08:36:40.184438	2010-12-21 08:36:40.213778	48	Walter	Williamson	(263)668-9236 x64824	Stewart Fay129292060017575	Beverly Rest	Hahnchester	33808-6137	Tyne and Wear	1	\N	\N	\N	\N	0	\N	\N	\N	\N	wmbH8NMLBrRtgdh7dx6LCjH9flYF6Lz4wjMafICXxgJT0QBBkqQk0epQV8BSNh	f	t	0	0	0	0	0	\N
5	leaduser@nbs.com	6b9de11cfe86bc413c0d1b2eae823b2f3295fb4cf3863f749609e231d498bdbad7a3dd662a7aec53be5c5a2724fc7f369fc8e023eacdce2a768a7c098eefebb1	sqXXdblV1zDsfWajteb_	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 08:36:40.288101	2010-12-21 08:36:40.257106	\N	2010-12-21 08:36:40.257413	2010-12-21 08:36:40.311461	64	Kristofer	Abshire	1-961-594-9439 x055	Shania Turcotte129292060024888	Charles Common	Port Jazmin	50254	West Sussex	1	\N	\N	4	\N	0	\N	\N	\N	\N	hKGnkzxjABHI0PuOpfQqag1JsFv9BIfMNDespXkHrpYM8CAfc9Wd7jQRTemkUZ	f	\N	0	0	0	0	0	\N
\.


--
-- PostgreSQL database dump complete
--

