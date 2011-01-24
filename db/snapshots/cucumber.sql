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
1	1	dk	About us	About us	2011-01-24 08:29:52.710792	2011-01-24 08:29:52.710792
2	1	en	About us	About us	2011-01-24 08:29:52.739692	2011-01-24 08:29:52.739692
3	2	dk	Privacy	Privacy	2011-01-24 08:29:52.790426	2011-01-24 08:29:52.790426
4	2	en	Privacy	Privacy	2011-01-24 08:29:52.80813	2011-01-24 08:29:52.80813
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-24 08:29:52.855239	2011-01-24 08:29:52.855239
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-24 08:29:52.874894	2011-01-24 08:29:52.874894
7	4	dk	Blurb sign up	Blurb sign up	2011-01-24 08:29:52.920801	2011-01-24 08:29:52.920801
8	4	en	Blurb sign up	Blurb sign up	2011-01-24 08:29:52.940763	2011-01-24 08:29:52.940763
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-24 08:29:52.997472	2011-01-24 08:29:52.997472
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-24 08:29:53.018085	2011-01-24 08:29:53.018085
11	6	dk	Blurb agent home	Blurb agent home	2011-01-24 08:29:53.065775	2011-01-24 08:29:53.065775
12	6	en	Blurb agent home	Blurb agent home	2011-01-24 08:29:53.083604	2011-01-24 08:29:53.083604
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-24 08:29:53.127851	2011-01-24 08:29:53.127851
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-24 08:29:53.147411	2011-01-24 08:29:53.147411
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-24 08:29:53.189528	2011-01-24 08:29:53.189528
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-24 08:29:53.209211	2011-01-24 08:29:53.209211
17	9	dk	Blurb currencies	Blurb currencies	2011-01-24 08:29:53.259632	2011-01-24 08:29:53.259632
18	9	en	Blurb currencies	Blurb currencies	2011-01-24 08:29:53.284623	2011-01-24 08:29:53.284623
19	10	dk	Reset password	Reset password	2011-01-24 08:29:53.334261	2011-01-24 08:29:53.334261
20	10	en	Reset password	Reset password	2011-01-24 08:29:53.355904	2011-01-24 08:29:53.355904
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-24 08:29:52.6999	2011-01-24 08:29:52.746272	about_us	0	t	2011-01-24 08:29:52.746149
2	Article::Cms	2011-01-24 08:29:52.784851	2011-01-24 08:29:52.813955	privacy	0	t	2011-01-24 08:29:52.813841
3	Article::Cms	2011-01-24 08:29:52.849841	2011-01-24 08:29:52.881755	terms_conditions	0	t	2011-01-24 08:29:52.88159
4	Article::Cms	2011-01-24 08:29:52.915257	2011-01-24 08:29:52.950698	blurb_sign_up	1	t	2011-01-24 08:29:52.950522
5	Article::Cms	2011-01-24 08:29:52.99197	2011-01-24 08:29:53.026727	blurb_buyer_home	1	t	2011-01-24 08:29:53.026612
6	Article::Cms	2011-01-24 08:29:53.060319	2011-01-24 08:29:53.089351	blurb_agent_home	1	t	2011-01-24 08:29:53.089228
7	Article::Cms	2011-01-24 08:29:53.122348	2011-01-24 08:29:53.153124	blurb_purchase_manager_home	1	t	2011-01-24 08:29:53.153015
8	Article::Cms	2011-01-24 08:29:53.183894	2011-01-24 08:29:53.215508	blurb_start_page_role_selection	1	t	2011-01-24 08:29:53.215402
9	Article::Cms	2011-01-24 08:29:53.251506	2011-01-24 08:29:53.290993	blurb_currencies	1	t	2011-01-24 08:29:53.290885
10	Article::Cms	2011-01-24 08:29:53.328784	2011-01-24 08:29:53.361567	reset_password	2	t	2011-01-24 08:29:53.36146
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-01-24 08:29:50.690626	2011-01-24 08:29:50.690626	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Minus voluptatem fugit ut rem facilis consequuntur.Quidem ea odio deleniti inventore itaque fugit excepturi sunt.	2011-01-24 08:29:51.322083	2011-01-24 08:29:51.322083	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Aut minima aut maiores temporibus tempora ex aut.Ut esse consequatur repellendus necessitatibus iure nesciunt.	2011-01-24 08:29:51.38631	2011-01-24 08:29:51.38631	\N	3	4	\N	0	2-leisure	f	0
3	Business	Ex quis cumque nihil ad.Unde velit vero ullam adipisci.	2011-01-24 08:29:51.444896	2011-01-24 08:29:52.233457	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Minus voluptatem fugit ut rem facilis consequuntur.Quidem ea odio deleniti inventore itaque fugit excepturi sunt.	Electronics	2011-01-24 08:29:51.332908	2011-01-24 08:29:51.332908
2	1	dk	\N	Electronics	2011-01-24 08:29:51.367442	2011-01-24 08:29:51.367442
3	2	en	Aut minima aut maiores temporibus tempora ex aut.Ut esse consequatur repellendus necessitatibus iure nesciunt.	Leisure	2011-01-24 08:29:51.394079	2011-01-24 08:29:51.394079
4	2	dk	\N	Leisure	2011-01-24 08:29:51.425082	2011-01-24 08:29:51.425082
5	3	en	Ex quis cumque nihil ad.Unde velit vero ullam adipisci.	Business	2011-01-24 08:29:51.450759	2011-01-24 08:29:51.450759
6	3	dk	\N	Business	2011-01-24 08:29:51.478028	2011-01-24 08:29:51.478028
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-24 08:29:50.659992	2011-01-24 08:29:50.659992
2	United Kingdom	2011-01-24 08:29:50.668275	2011-01-24 08:29:50.668275
3	Scotland129585779151768	2011-01-24 08:29:51.519346	2011-01-24 08:29:51.519346
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
1	Euro	&euro;	%u%n	t	2011-01-24 08:29:51.287387	2011-01-24 08:29:51.287387
2	PLN	&pln;	%u%n	t	2011-01-24 08:29:51.296034	2011-01-24 08:29:51.296034
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-01-24 08:29:50.731618	2011-01-24 08:29:50.731618
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-01-24 08:29:50.757236	2011-01-24 08:29:50.757236
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-01-24 08:29:50.777781	2011-01-24 08:29:50.777781
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-01-24 08:29:50.795089	2011-01-24 08:29:50.795089
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-01-24 08:29:50.817682	2011-01-24 08:29:50.817682
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-01-24 08:29:50.837275	2011-01-24 08:29:50.837275
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-01-24 08:29:50.855317	2011-01-24 08:29:50.855317
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-01-24 08:29:50.872483	2011-01-24 08:29:50.872483
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-01-24 08:29:50.892417	2011-01-24 08:29:50.892417
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-01-24 08:29:50.915187	2011-01-24 08:29:50.915187
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-01-24 08:29:50.933758	2011-01-24 08:29:50.933758
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-01-24 08:29:50.951394	2011-01-24 08:29:50.951394
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-01-24 08:29:50.971289	2011-01-24 08:29:50.971289
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-01-24 08:29:50.990515	2011-01-24 08:29:50.990515
15	8	en	<p></p>	Question	2011-01-24 08:29:51.009352	2011-01-24 08:29:51.009352
16	8	dk	<p></p>	[DK] Question	2011-01-24 08:29:51.033624	2011-01-24 08:29:51.033624
17	9	en	<p></p>	Invoice	2011-01-24 08:29:51.058067	2011-01-24 08:29:51.058067
18	9	dk	<p></p>	[DK] Invoice	2011-01-24 08:29:51.078961	2011-01-24 08:29:51.078961
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-24 08:29:50.719477	2011-01-24 08:29:50.749988
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-24 08:29:50.770688	2011-01-24 08:29:50.789947
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-24 08:29:50.812162	2011-01-24 08:29:50.831396
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-24 08:29:50.849842	2011-01-24 08:29:50.867436
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-24 08:29:50.886857	2011-01-24 08:29:50.906381
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-24 08:29:50.928358	2011-01-24 08:29:50.946282
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-24 08:29:50.965521	2011-01-24 08:29:50.985074
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-24 08:29:51.003148	2011-01-24 08:29:51.027844
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-24 08:29:51.049372	2011-01-24 08:29:51.073458
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, pkwiu, unit, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at, ean_number, details) FROM stdin;
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
1	1	dk	Big deal on printers	Dolorem provident nostrum nemo.Cupiditate qui repudiandae molestiae est porro iure consequatur vel.	Ratione blanditiis voluptate ut sed debitis molestiae quia aut.Nihil ducimus tempore aliquam ea.	2011-01-24 08:29:51.665294	2011-01-24 08:29:51.665294
2	2	dk	Drills required	Quas quia ipsam occaecati nisi nihil maxime dolore aperiam.Quasi quo consequatur est ullam cum.	Molestiae ut magni rem.Quod aliquid ullam et.	2011-01-24 08:29:51.761294	2011-01-24 08:29:51.761294
3	3	dk	Need assistance in selling a car	Omnis quidem nihil voluptatum vitae et saepe accusamus.Vero omnis nostrum modi ut veritatis quis maiores nulla.	Vel dignissimos eaque molestiae.Labore qui velit ipsa corrupti voluptates quam.	2011-01-24 08:29:51.852706	2011-01-24 08:29:51.852706
4	4	dk	Ipod shipment	Qui et quos at odit corrupti rerum id quisquam.Laboriosam sint impedit quos aut.	Aut neque consequatur voluptatem perferendis ut.Vero qui molestiae quisquam.	2011-01-24 08:29:51.944832	2011-01-24 08:29:51.944832
5	5	dk	Trip to amazonia - looking for offer	Tenetur adipisci nostrum enim fuga rem occaecati.Sequi maxime nemo ipsum voluptate laudantium ex quasi qui.	Dolore autem dicta nostrum iure maxime.A soluta dolores sapiente magni necessitatibus.	2011-01-24 08:29:52.047255	2011-01-24 08:29:52.047255
6	6	dk	LCD - Huge amounts	Ut quas facere vero.Blanditiis soluta sit iure eos.	Id mollitia qui itaque dolor et quis.Aut repellat enim quis quae accusamus quas.	2011-01-24 08:29:52.140627	2011-01-24 08:29:52.140627
7	7	dk	GPS receivers required	Autem dignissimos officia ut beatae.Delectus voluptate ea nulla cupiditate et eum velit molestiae.	Tempora omnis enim quo quisquam dicta non sint.Eum expedita nam at et nesciunt et.	2011-01-24 08:29:52.244507	2011-01-24 08:29:52.244507
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Dolorem provident nostrum nemo.Cupiditate qui repudiandae molestiae est porro iure consequatur vel.	Ratione blanditiis voluptate ut sed debitis molestiae quia aut.Nihil ducimus tempore aliquam ea.	2	User::Agent	0	438.0	617.0	1	Walter	Jo Langosh III	058.893.4313 x26751	mara.aufderhar@erdman.us	2011-01-24 08:29:51.613246	2011-01-24 08:29:51.613246	2011-01-29	Khalil129585779151683 Mitchell	1	t	\N	0	0	f	f	-1	1	2011-01-24 08:29:51.624629	\N	\N	39822 Vernon Street	\N	\N	West Darrylfurt	80386	North Yorkshire
2	Drills required	3	Quas quia ipsam occaecati nisi nihil maxime dolore aperiam.Quasi quo consequatur est ullam cum.	Molestiae ut magni rem.Quod aliquid ullam et.	2	User::Agent	0	679.0	21.0	1	Toy	Sincere Doyle I	681-711-2032 x916	brittany_mueller@turnerhartmann.info	2011-01-24 08:29:51.718598	2011-01-24 08:29:51.718598	2011-01-29	Khalil129585779151683 Mitchell	1	t	\N	0	0	f	f	-1	1	2011-01-24 08:29:51.726639	\N	\N	421 Koelpin Centers	\N	\N	North Paigeport	15296	Dyfed
3	Need assistance in selling a car	3	Omnis quidem nihil voluptatum vitae et saepe accusamus.Vero omnis nostrum modi ut veritatis quis maiores nulla.	Vel dignissimos eaque molestiae.Labore qui velit ipsa corrupti voluptates quam.	2	User::Agent	0	584.0	888.0	1	Aufderhar	Ally Kuhlman III	516-964-6623	elise@streich.co.uk	2011-01-24 08:29:51.809865	2011-01-24 08:29:51.809865	2011-01-29	Khalil129585779151683 Mitchell	1	t	\N	0	0	f	f	-1	1	2011-01-24 08:29:51.817949	\N	\N	320 Leuschke Shore	\N	\N	Strackemouth	55426	Cumbria
4	Ipod shipment	3	Qui et quos at odit corrupti rerum id quisquam.Laboriosam sint impedit quos aut.	Aut neque consequatur voluptatem perferendis ut.Vero qui molestiae quisquam.	2	User::Agent	0	817.0	10.0	1	Durgan	Gayle Cummings	1-849-374-9480 x1204	brannon@reingerbartell.us	2011-01-24 08:29:51.901567	2011-01-24 08:29:51.901567	2011-01-29	Khalil129585779151683 Mitchell	1	t	\N	0	0	f	f	-1	1	2011-01-24 08:29:51.909588	\N	\N	8774 Lewis Pine	\N	\N	North Orland	90429-4522	Grampian
5	Trip to amazonia - looking for offer	3	Tenetur adipisci nostrum enim fuga rem occaecati.Sequi maxime nemo ipsum voluptate laudantium ex quasi qui.	Dolore autem dicta nostrum iure maxime.A soluta dolores sapiente magni necessitatibus.	2	User::Agent	0	372.0	468.0	1	Monahan	Adriana Cummings DDS	(717)784-6799 x28156	hazel@townebruen.ca	2011-01-24 08:29:52.000525	2011-01-24 08:29:52.000525	2011-01-29	Khalil129585779151683 Mitchell	1	t	\N	0	0	f	f	-1	1	2011-01-24 08:29:52.008967	\N	\N	85469 Iliana Points	\N	\N	East Angel	26633-9612	Durham
6	LCD - Huge amounts	3	Ut quas facere vero.Blanditiis soluta sit iure eos.	Id mollitia qui itaque dolor et quis.Aut repellat enim quis quae accusamus quas.	2	User::Agent	0	169.0	809.0	1	Wunsch	Viola Gaylord	923.297.2824 x38816	sarina@kuphalcole.co.uk	2011-01-24 08:29:52.098685	2011-01-24 08:29:52.098685	2011-01-29	Khalil129585779151683 Mitchell	1	t	\N	0	0	f	f	-1	1	2011-01-24 08:29:52.106628	\N	\N	0910 Jaskolski Spur	\N	\N	Rosalynton	71402	Gwent
7	GPS receivers required	3	Autem dignissimos officia ut beatae.Delectus voluptate ea nulla cupiditate et eum velit molestiae.	Tempora omnis enim quo quisquam dicta non sint.Eum expedita nam at et nesciunt et.	2	User::Agent	0	681.0	18.0	1	Hauck	Tyson Bins	(077)846-9150	shaina_runte@donnelly.info	2011-01-24 08:29:52.195819	2011-01-24 08:29:52.195819	2011-01-29	Khalil129585779151683 Mitchell	1	t	\N	0	0	f	f	-1	1	2011-01-24 08:29:52.204642	\N	\N	8043 Isadore Union	\N	\N	West Annamae	51744	Humberside
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
1	default_payout_delay	--- 0\n	2011-01-24 08:29:50.561378	2011-01-24 08:29:50.561378
2	default_leads_per_page	--- 5\n	2011-01-24 08:29:50.570504	2011-01-24 08:29:50.570504
3	certification_level_1	--- 10\n	2011-01-24 08:29:50.585194	2011-01-24 08:29:50.585194
4	certification_level_2	--- 20\n	2011-01-24 08:29:50.594361	2011-01-24 08:29:50.594361
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-24 08:29:50.601356	2011-01-24 08:29:50.601356
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-24 08:29:50.609361	2011-01-24 08:29:50.609361
7	invoicing_seller_name	--- Fairleads\n	2011-01-24 08:29:50.61739	2011-01-24 08:29:50.61739
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-24 08:29:50.624177	2011-01-24 08:29:50.624177
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-24 08:29:50.631296	2011-01-24 08:29:50.631296
10	invoicing_default_vat_rate	--- 0.15\n	2011-01-24 08:29:50.639377	2011-01-24 08:29:50.639377
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
1	blazejek@gmail.com	40fe701d3de4773ed7e920c727d07a798f3224e77c688a3ee94e88cb97bf537fe558f493f2d32254724de7a9e74a542cf8afc9e532c0975c019a43a04b6ffa2a	QK076KbM6WLL1RfSmlWT	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-24 08:29:51.261611	2011-01-24 08:29:51.130394	\N	2011-01-24 08:29:51.136736	2011-01-24 08:29:51.262366	1	Matilde	Cummerata	481-814-0532 x504	root	Howard Manor	Schowalterside	80471	Leicestershire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	VuFTaWOlZhtgcS5TTMMLo3qao8kZb9poJiCoyJwWUkOK72BMzNMT3keCZqrffW	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
2	agent@nbs.com	d29c6697c147f6e4aaf6209c80f3a03f569c6309a161e3e42b919ce9e8451ae2acbb0293afc529c41b7c40f34ca264215c16c1c0d70f120a5afce6da9507ee6b	JPQU7ggnKQt9cUNvTps2	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-24 08:29:51.56709	2011-01-24 08:29:51.534402	\N	2011-01-24 08:29:51.537309	2011-01-24 08:29:51.56757	2	Khalil129585779151683	Mitchell	223-017-2941 x305	Angelita Fisher PhD129585779151657	Bergstrom Ville	Mayerhaven	50859-4352	Avon	1	\N	0	\N	\N	0	\N	\N	\N	\N	37Cy4tgYN5uTo3ZyMxEsOYDmTDEJwTrWxY0NdbKnn6cVJDXBCRd3YAG26KTaV0	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
3	admin@nbs.com	45af3e90103d8bf94903cd2830d2a920ca400591f0ab93fc850d1b4d24573bbfe8c28e19b193a7033a14477a920f8396b423d2577a9a7ceb025d22a87daab276	mGsjAfJAoq8vxApBOYtG	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-24 08:29:52.372911	2011-01-24 08:29:52.342228	\N	2011-01-24 08:29:52.344907	2011-01-24 08:29:52.373369	1	William	Rath	1-191-403-8516	Dr. Wilson Hilll129585779233349	Haley Tunnel	Beahanborough	62868-8355	Merseyside	1	\N	\N	\N	\N	0	\N	\N	\N	\N	m80GiFb8tu2Zefc1AHATBRyavjirGfEDzla38WybRjBYfFMEBYSaQviV2VFsAS	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
4	buyer@nbs.com	731313c58e7c3451f7e2385950307045c8fb1739819aebf30392437af29c62c3378a3034dbb721a2ac0b80c634273f5d554028f42b2eec4656ae82d66a7ce6cb	R8XyYvTkZLPqaRbxLBZ0	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-24 08:29:52.465119	2011-01-24 08:29:52.428973	\N	2011-01-24 08:29:52.431628	2011-01-24 08:29:52.465561	48	Angela	Jewess	215.742.6833	Lacy Jerde12958577924172	Dooley Crossroad	Bettyeborough	34107	Buckinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	dpDOJ1VtMPH1Qmb28ibZT54ukc6S8DiubMOHpxAvoXtjamvgZkDASePRU5m3fZ	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
5	leaduser@nbs.com	ed90e62bb732682e5f7d758908d8d1084d605e074fe958a22eb5e6707dfd2cdc206082b0aebb11300682b9210d1735ae6b1c75715515da5d292594b1776aeb09	gza9c2XAFOSfThr2yjNd	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-24 08:29:52.555888	2011-01-24 08:29:52.51957	\N	2011-01-24 08:29:52.522307	2011-01-24 08:29:52.584195	64	Geovany	Boyle	124.022.2081 x67393	Hannah Bernhard V129585779250754	Bartholome Lodge	Victorialand	41615	Staffordshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	qkgIsdHwqg2KWG9Jz6hp6533lM4QoIJyIQkgFimMfrHksLPWgSUKmGrFx1bF3P	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

