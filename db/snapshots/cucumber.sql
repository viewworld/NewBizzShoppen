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
1	1	dk	About us	About us	2010-12-23 14:03:22.306529	2010-12-23 14:03:22.306529
2	1	en	About us	About us	2010-12-23 14:03:22.328599	2010-12-23 14:03:22.328599
3	2	dk	Privacy	Privacy	2010-12-23 14:03:22.384364	2010-12-23 14:03:22.384364
4	2	en	Privacy	Privacy	2010-12-23 14:03:22.401012	2010-12-23 14:03:22.401012
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-23 14:03:22.448721	2010-12-23 14:03:22.448721
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-23 14:03:22.467561	2010-12-23 14:03:22.467561
7	4	dk	Blurb sign up	Blurb sign up	2010-12-23 14:03:22.512691	2010-12-23 14:03:22.512691
8	4	en	Blurb sign up	Blurb sign up	2010-12-23 14:03:22.530345	2010-12-23 14:03:22.530345
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-23 14:03:22.573166	2010-12-23 14:03:22.573166
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-23 14:03:22.589275	2010-12-23 14:03:22.589275
11	6	dk	Blurb agent home	Blurb agent home	2010-12-23 14:03:22.638306	2010-12-23 14:03:22.638306
12	6	en	Blurb agent home	Blurb agent home	2010-12-23 14:03:22.655013	2010-12-23 14:03:22.655013
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-23 14:03:22.713669	2010-12-23 14:03:22.713669
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-23 14:03:22.738173	2010-12-23 14:03:22.738173
15	8	dk	Blurb currencies	Blurb currencies	2010-12-23 14:03:22.785027	2010-12-23 14:03:22.785027
16	8	en	Blurb currencies	Blurb currencies	2010-12-23 14:03:22.811104	2010-12-23 14:03:22.811104
17	9	dk	Reset password	Reset password	2010-12-23 14:03:22.853172	2010-12-23 14:03:22.853172
18	9	en	Reset password	Reset password	2010-12-23 14:03:22.86935	2010-12-23 14:03:22.86935
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-23 14:03:22.29531	2010-12-23 14:03:22.335757	about_us	0	t	2010-12-23 14:03:22.335619
2	Article::Cms	2010-12-23 14:03:22.377767	2010-12-23 14:03:22.406472	privacy	0	t	2010-12-23 14:03:22.406371
3	Article::Cms	2010-12-23 14:03:22.443607	2010-12-23 14:03:22.472934	terms_conditions	0	t	2010-12-23 14:03:22.472836
4	Article::Cms	2010-12-23 14:03:22.505543	2010-12-23 14:03:22.536965	blurb_sign_up	1	t	2010-12-23 14:03:22.536862
5	Article::Cms	2010-12-23 14:03:22.568292	2010-12-23 14:03:22.595702	blurb_buyer_home	1	t	2010-12-23 14:03:22.595599
6	Article::Cms	2010-12-23 14:03:22.633282	2010-12-23 14:03:22.660402	blurb_agent_home	1	t	2010-12-23 14:03:22.660301
7	Article::Cms	2010-12-23 14:03:22.705228	2010-12-23 14:03:22.743614	blurb_start_page_role_selection	1	t	2010-12-23 14:03:22.743512
8	Article::Cms	2010-12-23 14:03:22.777114	2010-12-23 14:03:22.818701	blurb_currencies	1	t	2010-12-23 14:03:22.818592
9	Article::Cms	2010-12-23 14:03:22.848261	2010-12-23 14:03:22.875632	reset_password	2	t	2010-12-23 14:03:22.875532
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
1	Electronics	Vel rerum temporibus quidem porro ullam voluptates.Quia ut et ratione.	2010-12-23 14:03:20.857134	2010-12-23 14:03:20.857134	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Cumque quis sunt fugit itaque.Voluptatem fugit quos nihil similique enim repudiandae.	2010-12-23 14:03:20.922225	2010-12-23 14:03:20.922225	\N	3	4	\N	0	2-leisure	f	0
3	Business	Delectus aliquid esse debitis voluptatem molestias quia ducimus.Est veritatis quo quidem necessitatibus.	2010-12-23 14:03:20.983699	2010-12-23 14:03:21.834487	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Vel rerum temporibus quidem porro ullam voluptates.Quia ut et ratione.	Electronics	2010-12-23 14:03:20.868681	2010-12-23 14:03:20.868681
2	1	dk	\N	Electronics	2010-12-23 14:03:20.905819	2010-12-23 14:03:20.905819
3	2	en	Cumque quis sunt fugit itaque.Voluptatem fugit quos nihil similique enim repudiandae.	Leisure	2010-12-23 14:03:20.927726	2010-12-23 14:03:20.927726
4	2	dk	\N	Leisure	2010-12-23 14:03:20.960633	2010-12-23 14:03:20.960633
5	3	en	Delectus aliquid esse debitis voluptatem molestias quia ducimus.Est veritatis quo quidem necessitatibus.	Business	2010-12-23 14:03:20.993457	2010-12-23 14:03:20.993457
6	3	dk	\N	Business	2010-12-23 14:03:21.024464	2010-12-23 14:03:21.024464
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-23 14:03:19.729617	2010-12-23 14:03:19.729617
2	United Kingdom	2010-12-23 14:03:19.739439	2010-12-23 14:03:19.739439
3	England129311300105921	2010-12-23 14:03:21.060928	2010-12-23 14:03:21.060928
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
1	Euro	&euro;	%u%n	t	2010-12-23 14:03:20.81877	2010-12-23 14:03:20.81877
2	PLN	&pln;	%u%n	t	2010-12-23 14:03:20.828738	2010-12-23 14:03:20.828738
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2010-12-23 14:03:19.778839	2010-12-23 14:03:19.778839
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2010-12-23 14:03:19.811806	2010-12-23 14:03:19.811806
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2010-12-23 14:03:19.841353	2010-12-23 14:03:19.841353
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2010-12-23 14:03:19.867208	2010-12-23 14:03:19.867208
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2010-12-23 14:03:20.11008	2010-12-23 14:03:20.11008
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2010-12-23 14:03:20.12879	2010-12-23 14:03:20.12879
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2010-12-23 14:03:20.154707	2010-12-23 14:03:20.154707
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2010-12-23 14:03:20.181538	2010-12-23 14:03:20.181538
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2010-12-23 14:03:20.20128	2010-12-23 14:03:20.20128
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2010-12-23 14:03:20.231015	2010-12-23 14:03:20.231015
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2010-12-23 14:03:20.260598	2010-12-23 14:03:20.260598
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2010-12-23 14:03:20.288318	2010-12-23 14:03:20.288318
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2010-12-23 14:03:20.338921	2010-12-23 14:03:20.338921
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2010-12-23 14:03:20.359032	2010-12-23 14:03:20.359032
15	8	en	<p></p>	Question	2010-12-23 14:03:20.380385	2010-12-23 14:03:20.380385
16	8	dk	<p></p>	[DK] Question	2010-12-23 14:03:20.405426	2010-12-23 14:03:20.405426
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-23 14:03:19.766551	2010-12-23 14:03:19.802334
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-23 14:03:19.835546	2010-12-23 14:03:19.857095
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-23 14:03:20.102241	2010-12-23 14:03:20.123113
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-23 14:03:20.146827	2010-12-23 14:03:20.175523
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-23 14:03:20.195554	2010-12-23 14:03:20.22224
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-23 14:03:20.253696	2010-12-23 14:03:20.279433
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-23 14:03:20.332483	2010-12-23 14:03:20.351997
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-23 14:03:20.373352	2010-12-23 14:03:20.396814
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

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
1	1	dk	Placeat corporis temporibus explicabo sed ab eum suscipit.Fugiat quaerat ipsam quis soluta voluptatem asperiores.	Officiis quaerat recusandae accusantium nemo sunt ducimus qui quas.Adipisci officiis libero omnis assumenda voluptates voluptas quibusdam ut.	Big deal on printers	2010-12-23 14:03:21.24008	2010-12-23 14:03:21.24008
2	2	dk	Itaque sint optio odit.Adipisci repudiandae necessitatibus architecto corporis vel.	Dolorem et qui ipsa.Voluptatum delectus voluptate ratione numquam quasi ipsum aperiam.	Drills required	2010-12-23 14:03:21.344829	2010-12-23 14:03:21.344829
3	3	dk	Ipsam ut aut fuga omnis molestiae pariatur.Exercitationem ipsum possimus aut quod sequi quasi sit.	Explicabo odit dolorum neque.Necessitatibus est sunt excepturi consequatur sequi quibusdam exercitationem.	Need assistance in selling a car	2010-12-23 14:03:21.44269	2010-12-23 14:03:21.44269
4	4	dk	Officiis consequatur sed laboriosam aut praesentium maiores aperiam.Est voluptatem repellendus qui sit.	Repellat rerum cupiditate id veritatis consequatur.Quos perspiciatis qui fuga explicabo et ea.	Ipod shipment	2010-12-23 14:03:21.533525	2010-12-23 14:03:21.533525
5	5	dk	Officia culpa soluta voluptas.Deleniti tenetur ullam in velit aliquam aut.	Distinctio repellendus magni eos rem ad enim ea qui.Dolorum enim perspiciatis earum aut autem atque rerum et.	Trip to amazonia - looking for offer	2010-12-23 14:03:21.641372	2010-12-23 14:03:21.641372
6	6	dk	Enim esse qui aut accusantium.Atque pariatur cupiditate similique vitae.	Qui molestiae provident similique quod distinctio a et.Dolorem excepturi laudantium eveniet id est animi accusamus.	LCD - Huge amounts	2010-12-23 14:03:21.734854	2010-12-23 14:03:21.734854
7	7	dk	Sed quia rem est recusandae id fuga perferendis.Exercitationem laborum beatae perferendis cupiditate.	Facilis enim officiis omnis quas aut.Quia reprehenderit deleniti reiciendis.	GPS receivers required	2010-12-23 14:03:21.844013	2010-12-23 14:03:21.844013
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Placeat corporis temporibus explicabo sed ab eum suscipit.Fugiat quaerat ipsam quis soluta voluptatem asperiores.	Officiis quaerat recusandae accusantium nemo sunt ducimus qui quas.Adipisci officiis libero omnis assumenda voluptates voluptas quibusdam ut.	2	User::Agent	0	225.0	876.0	1	Doyle	Hayley Glover	1-495-295-6577	elwyn.von@oconner.name	75044 Doyle Springs	2010-12-23 14:03:21.1773	2010-12-23 14:03:21.1773	2010-12-28	Halle12931130010583 Champlin	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Itaque sint optio odit.Adipisci repudiandae necessitatibus architecto corporis vel.	Dolorem et qui ipsa.Voluptatum delectus voluptate ratione numquam quasi ipsum aperiam.	2	User::Agent	0	467.0	78.0	1	Dachjacobs	Eliezer Nader	047.306.3642 x8964	marcus@beatty.name	5706 Dorthy Courts	2010-12-23 14:03:21.295381	2010-12-23 14:03:21.295381	2010-12-28	Halle12931130010583 Champlin	1	t	\N	0	0	f	f	-1	1
3	Need assistance in selling a car	3	Ipsam ut aut fuga omnis molestiae pariatur.Exercitationem ipsum possimus aut quod sequi quasi sit.	Explicabo odit dolorum neque.Necessitatibus est sunt excepturi consequatur sequi quibusdam exercitationem.	2	User::Agent	0	860.0	881.0	1	Green	Regan Kassulke	291-549-6712	cassie.thompson@ondricka.info	201 Darion Terrace	2010-12-23 14:03:21.396832	2010-12-23 14:03:21.396832	2010-12-28	Halle12931130010583 Champlin	1	t	\N	0	0	f	f	-1	1
4	Ipod shipment	3	Officiis consequatur sed laboriosam aut praesentium maiores aperiam.Est voluptatem repellendus qui sit.	Repellat rerum cupiditate id veritatis consequatur.Quos perspiciatis qui fuga explicabo et ea.	2	User::Agent	0	529.0	858.0	1	Lebsackgislason	Ms. Jabari Nolan	811-537-6498 x39863	leila@zemlak.co.uk	6464 Macie Summit	2010-12-23 14:03:21.491982	2010-12-23 14:03:21.491982	2010-12-28	Halle12931130010583 Champlin	1	t	\N	0	0	f	f	-1	1
5	Trip to amazonia - looking for offer	3	Officia culpa soluta voluptas.Deleniti tenetur ullam in velit aliquam aut.	Distinctio repellendus magni eos rem ad enim ea qui.Dolorum enim perspiciatis earum aut autem atque rerum et.	2	User::Agent	0	401.0	991.0	1	Orn	Winifred Brown	219.488.2692 x50436	rhoda@beatty.us	8036 Boyle Highway	2010-12-23 14:03:21.590051	2010-12-23 14:03:21.590051	2010-12-28	Halle12931130010583 Champlin	1	t	\N	0	0	f	f	-1	1
6	LCD - Huge amounts	3	Enim esse qui aut accusantium.Atque pariatur cupiditate similique vitae.	Qui molestiae provident similique quod distinctio a et.Dolorem excepturi laudantium eveniet id est animi accusamus.	2	User::Agent	0	3.0	517.0	1	Armstrong	Jordon Ferry	939-363-8713 x93420	lilliana_bailey@legros.biz	658 Giovanna Cove	2010-12-23 14:03:21.69301	2010-12-23 14:03:21.69301	2010-12-28	Halle12931130010583 Champlin	1	t	\N	0	0	f	f	-1	1
7	GPS receivers required	3	Sed quia rem est recusandae id fuga perferendis.Exercitationem laborum beatae perferendis cupiditate.	Facilis enim officiis omnis quas aut.Quia reprehenderit deleniti reiciendis.	2	User::Agent	0	550.0	263.0	1	Streich	Marlen Sipes	(511)308-4671	nat.hills@hagenes.co.uk	6660 Devante Circle	2010-12-23 14:03:21.792845	2010-12-23 14:03:21.792845	2010-12-28	Halle12931130010583 Champlin	1	t	\N	0	0	f	f	-1	1
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
1	default_payout_delay	--- 0\n	2010-12-23 14:03:19.634497	2010-12-23 14:03:19.634497
2	default_leads_per_page	--- 5\n	2010-12-23 14:03:19.64708	2010-12-23 14:03:19.64708
3	certification_level_1	--- 10\n	2010-12-23 14:03:19.654157	2010-12-23 14:03:19.654157
4	certification_level_2	--- 20\n	2010-12-23 14:03:19.663675	2010-12-23 14:03:19.663675
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-23 14:03:19.671576	2010-12-23 14:03:19.671576
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-23 14:03:19.678461	2010-12-23 14:03:19.678461
7	invoicing_seller_name	--- Fairleads\n	2010-12-23 14:03:19.685628	2010-12-23 14:03:19.685628
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-23 14:03:19.6933	2010-12-23 14:03:19.6933
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-23 14:03:19.702027	2010-12-23 14:03:19.702027
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-23 14:03:19.708981	2010-12-23 14:03:19.708981
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
1	blazejek@gmail.com	b11cbc9b132a344d45343859aa637dab91d43a12fbf50ddaa39186541abd14eb7c281486c99d6906fa7154b63653633b17019a126703d6460183865ded4dd6e4	CIlW_PX7Gax_taggCgCn	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 14:03:20.801244	2010-12-23 14:03:20.458578	\N	2010-12-23 14:03:20.458891	2010-12-23 14:03:20.801906	1	Casimir	Boyle	(096)862-0004 x7728	root	Satterfield Mall	Predovicberg	45419-1986	Dyfed	1	\N	\N	\N	\N	0	\N	\N	\N	\N	MAzsI8BA1dVhIEtCEvVIucjUyqg9Fij2KGAn1WNHB4TWiS9kuhN6ZsOcoaioAK	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	fc4c322f9e573906886bb23ac899fd0641fd80c9f31feb158a1f59b628c2a40ef45455fee1d6c705be3fd6a2ad0950feb83e96be4134ccefcf39f6517a28f632	WYbcBsS5IGr_wVByCa4S	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 14:03:21.114835	2010-12-23 14:03:21.074226	\N	2010-12-23 14:03:21.074702	2010-12-23 14:03:21.115477	2	Halle12931130010583	Champlin	1-813-268-4478 x71308	Shyanne Renner129311300105806	Corkery Junctions	North Asa	03221	County Armagh	3	\N	0	\N	\N	0	\N	\N	\N	\N	19iJbAEJuIrJuqrPc7UXP8O7l1UxYw40LpMV00LUYIm4dQJ1z3dqjLT4GYT9dZ	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	a58c3bc98c3160f68481f50a7bceff911fc80f897f4f88beb8b619dd98f0491910454362611f12f07663ae695eaf5d626d8266020da64cb1dfa91b79d3c795ad	dJKmzGCkkI6Rdi2aLXWe	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 14:03:21.971322	2010-12-23 14:03:21.926152	\N	2010-12-23 14:03:21.92664	2010-12-23 14:03:21.971741	1	Tyler	Turner	(227)498-1512	Adeline Jewess II129311300191902	Moen Ville	Port Lila	78212-4036	Berkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	QShxZEzwk3Kxykrv0I0PhHz1aiHhsShAH42kGagCpnu6nY3YFHAPj1xFJPoRU4	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	da10912e56f438890d9a74166cc17032b9f431003cd0a55ba5792ebfda27b93a89ed6b1bc9939ede4bf305158abcda333dbf72ebf3e5d8c009934a5f224acc0f	v8OrjFCzjhcURG-9uBqH	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 14:03:22.055781	2010-12-23 14:03:22.026215	\N	2010-12-23 14:03:22.026504	2010-12-23 14:03:22.056198	48	Joel	Grimes	087.611.4462	Alta Bednar129311300201905	Hollie Squares	Enochburgh	18830-8490	South Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	7DIz8QYjBh9qxBMEnXo9pZ5gmiH2pKbPI84gBFCYm1x3Nxt4waXFahgA4PwGbG	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	5d0f8f256f33f0b2aaabd420dc42b6733c96a0ecf8c3f2af5fbcacf910d6e53068868c5aeaa6b07af382cd4787a70cd6159266836ab3275b99bf6e5d119e508e	092k0Pmhf1bP_GwGXUzr	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 14:03:22.135072	2010-12-23 14:03:22.098139	\N	2010-12-23 14:03:22.098454	2010-12-23 14:03:22.166843	64	Winston	Swift	(764)057-9445 x5909	Hyman Lynch129311300209061	Marley Avenue	South Mozelle	03834-7641	Devon	1	\N	\N	4	\N	0	\N	\N	\N	\N	AZepvspHwZQEPQBTCFgoY9tN8MOi1CLsDOeCoRljMyfzSFYkTIogNSBCbPaFNs	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

