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

SELECT pg_catalog.setval('categories_id_seq', 4, true);


--
-- Name: category_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_interests_id_seq', 1, false);


--
-- Name: category_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_translations_id_seq', 7, true);


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

SELECT pg_catalog.setval('users_id_seq', 6, true);


--
-- Name: vat_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vat_rates_id_seq', 1, false);


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-02 15:39:30.084933	2011-02-02 15:39:30.084933
2	1	en	About us	About us	2011-02-02 15:39:30.111389	2011-02-02 15:39:30.111389
3	2	dk	Privacy	Privacy	2011-02-02 15:39:30.157252	2011-02-02 15:39:30.157252
4	2	en	Privacy	Privacy	2011-02-02 15:39:30.175556	2011-02-02 15:39:30.175556
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-02 15:39:30.229422	2011-02-02 15:39:30.229422
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-02 15:39:30.251058	2011-02-02 15:39:30.251058
7	4	dk	Blurb sign up	Blurb sign up	2011-02-02 15:39:30.314907	2011-02-02 15:39:30.314907
8	4	en	Blurb sign up	Blurb sign up	2011-02-02 15:39:30.332973	2011-02-02 15:39:30.332973
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-02 15:39:30.376429	2011-02-02 15:39:30.376429
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-02 15:39:30.396202	2011-02-02 15:39:30.396202
11	6	dk	Blurb agent home	Blurb agent home	2011-02-02 15:39:30.440144	2011-02-02 15:39:30.440144
12	6	en	Blurb agent home	Blurb agent home	2011-02-02 15:39:30.469215	2011-02-02 15:39:30.469215
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-02 15:39:30.511774	2011-02-02 15:39:30.511774
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-02 15:39:30.529843	2011-02-02 15:39:30.529843
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-02 15:39:30.572778	2011-02-02 15:39:30.572778
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-02 15:39:30.590363	2011-02-02 15:39:30.590363
17	9	dk	Blurb currencies	Blurb currencies	2011-02-02 15:39:30.633804	2011-02-02 15:39:30.633804
18	9	en	Blurb currencies	Blurb currencies	2011-02-02 15:39:30.657512	2011-02-02 15:39:30.657512
19	10	dk	Blurb category home	Blurb category home	2011-02-02 15:39:30.698795	2011-02-02 15:39:30.698795
20	10	en	Blurb category home	Blurb category home	2011-02-02 15:39:30.718362	2011-02-02 15:39:30.718362
21	11	dk	Reset password	Reset password	2011-02-02 15:39:30.771294	2011-02-02 15:39:30.771294
22	11	en	Reset password	Reset password	2011-02-02 15:39:30.790896	2011-02-02 15:39:30.790896
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, published, published_date, resource_type, resource_id) FROM stdin;
1	Article::Cms::MainPageArticle	2011-02-02 15:39:30.071585	2011-02-02 15:39:30.117293	about_us	t	2011-02-02 15:39:30.11718	\N	\N
2	Article::Cms::MainPageArticle	2011-02-02 15:39:30.151814	2011-02-02 15:39:30.183904	privacy	t	2011-02-02 15:39:30.183719	\N	\N
3	Article::Cms::MainPageArticle	2011-02-02 15:39:30.224075	2011-02-02 15:39:30.258164	terms_conditions	t	2011-02-02 15:39:30.258056	\N	\N
4	Article::Cms::InterfaceContentText	2011-02-02 15:39:30.306957	2011-02-02 15:39:30.33847	blurb_sign_up	t	2011-02-02 15:39:30.338359	\N	\N
5	Article::Cms::InterfaceContentText	2011-02-02 15:39:30.370953	2011-02-02 15:39:30.401711	blurb_buyer_home	t	2011-02-02 15:39:30.401603	\N	\N
6	Article::Cms::InterfaceContentText	2011-02-02 15:39:30.432148	2011-02-02 15:39:30.475653	blurb_agent_home	t	2011-02-02 15:39:30.475542	\N	\N
7	Article::Cms::InterfaceContentText	2011-02-02 15:39:30.506384	2011-02-02 15:39:30.536285	blurb_purchase_manager_home	t	2011-02-02 15:39:30.536176	\N	\N
8	Article::Cms::InterfaceContentText	2011-02-02 15:39:30.567338	2011-02-02 15:39:30.595893	blurb_start_page_role_selection	t	2011-02-02 15:39:30.595781	\N	\N
9	Article::Cms::InterfaceContentText	2011-02-02 15:39:30.62843	2011-02-02 15:39:30.663044	blurb_currencies	t	2011-02-02 15:39:30.662935	\N	\N
10	Article::Cms::InterfaceContentText	2011-02-02 15:39:30.693353	2011-02-02 15:39:30.725335	blurb_category_home	t	2011-02-02 15:39:30.725222	\N	\N
11	Article::Cms::HelpPopup	2011-02-02 15:39:30.763386	2011-02-02 15:39:30.797827	reset_password	t	2011-02-02 15:39:30.797712	\N	\N
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
1	1	Default Bank	Default Location	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-02 15:39:28.017231	2011-02-02 15:39:28.017231	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Est dolorem dolore odio.Est est libero est minus dicta quos.	2011-02-02 15:39:28.651914	2011-02-02 15:39:28.651914	\N	1	2	\N	0	electronics	f	0
2	Leisure	Non sequi corporis omnis voluptatem vel in.Eligendi esse cupiditate rem corporis nihil.	2011-02-02 15:39:28.722057	2011-02-02 15:39:28.722057	\N	3	4	\N	0	leisure	f	0
3	Business	Optio est nostrum tempore.Odit dolore asperiores ex aliquid voluptatum alias a.	2011-02-02 15:39:28.7776	2011-02-02 15:39:29.605188	\N	5	6	\N	7	business	f	7
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
1	1	en	Est dolorem dolore odio.Est est libero est minus dicta quos.	Electronics	2011-02-02 15:39:28.665382	2011-02-02 15:39:28.665382
2	1	dk	\N	Electronics	2011-02-02 15:39:28.705185	2011-02-02 15:39:28.705185
3	2	en	Non sequi corporis omnis voluptatem vel in.Eligendi esse cupiditate rem corporis nihil.	Leisure	2011-02-02 15:39:28.730326	2011-02-02 15:39:28.730326
4	2	dk	\N	Leisure	2011-02-02 15:39:28.760424	2011-02-02 15:39:28.760424
5	3	en	Optio est nostrum tempore.Odit dolore asperiores ex aliquid voluptatum alias a.	Business	2011-02-02 15:39:28.793569	2011-02-02 15:39:28.793569
6	3	dk	\N	Business	2011-02-02 15:39:28.825575	2011-02-02 15:39:28.825575
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-02 15:39:27.988835	2011-02-02 15:39:27.988835
2	United Kingdom	2011-02-02 15:39:27.999637	2011-02-02 15:39:27.999637
3	Scotland129666116886802	2011-02-02 15:39:28.869686	2011-02-02 15:39:28.869686
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
1	Euro	&euro;	%u%n	t	2011-02-02 15:39:28.608879	2011-02-02 15:39:28.608879
2	PLN	&pln;	%u%n	t	2011-02-02 15:39:28.617484	2011-02-02 15:39:28.617484
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-02 15:39:28.061761	2011-02-02 15:39:28.061761
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-02 15:39:28.086815	2011-02-02 15:39:28.086815
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-02 15:39:28.109525	2011-02-02 15:39:28.109525
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-02 15:39:28.12788	2011-02-02 15:39:28.12788
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-02 15:39:28.146321	2011-02-02 15:39:28.146321
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-02 15:39:28.174012	2011-02-02 15:39:28.174012
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-02 15:39:28.197176	2011-02-02 15:39:28.197176
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-02 15:39:28.223409	2011-02-02 15:39:28.223409
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-02 15:39:28.241136	2011-02-02 15:39:28.241136
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-02 15:39:28.259578	2011-02-02 15:39:28.259578
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-02 15:39:28.286092	2011-02-02 15:39:28.286092
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-02 15:39:28.30327	2011-02-02 15:39:28.30327
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-02 15:39:28.321042	2011-02-02 15:39:28.321042
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-02 15:39:28.338833	2011-02-02 15:39:28.338833
15	8	en	<p></p>	Question	2011-02-02 15:39:28.357165	2011-02-02 15:39:28.357165
16	8	dk	<p></p>	[DK] Question	2011-02-02 15:39:28.382013	2011-02-02 15:39:28.382013
17	9	en	<p></p>	Invoice	2011-02-02 15:39:28.400321	2011-02-02 15:39:28.400321
18	9	dk	<p></p>	[DK] Invoice	2011-02-02 15:39:28.422785	2011-02-02 15:39:28.422785
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-02 15:39:28.048053	2011-02-02 15:39:28.081484
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-02 15:39:28.100838	2011-02-02 15:39:28.1228
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-02 15:39:28.140247	2011-02-02 15:39:28.160129
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-02 15:39:28.190897	2011-02-02 15:39:28.2152
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-02 15:39:28.235694	2011-02-02 15:39:28.254307
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-02 15:39:28.279594	2011-02-02 15:39:28.298062
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-02 15:39:28.315484	2011-02-02 15:39:28.333779
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-02 15:39:28.351786	2011-02-02 15:39:28.370026
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-02 15:39:28.394717	2011-02-02 15:39:28.415387
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
1	1	dk	Big deal on printers	Tenetur rerum eaque ipsa.Sint magnam eveniet est cupiditate.	Eveniet enim dolor doloribus.Unde earum temporibus ex assumenda quia soluta ab.	2011-02-02 15:39:29.017366	2011-02-02 15:39:29.017366
2	2	dk	Drills required	Architecto eum aut id quia omnis.Qui nesciunt et repellat fuga sit veniam dolorem ut.	Ut ut delectus tempora illum eius.Quia omnis dolor sed.	2011-02-02 15:39:29.124239	2011-02-02 15:39:29.124239
3	3	dk	Need assistance in selling a car	Quis dolorem quod eos sit dolore quo repellat adipisci.Dolorum incidunt iste quisquam ut ut.	Quis ipsa eligendi saepe sapiente.Sed assumenda recusandae ab facere hic suscipit et.	2011-02-02 15:39:29.222935	2011-02-02 15:39:29.222935
4	4	dk	Ipod shipment	Dolorem et unde dolores sed nihil.Aperiam unde veritatis aut voluptas praesentium.	Doloribus molestiae incidunt possimus quia.Debitis totam deleniti delectus.	2011-02-02 15:39:29.318515	2011-02-02 15:39:29.318515
5	5	dk	Trip to amazonia - looking for offer	Voluptas quis quasi consequatur sint.Beatae eum id optio recusandae.	Voluptas nihil fugit iusto et.Est odit dolorum quia pariatur facere impedit repudiandae.	2011-02-02 15:39:29.41568	2011-02-02 15:39:29.41568
6	6	dk	LCD - Huge amounts	Minus sed ratione ut.Consequatur ea tempora enim.	Aut fugiat temporibus consequuntur dolor.Mollitia a aut omnis beatae voluptas ut quasi.	2011-02-02 15:39:29.51906	2011-02-02 15:39:29.51906
7	7	dk	GPS receivers required	Veritatis enim sequi ea dolorum unde.Non deserunt tempora labore recusandae et consectetur.	Ut similique ipsum voluptatem.Ab voluptatem quasi impedit deleniti quo quia sed omnis.	2011-02-02 15:39:29.617257	2011-02-02 15:39:29.617257
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Eveniet enim dolor doloribus.Unde earum temporibus ex assumenda quia soluta ab.	Tenetur rerum eaque ipsa.Sint magnam eveniet est cupiditate.	2	User::Agent	0	124.0	118.0	1	Brakuskris	Tyler Hegmann	571.403.0835 x8337	randy@ebert.biz	2011-02-02 15:39:28.964797	2011-02-02 15:39:28.964797	2011-02-07	Marcelino129666116886715 Kunze	1	t	\N	0	0	f	f	-1	1	2011-02-02 15:39:28.976067	\N	\N	326 Antonietta Forks	\N	\N	Stephaniaview	07015	Essex
2	Drills required	3	Ut ut delectus tempora illum eius.Quia omnis dolor sed.	Architecto eum aut id quia omnis.Qui nesciunt et repellat fuga sit veniam dolorem ut.	2	User::Agent	0	715.0	758.0	1	Rippinondricka	Rossie Kilback	(311)239-2968 x50858	clara.vonrueden@eichmanngleason.name	2011-02-02 15:39:29.070412	2011-02-02 15:39:29.070412	2011-02-07	Marcelino129666116886715 Kunze	1	t	\N	0	0	f	f	-1	1	2011-02-02 15:39:29.085	\N	\N	8390 Harvey Rue	\N	\N	New Jamesonview	65850-9355	Northamptonshire
3	Need assistance in selling a car	3	Quis ipsa eligendi saepe sapiente.Sed assumenda recusandae ab facere hic suscipit et.	Quis dolorem quod eos sit dolore quo repellat adipisci.Dolorum incidunt iste quisquam ut ut.	2	User::Agent	0	852.0	39.0	1	Shanahanhoeger	Jakob Carroll	(786)569-0262 x683	erna.walsh@hintzgoyette.com	2011-02-02 15:39:29.174849	2011-02-02 15:39:29.174849	2011-02-07	Marcelino129666116886715 Kunze	1	t	\N	0	0	f	f	-1	1	2011-02-02 15:39:29.185219	\N	\N	727 Gladyce Pike	\N	\N	Labadieberg	68910-3558	Merseyside
4	Ipod shipment	3	Doloribus molestiae incidunt possimus quia.Debitis totam deleniti delectus.	Dolorem et unde dolores sed nihil.Aperiam unde veritatis aut voluptas praesentium.	2	User::Agent	0	154.0	985.0	1	Rempel	Ben Kihn	(782)980-3335	gracie@zboncak.info	2011-02-02 15:39:29.275838	2011-02-02 15:39:29.275838	2011-02-07	Marcelino129666116886715 Kunze	1	t	\N	0	0	f	f	-1	1	2011-02-02 15:39:29.283936	\N	\N	5878 Kade Haven	\N	\N	Jeanieport	47004	Norfolk
5	Trip to amazonia - looking for offer	3	Voluptas nihil fugit iusto et.Est odit dolorum quia pariatur facere impedit repudiandae.	Voluptas quis quasi consequatur sint.Beatae eum id optio recusandae.	2	User::Agent	0	904.0	980.0	1	Beahan	Simone Collier	1-054-446-6127 x885	eloisa_homenick@bednar.us	2011-02-02 15:39:29.36962	2011-02-02 15:39:29.36962	2011-02-07	Marcelino129666116886715 Kunze	1	t	\N	0	0	f	f	-1	1	2011-02-02 15:39:29.377977	\N	\N	63456 Granville Manors	\N	\N	Monserrateberg	93441-8012	Buckinghamshire
6	LCD - Huge amounts	3	Aut fugiat temporibus consequuntur dolor.Mollitia a aut omnis beatae voluptas ut quasi.	Minus sed ratione ut.Consequatur ea tempora enim.	2	User::Agent	0	626.0	25.0	1	Harrisbartell	Lukas Streich	(958)647-8718 x85915	jairo@langworthwest.us	2011-02-02 15:39:29.474262	2011-02-02 15:39:29.474262	2011-02-07	Marcelino129666116886715 Kunze	1	t	\N	0	0	f	f	-1	1	2011-02-02 15:39:29.482909	\N	\N	35104 Heaven Gardens	\N	\N	Krisport	69150-2116	West Sussex
7	GPS receivers required	3	Ut similique ipsum voluptatem.Ab voluptatem quasi impedit deleniti quo quia sed omnis.	Veritatis enim sequi ea dolorum unde.Non deserunt tempora labore recusandae et consectetur.	2	User::Agent	0	971.0	366.0	1	Beattychristiansen	Esther Gorczany	1-259-450-2239 x310	hellen@dach.name	2011-02-02 15:39:29.571194	2011-02-02 15:39:29.571194	2011-02-07	Marcelino129666116886715 Kunze	1	t	\N	0	0	f	f	-1	1	2011-02-02 15:39:29.579545	\N	\N	6568 Kris Cliff	\N	\N	Lavernmouth	08621-9707	Humberside
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
1	default_payout_delay	--- 0\n	2011-02-02 15:39:27.899044	2011-02-02 15:39:27.899044
2	default_leads_per_page	--- 5\n	2011-02-02 15:39:27.908729	2011-02-02 15:39:27.908729
3	certification_level_1	--- 10\n	2011-02-02 15:39:27.916426	2011-02-02 15:39:27.916426
4	certification_level_2	--- 20\n	2011-02-02 15:39:27.923579	2011-02-02 15:39:27.923579
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-02 15:39:27.929416	2011-02-02 15:39:27.929416
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-02 15:39:27.935334	2011-02-02 15:39:27.935334
7	invoicing_seller_name	--- Fairleads\n	2011-02-02 15:39:27.941674	2011-02-02 15:39:27.941674
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-02 15:39:27.949135	2011-02-02 15:39:27.949135
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-02 15:39:27.956418	2011-02-02 15:39:27.956418
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-02 15:39:27.963647	2011-02-02 15:39:27.963647
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
1	blazejek@gmail.com	b7420b65dfaf8253a1a81f68c0c7fe785ab81b2c703f6c89054417e1e08d40af15937548bc4bc74bdf3dea9b29acf62ed6f47aca18cb75c69151c44636ea5a46	qXa_no8ErXWnPwPMkLEr	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 15:39:28.579912	2011-02-02 15:39:28.488414	\N	2011-02-02 15:39:28.494862	2011-02-02 15:39:28.593121	1	Nona	Reinger	188-954-7019	root	Steuber River	Destineemouth	19081-6794	Cheshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	DBNf5mPgNVBSHkYwFbbaOo4lkRP1cy4XJhSFpGs1FEV7mrkawpPiZQwA9N2QY4	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
2	agent@nbs.com	d2021e80e3701355b80c6c2e6f36754640b7931f201821273046fb3e6c98ebe18eba4b3f8d6caae72514ea334fcbc285a04e28ccc043c2444953218c85a8061d	zQxJCc1FlXFn-fcUi8-9	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 15:39:28.914393	2011-02-02 15:39:28.8811	\N	2011-02-02 15:39:28.883817	2011-02-02 15:39:28.914841	2	Marcelino129666116886715	Kunze	(268)671-4406	Alexandrea Wisoky129666116886679	Uriah Summit	West Enos	96452-8608	Strathclyde	1	\N	0	\N	\N	0	\N	\N	\N	\N	ePDtMciMzES5iuDaPIf7uQIxX2O4xzwl5Qtr54Q4ObU7xDiOb1nLJ9IzeWogEM	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
3	admin@nbs.com	27699541001bb1cd903ec48f2a402ad51794916fd2d1b420a5e28d983e09374e1dbb99718067e7cfb427ccc2a353d2a78a4ef840e738082d6a2276148dbb36a0	NwcyR3I_cbD0aY4RHkAN	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 15:39:29.74181	2011-02-02 15:39:29.709821	\N	2011-02-02 15:39:29.712411	2011-02-02 15:39:29.742368	1	Serenity	Kiehn	803-314-2908 x298	Randi Schowalter129666116970212	Solon Spurs	Margaretefort	49932	County Down	1	\N	\N	\N	\N	0	\N	\N	\N	\N	m2fUD4SuDV9L4mOBXbQ5W7s1KqOrvpZGWk4lZ0HqhcDg5FA5yIJQtilV4ntWBM	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
4	buyer@nbs.com	94ec08d6541ea8b0536e7fc6583dea23f026751de1f7358a3c51a515c62f668d510171990b01673af7c21f1374bb5e90d02f4984270f1a3c7273fde12d14d8bd	Uj155zg3rmRRAhsSUKop	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 15:39:29.83342	2011-02-02 15:39:29.798563	\N	2011-02-02 15:39:29.801284	2011-02-02 15:39:29.833894	48	Jeanie	Ziemann	724.080.9185 x5865	Eugenia Rodriguez129666116979004	Jerome Centers	West Leoraberg	55244-1443	Isle of Wight	1	\N	\N	\N	\N	0	\N	\N	\N	\N	fLuYVzRZ7Oa3rtciMBImJJ6Ig4oPsemY6qlvUakF6Wb2ZKcI6T3fZoEKVEHDw5	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
5	leaduser@nbs.com	296e92bbe4dab6fd5742ec8ad5fbdc19ef73fddaca41caa5709cd8e07d4dcd59cc5c0457c9872d4c843d1c1a040b9863d47fd70a62fa48c258320bb5294c5729	WIV7-ocfRD8dcJLKIXph	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-02 15:39:29.919934	2011-02-02 15:39:29.886949	\N	2011-02-02 15:39:29.88973	2011-02-02 15:39:29.94709	64	Sophie	Davis	(986)296-0661 x20219	Yasmeen Jenkins129666116987873	Bradford Park	Shannyberg	88776-4645	Wiltshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	GWlEdolDBJAEoOUKiiwYmteYWM7ShfFUypBMSuqefXM6F6RNtOWqB5TqExcRNW	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1	\N
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

