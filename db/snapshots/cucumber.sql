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
1	1	dk	About us	About us	2010-12-23 13:40:22.89618	2010-12-23 13:40:22.89618
2	1	en	About us	About us	2010-12-23 13:40:22.909894	2010-12-23 13:40:22.909894
3	2	dk	Privacy	Privacy	2010-12-23 13:40:22.939721	2010-12-23 13:40:22.939721
4	2	en	Privacy	Privacy	2010-12-23 13:40:22.950733	2010-12-23 13:40:22.950733
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-23 13:40:23.10898	2010-12-23 13:40:23.10898
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-23 13:40:23.119914	2010-12-23 13:40:23.119914
7	4	dk	Blurb sign up	Blurb sign up	2010-12-23 13:40:23.14818	2010-12-23 13:40:23.14818
8	4	en	Blurb sign up	Blurb sign up	2010-12-23 13:40:23.159591	2010-12-23 13:40:23.159591
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-23 13:40:23.187317	2010-12-23 13:40:23.187317
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-23 13:40:23.198352	2010-12-23 13:40:23.198352
11	6	dk	Blurb agent home	Blurb agent home	2010-12-23 13:40:23.225644	2010-12-23 13:40:23.225644
12	6	en	Blurb agent home	Blurb agent home	2010-12-23 13:40:23.236814	2010-12-23 13:40:23.236814
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-23 13:40:23.263929	2010-12-23 13:40:23.263929
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-23 13:40:23.274755	2010-12-23 13:40:23.274755
15	8	dk	Blurb currencies	Blurb currencies	2010-12-23 13:40:23.302744	2010-12-23 13:40:23.302744
16	8	en	Blurb currencies	Blurb currencies	2010-12-23 13:40:23.314116	2010-12-23 13:40:23.314116
17	9	dk	Reset password	Reset password	2010-12-23 13:40:23.342789	2010-12-23 13:40:23.342789
18	9	en	Reset password	Reset password	2010-12-23 13:40:23.354241	2010-12-23 13:40:23.354241
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-23 13:40:22.887725	2010-12-23 13:40:22.912681	about_us	0	t	2010-12-23 13:40:22.912603
2	Article::Cms	2010-12-23 13:40:22.935736	2010-12-23 13:40:22.953402	privacy	0	t	2010-12-23 13:40:22.953326
3	Article::Cms	2010-12-23 13:40:23.105043	2010-12-23 13:40:23.122792	terms_conditions	0	t	2010-12-23 13:40:23.122711
4	Article::Cms	2010-12-23 13:40:23.144142	2010-12-23 13:40:23.162565	blurb_sign_up	1	t	2010-12-23 13:40:23.162474
5	Article::Cms	2010-12-23 13:40:23.183342	2010-12-23 13:40:23.201035	blurb_buyer_home	1	t	2010-12-23 13:40:23.200959
6	Article::Cms	2010-12-23 13:40:23.221688	2010-12-23 13:40:23.239503	blurb_agent_home	1	t	2010-12-23 13:40:23.239427
7	Article::Cms	2010-12-23 13:40:23.259886	2010-12-23 13:40:23.277462	blurb_start_page_role_selection	1	t	2010-12-23 13:40:23.277388
8	Article::Cms	2010-12-23 13:40:23.298396	2010-12-23 13:40:23.316899	blurb_currencies	1	t	2010-12-23 13:40:23.316818
9	Article::Cms	2010-12-23 13:40:23.338554	2010-12-23 13:40:23.357033	reset_password	2	t	2010-12-23 13:40:23.356954
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
1	Electronics	Cupiditate fugiat qui maxime praesentium dolor rerum voluptas et.Expedita doloremque aut fugit ipsum aut rerum eos.	2010-12-23 13:40:21.522159	2010-12-23 13:40:21.522159	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Sed eum autem sit et fugiat.Aut beatae aut ut laboriosam dolorem natus sapiente.	2010-12-23 13:40:21.566576	2010-12-23 13:40:21.566576	\N	3	4	\N	0	2-leisure	f	0
3	Business	Voluptatum inventore quisquam placeat.Mollitia tenetur voluptatem voluptatum.	2010-12-23 13:40:21.599573	2010-12-23 13:40:22.449316	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Cupiditate fugiat qui maxime praesentium dolor rerum voluptas et.Expedita doloremque aut fugit ipsum aut rerum eos.	Electronics	2010-12-23 13:40:21.53134	2010-12-23 13:40:21.53134
2	1	dk	\N	Electronics	2010-12-23 13:40:21.55711	2010-12-23 13:40:21.55711
3	2	en	Sed eum autem sit et fugiat.Aut beatae aut ut laboriosam dolorem natus sapiente.	Leisure	2010-12-23 13:40:21.570871	2010-12-23 13:40:21.570871
4	2	dk	\N	Leisure	2010-12-23 13:40:21.589993	2010-12-23 13:40:21.589993
5	3	en	Voluptatum inventore quisquam placeat.Mollitia tenetur voluptatem voluptatum.	Business	2010-12-23 13:40:21.604025	2010-12-23 13:40:21.604025
6	3	dk	\N	Business	2010-12-23 13:40:21.623071	2010-12-23 13:40:21.623071
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-23 13:40:21.052633	2010-12-23 13:40:21.052633
2	United Kingdom	2010-12-23 13:40:21.057659	2010-12-23 13:40:21.057659
3	Wales129311162177337	2010-12-23 13:40:21.774688	2010-12-23 13:40:21.774688
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
1	Euro	&euro;	%u%n	t	2010-12-23 13:40:21.500719	2010-12-23 13:40:21.500719
2	PLN	&pln;	%u%n	t	2010-12-23 13:40:21.505008	2010-12-23 13:40:21.505008
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-23 13:40:21.083861	2010-12-23 13:40:21.083861
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-23 13:40:21.099057	2010-12-23 13:40:21.099057
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-23 13:40:21.111693	2010-12-23 13:40:21.111693
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-23 13:40:21.124599	2010-12-23 13:40:21.124599
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-23 13:40:21.137632	2010-12-23 13:40:21.137632
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-23 13:40:21.275206	2010-12-23 13:40:21.275206
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-23 13:40:21.287464	2010-12-23 13:40:21.287464
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-23 13:40:21.299467	2010-12-23 13:40:21.299467
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-23 13:40:21.311812	2010-12-23 13:40:21.311812
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-23 13:40:21.324174	2010-12-23 13:40:21.324174
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-23 13:40:21.33647	2010-12-23 13:40:21.33647
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-23 13:40:21.348508	2010-12-23 13:40:21.348508
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-23 13:40:21.361751	2010-12-23 13:40:21.361751
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-23 13:40:21.373643	2010-12-23 13:40:21.373643
15	8	en	Question	<p></p>	2010-12-23 13:40:21.38637	2010-12-23 13:40:21.38637
16	8	dk	[DK] Question	<p></p>	2010-12-23 13:40:21.398459	2010-12-23 13:40:21.398459
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-23 13:40:21.074716	2010-12-23 13:40:21.094565
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-23 13:40:21.107293	2010-12-23 13:40:21.120189
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-23 13:40:21.13286	2010-12-23 13:40:21.270815
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-23 13:40:21.283106	2010-12-23 13:40:21.295323
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-23 13:40:21.307448	2010-12-23 13:40:21.319628
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-23 13:40:21.332051	2010-12-23 13:40:21.344285
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-23 13:40:21.356573	2010-12-23 13:40:21.369615
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-23 13:40:21.381903	2010-12-23 13:40:21.394186
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
1	1	dk	Beatae repudiandae a doloribus commodi rerum.Nihil perferendis et id placeat ut enim sit.	Rerum voluptatem blanditiis officiis eius hic rem.Vero ut aut id quia.	Big deal on printers	2010-12-23 13:40:21.87917	2010-12-23 13:40:21.87917
2	2	dk	Pariatur dicta non earum et.Voluptate nulla ex numquam sunt ipsum non neque odio.	Ex voluptatem tenetur molestiae neque earum consequuntur quae saepe.Aliquam voluptatem fugit eum.	Drills required	2010-12-23 13:40:21.948683	2010-12-23 13:40:21.948683
3	3	dk	Similique laudantium minima consequuntur porro.Quia et totam commodi pariatur.	Velit ut ducimus magnam quis dolor.Et laboriosam dolorum possimus id facilis provident iste necessitatibus.	Need assistance in selling a car	2010-12-23 13:40:22.013865	2010-12-23 13:40:22.013865
4	4	dk	Saepe laudantium facere odit.Sed itaque beatae tempora.	Minima quos modi exercitationem itaque.Illum facere omnis fugit iure sed aut molestias.	Ipod shipment	2010-12-23 13:40:22.079405	2010-12-23 13:40:22.079405
5	5	dk	Soluta non adipisci quis.Blanditiis unde debitis voluptas quo laborum quod occaecati ratione.	In praesentium rerum quis consequatur minima ea omnis aspernatur.Perspiciatis sint illo et et eligendi et.	Trip to amazonia - looking for offer	2010-12-23 13:40:22.320533	2010-12-23 13:40:22.320533
6	6	dk	Distinctio magnam qui accusamus vel rerum autem.Sequi in qui consequatur deleniti officia quis quos.	Animi dolorum qui sed repellendus.Quas eos sit nihil enim sit amet neque.	LCD - Huge amounts	2010-12-23 13:40:22.390184	2010-12-23 13:40:22.390184
7	7	dk	Nesciunt quia rerum dolor.Dignissimos qui quidem expedita quod eos alias.	Quae accusantium voluptatem eligendi optio amet adipisci nesciunt voluptatem.Et nihil illo velit excepturi illum ullam.	GPS receivers required	2010-12-23 13:40:22.455911	2010-12-23 13:40:22.455911
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at) FROM stdin;
1	Big deal on printers	3	Rerum voluptatem blanditiis officiis eius hic rem.Vero ut aut id quia.	Beatae repudiandae a doloribus commodi rerum.Nihil perferendis et id placeat ut enim sit.	2	User::Agent	0	781.0	541.0	1	Graham	Ransom Jaskolski	873.192.8496 x8738	boris.torp@mante.us	90627 Zulauf Run	2010-12-23 13:40:21.83834	2010-12-23 13:40:21.83834	2010-12-28	Antonietta129311162177253 Ferry	1	t	\N	0	0	f	f	-1	1	2010-12-23 13:40:21.847401
2	Drills required	3	Ex voluptatem tenetur molestiae neque earum consequuntur quae saepe.Aliquam voluptatem fugit eum.	Pariatur dicta non earum et.Voluptate nulla ex numquam sunt ipsum non neque odio.	2	User::Agent	0	898.0	31.0	1	Stoltenberg	Raina Swaniawski	130-625-5062 x670	godfrey@vonruedenpurdy.info	6921 Morar Loaf	2010-12-23 13:40:21.916747	2010-12-23 13:40:21.916747	2010-12-28	Antonietta129311162177253 Ferry	1	t	\N	0	0	f	f	-1	1	2010-12-23 13:40:21.923075
3	Need assistance in selling a car	3	Velit ut ducimus magnam quis dolor.Et laboriosam dolorum possimus id facilis provident iste necessitatibus.	Similique laudantium minima consequuntur porro.Quia et totam commodi pariatur.	2	User::Agent	0	256.0	471.0	1	Goyette	Miss Ambrose Mante	(380)574-6238	oscar_franecki@zboncak.com	258 Carter Prairie	2010-12-23 13:40:21.982887	2010-12-23 13:40:21.982887	2010-12-28	Antonietta129311162177253 Ferry	1	t	\N	0	0	f	f	-1	1	2010-12-23 13:40:21.989203
4	Ipod shipment	3	Minima quos modi exercitationem itaque.Illum facere omnis fugit iure sed aut molestias.	Saepe laudantium facere odit.Sed itaque beatae tempora.	2	User::Agent	0	51.0	571.0	1	Howellkuphal	Brant Cole	1-543-826-8151 x688	casimer.parisian@konopelski.uk	82040 Mante Green	2010-12-23 13:40:22.048456	2010-12-23 13:40:22.048456	2010-12-28	Antonietta129311162177253 Ferry	1	t	\N	0	0	f	f	-1	1	2010-12-23 13:40:22.054655
5	Trip to amazonia - looking for offer	3	In praesentium rerum quis consequatur minima ea omnis aspernatur.Perspiciatis sint illo et et eligendi et.	Soluta non adipisci quis.Blanditiis unde debitis voluptas quo laborum quod occaecati ratione.	2	User::Agent	0	256.0	681.0	1	Christiansen	Van Cole	(905)403-1184	monte.christiansen@stehr.com	800 Goldner Bypass	2010-12-23 13:40:22.288503	2010-12-23 13:40:22.288503	2010-12-28	Antonietta129311162177253 Ferry	1	t	\N	0	0	f	f	-1	1	2010-12-23 13:40:22.294853
6	LCD - Huge amounts	3	Animi dolorum qui sed repellendus.Quas eos sit nihil enim sit amet neque.	Distinctio magnam qui accusamus vel rerum autem.Sequi in qui consequatur deleniti officia quis quos.	2	User::Agent	0	392.0	556.0	1	Corwin	Manuela Cummings IV	(139)666-1436 x759	leola@boyle.name	2837 Leannon Tunnel	2010-12-23 13:40:22.355392	2010-12-23 13:40:22.355392	2010-12-28	Antonietta129311162177253 Ferry	1	t	\N	0	0	f	f	-1	1	2010-12-23 13:40:22.363435
7	GPS receivers required	3	Quae accusantium voluptatem eligendi optio amet adipisci nesciunt voluptatem.Et nihil illo velit excepturi illum ullam.	Nesciunt quia rerum dolor.Dignissimos qui quidem expedita quod eos alias.	2	User::Agent	0	620.0	707.0	1	Ortiz	Sunny Wisoky PhD	803-844-5634 x404	sherwood@hayesgorczany.uk	76133 Vivien Trace	2010-12-23 13:40:22.424586	2010-12-23 13:40:22.424586	2010-12-28	Antonietta129311162177253 Ferry	1	t	\N	0	0	f	f	-1	1	2010-12-23 13:40:22.430883
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
1	default_payout_delay	--- 0\n	2010-12-23 13:40:21.020968	2010-12-23 13:40:21.020968
2	default_leads_per_page	--- 5\n	2010-12-23 13:40:21.026674	2010-12-23 13:40:21.026674
3	certification_level_1	--- 10\n	2010-12-23 13:40:21.028832	2010-12-23 13:40:21.028832
4	certification_level_2	--- 20\n	2010-12-23 13:40:21.03089	2010-12-23 13:40:21.03089
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-23 13:40:21.03298	2010-12-23 13:40:21.03298
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-23 13:40:21.035598	2010-12-23 13:40:21.035598
7	invoicing_seller_name	--- Fairleads\n	2010-12-23 13:40:21.037682	2010-12-23 13:40:21.037682
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-23 13:40:21.039737	2010-12-23 13:40:21.039737
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-23 13:40:21.04179	2010-12-23 13:40:21.04179
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-23 13:40:21.044333	2010-12-23 13:40:21.044333
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
1	blazejek@gmail.com	6315e0dacae94a6b4b37942b5c62f5fed042e8e6ba37d2c0a5616780f53d097887a7e257769e8fed66093bf0bdd27ccb16286c1043cce73c75b8f9fa7d88b32e	sSwHM2PfnKaonn0TUQoT	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 13:40:21.490725	2010-12-23 13:40:21.431175	\N	2010-12-23 13:40:21.431396	2010-12-23 13:40:21.491011	1	Elyssa	Wintheiser	817.411.4288 x134	root	Boris Centers	New Alyshaville	89899-6888	Tyne and Wear	1	\N	\N	\N	\N	0	\N	\N	\N	\N	UmryvGlSS2FEgpAG7x24S89Y97yAZkWfAzOWJhKhiQ2ZdBaAjvLu3QBDYYfSed	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	ad4b7f27337d3a0334173946d6f7cb382803da336082e0ec3d08ec044f5594fbd3c3e430f757a1833761490b6db9f83a3d8d7bd96f4e457d19d4bdde8aeca18d	lZxRL5oo4fOKVYILxjT3	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 13:40:21.802468	2010-12-23 13:40:21.78016	\N	2010-12-23 13:40:21.780367	2010-12-23 13:40:21.802736	2	Antonietta129311162177253	Ferry	709.321.5324	Clara Fisher V129311162177217	Randal Ports	East Aricshire	07015	Powys	3	\N	0	\N	\N	0	\N	\N	\N	\N	cB1NZyugjBwPsHbcXVuf9tB7Ik5Ig3MS5iYHmo7WDkvQT6rENS5EOMK7kInvGa	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	e534abbb41eb968f4d3d7b9dcc37b0837f934ab0288ef82022cfcf2196a63d44abd553c49ec235df30752a3dd364fa31917344524102c602f55568aa9b1aee24	3M5MYXwmer0Vp0bDI0nD	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 13:40:22.52986	2010-12-23 13:40:22.50953	\N	2010-12-23 13:40:22.509748	2010-12-23 13:40:22.530122	1	Elwin	Olson	1-804-270-0022 x20009	Shanny Wintheiser129311162250523	Jessika Inlet	North Miles	02869	County Londonderry	1	\N	\N	\N	\N	0	\N	\N	\N	\N	v0rVvmy6wWseH2eqzGw7F2Y1qT94oYgzg2hsXrrab9otEiO7oMvXh6MDgXB9ch	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	344c6115f4520fc2109753623fbbafe8cc2e5c2c83f4e6735721264497ca5ccff3a540fcc15d5d37ffc419b23758257b299924e6466f89d14f95a18a8867d6d8	ltGbOiYzS2gl9tddA8Cm	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 13:40:22.581986	2010-12-23 13:40:22.560384	\N	2010-12-23 13:40:22.560607	2010-12-23 13:40:22.58226	48	Edgardo	Simonis	733-837-1797 x383	Brionna White129311162255553	Beaulah Key	East Shayna	28806	Rutland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Ta4d3833WQLdku49j2xRqCTah0CAhc6eUArRTJGR1I0Jl0MvgvA4ifx3EjGYo8	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	2abc75732f80f01771070b5f03e4d4d736f15c0849b8854ee14907363fd0ad620e35e9a2eaa9df1e89d586fb5ac0764f3ce2248df3edc1b9c85891228a416bd3	9iK5o61oierS6DZq598a	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 13:40:22.765067	2010-12-23 13:40:22.611178	\N	2010-12-23 13:40:22.611409	2010-12-23 13:40:22.778961	64	Lottie	Ondricka	1-301-788-4256 x55447	Jesse Hartmann129311162260674	Labadie Ridge	New Clemens	24629-6368	Rutland	1	\N	\N	4	\N	0	\N	\N	\N	\N	c9qq14sraxa2dxxP2G2MiPa691csIec8m5Kon9X8fKbW0LGdNuAuWdXSQzop9p	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

