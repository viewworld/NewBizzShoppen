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
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('addresses_id_seq', 6, true);


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

SELECT pg_catalog.setval('countries_id_seq', 2, true);


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

SELECT pg_catalog.setval('sellers_id_seq', 1, true);


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
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY addresses (id, address_line_1, address_line_2, address_line_3, zip_code, country_id, addressable_type, addressable_id, created_at, updated_at) FROM stdin;
1	Colt Overpass	East Toreybury	Northamptonshire	33197-2664	1	BankAccount	1	2011-02-17 10:43:08.873904	2011-02-17 10:43:08.897669
2	Estevan Wells	West Alize	Hertfordshire	27096	1	Seller	1	2011-02-17 10:43:08.913964	2011-02-17 10:43:08.932864
3	Metz Ramp	Wehnermouth	Borders	98942-8596	1	User::Admin	1	2011-02-17 10:43:09.355742	2011-02-17 10:43:09.467636
4	Connelly Flat	Ericaberg	Lothian	77936-9004	1	User::Agent	2	2011-02-17 10:43:09.864435	2011-02-17 10:43:09.90946
5	Kayla Wall	West Astridville	Berkshire	17039	1	User::Admin	3	2011-02-17 10:43:10.736481	2011-02-17 10:43:10.781368
6	Callie Keys	Whitneychester	Highlands and Islands	88082-7498	1	User::Customer	4	2011-02-17 10:43:10.847806	2011-02-17 10:43:10.898648
\.


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-17 10:43:11.187863	2011-02-17 10:43:11.187863
2	1	en	About us	About us	2011-02-17 10:43:11.216061	2011-02-17 10:43:11.216061
3	2	dk	Privacy	Privacy	2011-02-17 10:43:11.268321	2011-02-17 10:43:11.268321
4	2	en	Privacy	Privacy	2011-02-17 10:43:11.299895	2011-02-17 10:43:11.299895
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-17 10:43:11.356487	2011-02-17 10:43:11.356487
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-17 10:43:11.376727	2011-02-17 10:43:11.376727
7	4	dk	Blurb sign up	Blurb sign up	2011-02-17 10:43:11.430179	2011-02-17 10:43:11.430179
8	4	en	Blurb sign up	Blurb sign up	2011-02-17 10:43:11.450393	2011-02-17 10:43:11.450393
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-17 10:43:11.496713	2011-02-17 10:43:11.496713
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-17 10:43:11.515754	2011-02-17 10:43:11.515754
11	6	dk	Blurb agent home	Blurb agent home	2011-02-17 10:43:11.570136	2011-02-17 10:43:11.570136
12	6	en	Blurb agent home	Blurb agent home	2011-02-17 10:43:11.59551	2011-02-17 10:43:11.59551
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-17 10:43:11.646735	2011-02-17 10:43:11.646735
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-17 10:43:11.664316	2011-02-17 10:43:11.664316
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-17 10:43:11.714588	2011-02-17 10:43:11.714588
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-17 10:43:11.736682	2011-02-17 10:43:11.736682
17	9	dk	Blurb currencies	Blurb currencies	2011-02-17 10:43:11.783187	2011-02-17 10:43:11.783187
18	9	en	Blurb currencies	Blurb currencies	2011-02-17 10:43:11.804774	2011-02-17 10:43:11.804774
19	10	dk	Blurb category home	Blurb category home	2011-02-17 10:43:11.852292	2011-02-17 10:43:11.852292
20	10	en	Blurb category home	Blurb category home	2011-02-17 10:43:11.871971	2011-02-17 10:43:11.871971
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-17 10:43:11.917719	2011-02-17 10:43:11.917719
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-17 10:43:11.935117	2011-02-17 10:43:11.935117
23	12	dk	Reset password	Reset password	2011-02-17 10:43:12.014903	2011-02-17 10:43:12.014903
24	12	en	Reset password	Reset password	2011-02-17 10:43:12.045788	2011-02-17 10:43:12.045788
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id, views_count) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-17 10:43:11.166869	2011-02-17 10:43:11.222688	about_us	t	2011-02-17 10:43:11.222556	\N	\N	0
2	Article::Cms::MainPageArticle	2011-02-17 10:43:11.261726	2011-02-17 10:43:11.306941	privacy	t	2011-02-17 10:43:11.306829	\N	\N	0
3	Article::Cms::MainPageArticle	2011-02-17 10:43:11.350954	2011-02-17 10:43:11.382241	terms_conditions	t	2011-02-17 10:43:11.38213	\N	\N	0
4	Article::Cms::InterfaceContentText	2011-02-17 10:43:11.422479	2011-02-17 10:43:11.455871	blurb_sign_up	t	2011-02-17 10:43:11.455759	\N	\N	0
5	Article::Cms::InterfaceContentText	2011-02-17 10:43:11.490438	2011-02-17 10:43:11.522318	blurb_buyer_home	t	2011-02-17 10:43:11.522211	\N	\N	0
6	Article::Cms::InterfaceContentText	2011-02-17 10:43:11.56211	2011-02-17 10:43:11.603609	blurb_agent_home	t	2011-02-17 10:43:11.603435	\N	\N	0
7	Article::Cms::InterfaceContentText	2011-02-17 10:43:11.638954	2011-02-17 10:43:11.671004	blurb_purchase_manager_home	t	2011-02-17 10:43:11.670873	\N	\N	0
8	Article::Cms::InterfaceContentText	2011-02-17 10:43:11.706623	2011-02-17 10:43:11.743062	blurb_start_page_role_selection	t	2011-02-17 10:43:11.742939	\N	\N	0
9	Article::Cms::InterfaceContentText	2011-02-17 10:43:11.775782	2011-02-17 10:43:11.811954	blurb_currencies	t	2011-02-17 10:43:11.811821	\N	\N	0
10	Article::Cms::InterfaceContentText	2011-02-17 10:43:11.846715	2011-02-17 10:43:11.879288	blurb_category_home	t	2011-02-17 10:43:11.87915	\N	\N	0
11	Article::Cms::InterfaceContentText	2011-02-17 10:43:11.912151	2011-02-17 10:43:11.945646	blurb_leads_listing	t	2011-02-17 10:43:11.945471	\N	\N	0
12	Article::Cms::HelpPopup	2011-02-17 10:43:12.001531	2011-02-17 10:43:12.053108	reset_password	t	2011-02-17 10:43:12.052997	\N	\N	0
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY bank_accounts (id, bank_name, iban_no, local_bank_number, swift, payment_conditions, country_default, created_at, updated_at, global_default) FROM stdin;
1	Default Bank	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-17 10:43:08.892699	2011-02-17 10:43:08.892699	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Possimus eveniet qui dolorem culpa quia.Omnis et commodi pariatur laborum labore.	2011-02-17 10:43:09.647868	2011-02-17 10:43:09.647868	\N	1	2	\N	0	electronics	f	0
2	Leisure	Sed voluptatem impedit consequuntur dicta et officia nesciunt.Excepturi dignissimos nulla eaque quis at voluptas.	2011-02-17 10:43:09.713476	2011-02-17 10:43:09.713476	\N	3	4	\N	0	leisure	f	0
3	Business	Magni quos sequi repellendus.Cupiditate unde corporis rem neque voluptatem veniam.	2011-02-17 10:43:09.775687	2011-02-17 10:43:10.644453	\N	5	6	\N	7	business	f	7
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
1	1	en	Possimus eveniet qui dolorem culpa quia.Omnis et commodi pariatur laborum labore.	Electronics	2011-02-17 10:43:09.659047	2011-02-17 10:43:09.659047
2	1	dk	\N	Electronics	2011-02-17 10:43:09.697589	2011-02-17 10:43:09.697589
3	2	en	Sed voluptatem impedit consequuntur dicta et officia nesciunt.Excepturi dignissimos nulla eaque quis at voluptas.	Leisure	2011-02-17 10:43:09.7187	2011-02-17 10:43:09.7187
4	2	dk	\N	Leisure	2011-02-17 10:43:09.754494	2011-02-17 10:43:09.754494
5	3	en	Magni quos sequi repellendus.Cupiditate unde corporis rem neque voluptatem veniam.	Business	2011-02-17 10:43:09.785693	2011-02-17 10:43:09.785693
6	3	dk	\N	Business	2011-02-17 10:43:09.820214	2011-02-17 10:43:09.820214
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-17 10:43:08.846039	2011-02-17 10:43:08.846039
2	United Kingdom	2011-02-17 10:43:08.854804	2011-02-17 10:43:08.854804
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
1	AUD	A &#36;	%u%n	f	2011-02-17 10:43:09.506844	2011-02-17 10:43:09.506844
2	CAD	C &#36;	%u%n	f	2011-02-17 10:43:09.514652	2011-02-17 10:43:09.514652
3	EUR	&euro;	%u%n	t	2011-02-17 10:43:09.518895	2011-02-17 10:43:09.518895
4	GBP	&pound;	%u%n	f	2011-02-17 10:43:09.524078	2011-02-17 10:43:09.524078
5	JPY	&yen;	%u%n	f	2011-02-17 10:43:09.529593	2011-02-17 10:43:09.529593
6	USD	&#36;	%u%n	f	2011-02-17 10:43:09.535566	2011-02-17 10:43:09.535566
7	NZD	&#36;	%u%n	f	2011-02-17 10:43:09.54117	2011-02-17 10:43:09.54117
8	CHF	CHF	%u %n	f	2011-02-17 10:43:09.54619	2011-02-17 10:43:09.54619
9	HKD	&#36;	%u%n	f	2011-02-17 10:43:09.551615	2011-02-17 10:43:09.551615
10	SGD	&#36;	%u%n	f	2011-02-17 10:43:09.557199	2011-02-17 10:43:09.557199
11	SEK	SEK	%u %n	f	2011-02-17 10:43:09.5633	2011-02-17 10:43:09.5633
12	DKK	DKK	%u %n	t	2011-02-17 10:43:09.570266	2011-02-17 10:43:09.570266
13	PLN	PLN	%u %n	t	2011-02-17 10:43:09.57671	2011-02-17 10:43:09.57671
14	NOK	NOK	%u %n	f	2011-02-17 10:43:09.581563	2011-02-17 10:43:09.581563
15	HUF	HUF	%u %n	f	2011-02-17 10:43:09.587113	2011-02-17 10:43:09.587113
16	CZK	CZK	%u %n	f	2011-02-17 10:43:09.593768	2011-02-17 10:43:09.593768
17	ILS	ILS	%u %n	f	2011-02-17 10:43:09.600922	2011-02-17 10:43:09.600922
18	MXN	MXN	%u %n	f	2011-02-17 10:43:09.606333	2011-02-17 10:43:09.606333
19	PHP	PHP	%u %n	f	2011-02-17 10:43:09.610619	2011-02-17 10:43:09.610619
20	TWD	TWD	%u %n	f	2011-02-17 10:43:09.615582	2011-02-17 10:43:09.615582
21	THB	THB	%u %n	f	2011-02-17 10:43:09.620357	2011-02-17 10:43:09.620357
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-17 10:43:08.973233	2011-02-17 10:43:08.973233
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-17 10:43:08.994459	2011-02-17 10:43:08.994459
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-17 10:43:09.017266	2011-02-17 10:43:09.017266
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-17 10:43:09.035483	2011-02-17 10:43:09.035483
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-17 10:43:09.054236	2011-02-17 10:43:09.054236
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-17 10:43:09.074071	2011-02-17 10:43:09.074071
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-17 10:43:09.091647	2011-02-17 10:43:09.091647
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-17 10:43:09.110224	2011-02-17 10:43:09.110224
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-17 10:43:09.129285	2011-02-17 10:43:09.129285
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-17 10:43:09.147827	2011-02-17 10:43:09.147827
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-17 10:43:09.165244	2011-02-17 10:43:09.165244
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-17 10:43:09.183394	2011-02-17 10:43:09.183394
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-17 10:43:09.202494	2011-02-17 10:43:09.202494
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-17 10:43:09.224798	2011-02-17 10:43:09.224798
15	8	en	<p></p>	Question	2011-02-17 10:43:09.247737	2011-02-17 10:43:09.247737
16	8	dk	<p></p>	[DK] Question	2011-02-17 10:43:09.26552	2011-02-17 10:43:09.26552
17	9	en	<p></p>	Invoice	2011-02-17 10:43:09.288468	2011-02-17 10:43:09.288468
18	9	dk	<p></p>	[DK] Invoice	2011-02-17 10:43:09.30744	2011-02-17 10:43:09.30744
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-17 10:43:08.962274	2011-02-17 10:43:08.989454
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-17 10:43:09.011622	2011-02-17 10:43:09.029435
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-17 10:43:09.048735	2011-02-17 10:43:09.068864
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-17 10:43:09.086216	2011-02-17 10:43:09.1048
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-17 10:43:09.123477	2011-02-17 10:43:09.142792
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-17 10:43:09.159902	2011-02-17 10:43:09.178282
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-17 10:43:09.196604	2011-02-17 10:43:09.216619
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-17 10:43:09.242229	2011-02-17 10:43:09.259519
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-17 10:43:09.281112	2011-02-17 10:43:09.302353
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at, ean_number, details, bank_account_id, seller_id) FROM stdin;
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
1	1	dk	Big deal on printers	Necessitatibus provident ullam dolores minima harum.Ea debitis consequatur aperiam numquam est ut.	Ut deleniti optio dignissimos ea sit esse.Iusto id assumenda qui impedit facere laudantium quia occaecati.	2011-02-17 10:43:10.026751	2011-02-17 10:43:10.026751
2	2	dk	Drills required	Consequatur aut est accusamus nihil est voluptatum exercitationem.Dolor corporis praesentium at.	Voluptas eaque qui repellendus itaque quod.Quod cupiditate quidem laborum commodi necessitatibus nostrum.	2011-02-17 10:43:10.127612	2011-02-17 10:43:10.127612
3	3	dk	Need assistance in selling a car	Officia dolore culpa consequuntur.Esse labore deserunt possimus occaecati repellendus sapiente ut modi.	Accusamus quasi earum non ut est voluptas accusantium.Nesciunt error est rerum esse dicta nobis autem odio.	2011-02-17 10:43:10.224245	2011-02-17 10:43:10.224245
4	4	dk	Ipod shipment	Explicabo hic molestiae at sed ea dolorem.Laborum ratione et qui fugit voluptatem.	Eligendi et praesentium saepe mollitia earum nostrum voluptatem.Enim nisi autem delectus sit cumque mollitia quo sint.	2011-02-17 10:43:10.340271	2011-02-17 10:43:10.340271
5	5	dk	Trip to amazonia - looking for offer	Dolorem rem sunt earum qui blanditiis non.Blanditiis qui tempore mollitia aliquid.	Sint molestiae et incidunt aspernatur.Voluptas iure soluta earum consequatur eveniet.	2011-02-17 10:43:10.449226	2011-02-17 10:43:10.449226
6	6	dk	LCD - Huge amounts	Rerum nam sed nesciunt dolore qui nostrum.Nihil aliquam repellat laudantium ut eos ducimus sed.	Eaque est quia rerum ipsam.Aperiam quidem consequatur molestiae voluptas non ut aut.	2011-02-17 10:43:10.550112	2011-02-17 10:43:10.550112
7	7	dk	GPS receivers required	Quibusdam iure ullam eum.Fuga tempora sit ex pariatur et.	Est facilis cumque est est quo eligendi.Dolores totam veritatis ut.	2011-02-17 10:43:10.655216	2011-02-17 10:43:10.655216
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Ut deleniti optio dignissimos ea sit esse.Iusto id assumenda qui impedit facere laudantium quia occaecati.	Necessitatibus provident ullam dolores minima harum.Ea debitis consequatur aperiam numquam est ut.	2	User::Agent	0	591.0	647.0	1	Hahn	Laurence Spinka MD	(915)657-9733 x23254	jess@schoenward.com	2011-02-17 10:43:09.971976	2011-02-17 10:43:09.971976	2011-02-22	Sammy12979393898611 Kemmer	1	t	\N	0	0	f	f	-1	3	2011-02-17 10:43:09.983996	\N	\N	889 Smitham Street	\N	\N	South Jackelinemouth	38055	Somerset	\N	\N	\N	\N	t
2	Drills required	3	Voluptas eaque qui repellendus itaque quod.Quod cupiditate quidem laborum commodi necessitatibus nostrum.	Consequatur aut est accusamus nihil est voluptatum exercitationem.Dolor corporis praesentium at.	2	User::Agent	0	9.0	23.0	1	Lueilwitz	Gunner Schmeler	100.156.1450	ronaldo@ziemannwilderman.uk	2011-02-17 10:43:10.083936	2011-02-17 10:43:10.083936	2011-02-22	Sammy12979393898611 Kemmer	1	t	\N	0	0	f	f	-1	3	2011-02-17 10:43:10.092175	\N	\N	07350 Cummings Islands	\N	\N	East Yadirachester	65815	Leicestershire	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Accusamus quasi earum non ut est voluptas accusantium.Nesciunt error est rerum esse dicta nobis autem odio.	Officia dolore culpa consequuntur.Esse labore deserunt possimus occaecati repellendus sapiente ut modi.	2	User::Agent	0	154.0	483.0	1	Ziemann	Lucius Hoeger	434.857.6259 x167	kylee@balistreri.biz	2011-02-17 10:43:10.180609	2011-02-17 10:43:10.180609	2011-02-22	Sammy12979393898611 Kemmer	1	t	\N	0	0	f	f	-1	3	2011-02-17 10:43:10.188935	\N	\N	910 Ortiz Square	\N	\N	South Braxtonberg	72937	Dyfed	\N	\N	\N	\N	t
4	Ipod shipment	3	Eligendi et praesentium saepe mollitia earum nostrum voluptatem.Enim nisi autem delectus sit cumque mollitia quo sint.	Explicabo hic molestiae at sed ea dolorem.Laborum ratione et qui fugit voluptatem.	2	User::Agent	0	839.0	911.0	1	Kris	Gilberto Hane	915.845.4988	dejuan@considinethompson.name	2011-02-17 10:43:10.283205	2011-02-17 10:43:10.283205	2011-02-22	Sammy12979393898611 Kemmer	1	t	\N	0	0	f	f	-1	3	2011-02-17 10:43:10.299866	\N	\N	55016 Toy Stravenue	\N	\N	Garryberg	46922	West Sussex	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Sint molestiae et incidunt aspernatur.Voluptas iure soluta earum consequatur eveniet.	Dolorem rem sunt earum qui blanditiis non.Blanditiis qui tempore mollitia aliquid.	2	User::Agent	0	470.0	343.0	1	Hyatt	Aurelie Hegmann I	101-129-9722 x37202	carmel@homenickbartoletti.info	2011-02-17 10:43:10.396059	2011-02-17 10:43:10.396059	2011-02-22	Sammy12979393898611 Kemmer	1	t	\N	0	0	f	f	-1	3	2011-02-17 10:43:10.409538	\N	\N	199 Durgan Gateway	\N	\N	New Elainafurt	68834	Strathclyde	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Eaque est quia rerum ipsam.Aperiam quidem consequatur molestiae voluptas non ut aut.	Rerum nam sed nesciunt dolore qui nostrum.Nihil aliquam repellat laudantium ut eos ducimus sed.	2	User::Agent	0	621.0	313.0	1	Huel	Alan Legros	092.003.0911	misty.dicki@beierauer.com	2011-02-17 10:43:10.505408	2011-02-17 10:43:10.505408	2011-02-22	Sammy12979393898611 Kemmer	1	t	\N	0	0	f	f	-1	3	2011-02-17 10:43:10.514681	\N	\N	9832 Morar Tunnel	\N	\N	North Garrettmouth	18862	Berkshire	\N	\N	\N	\N	t
7	GPS receivers required	3	Est facilis cumque est est quo eligendi.Dolores totam veritatis ut.	Quibusdam iure ullam eum.Fuga tempora sit ex pariatur et.	2	User::Agent	0	437.0	465.0	1	Rippinzulauf	Ramona Berge	779-133-9973 x83877	ali@kozey.info	2011-02-17 10:43:10.607918	2011-02-17 10:43:10.607918	2011-02-22	Sammy12979393898611 Kemmer	1	t	\N	0	0	f	f	-1	3	2011-02-17 10:43:10.617173	\N	\N	778 Osinski Shore	\N	\N	Keelingland	40920-8779	County Londonderry	\N	\N	\N	\N	t
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

COPY sellers (id, name, vat_no, first_name, last_name, "default", created_at, updated_at) FROM stdin;
1	Default Seller	111	Change	Change	t	2011-02-17 10:43:08.927695	2011-02-17 10:43:08.927695
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2011-02-17 10:43:08.717107	2011-02-17 10:43:08.717107
2	default_leads_per_page	--- 5\n	2011-02-17 10:43:08.763904	2011-02-17 10:43:08.763904
3	certification_level_1	--- 10\n	2011-02-17 10:43:08.776271	2011-02-17 10:43:08.776271
4	certification_level_2	--- 20\n	2011-02-17 10:43:08.788013	2011-02-17 10:43:08.788013
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-17 10:43:08.7961	2011-02-17 10:43:08.7961
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-17 10:43:08.802407	2011-02-17 10:43:08.802407
7	invoicing_seller_name	--- Fairleads\n	2011-02-17 10:43:08.807636	2011-02-17 10:43:08.807636
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-17 10:43:08.813188	2011-02-17 10:43:08.813188
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-17 10:43:08.819309	2011-02-17 10:43:08.819309
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-17 10:43:08.82574	2011-02-17 10:43:08.82574
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers, vat_number, not_charge_vat, bank_account_id, category_id, all_deal_values_enabled) FROM stdin;
1	blazejek@gmail.com	892124c407239bd75d3a5494f7d832f861aa4c333176ac0de1044a76b4ef02bb6742032091580fd290525653aa93d6fc469906b437ecedba7e356a80e9799912	nfPJN-uatiFD-5XlokrE	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-17 10:43:09.481402	2011-02-17 10:43:09.37271	\N	2011-02-17 10:43:09.379167	2011-02-17 10:43:09.481837	1	Carol	Davis	(113)915-2358 x1705	root	\N	\N	\N	\N	0	\N	\N	\N	\N	sFMom6beBLs7I0rRFut1M6LXAvaMQyFUCUqCe3NXA1vvVsVtLKoUOy9rEEgMpG	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	cd040baf0399ab7a3cabca40d4c6e8322040044a7ddf616bdb6e6d4bbdf32768ea9322e39a6f350c5f02b7d91b111e88e5f3c03d811d35a1260bc8f2be812150	6Bxnwun9ygYOPIahj8--	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-17 10:43:09.915946	2011-02-17 10:43:09.878764	\N	2011-02-17 10:43:09.884774	2011-02-17 10:43:09.916378	2	Sammy12979393898611	Kemmer	(119)514-1369	Aracely Stiedemann129793938986094	\N	0	\N	\N	0	\N	\N	\N	\N	lfW5cOrWKB7oTdmYj5csZaswR9qluzgE7iswOI51IPpFVTbFBBUympIs5R2V8g	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	65e52e3f369e648751e980c6c41419482f4ea99dc9cd819ce47e89cd871e689d03a8aa52212a3ec6e1bad6db587dd84e73976032cef31a2749f8deb850bdc974	QGMbv22fQItZq3j--ERa	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-17 10:43:10.790544	2011-02-17 10:43:10.748981	\N	2011-02-17 10:43:10.756638	2011-02-17 10:43:10.79107	1	Maximilian	Ankunding	310.967.5146 x946	Ms. Vernice Towne129793939073195	\N	\N	\N	\N	0	\N	\N	\N	\N	MAFtEd2ST3I0ru87Khn2cwEdiN3PeKHJuEjYzdKWK9MHj1av4DyLPKUgchOIde	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	21ae47cca5062e37f648f546ce6a89d9ea9c94816629282d8e7a514dd2e8067c769aa45746cbeddd4736513146485357595f22c2495e97579afdcdd775806527	2pRVAWgydwtjerZBOPJs	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-17 10:43:10.905486	2011-02-17 10:43:10.862044	\N	2011-02-17 10:43:10.872007	2011-02-17 10:43:10.90598	48	Zola	Beier	416.113.7919 x188	Dr. Delphia Daniel129793939084449	\N	\N	\N	\N	0	\N	\N	\N	\N	L9pgHI58PeaN8IuVoIMOmDWOwOycpvD9hrASrOhzcek8zXh8ol9QVic0SkVg2Z	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	fc49a74a11f9dbbdb5a7ac405f96489d5597d00a6f8d80470ad7af98a74cbf66456427ad4134043832426fa21e50cd2a5daf76545664dbd0cc015999038b1e6c	7sN-Umn2r3oLQv-COSW-	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-17 10:43:10.99736	2011-02-17 10:43:10.957571	\N	2011-02-17 10:43:10.957909	2011-02-17 10:43:11.028831	64	Jillian	Stanton	264-675-0586	Violet O'Connell129793939095119	\N	\N	4	\N	0	\N	\N	\N	\N	0kSAzyOhuJL1lnhGWgwtjhAAHsJIulrWCX167W0CjJmtUz0nHqyHCq6i8U1447	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	\N	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

