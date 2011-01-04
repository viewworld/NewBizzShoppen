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
1	1	dk	About us	About us	2011-01-04 12:22:30.422238	2011-01-04 12:22:30.422238
2	1	en	About us	About us	2011-01-04 12:22:30.447791	2011-01-04 12:22:30.447791
3	2	dk	Privacy	Privacy	2011-01-04 12:22:30.511363	2011-01-04 12:22:30.511363
4	2	en	Privacy	Privacy	2011-01-04 12:22:30.52959	2011-01-04 12:22:30.52959
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-04 12:22:30.576303	2011-01-04 12:22:30.576303
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-04 12:22:30.815347	2011-01-04 12:22:30.815347
7	4	dk	Blurb sign up	Blurb sign up	2011-01-04 12:22:30.873652	2011-01-04 12:22:30.873652
8	4	en	Blurb sign up	Blurb sign up	2011-01-04 12:22:30.890378	2011-01-04 12:22:30.890378
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-04 12:22:30.933493	2011-01-04 12:22:30.933493
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-04 12:22:30.949549	2011-01-04 12:22:30.949549
11	6	dk	Blurb agent home	Blurb agent home	2011-01-04 12:22:30.99533	2011-01-04 12:22:30.99533
12	6	en	Blurb agent home	Blurb agent home	2011-01-04 12:22:31.011243	2011-01-04 12:22:31.011243
13	7	dk	Blurb start page role selection	Blurb start page role selection	2011-01-04 12:22:31.064449	2011-01-04 12:22:31.064449
14	7	en	Blurb start page role selection	Blurb start page role selection	2011-01-04 12:22:31.096103	2011-01-04 12:22:31.096103
15	8	dk	Blurb currencies	Blurb currencies	2011-01-04 12:22:31.146514	2011-01-04 12:22:31.146514
16	8	en	Blurb currencies	Blurb currencies	2011-01-04 12:22:31.165579	2011-01-04 12:22:31.165579
17	9	dk	Reset password	Reset password	2011-01-04 12:22:31.230255	2011-01-04 12:22:31.230255
18	9	en	Reset password	Reset password	2011-01-04 12:22:31.247627	2011-01-04 12:22:31.247627
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-04 12:22:30.408827	2011-01-04 12:22:30.45428	about_us	0	t	2011-01-04 12:22:30.45418
2	Article::Cms	2011-01-04 12:22:30.506149	2011-01-04 12:22:30.536516	privacy	0	t	2011-01-04 12:22:30.536408
3	Article::Cms	2011-01-04 12:22:30.571262	2011-01-04 12:22:30.82338	terms_conditions	0	t	2011-01-04 12:22:30.8232
4	Article::Cms	2011-01-04 12:22:30.866814	2011-01-04 12:22:30.896926	blurb_sign_up	1	t	2011-01-04 12:22:30.896816
5	Article::Cms	2011-01-04 12:22:30.928373	2011-01-04 12:22:30.955896	blurb_buyer_home	1	t	2011-01-04 12:22:30.955791
6	Article::Cms	2011-01-04 12:22:30.989149	2011-01-04 12:22:31.016807	blurb_agent_home	1	t	2011-01-04 12:22:31.016709
7	Article::Cms	2011-01-04 12:22:31.054063	2011-01-04 12:22:31.103568	blurb_start_page_role_selection	1	t	2011-01-04 12:22:31.103454
8	Article::Cms	2011-01-04 12:22:31.141055	2011-01-04 12:22:31.172787	blurb_currencies	1	t	2011-01-04 12:22:31.172622
9	Article::Cms	2011-01-04 12:22:31.22208	2011-01-04 12:22:31.254515	reset_password	2	t	2011-01-04 12:22:31.254405
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
1	Electronics	Autem quasi sed soluta unde eum esse.Occaecati vero sit sunt consequatur illo sit voluptate sed.	2011-01-04 12:22:28.749019	2011-01-04 12:22:28.749019	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Temporibus consequatur ullam sunt occaecati consequuntur.Ipsa veniam eius debitis officiis numquam labore aut totam.	2011-01-04 12:22:28.831508	2011-01-04 12:22:28.831508	\N	3	4	\N	0	2-leisure	f	0
3	Business	Veniam sequi id totam possimus nemo facere quasi.Hic ut aut omnis asperiores aut ipsam aliquam ipsum.	2011-01-04 12:22:28.910886	2011-01-04 12:22:29.987959	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Autem quasi sed soluta unde eum esse.Occaecati vero sit sunt consequatur illo sit voluptate sed.	Electronics	2011-01-04 12:22:28.762718	2011-01-04 12:22:28.762718
2	1	dk	\N	Electronics	2011-01-04 12:22:28.81432	2011-01-04 12:22:28.81432
3	2	en	Temporibus consequatur ullam sunt occaecati consequuntur.Ipsa veniam eius debitis officiis numquam labore aut totam.	Leisure	2011-01-04 12:22:28.841063	2011-01-04 12:22:28.841063
4	2	dk	\N	Leisure	2011-01-04 12:22:28.882142	2011-01-04 12:22:28.882142
5	3	en	Veniam sequi id totam possimus nemo facere quasi.Hic ut aut omnis asperiores aut ipsam aliquam ipsum.	Business	2011-01-04 12:22:28.917556	2011-01-04 12:22:28.917556
6	3	dk	\N	Business	2011-01-04 12:22:28.963171	2011-01-04 12:22:28.963171
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-04 12:22:27.787488	2011-01-04 12:22:27.787488
2	United Kingdom	2011-01-04 12:22:27.80139	2011-01-04 12:22:27.80139
3	Wales129414374900577	2011-01-04 12:22:29.036397	2011-01-04 12:22:29.036397
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
1	Euro	&euro;	%u%n	t	2011-01-04 12:22:28.705726	2011-01-04 12:22:28.705726
2	PLN	&pln;	%u%n	t	2011-01-04 12:22:28.714487	2011-01-04 12:22:28.714487
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-01-04 12:22:27.847336	2011-01-04 12:22:27.847336
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-01-04 12:22:27.871005	2011-01-04 12:22:27.871005
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-01-04 12:22:27.892099	2011-01-04 12:22:27.892099
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-01-04 12:22:27.912586	2011-01-04 12:22:27.912586
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-01-04 12:22:27.931747	2011-01-04 12:22:27.931747
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-01-04 12:22:27.951422	2011-01-04 12:22:27.951422
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-01-04 12:22:27.972913	2011-01-04 12:22:27.972913
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-01-04 12:22:27.999414	2011-01-04 12:22:27.999414
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-01-04 12:22:28.022076	2011-01-04 12:22:28.022076
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-01-04 12:22:28.048427	2011-01-04 12:22:28.048427
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-01-04 12:22:28.07397	2011-01-04 12:22:28.07397
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-01-04 12:22:28.096703	2011-01-04 12:22:28.096703
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-01-04 12:22:28.130277	2011-01-04 12:22:28.130277
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-01-04 12:22:28.150565	2011-01-04 12:22:28.150565
15	8	en	<p></p>	Question	2011-01-04 12:22:28.1712	2011-01-04 12:22:28.1712
16	8	dk	<p></p>	[DK] Question	2011-01-04 12:22:28.189271	2011-01-04 12:22:28.189271
17	9	en	<p></p>	Invoice	2011-01-04 12:22:28.207854	2011-01-04 12:22:28.207854
18	9	dk	<p></p>	[DK] Invoice	2011-01-04 12:22:28.509184	2011-01-04 12:22:28.509184
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-04 12:22:27.835644	2011-01-04 12:22:27.864796
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-04 12:22:27.885388	2011-01-04 12:22:27.906386
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-04 12:22:27.92566	2011-01-04 12:22:27.945885
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-04 12:22:27.965722	2011-01-04 12:22:27.992724
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-04 12:22:28.013793	2011-01-04 12:22:28.040444
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-04 12:22:28.06709	2011-01-04 12:22:28.090764
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-04 12:22:28.120743	2011-01-04 12:22:28.145026
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-04 12:22:28.165178	2011-01-04 12:22:28.183835
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-04 12:22:28.202047	2011-01-04 12:22:28.502638
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

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
1	1	dk	Incidunt beatae aliquam recusandae.Rerum voluptatem voluptas quis amet.	Hic voluptates labore modi tenetur ut dolorem.Culpa mollitia quo voluptatibus et accusantium est.	Big deal on printers	2011-01-04 12:22:29.300555	2011-01-04 12:22:29.300555
2	2	dk	Dolor velit ut sed autem.Iste est et aut quam suscipit unde magni sint.	Dolores molestiae dolor velit sed magnam.Ipsa aut itaque molestias omnis qui illo.	Drills required	2011-01-04 12:22:29.422724	2011-01-04 12:22:29.422724
3	3	dk	Aspernatur ut labore vitae qui adipisci.Qui id voluptatum distinctio nesciunt debitis quo eos quia.	Aspernatur deleniti illo architecto velit aliquam voluptas minima voluptas.Aut sint sed deleniti adipisci.	Need assistance in selling a car	2011-01-04 12:22:29.531597	2011-01-04 12:22:29.531597
4	4	dk	Deleniti ullam veritatis in suscipit dolor.Sint magnam eos dolorem necessitatibus ratione id.	Et perspiciatis deserunt quaerat.Ea ut velit ad reprehenderit.	Ipod shipment	2011-01-04 12:22:29.656026	2011-01-04 12:22:29.656026
5	5	dk	Et mollitia quod dolores sint eos.Nisi consequuntur qui suscipit ut.	Qui voluptatem cumque eaque pariatur quidem omnis omnis.Ducimus quis rem amet voluptate.	Trip to amazonia - looking for offer	2011-01-04 12:22:29.754455	2011-01-04 12:22:29.754455
6	6	dk	Adipisci et minima natus tempora quisquam repellendus necessitatibus eveniet.Libero exercitationem ut impedit et iusto.	Magnam ipsa modi doloribus reprehenderit dolore perferendis minus.Dolorem beatae aspernatur nihil officia veritatis nostrum porro.	LCD - Huge amounts	2011-01-04 12:22:29.892447	2011-01-04 12:22:29.892447
7	7	dk	Ex perspiciatis iste rerum reiciendis magnam.Libero ipsam tempora soluta sequi aut pariatur.	Et dolorem minus ab maxime animi.At nostrum qui saepe vero iste veniam.	GPS receivers required	2011-01-04 12:22:29.998417	2011-01-04 12:22:29.998417
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url) FROM stdin;
1	Big deal on printers	3	Incidunt beatae aliquam recusandae.Rerum voluptatem voluptas quis amet.	Hic voluptates labore modi tenetur ut dolorem.Culpa mollitia quo voluptatibus et accusantium est.	2	User::Agent	0	163.0	594.0	1	Williamson	Fabian Medhurst	1-743-617-4163 x51752	hermann_runolfsdottir@dooleytillman.uk	13006 Heloise Ports	2011-01-04 12:22:29.224049	2011-01-04 12:22:29.224049	2011-01-09	Everett129414374900474 Fahey	1	t	\N	0	0	f	f	-1	1	2011-01-04 12:22:29.240182	\N	\N
2	Drills required	3	Dolor velit ut sed autem.Iste est et aut quam suscipit unde magni sint.	Dolores molestiae dolor velit sed magnam.Ipsa aut itaque molestias omnis qui illo.	2	User::Agent	0	61.0	186.0	1	Thompsonrenner	Cathy Thompson	(925)818-3527	erna@von.co.uk	865 Casper Cape	2011-01-04 12:22:29.375291	2011-01-04 12:22:29.375291	2011-01-09	Everett129414374900474 Fahey	1	t	\N	0	0	f	f	-1	1	2011-01-04 12:22:29.383455	\N	\N
3	Need assistance in selling a car	3	Aspernatur ut labore vitae qui adipisci.Qui id voluptatum distinctio nesciunt debitis quo eos quia.	Aspernatur deleniti illo architecto velit aliquam voluptas minima voluptas.Aut sint sed deleniti adipisci.	2	User::Agent	0	523.0	344.0	1	Koepp	Lucinda Barrows	545.901.1008	louvenia.corkery@grimes.us	1269 Renner Field	2011-01-04 12:22:29.4795	2011-01-04 12:22:29.4795	2011-01-09	Everett129414374900474 Fahey	1	t	\N	0	0	f	f	-1	1	2011-01-04 12:22:29.48831	\N	\N
4	Ipod shipment	3	Deleniti ullam veritatis in suscipit dolor.Sint magnam eos dolorem necessitatibus ratione id.	Et perspiciatis deserunt quaerat.Ea ut velit ad reprehenderit.	2	User::Agent	0	822.0	1.0	1	Hagenes	Telly Leuschke	638-861-2645 x47604	francisca@crona.com	019 Josefina Brook	2011-01-04 12:22:29.604317	2011-01-04 12:22:29.604317	2011-01-09	Everett129414374900474 Fahey	1	t	\N	0	0	f	f	-1	1	2011-01-04 12:22:29.615646	\N	\N
5	Trip to amazonia - looking for offer	3	Et mollitia quod dolores sint eos.Nisi consequuntur qui suscipit ut.	Qui voluptatem cumque eaque pariatur quidem omnis omnis.Ducimus quis rem amet voluptate.	2	User::Agent	0	509.0	307.0	1	Mitchell	Ana Murazik	(313)557-5046	jessika@gulgowski.info	033 Ora Road	2011-01-04 12:22:29.70643	2011-01-04 12:22:29.70643	2011-01-09	Everett129414374900474 Fahey	1	t	\N	0	0	f	f	-1	1	2011-01-04 12:22:29.714535	\N	\N
6	LCD - Huge amounts	3	Adipisci et minima natus tempora quisquam repellendus necessitatibus eveniet.Libero exercitationem ut impedit et iusto.	Magnam ipsa modi doloribus reprehenderit dolore perferendis minus.Dolorem beatae aspernatur nihil officia veritatis nostrum porro.	2	User::Agent	0	726.0	969.0	1	Mannwyman	Tatum Dooley Sr.	(081)329-0328 x3450	cullen_abshire@krajcikauer.biz	0278 Seamus Fork	2011-01-04 12:22:29.830893	2011-01-04 12:22:29.830893	2011-01-09	Everett129414374900474 Fahey	1	t	\N	0	0	f	f	-1	1	2011-01-04 12:22:29.842904	\N	\N
7	GPS receivers required	3	Ex perspiciatis iste rerum reiciendis magnam.Libero ipsam tempora soluta sequi aut pariatur.	Et dolorem minus ab maxime animi.At nostrum qui saepe vero iste veniam.	2	User::Agent	0	766.0	639.0	1	Schoensmitham	Olga Boyle	(044)026-1717	madyson_lindgren@stoltenberg.us	5611 Harvey Garden	2011-01-04 12:22:29.954534	2011-01-04 12:22:29.954534	2011-01-09	Everett129414374900474 Fahey	1	t	\N	0	0	f	f	-1	1	2011-01-04 12:22:29.962082	\N	\N
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
1	default_payout_delay	--- 0\n	2011-01-04 12:22:27.690188	2011-01-04 12:22:27.690188
2	default_leads_per_page	--- 5\n	2011-01-04 12:22:27.701712	2011-01-04 12:22:27.701712
3	certification_level_1	--- 10\n	2011-01-04 12:22:27.709714	2011-01-04 12:22:27.709714
4	certification_level_2	--- 20\n	2011-01-04 12:22:27.716537	2011-01-04 12:22:27.716537
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-04 12:22:27.723482	2011-01-04 12:22:27.723482
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-04 12:22:27.731675	2011-01-04 12:22:27.731675
7	invoicing_seller_name	--- Fairleads\n	2011-01-04 12:22:27.739747	2011-01-04 12:22:27.739747
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-04 12:22:27.747549	2011-01-04 12:22:27.747549
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-04 12:22:27.755247	2011-01-04 12:22:27.755247
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-04 12:22:27.763589	2011-01-04 12:22:27.763589
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information) FROM stdin;
1	blazejek@gmail.com	ac169d7ca7eeda321527b299e9e3428a15fbc5bcfcd6b9fae8d522cd053da4bf5f0c0964421d345f2c13a4c2a33a6caca62ce520d28b91a84643d7c5c212e954	3ka6XwWLdB9FeU3zDThs	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-04 12:22:28.687788	2011-01-04 12:22:28.567263	\N	2011-01-04 12:22:28.567547	2011-01-04 12:22:28.688452	1	Deborah	Schmeler	273-125-4693 x3640	root	Pablo Courts	Anitaborough	90550-9418	Rutland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	H1t19MjTBYWbqus72nQpeniRF0F3h8ajnYWTIzYY23HPe11dpuZLltyhDPBAJl	f	\N	0	0	0	0	0	\N	\N	\N	f
2	agent@nbs.com	4a696e3a7a122c8adc1fedccc34da48933869a1af71ca14c4c16a03c1ad4825b3a8839edc165d22f0493616aa5bb50b990b80c7b924b9de09698d85c1359e143	NwidgEM34luybDh7_zuv	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-04 12:22:29.125358	2011-01-04 12:22:29.062179	\N	2011-01-04 12:22:29.062492	2011-01-04 12:22:29.126089	2	Everett129414374900474	Fahey	(445)980-1287 x73159	Ms. Blake Gaylord129414374900422	Hillard Points	Vinniestad	93911	Somerset	3	\N	0	\N	\N	0	\N	\N	\N	\N	3xVtsWr8KHvAxVuzjuMLU8vPDlqxOU90Hl4ZYyX4JHAFuhzTJWeaxpUmZUKnuC	f	\N	0	0	0	0	0	\N	\N	\N	f
3	admin@nbs.com	ed3322040df367e6f07356ab05276a41e05d0e9c9c47ca27f127b60796b8027f5f5fbb28fdf266de5a4fb770b6f683b8eae57d0551ec1d02a32bb4533c367ac1	EFsV_YJ9ZAQH8mxhxLMU	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-04 12:22:30.112473	2011-01-04 12:22:30.083308	\N	2011-01-04 12:22:30.08358	2011-01-04 12:22:30.114222	1	Hellen	Considine	214-259-0347	Callie Swift129414375007746	Angelica Garden	East Darwin	14196-0058	West Sussex	1	\N	\N	\N	\N	0	\N	\N	\N	\N	OuJ73W5qZa4r1L0Fl30wLrYvX6BF7FL8wAVGhTERdwTn7RhfWOPnzFbNSpxg2P	f	\N	0	0	0	0	0	\N	\N	\N	f
4	buyer@nbs.com	ba02c9d2e16ea1a0a86b41a9679bc40b86e57ff9fb13473a4c4e1824df5356ffe547adf71e6ecb01cce32d30be262134abb941bc419292cb018d5eb22bbf8de2	5xoLpW7Vh0yBrdmZqSW1	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-04 12:22:30.186054	2011-01-04 12:22:30.154671	\N	2011-01-04 12:22:30.154973	2011-01-04 12:22:30.186475	48	Miller	Jaskolski	458.510.5454	Jamison Corkery III129414375014831	Hagenes Spur	Lake Jevon	20381-4805	Shropshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	fkQsASMkkB5PN5Fc07mtUGkOnn78ktT3j4IV7dxtEZQm3IFEMfU4gkmO1Ukfcc	f	t	0	0	0	0	0	\N	\N	\N	f
5	leaduser@nbs.com	612c0bc85a814ac2f49e71df8e6b7fbbe5776963d1b09075a6502a86b5bb68caa875b72bea7ad40e7421ad19d7f715255ef7e8cec13197a7510a3e6074639ee4	Uzwt_aI8elja2wgKYuOi	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-04 12:22:30.262049	2011-01-04 12:22:30.229253	\N	2011-01-04 12:22:30.229545	2011-01-04 12:22:30.291647	64	Ali	Johns	216-643-3330	Luigi Zemlak129414375021946	Rice Club	Jaststad	41047-0633	Herefordshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	2yYECxObyy9VVwKo3jPsnBnk1MGq9u0kjzKE0K8QGoVclt3gIboE9Td4NWNl4o	f	\N	0	0	0	0	0	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

