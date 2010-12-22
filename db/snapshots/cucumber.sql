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
1	1	dk	About us	About us	2010-12-22 15:11:05.940168	2010-12-22 15:11:05.940168
2	1	en	About us	About us	2010-12-22 15:11:05.955473	2010-12-22 15:11:05.955473
3	2	dk	Privacy	Privacy	2010-12-22 15:11:05.985984	2010-12-22 15:11:05.985984
4	2	en	Privacy	Privacy	2010-12-22 15:11:05.998612	2010-12-22 15:11:05.998612
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-22 15:11:06.029449	2010-12-22 15:11:06.029449
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-22 15:11:06.169314	2010-12-22 15:11:06.169314
7	4	dk	Blurb sign up	Blurb sign up	2010-12-22 15:11:06.197697	2010-12-22 15:11:06.197697
8	4	en	Blurb sign up	Blurb sign up	2010-12-22 15:11:06.210252	2010-12-22 15:11:06.210252
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-22 15:11:06.237665	2010-12-22 15:11:06.237665
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-22 15:11:06.252149	2010-12-22 15:11:06.252149
11	6	dk	Blurb agent home	Blurb agent home	2010-12-22 15:11:06.279523	2010-12-22 15:11:06.279523
12	6	en	Blurb agent home	Blurb agent home	2010-12-22 15:11:06.292448	2010-12-22 15:11:06.292448
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-22 15:11:06.319423	2010-12-22 15:11:06.319423
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-22 15:11:06.331481	2010-12-22 15:11:06.331481
15	8	dk	Blurb currencies	Blurb currencies	2010-12-22 15:11:06.359182	2010-12-22 15:11:06.359182
16	8	en	Blurb currencies	Blurb currencies	2010-12-22 15:11:06.371909	2010-12-22 15:11:06.371909
17	9	dk	Reset password	Reset password	2010-12-22 15:11:06.400724	2010-12-22 15:11:06.400724
18	9	en	Reset password	Reset password	2010-12-22 15:11:06.413328	2010-12-22 15:11:06.413328
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-22 15:11:05.931559	2010-12-22 15:11:05.958459	about_us	0	t	2010-12-22 15:11:05.958381
2	Article::Cms	2010-12-22 15:11:05.98175	2010-12-22 15:11:06.001582	privacy	0	t	2010-12-22 15:11:06.001507
3	Article::Cms	2010-12-22 15:11:06.025294	2010-12-22 15:11:06.17239	terms_conditions	0	t	2010-12-22 15:11:06.172314
4	Article::Cms	2010-12-22 15:11:06.193436	2010-12-22 15:11:06.213275	blurb_sign_up	1	t	2010-12-22 15:11:06.213199
5	Article::Cms	2010-12-22 15:11:06.233586	2010-12-22 15:11:06.255277	blurb_buyer_home	1	t	2010-12-22 15:11:06.255145
6	Article::Cms	2010-12-22 15:11:06.275561	2010-12-22 15:11:06.295498	blurb_agent_home	1	t	2010-12-22 15:11:06.295388
7	Article::Cms	2010-12-22 15:11:06.31539	2010-12-22 15:11:06.33448	blurb_start_page_role_selection	1	t	2010-12-22 15:11:06.334404
8	Article::Cms	2010-12-22 15:11:06.355052	2010-12-22 15:11:06.375022	blurb_currencies	1	t	2010-12-22 15:11:06.374943
9	Article::Cms	2010-12-22 15:11:06.396482	2010-12-22 15:11:06.416507	reset_password	2	t	2010-12-22 15:11:06.416423
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
1	Electronics	Facere at magni explicabo esse.Sequi nisi consequatur velit aut aut.	2010-12-22 15:11:04.643989	2010-12-22 15:11:04.643989	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Laudantium expedita porro iusto qui sed commodi autem rerum.Consectetur sunt pariatur corrupti repellendus laboriosam sunt expedita.	2010-12-22 15:11:04.686449	2010-12-22 15:11:04.686449	\N	3	4	\N	0	2-leisure	f	0
3	Business	Quod illo rerum autem quas.Maxime dolorem tempore dolor est qui provident vitae est.	2010-12-22 15:11:04.718952	2010-12-22 15:11:05.52232	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Facere at magni explicabo esse.Sequi nisi consequatur velit aut aut.	Electronics	2010-12-22 15:11:04.652777	2010-12-22 15:11:04.652777
2	1	dk	\N	Electronics	2010-12-22 15:11:04.677276	2010-12-22 15:11:04.677276
3	2	en	Laudantium expedita porro iusto qui sed commodi autem rerum.Consectetur sunt pariatur corrupti repellendus laboriosam sunt expedita.	Leisure	2010-12-22 15:11:04.690742	2010-12-22 15:11:04.690742
4	2	dk	\N	Leisure	2010-12-22 15:11:04.709399	2010-12-22 15:11:04.709399
5	3	en	Quod illo rerum autem quas.Maxime dolorem tempore dolor est qui provident vitae est.	Business	2010-12-22 15:11:04.723461	2010-12-22 15:11:04.723461
6	3	dk	\N	Business	2010-12-22 15:11:04.744882	2010-12-22 15:11:04.744882
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-22 15:11:04.178742	2010-12-22 15:11:04.178742
2	United Kingdom	2010-12-22 15:11:04.183706	2010-12-22 15:11:04.183706
3	Northern Ireland129303066476916	2010-12-22 15:11:04.77053	2010-12-22 15:11:04.77053
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
1	Euro	&euro;	%u%n	t	2010-12-22 15:11:04.6221	2010-12-22 15:11:04.6221
2	PLN	&pln;	%u%n	t	2010-12-22 15:11:04.626554	2010-12-22 15:11:04.626554
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-22 15:11:04.208718	2010-12-22 15:11:04.208718
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-22 15:11:04.22342	2010-12-22 15:11:04.22342
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-22 15:11:04.235932	2010-12-22 15:11:04.235932
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-22 15:11:04.249542	2010-12-22 15:11:04.249542
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-22 15:11:04.26211	2010-12-22 15:11:04.26211
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-22 15:11:04.274478	2010-12-22 15:11:04.274478
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-22 15:11:04.287065	2010-12-22 15:11:04.287065
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-22 15:11:04.299908	2010-12-22 15:11:04.299908
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-22 15:11:04.43456	2010-12-22 15:11:04.43456
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-22 15:11:04.447041	2010-12-22 15:11:04.447041
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-22 15:11:04.459129	2010-12-22 15:11:04.459129
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-22 15:11:04.471147	2010-12-22 15:11:04.471147
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-22 15:11:04.483171	2010-12-22 15:11:04.483171
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-22 15:11:04.495728	2010-12-22 15:11:04.495728
15	8	en	Question	<p></p>	2010-12-22 15:11:04.508048	2010-12-22 15:11:04.508048
16	8	dk	[DK] Question	<p></p>	2010-12-22 15:11:04.519796	2010-12-22 15:11:04.519796
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-22 15:11:04.200008	2010-12-22 15:11:04.219032
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-22 15:11:04.231454	2010-12-22 15:11:04.245084
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-22 15:11:04.257616	2010-12-22 15:11:04.27034
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-22 15:11:04.282513	2010-12-22 15:11:04.295629
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-22 15:11:04.42977	2010-12-22 15:11:04.442953
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-22 15:11:04.45477	2010-12-22 15:11:04.466936
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-22 15:11:04.478837	2010-12-22 15:11:04.49153
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-22 15:11:04.50363	2010-12-22 15:11:04.515767
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
1	1	dk	Et qui aut aliquid quibusdam et.Ullam architecto non eos et fugit.	Big deal on printers	Molestias dolor vero sed qui.Nemo enim assumenda unde nam corporis delectus eum.	2010-12-22 15:11:04.997895	2010-12-22 15:11:04.997895
2	2	dk	Vitae expedita quo illo placeat animi veritatis est nulla.Sint quia laboriosam autem quia commodi autem animi distinctio.	Drills required	Sunt nam odit quasi aut sed.Occaecati sapiente impedit molestiae alias.	2010-12-22 15:11:05.067892	2010-12-22 15:11:05.067892
3	3	dk	Et incidunt ex aut.Dolore quia voluptas et.	Need assistance in selling a car	Eos ullam possimus corrupti sed sint aliquam fuga.Voluptas nobis sed eaque aliquam modi.	2010-12-22 15:11:05.136366	2010-12-22 15:11:05.136366
4	4	dk	Aliquam quia id molestias officia qui.Eum unde ut repudiandae.	Ipod shipment	Dignissimos modi error quam a ad autem dolores occaecati.Temporibus molestiae ut magnam deserunt.	2010-12-22 15:11:05.20226	2010-12-22 15:11:05.20226
5	5	dk	In harum at quasi dolore dicta adipisci.Rerum ut omnis ducimus harum et in.	Trip to amazonia - looking for offer	Eos deleniti nisi ea sapiente et dignissimos earum.Nisi laboriosam in qui aut.	2010-12-22 15:11:05.395959	2010-12-22 15:11:05.395959
6	6	dk	Voluptas deleniti repellendus id.Et magnam impedit eius.	LCD - Huge amounts	Qui vero eligendi enim.Eum sit minus nulla saepe esse.	2010-12-22 15:11:05.462046	2010-12-22 15:11:05.462046
7	7	dk	Quo quia incidunt enim similique est iusto.Similique aut accusantium explicabo consequatur fugit et.	GPS receivers required	Esse ipsa officiis eius doloribus id.Magnam harum voluptatem excepturi culpa consequatur quos.	2010-12-22 15:11:05.52936	2010-12-22 15:11:05.52936
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Et qui aut aliquid quibusdam et.Ullam architecto non eos et fugit.	Molestias dolor vero sed qui.Nemo enim assumenda unde nam corporis delectus eum.	2	User::Agent	0	222.0	235.0	1	Beahanstrosin	Devonte Lubowitz	1-025-551-2819	casandra@heathcote.uk	710 Romaguera Path	2010-12-22 15:11:04.958493	2010-12-22 15:11:04.958493	2010-12-27	Mavis129303066476839 Franecki	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Vitae expedita quo illo placeat animi veritatis est nulla.Sint quia laboriosam autem quia commodi autem animi distinctio.	Sunt nam odit quasi aut sed.Occaecati sapiente impedit molestiae alias.	2	User::Agent	0	234.0	114.0	1	Conroy	Doyle Lesch	(322)133-5159	hilma@kshlerinauer.uk	479 Jacobs Springs	2010-12-22 15:11:05.035997	2010-12-22 15:11:05.035997	2010-12-27	Mavis129303066476839 Franecki	1	t	\N	0	0	f	f	-1	1
3	Need assistance in selling a car	3	Et incidunt ex aut.Dolore quia voluptas et.	Eos ullam possimus corrupti sed sint aliquam fuga.Voluptas nobis sed eaque aliquam modi.	2	User::Agent	0	910.0	904.0	1	Bogisichdenesik	Lane Bartell	124.102.8598 x3664	russell@blick.name	7997 Jamarcus Loaf	2010-12-22 15:11:05.104129	2010-12-22 15:11:05.104129	2010-12-27	Mavis129303066476839 Franecki	1	t	\N	0	0	f	f	-1	1
4	Ipod shipment	3	Aliquam quia id molestias officia qui.Eum unde ut repudiandae.	Dignissimos modi error quam a ad autem dolores occaecati.Temporibus molestiae ut magnam deserunt.	2	User::Agent	0	0.0	491.0	1	Paucek	Emerald Crist	057.445.6619	howard@muller.co.uk	88626 Bradtke Knoll	2010-12-22 15:11:05.170662	2010-12-22 15:11:05.170662	2010-12-27	Mavis129303066476839 Franecki	1	t	\N	0	0	f	f	-1	1
5	Trip to amazonia - looking for offer	3	In harum at quasi dolore dicta adipisci.Rerum ut omnis ducimus harum et in.	Eos deleniti nisi ea sapiente et dignissimos earum.Nisi laboriosam in qui aut.	2	User::Agent	0	434.0	271.0	1	Rodriguez	Mr. Fanny Strosin	782.237.9101	cletus_schiller@brakus.info	66613 Libbie Heights	2010-12-22 15:11:05.237355	2010-12-22 15:11:05.237355	2010-12-27	Mavis129303066476839 Franecki	1	t	\N	0	0	f	f	-1	1
6	LCD - Huge amounts	3	Voluptas deleniti repellendus id.Et magnam impedit eius.	Qui vero eligendi enim.Eum sit minus nulla saepe esse.	2	User::Agent	0	89.0	453.0	1	Reichel	Adriana Sawayn	1-095-960-8305 x6504	mariela.labadie@stoltenberg.uk	18739 Hills Forge	2010-12-22 15:11:05.430514	2010-12-22 15:11:05.430514	2010-12-27	Mavis129303066476839 Franecki	1	t	\N	0	0	f	f	-1	1
7	GPS receivers required	3	Quo quia incidunt enim similique est iusto.Similique aut accusantium explicabo consequatur fugit et.	Esse ipsa officiis eius doloribus id.Magnam harum voluptatem excepturi culpa consequatur quos.	2	User::Agent	0	279.0	703.0	1	Berge	Fae Grady	748-971-8182 x2806	paxton.lind@rutherford.us	330 Prosacco Drives	2010-12-22 15:11:05.49767	2010-12-22 15:11:05.49767	2010-12-27	Mavis129303066476839 Franecki	1	t	\N	0	0	f	f	-1	1
\.


--
-- Data for Name: payment_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY payment_notifications (id, params, buyer_id, status, transaction_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-22 15:11:04.147802	2010-12-22 15:11:04.147802
2	default_leads_per_page	--- 5\n	2010-12-22 15:11:04.15331	2010-12-22 15:11:04.15331
3	certification_level_1	--- 10\n	2010-12-22 15:11:04.155409	2010-12-22 15:11:04.155409
4	certification_level_2	--- 20\n	2010-12-22 15:11:04.157623	2010-12-22 15:11:04.157623
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-22 15:11:04.159692	2010-12-22 15:11:04.159692
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-22 15:11:04.161969	2010-12-22 15:11:04.161969
7	invoicing_seller_name	--- Fairleads\n	2010-12-22 15:11:04.164095	2010-12-22 15:11:04.164095
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-22 15:11:04.166246	2010-12-22 15:11:04.166246
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-22 15:11:04.168337	2010-12-22 15:11:04.168337
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-22 15:11:04.170413	2010-12-22 15:11:04.170413
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
1	blazejek@gmail.com	e50549380ff6ec9308c2d2386f49f518b41d21cd5c66db8d5d2b2062ccbe4194ab67a78556befab50549e8c01199e207b9292db6eb7021f7a9ca46bb227cc4f6	dCnMKTRU-CaTHXelEyaH	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 15:11:04.612258	2010-12-22 15:11:04.552817	\N	2010-12-22 15:11:04.553031	2010-12-22 15:11:04.612543	1	Agustin	Connelly	1-498-211-7046	root	Schamberger Run	Jailynburgh	35128	Northumberland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	jJf9XTU3b0m3wS8QxUTCtKJHbafK2wRRjrSzFBGJdJYpmiKjeo2xJh13NkW4nQ	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	618315f38bf6f2147e7d9856af5ecdbca4b86a1c0106ed04f30a0fbb528981de44911f262b406d626957f07a8bbfba6cce06623d960d9a8a021d7e5afd215760	qIUXhZ9-jvqjPO06AP2Y	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 15:11:04.799221	2010-12-22 15:11:04.776386	\N	2010-12-22 15:11:04.776611	2010-12-22 15:11:04.799509	2	Mavis129303066476839	Franecki	1-777-239-3807	Granville Schultz129303066476803	Curt Shores	East Eduardotown	62936-2989	Norfolk	3	\N	0	\N	\N	0	\N	\N	\N	\N	AC5pdqjGX81PxynryPVVgqxY2RPj6R6X9DZXXKW8w6wU6k3KUR0ZMLgy7Bf52J	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	fa928c213f0f83e6443aa9fdf696ea45b46abc685f40343efc8c70dd49db789116d3cacd94e7a5db37384dad3384d2116bcc329c7542944edf7df1d5482df6e5	84TKe4RVsNQz8mvep6cH	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 15:11:05.604251	2010-12-22 15:11:05.583956	\N	2010-12-22 15:11:05.584233	2010-12-22 15:11:05.604639	1	Dallas	Heller	231.726.3350 x6902	Felipe Runolfsson129303066557957	Fermin Point	Parisianberg	96149-0469	County Armagh	1	\N	\N	\N	\N	0	\N	\N	\N	\N	0rQoKn12eL7cslQNOiWhPuiJSvy5JcPDkKwiTWgnXmWZhSCdANo3c2PJC7Clxj	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	6d81f53a0a0dafb35c1fd334f03c91ebe40c1d48fef92709d87a8417d3535ecd1307753569ac419009d56cb4e649f1012f23783280577c95c8f368665c9eba98	La71FzK0p4RYiGzo7JG6	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 15:11:05.657348	2010-12-22 15:11:05.63516	\N	2010-12-22 15:11:05.635373	2010-12-22 15:11:05.657625	48	Doris	Hamill	124.250.8897	Ms. Doris Rowe129303066563001	Will Rest	New Yasmine	89420	County Tyrone	1	\N	\N	\N	\N	0	\N	\N	\N	\N	gOlXpmWZD6fvXCQDpKES6k8YVfYplqroY43pbkDW5eTFQWDobRQFvirT5ZkhFy	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	6c7c75a407f95b2525cb5c44fe7b58e1ead8ef080e0fe05a7a04508f87763b9d4d952d1810f3cc5f83dcf5b1157325bad00fbc533b8aea22b7441b2de61879eb	hMBab7FHRzHsqknVcVmO	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 15:11:05.709163	2010-12-22 15:11:05.68742	\N	2010-12-22 15:11:05.687629	2010-12-22 15:11:05.723358	64	Darius	Harris	347-889-5025	Omer Effertz129303066568228	Pete Motorway	Colbystad	80380	Tyne and Wear	1	\N	\N	4	\N	0	\N	\N	\N	\N	5KeePCE8B1KhjMUqhiqyuDpumnP0sEJzKXbQ2xzH7eXWjVYQZnXaXksBGlcHqi	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

