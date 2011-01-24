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
1	1	dk	About us	About us	2011-01-20 15:46:54.170116	2011-01-20 15:46:54.170116
2	1	en	About us	About us	2011-01-20 15:46:54.183944	2011-01-20 15:46:54.183944
3	2	dk	Privacy	Privacy	2011-01-20 15:46:54.215048	2011-01-20 15:46:54.215048
4	2	en	Privacy	Privacy	2011-01-20 15:46:54.226364	2011-01-20 15:46:54.226364
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-20 15:46:54.257136	2011-01-20 15:46:54.257136
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-20 15:46:54.26822	2011-01-20 15:46:54.26822
7	4	dk	Blurb sign up	Blurb sign up	2011-01-20 15:46:54.30036	2011-01-20 15:46:54.30036
8	4	en	Blurb sign up	Blurb sign up	2011-01-20 15:46:54.312019	2011-01-20 15:46:54.312019
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-20 15:46:54.340941	2011-01-20 15:46:54.340941
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-20 15:46:54.3523	2011-01-20 15:46:54.3523
11	6	dk	Blurb agent home	Blurb agent home	2011-01-20 15:46:54.528214	2011-01-20 15:46:54.528214
12	6	en	Blurb agent home	Blurb agent home	2011-01-20 15:46:54.539858	2011-01-20 15:46:54.539858
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-20 15:46:54.56804	2011-01-20 15:46:54.56804
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-20 15:46:54.579345	2011-01-20 15:46:54.579345
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-20 15:46:54.609153	2011-01-20 15:46:54.609153
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-20 15:46:54.621255	2011-01-20 15:46:54.621255
17	9	dk	Blurb currencies	Blurb currencies	2011-01-20 15:46:54.649032	2011-01-20 15:46:54.649032
18	9	en	Blurb currencies	Blurb currencies	2011-01-20 15:46:54.660238	2011-01-20 15:46:54.660238
19	10	dk	Reset password	Reset password	2011-01-20 15:46:54.687521	2011-01-20 15:46:54.687521
20	10	en	Reset password	Reset password	2011-01-20 15:46:54.6987	2011-01-20 15:46:54.6987
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-20 15:46:54.161433	2011-01-20 15:46:54.186751	about_us	0	t	2011-01-20 15:46:54.186678
2	Article::Cms	2011-01-20 15:46:54.210814	2011-01-20 15:46:54.22911	privacy	0	t	2011-01-20 15:46:54.229035
3	Article::Cms	2011-01-20 15:46:54.253201	2011-01-20 15:46:54.271444	terms_conditions	0	t	2011-01-20 15:46:54.271363
4	Article::Cms	2011-01-20 15:46:54.292212	2011-01-20 15:46:54.314704	blurb_sign_up	1	t	2011-01-20 15:46:54.314631
5	Article::Cms	2011-01-20 15:46:54.337041	2011-01-20 15:46:54.354981	blurb_buyer_home	1	t	2011-01-20 15:46:54.354907
6	Article::Cms	2011-01-20 15:46:54.376099	2011-01-20 15:46:54.542798	blurb_agent_home	1	t	2011-01-20 15:46:54.542719
7	Article::Cms	2011-01-20 15:46:54.564096	2011-01-20 15:46:54.582164	blurb_purchase_manager_home	1	t	2011-01-20 15:46:54.582091
8	Article::Cms	2011-01-20 15:46:54.604535	2011-01-20 15:46:54.624252	blurb_start_page_role_selection	1	t	2011-01-20 15:46:54.624171
9	Article::Cms	2011-01-20 15:46:54.644929	2011-01-20 15:46:54.663179	blurb_currencies	1	t	2011-01-20 15:46:54.663101
10	Article::Cms	2011-01-20 15:46:54.683664	2011-01-20 15:46:54.701448	reset_password	2	t	2011-01-20 15:46:54.701375
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
1	Electronics	Rerum dolor sunt quis ut enim.Tempora minima ut nostrum modi voluptatem.	2011-01-20 15:46:52.793019	2011-01-20 15:46:52.793019	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	In aut voluptas tempora aspernatur cum.Ducimus qui quis est vero.	2011-01-20 15:46:52.840374	2011-01-20 15:46:52.840374	\N	3	4	\N	0	2-leisure	f	0
3	Business	Quis voluptatem fugit velit aut suscipit.Unde voluptatem voluptatem eum aut explicabo totam.	2011-01-20 15:46:52.872987	2011-01-20 15:46:53.707813	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Rerum dolor sunt quis ut enim.Tempora minima ut nostrum modi voluptatem.	Electronics	2011-01-20 15:46:52.805841	2011-01-20 15:46:52.805841
2	1	dk	\N	Electronics	2011-01-20 15:46:52.830869	2011-01-20 15:46:52.830869
3	2	en	In aut voluptas tempora aspernatur cum.Ducimus qui quis est vero.	Leisure	2011-01-20 15:46:52.844659	2011-01-20 15:46:52.844659
4	2	dk	\N	Leisure	2011-01-20 15:46:52.863541	2011-01-20 15:46:52.863541
5	3	en	Quis voluptatem fugit velit aut suscipit.Unde voluptatem voluptatem eum aut explicabo totam.	Business	2011-01-20 15:46:52.877476	2011-01-20 15:46:52.877476
6	3	dk	\N	Business	2011-01-20 15:46:52.896325	2011-01-20 15:46:52.896325
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-20 15:46:52.270576	2011-01-20 15:46:52.270576
2	United Kingdom	2011-01-20 15:46:52.275482	2011-01-20 15:46:52.275482
3	Northern Ireland129553841292375	2011-01-20 15:46:52.925233	2011-01-20 15:46:52.925233
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
1	Euro	&euro;	%u%n	t	2011-01-20 15:46:52.771421	2011-01-20 15:46:52.771421
2	PLN	&pln;	%u%n	t	2011-01-20 15:46:52.775815	2011-01-20 15:46:52.775815
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-20 15:46:52.303167	2011-01-20 15:46:52.303167
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-20 15:46:52.318096	2011-01-20 15:46:52.318096
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-20 15:46:52.330479	2011-01-20 15:46:52.330479
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-20 15:46:52.342916	2011-01-20 15:46:52.342916
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-20 15:46:52.355601	2011-01-20 15:46:52.355601
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-20 15:46:52.368069	2011-01-20 15:46:52.368069
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-20 15:46:52.381228	2011-01-20 15:46:52.381228
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-20 15:46:52.395387	2011-01-20 15:46:52.395387
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-20 15:46:52.409171	2011-01-20 15:46:52.409171
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-20 15:46:52.424412	2011-01-20 15:46:52.424412
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-20 15:46:52.438936	2011-01-20 15:46:52.438936
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-20 15:46:52.451785	2011-01-20 15:46:52.451785
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-20 15:46:52.465118	2011-01-20 15:46:52.465118
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-20 15:46:52.477783	2011-01-20 15:46:52.477783
15	8	en	Question	<p></p>	2011-01-20 15:46:52.491096	2011-01-20 15:46:52.491096
16	8	dk	[DK] Question	<p></p>	2011-01-20 15:46:52.504002	2011-01-20 15:46:52.504002
17	9	en	Invoice	<p></p>	2011-01-20 15:46:52.517122	2011-01-20 15:46:52.517122
18	9	dk	[DK] Invoice	<p></p>	2011-01-20 15:46:52.529867	2011-01-20 15:46:52.529867
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-20 15:46:52.293011	2011-01-20 15:46:52.313797
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-20 15:46:52.326004	2011-01-20 15:46:52.338847
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-20 15:46:52.351056	2011-01-20 15:46:52.363742
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-20 15:46:52.376583	2011-01-20 15:46:52.390162
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-20 15:46:52.404382	2011-01-20 15:46:52.417488
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-20 15:46:52.434053	2011-01-20 15:46:52.447493
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-20 15:46:52.460162	2011-01-20 15:46:52.473413
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-20 15:46:52.486412	2011-01-20 15:46:52.499417
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-20 15:46:52.512516	2011-01-20 15:46:52.525561
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
1	1	dk	Labore corrupti assumenda eius quisquam commodi pariatur aut.Non rem fugit iusto tempora.	Assumenda dolorem et ab temporibus.Esse in saepe dolorem labore et magnam.	Big deal on printers	2011-01-20 15:46:53.027902	2011-01-20 15:46:53.027902
2	2	dk	Minima accusamus repudiandae molestias sapiente facere tempora.Hic quaerat dolor aut qui assumenda cum.	Et est velit possimus.Corporis voluptates natus magnam porro necessitatibus.	Drills required	2011-01-20 15:46:53.232396	2011-01-20 15:46:53.232396
3	3	dk	Error quia sed reprehenderit quam eum sed.Harum laudantium accusamus et saepe enim facere suscipit et.	Officiis laboriosam error quia est voluptas quia dolor molestiae.Corrupti perspiciatis excepturi labore est.	Need assistance in selling a car	2011-01-20 15:46:53.303836	2011-01-20 15:46:53.303836
4	4	dk	Animi consectetur dolor asperiores nemo.Qui nihil reiciendis repudiandae sed.	Est numquam repudiandae autem.Dignissimos ipsam repudiandae maxime quos excepturi beatae.	Ipod shipment	2011-01-20 15:46:53.373833	2011-01-20 15:46:53.373833
5	5	dk	Laudantium in libero non ipsum expedita praesentium.Consequuntur distinctio quo voluptas aut nam ut qui sequi.	Numquam et non suscipit natus saepe possimus.Suscipit asperiores reiciendis aut fuga quas et quod.	Trip to amazonia - looking for offer	2011-01-20 15:46:53.442123	2011-01-20 15:46:53.442123
6	6	dk	Voluptas molestiae vitae saepe molestias aut.Et et libero vitae reprehenderit rem tempore beatae sapiente.	Minima est aut officia hic at modi commodi recusandae.Consequatur aliquid nisi voluptate quas exercitationem dolores qui.	LCD - Huge amounts	2011-01-20 15:46:53.509582	2011-01-20 15:46:53.509582
7	7	dk	Voluptatibus deleniti inventore totam aspernatur id cum.Ipsum possimus enim ut.	Ad dolorum quam quaerat dolor enim labore.Ut dolore commodi amet.	GPS receivers required	2011-01-20 15:46:53.714958	2011-01-20 15:46:53.714958
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, rating_avg) FROM stdin;
1	Big deal on printers	3	Assumenda dolorem et ab temporibus.Esse in saepe dolorem labore et magnam.	Labore corrupti assumenda eius quisquam commodi pariatur aut.Non rem fugit iusto tempora.	2	User::Agent	0	989.0	365.0	1	Morar	Ettie Blanda	1-071-479-1816	ashtyn_larkin@dubuque.biz	2011-01-20 15:46:52.987529	2011-01-20 15:46:52.987529	2011-01-25	Jaden129553841292304 Hegmann	1	t	\N	0	0	f	f	-1	1	2011-01-20 15:46:52.99703	\N	\N	573 Schinner Islands	\N	\N	Berthastad	89102	Cambridgeshire	0
2	Drills required	3	Et est velit possimus.Corporis voluptates natus magnam porro necessitatibus.	Minima accusamus repudiandae molestias sapiente facere tempora.Hic quaerat dolor aut qui assumenda cum.	2	User::Agent	0	888.0	659.0	1	Hegmann	Alfonzo Rogahn	759-231-8989 x4733	lavada@kemmer.us	2011-01-20 15:46:53.067034	2011-01-20 15:46:53.067034	2011-01-25	Jaden129553841292304 Hegmann	1	t	\N	0	0	f	f	-1	1	2011-01-20 15:46:53.205922	\N	\N	307 Barry Well	\N	\N	Hesterport	91438	Berkshire	0
3	Need assistance in selling a car	3	Officiis laboriosam error quia est voluptas quia dolor molestiae.Corrupti perspiciatis excepturi labore est.	Error quia sed reprehenderit quam eum sed.Harum laudantium accusamus et saepe enim facere suscipit et.	2	User::Agent	0	635.0	412.0	1	Wolf	Moses Becker	1-862-048-7522	theo@von.us	2011-01-20 15:46:53.269431	2011-01-20 15:46:53.269431	2011-01-25	Jaden129553841292304 Hegmann	1	t	\N	0	0	f	f	-1	1	2011-01-20 15:46:53.276138	\N	\N	749 Reina Tunnel	\N	\N	Gulgowskiland	22659-9957	County Armagh	0
4	Ipod shipment	3	Est numquam repudiandae autem.Dignissimos ipsam repudiandae maxime quos excepturi beatae.	Animi consectetur dolor asperiores nemo.Qui nihil reiciendis repudiandae sed.	2	User::Agent	0	654.0	546.0	1	Mcglynn	Johnny Wilkinson	1-211-704-6151	bernie@king.biz	2011-01-20 15:46:53.34134	2011-01-20 15:46:53.34134	2011-01-25	Jaden129553841292304 Hegmann	1	t	\N	0	0	f	f	-1	1	2011-01-20 15:46:53.348225	\N	\N	1157 Abigayle Mountains	\N	\N	Michaelastad	70703	Mid Glamorgan	0
5	Trip to amazonia - looking for offer	3	Numquam et non suscipit natus saepe possimus.Suscipit asperiores reiciendis aut fuga quas et quod.	Laudantium in libero non ipsum expedita praesentium.Consequuntur distinctio quo voluptas aut nam ut qui sequi.	2	User::Agent	0	354.0	895.0	1	Gislasonkilback	Vergie Block	1-308-344-3280 x6021	nicklaus@ortiz.com	2011-01-20 15:46:53.409598	2011-01-20 15:46:53.409598	2011-01-25	Jaden129553841292304 Hegmann	1	t	\N	0	0	f	f	-1	1	2011-01-20 15:46:53.416257	\N	\N	33044 Reichert Flat	\N	\N	Lake Bellland	13658	Suffolk	0
6	LCD - Huge amounts	3	Minima est aut officia hic at modi commodi recusandae.Consequatur aliquid nisi voluptate quas exercitationem dolores qui.	Voluptas molestiae vitae saepe molestias aut.Et et libero vitae reprehenderit rem tempore beatae sapiente.	2	User::Agent	0	395.0	518.0	1	Krajcikrutherford	Elisabeth Crooks	912-869-2493	ruth.howe@hettinger.co.uk	2011-01-20 15:46:53.476846	2011-01-20 15:46:53.476846	2011-01-25	Jaden129553841292304 Hegmann	1	t	\N	0	0	f	f	-1	1	2011-01-20 15:46:53.483598	\N	\N	85207 Oliver Fall	\N	\N	Port Kristofer	36028	Durham	0
7	GPS receivers required	3	Ad dolorum quam quaerat dolor enim labore.Ut dolore commodi amet.	Voluptatibus deleniti inventore totam aspernatur id cum.Ipsum possimus enim ut.	2	User::Agent	0	401.0	355.0	1	Weimannhomenick	Abigale Gerhold	154.377.0801	itzel@terrydamore.ca	2011-01-20 15:46:53.682001	2011-01-20 15:46:53.682001	2011-01-25	Jaden129553841292304 Hegmann	1	t	\N	0	0	f	f	-1	1	2011-01-20 15:46:53.688956	\N	\N	5008 Ruecker Square	\N	\N	Josianestad	58171	Cleveland	0
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
1	default_payout_delay	--- 0\n	2011-01-20 15:46:52.233325	2011-01-20 15:46:52.233325
2	default_leads_per_page	--- 5\n	2011-01-20 15:46:52.239219	2011-01-20 15:46:52.239219
3	certification_level_1	--- 10\n	2011-01-20 15:46:52.243173	2011-01-20 15:46:52.243173
4	certification_level_2	--- 20\n	2011-01-20 15:46:52.246561	2011-01-20 15:46:52.246561
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-20 15:46:52.248758	2011-01-20 15:46:52.248758
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-20 15:46:52.250831	2011-01-20 15:46:52.250831
7	invoicing_seller_name	--- Fairleads\n	2011-01-20 15:46:52.252896	2011-01-20 15:46:52.252896
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-20 15:46:52.255451	2011-01-20 15:46:52.255451
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-20 15:46:52.257655	2011-01-20 15:46:52.257655
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-20 15:46:52.259763	2011-01-20 15:46:52.259763
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-20 15:46:52.261908	2011-01-20 15:46:52.261908
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
1	blazejek@gmail.com	699964817bf48dae53bd516cad50f0d44441c95d9e614d3b5f511f133d43b520351c0cb07dd81011842666f6a0671030d5afde606a3405137f1fd352c45be8e4	Tm20YRfO8mjNNeSq_P9a	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 15:46:52.761488	2011-01-20 15:46:52.570116	\N	2011-01-20 15:46:52.570348	2011-01-20 15:46:52.761763	1	Royal	Robel	1-962-618-8914	root	Steve Summit	Nadiaborough	56327	County Londonderry	1	\N	\N	\N	\N	0	\N	\N	\N	\N	J5Nn1xtADk6zMAJMEIKC04Na67t70MUlHUliJGnSCBu47za9qY3ra54IkPydUw	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	eeb5a4ec2c476ae3b225470e4b73adf5dfdd29a6b40ac60f39ed553d440abd4d7a431ed3d66b00ba1adfd71daa6fa7944a452018bf1c0195f9850c2e5a81b590	2UMIU6IoJP6fPUzC6VSM	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 15:46:52.952796	2011-01-20 15:46:52.931048	\N	2011-01-20 15:46:52.931268	2011-01-20 15:46:52.953074	2	Jaden129553841292304	Hegmann	818.860.7785 x89565	Keeley Fisher129553841292274	Donna Motorway	Rhiannastad	05885-8467	Gwent	3	\N	0	\N	\N	0	\N	\N	\N	\N	HkWgvxKrXej9JblBXshivSlBf8YDPoQEVhkCQNUoegMdkjvht5B5UZlox1eGBw	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	e56f13269a98d8e376387ae1f7016842000159312691c51d25dca9d6d9747de06edbfdfa4534921903cea81c212ecafb94ebd8620f7cc03e46b185cc1fee53cd	PI7HlGXpcl1XIK1uIpBv	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 15:46:53.790952	2011-01-20 15:46:53.770966	\N	2011-01-20 15:46:53.771192	2011-01-20 15:46:53.791269	1	Maudie	Dach	1-047-815-8626	Alex Farrell PhD129553841376609	Jacky Course	Gerholdborough	29263	Dyfed	1	\N	\N	\N	\N	0	\N	\N	\N	\N	88lXek7XvM82pfYTkj66efcMb1ZFOunrzDGigaBiQU4hTKm0tZEcmh8u4ZDkqZ	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	b0a5f06dded0c79120b90919326356963e08636c048ab16ededd235b86c349c8f9607d968f60a1d026055312d6701652afde66e161e31b115e310adcf6cbdbcb	kKB1FARwquOcSkqH6a_X	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 15:46:53.848651	2011-01-20 15:46:53.826454	\N	2011-01-20 15:46:53.826775	2011-01-20 15:46:53.849089	48	Miguel	Greenholt	(001)531-8725	Wilburn McGlynn12955384138212	Obie Run	Jenkinsview	01616	Surrey	1	\N	\N	\N	\N	0	\N	\N	\N	\N	xZrC07r2zbLERrERznMHvhmrzOoX3TTD3uVDI0VSB1gWytQF3zmXOK9vILEQSh	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	a865cc2f3665ae7e9745606f486a553ca303341989ca3d48dfaf5ca4328998b7a2b05fc4e6942ee5972ed357f761315bc4ae732aa73b5501c17d9421f8162f25	JAyiNA2aqT1TxfO1M6po	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 15:46:53.903748	2011-01-20 15:46:53.882198	\N	2011-01-20 15:46:53.882429	2011-01-20 15:46:53.918536	64	Winifred	Boyer	(961)367-5040 x5300	Godfrey Cole129553841387745	Boyer Junction	Gorczanyberg	76114	South Glamorgan	1	\N	\N	4	\N	0	\N	\N	\N	\N	TXt5WrhH6FKKbmX10xo74uKAhNcZHj7bIkPSzfUjOX8IhHF4kjtMGLOehcy6v8	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

