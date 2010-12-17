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

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2010-12-17 15:54:52.707119	2010-12-17 15:54:52.707119
2	1	en	About us	About us	2010-12-17 15:54:52.732316	2010-12-17 15:54:52.732316
3	2	dk	Privacy	Privacy	2010-12-17 15:54:52.791923	2010-12-17 15:54:52.791923
4	2	en	Privacy	Privacy	2010-12-17 15:54:52.815431	2010-12-17 15:54:52.815431
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-17 15:54:52.878757	2010-12-17 15:54:52.878757
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-17 15:54:53.034317	2010-12-17 15:54:53.034317
7	4	dk	Blurb sign up	Blurb sign up	2010-12-17 15:54:53.08216	2010-12-17 15:54:53.08216
8	4	en	Blurb sign up	Blurb sign up	2010-12-17 15:54:53.109379	2010-12-17 15:54:53.109379
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-17 15:54:53.182029	2010-12-17 15:54:53.182029
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-17 15:54:53.212876	2010-12-17 15:54:53.212876
11	6	dk	Blurb agent home	Blurb agent home	2010-12-17 15:54:53.268635	2010-12-17 15:54:53.268635
12	6	en	Blurb agent home	Blurb agent home	2010-12-17 15:54:53.287994	2010-12-17 15:54:53.287994
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-17 15:54:53.33222	2010-12-17 15:54:53.33222
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-17 15:54:53.355184	2010-12-17 15:54:53.355184
15	8	dk	Blurb currencies	Blurb currencies	2010-12-17 15:54:53.40179	2010-12-17 15:54:53.40179
16	8	en	Blurb currencies	Blurb currencies	2010-12-17 15:54:53.424067	2010-12-17 15:54:53.424067
17	9	dk	Reset password	Reset password	2010-12-17 15:54:53.479381	2010-12-17 15:54:53.479381
18	9	en	Reset password	Reset password	2010-12-17 15:54:53.506941	2010-12-17 15:54:53.506941
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-17 15:54:52.696539	2010-12-17 15:54:52.739092	about_us	0	t	2010-12-17 15:54:52.738992
2	Article::Cms	2010-12-17 15:54:52.783917	2010-12-17 15:54:52.825429	privacy	0	t	2010-12-17 15:54:52.82524
3	Article::Cms	2010-12-17 15:54:52.872154	2010-12-17 15:54:53.040405	terms_conditions	0	t	2010-12-17 15:54:53.040301
4	Article::Cms	2010-12-17 15:54:53.076865	2010-12-17 15:54:53.11702	blurb_sign_up	1	t	2010-12-17 15:54:53.116835
5	Article::Cms	2010-12-17 15:54:53.173429	2010-12-17 15:54:53.222206	blurb_buyer_home	1	t	2010-12-17 15:54:53.222048
6	Article::Cms	2010-12-17 15:54:53.263224	2010-12-17 15:54:53.293776	blurb_agent_home	1	t	2010-12-17 15:54:53.293676
7	Article::Cms	2010-12-17 15:54:53.326924	2010-12-17 15:54:53.361022	blurb_start_page_role_selection	1	t	2010-12-17 15:54:53.360921
8	Article::Cms	2010-12-17 15:54:53.395635	2010-12-17 15:54:53.430613	blurb_currencies	1	t	2010-12-17 15:54:53.430506
9	Article::Cms	2010-12-17 15:54:53.472705	2010-12-17 15:54:53.514091	reset_password	2	t	2010-12-17 15:54:53.513993
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, published_leads_count) FROM stdin;
1	Electronics	Ad ratione officiis fugit non vitae dolor et ipsa.A ullam eveniet optio qui soluta vitae non.	2010-12-17 15:54:50.733239	2010-12-17 15:54:50.733239	\N	1	2	\N	0	1-electronics	0
2	Leisure	Est officiis illo molestiae.Repellendus quia placeat enim dolores.	2010-12-17 15:54:50.839795	2010-12-17 15:54:50.839795	\N	3	4	\N	0	2-leisure	0
3	Business	Qui suscipit quisquam officia at rerum autem ipsum consequuntur.Soluta error unde eos.	2010-12-17 15:54:50.909666	2010-12-17 15:54:52.101108	\N	5	6	\N	7	3-business	7
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
1	1	en	Ad ratione officiis fugit non vitae dolor et ipsa.A ullam eveniet optio qui soluta vitae non.	Electronics	2010-12-17 15:54:50.756264	2010-12-17 15:54:50.756264
2	1	dk	\N	Electronics	2010-12-17 15:54:50.813543	2010-12-17 15:54:50.813543
3	2	en	Est officiis illo molestiae.Repellendus quia placeat enim dolores.	Leisure	2010-12-17 15:54:50.848207	2010-12-17 15:54:50.848207
4	2	dk	\N	Leisure	2010-12-17 15:54:50.882833	2010-12-17 15:54:50.882833
5	3	en	Qui suscipit quisquam officia at rerum autem ipsum consequuntur.Soluta error unde eos.	Business	2010-12-17 15:54:50.918376	2010-12-17 15:54:50.918376
6	3	dk	\N	Business	2010-12-17 15:54:50.95632	2010-12-17 15:54:50.95632
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-17 15:54:50.05068	2010-12-17 15:54:50.05068
2	United Kingdom	2010-12-17 15:54:50.060243	2010-12-17 15:54:50.060243
3	Wales129260129100018	2010-12-17 15:54:51.00193	2010-12-17 15:54:51.00193
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
1	dolores	&pound;	%u%n	t	2010-12-17 15:54:51.232851	2010-12-17 15:54:51.232851
2	rerum	&euro;	%u%n	t	2010-12-17 15:54:51.375678	2010-12-17 15:54:51.375678
3	autem	&pound;	%u%n	t	2010-12-17 15:54:51.482278	2010-12-17 15:54:51.482278
4	aut	$	%u%n	t	2010-12-17 15:54:51.58455	2010-12-17 15:54:51.58455
5	voluptas	$	%u%n	t	2010-12-17 15:54:51.699182	2010-12-17 15:54:51.699182
6	nam	&euro;	%u%n	t	2010-12-17 15:54:51.938724	2010-12-17 15:54:51.938724
7	qui	$	%u%n	t	2010-12-17 15:54:52.045713	2010-12-17 15:54:52.045713
8	Euro	&euro;	%u%n	t	2010-12-17 15:54:53.542564	2010-12-17 15:54:53.542564
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2010-12-17 15:54:50.100368	2010-12-17 15:54:50.100368
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2010-12-17 15:54:50.126321	2010-12-17 15:54:50.126321
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2010-12-17 15:54:50.148711	2010-12-17 15:54:50.148711
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2010-12-17 15:54:50.168997	2010-12-17 15:54:50.168997
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2010-12-17 15:54:50.188321	2010-12-17 15:54:50.188321
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2010-12-17 15:54:50.209429	2010-12-17 15:54:50.209429
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2010-12-17 15:54:50.354007	2010-12-17 15:54:50.354007
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2010-12-17 15:54:50.372867	2010-12-17 15:54:50.372867
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2010-12-17 15:54:50.393753	2010-12-17 15:54:50.393753
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2010-12-17 15:54:50.413564	2010-12-17 15:54:50.413564
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2010-12-17 15:54:50.435203	2010-12-17 15:54:50.435203
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2010-12-17 15:54:50.455852	2010-12-17 15:54:50.455852
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2010-12-17 15:54:50.477949	2010-12-17 15:54:50.477949
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2010-12-17 15:54:50.497573	2010-12-17 15:54:50.497573
15	8	en	<p></p>	Question	2010-12-17 15:54:50.517034	2010-12-17 15:54:50.517034
16	8	dk	<p></p>	[DK] Question	2010-12-17 15:54:50.53655	2010-12-17 15:54:50.53655
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-17 15:54:50.088562	2010-12-17 15:54:50.119665
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-17 15:54:50.141495	2010-12-17 15:54:50.163182
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-17 15:54:50.182454	2010-12-17 15:54:50.203475
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-17 15:54:50.348438	2010-12-17 15:54:50.367545
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-17 15:54:50.387945	2010-12-17 15:54:50.408281
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-17 15:54:50.427576	2010-12-17 15:54:50.449905
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-17 15:54:50.470811	2010-12-17 15:54:50.491485
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-17 15:54:50.511511	2010-12-17 15:54:50.530351
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

COPY lead_translations (id, lead_id, locale, hidden_description, description, header, created_at, updated_at) FROM stdin;
1	1	dk	Autem nostrum corrupti fuga.Consequuntur hic maxime labore nulla fugiat nemo sint.	Corporis sed quisquam eius itaque voluptatem in.Commodi consequatur sunt est porro deleniti recusandae quos dolores.	Big deal on printers	2010-12-17 15:54:51.319223	2010-12-17 15:54:51.319223
2	2	dk	Molestias est alias at nostrum dolores consequatur.Ut explicabo et atque odio est.	Sed qui ab enim quia ea beatae deleniti.Vel rerum cum aspernatur.	Drills required	2010-12-17 15:54:51.43322	2010-12-17 15:54:51.43322
3	3	dk	Est esse vel eveniet est blanditiis.Magnam architecto ipsa quia debitis et eius.	Dolores molestiae reiciendis quo commodi.Ea nulla est eligendi.	Need assistance in selling a car	2010-12-17 15:54:51.536046	2010-12-17 15:54:51.536046
4	4	dk	Eos in non dolorum est.Tempore odit omnis consectetur excepturi totam aut.	Voluptas omnis voluptatem reiciendis officia corporis cum dolorum minus.Voluptatem perferendis aspernatur libero ipsam et.	Ipod shipment	2010-12-17 15:54:51.639286	2010-12-17 15:54:51.639286
5	5	dk	Aut quis quia labore tempora sunt quos sit.At dicta ut eius voluptatem reprehenderit numquam ad.	Consequatur unde rerum cupiditate.Nobis qui qui provident praesentium aperiam.	Trip to amazonia - looking for offer	2010-12-17 15:54:51.890175	2010-12-17 15:54:51.890175
6	6	dk	Voluptatem aperiam consequatur modi aut ipsa.Eum dicta repellendus id perspiciatis in.	Suscipit provident eius quibusdam.Iusto sed incidunt consequatur dignissimos.	LCD - Huge amounts	2010-12-17 15:54:51.991681	2010-12-17 15:54:51.991681
7	7	dk	Voluptas quia sed est.Dolores quis aut natus est.	Dolorem et vero occaecati aut qui itaque.Eos voluptatem laudantium molestiae repellat modi aperiam recusandae.	GPS receivers required	2010-12-17 15:54:52.111968	2010-12-17 15:54:52.111968
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Corporis sed quisquam eius itaque voluptatem in.Commodi consequatur sunt est porro deleniti recusandae quos dolores.	Autem nostrum corrupti fuga.Consequuntur hic maxime labore nulla fugiat nemo sint.	2	User::Agent	0	553.0	262.0	1	Wyman	Ladarius Schoen	259.523.9994 x981	ceasar@daniel.us	047 Fahey Station	2010-12-17 15:54:51.246592	2010-12-17 15:54:51.246592	2010-12-22	Abelardo129260129099917 Bode	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Sed qui ab enim quia ea beatae deleniti.Vel rerum cum aspernatur.	Molestias est alias at nostrum dolores consequatur.Ut explicabo et atque odio est.	2	User::Agent	0	114.0	368.0	1	Krisreinger	Tara Mitchell	1-625-927-6077 x611	oda@king.us	1439 Delphia Rue	2010-12-17 15:54:51.386089	2010-12-17 15:54:51.386089	2010-12-22	Abelardo129260129099917 Bode	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Dolores molestiae reiciendis quo commodi.Ea nulla est eligendi.	Est esse vel eveniet est blanditiis.Magnam architecto ipsa quia debitis et eius.	2	User::Agent	0	926.0	691.0	1	Barrows	Madisyn Purdy	1-127-554-5246	jeremie_crooks@trompcruickshank.uk	452 Jacquelyn Loop	2010-12-17 15:54:51.492528	2010-12-17 15:54:51.492528	2010-12-22	Abelardo129260129099917 Bode	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Voluptas omnis voluptatem reiciendis officia corporis cum dolorum minus.Voluptatem perferendis aspernatur libero ipsam et.	Eos in non dolorum est.Tempore odit omnis consectetur excepturi totam aut.	2	User::Agent	0	599.0	184.0	1	Christiansenmitchell	Dorothea Volkman	(809)220-9512	bryon_fadel@king.info	355 Boyer Forge	2010-12-17 15:54:51.594658	2010-12-17 15:54:51.594658	2010-12-22	Abelardo129260129099917 Bode	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Consequatur unde rerum cupiditate.Nobis qui qui provident praesentium aperiam.	Aut quis quia labore tempora sunt quos sit.At dicta ut eius voluptatem reprehenderit numquam ad.	2	User::Agent	0	402.0	173.0	1	Bode	Ms. Madilyn Ledner	345.620.6706	freddie@hayes.com	4884 Ward Common	2010-12-17 15:54:51.714578	2010-12-17 15:54:51.714578	2010-12-22	Abelardo129260129099917 Bode	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Suscipit provident eius quibusdam.Iusto sed incidunt consequatur dignissimos.	Voluptatem aperiam consequatur modi aut ipsa.Eum dicta repellendus id perspiciatis in.	2	User::Agent	0	745.0	755.0	1	Dickens	Dannie Marks	864-416-1798	moses@medhurst.uk	60582 Baumbach Forks	2010-12-17 15:54:51.948633	2010-12-17 15:54:51.948633	2010-12-22	Abelardo129260129099917 Bode	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Dolorem et vero occaecati aut qui itaque.Eos voluptatem laudantium molestiae repellat modi aperiam recusandae.	Voluptas quia sed est.Dolores quis aut natus est.	2	User::Agent	0	484.0	204.0	1	Haleyblock	Hipolito Runolfsson DVM	438-757-4157 x46939	lazaro@daniel.com	23213 Waelchi Views	2010-12-17 15:54:52.055541	2010-12-17 15:54:52.055541	2010-12-22	Abelardo129260129099917 Bode	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-17 15:54:49.95106	2010-12-17 15:54:49.95106
2	default_leads_per_page	--- 5\n	2010-12-17 15:54:49.969776	2010-12-17 15:54:49.969776
3	certification_level_1	--- 10\n	2010-12-17 15:54:49.977605	2010-12-17 15:54:49.977605
4	certification_level_2	--- 20\n	2010-12-17 15:54:49.985333	2010-12-17 15:54:49.985333
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-17 15:54:49.992105	2010-12-17 15:54:49.992105
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-17 15:54:49.998808	2010-12-17 15:54:49.998808
7	invoicing_seller_name	--- Fairleads\n	2010-12-17 15:54:50.006635	2010-12-17 15:54:50.006635
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-17 15:54:50.014875	2010-12-17 15:54:50.014875
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-17 15:54:50.021874	2010-12-17 15:54:50.021874
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-17 15:54:50.029418	2010-12-17 15:54:50.029418
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
1	blazejek@gmail.com	c79f0f8e262f136686796824905c6b34adc905af4e2a1e6048f8d53b773f07c23e4f81eaa869185654d0d8e9ac9e281f0c6caabeda0245fd996ea8f2e6b7e988	P6TXfoVKUSCmR2gcMFtt	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-17 15:54:50.682532	2010-12-17 15:54:50.580215	\N	2010-12-17 15:54:50.580502	2010-12-17 15:54:50.683374	1	Delaney	Cassin	968.446.4858 x00623	root	Cassin Shores	New Electamouth	58990-4320	Lothian	1	\N	\N	\N	\N	0	\N	\N	\N	\N	0yLolyppkiB4gvE0ylNIhpzT1jgy8bl7hpXCAjexie62p8r6A5OUFFdpNsJhVQ	f	\N	0	0	0	0	0
2	agent@nbs.com	b5c22c47479946526c1ebbe579a250ad39cda90b2a5fb2e12e142c1136a9e776cc91138590bd692993d131db196afa373aaeed8f4aa244e8a441f3e74cb1482e	liI4kUtVAWzYsY0EngDQ	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-17 15:54:51.18804	2010-12-17 15:54:51.016534	\N	2010-12-17 15:54:51.017038	2010-12-17 15:54:51.188453	2	Abelardo129260129099917	Bode	(561)188-6211 x9289	Thaddeus Jakubowski129260129099876	Tania Well	Gwenburgh	26262-1859	Northumberland	3	\N	0	\N	\N	0	\N	\N	\N	\N	vIXknyrcxjHwqgn0zzzDxd0nk3NVUkjFlRmm9g75kArhWSQoLDKN5T8WAYVvqI	f	\N	0	0	0	0	0
3	admin@nbs.com	1d417a68bfdc945428a189b8b48b35d72800a6c084147e0e073700962dd258f4c4c3b3b9f742f48b93f129042a266c733ea01294a88dffb15ca83c6aff0cfc18	-oru6obcNQNUkqTw4fAe	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-17 15:54:52.226955	2010-12-17 15:54:52.195196	\N	2010-12-17 15:54:52.195501	2010-12-17 15:54:52.227603	1	Hayden	Terry	817.561.2274 x25338	Odell Walter129260129218903	Hahn Manors	New Pietro	82940-1384	West Yorkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	AQT8RKCkHUcv2Z1c3jeeML59FV0ftkLTYXu3bYM598GgiBNx44R4NQF9qceWuS	f	\N	0	0	0	0	0
4	buyer@nbs.com	2c7b2f6313f8bd180b1cc10c0073c04061ea028e1b7646f52aa7c0699e06a5b3c0bb40c4f6f14df48dedc24df935893e25d9c1848005c56c0816799af3365940	pKZn95CQisNfRJU7pNyJ	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-17 15:54:52.318111	2010-12-17 15:54:52.276223	\N	2010-12-17 15:54:52.276574	2010-12-17 15:54:52.318561	48	Lue	Romaguera	1-021-753-9283	Candace Larson129260129226657	Durgan Parks	North Tatyana	69565	West Yorkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	RWOWFMYGEteKtpVymycUiFavoLGKmHDVDIw6B2SpBrkUklu1dUTK2qPOgCPURZ	f	t	0	0	0	0	0
5	leaduser@nbs.com	750485f2022f2b8bfdb3988588e2039d98260a782695791134226ddc1623e1ac6717da18b64d350e85667a84f87cce92a52c493ec974aa1b55e5daa645ffa24a	pikxZepZ-SWjftltoJ9q	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-17 15:54:52.394428	2010-12-17 15:54:52.358726	\N	2010-12-17 15:54:52.359021	2010-12-17 15:54:52.568346	64	Ubaldo	Lind	1-038-635-7701 x421	Celia Murphy129260129235224	Hodkiewicz Lodge	Lake Fabian	06203	Clwyd	1	\N	\N	4	\N	0	\N	\N	\N	\N	ypyVF1QxDSK0fanQfWlby9DYM54ljujy7I9wb8rFgnZA7q975NphEze6D2g4Qm	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

