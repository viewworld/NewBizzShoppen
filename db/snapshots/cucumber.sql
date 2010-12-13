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
1	1	dk	About us	About us	2010-12-13 10:57:29.892942	2010-12-13 10:57:29.892942
2	1	en	About us	About us	2010-12-13 10:57:29.908082	2010-12-13 10:57:29.908082
3	2	dk	Privacy	Privacy	2010-12-13 10:57:29.938795	2010-12-13 10:57:29.938795
4	2	en	Privacy	Privacy	2010-12-13 10:57:29.951434	2010-12-13 10:57:29.951434
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-13 10:57:29.982178	2010-12-13 10:57:29.982178
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-13 10:57:29.994893	2010-12-13 10:57:29.994893
7	4	dk	Blurb sign up	Blurb sign up	2010-12-13 10:57:30.022299	2010-12-13 10:57:30.022299
8	4	en	Blurb sign up	Blurb sign up	2010-12-13 10:57:30.034459	2010-12-13 10:57:30.034459
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-13 10:57:30.061269	2010-12-13 10:57:30.061269
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-13 10:57:30.073912	2010-12-13 10:57:30.073912
11	6	dk	Blurb agent home	Blurb agent home	2010-12-13 10:57:30.102594	2010-12-13 10:57:30.102594
12	6	en	Blurb agent home	Blurb agent home	2010-12-13 10:57:30.245203	2010-12-13 10:57:30.245203
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-13 10:57:30.273304	2010-12-13 10:57:30.273304
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-13 10:57:30.285563	2010-12-13 10:57:30.285563
15	8	dk	Blurb currencies	Blurb currencies	2010-12-13 10:57:30.313113	2010-12-13 10:57:30.313113
16	8	en	Blurb currencies	Blurb currencies	2010-12-13 10:57:30.326462	2010-12-13 10:57:30.326462
17	9	dk	Reset password	Reset password	2010-12-13 10:57:30.354221	2010-12-13 10:57:30.354221
18	9	en	Reset password	Reset password	2010-12-13 10:57:30.366457	2010-12-13 10:57:30.366457
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-13 10:57:29.883882	2010-12-13 10:57:29.911129	about_us	0	t	2010-12-13 10:57:29.911052
2	Article::Cms	2010-12-13 10:57:29.934668	2010-12-13 10:57:29.954409	privacy	0	t	2010-12-13 10:57:29.954338
3	Article::Cms	2010-12-13 10:57:29.978218	2010-12-13 10:57:29.997901	terms_conditions	0	t	2010-12-13 10:57:29.997829
4	Article::Cms	2010-12-13 10:57:30.018392	2010-12-13 10:57:30.037546	blurb_sign_up	1	t	2010-12-13 10:57:30.037474
5	Article::Cms	2010-12-13 10:57:30.057139	2010-12-13 10:57:30.076947	blurb_buyer_home	1	t	2010-12-13 10:57:30.076874
6	Article::Cms	2010-12-13 10:57:30.09845	2010-12-13 10:57:30.248397	blurb_agent_home	1	t	2010-12-13 10:57:30.248321
7	Article::Cms	2010-12-13 10:57:30.269245	2010-12-13 10:57:30.288661	blurb_start_page_role_selection	1	t	2010-12-13 10:57:30.288587
8	Article::Cms	2010-12-13 10:57:30.309008	2010-12-13 10:57:30.329686	blurb_currencies	1	t	2010-12-13 10:57:30.32961
9	Article::Cms	2010-12-13 10:57:30.350265	2010-12-13 10:57:30.369594	reset_password	2	t	2010-12-13 10:57:30.369521
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
1	Electronics	Autem iste recusandae minima atque quas sit.Quia illum dolores eaque voluptatum est ex suscipit modi.	2010-12-13 10:57:28.776959	2010-12-13 10:57:28.776959	\N	1	2	\N	0	1
2	Leisure	Molestiae deserunt qui aliquam dolor et commodi.Consectetur rerum delectus deleniti esse.	2010-12-13 10:57:28.806468	2010-12-13 10:57:28.806468	\N	3	4	\N	0	2
3	Business	Incidunt architecto vero doloremque rem.Assumenda quaerat quia dolorum consequatur sed quod.	2010-12-13 10:57:28.827446	2010-12-13 10:57:29.495707	\N	5	6	\N	7	3
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
1	1	dk	Autem iste recusandae minima atque quas sit.Quia illum dolores eaque voluptatum est ex suscipit modi.	Electronics	2010-12-13 10:57:28.786863	2010-12-13 10:57:28.786863
2	2	dk	Molestiae deserunt qui aliquam dolor et commodi.Consectetur rerum delectus deleniti esse.	Leisure	2010-12-13 10:57:28.810897	2010-12-13 10:57:28.810897
3	3	dk	Incidunt architecto vero doloremque rem.Assumenda quaerat quia dolorum consequatur sed quod.	Business	2010-12-13 10:57:28.831998	2010-12-13 10:57:28.831998
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-13 10:57:28.333524	2010-12-13 10:57:28.333524
2	United Kingdom	2010-12-13 10:57:28.338343	2010-12-13 10:57:28.338343
3	Scotland129223784898091	2010-12-13 10:57:28.982479	2010-12-13 10:57:28.982479
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
1	quibusdam	$	%u%n	t	2010-12-13 10:57:29.041151	2010-12-13 10:57:29.041151
2	enim	&pound;	%u%n	t	2010-12-13 10:57:29.10632	2010-12-13 10:57:29.10632
3	velit	&euro;	%u%n	t	2010-12-13 10:57:29.156999	2010-12-13 10:57:29.156999
4	voluptas	&euro;	%u%n	t	2010-12-13 10:57:29.206025	2010-12-13 10:57:29.206025
5	saepe	&pound;	%u%n	t	2010-12-13 10:57:29.254732	2010-12-13 10:57:29.254732
6	dolor	$	%u%n	t	2010-12-13 10:57:29.303492	2010-12-13 10:57:29.303492
7	quo	&pound;	%u%n	t	2010-12-13 10:57:29.4743	2010-12-13 10:57:29.4743
8	Euro	&euro;	%u%n	t	2010-12-13 10:57:30.384852	2010-12-13 10:57:30.384852
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-13 10:57:28.364497	2010-12-13 10:57:28.364497
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-13 10:57:28.379617	2010-12-13 10:57:28.379617
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-13 10:57:28.508073	2010-12-13 10:57:28.508073
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-13 10:57:28.52016	2010-12-13 10:57:28.52016
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-13 10:57:28.532432	2010-12-13 10:57:28.532432
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-13 10:57:28.544213	2010-12-13 10:57:28.544213
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-13 10:57:28.556336	2010-12-13 10:57:28.556336
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-13 10:57:28.568075	2010-12-13 10:57:28.568075
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-13 10:57:28.580347	2010-12-13 10:57:28.580347
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-13 10:57:28.59241	2010-12-13 10:57:28.59241
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-13 10:57:28.604435	2010-12-13 10:57:28.604435
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-13 10:57:28.616524	2010-12-13 10:57:28.616524
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-13 10:57:28.628954	2010-12-13 10:57:28.628954
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-13 10:57:28.642423	2010-12-13 10:57:28.642423
15	8	en	Question	<p></p>	2010-12-13 10:57:28.655146	2010-12-13 10:57:28.655146
16	8	dk	[DK] Question	<p></p>	2010-12-13 10:57:28.66735	2010-12-13 10:57:28.66735
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-13 10:57:28.355454	2010-12-13 10:57:28.375296
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-13 10:57:28.387683	2010-12-13 10:57:28.516088
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-13 10:57:28.52798	2010-12-13 10:57:28.540153
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-13 10:57:28.552048	2010-12-13 10:57:28.564071
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-13 10:57:28.57593	2010-12-13 10:57:28.588355
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-13 10:57:28.600167	2010-12-13 10:57:28.612317
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-13 10:57:28.624299	2010-12-13 10:57:28.637971
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-13 10:57:28.650534	2010-12-13 10:57:28.663168
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
1	1	dk	Autem nostrum deserunt id tenetur illo.Accusantium voluptas est nesciunt blanditiis qui quis.	Odit dolores laudantium quia molestias.Autem omnis fugit hic dolorum quo quibusdam.	Big deal on printers	2010-12-13 10:57:29.080133	2010-12-13 10:57:29.080133
2	2	dk	Sit unde repellat ea sapiente est amet voluptatum.Sit libero consequatur suscipit voluptatem.	Non voluptatem qui non praesentium.Dignissimos quam cum optio ut nemo et non.	Drills required	2010-12-13 10:57:29.135349	2010-12-13 10:57:29.135349
3	3	dk	Possimus nemo est ipsam rerum blanditiis voluptas numquam impedit.Suscipit ea deserunt eum.	Explicabo alias aut eligendi eum vero consectetur dolor.Molestiae et consequatur exercitationem.	Need assistance in selling a car	2010-12-13 10:57:29.1853	2010-12-13 10:57:29.1853
4	4	dk	Quos totam accusantium qui dolor et.Nostrum iure similique adipisci eum dolore dignissimos sed.	Eaque sint minus ut doloremque assumenda facere delectus.Veritatis autem saepe vero est consequatur et.	Ipod shipment	2010-12-13 10:57:29.233963	2010-12-13 10:57:29.233963
5	5	dk	Iusto in itaque in unde ipsa.Impedit possimus voluptas et repudiandae cupiditate enim aut.	Aut odio non quidem sunt et praesentium aut eaque.Et est delectus pariatur.	Trip to amazonia - looking for offer	2010-12-13 10:57:29.282216	2010-12-13 10:57:29.282216
6	6	dk	Doloribus dolorem non aut pariatur esse aspernatur repellat ut.Enim dolor animi vitae.	Omnis quibusdam recusandae dolores nam unde quia.Asperiores quia expedita quo ipsa veritatis.	LCD - Huge amounts	2010-12-13 10:57:29.451853	2010-12-13 10:57:29.451853
7	7	dk	Incidunt et necessitatibus sunt.Ea sit ipsa animi temporibus reiciendis placeat nostrum rem.	Recusandae non debitis expedita aliquam ab ea est.Voluptas aspernatur quia impedit minus quia voluptatem nulla.	GPS receivers required	2010-12-13 10:57:29.502261	2010-12-13 10:57:29.502261
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Autem nostrum deserunt id tenetur illo.Accusantium voluptas est nesciunt blanditiis qui quis.	Odit dolores laudantium quia molestias.Autem omnis fugit hic dolorum quo quibusdam.	2	User::Agent	0	90.0	23.0	1	Jewess	Erich Kohler	(550)186-4923 x496	alexandro@goodwinwillms.ca	921 Schneider Key	2010-12-13 10:57:29.050207	2010-12-13 10:57:29.050207	2010-12-18	Eduardo129223784886162 Ratke	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Sit unde repellat ea sapiente est amet voluptatum.Sit libero consequatur suscipit voluptatem.	Non voluptatem qui non praesentium.Dignissimos quam cum optio ut nemo et non.	2	User::Agent	0	349.0	329.0	1	Barrows	Miguel Pfeffer	930-522-9094 x477	lonny_braun@herman.biz	41456 Dusty Fords	2010-12-13 10:57:29.112224	2010-12-13 10:57:29.112224	2010-12-18	Eduardo129223784886162 Ratke	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Possimus nemo est ipsam rerum blanditiis voluptas numquam impedit.Suscipit ea deserunt eum.	Explicabo alias aut eligendi eum vero consectetur dolor.Molestiae et consequatur exercitationem.	2	User::Agent	0	731.0	183.0	1	Nikolaus	Frieda Yundt	1-262-644-8058 x4233	rusty@nitzsche.com	3664 Pfannerstill Meadows	2010-12-13 10:57:29.163096	2010-12-13 10:57:29.163096	2010-12-18	Eduardo129223784886162 Ratke	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Quos totam accusantium qui dolor et.Nostrum iure similique adipisci eum dolore dignissimos sed.	Eaque sint minus ut doloremque assumenda facere delectus.Veritatis autem saepe vero est consequatur et.	2	User::Agent	0	797.0	209.0	1	Ebert	Evalyn Willms	038-277-3092	orion.boyle@muller.co.uk	0756 Karley Motorway	2010-12-13 10:57:29.211968	2010-12-13 10:57:29.211968	2010-12-18	Eduardo129223784886162 Ratke	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Iusto in itaque in unde ipsa.Impedit possimus voluptas et repudiandae cupiditate enim aut.	Aut odio non quidem sunt et praesentium aut eaque.Et est delectus pariatur.	2	User::Agent	0	571.0	805.0	1	Borergrady	Mandy Johns	(593)091-7716 x785	lurline@heller.biz	4725 Robel Plains	2010-12-13 10:57:29.260661	2010-12-13 10:57:29.260661	2010-12-18	Eduardo129223784886162 Ratke	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Doloribus dolorem non aut pariatur esse aspernatur repellat ut.Enim dolor animi vitae.	Omnis quibusdam recusandae dolores nam unde quia.Asperiores quia expedita quo ipsa veritatis.	2	User::Agent	0	432.0	650.0	1	Maggio	Karina Eichmann	689.499.9888 x325	bessie_pacocha@nitzscheernser.co.uk	58596 Boyer Crescent	2010-12-13 10:57:29.309433	2010-12-13 10:57:29.309433	2010-12-18	Eduardo129223784886162 Ratke	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Incidunt et necessitatibus sunt.Ea sit ipsa animi temporibus reiciendis placeat nostrum rem.	Recusandae non debitis expedita aliquam ab ea est.Voluptas aspernatur quia impedit minus quia voluptatem nulla.	2	User::Agent	0	326.0	354.0	1	Bins	Jennie Rohan	024.386.8760 x8897	rodrick@ryan.uk	6010 Hettinger Ports	2010-12-13 10:57:29.480321	2010-12-13 10:57:29.480321	2010-12-18	Eduardo129223784886162 Ratke	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-13 10:57:28.312967	2010-12-13 10:57:28.312967
2	default_leads_per_page	--- 5\n	2010-12-13 10:57:28.318596	2010-12-13 10:57:28.318596
3	certification_level_1	--- 10\n	2010-12-13 10:57:28.320766	2010-12-13 10:57:28.320766
4	certification_level_2	--- 20\n	2010-12-13 10:57:28.322849	2010-12-13 10:57:28.322849
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-13 10:57:28.324897	2010-12-13 10:57:28.324897
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
1	blazejek@gmail.com	29d21f1b9ae7304d418ea9fb07fe0a0cfca44defe5d85ac6ca54edead813799c4d552896edba6712b1c84731013cd0776e6d2e57b1a7c6eb62e9f1295fe559b5	yAUqjl5DVdPBo_oYIzcI	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-13 10:57:28.758028	2010-12-13 10:57:28.698745	\N	2010-12-13 10:57:28.698962	2010-12-13 10:57:28.758313	1	Bart	Beahan	(491)747-3636 x3398	root	Trent Forest	East Brook	07995-2566	Shropshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	3C46qdPBfxvoJIOOkA7i1LiaWPz56x3PRoIdkTgWT6RjA1C10XRDCKyTW1aQJE	f	\N	0	0	0	0	0
2	agent@nbs.com	57b922d616b0ca853267a2502c973ff2451984d5e7ed4017b5ed0c250ccacb1c31704ed42a9e1fa247780a5468cb7973586abcb19b2bcb69b4c3851dd25fb896	JP2GI4KBcagKzptZxDzI	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-13 10:57:29.010252	2010-12-13 10:57:28.987888	\N	2010-12-13 10:57:28.988103	2010-12-13 10:57:29.010528	2	Eduardo129223784886162	Ratke	061-461-5619	Samson Gulgowski129223784886131	Lazaro Parks	Rosenbaumfurt	29209	West Midlands	3	\N	0	\N	\N	0	\N	\N	\N	\N	zffnRZefV900uaJhe9KIoYpnUa4cbt8N4eOoPB80Zm94JRZ74cf9bThRSlAPUi	f	\N	0	0	0	0	0
3	admin@nbs.com	41ea6b2546dda1dc6a13dc9cc077ab9dbf3d514a19167c51c09a097f40a3216368a4235bab5c81e140344b0f46341f47c78fe9c8d00148f9a4eb17d840a2da06	anEdtdFTTisfcBa-fkBW	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-13 10:57:29.567382	2010-12-13 10:57:29.547046	\N	2010-12-13 10:57:29.547267	2010-12-13 10:57:29.567648	1	Fletcher	Vandervort	029-168-8267	Winston Ryan129223784954227	Emmitt Union	New Gailmouth	70654	Kent	1	\N	\N	\N	\N	0	\N	\N	\N	\N	nlPlVB2UMLfAh1VjO3Cpc4opAiU5rZeIu5kyG80BM7y8ucpO5mSsrNle9g3cYr	f	\N	0	0	0	0	0
4	buyer@nbs.com	f55a1d337586ffc810cdcbb31582d4ddbd52f000b7fc3450fda8500753f9bfdc399fba75d0dd674fa210634a60d596e886626365c52b686319af448e403e1024	i0U7JWIkgVznPr5iZMW2	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-13 10:57:29.617434	2010-12-13 10:57:29.595156	\N	2010-12-13 10:57:29.59537	2010-12-13 10:57:29.617697	48	Anastacio	Dickinson	977.047.9748 x52209	Adrian Swift II129223784959074	Kovacek Landing	New Gust	97037	Durham	1	\N	\N	\N	\N	0	\N	\N	\N	\N	IOFpIzKrFoIWp3mQ9VKjlwZsTlmNHd24mraEWoMaMR4h7udiqNMcu0iEmy7Zx1	f	t	0	0	0	0	0
5	leaduser@nbs.com	f1ce82f412d3e4150596fd320cb306633102c3e8e149604c03ebfda14af881ad77474a426fc983279883fec924911dc3579c4be6070df8f27230d26921dda997	rWWVv96Ul9wcgOAppzBU	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-13 10:57:29.66781	2010-12-13 10:57:29.645872	\N	2010-12-13 10:57:29.646125	2010-12-13 10:57:29.681102	64	Seamus	Torphy	1-578-437-8327 x1990	Vivienne Lynch129223784964131	Hartmann Heights	Sawaynville	72107-0958	Wiltshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	vyNK7ZdRRCRcOgJiTb2wzvpX4kmFgXSshLRYk4bDvOTwk2s1FxvAFyg2PP9O8G	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

