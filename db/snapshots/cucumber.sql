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

SELECT pg_catalog.setval('article_translations_id_seq', 18, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 9, true);


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

SELECT pg_catalog.setval('currencies_id_seq', 8, true);


--
-- Name: email_template_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_template_translations_id_seq', 16, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 8, true);


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
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, content, title, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2010-12-20 13:31:58.3651	2010-12-20 13:31:58.3651
2	1	en	About us	About us	2010-12-20 13:31:58.380368	2010-12-20 13:31:58.380368
3	2	dk	Privacy	Privacy	2010-12-20 13:31:58.412399	2010-12-20 13:31:58.412399
4	2	en	Privacy	Privacy	2010-12-20 13:31:58.425057	2010-12-20 13:31:58.425057
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-20 13:31:58.455569	2010-12-20 13:31:58.455569
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-20 13:31:58.593108	2010-12-20 13:31:58.593108
7	4	dk	Blurb sign up	Blurb sign up	2010-12-20 13:31:58.621271	2010-12-20 13:31:58.621271
8	4	en	Blurb sign up	Blurb sign up	2010-12-20 13:31:58.634288	2010-12-20 13:31:58.634288
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-20 13:31:58.662271	2010-12-20 13:31:58.662271
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-20 13:31:58.674767	2010-12-20 13:31:58.674767
11	6	dk	Blurb agent home	Blurb agent home	2010-12-20 13:31:58.70318	2010-12-20 13:31:58.70318
12	6	en	Blurb agent home	Blurb agent home	2010-12-20 13:31:58.715427	2010-12-20 13:31:58.715427
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-20 13:31:58.742349	2010-12-20 13:31:58.742349
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-20 13:31:58.754449	2010-12-20 13:31:58.754449
15	8	dk	Blurb currencies	Blurb currencies	2010-12-20 13:31:58.782591	2010-12-20 13:31:58.782591
16	8	en	Blurb currencies	Blurb currencies	2010-12-20 13:31:58.795201	2010-12-20 13:31:58.795201
17	9	dk	Reset password	Reset password	2010-12-20 13:31:58.823205	2010-12-20 13:31:58.823205
18	9	en	Reset password	Reset password	2010-12-20 13:31:58.836015	2010-12-20 13:31:58.836015
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-20 13:31:58.356369	2010-12-20 13:31:58.38354	about_us	0	t	2010-12-20 13:31:58.383469
2	Article::Cms	2010-12-20 13:31:58.408493	2010-12-20 13:31:58.428527	privacy	0	t	2010-12-20 13:31:58.428429
3	Article::Cms	2010-12-20 13:31:58.451664	2010-12-20 13:31:58.596345	terms_conditions	0	t	2010-12-20 13:31:58.596271
4	Article::Cms	2010-12-20 13:31:58.617164	2010-12-20 13:31:58.637341	blurb_sign_up	1	t	2010-12-20 13:31:58.637269
5	Article::Cms	2010-12-20 13:31:58.658064	2010-12-20 13:31:58.678647	blurb_buyer_home	1	t	2010-12-20 13:31:58.678563
6	Article::Cms	2010-12-20 13:31:58.69905	2010-12-20 13:31:58.718457	blurb_agent_home	1	t	2010-12-20 13:31:58.718386
7	Article::Cms	2010-12-20 13:31:58.738558	2010-12-20 13:31:58.757478	blurb_start_page_role_selection	1	t	2010-12-20 13:31:58.757399
8	Article::Cms	2010-12-20 13:31:58.778536	2010-12-20 13:31:58.798304	blurb_currencies	1	t	2010-12-20 13:31:58.798227
9	Article::Cms	2010-12-20 13:31:58.819187	2010-12-20 13:31:58.839046	reset_password	2	t	2010-12-20 13:31:58.838976
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, published_leads_count, is_locked) FROM stdin;
1	Electronics	Doloremque repellat esse laboriosam repudiandae.Ea architecto nostrum est quia quibusdam sunt.	2010-12-20 13:31:57.041583	2010-12-20 13:31:57.041583	\N	1	2	\N	0	1-electronics	0	f
2	Leisure	Distinctio minus officiis culpa dignissimos voluptas excepturi suscipit odit.Animi exercitationem porro cumque sequi molestiae consequatur.	2010-12-20 13:31:57.084843	2010-12-20 13:31:57.084843	\N	3	4	\N	0	2-leisure	0	f
3	Business	Voluptatem sed esse ut sed placeat dolorum nihil repellendus.Ipsum dolorum quaerat sed sunt iste animi.	2010-12-20 13:31:57.117811	2010-12-20 13:31:57.944742	\N	5	6	\N	7	3-business	7	f
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
1	1	en	Doloremque repellat esse laboriosam repudiandae.Ea architecto nostrum est quia quibusdam sunt.	Electronics	2010-12-20 13:31:57.050586	2010-12-20 13:31:57.050586
2	1	dk	\N	Electronics	2010-12-20 13:31:57.075772	2010-12-20 13:31:57.075772
3	2	en	Distinctio minus officiis culpa dignissimos voluptas excepturi suscipit odit.Animi exercitationem porro cumque sequi molestiae consequatur.	Leisure	2010-12-20 13:31:57.089345	2010-12-20 13:31:57.089345
4	2	dk	\N	Leisure	2010-12-20 13:31:57.108456	2010-12-20 13:31:57.108456
5	3	en	Voluptatem sed esse ut sed placeat dolorum nihil repellendus.Ipsum dolorum quaerat sed sunt iste animi.	Business	2010-12-20 13:31:57.122578	2010-12-20 13:31:57.122578
6	3	dk	\N	Business	2010-12-20 13:31:57.142682	2010-12-20 13:31:57.142682
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-20 13:31:56.580622	2010-12-20 13:31:56.580622
2	United Kingdom	2010-12-20 13:31:56.585346	2010-12-20 13:31:56.585346
3	Wales129285191716723	2010-12-20 13:31:57.168524	2010-12-20 13:31:57.168524
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
1	harum	&euro;	%u%n	t	2010-12-20 13:31:57.356128	2010-12-20 13:31:57.356128
2	beatae	&pound;	%u%n	t	2010-12-20 13:31:57.442333	2010-12-20 13:31:57.442333
3	exercitationem	$	%u%n	t	2010-12-20 13:31:57.511155	2010-12-20 13:31:57.511155
4	inventore	&pound;	%u%n	t	2010-12-20 13:31:57.579107	2010-12-20 13:31:57.579107
5	autem	$	%u%n	t	2010-12-20 13:31:57.646437	2010-12-20 13:31:57.646437
6	nostrum	&pound;	%u%n	t	2010-12-20 13:31:57.843287	2010-12-20 13:31:57.843287
7	dignissimos	&pound;	%u%n	t	2010-12-20 13:31:57.914219	2010-12-20 13:31:57.914219
8	Euro	&euro;	%u%n	t	2010-12-20 13:31:58.855159	2010-12-20 13:31:58.855159
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-20 13:31:56.610536	2010-12-20 13:31:56.610536
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-20 13:31:56.625751	2010-12-20 13:31:56.625751
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-20 13:31:56.638713	2010-12-20 13:31:56.638713
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-20 13:31:56.651398	2010-12-20 13:31:56.651398
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-20 13:31:56.664288	2010-12-20 13:31:56.664288
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-20 13:31:56.676661	2010-12-20 13:31:56.676661
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-20 13:31:56.689167	2010-12-20 13:31:56.689167
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-20 13:31:56.824215	2010-12-20 13:31:56.824215
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-20 13:31:56.83628	2010-12-20 13:31:56.83628
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-20 13:31:56.847975	2010-12-20 13:31:56.847975
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-20 13:31:56.860279	2010-12-20 13:31:56.860279
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-20 13:31:56.87262	2010-12-20 13:31:56.87262
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-20 13:31:56.884743	2010-12-20 13:31:56.884743
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-20 13:31:56.900058	2010-12-20 13:31:56.900058
15	8	en	Question	<p></p>	2010-12-20 13:31:56.912305	2010-12-20 13:31:56.912305
16	8	dk	[DK] Question	<p></p>	2010-12-20 13:31:56.924669	2010-12-20 13:31:56.924669
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-20 13:31:56.60193	2010-12-20 13:31:56.621491
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-20 13:31:56.634158	2010-12-20 13:31:56.646872
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-20 13:31:56.659578	2010-12-20 13:31:56.672357
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-20 13:31:56.684639	2010-12-20 13:31:56.818812
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-20 13:31:56.832011	2010-12-20 13:31:56.843976
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-20 13:31:56.855789	2010-12-20 13:31:56.868378
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-20 13:31:56.880328	2010-12-20 13:31:56.89265
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-20 13:31:56.907923	2010-12-20 13:31:56.920291
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, pkwiu, unit, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, payable_id, payable_type, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, header, hidden_description, created_at, updated_at) FROM stdin;
1	1	dk	Fuga minima maxime nihil nam fugiat nobis.Ut numquam officiis ullam dolore est quia ut porro.	Big deal on printers	Et non quis delectus accusantium.Omnis delectus autem dolor perferendis ea dolorem.	2010-12-20 13:31:57.406456	2010-12-20 13:31:57.406456
2	2	dk	Dolor aut officiis et nisi ullam labore.Illum ipsum et natus nam.	Drills required	Voluptatem distinctio et inventore.Possimus dolore neque ut.	2010-12-20 13:31:57.480491	2010-12-20 13:31:57.480491
3	3	dk	Voluptatem aut necessitatibus suscipit facilis voluptates sunt.Necessitatibus ducimus iste nemo deserunt facere quibusdam eos est.	Need assistance in selling a car	Et porro illo voluptatem autem et et aut ducimus.Unde nisi sit excepturi dolorem et.	2010-12-20 13:31:57.548195	2010-12-20 13:31:57.548195
4	4	dk	Qui voluptas quos sed impedit et odit.Ut magni harum voluptas cupiditate consectetur nihil.	Ipod shipment	Aut optio autem nesciunt et accusantium sequi beatae recusandae.Illo aut reiciendis numquam.	2010-12-20 13:31:57.615663	2010-12-20 13:31:57.615663
5	5	dk	Nemo a quibusdam in aut accusamus qui voluptates minus.Laborum odio amet cupiditate omnis consequuntur repudiandae qui esse.	Trip to amazonia - looking for offer	Quos ut sed laudantium.Perspiciatis ipsum sit quia magni velit.	2010-12-20 13:31:57.81143	2010-12-20 13:31:57.81143
6	6	dk	Nisi harum maxime repellat quia ut.Aperiam odit amet sequi.	LCD - Huge amounts	Commodi in reprehenderit cumque consequatur incidunt.Sunt exercitationem totam qui quaerat eum adipisci nesciunt.	2010-12-20 13:31:57.88101	2010-12-20 13:31:57.88101
7	7	dk	Perferendis molestias officia asperiores voluptatem qui occaecati.Illum beatae sapiente iusto et vel cupiditate dicta.	GPS receivers required	Natus quae repellendus veniam.Eos non iusto corporis deserunt ut perferendis.	2010-12-20 13:31:57.951459	2010-12-20 13:31:57.951459
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Fuga minima maxime nihil nam fugiat nobis.Ut numquam officiis ullam dolore est quia ut porro.	Et non quis delectus accusantium.Omnis delectus autem dolor perferendis ea dolorem.	2	User::Agent	0	897.0	450.0	1	Bartoletti	Tremayne Hudson	245-283-7833 x8264	abelardo.kemmer@williamson.uk	2347 Corwin Cove	2010-12-20 13:31:57.365357	2010-12-20 13:31:57.365357	2010-12-25	Abigayle129285191716645 Ratke	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Dolor aut officiis et nisi ullam labore.Illum ipsum et natus nam.	Voluptatem distinctio et inventore.Possimus dolore neque ut.	2	User::Agent	0	115.0	526.0	1	Cartwright	Mrs. Deron Rosenbaum	192.272.0506 x4171	kavon@kubhuel.ca	414 Wiza Light	2010-12-20 13:31:57.448284	2010-12-20 13:31:57.448284	2010-12-25	Abigayle129285191716645 Ratke	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Voluptatem aut necessitatibus suscipit facilis voluptates sunt.Necessitatibus ducimus iste nemo deserunt facere quibusdam eos est.	Et porro illo voluptatem autem et et aut ducimus.Unde nisi sit excepturi dolorem et.	2	User::Agent	0	278.0	669.0	1	Boehm	Dr. Arlie Reichert	940.707.6311 x814	martin@adams.uk	223 Adela Pine	2010-12-20 13:31:57.517114	2010-12-20 13:31:57.517114	2010-12-25	Abigayle129285191716645 Ratke	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Qui voluptas quos sed impedit et odit.Ut magni harum voluptas cupiditate consectetur nihil.	Aut optio autem nesciunt et accusantium sequi beatae recusandae.Illo aut reiciendis numquam.	2	User::Agent	0	812.0	33.0	1	Davis	Santiago Orn	184-014-9146	alta@marks.ca	0371 Rubie Springs	2010-12-20 13:31:57.58522	2010-12-20 13:31:57.58522	2010-12-25	Abigayle129285191716645 Ratke	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Nemo a quibusdam in aut accusamus qui voluptates minus.Laborum odio amet cupiditate omnis consequuntur repudiandae qui esse.	Quos ut sed laudantium.Perspiciatis ipsum sit quia magni velit.	2	User::Agent	0	479.0	819.0	1	Williamson	Doug Rolfson	1-288-539-1985	sylvia.ward@kutch.com	090 Macejkovic Shoals	2010-12-20 13:31:57.652653	2010-12-20 13:31:57.652653	2010-12-25	Abigayle129285191716645 Ratke	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Nisi harum maxime repellat quia ut.Aperiam odit amet sequi.	Commodi in reprehenderit cumque consequatur incidunt.Sunt exercitationem totam qui quaerat eum adipisci nesciunt.	2	User::Agent	0	988.0	721.0	1	Mosciski	Fermin Rutherford	572-537-3741	johathan.gerhold@hesselsatterfield.us	55485 Wilfrid Spurs	2010-12-20 13:31:57.84934	2010-12-20 13:31:57.84934	2010-12-25	Abigayle129285191716645 Ratke	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Perferendis molestias officia asperiores voluptatem qui occaecati.Illum beatae sapiente iusto et vel cupiditate dicta.	Natus quae repellendus veniam.Eos non iusto corporis deserunt ut perferendis.	2	User::Agent	0	922.0	87.0	1	Goodwin	Katrine Cartwright	495-459-9824 x12759	hector.schmidt@rueckerdoyle.co.uk	568 Willow Crest	2010-12-20 13:31:57.920264	2010-12-20 13:31:57.920264	2010-12-25	Abigayle129285191716645 Ratke	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: payment_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY payment_notifications (id, params, buyer_id, status, transaction_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: payment_transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY payment_transactions (id, invoice_id, payment_notification_id, amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-20 13:31:56.548928	2010-12-20 13:31:56.548928
2	default_leads_per_page	--- 5\n	2010-12-20 13:31:56.554517	2010-12-20 13:31:56.554517
3	certification_level_1	--- 10\n	2010-12-20 13:31:56.556839	2010-12-20 13:31:56.556839
4	certification_level_2	--- 20\n	2010-12-20 13:31:56.558896	2010-12-20 13:31:56.558896
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-20 13:31:56.561072	2010-12-20 13:31:56.561072
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-20 13:31:56.563101	2010-12-20 13:31:56.563101
7	invoicing_seller_name	--- Fairleads\n	2010-12-20 13:31:56.565301	2010-12-20 13:31:56.565301
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-20 13:31:56.567469	2010-12-20 13:31:56.567469
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-20 13:31:56.569534	2010-12-20 13:31:56.569534
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-20 13:31:56.571664	2010-12-20 13:31:56.571664
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, linkedin_url, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information) FROM stdin;
1	blazejek@gmail.com	f7e6005d94fa1eb444fb1e20470aab1a57d46a25b64d4cd680fe4c19958236a6db0ec85fde73202ccd7a7c68a6f59c605ddaffc204a33a9f6ba487a2c6d4c91f	SKAAktzm05GmR9i_X1Vy	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-20 13:31:57.020403	2010-12-20 13:31:56.957788	\N	2010-12-20 13:31:56.958008	2010-12-20 13:31:57.020686	1	Agustin	Hackett	745-536-3683	root	Lawrence Corners	Laronfurt	36511-1172	Fife	1	\N	\N	\N	\N	0	\N	\N	\N	\N	TDAKxlqdRzyUy0TQZwKhrogJPkWmZIc8RAGyvolBJV7UIol4decGyr3pdsZBFc	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	4351170f60564d866067de3c8d14940289f630516d9a05be4a6f7f924858bf9af0cc0c7943cfdd956d28f269f7517621950eb01e62daa64740fcd698d765b5d5	LPxyXi69yD0d2U9xAN_A	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-20 13:31:57.321533	2010-12-20 13:31:57.174079	\N	2010-12-20 13:31:57.174318	2010-12-20 13:31:57.321803	2	Abigayle129285191716645	Ratke	775.637.4776 x468	Yasmine Ullrich129285191716622	Bogan Knoll	McDermottstad	78214	Herefordshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	uO1agJvSyOTXsoyISvg8zj800fLvTbTM0cqKVIemjuhwvHUIH0KalPvjP6o242	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	8178346e5b2d4525f569e784d626c11d4158e5646bedaec834bb3589c253e60e75024342c260d914295301babc4c1e046057a9103d21fefda3b844e3775c59ee	Gj1rnyn-8i7WaYHjBvHh	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-20 13:31:58.025137	2010-12-20 13:31:58.004961	\N	2010-12-20 13:31:58.005185	2010-12-20 13:31:58.025414	1	Arnold	Schulist	(028)625-9913	Earnestine Little129285191800081	Weissnat Flats	Gleichnerhaven	82768-5154	Lancashire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	e4eJ3GfG2zTfn75D4AozFKwBAkW7Ze0fv981ubmua72RiCTTrZX2UtejrpmCdo	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	a1c4b3df6b2fc564e2b67c44878e257aa95ea11dd453da89f24e88a01edfa27fdad61bfa3a3f064e2a38c2d8b99d684f3782a7a6f9c0d7a5825bac1384acfdf3	J07OLwvS-1c0e5kzZ_WV	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-20 13:31:58.077206	2010-12-20 13:31:58.055246	\N	2010-12-20 13:31:58.055478	2010-12-20 13:31:58.077477	48	Bettie	Denesik	1-080-423-5670 x833	Adrien Daniel129285191805017	Nitzsche Lodge	Cartwrightfort	05724-2471	Northumberland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	EAAEfIe8RNCbwGpfefva3OygM3ljqm00L5nUSS62WLmqDG1bAzt6jGDPCmGcT8	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	242580c6140050e6a57d75411c0a04a93b8ce8919f5b2689a1e27515ddba95ff712ccd7667351235847a183e2a5796ccc6936af7552daadb48366fa45e59f3fc	zy_slh9nWPBWfQ73MdN-	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-20 13:31:58.129124	2010-12-20 13:31:58.107247	\N	2010-12-20 13:31:58.107461	2010-12-20 13:31:58.273218	64	Evan	McDermott	466.607.8085	Sonny Breitenberg12928519181027	Brant Extension	North Jailynburgh	24007-4450	Durham	1	\N	\N	4	\N	0	\N	\N	\N	\N	cG9U96JfZPaBNzGp65EVXvdVwKDQZMduTCo9YEGHFWODugYAKWOrGE7BaoQMzM	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

