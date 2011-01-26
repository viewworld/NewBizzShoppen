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
1	1	dk	About us	About us	2011-01-26 14:40:09.374603	2011-01-26 14:40:09.374603
2	1	en	About us	About us	2011-01-26 14:40:09.395673	2011-01-26 14:40:09.395673
3	2	dk	Privacy	Privacy	2011-01-26 14:40:09.466069	2011-01-26 14:40:09.466069
4	2	en	Privacy	Privacy	2011-01-26 14:40:09.496218	2011-01-26 14:40:09.496218
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-26 14:40:09.556743	2011-01-26 14:40:09.556743
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-26 14:40:09.588342	2011-01-26 14:40:09.588342
7	4	dk	Blurb sign up	Blurb sign up	2011-01-26 14:40:09.66219	2011-01-26 14:40:09.66219
8	4	en	Blurb sign up	Blurb sign up	2011-01-26 14:40:09.694163	2011-01-26 14:40:09.694163
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-26 14:40:09.75027	2011-01-26 14:40:09.75027
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-26 14:40:09.769099	2011-01-26 14:40:09.769099
11	6	dk	Blurb agent home	Blurb agent home	2011-01-26 14:40:09.829693	2011-01-26 14:40:09.829693
12	6	en	Blurb agent home	Blurb agent home	2011-01-26 14:40:09.857322	2011-01-26 14:40:09.857322
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-26 14:40:09.922202	2011-01-26 14:40:09.922202
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-26 14:40:09.950802	2011-01-26 14:40:09.950802
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-26 14:40:09.993432	2011-01-26 14:40:09.993432
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-26 14:40:10.023868	2011-01-26 14:40:10.023868
17	9	dk	Blurb currencies	Blurb currencies	2011-01-26 14:40:10.081535	2011-01-26 14:40:10.081535
18	9	en	Blurb currencies	Blurb currencies	2011-01-26 14:40:10.099773	2011-01-26 14:40:10.099773
19	10	dk	Reset password	Reset password	2011-01-26 14:40:10.144533	2011-01-26 14:40:10.144533
20	10	en	Reset password	Reset password	2011-01-26 14:40:10.161726	2011-01-26 14:40:10.161726
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-26 14:40:09.363958	2011-01-26 14:40:09.403119	about_us	0	t	2011-01-26 14:40:09.402984
2	Article::Cms	2011-01-26 14:40:09.456695	2011-01-26 14:40:09.50482	privacy	0	t	2011-01-26 14:40:09.504649
3	Article::Cms	2011-01-26 14:40:09.551252	2011-01-26 14:40:09.596557	terms_conditions	0	t	2011-01-26 14:40:09.596386
4	Article::Cms	2011-01-26 14:40:09.65283	2011-01-26 14:40:09.703324	blurb_sign_up	1	t	2011-01-26 14:40:09.703149
5	Article::Cms	2011-01-26 14:40:09.744883	2011-01-26 14:40:09.776299	blurb_buyer_home	1	t	2011-01-26 14:40:09.776187
6	Article::Cms	2011-01-26 14:40:09.820624	2011-01-26 14:40:09.863634	blurb_agent_home	1	t	2011-01-26 14:40:09.863502
7	Article::Cms	2011-01-26 14:40:09.913045	2011-01-26 14:40:09.956634	blurb_purchase_manager_home	1	t	2011-01-26 14:40:09.956533
8	Article::Cms	2011-01-26 14:40:09.986387	2011-01-26 14:40:10.032984	blurb_start_page_role_selection	1	t	2011-01-26 14:40:10.032799
9	Article::Cms	2011-01-26 14:40:10.07613	2011-01-26 14:40:10.106518	blurb_currencies	1	t	2011-01-26 14:40:10.106416
10	Article::Cms	2011-01-26 14:40:10.138686	2011-01-26 14:40:10.168589	reset_password	2	t	2011-01-26 14:40:10.16845
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-01-26 14:40:07.233981	2011-01-26 14:40:07.233981	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Est aliquam perferendis aut.Accusamus quia sed repudiandae libero dicta.	2011-01-26 14:40:07.863875	2011-01-26 14:40:07.863875	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Qui molestias omnis optio repellendus.Maxime eum aut quidem.	2011-01-26 14:40:07.936771	2011-01-26 14:40:07.936771	\N	3	4	\N	0	2-leisure	f	0
3	Business	Corrupti autem autem voluptatem et molestiae harum accusantium.Officiis necessitatibus repellat veniam aut.	2011-01-26 14:40:07.985687	2011-01-26 14:40:08.860088	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Est aliquam perferendis aut.Accusamus quia sed repudiandae libero dicta.	Electronics	2011-01-26 14:40:07.881106	2011-01-26 14:40:07.881106
2	1	dk	\N	Electronics	2011-01-26 14:40:07.919572	2011-01-26 14:40:07.919572
3	2	en	Qui molestias omnis optio repellendus.Maxime eum aut quidem.	Leisure	2011-01-26 14:40:07.942365	2011-01-26 14:40:07.942365
4	2	dk	\N	Leisure	2011-01-26 14:40:07.970846	2011-01-26 14:40:07.970846
5	3	en	Corrupti autem autem voluptatem et molestiae harum accusantium.Officiis necessitatibus repellat veniam aut.	Business	2011-01-26 14:40:07.991458	2011-01-26 14:40:07.991458
6	3	dk	\N	Business	2011-01-26 14:40:08.027109	2011-01-26 14:40:08.027109
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-26 14:40:07.20044	2011-01-26 14:40:07.20044
2	United Kingdom	2011-01-26 14:40:07.213191	2011-01-26 14:40:07.213191
3	Wales129605280807241	2011-01-26 14:40:08.074057	2011-01-26 14:40:08.074057
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
1	Euro	&euro;	%u%n	t	2011-01-26 14:40:07.828679	2011-01-26 14:40:07.828679
2	PLN	&pln;	%u%n	t	2011-01-26 14:40:07.838424	2011-01-26 14:40:07.838424
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-01-26 14:40:07.27628	2011-01-26 14:40:07.27628
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-01-26 14:40:07.302645	2011-01-26 14:40:07.302645
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-01-26 14:40:07.321354	2011-01-26 14:40:07.321354
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-01-26 14:40:07.34053	2011-01-26 14:40:07.34053
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-01-26 14:40:07.371855	2011-01-26 14:40:07.371855
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-01-26 14:40:07.391868	2011-01-26 14:40:07.391868
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-01-26 14:40:07.411314	2011-01-26 14:40:07.411314
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-01-26 14:40:07.428613	2011-01-26 14:40:07.428613
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-01-26 14:40:07.449107	2011-01-26 14:40:07.449107
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-01-26 14:40:07.47283	2011-01-26 14:40:07.47283
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-01-26 14:40:07.491595	2011-01-26 14:40:07.491595
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-01-26 14:40:07.512769	2011-01-26 14:40:07.512769
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-01-26 14:40:07.53402	2011-01-26 14:40:07.53402
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-01-26 14:40:07.554036	2011-01-26 14:40:07.554036
15	8	en	<p></p>	Question	2011-01-26 14:40:07.572489	2011-01-26 14:40:07.572489
16	8	dk	<p></p>	[DK] Question	2011-01-26 14:40:07.591826	2011-01-26 14:40:07.591826
17	9	en	<p></p>	Invoice	2011-01-26 14:40:07.617034	2011-01-26 14:40:07.617034
18	9	dk	<p></p>	[DK] Invoice	2011-01-26 14:40:07.643151	2011-01-26 14:40:07.643151
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-26 14:40:07.263899	2011-01-26 14:40:07.296289
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-26 14:40:07.315574	2011-01-26 14:40:07.333652
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-26 14:40:07.364768	2011-01-26 14:40:07.386346
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-26 14:40:07.405721	2011-01-26 14:40:07.423563
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-26 14:40:07.443632	2011-01-26 14:40:07.465513
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-26 14:40:07.485025	2011-01-26 14:40:07.505613
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-26 14:40:07.526815	2011-01-26 14:40:07.547896
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-26 14:40:07.566129	2011-01-26 14:40:07.586709
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-26 14:40:07.607927	2011-01-26 14:40:07.637063
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

COPY lead_translations (id, lead_id, locale, header, description, hidden_description, created_at, updated_at) FROM stdin;
1	1	dk	Big deal on printers	Vero ut temporibus in repellat.Eligendi a consequatur accusamus id rerum.	Iusto aperiam exercitationem voluptatem.Tempore voluptatem dolor quisquam quae atque aut.	2011-01-26 14:40:08.240682	2011-01-26 14:40:08.240682
2	2	dk	Drills required	Voluptatem sed itaque aliquid voluptas qui.Ea id soluta occaecati atque rerum neque.	Dolor quia est ducimus odit.Id cupiditate esse odio.	2011-01-26 14:40:08.339346	2011-01-26 14:40:08.339346
3	3	dk	Need assistance in selling a car	Odio dicta reiciendis qui beatae quos et.Incidunt dolorum voluptas qui quia dolores dolor tenetur.	Voluptas harum amet quisquam.Dolorem numquam voluptates tenetur beatae maiores voluptas nam odit.	2011-01-26 14:40:08.435718	2011-01-26 14:40:08.435718
4	4	dk	Ipod shipment	Ducimus doloribus non in.Fugit explicabo incidunt a ut sequi.	Facere occaecati est sint recusandae.Sed velit temporibus tempore sed excepturi voluptatum.	2011-01-26 14:40:08.541942	2011-01-26 14:40:08.541942
5	5	dk	Trip to amazonia - looking for offer	Eum et debitis sit dolor cupiditate ipsum autem.Voluptate consequuntur error ea nulla ut.	Quos fugit amet quae est.Reiciendis natus voluptatem ut et quia consequatur consequatur impedit.	2011-01-26 14:40:08.65185	2011-01-26 14:40:08.65185
6	6	dk	LCD - Huge amounts	Sed molestiae et et facere numquam vel.Dolor necessitatibus accusantium dolor officiis voluptatum illum modi vitae.	Nihil et vel eaque illo cumque exercitationem quae molestiae.Eos quis doloribus consequuntur.	2011-01-26 14:40:08.761777	2011-01-26 14:40:08.761777
7	7	dk	GPS receivers required	Voluptatum ut labore et et nisi modi.Ea odio aut amet et veniam omnis facere sit.	Nobis occaecati voluptatem et cupiditate sequi at eos corporis.Hic et omnis in at ad.	2011-01-26 14:40:08.869954	2011-01-26 14:40:08.869954
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Vero ut temporibus in repellat.Eligendi a consequatur accusamus id rerum.	Iusto aperiam exercitationem voluptatem.Tempore voluptatem dolor quisquam quae atque aut.	2	User::Agent	0	842.0	605.0	1	Balistrerilang	Bill Thompson	530-209-8909 x889	dell_hoeger@hamillgoyette.info	2011-01-26 14:40:08.181776	2011-01-26 14:40:08.181776	2011-01-31	Domenick129605280807131 Goyette	1	t	\N	0	0	f	f	-1	1	2011-01-26 14:40:08.196719	\N	\N	1469 Donnelly Walk	\N	\N	Jakubowskitown	42029-7036	Avon
2	Drills required	3	Voluptatem sed itaque aliquid voluptas qui.Ea id soluta occaecati atque rerum neque.	Dolor quia est ducimus odit.Id cupiditate esse odio.	2	User::Agent	0	992.0	9.0	1	Russel	Barry Gutkowski	798.642.2220 x22646	jules@cartwright.uk	2011-01-26 14:40:08.294801	2011-01-26 14:40:08.294801	2011-01-31	Domenick129605280807131 Goyette	1	t	\N	0	0	f	f	-1	1	2011-01-26 14:40:08.304173	\N	\N	54894 Herman Fort	\N	\N	Hamillton	29564	Surrey
3	Need assistance in selling a car	3	Odio dicta reiciendis qui beatae quos et.Incidunt dolorum voluptas qui quia dolores dolor tenetur.	Voluptas harum amet quisquam.Dolorem numquam voluptates tenetur beatae maiores voluptas nam odit.	2	User::Agent	0	104.0	88.0	1	Block	Phoebe Schumm	(033)468-3511	barton.kling@klocko.biz	2011-01-26 14:40:08.392496	2011-01-26 14:40:08.392496	2011-01-31	Domenick129605280807131 Goyette	1	t	\N	0	0	f	f	-1	1	2011-01-26 14:40:08.400623	\N	\N	905 Herzog Landing	\N	\N	West Carole	14034-1224	Suffolk
4	Ipod shipment	3	Ducimus doloribus non in.Fugit explicabo incidunt a ut sequi.	Facere occaecati est sint recusandae.Sed velit temporibus tempore sed excepturi voluptatum.	2	User::Agent	0	377.0	988.0	1	Wunschprosacco	Buddy Luettgen	1-704-164-8963 x415	georgette@satterfield.com	2011-01-26 14:40:08.489178	2011-01-26 14:40:08.489178	2011-01-31	Domenick129605280807131 Goyette	1	t	\N	0	0	f	f	-1	1	2011-01-26 14:40:08.498662	\N	\N	04188 Myrtice Crest	\N	\N	North Jade	70420-1739	Tyne and Wear
5	Trip to amazonia - looking for offer	3	Eum et debitis sit dolor cupiditate ipsum autem.Voluptate consequuntur error ea nulla ut.	Quos fugit amet quae est.Reiciendis natus voluptatem ut et quia consequatur consequatur impedit.	2	User::Agent	0	382.0	423.0	1	Rath	Leonora Kohler	1-615-148-8013	gracie_beer@stantonrogahn.uk	2011-01-26 14:40:08.603439	2011-01-26 14:40:08.603439	2011-01-31	Domenick129605280807131 Goyette	1	t	\N	0	0	f	f	-1	1	2011-01-26 14:40:08.612173	\N	\N	92445 Schoen Orchard	\N	\N	Powlowskiland	61231	Lincolnshire
6	LCD - Huge amounts	3	Sed molestiae et et facere numquam vel.Dolor necessitatibus accusantium dolor officiis voluptatum illum modi vitae.	Nihil et vel eaque illo cumque exercitationem quae molestiae.Eos quis doloribus consequuntur.	2	User::Agent	0	931.0	190.0	1	Dickinsonparisian	Kale Herzog	353-752-6733	thad@wolf.ca	2011-01-26 14:40:08.704475	2011-01-26 14:40:08.704475	2011-01-31	Domenick129605280807131 Goyette	1	t	\N	0	0	f	f	-1	1	2011-01-26 14:40:08.712633	\N	\N	64417 Eldora Prairie	\N	\N	Port Milfordfort	65537-4179	Clwyd
7	GPS receivers required	3	Voluptatum ut labore et et nisi modi.Ea odio aut amet et veniam omnis facere sit.	Nobis occaecati voluptatem et cupiditate sequi at eos corporis.Hic et omnis in at ad.	2	User::Agent	0	188.0	172.0	1	Fritsch	Carli Donnelly	326-568-9101	nicolette_williamson@ortiz.co.uk	2011-01-26 14:40:08.821061	2011-01-26 14:40:08.821061	2011-01-31	Domenick129605280807131 Goyette	1	t	\N	0	0	f	f	-1	1	2011-01-26 14:40:08.833739	\N	\N	081 Muller Pine	\N	\N	Harveymouth	75962	Somerset
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
1	default_payout_delay	--- 0\n	2011-01-26 14:40:07.107056	2011-01-26 14:40:07.107056
2	default_leads_per_page	--- 5\n	2011-01-26 14:40:07.116953	2011-01-26 14:40:07.116953
3	certification_level_1	--- 10\n	2011-01-26 14:40:07.125337	2011-01-26 14:40:07.125337
4	certification_level_2	--- 20\n	2011-01-26 14:40:07.13328	2011-01-26 14:40:07.13328
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-26 14:40:07.142037	2011-01-26 14:40:07.142037
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-26 14:40:07.148302	2011-01-26 14:40:07.148302
7	invoicing_seller_name	--- Fairleads\n	2011-01-26 14:40:07.154667	2011-01-26 14:40:07.154667
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-26 14:40:07.161854	2011-01-26 14:40:07.161854
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-26 14:40:07.170371	2011-01-26 14:40:07.170371
10	invoicing_default_vat_rate	--- 0.15\n	2011-01-26 14:40:07.177885	2011-01-26 14:40:07.177885
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers, vat_number, not_charge_vat, bank_account_id) FROM stdin;
1	blazejek@gmail.com	738b85789f81ea3b0072084d0ce04d9f0d16ef53ad2c019ad918027ca508c06eeb25886342365237d7321683d206e2c104421aa6c1c69060d99ba26b38286d58	Ur9Ok7Mj7ZXJFmIg0XEf	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-26 14:40:07.81176	2011-01-26 14:40:07.695904	\N	2011-01-26 14:40:07.70306	2011-01-26 14:40:07.812228	1	Geovanni	Hoppe	924.554.5354 x27765	root	Reyes Light	Novellafort	81679	Berkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	9FjKWWBKptssAZzPPetkR8IO3eNrQAyMo2L1fsNdmULrNlR2l45sSr03j9jn4D	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
2	agent@nbs.com	c4b4c2fe2cb4a497ab91e0a797c05c284fbaffaf18d9a446979901542f273d03383b4ab4d954adcd13a35c167976f90c7411daacca5bf1697c1e9d41f082e7e3	D9N0dx3fQnJGMRaWqHLm	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-26 14:40:08.130166	2011-01-26 14:40:08.085282	\N	2011-01-26 14:40:08.089073	2011-01-26 14:40:08.130775	2	Domenick129605280807131	Goyette	(193)424-5408 x8025	Sally Kuphal129605280807081	Jovani Dale	West Benjaminmouth	40371-5364	Norfolk	1	\N	0	\N	\N	0	\N	\N	\N	\N	Nv7hVpnvhyoBojDvLoUtotaSs7Z94xJUaJJVrMm2aVFQl2HwAr4O2xmcm6AJOG	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
3	admin@nbs.com	29abcf971b06cead83167332fb422e561285ced2ee51326107d129ce016131bb211e56830bb2bfd44a258b5779b4546835b837c4ac1871d1f0b3c42a25f05a41	OMsXF19-XTSjVfWTDSKh	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-26 14:40:09.000675	2011-01-26 14:40:08.957892	\N	2011-01-26 14:40:08.960871	2011-01-26 14:40:09.001429	1	Marietta	Hagenes	762-986-6062 x9782	Rosemarie Ruecker129605280894913	Lowe Spring	Grantville	31383	Northumberland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Zt5nmWF7loKeQR8byg9idnXLhacy8Gzq4fhLE3jXCBoH3wjfsMQEo2Oecns0Lb	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
4	buyer@nbs.com	9c42e95e51d41a98025fb24743236ab86c27006f895a9dadd5fbdc719d65c67569264ef6a73f549d7f39e78b35d824a8f821d94d2ae1122260e4c957e2f138e0	CZ5M2ZxJyyb0Gz2O1s-i	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-26 14:40:09.105288	2011-01-26 14:40:09.070523	\N	2011-01-26 14:40:09.073875	2011-01-26 14:40:09.10574	48	Eula	Wolf	956.147.7019 x16281	Solon Stroman129605280906241	Freeman Hill	West Joshuah	56583-6856	Cornwall	1	\N	\N	\N	\N	0	\N	\N	\N	\N	LkPFRXhUZIvYMv25kD5szajC1FJhc0ELxyEScmx64WDpNmeXvvYTjstQltJbjm	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
5	leaduser@nbs.com	6a1f83f900808ed1a1ea3548f737699f494da1df2dd91fe1711226eecf5c4edb8f36852b09ec96beaa18c4e4b4180e32aeb08ec5440aae69fd6b4673312129b6	CeS8B152vaEOCnK73I40	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-26 14:40:09.211735	2011-01-26 14:40:09.169723	\N	2011-01-26 14:40:09.172365	2011-01-26 14:40:09.2415	64	Elda	Huel	294-949-0876 x6949	Mrs. Samson Borer129605280916178	Kuhlman Key	Woodrowshire	68365	County Down	1	\N	\N	4	\N	0	\N	\N	\N	\N	VTt2L00okSTlMT7RJGMvqTvjLdUomiZ3fzQaXd8GAdtEXlRDyL6wwP1sVBhx4C	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

