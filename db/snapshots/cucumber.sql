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

SELECT pg_catalog.setval('article_translations_id_seq', 1, false);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 1, false);


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

SELECT pg_catalog.setval('settings_id_seq', 4, true);


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
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
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
1	Electronics	Placeat commodi ullam saepe.Vitae eum repellendus eaque.	2010-12-08 11:09:41.234781	2010-12-08 11:09:41.234781	\N	1	2	\N	0	1
2	Leisure	Debitis aperiam nulla aut rerum expedita est excepturi perspiciatis.Voluptas similique libero voluptas ut consequuntur in.	2010-12-08 11:09:41.288125	2010-12-08 11:09:41.288125	\N	3	4	\N	0	2
3	Business	Quas provident modi voluptatibus quis.Est maiores enim quae.	2010-12-08 11:09:41.329844	2010-12-08 11:09:42.529494	\N	5	6	\N	7	3
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
1	1	dk	Placeat commodi ullam saepe.Vitae eum repellendus eaque.	Electronics	2010-12-08 11:09:41.251505	2010-12-08 11:09:41.251505
2	2	dk	Debitis aperiam nulla aut rerum expedita est excepturi perspiciatis.Voluptas similique libero voluptas ut consequuntur in.	Leisure	2010-12-08 11:09:41.29431	2010-12-08 11:09:41.29431
3	3	dk	Quas provident modi voluptatibus quis.Est maiores enim quae.	Business	2010-12-08 11:09:41.336901	2010-12-08 11:09:41.336901
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-08 11:09:40.103052	2010-12-08 11:09:40.103052
2	United Kingdom	2010-12-08 11:09:40.113857	2010-12-08 11:09:40.113857
3	Northern Ireland3585	2010-12-08 11:09:41.393006	2010-12-08 11:09:41.393006
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
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2010-12-08 11:09:40.154404	2010-12-08 11:09:40.154404
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2010-12-08 11:09:40.180388	2010-12-08 11:09:40.180388
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2010-12-08 11:09:40.202563	2010-12-08 11:09:40.202563
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2010-12-08 11:09:40.225551	2010-12-08 11:09:40.225551
5	3	en	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	Somebody shared leads with you	2010-12-08 11:09:40.244787	2010-12-08 11:09:40.244787
6	3	dk	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	[DK] Somebody shared leads with you	2010-12-08 11:09:40.265136	2010-12-08 11:09:40.265136
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2010-12-08 11:09:40.288967	2010-12-08 11:09:40.288967
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2010-12-08 11:09:40.308195	2010-12-08 11:09:40.308195
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2010-12-08 11:09:40.327445	2010-12-08 11:09:40.327445
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2010-12-08 11:09:40.349594	2010-12-08 11:09:40.349594
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2010-12-08 11:09:40.372398	2010-12-08 11:09:40.372398
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2010-12-08 11:09:40.398274	2010-12-08 11:09:40.398274
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2010-12-08 11:09:40.421195	2010-12-08 11:09:40.421195
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2010-12-08 11:09:40.442874	2010-12-08 11:09:40.442874
15	8	en	<p></p>	Question	2010-12-08 11:09:40.467598	2010-12-08 11:09:40.467598
16	8	dk	<p></p>	[DK] Question	2010-12-08 11:09:40.487002	2010-12-08 11:09:40.487002
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-08 11:09:40.142963	2010-12-08 11:09:40.17479
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-08 11:09:40.196245	2010-12-08 11:09:40.216118
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-08 11:09:40.238372	2010-12-08 11:09:40.259495
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-08 11:09:40.28242	2010-12-08 11:09:40.301867
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-08 11:09:40.321604	2010-12-08 11:09:40.343591
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-08 11:09:40.365722	2010-12-08 11:09:40.392569
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-08 11:09:40.41373	2010-12-08 11:09:40.436801
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-08 11:09:40.458647	2010-12-08 11:09:40.480582
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
1	1	dk	Aspernatur recusandae adipisci veniam ut sint qui dolor.Omnis totam quia impedit.	Qui qui consequatur laboriosam vel dolores excepturi tempore.Et voluptates ut est.	Big deal on printers	2010-12-08 11:09:41.546759	2010-12-08 11:09:41.546759
2	2	dk	Beatae saepe fuga in consequatur quibusdam a laboriosam perferendis.Voluptatibus unde delectus et ut cupiditate sit facilis aut.	Cumque sit natus ex quia officiis quis et.Officia reprehenderit est voluptatem temporibus esse consequuntur inventore veritatis.	Drills required	2010-12-08 11:09:41.642597	2010-12-08 11:09:41.642597
3	3	dk	Est odio recusandae quasi fugit ratione enim.Quis et velit veritatis.	Praesentium consequuntur quia magni.Sed sint consequuntur repellendus debitis.	Need assistance in selling a car	2010-12-08 11:09:41.740983	2010-12-08 11:09:41.740983
4	4	dk	Quisquam sint rerum quaerat tempora aperiam.Qui hic et aut inventore.	Mollitia eius consequuntur adipisci quos.Eveniet est incidunt consequuntur ea culpa.	Ipod shipment	2010-12-08 11:09:41.825301	2010-12-08 11:09:41.825301
5	5	dk	Architecto est dolorem et possimus temporibus.Enim incidunt ratione ut neque iusto consequatur id rerum.	Veniam sed nisi ab.Exercitationem eum optio quia voluptatum quis.	Trip to amazonia - looking for offer	2010-12-08 11:09:41.961284	2010-12-08 11:09:41.961284
6	6	dk	Doloribus suscipit soluta illum quos.Quisquam ipsa aut voluptates.	Illum ratione non consequatur.Aliquid eaque sed quo et.	LCD - Huge amounts	2010-12-08 11:09:42.464367	2010-12-08 11:09:42.464367
7	7	dk	Soluta similique excepturi consequatur itaque illo aut quasi enim.Ex harum nobis voluptas blanditiis rerum numquam sunt.	Excepturi praesentium enim porro unde sed asperiores aut voluptate.Tenetur beatae velit occaecati et eum.	GPS receivers required	2010-12-08 11:09:42.538979	2010-12-08 11:09:42.538979
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating) FROM stdin;
1	Big deal on printers	3	Aspernatur recusandae adipisci veniam ut sint qui dolor.Omnis totam quia impedit.	Qui qui consequatur laboriosam vel dolores excepturi tempore.Et voluptates ut est.	2	User::Agent	0	847.0	409.0	1	Cole	Fabiola Bednar	1-595-606-5438 x81818	amir_okeefe@conn.info	388 Weissnat Union	2010-12-08 11:09:41.497205	2010-12-08 11:09:41.497205	2010-12-13	Ardellarand Schulist	1	f	\N	0	0	f	f
2	Drills required	3	Beatae saepe fuga in consequatur quibusdam a laboriosam perferendis.Voluptatibus unde delectus et ut cupiditate sit facilis aut.	Cumque sit natus ex quia officiis quis et.Officia reprehenderit est voluptatem temporibus esse consequuntur inventore veritatis.	2	User::Agent	0	532.0	297.0	1	Bode	Krista Turcotte	(529)398-6309 x64628	velda.muller@torp.info	04535 Ullrich Land	2010-12-08 11:09:41.604438	2010-12-08 11:09:41.604438	2010-12-13	Ardellarand Schulist	1	f	\N	0	0	f	f
3	Need assistance in selling a car	3	Est odio recusandae quasi fugit ratione enim.Quis et velit veritatis.	Praesentium consequuntur quia magni.Sed sint consequuntur repellendus debitis.	2	User::Agent	0	212.0	306.0	1	Collins	Bridgette Crooks	083-849-3611 x664	johann_crooks@gaylord.uk	7185 Grant Streets	2010-12-08 11:09:41.692043	2010-12-08 11:09:41.692043	2010-12-13	Ardellarand Schulist	1	f	\N	0	0	f	f
4	Ipod shipment	3	Quisquam sint rerum quaerat tempora aperiam.Qui hic et aut inventore.	Mollitia eius consequuntur adipisci quos.Eveniet est incidunt consequuntur ea culpa.	2	User::Agent	0	453.0	537.0	1	Ryangerhold	Gust Rosenbaum	(358)641-5604	stanford.kulas@jaskolski.co.uk	6340 Dibbert Island	2010-12-08 11:09:41.785076	2010-12-08 11:09:41.785076	2010-12-13	Ardellarand Schulist	1	f	\N	0	0	f	f
5	Trip to amazonia - looking for offer	3	Architecto est dolorem et possimus temporibus.Enim incidunt ratione ut neque iusto consequatur id rerum.	Veniam sed nisi ab.Exercitationem eum optio quia voluptatum quis.	2	User::Agent	0	364.0	846.0	1	Hanewuckert	Andre Denesik	231-341-5172	aditya_sawayn@bayer.info	7581 Annie Pine	2010-12-08 11:09:41.887618	2010-12-08 11:09:41.887618	2010-12-13	Ardellarand Schulist	1	f	\N	0	0	f	f
6	LCD - Huge amounts	3	Doloribus suscipit soluta illum quos.Quisquam ipsa aut voluptates.	Illum ratione non consequatur.Aliquid eaque sed quo et.	2	User::Agent	0	592.0	735.0	1	Metz	Cordell Jacobi	1-716-911-1490 x7626	violet@haag.com	36949 Boehm Highway	2010-12-08 11:09:42.432967	2010-12-08 11:09:42.432967	2010-12-13	Ardellarand Schulist	1	f	\N	0	0	f	f
7	GPS receivers required	3	Soluta similique excepturi consequatur itaque illo aut quasi enim.Ex harum nobis voluptas blanditiis rerum numquam sunt.	Excepturi praesentium enim porro unde sed asperiores aut voluptate.Tenetur beatae velit occaecati et eum.	2	User::Agent	0	23.0	93.0	1	Beier	Junior Dicki	1-563-499-3806 x6843	keaton@schmitt.info	00932 Arlene Ridges	2010-12-08 11:09:42.501118	2010-12-08 11:09:42.501118	2010-12-13	Ardellarand Schulist	1	f	\N	0	0	f	f
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-08 11:09:40.060293	2010-12-08 11:09:40.060293
2	default_leads_per_page	--- 5\n	2010-12-08 11:09:40.069605	2010-12-08 11:09:40.069605
3	certification_level_1	--- 10\n	2010-12-08 11:09:40.074727	2010-12-08 11:09:40.074727
4	certification_level_2	--- 20\n	2010-12-08 11:09:40.081611	2010-12-08 11:09:40.081611
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
1	blazejek@gmail.com	666400ac1a9101f126d4d9dd7e06c4284902bbdbad8fcc989b5148681788a36e273e39116b001b2e1b4dea034b63e31d700f7eb0b02e9d86899ca393ed0e1191	sYEjiHFLhK7uwEztCGCg	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 11:09:41.195661	2010-12-08 11:09:41.067325	\N	2010-12-08 11:09:41.067632	2010-12-08 11:09:41.196369	1	Lilly	Hudson	444.114.1635	root	Senger Fall	East Dayana	97355	Tyne and Wear	1	\N	\N	\N	\N	0	\N	\N	\N	\N	xwg0pshFylqedMYxxJtsz1lj1FjrytPRHxISMk5rIYeakZUpNmDLugikPDGIYA	f	\N	0	0	0	0	0
2	agent@nbs.com	21676f2178d727e9af3f9d0562aed268212a63b486e3a1888493adec4801aae2c16f9fb8a80266134fab58bc2d9892af87a527aaa91af24f04d94a95e37b4a13	HmoAx_iiaIJXkrj5V5eC	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 11:09:41.443815	2010-12-08 11:09:41.405757	\N	2010-12-08 11:09:41.406064	2010-12-08 11:09:41.445291	2	Ardellarand	Schulist	1-248-498-7121 x95350	Dr. Rudy Robel	McClure Hills	Dominicland	05423-3472	Clwyd	3	\N	0	\N	\N	0	\N	\N	\N	\N	ZAFK067dzG7E2S2iw0D9uIX0bgnhWz4AbjiSRJczWGTPtr70irGQBWjDzygn7d	f	\N	0	0	0	0	0
3	admin@nbs.com	0f113899d442c2f2b0fbf5eeb7552d0bfafdbbeccfd4a4c3020ff639a47d474708b67f6e31a6682c94135c98b9ac2e9fd0cb264537c688e11bbe61e0101417c8	Cm8P0zm-sfi88T9Om3qH	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 11:09:42.652083	2010-12-08 11:09:42.61955	\N	2010-12-08 11:09:42.619837	2010-12-08 11:09:42.652523	1	Destin	Russel	(613)570-9074 x719	Travis Witting5756	Amparo Flats	East Ciaraberg	94882	Tyne and Wear	1	\N	\N	\N	\N	0	\N	\N	\N	\N	AzOGnj0I0JxXXXm61iNGJTe0gpLyeFCqFupFF9eNrJl0xU9INi9aGJRNZaw0Ie	f	\N	0	0	0	0	0
4	buyer@nbs.com	b9f3e6d36f2671e5d00c0b8636f4c65c0f928a6990eacfa6033917ff264541184b733a8547d5617ee2a84b2f5b11373206fc1996e39036ef6cc512fd80902671	1PuuZuXQeP4UdmCalgiB	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 11:09:42.725413	2010-12-08 11:09:42.694202	\N	2010-12-08 11:09:42.694566	2010-12-08 11:09:42.725992	48	Patience	Ferry	544-849-5583 x93749	Remington Wolff V9878	Hills Underpass	South Abbieton	04683	Durham	1	\N	\N	\N	\N	0	\N	\N	\N	\N	LUywxpf7Uw8uE6fNF5rKhJe6RRjk4k6r4lXz8cM4elDT9UjAyvtra92775wviQ	f	t	0	0	0	0	0
5	leaduser@nbs.com	1854b4b7296f33954b46b34df7fbc072dd56b62be5a004abbb7bf623e5ad65adc1bc7d003303a514b06e0c53d6cebfd5a7e30c65fd0f60dabde5da572ea9d927	R3uZbTPhUb1ygFkfqnmO	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 11:09:42.815045	2010-12-08 11:09:42.783323	\N	2010-12-08 11:09:42.783606	2010-12-08 11:09:42.844817	64	Raphael	Leffler	(413)503-9016 x392	Thurman Spinka2187	Luisa Rapids	Schroederton	74247-8841	County Armagh	1	\N	\N	4	\N	0	\N	\N	\N	\N	do6UCqTI8e9v7aGpFV3ttoTMK11AeL95ejh3GVZUNi7D9H6y4yIOMvHwG9ucIj	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

