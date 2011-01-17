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

SELECT pg_catalog.setval('article_translations_id_seq', 20, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 10, true);


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

SELECT pg_catalog.setval('email_template_translations_id_seq', 18, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 9, true);


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

SELECT pg_catalog.setval('settings_id_seq', 11, true);


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
1	1	dk	About us	About us	2011-01-17 13:39:34.886271	2011-01-17 13:39:34.886271
2	1	en	About us	About us	2011-01-17 13:39:34.906398	2011-01-17 13:39:34.906398
3	2	dk	Privacy	Privacy	2011-01-17 13:39:34.956138	2011-01-17 13:39:34.956138
4	2	en	Privacy	Privacy	2011-01-17 13:39:34.973044	2011-01-17 13:39:34.973044
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-17 13:39:35.018867	2011-01-17 13:39:35.018867
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-17 13:39:35.036949	2011-01-17 13:39:35.036949
7	4	dk	Blurb sign up	Blurb sign up	2011-01-17 13:39:35.080647	2011-01-17 13:39:35.080647
8	4	en	Blurb sign up	Blurb sign up	2011-01-17 13:39:35.098449	2011-01-17 13:39:35.098449
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-17 13:39:35.13986	2011-01-17 13:39:35.13986
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-17 13:39:35.155889	2011-01-17 13:39:35.155889
11	6	dk	Blurb agent home	Blurb agent home	2011-01-17 13:39:35.195815	2011-01-17 13:39:35.195815
12	6	en	Blurb agent home	Blurb agent home	2011-01-17 13:39:35.212682	2011-01-17 13:39:35.212682
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-17 13:39:35.255286	2011-01-17 13:39:35.255286
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-17 13:39:35.274178	2011-01-17 13:39:35.274178
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-17 13:39:35.326184	2011-01-17 13:39:35.326184
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-17 13:39:35.344224	2011-01-17 13:39:35.344224
17	9	dk	Blurb currencies	Blurb currencies	2011-01-17 13:39:35.387364	2011-01-17 13:39:35.387364
18	9	en	Blurb currencies	Blurb currencies	2011-01-17 13:39:35.404316	2011-01-17 13:39:35.404316
19	10	dk	Reset password	Reset password	2011-01-17 13:39:35.449925	2011-01-17 13:39:35.449925
20	10	en	Reset password	Reset password	2011-01-17 13:39:35.467265	2011-01-17 13:39:35.467265
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-17 13:39:34.874891	2011-01-17 13:39:34.91407	about_us	0	t	2011-01-17 13:39:34.913941
2	Article::Cms	2011-01-17 13:39:34.94947	2011-01-17 13:39:34.978606	privacy	0	t	2011-01-17 13:39:34.978511
3	Article::Cms	2011-01-17 13:39:35.013777	2011-01-17 13:39:35.044078	terms_conditions	0	t	2011-01-17 13:39:35.04398
4	Article::Cms	2011-01-17 13:39:35.075312	2011-01-17 13:39:35.10496	blurb_sign_up	1	t	2011-01-17 13:39:35.104866
5	Article::Cms	2011-01-17 13:39:35.133943	2011-01-17 13:39:35.161891	blurb_buyer_home	1	t	2011-01-17 13:39:35.161793
6	Article::Cms	2011-01-17 13:39:35.190893	2011-01-17 13:39:35.218542	blurb_agent_home	1	t	2011-01-17 13:39:35.218446
7	Article::Cms	2011-01-17 13:39:35.25047	2011-01-17 13:39:35.281766	blurb_purchase_manager_home	1	t	2011-01-17 13:39:35.281608
8	Article::Cms	2011-01-17 13:39:35.321384	2011-01-17 13:39:35.350294	blurb_start_page_role_selection	1	t	2011-01-17 13:39:35.350183
9	Article::Cms	2011-01-17 13:39:35.382539	2011-01-17 13:39:35.410298	blurb_currencies	1	t	2011-01-17 13:39:35.410174
10	Article::Cms	2011-01-17 13:39:35.444827	2011-01-17 13:39:35.475697	reset_password	2	t	2011-01-17 13:39:35.4756
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
1	Electronics	Quis qui illum maxime magni est sed animi.Esse sit neque itaque est quas fugiat quae.	2011-01-17 13:39:33.531613	2011-01-17 13:39:33.531613	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Vero qui a voluptatibus suscipit minus.Id ab quis facilis et autem hic.	2011-01-17 13:39:33.595217	2011-01-17 13:39:33.595217	\N	3	4	\N	0	2-leisure	f	0
3	Business	Consequatur eos molestiae suscipit sint aut aut delectus.Qui quisquam et commodi officiis.	2011-01-17 13:39:33.645704	2011-01-17 13:39:34.449564	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Quis qui illum maxime magni est sed animi.Esse sit neque itaque est quas fugiat quae.	Electronics	2011-01-17 13:39:33.545804	2011-01-17 13:39:33.545804
2	1	dk	\N	Electronics	2011-01-17 13:39:33.578828	2011-01-17 13:39:33.578828
3	2	en	Vero qui a voluptatibus suscipit minus.Id ab quis facilis et autem hic.	Leisure	2011-01-17 13:39:33.602085	2011-01-17 13:39:33.602085
4	2	dk	\N	Leisure	2011-01-17 13:39:33.631739	2011-01-17 13:39:33.631739
5	3	en	Consequatur eos molestiae suscipit sint aut aut delectus.Qui quisquam et commodi officiis.	Business	2011-01-17 13:39:33.652304	2011-01-17 13:39:33.652304
6	3	dk	\N	Business	2011-01-17 13:39:33.677706	2011-01-17 13:39:33.677706
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-17 13:39:32.596557	2011-01-17 13:39:32.596557
2	United Kingdom	2011-01-17 13:39:32.606908	2011-01-17 13:39:32.606908
3	Northern Ireland129527157371588	2011-01-17 13:39:33.717464	2011-01-17 13:39:33.717464
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
1	Euro	&euro;	%u%n	t	2011-01-17 13:39:33.486074	2011-01-17 13:39:33.486074
2	PLN	&pln;	%u%n	t	2011-01-17 13:39:33.49493	2011-01-17 13:39:33.49493
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-01-17 13:39:32.645998	2011-01-17 13:39:32.645998
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-01-17 13:39:32.674977	2011-01-17 13:39:32.674977
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-01-17 13:39:32.707202	2011-01-17 13:39:32.707202
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-01-17 13:39:32.730069	2011-01-17 13:39:32.730069
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-01-17 13:39:32.759994	2011-01-17 13:39:32.759994
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-01-17 13:39:32.784388	2011-01-17 13:39:32.784388
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-01-17 13:39:32.809888	2011-01-17 13:39:32.809888
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-01-17 13:39:32.828643	2011-01-17 13:39:32.828643
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-01-17 13:39:32.851943	2011-01-17 13:39:32.851943
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-01-17 13:39:32.873498	2011-01-17 13:39:32.873498
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-01-17 13:39:32.892074	2011-01-17 13:39:32.892074
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-01-17 13:39:32.915066	2011-01-17 13:39:32.915066
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-01-17 13:39:32.936127	2011-01-17 13:39:32.936127
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-01-17 13:39:32.956662	2011-01-17 13:39:32.956662
15	8	en	<p></p>	Question	2011-01-17 13:39:32.985554	2011-01-17 13:39:32.985554
16	8	dk	<p></p>	[DK] Question	2011-01-17 13:39:33.012844	2011-01-17 13:39:33.012844
17	9	en	<p></p>	Invoice	2011-01-17 13:39:33.033651	2011-01-17 13:39:33.033651
18	9	dk	<p></p>	[DK] Invoice	2011-01-17 13:39:33.054876	2011-01-17 13:39:33.054876
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-17 13:39:32.634809	2011-01-17 13:39:32.667137
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-17 13:39:32.694298	2011-01-17 13:39:32.723688
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-17 13:39:32.75019	2011-01-17 13:39:32.776775
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-17 13:39:32.801193	2011-01-17 13:39:32.823261
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-17 13:39:32.845083	2011-01-17 13:39:32.867773
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-17 13:39:32.886329	2011-01-17 13:39:32.908319
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-17 13:39:32.929686	2011-01-17 13:39:32.951129
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-17 13:39:32.973755	2011-01-17 13:39:33.006368
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-17 13:39:33.027745	2011-01-17 13:39:33.048502
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

COPY lead_translations (id, lead_id, locale, header, hidden_description, description, created_at, updated_at) FROM stdin;
1	1	dk	Big deal on printers	Qui ipsa ab culpa inventore.Est vel recusandae repellendus.	Omnis repudiandae aut voluptatem a est pariatur facere.Temporibus dolorem veritatis esse accusamus ut accusantium.	2011-01-17 13:39:33.862979	2011-01-17 13:39:33.862979
2	2	dk	Drills required	Id vel laborum repudiandae aut sapiente pariatur dicta.Eius amet consequatur facilis corrupti quia repellat.	Perferendis quasi quo iste incidunt quis dolorem quisquam.Provident corporis rerum ut non delectus non vero labore.	2011-01-17 13:39:33.964413	2011-01-17 13:39:33.964413
3	3	dk	Need assistance in selling a car	Est unde maiores ducimus nulla voluptatibus.Veritatis et blanditiis inventore odit aut quod saepe aliquam.	Sit iusto dolores debitis ut quis.Molestiae vitae occaecati illum.	2011-01-17 13:39:34.071523	2011-01-17 13:39:34.071523
4	4	dk	Ipod shipment	Magni minima et accusamus.Quia ducimus qui facere aliquid et rerum.	Dolorem quidem architecto quaerat.Vel error nemo laborum.	2011-01-17 13:39:34.168282	2011-01-17 13:39:34.168282
5	5	dk	Trip to amazonia - looking for offer	Ullam non dolores et.Velit odio impedit accusantium est in quasi iste.	Fugit quos repellendus odio ipsam aut illum nihil.Veniam deserunt minus ut.	2011-01-17 13:39:34.262989	2011-01-17 13:39:34.262989
6	6	dk	LCD - Huge amounts	Eum ut et porro.Nam suscipit quos id qui autem aspernatur.	Vitae ut et quisquam iure tempore.Maxime praesentium quo expedita omnis fugit reiciendis.	2011-01-17 13:39:34.356782	2011-01-17 13:39:34.356782
7	7	dk	GPS receivers required	Dolor omnis et qui distinctio.Excepturi et vel consequatur temporibus ullam cum quasi laborum.	Distinctio placeat expedita ea ut vero voluptatem.Impedit temporibus ut vel odit.	2011-01-17 13:39:34.458964	2011-01-17 13:39:34.458964
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Omnis repudiandae aut voluptatem a est pariatur facere.Temporibus dolorem veritatis esse accusamus ut accusantium.	Qui ipsa ab culpa inventore.Est vel recusandae repellendus.	2	User::Agent	0	294.0	822.0	1	Reynolds	Esteban Torp	(509)850-8075	dena_jakubowski@walterrunte.co.uk	2011-01-17 13:39:33.810014	2011-01-17 13:39:33.810014	2011-01-22	German129527157371508 Kohler	1	t	\N	0	0	f	f	-1	1	2011-01-17 13:39:33.821817	\N	\N	95214 Virgie Forge	\N	\N	East Cleveville	32202	Worcestershire
2	Drills required	3	Perferendis quasi quo iste incidunt quis dolorem quisquam.Provident corporis rerum ut non delectus non vero labore.	Id vel laborum repudiandae aut sapiente pariatur dicta.Eius amet consequatur facilis corrupti quia repellat.	2	User::Agent	0	478.0	427.0	1	Crist	Elroy Eichmann	(062)789-1026	fleta@darehintz.co.uk	2011-01-17 13:39:33.920291	2011-01-17 13:39:33.920291	2011-01-22	German129527157371508 Kohler	1	t	\N	0	0	f	f	-1	1	2011-01-17 13:39:33.929093	\N	\N	6448 Wendy Extension	\N	\N	New Zechariahstad	17930-9776	South Glamorgan
3	Need assistance in selling a car	3	Sit iusto dolores debitis ut quis.Molestiae vitae occaecati illum.	Est unde maiores ducimus nulla voluptatibus.Veritatis et blanditiis inventore odit aut quod saepe aliquam.	2	User::Agent	0	170.0	635.0	1	Beatty	Astrid Halvorson	084-292-6684 x40213	marlen@balistreriwest.us	2011-01-17 13:39:34.0258	2011-01-17 13:39:34.0258	2011-01-22	German129527157371508 Kohler	1	t	\N	0	0	f	f	-1	1	2011-01-17 13:39:34.035481	\N	\N	4674 Jodie Run	\N	\N	Avamouth	53282	Gwynedd County
4	Ipod shipment	3	Dolorem quidem architecto quaerat.Vel error nemo laborum.	Magni minima et accusamus.Quia ducimus qui facere aliquid et rerum.	2	User::Agent	0	881.0	632.0	1	Hoeger	Merl Halvorson	183-482-2708 x69548	alexis@lubowitz.biz	2011-01-17 13:39:34.123303	2011-01-17 13:39:34.123303	2011-01-22	German129527157371508 Kohler	1	t	\N	0	0	f	f	-1	1	2011-01-17 13:39:34.133071	\N	\N	5874 Georgette Meadows	\N	\N	Heaneytown	20685	West Sussex
5	Trip to amazonia - looking for offer	3	Fugit quos repellendus odio ipsam aut illum nihil.Veniam deserunt minus ut.	Ullam non dolores et.Velit odio impedit accusantium est in quasi iste.	2	User::Agent	0	417.0	523.0	1	Aufderhar	Rosemary Conroy	018-261-6649 x54560	bettye_rowe@wilkinson.com	2011-01-17 13:39:34.220977	2011-01-17 13:39:34.220977	2011-01-22	German129527157371508 Kohler	1	t	\N	0	0	f	f	-1	1	2011-01-17 13:39:34.22892	\N	\N	1019 Jayce Mission	\N	\N	Borismouth	45209	Merseyside
6	LCD - Huge amounts	3	Vitae ut et quisquam iure tempore.Maxime praesentium quo expedita omnis fugit reiciendis.	Eum ut et porro.Nam suscipit quos id qui autem aspernatur.	2	User::Agent	0	585.0	687.0	1	Pouros	Odessa Runte	954-513-5920 x8958	judge.rice@hauck.us	2011-01-17 13:39:34.313505	2011-01-17 13:39:34.313505	2011-01-22	German129527157371508 Kohler	1	t	\N	0	0	f	f	-1	1	2011-01-17 13:39:34.321596	\N	\N	7556 Joshuah Stravenue	\N	\N	South Greyson	04419	County Londonderry
7	GPS receivers required	3	Distinctio placeat expedita ea ut vero voluptatem.Impedit temporibus ut vel odit.	Dolor omnis et qui distinctio.Excepturi et vel consequatur temporibus ullam cum quasi laborum.	2	User::Agent	0	475.0	73.0	1	Hamill	Frederick Ernser	427.389.6114 x45400	lacy_mayer@okuneva.us	2011-01-17 13:39:34.406367	2011-01-17 13:39:34.406367	2011-01-22	German129527157371508 Kohler	1	t	\N	0	0	f	f	-1	1	2011-01-17 13:39:34.422716	\N	\N	816 Erika Drive	\N	\N	Harveymouth	96895-3117	Hertfordshire
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
1	default_payout_delay	--- 0\n	2011-01-17 13:39:32.488263	2011-01-17 13:39:32.488263
2	default_leads_per_page	--- 5\n	2011-01-17 13:39:32.500076	2011-01-17 13:39:32.500076
3	certification_level_1	--- 10\n	2011-01-17 13:39:32.511338	2011-01-17 13:39:32.511338
4	certification_level_2	--- 20\n	2011-01-17 13:39:32.517843	2011-01-17 13:39:32.517843
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-17 13:39:32.523935	2011-01-17 13:39:32.523935
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-17 13:39:32.534208	2011-01-17 13:39:32.534208
7	invoicing_seller_name	--- Fairleads\n	2011-01-17 13:39:32.54463	2011-01-17 13:39:32.54463
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-17 13:39:32.551305	2011-01-17 13:39:32.551305
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-17 13:39:32.558293	2011-01-17 13:39:32.558293
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-17 13:39:32.566347	2011-01-17 13:39:32.566347
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-17 13:39:32.574654	2011-01-17 13:39:32.574654
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers) FROM stdin;
1	blazejek@gmail.com	cfeddbde2e699f9cf83d39642aef7f8de66c2c331fa41d65384f832bc4d4c054d8be971333d0141f39b4b385cb2e4f304e3a00c949a6cab7f2ae2c3bf0dc8904	XZnTMWj73G4Ox7uiWac1	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 13:39:33.466254	2011-01-17 13:39:33.381224	\N	2011-01-17 13:39:33.381516	2011-01-17 13:39:33.466656	1	Jakayla	VonRueden	(304)799-6691	root	Madalyn Unions	Stephenberg	38392	Nottinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	0eBjmShTw3kl1tZaxcXvyUanbj5d45JmHYsLL8Bj4aWKR9ddpQ234GCwIM0MGW	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	57807d21e083821e835214e0882a3c706e570908a835dabbeb195f7a2f07d54d1c680058f28f7b0fd8d54fbf0be2e245c5d6f0904e85321ceb9bb142fdc4e9ff	ap04VGrHLnYamUoQLmnT	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 13:39:33.75916	2011-01-17 13:39:33.727981	\N	2011-01-17 13:39:33.728243	2011-01-17 13:39:33.759574	2	German129527157371508	Kohler	(392)891-1126	Elijah Feeney129527157371484	Brakus Trail	North Kennethstad	98964-9359	Isle of Wight	3	\N	0	\N	\N	0	\N	\N	\N	\N	TN8eYE7NwKatiQeW3t0nGdBt8VxSlCrfwL0j3ihKQHYC6owxx4bfJlFV7wunXP	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	cddb574253448bb828c9cca6313261a5c76221fc86d55f1211fb3d4923884f8199c614f057a5e39a47db019031016baa4504db99c2090b56922df3ddbc9f54dd	G80-sRp9AnjaYAIqSr-H	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 13:39:34.56809	2011-01-17 13:39:34.540636	\N	2011-01-17 13:39:34.54091	2011-01-17 13:39:34.569949	1	Max	Langosh	(870)964-3263 x483	Demarco Mante129527157453293	Daisha Bridge	South Korbinville	94115-1216	Northumberland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	tcOCqcSEepPqzoo4UtyacP1anfymYdnOBpZlDj25BH9LOOkYZYpTVFLNYmM1OO	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	87eeedb1a46f7cb57e40f82f3717858149118f301669bcd55c61dc2d9dc0981a7a8a4124738a75223fa7cc94244cdebce1d55454ee22b171350d533680c4e681	QPlr66RNgrPfE9vMIVR5	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 13:39:34.653115	2011-01-17 13:39:34.62312	\N	2011-01-17 13:39:34.623438	2011-01-17 13:39:34.653549	48	Bruce	Kuphal	037-928-4005 x0936	Mara Rosenbaum129527157461538	Leon Forge	Wolffborough	52132-6105	Fife	1	\N	\N	\N	\N	0	\N	\N	\N	\N	RRfJm1SYtqzdm1QDVv48JTqmBIWjrm7vjfeixyO7pt2UvOZtRLhzYQVwjZn0C4	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	4c9c379bbacd47a4078990c867ad2d085dda835c70be504d89549dae7bb826a8552dbf76e030b9a5c58e2c3adc9941131f89dabfde3b71cd9cb9bd8ca8d496d0	yyqMo_7NZ0AA7AJjqnsv	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 13:39:34.729314	2011-01-17 13:39:34.698019	\N	2011-01-17 13:39:34.698298	2011-01-17 13:39:34.754465	64	Nicholas	Krajcik	682-240-7015 x738	Hellen Jacobson12952715746918	Kathlyn Mews	Lake Kaelynland	73570-0483	Norfolk	1	\N	\N	4	\N	0	\N	\N	\N	\N	3mZoT6FjrPnRX392RLH0jYIzLyVplI6KnXXtN8AU6dCT5F1p7uVo4tyu4cox7D	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

