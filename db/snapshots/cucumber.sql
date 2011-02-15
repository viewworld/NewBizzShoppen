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

SELECT pg_catalog.setval('article_translations_id_seq', 24, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 12, true);


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

SELECT pg_catalog.setval('currencies_id_seq', 21, true);


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
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sellers_id_seq', 1, false);


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
1	1	dk	About us	About us	2011-02-15 13:12:01.135364	2011-02-15 13:12:01.135364
2	1	en	About us	About us	2011-02-15 13:12:01.161365	2011-02-15 13:12:01.161365
3	2	dk	Privacy	Privacy	2011-02-15 13:12:01.218436	2011-02-15 13:12:01.218436
4	2	en	Privacy	Privacy	2011-02-15 13:12:01.243798	2011-02-15 13:12:01.243798
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-15 13:12:01.31221	2011-02-15 13:12:01.31221
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-15 13:12:01.339508	2011-02-15 13:12:01.339508
7	4	dk	Blurb sign up	Blurb sign up	2011-02-15 13:12:01.403777	2011-02-15 13:12:01.403777
8	4	en	Blurb sign up	Blurb sign up	2011-02-15 13:12:01.426066	2011-02-15 13:12:01.426066
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-15 13:12:01.483488	2011-02-15 13:12:01.483488
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-15 13:12:01.507965	2011-02-15 13:12:01.507965
11	6	dk	Blurb agent home	Blurb agent home	2011-02-15 13:12:01.567329	2011-02-15 13:12:01.567329
12	6	en	Blurb agent home	Blurb agent home	2011-02-15 13:12:01.585919	2011-02-15 13:12:01.585919
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-15 13:12:01.649669	2011-02-15 13:12:01.649669
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-15 13:12:01.676092	2011-02-15 13:12:01.676092
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-15 13:12:01.734337	2011-02-15 13:12:01.734337
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-15 13:12:01.756398	2011-02-15 13:12:01.756398
17	9	dk	Blurb currencies	Blurb currencies	2011-02-15 13:12:01.821661	2011-02-15 13:12:01.821661
18	9	en	Blurb currencies	Blurb currencies	2011-02-15 13:12:01.844178	2011-02-15 13:12:01.844178
19	10	dk	Blurb category home	Blurb category home	2011-02-15 13:12:01.912825	2011-02-15 13:12:01.912825
20	10	en	Blurb category home	Blurb category home	2011-02-15 13:12:01.933415	2011-02-15 13:12:01.933415
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-15 13:12:01.997067	2011-02-15 13:12:01.997067
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-15 13:12:02.017169	2011-02-15 13:12:02.017169
23	12	dk	Reset password	Reset password	2011-02-15 13:12:02.090161	2011-02-15 13:12:02.090161
24	12	en	Reset password	Reset password	2011-02-15 13:12:02.116182	2011-02-15 13:12:02.116182
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id, views_count) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-15 13:12:01.117495	2011-02-15 13:12:01.171735	about_us	t	2011-02-15 13:12:01.17161	\N	\N	0
2	Article::Cms::MainPageArticle	2011-02-15 13:12:01.212344	2011-02-15 13:12:01.259534	privacy	t	2011-02-15 13:12:01.259331	\N	\N	0
3	Article::Cms::MainPageArticle	2011-02-15 13:12:01.304292	2011-02-15 13:12:01.345259	terms_conditions	t	2011-02-15 13:12:01.345143	\N	\N	0
4	Article::Cms::InterfaceContentText	2011-02-15 13:12:01.395566	2011-02-15 13:12:01.438291	blurb_sign_up	t	2011-02-15 13:12:01.438187	\N	\N	0
5	Article::Cms::InterfaceContentText	2011-02-15 13:12:01.477716	2011-02-15 13:12:01.515653	blurb_buyer_home	t	2011-02-15 13:12:01.515549	\N	\N	0
6	Article::Cms::InterfaceContentText	2011-02-15 13:12:01.556834	2011-02-15 13:12:01.601384	blurb_agent_home	t	2011-02-15 13:12:01.601234	\N	\N	0
7	Article::Cms::InterfaceContentText	2011-02-15 13:12:01.64376	2011-02-15 13:12:01.682514	blurb_purchase_manager_home	t	2011-02-15 13:12:01.682413	\N	\N	0
8	Article::Cms::InterfaceContentText	2011-02-15 13:12:01.722348	2011-02-15 13:12:01.770195	blurb_start_page_role_selection	t	2011-02-15 13:12:01.770072	\N	\N	0
9	Article::Cms::InterfaceContentText	2011-02-15 13:12:01.816019	2011-02-15 13:12:01.862434	blurb_currencies	t	2011-02-15 13:12:01.862252	\N	\N	0
10	Article::Cms::InterfaceContentText	2011-02-15 13:12:01.906276	2011-02-15 13:12:01.93989	blurb_category_home	t	2011-02-15 13:12:01.939792	\N	\N	0
11	Article::Cms::InterfaceContentText	2011-02-15 13:12:01.985068	2011-02-15 13:12:02.030728	blurb_leads_listing	t	2011-02-15 13:12:02.030557	\N	\N	0
12	Article::Cms::HelpPopup	2011-02-15 13:12:02.082412	2011-02-15 13:12:02.125081	reset_password	t	2011-02-15 13:12:02.124969	\N	\N	0
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-15 13:11:58.75105	2011-02-15 13:11:58.75105	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Sunt vel veniam cum qui adipisci.Itaque quis quo accusantium minus est corporis voluptatem.	2011-02-15 13:11:59.55874	2011-02-15 13:11:59.55874	\N	1	2	\N	0	electronics	f	0
2	Leisure	Et cupiditate accusamus nobis distinctio voluptatum architecto.Harum aspernatur est minus eos ab non accusamus quo.	2011-02-15 13:11:59.634153	2011-02-15 13:11:59.634153	\N	3	4	\N	0	leisure	f	0
3	Business	Vel quasi ut sunt dolorem odio quos.Voluptatem consequatur sapiente eligendi.	2011-02-15 13:11:59.688331	2011-02-15 13:12:00.572796	\N	5	6	\N	7	business	f	7
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
1	1	en	Sunt vel veniam cum qui adipisci.Itaque quis quo accusantium minus est corporis voluptatem.	Electronics	2011-02-15 13:11:59.569844	2011-02-15 13:11:59.569844
2	1	dk	\N	Electronics	2011-02-15 13:11:59.613677	2011-02-15 13:11:59.613677
3	2	en	Et cupiditate accusamus nobis distinctio voluptatum architecto.Harum aspernatur est minus eos ab non accusamus quo.	Leisure	2011-02-15 13:11:59.64113	2011-02-15 13:11:59.64113
4	2	dk	\N	Leisure	2011-02-15 13:11:59.670944	2011-02-15 13:11:59.670944
5	3	en	Vel quasi ut sunt dolorem odio quos.Voluptatem consequatur sapiente eligendi.	Business	2011-02-15 13:11:59.696175	2011-02-15 13:11:59.696175
6	3	dk	\N	Business	2011-02-15 13:11:59.730073	2011-02-15 13:11:59.730073
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-15 13:11:58.720897	2011-02-15 13:11:58.720897
2	United Kingdom	2011-02-15 13:11:58.731524	2011-02-15 13:11:58.731524
3	Wales129777551977057	2011-02-15 13:11:59.772198	2011-02-15 13:11:59.772198
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
1	AUD	A &#36;	%u%n	f	2011-02-15 13:11:59.382674	2011-02-15 13:11:59.382674
2	CAD	C &#36;	%u%n	f	2011-02-15 13:11:59.391926	2011-02-15 13:11:59.391926
3	EUR	&euro;	%u%n	t	2011-02-15 13:11:59.397579	2011-02-15 13:11:59.397579
4	GBP	&pound;	%u%n	f	2011-02-15 13:11:59.402235	2011-02-15 13:11:59.402235
5	JPY	&yen;	%u%n	f	2011-02-15 13:11:59.407358	2011-02-15 13:11:59.407358
6	USD	&#36;	%u%n	f	2011-02-15 13:11:59.413699	2011-02-15 13:11:59.413699
7	NZD	&#36;	%u%n	f	2011-02-15 13:11:59.420437	2011-02-15 13:11:59.420437
8	CHF	CHF	%u %n	f	2011-02-15 13:11:59.431847	2011-02-15 13:11:59.431847
9	HKD	&#36;	%u%n	f	2011-02-15 13:11:59.437883	2011-02-15 13:11:59.437883
10	SGD	&#36;	%u%n	f	2011-02-15 13:11:59.444468	2011-02-15 13:11:59.444468
11	SEK	SEK	%u %n	f	2011-02-15 13:11:59.451232	2011-02-15 13:11:59.451232
12	DKK	DKK	%u %n	t	2011-02-15 13:11:59.458686	2011-02-15 13:11:59.458686
13	PLN	PLN	%u %n	t	2011-02-15 13:11:59.469976	2011-02-15 13:11:59.469976
14	NOK	NOK	%u %n	f	2011-02-15 13:11:59.47633	2011-02-15 13:11:59.47633
15	HUF	HUF	%u %n	f	2011-02-15 13:11:59.482115	2011-02-15 13:11:59.482115
16	CZK	CZK	%u %n	f	2011-02-15 13:11:59.486264	2011-02-15 13:11:59.486264
17	ILS	ILS	%u %n	f	2011-02-15 13:11:59.49361	2011-02-15 13:11:59.49361
18	MXN	MXN	%u %n	f	2011-02-15 13:11:59.499766	2011-02-15 13:11:59.499766
19	PHP	PHP	%u %n	f	2011-02-15 13:11:59.506436	2011-02-15 13:11:59.506436
20	TWD	TWD	%u %n	f	2011-02-15 13:11:59.512074	2011-02-15 13:11:59.512074
21	THB	THB	%u %n	f	2011-02-15 13:11:59.517798	2011-02-15 13:11:59.517798
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-15 13:11:58.805206	2011-02-15 13:11:58.805206
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-15 13:11:58.840515	2011-02-15 13:11:58.840515
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-15 13:11:58.861303	2011-02-15 13:11:58.861303
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-15 13:11:58.90339	2011-02-15 13:11:58.90339
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-15 13:11:58.938833	2011-02-15 13:11:58.938833
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-15 13:11:58.96268	2011-02-15 13:11:58.96268
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-15 13:11:58.98524	2011-02-15 13:11:58.98524
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-15 13:11:59.004813	2011-02-15 13:11:59.004813
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-15 13:11:59.030965	2011-02-15 13:11:59.030965
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-15 13:11:59.052023	2011-02-15 13:11:59.052023
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-15 13:11:59.074133	2011-02-15 13:11:59.074133
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-15 13:11:59.091454	2011-02-15 13:11:59.091454
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-15 13:11:59.110365	2011-02-15 13:11:59.110365
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-15 13:11:59.131166	2011-02-15 13:11:59.131166
15	8	en	<p></p>	Question	2011-02-15 13:11:59.152038	2011-02-15 13:11:59.152038
16	8	dk	<p></p>	[DK] Question	2011-02-15 13:11:59.16972	2011-02-15 13:11:59.16972
17	9	en	<p></p>	Invoice	2011-02-15 13:11:59.187706	2011-02-15 13:11:59.187706
18	9	dk	<p></p>	[DK] Invoice	2011-02-15 13:11:59.207257	2011-02-15 13:11:59.207257
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-15 13:11:58.789867	2011-02-15 13:11:58.833453
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-15 13:11:58.855492	2011-02-15 13:11:58.882385
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-15 13:11:58.924954	2011-02-15 13:11:58.950972
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-15 13:11:58.976872	2011-02-15 13:11:58.999295
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-15 13:11:59.018326	2011-02-15 13:11:59.045832
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-15 13:11:59.06865	2011-02-15 13:11:59.086352
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-15 13:11:59.10504	2011-02-15 13:11:59.125046
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-15 13:11:59.145878	2011-02-15 13:11:59.164617
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-15 13:11:59.182295	2011-02-15 13:11:59.202141
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at, ean_number, details, bank_account_id, seller_id) FROM stdin;
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

COPY lead_translations (id, lead_id, locale, header, hidden_description, description, created_at, updated_at) FROM stdin;
1	1	dk	Big deal on printers	Eum deleniti maxime dignissimos.Debitis voluptates aut saepe et vel ut.	Porro deserunt sapiente eius voluptatem hic exercitationem molestiae.Quisquam nam mollitia molestiae.	2011-02-15 13:11:59.947681	2011-02-15 13:11:59.947681
2	2	dk	Drills required	Placeat rerum atque quae recusandae.Dicta molestiae voluptates odit consequuntur atque sed totam.	Ducimus non dolores dolorem hic nesciunt dolores voluptatem omnis.Et aliquid sit voluptatem earum vitae non itaque magnam.	2011-02-15 13:12:00.051485	2011-02-15 13:12:00.051485
3	3	dk	Need assistance in selling a car	Voluptas nesciunt placeat aperiam dolores distinctio nemo.Corrupti eaque enim et delectus velit id.	Et enim quibusdam impedit.Corrupti dolorem et esse sed sit tempora assumenda.	2011-02-15 13:12:00.16542	2011-02-15 13:12:00.16542
4	4	dk	Ipod shipment	Iusto debitis aut deserunt temporibus.Doloribus non impedit sit repellat labore veritatis.	Optio quis doloremque molestias.Et maxime est quia id.	2011-02-15 13:12:00.266481	2011-02-15 13:12:00.266481
5	5	dk	Trip to amazonia - looking for offer	Tenetur ut dolor molestias earum sunt consectetur.Minima nemo quia magni praesentium suscipit sit quia.	Occaecati et fuga quia voluptates veniam eum odit quis.Omnis aperiam eum ut sunt est et rerum.	2011-02-15 13:12:00.364006	2011-02-15 13:12:00.364006
6	6	dk	LCD - Huge amounts	Reiciendis facilis adipisci neque dignissimos provident ea.Culpa eveniet deserunt officiis unde dicta est.	Sed consequatur dolor perferendis.Inventore voluptas laborum ipsam.	2011-02-15 13:12:00.471409	2011-02-15 13:12:00.471409
7	7	dk	GPS receivers required	Quia et nulla animi.Velit temporibus eaque corrupti necessitatibus quibusdam suscipit.	Id magnam vero error.Nam quia aliquam tempore.	2011-02-15 13:12:00.585193	2011-02-15 13:12:00.585193
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Porro deserunt sapiente eius voluptatem hic exercitationem molestiae.Quisquam nam mollitia molestiae.	Eum deleniti maxime dignissimos.Debitis voluptates aut saepe et vel ut.	2	User::Agent	0	761.0	475.0	1	Rempelconsidine	Orrin Hermiston	1-292-716-7642 x4739	liza.yundt@gottliebbauch.name	2011-02-15 13:11:59.891311	2011-02-15 13:11:59.891311	2011-02-20	Gabriel129777551976975 Aufderhar	1	t	\N	0	0	f	f	-1	3	2011-02-15 13:11:59.903994	\N	\N	6575 Felton Turnpike	\N	\N	Abernathyland	06356-5509	Worcestershire	\N	\N	\N	\N	t
2	Drills required	3	Ducimus non dolores dolorem hic nesciunt dolores voluptatem omnis.Et aliquid sit voluptatem earum vitae non itaque magnam.	Placeat rerum atque quae recusandae.Dicta molestiae voluptates odit consequuntur atque sed totam.	2	User::Agent	0	847.0	412.0	1	Senger	Zackery Brekke	500.711.1327	estevan@gerlachreilly.biz	2011-02-15 13:12:00.004739	2011-02-15 13:12:00.004739	2011-02-20	Gabriel129777551976975 Aufderhar	1	t	\N	0	0	f	f	-1	3	2011-02-15 13:12:00.014277	\N	\N	3432 Oda Spurs	\N	\N	Lake Estel	32464	Fife	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Et enim quibusdam impedit.Corrupti dolorem et esse sed sit tempora assumenda.	Voluptas nesciunt placeat aperiam dolores distinctio nemo.Corrupti eaque enim et delectus velit id.	2	User::Agent	0	567.0	439.0	1	Heathcotemohr	Rosanna Hudson	(113)199-9048	abdul@powlowskismith.name	2011-02-15 13:12:00.112308	2011-02-15 13:12:00.112308	2011-02-20	Gabriel129777551976975 Aufderhar	1	t	\N	0	0	f	f	-1	3	2011-02-15 13:12:00.126779	\N	\N	150 Morissette Plaza	\N	\N	East Marion	63595	Kent	\N	\N	\N	\N	t
4	Ipod shipment	3	Optio quis doloremque molestias.Et maxime est quia id.	Iusto debitis aut deserunt temporibus.Doloribus non impedit sit repellat labore veritatis.	2	User::Agent	0	276.0	498.0	1	Rogahn	Mr. Guadalupe Durgan	601.787.0520 x008	justyn@zemlakmonahan.uk	2011-02-15 13:12:00.220625	2011-02-15 13:12:00.220625	2011-02-20	Gabriel129777551976975 Aufderhar	1	t	\N	0	0	f	f	-1	3	2011-02-15 13:12:00.230161	\N	\N	803 Bashirian Terrace	\N	\N	New Curtisborough	03006-5504	Cambridgeshire	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Occaecati et fuga quia voluptates veniam eum odit quis.Omnis aperiam eum ut sunt est et rerum.	Tenetur ut dolor molestias earum sunt consectetur.Minima nemo quia magni praesentium suscipit sit quia.	2	User::Agent	0	16.0	289.0	1	Sporer	Salvatore Mayert	(113)179-4485 x41727	ally@jacobsjacobson.biz	2011-02-15 13:12:00.318645	2011-02-15 13:12:00.318645	2011-02-20	Gabriel129777551976975 Aufderhar	1	t	\N	0	0	f	f	-1	3	2011-02-15 13:12:00.326853	\N	\N	58684 Edgardo Throughway	\N	\N	Americoville	52259	Buckinghamshire	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Sed consequatur dolor perferendis.Inventore voluptas laborum ipsam.	Reiciendis facilis adipisci neque dignissimos provident ea.Culpa eveniet deserunt officiis unde dicta est.	2	User::Agent	0	940.0	94.0	1	Maggio	Lula Reichert	(721)474-3166 x290	emerson@ferry.com	2011-02-15 13:12:00.414913	2011-02-15 13:12:00.414913	2011-02-20	Gabriel129777551976975 Aufderhar	1	t	\N	0	0	f	f	-1	3	2011-02-15 13:12:00.431108	\N	\N	57636 Lelia Landing	\N	\N	Harveyton	29843	Derbyshire	\N	\N	\N	\N	t
7	GPS receivers required	3	Id magnam vero error.Nam quia aliquam tempore.	Quia et nulla animi.Velit temporibus eaque corrupti necessitatibus quibusdam suscipit.	2	User::Agent	0	61.0	493.0	1	Weissnat	Laury Bartoletti	015-724-5628 x364	lauretta.sawayn@murray.com	2011-02-15 13:12:00.526864	2011-02-15 13:12:00.526864	2011-02-20	Gabriel129777551976975 Aufderhar	1	t	\N	0	0	f	f	-1	3	2011-02-15 13:12:00.541166	\N	\N	0911 Renner Trail	\N	\N	Lake Michelle	84713	West Midlands	\N	\N	\N	\N	t
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
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sellers (id, name, address, vat_no, first_name, last_name, country_id, "default", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2011-02-15 13:11:58.622082	2011-02-15 13:11:58.622082
2	default_leads_per_page	--- 5\n	2011-02-15 13:11:58.636614	2011-02-15 13:11:58.636614
3	certification_level_1	--- 10\n	2011-02-15 13:11:58.645015	2011-02-15 13:11:58.645015
4	certification_level_2	--- 20\n	2011-02-15 13:11:58.654246	2011-02-15 13:11:58.654246
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-15 13:11:58.660612	2011-02-15 13:11:58.660612
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-15 13:11:58.665369	2011-02-15 13:11:58.665369
7	invoicing_seller_name	--- Fairleads\n	2011-02-15 13:11:58.670418	2011-02-15 13:11:58.670418
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-15 13:11:58.676256	2011-02-15 13:11:58.676256
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-15 13:11:58.683304	2011-02-15 13:11:58.683304
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-15 13:11:58.699889	2011-02-15 13:11:58.699889
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers, vat_number, not_charge_vat, bank_account_id, category_id, all_deal_values_enabled) FROM stdin;
1	blazejek@gmail.com	e73afde75bf3bd23f4a63aa222f25683eb19326e17bcdcf245e05a8adf8412c66f33c4525b7bbcb237e7970a5709404509bd988c1147473d6bcb8c79db9d8934	-37krJUhhAXFUbVYOUjp	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-15 13:11:59.36685	2011-02-15 13:11:59.271975	\N	2011-02-15 13:11:59.278159	2011-02-15 13:11:59.367381	1	Eula	Beatty	1-123-115-5492 x013	root	Kuphal Drives	Port Shad	34577-9646	Warwickshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	cIYHXXuviYHNjSMB2yJ2IX7pY7Yyg5g3y1ScufkPPW2nZfxR7RtOFewyfNY7qv	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	d708941ee7a0c9921202b48cff29f912fbe8d1155d15a348181688cc078071bde37b3da98a4bd596d5270d5bbb447272ac8dc14dd5f07275b9014180e0d4b393	kX1Jgk1LY1I6VMUeX-PB	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-15 13:11:59.834628	2011-02-15 13:11:59.784449	\N	2011-02-15 13:11:59.797051	2011-02-15 13:11:59.836795	2	Gabriel129777551976975	Aufderhar	1-780-413-1231 x2831	Anissa Waters129777551976951	Stokes Crossing	East Kenyonchester	81274	County Armagh	1	\N	0	\N	\N	0	\N	\N	\N	\N	muQGTxf51Co9to9qBypeU8mnVpf9KQQkpRVTIVFytbu0Oznrkqt2mYmhdVyI1k	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	797b46a43140262d3452ee3f230776d6141feef6e0406f2024ec60282a256e49268dcd660d686fee6587478cadfbef6e373125368f8a24ccdaeb288c5ab5d20f	jLbljXdHKBE-n0LUlVd4	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-15 13:12:00.717042	2011-02-15 13:12:00.682781	\N	2011-02-15 13:12:00.686046	2011-02-15 13:12:00.717498	1	Mattie	Altenwerth	409.143.8276 x157	Daniella Murray129777552067526	Corine Creek	Port Inesview	50169-2412	North Yorkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	GyP7aEyb00MBibtZug9rH5YJDQPo8MLfzNFMLObWLjJiOIJQvw97BNFkStBkiy	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	eec72fac4009f839b45dd6d8515ca9f38fbca87fc785edebc14f9202c4da806b272fa273d77c73caf6a809a1c340f40661fba31f538aceeea46733129ce2eeb6	ogQCnzR9j4N5Ce4tbPvl	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-15 13:12:00.809026	2011-02-15 13:12:00.769095	\N	2011-02-15 13:12:00.774678	2011-02-15 13:12:00.809507	48	Ewald	Beahan	095-184-4103 x2885	Noah Boyer12977755207609	Claire Courts	Lake Lowelltown	54989-4681	Gwynedd County	1	\N	\N	\N	\N	0	\N	\N	\N	\N	GCZOcEqXKQTYzU2EHM4bf7ox2OF0BVLijcKxPN00zavEaHiV6O68E7dGvfKfNn	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	8a2bd593b8f738e0a7272ac6b7458f9a185153f47b0b2bef24e6425edca2a0ef6bc6b7271e96d69e095aaaad979bd3cef344af3224adb170ae334ffc698c6807	iuEZhxxjBIqIhkT8TG2s	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-15 13:12:00.92568	2011-02-15 13:12:00.885868	\N	2011-02-15 13:12:00.890046	2011-02-15 13:12:00.952628	64	Rachel	Mayert	1-937-421-5955 x25709	Edna Lemke129777552087557	Kathlyn Springs	Gottliebmouth	48999-4351	North Yorkshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	eAqRC3qqDFXABMPNWXwQOMIRsPPdeB7AGkIZLAkK9GzjZ2LRdDLh7QZOyp78LM	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

