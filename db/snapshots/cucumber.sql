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
1	1	dk	About us	About us	2010-12-15 13:40:49.303414	2010-12-15 13:40:49.303414
2	1	en	About us	About us	2010-12-15 13:40:49.319369	2010-12-15 13:40:49.319369
3	2	dk	Privacy	Privacy	2010-12-15 13:40:49.350058	2010-12-15 13:40:49.350058
4	2	en	Privacy	Privacy	2010-12-15 13:40:49.362757	2010-12-15 13:40:49.362757
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-15 13:40:49.393816	2010-12-15 13:40:49.393816
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-15 13:40:49.407399	2010-12-15 13:40:49.407399
7	4	dk	Blurb sign up	Blurb sign up	2010-12-15 13:40:49.435852	2010-12-15 13:40:49.435852
8	4	en	Blurb sign up	Blurb sign up	2010-12-15 13:40:49.448073	2010-12-15 13:40:49.448073
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-15 13:40:49.607089	2010-12-15 13:40:49.607089
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-15 13:40:49.620562	2010-12-15 13:40:49.620562
11	6	dk	Blurb agent home	Blurb agent home	2010-12-15 13:40:49.650219	2010-12-15 13:40:49.650219
12	6	en	Blurb agent home	Blurb agent home	2010-12-15 13:40:49.663269	2010-12-15 13:40:49.663269
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-15 13:40:49.692042	2010-12-15 13:40:49.692042
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-15 13:40:49.709053	2010-12-15 13:40:49.709053
15	8	dk	Blurb currencies	Blurb currencies	2010-12-15 13:40:49.738009	2010-12-15 13:40:49.738009
16	8	en	Blurb currencies	Blurb currencies	2010-12-15 13:40:49.751396	2010-12-15 13:40:49.751396
17	9	dk	Reset password	Reset password	2010-12-15 13:40:49.779692	2010-12-15 13:40:49.779692
18	9	en	Reset password	Reset password	2010-12-15 13:40:49.791812	2010-12-15 13:40:49.791812
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-15 13:40:49.294994	2010-12-15 13:40:49.32251	about_us	0	t	2010-12-15 13:40:49.32243
2	Article::Cms	2010-12-15 13:40:49.345912	2010-12-15 13:40:49.365768	privacy	0	t	2010-12-15 13:40:49.365696
3	Article::Cms	2010-12-15 13:40:49.389694	2010-12-15 13:40:49.410499	terms_conditions	0	t	2010-12-15 13:40:49.410423
4	Article::Cms	2010-12-15 13:40:49.431888	2010-12-15 13:40:49.451087	blurb_sign_up	1	t	2010-12-15 13:40:49.45101
5	Article::Cms	2010-12-15 13:40:49.602347	2010-12-15 13:40:49.624226	blurb_buyer_home	1	t	2010-12-15 13:40:49.624142
6	Article::Cms	2010-12-15 13:40:49.646177	2010-12-15 13:40:49.666251	blurb_agent_home	1	t	2010-12-15 13:40:49.66618
7	Article::Cms	2010-12-15 13:40:49.687901	2010-12-15 13:40:49.712433	blurb_start_page_role_selection	1	t	2010-12-15 13:40:49.71234
8	Article::Cms	2010-12-15 13:40:49.733968	2010-12-15 13:40:49.754474	blurb_currencies	1	t	2010-12-15 13:40:49.754401
9	Article::Cms	2010-12-15 13:40:49.77584	2010-12-15 13:40:49.794851	reset_password	2	t	2010-12-15 13:40:49.794781
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked) FROM stdin;
1	Electronics	Velit voluptatem autem deserunt.Libero in asperiores consequuntur dicta veritatis dolore et.	2010-12-15 13:40:48.118957	2010-12-15 13:40:48.118957	\N	1	2	\N	0	1-electronics	f
2	Leisure	Qui enim id dolor enim rerum beatae iusto quisquam.Quaerat quo quis eum enim omnis.	2010-12-15 13:40:48.162573	2010-12-15 13:40:48.162573	\N	3	4	\N	0	2-leisure	f
3	Business	Autem perferendis totam eius placeat.Sed et eveniet quia beatae.	2010-12-15 13:40:48.19521	2010-12-15 13:40:48.8832	\N	5	6	\N	7	3-business	f
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
1	1	en	Velit voluptatem autem deserunt.Libero in asperiores consequuntur dicta veritatis dolore et.	Electronics	2010-12-15 13:40:48.127822	2010-12-15 13:40:48.127822
2	1	dk	\N	Electronics	2010-12-15 13:40:48.153091	2010-12-15 13:40:48.153091
3	2	en	Qui enim id dolor enim rerum beatae iusto quisquam.Quaerat quo quis eum enim omnis.	Leisure	2010-12-15 13:40:48.167189	2010-12-15 13:40:48.167189
4	2	dk	\N	Leisure	2010-12-15 13:40:48.185928	2010-12-15 13:40:48.185928
5	3	en	Autem perferendis totam eius placeat.Sed et eveniet quia beatae.	Business	2010-12-15 13:40:48.20049	2010-12-15 13:40:48.20049
6	3	dk	\N	Business	2010-12-15 13:40:48.338301	2010-12-15 13:40:48.338301
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-15 13:40:47.664363	2010-12-15 13:40:47.664363
2	United Kingdom	2010-12-15 13:40:47.669106	2010-12-15 13:40:47.669106
3	Scotland129242044836224	2010-12-15 13:40:48.36356	2010-12-15 13:40:48.36356
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
1	tempore	&euro;	%u%n	t	2010-12-15 13:40:48.422056	2010-12-15 13:40:48.422056
2	consequatur	&euro;	%u%n	t	2010-12-15 13:40:48.484961	2010-12-15 13:40:48.484961
3	voluptas	&pound;	%u%n	t	2010-12-15 13:40:48.535287	2010-12-15 13:40:48.535287
4	eaque	&pound;	%u%n	t	2010-12-15 13:40:48.585025	2010-12-15 13:40:48.585025
5	aut	&euro;	%u%n	t	2010-12-15 13:40:48.634446	2010-12-15 13:40:48.634446
6	quo	&euro;	%u%n	t	2010-12-15 13:40:48.81036	2010-12-15 13:40:48.81036
7	voluptatem	$	%u%n	t	2010-12-15 13:40:48.861252	2010-12-15 13:40:48.861252
8	Euro	&euro;	%u%n	t	2010-12-15 13:40:49.81128	2010-12-15 13:40:49.81128
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-15 13:40:47.694985	2010-12-15 13:40:47.694985
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-15 13:40:47.714124	2010-12-15 13:40:47.714124
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-15 13:40:47.844231	2010-12-15 13:40:47.844231
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-15 13:40:47.856274	2010-12-15 13:40:47.856274
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-15 13:40:47.868375	2010-12-15 13:40:47.868375
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-15 13:40:47.880214	2010-12-15 13:40:47.880214
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-15 13:40:47.892345	2010-12-15 13:40:47.892345
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-15 13:40:47.904431	2010-12-15 13:40:47.904431
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-15 13:40:47.917011	2010-12-15 13:40:47.917011
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-15 13:40:47.928841	2010-12-15 13:40:47.928841
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-15 13:40:47.94116	2010-12-15 13:40:47.94116
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-15 13:40:47.953239	2010-12-15 13:40:47.953239
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-15 13:40:47.968224	2010-12-15 13:40:47.968224
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-15 13:40:47.980739	2010-12-15 13:40:47.980739
15	8	en	Question	<p></p>	2010-12-15 13:40:47.993164	2010-12-15 13:40:47.993164
16	8	dk	[DK] Question	<p></p>	2010-12-15 13:40:48.005596	2010-12-15 13:40:48.005596
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-15 13:40:47.685861	2010-12-15 13:40:47.709558
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-15 13:40:47.839402	2010-12-15 13:40:47.852071
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-15 13:40:47.863914	2010-12-15 13:40:47.876144
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-15 13:40:47.888017	2010-12-15 13:40:47.900256
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-15 13:40:47.912274	2010-12-15 13:40:47.924758
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-15 13:40:47.936779	2010-12-15 13:40:47.949002
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-15 13:40:47.963569	2010-12-15 13:40:47.976476
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-15 13:40:47.988722	2010-12-15 13:40:48.001288
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
1	1	dk	Cumque voluptates hic minima impedit at minus consequatur.Ducimus eaque alias facere vitae.	Est dolore sunt atque qui rerum quae et qui.Assumenda autem quaerat aut porro expedita reiciendis aut molestiae.	Big deal on printers	2010-12-15 13:40:48.460637	2010-12-15 13:40:48.460637
2	2	dk	Rerum aut non quas.Praesentium quo aut aut ullam dolorum enim ut.	Impedit error aliquam assumenda quaerat.Voluptas sint nemo a aut veritatis sequi praesentium quis.	Drills required	2010-12-15 13:40:48.513885	2010-12-15 13:40:48.513885
3	3	dk	Dolores pariatur cum modi illo placeat quia eius.Velit est consectetur perferendis nam dignissimos molestiae dicta magni.	Dolores voluptatem amet voluptatibus fugit eum.Ut provident quo aliquam consectetur qui.	Need assistance in selling a car	2010-12-15 13:40:48.563412	2010-12-15 13:40:48.563412
4	4	dk	Officiis a nesciunt quia.Rerum velit sit dolorem dolor officia est.	Soluta reiciendis iusto distinctio provident odit animi.Ipsum non magnam magni.	Ipod shipment	2010-12-15 13:40:48.613048	2010-12-15 13:40:48.613048
5	5	dk	Blanditiis laboriosam nobis quasi id.Hic in expedita eum aliquid.	Nihil et ipsum ducimus nesciunt possimus molestiae temporibus.Suscipit consequuntur modi aut.	Trip to amazonia - looking for offer	2010-12-15 13:40:48.662409	2010-12-15 13:40:48.662409
6	6	dk	Tenetur ducimus soluta labore ratione qui sit iusto.At voluptas et inventore quibusdam repudiandae enim aut eius.	Similique quam sit ut praesentium repellendus.Mollitia quo repellat cupiditate maxime quam.	LCD - Huge amounts	2010-12-15 13:40:48.839428	2010-12-15 13:40:48.839428
7	7	dk	Doloremque molestias beatae rem nihil quae ipsam.Fugit ex corrupti laborum sit.	Nihil libero eum tempore mollitia nesciunt quidem quaerat fugit.Velit quo sint praesentium et autem eligendi.	GPS receivers required	2010-12-15 13:40:48.890182	2010-12-15 13:40:48.890182
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Cumque voluptates hic minima impedit at minus consequatur.Ducimus eaque alias facere vitae.	Est dolore sunt atque qui rerum quae et qui.Assumenda autem quaerat aut porro expedita reiciendis aut molestiae.	2	User::Agent	0	399.0	109.0	1	Herzogbarrows	Gussie Leannon	1-604-130-0941 x11505	chelsie.wilkinson@schadenlarson.us	149 Orin Creek	2010-12-15 13:40:48.431279	2010-12-15 13:40:48.431279	2010-12-20	Georgette129242044836153 Murazik	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Rerum aut non quas.Praesentium quo aut aut ullam dolorum enim ut.	Impedit error aliquam assumenda quaerat.Voluptas sint nemo a aut veritatis sequi praesentium quis.	2	User::Agent	0	444.0	440.0	1	Emard	Amos Rempel	1-266-620-7307	darby@mayerdibbert.biz	730 Tillman Mountain	2010-12-15 13:40:48.491345	2010-12-15 13:40:48.491345	2010-12-20	Georgette129242044836153 Murazik	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Dolores pariatur cum modi illo placeat quia eius.Velit est consectetur perferendis nam dignissimos molestiae dicta magni.	Dolores voluptatem amet voluptatibus fugit eum.Ut provident quo aliquam consectetur qui.	2	User::Agent	0	699.0	625.0	1	Purdy	Gudrun Boehm	766-476-9074	selena@hermistondickens.biz	37778 Dante Curve	2010-12-15 13:40:48.541146	2010-12-15 13:40:48.541146	2010-12-20	Georgette129242044836153 Murazik	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Officiis a nesciunt quia.Rerum velit sit dolorem dolor officia est.	Soluta reiciendis iusto distinctio provident odit animi.Ipsum non magnam magni.	2	User::Agent	0	360.0	792.0	1	Hansen	Gaylord Ward	(044)540-5743	imogene.christiansen@turcotte.uk	77065 Gunner Rest	2010-12-15 13:40:48.590877	2010-12-15 13:40:48.590877	2010-12-20	Georgette129242044836153 Murazik	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Blanditiis laboriosam nobis quasi id.Hic in expedita eum aliquid.	Nihil et ipsum ducimus nesciunt possimus molestiae temporibus.Suscipit consequuntur modi aut.	2	User::Agent	0	759.0	401.0	1	Gorczanybeer	Greyson Murphy	525.485.8335	madonna_powlowski@cartwright.ca	41213 Aniyah Groves	2010-12-15 13:40:48.640252	2010-12-15 13:40:48.640252	2010-12-20	Georgette129242044836153 Murazik	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Tenetur ducimus soluta labore ratione qui sit iusto.At voluptas et inventore quibusdam repudiandae enim aut eius.	Similique quam sit ut praesentium repellendus.Mollitia quo repellat cupiditate maxime quam.	2	User::Agent	0	449.0	577.0	1	Lindgren	Lyric Marks	1-767-414-8105 x813	vinnie@hauckbalistreri.com	75875 Lemke Courts	2010-12-15 13:40:48.816422	2010-12-15 13:40:48.816422	2010-12-20	Georgette129242044836153 Murazik	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Doloremque molestias beatae rem nihil quae ipsam.Fugit ex corrupti laborum sit.	Nihil libero eum tempore mollitia nesciunt quidem quaerat fugit.Velit quo sint praesentium et autem eligendi.	2	User::Agent	0	350.0	825.0	1	Steuber	Morris Lehner	1-130-142-8730 x61035	wayne_jaskolski@huelschroeder.biz	883 Luciano Island	2010-12-15 13:40:48.867372	2010-12-15 13:40:48.867372	2010-12-20	Georgette129242044836153 Murazik	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-15 13:40:47.643937	2010-12-15 13:40:47.643937
2	default_leads_per_page	--- 5\n	2010-12-15 13:40:47.649391	2010-12-15 13:40:47.649391
3	certification_level_1	--- 10\n	2010-12-15 13:40:47.651545	2010-12-15 13:40:47.651545
4	certification_level_2	--- 20\n	2010-12-15 13:40:47.653788	2010-12-15 13:40:47.653788
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-15 13:40:47.655917	2010-12-15 13:40:47.655917
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
1	blazejek@gmail.com	0529326eede98bdc7c76ed1a5fe9e24b3e8a649fbff77b50019a727af98bb83761eb6bd46bbc286c1c5e3f6e331010c3c9615655b1f1b1d4768c48212b63a43d	VjIRkSaaLar3trjp8_rl	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-15 13:40:48.096991	2010-12-15 13:40:48.038569	\N	2010-12-15 13:40:48.038788	2010-12-15 13:40:48.097279	1	Jerel	Gutmann	573.214.2935 x981	root	Bosco Islands	Port Antoinette	61666-8330	Greater Manchester	1	\N	\N	\N	\N	0	\N	\N	\N	\N	FhjshvVFVn7IIwNnJofjd2Tmml82ufB9HWA1icItKrbD95yhUlxAQWDBfRWLBV	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	0a84e6b34ec84433d35eb3c36ca7466748d4ff228f6d74e7a171c111d93fd543965566a380aa35304cdfed0f1a3e8bb74a7efe489f968d9e0890ada62b7f5dcc	ScPMR8AnK0Slvhlr7XWA	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-15 13:40:48.390879	2010-12-15 13:40:48.368745	\N	2010-12-15 13:40:48.368954	2010-12-15 13:40:48.391143	2	Georgette129242044836153	Murazik	1-770-672-7813 x945	Tobin Marks129242044836128	Wiegand Prairie	Chaddstad	54851-1104	Clwyd	3	\N	0	\N	\N	0	\N	\N	\N	\N	elPDw35BSPZ82mjQPO1QOkhfVla6i9DR5m6n4ygsIi40PBdupY5LVEDpI0oBmC	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	abcb4112856bdb4eb92f26f47c1cf1ba8f2988ed16686c5a1dd4a1403ffc8434056f0c37b3f5e8116987919e1c5e33f39951d8552b94c49f57f8573b0d284850	TDgzp7YMogxKu_vOltu8	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-15 13:40:48.956091	2010-12-15 13:40:48.936115	\N	2010-12-15 13:40:48.936334	2010-12-15 13:40:48.956351	1	Fern	Kirlin	(071)076-0094 x077	Dr. Boris Schmeler129242044893178	Dewayne Union	Dorianstad	61284	Northamptonshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	NgGGJdUVwVPaax7VdkX94vOBsSkuPR53IpVKWfonR53xVeD8D4wq5eGQh6kMYx	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	912480f518f68d9a073596ddc132ebc70ce73b7d9c7f30c0c5da20a9d7586d639689ef210055b0d632aedb61019d7fab0fa4e81ed0fa18fdddea14b519aa3bed	bFeYK3m9IPzHUXR28d_g	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-15 13:40:49.006989	2010-12-15 13:40:48.985024	\N	2010-12-15 13:40:48.985249	2010-12-15 13:40:49.007261	48	Cornell	Kunze	(734)489-6987 x651	Felicity Ryan129242044898053	Franecki Cove	Janickville	96370-0537	Dyfed	1	\N	\N	\N	\N	0	\N	\N	\N	\N	LzBUz92cahzC9lgB83LOMRph41Vvj6Gxo0wiBVj1RK5sgX7bi3QE2fySYqPft1	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	422e3391c7c70098a43b01655a16067d76063a4919f7809e227f307469f50b263c8219c2d09d17481827c7d7800dffe04c388032bdadd0f38958aa48f6dd6f65	tBqYspH2awz9tMosqHS_	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-15 13:40:49.058032	2010-12-15 13:40:49.03633	\N	2010-12-15 13:40:49.036544	2010-12-15 13:40:49.071864	64	Vicenta	Schamberger	338.063.8657 x6805	Autumn Lynch129242044903174	Destiny Vista	Arelyville	44997-1168	West Midlands	1	\N	\N	4	\N	0	\N	\N	\N	\N	0DjyCjSmgBg2HAQ3HVijcPEELzKtuQvv1YZUmik1T0yy5AbSVqzIT8gl4PlZpw	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

