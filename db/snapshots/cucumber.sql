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

SELECT pg_catalog.setval('addresses_id_seq', 1588, true);


--
-- Name: article_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('article_translations_id_seq', 126, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 114, true);


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('assets_id_seq', 6, true);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('bank_accounts_id_seq', 20, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('categories_id_seq', 1082, true);


--
-- Name: category_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_interests_id_seq', 44, true);


--
-- Name: category_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_translations_id_seq', 1085, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('countries_id_seq', 59, true);


--
-- Name: country_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_interests_id_seq', 2, true);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('currencies_id_seq', 838, true);


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

SELECT pg_catalog.setval('invoice_lines_id_seq', 58, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('invoices_id_seq', 73, true);


--
-- Name: lead_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_purchases_id_seq', 336, true);


--
-- Name: lead_template_field_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_field_translations_id_seq', 19, true);


--
-- Name: lead_template_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_fields_id_seq', 19, true);


--
-- Name: lead_template_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_translations_id_seq', 29, true);


--
-- Name: lead_template_value_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_value_translations_id_seq', 19, true);


--
-- Name: lead_template_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_template_values_id_seq', 19, true);


--
-- Name: lead_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_templates_id_seq', 29, true);


--
-- Name: lead_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_translations_id_seq', 803, true);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('leads_id_seq', 802, true);


--
-- Name: payment_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('payment_notifications_id_seq', 16, true);


--
-- Name: payment_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('payment_transactions_id_seq', 35, true);


--
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sellers_id_seq', 118, true);


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

SELECT pg_catalog.setval('users_id_seq', 1848, true);


--
-- Name: vat_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vat_rates_id_seq', 5, true);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY addresses (id, address_line_1, address_line_2, address_line_3, zip_code, country_id, addressable_type, addressable_id, created_at, updated_at) FROM stdin;
1	Moises Flats	Corwinmouth	Wiltshire	39516	1	BankAccount	1	2011-02-16 12:31:10.327087	2011-02-16 12:31:10.352077
2	Wilburn Forges	North Vladimir	Dorset	13744-9166	1	User::Admin	1	2011-02-16 12:31:10.797762	2011-02-16 12:31:10.908818
3	Myles Garden	Keaganhaven	Merseyside	51696-8580	1	User::Agent	2	2011-02-16 12:31:11.312007	2011-02-16 12:31:11.36361
4	Tito Court	New Georgianaside	West Glamorgan	93717-6269	1	User::Admin	3	2011-02-16 12:31:12.497563	2011-02-16 12:31:12.540385
5	Runte Walks	North Ezekielhaven	Highlands and Islands	57898-4107	1	User::Customer	4	2011-02-16 12:31:12.599196	2011-02-16 12:31:12.646272
\.


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-16 12:31:13.113773	2011-02-16 12:31:13.113773
2	1	en	About us	About us	2011-02-16 12:31:13.3286	2011-02-16 12:31:13.3286
3	2	dk	Privacy	Privacy	2011-02-16 12:31:13.385705	2011-02-16 12:31:13.385705
4	2	en	Privacy	Privacy	2011-02-16 12:31:13.40341	2011-02-16 12:31:13.40341
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-16 12:31:13.457633	2011-02-16 12:31:13.457633
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-16 12:31:13.493017	2011-02-16 12:31:13.493017
7	4	dk	Blurb sign up	Blurb sign up	2011-02-16 12:31:13.553789	2011-02-16 12:31:13.553789
8	4	en	Blurb sign up	Blurb sign up	2011-02-16 12:31:13.585421	2011-02-16 12:31:13.585421
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-16 12:31:13.847406	2011-02-16 12:31:13.847406
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-16 12:31:13.867117	2011-02-16 12:31:13.867117
11	6	dk	Blurb agent home	Blurb agent home	2011-02-16 12:31:14.134634	2011-02-16 12:31:14.134634
12	6	en	Blurb agent home	Blurb agent home	2011-02-16 12:31:14.153215	2011-02-16 12:31:14.153215
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-16 12:31:14.442256	2011-02-16 12:31:14.442256
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-16 12:31:14.460932	2011-02-16 12:31:14.460932
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-16 12:31:14.504989	2011-02-16 12:31:14.504989
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-16 12:31:14.526094	2011-02-16 12:31:14.526094
17	9	dk	Blurb currencies	Blurb currencies	2011-02-16 12:31:14.578221	2011-02-16 12:31:14.578221
18	9	en	Blurb currencies	Blurb currencies	2011-02-16 12:31:14.793482	2011-02-16 12:31:14.793482
19	10	dk	Blurb category home	Blurb category home	2011-02-16 12:31:14.845214	2011-02-16 12:31:14.845214
20	10	en	Blurb category home	Blurb category home	2011-02-16 12:31:14.871741	2011-02-16 12:31:14.871741
21	11	dk	Blurb leads listing	Blurb leads listing	2011-02-16 12:31:14.924788	2011-02-16 12:31:14.924788
22	11	en	Blurb leads listing	Blurb leads listing	2011-02-16 12:31:14.94888	2011-02-16 12:31:14.94888
23	12	dk	Reset password	Reset password	2011-02-16 12:31:15.0254	2011-02-16 12:31:15.0254
24	12	en	Reset password	Reset password	2011-02-16 12:31:15.046047	2011-02-16 12:31:15.046047
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id, views_count) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-16 12:31:13.100212	2011-02-16 12:31:13.334952	about_us	t	2011-02-16 12:31:13.334847	\N	\N	0
2	Article::Cms::MainPageArticle	2011-02-16 12:31:13.378953	2011-02-16 12:31:13.409073	privacy	t	2011-02-16 12:31:13.408966	\N	\N	0
3	Article::Cms::MainPageArticle	2011-02-16 12:31:13.451311	2011-02-16 12:31:13.499411	terms_conditions	t	2011-02-16 12:31:13.499289	\N	\N	0
4	Article::Cms::InterfaceContentText	2011-02-16 12:31:13.545452	2011-02-16 12:31:13.799989	blurb_sign_up	t	2011-02-16 12:31:13.7998	\N	\N	0
5	Article::Cms::InterfaceContentText	2011-02-16 12:31:13.841603	2011-02-16 12:31:13.883841	blurb_buyer_home	t	2011-02-16 12:31:13.883727	\N	\N	0
6	Article::Cms::InterfaceContentText	2011-02-16 12:31:14.129212	2011-02-16 12:31:14.160467	blurb_agent_home	t	2011-02-16 12:31:14.16033	\N	\N	0
7	Article::Cms::InterfaceContentText	2011-02-16 12:31:14.436597	2011-02-16 12:31:14.466755	blurb_purchase_manager_home	t	2011-02-16 12:31:14.466653	\N	\N	0
8	Article::Cms::InterfaceContentText	2011-02-16 12:31:14.499328	2011-02-16 12:31:14.535355	blurb_start_page_role_selection	t	2011-02-16 12:31:14.535197	\N	\N	0
9	Article::Cms::InterfaceContentText	2011-02-16 12:31:14.572763	2011-02-16 12:31:14.799897	blurb_currencies	t	2011-02-16 12:31:14.799784	\N	\N	0
10	Article::Cms::InterfaceContentText	2011-02-16 12:31:14.838375	2011-02-16 12:31:14.883658	blurb_category_home	t	2011-02-16 12:31:14.883517	\N	\N	0
11	Article::Cms::InterfaceContentText	2011-02-16 12:31:14.918405	2011-02-16 12:31:14.954363	blurb_leads_listing	t	2011-02-16 12:31:14.954256	\N	\N	0
12	Article::Cms::HelpPopup	2011-02-16 12:31:15.007132	2011-02-16 12:31:15.052235	reset_password	t	2011-02-16 12:31:15.052122	\N	\N	0
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
1	Default Bank	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-16 12:31:10.346877	2011-02-16 12:31:10.346877	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Doloribus ea corporis et nostrum commodi corrupti aliquid.Fuga magni expedita quasi.	2011-02-16 12:31:11.105781	2011-02-16 12:31:11.105781	\N	1	2	\N	0	electronics	f	0
2	Leisure	Porro sint qui aut tempore.Nam inventore illo nulla natus molestias nesciunt earum.	2011-02-16 12:31:11.177005	2011-02-16 12:31:11.177005	\N	3	4	\N	0	leisure	f	0
3	Business	Quae ex rem debitis.Repellat consequuntur dolores sit.	2011-02-16 12:31:11.231542	2011-02-16 12:31:12.399391	\N	5	6	\N	7	business	f	7
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
1	1	en	Doloribus ea corporis et nostrum commodi corrupti aliquid.Fuga magni expedita quasi.	Electronics	2011-02-16 12:31:11.118846	2011-02-16 12:31:11.118846
2	1	dk	\N	Electronics	2011-02-16 12:31:11.16195	2011-02-16 12:31:11.16195
3	2	en	Porro sint qui aut tempore.Nam inventore illo nulla natus molestias nesciunt earum.	Leisure	2011-02-16 12:31:11.182367	2011-02-16 12:31:11.182367
4	2	dk	\N	Leisure	2011-02-16 12:31:11.211962	2011-02-16 12:31:11.211962
5	3	en	Quae ex rem debitis.Repellat consequuntur dolores sit.	Business	2011-02-16 12:31:11.237857	2011-02-16 12:31:11.237857
6	3	dk	\N	Business	2011-02-16 12:31:11.268473	2011-02-16 12:31:11.268473
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-16 12:31:10.299262	2011-02-16 12:31:10.299262
2	United Kingdom	2011-02-16 12:31:10.309814	2011-02-16 12:31:10.309814
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
1	AUD	A &#36;	%u%n	f	2011-02-16 12:31:10.936783	2011-02-16 12:31:10.936783
2	CAD	C &#36;	%u%n	f	2011-02-16 12:31:10.945573	2011-02-16 12:31:10.945573
3	EUR	&euro;	%u%n	t	2011-02-16 12:31:10.949972	2011-02-16 12:31:10.949972
4	GBP	&pound;	%u%n	f	2011-02-16 12:31:10.955128	2011-02-16 12:31:10.955128
5	JPY	&yen;	%u%n	f	2011-02-16 12:31:10.961022	2011-02-16 12:31:10.961022
6	USD	&#36;	%u%n	f	2011-02-16 12:31:10.967379	2011-02-16 12:31:10.967379
7	NZD	&#36;	%u%n	f	2011-02-16 12:31:10.973303	2011-02-16 12:31:10.973303
8	CHF	CHF	%u %n	f	2011-02-16 12:31:10.979102	2011-02-16 12:31:10.979102
9	HKD	&#36;	%u%n	f	2011-02-16 12:31:10.9857	2011-02-16 12:31:10.9857
10	SGD	&#36;	%u%n	f	2011-02-16 12:31:10.992363	2011-02-16 12:31:10.992363
11	SEK	SEK	%u %n	f	2011-02-16 12:31:11.005798	2011-02-16 12:31:11.005798
12	DKK	DKK	%u %n	t	2011-02-16 12:31:11.013511	2011-02-16 12:31:11.013511
13	PLN	PLN	%u %n	t	2011-02-16 12:31:11.020644	2011-02-16 12:31:11.020644
14	NOK	NOK	%u %n	f	2011-02-16 12:31:11.02768	2011-02-16 12:31:11.02768
15	HUF	HUF	%u %n	f	2011-02-16 12:31:11.033617	2011-02-16 12:31:11.033617
16	CZK	CZK	%u %n	f	2011-02-16 12:31:11.039749	2011-02-16 12:31:11.039749
17	ILS	ILS	%u %n	f	2011-02-16 12:31:11.046613	2011-02-16 12:31:11.046613
18	MXN	MXN	%u %n	f	2011-02-16 12:31:11.053252	2011-02-16 12:31:11.053252
19	PHP	PHP	%u %n	f	2011-02-16 12:31:11.059199	2011-02-16 12:31:11.059199
20	TWD	TWD	%u %n	f	2011-02-16 12:31:11.065204	2011-02-16 12:31:11.065204
21	THB	THB	%u %n	f	2011-02-16 12:31:11.072196	2011-02-16 12:31:11.072196
818	AUD	A &#36;	%u%n	f	2011-02-16 14:46:07.371498	2011-02-16 14:46:07.371498
819	CAD	C &#36;	%u%n	f	2011-02-16 14:46:07.380399	2011-02-16 14:46:07.380399
820	EUR	&euro;	%u%n	t	2011-02-16 14:46:07.385537	2011-02-16 14:46:07.385537
821	GBP	&pound;	%u%n	f	2011-02-16 14:46:07.391795	2011-02-16 14:46:07.391795
822	JPY	&yen;	%u%n	f	2011-02-16 14:46:07.397748	2011-02-16 14:46:07.397748
823	USD	&#36;	%u%n	f	2011-02-16 14:46:07.402671	2011-02-16 14:46:07.402671
824	NZD	&#36;	%u%n	f	2011-02-16 14:46:07.407674	2011-02-16 14:46:07.407674
825	CHF	CHF	%u %n	f	2011-02-16 14:46:07.41349	2011-02-16 14:46:07.41349
826	HKD	&#36;	%u%n	f	2011-02-16 14:46:07.419438	2011-02-16 14:46:07.419438
827	SGD	&#36;	%u%n	f	2011-02-16 14:46:07.425712	2011-02-16 14:46:07.425712
828	SEK	SEK	%u %n	f	2011-02-16 14:46:07.431321	2011-02-16 14:46:07.431321
829	DKK	DKK	%u %n	t	2011-02-16 14:46:07.437296	2011-02-16 14:46:07.437296
830	PLN	PLN	%u %n	t	2011-02-16 14:46:07.443206	2011-02-16 14:46:07.443206
831	NOK	NOK	%u %n	f	2011-02-16 14:46:07.448225	2011-02-16 14:46:07.448225
832	HUF	HUF	%u %n	f	2011-02-16 14:46:07.453451	2011-02-16 14:46:07.453451
833	CZK	CZK	%u %n	f	2011-02-16 14:46:07.463898	2011-02-16 14:46:07.463898
834	ILS	ILS	%u %n	f	2011-02-16 14:46:07.469829	2011-02-16 14:46:07.469829
835	MXN	MXN	%u %n	f	2011-02-16 14:46:07.474764	2011-02-16 14:46:07.474764
836	PHP	PHP	%u %n	f	2011-02-16 14:46:07.47969	2011-02-16 14:46:07.47969
837	TWD	TWD	%u %n	f	2011-02-16 14:46:07.485651	2011-02-16 14:46:07.485651
838	THB	THB	%u %n	f	2011-02-16 14:46:07.491591	2011-02-16 14:46:07.491591
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-16 12:31:10.416868	2011-02-16 12:31:10.416868
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-16 12:31:10.443193	2011-02-16 12:31:10.443193
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-16 12:31:10.464415	2011-02-16 12:31:10.464415
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-16 12:31:10.48158	2011-02-16 12:31:10.48158
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-16 12:31:10.499471	2011-02-16 12:31:10.499471
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-16 12:31:10.517439	2011-02-16 12:31:10.517439
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-16 12:31:10.536094	2011-02-16 12:31:10.536094
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-16 12:31:10.554557	2011-02-16 12:31:10.554557
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-16 12:31:10.573789	2011-02-16 12:31:10.573789
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-16 12:31:10.591983	2011-02-16 12:31:10.591983
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-16 12:31:10.612097	2011-02-16 12:31:10.612097
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-16 12:31:10.629228	2011-02-16 12:31:10.629228
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-16 12:31:10.646843	2011-02-16 12:31:10.646843
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-16 12:31:10.66645	2011-02-16 12:31:10.66645
15	8	en	<p></p>	Question	2011-02-16 12:31:10.685246	2011-02-16 12:31:10.685246
16	8	dk	<p></p>	[DK] Question	2011-02-16 12:31:10.702592	2011-02-16 12:31:10.702592
17	9	en	<p></p>	Invoice	2011-02-16 12:31:10.725064	2011-02-16 12:31:10.725064
18	9	dk	<p></p>	[DK] Invoice	2011-02-16 12:31:10.74487	2011-02-16 12:31:10.74487
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-16 12:31:10.405078	2011-02-16 12:31:10.435622
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-16 12:31:10.456946	2011-02-16 12:31:10.47635
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-16 12:31:10.494174	2011-02-16 12:31:10.512411
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-16 12:31:10.530773	2011-02-16 12:31:10.549124
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-16 12:31:10.568412	2011-02-16 12:31:10.586929
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-16 12:31:10.606062	2011-02-16 12:31:10.624143
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-16 12:31:10.641384	2011-02-16 12:31:10.661382
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-16 12:31:10.679794	2011-02-16 12:31:10.697506
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-16 12:31:10.718556	2011-02-16 12:31:10.73912
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
1	1	dk	Big deal on printers	Excepturi pariatur rerum cupiditate similique praesentium nihil id.Dolores ut suscipit id animi.	Id quis rerum praesentium.Ullam eos qui esse odit recusandae natus.	2011-02-16 12:31:11.483331	2011-02-16 12:31:11.483331
2	2	dk	Drills required	Quo ipsum veritatis et explicabo architecto laboriosam quasi.Ab ex aut perspiciatis ut.	Qui eum nostrum fuga laboriosam accusamus.Impedit unde aspernatur voluptas cupiditate ipsam placeat dolor eius.	2011-02-16 12:31:11.585676	2011-02-16 12:31:11.585676
3	3	dk	Need assistance in selling a car	Itaque dolorem repellat quia similique architecto nemo suscipit.Accusamus tenetur temporibus laudantium molestias excepturi magnam veniam.	Non non odit enim odio repellendus nostrum similique.Ducimus blanditiis porro incidunt fugiat minima laudantium.	2011-02-16 12:31:11.694516	2011-02-16 12:31:11.694516
4	4	dk	Ipod shipment	Nisi impedit et quae officiis inventore error assumenda dolorem.Repellendus est provident reiciendis illum nam numquam aut.	Molestiae tempore aspernatur quis voluptatem dolore ullam porro.Quae aut aut sapiente nisi optio doloremque architecto.	2011-02-16 12:31:11.881073	2011-02-16 12:31:11.881073
5	5	dk	Trip to amazonia - looking for offer	Quis est provident molestiae.Ut tempora sed quis error.	Libero aut ad minima quisquam.Provident reiciendis veniam hic totam officiis fugiat asperiores.	2011-02-16 12:31:12.197942	2011-02-16 12:31:12.197942
6	6	dk	LCD - Huge amounts	Fugiat est est aspernatur voluptatem ab laboriosam.Fuga vel corporis consequuntur quaerat maxime assumenda facilis.	Doloremque animi est et rem iste ut aut eligendi.Quia dolore cum dolor ut natus temporibus vero.	2011-02-16 12:31:12.307188	2011-02-16 12:31:12.307188
7	7	dk	GPS receivers required	Ut doloremque quia quae sit consequatur.Soluta libero illum dignissimos esse amet quisquam dolorem delectus.	Ut veniam voluptates odit alias praesentium autem officia explicabo.Pariatur unde tenetur vel repudiandae voluptas rerum facilis.	2011-02-16 12:31:12.411733	2011-02-16 12:31:12.411733
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Id quis rerum praesentium.Ullam eos qui esse odit recusandae natus.	Excepturi pariatur rerum cupiditate similique praesentium nihil id.Dolores ut suscipit id animi.	2	User::Agent	0	818.0	851.0	1	Kutch	Waldo Cremin	682-153-3329 x6716	paolo@mclaughlin.uk	2011-02-16 12:31:11.426859	2011-02-16 12:31:11.426859	2011-02-21	Wellington129785947130858 Ebert	1	t	\N	0	0	f	f	-1	3	2011-02-16 12:31:11.440256	\N	\N	394 Vesta Square	\N	\N	Carolinaside	59953-3209	Kent	\N	\N	\N	\N	t
2	Drills required	3	Qui eum nostrum fuga laboriosam accusamus.Impedit unde aspernatur voluptas cupiditate ipsam placeat dolor eius.	Quo ipsum veritatis et explicabo architecto laboriosam quasi.Ab ex aut perspiciatis ut.	2	User::Agent	0	667.0	297.0	1	Cole	Mohammad O'Hara	(069)570-3032	dave_stanton@lehner.info	2011-02-16 12:31:11.540382	2011-02-16 12:31:11.540382	2011-02-21	Wellington129785947130858 Ebert	1	t	\N	0	0	f	f	-1	3	2011-02-16 12:31:11.550571	\N	\N	189 Rowan Estate	\N	\N	Rosemarieberg	75503-2925	Lothian	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Non non odit enim odio repellendus nostrum similique.Ducimus blanditiis porro incidunt fugiat minima laudantium.	Itaque dolorem repellat quia similique architecto nemo suscipit.Accusamus tenetur temporibus laudantium molestias excepturi magnam veniam.	2	User::Agent	0	546.0	905.0	1	Ratkemckenzie	Mr. Keanu Yundt	1-364-441-8601 x1411	wava@faheykunze.us	2011-02-16 12:31:11.649063	2011-02-16 12:31:11.649063	2011-02-21	Wellington129785947130858 Ebert	1	t	\N	0	0	f	f	-1	3	2011-02-16 12:31:11.65886	\N	\N	8112 Sonny Expressway	\N	\N	East Glendaburgh	93065-0134	West Sussex	\N	\N	\N	\N	t
4	Ipod shipment	3	Molestiae tempore aspernatur quis voluptatem dolore ullam porro.Quae aut aut sapiente nisi optio doloremque architecto.	Nisi impedit et quae officiis inventore error assumenda dolorem.Repellendus est provident reiciendis illum nam numquam aut.	2	User::Agent	0	753.0	257.0	1	Welchbradtke	Moshe Metz	178-802-9522	isom_rippin@vonruedenklocko.ca	2011-02-16 12:31:11.826802	2011-02-16 12:31:11.826802	2011-02-21	Wellington129785947130858 Ebert	1	t	\N	0	0	f	f	-1	3	2011-02-16 12:31:11.836846	\N	\N	651 Koss Spur	\N	\N	Katelynfurt	96956	Norfolk	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Libero aut ad minima quisquam.Provident reiciendis veniam hic totam officiis fugiat asperiores.	Quis est provident molestiae.Ut tempora sed quis error.	2	User::Agent	0	357.0	148.0	1	Zemlak	Lucienne Lang	502.810.1834	margaret_crona@dooley.info	2011-02-16 12:31:12.153283	2011-02-16 12:31:12.153283	2011-02-21	Wellington129785947130858 Ebert	1	t	\N	0	0	f	f	-1	3	2011-02-16 12:31:12.163472	\N	\N	5391 Maximillian Knoll	\N	\N	North Sierra	32227	Hertfordshire	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Doloremque animi est et rem iste ut aut eligendi.Quia dolore cum dolor ut natus temporibus vero.	Fugiat est est aspernatur voluptatem ab laboriosam.Fuga vel corporis consequuntur quaerat maxime assumenda facilis.	2	User::Agent	0	335.0	616.0	1	Hegmann	Irma Balistreri	334.432.0771	eloy@skilesgorczany.uk	2011-02-16 12:31:12.258835	2011-02-16 12:31:12.258835	2011-02-21	Wellington129785947130858 Ebert	1	t	\N	0	0	f	f	-1	3	2011-02-16 12:31:12.26748	\N	\N	1772 Grady Fields	\N	\N	Waltertown	74926	Gloucestershire	\N	\N	\N	\N	t
7	GPS receivers required	3	Ut veniam voluptates odit alias praesentium autem officia explicabo.Pariatur unde tenetur vel repudiandae voluptas rerum facilis.	Ut doloremque quia quae sit consequatur.Soluta libero illum dignissimos esse amet quisquam dolorem delectus.	2	User::Agent	0	528.0	103.0	1	Cummings	Katharina Wunsch	897.130.1974 x94795	demarcus_bayer@watsica.info	2011-02-16 12:31:12.361291	2011-02-16 12:31:12.361291	2011-02-21	Wellington129785947130858 Ebert	1	t	\N	0	0	f	f	-1	3	2011-02-16 12:31:12.371927	\N	\N	603 Desmond Park	\N	\N	Wolfffort	81981	Surrey	\N	\N	\N	\N	t
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
1	Default Seller	Change	111	Change	Change	1	t	2011-02-16 12:31:10.374859	2011-02-16 12:31:10.374859
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2011-02-16 12:31:10.206614	2011-02-16 12:31:10.206614
2	default_leads_per_page	--- 5\n	2011-02-16 12:31:10.217654	2011-02-16 12:31:10.217654
3	certification_level_1	--- 10\n	2011-02-16 12:31:10.225696	2011-02-16 12:31:10.225696
4	certification_level_2	--- 20\n	2011-02-16 12:31:10.235101	2011-02-16 12:31:10.235101
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-16 12:31:10.241981	2011-02-16 12:31:10.241981
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-16 12:31:10.249462	2011-02-16 12:31:10.249462
7	invoicing_seller_name	--- Fairleads\n	2011-02-16 12:31:10.256147	2011-02-16 12:31:10.256147
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-16 12:31:10.26295	2011-02-16 12:31:10.26295
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-16 12:31:10.270537	2011-02-16 12:31:10.270537
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-16 12:31:10.278285	2011-02-16 12:31:10.278285
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
1	blazejek@gmail.com	edba0d69a59302fea304c94cf49fd9ec72fcce9830b13fd5df1bd1828fb510e7259b381ab0fc45f3928d02952a00d3392f461d8c9cb5ab64a7d19446d4a46c83	QAf6lTfE2Lui-Po_kjrf	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 12:31:10.917591	2011-02-16 12:31:10.812712	\N	2011-02-16 12:31:10.818987	2011-02-16 12:31:10.918067	1	Deron	Leuschke	(302)106-9614	root	\N	\N	\N	\N	0	\N	\N	\N	\N	jbjoOS8koMDBzyIwhLA0yw2ALJviKYiaMbFVIaUtZuTye5LuRov0AzZhEy3So3	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	fd702cb67d2fb4b3edc80b2a9a52e293eafb5751d950f2c59f99a87556dbd1b8d200d6a2180a7bde0213435b8a90c7badde1d3a9fe3b41830b830bd732043227	f1DLAwDgMl5GzjyfuG31	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 12:31:11.374951	2011-02-16 12:31:11.329534	\N	2011-02-16 12:31:11.337025	2011-02-16 12:31:11.375401	2	Wellington129785947130858	Ebert	544-372-0332 x07437	Lyla Koch129785947130842	\N	0	\N	\N	0	\N	\N	\N	\N	kZ02bN80N7Jky175xZgC760wgmzDP9bniurUNhAS1aBkEr2ltUFfbyNLyG0RsT	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	b5bbb7340a43f111060a1aa3afc1f102a4f8aa1070663bc0e8e65639f0583fae80b3c6c49b606cb95b67f4392baae3e123e1ddb13b77c1c0f998262e51599347	SIEqbJn1wQaPVz-jZ5RV	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 12:31:12.547028	2011-02-16 12:31:12.510947	\N	2011-02-16 12:31:12.516773	2011-02-16 12:31:12.547484	1	Kenny	Hessel	1-341-669-5292	Letha Pfeffer129785947249232	\N	\N	\N	\N	0	\N	\N	\N	\N	1LoKxuCTqbLXLKJnBG8k4DuxnuGYphD6jCxIZjl1HBA9wmbkkm9EJkDaznqoFW	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	723ee27ccc138f7193695bbfde546f434e64f27f8c0ee0d43e44e29d9e15d6a9b8466d036b3e88cf514367803948f7b1f235f354315daa7d587473d742f4d691	ToBP_REsbRuf6mc_2ecy	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 12:31:12.652866	2011-02-16 12:31:12.613011	\N	2011-02-16 12:31:12.619999	2011-02-16 12:31:12.653398	48	Domingo	Hartmann	1-773-115-2210	Mylene Cummings129785947259583	\N	\N	\N	\N	0	\N	\N	\N	\N	r10Ncq84UQSnvqmlDxvG1GeYKfDnfrzaf1jMlSK7ZGCUT7gZFBFzLGmcwx952j	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	f7508829965a7de54be47abf14ca01bce6dbe9ebcaea284234bf0ebaec162825d22cb7d8df9b9142d935fe711e5ffd42ca6749ca01d961c578e7d69a6b58d8f6	D1ZNrIFZEljtAa1zUuxJ	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-16 12:31:12.929878	2011-02-16 12:31:12.70411	\N	2011-02-16 12:31:12.704455	2011-02-16 12:31:12.970112	64	Nolan	Turcotte	(882)309-5858	Mr. Camille Bednar129785947269808	\N	\N	4	\N	0	\N	\N	\N	\N	pFQYsT3woKA9YsDozndN5bsJONFBMa7wZN39qPbmQAVR7PAGelcg62uJddzYMq	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	\N	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

