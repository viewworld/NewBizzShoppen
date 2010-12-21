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
1	1	dk	About us	About us	2010-12-21 13:05:30.022439	2010-12-21 13:05:30.022439
2	1	en	About us	About us	2010-12-21 13:05:30.037534	2010-12-21 13:05:30.037534
3	2	dk	Privacy	Privacy	2010-12-21 13:05:30.068428	2010-12-21 13:05:30.068428
4	2	en	Privacy	Privacy	2010-12-21 13:05:30.204891	2010-12-21 13:05:30.204891
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-21 13:05:30.235012	2010-12-21 13:05:30.235012
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-21 13:05:30.246961	2010-12-21 13:05:30.246961
7	4	dk	Blurb sign up	Blurb sign up	2010-12-21 13:05:30.273821	2010-12-21 13:05:30.273821
8	4	en	Blurb sign up	Blurb sign up	2010-12-21 13:05:30.286139	2010-12-21 13:05:30.286139
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-21 13:05:30.31378	2010-12-21 13:05:30.31378
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-21 13:05:30.326361	2010-12-21 13:05:30.326361
11	6	dk	Blurb agent home	Blurb agent home	2010-12-21 13:05:30.353577	2010-12-21 13:05:30.353577
12	6	en	Blurb agent home	Blurb agent home	2010-12-21 13:05:30.366353	2010-12-21 13:05:30.366353
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-21 13:05:30.394504	2010-12-21 13:05:30.394504
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-21 13:05:30.406915	2010-12-21 13:05:30.406915
15	8	dk	Blurb currencies	Blurb currencies	2010-12-21 13:05:30.434805	2010-12-21 13:05:30.434805
16	8	en	Blurb currencies	Blurb currencies	2010-12-21 13:05:30.447365	2010-12-21 13:05:30.447365
17	9	dk	Reset password	Reset password	2010-12-21 13:05:30.47568	2010-12-21 13:05:30.47568
18	9	en	Reset password	Reset password	2010-12-21 13:05:30.488153	2010-12-21 13:05:30.488153
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-21 13:05:30.01395	2010-12-21 13:05:30.040438	about_us	0	t	2010-12-21 13:05:30.040366
2	Article::Cms	2010-12-21 13:05:30.06454	2010-12-21 13:05:30.207945	privacy	0	t	2010-12-21 13:05:30.207873
3	Article::Cms	2010-12-21 13:05:30.231132	2010-12-21 13:05:30.249858	terms_conditions	0	t	2010-12-21 13:05:30.249789
4	Article::Cms	2010-12-21 13:05:30.26985	2010-12-21 13:05:30.28919	blurb_sign_up	1	t	2010-12-21 13:05:30.289119
5	Article::Cms	2010-12-21 13:05:30.309817	2010-12-21 13:05:30.329409	blurb_buyer_home	1	t	2010-12-21 13:05:30.329335
6	Article::Cms	2010-12-21 13:05:30.349669	2010-12-21 13:05:30.369483	blurb_agent_home	1	t	2010-12-21 13:05:30.36941
7	Article::Cms	2010-12-21 13:05:30.390463	2010-12-21 13:05:30.409945	blurb_start_page_role_selection	1	t	2010-12-21 13:05:30.409867
8	Article::Cms	2010-12-21 13:05:30.430641	2010-12-21 13:05:30.450399	blurb_currencies	1	t	2010-12-21 13:05:30.450331
9	Article::Cms	2010-12-21 13:05:30.471592	2010-12-21 13:05:30.49117	reset_password	2	t	2010-12-21 13:05:30.491097
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
1	Electronics	Occaecati ad eum sint velit saepe.Mollitia eius veritatis non ducimus maiores.	2010-12-21 13:05:28.712681	2010-12-21 13:05:28.712681	\N	1	2	\N	0	1-electronics	0	f
2	Leisure	Esse iste et est.Et voluptas officia ut nesciunt.	2010-12-21 13:05:28.757665	2010-12-21 13:05:28.757665	\N	3	4	\N	0	2-leisure	0	f
3	Business	Doloremque aut id nulla delectus facere quas.Dolores libero excepturi omnis.	2010-12-21 13:05:28.791895	2010-12-21 13:05:29.607217	\N	5	6	\N	7	3-business	7	f
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
1	1	en	Occaecati ad eum sint velit saepe.Mollitia eius veritatis non ducimus maiores.	Electronics	2010-12-21 13:05:28.72196	2010-12-21 13:05:28.72196
2	1	dk	\N	Electronics	2010-12-21 13:05:28.748079	2010-12-21 13:05:28.748079
3	2	en	Esse iste et est.Et voluptas officia ut nesciunt.	Leisure	2010-12-21 13:05:28.762334	2010-12-21 13:05:28.762334
4	2	dk	\N	Leisure	2010-12-21 13:05:28.782484	2010-12-21 13:05:28.782484
5	3	en	Doloremque aut id nulla delectus facere quas.Dolores libero excepturi omnis.	Business	2010-12-21 13:05:28.796497	2010-12-21 13:05:28.796497
6	3	dk	\N	Business	2010-12-21 13:05:28.938539	2010-12-21 13:05:28.938539
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-21 13:05:28.259562	2010-12-21 13:05:28.259562
2	United Kingdom	2010-12-21 13:05:28.264475	2010-12-21 13:05:28.264475
3	Scotland129293672896252	2010-12-21 13:05:28.963939	2010-12-21 13:05:28.963939
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
1	aut	&pound;	%u%n	t	2010-12-21 13:05:29.025403	2010-12-21 13:05:29.025403
2	accusamus	$	%u%n	t	2010-12-21 13:05:29.110115	2010-12-21 13:05:29.110115
3	aut	$	%u%n	t	2010-12-21 13:05:29.177655	2010-12-21 13:05:29.177655
4	delectus	&euro;	%u%n	t	2010-12-21 13:05:29.244456	2010-12-21 13:05:29.244456
5	dignissimos	$	%u%n	t	2010-12-21 13:05:29.438577	2010-12-21 13:05:29.438577
6	laborum	&euro;	%u%n	t	2010-12-21 13:05:29.507726	2010-12-21 13:05:29.507726
7	at	&pound;	%u%n	t	2010-12-21 13:05:29.577504	2010-12-21 13:05:29.577504
8	Euro	&euro;	%u%n	t	2010-12-21 13:05:30.507025	2010-12-21 13:05:30.507025
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-21 13:05:28.290369	2010-12-21 13:05:28.290369
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-21 13:05:28.305686	2010-12-21 13:05:28.305686
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-21 13:05:28.318363	2010-12-21 13:05:28.318363
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-21 13:05:28.453683	2010-12-21 13:05:28.453683
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-21 13:05:28.466265	2010-12-21 13:05:28.466265
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-21 13:05:28.478133	2010-12-21 13:05:28.478133
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-21 13:05:28.490206	2010-12-21 13:05:28.490206
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-21 13:05:28.502197	2010-12-21 13:05:28.502197
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-21 13:05:28.514285	2010-12-21 13:05:28.514285
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-21 13:05:28.526106	2010-12-21 13:05:28.526106
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-21 13:05:28.538419	2010-12-21 13:05:28.538419
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-21 13:05:28.55146	2010-12-21 13:05:28.55146
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-21 13:05:28.563545	2010-12-21 13:05:28.563545
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-21 13:05:28.575271	2010-12-21 13:05:28.575271
15	8	en	Question	<p></p>	2010-12-21 13:05:28.587361	2010-12-21 13:05:28.587361
16	8	dk	[DK] Question	<p></p>	2010-12-21 13:05:28.599549	2010-12-21 13:05:28.599549
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-21 13:05:28.28136	2010-12-21 13:05:28.301405
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-21 13:05:28.313754	2010-12-21 13:05:28.326336
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-21 13:05:28.461757	2010-12-21 13:05:28.473829
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-21 13:05:28.485957	2010-12-21 13:05:28.49821
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-21 13:05:28.509869	2010-12-21 13:05:28.522078
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-21 13:05:28.53396	2010-12-21 13:05:28.546228
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-21 13:05:28.559243	2010-12-21 13:05:28.571154
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-21 13:05:28.582984	2010-12-21 13:05:28.595362
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

COPY lead_translations (id, lead_id, locale, description, header, hidden_description, created_at, updated_at) FROM stdin;
1	1	dk	Sint sed dolorum accusamus laboriosam quo labore.Et molestiae voluptas quis.	Big deal on printers	Minus quis modi dolorum ex nam nulla non.Quos sit quas id iusto ut voluptates.	2010-12-21 13:05:29.0756	2010-12-21 13:05:29.0756
2	2	dk	Perspiciatis quo dicta similique magni enim.Voluptatum architecto quo ipsum.	Drills required	Nulla quia consequatur aliquam incidunt consequuntur hic enim.Et ut non et qui totam.	2010-12-21 13:05:29.146932	2010-12-21 13:05:29.146932
3	3	dk	Laborum cupiditate magnam ut.Debitis minima quia non voluptas consequuntur.	Need assistance in selling a car	Commodi asperiores autem et a ut accusamus aut dolor.Incidunt perferendis non quaerat voluptatem quis ut in.	2010-12-21 13:05:29.214199	2010-12-21 13:05:29.214199
4	4	dk	Molestiae perspiciatis dolorum voluptates voluptatem fugiat.Dolores blanditiis maxime totam omnis aut optio aspernatur ut.	Ipod shipment	Illo possimus alias quis atque similique et.Non est nam voluptas ea sit aut accusantium.	2010-12-21 13:05:29.28142	2010-12-21 13:05:29.28142
5	5	dk	Sint tempora commodi facilis aut labore ut et beatae.Consequatur qui consectetur labore et numquam.	Trip to amazonia - looking for offer	Est aut provident dolore impedit labore.Tenetur asperiores recusandae sequi.	2010-12-21 13:05:29.476587	2010-12-21 13:05:29.476587
6	6	dk	Tempore enim ipsum et facere praesentium nesciunt consectetur quia.Magni nemo earum quis.	LCD - Huge amounts	Debitis nostrum amet magni at sed ut.Odit voluptas dolores fugiat velit qui aut hic et.	2010-12-21 13:05:29.544775	2010-12-21 13:05:29.544775
7	7	dk	Cum expedita quia ut et repellendus velit.Voluptatem consequatur autem eligendi libero vitae.	GPS receivers required	Officiis repudiandae nobis iste accusantium consectetur soluta est.Odit ut et nisi ut sint.	2010-12-21 13:05:29.613946	2010-12-21 13:05:29.613946
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Sint sed dolorum accusamus laboriosam quo labore.Et molestiae voluptas quis.	Minus quis modi dolorum ex nam nulla non.Quos sit quas id iusto ut voluptates.	2	User::Agent	0	264.0	809.0	1	Schneider	Reba Gleichner	(079)562-3990 x0496	leola_wolf@runolfsson.us	319 Paige Locks	2010-12-21 13:05:29.034639	2010-12-21 13:05:29.034639	2010-12-26	Newell129293672896173 Carter	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Perspiciatis quo dicta similique magni enim.Voluptatum architecto quo ipsum.	Nulla quia consequatur aliquam incidunt consequuntur hic enim.Et ut non et qui totam.	2	User::Agent	0	145.0	450.0	1	Haley	Graciela Schmidt	833.965.6782 x920	kevon@hesselbradtke.uk	8949 Fay Flats	2010-12-21 13:05:29.116067	2010-12-21 13:05:29.116067	2010-12-26	Newell129293672896173 Carter	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Laborum cupiditate magnam ut.Debitis minima quia non voluptas consequuntur.	Commodi asperiores autem et a ut accusamus aut dolor.Incidunt perferendis non quaerat voluptatem quis ut in.	2	User::Agent	0	223.0	967.0	1	Rolfson	Rosanna Pollich	994-464-2317	misty@jenkins.co.uk	641 Pfannerstill Shoals	2010-12-21 13:05:29.183522	2010-12-21 13:05:29.183522	2010-12-26	Newell129293672896173 Carter	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Molestiae perspiciatis dolorum voluptates voluptatem fugiat.Dolores blanditiis maxime totam omnis aut optio aspernatur ut.	Illo possimus alias quis atque similique et.Non est nam voluptas ea sit aut accusantium.	2	User::Agent	0	414.0	506.0	1	Raynor	Lauren Huel	1-537-384-2837	curtis@willms.us	5214 Wiza Ports	2010-12-21 13:05:29.250353	2010-12-21 13:05:29.250353	2010-12-26	Newell129293672896173 Carter	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Sint tempora commodi facilis aut labore ut et beatae.Consequatur qui consectetur labore et numquam.	Est aut provident dolore impedit labore.Tenetur asperiores recusandae sequi.	2	User::Agent	0	995.0	66.0	1	Hauck	Norberto Champlin	1-062-685-4556	kaleigh@dare.com	96728 Lyric Center	2010-12-21 13:05:29.44444	2010-12-21 13:05:29.44444	2010-12-26	Newell129293672896173 Carter	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Tempore enim ipsum et facere praesentium nesciunt consectetur quia.Magni nemo earum quis.	Debitis nostrum amet magni at sed ut.Odit voluptas dolores fugiat velit qui aut hic et.	2	User::Agent	0	712.0	48.0	1	Kozeybode	Brady Bednar	(531)519-5682 x754	nathan@streich.co.uk	15761 Leslie Squares	2010-12-21 13:05:29.513656	2010-12-21 13:05:29.513656	2010-12-26	Newell129293672896173 Carter	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Cum expedita quia ut et repellendus velit.Voluptatem consequatur autem eligendi libero vitae.	Officiis repudiandae nobis iste accusantium consectetur soluta est.Odit ut et nisi ut sint.	2	User::Agent	0	447.0	799.0	1	Marks	Maxie Leuschke IV	1-034-844-4572	dayna@auerlynch.biz	1841 Fabiola Fall	2010-12-21 13:05:29.583419	2010-12-21 13:05:29.583419	2010-12-26	Newell129293672896173 Carter	1	t	\N	0	0	f	f	-1	7
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
1	default_payout_delay	--- 0\n	2010-12-21 13:05:28.228966	2010-12-21 13:05:28.228966
2	default_leads_per_page	--- 5\n	2010-12-21 13:05:28.234621	2010-12-21 13:05:28.234621
3	certification_level_1	--- 10\n	2010-12-21 13:05:28.236786	2010-12-21 13:05:28.236786
4	certification_level_2	--- 20\n	2010-12-21 13:05:28.238828	2010-12-21 13:05:28.238828
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-21 13:05:28.240895	2010-12-21 13:05:28.240895
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-21 13:05:28.242944	2010-12-21 13:05:28.242944
7	invoicing_seller_name	--- Fairleads\n	2010-12-21 13:05:28.245029	2010-12-21 13:05:28.245029
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-21 13:05:28.247132	2010-12-21 13:05:28.247132
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-21 13:05:28.249194	2010-12-21 13:05:28.249194
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-21 13:05:28.251235	2010-12-21 13:05:28.251235
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
1	blazejek@gmail.com	2f4f2589ac8c288900e36ac668a9415e1da4c82e09de1b7691a46bf9e7361b360b52746979a88f57f1ada4f76b9012a266e9f0255a0fddacec9729a9c2aa057d	RWTUo5E7HlvDLgA18HVA	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 13:05:28.6915	2010-12-21 13:05:28.632431	\N	2010-12-21 13:05:28.632665	2010-12-21 13:05:28.691784	1	Abbey	Jones	1-464-418-5630	root	Harold Trafficway	West Palmachester	74606	Buckinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	owotAWcCEdClnvZD612K8TC6ttsnP7RXmj2GeRUvfdrqGZeCHMU0VsEksww3Ic	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	cc022b36b5aeab47ee3766eff4c9b0a68679d86391fa5dce0c63c0363151cb680a462327fa75b22a8ee4516ea07161377f463ec84e61eb03ebd7c76aa8116d87	KGZZB5QLuUHCcGMUuR_W	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 13:05:28.991447	2010-12-21 13:05:28.969365	\N	2010-12-21 13:05:28.969574	2010-12-21 13:05:28.991721	2	Newell129293672896173	Carter	1-655-336-7495	Efrain Lemke12929367289615	Legros Unions	Marionville	39376-7156	Kent	3	\N	0	\N	\N	0	\N	\N	\N	\N	TbbdbLXMZTYzKeOktfvMqPt7Ho9fNd9IDQ52SONhU2rQVyzKDLNTQgSLe4Xv9p	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	a4bf35dd3ab5e4ceef5e64b841a712930fea78aa343ff1685f0675eed1b460afd749dde29abbb7425121f2be4b249156e83b0005c9442033cd9e5efdd5384bb9	04qpfHsRpSAaX3gBFFD1	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 13:05:29.687543	2010-12-21 13:05:29.667852	\N	2010-12-21 13:05:29.668061	2010-12-21 13:05:29.687867	1	Alisha	Kohler	(480)791-1455	Vickie Gleichner129293672966365	Mosciski Common	Skyebury	28893	Rutland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	0IZQ9gfYllQaLSEmYBKdwO23vfZb2TVVrCJqUL8P6gPlV8d4LxX7JIZoNPSmJi	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	3aec2d8164854a6d6b37f1081c6536ddf02c4cd35ebe00dd545086cfc66678aa00d279d7aa289dc74b16a01166c6cc4f73b5bee01fb88c43e81142fa24ac2592	LdlRgkSnNNUCL_Dhg5U1	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 13:05:29.739013	2010-12-21 13:05:29.717284	\N	2010-12-21 13:05:29.717498	2010-12-21 13:05:29.739308	48	Gideon	Leffler	1-674-491-5772	Winnifred Beatty129293672971269	Douglas Way	East Bettye	79342	County Antrim	1	\N	\N	\N	\N	0	\N	\N	\N	\N	GkkJfwjEBee4AKkdCEFOenAlpwJ7QtU9eoof4LsrjIFc8XTzOfOHz07P2q30W7	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	45194d374e9d474ebc1d419456967ddc761e4256c254cae5085f83965e933d7d98e0d6b3a17993963fa7c790b048b746dd7236eb1f5906a9031a171505952c11	aSw1mOc2zMV1gFQH71XA	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 13:05:29.920389	2010-12-21 13:05:29.898001	\N	2010-12-21 13:05:29.898217	2010-12-21 13:05:29.934818	64	Deven	Dare	1-601-264-0776	Rodrigo Kunde129293672989321	Friesen Walks	Alexandriafurt	60231	Northamptonshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	YcdJvptKYHCNOH9IlZLwUbmgQaihpOW0C454o0tU8bU6rVboByK0pQ5giAPbek	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

