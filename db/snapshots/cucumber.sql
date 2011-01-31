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
1	1	dk	About us	About us	2011-01-31 10:59:38.374582	2011-01-31 10:59:38.374582
2	1	en	About us	About us	2011-01-31 10:59:38.388259	2011-01-31 10:59:38.388259
3	2	dk	Privacy	Privacy	2011-01-31 10:59:38.546412	2011-01-31 10:59:38.546412
4	2	en	Privacy	Privacy	2011-01-31 10:59:38.557783	2011-01-31 10:59:38.557783
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-31 10:59:38.587551	2011-01-31 10:59:38.587551
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-31 10:59:38.598522	2011-01-31 10:59:38.598522
7	4	dk	Blurb sign up	Blurb sign up	2011-01-31 10:59:38.62556	2011-01-31 10:59:38.62556
8	4	en	Blurb sign up	Blurb sign up	2011-01-31 10:59:38.637286	2011-01-31 10:59:38.637286
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-31 10:59:38.665012	2011-01-31 10:59:38.665012
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-31 10:59:38.67629	2011-01-31 10:59:38.67629
11	6	dk	Blurb agent home	Blurb agent home	2011-01-31 10:59:38.703934	2011-01-31 10:59:38.703934
12	6	en	Blurb agent home	Blurb agent home	2011-01-31 10:59:38.715338	2011-01-31 10:59:38.715338
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-31 10:59:38.744483	2011-01-31 10:59:38.744483
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-31 10:59:38.755618	2011-01-31 10:59:38.755618
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-31 10:59:38.783938	2011-01-31 10:59:38.783938
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-31 10:59:38.795906	2011-01-31 10:59:38.795906
17	9	dk	Blurb currencies	Blurb currencies	2011-01-31 10:59:38.825326	2011-01-31 10:59:38.825326
18	9	en	Blurb currencies	Blurb currencies	2011-01-31 10:59:38.837176	2011-01-31 10:59:38.837176
19	10	dk	Reset password	Reset password	2011-01-31 10:59:38.866128	2011-01-31 10:59:38.866128
20	10	en	Reset password	Reset password	2011-01-31 10:59:39.021673	2011-01-31 10:59:39.021673
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-31 10:59:38.366196	2011-01-31 10:59:38.391026	about_us	0	t	2011-01-31 10:59:38.39095
2	Article::Cms	2011-01-31 10:59:38.542425	2011-01-31 10:59:38.56054	privacy	0	t	2011-01-31 10:59:38.560462
3	Article::Cms	2011-01-31 10:59:38.583748	2011-01-31 10:59:38.601242	terms_conditions	0	t	2011-01-31 10:59:38.601169
4	Article::Cms	2011-01-31 10:59:38.621499	2011-01-31 10:59:38.640013	blurb_sign_up	1	t	2011-01-31 10:59:38.639938
5	Article::Cms	2011-01-31 10:59:38.661005	2011-01-31 10:59:38.679119	blurb_buyer_home	1	t	2011-01-31 10:59:38.679043
6	Article::Cms	2011-01-31 10:59:38.7	2011-01-31 10:59:38.718236	blurb_agent_home	1	t	2011-01-31 10:59:38.718165
7	Article::Cms	2011-01-31 10:59:38.740415	2011-01-31 10:59:38.758573	blurb_purchase_manager_home	1	t	2011-01-31 10:59:38.758494
8	Article::Cms	2011-01-31 10:59:38.779788	2011-01-31 10:59:38.798951	blurb_start_page_role_selection	1	t	2011-01-31 10:59:38.798867
9	Article::Cms	2011-01-31 10:59:38.821291	2011-01-31 10:59:38.840497	blurb_currencies	1	t	2011-01-31 10:59:38.840417
10	Article::Cms	2011-01-31 10:59:38.861861	2011-01-31 10:59:39.024522	reset_password	2	t	2011-01-31 10:59:39.024445
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
1	Electronics	Earum ullam et reprehenderit cumque iusto.Nam incidunt sed ducimus et dolor omnis unde.	2011-01-31 10:59:37.035827	2011-01-31 10:59:37.035827	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Atque sint cum et laudantium.Earum error illum nisi et et.	2011-01-31 10:59:37.079787	2011-01-31 10:59:37.079787	\N	3	4	\N	0	2-leisure	f	0
3	Business	Ut officiis error distinctio eaque.Dolore sed sed maxime expedita dolores.	2011-01-31 10:59:37.112653	2011-01-31 10:59:37.922058	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Earum ullam et reprehenderit cumque iusto.Nam incidunt sed ducimus et dolor omnis unde.	Electronics	2011-01-31 10:59:37.044975	2011-01-31 10:59:37.044975
2	1	dk	\N	Electronics	2011-01-31 10:59:37.070258	2011-01-31 10:59:37.070258
3	2	en	Atque sint cum et laudantium.Earum error illum nisi et et.	Leisure	2011-01-31 10:59:37.084124	2011-01-31 10:59:37.084124
4	2	dk	\N	Leisure	2011-01-31 10:59:37.103322	2011-01-31 10:59:37.103322
5	3	en	Ut officiis error distinctio eaque.Dolore sed sed maxime expedita dolores.	Business	2011-01-31 10:59:37.117088	2011-01-31 10:59:37.117088
6	3	dk	\N	Business	2011-01-31 10:59:37.136389	2011-01-31 10:59:37.136389
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-31 10:59:36.492487	2011-01-31 10:59:36.492487
2	United Kingdom	2011-01-31 10:59:36.49719	2011-01-31 10:59:36.49719
3	Wales129647157728995	2011-01-31 10:59:37.2913	2011-01-31 10:59:37.2913
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
1	Euro	&euro;	%u%n	t	2011-01-31 10:59:37.014687	2011-01-31 10:59:37.014687
2	PLN	&pln;	%u%n	t	2011-01-31 10:59:37.019073	2011-01-31 10:59:37.019073
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-31 10:59:36.524198	2011-01-31 10:59:36.524198
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-31 10:59:36.538771	2011-01-31 10:59:36.538771
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-31 10:59:36.551347	2011-01-31 10:59:36.551347
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-31 10:59:36.563896	2011-01-31 10:59:36.563896
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-31 10:59:36.576521	2011-01-31 10:59:36.576521
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-31 10:59:36.58872	2011-01-31 10:59:36.58872
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-31 10:59:36.601586	2011-01-31 10:59:36.601586
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-31 10:59:36.739007	2011-01-31 10:59:36.739007
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-31 10:59:36.751249	2011-01-31 10:59:36.751249
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-31 10:59:36.763325	2011-01-31 10:59:36.763325
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-31 10:59:36.775527	2011-01-31 10:59:36.775527
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-31 10:59:36.787498	2011-01-31 10:59:36.787498
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-31 10:59:36.799953	2011-01-31 10:59:36.799953
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-31 10:59:36.812769	2011-01-31 10:59:36.812769
15	8	en	Question	<p></p>	2011-01-31 10:59:36.824995	2011-01-31 10:59:36.824995
16	8	dk	[DK] Question	<p></p>	2011-01-31 10:59:36.837454	2011-01-31 10:59:36.837454
17	9	en	Invoice	<p></p>	2011-01-31 10:59:36.849922	2011-01-31 10:59:36.849922
18	9	dk	[DK] Invoice	<p></p>	2011-01-31 10:59:36.862421	2011-01-31 10:59:36.862421
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-31 10:59:36.515274	2011-01-31 10:59:36.534635
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-31 10:59:36.546748	2011-01-31 10:59:36.559664
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-31 10:59:36.572017	2011-01-31 10:59:36.584603
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-31 10:59:36.597063	2011-01-31 10:59:36.609617
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-31 10:59:36.746911	2011-01-31 10:59:36.759293
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-31 10:59:36.77108	2011-01-31 10:59:36.783436
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-31 10:59:36.795462	2011-01-31 10:59:36.808151
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-31 10:59:36.820684	2011-01-31 10:59:36.832763
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-31 10:59:36.845638	2011-01-31 10:59:36.858084
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

COPY lead_template_fields (id, lead_template_id, name, field_type, is_hidden, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_translations (id, lead_template_id, locale, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_template_values; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_template_values (id, lead_template_field_id, lead_id, name, field_type, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_templates (id, category_id, name, is_active, is_mandatory, creator_id, creator_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
1	1	dk	Quis id aliquid porro ipsam dignissimos dolorem sunt praesentium.Unde ex qui omnis similique.	Aut doloribus illo rerum ex illum rem molestias rerum.Sapiente autem doloribus aut vero veniam alias.	Big deal on printers	2011-01-31 10:59:37.393809	2011-01-31 10:59:37.393809
2	2	dk	Consectetur eaque sint asperiores non quis fugit.Et ipsam odio dolore in culpa eos.	Eum adipisci maiores assumenda suscipit delectus.Velit unde maiores quia rerum soluta dolor excepturi.	Drills required	2011-01-31 10:59:37.465053	2011-01-31 10:59:37.465053
3	3	dk	Perspiciatis et est asperiores consequatur beatae omnis.Aut non sunt nihil.	Totam ad sed architecto voluptatibus omnis consequatur ducimus ratione.Dolorum illum quia quia velit corrupti.	Need assistance in selling a car	2011-01-31 10:59:37.533367	2011-01-31 10:59:37.533367
4	4	dk	Labore ratione soluta earum quam.Ut harum quisquam qui.	Qui ut expedita et rerum explicabo impedit dolorem.Laudantium et doloribus vero sunt ratione voluptas itaque quia.	Ipod shipment	2011-01-31 10:59:37.599073	2011-01-31 10:59:37.599073
5	5	dk	Perferendis et occaecati placeat.Dignissimos ratione modi quas quos sunt officia non odit.	Suscipit asperiores adipisci occaecati in quia.Qui officia quia autem dolor velit ut harum enim.	Trip to amazonia - looking for offer	2011-01-31 10:59:37.794982	2011-01-31 10:59:37.794982
6	6	dk	Ipsam id doloremque optio voluptatem fugit porro dolores.Velit unde eligendi porro quaerat quos earum eaque.	Vel id quia fugiat nostrum laboriosam dolorem.Excepturi tenetur eos tempore.	LCD - Huge amounts	2011-01-31 10:59:37.862231	2011-01-31 10:59:37.862231
7	7	dk	Et consequatur iste nam nemo.Nulla fugit enim unde hic.	Rerum magnam in nesciunt pariatur minus praesentium debitis non.Sit eum alias qui qui.	GPS receivers required	2011-01-31 10:59:37.928796	2011-01-31 10:59:37.928796
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Quis id aliquid porro ipsam dignissimos dolorem sunt praesentium.Unde ex qui omnis similique.	Aut doloribus illo rerum ex illum rem molestias rerum.Sapiente autem doloribus aut vero veniam alias.	2	User::Agent	0	634.0	98.0	1	Darebecker	Randy Casper III	(216)656-7705	eduardo_daniel@harris.uk	2011-01-31 10:59:37.353152	2011-01-31 10:59:37.353152	2011-02-05	Clovis129647157728917 Botsford	1	t	\N	0	0	f	f	-1	1	2011-01-31 10:59:37.362837	\N	\N	49561 Lennie Groves	\N	\N	Irvingmouth	15859	Surrey
2	Drills required	3	Consectetur eaque sint asperiores non quis fugit.Et ipsam odio dolore in culpa eos.	Eum adipisci maiores assumenda suscipit delectus.Velit unde maiores quia rerum soluta dolor excepturi.	2	User::Agent	0	435.0	677.0	1	Stehrjacobs	Leland O'Kon	(474)206-2124 x5690	mallory.deckow@blick.com	2011-01-31 10:59:37.432087	2011-01-31 10:59:37.432087	2011-02-05	Clovis129647157728917 Botsford	1	t	\N	0	0	f	f	-1	1	2011-01-31 10:59:37.439403	\N	\N	06762 Carroll Street	\N	\N	Fridaton	50929-1091	South Glamorgan
3	Need assistance in selling a car	3	Perspiciatis et est asperiores consequatur beatae omnis.Aut non sunt nihil.	Totam ad sed architecto voluptatibus omnis consequatur ducimus ratione.Dolorum illum quia quia velit corrupti.	2	User::Agent	0	357.0	90.0	1	Romaguera	Sibyl Herman	(430)447-8912	aiyana.pacocha@boylekuphal.info	2011-01-31 10:59:37.500128	2011-01-31 10:59:37.500128	2011-02-05	Clovis129647157728917 Botsford	1	t	\N	0	0	f	f	-1	1	2011-01-31 10:59:37.5068	\N	\N	862 Quitzon Cliff	\N	\N	Lake Joelleton	46814-0516	Hampshire
4	Ipod shipment	3	Labore ratione soluta earum quam.Ut harum quisquam qui.	Qui ut expedita et rerum explicabo impedit dolorem.Laudantium et doloribus vero sunt ratione voluptas itaque quia.	2	User::Agent	0	631.0	330.0	1	Dietrichrunolfsson	Domingo Shields	261.580.7322 x0965	hulda@kuhiccollins.ca	2011-01-31 10:59:37.567541	2011-01-31 10:59:37.567541	2011-02-05	Clovis129647157728917 Botsford	1	t	\N	0	0	f	f	-1	1	2011-01-31 10:59:37.574177	\N	\N	426 Luigi Passage	\N	\N	New Annamaeburgh	22324	Lancashire
5	Trip to amazonia - looking for offer	3	Perferendis et occaecati placeat.Dignissimos ratione modi quas quos sunt officia non odit.	Suscipit asperiores adipisci occaecati in quia.Qui officia quia autem dolor velit ut harum enim.	2	User::Agent	0	631.0	475.0	1	Beatty	Melvina Adams	1-905-647-6449	jefferey_rogahn@bogisichheathcote.com	2011-01-31 10:59:37.763198	2011-01-31 10:59:37.763198	2011-02-05	Clovis129647157728917 Botsford	1	t	\N	0	0	f	f	-1	1	2011-01-31 10:59:37.769888	\N	\N	058 Mertie Point	\N	\N	North Gonzaloville	71113	Powys
6	LCD - Huge amounts	3	Ipsam id doloremque optio voluptatem fugit porro dolores.Velit unde eligendi porro quaerat quos earum eaque.	Vel id quia fugiat nostrum laboriosam dolorem.Excepturi tenetur eos tempore.	2	User::Agent	0	142.0	197.0	1	Will	Kelvin Frami	018-776-5704	manuel@will.uk	2011-01-31 10:59:37.829869	2011-01-31 10:59:37.829869	2011-02-05	Clovis129647157728917 Botsford	1	t	\N	0	0	f	f	-1	1	2011-01-31 10:59:37.836671	\N	\N	15078 Jacinto Estates	\N	\N	New Dax	07677	Clwyd
7	GPS receivers required	3	Et consequatur iste nam nemo.Nulla fugit enim unde hic.	Rerum magnam in nesciunt pariatur minus praesentium debitis non.Sit eum alias qui qui.	2	User::Agent	0	403.0	241.0	1	Bernhard	Ariane Durgan	308.677.9701	georgianna@jewesswillms.info	2011-01-31 10:59:37.897023	2011-01-31 10:59:37.897023	2011-02-05	Clovis129647157728917 Botsford	1	t	\N	0	0	f	f	-1	1	2011-01-31 10:59:37.903823	\N	\N	57940 Halvorson Locks	\N	\N	South Irving	93237-8599	East Sussex
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
1	default_payout_delay	--- 0\n	2011-01-31 10:59:36.456394	2011-01-31 10:59:36.456394
2	default_leads_per_page	--- 5\n	2011-01-31 10:59:36.462114	2011-01-31 10:59:36.462114
3	certification_level_1	--- 10\n	2011-01-31 10:59:36.465922	2011-01-31 10:59:36.465922
4	certification_level_2	--- 20\n	2011-01-31 10:59:36.469012	2011-01-31 10:59:36.469012
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-31 10:59:36.471439	2011-01-31 10:59:36.471439
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-31 10:59:36.473555	2011-01-31 10:59:36.473555
7	invoicing_seller_name	--- Fairleads\n	2011-01-31 10:59:36.47569	2011-01-31 10:59:36.47569
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-31 10:59:36.477789	2011-01-31 10:59:36.477789
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-31 10:59:36.479926	2011-01-31 10:59:36.479926
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-31 10:59:36.482025	2011-01-31 10:59:36.482025
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-31 10:59:36.484132	2011-01-31 10:59:36.484132
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
1	blazejek@gmail.com	9672912341e71745c4f79caab46b02cbfde95621a40f98e0df52fabe13e7d3619c2cce7599c0d4c775737fbf8c928a35634ec813678ad33ee66ce5f61d09c244	s-doC8FcwsKL-wfuNRGY	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-31 10:59:37.001263	2011-01-31 10:59:36.901942	\N	2011-01-31 10:59:36.902159	2011-01-31 10:59:37.001552	1	Orval	Williamson	869.997.9834 x3280	root	Shields Mountains	Evefurt	80671-6729	Nottinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	22saCo264Bm3Y65kkNXLddq4XXTGawTIzyCEwbIG1D14Tp1TMgM6Wr4GrvxX5c	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	8f1032bb1022c6d31f78d82eee13b737846a68532bd58c72aa8f1252b4aa8c1532878c3319c802f519a3bbb7bb84135bce9c6e28f24a80493b46c39d4499d71c	619-VcHoOClDWufOI1eb	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-31 10:59:37.31809	2011-01-31 10:59:37.296555	\N	2011-01-31 10:59:37.296773	2011-01-31 10:59:37.318381	2	Clovis129647157728917	Botsford	676-026-7441 x3061	Justine Rodriguez129647157728883	Medhurst Route	Deontaeview	77584	Staffordshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	ZqauBPsNcSyBZyG1vxfx9dls7ablpeiWzCR0tiLfz9b9Ipb3bZs63sQkXXJtVn	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	5b766a67a142bef53524e1aef4ec09cd8a20acf548229f2a66ba7eb392b1fb9b79b5ffbd33a90b1620f1c9d6d08cb059a7c69d99e2895e3b3d70facb7ba21a02	6xSMZ8cchiFGsR7v4FNl	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-31 10:59:38.00214	2011-01-31 10:59:37.982832	\N	2011-01-31 10:59:37.983045	2011-01-31 10:59:38.002429	1	Manuel	Schimmel	1-961-565-6499	Bridget Thompson129647157797846	Roosevelt Garden	South Stone	15087	Dorset	1	\N	\N	\N	\N	0	\N	\N	\N	\N	3oPPpmPfJKjMPuq75kRCmNivvc2qzM9OJPOgXG4MRAA6qn6Y2sKgHsAneCAmrg	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	6ecf0ac6ffb2c52ad50d474569585cf86770aced2f84002d6e78995ead42349eb9574e3c39e87154b8766e237d06bde17e3256f9043c7992d73485e8e758a064	AHqdH0kNW7Q-tw-lxaQs	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-31 10:59:38.057753	2011-01-31 10:59:38.036615	\N	2011-01-31 10:59:38.036832	2011-01-31 10:59:38.058033	48	Danika	Becker	614.481.0219	Ottis Runolfsson129647157803175	Erick Wall	Orrinton	21011-0360	County Tyrone	1	\N	\N	\N	\N	0	\N	\N	\N	\N	hwAwoNUivThwBARNAQ11k2aXSVKjnkRjllOk9XKZYlJGyNPpEWhATmHgMcwDUS	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	8c12f90370bbc44dd4f844acb2755d3ad6d3cac497fafb7757363c7852705c2873439a443d9d088db53473a9d07b58b7ae9a9e960eb7009523978e31776c218a	BQ1Pfjmym4M_UZTnnv4g	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-31 10:59:38.245084	2011-01-31 10:59:38.223409	\N	2011-01-31 10:59:38.223621	2011-01-31 10:59:38.26026	64	Caroline	Mante	1-408-886-8440	Jairo Wolff12964715782186	Skiles Ways	Williamsonchester	56203	Cornwall	1	\N	\N	4	\N	0	\N	\N	\N	\N	HVr0EtRGiMoYvjTMr80fXvSzaIa9DNd1wwLEHQp1lRbGSBSk7tiyxc0dQYgGke	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

