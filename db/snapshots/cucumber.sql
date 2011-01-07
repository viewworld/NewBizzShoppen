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
1	1	dk	About us	About us	2011-01-07 11:23:30.256841	2011-01-07 11:23:30.256841
2	1	en	About us	About us	2011-01-07 11:23:30.279563	2011-01-07 11:23:30.279563
3	2	dk	Privacy	Privacy	2011-01-07 11:23:30.324619	2011-01-07 11:23:30.324619
4	2	en	Privacy	Privacy	2011-01-07 11:23:30.34282	2011-01-07 11:23:30.34282
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-07 11:23:30.393344	2011-01-07 11:23:30.393344
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-07 11:23:30.411103	2011-01-07 11:23:30.411103
7	4	dk	Blurb sign up	Blurb sign up	2011-01-07 11:23:30.452673	2011-01-07 11:23:30.452673
8	4	en	Blurb sign up	Blurb sign up	2011-01-07 11:23:30.469192	2011-01-07 11:23:30.469192
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-07 11:23:30.513742	2011-01-07 11:23:30.513742
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-07 11:23:30.531913	2011-01-07 11:23:30.531913
11	6	dk	Blurb agent home	Blurb agent home	2011-01-07 11:23:30.578172	2011-01-07 11:23:30.578172
12	6	en	Blurb agent home	Blurb agent home	2011-01-07 11:23:30.596577	2011-01-07 11:23:30.596577
13	7	dk	Blurb start page role selection	Blurb start page role selection	2011-01-07 11:23:30.640091	2011-01-07 11:23:30.640091
14	7	en	Blurb start page role selection	Blurb start page role selection	2011-01-07 11:23:30.656576	2011-01-07 11:23:30.656576
15	8	dk	Blurb currencies	Blurb currencies	2011-01-07 11:23:30.69944	2011-01-07 11:23:30.69944
16	8	en	Blurb currencies	Blurb currencies	2011-01-07 11:23:30.716079	2011-01-07 11:23:30.716079
17	9	dk	Reset password	Reset password	2011-01-07 11:23:30.755345	2011-01-07 11:23:30.755345
18	9	en	Reset password	Reset password	2011-01-07 11:23:30.774294	2011-01-07 11:23:30.774294
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-07 11:23:30.246255	2011-01-07 11:23:30.285153	about_us	0	t	2011-01-07 11:23:30.285039
2	Article::Cms	2011-01-07 11:23:30.319408	2011-01-07 11:23:30.349162	privacy	0	t	2011-01-07 11:23:30.349061
3	Article::Cms	2011-01-07 11:23:30.387148	2011-01-07 11:23:30.418561	terms_conditions	0	t	2011-01-07 11:23:30.418459
4	Article::Cms	2011-01-07 11:23:30.447829	2011-01-07 11:23:30.474512	blurb_sign_up	1	t	2011-01-07 11:23:30.474408
5	Article::Cms	2011-01-07 11:23:30.508797	2011-01-07 11:23:30.538645	blurb_buyer_home	1	t	2011-01-07 11:23:30.538478
6	Article::Cms	2011-01-07 11:23:30.573202	2011-01-07 11:23:30.602851	blurb_agent_home	1	t	2011-01-07 11:23:30.602747
7	Article::Cms	2011-01-07 11:23:30.635186	2011-01-07 11:23:30.662985	blurb_start_page_role_selection	1	t	2011-01-07 11:23:30.662882
8	Article::Cms	2011-01-07 11:23:30.693934	2011-01-07 11:23:30.721541	blurb_currencies	1	t	2011-01-07 11:23:30.721441
9	Article::Cms	2011-01-07 11:23:30.750395	2011-01-07 11:23:30.779619	reset_password	2	t	2011-01-07 11:23:30.779513
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
1	Electronics	Est ut rerum reiciendis.Beatae eaque est eum non aspernatur.	2011-01-07 11:23:28.915653	2011-01-07 11:23:28.915653	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Ut tenetur sit maxime dolor omnis cum est deleniti.Odit dolorem dolore quas nobis.	2011-01-07 11:23:28.982308	2011-01-07 11:23:28.982308	\N	3	4	\N	0	2-leisure	f	0
3	Business	Et et eveniet esse.Animi sint accusamus laudantium non qui similique.	2011-01-07 11:23:29.035107	2011-01-07 11:23:29.817409	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Est ut rerum reiciendis.Beatae eaque est eum non aspernatur.	Electronics	2011-01-07 11:23:28.92854	2011-01-07 11:23:28.92854
2	1	dk	\N	Electronics	2011-01-07 11:23:28.968072	2011-01-07 11:23:28.968072
3	2	en	Ut tenetur sit maxime dolor omnis cum est deleniti.Odit dolorem dolore quas nobis.	Leisure	2011-01-07 11:23:28.987635	2011-01-07 11:23:28.987635
4	2	dk	\N	Leisure	2011-01-07 11:23:29.013702	2011-01-07 11:23:29.013702
5	3	en	Et et eveniet esse.Animi sint accusamus laudantium non qui similique.	Business	2011-01-07 11:23:29.040455	2011-01-07 11:23:29.040455
6	3	dk	\N	Business	2011-01-07 11:23:29.067746	2011-01-07 11:23:29.067746
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-07 11:23:27.027745	2011-01-07 11:23:27.027745
2	United Kingdom	2011-01-07 11:23:27.040102	2011-01-07 11:23:27.040102
3	Scotland129439940910562	2011-01-07 11:23:29.10735	2011-01-07 11:23:29.10735
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
1	Euro	&euro;	%u%n	t	2011-01-07 11:23:28.878023	2011-01-07 11:23:28.878023
2	PLN	&pln;	%u%n	t	2011-01-07 11:23:28.888259	2011-01-07 11:23:28.888259
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-01-07 11:23:27.08929	2011-01-07 11:23:27.08929
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-01-07 11:23:27.111746	2011-01-07 11:23:27.111746
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-01-07 11:23:27.133345	2011-01-07 11:23:27.133345
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-01-07 11:23:27.153427	2011-01-07 11:23:27.153427
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-01-07 11:23:27.179439	2011-01-07 11:23:27.179439
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-01-07 11:23:27.645006	2011-01-07 11:23:27.645006
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-01-07 11:23:27.675169	2011-01-07 11:23:27.675169
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-01-07 11:23:27.697302	2011-01-07 11:23:27.697302
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-01-07 11:23:27.719535	2011-01-07 11:23:27.719535
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-01-07 11:23:27.772541	2011-01-07 11:23:27.772541
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-01-07 11:23:28.241691	2011-01-07 11:23:28.241691
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-01-07 11:23:28.280981	2011-01-07 11:23:28.280981
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-01-07 11:23:28.315058	2011-01-07 11:23:28.315058
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-01-07 11:23:28.338842	2011-01-07 11:23:28.338842
15	8	en	<p></p>	Question	2011-01-07 11:23:28.616761	2011-01-07 11:23:28.616761
16	8	dk	<p></p>	[DK] Question	2011-01-07 11:23:28.635619	2011-01-07 11:23:28.635619
17	9	en	<p></p>	Invoice	2011-01-07 11:23:28.657023	2011-01-07 11:23:28.657023
18	9	dk	<p></p>	[DK] Invoice	2011-01-07 11:23:28.674819	2011-01-07 11:23:28.674819
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-07 11:23:27.077205	2011-01-07 11:23:27.106121
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-07 11:23:27.127458	2011-01-07 11:23:27.147881
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-07 11:23:27.172215	2011-01-07 11:23:27.639147
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-07 11:23:27.668505	2011-01-07 11:23:27.691447
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-07 11:23:27.712497	2011-01-07 11:23:27.75988
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-07 11:23:28.230202	2011-01-07 11:23:28.274986
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-07 11:23:28.304526	2011-01-07 11:23:28.332109
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-07 11:23:28.610973	2011-01-07 11:23:28.630284
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-07 11:23:28.650123	2011-01-07 11:23:28.669541
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

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
1	1	dk	Aut distinctio sed vel nesciunt.Odio voluptatibus iste est velit tenetur optio saepe pariatur.	Accusamus molestiae ipsam enim nam aut laborum.Ea perferendis eum magni tempore.	Big deal on printers	2011-01-07 11:23:29.251531	2011-01-07 11:23:29.251531
2	2	dk	Asperiores ipsam iure aut nemo hic sint est voluptas.Ad cumque eos quaerat.	Doloremque asperiores quisquam ut.Rerum nihil quos ut veniam odit dolor eos dignissimos.	Drills required	2011-01-07 11:23:29.346141	2011-01-07 11:23:29.346141
3	3	dk	Sed eaque amet architecto vitae.Similique quas ut et nostrum quisquam ipsam.	Voluptates rem ratione suscipit aut iste aspernatur.Dolorum iste corporis quo nemo.	Need assistance in selling a car	2011-01-07 11:23:29.441361	2011-01-07 11:23:29.441361
4	4	dk	Et quod exercitationem voluptas.Distinctio autem eveniet quia.	Non quis adipisci odit labore.Voluptatem ipsam voluptatem qui ut architecto aut.	Ipod shipment	2011-01-07 11:23:29.534226	2011-01-07 11:23:29.534226
5	5	dk	Ut est enim odio perspiciatis consectetur aut.Non quam velit similique ut veniam saepe.	Quis et quasi pariatur et.Sapiente et numquam sit.	Trip to amazonia - looking for offer	2011-01-07 11:23:29.634166	2011-01-07 11:23:29.634166
6	6	dk	Saepe voluptatibus quis atque quisquam ex officia.Quos illo omnis qui.	Culpa eum aut laborum qui molestiae voluptas animi.Earum excepturi consequatur cum error.	LCD - Huge amounts	2011-01-07 11:23:29.727363	2011-01-07 11:23:29.727363
7	7	dk	Magni mollitia cupiditate culpa iusto at aut nihil eum.Suscipit quidem reiciendis inventore nemo nisi.	A quod dolorem quia.Quibusdam dolores necessitatibus excepturi et.	GPS receivers required	2011-01-07 11:23:29.826968	2011-01-07 11:23:29.826968
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url) FROM stdin;
1	Big deal on printers	3	Aut distinctio sed vel nesciunt.Odio voluptatibus iste est velit tenetur optio saepe pariatur.	Accusamus molestiae ipsam enim nam aut laborum.Ea perferendis eum magni tempore.	2	User::Agent	0	963.0	627.0	1	Hudsonoconnell	Kelton Parisian	1-102-414-8309	meta@rutherfordmraz.com	2128 Gregg Plaza	2011-01-07 11:23:29.199265	2011-01-07 11:23:29.199265	2011-01-12	Kylie129439940910482 Boehm	1	t	\N	0	0	f	f	-1	1	2011-01-07 11:23:29.210588	\N	\N
2	Drills required	3	Asperiores ipsam iure aut nemo hic sint est voluptas.Ad cumque eos quaerat.	Doloremque asperiores quisquam ut.Rerum nihil quos ut veniam odit dolor eos dignissimos.	2	User::Agent	0	611.0	64.0	1	Mrazhowe	Anahi Dicki	(474)155-8359 x8284	manuela_gaylord@beahan.ca	1278 Keeling Canyon	2011-01-07 11:23:29.303626	2011-01-07 11:23:29.303626	2011-01-12	Kylie129439940910482 Boehm	1	t	\N	0	0	f	f	-1	1	2011-01-07 11:23:29.311767	\N	\N
3	Need assistance in selling a car	3	Sed eaque amet architecto vitae.Similique quas ut et nostrum quisquam ipsam.	Voluptates rem ratione suscipit aut iste aspernatur.Dolorum iste corporis quo nemo.	2	User::Agent	0	859.0	857.0	1	Medhurst	Norberto McKenzie	707.537.1639	mario@nader.ca	9939 Hand Glen	2011-01-07 11:23:29.399268	2011-01-07 11:23:29.399268	2011-01-12	Kylie129439940910482 Boehm	1	t	\N	0	0	f	f	-1	1	2011-01-07 11:23:29.406942	\N	\N
4	Ipod shipment	3	Et quod exercitationem voluptas.Distinctio autem eveniet quia.	Non quis adipisci odit labore.Voluptatem ipsam voluptatem qui ut architecto aut.	2	User::Agent	0	843.0	616.0	1	Wilkinson	Samir Lind	442-290-0510 x324	cortney@willms.biz	643 Littel Drives	2011-01-07 11:23:29.491286	2011-01-07 11:23:29.491286	2011-01-12	Kylie129439940910482 Boehm	1	t	\N	0	0	f	f	-1	1	2011-01-07 11:23:29.500073	\N	\N
5	Trip to amazonia - looking for offer	3	Ut est enim odio perspiciatis consectetur aut.Non quam velit similique ut veniam saepe.	Quis et quasi pariatur et.Sapiente et numquam sit.	2	User::Agent	0	547.0	931.0	1	Davisstrosin	Emmitt Jakubowski	1-446-417-1243	lazaro.hudson@hamill.info	449 O'Conner Square	2011-01-07 11:23:29.588107	2011-01-07 11:23:29.588107	2011-01-12	Kylie129439940910482 Boehm	1	t	\N	0	0	f	f	-1	1	2011-01-07 11:23:29.598844	\N	\N
6	LCD - Huge amounts	3	Saepe voluptatibus quis atque quisquam ex officia.Quos illo omnis qui.	Culpa eum aut laborum qui molestiae voluptas animi.Earum excepturi consequatur cum error.	2	User::Agent	0	108.0	242.0	1	Larsondickinson	Martine Rempel	1-216-235-9148	haskell@mcdermott.biz	0640 Paucek Prairie	2011-01-07 11:23:29.683238	2011-01-07 11:23:29.683238	2011-01-12	Kylie129439940910482 Boehm	1	t	\N	0	0	f	f	-1	1	2011-01-07 11:23:29.693038	\N	\N
7	GPS receivers required	3	Magni mollitia cupiditate culpa iusto at aut nihil eum.Suscipit quidem reiciendis inventore nemo nisi.	A quod dolorem quia.Quibusdam dolores necessitatibus excepturi et.	2	User::Agent	0	218.0	920.0	1	Schroeder	Luisa Reinger II	385-542-2688	earline@hermiston.name	444 Jacobs Wells	2011-01-07 11:23:29.783395	2011-01-07 11:23:29.783395	2011-01-12	Kylie129439940910482 Boehm	1	t	\N	0	0	f	f	-1	1	2011-01-07 11:23:29.792554	\N	\N
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
1	default_payout_delay	--- 0\n	2011-01-07 11:23:26.673925	2011-01-07 11:23:26.673925
2	default_leads_per_page	--- 5\n	2011-01-07 11:23:26.897095	2011-01-07 11:23:26.897095
3	certification_level_1	--- 10\n	2011-01-07 11:23:26.941711	2011-01-07 11:23:26.941711
4	certification_level_2	--- 20\n	2011-01-07 11:23:26.953364	2011-01-07 11:23:26.953364
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-07 11:23:26.962738	2011-01-07 11:23:26.962738
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-07 11:23:26.970998	2011-01-07 11:23:26.970998
7	invoicing_seller_name	--- Fairleads\n	2011-01-07 11:23:26.98104	2011-01-07 11:23:26.98104
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-07 11:23:26.988752	2011-01-07 11:23:26.988752
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-07 11:23:26.996551	2011-01-07 11:23:26.996551
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-07 11:23:27.00409	2011-01-07 11:23:27.00409
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
1	blazejek@gmail.com	da2ddd2193d44059ab16c7b44d5b8bd66b9ce7386f236e9e567b8273c2449798519197d089e936da77c335a07fb1232bb0839f6876f65a2b8c45e5b59818616f	sPfXxr0WML0L3RdHzpJh	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-07 11:23:28.859182	2011-01-07 11:23:28.730675	\N	2011-01-07 11:23:28.731005	2011-01-07 11:23:28.859605	1	Hermann	Hand	000-806-6679 x94022	root	Steuber Cove	Reichelburgh	58431	West Yorkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	JW4to3z5hlfu8Jj2cSqXRtiGIXcwz21sxoTuLcD8rXyLWO3qe4FguLa6EMUGjQ	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
2	agent@nbs.com	1fb0fd709a5eeb449b65cdafd9f2658c9816e11cd6e754502ffc522b9b36c26b59292e5b063051f4172d3e4d575769a4651e70939451b50be241c907ee90bf80	JBxizCIvsVXqL4KFQqh9	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-07 11:23:29.150119	2011-01-07 11:23:29.117207	\N	2011-01-07 11:23:29.117536	2011-01-07 11:23:29.150592	2	Kylie129439940910482	Boehm	953-965-1231 x42574	Brennan Jacobi129439940910458	Hoeger Rapids	Creminshire	71070-5636	North Yorkshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	sCWnkwc2w0SzM4DWW1TcKBRfROWYuUztodcEagafPQMwh5YtwcwlTa1tGXfz2f	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
3	admin@nbs.com	1f73ada014b36a757f81435ef58286646bebc8c0b2758b31217281ff445af24125d4ebd06d768921bbe93a8c98dda28ff5bf2c9c6e72d41a91bae7f89322561c	0bR2WatrrruqP65CkdQS	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-07 11:23:29.946853	2011-01-07 11:23:29.918674	\N	2011-01-07 11:23:29.918974	2011-01-07 11:23:29.947278	1	Angelica	Treutel	(958)884-7121 x9052	Mr. Allison Reichert129439940991238	Filomena Fort	Donnieport	46694-3571	Dumfries and Galloway	1	\N	\N	\N	\N	0	\N	\N	\N	\N	4lqmOTYSqrzjE74ozFu0PU0jaeCkMQdXc6fxv4mLUMGyH0vupGpAH1KueNXwiu	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
4	buyer@nbs.com	8d8585b4dc57125a51b8b4be7f417057bba802ccf1cb974b24fcc1bc3001aadc4c523a4f4cb5905d421fcbaab3312ce6bc754c93e98f2f2ee7eb134760b33c7f	xuRv8_rESaB-vy2hqGiP	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-07 11:23:30.024777	2011-01-07 11:23:29.992741	\N	2011-01-07 11:23:29.993034	2011-01-07 11:23:30.025198	48	Justice	Blanda	156-784-7552	Mr. Moises Becker129439940998574	Sheila Road	Ashleeburgh	97164-8575	Northumberland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	2uD02KnYtVhiaUI162dAcvFObWDIsdGY59dFZ5yn61rjmsOgj5V2X5VOCZtkQ4	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
5	leaduser@nbs.com	612b2e63531a1718004933622d5ba03653ee06c13c0de0f73d55744994ebc5e85015833fc0ef3d8c57f757043ce7d349bf632bbce9184d8c33071fd70044de37	uU2NJWa9LC3nmoXovZM8	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-07 11:23:30.102908	2011-01-07 11:23:30.07146	\N	2011-01-07 11:23:30.071739	2011-01-07 11:23:30.126618	64	Wilhelmine	Kozey	404-316-8625 x4983	Bernice Sauer129439941006499	Lexie Shore	Davehaven	18192	Powys	1	\N	\N	4	\N	0	\N	\N	\N	\N	Ii6df6Zb6zsPlSi8THP6lMExoM8JdAw25NGUjPURTKzlwVZlFMmTJVn6Km1fIz	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

