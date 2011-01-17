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

COPY article_translations (id, article_id, locale, content, title, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-01-17 11:35:33.935786	2011-01-17 11:35:33.935786
2	1	en	About us	About us	2011-01-17 11:35:33.955804	2011-01-17 11:35:33.955804
3	2	dk	Privacy	Privacy	2011-01-17 11:35:34.003733	2011-01-17 11:35:34.003733
4	2	en	Privacy	Privacy	2011-01-17 11:35:34.02074	2011-01-17 11:35:34.02074
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-17 11:35:34.063658	2011-01-17 11:35:34.063658
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-17 11:35:34.081656	2011-01-17 11:35:34.081656
7	4	dk	Blurb sign up	Blurb sign up	2011-01-17 11:35:34.127697	2011-01-17 11:35:34.127697
8	4	en	Blurb sign up	Blurb sign up	2011-01-17 11:35:34.146921	2011-01-17 11:35:34.146921
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-17 11:35:34.193197	2011-01-17 11:35:34.193197
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-17 11:35:34.209128	2011-01-17 11:35:34.209128
11	6	dk	Blurb agent home	Blurb agent home	2011-01-17 11:35:34.253725	2011-01-17 11:35:34.253725
12	6	en	Blurb agent home	Blurb agent home	2011-01-17 11:35:34.271236	2011-01-17 11:35:34.271236
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-17 11:35:34.315143	2011-01-17 11:35:34.315143
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-17 11:35:34.332494	2011-01-17 11:35:34.332494
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-17 11:35:34.373169	2011-01-17 11:35:34.373169
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-17 11:35:34.389631	2011-01-17 11:35:34.389631
17	9	dk	Blurb currencies	Blurb currencies	2011-01-17 11:35:34.433054	2011-01-17 11:35:34.433054
18	9	en	Blurb currencies	Blurb currencies	2011-01-17 11:35:34.449115	2011-01-17 11:35:34.449115
19	10	dk	Reset password	Reset password	2011-01-17 11:35:34.494495	2011-01-17 11:35:34.494495
20	10	en	Reset password	Reset password	2011-01-17 11:35:34.51156	2011-01-17 11:35:34.51156
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-17 11:35:33.925176	2011-01-17 11:35:33.962146	about_us	0	t	2011-01-17 11:35:33.962034
2	Article::Cms	2011-01-17 11:35:33.998723	2011-01-17 11:35:34.026072	privacy	0	t	2011-01-17 11:35:34.025973
3	Article::Cms	2011-01-17 11:35:34.058731	2011-01-17 11:35:34.086865	terms_conditions	0	t	2011-01-17 11:35:34.086765
4	Article::Cms	2011-01-17 11:35:34.122799	2011-01-17 11:35:34.153357	blurb_sign_up	1	t	2011-01-17 11:35:34.153248
5	Article::Cms	2011-01-17 11:35:34.182294	2011-01-17 11:35:34.215038	blurb_buyer_home	1	t	2011-01-17 11:35:34.214944
6	Article::Cms	2011-01-17 11:35:34.248926	2011-01-17 11:35:34.276548	blurb_agent_home	1	t	2011-01-17 11:35:34.276448
7	Article::Cms	2011-01-17 11:35:34.309574	2011-01-17 11:35:34.337667	blurb_purchase_manager_home	1	t	2011-01-17 11:35:34.337571
8	Article::Cms	2011-01-17 11:35:34.368002	2011-01-17 11:35:34.396802	blurb_start_page_role_selection	1	t	2011-01-17 11:35:34.396704
9	Article::Cms	2011-01-17 11:35:34.427775	2011-01-17 11:35:34.455377	blurb_currencies	1	t	2011-01-17 11:35:34.455282
10	Article::Cms	2011-01-17 11:35:34.489701	2011-01-17 11:35:34.516929	reset_password	2	t	2011-01-17 11:35:34.516837
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
1	Electronics	Neque totam cum eum distinctio consequatur quaerat et.Voluptatibus modi nisi maiores qui nemo illo architecto nesciunt.	2011-01-17 11:35:32.652459	2011-01-17 11:35:32.652459	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Est assumenda numquam eos.Quod reiciendis sit quam qui eius error.	2011-01-17 11:35:32.717805	2011-01-17 11:35:32.717805	\N	3	4	\N	0	2-leisure	f	0
3	Business	Mollitia nulla rerum tempore autem enim.Sed nesciunt assumenda nostrum reprehenderit iure.	2011-01-17 11:35:32.765584	2011-01-17 11:35:33.508477	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Neque totam cum eum distinctio consequatur quaerat et.Voluptatibus modi nisi maiores qui nemo illo architecto nesciunt.	Electronics	2011-01-17 11:35:32.664881	2011-01-17 11:35:32.664881
2	1	dk	\N	Electronics	2011-01-17 11:35:32.701274	2011-01-17 11:35:32.701274
3	2	en	Est assumenda numquam eos.Quod reiciendis sit quam qui eius error.	Leisure	2011-01-17 11:35:32.72356	2011-01-17 11:35:32.72356
4	2	dk	\N	Leisure	2011-01-17 11:35:32.751459	2011-01-17 11:35:32.751459
5	3	en	Mollitia nulla rerum tempore autem enim.Sed nesciunt assumenda nostrum reprehenderit iure.	Business	2011-01-17 11:35:32.770947	2011-01-17 11:35:32.770947
6	3	dk	\N	Business	2011-01-17 11:35:32.799054	2011-01-17 11:35:32.799054
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-17 11:35:31.761436	2011-01-17 11:35:31.761436
2	United Kingdom	2011-01-17 11:35:31.771476	2011-01-17 11:35:31.771476
3	Scotland129526413283617	2011-01-17 11:35:32.83775	2011-01-17 11:35:32.83775
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
1	Euro	&euro;	%u%n	t	2011-01-17 11:35:32.608688	2011-01-17 11:35:32.608688
2	PLN	&pln;	%u%n	t	2011-01-17 11:35:32.619256	2011-01-17 11:35:32.619256
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-01-17 11:35:31.826702	2011-01-17 11:35:31.826702
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-01-17 11:35:31.852926	2011-01-17 11:35:31.852926
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-01-17 11:35:31.877196	2011-01-17 11:35:31.877196
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-01-17 11:35:31.902374	2011-01-17 11:35:31.902374
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-01-17 11:35:31.932604	2011-01-17 11:35:31.932604
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-01-17 11:35:31.951847	2011-01-17 11:35:31.951847
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-01-17 11:35:31.970332	2011-01-17 11:35:31.970332
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-01-17 11:35:31.989764	2011-01-17 11:35:31.989764
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-01-17 11:35:32.01148	2011-01-17 11:35:32.01148
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-01-17 11:35:32.030207	2011-01-17 11:35:32.030207
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-01-17 11:35:32.048812	2011-01-17 11:35:32.048812
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-01-17 11:35:32.070899	2011-01-17 11:35:32.070899
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-01-17 11:35:32.09222	2011-01-17 11:35:32.09222
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-01-17 11:35:32.110274	2011-01-17 11:35:32.110274
15	8	en	<p></p>	Question	2011-01-17 11:35:32.128931	2011-01-17 11:35:32.128931
16	8	dk	<p></p>	[DK] Question	2011-01-17 11:35:32.147768	2011-01-17 11:35:32.147768
17	9	en	<p></p>	Invoice	2011-01-17 11:35:32.167014	2011-01-17 11:35:32.167014
18	9	dk	<p></p>	[DK] Invoice	2011-01-17 11:35:32.1855	2011-01-17 11:35:32.1855
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-17 11:35:31.815395	2011-01-17 11:35:31.846016
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-17 11:35:31.870868	2011-01-17 11:35:31.89405
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-17 11:35:31.923722	2011-01-17 11:35:31.946026
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-17 11:35:31.964651	2011-01-17 11:35:31.983885
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-17 11:35:32.004809	2011-01-17 11:35:32.024877
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-17 11:35:32.043158	2011-01-17 11:35:32.064279
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-17 11:35:32.085865	2011-01-17 11:35:32.104861
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-17 11:35:32.123328	2011-01-17 11:35:32.142471
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-17 11:35:32.161379	2011-01-17 11:35:32.179997
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
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, header, hidden_description, description, created_at, updated_at) FROM stdin;
1	1	dk	Big deal on printers	Maxime adipisci voluptatem itaque.Eaque corporis perspiciatis velit distinctio.	Velit enim sit quia et occaecati.Est dolorem mollitia enim vitae sapiente.	2011-01-17 11:35:32.973316	2011-01-17 11:35:32.973316
2	2	dk	Drills required	Dolorem quam nisi illo autem laboriosam corrupti aliquam.Quis aut facere iusto fuga tempora.	Nihil porro sint repudiandae perferendis.Pariatur eum totam et reprehenderit natus.	2011-01-17 11:35:33.06985	2011-01-17 11:35:33.06985
3	3	dk	Need assistance in selling a car	Quibusdam omnis sed cumque.Quaerat quisquam in laudantium.	Consequuntur officiis consectetur beatae cupiditate reprehenderit incidunt amet.Provident omnis expedita excepturi deleniti voluptatem commodi.	2011-01-17 11:35:33.1574	2011-01-17 11:35:33.1574
4	4	dk	Ipod shipment	Corrupti voluptas et qui.Et asperiores eos consequuntur ratione.	Enim non cupiditate quo qui perferendis maxime cum.Eveniet saepe est sit veniam.	2011-01-17 11:35:33.246706	2011-01-17 11:35:33.246706
5	5	dk	Trip to amazonia - looking for offer	Qui quia maxime aliquid.Fuga hic omnis et et repellat quaerat perferendis voluptas.	Quia eos ipsum quo reiciendis illum quis.Enim voluptates molestias quis voluptatem expedita cum velit inventore.	2011-01-17 11:35:33.336937	2011-01-17 11:35:33.336937
6	6	dk	LCD - Huge amounts	Et nostrum dignissimos odit.Voluptas placeat odit non eos quis commodi eum.	Corporis ea quis est odio similique.Numquam consequatur vel eaque voluptatibus vitae nobis accusantium.	2011-01-17 11:35:33.428271	2011-01-17 11:35:33.428271
7	7	dk	GPS receivers required	Voluptatem et sunt nihil qui aut iste.Mollitia voluptatem tempora eligendi quasi sit qui illo ea.	Officia harum impedit fugit.Non voluptas ut perspiciatis ut et porro quam voluptatem.	2011-01-17 11:35:33.517529	2011-01-17 11:35:33.517529
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url) FROM stdin;
1	Big deal on printers	3	Velit enim sit quia et occaecati.Est dolorem mollitia enim vitae sapiente.	Maxime adipisci voluptatem itaque.Eaque corporis perspiciatis velit distinctio.	2	User::Agent	0	0.0	888.0	1	Boyerleffler	Darren Ward	536-743-6150 x317	ashtyn@klocko.ca	27586 Maggio Cape	2011-01-17 11:35:32.922621	2011-01-17 11:35:32.922621	2011-01-22	Forest129526413283535 Hoppe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:35:32.93364	\N	\N
2	Drills required	3	Nihil porro sint repudiandae perferendis.Pariatur eum totam et reprehenderit natus.	Dolorem quam nisi illo autem laboriosam corrupti aliquam.Quis aut facere iusto fuga tempora.	2	User::Agent	0	35.0	937.0	1	Senger	Evert Hermann	574-541-2864 x57672	nella.reilly@kuhlman.com	501 Zieme Branch	2011-01-17 11:35:33.02685	2011-01-17 11:35:33.02685	2011-01-22	Forest129526413283535 Hoppe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:35:33.034837	\N	\N
3	Need assistance in selling a car	3	Consequuntur officiis consectetur beatae cupiditate reprehenderit incidunt amet.Provident omnis expedita excepturi deleniti voluptatem commodi.	Quibusdam omnis sed cumque.Quaerat quisquam in laudantium.	2	User::Agent	0	810.0	522.0	1	Quitzon	Everardo Wolf	610.947.9091 x02302	leonardo@brown.uk	1672 Triston Estate	2011-01-17 11:35:33.116402	2011-01-17 11:35:33.116402	2011-01-22	Forest129526413283535 Hoppe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:35:33.124151	\N	\N
4	Ipod shipment	3	Enim non cupiditate quo qui perferendis maxime cum.Eveniet saepe est sit veniam.	Corrupti voluptas et qui.Et asperiores eos consequuntur ratione.	2	User::Agent	0	397.0	431.0	1	Kutch	Robb Stehr	1-004-163-8721 x1694	bo_kshlerin@kub.uk	624 Dare Path	2011-01-17 11:35:33.205935	2011-01-17 11:35:33.205935	2011-01-22	Forest129526413283535 Hoppe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:35:33.213498	\N	\N
5	Trip to amazonia - looking for offer	3	Quia eos ipsum quo reiciendis illum quis.Enim voluptates molestias quis voluptatem expedita cum velit inventore.	Qui quia maxime aliquid.Fuga hic omnis et et repellat quaerat perferendis voluptas.	2	User::Agent	0	478.0	221.0	1	Ryanmcclure	Nestor Cartwright	(642)539-3898 x341	makenzie.bruen@nader.ca	744 Sydni Corner	2011-01-17 11:35:33.295859	2011-01-17 11:35:33.295859	2011-01-22	Forest129526413283535 Hoppe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:35:33.30348	\N	\N
6	LCD - Huge amounts	3	Corporis ea quis est odio similique.Numquam consequatur vel eaque voluptatibus vitae nobis accusantium.	Et nostrum dignissimos odit.Voluptas placeat odit non eos quis commodi eum.	2	User::Agent	0	610.0	227.0	1	Ullrichjewess	Brandy Luettgen	1-748-018-4730 x88419	brandyn@wymankuhn.biz	612 Schneider Pines	2011-01-17 11:35:33.383965	2011-01-17 11:35:33.383965	2011-01-22	Forest129526413283535 Hoppe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:35:33.393128	\N	\N
7	GPS receivers required	3	Officia harum impedit fugit.Non voluptas ut perspiciatis ut et porro quam voluptatem.	Voluptatem et sunt nihil qui aut iste.Mollitia voluptatem tempora eligendi quasi sit qui illo ea.	2	User::Agent	0	734.0	654.0	1	Murray	Linwood Donnelly	421.099.9148 x5747	shawna.kohler@hickle.us	957 Alexie Flat	2011-01-17 11:35:33.476526	2011-01-17 11:35:33.476526	2011-01-22	Forest129526413283535 Hoppe	1	t	\N	0	0	f	f	-1	1	2011-01-17 11:35:33.484292	\N	\N
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
1	default_payout_delay	--- 0\n	2011-01-17 11:35:31.456401	2011-01-17 11:35:31.456401
2	default_leads_per_page	--- 5\n	2011-01-17 11:35:31.655887	2011-01-17 11:35:31.655887
3	certification_level_1	--- 10\n	2011-01-17 11:35:31.671721	2011-01-17 11:35:31.671721
4	certification_level_2	--- 20\n	2011-01-17 11:35:31.683333	2011-01-17 11:35:31.683333
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-17 11:35:31.694104	2011-01-17 11:35:31.694104
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-17 11:35:31.701007	2011-01-17 11:35:31.701007
7	invoicing_seller_name	--- Fairleads\n	2011-01-17 11:35:31.708177	2011-01-17 11:35:31.708177
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-17 11:35:31.715296	2011-01-17 11:35:31.715296
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-17 11:35:31.723536	2011-01-17 11:35:31.723536
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-17 11:35:31.731075	2011-01-17 11:35:31.731075
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-17 11:35:31.73935	2011-01-17 11:35:31.73935
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
1	blazejek@gmail.com	cb900b36234c4da7f0e34f437f972b24c187042052853326fcece194fe8e7b87de17c682c92efc2e16200239d6f2643159ac69b9d02fcd9adadfab947394cd3b	DhIondj-xYNSNIAZcfks	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 11:35:32.584033	2011-01-17 11:35:32.499121	\N	2011-01-17 11:35:32.499409	2011-01-17 11:35:32.584686	1	Ova	Pollich	119.060.6188 x303	root	Jesse Harbor	South Adellaton	77926	Northamptonshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	VyFbt7c7F53u4PwexVMhN1ibbaMeGdo3ume9eecrY6jAdlfSPRNPqgaQG58NzJ	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	6d5cb5af3845d58f18c11b4d1b5cda87cd7398a961a56ee45a7112fb2db3a82dce499afce504cd5675228e55ebe02bbd915dd996798c0f19b9ff5c845d9d4c3f	FRO1JLnMM3mR3t-CROQE	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 11:35:32.876131	2011-01-17 11:35:32.846869	\N	2011-01-17 11:35:32.847133	2011-01-17 11:35:32.876533	2	Forest129526413283535	Hoppe	690-729-9944 x9993	Amber Boehm12952641328351	Schumm Island	New Freidamouth	92506-9774	Staffordshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	o7hVW8OrJMMRawTRIrtkYVTir6lMyyZprDWfkRt6tqrfL5oBWQr4F3cvFTDaPK	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	60278a92c28df03fce635d46a574fe00c9639a84bd5716dba72dfa0c0668f1b2f46648b0529338048e4bb1d6e7ea552f225bd1fa936f9303bb7b95c6f347d2b1	23oFxy7_F_MWvPBpQ4db	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 11:35:33.625659	2011-01-17 11:35:33.597206	\N	2011-01-17 11:35:33.597484	2011-01-17 11:35:33.62606	1	Freddy	King	711.718.8807 x4255	Raul Dickens129526413359075	Gleason Alley	Ebertstad	40062-4486	Suffolk	1	\N	\N	\N	\N	0	\N	\N	\N	\N	kc2CgJeHSibxsgxvqfH61ehVQtA5QgZ4F5YDg3coltxM6mrwqTXnXfgPud45vI	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	73bd8e2014600f9958e262dceee10e836622d8c7b52946db8a93d5a0fb180dbd6657db5fd78ef74ab80869df1f272baff0e16ea2eb38e253e3023e0940fdaabf	jq0cRP7Y0-NGFdRRUM-F	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 11:35:33.721122	2011-01-17 11:35:33.68976	\N	2011-01-17 11:35:33.690078	2011-01-17 11:35:33.721541	48	Lavern	Grady	004.185.5359	Muhammad Cartwright129526413367511	Yvette Mountains	East Abbey	03696-3612	Humberside	1	\N	\N	\N	\N	0	\N	\N	\N	\N	HrsvK5SmT63uaF64eYOMu2Rqnj0bBK8RMJUx6xZhWNXTt1MQ29SBm8O3GLR1AG	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	33d22d270e3f82639b0b33289035e488dd7a071811f12b20aa83e3f84641722238c6e4d3de447d571440c3d3a05c7772be0bcca882a87baa3ba7e9a545308fe8	8SwPgniokaIVbvm6pNZf	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-17 11:35:33.798983	2011-01-17 11:35:33.768399	\N	2011-01-17 11:35:33.768718	2011-01-17 11:35:33.823518	64	Felton	Denesik	(695)892-6802	Joany Kemmer129526413376201	Lockman Motorway	Goodwinfort	61973-9433	Worcestershire	1	\N	\N	4	\N	0	\N	\N	\N	\N	zzFyWY1x4AFi4w9zYkrbsY24gfOPtvzmcuxxOLjE42jcrMjIcroSYhDZ0xKUoc	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

