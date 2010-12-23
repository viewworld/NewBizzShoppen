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
1	1	dk	About us	About us	2010-12-23 15:28:42.42942	2010-12-23 15:28:42.42942
2	1	en	About us	About us	2010-12-23 15:28:42.443074	2010-12-23 15:28:42.443074
3	2	dk	Privacy	Privacy	2010-12-23 15:28:42.472901	2010-12-23 15:28:42.472901
4	2	en	Privacy	Privacy	2010-12-23 15:28:42.483708	2010-12-23 15:28:42.483708
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-23 15:28:42.64407	2010-12-23 15:28:42.64407
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-23 15:28:42.654813	2010-12-23 15:28:42.654813
7	4	dk	Blurb sign up	Blurb sign up	2010-12-23 15:28:42.682017	2010-12-23 15:28:42.682017
8	4	en	Blurb sign up	Blurb sign up	2010-12-23 15:28:42.69322	2010-12-23 15:28:42.69322
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-23 15:28:42.721938	2010-12-23 15:28:42.721938
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-23 15:28:42.732816	2010-12-23 15:28:42.732816
11	6	dk	Blurb agent home	Blurb agent home	2010-12-23 15:28:42.759519	2010-12-23 15:28:42.759519
12	6	en	Blurb agent home	Blurb agent home	2010-12-23 15:28:42.77133	2010-12-23 15:28:42.77133
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-23 15:28:42.798016	2010-12-23 15:28:42.798016
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-23 15:28:42.811609	2010-12-23 15:28:42.811609
15	8	dk	Blurb currencies	Blurb currencies	2010-12-23 15:28:42.839449	2010-12-23 15:28:42.839449
16	8	en	Blurb currencies	Blurb currencies	2010-12-23 15:28:42.851268	2010-12-23 15:28:42.851268
17	9	dk	Reset password	Reset password	2010-12-23 15:28:42.879912	2010-12-23 15:28:42.879912
18	9	en	Reset password	Reset password	2010-12-23 15:28:42.893284	2010-12-23 15:28:42.893284
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-23 15:28:42.421016	2010-12-23 15:28:42.445828	about_us	0	t	2010-12-23 15:28:42.445754
2	Article::Cms	2010-12-23 15:28:42.468923	2010-12-23 15:28:42.486458	privacy	0	t	2010-12-23 15:28:42.486383
3	Article::Cms	2010-12-23 15:28:42.640168	2010-12-23 15:28:42.657449	terms_conditions	0	t	2010-12-23 15:28:42.657379
4	Article::Cms	2010-12-23 15:28:42.678022	2010-12-23 15:28:42.696081	blurb_sign_up	1	t	2010-12-23 15:28:42.696005
5	Article::Cms	2010-12-23 15:28:42.717995	2010-12-23 15:28:42.735595	blurb_buyer_home	1	t	2010-12-23 15:28:42.735521
6	Article::Cms	2010-12-23 15:28:42.755626	2010-12-23 15:28:42.774055	blurb_agent_home	1	t	2010-12-23 15:28:42.773979
7	Article::Cms	2010-12-23 15:28:42.794098	2010-12-23 15:28:42.814397	blurb_start_page_role_selection	1	t	2010-12-23 15:28:42.814321
8	Article::Cms	2010-12-23 15:28:42.835358	2010-12-23 15:28:42.854005	blurb_currencies	1	t	2010-12-23 15:28:42.853932
9	Article::Cms	2010-12-23 15:28:42.875718	2010-12-23 15:28:42.89686	reset_password	2	t	2010-12-23 15:28:42.896776
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
1	Electronics	Explicabo numquam rerum quia.Temporibus quo sint aliquam quia non dolor nihil.	2010-12-23 15:28:41.084207	2010-12-23 15:28:41.084207	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Voluptatem expedita et ut.Magnam et aut quasi cumque perspiciatis voluptatem.	2010-12-23 15:28:41.130806	2010-12-23 15:28:41.130806	\N	3	4	\N	0	2-leisure	f	0
3	Business	Nam ad quia pariatur expedita illo sed.Omnis qui sequi voluptas est ut.	2010-12-23 15:28:41.166646	2010-12-23 15:28:41.98471	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Explicabo numquam rerum quia.Temporibus quo sint aliquam quia non dolor nihil.	Electronics	2010-12-23 15:28:41.0931	2010-12-23 15:28:41.0931
2	1	dk	\N	Electronics	2010-12-23 15:28:41.121174	2010-12-23 15:28:41.121174
3	2	en	Voluptatem expedita et ut.Magnam et aut quasi cumque perspiciatis voluptatem.	Leisure	2010-12-23 15:28:41.135741	2010-12-23 15:28:41.135741
4	2	dk	\N	Leisure	2010-12-23 15:28:41.1569	2010-12-23 15:28:41.1569
5	3	en	Nam ad quia pariatur expedita illo sed.Omnis qui sequi voluptas est ut.	Business	2010-12-23 15:28:41.171002	2010-12-23 15:28:41.171002
6	3	dk	\N	Business	2010-12-23 15:28:41.196662	2010-12-23 15:28:41.196662
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-23 15:28:40.581883	2010-12-23 15:28:40.581883
2	United Kingdom	2010-12-23 15:28:40.586612	2010-12-23 15:28:40.586612
3	England129311812135634	2010-12-23 15:28:41.357791	2010-12-23 15:28:41.357791
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
1	Euro	&euro;	%u%n	t	2010-12-23 15:28:41.063022	2010-12-23 15:28:41.063022
2	PLN	&pln;	%u%n	t	2010-12-23 15:28:41.067124	2010-12-23 15:28:41.067124
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-23 15:28:40.613525	2010-12-23 15:28:40.613525
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-23 15:28:40.628785	2010-12-23 15:28:40.628785
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-23 15:28:40.641369	2010-12-23 15:28:40.641369
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-23 15:28:40.656951	2010-12-23 15:28:40.656951
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-23 15:28:40.670652	2010-12-23 15:28:40.670652
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-23 15:28:40.818671	2010-12-23 15:28:40.818671
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-23 15:28:40.832034	2010-12-23 15:28:40.832034
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-23 15:28:40.844241	2010-12-23 15:28:40.844241
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-23 15:28:40.856257	2010-12-23 15:28:40.856257
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-23 15:28:40.867807	2010-12-23 15:28:40.867807
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-23 15:28:40.879876	2010-12-23 15:28:40.879876
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-23 15:28:40.89146	2010-12-23 15:28:40.89146
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-23 15:28:40.903796	2010-12-23 15:28:40.903796
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-23 15:28:40.918273	2010-12-23 15:28:40.918273
15	8	en	Question	<p></p>	2010-12-23 15:28:40.930414	2010-12-23 15:28:40.930414
16	8	dk	[DK] Question	<p></p>	2010-12-23 15:28:40.942339	2010-12-23 15:28:40.942339
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-23 15:28:40.603277	2010-12-23 15:28:40.624344
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-23 15:28:40.636831	2010-12-23 15:28:40.650396
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-23 15:28:40.666105	2010-12-23 15:28:40.814613
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-23 15:28:40.827727	2010-12-23 15:28:40.839988
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-23 15:28:40.851887	2010-12-23 15:28:40.863861
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-23 15:28:40.875691	2010-12-23 15:28:40.887509
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-23 15:28:40.899507	2010-12-23 15:28:40.914192
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-23 15:28:40.926141	2010-12-23 15:28:40.938222
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

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, hidden_description, description, header, created_at, updated_at) FROM stdin;
1	1	dk	Explicabo et ut reprehenderit aut velit.Iusto sed ut consequatur neque nihil impedit.	Quam asperiores ex fugit necessitatibus consequatur nostrum magni quisquam.Ut earum dolore et quis facere ut.	Big deal on printers	2010-12-23 15:28:41.458887	2010-12-23 15:28:41.458887
2	2	dk	Voluptatem est natus sint sint nemo deleniti.Sit dolorem illum cum ipsam.	Voluptatem quaerat fuga sapiente et voluptatem.Fuga aut minima et ea quos deserunt illo autem.	Drills required	2010-12-23 15:28:41.529316	2010-12-23 15:28:41.529316
3	3	dk	Velit ex voluptate doloribus voluptas placeat nihil mollitia consectetur.Est et iure nihil neque temporibus sit.	Est voluptatem tempora suscipit aut rerum consectetur.Odio officiis accusamus corrupti.	Need assistance in selling a car	2010-12-23 15:28:41.593512	2010-12-23 15:28:41.593512
4	4	dk	Distinctio ut sit qui veritatis facere pariatur omnis quas.Inventore sequi odio esse pariatur debitis.	Illo voluptas omnis unde error sapiente aliquid ut.Soluta in aut ab.	Ipod shipment	2010-12-23 15:28:41.659738	2010-12-23 15:28:41.659738
5	5	dk	Velit rerum sint perspiciatis voluptatem dolorum quaerat ut facere.Odit nisi et reiciendis temporibus quis eum esse.	Voluptatum consequuntur quia vel enim porro dignissimos deserunt.Commodi consequatur adipisci recusandae vel minima cumque excepturi.	Trip to amazonia - looking for offer	2010-12-23 15:28:41.859031	2010-12-23 15:28:41.859031
6	6	dk	Qui porro culpa doloribus et dicta ratione quisquam ipsum.Itaque id accusantium et et omnis in.	Sunt animi qui perspiciatis qui.Qui est totam voluptatum quia eveniet.	LCD - Huge amounts	2010-12-23 15:28:41.926861	2010-12-23 15:28:41.926861
7	7	dk	Consequatur dolorem hic id aperiam.Consequatur dignissimos eos eligendi minus ad eum.	Consequuntur et eos ipsam quia aut voluptas.Repellat quidem cum laboriosam corrupti eveniet delectus.	GPS receivers required	2010-12-23 15:28:41.991308	2010-12-23 15:28:41.991308
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at) FROM stdin;
1	Big deal on printers	3	Quam asperiores ex fugit necessitatibus consequatur nostrum magni quisquam.Ut earum dolore et quis facere ut.	Explicabo et ut reprehenderit aut velit.Iusto sed ut consequatur neque nihil impedit.	2	User::Agent	0	264.0	576.0	1	Schneiderherman	Loren Spinka	545-263-4169 x38879	nova.schroeder@blickgerlach.com	6788 Schmeler Fort	2010-12-23 15:28:41.420343	2010-12-23 15:28:41.420343	2010-12-28	Lucius129311812135556 Kassulke	1	t	\N	0	0	f	f	-1	1	2010-12-23 15:28:41.429114
2	Drills required	3	Voluptatem quaerat fuga sapiente et voluptatem.Fuga aut minima et ea quos deserunt illo autem.	Voluptatem est natus sint sint nemo deleniti.Sit dolorem illum cum ipsam.	2	User::Agent	0	161.0	889.0	1	Lynch	Jailyn Leannon	195-687-5054 x451	doris@harber.info	2246 Herbert Dale	2010-12-23 15:28:41.495746	2010-12-23 15:28:41.495746	2010-12-28	Lucius129311812135556 Kassulke	1	t	\N	0	0	f	f	-1	1	2010-12-23 15:28:41.502053
3	Need assistance in selling a car	3	Est voluptatem tempora suscipit aut rerum consectetur.Odio officiis accusamus corrupti.	Velit ex voluptate doloribus voluptas placeat nihil mollitia consectetur.Est et iure nihil neque temporibus sit.	2	User::Agent	0	339.0	361.0	1	Murraywaters	Emmy Brown	1-037-713-0797 x539	austyn@adams.com	7066 Phyllis Pine	2010-12-23 15:28:41.562963	2010-12-23 15:28:41.562963	2010-12-28	Lucius129311812135556 Kassulke	1	t	\N	0	0	f	f	-1	1	2010-12-23 15:28:41.569115
4	Ipod shipment	3	Illo voluptas omnis unde error sapiente aliquid ut.Soluta in aut ab.	Distinctio ut sit qui veritatis facere pariatur omnis quas.Inventore sequi odio esse pariatur debitis.	2	User::Agent	0	918.0	126.0	1	Stehr	Golda Sanford	1-042-757-6270 x976	andy@maggio.us	12676 Soledad Dam	2010-12-23 15:28:41.629113	2010-12-23 15:28:41.629113	2010-12-28	Lucius129311812135556 Kassulke	1	t	\N	0	0	f	f	-1	1	2010-12-23 15:28:41.63523
5	Trip to amazonia - looking for offer	3	Voluptatum consequuntur quia vel enim porro dignissimos deserunt.Commodi consequatur adipisci recusandae vel minima cumque excepturi.	Velit rerum sint perspiciatis voluptatem dolorum quaerat ut facere.Odit nisi et reiciendis temporibus quis eum esse.	2	User::Agent	0	815.0	653.0	1	Rempel	Jermey Ullrich	202.130.0492 x6096	tyshawn@bartell.info	32028 Spinka Valley	2010-12-23 15:28:41.827594	2010-12-23 15:28:41.827594	2010-12-28	Lucius129311812135556 Kassulke	1	t	\N	0	0	f	f	-1	1	2010-12-23 15:28:41.833797
6	LCD - Huge amounts	3	Sunt animi qui perspiciatis qui.Qui est totam voluptatum quia eveniet.	Qui porro culpa doloribus et dicta ratione quisquam ipsum.Itaque id accusantium et et omnis in.	2	User::Agent	0	990.0	369.0	1	Olson	Parker Bruen	698-878-0640	gordon.wolf@white.co.uk	22216 McClure Grove	2010-12-23 15:28:41.893087	2010-12-23 15:28:41.893087	2010-12-28	Lucius129311812135556 Kassulke	1	t	\N	0	0	f	f	-1	1	2010-12-23 15:28:41.899248
7	GPS receivers required	3	Consequuntur et eos ipsam quia aut voluptas.Repellat quidem cum laboriosam corrupti eveniet delectus.	Consequatur dolorem hic id aperiam.Consequatur dignissimos eos eligendi minus ad eum.	2	User::Agent	0	418.0	804.0	1	Brakus	Mr. Stephan Hirthe	1-469-331-0808	katlyn@labadie.name	215 Layne Roads	2010-12-23 15:28:41.960703	2010-12-23 15:28:41.960703	2010-12-28	Lucius129311812135556 Kassulke	1	t	\N	0	0	f	f	-1	1	2010-12-23 15:28:41.966987
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
1	default_payout_delay	--- 0\n	2010-12-23 15:28:40.54017	2010-12-23 15:28:40.54017
2	default_leads_per_page	--- 5\n	2010-12-23 15:28:40.545724	2010-12-23 15:28:40.545724
3	certification_level_1	--- 10\n	2010-12-23 15:28:40.547921	2010-12-23 15:28:40.547921
4	certification_level_2	--- 20\n	2010-12-23 15:28:40.549946	2010-12-23 15:28:40.549946
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-23 15:28:40.552063	2010-12-23 15:28:40.552063
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-23 15:28:40.557309	2010-12-23 15:28:40.557309
7	invoicing_seller_name	--- Fairleads\n	2010-12-23 15:28:40.559884	2010-12-23 15:28:40.559884
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-23 15:28:40.565063	2010-12-23 15:28:40.565063
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-23 15:28:40.56759	2010-12-23 15:28:40.56759
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-23 15:28:40.572932	2010-12-23 15:28:40.572932
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, linkedin_url, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, facebook_url) FROM stdin;
1	blazejek@gmail.com	bdfc6343fefb327dec2b974bdf6ad5109bc39f21673e4e6f88b81f5e955bd3fa506dba9d917425e9ff89ef4756edf1731aeb4d919ec9245d4ac6aa9bcb28ce84	2ShgZBkcD1EeRMSKvLYC	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 15:28:41.053241	2010-12-23 15:28:40.991579	\N	2010-12-23 15:28:40.991795	2010-12-23 15:28:41.053529	1	Kelton	West	712-923-9019 x30967	root	Johnston Knolls	Samsonmouth	09751-2536	Leicestershire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Zi4Pq7XFhJSxvSshBSL2ScJfZ1fB0q4yczVl76pdkLmjKQoTbJkIbmCeQvrtaU	f	\N	0	0	0	0	0	\N	\N	\N	\N	f	\N
2	agent@nbs.com	c9b505cb0e23ea95e3990399ef0fa5def0e4bf7bdd2fe2820f6d5d18aecedcb59593c33994d07f31a2008d6c94ec2411bb397b86eb943941d7ea047bc2a0f118	a7yMtcZjxx5AYdmP_kAl	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 15:28:41.385022	2010-12-23 15:28:41.363091	\N	2010-12-23 15:28:41.363294	2010-12-23 15:28:41.385289	2	Lucius129311812135556	Kassulke	(109)412-1254	Mallie Stark12931181213552	Candelario Port	Jewesshaven	24974	Tayside	3	\N	0	\N	\N	0	\N	\N	\N	\N	ae1QXRfSxvtg7xnlML3evM6Tp4YYrUzlLeTOQjTZstSaq7MqGbS2Qs5X7Ujv5e	f	\N	0	0	0	0	0	\N	\N	\N	\N	f	\N
3	admin@nbs.com	9a69f71378ec47d69fde1b9a1298e6d7cdd779cca6db9b336cfa4886656f2647b1eb60d52f2dcbdec4a6a1eb0abdffe7a3c4fcd4057f0b9f5b5b786eae02af3b	54GbT5cFQUbUJllrTl2H	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 15:28:42.065925	2010-12-23 15:28:42.045893	\N	2010-12-23 15:28:42.046115	2010-12-23 15:28:42.066206	1	Chance	Balistreri	628-356-6490 x96623	Selmer Lakin129311812204156	Mossie Green	Aliberg	89318	Humberside	1	\N	\N	\N	\N	0	\N	\N	\N	\N	IIHUqd535p2CZKaOTH7PSRIvxjgyIwauw1q4jmLOHAtG2naWorTAUsRUePdCSF	f	\N	0	0	0	0	0	\N	\N	\N	\N	f	\N
4	buyer@nbs.com	23964679e6b368eb67562054795bd927825df29959e3b4e1866d12b3fa19ee9dcb8a67fde90102bb3efddeffc5eaf806cf4e46d952e4bac3fb7623d50e0b01b5	B5lMtQF5k_XJFl2yNIG_	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 15:28:42.119592	2010-12-23 15:28:42.095543	\N	2010-12-23 15:28:42.095754	2010-12-23 15:28:42.11987	48	Adolfo	Simonis	097.030.4588	Garret Watsica129311812209116	Mills Centers	Kassulkeview	91001	Fife	1	\N	\N	\N	\N	0	\N	\N	\N	\N	UapBZLPFwVsDVObMyMqFmwdDpSX2s6g8tYMtHVzZuUfFXV5FgwrCZLaQVVbRQ0	f	t	0	0	0	0	0	\N	\N	\N	\N	f	\N
5	leaduser@nbs.com	1cb92a1e09481586266ef191bbf964c453300dc96ca221414a168a54209fa2f23d406a2c907314a5ea1acb90160024644fee30de570e4b4e64c01ad95baa1006	EfPEWoeWUQ_JVK_48geJ	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 15:28:42.307156	2010-12-23 15:28:42.149296	\N	2010-12-23 15:28:42.149501	2010-12-23 15:28:42.321094	64	Aaron	Effertz	986-645-4666 x713	Alberta Herman12931181221449	McDermott Walk	Lake Amiya	13299	County Tyrone	1	\N	\N	4	\N	0	\N	\N	\N	\N	qCbDIWmQ8MbcE2QOI0eYkgEVqVHvOCifYTRhRTChJaG88VmJId1VaJTqRk8puV	f	\N	0	0	0	0	0	\N	\N	\N	\N	f	\N
\.


--
-- PostgreSQL database dump complete
--

