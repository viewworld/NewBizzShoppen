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
1	1	dk	About us	About us	2010-12-13 15:08:48.396442	2010-12-13 15:08:48.396442
2	1	en	About us	About us	2010-12-13 15:08:48.425366	2010-12-13 15:08:48.425366
3	2	dk	Privacy	Privacy	2010-12-13 15:08:48.478366	2010-12-13 15:08:48.478366
4	2	en	Privacy	Privacy	2010-12-13 15:08:48.496669	2010-12-13 15:08:48.496669
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-13 15:08:48.547075	2010-12-13 15:08:48.547075
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-13 15:08:48.567514	2010-12-13 15:08:48.567514
7	4	dk	Blurb sign up	Blurb sign up	2010-12-13 15:08:48.614312	2010-12-13 15:08:48.614312
8	4	en	Blurb sign up	Blurb sign up	2010-12-13 15:08:48.635465	2010-12-13 15:08:48.635465
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-13 15:08:48.675536	2010-12-13 15:08:48.675536
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-13 15:08:48.695992	2010-12-13 15:08:48.695992
11	6	dk	Blurb agent home	Blurb agent home	2010-12-13 15:08:48.73762	2010-12-13 15:08:48.73762
12	6	en	Blurb agent home	Blurb agent home	2010-12-13 15:08:48.760558	2010-12-13 15:08:48.760558
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-13 15:08:48.808823	2010-12-13 15:08:48.808823
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-13 15:08:48.829106	2010-12-13 15:08:48.829106
15	8	dk	Blurb currencies	Blurb currencies	2010-12-13 15:08:48.869356	2010-12-13 15:08:48.869356
16	8	en	Blurb currencies	Blurb currencies	2010-12-13 15:08:48.894525	2010-12-13 15:08:48.894525
17	9	dk	Reset password	Reset password	2010-12-13 15:08:48.93398	2010-12-13 15:08:48.93398
18	9	en	Reset password	Reset password	2010-12-13 15:08:48.956014	2010-12-13 15:08:48.956014
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-13 15:08:48.385136	2010-12-13 15:08:48.432248	about_us	0	t	2010-12-13 15:08:48.43214
2	Article::Cms	2010-12-13 15:08:48.47066	2010-12-13 15:08:48.50462	privacy	0	t	2010-12-13 15:08:48.504517
3	Article::Cms	2010-12-13 15:08:48.541125	2010-12-13 15:08:48.573497	terms_conditions	0	t	2010-12-13 15:08:48.573381
4	Article::Cms	2010-12-13 15:08:48.607893	2010-12-13 15:08:48.641172	blurb_sign_up	1	t	2010-12-13 15:08:48.641074
5	Article::Cms	2010-12-13 15:08:48.669027	2010-12-13 15:08:48.702983	blurb_buyer_home	1	t	2010-12-13 15:08:48.70289
6	Article::Cms	2010-12-13 15:08:48.73263	2010-12-13 15:08:48.768026	blurb_agent_home	1	t	2010-12-13 15:08:48.767924
7	Article::Cms	2010-12-13 15:08:48.804005	2010-12-13 15:08:48.834889	blurb_start_page_role_selection	1	t	2010-12-13 15:08:48.83479
8	Article::Cms	2010-12-13 15:08:48.864463	2010-12-13 15:08:48.90094	blurb_currencies	1	t	2010-12-13 15:08:48.900846
9	Article::Cms	2010-12-13 15:08:48.92862	2010-12-13 15:08:48.962892	reset_password	2	t	2010-12-13 15:08:48.962785
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
1	Electronics	Ex est ullam soluta magni neque harum rerum laborum.Eum aut atque nam architecto voluptatum.	2010-12-13 15:08:46.911866	2010-12-13 15:08:46.911866	\N	1	2	\N	0	1-electronics
2	Leisure	Fuga enim et at ut quo.Ea sunt quisquam beatae eveniet hic aut corporis non.	2010-12-13 15:08:46.976902	2010-12-13 15:08:46.976902	\N	3	4	\N	0	2-leisure
3	Business	Qui quisquam similique vel.Ea placeat labore voluptatem.	2010-12-13 15:08:47.032455	2010-12-13 15:08:47.988712	\N	5	6	\N	7	3-business
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
1	1	en	Ex est ullam soluta magni neque harum rerum laborum.Eum aut atque nam architecto voluptatum.	Electronics	2010-12-13 15:08:46.925242	2010-12-13 15:08:46.925242
2	1	dk	\N	Electronics	2010-12-13 15:08:46.962302	2010-12-13 15:08:46.962302
3	2	en	Fuga enim et at ut quo.Ea sunt quisquam beatae eveniet hic aut corporis non.	Leisure	2010-12-13 15:08:46.983109	2010-12-13 15:08:46.983109
4	2	dk	\N	Leisure	2010-12-13 15:08:47.0164	2010-12-13 15:08:47.0164
5	3	en	Qui quisquam similique vel.Ea placeat labore voluptatem.	Business	2010-12-13 15:08:47.038588	2010-12-13 15:08:47.038588
6	3	dk	\N	Business	2010-12-13 15:08:47.068247	2010-12-13 15:08:47.068247
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-13 15:08:46.357093	2010-12-13 15:08:46.357093
2	United Kingdom	2010-12-13 15:08:46.366513	2010-12-13 15:08:46.366513
3	England129225292710015	2010-12-13 15:08:47.101826	2010-12-13 15:08:47.101826
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
1	quas	$	%u%n	t	2010-12-13 15:08:47.195153	2010-12-13 15:08:47.195153
2	nisi	$	%u%n	t	2010-12-13 15:08:47.287673	2010-12-13 15:08:47.287673
3	in	$	%u%n	t	2010-12-13 15:08:47.36898	2010-12-13 15:08:47.36898
4	impedit	$	%u%n	t	2010-12-13 15:08:47.710692	2010-12-13 15:08:47.710692
5	nam	&euro;	%u%n	t	2010-12-13 15:08:47.796575	2010-12-13 15:08:47.796575
6	in	&pound;	%u%n	t	2010-12-13 15:08:47.870803	2010-12-13 15:08:47.870803
7	et	$	%u%n	t	2010-12-13 15:08:47.953897	2010-12-13 15:08:47.953897
8	Euro	&euro;	%u%n	t	2010-12-13 15:08:48.986476	2010-12-13 15:08:48.986476
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2010-12-13 15:08:46.40697	2010-12-13 15:08:46.40697
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2010-12-13 15:08:46.433873	2010-12-13 15:08:46.433873
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2010-12-13 15:08:46.458218	2010-12-13 15:08:46.458218
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2010-12-13 15:08:46.485729	2010-12-13 15:08:46.485729
5	3	en	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	Somebody shared leads with you	2010-12-13 15:08:46.504867	2010-12-13 15:08:46.504867
6	3	dk	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	[DK] Somebody shared leads with you	2010-12-13 15:08:46.525978	2010-12-13 15:08:46.525978
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2010-12-13 15:08:46.548405	2010-12-13 15:08:46.548405
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2010-12-13 15:08:46.567005	2010-12-13 15:08:46.567005
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2010-12-13 15:08:46.585709	2010-12-13 15:08:46.585709
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2010-12-13 15:08:46.606048	2010-12-13 15:08:46.606048
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2010-12-13 15:08:46.626746	2010-12-13 15:08:46.626746
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2010-12-13 15:08:46.646875	2010-12-13 15:08:46.646875
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2010-12-13 15:08:46.670294	2010-12-13 15:08:46.670294
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2010-12-13 15:08:46.690211	2010-12-13 15:08:46.690211
15	8	en	<p></p>	Question	2010-12-13 15:08:46.716486	2010-12-13 15:08:46.716486
16	8	dk	<p></p>	[DK] Question	2010-12-13 15:08:46.734774	2010-12-13 15:08:46.734774
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-13 15:08:46.395395	2010-12-13 15:08:46.426697
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-13 15:08:46.450208	2010-12-13 15:08:46.478781
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-13 15:08:46.499127	2010-12-13 15:08:46.520535
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-13 15:08:46.540897	2010-12-13 15:08:46.561396
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-13 15:08:46.579932	2010-12-13 15:08:46.600626
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-13 15:08:46.620172	2010-12-13 15:08:46.639465
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-13 15:08:46.661364	2010-12-13 15:08:46.684617
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-13 15:08:46.710667	2010-12-13 15:08:46.729359
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
1	1	dk	Minima animi corrupti autem.Totam adipisci soluta molestias neque dolores ut quos.	Sapiente inventore corporis occaecati omnis.Quia voluptatem accusantium totam qui voluptatem ratione dolorum.	Big deal on printers	2010-12-13 15:08:47.250139	2010-12-13 15:08:47.250139
2	2	dk	Quibusdam et quidem laborum vitae maiores hic ut facilis.Repellat eaque placeat et quam ratione rerum quis.	Dignissimos ullam doloremque impedit blanditiis hic quaerat.Esse culpa aliquid iste dolor illo aut.	Drills required	2010-12-13 15:08:47.33473	2010-12-13 15:08:47.33473
3	3	dk	Et non autem id.Nihil repellendus aut ducimus.	Voluptatem vero hic incidunt aut praesentium assumenda vitae.Voluptate sunt labore expedita aut harum.	Need assistance in selling a car	2010-12-13 15:08:47.414235	2010-12-13 15:08:47.414235
4	4	dk	Aut sunt ut unde alias est aperiam.Iure deleniti aliquam ad qui.	Aut temporibus dolores libero voluptatum odit.Ad non natus sapiente quia itaque laborum.	Ipod shipment	2010-12-13 15:08:47.7646	2010-12-13 15:08:47.7646
5	5	dk	Ullam minus dolore officiis sed quae ipsum.Aliquam et soluta reprehenderit in nobis.	Nemo cumque natus at pariatur quis.Vitae dolorum vel et.	Trip to amazonia - looking for offer	2010-12-13 15:08:47.836066	2010-12-13 15:08:47.836066
6	6	dk	Laudantium ut nam voluptas aliquid.Ut neque velit eaque hic consequuntur sed.	Non necessitatibus sed vero optio sit repellat eius eos.Libero eveniet ut impedit soluta assumenda optio.	LCD - Huge amounts	2010-12-13 15:08:47.912649	2010-12-13 15:08:47.912649
7	7	dk	Qui ut eos amet omnis.Eveniet voluptatibus sed sunt distinctio ullam.	Quo quidem praesentium qui.In ipsa ut rerum et.	GPS receivers required	2010-12-13 15:08:48.000909	2010-12-13 15:08:48.000909
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Minima animi corrupti autem.Totam adipisci soluta molestias neque dolores ut quos.	Sapiente inventore corporis occaecati omnis.Quia voluptatem accusantium totam qui voluptatem ratione dolorum.	2	User::Agent	0	174.0	333.0	1	Hegmannmarquardt	Golden Dare	982.922.8995 x41383	fredy@crist.ca	45587 Jacobs Cape	2010-12-13 15:08:47.209477	2010-12-13 15:08:47.209477	2010-12-18	Domenica129225292709889 Littel	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Quibusdam et quidem laborum vitae maiores hic ut facilis.Repellat eaque placeat et quam ratione rerum quis.	Dignissimos ullam doloremque impedit blanditiis hic quaerat.Esse culpa aliquid iste dolor illo aut.	2	User::Agent	0	748.0	0.0	1	Pollichledner	Mr. Lavada Witting	1-124-343-9891 x42703	catharine.collier@dach.ca	1921 Bette Center	2010-12-13 15:08:47.303524	2010-12-13 15:08:47.303524	2010-12-18	Domenica129225292709889 Littel	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Et non autem id.Nihil repellendus aut ducimus.	Voluptatem vero hic incidunt aut praesentium assumenda vitae.Voluptate sunt labore expedita aut harum.	2	User::Agent	0	239.0	237.0	1	Willms	Florence Kautzer	(054)947-5399 x0778	brody_schowalter@volkman.com	78386 Farrell Dam	2010-12-13 15:08:47.378698	2010-12-13 15:08:47.378698	2010-12-18	Domenica129225292709889 Littel	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Aut sunt ut unde alias est aperiam.Iure deleniti aliquam ad qui.	Aut temporibus dolores libero voluptatum odit.Ad non natus sapiente quia itaque laborum.	2	User::Agent	0	494.0	381.0	1	Funkhansen	Rahsaan Homenick	675-356-0704	sheldon_ondricka@schillergutmann.ca	80875 Toy Rapid	2010-12-13 15:08:47.722201	2010-12-13 15:08:47.722201	2010-12-18	Domenica129225292709889 Littel	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Ullam minus dolore officiis sed quae ipsum.Aliquam et soluta reprehenderit in nobis.	Nemo cumque natus at pariatur quis.Vitae dolorum vel et.	2	User::Agent	0	947.0	496.0	1	Bashirian	Sanford Thiel	812-244-9866 x1378	raina@bogisich.us	115 Meredith Court	2010-12-13 15:08:47.805613	2010-12-13 15:08:47.805613	2010-12-18	Domenica129225292709889 Littel	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Laudantium ut nam voluptas aliquid.Ut neque velit eaque hic consequuntur sed.	Non necessitatibus sed vero optio sit repellat eius eos.Libero eveniet ut impedit soluta assumenda optio.	2	User::Agent	0	718.0	505.0	1	Waters	Laurence Gottlieb	1-078-288-2261	perry_mohr@reichel.co.uk	83933 Wiegand Key	2010-12-13 15:08:47.881182	2010-12-13 15:08:47.881182	2010-12-18	Domenica129225292709889 Littel	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Qui ut eos amet omnis.Eveniet voluptatibus sed sunt distinctio ullam.	Quo quidem praesentium qui.In ipsa ut rerum et.	2	User::Agent	0	45.0	866.0	1	Hirthe	Mrs. Brandyn Becker	1-993-736-3764 x17500	jabari@schillerhilpert.biz	71644 Esta Wall	2010-12-13 15:08:47.96477	2010-12-13 15:08:47.96477	2010-12-18	Domenica129225292709889 Littel	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-13 15:08:46.30619	2010-12-13 15:08:46.30619
2	default_leads_per_page	--- 5\n	2010-12-13 15:08:46.316253	2010-12-13 15:08:46.316253
3	certification_level_1	--- 10\n	2010-12-13 15:08:46.321264	2010-12-13 15:08:46.321264
4	certification_level_2	--- 20\n	2010-12-13 15:08:46.326818	2010-12-13 15:08:46.326818
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-13 15:08:46.334113	2010-12-13 15:08:46.334113
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
1	blazejek@gmail.com	27a04822fc5d7690fa1447f03f9bd19e5b455ae0ac717ff9f638f032b28359beb7fdb029d1688d5a223280722869458296cefc9999419bf31a10f29a7cd81281	KZNEvxPeHuxQDZbRu1gJ	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-13 15:08:46.863884	2010-12-13 15:08:46.77969	\N	2010-12-13 15:08:46.779987	2010-12-13 15:08:46.866232	1	Clare	Trantow	343.969.4291	root	Carissa Views	Effertzmouth	97049-1443	Cambridgeshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	dstffSzWklKyJLrxH4fD3gHYI74KVnCgWvndVgP003CPhFF6hvZ7kVzluMap46	f	\N	0	0	0	0	0
2	agent@nbs.com	33c89605b9e118232c0c4c3cf365faed2c2f7a2fecc5aba860eb8735e9bb81c598739ddc9325d967a1e9a509cdd895fcf087426a9fe86a6bd7e47428a9fba06b	M7xtGZY0ry2iuHn2H8Cu	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-13 15:08:47.149501	2010-12-13 15:08:47.112113	\N	2010-12-13 15:08:47.112468	2010-12-13 15:08:47.149922	2	Domenica129225292709889	Littel	620.140.5336 x082	Melody Krajcik129225292709833	Everardo Extensions	West Careybury	71624	Leicestershire	3	\N	0	\N	\N	0	\N	\N	\N	\N	kAvTShnBGB2Oa4DlblEdhNOuC1X3Xz8VgI05QOJzoXhkLCfss2YTgzPaG3PTvl	f	\N	0	0	0	0	0
3	admin@nbs.com	8a82f3209f3d08770ded1d74e95b26c41da9f45f3d4834139c6457bf2c87791e101693bac26a39a3c16e17f70a26bb046dcbb4b95eeace2d5cf9269083190e27	vlVlYQ80muPjfjwVLEeU	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-13 15:08:48.113834	2010-12-13 15:08:48.081001	\N	2010-12-13 15:08:48.081342	2010-12-13 15:08:48.114432	1	Terrill	Morar	(424)164-3102 x2567	Mason Quitzon129225292807313	Jenkins Branch	South Pablomouth	78009	Surrey	1	\N	\N	\N	\N	0	\N	\N	\N	\N	0imgAafOsdhgBaQAtEM3eRPCz8nAdip08BuT8YPM2SMjMFVYajYYB4n2LFICg8	f	\N	0	0	0	0	0
4	buyer@nbs.com	2c026cae3360ef6fb06f7ac2da95696ad6560f4a86a5698a2df19d2b75aa00399d509d24a5acd921979bc02807cb5b3db0af53ea8408b996c1e04f60a445bd12	2rX2d_e5oqOaSbWvv0Zm	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-13 15:08:48.183156	2010-12-13 15:08:48.152798	\N	2010-12-13 15:08:48.153087	2010-12-13 15:08:48.183735	48	Jamison	Pagac	739-475-4799 x505	Deontae Ledner129225292814669	Schiller Parkways	New Aric	51961-8396	Staffordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	uCoBxeZbYYEutR1Mt7kdB14dwcPzVHbXjDS7gHOzYUaa77ga9DtYvQLegYaGyH	f	t	0	0	0	0	0
5	leaduser@nbs.com	30355c680f4ace2700e66575db34fb0c71942bfe4f76c5cc55916d6e19565d1d8d553df9614e78e485ade871ab34667ea62d7018d00bc785a6fcd72bbb59e3d9	G4gUzsHGdudNZIPyNsE1	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-13 15:08:48.254177	2010-12-13 15:08:48.222897	\N	2010-12-13 15:08:48.223179	2010-12-13 15:08:48.277323	64	Lauryn	Blanda	1-785-501-6784 x91666	Annamae Dicki129225292821693	Aylin Shoal	Littleshire	50246-3476	Herefordshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	fjKRPd8WNAjk09As0TT6bF9tEatjruLzcfkHRmZxyySPGaeiIKpbRvJlz2Xchh	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

