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
1	1	dk	About us	About us	2011-01-10 09:30:45.702452	2011-01-10 09:30:45.702452
2	1	en	About us	About us	2011-01-10 09:30:45.841087	2011-01-10 09:30:45.841087
3	2	dk	Privacy	Privacy	2011-01-10 09:30:46.169434	2011-01-10 09:30:46.169434
4	2	en	Privacy	Privacy	2011-01-10 09:30:46.291667	2011-01-10 09:30:46.291667
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-10 09:30:46.619846	2011-01-10 09:30:46.619846
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-10 09:30:46.741512	2011-01-10 09:30:46.741512
7	4	dk	Blurb sign up	Blurb sign up	2011-01-10 09:30:47.193788	2011-01-10 09:30:47.193788
8	4	en	Blurb sign up	Blurb sign up	2011-01-10 09:30:47.316348	2011-01-10 09:30:47.316348
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-10 09:30:47.627725	2011-01-10 09:30:47.627725
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-10 09:30:47.749686	2011-01-10 09:30:47.749686
11	6	dk	Blurb agent home	Blurb agent home	2011-01-10 09:30:48.053166	2011-01-10 09:30:48.053166
12	6	en	Blurb agent home	Blurb agent home	2011-01-10 09:30:48.177276	2011-01-10 09:30:48.177276
13	7	dk	Blurb start page role selection	Blurb start page role selection	2011-01-10 09:30:48.484965	2011-01-10 09:30:48.484965
14	7	en	Blurb start page role selection	Blurb start page role selection	2011-01-10 09:30:48.613153	2011-01-10 09:30:48.613153
15	8	dk	Blurb currencies	Blurb currencies	2011-01-10 09:30:48.925325	2011-01-10 09:30:48.925325
16	8	en	Blurb currencies	Blurb currencies	2011-01-10 09:30:49.048043	2011-01-10 09:30:49.048043
17	9	dk	Reset password	Reset password	2011-01-10 09:30:49.355395	2011-01-10 09:30:49.355395
18	9	en	Reset password	Reset password	2011-01-10 09:30:49.481089	2011-01-10 09:30:49.481089
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-10 09:30:45.652863	2011-01-10 09:30:45.884699	about_us	0	t	2011-01-10 09:30:45.884545
2	Article::Cms	2011-01-10 09:30:46.137549	2011-01-10 09:30:46.335272	privacy	0	t	2011-01-10 09:30:46.335139
3	Article::Cms	2011-01-10 09:30:46.583235	2011-01-10 09:30:46.785188	terms_conditions	0	t	2011-01-10 09:30:46.785053
4	Article::Cms	2011-01-10 09:30:47.162	2011-01-10 09:30:47.360227	blurb_sign_up	1	t	2011-01-10 09:30:47.360095
5	Article::Cms	2011-01-10 09:30:47.59022	2011-01-10 09:30:47.793404	blurb_buyer_home	1	t	2011-01-10 09:30:47.793258
6	Article::Cms	2011-01-10 09:30:48.021286	2011-01-10 09:30:48.22155	blurb_agent_home	1	t	2011-01-10 09:30:48.221384
7	Article::Cms	2011-01-10 09:30:48.452747	2011-01-10 09:30:48.658943	blurb_start_page_role_selection	1	t	2011-01-10 09:30:48.658801
8	Article::Cms	2011-01-10 09:30:48.89322	2011-01-10 09:30:49.092422	blurb_currencies	1	t	2011-01-10 09:30:49.092288
9	Article::Cms	2011-01-10 09:30:49.322734	2011-01-10 09:30:49.526864	reset_password	2	t	2011-01-10 09:30:49.526728
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
1	Electronics	Quia eum corrupti aut dolorem repudiandae.Autem quam at est totam eum.	2011-01-10 09:30:36.821316	2011-01-10 09:30:36.821316	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Facilis adipisci sint velit officiis iste tenetur qui.Ea alias nemo voluptatum praesentium vero.	2011-01-10 09:30:37.193087	2011-01-10 09:30:37.193087	\N	3	4	\N	0	2-leisure	f	0
3	Business	Deserunt et aut impedit assumenda qui odit ipsa omnis.Et dolores ex nam sit incidunt.	2011-01-10 09:30:37.514177	2011-01-10 09:30:43.175321	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Quia eum corrupti aut dolorem repudiandae.Autem quam at est totam eum.	Electronics	2011-01-10 09:30:36.871587	2011-01-10 09:30:36.871587
2	1	dk	\N	Electronics	2011-01-10 09:30:37.073345	2011-01-10 09:30:37.073345
3	2	en	Facilis adipisci sint velit officiis iste tenetur qui.Ea alias nemo voluptatum praesentium vero.	Leisure	2011-01-10 09:30:37.225283	2011-01-10 09:30:37.225283
4	2	dk	\N	Leisure	2011-01-10 09:30:37.395247	2011-01-10 09:30:37.395247
5	3	en	Deserunt et aut impedit assumenda qui odit ipsa omnis.Et dolores ex nam sit incidunt.	Business	2011-01-10 09:30:37.546095	2011-01-10 09:30:37.546095
6	3	dk	\N	Business	2011-01-10 09:30:37.716882	2011-01-10 09:30:37.716882
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-10 09:30:33.505335	2011-01-10 09:30:33.505335
2	United Kingdom	2011-01-10 09:30:33.587488	2011-01-10 09:30:33.587488
3	Northern Ireland129465183782671	2011-01-10 09:30:37.854465	2011-01-10 09:30:37.854465
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
1	Euro	&euro;	%u%n	t	2011-01-10 09:30:36.580328	2011-01-10 09:30:36.580328
2	PLN	&pln;	%u%n	t	2011-01-10 09:30:36.6414	2011-01-10 09:30:36.6414
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-10 09:30:33.796281	2011-01-10 09:30:33.796281
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-10 09:30:33.927963	2011-01-10 09:30:33.927963
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-10 09:30:34.05728	2011-01-10 09:30:34.05728
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-10 09:30:34.177832	2011-01-10 09:30:34.177832
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-10 09:30:34.307632	2011-01-10 09:30:34.307632
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-10 09:30:34.425153	2011-01-10 09:30:34.425153
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-10 09:30:34.555615	2011-01-10 09:30:34.555615
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-10 09:30:34.673182	2011-01-10 09:30:34.673182
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-10 09:30:34.803313	2011-01-10 09:30:34.803313
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-10 09:30:34.92073	2011-01-10 09:30:34.92073
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-10 09:30:35.051199	2011-01-10 09:30:35.051199
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-10 09:30:35.169936	2011-01-10 09:30:35.169936
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-10 09:30:35.301405	2011-01-10 09:30:35.301405
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-10 09:30:35.419377	2011-01-10 09:30:35.419377
15	8	en	Question	<p></p>	2011-01-10 09:30:35.552296	2011-01-10 09:30:35.552296
16	8	dk	[DK] Question	<p></p>	2011-01-10 09:30:35.674156	2011-01-10 09:30:35.674156
17	9	en	Invoice	<p></p>	2011-01-10 09:30:35.807262	2011-01-10 09:30:35.807262
18	9	dk	[DK] Invoice	<p></p>	2011-01-10 09:30:35.926736	2011-01-10 09:30:35.926736
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-10 09:30:33.74796	2011-01-10 09:30:33.89766
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-10 09:30:34.027014	2011-01-10 09:30:34.147414
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-10 09:30:34.277198	2011-01-10 09:30:34.394753
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-10 09:30:34.525055	2011-01-10 09:30:34.643249
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-10 09:30:34.772716	2011-01-10 09:30:34.890121
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-10 09:30:35.020542	2011-01-10 09:30:35.139261
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-10 09:30:35.270075	2011-01-10 09:30:35.388935
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-10 09:30:35.520842	2011-01-10 09:30:35.643212
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-10 09:30:35.775852	2011-01-10 09:30:35.895797
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
1	1	dk	Illum odio molestias suscipit aut fugit fugiat.Voluptas enim id praesentium tenetur ab ipsa veritatis.	Placeat eum deleniti esse ducimus libero quia sunt.Consectetur optio aliquid modi voluptatem.	Big deal on printers	2011-01-10 09:30:38.759913	2011-01-10 09:30:38.759913
2	2	dk	Sed assumenda ipsa voluptatem et.Blanditiis sint impedit nihil quas.	Sit unde eum quos ullam rem.Magni reprehenderit impedit praesentium.	Drills required	2011-01-10 09:30:39.612633	2011-01-10 09:30:39.612633
3	3	dk	Nulla magni libero qui tempore veritatis nisi odio id.Dolorum vitae ut omnis nemo eos.	Aperiam id architecto tempore.Officia distinctio praesentium molestiae.	Need assistance in selling a car	2011-01-10 09:30:40.310151	2011-01-10 09:30:40.310151
4	4	dk	Quo animi et consequuntur dolorum voluptas error.Molestiae facilis cupiditate et ut et et quasi.	Consectetur in quia quo deleniti quod dolorem autem enim.Accusamus non deleniti beatae numquam consequatur reiciendis inventore.	Ipod shipment	2011-01-10 09:30:41.008412	2011-01-10 09:30:41.008412
5	5	dk	Dolorum quod culpa iure ut eius dolore eveniet natus.Facere minima esse eius inventore facilis sunt error.	Voluptatem hic pariatur sed deserunt odio aut asperiores.Et vero et deleniti temporibus.	Trip to amazonia - looking for offer	2011-01-10 09:30:41.704966	2011-01-10 09:30:41.704966
6	6	dk	Ut quaerat quia consequatur adipisci assumenda.Est omnis sint facilis.	Nulla quae reprehenderit placeat harum aut est non.Quaerat culpa suscipit expedita.	LCD - Huge amounts	2011-01-10 09:30:42.545976	2011-01-10 09:30:42.545976
7	7	dk	Qui tempora quia facere rem veritatis.Porro officiis fuga provident voluptatem autem incidunt aut.	Suscipit quasi ratione delectus quas quo accusantium minima.Non et consequatur repudiandae perferendis.	GPS receivers required	2011-01-10 09:30:43.25144	2011-01-10 09:30:43.25144
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url) FROM stdin;
1	Big deal on printers	3	Illum odio molestias suscipit aut fugit fugiat.Voluptas enim id praesentium tenetur ab ipsa veritatis.	Placeat eum deleniti esse ducimus libero quia sunt.Consectetur optio aliquid modi voluptatem.	2	User::Agent	0	458.0	588.0	1	Reinger	Ms. Celestino O'Connell	331.566.3262	rosie@hegmann.biz	207 Renner Prairie	2011-01-10 09:30:38.417717	2011-01-10 09:30:38.417717	2011-01-15	Jazmyn129465183782524 Feeney	1	t	\N	0	0	f	f	-1	1	2011-01-10 09:30:38.467413	\N	\N
2	Drills required	3	Sed assumenda ipsa voluptatem et.Blanditiis sint impedit nihil quas.	Sit unde eum quos ullam rem.Magni reprehenderit impedit praesentium.	2	User::Agent	0	362.0	909.0	1	Strosin	Lulu Blanda	290-850-4307 x0818	stan.lind@lakinshields.biz	896 Gardner Center	2011-01-10 09:30:39.294297	2011-01-10 09:30:39.294297	2011-01-15	Jazmyn129465183782524 Feeney	1	t	\N	0	0	f	f	-1	1	2011-01-10 09:30:39.327253	\N	\N
3	Need assistance in selling a car	3	Nulla magni libero qui tempore veritatis nisi odio id.Dolorum vitae ut omnis nemo eos.	Aperiam id architecto tempore.Officia distinctio praesentium molestiae.	2	User::Agent	0	661.0	120.0	1	Wardbreitenberg	Jeramy Windler	1-546-680-1468	adonis@osinski.co.uk	810 Wolf Streets	2011-01-10 09:30:39.990431	2011-01-10 09:30:39.990431	2011-01-15	Jazmyn129465183782524 Feeney	1	t	\N	0	0	f	f	-1	1	2011-01-10 09:30:40.023852	\N	\N
4	Ipod shipment	3	Quo animi et consequuntur dolorum voluptas error.Molestiae facilis cupiditate et ut et et quasi.	Consectetur in quia quo deleniti quod dolorem autem enim.Accusamus non deleniti beatae numquam consequatur reiciendis inventore.	2	User::Agent	0	483.0	575.0	1	Mcdermottjacobs	Amira Beier	853.822.9369	hiram.bradtke@towne.co.uk	6668 Dach Common	2011-01-10 09:30:40.68934	2011-01-10 09:30:40.68934	2011-01-15	Jazmyn129465183782524 Feeney	1	t	\N	0	0	f	f	-1	1	2011-01-10 09:30:40.723097	\N	\N
5	Trip to amazonia - looking for offer	3	Dolorum quod culpa iure ut eius dolore eveniet natus.Facere minima esse eius inventore facilis sunt error.	Voluptatem hic pariatur sed deserunt odio aut asperiores.Et vero et deleniti temporibus.	2	User::Agent	0	253.0	235.0	1	Raynoranderson	Retha Zulauf	1-357-661-5051 x5384	fabian.moore@ondricka.name	78168 Minerva Avenue	2011-01-10 09:30:41.384643	2011-01-10 09:30:41.384643	2011-01-15	Jazmyn129465183782524 Feeney	1	t	\N	0	0	f	f	-1	1	2011-01-10 09:30:41.418814	\N	\N
6	LCD - Huge amounts	3	Ut quaerat quia consequatur adipisci assumenda.Est omnis sint facilis.	Nulla quae reprehenderit placeat harum aut est non.Quaerat culpa suscipit expedita.	2	User::Agent	0	904.0	161.0	1	Beier	Boyd Conroy	050-149-0085 x9849	luisa.lesch@donnelly.co.uk	77849 Ludie Trace	2011-01-10 09:30:42.081366	2011-01-10 09:30:42.081366	2011-01-15	Jazmyn129465183782524 Feeney	1	t	\N	0	0	f	f	-1	1	2011-01-10 09:30:42.115097	\N	\N
7	GPS receivers required	3	Qui tempora quia facere rem veritatis.Porro officiis fuga provident voluptatem autem incidunt aut.	Suscipit quasi ratione delectus quas quo accusantium minima.Non et consequatur repudiandae perferendis.	2	User::Agent	0	149.0	423.0	1	Macejkoviclang	Lysanne Boyer	(563)450-6454 x872	mallory@steuber.name	7599 Joseph Points	2011-01-10 09:30:42.929618	2011-01-10 09:30:42.929618	2011-01-15	Jazmyn129465183782524 Feeney	1	t	\N	0	0	f	f	-1	1	2011-01-10 09:30:42.963485	\N	\N
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
1	default_payout_delay	--- 0\n	2011-01-10 09:30:32.716662	2011-01-10 09:30:32.716662
2	default_leads_per_page	--- 5\n	2011-01-10 09:30:32.786478	2011-01-10 09:30:32.786478
3	certification_level_1	--- 10\n	2011-01-10 09:30:32.867719	2011-01-10 09:30:32.867719
4	certification_level_2	--- 20\n	2011-01-10 09:30:32.948501	2011-01-10 09:30:32.948501
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-10 09:30:33.002881	2011-01-10 09:30:33.002881
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-10 09:30:33.190772	2011-01-10 09:30:33.190772
7	invoicing_seller_name	--- Fairleads\n	2011-01-10 09:30:33.2449	2011-01-10 09:30:33.2449
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-10 09:30:33.298913	2011-01-10 09:30:33.298913
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-10 09:30:33.352352	2011-01-10 09:30:33.352352
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-10 09:30:33.405965	2011-01-10 09:30:33.405965
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
1	blazejek@gmail.com	f3f2ebf8fcb0e085d19e642c16dbcdf89d0b760844282d755bf1a12c13e915d1cf6c6e225671af3db68cef64432cc04a0a3fe2c02799629a5595f7d5178bbb02	ZSWvYaCPY2KVUmr9Uz7I	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-10 09:30:36.435381	2011-01-10 09:30:36.095881	\N	2011-01-10 09:30:36.096196	2011-01-10 09:30:36.448869	1	Harold	Leffler	828.981.8249 x424	root	Jeramie Lane	Naderland	33169	Grampian	1	\N	\N	\N	\N	0	\N	\N	\N	\N	daxw2JlmCxKn38fVugOAMbqKG8CHKu2DZUE1gAfiB7rnKFZTxnHu1QL3Fp7xhZ	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
2	agent@nbs.com	46ad83b2cea8206fccafc94e6664d493a545ecf8cfbc25c55734bce506b441bbcb741a6ba10f108e8bb3a356e5e23830e6e74d70ac1c8a25b63dd39c939c7f3f	B6JVXgdbz_tlUp9ngRS3	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-10 09:30:38.127296	2011-01-10 09:30:37.967251	\N	2011-01-10 09:30:37.967577	2011-01-10 09:30:38.14099	2	Jazmyn129465183782524	Feeney	1-941-537-9717	Garrison Hauck129465183782483	Asia Rest	South Kayceebury	72139-2131	Gwent	3	\N	0	\N	\N	0	\N	\N	\N	\N	A9gp3mxfxrunauwToaqIBovvsi2QboGzDKYK3XFSF2URQ50id4toC3v7uCas1Y	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
3	admin@nbs.com	ba83054b2b79fa7d2a2ddd17379d41bbd80e0464ee13f0383a3b4f9165e2856faa7ef7bb1bf7b63cdee93b896b9cd43137b634ab45274ec6193dab6931ddb52b	CFPydy5l5joWxYZBZiMr	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-10 09:30:44.201547	2011-01-10 09:30:44.054096	\N	2011-01-10 09:30:44.054408	2011-01-10 09:30:44.215142	1	Earline	Roob	1-343-338-0257 x8701	Lonzo Kulas129465184397946	Rosie Radial	Waterston	17434-2897	Devon	1	\N	\N	\N	\N	0	\N	\N	\N	\N	mRILAVI96XLGO1KpkmYDMP077Vh6TgXLgdLm4TOaFHcTUs0qVGCEIJEhV9D5RT	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
4	buyer@nbs.com	4e200427ce4921d41d70e9841718ac54bdeaa5e9ce0bdbddd170b50ab24011c0e804ef594cc728a5626246fd6d6459bebc5759ee84011763b54e9a9095aa37c3	I9iB5SZDPYGkSu5TO5id	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-10 09:30:44.613746	2011-01-10 09:30:44.454897	\N	2011-01-10 09:30:44.455227	2011-01-10 09:30:44.62768	48	Edwardo	Bins	(698)854-9042 x9315	Esperanza Ledner129465184438197	Berge Stravenue	Jefferychester	02241-9047	Essex	1	\N	\N	\N	\N	0	\N	\N	\N	\N	60B7HpPtvzi1X9vLh7VZb0RcNSsPmHRw9uKTSNvb9V39NAB47fbA4n3t05XICQ	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
5	leaduser@nbs.com	46a906c04c271855d0d570637907e450676c235e8850377bbda22ddca9e5a98992a40670429008379bf890ecf9b984464dbcfe962dc89a12c8d9eb05f124ebdc	5T8226R7mu2yzEz-S3tQ	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-10 09:30:45.030905	2011-01-10 09:30:44.871157	\N	2011-01-10 09:30:44.871614	2011-01-10 09:30:45.268157	64	Moriah	Mertz	780.490.5994 x33600	Kayli Durgan129465184479628	Gutmann Street	Lake Lavonneville	36994-1364	Cheshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	Ab7iTUhdqMRWDLkF1BKNCVrK39R300hZSmg00vSKQUvINJ1qZpl9RKrpIJbx0R	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

