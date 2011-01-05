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

SELECT pg_catalog.setval('currencies_id_seq', 2, true);


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
-- Name: payment_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('payment_transactions_id_seq', 1, false);


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
1	1	dk	About us	About us	2011-01-05 08:32:47.813454	2011-01-05 08:32:47.813454
2	1	en	About us	About us	2011-01-05 08:32:47.827196	2011-01-05 08:32:47.827196
3	2	dk	Privacy	Privacy	2011-01-05 08:32:47.85708	2011-01-05 08:32:47.85708
4	2	en	Privacy	Privacy	2011-01-05 08:32:47.868603	2011-01-05 08:32:47.868603
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-05 08:32:47.900413	2011-01-05 08:32:47.900413
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-05 08:32:47.911792	2011-01-05 08:32:47.911792
7	4	dk	Blurb sign up	Blurb sign up	2011-01-05 08:32:47.94032	2011-01-05 08:32:47.94032
8	4	en	Blurb sign up	Blurb sign up	2011-01-05 08:32:47.952057	2011-01-05 08:32:47.952057
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-05 08:32:47.981037	2011-01-05 08:32:47.981037
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-05 08:32:47.99287	2011-01-05 08:32:47.99287
11	6	dk	Blurb agent home	Blurb agent home	2011-01-05 08:32:48.02321	2011-01-05 08:32:48.02321
12	6	en	Blurb agent home	Blurb agent home	2011-01-05 08:32:48.035948	2011-01-05 08:32:48.035948
13	7	dk	Blurb start page role selection	Blurb start page role selection	2011-01-05 08:32:48.065272	2011-01-05 08:32:48.065272
14	7	en	Blurb start page role selection	Blurb start page role selection	2011-01-05 08:32:48.076786	2011-01-05 08:32:48.076786
15	8	dk	Blurb currencies	Blurb currencies	2011-01-05 08:32:48.105312	2011-01-05 08:32:48.105312
16	8	en	Blurb currencies	Blurb currencies	2011-01-05 08:32:48.116334	2011-01-05 08:32:48.116334
17	9	dk	Reset password	Reset password	2011-01-05 08:32:48.143939	2011-01-05 08:32:48.143939
18	9	en	Reset password	Reset password	2011-01-05 08:32:48.155299	2011-01-05 08:32:48.155299
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-05 08:32:47.674941	2011-01-05 08:32:47.829833	about_us	0	t	2011-01-05 08:32:47.829764
2	Article::Cms	2011-01-05 08:32:47.85318	2011-01-05 08:32:47.871275	privacy	0	t	2011-01-05 08:32:47.871203
3	Article::Cms	2011-01-05 08:32:47.895878	2011-01-05 08:32:47.914542	terms_conditions	0	t	2011-01-05 08:32:47.91445
4	Article::Cms	2011-01-05 08:32:47.935905	2011-01-05 08:32:47.955227	blurb_sign_up	1	t	2011-01-05 08:32:47.955143
5	Article::Cms	2011-01-05 08:32:47.976316	2011-01-05 08:32:47.996105	blurb_buyer_home	1	t	2011-01-05 08:32:47.996026
6	Article::Cms	2011-01-05 08:32:48.018863	2011-01-05 08:32:48.038957	blurb_agent_home	1	t	2011-01-05 08:32:48.038873
7	Article::Cms	2011-01-05 08:32:48.061138	2011-01-05 08:32:48.079618	blurb_start_page_role_selection	1	t	2011-01-05 08:32:48.079548
8	Article::Cms	2011-01-05 08:32:48.101034	2011-01-05 08:32:48.119097	blurb_currencies	1	t	2011-01-05 08:32:48.119022
9	Article::Cms	2011-01-05 08:32:48.139924	2011-01-05 08:32:48.30694	reset_password	2	t	2011-01-05 08:32:48.306847
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Laboriosam magnam et quia ullam suscipit et non nesciunt.Perspiciatis dolor molestias maxime cumque placeat provident accusantium expedita.	2011-01-05 08:32:46.331894	2011-01-05 08:32:46.331894	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Necessitatibus ullam a culpa ut qui debitis.Porro nisi tempore dolore.	2011-01-05 08:32:46.374926	2011-01-05 08:32:46.374926	\N	3	4	\N	0	2-leisure	f	0
3	Business	Possimus exercitationem quia ratione corrupti itaque fugiat.Doloremque repellat odio amet.	2011-01-05 08:32:46.533673	2011-01-05 08:32:47.224964	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Laboriosam magnam et quia ullam suscipit et non nesciunt.Perspiciatis dolor molestias maxime cumque placeat provident accusantium expedita.	Electronics	2011-01-05 08:32:46.340752	2011-01-05 08:32:46.340752
2	1	dk	\N	Electronics	2011-01-05 08:32:46.365515	2011-01-05 08:32:46.365515
3	2	en	Necessitatibus ullam a culpa ut qui debitis.Porro nisi tempore dolore.	Leisure	2011-01-05 08:32:46.50494	2011-01-05 08:32:46.50494
4	2	dk	\N	Leisure	2011-01-05 08:32:46.524193	2011-01-05 08:32:46.524193
5	3	en	Possimus exercitationem quia ratione corrupti itaque fugiat.Doloremque repellat odio amet.	Business	2011-01-05 08:32:46.537745	2011-01-05 08:32:46.537745
6	3	dk	\N	Business	2011-01-05 08:32:46.556526	2011-01-05 08:32:46.556526
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-05 08:32:45.855166	2011-01-05 08:32:45.855166
2	United Kingdom	2011-01-05 08:32:45.860057	2011-01-05 08:32:45.860057
3	Wales129421636658391	2011-01-05 08:32:46.585228	2011-01-05 08:32:46.585228
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
1	Euro	&euro;	%u%n	t	2011-01-05 08:32:46.310874	2011-01-05 08:32:46.310874
2	PLN	&pln;	%u%n	t	2011-01-05 08:32:46.314937	2011-01-05 08:32:46.314937
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-05 08:32:46.010511	2011-01-05 08:32:46.010511
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-05 08:32:46.025242	2011-01-05 08:32:46.025242
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-05 08:32:46.037886	2011-01-05 08:32:46.037886
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-05 08:32:46.049675	2011-01-05 08:32:46.049675
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-05 08:32:46.061546	2011-01-05 08:32:46.061546
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-05 08:32:46.07315	2011-01-05 08:32:46.07315
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-05 08:32:46.08506	2011-01-05 08:32:46.08506
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-05 08:32:46.096738	2011-01-05 08:32:46.096738
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-05 08:32:46.108986	2011-01-05 08:32:46.108986
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-05 08:32:46.121368	2011-01-05 08:32:46.121368
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-05 08:32:46.134039	2011-01-05 08:32:46.134039
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-05 08:32:46.146606	2011-01-05 08:32:46.146606
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-05 08:32:46.159534	2011-01-05 08:32:46.159534
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-05 08:32:46.172039	2011-01-05 08:32:46.172039
15	8	en	Question	<p></p>	2011-01-05 08:32:46.184772	2011-01-05 08:32:46.184772
16	8	dk	[DK] Question	<p></p>	2011-01-05 08:32:46.197102	2011-01-05 08:32:46.197102
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-05 08:32:45.876992	2011-01-05 08:32:46.021211
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-05 08:32:46.033422	2011-01-05 08:32:46.045711
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-05 08:32:46.057325	2011-01-05 08:32:46.069128
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-05 08:32:46.080784	2011-01-05 08:32:46.092779
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-05 08:32:46.104615	2011-01-05 08:32:46.117094
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-05 08:32:46.129619	2011-01-05 08:32:46.142294
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-05 08:32:46.15497	2011-01-05 08:32:46.16778
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-05 08:32:46.180052	2011-01-05 08:32:46.19294
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, pkwiu, unit, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason, accessible_from) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
1	1	dk	Deleniti voluptatem laborum debitis atque.Architecto repudiandae hic eos at.	Non perferendis magnam accusamus consectetur numquam similique odio.Pariatur saepe placeat tempora autem eligendi perspiciatis.	Big deal on printers	2011-01-05 08:32:46.6884	2011-01-05 08:32:46.6884
2	2	dk	Sed provident neque cumque veritatis.Inventore fugiat alias assumenda autem.	Consequatur sit repellat possimus aut veritatis.Earum sed consequatur numquam.	Drills required	2011-01-05 08:32:46.758775	2011-01-05 08:32:46.758775
3	3	dk	Dolorem excepturi at ratione quia odio magni.Iste amet sit vero alias aut asperiores ipsa.	Tempore dolorum nam similique.Aut esse et velit.	Need assistance in selling a car	2011-01-05 08:32:46.829168	2011-01-05 08:32:46.829168
4	4	dk	Ut aperiam quia tempore fugit et et.Minima autem culpa assumenda atque.	Qui odit dolores vel ut voluptatum distinctio inventore asperiores.Velit voluptatem consequuntur aliquam.	Ipod shipment	2011-01-05 08:32:47.029969	2011-01-05 08:32:47.029969
5	5	dk	Earum eligendi harum magnam eos enim eveniet aut.Amet accusamus et est et iusto voluptatem esse nam.	Accusantium non ut quisquam veritatis sed quae eos.Sunt aperiam expedita voluptas.	Trip to amazonia - looking for offer	2011-01-05 08:32:47.098854	2011-01-05 08:32:47.098854
6	6	dk	Dolorem temporibus culpa qui suscipit.Ex quo sit rerum quos dignissimos ut omnis placeat.	Accusamus labore natus officia.Ullam non perspiciatis non.	LCD - Huge amounts	2011-01-05 08:32:47.165915	2011-01-05 08:32:47.165915
7	7	dk	Non optio quod voluptas.Et et velit repellat animi.	Corporis qui magni in.Quia et error distinctio.	GPS receivers required	2011-01-05 08:32:47.23179	2011-01-05 08:32:47.23179
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url) FROM stdin;
1	Big deal on printers	3	Deleniti voluptatem laborum debitis atque.Architecto repudiandae hic eos at.	Non perferendis magnam accusamus consectetur numquam similique odio.Pariatur saepe placeat tempora autem eligendi perspiciatis.	2	User::Agent	0	384.0	658.0	1	Corkerylind	Devin Weimann	1-246-239-7687 x967	river.powlowski@renner.name	195 Leuschke Forest	2011-01-05 08:32:46.647651	2011-01-05 08:32:46.647651	2011-01-10	Nigel129421636658305 Little	1	t	\N	0	0	f	f	-1	1	2011-01-05 08:32:46.656852	\N	\N
2	Drills required	3	Sed provident neque cumque veritatis.Inventore fugiat alias assumenda autem.	Consequatur sit repellat possimus aut veritatis.Earum sed consequatur numquam.	2	User::Agent	0	411.0	977.0	1	Nienowheathcote	Shany Lockman	1-639-538-3274 x960	jessie_williamson@prohaska.uk	6010 Justice Stream	2011-01-05 08:32:46.726716	2011-01-05 08:32:46.726716	2011-01-10	Nigel129421636658305 Little	1	t	\N	0	0	f	f	-1	1	2011-01-05 08:32:46.733246	\N	\N
3	Need assistance in selling a car	3	Dolorem excepturi at ratione quia odio magni.Iste amet sit vero alias aut asperiores ipsa.	Tempore dolorum nam similique.Aut esse et velit.	2	User::Agent	0	420.0	402.0	1	Lemke	Susanna Swaniawski	522-958-0891 x59089	andres.grimes@pouros.name	7768 Newton Pass	2011-01-05 08:32:46.797357	2011-01-05 08:32:46.797357	2011-01-10	Nigel129421636658305 Little	1	t	\N	0	0	f	f	-1	1	2011-01-05 08:32:46.803846	\N	\N
4	Ipod shipment	3	Ut aperiam quia tempore fugit et et.Minima autem culpa assumenda atque.	Qui odit dolores vel ut voluptatum distinctio inventore asperiores.Velit voluptatem consequuntur aliquam.	2	User::Agent	0	114.0	678.0	1	Hirthegerhold	Madonna Lebsack	(028)553-1989 x7218	roy.gerhold@homenickcronin.us	0110 Flo Roads	2011-01-05 08:32:46.997331	2011-01-05 08:32:46.997331	2011-01-10	Nigel129421636658305 Little	1	t	\N	0	0	f	f	-1	1	2011-01-05 08:32:47.003824	\N	\N
5	Trip to amazonia - looking for offer	3	Earum eligendi harum magnam eos enim eveniet aut.Amet accusamus et est et iusto voluptatem esse nam.	Accusantium non ut quisquam veritatis sed quae eos.Sunt aperiam expedita voluptas.	2	User::Agent	0	96.0	815.0	1	Baumbachauer	Esmeralda Wiegand	696.911.9432 x28432	bailey_strosin@block.uk	839 Lois Mountains	2011-01-05 08:32:47.065629	2011-01-05 08:32:47.065629	2011-01-10	Nigel129421636658305 Little	1	t	\N	0	0	f	f	-1	1	2011-01-05 08:32:47.072674	\N	\N
6	LCD - Huge amounts	3	Dolorem temporibus culpa qui suscipit.Ex quo sit rerum quos dignissimos ut omnis placeat.	Accusamus labore natus officia.Ullam non perspiciatis non.	2	User::Agent	0	641.0	511.0	1	Schiller	Jodie Mayer	232.974.2400	garland@wisoky.com	6247 Monahan Freeway	2011-01-05 08:32:47.133877	2011-01-05 08:32:47.133877	2011-01-10	Nigel129421636658305 Little	1	t	\N	0	0	f	f	-1	1	2011-01-05 08:32:47.140462	\N	\N
7	GPS receivers required	3	Non optio quod voluptas.Et et velit repellat animi.	Corporis qui magni in.Quia et error distinctio.	2	User::Agent	0	546.0	299.0	1	Gulgowski	Cooper Kris IV	014-845-0033 x69310	jonas@ohara.co.uk	5765 Amani Island	2011-01-05 08:32:47.200391	2011-01-05 08:32:47.200391	2011-01-10	Nigel129421636658305 Little	1	t	\N	0	0	f	f	-1	1	2011-01-05 08:32:47.206565	\N	\N
\.


--
-- Data for Name: payment_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY payment_notifications (id, params, buyer_id, status, transaction_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: payment_transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY payment_transactions (id, invoice_id, payment_notification_id, type, paid_at, amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2011-01-05 08:32:45.824253	2011-01-05 08:32:45.824253
2	default_leads_per_page	--- 5\n	2011-01-05 08:32:45.829768	2011-01-05 08:32:45.829768
3	certification_level_1	--- 10\n	2011-01-05 08:32:45.831933	2011-01-05 08:32:45.831933
4	certification_level_2	--- 20\n	2011-01-05 08:32:45.834029	2011-01-05 08:32:45.834029
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-05 08:32:45.836092	2011-01-05 08:32:45.836092
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-05 08:32:45.838172	2011-01-05 08:32:45.838172
7	invoicing_seller_name	--- Fairleads\n	2011-01-05 08:32:45.840432	2011-01-05 08:32:45.840432
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-05 08:32:45.842691	2011-01-05 08:32:45.842691
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-05 08:32:45.844853	2011-01-05 08:32:45.844853
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-05 08:32:45.846967	2011-01-05 08:32:45.846967
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level) FROM stdin;
1	blazejek@gmail.com	63edb251abd6dffca660836181ad6d8ae94069ed941ee26c0f413232d3376fe3a0da67acddea23d37b394ca7bf0194875a0e234e99c483cf146ba4867213a971	ZMjV22ZYnSm3N9cv5Vqr	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-05 08:32:46.301127	2011-01-05 08:32:46.232531	\N	2011-01-05 08:32:46.23274	2011-01-05 08:32:46.301405	1	Giovanny	Goldner	865.991.6975 x46548	root	Dwight Ferry	West Josefort	78140	Dyfed	1	\N	\N	\N	\N	0	\N	\N	\N	\N	jWvVuFrfeyId49MoSsJkFHtrCytnwh74GUEAP8PBpAZbI7yoWEDWnu83XBlISb	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
2	agent@nbs.com	4c783e2cb92422e3fa26fa94136fd842c748f2d78c318f6aec8ddd789e209578293d05b2da168a94befc88de9768d4ccdfa83bf6ec3cd4031adb3d730ccfaefa	-b5Tz1GnGad21flEiZzY	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-05 08:32:46.614283	2011-01-05 08:32:46.591065	\N	2011-01-05 08:32:46.591272	2011-01-05 08:32:46.614552	2	Nigel129421636658305	Little	632.680.7202 x0517	Silas Schuppe12942163665827	Eudora Branch	Haagside	38541-2648	Berkshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	ljtkyf9NaRyHgmOMxXbLzBDz4b3fUREIZdVE4AMBfzoc357g42y3YbeZ3YG7in	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
3	admin@nbs.com	d4cb23b1d39f122cc0a26a4f268604e5f02533ca024f84e1422e9a7e44d7a8b7597d90e3ca7dd30eb72ce1a0b9ba8352b9e8f969bcbafabd316fd6ee5b1c6a1d	97TPspY7nZMlOqENFQzQ	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-05 08:32:47.311305	2011-01-05 08:32:47.290411	\N	2011-01-05 08:32:47.29069	2011-01-05 08:32:47.311581	1	Jerrold	Ryan	278.579.8768	Drew Koch129421636728592	Taylor Brook	Powlowskishire	10724	County Armagh	1	\N	\N	\N	\N	0	\N	\N	\N	\N	nE0Imr876udGBrPDELvh55HgKijAYKOtQJh0p4ytuwAojjJRTVotRbDN9VqA4F	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
4	buyer@nbs.com	69fd98a5e7e857f08615a1fb2466bb09d9ffcafb8e5410e6dee1063c38c399bdb153e51df9531c1bd5103eb16970587d58c63da36cfed0d5e3665312925ce008	E1OBORjkuOamdW8t5Y7I	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-05 08:32:47.500787	2011-01-05 08:32:47.477539	\N	2011-01-05 08:32:47.477756	2011-01-05 08:32:47.501072	48	Teagan	Bernhard	(003)304-0839	Jed Simonis12942163674722	Denesik Pines	Johnsstad	76424	Mid Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	RscHuYS4ny4QKfV5eKrQCRaHi4BKm7xpygKLjc58GywuSnP2qyYZUZv4JWIEzq	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
5	leaduser@nbs.com	b758000ca11d06dde5ec4cebc339773530ee05233eaa1911062cd96fc8161c57e0a1059d098f8d88ebe407c2fac85bcdd482c6cde3f9cc7178b67e43ae0a6c95	zy9QAK2o_4LGOUaS_WRR	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-05 08:32:47.557624	2011-01-05 08:32:47.534867	\N	2011-01-05 08:32:47.535081	2011-01-05 08:32:47.572826	64	Juvenal	Robel	941.381.4751	Mariane Nader129421636752968	Cronin Fork	Conroyton	40808-7422	Buckinghamshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	Jadsmgj1eJoO3LrZfQU18Z2NlNAGdyNNdx8TfV0QnLBMwSOYSBeM5txl8ji52K	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

