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

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-01-19 10:28:35.430775	2011-01-19 10:28:35.430775
2	1	en	About us	About us	2011-01-19 10:28:35.469592	2011-01-19 10:28:35.469592
3	2	dk	Privacy	Privacy	2011-01-19 10:28:35.522416	2011-01-19 10:28:35.522416
4	2	en	Privacy	Privacy	2011-01-19 10:28:35.539681	2011-01-19 10:28:35.539681
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-19 10:28:35.588483	2011-01-19 10:28:35.588483
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-19 10:28:35.606012	2011-01-19 10:28:35.606012
7	4	dk	Blurb sign up	Blurb sign up	2011-01-19 10:28:35.652248	2011-01-19 10:28:35.652248
8	4	en	Blurb sign up	Blurb sign up	2011-01-19 10:28:35.67331	2011-01-19 10:28:35.67331
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-19 10:28:35.719212	2011-01-19 10:28:35.719212
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-19 10:28:35.738958	2011-01-19 10:28:35.738958
11	6	dk	Blurb agent home	Blurb agent home	2011-01-19 10:28:35.798679	2011-01-19 10:28:35.798679
12	6	en	Blurb agent home	Blurb agent home	2011-01-19 10:28:35.819439	2011-01-19 10:28:35.819439
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-19 10:28:35.870402	2011-01-19 10:28:35.870402
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-19 10:28:35.902222	2011-01-19 10:28:35.902222
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-19 10:28:35.971511	2011-01-19 10:28:35.971511
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-19 10:28:35.992947	2011-01-19 10:28:35.992947
17	9	dk	Blurb currencies	Blurb currencies	2011-01-19 10:28:36.049613	2011-01-19 10:28:36.049613
18	9	en	Blurb currencies	Blurb currencies	2011-01-19 10:28:36.072967	2011-01-19 10:28:36.072967
19	10	dk	Reset password	Reset password	2011-01-19 10:28:36.124352	2011-01-19 10:28:36.124352
20	10	en	Reset password	Reset password	2011-01-19 10:28:36.14767	2011-01-19 10:28:36.14767
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-19 10:28:35.419812	2011-01-19 10:28:35.478326	about_us	0	t	2011-01-19 10:28:35.478169
2	Article::Cms	2011-01-19 10:28:35.516475	2011-01-19 10:28:35.546142	privacy	0	t	2011-01-19 10:28:35.546042
3	Article::Cms	2011-01-19 10:28:35.58325	2011-01-19 10:28:35.61188	terms_conditions	0	t	2011-01-19 10:28:35.611777
4	Article::Cms	2011-01-19 10:28:35.646924	2011-01-19 10:28:35.680976	blurb_sign_up	1	t	2011-01-19 10:28:35.680863
5	Article::Cms	2011-01-19 10:28:35.713653	2011-01-19 10:28:35.752079	blurb_buyer_home	1	t	2011-01-19 10:28:35.751973
6	Article::Cms	2011-01-19 10:28:35.793303	2011-01-19 10:28:35.82796	blurb_agent_home	1	t	2011-01-19 10:28:35.827841
7	Article::Cms	2011-01-19 10:28:35.86502	2011-01-19 10:28:35.911294	blurb_purchase_manager_home	1	t	2011-01-19 10:28:35.911181
8	Article::Cms	2011-01-19 10:28:35.96614	2011-01-19 10:28:36.001136	blurb_start_page_role_selection	1	t	2011-01-19 10:28:36.001037
9	Article::Cms	2011-01-19 10:28:36.042163	2011-01-19 10:28:36.080092	blurb_currencies	1	t	2011-01-19 10:28:36.079991
10	Article::Cms	2011-01-19 10:28:36.11912	2011-01-19 10:28:36.160425	reset_password	2	t	2011-01-19 10:28:36.160273
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
1	Electronics	Repudiandae doloribus similique reiciendis non provident facere.Officia occaecati minus et sit saepe voluptatem.	2011-01-19 10:28:33.864298	2011-01-19 10:28:33.864298	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Eum rem quis cum dolores.Nisi pariatur et non et aut ut consequatur aliquam.	2011-01-19 10:28:33.926809	2011-01-19 10:28:33.926809	\N	3	4	\N	0	2-leisure	f	0
3	Business	Quod qui distinctio repellendus provident et saepe reprehenderit.Provident ut sed ut.	2011-01-19 10:28:33.983049	2011-01-19 10:28:34.992755	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Repudiandae doloribus similique reiciendis non provident facere.Officia occaecati minus et sit saepe voluptatem.	Electronics	2011-01-19 10:28:33.875513	2011-01-19 10:28:33.875513
2	1	dk	\N	Electronics	2011-01-19 10:28:33.912309	2011-01-19 10:28:33.912309
3	2	en	Eum rem quis cum dolores.Nisi pariatur et non et aut ut consequatur aliquam.	Leisure	2011-01-19 10:28:33.932155	2011-01-19 10:28:33.932155
4	2	dk	\N	Leisure	2011-01-19 10:28:33.967141	2011-01-19 10:28:33.967141
5	3	en	Quod qui distinctio repellendus provident et saepe reprehenderit.Provident ut sed ut.	Business	2011-01-19 10:28:33.988774	2011-01-19 10:28:33.988774
6	3	dk	\N	Business	2011-01-19 10:28:34.017864	2011-01-19 10:28:34.017864
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-19 10:28:32.821822	2011-01-19 10:28:32.821822
2	United Kingdom	2011-01-19 10:28:32.83138	2011-01-19 10:28:32.83138
3	Scotland12954329140554	2011-01-19 10:28:34.05735	2011-01-19 10:28:34.05735
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
1	Euro	&euro;	%u%n	t	2011-01-19 10:28:33.817722	2011-01-19 10:28:33.817722
2	PLN	&pln;	%u%n	t	2011-01-19 10:28:33.82737	2011-01-19 10:28:33.82737
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-01-19 10:28:33.1237	2011-01-19 10:28:33.1237
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-01-19 10:28:33.147515	2011-01-19 10:28:33.147515
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-01-19 10:28:33.167648	2011-01-19 10:28:33.167648
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-01-19 10:28:33.401077	2011-01-19 10:28:33.401077
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-01-19 10:28:33.419092	2011-01-19 10:28:33.419092
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-01-19 10:28:33.436734	2011-01-19 10:28:33.436734
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-01-19 10:28:33.457092	2011-01-19 10:28:33.457092
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-01-19 10:28:33.476933	2011-01-19 10:28:33.476933
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-01-19 10:28:33.496424	2011-01-19 10:28:33.496424
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-01-19 10:28:33.516842	2011-01-19 10:28:33.516842
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-01-19 10:28:33.537387	2011-01-19 10:28:33.537387
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-01-19 10:28:33.557111	2011-01-19 10:28:33.557111
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-01-19 10:28:33.57531	2011-01-19 10:28:33.57531
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-01-19 10:28:33.592872	2011-01-19 10:28:33.592872
15	8	en	<p></p>	Question	2011-01-19 10:28:33.611937	2011-01-19 10:28:33.611937
16	8	dk	<p></p>	[DK] Question	2011-01-19 10:28:33.630158	2011-01-19 10:28:33.630158
17	9	en	<p></p>	Invoice	2011-01-19 10:28:33.648429	2011-01-19 10:28:33.648429
18	9	dk	<p></p>	[DK] Invoice	2011-01-19 10:28:33.665783	2011-01-19 10:28:33.665783
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-19 10:28:33.112851	2011-01-19 10:28:33.141552
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-19 10:28:33.161505	2011-01-19 10:28:33.395417
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-19 10:28:33.413702	2011-01-19 10:28:33.431531
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-19 10:28:33.450764	2011-01-19 10:28:33.471078
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-19 10:28:33.489941	2011-01-19 10:28:33.510047
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-19 10:28:33.531079	2011-01-19 10:28:33.551513
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-19 10:28:33.569937	2011-01-19 10:28:33.587596
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-19 10:28:33.606335	2011-01-19 10:28:33.62504
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-19 10:28:33.642971	2011-01-19 10:28:33.66065
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
1	1	dk	Big deal on printers	Laudantium incidunt ad et illum exercitationem itaque.Consectetur debitis non fugit.	Quia tempore voluptatibus blanditiis.Rerum quae eos hic praesentium optio in quod.	2011-01-19 10:28:34.200623	2011-01-19 10:28:34.200623
2	2	dk	Drills required	Ut ducimus velit distinctio.Mollitia unde nihil sit porro et nihil.	Tempora consequatur doloremque pariatur quis aut id voluptas.Quia eum quo nulla necessitatibus dolor quia.	2011-01-19 10:28:34.301913	2011-01-19 10:28:34.301913
3	3	dk	Need assistance in selling a car	Qui debitis porro fuga quia mollitia eos tempore officiis.Distinctio expedita doloribus ut labore et.	Quas et minima ipsam voluptas a eaque.Quia quas qui adipisci vero asperiores ipsam.	2011-01-19 10:28:34.40271	2011-01-19 10:28:34.40271
4	4	dk	Ipod shipment	Nobis amet et at voluptatem est sapiente quo perferendis.Iste similique numquam dicta consectetur et.	Voluptatibus laudantium facere hic sit.Sequi earum repellendus odio dolore voluptas.	2011-01-19 10:28:34.713273	2011-01-19 10:28:34.713273
5	5	dk	Trip to amazonia - looking for offer	Voluptatem soluta quia ea omnis similique aut.Et quod optio et quam accusantium maiores alias dicta.	Ad quo ut commodi accusamus omnis sint.Recusandae quo animi velit incidunt et.	2011-01-19 10:28:34.811737	2011-01-19 10:28:34.811737
6	6	dk	LCD - Huge amounts	Similique ab deleniti et perspiciatis dolorum.Unde et possimus et quam repellendus omnis nihil vel.	Culpa sapiente ea sed ipsam repudiandae.Similique quaerat eum autem molestiae.	2011-01-19 10:28:34.908855	2011-01-19 10:28:34.908855
7	7	dk	GPS receivers required	Modi eos officiis illum minima autem.Ut alias ullam sed qui at a et ratione.	Porro doloremque enim ut.Optio nisi repellendus tenetur vero voluptatibus.	2011-01-19 10:28:35.002152	2011-01-19 10:28:35.002152
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Laudantium incidunt ad et illum exercitationem itaque.Consectetur debitis non fugit.	Quia tempore voluptatibus blanditiis.Rerum quae eos hic praesentium optio in quod.	2	User::Agent	0	960.0	714.0	1	Jenkins	Jessica Kertzmann	911-797-1445	arturo_klocko@stracke.name	2011-01-19 10:28:34.147554	2011-01-19 10:28:34.147554	2011-01-24	Gloria129543291405455 Harvey	1	t	\N	0	0	f	f	-1	1	2011-01-19 10:28:34.159067	\N	\N	0468 Rosanna Cape	\N	\N	North Maryse	44613-4959	County Armagh
2	Drills required	3	Ut ducimus velit distinctio.Mollitia unde nihil sit porro et nihil.	Tempora consequatur doloremque pariatur quis aut id voluptas.Quia eum quo nulla necessitatibus dolor quia.	2	User::Agent	0	843.0	655.0	1	Macejkovicbeer	Germaine Terry	1-676-674-4848 x7043	kristopher@koelpinshanahan.com	2011-01-19 10:28:34.255332	2011-01-19 10:28:34.255332	2011-01-24	Gloria129543291405455 Harvey	1	t	\N	0	0	f	f	-1	1	2011-01-19 10:28:34.263653	\N	\N	731 Wisoky Throughway	\N	\N	Joanahaven	44817	Devon
3	Need assistance in selling a car	3	Qui debitis porro fuga quia mollitia eos tempore officiis.Distinctio expedita doloribus ut labore et.	Quas et minima ipsam voluptas a eaque.Quia quas qui adipisci vero asperiores ipsam.	2	User::Agent	0	307.0	179.0	1	Wunschfranecki	Miss Hailee Strosin	054-582-2529	margarete.roberts@kemmerankunding.name	2011-01-19 10:28:34.352936	2011-01-19 10:28:34.352936	2011-01-24	Gloria129543291405455 Harvey	1	t	\N	0	0	f	f	-1	1	2011-01-19 10:28:34.366257	\N	\N	79156 Savannah Skyway	\N	\N	Kodyburgh	46755-1767	Devon
4	Ipod shipment	3	Nobis amet et at voluptatem est sapiente quo perferendis.Iste similique numquam dicta consectetur et.	Voluptatibus laudantium facere hic sit.Sequi earum repellendus odio dolore voluptas.	2	User::Agent	0	347.0	677.0	1	Schmelerconn	Tate Kemmer	159-084-2285	jermain@bode.info	2011-01-19 10:28:34.668793	2011-01-19 10:28:34.668793	2011-01-24	Gloria129543291405455 Harvey	1	t	\N	0	0	f	f	-1	1	2011-01-19 10:28:34.678766	\N	\N	13968 Wintheiser Village	\N	\N	West Jeanette	47575	County Fermanagh
5	Trip to amazonia - looking for offer	3	Voluptatem soluta quia ea omnis similique aut.Et quod optio et quam accusantium maiores alias dicta.	Ad quo ut commodi accusamus omnis sint.Recusandae quo animi velit incidunt et.	2	User::Agent	0	787.0	369.0	1	Whitehermiston	Jaqueline Treutel	1-623-936-3786 x853	gunner@veum.name	2011-01-19 10:28:34.767902	2011-01-19 10:28:34.767902	2011-01-24	Gloria129543291405455 Harvey	1	t	\N	0	0	f	f	-1	1	2011-01-19 10:28:34.776816	\N	\N	035 Jaeden Valley	\N	\N	South Felton	41187	Hertfordshire
6	LCD - Huge amounts	3	Similique ab deleniti et perspiciatis dolorum.Unde et possimus et quam repellendus omnis nihil vel.	Culpa sapiente ea sed ipsam repudiandae.Similique quaerat eum autem molestiae.	2	User::Agent	0	531.0	477.0	1	Pfannerstill	Yasmin Gerlach	895-188-5983 x6985	joyce@ryan.info	2011-01-19 10:28:34.863621	2011-01-19 10:28:34.863621	2011-01-24	Gloria129543291405455 Harvey	1	t	\N	0	0	f	f	-1	1	2011-01-19 10:28:34.872042	\N	\N	8292 Schuppe Knoll	\N	\N	Letatown	51168	County Tyrone
7	GPS receivers required	3	Modi eos officiis illum minima autem.Ut alias ullam sed qui at a et ratione.	Porro doloremque enim ut.Optio nisi repellendus tenetur vero voluptatibus.	2	User::Agent	0	369.0	80.0	1	Prohaskabrakus	Dr. Orin Ziemann	646.340.2338 x9991	peggie.roob@kemmergorczany.ca	2011-01-19 10:28:34.959281	2011-01-19 10:28:34.959281	2011-01-24	Gloria129543291405455 Harvey	1	t	\N	0	0	f	f	-1	1	2011-01-19 10:28:34.967696	\N	\N	714 Tyler Vista	\N	\N	Willmsburgh	95143-3969	Cornwall
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
1	default_payout_delay	--- 0\n	2011-01-19 10:28:32.718421	2011-01-19 10:28:32.718421
2	default_leads_per_page	--- 5\n	2011-01-19 10:28:32.729458	2011-01-19 10:28:32.729458
3	certification_level_1	--- 10\n	2011-01-19 10:28:32.737918	2011-01-19 10:28:32.737918
4	certification_level_2	--- 20\n	2011-01-19 10:28:32.745303	2011-01-19 10:28:32.745303
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-19 10:28:32.752469	2011-01-19 10:28:32.752469
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-19 10:28:32.758837	2011-01-19 10:28:32.758837
7	invoicing_seller_name	--- Fairleads\n	2011-01-19 10:28:32.766063	2011-01-19 10:28:32.766063
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-19 10:28:32.775419	2011-01-19 10:28:32.775419
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-19 10:28:32.785285	2011-01-19 10:28:32.785285
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-19 10:28:32.792225	2011-01-19 10:28:32.792225
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-19 10:28:32.799428	2011-01-19 10:28:32.799428
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
1	blazejek@gmail.com	cd381ccf059c19f4e38684a3a3c3c5089990eac03adb02cc7a5d5571f039a8d7de0b184b284646099c6fd4aac4003c262da211cafbb2a616df12567903668f1c	tbYNBOra6NqRvPRVNhuq	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 10:28:33.801404	2011-01-19 10:28:33.712681	\N	2011-01-19 10:28:33.712971	2011-01-19 10:28:33.801833	1	Tyra	Rippin	384.776.2795	root	Rogahn Views	New Samara	84239	South Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	i1rNm9NCsyIiVu7CMT38I9j7AuGjwLqTMYeQCAPwx7S4tzfR5z8C6VMexzkAji	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	9696a4a768e7a3cf32b8a0f2fe2449733da50800db15c33cfbcf3926395a3f202b30334e9023f2258c034df956e99f97f8cc8c5988a8c8abed82b3d40d306cee	-aZEFnVdSSPQFIRUiwAb	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 10:28:34.098141	2011-01-19 10:28:34.066778	\N	2011-01-19 10:28:34.067113	2011-01-19 10:28:34.098579	2	Gloria129543291405455	Harvey	(170)567-3659	Winona Sipes129543291405422	Brianne Club	West Pedrobury	50852	Suffolk	3	\N	0	\N	\N	0	\N	\N	\N	\N	EDrUv86womApARfwAxvuc2LYbycjxoaPcuNnFWO9HWV7357A9yFGbzdSSJYlUE	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	b53cfca6cb982632f60045385af68ed860f53ec94c32e89f75ba1b549431dcae30448cfa11244da9cf8c1158ee79b542bb4178180d38fefd43891e054b351030	ceG-R-VO8SjICmyDQont	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 10:28:35.113822	2011-01-19 10:28:35.086274	\N	2011-01-19 10:28:35.086561	2011-01-19 10:28:35.114231	1	Alvina	Harvey	085.533.7382	Valerie Haley DVM129543291508011	Mckayla Summit	South Karianeport	57496	Suffolk	1	\N	\N	\N	\N	0	\N	\N	\N	\N	53febKr6EViWLvWKHMQMDok7cSvF6NJUWLk3iqQsg57DzbviWugzMrjBQYOTRT	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	ef3d8603d1326c80fc038e227a2e2f79b3934eedbfcb020c5725e650834563b19567db9a0dc49d249ecda30b0ccb6e1f47c8509be718eabe4b71a5016dfb1c4c	fX7Y-MwUR5m98HV7rVOy	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 10:28:35.196865	2011-01-19 10:28:35.167567	\N	2011-01-19 10:28:35.167846	2011-01-19 10:28:35.197329	48	Eryn	Collins	434.887.0896 x995	Mazie Kulas129543291516109	Bahringer Wells	New Alfonzo	22327	Rutland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	tMMv7KVFvWQ4r2fw0zlU8yqEljYI8GhvKZ9wXdMC61RZ3pNbMzqhuvb15lJccG	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	369aba6fee61ec1a0327ec8c6c5e90cc46479ad7b097db1296882d97eee0d0c7c446937eb132c6f2d7962d20f48e38640a644107f9a1b35f70e7519545ae8282	B4u3xtacc3mbUjgxEADB	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 10:28:35.282858	2011-01-19 10:28:35.252352	\N	2011-01-19 10:28:35.252634	2011-01-19 10:28:35.307758	64	Barbara	Herman	(820)738-3817 x73774	Joe Stamm DVM12954329152442	Nader Vista	Reingerborough	72962	Buckinghamshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	RE5viXO1UnYW4GWeDfGRCxf2JZRLUyInsSEu42s4VoXpuWQnlqO6nfcMoDdXpH	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

