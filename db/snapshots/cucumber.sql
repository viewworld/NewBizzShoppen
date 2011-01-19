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
1	1	dk	About us	About us	2011-01-19 11:09:39.807198	2011-01-19 11:09:39.807198
2	1	en	About us	About us	2011-01-19 11:09:39.821454	2011-01-19 11:09:39.821454
3	2	dk	Privacy	Privacy	2011-01-19 11:09:39.85158	2011-01-19 11:09:39.85158
4	2	en	Privacy	Privacy	2011-01-19 11:09:39.862608	2011-01-19 11:09:39.862608
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-19 11:09:39.897312	2011-01-19 11:09:39.897312
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-19 11:09:39.908242	2011-01-19 11:09:39.908242
7	4	dk	Blurb sign up	Blurb sign up	2011-01-19 11:09:39.936062	2011-01-19 11:09:39.936062
8	4	en	Blurb sign up	Blurb sign up	2011-01-19 11:09:39.946711	2011-01-19 11:09:39.946711
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-19 11:09:39.972973	2011-01-19 11:09:39.972973
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-19 11:09:39.983589	2011-01-19 11:09:39.983589
11	6	dk	Blurb agent home	Blurb agent home	2011-01-19 11:09:40.141729	2011-01-19 11:09:40.141729
12	6	en	Blurb agent home	Blurb agent home	2011-01-19 11:09:40.15627	2011-01-19 11:09:40.15627
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-19 11:09:40.184797	2011-01-19 11:09:40.184797
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-19 11:09:40.196718	2011-01-19 11:09:40.196718
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-19 11:09:40.225406	2011-01-19 11:09:40.225406
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-19 11:09:40.236534	2011-01-19 11:09:40.236534
17	9	dk	Blurb currencies	Blurb currencies	2011-01-19 11:09:40.26443	2011-01-19 11:09:40.26443
18	9	en	Blurb currencies	Blurb currencies	2011-01-19 11:09:40.275463	2011-01-19 11:09:40.275463
19	10	dk	Reset password	Reset password	2011-01-19 11:09:40.302465	2011-01-19 11:09:40.302465
20	10	en	Reset password	Reset password	2011-01-19 11:09:40.313329	2011-01-19 11:09:40.313329
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-19 11:09:39.798764	2011-01-19 11:09:39.824168	about_us	0	t	2011-01-19 11:09:39.824087
2	Article::Cms	2011-01-19 11:09:39.847532	2011-01-19 11:09:39.865324	privacy	0	t	2011-01-19 11:09:39.865247
3	Article::Cms	2011-01-19 11:09:39.893354	2011-01-19 11:09:39.91097	terms_conditions	0	t	2011-01-19 11:09:39.910893
4	Article::Cms	2011-01-19 11:09:39.932137	2011-01-19 11:09:39.949351	blurb_sign_up	1	t	2011-01-19 11:09:39.949273
5	Article::Cms	2011-01-19 11:09:39.969066	2011-01-19 11:09:39.986238	blurb_buyer_home	1	t	2011-01-19 11:09:39.986167
6	Article::Cms	2011-01-19 11:09:40.007651	2011-01-19 11:09:40.159369	blurb_agent_home	1	t	2011-01-19 11:09:40.15929
7	Article::Cms	2011-01-19 11:09:40.180596	2011-01-19 11:09:40.199593	blurb_purchase_manager_home	1	t	2011-01-19 11:09:40.199518
8	Article::Cms	2011-01-19 11:09:40.221406	2011-01-19 11:09:40.239574	blurb_start_page_role_selection	1	t	2011-01-19 11:09:40.239493
9	Article::Cms	2011-01-19 11:09:40.260476	2011-01-19 11:09:40.278288	blurb_currencies	1	t	2011-01-19 11:09:40.278205
10	Article::Cms	2011-01-19 11:09:40.298477	2011-01-19 11:09:40.315963	reset_password	2	t	2011-01-19 11:09:40.315891
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
1	Electronics	Ex eos voluptatem iusto molestiae odit quos eum.Eum veritatis animi molestias.	2011-01-19 11:09:38.464015	2011-01-19 11:09:38.464015	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Minima impedit consequatur dolores et non est.Fuga atque exercitationem aliquam accusamus harum autem.	2011-01-19 11:09:38.506338	2011-01-19 11:09:38.506338	\N	3	4	\N	0	2-leisure	f	0
3	Business	Natus iste aut dolorum.Nemo quia in eum occaecati ex est voluptatem.	2011-01-19 11:09:38.539148	2011-01-19 11:09:39.361732	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Ex eos voluptatem iusto molestiae odit quos eum.Eum veritatis animi molestias.	Electronics	2011-01-19 11:09:38.472891	2011-01-19 11:09:38.472891
2	1	dk	\N	Electronics	2011-01-19 11:09:38.497089	2011-01-19 11:09:38.497089
3	2	en	Minima impedit consequatur dolores et non est.Fuga atque exercitationem aliquam accusamus harum autem.	Leisure	2011-01-19 11:09:38.510668	2011-01-19 11:09:38.510668
4	2	dk	\N	Leisure	2011-01-19 11:09:38.529931	2011-01-19 11:09:38.529931
5	3	en	Natus iste aut dolorum.Nemo quia in eum occaecati ex est voluptatem.	Business	2011-01-19 11:09:38.54349	2011-01-19 11:09:38.54349
6	3	dk	\N	Business	2011-01-19 11:09:38.561749	2011-01-19 11:09:38.561749
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-19 11:09:37.929468	2011-01-19 11:09:37.929468
2	United Kingdom	2011-01-19 11:09:37.93419	2011-01-19 11:09:37.93419
3	Northern Ireland129543537858892	2011-01-19 11:09:38.590263	2011-01-19 11:09:38.590263
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
1	Euro	&euro;	%u%n	t	2011-01-19 11:09:38.443013	2011-01-19 11:09:38.443013
2	PLN	&pln;	%u%n	t	2011-01-19 11:09:38.44711	2011-01-19 11:09:38.44711
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-19 11:09:37.960614	2011-01-19 11:09:37.960614
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-19 11:09:37.975656	2011-01-19 11:09:37.975656
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-19 11:09:37.987998	2011-01-19 11:09:37.987998
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-19 11:09:38	2011-01-19 11:09:38
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-19 11:09:38.013378	2011-01-19 11:09:38.013378
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-19 11:09:38.026386	2011-01-19 11:09:38.026386
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-19 11:09:38.039345	2011-01-19 11:09:38.039345
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-19 11:09:38.051948	2011-01-19 11:09:38.051948
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-19 11:09:38.064734	2011-01-19 11:09:38.064734
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-19 11:09:38.077244	2011-01-19 11:09:38.077244
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-19 11:09:38.090154	2011-01-19 11:09:38.090154
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-19 11:09:38.102664	2011-01-19 11:09:38.102664
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-19 11:09:38.115543	2011-01-19 11:09:38.115543
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-19 11:09:38.129009	2011-01-19 11:09:38.129009
15	8	en	Question	<p></p>	2011-01-19 11:09:38.142166	2011-01-19 11:09:38.142166
16	8	dk	[DK] Question	<p></p>	2011-01-19 11:09:38.154705	2011-01-19 11:09:38.154705
17	9	en	Invoice	<p></p>	2011-01-19 11:09:38.167563	2011-01-19 11:09:38.167563
18	9	dk	[DK] Invoice	<p></p>	2011-01-19 11:09:38.180259	2011-01-19 11:09:38.180259
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-19 11:09:37.951472	2011-01-19 11:09:37.971357
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-19 11:09:37.983599	2011-01-19 11:09:37.995819
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-19 11:09:38.008679	2011-01-19 11:09:38.022187
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-19 11:09:38.034598	2011-01-19 11:09:38.047583
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-19 11:09:38.060139	2011-01-19 11:09:38.072871
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-19 11:09:38.085428	2011-01-19 11:09:38.098283
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-19 11:09:38.110916	2011-01-19 11:09:38.124742
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-19 11:09:38.137356	2011-01-19 11:09:38.150444
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-19 11:09:38.16308	2011-01-19 11:09:38.175851
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
1	1	dk	Ea sed est omnis corporis est numquam.Aut provident illo velit.	Magnam necessitatibus adipisci explicabo nihil accusamus.Sint harum et ullam.	Big deal on printers	2011-01-19 11:09:38.697752	2011-01-19 11:09:38.697752
2	2	dk	Et quo excepturi qui nam totam.Animi mollitia soluta consequuntur rerum ex eos consequatur temporibus.	Praesentium quasi minima aliquam necessitatibus aut laudantium ab possimus.Quos est eos vel id nobis sunt.	Drills required	2011-01-19 11:09:38.895522	2011-01-19 11:09:38.895522
3	3	dk	Ipsum est tempora quis error mollitia.Dolor qui aut laudantium.	Ut officia similique nihil et.Autem ut ut consequuntur qui sit recusandae repellat placeat.	Need assistance in selling a car	2011-01-19 11:09:38.96569	2011-01-19 11:09:38.96569
4	4	dk	Qui qui harum totam temporibus beatae.Sit ea fugiat quia iusto nemo et nisi necessitatibus.	Sit quas beatae rerum in quisquam omnis.Deserunt eius est praesentium tenetur rerum est eos quia.	Ipod shipment	2011-01-19 11:09:39.034044	2011-01-19 11:09:39.034044
5	5	dk	Voluptatem eos aut error.Ipsum ut hic quidem fugiat dolor sit maiores.	Et enim blanditiis quia et rem.Adipisci reprehenderit sequi vitae quae.	Trip to amazonia - looking for offer	2011-01-19 11:09:39.100534	2011-01-19 11:09:39.100534
6	6	dk	Enim hic nulla qui quidem.Sint soluta similique est.	Ullam officiis quasi quod dicta consequatur.Ea quia id voluptatum reiciendis assumenda.	LCD - Huge amounts	2011-01-19 11:09:39.167809	2011-01-19 11:09:39.167809
7	7	dk	Velit quia ut sunt temporibus dolorem ut repellendus.Eius sit ut et officia aperiam.	Vero quas maiores reprehenderit dolorem amet.Ducimus officiis consectetur ipsum quae iure sed et non.	GPS receivers required	2011-01-19 11:09:39.368626	2011-01-19 11:09:39.368626
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Magnam necessitatibus adipisci explicabo nihil accusamus.Sint harum et ullam.	Ea sed est omnis corporis est numquam.Aut provident illo velit.	2	User::Agent	0	550.0	363.0	1	Franecki	Leonor Dach IV	137-094-8740 x40994	sydni@cristwillms.co.uk	2011-01-19 11:09:38.65368	2011-01-19 11:09:38.65368	2011-01-24	Freeman129543537858813 Purdy	1	t	\N	0	0	f	f	-1	1	2011-01-19 11:09:38.663182	\N	\N	505 Emanuel Meadows	\N	\N	Tillmanland	89037	County Armagh
2	Drills required	3	Praesentium quasi minima aliquam necessitatibus aut laudantium ab possimus.Quos est eos vel id nobis sunt.	Et quo excepturi qui nam totam.Animi mollitia soluta consequuntur rerum ex eos consequatur temporibus.	2	User::Agent	0	763.0	180.0	1	Rosenbaum	Mr. Hermina McCullough	816-178-2456	cristian_cummings@abshire.co.uk	2011-01-19 11:09:38.736949	2011-01-19 11:09:38.736949	2011-01-24	Freeman129543537858813 Purdy	1	t	\N	0	0	f	f	-1	1	2011-01-19 11:09:38.869142	\N	\N	21311 Mitchell Pine	\N	\N	Watsicahaven	02297	Isle of Wight
3	Need assistance in selling a car	3	Ut officia similique nihil et.Autem ut ut consequuntur qui sit recusandae repellat placeat.	Ipsum est tempora quis error mollitia.Dolor qui aut laudantium.	2	User::Agent	0	350.0	986.0	1	Collier	Brandy Nikolaus	(029)566-5199	joanny.mcglynn@wisozkkrajcik.ca	2011-01-19 11:09:38.932436	2011-01-19 11:09:38.932436	2011-01-24	Freeman129543537858813 Purdy	1	t	\N	0	0	f	f	-1	1	2011-01-19 11:09:38.939549	\N	\N	96998 Kenna Highway	\N	\N	Gunnerport	55089	Bedfordshire
4	Ipod shipment	3	Sit quas beatae rerum in quisquam omnis.Deserunt eius est praesentium tenetur rerum est eos quia.	Qui qui harum totam temporibus beatae.Sit ea fugiat quia iusto nemo et nisi necessitatibus.	2	User::Agent	0	709.0	667.0	1	Koepp	Adan Berge	(753)733-6158	dusty@beahan.com	2011-01-19 11:09:39.001655	2011-01-19 11:09:39.001655	2011-01-24	Freeman129543537858813 Purdy	1	t	\N	0	0	f	f	-1	1	2011-01-19 11:09:39.008553	\N	\N	4352 Ariane Land	\N	\N	East Brodyview	11356	Dorset
5	Trip to amazonia - looking for offer	3	Et enim blanditiis quia et rem.Adipisci reprehenderit sequi vitae quae.	Voluptatem eos aut error.Ipsum ut hic quidem fugiat dolor sit maiores.	2	User::Agent	0	986.0	49.0	1	Daugherty	Kimberly Prosacco	(222)051-6743 x14319	carter@kautzer.info	2011-01-19 11:09:39.06864	2011-01-19 11:09:39.06864	2011-01-24	Freeman129543537858813 Purdy	1	t	\N	0	0	f	f	-1	1	2011-01-19 11:09:39.075527	\N	\N	2947 Hassan Orchard	\N	\N	Watsicatown	38183-5365	County Fermanagh
6	LCD - Huge amounts	3	Ullam officiis quasi quod dicta consequatur.Ea quia id voluptatum reiciendis assumenda.	Enim hic nulla qui quidem.Sint soluta similique est.	2	User::Agent	0	41.0	680.0	1	Stoltenberg	Berniece Wisozk	1-723-862-4718 x6909	lonie_auer@stammrau.ca	2011-01-19 11:09:39.135676	2011-01-19 11:09:39.135676	2011-01-24	Freeman129543537858813 Purdy	1	t	\N	0	0	f	f	-1	1	2011-01-19 11:09:39.142532	\N	\N	2954 Ward Forest	\N	\N	Valentinamouth	00062	Tyne and Wear
7	GPS receivers required	3	Vero quas maiores reprehenderit dolorem amet.Ducimus officiis consectetur ipsum quae iure sed et non.	Velit quia ut sunt temporibus dolorem ut repellendus.Eius sit ut et officia aperiam.	2	User::Agent	0	598.0	22.0	1	Koss	Sid Bashirian	741-423-9642	trace@considinedaugherty.name	2011-01-19 11:09:39.335661	2011-01-19 11:09:39.335661	2011-01-24	Freeman129543537858813 Purdy	1	t	\N	0	0	f	f	-1	1	2011-01-19 11:09:39.342795	\N	\N	89748 Jaquan Expressway	\N	\N	West Freemanstad	87614-2023	Grampian
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
1	default_payout_delay	--- 0\n	2011-01-19 11:09:37.891387	2011-01-19 11:09:37.891387
2	default_leads_per_page	--- 5\n	2011-01-19 11:09:37.896952	2011-01-19 11:09:37.896952
3	certification_level_1	--- 10\n	2011-01-19 11:09:37.901107	2011-01-19 11:09:37.901107
4	certification_level_2	--- 20\n	2011-01-19 11:09:37.904284	2011-01-19 11:09:37.904284
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-19 11:09:37.906491	2011-01-19 11:09:37.906491
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-19 11:09:37.90864	2011-01-19 11:09:37.90864
7	invoicing_seller_name	--- Fairleads\n	2011-01-19 11:09:37.910813	2011-01-19 11:09:37.910813
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-19 11:09:37.912976	2011-01-19 11:09:37.912976
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-19 11:09:37.915577	2011-01-19 11:09:37.915577
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-19 11:09:37.917899	2011-01-19 11:09:37.917899
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-19 11:09:37.920904	2011-01-19 11:09:37.920904
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
1	blazejek@gmail.com	c00f9646daddba06509a954ddf2dcf6f95ab0cb8a4318cde0553d48ff689f7a9b123a17a0af89abe9e7edade97a6ae90028047310ccfc260dab51240828eca02	JIAF1QdebcUZwfgS_vjk	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 11:09:38.431556	2011-01-19 11:09:38.22061	\N	2011-01-19 11:09:38.220873	2011-01-19 11:09:38.43204	1	Priscilla	Wiza	287.577.9328 x31215	root	Johnson Pike	South Elsa	26237	Isle of Wight	1	\N	\N	\N	\N	0	\N	\N	\N	\N	AIENbQLvQ9HrzXhSovNAbRfTl4xTrjDtwbn86H7vYwb8LFtXyT3YG32xr709fg	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	52ba10a3a67700513ead0c72b797f7e63766e4978ae55cad13159f121db8c7091574e9b17072aa16720afcfeabcddba3a3180b5e9dad363d5109d15e8780b06a	UH0VPEFi9aveNe5esjV4	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 11:09:38.617383	2011-01-19 11:09:38.595667	\N	2011-01-19 11:09:38.595876	2011-01-19 11:09:38.617664	2	Freeman129543537858813	Purdy	(758)884-0753 x153	Frankie Casper129543537858783	Kory Valley	Windlerbury	63261	Gwent	3	\N	0	\N	\N	0	\N	\N	\N	\N	XXoVlQ5TkONYdJp4nbkfZ7Tw1A6C4AEN9w6zuozvvZjfEDX3IA62vZY0YFdbFR	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	6f12a48907aaccaae3875c807d3f33e1d43488ae29e3310ba554260c2ff912c04ab52ab96485dd4598e722c2bf7cb5fa40b87fcb415965227a6a42d2e00d955e	UTZX69DCxtEdyTV_PG3U	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 11:09:39.444192	2011-01-19 11:09:39.424318	\N	2011-01-19 11:09:39.424548	2011-01-19 11:09:39.444469	1	Josie	Stark	960.664.1138	Wyatt Dare129543537941969	Dorcas Fields	Trycialand	39681-3450	Wiltshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	yuyOEzVoxHgih4p74RlcBuik746Hzad6M2xV2u7cXADf0H8WeK9bvNoYRbtvJf	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	22c5bb77d1a9b7b95acd74d36e7df77a728fb9f71e33b91bc8905c94cc1c824b3ce59d1f76c5ed558f43f54a72a527db7ce4555047312b1c0d64684fc606467d	CfkqzI_lzqhe7nCzv7y8	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 11:09:39.499407	2011-01-19 11:09:39.477566	\N	2011-01-19 11:09:39.477788	2011-01-19 11:09:39.499694	48	Uriel	Flatley	1-638-706-4309 x70529	Delpha Lemke129543537947282	Lindgren Way	North Kaleyborough	39769	Rutland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	dey35GVCklrXsSoLZAlY0GpZvkOuUz9rIaFj9wsejXuxmq8FRhPagwv2DD1m1u	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	16537f0a5690f235c2827d86c807a1b4cc0b61d75049e5771602b5d0389024aa6557e62458c2d273d6a09872e1e173bd8d2fe4db2721e182fe715e1adf7825a9	gG01AjoKR3GGuzLsxuDB	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 11:09:39.554516	2011-01-19 11:09:39.53292	\N	2011-01-19 11:09:39.533147	2011-01-19 11:09:39.569215	64	Major	Zieme	1-293-528-8410	Savanah Murazik129543537952822	Spencer Manor	South Sam	60529	Dorset	1	\N	\N	4	\N	0	\N	\N	\N	\N	PcGIBwUC8X4Gq5IR199AJyuULuuBpVZUXISrpxAPogVolPAcIPgEGefif4N0xd	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

