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
1	1	dk	About us	About us	2011-01-17 11:09:24.227741	2011-01-17 11:09:24.227741
2	1	en	About us	About us	2011-01-17 11:09:24.24163	2011-01-17 11:09:24.24163
3	2	dk	Privacy	Privacy	2011-01-17 11:09:24.272593	2011-01-17 11:09:24.272593
4	2	en	Privacy	Privacy	2011-01-17 11:09:24.283918	2011-01-17 11:09:24.283918
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-17 11:09:24.315202	2011-01-17 11:09:24.315202
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-17 11:09:24.326945	2011-01-17 11:09:24.326945
7	4	dk	Blurb sign up	Blurb sign up	2011-01-17 11:09:24.354362	2011-01-17 11:09:24.354362
8	4	en	Blurb sign up	Blurb sign up	2011-01-17 11:09:24.365558	2011-01-17 11:09:24.365558
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-17 11:09:24.392622	2011-01-17 11:09:24.392622
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-17 11:09:24.403541	2011-01-17 11:09:24.403541
11	6	dk	Blurb agent home	Blurb agent home	2011-01-17 11:09:24.432719	2011-01-17 11:09:24.432719
12	6	en	Blurb agent home	Blurb agent home	2011-01-17 11:09:24.444789	2011-01-17 11:09:24.444789
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-17 11:09:24.474215	2011-01-17 11:09:24.474215
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-17 11:09:24.624305	2011-01-17 11:09:24.624305
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-17 11:09:24.652306	2011-01-17 11:09:24.652306
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-17 11:09:24.663859	2011-01-17 11:09:24.663859
17	9	dk	Blurb currencies	Blurb currencies	2011-01-17 11:09:24.694404	2011-01-17 11:09:24.694404
18	9	en	Blurb currencies	Blurb currencies	2011-01-17 11:09:24.705913	2011-01-17 11:09:24.705913
19	10	dk	Reset password	Reset password	2011-01-17 11:09:24.733934	2011-01-17 11:09:24.733934
20	10	en	Reset password	Reset password	2011-01-17 11:09:24.745348	2011-01-17 11:09:24.745348
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-17 11:09:24.219382	2011-01-17 11:09:24.244432	about_us	0	t	2011-01-17 11:09:24.244362
2	Article::Cms	2011-01-17 11:09:24.268456	2011-01-17 11:09:24.28663	privacy	0	t	2011-01-17 11:09:24.286558
3	Article::Cms	2011-01-17 11:09:24.311013	2011-01-17 11:09:24.329651	terms_conditions	0	t	2011-01-17 11:09:24.329578
4	Article::Cms	2011-01-17 11:09:24.350367	2011-01-17 11:09:24.368322	blurb_sign_up	1	t	2011-01-17 11:09:24.368248
5	Article::Cms	2011-01-17 11:09:24.38858	2011-01-17 11:09:24.406219	blurb_buyer_home	1	t	2011-01-17 11:09:24.406144
6	Article::Cms	2011-01-17 11:09:24.428568	2011-01-17 11:09:24.447574	blurb_agent_home	1	t	2011-01-17 11:09:24.447499
7	Article::Cms	2011-01-17 11:09:24.47001	2011-01-17 11:09:24.627058	blurb_purchase_manager_home	1	t	2011-01-17 11:09:24.626982
8	Article::Cms	2011-01-17 11:09:24.648324	2011-01-17 11:09:24.666789	blurb_start_page_role_selection	1	t	2011-01-17 11:09:24.666715
9	Article::Cms	2011-01-17 11:09:24.68744	2011-01-17 11:09:24.70866	blurb_currencies	1	t	2011-01-17 11:09:24.708586
10	Article::Cms	2011-01-17 11:09:24.729919	2011-01-17 11:09:24.748069	reset_password	2	t	2011-01-17 11:09:24.747992
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
1	Electronics	Quis a architecto necessitatibus sint totam qui.Rerum et quaerat autem aut et.	2011-01-17 11:09:22.880754	2011-01-17 11:09:22.880754	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Nulla dolorem molestiae quae dicta.Qui dolor qui laboriosam earum at.	2011-01-17 11:09:22.923585	2011-01-17 11:09:22.923585	\N	3	4	\N	0	2-leisure	f	0
3	Business	Asperiores nulla dignissimos rerum.Distinctio asperiores nesciunt impedit ut tempore.	2011-01-17 11:09:22.955194	2011-01-17 11:09:23.642271	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Quis a architecto necessitatibus sint totam qui.Rerum et quaerat autem aut et.	Electronics	2011-01-17 11:09:22.889582	2011-01-17 11:09:22.889582
2	1	dk	\N	Electronics	2011-01-17 11:09:22.914288	2011-01-17 11:09:22.914288
3	2	en	Nulla dolorem molestiae quae dicta.Qui dolor qui laboriosam earum at.	Leisure	2011-01-17 11:09:22.927748	2011-01-17 11:09:22.927748
4	2	dk	\N	Leisure	2011-01-17 11:09:22.945923	2011-01-17 11:09:22.945923
5	3	en	Asperiores nulla dignissimos rerum.Distinctio asperiores nesciunt impedit ut tempore.	Business	2011-01-17 11:09:22.959658	2011-01-17 11:09:22.959658
6	3	dk	\N	Business	2011-01-17 11:09:22.978098	2011-01-17 11:09:22.978098
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-17 11:09:22.376965	2011-01-17 11:09:22.376965
2	United Kingdom	2011-01-17 11:09:22.381648	2011-01-17 11:09:22.381648
3	Northern Ireland129526256300469	2011-01-17 11:09:23.006051	2011-01-17 11:09:23.006051
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
1	Euro	&euro;	%u%n	t	2011-01-17 11:09:22.859313	2011-01-17 11:09:22.859313
2	PLN	&pln;	%u%n	t	2011-01-17 11:09:22.863435	2011-01-17 11:09:22.863435
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-17 11:09:22.407574	2011-01-17 11:09:22.407574
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-17 11:09:22.422205	2011-01-17 11:09:22.422205
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-17 11:09:22.434722	2011-01-17 11:09:22.434722
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-17 11:09:22.446803	2011-01-17 11:09:22.446803
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-17 11:09:22.459177	2011-01-17 11:09:22.459177
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-17 11:09:22.471293	2011-01-17 11:09:22.471293
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-17 11:09:22.483873	2011-01-17 11:09:22.483873
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-17 11:09:22.496267	2011-01-17 11:09:22.496267
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-17 11:09:22.509224	2011-01-17 11:09:22.509224
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-17 11:09:22.522017	2011-01-17 11:09:22.522017
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-17 11:09:22.53555	2011-01-17 11:09:22.53555
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-17 11:09:22.547995	2011-01-17 11:09:22.547995
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-17 11:09:22.560861	2011-01-17 11:09:22.560861
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-17 11:09:22.573254	2011-01-17 11:09:22.573254
15	8	en	Question	<p></p>	2011-01-17 11:09:22.586285	2011-01-17 11:09:22.586285
16	8	dk	[DK] Question	<p></p>	2011-01-17 11:09:22.5989	2011-01-17 11:09:22.5989
17	9	en	Invoice	<p></p>	2011-01-17 11:09:22.612107	2011-01-17 11:09:22.612107
18	9	dk	[DK] Invoice	<p></p>	2011-01-17 11:09:22.624695	2011-01-17 11:09:22.624695
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-17 11:09:22.398724	2011-01-17 11:09:22.418084
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-17 11:09:22.430249	2011-01-17 11:09:22.442701
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-17 11:09:22.454774	2011-01-17 11:09:22.467253
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-17 11:09:22.479352	2011-01-17 11:09:22.491819
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-17 11:09:22.5046	2011-01-17 11:09:22.517779
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-17 11:09:22.530733	2011-01-17 11:09:22.543781
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-17 11:09:22.556336	2011-01-17 11:09:22.569081
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-17 11:09:22.581677	2011-01-17 11:09:22.594501
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-17 11:09:22.607312	2011-01-17 11:09:22.620446
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
1	1	dk	Vel ut sit deserunt est molestiae quia placeat.Ex aut quo velit aspernatur alias animi.	Expedita illo minus qui nobis accusamus nisi ratione.Accusamus quia molestiae enim eum odit.	Big deal on printers	2011-01-17 11:09:23.107369	2011-01-17 11:09:23.107369
2	2	dk	Sit qui optio commodi aliquam quae eaque.Soluta quae autem doloremque est iusto et rerum blanditiis.	Nihil at sequi dolores quis consectetur nesciunt reiciendis aut.Quasi recusandae sunt quia vel voluptatum.	Drills required	2011-01-17 11:09:23.177733	2011-01-17 11:09:23.177733
3	3	dk	Consequuntur recusandae aut eos non in qui.Sit voluptatem a dolorum at voluptas rerum qui neque.	Nostrum laboriosam odit repudiandae vero.Voluptas earum fuga nihil.	Need assistance in selling a car	2011-01-17 11:09:23.377992	2011-01-17 11:09:23.377992
4	4	dk	Voluptates et dolorem quod in.Sunt iure illum eaque voluptas.	Repellat veritatis odio cupiditate et corporis qui animi.Id error voluptas unde est.	Ipod shipment	2011-01-17 11:09:23.446807	2011-01-17 11:09:23.446807
5	5	dk	Aspernatur in esse dolores.Quaerat quis corporis assumenda enim et magnam eveniet velit.	Maiores debitis similique dicta dolor illo.Aut architecto totam hic incidunt non rerum vitae.	Trip to amazonia - looking for offer	2011-01-17 11:09:23.514491	2011-01-17 11:09:23.514491
6	6	dk	Quia quis deserunt dignissimos.Amet animi quisquam optio iure quos quia reprehenderit numquam.	Dolores eum in nesciunt rem iste voluptatem culpa voluptates.Et maiores porro quam ad quo harum repellat.	LCD - Huge amounts	2011-01-17 11:09:23.580828	2011-01-17 11:09:23.580828
7	7	dk	Vero quibusdam repellat aut.Dolor sunt repellat beatae modi quasi quis aut.	Quasi porro quia et voluptas est totam reprehenderit non.Laboriosam cum quod ducimus temporibus non quaerat quia.	GPS receivers required	2011-01-17 11:09:23.649377	2011-01-17 11:09:23.649377
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Expedita illo minus qui nobis accusamus nisi ratione.Accusamus quia molestiae enim eum odit.	Vel ut sit deserunt est molestiae quia placeat.Ex aut quo velit aspernatur alias animi.	2	User::Agent	0	156.0	286.0	1	Braunkunze	Maxime Padberg	1-399-734-6433	arvel.maggio@grimeslebsack.uk	2011-01-17 11:09:23.067633	2011-01-17 11:09:23.067633	2011-01-22	Lorenz129526256300392 Lowe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:09:23.076822	\N	\N	774 Wyman Islands	\N	\N	East Carmella	20882	Mid Glamorgan
2	Drills required	3	Nihil at sequi dolores quis consectetur nesciunt reiciendis aut.Quasi recusandae sunt quia vel voluptatum.	Sit qui optio commodi aliquam quae eaque.Soluta quae autem doloremque est iusto et rerum blanditiis.	2	User::Agent	0	126.0	732.0	1	Hauck	Domenico Mueller	1-329-027-7743 x611	maximillian@johnstonkohler.name	2011-01-17 11:09:23.14582	2011-01-17 11:09:23.14582	2011-01-22	Lorenz129526256300392 Lowe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:09:23.152531	\N	\N	7879 Kihn Harbors	\N	\N	Kristafort	89601-0362	Central
3	Need assistance in selling a car	3	Nostrum laboriosam odit repudiandae vero.Voluptas earum fuga nihil.	Consequuntur recusandae aut eos non in qui.Sit voluptatem a dolorum at voluptas rerum qui neque.	2	User::Agent	0	849.0	281.0	1	Mayert	Dayne Wolf	(816)417-0248	graham@tillmanboyer.co.uk	2011-01-17 11:09:23.345804	2011-01-17 11:09:23.345804	2011-01-22	Lorenz129526256300392 Lowe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:09:23.352431	\N	\N	38814 Effertz River	\N	\N	Stephanieborough	23432	Highlands and Islands
4	Ipod shipment	3	Repellat veritatis odio cupiditate et corporis qui animi.Id error voluptas unde est.	Voluptates et dolorem quod in.Sunt iure illum eaque voluptas.	2	User::Agent	0	692.0	636.0	1	Treutel	Ms. Phyllis Kreiger	1-913-689-9389 x7963	reggie_gerhold@rowe.biz	2011-01-17 11:09:23.414539	2011-01-17 11:09:23.414539	2011-01-22	Lorenz129526256300392 Lowe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:09:23.421224	\N	\N	522 Herman Rest	\N	\N	New Kennith	49376	Norfolk
5	Trip to amazonia - looking for offer	3	Maiores debitis similique dicta dolor illo.Aut architecto totam hic incidunt non rerum vitae.	Aspernatur in esse dolores.Quaerat quis corporis assumenda enim et magnam eveniet velit.	2	User::Agent	0	957.0	229.0	1	Pollich	Derrick Walker	012.865.8495	nathanial@pollich.com	2011-01-17 11:09:23.482116	2011-01-17 11:09:23.482116	2011-01-22	Lorenz129526256300392 Lowe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:09:23.488713	\N	\N	418 Mraz Drives	\N	\N	East Adonisberg	59939	Wiltshire
6	LCD - Huge amounts	3	Dolores eum in nesciunt rem iste voluptatem culpa voluptates.Et maiores porro quam ad quo harum repellat.	Quia quis deserunt dignissimos.Amet animi quisquam optio iure quos quia reprehenderit numquam.	2	User::Agent	0	215.0	145.0	1	Willms	Abe Nikolaus	637-466-0117	alexandre_muller@nader.ca	2011-01-17 11:09:23.549062	2011-01-17 11:09:23.549062	2011-01-22	Lorenz129526256300392 Lowe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:09:23.555598	\N	\N	04899 Ratke Plaza	\N	\N	East Ciaraside	85968-0704	Derbyshire
7	GPS receivers required	3	Quasi porro quia et voluptas est totam reprehenderit non.Laboriosam cum quod ducimus temporibus non quaerat quia.	Vero quibusdam repellat aut.Dolor sunt repellat beatae modi quasi quis aut.	2	User::Agent	0	773.0	267.0	1	Adams	Angelina Bernier	1-906-638-7498 x6016	alberto@senger.info	2011-01-17 11:09:23.615616	2011-01-17 11:09:23.615616	2011-01-22	Lorenz129526256300392 Lowe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:09:23.622862	\N	\N	069 Franecki Village	\N	\N	Jaceyview	78965	County Tyrone
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
1	default_payout_delay	--- 0\n	2011-01-17 11:09:22.340529	2011-01-17 11:09:22.340529
2	default_leads_per_page	--- 5\n	2011-01-17 11:09:22.346092	2011-01-17 11:09:22.346092
3	certification_level_1	--- 10\n	2011-01-17 11:09:22.349924	2011-01-17 11:09:22.349924
4	certification_level_2	--- 20\n	2011-01-17 11:09:22.353199	2011-01-17 11:09:22.353199
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-17 11:09:22.35558	2011-01-17 11:09:22.35558
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-17 11:09:22.357761	2011-01-17 11:09:22.357761
7	invoicing_seller_name	--- Fairleads\n	2011-01-17 11:09:22.359845	2011-01-17 11:09:22.359845
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-17 11:09:22.36216	2011-01-17 11:09:22.36216
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-17 11:09:22.364314	2011-01-17 11:09:22.364314
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-17 11:09:22.366399	2011-01-17 11:09:22.366399
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-17 11:09:22.368476	2011-01-17 11:09:22.368476
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
1	blazejek@gmail.com	1a3a1b33ce09b48c2980ea82d0e8b43ae7cc58d7c60280f0efb2a25cda8a4ec59b72417fadb6c13b2f9f29b17417d562896f90b67781a76abbee9f654ac9e8b2	TNiWM32V2JgolDGC28F3	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 11:09:22.849407	2011-01-17 11:09:22.663718	\N	2011-01-17 11:09:22.663936	2011-01-17 11:09:22.849702	1	Beth	Bode	(332)906-5295 x4781	root	Vivienne Camp	Jaydonfurt	85650-0583	West Midlands	1	\N	\N	\N	\N	0	\N	\N	\N	\N	eMVnSi8ZUmoZ5eDkieAeUhWc1jtmaVJgM9Qcip2SN1hOciaMb3DaY9QR7cMHZd	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
2	agent@nbs.com	38602323a36baabd4b950be947143275644bc69e95cf09c646034c1ea5ea4071e0a4c911490d4536f1d8ad61a918b3a2a8f39c749fcf38c2fb984eda7d028bcf	Uq5qqYs8u0c2-MvGo1jc	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 11:09:23.032899	2011-01-17 11:09:23.011527	\N	2011-01-17 11:09:23.011738	2011-01-17 11:09:23.033203	2	Lorenz129526256300392	Lowe	(510)613-7028 x435	Rashad Kub129526256300368	Hettinger Parks	South Myron	32682-8343	Staffordshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	7C8viZ9iyfDK9ykukToZjvBuVS06pRiwhERO81fSN68RS6j6aN25cFi0ih3gOs	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
3	admin@nbs.com	3047e5afc1508ce0c0867872f0772087a54f6ffdd7b3f786062b4146922176cc67f4c6caf2cbb68239f93ea6c486509ec745013605e1bb8a43c8379eca7dcf82	hb9BsgaYbbTnDBr7BkEY	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 11:09:23.856905	2011-01-17 11:09:23.837338	\N	2011-01-17 11:09:23.837559	2011-01-17 11:09:23.85718	1	Lourdes	Beer	708.506.1051 x8726	Deron Kerluke129526256383256	Larson Manor	East Richie	63422	West Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	N4hGXoOsvgST0vVKAxx216C2TGj3fMzV1r7qM9Klv7cQxYcTmfj6mF1fKtzeRV	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
4	buyer@nbs.com	67c269502198a4427ad1b94c3c141ee8d20916985f5777473b28681a11fb8572dfbce9c6b0f8d4ba60aada87892f3e4f5277c49ea6eb3f097a605cd3f4bfe82d	YPCmdLFmdRvzqzE-1BGp	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 11:09:23.912771	2011-01-17 11:09:23.890864	\N	2011-01-17 11:09:23.891083	2011-01-17 11:09:23.913047	48	Kirsten	McClure	1-262-434-2015	Rosanna Fadel129526256388586	Mertz Village	Maggieville	75154	County Down	1	\N	\N	\N	\N	0	\N	\N	\N	\N	hDNngyJdFrl2RG1wRUGOKFwC5f3gPFvJCUo6qi7Z1BxzOrezAwWQYa7ygQrwXn	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
5	leaduser@nbs.com	93591340c159f024356ed23d53449cb28a8651ac34731b72016422722ce592e9a20ce208cc8b2a5af3cf033b08976de3c2375a29e52e03017530a573b4816d96	yqgbGJS1pSx0ANCE4VvZ	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 11:09:23.967829	2011-01-17 11:09:23.946115	\N	2011-01-17 11:09:23.946335	2011-01-17 11:09:23.98295	64	Rigoberto	Sipes	727.916.5516	Camille Kuphal129526256394098	Ricky Crossroad	Ratkefurt	45754-0866	Nottinghamshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	s8vUewB4WRPoPQBzwYl5Twi9naFARr8S5hXYVDuuRegtPIonnM78I1O9vODuUZ	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

