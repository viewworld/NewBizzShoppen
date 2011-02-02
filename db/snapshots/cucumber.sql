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

SELECT pg_catalog.setval('article_translations_id_seq', 22, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 11, true);


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('assets_id_seq', 1, false);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('bank_accounts_id_seq', 1, true);


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
-- Name: vat_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vat_rates_id_seq', 1, false);


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-02 12:07:25.599936	2011-02-02 12:07:25.599936
2	1	en	About us	About us	2011-02-02 12:07:25.625804	2011-02-02 12:07:25.625804
3	2	dk	Privacy	Privacy	2011-02-02 12:07:25.680116	2011-02-02 12:07:25.680116
4	2	en	Privacy	Privacy	2011-02-02 12:07:25.702818	2011-02-02 12:07:25.702818
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-02 12:07:25.760876	2011-02-02 12:07:25.760876
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-02 12:07:25.789868	2011-02-02 12:07:25.789868
7	4	dk	Blurb sign up	Blurb sign up	2011-02-02 12:07:25.849913	2011-02-02 12:07:25.849913
8	4	en	Blurb sign up	Blurb sign up	2011-02-02 12:07:25.871073	2011-02-02 12:07:25.871073
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-02 12:07:25.925215	2011-02-02 12:07:25.925215
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-02 12:07:25.947082	2011-02-02 12:07:25.947082
11	6	dk	Blurb agent home	Blurb agent home	2011-02-02 12:07:25.999584	2011-02-02 12:07:25.999584
12	6	en	Blurb agent home	Blurb agent home	2011-02-02 12:07:26.024307	2011-02-02 12:07:26.024307
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-02 12:07:26.076728	2011-02-02 12:07:26.076728
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-02 12:07:26.097592	2011-02-02 12:07:26.097592
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-02 12:07:26.151367	2011-02-02 12:07:26.151367
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-02 12:07:26.172153	2011-02-02 12:07:26.172153
17	9	dk	Blurb currencies	Blurb currencies	2011-02-02 12:07:26.222492	2011-02-02 12:07:26.222492
18	9	en	Blurb currencies	Blurb currencies	2011-02-02 12:07:26.245735	2011-02-02 12:07:26.245735
19	10	dk	Blurb category home	Blurb category home	2011-02-02 12:07:26.296062	2011-02-02 12:07:26.296062
20	10	en	Blurb category home	Blurb category home	2011-02-02 12:07:26.316886	2011-02-02 12:07:26.316886
21	11	dk	Reset password	Reset password	2011-02-02 12:07:26.384509	2011-02-02 12:07:26.384509
22	11	en	Reset password	Reset password	2011-02-02 12:07:26.405299	2011-02-02 12:07:26.405299
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-02 12:07:25.58747	2011-02-02 12:07:25.632416	about_us	t	2011-02-02 12:07:25.632268
2	Article::Cms::MainPageArticle	2011-02-02 12:07:25.673828	2011-02-02 12:07:25.710623	privacy	t	2011-02-02 12:07:25.71045
3	Article::Cms::MainPageArticle	2011-02-02 12:07:25.754451	2011-02-02 12:07:25.79688	terms_conditions	t	2011-02-02 12:07:25.796762
4	Article::Cms::InterfaceContentText	2011-02-02 12:07:25.841256	2011-02-02 12:07:25.88183	blurb_sign_up	t	2011-02-02 12:07:25.881695
5	Article::Cms::InterfaceContentText	2011-02-02 12:07:25.918988	2011-02-02 12:07:25.953513	blurb_buyer_home	t	2011-02-02 12:07:25.95337
6	Article::Cms::InterfaceContentText	2011-02-02 12:07:25.990365	2011-02-02 12:07:26.031611	blurb_agent_home	t	2011-02-02 12:07:26.031464
7	Article::Cms::InterfaceContentText	2011-02-02 12:07:26.070555	2011-02-02 12:07:26.104684	blurb_purchase_manager_home	t	2011-02-02 12:07:26.104546
8	Article::Cms::InterfaceContentText	2011-02-02 12:07:26.145173	2011-02-02 12:07:26.178771	blurb_start_page_role_selection	t	2011-02-02 12:07:26.178626
9	Article::Cms::InterfaceContentText	2011-02-02 12:07:26.216214	2011-02-02 12:07:26.252287	blurb_currencies	t	2011-02-02 12:07:26.25215
10	Article::Cms::InterfaceContentText	2011-02-02 12:07:26.2898	2011-02-02 12:07:26.326395	blurb_category_home	t	2011-02-02 12:07:26.326243
11	Article::Cms::HelpPopup	2011-02-02 12:07:26.375486	2011-02-02 12:07:26.412742	reset_password	t	2011-02-02 12:07:26.412559
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY bank_accounts (id, country_id, bank_name, bank_address, iban_no, local_bank_number, swift, payment_conditions, country_default, created_at, updated_at, global_default) FROM stdin;
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-02 12:07:23.52076	2011-02-02 12:07:23.52076	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Non est reiciendis et sit blanditiis ut et.Sint ratione enim fuga ducimus et quaerat.	2011-02-02 12:07:24.125834	2011-02-02 12:07:24.125834	\N	1	2	\N	0	electronics	f	0
2	Leisure	Unde ut maiores in corporis suscipit aut voluptas earum.Hic neque possimus omnis.	2011-02-02 12:07:24.192277	2011-02-02 12:07:24.192277	\N	3	4	\N	0	leisure	f	0
3	Business	Architecto id dolor sequi nobis est.Ut vel eligendi deleniti fugit officia at laborum.	2011-02-02 12:07:24.243871	2011-02-02 12:07:25.071697	\N	5	6	\N	7	business	f	7
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
1	1	en	Non est reiciendis et sit blanditiis ut et.Sint ratione enim fuga ducimus et quaerat.	Electronics	2011-02-02 12:07:24.136997	2011-02-02 12:07:24.136997
2	1	dk	\N	Electronics	2011-02-02 12:07:24.17671	2011-02-02 12:07:24.17671
3	2	en	Unde ut maiores in corporis suscipit aut voluptas earum.Hic neque possimus omnis.	Leisure	2011-02-02 12:07:24.198199	2011-02-02 12:07:24.198199
4	2	dk	\N	Leisure	2011-02-02 12:07:24.227765	2011-02-02 12:07:24.227765
5	3	en	Architecto id dolor sequi nobis est.Ut vel eligendi deleniti fugit officia at laborum.	Business	2011-02-02 12:07:24.249213	2011-02-02 12:07:24.249213
6	3	dk	\N	Business	2011-02-02 12:07:24.276961	2011-02-02 12:07:24.276961
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-02 12:07:23.489226	2011-02-02 12:07:23.489226
2	United Kingdom	2011-02-02 12:07:23.498523	2011-02-02 12:07:23.498523
3	England129664844431268	2011-02-02 12:07:24.314326	2011-02-02 12:07:24.314326
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
1	Euro	&euro;	%u%n	t	2011-02-02 12:07:24.087455	2011-02-02 12:07:24.087455
2	PLN	&pln;	%u%n	t	2011-02-02 12:07:24.094742	2011-02-02 12:07:24.094742
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-02 12:07:23.563191	2011-02-02 12:07:23.563191
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-02 12:07:23.585845	2011-02-02 12:07:23.585845
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-02 12:07:23.611267	2011-02-02 12:07:23.611267
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-02 12:07:23.641489	2011-02-02 12:07:23.641489
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-02 12:07:23.659361	2011-02-02 12:07:23.659361
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-02 12:07:23.679918	2011-02-02 12:07:23.679918
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-02 12:07:23.700124	2011-02-02 12:07:23.700124
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-02 12:07:23.728232	2011-02-02 12:07:23.728232
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-02 12:07:23.750993	2011-02-02 12:07:23.750993
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-02 12:07:23.769716	2011-02-02 12:07:23.769716
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-02 12:07:23.793475	2011-02-02 12:07:23.793475
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-02 12:07:23.812871	2011-02-02 12:07:23.812871
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-02 12:07:23.830414	2011-02-02 12:07:23.830414
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-02 12:07:23.847737	2011-02-02 12:07:23.847737
15	8	en	<p></p>	Question	2011-02-02 12:07:23.866801	2011-02-02 12:07:23.866801
16	8	dk	<p></p>	[DK] Question	2011-02-02 12:07:23.885505	2011-02-02 12:07:23.885505
17	9	en	<p></p>	Invoice	2011-02-02 12:07:23.903258	2011-02-02 12:07:23.903258
18	9	dk	<p></p>	[DK] Invoice	2011-02-02 12:07:23.921977	2011-02-02 12:07:23.921977
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-02 12:07:23.552448	2011-02-02 12:07:23.580312
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-02 12:07:23.602087	2011-02-02 12:07:23.633371
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-02 12:07:23.653963	2011-02-02 12:07:23.672253
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-02 12:07:23.694609	2011-02-02 12:07:23.72149
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-02 12:07:23.745419	2011-02-02 12:07:23.763695
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-02 12:07:23.783837	2011-02-02 12:07:23.807373
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-02 12:07:23.825065	2011-02-02 12:07:23.842368
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-02 12:07:23.860984	2011-02-02 12:07:23.880337
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-02 12:07:23.897851	2011-02-02 12:07:23.916092
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, pkwiu, unit, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at, ean_number, details, bank_account_id) FROM stdin;
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason, accessible_from) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, header, hidden_description, description, created_at, updated_at) FROM stdin;
1	1	dk	Big deal on printers	Quia ut aut et sed ex distinctio.Quia fugiat et unde perspiciatis minima doloremque et.	Aut eius dolores alias repellat nobis non quam.Excepturi ad itaque dolores fugit possimus sunt.	2011-02-02 12:07:24.469576	2011-02-02 12:07:24.469576
2	2	dk	Drills required	Adipisci et fuga corporis.Doloremque quibusdam at modi autem tempore iusto voluptas.	Et voluptas rerum qui dolor a praesentium et iusto.Dicta animi rerum ipsam blanditiis qui nemo.	2011-02-02 12:07:24.567165	2011-02-02 12:07:24.567165
3	3	dk	Need assistance in selling a car	Rem voluptatem et quibusdam.Et corrupti nostrum cupiditate.	Neque dicta maiores tempore soluta non pariatur et eos.Optio qui omnis reprehenderit consequatur adipisci amet.	2011-02-02 12:07:24.666746	2011-02-02 12:07:24.666746
4	4	dk	Ipod shipment	Voluptas ullam ut et ea.Quisquam inventore voluptas unde accusantium ea et sed tempore.	Vel sequi assumenda quisquam quo quos et.Doloribus et recusandae non explicabo maiores.	2011-02-02 12:07:24.764769	2011-02-02 12:07:24.764769
5	5	dk	Trip to amazonia - looking for offer	Nemo id dicta est dolor aliquam.Fugiat amet ea qui pariatur magni id repellendus sunt.	Vero labore sed et.Qui dolore sit nesciunt incidunt.	2011-02-02 12:07:24.8581	2011-02-02 12:07:24.8581
6	6	dk	LCD - Huge amounts	Sint et saepe eaque nihil.Quos at dolorem est a.	Enim numquam sed omnis dignissimos.Suscipit dignissimos eum provident laudantium nesciunt.	2011-02-02 12:07:24.961957	2011-02-02 12:07:24.961957
7	7	dk	GPS receivers required	Explicabo dolor beatae dolorem in aliquam.Voluptatem laudantium amet cupiditate impedit quasi ut beatae.	Et beatae hic rerum ullam.Qui enim vero et inventore vel voluptatem ducimus qui.	2011-02-02 12:07:25.080968	2011-02-02 12:07:25.080968
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Aut eius dolores alias repellat nobis non quam.Excepturi ad itaque dolores fugit possimus sunt.	Quia ut aut et sed ex distinctio.Quia fugiat et unde perspiciatis minima doloremque et.	2	User::Agent	0	522.0	497.0	1	Hickle	Alivia Ullrich	(136)583-7140	verner@kingbode.co.uk	2011-02-02 12:07:24.417407	2011-02-02 12:07:24.417407	2011-02-07	Joanie129664844431177 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-02 12:07:24.42888	\N	\N	6749 Paucek Isle	\N	\N	Kutchfurt	42633-7169	Cheshire
2	Drills required	3	Et voluptas rerum qui dolor a praesentium et iusto.Dicta animi rerum ipsam blanditiis qui nemo.	Adipisci et fuga corporis.Doloremque quibusdam at modi autem tempore iusto voluptas.	2	User::Agent	0	562.0	193.0	1	Romaguera	Carlie Wilkinson PhD	1-553-738-1981	deontae.labadie@harris.biz	2011-02-02 12:07:24.524605	2011-02-02 12:07:24.524605	2011-02-07	Joanie129664844431177 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-02 12:07:24.532842	\N	\N	356 Nader Meadows	\N	\N	West Corenefurt	50196	County Fermanagh
3	Need assistance in selling a car	3	Neque dicta maiores tempore soluta non pariatur et eos.Optio qui omnis reprehenderit consequatur adipisci amet.	Rem voluptatem et quibusdam.Et corrupti nostrum cupiditate.	2	User::Agent	0	415.0	334.0	1	Cummerata	Zackary Dickens	153.787.8074 x7809	osbaldo_veum@hessel.ca	2011-02-02 12:07:24.621435	2011-02-02 12:07:24.621435	2011-02-07	Joanie129664844431177 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-02 12:07:24.62978	\N	\N	9032 Antwon Ford	\N	\N	New Cleora	59627-0746	Staffordshire
4	Ipod shipment	3	Vel sequi assumenda quisquam quo quos et.Doloribus et recusandae non explicabo maiores.	Voluptas ullam ut et ea.Quisquam inventore voluptas unde accusantium ea et sed tempore.	2	User::Agent	0	63.0	975.0	1	Goldner	Lurline Volkman	(894)048-1945	jermey_jerde@willmsokuneva.us	2011-02-02 12:07:24.721938	2011-02-02 12:07:24.721938	2011-02-07	Joanie129664844431177 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-02 12:07:24.730408	\N	\N	46381 Gustave Course	\N	\N	Mertiestad	48549	Suffolk
5	Trip to amazonia - looking for offer	3	Vero labore sed et.Qui dolore sit nesciunt incidunt.	Nemo id dicta est dolor aliquam.Fugiat amet ea qui pariatur magni id repellendus sunt.	2	User::Agent	0	246.0	714.0	1	Lubowitz	Jermey Dare	(610)062-2217 x9278	zachariah_lemke@bodeortiz.uk	2011-02-02 12:07:24.815134	2011-02-02 12:07:24.815134	2011-02-07	Joanie129664844431177 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-02 12:07:24.823349	\N	\N	77927 Kim Shoal	\N	\N	South Antonina	06332	Isle of Wight
6	LCD - Huge amounts	3	Enim numquam sed omnis dignissimos.Suscipit dignissimos eum provident laudantium nesciunt.	Sint et saepe eaque nihil.Quos at dolorem est a.	2	User::Agent	0	148.0	486.0	1	Beatty	Mr. Lukas Barton	(443)347-6008	johann.ortiz@dickens.biz	2011-02-02 12:07:24.910142	2011-02-02 12:07:24.910142	2011-02-07	Joanie129664844431177 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-02 12:07:24.927454	\N	\N	4650 Jovanny Turnpike	\N	\N	West Zelda	09111	Dumfries and Galloway
7	GPS receivers required	3	Et beatae hic rerum ullam.Qui enim vero et inventore vel voluptatem ducimus qui.	Explicabo dolor beatae dolorem in aliquam.Voluptatem laudantium amet cupiditate impedit quasi ut beatae.	2	User::Agent	0	748.0	491.0	1	Ohara	Christ Kessler V	1-170-362-3868	howell.murphy@spencer.co.uk	2011-02-02 12:07:25.035527	2011-02-02 12:07:25.035527	2011-02-07	Joanie129664844431177 Rosenbaum	1	t	\N	0	0	f	f	-1	1	2011-02-02 12:07:25.045531	\N	\N	315 Diamond Mountain	\N	\N	West Shaynastad	69292	East Sussex
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
1	default_payout_delay	--- 0\n	2011-02-02 12:07:23.396681	2011-02-02 12:07:23.396681
2	default_leads_per_page	--- 5\n	2011-02-02 12:07:23.406319	2011-02-02 12:07:23.406319
3	certification_level_1	--- 10\n	2011-02-02 12:07:23.41575	2011-02-02 12:07:23.41575
4	certification_level_2	--- 20\n	2011-02-02 12:07:23.425495	2011-02-02 12:07:23.425495
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-02 12:07:23.433636	2011-02-02 12:07:23.433636
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-02 12:07:23.440251	2011-02-02 12:07:23.440251
7	invoicing_seller_name	--- Fairleads\n	2011-02-02 12:07:23.447071	2011-02-02 12:07:23.447071
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-02 12:07:23.454754	2011-02-02 12:07:23.454754
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-02 12:07:23.462396	2011-02-02 12:07:23.462396
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-02 12:07:23.471261	2011-02-02 12:07:23.471261
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers, vat_number, not_charge_vat, bank_account_id, category_id) FROM stdin;
1	blazejek@gmail.com	9ffef265ccd383e15a4882084480b0d0ef9f5f53200544ab53edea7b33b3d6d62437a3c1ef2269f87eea4cb603ecbf88d89865dc8ef888173fa8327d270c1856	0DS4ENJzzjshXqgNRRtC	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 12:07:24.072203	2011-02-02 12:07:23.978482	\N	2011-02-02 12:07:23.986946	2011-02-02 12:07:24.072738	1	Layne	Kuhic	904.214.5545 x209	root	Tremaine Throughway	North Cordelia	83195-1829	Strathclyde	1	\N	\N	\N	\N	0	\N	\N	\N	\N	PdoTJRB9Qwk52AcNaoeDF1zyhXLOJ76roYH4CbMBPAZrY44pWbW8BhjaJsOaZP	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
2	agent@nbs.com	7335125d6297e4e71101ffd93427026f1d298278e089c4e7fb3eb8f909efd7bcab826c1d78f6d91b8729fe1381856b6d686e8124d4de2d00590616b7737a27f6	_lntHeza-jT1Lmg_wP-A	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 12:07:24.362818	2011-02-02 12:07:24.327542	\N	2011-02-02 12:07:24.330903	2011-02-02 12:07:24.363362	2	Joanie129664844431177	Rosenbaum	(162)906-2130	Winston Raynor129664844431149	Bogan Creek	Wuckertfurt	92161	Cornwall	1	\N	0	\N	\N	0	\N	\N	\N	\N	ILWgbcksIeZ5r43NYtH6tzIx72V1hTdyiVK1f1GWfsIcRf0MdN0Dqb6kub4aDc	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
3	admin@nbs.com	8e0d02a3dd312fcedcd90f7621189d22587106adca1b192e8e136e70d6a4d219ba2c3abe363cfb20409cf92e6a9f217ccf72738c8af603ef1e220ddc2d1ca807	Jgby89cwW38LcC3sAI42	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 12:07:25.216732	2011-02-02 12:07:25.180141	\N	2011-02-02 12:07:25.183684	2011-02-02 12:07:25.217728	1	Madalyn	Weissnat	693.050.1857 x0213	Lucie Mosciski129664844516959	Dortha Plaza	Heidenreichton	58302	Powys	1	\N	\N	\N	\N	0	\N	\N	\N	\N	BlSJhQvHu7okxykzrKm5FTDJ7kwwcdbH4BVvE6Yyr1XAE1ZXb7oytzEzubnTBD	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
4	buyer@nbs.com	2eb872e11206ce81b7b3eff82a71ed82f51c28fbd4cabc4fb98a19b2b16cd6b5bc3021742c2e06cfa91fc825cc26010b09f9647d8e041f9e8c63f006c49a1fd3	DhWcsF3gFE8AoDKOPipr	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 12:07:25.318834	2011-02-02 12:07:25.279759	\N	2011-02-02 12:07:25.282728	2011-02-02 12:07:25.319559	48	Amira	Stiedemann	789-213-5696	Alivia Hettinger Sr.129664844526308	Furman Ridges	East Duncan	67050	Mid Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	MfUVKDkPafjBhSqldFPQVcxlacAqIwBOfoXzSYJ4OvtGxTpShjj5J3V0CCiTQb	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
5	leaduser@nbs.com	3fe57859f74c0796634bfcce6b92d84aea6947b49e66b9e31ef44a450b07626bb89342f311b1c2ddbc0946e6b9d184590e7ffc0bca990f225b2576c931848445	iY2j16bjbrvUt00JYiSp	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 12:07:25.416515	2011-02-02 12:07:25.374959	\N	2011-02-02 12:07:25.378552	2011-02-02 12:07:25.446847	64	Francis	Heidenreich	121-281-1974 x473	Della Beier129664844536468	Shanie Well	O'Connermouth	06740	Bedfordshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	pVwho8lnhFXILkCMSuSL5Gu0fGwJSUmEthKXZJfQGcmBk5U3lVQPM6eBpMspVu	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

