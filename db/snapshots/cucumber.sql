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
-- Name: payment_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('payment_notifications_id_seq', 1, false);


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

COPY article_translations (id, article_id, locale, content, title, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2010-12-16 12:56:39.109874	2010-12-16 12:56:39.109874
2	1	en	About us	About us	2010-12-16 12:56:39.125132	2010-12-16 12:56:39.125132
3	2	dk	Privacy	Privacy	2010-12-16 12:56:39.157213	2010-12-16 12:56:39.157213
4	2	en	Privacy	Privacy	2010-12-16 12:56:39.170135	2010-12-16 12:56:39.170135
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-16 12:56:39.202194	2010-12-16 12:56:39.202194
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-16 12:56:39.214831	2010-12-16 12:56:39.214831
7	4	dk	Blurb sign up	Blurb sign up	2010-12-16 12:56:39.243187	2010-12-16 12:56:39.243187
8	4	en	Blurb sign up	Blurb sign up	2010-12-16 12:56:39.255873	2010-12-16 12:56:39.255873
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-16 12:56:39.283411	2010-12-16 12:56:39.283411
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-16 12:56:39.296648	2010-12-16 12:56:39.296648
11	6	dk	Blurb agent home	Blurb agent home	2010-12-16 12:56:39.328275	2010-12-16 12:56:39.328275
12	6	en	Blurb agent home	Blurb agent home	2010-12-16 12:56:39.341785	2010-12-16 12:56:39.341785
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-16 12:56:39.37117	2010-12-16 12:56:39.37117
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-16 12:56:39.384883	2010-12-16 12:56:39.384883
15	8	dk	Blurb currencies	Blurb currencies	2010-12-16 12:56:39.555759	2010-12-16 12:56:39.555759
16	8	en	Blurb currencies	Blurb currencies	2010-12-16 12:56:39.568573	2010-12-16 12:56:39.568573
17	9	dk	Reset password	Reset password	2010-12-16 12:56:39.597727	2010-12-16 12:56:39.597727
18	9	en	Reset password	Reset password	2010-12-16 12:56:39.610454	2010-12-16 12:56:39.610454
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-16 12:56:39.101321	2010-12-16 12:56:39.128286	about_us	0	t	2010-12-16 12:56:39.12821
2	Article::Cms	2010-12-16 12:56:39.153192	2010-12-16 12:56:39.173387	privacy	0	t	2010-12-16 12:56:39.173309
3	Article::Cms	2010-12-16 12:56:39.198071	2010-12-16 12:56:39.217907	terms_conditions	0	t	2010-12-16 12:56:39.217814
4	Article::Cms	2010-12-16 12:56:39.239037	2010-12-16 12:56:39.258882	blurb_sign_up	1	t	2010-12-16 12:56:39.258808
5	Article::Cms	2010-12-16 12:56:39.27927	2010-12-16 12:56:39.299809	blurb_buyer_home	1	t	2010-12-16 12:56:39.29973
6	Article::Cms	2010-12-16 12:56:39.324193	2010-12-16 12:56:39.34515	blurb_agent_home	1	t	2010-12-16 12:56:39.345077
7	Article::Cms	2010-12-16 12:56:39.366859	2010-12-16 12:56:39.38806	blurb_start_page_role_selection	1	t	2010-12-16 12:56:39.387982
8	Article::Cms	2010-12-16 12:56:39.5515	2010-12-16 12:56:39.571599	blurb_currencies	1	t	2010-12-16 12:56:39.571505
9	Article::Cms	2010-12-16 12:56:39.593375	2010-12-16 12:56:39.613503	reset_password	2	t	2010-12-16 12:56:39.613427
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
1	Electronics	A id non quidem qui corrupti porro.Quo natus ducimus pariatur.	2010-12-16 12:56:37.769586	2010-12-16 12:56:37.769586	\N	1	2	\N	0	1-electronics	0	f
2	Leisure	Porro aut vel veniam.Dolores tenetur quia quo eos culpa rerum.	2010-12-16 12:56:37.815515	2010-12-16 12:56:37.815515	\N	3	4	\N	0	2-leisure	0	f
3	Business	Sit molestias minima eos modi.Consequatur ipsum iusto minus itaque recusandae.	2010-12-16 12:56:37.84874	2010-12-16 12:56:38.554372	\N	5	6	\N	7	3-business	7	f
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
1	1	en	A id non quidem qui corrupti porro.Quo natus ducimus pariatur.	Electronics	2010-12-16 12:56:37.778704	2010-12-16 12:56:37.778704
2	1	dk	\N	Electronics	2010-12-16 12:56:37.804513	2010-12-16 12:56:37.804513
3	2	en	Porro aut vel veniam.Dolores tenetur quia quo eos culpa rerum.	Leisure	2010-12-16 12:56:37.820129	2010-12-16 12:56:37.820129
4	2	dk	\N	Leisure	2010-12-16 12:56:37.839213	2010-12-16 12:56:37.839213
5	3	en	Sit molestias minima eos modi.Consequatur ipsum iusto minus itaque recusandae.	Business	2010-12-16 12:56:37.852982	2010-12-16 12:56:37.852982
6	3	dk	\N	Business	2010-12-16 12:56:37.872335	2010-12-16 12:56:37.872335
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-16 12:56:37.301522	2010-12-16 12:56:37.301522
2	United Kingdom	2010-12-16 12:56:37.307094	2010-12-16 12:56:37.307094
3	Northern Ireland129250419789663	2010-12-16 12:56:37.898098	2010-12-16 12:56:37.898098
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
1	labore	&pound;	%u%n	t	2010-12-16 12:56:37.957588	2010-12-16 12:56:37.957588
2	et	&pound;	%u%n	t	2010-12-16 12:56:38.041513	2010-12-16 12:56:38.041513
3	possimus	$	%u%n	t	2010-12-16 12:56:38.111128	2010-12-16 12:56:38.111128
4	eligendi	&euro;	%u%n	t	2010-12-16 12:56:38.313166	2010-12-16 12:56:38.313166
5	ut	$	%u%n	t	2010-12-16 12:56:38.384098	2010-12-16 12:56:38.384098
6	est	&pound;	%u%n	t	2010-12-16 12:56:38.454052	2010-12-16 12:56:38.454052
7	sed	&pound;	%u%n	t	2010-12-16 12:56:38.523196	2010-12-16 12:56:38.523196
8	Euro	&euro;	%u%n	t	2010-12-16 12:56:39.629624	2010-12-16 12:56:39.629624
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-16 12:56:37.333845	2010-12-16 12:56:37.333845
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-16 12:56:37.34896	2010-12-16 12:56:37.34896
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-16 12:56:37.361419	2010-12-16 12:56:37.361419
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-16 12:56:37.374322	2010-12-16 12:56:37.374322
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-16 12:56:37.386864	2010-12-16 12:56:37.386864
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-16 12:56:37.399174	2010-12-16 12:56:37.399174
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-16 12:56:37.411898	2010-12-16 12:56:37.411898
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-16 12:56:37.424479	2010-12-16 12:56:37.424479
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-16 12:56:37.437894	2010-12-16 12:56:37.437894
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-16 12:56:37.450626	2010-12-16 12:56:37.450626
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-16 12:56:37.463552	2010-12-16 12:56:37.463552
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-16 12:56:37.47673	2010-12-16 12:56:37.47673
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-16 12:56:37.489906	2010-12-16 12:56:37.489906
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-16 12:56:37.503014	2010-12-16 12:56:37.503014
15	8	en	Question	<p></p>	2010-12-16 12:56:37.516019	2010-12-16 12:56:37.516019
16	8	dk	[DK] Question	<p></p>	2010-12-16 12:56:37.528811	2010-12-16 12:56:37.528811
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-16 12:56:37.32459	2010-12-16 12:56:37.344574
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-16 12:56:37.357062	2010-12-16 12:56:37.36969
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-16 12:56:37.382258	2010-12-16 12:56:37.39498
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-16 12:56:37.407095	2010-12-16 12:56:37.420038
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-16 12:56:37.433144	2010-12-16 12:56:37.446216
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-16 12:56:37.459022	2010-12-16 12:56:37.472145
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-16 12:56:37.485243	2010-12-16 12:56:37.498508
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-16 12:56:37.511437	2010-12-16 12:56:37.524264
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
1	1	dk	Et aut quia temporibus ut.Consequuntur et at nesciunt voluptatem dolorem quas repellendus molestiae.	Et exercitationem et sit quis tempore aut voluptas.Itaque qui aliquam ex nesciunt consequuntur cupiditate enim.	Big deal on printers	2010-12-16 12:56:38.006688	2010-12-16 12:56:38.006688
2	2	dk	Quam dolores perferendis qui iure dolores natus.Et sequi perferendis voluptatem et expedita.	Vel repellat consequuntur expedita rem aut nihil dolor.Quas aperiam occaecati veniam iusto porro.	Drills required	2010-12-16 12:56:38.079498	2010-12-16 12:56:38.079498
3	3	dk	Impedit et qui et quae autem.Quisquam occaecati libero quaerat quas placeat et nam temporibus.	Rerum ipsum ad repellat error non qui.Mollitia quam aut soluta facilis tenetur.	Need assistance in selling a car	2010-12-16 12:56:38.279062	2010-12-16 12:56:38.279062
4	4	dk	Molestiae assumenda veniam autem ipsam alias voluptates facilis incidunt.Atque aut aut accusantium dolor corporis.	Sint enim quae voluptatem illo hic laudantium.Illo qui nostrum quibusdam quam occaecati non.	Ipod shipment	2010-12-16 12:56:38.351356	2010-12-16 12:56:38.351356
5	5	dk	Ratione non ducimus ad illum aliquid non deserunt earum.Et labore et inventore debitis quam ut et.	Dolorem voluptatem est laborum.Debitis rem corrupti est delectus.	Trip to amazonia - looking for offer	2010-12-16 12:56:38.42217	2010-12-16 12:56:38.42217
6	6	dk	Aliquam repellat cum itaque qui provident et totam.Hic quidem itaque aut et.	Officiis ipsa qui quo quas autem.Magnam fugit neque qui qui iure magni odio quos.	LCD - Huge amounts	2010-12-16 12:56:38.492376	2010-12-16 12:56:38.492376
7	7	dk	Ut expedita nam omnis voluptas qui suscipit quod quasi.Omnis est dolor doloremque fugit voluptas ad rerum sit.	Sit perferendis libero dolore.Reprehenderit et tempore ut.	GPS receivers required	2010-12-16 12:56:38.561043	2010-12-16 12:56:38.561043
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Et exercitationem et sit quis tempore aut voluptas.Itaque qui aliquam ex nesciunt consequuntur cupiditate enim.	Et aut quia temporibus ut.Consequuntur et at nesciunt voluptatem dolorem quas repellendus molestiae.	2	User::Agent	0	522.0	72.0	1	Yost	Rolando Schaden	096-144-3782 x33591	jaclyn.volkman@hansen.name	934 Cordell Flat	2010-12-16 12:56:37.966727	2010-12-16 12:56:37.966727	2010-12-21	Nadia129250419789583 Heathcote	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Vel repellat consequuntur expedita rem aut nihil dolor.Quas aperiam occaecati veniam iusto porro.	Quam dolores perferendis qui iure dolores natus.Et sequi perferendis voluptatem et expedita.	2	User::Agent	0	760.0	513.0	1	Schaefer	Mrs. Fatima Dicki	(596)408-8272 x1031	dusty.bogan@lindkuphal.us	677 Nitzsche Stravenue	2010-12-16 12:56:38.047735	2010-12-16 12:56:38.047735	2010-12-21	Nadia129250419789583 Heathcote	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Rerum ipsum ad repellat error non qui.Mollitia quam aut soluta facilis tenetur.	Impedit et qui et quae autem.Quisquam occaecati libero quaerat quas placeat et nam temporibus.	2	User::Agent	0	575.0	811.0	1	Braun	Leland Powlowski	1-737-020-3427	trevor_koss@hintz.ca	9853 Rice Summit	2010-12-16 12:56:38.117336	2010-12-16 12:56:38.117336	2010-12-21	Nadia129250419789583 Heathcote	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Sint enim quae voluptatem illo hic laudantium.Illo qui nostrum quibusdam quam occaecati non.	Molestiae assumenda veniam autem ipsam alias voluptates facilis incidunt.Atque aut aut accusantium dolor corporis.	2	User::Agent	0	842.0	939.0	1	Effertz	Candida Padberg	276-663-0515 x012	eliza_graham@brown.info	35923 Prohaska Hill	2010-12-16 12:56:38.319155	2010-12-16 12:56:38.319155	2010-12-21	Nadia129250419789583 Heathcote	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Dolorem voluptatem est laborum.Debitis rem corrupti est delectus.	Ratione non ducimus ad illum aliquid non deserunt earum.Et labore et inventore debitis quam ut et.	2	User::Agent	0	688.0	348.0	1	Emardmckenzie	May Purdy	(617)781-7912 x7359	lemuel@romaguera.uk	725 Schinner Throughway	2010-12-16 12:56:38.390179	2010-12-16 12:56:38.390179	2010-12-21	Nadia129250419789583 Heathcote	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Officiis ipsa qui quo quas autem.Magnam fugit neque qui qui iure magni odio quos.	Aliquam repellat cum itaque qui provident et totam.Hic quidem itaque aut et.	2	User::Agent	0	3.0	357.0	1	Keelinglarson	Dortha Herman	789.556.1134	emory@kulasbernier.uk	769 Franco Stravenue	2010-12-16 12:56:38.460138	2010-12-16 12:56:38.460138	2010-12-21	Nadia129250419789583 Heathcote	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Sit perferendis libero dolore.Reprehenderit et tempore ut.	Ut expedita nam omnis voluptas qui suscipit quod quasi.Omnis est dolor doloremque fugit voluptas ad rerum sit.	2	User::Agent	0	702.0	812.0	1	Bailey	Heath Kihn	116-779-8246 x99185	kayden.mueller@volkman.com	0267 Reilly Forks	2010-12-16 12:56:38.529357	2010-12-16 12:56:38.529357	2010-12-21	Nadia129250419789583 Heathcote	1	t	\N	0	0	f	f	-1	7
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
1	default_payout_delay	--- 0\n	2010-12-16 12:56:37.280536	2010-12-16 12:56:37.280536
2	default_leads_per_page	--- 5\n	2010-12-16 12:56:37.286316	2010-12-16 12:56:37.286316
3	certification_level_1	--- 10\n	2010-12-16 12:56:37.288738	2010-12-16 12:56:37.288738
4	certification_level_2	--- 20\n	2010-12-16 12:56:37.290842	2010-12-16 12:56:37.290842
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-16 12:56:37.292928	2010-12-16 12:56:37.292928
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
1	blazejek@gmail.com	cfa70e285368eeb5f301fc1e9631c3a3c459f50ee005bbb92f0d38d7bd9de63398a855acee7b4769b01a2ed482ba6887ce1342d9ea7f7fa4afc2be2abd8b4c79	TMmBDCO0TVdr1-dpg8FW	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-16 12:56:37.621538	2010-12-16 12:56:37.561284	\N	2010-12-16 12:56:37.5615	2010-12-16 12:56:37.621855	1	Ivah	Conroy	054-967-1986 x6798	root	McLaughlin Village	West Ariane	88252	Gwent	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Srnm6cerKCAxWqLKglYLCJFJH1w3iI9IiKzs05K4NPX4EHynuTtLLIdL7BqzUt	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	339f017e51380cdcff9aa9c2e752442113a44b61cb89909431d529d4ba573b925e9e1f19db3f87c145bfeb59b44191ec2031b935174047b2838b75867dc8182e	jRmls7hUwf-3R1b1hU0I	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-16 12:56:37.925767	2010-12-16 12:56:37.903437	\N	2010-12-16 12:56:37.903645	2010-12-16 12:56:37.926062	2	Nadia129250419789583	Heathcote	495.417.1689	Maud Sanford II129250419789542	Justina Green	East Verdafurt	55330	Surrey	3	\N	0	\N	\N	0	\N	\N	\N	\N	64neFuH3jib3r7tf9vtKt7QdJxgBYWwKARys2TAz1tE1xlGUyjUDzyjkCwKtb5	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	39ce203d050cdb0859d0c8388fefb90af99c5ca93cac99c0887116ce5dc44c9ef9ebab6fbc3a835de245bd78dc1f20c1e4791ce443742b5f62e4bb5ec8ae0d69	ELz1xMfCk7--ckaHi86F	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-16 12:56:38.76972	2010-12-16 12:56:38.748861	\N	2010-12-16 12:56:38.749073	2010-12-16 12:56:38.769996	1	Leonel	Homenick	(772)377-4880 x314	Rocio Kohler129250419874411	Louisa Trafficway	Port Efren	26204-4988	Hampshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	L6a2wTkAYGuJ7ssksZzC4gqeC5GYG4oLpEVOGYMWlaBczjKRQ4td5IQTYzsvoX	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	097e27f2db3ac33f57af32cd7d91c5481b7a4a20119f8e151a5858b1a1bfe057e234abf34211d684535fc96a36b867b9fc24a6dc15f34da73ca71eee09b4128e	igDfX158mRel9KGQUCgt	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-16 12:56:38.824993	2010-12-16 12:56:38.800733	\N	2010-12-16 12:56:38.800964	2010-12-16 12:56:38.825284	48	Green	Powlowski	1-693-960-5487 x83097	Katlyn Ritchie12925041987955	Marcel Center	Port Gwen	46966	West Midlands	1	\N	\N	\N	\N	0	\N	\N	\N	\N	d3m96tZqV46yzD5xwq7phUtzMJlUQ8JgGRH9A6ZSUtGBfFfddzdM1cSnctnvsX	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	89c285853e502dda94181385081818ca6a050788b8a34aff56a02cb6971eec2aadcef801bdeb20ff2a885ca47dcdcd29b6c2ffa40e7091e6b13486441f9502d9	ZqTOtQNUH8Kha8qdCiB5	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-16 12:56:38.878813	2010-12-16 12:56:38.856623	\N	2010-12-16 12:56:38.856847	2010-12-16 12:56:38.893055	64	Waylon	Green	879.566.4892 x6401	Merl Schmeler129250419885134	Bridgette Unions	Kimberlyfort	23710-6183	County Tyrone	1	\N	\N	4	\N	0	\N	\N	\N	\N	Ar8DBIeteDKjUxhHDr2hjgptOh0bkvRmxZ5K0Mqryx58S18bJqJIvS3fBmwyqM	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

