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
1	1	dk	About us	About us	2011-01-31 14:38:16.174762	2011-01-31 14:38:16.174762
2	1	en	About us	About us	2011-01-31 14:38:16.321325	2011-01-31 14:38:16.321325
3	2	dk	Privacy	Privacy	2011-01-31 14:38:16.351479	2011-01-31 14:38:16.351479
4	2	en	Privacy	Privacy	2011-01-31 14:38:16.362346	2011-01-31 14:38:16.362346
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-31 14:38:16.394302	2011-01-31 14:38:16.394302
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-31 14:38:16.405518	2011-01-31 14:38:16.405518
7	4	dk	Blurb sign up	Blurb sign up	2011-01-31 14:38:16.433269	2011-01-31 14:38:16.433269
8	4	en	Blurb sign up	Blurb sign up	2011-01-31 14:38:16.444439	2011-01-31 14:38:16.444439
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-31 14:38:16.477579	2011-01-31 14:38:16.477579
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-31 14:38:16.48906	2011-01-31 14:38:16.48906
11	6	dk	Blurb agent home	Blurb agent home	2011-01-31 14:38:16.51827	2011-01-31 14:38:16.51827
12	6	en	Blurb agent home	Blurb agent home	2011-01-31 14:38:16.530537	2011-01-31 14:38:16.530537
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-31 14:38:16.559967	2011-01-31 14:38:16.559967
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-31 14:38:16.573862	2011-01-31 14:38:16.573862
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-31 14:38:16.602255	2011-01-31 14:38:16.602255
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-31 14:38:16.613909	2011-01-31 14:38:16.613909
17	9	dk	Blurb currencies	Blurb currencies	2011-01-31 14:38:16.642608	2011-01-31 14:38:16.642608
18	9	en	Blurb currencies	Blurb currencies	2011-01-31 14:38:16.654119	2011-01-31 14:38:16.654119
19	10	dk	Reset password	Reset password	2011-01-31 14:38:16.836431	2011-01-31 14:38:16.836431
20	10	en	Reset password	Reset password	2011-01-31 14:38:16.847792	2011-01-31 14:38:16.847792
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-31 14:38:16.165003	2011-01-31 14:38:16.324045	about_us	0	t	2011-01-31 14:38:16.323974
2	Article::Cms	2011-01-31 14:38:16.347508	2011-01-31 14:38:16.365247	privacy	0	t	2011-01-31 14:38:16.365174
3	Article::Cms	2011-01-31 14:38:16.390226	2011-01-31 14:38:16.408408	terms_conditions	0	t	2011-01-31 14:38:16.408339
4	Article::Cms	2011-01-31 14:38:16.429264	2011-01-31 14:38:16.447319	blurb_sign_up	1	t	2011-01-31 14:38:16.44725
5	Article::Cms	2011-01-31 14:38:16.473438	2011-01-31 14:38:16.491931	blurb_buyer_home	1	t	2011-01-31 14:38:16.491854
6	Article::Cms	2011-01-31 14:38:16.513958	2011-01-31 14:38:16.533366	blurb_agent_home	1	t	2011-01-31 14:38:16.533295
7	Article::Cms	2011-01-31 14:38:16.5558	2011-01-31 14:38:16.576779	blurb_purchase_manager_home	1	t	2011-01-31 14:38:16.576707
8	Article::Cms	2011-01-31 14:38:16.598199	2011-01-31 14:38:16.61678	blurb_start_page_role_selection	1	t	2011-01-31 14:38:16.616707
9	Article::Cms	2011-01-31 14:38:16.638495	2011-01-31 14:38:16.656857	blurb_currencies	1	t	2011-01-31 14:38:16.656787
10	Article::Cms	2011-01-31 14:38:16.832471	2011-01-31 14:38:16.850656	reset_password	2	t	2011-01-31 14:38:16.850582
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
1	Electronics	Voluptatem vitae sit voluptatum voluptatem.Nihil ducimus voluptates autem non.	2011-01-31 14:38:14.775171	2011-01-31 14:38:14.775171	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Ut ut ut et voluptatem.Excepturi cupiditate doloremque consequatur voluptatem.	2011-01-31 14:38:14.819962	2011-01-31 14:38:14.819962	\N	3	4	\N	0	2-leisure	f	0
3	Business	Sunt sed veniam pariatur rem.Enim quo est velit expedita ducimus repellendus quas.	2011-01-31 14:38:14.994156	2011-01-31 14:38:15.719617	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Voluptatem vitae sit voluptatum voluptatem.Nihil ducimus voluptates autem non.	Electronics	2011-01-31 14:38:14.784189	2011-01-31 14:38:14.784189
2	1	dk	\N	Electronics	2011-01-31 14:38:14.810386	2011-01-31 14:38:14.810386
3	2	en	Ut ut ut et voluptatem.Excepturi cupiditate doloremque consequatur voluptatem.	Leisure	2011-01-31 14:38:14.824773	2011-01-31 14:38:14.824773
4	2	dk	\N	Leisure	2011-01-31 14:38:14.845108	2011-01-31 14:38:14.845108
5	3	en	Sunt sed veniam pariatur rem.Enim quo est velit expedita ducimus repellendus quas.	Business	2011-01-31 14:38:14.998891	2011-01-31 14:38:14.998891
6	3	dk	\N	Business	2011-01-31 14:38:15.017377	2011-01-31 14:38:15.017377
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-31 14:38:14.252095	2011-01-31 14:38:14.252095
2	United Kingdom	2011-01-31 14:38:14.256949	2011-01-31 14:38:14.256949
3	Wales129648469504545	2011-01-31 14:38:15.046752	2011-01-31 14:38:15.046752
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
1	Euro	&euro;	%u%n	t	2011-01-31 14:38:14.753142	2011-01-31 14:38:14.753142
2	PLN	&pln;	%u%n	t	2011-01-31 14:38:14.757422	2011-01-31 14:38:14.757422
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-31 14:38:14.285431	2011-01-31 14:38:14.285431
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-31 14:38:14.300449	2011-01-31 14:38:14.300449
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-31 14:38:14.313549	2011-01-31 14:38:14.313549
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-31 14:38:14.3262	2011-01-31 14:38:14.3262
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-31 14:38:14.339179	2011-01-31 14:38:14.339179
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-31 14:38:14.489412	2011-01-31 14:38:14.489412
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-31 14:38:14.501951	2011-01-31 14:38:14.501951
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-31 14:38:14.514088	2011-01-31 14:38:14.514088
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-31 14:38:14.52664	2011-01-31 14:38:14.52664
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-31 14:38:14.538789	2011-01-31 14:38:14.538789
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-31 14:38:14.551074	2011-01-31 14:38:14.551074
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-31 14:38:14.563238	2011-01-31 14:38:14.563238
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-31 14:38:14.578949	2011-01-31 14:38:14.578949
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-31 14:38:14.591019	2011-01-31 14:38:14.591019
15	8	en	Question	<p></p>	2011-01-31 14:38:14.60387	2011-01-31 14:38:14.60387
16	8	dk	[DK] Question	<p></p>	2011-01-31 14:38:14.616167	2011-01-31 14:38:14.616167
17	9	en	Invoice	<p></p>	2011-01-31 14:38:14.628946	2011-01-31 14:38:14.628946
18	9	dk	[DK] Invoice	<p></p>	2011-01-31 14:38:14.64183	2011-01-31 14:38:14.64183
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-31 14:38:14.276641	2011-01-31 14:38:14.296114
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-31 14:38:14.308862	2011-01-31 14:38:14.321802
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-31 14:38:14.334451	2011-01-31 14:38:14.485189
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-31 14:38:14.497498	2011-01-31 14:38:14.510018
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-31 14:38:14.522171	2011-01-31 14:38:14.534508
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-31 14:38:14.546673	2011-01-31 14:38:14.559186
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-31 14:38:14.574357	2011-01-31 14:38:14.586977
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-31 14:38:14.599516	2011-01-31 14:38:14.61196
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-31 14:38:14.624385	2011-01-31 14:38:14.637376
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
1	1	dk	Quia repellat nobis quod eligendi.Autem consequatur soluta voluptatibus.	Placeat ut ipsum similique.Voluptates fugit nihil a.	Big deal on printers	2011-01-31 14:38:15.155002	2011-01-31 14:38:15.155002
2	2	dk	Omnis ipsa omnis delectus.Labore et voluptates corrupti sapiente nobis.	Sapiente cupiditate nemo assumenda omnis consequatur fuga et.Natus inventore est itaque.	Drills required	2011-01-31 14:38:15.228551	2011-01-31 14:38:15.228551
3	3	dk	Molestias ut accusamus cum earum sit quibusdam.Nostrum sit et qui.	Aliquid eos quibusdam laborum molestiae ut.Ipsum a molestiae esse omnis quae minus aut quidem.	Need assistance in selling a car	2011-01-31 14:38:15.298063	2011-01-31 14:38:15.298063
4	4	dk	Voluptas enim sed facere.Qui minus accusantium ut dicta blanditiis.	Alias quibusdam reprehenderit dolorem est.Voluptas odio dolorum autem illo molestiae.	Ipod shipment	2011-01-31 14:38:15.509442	2011-01-31 14:38:15.509442
5	5	dk	Rerum qui perspiciatis laudantium dolores.Fuga voluptate magni reprehenderit voluptas nisi earum laudantium sunt.	Recusandae harum minus ut est nihil quidem quis earum.Amet distinctio sint repudiandae.	Trip to amazonia - looking for offer	2011-01-31 14:38:15.582263	2011-01-31 14:38:15.582263
6	6	dk	Occaecati soluta inventore et aut.Est itaque et velit omnis.	Et blanditiis accusantium et.Et delectus consequuntur qui.	LCD - Huge amounts	2011-01-31 14:38:15.654169	2011-01-31 14:38:15.654169
7	7	dk	Nulla at facilis dolore sit incidunt.Et ut et quae libero quibusdam commodi.	Cum aut eos distinctio sequi.A blanditiis nobis est sint adipisci voluptas fugit iure.	GPS receivers required	2011-01-31 14:38:15.72675	2011-01-31 14:38:15.72675
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county, company_phone_number, company_ean_number, company_website, direct_phone_number, is_international) FROM stdin;
1	Big deal on printers	3	Quia repellat nobis quod eligendi.Autem consequatur soluta voluptatibus.	Placeat ut ipsum similique.Voluptates fugit nihil a.	2	User::Agent	0	804.0	972.0	1	Wisozk	Chloe Gerlach	217-471-7596	jeremy_jacobson@klocko.name	2011-01-31 14:38:15.11358	2011-01-31 14:38:15.11358	2011-02-05	Gunnar129648469504447 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-31 14:38:15.123449	\N	\N	1165 Donny Court	\N	\N	Lake Tysonport	24356	Worcestershire	\N	\N	\N	\N	t
2	Drills required	3	Omnis ipsa omnis delectus.Labore et voluptates corrupti sapiente nobis.	Sapiente cupiditate nemo assumenda omnis consequatur fuga et.Natus inventore est itaque.	2	User::Agent	0	290.0	594.0	1	Abbott	Vida Christiansen	330.725.0763 x204	shaniya_heidenreich@skiles.ca	2011-01-31 14:38:15.195491	2011-01-31 14:38:15.195491	2011-02-05	Gunnar129648469504447 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-31 14:38:15.202533	\N	\N	562 West Roads	\N	\N	Jamisonmouth	86420-0673	Strathclyde	\N	\N	\N	\N	t
3	Need assistance in selling a car	3	Molestias ut accusamus cum earum sit quibusdam.Nostrum sit et qui.	Aliquid eos quibusdam laborum molestiae ut.Ipsum a molestiae esse omnis quae minus aut quidem.	2	User::Agent	0	78.0	397.0	1	Cruickshank	Jeff Daugherty	(977)264-2772	nedra@haleymorar.info	2011-01-31 14:38:15.265222	2011-01-31 14:38:15.265222	2011-02-05	Gunnar129648469504447 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-31 14:38:15.272445	\N	\N	65481 Cleveland Port	\N	\N	Walshbury	49762-1507	County Fermanagh	\N	\N	\N	\N	t
4	Ipod shipment	3	Voluptas enim sed facere.Qui minus accusantium ut dicta blanditiis.	Alias quibusdam reprehenderit dolorem est.Voluptas odio dolorum autem illo molestiae.	2	User::Agent	0	317.0	597.0	1	Gibsonbogisich	Tillman Barrows	565.549.0585	claudine@homenicksawayn.co.uk	2011-01-31 14:38:15.333639	2011-01-31 14:38:15.333639	2011-02-05	Gunnar129648469504447 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-31 14:38:15.483368	\N	\N	91568 Katlyn Orchard	\N	\N	Murazikview	86086	Dyfed	\N	\N	\N	\N	t
5	Trip to amazonia - looking for offer	3	Rerum qui perspiciatis laudantium dolores.Fuga voluptate magni reprehenderit voluptas nisi earum laudantium sunt.	Recusandae harum minus ut est nihil quidem quis earum.Amet distinctio sint repudiandae.	2	User::Agent	0	576.0	89.0	1	Gibson	Claire Maggio	1-206-934-3506	arne@borer.co.uk	2011-01-31 14:38:15.54625	2011-01-31 14:38:15.54625	2011-02-05	Gunnar129648469504447 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-31 14:38:15.553156	\N	\N	581 Crystel Corners	\N	\N	New Claymouth	12420	Shropshire	\N	\N	\N	\N	t
6	LCD - Huge amounts	3	Occaecati soluta inventore et aut.Est itaque et velit omnis.	Et blanditiis accusantium et.Et delectus consequuntur qui.	2	User::Agent	0	689.0	679.0	1	Rempel	Onie Jacobson	(445)387-6699 x17323	william_reynolds@boyle.name	2011-01-31 14:38:15.619538	2011-01-31 14:38:15.619538	2011-02-05	Gunnar129648469504447 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-31 14:38:15.626727	\N	\N	668 Gudrun Corners	\N	\N	Gerholdmouth	26047-8260	Highlands and Islands	\N	\N	\N	\N	t
7	GPS receivers required	3	Nulla at facilis dolore sit incidunt.Et ut et quae libero quibusdam commodi.	Cum aut eos distinctio sequi.A blanditiis nobis est sint adipisci voluptas fugit iure.	2	User::Agent	0	555.0	389.0	1	Schroeder	Misael Jacobson	185-056-5202	evans@stracke.biz	2011-01-31 14:38:15.691763	2011-01-31 14:38:15.691763	2011-02-05	Gunnar129648469504447 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-31 14:38:15.698908	\N	\N	1123 Russel Groves	\N	\N	New Omermouth	69219	Tyne and Wear	\N	\N	\N	\N	t
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
1	default_payout_delay	--- 0\n	2011-01-31 14:38:14.215842	2011-01-31 14:38:14.215842
2	default_leads_per_page	--- 5\n	2011-01-31 14:38:14.221349	2011-01-31 14:38:14.221349
3	certification_level_1	--- 10\n	2011-01-31 14:38:14.225469	2011-01-31 14:38:14.225469
4	certification_level_2	--- 20\n	2011-01-31 14:38:14.228656	2011-01-31 14:38:14.228656
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-31 14:38:14.230825	2011-01-31 14:38:14.230825
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-31 14:38:14.232955	2011-01-31 14:38:14.232955
7	invoicing_seller_name	--- Fairleads\n	2011-01-31 14:38:14.235002	2011-01-31 14:38:14.235002
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-31 14:38:14.237411	2011-01-31 14:38:14.237411
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-31 14:38:14.239475	2011-01-31 14:38:14.239475
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-31 14:38:14.24153	2011-01-31 14:38:14.24153
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-31 14:38:14.243529	2011-01-31 14:38:14.243529
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
1	blazejek@gmail.com	bc1f2b933837d00324f3c76657d0d584cfb4a2d6890e81fd872af0fe94a3c771b5a4c43306c4e6eb3df329e7c07f2893626d97c9b0ca70ab9469e0dd8a34d1c3	UImAifJ2S-x_QKXRF05u	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-31 14:38:14.743257	2011-01-31 14:38:14.683194	\N	2011-01-31 14:38:14.68343	2011-01-31 14:38:14.743551	1	Ari	Jacobs	234.160.6115	root	Pouros Hollow	South Dell	40953-1217	Fife	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Clw9WMlu6ZHQKkYlRBD9o5i9O2z2ssxM3eeNlcRxNuEdCBcJYbQWX2zetAk70c	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	36e2f1d4853526762764cbf9d70f3050df060790d2399c95a17416a95d5205cd5b051e0abbf498f2e8cac5cfc41ac6cb0f727d8807162bfec7b6c2f679941ecb	7mzsgpc2mutb9hNQVpx2	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-31 14:38:15.076691	2011-01-31 14:38:15.052184	\N	2011-01-31 14:38:15.052401	2011-01-31 14:38:15.07697	2	Gunnar129648469504447	Hermann	408.452.2049 x6531	Gilberto Herman129648469504421	Morissette Turnpike	Clevelandberg	74262-2951	Northumberland	3	\N	0	\N	\N	0	\N	\N	\N	\N	LCWFq9inoRi77KtxyQXDqzCWpDdPo4NxuEQ16JirxCDHbzaENiK5EdrZdEtRHh	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	e668ee699fda6cc058619474a5a89bdbe99e739ec8799c924797311ad96b96d4f9c3d40ab2569ec85500f18f0213b4a2820b5cb39098c1721413850035683ef2	-QVo_H6GMV6i6MgdzRGw	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-31 14:38:15.808814	2011-01-31 14:38:15.788281	\N	2011-01-31 14:38:15.788553	2011-01-31 14:38:15.809095	1	Caitlyn	Kiehn	1-983-984-1291 x6475	Julien Armstrong129648469578315	Rolfson Avenue	Walkerstad	22489-3506	Highlands and Islands	1	\N	\N	\N	\N	0	\N	\N	\N	\N	bPjALTI34qMhoxrkNiRVPJk9mNfdZ01j2BJ2e3fdoA4bVUxaULhDXhx3XJEqpO	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	f0c8776e0320c0d38dec40f2b365f73115020552b8ed2874a9ce2848d677f9f0018c87f002ded4d46fefb581e1d1592ba73c9c07092ada51950adc705d6a16f3	Ti8-pf8HBwzM4JKSA1GA	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-31 14:38:16.011396	2011-01-31 14:38:15.98907	\N	2011-01-31 14:38:15.989296	2011-01-31 14:38:16.011731	48	Sebastian	Kling	939.203.0363 x941	Gaston Mills129648469598366	Luella Corners	East Elissa	67380-0778	County Down	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Ua5DxK8YwPDEOeJvWMBHREsLDvfECICHDkpN1chneoLTT8bmOkQLJUPafyfSpb	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	c2a622deb0a1f8b0ce4da28ed0a4246074da1a573585ac6ecf7569dc80d70d914f2232ef217cc0c41b4599f37d5c6d2c5f903a333cc0f87cf1f7ceb86757ad04	PCaPfyA5f4mqZRBYl0gT	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-31 14:38:16.068833	2011-01-31 14:38:16.046131	\N	2011-01-31 14:38:16.046349	2011-01-31 14:38:16.085442	64	Mariane	Tillman	991-200-1800 x272	Willis Lehner129648469604095	Cummings Squares	Bogisichstad	60850-9276	Merseyside	1	\N	\N	4	\N	0	\N	\N	\N	\N	lrlQS6GItM3NeJQjQcdjeEPOjAFghPEnMtyZ7fHQlVs0Qm4EkGqmqs99NF9g9H	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

