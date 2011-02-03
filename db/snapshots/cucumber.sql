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
-- Name: lead_template_field_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_field_translations_id_seq', 1, false);


--
-- Name: lead_template_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_fields_id_seq', 1, false);


--
-- Name: lead_template_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_translations_id_seq', 1, false);


--
-- Name: lead_template_value_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_value_translations_id_seq', 1, false);


--
-- Name: lead_template_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_values_id_seq', 1, false);


--
-- Name: lead_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_templates_id_seq', 1, false);


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
1	1	dk	About us	About us	2011-02-03 09:07:58.393919	2011-02-03 09:07:58.393919
2	1	en	About us	About us	2011-02-03 09:07:58.407773	2011-02-03 09:07:58.407773
3	2	dk	Privacy	Privacy	2011-02-03 09:07:58.438146	2011-02-03 09:07:58.438146
4	2	en	Privacy	Privacy	2011-02-03 09:07:58.449276	2011-02-03 09:07:58.449276
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-03 09:07:58.480555	2011-02-03 09:07:58.480555
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-03 09:07:58.491846	2011-02-03 09:07:58.491846
7	4	dk	Blurb sign up	Blurb sign up	2011-02-03 09:07:58.519117	2011-02-03 09:07:58.519117
8	4	en	Blurb sign up	Blurb sign up	2011-02-03 09:07:58.530215	2011-02-03 09:07:58.530215
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-03 09:07:58.556971	2011-02-03 09:07:58.556971
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-03 09:07:58.567795	2011-02-03 09:07:58.567795
11	6	dk	Blurb agent home	Blurb agent home	2011-02-03 09:07:58.595989	2011-02-03 09:07:58.595989
12	6	en	Blurb agent home	Blurb agent home	2011-02-03 09:07:58.607259	2011-02-03 09:07:58.607259
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-03 09:07:58.636425	2011-02-03 09:07:58.636425
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-03 09:07:58.647859	2011-02-03 09:07:58.647859
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-03 09:07:58.67652	2011-02-03 09:07:58.67652
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-03 09:07:58.829183	2011-02-03 09:07:58.829183
17	9	dk	Blurb currencies	Blurb currencies	2011-02-03 09:07:58.85658	2011-02-03 09:07:58.85658
18	9	en	Blurb currencies	Blurb currencies	2011-02-03 09:07:58.868042	2011-02-03 09:07:58.868042
19	10	dk	Reset password	Reset password	2011-02-03 09:07:58.896334	2011-02-03 09:07:58.896334
20	10	en	Reset password	Reset password	2011-02-03 09:07:58.907716	2011-02-03 09:07:58.907716
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-02-03 09:07:58.384869	2011-02-03 09:07:58.410515	about_us	0	t	2011-02-03 09:07:58.410442
2	Article::Cms	2011-02-03 09:07:58.43414	2011-02-03 09:07:58.451998	privacy	0	t	2011-02-03 09:07:58.451925
3	Article::Cms	2011-02-03 09:07:58.476492	2011-02-03 09:07:58.494581	terms_conditions	0	t	2011-02-03 09:07:58.494505
4	Article::Cms	2011-02-03 09:07:58.515306	2011-02-03 09:07:58.53291	blurb_sign_up	1	t	2011-02-03 09:07:58.532839
5	Article::Cms	2011-02-03 09:07:58.553097	2011-02-03 09:07:58.570573	blurb_buyer_home	1	t	2011-02-03 09:07:58.570499
6	Article::Cms	2011-02-03 09:07:58.591796	2011-02-03 09:07:58.610092	blurb_agent_home	1	t	2011-02-03 09:07:58.610017
7	Article::Cms	2011-02-03 09:07:58.631818	2011-02-03 09:07:58.650766	blurb_purchase_manager_home	1	t	2011-02-03 09:07:58.650695
8	Article::Cms	2011-02-03 09:07:58.672289	2011-02-03 09:07:58.83194	blurb_start_page_role_selection	1	t	2011-02-03 09:07:58.831869
9	Article::Cms	2011-02-03 09:07:58.852597	2011-02-03 09:07:58.871392	blurb_currencies	1	t	2011-02-03 09:07:58.871312
10	Article::Cms	2011-02-03 09:07:58.892345	2011-02-03 09:07:58.910424	reset_password	2	t	2011-02-03 09:07:58.910351
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
1	Electronics	Voluptatum voluptatem adipisci facilis et quia doloribus.Est voluptatem quisquam tenetur perferendis sapiente eveniet iure omnis.	2011-02-03 09:07:56.877469	2011-02-03 09:07:56.877469	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Et reprehenderit veritatis eius.Libero ipsam aliquid sint dolor assumenda.	2011-02-03 09:07:57.048664	2011-02-03 09:07:57.048664	\N	3	4	\N	0	2-leisure	f	0
3	Business	Similique cum eos illo repellendus mollitia.Velit dolores impedit nostrum eos consequatur.	2011-02-03 09:07:57.080806	2011-02-03 09:07:57.794679	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Voluptatum voluptatem adipisci facilis et quia doloribus.Est voluptatem quisquam tenetur perferendis sapiente eveniet iure omnis.	Electronics	2011-02-03 09:07:56.886939	2011-02-03 09:07:56.886939
2	1	dk	\N	Electronics	2011-02-03 09:07:57.039286	2011-02-03 09:07:57.039286
3	2	en	Et reprehenderit veritatis eius.Libero ipsam aliquid sint dolor assumenda.	Leisure	2011-02-03 09:07:57.052842	2011-02-03 09:07:57.052842
4	2	dk	\N	Leisure	2011-02-03 09:07:57.071591	2011-02-03 09:07:57.071591
5	3	en	Similique cum eos illo repellendus mollitia.Velit dolores impedit nostrum eos consequatur.	Business	2011-02-03 09:07:57.085193	2011-02-03 09:07:57.085193
6	3	dk	\N	Business	2011-02-03 09:07:57.104091	2011-02-03 09:07:57.104091
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-03 09:07:56.376156	2011-02-03 09:07:56.376156
2	United Kingdom	2011-02-03 09:07:56.380948	2011-02-03 09:07:56.380948
3	Scotland129672407713394	2011-02-03 09:07:57.135235	2011-02-03 09:07:57.135235
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
1	Euro	&euro;	%u%n	t	2011-02-03 09:07:56.855917	2011-02-03 09:07:56.855917
2	PLN	&pln;	%u%n	t	2011-02-03 09:07:56.860237	2011-02-03 09:07:56.860237
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-03 09:07:56.532331	2011-02-03 09:07:56.532331
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-02-03 09:07:56.547224	2011-02-03 09:07:56.547224
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-03 09:07:56.559605	2011-02-03 09:07:56.559605
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-02-03 09:07:56.571606	2011-02-03 09:07:56.571606
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-03 09:07:56.584018	2011-02-03 09:07:56.584018
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-02-03 09:07:56.596369	2011-02-03 09:07:56.596369
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-02-03 09:07:56.608682	2011-02-03 09:07:56.608682
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-02-03 09:07:56.620754	2011-02-03 09:07:56.620754
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-03 09:07:56.634302	2011-02-03 09:07:56.634302
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-02-03 09:07:56.64664	2011-02-03 09:07:56.64664
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-03 09:07:56.659636	2011-02-03 09:07:56.659636
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-02-03 09:07:56.672252	2011-02-03 09:07:56.672252
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-03 09:07:56.685251	2011-02-03 09:07:56.685251
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-02-03 09:07:56.697841	2011-02-03 09:07:56.697841
15	8	en	Question	<p></p>	2011-02-03 09:07:56.710945	2011-02-03 09:07:56.710945
16	8	dk	[DK] Question	<p></p>	2011-02-03 09:07:56.723499	2011-02-03 09:07:56.723499
17	9	en	Invoice	<p></p>	2011-02-03 09:07:56.736265	2011-02-03 09:07:56.736265
18	9	dk	[DK] Invoice	<p></p>	2011-02-03 09:07:56.748711	2011-02-03 09:07:56.748711
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-03 09:07:56.398398	2011-02-03 09:07:56.543056
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-03 09:07:56.555179	2011-02-03 09:07:56.567536
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-03 09:07:56.579627	2011-02-03 09:07:56.592241
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-03 09:07:56.604356	2011-02-03 09:07:56.616742
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-03 09:07:56.628868	2011-02-03 09:07:56.64237
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-03 09:07:56.654876	2011-02-03 09:07:56.667959
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-03 09:07:56.680622	2011-02-03 09:07:56.693542
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-03 09:07:56.706183	2011-02-03 09:07:56.71911
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-03 09:07:56.731691	2011-02-03 09:07:56.744488
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
-- Data for Name: lead_template_field_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_field_translations (id, lead_template_field_id, locale, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_template_fields; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_fields (id, lead_template_id, name, field_type, is_hidden, created_at, updated_at, is_mandatory) FROM stdin;
\.


--
-- Data for Name: lead_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_translations (id, lead_template_id, locale, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_template_value_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_value_translations (id, lead_template_value_id, locale, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_template_values; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_values (id, lead_template_field_id, lead_id, field_type, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_templates (id, category_id, name, is_active, is_mandatory, creator_id, creator_type, created_at, updated_at, is_global) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
1	1	dk	Quas quam eaque quaerat iusto maiores.Facilis iste ea rerum nulla aspernatur quia laudantium.	Officia nisi et eligendi officiis.Adipisci eaque quia excepturi qui consequatur.	Big deal on printers	2011-02-03 09:07:57.241363	2011-02-03 09:07:57.241363
2	2	dk	Voluptas quia molestiae numquam temporibus.Quos sit nesciunt rerum autem corporis.	Quaerat officiis iste consectetur ducimus laudantium.Consectetur animi earum inventore omnis ea.	Drills required	2011-02-03 09:07:57.312726	2011-02-03 09:07:57.312726
3	3	dk	Mollitia voluptatem atque maiores ex et alias eum voluptatibus.Voluptas amet enim eius dolores et inventore est.	Id aperiam dolor dolorum quis error.A doloribus sunt occaecati culpa ipsum molestiae.	Need assistance in selling a car	2011-02-03 09:07:57.51121	2011-02-03 09:07:57.51121
4	4	dk	Quaerat sit et accusantium eos minima nemo.A sequi quia impedit.	Harum numquam nulla dolor voluptatum expedita maxime architecto.Quae necessitatibus similique sunt non laudantium.	Ipod shipment	2011-02-03 09:07:57.579904	2011-02-03 09:07:57.579904
5	5	dk	Cupiditate harum at quo.Dolorum accusamus ut et.	Et rerum est quo quam error est explicabo.Consequatur reiciendis maxime debitis aut cumque omnis et sit.	Trip to amazonia - looking for offer	2011-02-03 09:07:57.649997	2011-02-03 09:07:57.649997
6	6	dk	Omnis est nihil delectus quae.Sit iure dolorem itaque.	Omnis vero saepe quo et distinctio ut dolor.Qui consequatur nihil minus laudantium quis dolores vero.	LCD - Huge amounts	2011-02-03 09:07:57.720147	2011-02-03 09:07:57.720147
7	7	dk	Veniam unde a officia doloribus sed expedita accusamus.Maiores veniam ullam et.	Temporibus neque iure earum.Aut nihil recusandae fuga cupiditate quidem aut consequatur qui.	GPS receivers required	2011-02-03 09:07:57.801378	2011-02-03 09:07:57.801378
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Quas quam eaque quaerat iusto maiores.Facilis iste ea rerum nulla aspernatur quia laudantium.	Officia nisi et eligendi officiis.Adipisci eaque quia excepturi qui consequatur.	2	User::Agent	0	503.0	176.0	1	Pacocha	Ines Reichert	(974)214-3193	dena_mertz@kertzmann.co.uk	2011-02-03 09:07:57.20008	2011-02-03 09:07:57.20008	2011-02-08	Bradly129672407713254 Zieme	1	t	\N	0	0	f	f	-1	1	2011-02-03 09:07:57.210243	\N	\N	2175 Emmett Key	\N	\N	Lake Irvingfurt	71122	County Armagh	\N	\N	\N	\N	t
2	Drills required	3	Voluptas quia molestiae numquam temporibus.Quos sit nesciunt rerum autem corporis.	Quaerat officiis iste consectetur ducimus laudantium.Consectetur animi earum inventore omnis ea.	2	User::Agent	0	736.0	152.0	1	Dickinsonluettgen	Adolph Mayer	1-744-285-1868	isaiah@cole.co.uk	2011-02-03 09:07:57.280142	2011-02-03 09:07:57.280142	2011-02-08	Bradly129672407713254 Zieme	1	t	\N	0	0	f	f	-1	1	2011-02-03 09:07:57.287204	\N	\N	93259 Heaney Hill	\N	\N	Lake Joyce	27986	Tayside	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Mollitia voluptatem atque maiores ex et alias eum voluptatibus.Voluptas amet enim eius dolores et inventore est.	Id aperiam dolor dolorum quis error.A doloribus sunt occaecati culpa ipsum molestiae.	2	User::Agent	0	203.0	645.0	1	Walterbartoletti	Anastacio Cole	1-012-811-8911	santiago@senger.ca	2011-02-03 09:07:57.347152	2011-02-03 09:07:57.347152	2011-02-08	Bradly129672407713254 Zieme	1	t	\N	0	0	f	f	-1	1	2011-02-03 09:07:57.35415	\N	\N	036 Fritsch Bypass	\N	\N	Langburgh	17673	County Londonderry	\N	\N	\N	\N	t
4	Ipod shipment	3	Quaerat sit et accusantium eos minima nemo.A sequi quia impedit.	Harum numquam nulla dolor voluptatum expedita maxime architecto.Quae necessitatibus similique sunt non laudantium.	2	User::Agent	0	976.0	970.0	1	Haag	Millie Goodwin DVM	095-988-7080	sheldon@casper.co.uk	2011-02-03 09:07:57.547164	2011-02-03 09:07:57.547164	2011-02-08	Bradly129672407713254 Zieme	1	t	\N	0	0	f	f	-1	1	2011-02-03 09:07:57.554056	\N	\N	76821 Lyric Landing	\N	\N	South Pearlinestad	25709-1873	West Glamorgan	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Cupiditate harum at quo.Dolorum accusamus ut et.	Et rerum est quo quam error est explicabo.Consequatur reiciendis maxime debitis aut cumque omnis et sit.	2	User::Agent	0	85.0	90.0	1	Millsmckenzie	Eileen Mueller	491.368.0522 x442	tracey@koeppthompson.ca	2011-02-03 09:07:57.615811	2011-02-03 09:07:57.615811	2011-02-08	Bradly129672407713254 Zieme	1	t	\N	0	0	f	f	-1	1	2011-02-03 09:07:57.622747	\N	\N	8356 Corkery Land	\N	\N	Schusterton	79553-1135	Greater Manchester	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Omnis est nihil delectus quae.Sit iure dolorem itaque.	Omnis vero saepe quo et distinctio ut dolor.Qui consequatur nihil minus laudantium quis dolores vero.	2	User::Agent	0	314.0	38.0	1	Fahey	Dustin Medhurst	539-010-2373	coralie_kautzer@leschgleichner.com	2011-02-03 09:07:57.685719	2011-02-03 09:07:57.685719	2011-02-08	Bradly129672407713254 Zieme	1	t	\N	0	0	f	f	-1	1	2011-02-03 09:07:57.69253	\N	\N	344 Liliane Lakes	\N	\N	South Raphael	64404-1681	Lincolnshire	\N	\N	\N	\N	t
7	GPS receivers required	3	Veniam unde a officia doloribus sed expedita accusamus.Maiores veniam ullam et.	Temporibus neque iure earum.Aut nihil recusandae fuga cupiditate quidem aut consequatur qui.	2	User::Agent	0	84.0	658.0	1	Streich	Gunnar Heller	1-786-294-0563 x14246	garnett.corkery@baileystiedemann.com	2011-02-03 09:07:57.767549	2011-02-03 09:07:57.767549	2011-02-08	Bradly129672407713254 Zieme	1	t	\N	0	0	f	f	-1	1	2011-02-03 09:07:57.775699	\N	\N	03814 Runolfsson Haven	\N	\N	South Arthurside	28618-8999	County Fermanagh	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-03 09:07:56.339684	2011-02-03 09:07:56.339684
2	default_leads_per_page	--- 5\n	2011-02-03 09:07:56.345373	2011-02-03 09:07:56.345373
3	certification_level_1	--- 10\n	2011-02-03 09:07:56.349223	2011-02-03 09:07:56.349223
4	certification_level_2	--- 20\n	2011-02-03 09:07:56.352344	2011-02-03 09:07:56.352344
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-03 09:07:56.354663	2011-02-03 09:07:56.354663
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-03 09:07:56.35676	2011-02-03 09:07:56.35676
7	invoicing_seller_name	--- Fairleads\n	2011-02-03 09:07:56.358948	2011-02-03 09:07:56.358948
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-03 09:07:56.361215	2011-02-03 09:07:56.361215
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-03 09:07:56.363466	2011-02-03 09:07:56.363466
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-02-03 09:07:56.365593	2011-02-03 09:07:56.365593
11	invoicing_default_vat_rate	--- 0.15\n	2011-02-03 09:07:56.367648	2011-02-03 09:07:56.367648
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
1	blazejek@gmail.com	35fdb347fa823550d645e7aba3d2eb069db3cb17bedf72ba9bd04e5f623f05c714572b59729f03f4554b4241867dff075bb6672ed6907f52974ebba57a0826c5	7HOqwx1Mj3sS3e_4QLio	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-03 09:07:56.845992	2011-02-03 09:07:56.787501	\N	2011-02-03 09:07:56.787723	2011-02-03 09:07:56.846294	1	Alfonso	Stanton	(953)567-6295 x655	root	Strosin Views	South Herminioview	66184-6784	Fife	1	\N	\N	\N	\N	0	\N	\N	\N	\N	AvAMFpqO8fnxVgiKI2rVQkvGp6K2Uuahynh1uK8mJvLmeQ8tXXNmaWAkjfFvOV	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	f1869a71b109d8df60316b78e1ee56c14f69b85cd7ffe1f3e54516b2a2108bf6b4cd655a518e609f30292eca79e7f94f6cd11fa0d65a761481e3c824704ef4e2	yDbrLH30m7buq6wPeRIO	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-03 09:07:57.162315	2011-02-03 09:07:57.140671	\N	2011-02-03 09:07:57.140885	2011-02-03 09:07:57.162608	2	Bradly129672407713254	Zieme	601.036.3547 x8726	Janice Harvey129672407713199	Kaci Vista	Susanaburgh	60678	Gloucestershire	3	\N	0	\N	\N	0	\N	\N	\N	\N	9vzSDNlxW8TiiyIjkSOLawBTbsnEh51SUqHwxNP1Bnwu8ONaFGX71ouNknkBuC	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	5cc37c166218a91e8c5a2d8160fb2482f5fd7775c21c80fd8c132fa1d7ebf8df6bdf828d981d78b4718130cbe2b7c481331e283cea67dc9cbfac3f58eabb05ea	hiq0kgaxmjmCp0peHj00	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-03 09:07:58.042394	2011-02-03 09:07:58.015718	\N	2011-02-03 09:07:58.016055	2011-02-03 09:07:58.0429	1	Hattie	Grant	676-561-4655 x228	Orin Anderson12967240780083	Cecilia Trail	Lake Edwinashire	02821-2295	Clwyd	1	\N	\N	\N	\N	0	\N	\N	\N	\N	4rZ4a5YWSiXx5SOPbTp6Rvhz3m8k1XuMrP0BVL8d5nhlGMeGxiLgCODXEZ7XtG	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	6b33514a1937af500a8bc20883d2836e8bbdfe2ef43a717c5352614a08785751a21f12b709520280d308b971c95e1c668ffd8949fc72e4521aefaf421494fc7e	AI3S4-pTRqaG_fgPSwTL	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-03 09:07:58.106092	2011-02-03 09:07:58.084402	\N	2011-02-03 09:07:58.084654	2011-02-03 09:07:58.106409	48	Kameron	Skiles	(308)444-9905 x8725	Vern Daugherty129672407807952	Murazik Pine	Zechariahborough	28115	Dorset	1	\N	\N	\N	\N	0	\N	\N	\N	\N	JelH9wetvw5tL5rlEoV2UOgJJhxNu3PHE34w0xfYIUOEyYSUV69Iv5Gy5tk7Qb	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	4573594391e06a3a2994bb37aadabf16ae1c699c6ade138e17d90266b2a6d6dc014c56da33c37d9331e01b176ee4e801ddc832b4ea544467bdaf16ebec00c202	yOn14Hx0SvHAztHTQzTe	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-03 09:07:58.162182	2011-02-03 09:07:58.140498	\N	2011-02-03 09:07:58.140725	2011-02-03 09:07:58.177281	64	Nellie	Jacobi	348-413-0763 x932	Stefan Stehr129672407813565	Corine Parkways	Dorotheamouth	95312	Derbyshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	HmSVXVRZC6EEXRUJQbXD8EMtn6X7vf4YK0XImIpJCyG9BFluvuxYuz3Ah1JkHe	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

