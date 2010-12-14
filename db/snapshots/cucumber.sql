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
1	1	dk	About us	About us	2010-12-14 10:59:26.323281	2010-12-14 10:59:26.323281
2	1	en	About us	About us	2010-12-14 10:59:26.338087	2010-12-14 10:59:26.338087
3	2	dk	Privacy	Privacy	2010-12-14 10:59:26.368383	2010-12-14 10:59:26.368383
4	2	en	Privacy	Privacy	2010-12-14 10:59:26.380833	2010-12-14 10:59:26.380833
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-14 10:59:26.412373	2010-12-14 10:59:26.412373
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-14 10:59:26.425136	2010-12-14 10:59:26.425136
7	4	dk	Blurb sign up	Blurb sign up	2010-12-14 10:59:26.452568	2010-12-14 10:59:26.452568
8	4	en	Blurb sign up	Blurb sign up	2010-12-14 10:59:26.464915	2010-12-14 10:59:26.464915
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-14 10:59:26.492203	2010-12-14 10:59:26.492203
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-14 10:59:26.631054	2010-12-14 10:59:26.631054
11	6	dk	Blurb agent home	Blurb agent home	2010-12-14 10:59:26.659455	2010-12-14 10:59:26.659455
12	6	en	Blurb agent home	Blurb agent home	2010-12-14 10:59:26.672488	2010-12-14 10:59:26.672488
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-14 10:59:26.700228	2010-12-14 10:59:26.700228
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-14 10:59:26.713078	2010-12-14 10:59:26.713078
15	8	dk	Blurb currencies	Blurb currencies	2010-12-14 10:59:26.741172	2010-12-14 10:59:26.741172
16	8	en	Blurb currencies	Blurb currencies	2010-12-14 10:59:26.753791	2010-12-14 10:59:26.753791
17	9	dk	Reset password	Reset password	2010-12-14 10:59:26.781189	2010-12-14 10:59:26.781189
18	9	en	Reset password	Reset password	2010-12-14 10:59:26.793506	2010-12-14 10:59:26.793506
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-14 10:59:26.314988	2010-12-14 10:59:26.341083	about_us	0	t	2010-12-14 10:59:26.341001
2	Article::Cms	2010-12-14 10:59:26.364407	2010-12-14 10:59:26.383853	privacy	0	t	2010-12-14 10:59:26.383774
3	Article::Cms	2010-12-14 10:59:26.40833	2010-12-14 10:59:26.428152	terms_conditions	0	t	2010-12-14 10:59:26.42807
4	Article::Cms	2010-12-14 10:59:26.448559	2010-12-14 10:59:26.467856	blurb_sign_up	1	t	2010-12-14 10:59:26.467779
5	Article::Cms	2010-12-14 10:59:26.487943	2010-12-14 10:59:26.634145	blurb_buyer_home	1	t	2010-12-14 10:59:26.634067
6	Article::Cms	2010-12-14 10:59:26.655332	2010-12-14 10:59:26.675515	blurb_agent_home	1	t	2010-12-14 10:59:26.675437
7	Article::Cms	2010-12-14 10:59:26.696033	2010-12-14 10:59:26.716119	blurb_start_page_role_selection	1	t	2010-12-14 10:59:26.716037
8	Article::Cms	2010-12-14 10:59:26.736906	2010-12-14 10:59:26.756919	blurb_currencies	1	t	2010-12-14 10:59:26.756826
9	Article::Cms	2010-12-14 10:59:26.777194	2010-12-14 10:59:26.796447	reset_password	2	t	2010-12-14 10:59:26.79637
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
1	Electronics	Sit eum dolore ut occaecati quaerat quisquam reiciendis.Culpa velit natus nam sit ab et adipisci perspiciatis.	2010-12-14 10:59:25.170372	2010-12-14 10:59:25.170372	\N	1	2	\N	0	1-electronics
2	Leisure	Corporis ullam culpa quasi et aspernatur consequatur voluptas.Nemo voluptatum perferendis eligendi neque.	2010-12-14 10:59:25.214186	2010-12-14 10:59:25.214186	\N	3	4	\N	0	2-leisure
3	Business	Velit consequatur quia eum qui expedita ut.Qui qui ut est.	2010-12-14 10:59:25.247003	2010-12-14 10:59:25.924288	\N	5	6	\N	7	3-business
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
1	1	en	Sit eum dolore ut occaecati quaerat quisquam reiciendis.Culpa velit natus nam sit ab et adipisci perspiciatis.	Electronics	2010-12-14 10:59:25.179195	2010-12-14 10:59:25.179195
2	1	dk	\N	Electronics	2010-12-14 10:59:25.204742	2010-12-14 10:59:25.204742
3	2	en	Corporis ullam culpa quasi et aspernatur consequatur voluptas.Nemo voluptatum perferendis eligendi neque.	Leisure	2010-12-14 10:59:25.21856	2010-12-14 10:59:25.21856
4	2	dk	\N	Leisure	2010-12-14 10:59:25.237631	2010-12-14 10:59:25.237631
5	3	en	Velit consequatur quia eum qui expedita ut.Qui qui ut est.	Business	2010-12-14 10:59:25.251332	2010-12-14 10:59:25.251332
6	3	dk	\N	Business	2010-12-14 10:59:25.388255	2010-12-14 10:59:25.388255
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-14 10:59:24.718024	2010-12-14 10:59:24.718024
2	United Kingdom	2010-12-14 10:59:24.722739	2010-12-14 10:59:24.722739
3	England129232436541123	2010-12-14 10:59:25.41256	2010-12-14 10:59:25.41256
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
1	aut	$	%u%n	t	2010-12-14 10:59:25.471127	2010-12-14 10:59:25.471127
2	itaque	&pound;	%u%n	t	2010-12-14 10:59:25.533623	2010-12-14 10:59:25.533623
3	debitis	$	%u%n	t	2010-12-14 10:59:25.58389	2010-12-14 10:59:25.58389
4	assumenda	$	%u%n	t	2010-12-14 10:59:25.632616	2010-12-14 10:59:25.632616
5	adipisci	&euro;	%u%n	t	2010-12-14 10:59:25.680991	2010-12-14 10:59:25.680991
6	possimus	&pound;	%u%n	t	2010-12-14 10:59:25.851378	2010-12-14 10:59:25.851378
7	voluptas	&pound;	%u%n	t	2010-12-14 10:59:25.902639	2010-12-14 10:59:25.902639
8	Euro	&euro;	%u%n	t	2010-12-14 10:59:26.812485	2010-12-14 10:59:26.812485
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-14 10:59:24.74881	2010-12-14 10:59:24.74881
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-14 10:59:24.764045	2010-12-14 10:59:24.764045
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-14 10:59:24.895577	2010-12-14 10:59:24.895577
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-14 10:59:24.907995	2010-12-14 10:59:24.907995
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-14 10:59:24.920067	2010-12-14 10:59:24.920067
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-14 10:59:24.932154	2010-12-14 10:59:24.932154
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-14 10:59:24.944426	2010-12-14 10:59:24.944426
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-14 10:59:24.956366	2010-12-14 10:59:24.956366
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-14 10:59:24.968687	2010-12-14 10:59:24.968687
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-14 10:59:24.980694	2010-12-14 10:59:24.980694
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-14 10:59:24.99295	2010-12-14 10:59:24.99295
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-14 10:59:25.005205	2010-12-14 10:59:25.005205
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-14 10:59:25.017715	2010-12-14 10:59:25.017715
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-14 10:59:25.030204	2010-12-14 10:59:25.030204
15	8	en	Question	<p></p>	2010-12-14 10:59:25.042997	2010-12-14 10:59:25.042997
16	8	dk	[DK] Question	<p></p>	2010-12-14 10:59:25.055599	2010-12-14 10:59:25.055599
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-14 10:59:24.739734	2010-12-14 10:59:24.759595
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-14 10:59:24.772094	2010-12-14 10:59:24.903853
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-14 10:59:24.915812	2010-12-14 10:59:24.928104
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-14 10:59:24.939886	2010-12-14 10:59:24.952326
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-14 10:59:24.964311	2010-12-14 10:59:24.976485
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-14 10:59:24.988681	2010-12-14 10:59:25.001069
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-14 10:59:25.013118	2010-12-14 10:59:25.025981
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-14 10:59:25.038425	2010-12-14 10:59:25.051236
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
1	1	dk	Quia odio repudiandae corrupti et dolore.Velit et totam consequatur alias iusto qui tempora.	Blanditiis nisi delectus qui porro.Voluptas accusamus rerum veritatis nemo ullam ut quis non.	Big deal on printers	2010-12-14 10:59:25.508988	2010-12-14 10:59:25.508988
2	2	dk	Dolorum quidem neque quis possimus ipsam nesciunt impedit illo.Ipsa ut enim pariatur earum dignissimos incidunt.	Possimus facilis consequatur nihil doloribus deserunt est nobis.Animi et eos et distinctio.	Drills required	2010-12-14 10:59:25.561663	2010-12-14 10:59:25.561663
3	3	dk	Itaque reiciendis nihil in ipsum voluptas ut non.Ea laboriosam sunt omnis eius et hic.	Minus voluptas sunt quia.Atque eveniet et aut sit voluptatem in quas in.	Need assistance in selling a car	2010-12-14 10:59:25.611597	2010-12-14 10:59:25.611597
4	4	dk	Voluptate earum saepe quia tenetur corrupti dolorem cupiditate neque.Natus officiis veritatis rem veniam dolore.	Sequi reiciendis libero esse sit enim corrupti repellat vel.Illum harum consequuntur atque ipsam veniam.	Ipod shipment	2010-12-14 10:59:25.660096	2010-12-14 10:59:25.660096
5	5	dk	Atque sit et enim eaque et.Sit dolor alias veritatis.	Voluptatibus nihil eum quia.Et porro aut quibusdam.	Trip to amazonia - looking for offer	2010-12-14 10:59:25.708468	2010-12-14 10:59:25.708468
6	6	dk	Fugiat cum molestiae consequuntur minima odio qui provident dolores.Iusto ea sint praesentium animi sunt ut.	Sed odio est quia et eaque.Sit ut optio ducimus placeat tenetur fuga quae non.	LCD - Huge amounts	2010-12-14 10:59:25.880183	2010-12-14 10:59:25.880183
7	7	dk	Optio qui qui in nisi voluptatem alias consequatur sunt.Voluptatum ut non velit corrupti.	Quos earum omnis nesciunt adipisci.Quis enim cum consectetur ad aliquid possimus alias.	GPS receivers required	2010-12-14 10:59:25.931248	2010-12-14 10:59:25.931248
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Quia odio repudiandae corrupti et dolore.Velit et totam consequatur alias iusto qui tempora.	Blanditiis nisi delectus qui porro.Voluptas accusamus rerum veritatis nemo ullam ut quis non.	2	User::Agent	0	693.0	203.0	1	Durgan	Jacinthe Mraz	(165)853-4669 x703	vilma_willms@rolfsonwilliamson.info	849 Greg Canyon	2010-12-14 10:59:25.480001	2010-12-14 10:59:25.480001	2010-12-19	Kirk129232436541033 Thompson	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Dolorum quidem neque quis possimus ipsam nesciunt impedit illo.Ipsa ut enim pariatur earum dignissimos incidunt.	Possimus facilis consequatur nihil doloribus deserunt est nobis.Animi et eos et distinctio.	2	User::Agent	0	636.0	360.0	1	Smithernser	Horace Smitham	(764)868-7306 x78334	porter_cummerata@haley.ca	9413 Yost Garden	2010-12-14 10:59:25.539531	2010-12-14 10:59:25.539531	2010-12-19	Kirk129232436541033 Thompson	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Itaque reiciendis nihil in ipsum voluptas ut non.Ea laboriosam sunt omnis eius et hic.	Minus voluptas sunt quia.Atque eveniet et aut sit voluptatem in quas in.	2	User::Agent	0	846.0	65.0	1	Brakusledner	Leonora Romaguera	1-721-224-0888	kade.howell@lakin.info	548 Dominic Way	2010-12-14 10:59:25.589741	2010-12-14 10:59:25.589741	2010-12-19	Kirk129232436541033 Thompson	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Voluptate earum saepe quia tenetur corrupti dolorem cupiditate neque.Natus officiis veritatis rem veniam dolore.	Sequi reiciendis libero esse sit enim corrupti repellat vel.Illum harum consequuntur atque ipsam veniam.	2	User::Agent	0	971.0	543.0	1	Crist	Virginie Grimes	1-552-056-9973 x59196	troy_altenwerth@gibson.ca	942 Clement Inlet	2010-12-14 10:59:25.638326	2010-12-14 10:59:25.638326	2010-12-19	Kirk129232436541033 Thompson	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Atque sit et enim eaque et.Sit dolor alias veritatis.	Voluptatibus nihil eum quia.Et porro aut quibusdam.	2	User::Agent	0	687.0	49.0	1	Ratke	Joesph Doyle	547.900.4173 x4777	adelia@rutherford.name	47397 Giles Parkway	2010-12-14 10:59:25.686752	2010-12-14 10:59:25.686752	2010-12-19	Kirk129232436541033 Thompson	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Fugiat cum molestiae consequuntur minima odio qui provident dolores.Iusto ea sint praesentium animi sunt ut.	Sed odio est quia et eaque.Sit ut optio ducimus placeat tenetur fuga quae non.	2	User::Agent	0	130.0	561.0	1	Schulist	Jazmyne Kuphal	(800)222-5649 x51281	tyra@mohrgoyette.us	263 D'angelo Wall	2010-12-14 10:59:25.857509	2010-12-14 10:59:25.857509	2010-12-19	Kirk129232436541033 Thompson	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Optio qui qui in nisi voluptatem alias consequatur sunt.Voluptatum ut non velit corrupti.	Quos earum omnis nesciunt adipisci.Quis enim cum consectetur ad aliquid possimus alias.	2	User::Agent	0	120.0	859.0	1	Ankunding	Francesca Zieme	973.372.4000 x8362	marlee.hickle@cristschmeler.com	18976 Rupert Mountains	2010-12-14 10:59:25.908741	2010-12-14 10:59:25.908741	2010-12-19	Kirk129232436541033 Thompson	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-14 10:59:24.697487	2010-12-14 10:59:24.697487
2	default_leads_per_page	--- 5\n	2010-12-14 10:59:24.703184	2010-12-14 10:59:24.703184
3	certification_level_1	--- 10\n	2010-12-14 10:59:24.70545	2010-12-14 10:59:24.70545
4	certification_level_2	--- 20\n	2010-12-14 10:59:24.707579	2010-12-14 10:59:24.707579
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-14 10:59:24.709704	2010-12-14 10:59:24.709704
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
1	blazejek@gmail.com	bae2af265c84e8684f0cdf77b913f5927e57de8335f3bc2348331ed7ee7c65b7cc8a5817ad4a8c621f59c34332d60b5db58dee1a0c5534f576d1bb0bb77cb249	zYphU6LAWEUGVpXCVV39	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-14 10:59:25.149807	2010-12-14 10:59:25.090707	\N	2010-12-14 10:59:25.090921	2010-12-14 10:59:25.150074	1	Brando	Wuckert	1-015-597-4199 x29501	root	Maximillian Vista	New Jarodbury	91086-1945	Suffolk	1	\N	\N	\N	\N	0	\N	\N	\N	\N	2kzVL5qPnDzld0RGFotUL7a1SonD9mHf04KjkwaVgTFZ7AW8DaTjgfGHHlPqxq	f	\N	0	0	0	0	0	\N
2	agent@nbs.com	29560a399ceb714e101f6e908aeb7ff2691306572dd8fce01c198bbf47c9af7267197aac03b5151ac1c917576e4f28b39dcd2b1715eb9791fbe52833980d820f	mUXaDA_8VZgFlgaYtD0q	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-14 10:59:25.440113	2010-12-14 10:59:25.417779	\N	2010-12-14 10:59:25.417984	2010-12-14 10:59:25.440395	2	Kirk129232436541033	Thompson	(372)250-1677 x692	Miss Darrion Koelpin129232436541001	Blaze Terrace	South Carlos	55144-1782	Cheshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	M6N6vQgnSOwlrjNyRrGQeAK9GlM8p0KLFc6Rm0QxGINmCfhk5UZk3V8ggAlpQm	f	\N	0	0	0	0	0	\N
3	admin@nbs.com	8d49bb8ce341bc7e5e2ec64d75834a077be6e93b879a9670b4ee06fdc5142f2ef40aa7d42b9e889110dd2070a56fc5c4d4c2f6ffc066271d932e838f5d78a06c	5etmAbSdlJWH0cI0E4yO	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-14 10:59:25.99694	2010-12-14 10:59:25.97653	\N	2010-12-14 10:59:25.976744	2010-12-14 10:59:25.9972	1	Darron	Harvey	(970)513-5600 x48955	Terrance Schumm129232436597237	Tromp Key	Millsberg	45593-1194	West Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	00aHHnXVRbczGtQdxAFMzQIR23n8uPMy2yxXT3PxNkiuWQsVJG00j2UU6yMed3	f	\N	0	0	0	0	0	\N
4	buyer@nbs.com	25f032412711e82fd6f27f2ec0de33ea9191ba46a920282f83c43c41d3581ec49e00d861024163d654839ed5d3559c3f1778c87400a5834fa0d3a0064f98365e	DwjyJrQ8GZ3iZOfHd_5-	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-14 10:59:26.047733	2010-12-14 10:59:26.025463	\N	2010-12-14 10:59:26.025677	2010-12-14 10:59:26.048005	48	Floy	Bartoletti	484.210.3328	Arianna Little129232436602105	Upton Points	VonRuedenton	25718	Durham	1	\N	\N	\N	\N	0	\N	\N	\N	\N	jRbscJNPfa58qIsvZWGEgeSSC2DEZ6pCtrdYwM6tXS1MdfYpX7g9CxuuSuKIP2	f	t	0	0	0	0	0	\N
5	leaduser@nbs.com	1a358b64f499dd9d9e807000ffa7bcf3501e90d1761981bf516b678fef31a26f6fb21dc84a0d113fb5eb8860da3b381b195395ec46588d273be3424acea8b365	y2nrA35iTbvJew46CcML	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-14 10:59:26.102183	2010-12-14 10:59:26.076346	\N	2010-12-14 10:59:26.076557	2010-12-14 10:59:26.115855	64	Jackie	Beahan	(863)180-2811	Victoria Cartwright129232436607165	Nader Brooks	East Myrna	97311-8009	Buckinghamshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	2OenDtLYGlIEZkHcAEluh0BKmXKmhJ1bjAjlLir1c7MYNTvQroqifNVSgmpMe8	f	\N	0	0	0	0	0	\N
\.


--
-- PostgreSQL database dump complete
--

