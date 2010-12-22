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
1	1	dk	About us	About us	2010-12-22 14:07:12.53886	2010-12-22 14:07:12.53886
2	1	en	About us	About us	2010-12-22 14:07:12.553878	2010-12-22 14:07:12.553878
3	2	dk	Privacy	Privacy	2010-12-22 14:07:12.583952	2010-12-22 14:07:12.583952
4	2	en	Privacy	Privacy	2010-12-22 14:07:12.596202	2010-12-22 14:07:12.596202
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-22 14:07:12.757785	2010-12-22 14:07:12.757785
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-22 14:07:12.769712	2010-12-22 14:07:12.769712
7	4	dk	Blurb sign up	Blurb sign up	2010-12-22 14:07:12.797671	2010-12-22 14:07:12.797671
8	4	en	Blurb sign up	Blurb sign up	2010-12-22 14:07:12.810309	2010-12-22 14:07:12.810309
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-22 14:07:12.838651	2010-12-22 14:07:12.838651
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-22 14:07:12.851643	2010-12-22 14:07:12.851643
11	6	dk	Blurb agent home	Blurb agent home	2010-12-22 14:07:12.879116	2010-12-22 14:07:12.879116
12	6	en	Blurb agent home	Blurb agent home	2010-12-22 14:07:12.891378	2010-12-22 14:07:12.891378
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-22 14:07:12.919577	2010-12-22 14:07:12.919577
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-22 14:07:12.93226	2010-12-22 14:07:12.93226
15	8	dk	Blurb currencies	Blurb currencies	2010-12-22 14:07:12.961507	2010-12-22 14:07:12.961507
16	8	en	Blurb currencies	Blurb currencies	2010-12-22 14:07:12.974275	2010-12-22 14:07:12.974275
17	9	dk	Reset password	Reset password	2010-12-22 14:07:13.002632	2010-12-22 14:07:13.002632
18	9	en	Reset password	Reset password	2010-12-22 14:07:13.01528	2010-12-22 14:07:13.01528
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-22 14:07:12.529954	2010-12-22 14:07:12.556901	about_us	0	t	2010-12-22 14:07:12.556823
2	Article::Cms	2010-12-22 14:07:12.580032	2010-12-22 14:07:12.599165	privacy	0	t	2010-12-22 14:07:12.599088
3	Article::Cms	2010-12-22 14:07:12.753914	2010-12-22 14:07:12.772673	terms_conditions	0	t	2010-12-22 14:07:12.772598
4	Article::Cms	2010-12-22 14:07:12.793578	2010-12-22 14:07:12.81364	blurb_sign_up	1	t	2010-12-22 14:07:12.813466
5	Article::Cms	2010-12-22 14:07:12.834552	2010-12-22 14:07:12.854707	blurb_buyer_home	1	t	2010-12-22 14:07:12.854627
6	Article::Cms	2010-12-22 14:07:12.875021	2010-12-22 14:07:12.894506	blurb_agent_home	1	t	2010-12-22 14:07:12.894428
7	Article::Cms	2010-12-22 14:07:12.915544	2010-12-22 14:07:12.935549	blurb_start_page_role_selection	1	t	2010-12-22 14:07:12.935465
8	Article::Cms	2010-12-22 14:07:12.957336	2010-12-22 14:07:12.977401	blurb_currencies	1	t	2010-12-22 14:07:12.977326
9	Article::Cms	2010-12-22 14:07:12.998544	2010-12-22 14:07:13.018447	reset_password	2	t	2010-12-22 14:07:13.018372
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
1	Electronics	Rerum esse doloribus quis voluptatem et nulla qui est.Iste rem fugit est modi culpa et id rerum.	2010-12-22 14:07:11.195703	2010-12-22 14:07:11.195703	\N	1	2	\N	0	1-electronics	0	f
2	Leisure	Cum aspernatur accusamus natus.Voluptate odit quod itaque quo pariatur.	2010-12-22 14:07:11.244952	2010-12-22 14:07:11.244952	\N	3	4	\N	0	2-leisure	0	f
3	Business	Ad sit ea fuga aut veritatis vitae eos.Earum quia autem consequuntur aut rem.	2010-12-22 14:07:11.277966	2010-12-22 14:07:12.117346	\N	5	6	\N	7	3-business	7	f
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
1	1	en	Rerum esse doloribus quis voluptatem et nulla qui est.Iste rem fugit est modi culpa et id rerum.	Electronics	2010-12-22 14:07:11.204758	2010-12-22 14:07:11.204758
2	1	dk	\N	Electronics	2010-12-22 14:07:11.234829	2010-12-22 14:07:11.234829
3	2	en	Cum aspernatur accusamus natus.Voluptate odit quod itaque quo pariatur.	Leisure	2010-12-22 14:07:11.249351	2010-12-22 14:07:11.249351
4	2	dk	\N	Leisure	2010-12-22 14:07:11.268532	2010-12-22 14:07:11.268532
5	3	en	Ad sit ea fuga aut veritatis vitae eos.Earum quia autem consequuntur aut rem.	Business	2010-12-22 14:07:11.282637	2010-12-22 14:07:11.282637
6	3	dk	\N	Business	2010-12-22 14:07:11.302349	2010-12-22 14:07:11.302349
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-22 14:07:10.73763	2010-12-22 14:07:10.73763
2	United Kingdom	2010-12-22 14:07:10.742313	2010-12-22 14:07:10.742313
3	Wales129302683145252	2010-12-22 14:07:11.453874	2010-12-22 14:07:11.453874
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
1	sunt	&euro;	%u%n	t	2010-12-22 14:07:11.517684	2010-12-22 14:07:11.517684
2	reprehenderit	$	%u%n	t	2010-12-22 14:07:11.603357	2010-12-22 14:07:11.603357
3	et	&pound;	%u%n	t	2010-12-22 14:07:11.6811	2010-12-22 14:07:11.6811
4	nostrum	&pound;	%u%n	t	2010-12-22 14:07:11.7545	2010-12-22 14:07:11.7545
5	ipsam	&euro;	%u%n	t	2010-12-22 14:07:11.949788	2010-12-22 14:07:11.949788
6	autem	&euro;	%u%n	t	2010-12-22 14:07:12.018644	2010-12-22 14:07:12.018644
7	ab	$	%u%n	t	2010-12-22 14:07:12.087528	2010-12-22 14:07:12.087528
8	Euro	&euro;	%u%n	t	2010-12-22 14:07:13.034702	2010-12-22 14:07:13.034702
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-22 14:07:10.768108	2010-12-22 14:07:10.768108
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-22 14:07:10.783429	2010-12-22 14:07:10.783429
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-22 14:07:10.796451	2010-12-22 14:07:10.796451
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-22 14:07:10.808764	2010-12-22 14:07:10.808764
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-22 14:07:10.821584	2010-12-22 14:07:10.821584
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-22 14:07:10.959458	2010-12-22 14:07:10.959458
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-22 14:07:10.971618	2010-12-22 14:07:10.971618
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-22 14:07:10.983506	2010-12-22 14:07:10.983506
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-22 14:07:10.995746	2010-12-22 14:07:10.995746
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-22 14:07:11.00749	2010-12-22 14:07:11.00749
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-22 14:07:11.019383	2010-12-22 14:07:11.019383
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-22 14:07:11.031211	2010-12-22 14:07:11.031211
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-22 14:07:11.044695	2010-12-22 14:07:11.044695
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-22 14:07:11.056696	2010-12-22 14:07:11.056696
15	8	en	Question	<p></p>	2010-12-22 14:07:11.0691	2010-12-22 14:07:11.0691
16	8	dk	[DK] Question	<p></p>	2010-12-22 14:07:11.081182	2010-12-22 14:07:11.081182
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-22 14:07:10.759194	2010-12-22 14:07:10.779028
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-22 14:07:10.791834	2010-12-22 14:07:10.804601
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-22 14:07:10.816994	2010-12-22 14:07:10.955055
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-22 14:07:10.967248	2010-12-22 14:07:10.979436
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-22 14:07:10.991317	2010-12-22 14:07:11.003424
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-22 14:07:11.015105	2010-12-22 14:07:11.027249
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-22 14:07:11.040148	2010-12-22 14:07:11.05254
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-22 14:07:11.064649	2010-12-22 14:07:11.076981
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

COPY lead_translations (id, lead_id, locale, description, header, hidden_description, created_at, updated_at) FROM stdin;
1	1	dk	Quas recusandae optio sed.Harum sunt ipsa temporibus.	Big deal on printers	Non dolores molestias velit.Quod magnam debitis ut a.	2010-12-22 14:07:11.568386	2010-12-22 14:07:11.568386
2	2	dk	Impedit vitae et et similique.Possimus architecto et expedita corporis in est.	Drills required	Error qui eaque voluptas tempore numquam nostrum accusamus.Est libero nam ea nihil qui sed tempore.	2010-12-22 14:07:11.64533	2010-12-22 14:07:11.64533
3	3	dk	Sed soluta quam quia.Eveniet excepturi magni et in ut aut distinctio.	Need assistance in selling a car	Dolore eveniet et accusamus non dignissimos ipsum.Recusandae occaecati quaerat ad sunt.	2010-12-22 14:07:11.72302	2010-12-22 14:07:11.72302
4	4	dk	Molestiae vero libero nisi voluptate accusamus eveniet.Molestias officia rerum occaecati dolorem id omnis molestiae ipsa.	Ipod shipment	Dolores iste nihil amet consequuntur.Earum facere et in quisquam molestias expedita.	2010-12-22 14:07:11.79067	2010-12-22 14:07:11.79067
5	5	dk	Est voluptatibus nobis dolor amet qui quas enim.Facere sapiente dolorem neque.	Trip to amazonia - looking for offer	Sit magnam qui quasi dignissimos eum reprehenderit similique.Et odio eligendi magnam id vel eaque aut ea.	2010-12-22 14:07:11.987128	2010-12-22 14:07:11.987128
6	6	dk	Culpa alias sint ullam aut.Commodi dolores pariatur ad vel.	LCD - Huge amounts	Recusandae rerum velit et sed.Cum est dolores rerum est alias.	2010-12-22 14:07:12.056624	2010-12-22 14:07:12.056624
7	7	dk	Voluptas aspernatur nisi quasi cum cupiditate facilis occaecati similique.Voluptas corporis dolorem qui velit nemo quia.	GPS receivers required	Necessitatibus ut perspiciatis in corrupti vel adipisci velit.Sit enim totam quis aliquid.	2010-12-22 14:07:12.123975	2010-12-22 14:07:12.123975
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Quas recusandae optio sed.Harum sunt ipsa temporibus.	Non dolores molestias velit.Quod magnam debitis ut a.	2	User::Agent	0	970.0	71.0	1	Parker	Oda Balistreri	554.933.5796 x6375	jermey_dickens@raynor.info	4614 Mueller Throughway	2010-12-22 14:07:11.526876	2010-12-22 14:07:11.526876	2010-12-27	Petra12930268314517 Ebert	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Impedit vitae et et similique.Possimus architecto et expedita corporis in est.	Error qui eaque voluptas tempore numquam nostrum accusamus.Est libero nam ea nihil qui sed tempore.	2	User::Agent	0	475.0	637.0	1	Boehm	Bennett Olson	526.950.7402	augustine@batzjohnston.ca	191 Liana Knolls	2010-12-22 14:07:11.60922	2010-12-22 14:07:11.60922	2010-12-27	Petra12930268314517 Ebert	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Sed soluta quam quia.Eveniet excepturi magni et in ut aut distinctio.	Dolore eveniet et accusamus non dignissimos ipsum.Recusandae occaecati quaerat ad sunt.	2	User::Agent	0	857.0	281.0	1	Gerhold	Demetris Hettinger	(220)345-2053 x23054	ara.bosco@abbott.info	277 Abernathy Crossing	2010-12-22 14:07:11.687121	2010-12-22 14:07:11.687121	2010-12-27	Petra12930268314517 Ebert	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Molestiae vero libero nisi voluptate accusamus eveniet.Molestias officia rerum occaecati dolorem id omnis molestiae ipsa.	Dolores iste nihil amet consequuntur.Earum facere et in quisquam molestias expedita.	2	User::Agent	0	305.0	253.0	1	Hettingercummings	Dr. Trinity Kiehn	1-536-162-3344	ayana_kovacek@kling.ca	7068 Schaden Path	2010-12-22 14:07:11.760254	2010-12-22 14:07:11.760254	2010-12-27	Petra12930268314517 Ebert	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Est voluptatibus nobis dolor amet qui quas enim.Facere sapiente dolorem neque.	Sit magnam qui quasi dignissimos eum reprehenderit similique.Et odio eligendi magnam id vel eaque aut ea.	2	User::Agent	0	82.0	150.0	1	Deckow	Orland Doyle	(473)847-8554	enos@haag.biz	111 Emmy Vista	2010-12-22 14:07:11.955695	2010-12-22 14:07:11.955695	2010-12-27	Petra12930268314517 Ebert	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Culpa alias sint ullam aut.Commodi dolores pariatur ad vel.	Recusandae rerum velit et sed.Cum est dolores rerum est alias.	2	User::Agent	0	692.0	678.0	1	Olson	Andy McLaughlin	1-593-821-1552 x62643	muhammad@ferry.ca	45195 Farrell Track	2010-12-22 14:07:12.024691	2010-12-22 14:07:12.024691	2010-12-27	Petra12930268314517 Ebert	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Voluptas aspernatur nisi quasi cum cupiditate facilis occaecati similique.Voluptas corporis dolorem qui velit nemo quia.	Necessitatibus ut perspiciatis in corrupti vel adipisci velit.Sit enim totam quis aliquid.	2	User::Agent	0	879.0	428.0	1	Prohaska	Arch Abernathy	(695)181-3892 x5047	romaine@gottlieb.uk	4103 Quinton Village	2010-12-22 14:07:12.093376	2010-12-22 14:07:12.093376	2010-12-27	Petra12930268314517 Ebert	1	t	\N	0	0	f	f	-1	7
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
1	default_payout_delay	--- 0\n	2010-12-22 14:07:10.70509	2010-12-22 14:07:10.70509
2	default_leads_per_page	--- 5\n	2010-12-22 14:07:10.710566	2010-12-22 14:07:10.710566
3	certification_level_1	--- 10\n	2010-12-22 14:07:10.712681	2010-12-22 14:07:10.712681
4	certification_level_2	--- 20\n	2010-12-22 14:07:10.714728	2010-12-22 14:07:10.714728
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-22 14:07:10.717235	2010-12-22 14:07:10.717235
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-22 14:07:10.720068	2010-12-22 14:07:10.720068
7	invoicing_seller_name	--- Fairleads\n	2010-12-22 14:07:10.722352	2010-12-22 14:07:10.722352
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-22 14:07:10.724545	2010-12-22 14:07:10.724545
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-22 14:07:10.726588	2010-12-22 14:07:10.726588
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-22 14:07:10.728686	2010-12-22 14:07:10.728686
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
1	blazejek@gmail.com	93a8f5183be2b6e3da3a6faab42070499afc8ccc83aab556b045a9f1536857027651b356a81c8f85f0986181b45679e64157f16303d49403f81f9a513f2b4b63	3c94OLQZ9Z9GzgOtAoB8	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 14:07:11.174116	2010-12-22 14:07:11.113902	\N	2010-12-22 14:07:11.114123	2010-12-22 14:07:11.174416	1	Felton	Harber	150.413.7344 x18362	root	Pfeffer Springs	Gleichnershire	31801	County Antrim	1	\N	\N	\N	\N	0	\N	\N	\N	\N	w80zFcZQmv08biYQPCpu5EkXXfJMggRV5VsEsIX3VaAGr4TNpSWKSa4ArqSg6l	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	b87eae4324c8e1a12bd55da041404b9fd27029e559169a5c647447dff9d73be104b139738791aa7ccd91baf71b97cb525e5fecf76afec199541b1a89b72d5fe6	M_oRI1JsPgP46w4NBPKW	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 14:07:11.482014	2010-12-22 14:07:11.459256	\N	2010-12-22 14:07:11.459468	2010-12-22 14:07:11.482286	2	Petra12930268314517	Ebert	(166)434-4126 x7868	Fletcher Keeling IV129302683145137	Vickie Extensions	East Ethelynport	38357-3879	West Yorkshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	hqb5uo2Yiz7NTyXAuY0KJTNSRv5aTESt4OIblYYtqhAwscVXvh6NAV04aafHEO	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	0b5fe7e682c55f6186e5b9d54714a595483a76e911a97e93a83e1cb10cf74d45fb48cd7216e96e8ec73b01a988b4c0ae9373f04439762340bf167d7d0d5a76ec	MKhn8DsyjMfqK1DlqRQX	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 14:07:12.198411	2010-12-22 14:07:12.178549	\N	2010-12-22 14:07:12.178763	2010-12-22 14:07:12.198674	1	Emelie	Eichmann	791-310-4188	Vergie Howe129302683217403	Jakubowski Bypass	East Monserrate	52615	Bedfordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	R8mgyzhZqa8jNCTfEQVKGpLuZMNhLi3IH7TjtooBTe2RytzPBju7IzkiEsosQc	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	fe2228d5f120d4311c395ccbe33e228fe1214fc6391d70202af4c6dcfae43300f9fb03c2dc5629c4e1ec0e4f8e1436c5cf1ad01403481d092f59a50e4531269c	J91g1ubpZesllYgrj47K	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 14:07:12.251273	2010-12-22 14:07:12.228884	\N	2010-12-22 14:07:12.22911	2010-12-22 14:07:12.251552	48	Trenton	McClure	570-429-5408 x7545	Keagan Eichmann129302683222416	Eloy Port	Torphymouth	85077	Dorset	1	\N	\N	\N	\N	0	\N	\N	\N	\N	gLAluMF4WaJKK3U0ewKAI6rVulMJvomzm3Hh8oc5n6sMELsWj3JMB3WjV62Pv5	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	74204aebbc0301f929d9730951bc848d9b48770a8ffc018e96cdb0cf803438f4715a9b11622923ab064679acfa86938d7401badd1db7c9582690e4ec897b068c	fbLHoxdshazOCSzZ22MJ	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 14:07:12.433447	2010-12-22 14:07:12.280747	\N	2010-12-22 14:07:12.280958	2010-12-22 14:07:12.448463	64	Isaiah	Glover	253-480-2001	Clarissa Lakin129302683227619	Baumbach Gateway	Delbertshire	07757	Gwynedd County	1	\N	\N	4	\N	0	\N	\N	\N	\N	WfFa1XyvyRfhPPQVIOVehAjgAbkzFCOCoXWGRjvd7UxQdI4AJzb4MwcJwJBMPe	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

