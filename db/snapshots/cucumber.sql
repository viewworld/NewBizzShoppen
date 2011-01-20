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
1	1	dk	About us	About us	2011-01-20 11:43:33.58341	2011-01-20 11:43:33.58341
2	1	en	About us	About us	2011-01-20 11:43:33.597373	2011-01-20 11:43:33.597373
3	2	dk	Privacy	Privacy	2011-01-20 11:43:33.628126	2011-01-20 11:43:33.628126
4	2	en	Privacy	Privacy	2011-01-20 11:43:33.647855	2011-01-20 11:43:33.647855
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-20 11:43:33.679124	2011-01-20 11:43:33.679124
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-20 11:43:33.690222	2011-01-20 11:43:33.690222
7	4	dk	Blurb sign up	Blurb sign up	2011-01-20 11:43:33.71767	2011-01-20 11:43:33.71767
8	4	en	Blurb sign up	Blurb sign up	2011-01-20 11:43:33.72852	2011-01-20 11:43:33.72852
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-20 11:43:33.760164	2011-01-20 11:43:33.760164
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-20 11:43:33.771128	2011-01-20 11:43:33.771128
11	6	dk	Blurb agent home	Blurb agent home	2011-01-20 11:43:33.801435	2011-01-20 11:43:33.801435
12	6	en	Blurb agent home	Blurb agent home	2011-01-20 11:43:33.814308	2011-01-20 11:43:33.814308
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-20 11:43:33.852397	2011-01-20 11:43:33.852397
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-20 11:43:33.86558	2011-01-20 11:43:33.86558
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-20 11:43:34.052304	2011-01-20 11:43:34.052304
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-20 11:43:34.063782	2011-01-20 11:43:34.063782
17	9	dk	Blurb currencies	Blurb currencies	2011-01-20 11:43:34.091409	2011-01-20 11:43:34.091409
18	9	en	Blurb currencies	Blurb currencies	2011-01-20 11:43:34.102715	2011-01-20 11:43:34.102715
19	10	dk	Reset password	Reset password	2011-01-20 11:43:34.131448	2011-01-20 11:43:34.131448
20	10	en	Reset password	Reset password	2011-01-20 11:43:34.145759	2011-01-20 11:43:34.145759
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-20 11:43:33.574656	2011-01-20 11:43:33.600089	about_us	0	t	2011-01-20 11:43:33.60002
2	Article::Cms	2011-01-20 11:43:33.62421	2011-01-20 11:43:33.650927	privacy	0	t	2011-01-20 11:43:33.650852
3	Article::Cms	2011-01-20 11:43:33.675127	2011-01-20 11:43:33.693027	terms_conditions	0	t	2011-01-20 11:43:33.692957
4	Article::Cms	2011-01-20 11:43:33.713726	2011-01-20 11:43:33.731352	blurb_sign_up	1	t	2011-01-20 11:43:33.731279
5	Article::Cms	2011-01-20 11:43:33.756057	2011-01-20 11:43:33.773951	blurb_buyer_home	1	t	2011-01-20 11:43:33.773884
6	Article::Cms	2011-01-20 11:43:33.796767	2011-01-20 11:43:33.817702	blurb_agent_home	1	t	2011-01-20 11:43:33.817626
7	Article::Cms	2011-01-20 11:43:33.846735	2011-01-20 11:43:34.022072	blurb_purchase_manager_home	1	t	2011-01-20 11:43:34.02187
8	Article::Cms	2011-01-20 11:43:34.047679	2011-01-20 11:43:34.066587	blurb_start_page_role_selection	1	t	2011-01-20 11:43:34.066514
9	Article::Cms	2011-01-20 11:43:34.087509	2011-01-20 11:43:34.105555	blurb_currencies	1	t	2011-01-20 11:43:34.105486
10	Article::Cms	2011-01-20 11:43:34.127318	2011-01-20 11:43:34.149957	reset_password	2	t	2011-01-20 11:43:34.149877
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
1	Electronics	Quod qui consequatur culpa voluptate facere deleniti dolor omnis.Mollitia in maiores eos repudiandae id.	2011-01-20 11:43:32.116506	2011-01-20 11:43:32.116506	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Eligendi dolorem voluptatem aliquam harum ea est.Eveniet asperiores cumque aspernatur id et.	2011-01-20 11:43:32.174067	2011-01-20 11:43:32.174067	\N	3	4	\N	0	2-leisure	f	0
3	Business	Eum aut at ut quae.Provident ea dignissimos incidunt.	2011-01-20 11:43:32.206728	2011-01-20 11:43:32.955776	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Quod qui consequatur culpa voluptate facere deleniti dolor omnis.Mollitia in maiores eos repudiandae id.	Electronics	2011-01-20 11:43:32.136802	2011-01-20 11:43:32.136802
2	1	dk	\N	Electronics	2011-01-20 11:43:32.164954	2011-01-20 11:43:32.164954
3	2	en	Eligendi dolorem voluptatem aliquam harum ea est.Eveniet asperiores cumque aspernatur id et.	Leisure	2011-01-20 11:43:32.178321	2011-01-20 11:43:32.178321
4	2	dk	\N	Leisure	2011-01-20 11:43:32.196707	2011-01-20 11:43:32.196707
5	3	en	Eum aut at ut quae.Provident ea dignissimos incidunt.	Business	2011-01-20 11:43:32.212507	2011-01-20 11:43:32.212507
6	3	dk	\N	Business	2011-01-20 11:43:32.235225	2011-01-20 11:43:32.235225
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-20 11:43:31.403958	2011-01-20 11:43:31.403958
2	United Kingdom	2011-01-20 11:43:31.411606	2011-01-20 11:43:31.411606
3	Wales129552381226836	2011-01-20 11:43:32.269712	2011-01-20 11:43:32.269712
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
1	Euro	&euro;	%u%n	t	2011-01-20 11:43:31.958006	2011-01-20 11:43:31.958006
2	PLN	&pln;	%u%n	t	2011-01-20 11:43:31.962421	2011-01-20 11:43:31.962421
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-20 11:43:31.443692	2011-01-20 11:43:31.443692
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-20 11:43:31.464242	2011-01-20 11:43:31.464242
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-20 11:43:31.4766	2011-01-20 11:43:31.4766
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-20 11:43:31.488564	2011-01-20 11:43:31.488564
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-20 11:43:31.500889	2011-01-20 11:43:31.500889
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-20 11:43:31.513078	2011-01-20 11:43:31.513078
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-20 11:43:31.525159	2011-01-20 11:43:31.525159
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-20 11:43:31.537388	2011-01-20 11:43:31.537388
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-20 11:43:31.555436	2011-01-20 11:43:31.555436
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-20 11:43:31.56844	2011-01-20 11:43:31.56844
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-20 11:43:31.581886	2011-01-20 11:43:31.581886
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-20 11:43:31.594689	2011-01-20 11:43:31.594689
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-20 11:43:31.607885	2011-01-20 11:43:31.607885
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-20 11:43:31.626029	2011-01-20 11:43:31.626029
15	8	en	Question	<p></p>	2011-01-20 11:43:31.639326	2011-01-20 11:43:31.639326
16	8	dk	[DK] Question	<p></p>	2011-01-20 11:43:31.655679	2011-01-20 11:43:31.655679
17	9	en	Invoice	<p></p>	2011-01-20 11:43:31.669842	2011-01-20 11:43:31.669842
18	9	dk	[DK] Invoice	<p></p>	2011-01-20 11:43:31.684362	2011-01-20 11:43:31.684362
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-20 11:43:31.434858	2011-01-20 11:43:31.460129
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-20 11:43:31.47217	2011-01-20 11:43:31.484532
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-20 11:43:31.49657	2011-01-20 11:43:31.508926
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-20 11:43:31.52086	2011-01-20 11:43:31.533155
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-20 11:43:31.548707	2011-01-20 11:43:31.564165
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-20 11:43:31.576752	2011-01-20 11:43:31.590233
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-20 11:43:31.603292	2011-01-20 11:43:31.621777
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-20 11:43:31.634736	2011-01-20 11:43:31.64945
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-20 11:43:31.664681	2011-01-20 11:43:31.678475
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, pkwiu, unit, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at, ean_number, details) FROM stdin;
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
1	1	dk	Eum aspernatur id facere et.Aspernatur laudantium eligendi mollitia natus iusto.	Natus officiis facere deleniti sed id.Aut similique ea repudiandae ducimus ratione qui ipsam.	Big deal on printers	2011-01-20 11:43:32.376191	2011-01-20 11:43:32.376191
2	2	dk	Eveniet ad quidem qui consequatur.Aut consequatur consectetur aut.	Ipsa vel recusandae laudantium molestiae.Ad cum nisi esse magni.	Drills required	2011-01-20 11:43:32.45413	2011-01-20 11:43:32.45413
3	3	dk	Totam et reiciendis modi sed non eum voluptatem.Doloremque quae id distinctio.	Ducimus est natus sed deserunt enim sunt provident aut.Id mollitia odio eum et eveniet in eius quia.	Need assistance in selling a car	2011-01-20 11:43:32.668837	2011-01-20 11:43:32.668837
4	4	dk	Nisi quas porro temporibus perspiciatis distinctio sed qui.Optio dolores repellendus dolores autem quos exercitationem.	Modi cupiditate ipsum enim non eum officia quis.Voluptatem quis quas minus cum dolorem ut magni.	Ipod shipment	2011-01-20 11:43:32.737781	2011-01-20 11:43:32.737781
5	5	dk	Aut enim dicta et qui.Laudantium est quidem quam veritatis.	Non deserunt laborum quos.Et nostrum est quibusdam praesentium laborum impedit.	Trip to amazonia - looking for offer	2011-01-20 11:43:32.814745	2011-01-20 11:43:32.814745
6	6	dk	Doloribus dolore aut molestiae provident non voluptates ut tempore.Ipsa aliquid vel rerum incidunt nam.	Et quibusdam vel aut doloribus eius eos laboriosam.In possimus amet facere sapiente et qui id.	LCD - Huge amounts	2011-01-20 11:43:32.887039	2011-01-20 11:43:32.887039
7	7	dk	Nobis pariatur culpa ipsa voluptas et quia fuga.Officia non illum ullam sit quia reprehenderit reiciendis.	Earum ad dolore in quis.Aut hic id quia est ducimus eveniet nemo.	GPS receivers required	2011-01-20 11:43:32.963041	2011-01-20 11:43:32.963041
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Natus officiis facere deleniti sed id.Aut similique ea repudiandae ducimus ratione qui ipsam.	Eum aspernatur id facere et.Aspernatur laudantium eligendi mollitia natus iusto.	2	User::Agent	0	797.0	820.0	1	Dicki	Earl Gottlieb	575.605.8299	marie@daugherty.ca	2011-01-20 11:43:32.332161	2011-01-20 11:43:32.332161	2011-01-25	Boris129552381226759 Hickle	1	t	\N	0	0	f	f	-1	1	2011-01-20 11:43:32.341507	\N	\N	88117 Kaia Manors	\N	\N	West Osvaldo	79375-0628	Greater Manchester
2	Drills required	3	Ipsa vel recusandae laudantium molestiae.Ad cum nisi esse magni.	Eveniet ad quidem qui consequatur.Aut consequatur consectetur aut.	2	User::Agent	0	402.0	728.0	1	Donnelly	Brielle Kautzer	903-510-4641	mia@lynchoconner.info	2011-01-20 11:43:32.414348	2011-01-20 11:43:32.414348	2011-01-25	Boris129552381226759 Hickle	1	t	\N	0	0	f	f	-1	1	2011-01-20 11:43:32.42089	\N	\N	9897 Genevieve Dale	\N	\N	New Trudie	52478	Clwyd
3	Need assistance in selling a car	3	Ducimus est natus sed deserunt enim sunt provident aut.Id mollitia odio eum et eveniet in eius quia.	Totam et reiciendis modi sed non eum voluptatem.Doloremque quae id distinctio.	2	User::Agent	0	492.0	332.0	1	Lueilwitz	Yazmin Abbott DVM	1-782-393-0781	timmy_roob@schadendietrich.ca	2011-01-20 11:43:32.630182	2011-01-20 11:43:32.630182	2011-01-25	Boris129552381226759 Hickle	1	t	\N	0	0	f	f	-1	1	2011-01-20 11:43:32.636792	\N	\N	85752 Francesco Radial	\N	\N	South Arvillaville	13170	County Down
4	Ipod shipment	3	Modi cupiditate ipsum enim non eum officia quis.Voluptatem quis quas minus cum dolorem ut magni.	Nisi quas porro temporibus perspiciatis distinctio sed qui.Optio dolores repellendus dolores autem quos exercitationem.	2	User::Agent	0	91.0	849.0	1	Waters	Gabriella Reynolds	(938)962-9594 x293	ricky@little.name	2011-01-20 11:43:32.705283	2011-01-20 11:43:32.705283	2011-01-25	Boris129552381226759 Hickle	1	t	\N	0	0	f	f	-1	1	2011-01-20 11:43:32.712091	\N	\N	954 Bette Drives	\N	\N	South Angie	41080-8686	County Tyrone
5	Trip to amazonia - looking for offer	3	Non deserunt laborum quos.Et nostrum est quibusdam praesentium laborum impedit.	Aut enim dicta et qui.Laudantium est quidem quam veritatis.	2	User::Agent	0	120.0	169.0	1	Yundt	Gerda Purdy	1-548-740-3980 x2109	mittie@okuneva.us	2011-01-20 11:43:32.782002	2011-01-20 11:43:32.782002	2011-01-25	Boris129552381226759 Hickle	1	t	\N	0	0	f	f	-1	1	2011-01-20 11:43:32.788686	\N	\N	65542 Savion Track	\N	\N	Deonview	24349	Avon
6	LCD - Huge amounts	3	Et quibusdam vel aut doloribus eius eos laboriosam.In possimus amet facere sapiente et qui id.	Doloribus dolore aut molestiae provident non voluptates ut tempore.Ipsa aliquid vel rerum incidunt nam.	2	User::Agent	0	4.0	546.0	1	Mills	Mr. Larue Cartwright	(406)276-0554	name.klein@leffler.us	2011-01-20 11:43:32.854931	2011-01-20 11:43:32.854931	2011-01-25	Boris129552381226759 Hickle	1	t	\N	0	0	f	f	-1	1	2011-01-20 11:43:32.861618	\N	\N	54391 Natalie Hills	\N	\N	Bechtelarton	75138	Cheshire
7	GPS receivers required	3	Earum ad dolore in quis.Aut hic id quia est ducimus eveniet nemo.	Nobis pariatur culpa ipsa voluptas et quia fuga.Officia non illum ullam sit quia reprehenderit reiciendis.	2	User::Agent	0	383.0	128.0	1	Mckenzie	Alfonso Krajcik	935-248-2526	vernice@wehner.ca	2011-01-20 11:43:32.922146	2011-01-20 11:43:32.922146	2011-01-25	Boris129552381226759 Hickle	1	t	\N	0	0	f	f	-1	1	2011-01-20 11:43:32.928771	\N	\N	94550 Marvin Burgs	\N	\N	New Veda	06782	Shropshire
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
1	default_payout_delay	--- 0\n	2011-01-20 11:43:31.208271	2011-01-20 11:43:31.208271
2	default_leads_per_page	--- 5\n	2011-01-20 11:43:31.214445	2011-01-20 11:43:31.214445
3	certification_level_1	--- 10\n	2011-01-20 11:43:31.218604	2011-01-20 11:43:31.218604
4	certification_level_2	--- 20\n	2011-01-20 11:43:31.221933	2011-01-20 11:43:31.221933
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-20 11:43:31.224225	2011-01-20 11:43:31.224225
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-20 11:43:31.371538	2011-01-20 11:43:31.371538
7	invoicing_seller_name	--- Fairleads\n	2011-01-20 11:43:31.374285	2011-01-20 11:43:31.374285
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-20 11:43:31.37644	2011-01-20 11:43:31.37644
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-20 11:43:31.378676	2011-01-20 11:43:31.378676
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-20 11:43:31.380827	2011-01-20 11:43:31.380827
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-20 11:43:31.383104	2011-01-20 11:43:31.383104
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
1	blazejek@gmail.com	38d901c6810e795a3131d263051a65ffdda5402b3be453ed008a1fe3ed20bd0390392011665016bb493631d7981cb938df7124a6259e9e99817a67f681074541	qgXgJ_msm8GADJxyRpyp	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 11:43:31.942076	2011-01-20 11:43:31.802175	\N	2011-01-20 11:43:31.80241	2011-01-20 11:43:31.942507	1	Bradly	Koss	1-158-996-4229 x2028	root	Mose Groves	Bergnaumberg	59613	Greater Manchester	1	\N	\N	\N	\N	0	\N	\N	\N	\N	bcB7HDlxiMgT1Shpc0F7HjTsAklMKQ3xJ1eWLevfl5oGxTSWL01oyB2qem4Gvo	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	ff4d19a0ef64d3ec5b32d8ee829b7d2d71f12d1b1b27cdda0715b476d27d94a60e7f59daa55ef050c3bbc355f2b1bee85c1b3759e958c84695c2a3278d84023f	96N68qqSt-wsPTL0NNQd	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 11:43:32.297075	2011-01-20 11:43:32.275092	\N	2011-01-20 11:43:32.275399	2011-01-20 11:43:32.297349	2	Boris129552381226759	Hickle	1-168-744-2258	Paxton Schmeler Sr.129552381226725	Oliver Shoal	Kuvalismouth	99307-6611	Lancashire	3	\N	0	\N	\N	0	\N	\N	\N	\N	jgYjzg4cEFIkTQUcldw64xiKVd9CoCy9U5ZYOIhBmTMbIuKObhNpViXzh0NrMH	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	fb3bf19b8fa8babf64a8af3093320793218a2db342907b2a50d9192e69f32606e1ad802dc034abea8009cc64fcc088147022c174870fffcd1db7e426aa6bed4e	84-fVl79zo_2Bz5EYK_4	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 11:43:33.19069	2011-01-20 11:43:33.170088	\N	2011-01-20 11:43:33.170321	2011-01-20 11:43:33.190986	1	Sanford	Fritsch	1-048-207-1586 x667	Maryjane McDermott12955238131654	Sawayn Radial	North Candace	25458	County Antrim	1	\N	\N	\N	\N	0	\N	\N	\N	\N	2K9ZN4iKuiKiTe0NYUOCn5uPnGqxaqOp20ZO6gYTf0LBb2eXBYehHZo4OOiVMP	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	c78587e5d157fa79f9aa829fb9926cc246515e333e097fc4dfb49c3750eab85ff67275685f8f8f3f87c761653ad25956cb29af53a0c93d99154cbe968f5e8ea3	4n3P9pIVczv7S5VwdebO	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 11:43:33.251183	2011-01-20 11:43:33.225756	\N	2011-01-20 11:43:33.225977	2011-01-20 11:43:33.251776	48	Larissa	Morar	575.287.2189 x607	Roosevelt Kub129552381322091	Price Roads	Spinkabury	50840	Nottinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	TDw3tWDJs04JoWqVHgazUcKtCalg8S0v3wEB5e09tm54BLTj70w41hhWQsbpZ3	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	26e30a1983f37623f249a1b9f69052fd03d8ae381893c9c1dba1097f0ffcb87c38df2105f3c1c8a77b4bcc08ddff24eae0baf905e0ee5b125e4ab3e1de704305	NVTkrU0-4oK2rl5C3HK0	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 11:43:33.30756	2011-01-20 11:43:33.285497	\N	2011-01-20 11:43:33.285719	2011-01-20 11:43:33.322968	64	Marjorie	Altenwerth	(728)697-8049 x102	Stacey Kunde129552381328071	Robel Mountains	Grimesview	23314-4406	Humberside	1	\N	\N	4	\N	0	\N	\N	\N	\N	3RBNyYkmi78CZMLYMHmiII1sJl2xVogg4cJbXwHgZi1oPBb14itZ97R94oZVyR	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

