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
1	1	dk	About us	About us	2011-02-08 12:57:54.488441	2011-02-08 12:57:54.488441
2	1	en	About us	About us	2011-02-08 12:57:54.69985	2011-02-08 12:57:54.69985
3	2	dk	Privacy	Privacy	2011-02-08 12:57:54.750499	2011-02-08 12:57:54.750499
4	2	en	Privacy	Privacy	2011-02-08 12:57:54.772193	2011-02-08 12:57:54.772193
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-08 12:57:54.870955	2011-02-08 12:57:54.870955
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-08 12:57:54.894545	2011-02-08 12:57:54.894545
7	4	dk	Blurb sign up	Blurb sign up	2011-02-08 12:57:54.949954	2011-02-08 12:57:54.949954
8	4	en	Blurb sign up	Blurb sign up	2011-02-08 12:57:54.970692	2011-02-08 12:57:54.970692
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-08 12:57:55.024426	2011-02-08 12:57:55.024426
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-08 12:57:55.058255	2011-02-08 12:57:55.058255
11	6	dk	Blurb agent home	Blurb agent home	2011-02-08 12:57:55.116096	2011-02-08 12:57:55.116096
12	6	en	Blurb agent home	Blurb agent home	2011-02-08 12:57:55.378814	2011-02-08 12:57:55.378814
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-08 12:57:55.426698	2011-02-08 12:57:55.426698
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-08 12:57:55.447889	2011-02-08 12:57:55.447889
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-08 12:57:55.776783	2011-02-08 12:57:55.776783
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-08 12:57:55.794791	2011-02-08 12:57:55.794791
17	9	dk	Blurb currencies	Blurb currencies	2011-02-08 12:57:55.839489	2011-02-08 12:57:55.839489
18	9	en	Blurb currencies	Blurb currencies	2011-02-08 12:57:55.859283	2011-02-08 12:57:55.859283
19	10	dk	Blurb category home	Blurb category home	2011-02-08 12:57:55.950249	2011-02-08 12:57:55.950249
20	10	en	Blurb category home	Blurb category home	2011-02-08 12:57:55.969662	2011-02-08 12:57:55.969662
21	11	dk	Reset password	Reset password	2011-02-08 12:57:56.060604	2011-02-08 12:57:56.060604
22	11	en	Reset password	Reset password	2011-02-08 12:57:56.081152	2011-02-08 12:57:56.081152
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-08 12:57:54.475567	2011-02-08 12:57:54.706215	about_us	t	2011-02-08 12:57:54.706094	\N	\N
2	Article::Cms::MainPageArticle	2011-02-08 12:57:54.745115	2011-02-08 12:57:54.780884	privacy	t	2011-02-08 12:57:54.780752	\N	\N
3	Article::Cms::MainPageArticle	2011-02-08 12:57:54.86323	2011-02-08 12:57:54.900807	terms_conditions	t	2011-02-08 12:57:54.900694	\N	\N
4	Article::Cms::InterfaceContentText	2011-02-08 12:57:54.94233	2011-02-08 12:57:54.977218	blurb_sign_up	t	2011-02-08 12:57:54.977085	\N	\N
5	Article::Cms::InterfaceContentText	2011-02-08 12:57:55.015352	2011-02-08 12:57:55.064966	blurb_buyer_home	t	2011-02-08 12:57:55.064823	\N	\N
6	Article::Cms::InterfaceContentText	2011-02-08 12:57:55.109702	2011-02-08 12:57:55.385207	blurb_agent_home	t	2011-02-08 12:57:55.385089	\N	\N
7	Article::Cms::InterfaceContentText	2011-02-08 12:57:55.421435	2011-02-08 12:57:55.730563	blurb_purchase_manager_home	t	2011-02-08 12:57:55.730383	\N	\N
8	Article::Cms::InterfaceContentText	2011-02-08 12:57:55.771326	2011-02-08 12:57:55.800484	blurb_start_page_role_selection	t	2011-02-08 12:57:55.800374	\N	\N
9	Article::Cms::InterfaceContentText	2011-02-08 12:57:55.834141	2011-02-08 12:57:55.869236	blurb_currencies	t	2011-02-08 12:57:55.869107	\N	\N
10	Article::Cms::InterfaceContentText	2011-02-08 12:57:55.944547	2011-02-08 12:57:55.976033	blurb_category_home	t	2011-02-08 12:57:55.975919	\N	\N
11	Article::Cms::HelpPopup	2011-02-08 12:57:56.048662	2011-02-08 12:57:56.317707	reset_password	t	2011-02-08 12:57:56.317529	\N	\N
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-08 12:57:52.353293	2011-02-08 12:57:52.353293	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Labore et quibusdam sunt laboriosam.Blanditiis sed nulla qui autem.	2011-02-08 12:57:53.022513	2011-02-08 12:57:53.022513	\N	1	2	\N	0	electronics	f	0
2	Leisure	Velit quos molestiae cumque possimus omnis.Ut commodi aliquid laudantium dignissimos et iste.	2011-02-08 12:57:53.111359	2011-02-08 12:57:53.111359	\N	3	4	\N	0	leisure	f	0
3	Business	Dolorum quo fugit architecto vel quos quia alias recusandae.Harum voluptas maiores minus at.	2011-02-08 12:57:53.167367	2011-02-08 12:57:53.999233	\N	5	6	\N	7	business	f	7
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
1	1	en	Labore et quibusdam sunt laboriosam.Blanditiis sed nulla qui autem.	Electronics	2011-02-08 12:57:53.034843	2011-02-08 12:57:53.034843
2	1	dk	\N	Electronics	2011-02-08 12:57:53.084153	2011-02-08 12:57:53.084153
3	2	en	Velit quos molestiae cumque possimus omnis.Ut commodi aliquid laudantium dignissimos et iste.	Leisure	2011-02-08 12:57:53.116895	2011-02-08 12:57:53.116895
4	2	dk	\N	Leisure	2011-02-08 12:57:53.148086	2011-02-08 12:57:53.148086
5	3	en	Dolorum quo fugit architecto vel quos quia alias recusandae.Harum voluptas maiores minus at.	Business	2011-02-08 12:57:53.172921	2011-02-08 12:57:53.172921
6	3	dk	\N	Business	2011-02-08 12:57:53.203009	2011-02-08 12:57:53.203009
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-08 12:57:52.319436	2011-02-08 12:57:52.319436
2	United Kingdom	2011-02-08 12:57:52.331262	2011-02-08 12:57:52.331262
3	England129716987324204	2011-02-08 12:57:53.24372	2011-02-08 12:57:53.24372
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
1	Euro	&euro;	%u%n	t	2011-02-08 12:57:52.975778	2011-02-08 12:57:52.975778
2	PLN	&pln;	%u%n	t	2011-02-08 12:57:52.985871	2011-02-08 12:57:52.985871
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-08 12:57:52.410841	2011-02-08 12:57:52.410841
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-08 12:57:52.432114	2011-02-08 12:57:52.432114
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-08 12:57:52.453713	2011-02-08 12:57:52.453713
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-08 12:57:52.474309	2011-02-08 12:57:52.474309
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-08 12:57:52.49327	2011-02-08 12:57:52.49327
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-08 12:57:52.514649	2011-02-08 12:57:52.514649
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-08 12:57:52.53574	2011-02-08 12:57:52.53574
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-08 12:57:52.553926	2011-02-08 12:57:52.553926
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-08 12:57:52.577219	2011-02-08 12:57:52.577219
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-08 12:57:52.596803	2011-02-08 12:57:52.596803
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-08 12:57:52.61633	2011-02-08 12:57:52.61633
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-08 12:57:52.638044	2011-02-08 12:57:52.638044
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-08 12:57:52.658161	2011-02-08 12:57:52.658161
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-08 12:57:52.680677	2011-02-08 12:57:52.680677
15	8	en	<p></p>	Question	2011-02-08 12:57:52.706602	2011-02-08 12:57:52.706602
16	8	dk	<p></p>	[DK] Question	2011-02-08 12:57:52.726039	2011-02-08 12:57:52.726039
17	9	en	<p></p>	Invoice	2011-02-08 12:57:52.751517	2011-02-08 12:57:52.751517
18	9	dk	<p></p>	[DK] Invoice	2011-02-08 12:57:52.769975	2011-02-08 12:57:52.769975
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-08 12:57:52.395033	2011-02-08 12:57:52.426249
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-08 12:57:52.447083	2011-02-08 12:57:52.467761
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-08 12:57:52.487529	2011-02-08 12:57:52.507269
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-08 12:57:52.530325	2011-02-08 12:57:52.548793
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-08 12:57:52.568475	2011-02-08 12:57:52.590903
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-08 12:57:52.608968	2011-02-08 12:57:52.632145
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-08 12:57:52.651977	2011-02-08 12:57:52.67393
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-08 12:57:52.699639	2011-02-08 12:57:52.720621
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-08 12:57:52.746181	2011-02-08 12:57:52.764976
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
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

COPY lead_translations (id, lead_id, locale, header, description, hidden_description, created_at, updated_at) FROM stdin;
1	1	dk	Big deal on printers	Adipisci consectetur possimus impedit quidem magnam velit cum.Unde cupiditate suscipit et saepe.	Quibusdam alias dignissimos dolore beatae dolorem.Recusandae repudiandae quam minus iusto et necessitatibus harum.	2011-02-08 12:57:53.409763	2011-02-08 12:57:53.409763
2	2	dk	Drills required	Alias rerum est fugiat tempore molestiae rerum.Exercitationem iste ut culpa quis.	Voluptas consequatur sit molestias.Qui excepturi quos consequatur accusantium officia odio.	2011-02-08 12:57:53.505638	2011-02-08 12:57:53.505638
3	3	dk	Need assistance in selling a car	Rerum autem ratione iusto sed.Nostrum delectus ullam laudantium dolorum fuga rerum.	Odit et vero laudantium consequatur aut aut.Voluptatibus corporis dicta et et provident enim.	2011-02-08 12:57:53.61064	2011-02-08 12:57:53.61064
4	4	dk	Ipod shipment	Est assumenda est consequatur dolorem.Explicabo fugit ut sunt non qui voluptas ipsum.	Molestiae nisi quas voluptatum alias velit quis dolor sunt.Aut animi est nesciunt cum.	2011-02-08 12:57:53.712173	2011-02-08 12:57:53.712173
5	5	dk	Trip to amazonia - looking for offer	Eaque vel illo ea accusamus.Amet ipsam eum minima.	Delectus necessitatibus quos consectetur doloribus minima.Voluptas doloribus neque quibusdam quaerat enim.	2011-02-08 12:57:53.809241	2011-02-08 12:57:53.809241
6	6	dk	LCD - Huge amounts	Doloremque mollitia dolor incidunt.Quod fuga tenetur ex dicta.	Nesciunt dolorem sunt et.Illo quae maxime maiores consequatur similique et qui.	2011-02-08 12:57:53.911741	2011-02-08 12:57:53.911741
7	7	dk	GPS receivers required	Laudantium qui vel sunt mollitia magnam rerum aut.Voluptas ullam ea omnis rerum temporibus aut sit molestias.	Ea qui rerum commodi ullam occaecati consequatur dicta.Nihil earum et sunt.	2011-02-08 12:57:54.009108	2011-02-08 12:57:54.009108
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Adipisci consectetur possimus impedit quidem magnam velit cum.Unde cupiditate suscipit et saepe.	Quibusdam alias dignissimos dolore beatae dolorem.Recusandae repudiandae quam minus iusto et necessitatibus harum.	2	User::Agent	0	215.0	75.0	1	Larkinpagac	Andy Daugherty	922-334-7068 x854	bert_jerde@parker.info	2011-02-08 12:57:53.348654	2011-02-08 12:57:53.348654	2011-02-13	Branson129716987324121 Sipes	1	t	\N	0	0	f	f	-1	1	2011-02-08 12:57:53.366051	\N	\N	10566 Noemie Street	\N	\N	West Cyril	06911	West Sussex	\N	\N	\N	\N	t
2	Drills required	3	Alias rerum est fugiat tempore molestiae rerum.Exercitationem iste ut culpa quis.	Voluptas consequatur sit molestias.Qui excepturi quos consequatur accusantium officia odio.	2	User::Agent	0	337.0	844.0	1	Hoeger	Gerardo Hackett	(639)776-8885 x7717	elinore.haley@becker.name	2011-02-08 12:57:53.462672	2011-02-08 12:57:53.462672	2011-02-13	Branson129716987324121 Sipes	1	t	\N	0	0	f	f	-1	1	2011-02-08 12:57:53.471174	\N	\N	762 Emard Rapid	\N	\N	Lake Faebury	43590	Central	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Rerum autem ratione iusto sed.Nostrum delectus ullam laudantium dolorum fuga rerum.	Odit et vero laudantium consequatur aut aut.Voluptatibus corporis dicta et et provident enim.	2	User::Agent	0	225.0	332.0	1	Kiehn	Billie Abbott	826.281.8621 x1780	lera.yost@fadelstroman.info	2011-02-08 12:57:53.564599	2011-02-08 12:57:53.564599	2011-02-13	Branson129716987324121 Sipes	1	t	\N	0	0	f	f	-1	1	2011-02-08 12:57:53.574299	\N	\N	43773 Ivah Drive	\N	\N	East Jordonfurt	77856-7692	Gwynedd County	\N	\N	\N	\N	t
4	Ipod shipment	3	Est assumenda est consequatur dolorem.Explicabo fugit ut sunt non qui voluptas ipsum.	Molestiae nisi quas voluptatum alias velit quis dolor sunt.Aut animi est nesciunt cum.	2	User::Agent	0	384.0	702.0	1	Botsford	Quinn Fay	(116)809-7573 x382	evert_schowalter@friesen.uk	2011-02-08 12:57:53.665793	2011-02-08 12:57:53.665793	2011-02-13	Branson129716987324121 Sipes	1	t	\N	0	0	f	f	-1	1	2011-02-08 12:57:53.675188	\N	\N	931 Cruz Green	\N	\N	West Tia	50337	Mid Glamorgan	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Eaque vel illo ea accusamus.Amet ipsam eum minima.	Delectus necessitatibus quos consectetur doloribus minima.Voluptas doloribus neque quibusdam quaerat enim.	2	User::Agent	0	595.0	50.0	1	Kessler	Clotilde Ebert	1-427-595-3322	sigmund@williamsongerlach.uk	2011-02-08 12:57:53.762797	2011-02-08 12:57:53.762797	2011-02-13	Branson129716987324121 Sipes	1	t	\N	0	0	f	f	-1	1	2011-02-08 12:57:53.771259	\N	\N	75582 Barton Green	\N	\N	New Makaylamouth	65295-7454	Lancashire	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Doloremque mollitia dolor incidunt.Quod fuga tenetur ex dicta.	Nesciunt dolorem sunt et.Illo quae maxime maiores consequatur similique et qui.	2	User::Agent	0	17.0	717.0	1	Schmidtromaguera	Herman Robel	(354)648-2904	leila_prosacco@dubuquelegros.ca	2011-02-08 12:57:53.86642	2011-02-08 12:57:53.86642	2011-02-13	Branson129716987324121 Sipes	1	t	\N	0	0	f	f	-1	1	2011-02-08 12:57:53.876553	\N	\N	042 Preston Bridge	\N	\N	North Juanitachester	60111-7402	Northamptonshire	\N	\N	\N	\N	t
7	GPS receivers required	3	Laudantium qui vel sunt mollitia magnam rerum aut.Voluptas ullam ea omnis rerum temporibus aut sit molestias.	Ea qui rerum commodi ullam occaecati consequatur dicta.Nihil earum et sunt.	2	User::Agent	0	111.0	135.0	1	Abernathyrippin	Garett Trantow	(209)344-3454 x3182	duncan@schinner.uk	2011-02-08 12:57:53.965022	2011-02-08 12:57:53.965022	2011-02-13	Branson129716987324121 Sipes	1	t	\N	0	0	f	f	-1	1	2011-02-08 12:57:53.97331	\N	\N	86886 Raynor Orchard	\N	\N	Reingerberg	60445-4935	Isle of Wight	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-02-08 12:57:51.798469	2011-02-08 12:57:51.798469
2	default_leads_per_page	--- 5\n	2011-02-08 12:57:52.025923	2011-02-08 12:57:52.025923
3	certification_level_1	--- 10\n	2011-02-08 12:57:52.239934	2011-02-08 12:57:52.239934
4	certification_level_2	--- 20\n	2011-02-08 12:57:52.249774	2011-02-08 12:57:52.249774
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-08 12:57:52.257834	2011-02-08 12:57:52.257834
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-08 12:57:52.264928	2011-02-08 12:57:52.264928
7	invoicing_seller_name	--- Fairleads\n	2011-02-08 12:57:52.271969	2011-02-08 12:57:52.271969
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-08 12:57:52.278296	2011-02-08 12:57:52.278296
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-08 12:57:52.286048	2011-02-08 12:57:52.286048
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-08 12:57:52.294119	2011-02-08 12:57:52.294119
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
1	blazejek@gmail.com	2678bbb9b4173300888f28b5ce24151047dd9d373abae5a6ed8f4e1588463925564d86e978d1afab0c1dcbaa6542300c8e07ae90744aac913691871192b398ce	ozECtQQSAZAjYSJEilha	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 12:57:52.94762	2011-02-08 12:57:52.833926	\N	2011-02-08 12:57:52.8417	2011-02-08 12:57:52.948093	1	Therese	Morar	(984)645-2282 x91206	root	Elsie Road	North Lilyanmouth	77580-1138	County Londonderry	1	\N	\N	\N	\N	0	\N	\N	\N	\N	JIPUaytm4eN5Zl2cEDBxXiiSJ5rDtViNZhBsdjoyBPkbAq4T6x2KGb7NAuDqZJ	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
2	agent@nbs.com	6045949ca6c6bf2c5dc7818496026cb19e81ea1b4492f947ba66af2c60c00e5b4b9ede0874bb0da5cd3b831a9955ebdc9540bc61692d46d57ce983570807f27f	D5PPoqVwG_iARF7mJi9j	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 12:57:53.293912	2011-02-08 12:57:53.255282	\N	2011-02-08 12:57:53.257909	2011-02-08 12:57:53.294635	2	Branson129716987324121	Sipes	270.422.9309	Evan Gottlieb129716987324095	Muller Hill	West Treymouth	06375-5220	Greater Manchester	1	\N	0	\N	\N	0	\N	\N	\N	\N	DfluIBmTKHSF0lTTPXE13PlrsPtOvPhPsIhM4Z4zoTBZUlYeIa9EdrHUjI7411	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
3	admin@nbs.com	bf5587c5e7effab6bb0e5bb6535103ee6b4a3dcb8eb973c9f5c4200189a836c61c47d6905ffc7bbb9f6d9746cf2482b779dfc0d3f6c3d1e493acc2782eacdb0c	WVVVDh6kp5ztAW0MGTeD	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 12:57:54.12691	2011-02-08 12:57:54.097	\N	2011-02-08 12:57:54.099753	2011-02-08 12:57:54.127391	1	Enid	Watsica	127-105-9842	Ms. Brionna Price129716987408921	Laurence Estates	East Jennyfershire	66599-9898	West Sussex	1	\N	\N	\N	\N	0	\N	\N	\N	\N	VwSU6SYTxkLNG04jTI1gbPUZdjSg2lF1qfo9Zt5Q7nKmkORaA8Leb1SFNLyFuz	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
4	buyer@nbs.com	b56f14a65ecb7f7cda0f0eae218a020a715e3975254d23c691870f75e14ad4da4532d1d9de5d79ae12afa29bf5adc547c22bd74e3652d9305bd700e4c1753e7a	4cftED5wVGU3Z_NArpiE	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 12:57:54.217203	2011-02-08 12:57:54.180464	\N	2011-02-08 12:57:54.183097	2011-02-08 12:57:54.217669	48	Keith	Schiller	325-974-9895 x649	Jamir Kiehn V129716987417198	Anderson Meadow	South Hershel	34918	Lancashire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	SplMvV6ZoiNbGM7tFeIw4cy1AV9YZeUJKvp90ADwtmCac4YS6vVd5VF2URsNQP	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
5	leaduser@nbs.com	10c7a0680b0e67f4f9ccd2b239c354d654ca687c48bde867f8f66a4bb6120bf820983ea03defea14e3ef5f030ae7f07de1184cf78cd1c611930af219f4b48be3	OnevidO4VLKZxI-n3itm	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-08 12:57:54.303593	2011-02-08 12:57:54.270549	\N	2011-02-08 12:57:54.273225	2011-02-08 12:57:54.331512	64	Cordie	Buckridge	(643)513-5322	Magdalen Gottlieb129716987426019	Nader Station	New Julie	61013-0663	Strathclyde	1	\N	\N	4	\N	0	\N	\N	\N	\N	Ojw3VUUBYAJLKb9p8lxfbqVPMZgoApW64mh12WBjKaPYbF6AXmXdHDJeRETQ7m	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

