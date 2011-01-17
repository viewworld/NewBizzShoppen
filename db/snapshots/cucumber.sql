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
1	1	dk	About us	About us	2011-01-17 15:41:07.760259	2011-01-17 15:41:07.760259
2	1	en	About us	About us	2011-01-17 15:41:07.774256	2011-01-17 15:41:07.774256
3	2	dk	Privacy	Privacy	2011-01-17 15:41:07.806	2011-01-17 15:41:07.806
4	2	en	Privacy	Privacy	2011-01-17 15:41:07.817305	2011-01-17 15:41:07.817305
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-17 15:41:07.848997	2011-01-17 15:41:07.848997
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-17 15:41:07.860761	2011-01-17 15:41:07.860761
7	4	dk	Blurb sign up	Blurb sign up	2011-01-17 15:41:07.888442	2011-01-17 15:41:07.888442
8	4	en	Blurb sign up	Blurb sign up	2011-01-17 15:41:07.899556	2011-01-17 15:41:07.899556
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-17 15:41:07.930557	2011-01-17 15:41:07.930557
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-17 15:41:07.941619	2011-01-17 15:41:07.941619
11	6	dk	Blurb agent home	Blurb agent home	2011-01-17 15:41:07.969589	2011-01-17 15:41:07.969589
12	6	en	Blurb agent home	Blurb agent home	2011-01-17 15:41:07.981003	2011-01-17 15:41:07.981003
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-17 15:41:08.150374	2011-01-17 15:41:08.150374
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-17 15:41:08.162183	2011-01-17 15:41:08.162183
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-17 15:41:08.190374	2011-01-17 15:41:08.190374
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-17 15:41:08.201751	2011-01-17 15:41:08.201751
17	9	dk	Blurb currencies	Blurb currencies	2011-01-17 15:41:08.229755	2011-01-17 15:41:08.229755
18	9	en	Blurb currencies	Blurb currencies	2011-01-17 15:41:08.2411	2011-01-17 15:41:08.2411
19	10	dk	Reset password	Reset password	2011-01-17 15:41:08.270112	2011-01-17 15:41:08.270112
20	10	en	Reset password	Reset password	2011-01-17 15:41:08.281233	2011-01-17 15:41:08.281233
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-17 15:41:07.751573	2011-01-17 15:41:07.777071	about_us	0	t	2011-01-17 15:41:07.776993
2	Article::Cms	2011-01-17 15:41:07.801494	2011-01-17 15:41:07.820234	privacy	0	t	2011-01-17 15:41:07.820137
3	Article::Cms	2011-01-17 15:41:07.84492	2011-01-17 15:41:07.863775	terms_conditions	0	t	2011-01-17 15:41:07.863698
4	Article::Cms	2011-01-17 15:41:07.884459	2011-01-17 15:41:07.90225	blurb_sign_up	1	t	2011-01-17 15:41:07.90218
5	Article::Cms	2011-01-17 15:41:07.926516	2011-01-17 15:41:07.944468	blurb_buyer_home	1	t	2011-01-17 15:41:07.944397
6	Article::Cms	2011-01-17 15:41:07.965449	2011-01-17 15:41:07.983737	blurb_agent_home	1	t	2011-01-17 15:41:07.983663
7	Article::Cms	2011-01-17 15:41:08.145991	2011-01-17 15:41:08.165035	blurb_purchase_manager_home	1	t	2011-01-17 15:41:08.164962
8	Article::Cms	2011-01-17 15:41:08.186295	2011-01-17 15:41:08.204453	blurb_start_page_role_selection	1	t	2011-01-17 15:41:08.204382
9	Article::Cms	2011-01-17 15:41:08.225619	2011-01-17 15:41:08.243819	blurb_currencies	1	t	2011-01-17 15:41:08.243747
10	Article::Cms	2011-01-17 15:41:08.266124	2011-01-17 15:41:08.283884	reset_password	2	t	2011-01-17 15:41:08.283812
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
1	Electronics	Et ea possimus saepe quo omnis rerum qui nihil.Quia maiores sit ea earum suscipit.	2011-01-17 15:41:06.411429	2011-01-17 15:41:06.411429	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Quia magni voluptatem placeat deserunt qui quis.Placeat tempora id velit maxime ut consequatur quo ratione.	2011-01-17 15:41:06.454017	2011-01-17 15:41:06.454017	\N	3	4	\N	0	2-leisure	f	0
3	Business	Veritatis amet quis omnis dolor enim.Animi labore tempore maxime non dolorem.	2011-01-17 15:41:06.4867	2011-01-17 15:41:07.318604	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Et ea possimus saepe quo omnis rerum qui nihil.Quia maiores sit ea earum suscipit.	Electronics	2011-01-17 15:41:06.420432	2011-01-17 15:41:06.420432
2	1	dk	\N	Electronics	2011-01-17 15:41:06.444901	2011-01-17 15:41:06.444901
3	2	en	Quia magni voluptatem placeat deserunt qui quis.Placeat tempora id velit maxime ut consequatur quo ratione.	Leisure	2011-01-17 15:41:06.458895	2011-01-17 15:41:06.458895
4	2	dk	\N	Leisure	2011-01-17 15:41:06.47742	2011-01-17 15:41:06.47742
5	3	en	Veritatis amet quis omnis dolor enim.Animi labore tempore maxime non dolorem.	Business	2011-01-17 15:41:06.49091	2011-01-17 15:41:06.49091
6	3	dk	\N	Business	2011-01-17 15:41:06.509067	2011-01-17 15:41:06.509067
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-17 15:41:05.895671	2011-01-17 15:41:05.895671
2	United Kingdom	2011-01-17 15:41:05.900391	2011-01-17 15:41:05.900391
3	England129527886653654	2011-01-17 15:41:06.537917	2011-01-17 15:41:06.537917
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
1	Euro	&euro;	%u%n	t	2011-01-17 15:41:06.390456	2011-01-17 15:41:06.390456
2	PLN	&pln;	%u%n	t	2011-01-17 15:41:06.394594	2011-01-17 15:41:06.394594
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-17 15:41:05.933675	2011-01-17 15:41:05.933675
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-17 15:41:05.948664	2011-01-17 15:41:05.948664
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-17 15:41:05.961426	2011-01-17 15:41:05.961426
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-17 15:41:05.973784	2011-01-17 15:41:05.973784
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-17 15:41:05.98655	2011-01-17 15:41:05.98655
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-17 15:41:05.999329	2011-01-17 15:41:05.999329
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-17 15:41:06.012855	2011-01-17 15:41:06.012855
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-17 15:41:06.025944	2011-01-17 15:41:06.025944
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-17 15:41:06.039675	2011-01-17 15:41:06.039675
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-17 15:41:06.052545	2011-01-17 15:41:06.052545
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-17 15:41:06.06555	2011-01-17 15:41:06.06555
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-17 15:41:06.078438	2011-01-17 15:41:06.078438
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-17 15:41:06.093153	2011-01-17 15:41:06.093153
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-17 15:41:06.105969	2011-01-17 15:41:06.105969
15	8	en	Question	<p></p>	2011-01-17 15:41:06.118912	2011-01-17 15:41:06.118912
16	8	dk	[DK] Question	<p></p>	2011-01-17 15:41:06.131586	2011-01-17 15:41:06.131586
17	9	en	Invoice	<p></p>	2011-01-17 15:41:06.144508	2011-01-17 15:41:06.144508
18	9	dk	[DK] Invoice	<p></p>	2011-01-17 15:41:06.157022	2011-01-17 15:41:06.157022
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-17 15:41:05.921288	2011-01-17 15:41:05.944371
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-17 15:41:05.956911	2011-01-17 15:41:05.969463
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-17 15:41:05.981871	2011-01-17 15:41:05.99487
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-17 15:41:06.008085	2011-01-17 15:41:06.021458
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-17 15:41:06.035012	2011-01-17 15:41:06.048042
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-17 15:41:06.060804	2011-01-17 15:41:06.074119
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-17 15:41:06.088254	2011-01-17 15:41:06.101576
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-17 15:41:06.114253	2011-01-17 15:41:06.127278
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-17 15:41:06.139858	2011-01-17 15:41:06.15267
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

COPY lead_translations (id, lead_id, locale, hidden_description, description, header, created_at, updated_at) FROM stdin;
1	1	dk	Odio molestias amet accusantium vel esse suscipit maiores qui.Labore vel quo quod amet nulla.	Quia ratione enim alias et architecto consectetur perspiciatis sit.Iure non inventore beatae culpa quo vel aut saepe.	Big deal on printers	2011-01-17 15:41:06.641331	2011-01-17 15:41:06.641331
2	2	dk	Culpa voluptatem hic tempore ex beatae.Tempora asperiores eum aut a quia et magnam et.	Qui dolorum voluptatem vel voluptatem sint.Qui et quis aliquid assumenda.	Drills required	2011-01-17 15:41:06.710972	2011-01-17 15:41:06.710972
3	3	dk	Quae aliquid quaerat et modi ut distinctio.Veniam assumenda rem dolor qui voluptas alias.	Voluptas facilis aliquid maiores.Est et et ea.	Need assistance in selling a car	2011-01-17 15:41:06.910057	2011-01-17 15:41:06.910057
4	4	dk	Voluptatem minus est et.Dolorum sapiente corporis non consequuntur.	Et inventore voluptatem cupiditate accusamus dolorem provident.Doloribus suscipit molestias aspernatur aperiam.	Ipod shipment	2011-01-17 15:41:06.979385	2011-01-17 15:41:06.979385
5	5	dk	Non itaque atque quis non praesentium fugit.Temporibus fugit voluptatem consequatur est et impedit consectetur.	Vel labore ullam voluptas nisi non tempora et hic.Qui esse a sit ut quae.	Trip to amazonia - looking for offer	2011-01-17 15:41:07.047257	2011-01-17 15:41:07.047257
6	6	dk	Distinctio voluptates quidem itaque nihil ut tempora.Sed quisquam porro est nihil fugit temporibus et.	Architecto labore quo quia non temporibus omnis facilis molestiae.Fugiat et dolorem id rerum saepe consequatur explicabo.	LCD - Huge amounts	2011-01-17 15:41:07.117421	2011-01-17 15:41:07.117421
7	7	dk	Soluta dolore doloremque quod itaque laboriosam qui.Eum qui laudantium fugiat aut accusantium doloremque molestiae.	Et et quas minus.Vero nemo dolore repudiandae aliquam harum.	GPS receivers required	2011-01-17 15:41:07.326137	2011-01-17 15:41:07.326137
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Quia ratione enim alias et architecto consectetur perspiciatis sit.Iure non inventore beatae culpa quo vel aut saepe.	Odio molestias amet accusantium vel esse suscipit maiores qui.Labore vel quo quod amet nulla.	2	User::Agent	0	647.0	658.0	1	Larkin	Laisha Hoeger	1-724-165-9693 x624	alice@walshoberbrunner.biz	2011-01-17 15:41:06.601157	2011-01-17 15:41:06.601157	2011-01-22	Sophia129527886653565 Turcotte	1	t	\N	0	0	f	f	-1	1	2011-01-17 15:41:06.610592	\N	\N	6830 Rosanna Trace	\N	\N	New Annalise	56729	West Glamorgan
2	Drills required	3	Qui dolorum voluptatem vel voluptatem sint.Qui et quis aliquid assumenda.	Culpa voluptatem hic tempore ex beatae.Tempora asperiores eum aut a quia et magnam et.	2	User::Agent	0	244.0	62.0	1	Funk	Leif Goyette	(280)909-6212 x2267	marianne@ullrich.biz	2011-01-17 15:41:06.678836	2011-01-17 15:41:06.678836	2011-01-22	Sophia129527886653565 Turcotte	1	t	\N	0	0	f	f	-1	1	2011-01-17 15:41:06.685458	\N	\N	97686 Lorna Centers	\N	\N	Torreyshire	87953	Dorset
3	Need assistance in selling a car	3	Voluptas facilis aliquid maiores.Est et et ea.	Quae aliquid quaerat et modi ut distinctio.Veniam assumenda rem dolor qui voluptas alias.	2	User::Agent	0	476.0	854.0	1	Becker	Cleora Christiansen	1-302-176-4163	verdie.littel@wiza.uk	2011-01-17 15:41:06.877187	2011-01-17 15:41:06.877187	2011-01-22	Sophia129527886653565 Turcotte	1	t	\N	0	0	f	f	-1	1	2011-01-17 15:41:06.884116	\N	\N	97731 Kale Port	\N	\N	Hillschester	32007-2873	County Down
4	Ipod shipment	3	Et inventore voluptatem cupiditate accusamus dolorem provident.Doloribus suscipit molestias aspernatur aperiam.	Voluptatem minus est et.Dolorum sapiente corporis non consequuntur.	2	User::Agent	0	224.0	930.0	1	Emmerich	Marquis Rau	(796)640-6592	myrtis@prohaska.com	2011-01-17 15:41:06.946731	2011-01-17 15:41:06.946731	2011-01-22	Sophia129527886653565 Turcotte	1	t	\N	0	0	f	f	-1	1	2011-01-17 15:41:06.953551	\N	\N	2537 Leila Trail	\N	\N	Lake Tayaville	40430	Berkshire
5	Trip to amazonia - looking for offer	3	Vel labore ullam voluptas nisi non tempora et hic.Qui esse a sit ut quae.	Non itaque atque quis non praesentium fugit.Temporibus fugit voluptatem consequatur est et impedit consectetur.	2	User::Agent	0	904.0	613.0	1	Kesslerkoelpin	Ally Gutmann III	467.242.2498 x8942	russell@hudsonrodriguez.us	2011-01-17 15:41:07.01467	2011-01-17 15:41:07.01467	2011-01-22	Sophia129527886653565 Turcotte	1	t	\N	0	0	f	f	-1	1	2011-01-17 15:41:07.021297	\N	\N	02723 Wunsch Shore	\N	\N	West Bernardhaven	47237-9715	Shropshire
6	LCD - Huge amounts	3	Architecto labore quo quia non temporibus omnis facilis molestiae.Fugiat et dolorem id rerum saepe consequatur explicabo.	Distinctio voluptates quidem itaque nihil ut tempora.Sed quisquam porro est nihil fugit temporibus et.	2	User::Agent	0	941.0	974.0	1	Rippinmurphy	Mrs. Granville Dickinson	434-653-4547 x67450	tyrese_bailey@dickens.com	2011-01-17 15:41:07.082549	2011-01-17 15:41:07.082549	2011-01-22	Sophia129527886653565 Turcotte	1	t	\N	0	0	f	f	-1	1	2011-01-17 15:41:07.091341	\N	\N	579 Cierra Lake	\N	\N	Sauerchester	31444-0711	Leicestershire
7	GPS receivers required	3	Et et quas minus.Vero nemo dolore repudiandae aliquam harum.	Soluta dolore doloremque quod itaque laboriosam qui.Eum qui laudantium fugiat aut accusantium doloremque molestiae.	2	User::Agent	0	366.0	607.0	1	Kohler	Lexi Mohr	1-044-156-6847 x01295	odell@pollichrice.us	2011-01-17 15:41:07.153672	2011-01-17 15:41:07.153672	2011-01-22	Sophia129527886653565 Turcotte	1	t	\N	0	0	f	f	-1	1	2011-01-17 15:41:07.160836	\N	\N	9058 Fadel Unions	\N	\N	Soniashire	42524	County Tyrone
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
1	default_payout_delay	--- 0\n	2011-01-17 15:41:05.858973	2011-01-17 15:41:05.858973
2	default_leads_per_page	--- 5\n	2011-01-17 15:41:05.864711	2011-01-17 15:41:05.864711
3	certification_level_1	--- 10\n	2011-01-17 15:41:05.868609	2011-01-17 15:41:05.868609
4	certification_level_2	--- 20\n	2011-01-17 15:41:05.871872	2011-01-17 15:41:05.871872
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-17 15:41:05.874158	2011-01-17 15:41:05.874158
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-17 15:41:05.876282	2011-01-17 15:41:05.876282
7	invoicing_seller_name	--- Fairleads\n	2011-01-17 15:41:05.87845	2011-01-17 15:41:05.87845
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-17 15:41:05.880581	2011-01-17 15:41:05.880581
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-17 15:41:05.882704	2011-01-17 15:41:05.882704
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-17 15:41:05.88487	2011-01-17 15:41:05.88487
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-17 15:41:05.887038	2011-01-17 15:41:05.887038
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
1	blazejek@gmail.com	d654783473ca5398b856b5b10fbd3cdd4e407aed812abdb7c420e21092d31a0c1daf0249c87988603f3ebed6e1eecd2495c1509c5cb3d9d91575f03a23a7f3d8	2_xdUc0ulXZsk87nAts_	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 15:41:06.380806	2011-01-17 15:41:06.195659	\N	2011-01-17 15:41:06.195884	2011-01-17 15:41:06.381082	1	Rasheed	Romaguera	(512)709-9206	root	Hessel Loop	North Deanna	02646	Shropshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	NdBkGVIHT0HdtKbjLTWZEKFhY3gq7bK9KXfBa6DX5cTzUCScNp9lX9d0H52985	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	9edd4d0553d2a1e4b6ac41d437a73135dfaa3f3a5d37758bb444355815ab6196622243026f193d024e4f9ce6b3f58ca014bda408fc509c308c7c87c8c5d1c663	XrlGwphJY0XkZswKGBc9	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 15:41:06.565101	2011-01-17 15:41:06.543404	\N	2011-01-17 15:41:06.543615	2011-01-17 15:41:06.565378	2	Sophia129527886653565	Turcotte	1-536-426-6978	Sonia Gutmann12952788665354	Orn Mission	Lake Margaret	06106-4745	West Yorkshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	zxG5vY4c3hiYXdqIYoSFmT0uMakk0mKNTKppO8BWe1Tsh4Y1vKzLe8UMN4IAue	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	79218c80ce6c84f66a02c322c11dca043cba38495c551252e894877317b3a6149d78f7e281ae33d69796f2898627f583bd630daceac037266c6b92a26df58527	1Q8kQvU3IaDbzreKJUBA	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 15:41:07.404715	2011-01-17 15:41:07.384054	\N	2011-01-17 15:41:07.384271	2011-01-17 15:41:07.405042	1	Lynn	Yost	1-715-919-8230 x679	Brad Smith129527886737908	Sigmund Shoal	Stokeschester	88154	County Down	1	\N	\N	\N	\N	0	\N	\N	\N	\N	KD2jjHKO7okEql8jLCtUpvNJGhr1uxO5mxNpDlWXIreoedpTKFNh4PswqfU65b	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	75443db766d3527db8c23935cba35734e8f8aa3243bb7e6cf9ecb8d31966e87a26c3fd28e4f9453860de2d5df5f2ac19a07a82eda9347a75f2247b9c74a73866	1ljtZjouCVJZS36fo9vR	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 15:41:07.462256	2011-01-17 15:41:07.439617	\N	2011-01-17 15:41:07.43984	2011-01-17 15:41:07.462547	48	Noemi	Quigley	(354)842-5955 x146	Murphy Kreiger129527886743426	Coleman Freeway	Aiyanaton	68245-3532	West Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	DeqoF2IjKzuH51z90i8TwzgG3SGp6Zy6L6kF1Lifaf4fktT4rL08K1l9oQD4kC	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	428f631cd1501a69e5d48e2f7ef53bab7e2db2be1bcc653a69733facf47fc7cd1d5a75ddd208059cb9abc92b3a4497664354333bae39fbf0c183dd699d5f6e66	Cv0SmnDXhdzmT9crfYKU	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 15:41:07.518132	2011-01-17 15:41:07.496371	\N	2011-01-17 15:41:07.496584	2011-01-17 15:41:07.533695	64	Vida	Veum	340-997-4846	Kylee Howe129527886749166	Scot Causeway	North Kayceemouth	50746	Grampian	1	\N	\N	4	\N	0	\N	\N	\N	\N	Y65RaUldPe5qeRkI4RYALEdpTtqLDzJrGMG6wR6dn21R2fXOf3vTXelyBl4Le5	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

