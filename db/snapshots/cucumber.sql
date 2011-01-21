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

SELECT pg_catalog.setval('invoice_lines_id_seq', 4, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('invoices_id_seq', 4, true);


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

SELECT pg_catalog.setval('users_id_seq', 13, true);


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-01-21 10:14:01.05435	2011-01-21 10:14:01.05435
2	1	en	About us	About us	2011-01-21 10:14:01.073966	2011-01-21 10:14:01.073966
3	2	dk	Privacy	Privacy	2011-01-21 10:14:01.124697	2011-01-21 10:14:01.124697
4	2	en	Privacy	Privacy	2011-01-21 10:14:01.165376	2011-01-21 10:14:01.165376
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-21 10:14:01.449567	2011-01-21 10:14:01.449567
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-21 10:14:01.470432	2011-01-21 10:14:01.470432
7	4	dk	Blurb sign up	Blurb sign up	2011-01-21 10:14:01.533555	2011-01-21 10:14:01.533555
8	4	en	Blurb sign up	Blurb sign up	2011-01-21 10:14:01.550515	2011-01-21 10:14:01.550515
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-21 10:14:01.597747	2011-01-21 10:14:01.597747
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-21 10:14:01.614362	2011-01-21 10:14:01.614362
11	6	dk	Blurb agent home	Blurb agent home	2011-01-21 10:14:01.661411	2011-01-21 10:14:01.661411
12	6	en	Blurb agent home	Blurb agent home	2011-01-21 10:14:01.690196	2011-01-21 10:14:01.690196
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-21 10:14:01.744101	2011-01-21 10:14:01.744101
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-21 10:14:01.763268	2011-01-21 10:14:01.763268
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-21 10:14:01.810047	2011-01-21 10:14:01.810047
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-21 10:14:01.827727	2011-01-21 10:14:01.827727
17	9	dk	Blurb currencies	Blurb currencies	2011-01-21 10:14:01.876918	2011-01-21 10:14:01.876918
18	9	en	Blurb currencies	Blurb currencies	2011-01-21 10:14:01.894502	2011-01-21 10:14:01.894502
19	10	dk	Reset password	Reset password	2011-01-21 10:14:01.938011	2011-01-21 10:14:01.938011
20	10	en	Reset password	Reset password	2011-01-21 10:14:01.961139	2011-01-21 10:14:01.961139
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-21 10:14:01.036489	2011-01-21 10:14:01.079368	about_us	0	t	2011-01-21 10:14:01.079265
2	Article::Cms	2011-01-21 10:14:01.117254	2011-01-21 10:14:01.384348	privacy	0	t	2011-01-21 10:14:01.384174
3	Article::Cms	2011-01-21 10:14:01.441379	2011-01-21 10:14:01.478557	terms_conditions	0	t	2011-01-21 10:14:01.478374
4	Article::Cms	2011-01-21 10:14:01.528232	2011-01-21 10:14:01.556951	blurb_sign_up	1	t	2011-01-21 10:14:01.556841
5	Article::Cms	2011-01-21 10:14:01.591821	2011-01-21 10:14:01.620128	blurb_buyer_home	1	t	2011-01-21 10:14:01.620018
6	Article::Cms	2011-01-21 10:14:01.653648	2011-01-21 10:14:01.698017	blurb_agent_home	1	t	2011-01-21 10:14:01.697832
7	Article::Cms	2011-01-21 10:14:01.739005	2011-01-21 10:14:01.770189	blurb_purchase_manager_home	1	t	2011-01-21 10:14:01.770071
8	Article::Cms	2011-01-21 10:14:01.804536	2011-01-21 10:14:01.834274	blurb_start_page_role_selection	1	t	2011-01-21 10:14:01.834137
9	Article::Cms	2011-01-21 10:14:01.871706	2011-01-21 10:14:01.900067	blurb_currencies	1	t	2011-01-21 10:14:01.899957
10	Article::Cms	2011-01-21 10:14:01.932799	2011-01-21 10:14:01.966712	reset_password	2	t	2011-01-21 10:14:01.96661
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY bank_accounts (id, country_id, bank_name, bank_address, iban_no, local_bank_number, swift, payment_conditions, default_bank, created_at, updated_at) FROM stdin;
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-01-21 10:13:58.839086	2011-01-21 10:13:58.839086
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Dolorum possimus aut voluptas nulla a aspernatur.Illum aut id commodi vitae.	2011-01-21 10:13:59.67125	2011-01-21 10:13:59.67125	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Ratione nemo est sed deserunt.Officiis asperiores et eos inventore enim totam aut minima.	2011-01-21 10:13:59.730983	2011-01-21 10:13:59.730983	\N	3	4	\N	0	2-leisure	f	0
3	Business	Minima quos ipsam dolor laboriosam doloremque ad repellendus eligendi.Reprehenderit quas quisquam necessitatibus voluptates harum repudiandae.	2011-01-21 10:13:59.77753	2011-01-21 10:14:00.615789	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Dolorum possimus aut voluptas nulla a aspernatur.Illum aut id commodi vitae.	Electronics	2011-01-21 10:13:59.6822	2011-01-21 10:13:59.6822
2	1	dk	\N	Electronics	2011-01-21 10:13:59.715202	2011-01-21 10:13:59.715202
3	2	en	Ratione nemo est sed deserunt.Officiis asperiores et eos inventore enim totam aut minima.	Leisure	2011-01-21 10:13:59.736261	2011-01-21 10:13:59.736261
4	2	dk	\N	Leisure	2011-01-21 10:13:59.762957	2011-01-21 10:13:59.762957
5	3	en	Minima quos ipsam dolor laboriosam doloremque ad repellendus eligendi.Reprehenderit quas quisquam necessitatibus voluptates harum repudiandae.	Business	2011-01-21 10:13:59.783415	2011-01-21 10:13:59.783415
6	3	dk	\N	Business	2011-01-21 10:13:59.814062	2011-01-21 10:13:59.814062
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-21 10:13:58.811487	2011-01-21 10:13:58.811487
2	United Kingdom	2011-01-21 10:13:58.821746	2011-01-21 10:13:58.821746
3	England129560483985237	2011-01-21 10:13:59.854607	2011-01-21 10:13:59.854607
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
1	Euro	&euro;	%u%n	t	2011-01-21 10:13:59.638636	2011-01-21 10:13:59.638636
2	PLN	&pln;	%u%n	t	2011-01-21 10:13:59.646912	2011-01-21 10:13:59.646912
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-01-21 10:13:58.880382	2011-01-21 10:13:58.880382
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-01-21 10:13:58.907581	2011-01-21 10:13:58.907581
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-01-21 10:13:58.927072	2011-01-21 10:13:58.927072
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-01-21 10:13:58.945123	2011-01-21 10:13:58.945123
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-01-21 10:13:58.964123	2011-01-21 10:13:58.964123
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-01-21 10:13:58.982299	2011-01-21 10:13:58.982299
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-01-21 10:13:59.00435	2011-01-21 10:13:59.00435
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-01-21 10:13:59.021653	2011-01-21 10:13:59.021653
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-01-21 10:13:59.042695	2011-01-21 10:13:59.042695
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-01-21 10:13:59.063858	2011-01-21 10:13:59.063858
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-01-21 10:13:59.086279	2011-01-21 10:13:59.086279
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-01-21 10:13:59.103579	2011-01-21 10:13:59.103579
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-01-21 10:13:59.125899	2011-01-21 10:13:59.125899
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-01-21 10:13:59.145088	2011-01-21 10:13:59.145088
15	8	en	<p></p>	Question	2011-01-21 10:13:59.16301	2011-01-21 10:13:59.16301
16	8	dk	<p></p>	[DK] Question	2011-01-21 10:13:59.180847	2011-01-21 10:13:59.180847
17	9	en	<p></p>	Invoice	2011-01-21 10:13:59.209691	2011-01-21 10:13:59.209691
18	9	dk	<p></p>	[DK] Invoice	2011-01-21 10:13:59.236827	2011-01-21 10:13:59.236827
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-21 10:13:58.867154	2011-01-21 10:13:58.900619
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-21 10:13:58.921417	2011-01-21 10:13:58.939889
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-21 10:13:58.958692	2011-01-21 10:13:58.977265
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-21 10:13:58.997473	2011-01-21 10:13:59.016631
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-21 10:13:59.035126	2011-01-21 10:13:59.056521
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-21 10:13:59.078284	2011-01-21 10:13:59.0986
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-21 10:13:59.119768	2011-01-21 10:13:59.139342
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-21 10:13:59.157659	2011-01-21 10:13:59.175713
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-21 10:13:59.200369	2011-01-21 10:13:59.229359
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, pkwiu, unit, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at, ean_number) FROM stdin;
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
1	1	dk	Big deal on printers	Et recusandae nam porro perspiciatis reiciendis ab dolorum.Esse aliquid qui quibusdam accusamus debitis in quasi.	Voluptas doloremque id sit officiis.Magni at numquam est.	2011-01-21 10:14:00.001618	2011-01-21 10:14:00.001618
2	2	dk	Drills required	Id numquam perspiciatis non rerum quia.Et sed voluptas sit ipsum omnis autem itaque ex.	Quia iusto omnis eius ut.Eius praesentium deleniti vel voluptatem sequi quis.	2011-01-21 10:14:00.106251	2011-01-21 10:14:00.106251
3	3	dk	Need assistance in selling a car	Sint natus et earum.Eligendi itaque magnam accusamus ea nesciunt enim id est.	Dolor eaque non minima enim ut.Enim dolores at in cumque consectetur id repellat.	2011-01-21 10:14:00.22242	2011-01-21 10:14:00.22242
4	4	dk	Ipod shipment	Aut accusamus et sed voluptatem.Repudiandae quibusdam ullam corporis molestiae.	Ipsum eius qui similique qui.Ab sint voluptatem est quo temporibus.	2011-01-21 10:14:00.321483	2011-01-21 10:14:00.321483
5	5	dk	Trip to amazonia - looking for offer	Quis vel earum voluptatem et rerum ducimus.Dolorem animi deleniti ab.	Dolore tempore velit libero quisquam et assumenda.Dolores quos et qui id voluptate sed in et.	2011-01-21 10:14:00.414476	2011-01-21 10:14:00.414476
6	6	dk	LCD - Huge amounts	Et sunt voluptatem ex reprehenderit.Quis accusantium consequuntur blanditiis vel aut explicabo.	Commodi ipsa corporis enim aut labore eum sunt.Totam sunt cumque sapiente sint tempora.	2011-01-21 10:14:00.523965	2011-01-21 10:14:00.523965
7	7	dk	GPS receivers required	Asperiores est maiores eaque ab et voluptas sed maxime.Quis sed fugiat inventore mollitia et optio officia hic.	Eius nihil qui quos ut mollitia porro quaerat.Ipsa tenetur omnis voluptatem qui dolores.	2011-01-21 10:14:00.624933	2011-01-21 10:14:00.624933
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Et recusandae nam porro perspiciatis reiciendis ab dolorum.Esse aliquid qui quibusdam accusamus debitis in quasi.	Voluptas doloremque id sit officiis.Magni at numquam est.	2	User::Agent	0	282.0	173.0	1	Fisherwelch	Dante Konopelski	348.375.5038 x172	marshall.smitham@rutherford.com	2011-01-21 10:13:59.945426	2011-01-21 10:13:59.945426	2011-01-26	Duane12956048398513 McGlynn	1	t	\N	0	0	f	f	-1	1	2011-01-21 10:13:59.957025	\N	\N	730 Pascale Land	\N	\N	Noeliachester	94419-1868	Suffolk
2	Drills required	3	Id numquam perspiciatis non rerum quia.Et sed voluptas sit ipsum omnis autem itaque ex.	Quia iusto omnis eius ut.Eius praesentium deleniti vel voluptatem sequi quis.	2	User::Agent	0	937.0	804.0	1	Gleason	Brenden Auer	109.220.5803 x90333	samson@keebler.com	2011-01-21 10:14:00.062948	2011-01-21 10:14:00.062948	2011-01-26	Duane12956048398513 McGlynn	1	t	\N	0	0	f	f	-1	1	2011-01-21 10:14:00.071308	\N	\N	77574 Christian Mission	\N	\N	South Connor	02297-2395	Lancashire
3	Need assistance in selling a car	3	Sint natus et earum.Eligendi itaque magnam accusamus ea nesciunt enim id est.	Dolor eaque non minima enim ut.Enim dolores at in cumque consectetur id repellat.	2	User::Agent	0	714.0	84.0	1	Bednar	Angelica Champlin	044-381-8360	mattie.armstrong@rauhalvorson.com	2011-01-21 10:14:00.16898	2011-01-21 10:14:00.16898	2011-01-26	Duane12956048398513 McGlynn	1	t	\N	0	0	f	f	-1	1	2011-01-21 10:14:00.183497	\N	\N	71824 Streich Motorway	\N	\N	West Julietchester	86459	Tayside
4	Ipod shipment	3	Aut accusamus et sed voluptatem.Repudiandae quibusdam ullam corporis molestiae.	Ipsum eius qui similique qui.Ab sint voluptatem est quo temporibus.	2	User::Agent	0	256.0	145.0	1	Abshire	Celestine Collins	(052)604-6227 x809	isabell@oconnell.uk	2011-01-21 10:14:00.272676	2011-01-21 10:14:00.272676	2011-01-26	Duane12956048398513 McGlynn	1	t	\N	0	0	f	f	-1	1	2011-01-21 10:14:00.282794	\N	\N	99439 Daugherty Parks	\N	\N	Lake Marianeshire	50541	West Glamorgan
5	Trip to amazonia - looking for offer	3	Quis vel earum voluptatem et rerum ducimus.Dolorem animi deleniti ab.	Dolore tempore velit libero quisquam et assumenda.Dolores quos et qui id voluptate sed in et.	2	User::Agent	0	276.0	181.0	1	Lakin	Conrad Lynch	(093)972-0976	chasity@carroll.uk	2011-01-21 10:14:00.371627	2011-01-21 10:14:00.371627	2011-01-26	Duane12956048398513 McGlynn	1	t	\N	0	0	f	f	-1	1	2011-01-21 10:14:00.379914	\N	\N	233 Keeling Ports	\N	\N	Port Elisabeth	63580-2500	Lothian
6	LCD - Huge amounts	3	Et sunt voluptatem ex reprehenderit.Quis accusantium consequuntur blanditiis vel aut explicabo.	Commodi ipsa corporis enim aut labore eum sunt.Totam sunt cumque sapiente sint tempora.	2	User::Agent	0	805.0	465.0	1	Kunzedickinson	Dustin Durgan	038-778-1163 x7922	stefan@wintheiserdenesik.us	2011-01-21 10:14:00.466665	2011-01-21 10:14:00.466665	2011-01-26	Duane12956048398513 McGlynn	1	t	\N	0	0	f	f	-1	1	2011-01-21 10:14:00.47464	\N	\N	21642 Makenna Turnpike	\N	\N	East Trentborough	03069	Essex
7	GPS receivers required	3	Asperiores est maiores eaque ab et voluptas sed maxime.Quis sed fugiat inventore mollitia et optio officia hic.	Eius nihil qui quos ut mollitia porro quaerat.Ipsa tenetur omnis voluptatem qui dolores.	2	User::Agent	0	14.0	664.0	1	Denesikjerde	Amelie Marvin	(367)694-2512 x997	alf_funk@stromanbechtelar.info	2011-01-21 10:14:00.581826	2011-01-21 10:14:00.581826	2011-01-26	Duane12956048398513 McGlynn	1	t	\N	0	0	f	f	-1	1	2011-01-21 10:14:00.589929	\N	\N	98227 Agustina Haven	\N	\N	West Tristinbury	16003-8225	Powys
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
1	default_payout_delay	--- 0\n	2011-01-21 10:13:58.703987	2011-01-21 10:13:58.703987
2	default_leads_per_page	--- 5\n	2011-01-21 10:13:58.715851	2011-01-21 10:13:58.715851
3	certification_level_1	--- 10\n	2011-01-21 10:13:58.727776	2011-01-21 10:13:58.727776
4	certification_level_2	--- 20\n	2011-01-21 10:13:58.740345	2011-01-21 10:13:58.740345
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-21 10:13:58.747062	2011-01-21 10:13:58.747062
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-21 10:13:58.754284	2011-01-21 10:13:58.754284
7	invoicing_seller_name	--- Fairleads\n	2011-01-21 10:13:58.76172	2011-01-21 10:13:58.76172
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-21 10:13:58.769056	2011-01-21 10:13:58.769056
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-21 10:13:58.775756	2011-01-21 10:13:58.775756
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-21 10:13:58.782748	2011-01-21 10:13:58.782748
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-21 10:13:58.790172	2011-01-21 10:13:58.790172
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
1	blazejek@gmail.com	48b480cb8d6afd4f175126301beb373a4c2363fabc99913e86be01df6428f3ca42a4569b2371e77915cefe79e1d16ed8a5277b488fb31ba3df3135c30a62471e	nLhR3XppqUT5-6DMFAiy	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-21 10:13:59.618181	2011-01-21 10:13:59.288241	\N	2011-01-21 10:13:59.288613	2011-01-21 10:13:59.618723	1	Arthur	Schuster	1-144-407-3512	root	Jerald Neck	Aidanside	73575	Lincolnshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	tiQRZmFqmkIzCLYg7LytgumfKGN51SRPnjLVEyaMlNu9QmHZZovONRQyw62xzA	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	7257adef39733dc796d63fb7993c7d1ca990b82d2274f208d05dad085f64dafcde4e5feee76590daf64612950149232776998450b85f71fbde00cc4b2faca353	kU8_9zX7YY-VVu3dW5-X	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-21 10:13:59.895656	2011-01-21 10:13:59.866654	\N	2011-01-21 10:13:59.866928	2011-01-21 10:13:59.896117	2	Duane12956048398513	McGlynn	736-046-8829 x525	Telly Welch129560483985092	Art Plain	New Roelbury	39929-2516	Somerset	3	\N	0	\N	\N	0	\N	\N	\N	\N	fBO8zOdhHu77gGi8kw5kgy7972ugbX8wX24tEDEPP2ndQ7qomQM0RLqe2Zec1y	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	26e168059cab79629603b09af4c5d0330f3054024aac1f07198bf61530fab5fe92233a5cd1a34eeafc58d4d71447a7b987768a82f9de6d9ba65e0b5ed9722d2a	ZPd0V4Q2_eQ0SUlsj96m	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-21 10:14:00.736131	2011-01-21 10:14:00.704121	\N	2011-01-21 10:14:00.704405	2011-01-21 10:14:00.736585	1	Jerel	Simonis	226.510.6252 x13640	Justus Crooks12956048406972	Frederique Port	Manleytown	53273-8899	County Fermanagh	1	\N	\N	\N	\N	0	\N	\N	\N	\N	s2pNt4lDLI9ZgraWbnvjsp4FsTU6NI4FYSl8biRQcWNSd4ix4S7UnX9tgNamzd	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	0db4ed6d191720afb690f9c378b283eaad69d251b2e53688de8a33ed81241aa20066a04186ad553cdd5dc393170942e12e70b772af6c79ce5f0388f0e90c85ff	RVTEpxY1jJmkemvi08Fe	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-21 10:14:00.820827	2011-01-21 10:14:00.790815	\N	2011-01-21 10:14:00.791099	2011-01-21 10:14:00.821341	48	Kris	Cartwright	1-612-976-3799 x0888	Vivianne Wunsch129560484078192	Ben Cliff	Littleview	65992-0424	Powys	1	\N	\N	\N	\N	0	\N	\N	\N	\N	eSteY2aOLzpGw0B1F4AWXiZHNxLgK1FnCfwxeXzoDMJzPkTA2vbR3iNcZRj7hf	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	e6813e186ae2751eb24852bd2eccd509867b32f3d092c6bd42fbf641ede7f12ad342a22ddd5cd89e582432157ae8b932f3ff9e7c9b90c77b5edc01d95cf27a4b	Z6Pz8JjkhhX488pEnDVe	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-21 10:14:00.901944	2011-01-21 10:14:00.871809	\N	2011-01-21 10:14:00.872277	2011-01-21 10:14:00.927445	64	Marianna	Hilpert	858-117-1196 x9529	Shaina Hintz129560484086211	Robel Course	East Quentinhaven	49464-3882	Buckinghamshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	6xkaHgEaOaJk0n8oRErNR0flP0rXksRjyHsSxQMhxNW94iV8ysFk1o4fxGOr5h	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

