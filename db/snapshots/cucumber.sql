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

SELECT pg_catalog.setval('currencies_id_seq', 2, true);


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
1	1	dk	About us	About us	2010-12-23 10:53:23.195468	2010-12-23 10:53:23.195468
2	1	en	About us	About us	2010-12-23 10:53:23.209269	2010-12-23 10:53:23.209269
3	2	dk	Privacy	Privacy	2010-12-23 10:53:23.244165	2010-12-23 10:53:23.244165
4	2	en	Privacy	Privacy	2010-12-23 10:53:23.255615	2010-12-23 10:53:23.255615
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-23 10:53:23.416151	2010-12-23 10:53:23.416151
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-23 10:53:23.427263	2010-12-23 10:53:23.427263
7	4	dk	Blurb sign up	Blurb sign up	2010-12-23 10:53:23.454652	2010-12-23 10:53:23.454652
8	4	en	Blurb sign up	Blurb sign up	2010-12-23 10:53:23.466256	2010-12-23 10:53:23.466256
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-23 10:53:23.495194	2010-12-23 10:53:23.495194
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-23 10:53:23.506817	2010-12-23 10:53:23.506817
11	6	dk	Blurb agent home	Blurb agent home	2010-12-23 10:53:23.548095	2010-12-23 10:53:23.548095
12	6	en	Blurb agent home	Blurb agent home	2010-12-23 10:53:23.559028	2010-12-23 10:53:23.559028
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-23 10:53:23.5883	2010-12-23 10:53:23.5883
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-23 10:53:23.59932	2010-12-23 10:53:23.59932
15	8	dk	Blurb currencies	Blurb currencies	2010-12-23 10:53:23.628374	2010-12-23 10:53:23.628374
16	8	en	Blurb currencies	Blurb currencies	2010-12-23 10:53:23.64071	2010-12-23 10:53:23.64071
17	9	dk	Reset password	Reset password	2010-12-23 10:53:23.673212	2010-12-23 10:53:23.673212
18	9	en	Reset password	Reset password	2010-12-23 10:53:23.690547	2010-12-23 10:53:23.690547
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-23 10:53:23.186733	2010-12-23 10:53:23.212056	about_us	0	t	2010-12-23 10:53:23.211982
2	Article::Cms	2010-12-23 10:53:23.239563	2010-12-23 10:53:23.258593	privacy	0	t	2010-12-23 10:53:23.25852
3	Article::Cms	2010-12-23 10:53:23.412209	2010-12-23 10:53:23.429933	terms_conditions	0	t	2010-12-23 10:53:23.42986
4	Article::Cms	2010-12-23 10:53:23.450499	2010-12-23 10:53:23.469099	blurb_sign_up	1	t	2010-12-23 10:53:23.469021
5	Article::Cms	2010-12-23 10:53:23.491156	2010-12-23 10:53:23.522614	blurb_buyer_home	1	t	2010-12-23 10:53:23.522531
6	Article::Cms	2010-12-23 10:53:23.543685	2010-12-23 10:53:23.561791	blurb_agent_home	1	t	2010-12-23 10:53:23.561715
7	Article::Cms	2010-12-23 10:53:23.58227	2010-12-23 10:53:23.602115	blurb_start_page_role_selection	1	t	2010-12-23 10:53:23.602031
8	Article::Cms	2010-12-23 10:53:23.623791	2010-12-23 10:53:23.644651	blurb_currencies	1	t	2010-12-23 10:53:23.64457
9	Article::Cms	2010-12-23 10:53:23.668606	2010-12-23 10:53:23.697688	reset_password	2	t	2010-12-23 10:53:23.697603
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
1	Electronics	Magni dolorem quidem est repudiandae.Dolorum modi et officia.	2010-12-23 10:53:21.827832	2010-12-23 10:53:21.827832	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Ut molestiae non occaecati tenetur repellat ex.Non aut veniam quia voluptatum id.	2010-12-23 10:53:21.885756	2010-12-23 10:53:21.885756	\N	3	4	\N	0	2-leisure	f	0
3	Business	Dolor ut voluptatibus recusandae.Saepe est doloremque accusantium pariatur impedit.	2010-12-23 10:53:21.922513	2010-12-23 10:53:22.739433	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Magni dolorem quidem est repudiandae.Dolorum modi et officia.	Electronics	2010-12-23 10:53:21.836964	2010-12-23 10:53:21.836964
2	1	dk	\N	Electronics	2010-12-23 10:53:21.875219	2010-12-23 10:53:21.875219
3	2	en	Ut molestiae non occaecati tenetur repellat ex.Non aut veniam quia voluptatum id.	Leisure	2010-12-23 10:53:21.890432	2010-12-23 10:53:21.890432
4	2	dk	\N	Leisure	2010-12-23 10:53:21.910356	2010-12-23 10:53:21.910356
5	3	en	Dolor ut voluptatibus recusandae.Saepe est doloremque accusantium pariatur impedit.	Business	2010-12-23 10:53:21.926884	2010-12-23 10:53:21.926884
6	3	dk	\N	Business	2010-12-23 10:53:21.949901	2010-12-23 10:53:21.949901
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-23 10:53:21.251378	2010-12-23 10:53:21.251378
2	United Kingdom	2010-12-23 10:53:21.256073	2010-12-23 10:53:21.256073
3	Wales129310160210588	2010-12-23 10:53:22.107273	2010-12-23 10:53:22.107273
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
1	Euro	&euro;	%u%n	t	2010-12-23 10:53:21.805656	2010-12-23 10:53:21.805656
2	PLN	&pln;	%u%n	t	2010-12-23 10:53:21.81052	2010-12-23 10:53:21.81052
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-23 10:53:21.290893	2010-12-23 10:53:21.290893
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-23 10:53:21.306717	2010-12-23 10:53:21.306717
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-23 10:53:21.319974	2010-12-23 10:53:21.319974
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-23 10:53:21.333948	2010-12-23 10:53:21.333948
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-23 10:53:21.347547	2010-12-23 10:53:21.347547
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-23 10:53:21.490068	2010-12-23 10:53:21.490068
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-23 10:53:21.502924	2010-12-23 10:53:21.502924
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-23 10:53:21.515474	2010-12-23 10:53:21.515474
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-23 10:53:21.528173	2010-12-23 10:53:21.528173
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-23 10:53:21.54026	2010-12-23 10:53:21.54026
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-23 10:53:21.552637	2010-12-23 10:53:21.552637
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-23 10:53:21.564976	2010-12-23 10:53:21.564976
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-23 10:53:21.577754	2010-12-23 10:53:21.577754
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-23 10:53:21.590108	2010-12-23 10:53:21.590108
15	8	en	Question	<p></p>	2010-12-23 10:53:21.602745	2010-12-23 10:53:21.602745
16	8	dk	[DK] Question	<p></p>	2010-12-23 10:53:21.614985	2010-12-23 10:53:21.614985
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-23 10:53:21.281796	2010-12-23 10:53:21.302218
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-23 10:53:21.315299	2010-12-23 10:53:21.329641
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-23 10:53:21.342662	2010-12-23 10:53:21.485699
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-23 10:53:21.498453	2010-12-23 10:53:21.511303
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-23 10:53:21.523628	2010-12-23 10:53:21.535987
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-23 10:53:21.548257	2010-12-23 10:53:21.560894
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-23 10:53:21.573252	2010-12-23 10:53:21.585818
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-23 10:53:21.598395	2010-12-23 10:53:21.610823
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

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, hidden_description, description, header, created_at, updated_at) FROM stdin;
1	1	dk	Sequi voluptas eum repellat tenetur.Aperiam nulla voluptatem molestias perspiciatis.	Enim consectetur repudiandae et perferendis.Aspernatur rerum vitae rem est omnis.	Big deal on printers	2010-12-23 10:53:22.211603	2010-12-23 10:53:22.211603
2	2	dk	Aut a ad et.Totam corporis est sed nobis ut nemo eligendi.	Quo omnis excepturi vitae.Ut est voluptatum expedita earum quibusdam explicabo vero minima.	Drills required	2010-12-23 10:53:22.281284	2010-12-23 10:53:22.281284
3	3	dk	Quis et recusandae facilis.Aut voluptas qui quasi voluptates quia.	Et suscipit nobis omnis at.Nobis est voluptas dolorum expedita impedit amet temporibus.	Need assistance in selling a car	2010-12-23 10:53:22.347605	2010-12-23 10:53:22.347605
4	4	dk	Autem molestiae doloribus molestiae possimus est et aut et.Blanditiis et atque sint assumenda sunt alias.	Ipsa sint perferendis veritatis sed.Atque quod laudantium officia totam exercitationem.	Ipod shipment	2010-12-23 10:53:22.413588	2010-12-23 10:53:22.413588
5	5	dk	Aut non earum quibusdam nemo.Fugiat autem quas sint ullam tempore.	Animi quo est dolorem voluptas facilis eligendi culpa.Deleniti laboriosam aut earum nisi voluptatem qui.	Trip to amazonia - looking for offer	2010-12-23 10:53:22.611749	2010-12-23 10:53:22.611749
6	6	dk	Et reiciendis nemo molestiae minus.Repellat blanditiis iure error.	Eveniet id corrupti non nostrum.Aut dolores quas sed laudantium quasi nostrum.	LCD - Huge amounts	2010-12-23 10:53:22.678402	2010-12-23 10:53:22.678402
7	7	dk	Explicabo corrupti tempore non repudiandae.Quisquam modi unde eligendi rem.	Maiores dolore minus aliquam quaerat quia sunt.Qui aut a sed eveniet doloribus quas at.	GPS receivers required	2010-12-23 10:53:22.746428	2010-12-23 10:53:22.746428
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Enim consectetur repudiandae et perferendis.Aspernatur rerum vitae rem est omnis.	Sequi voluptas eum repellat tenetur.Aperiam nulla voluptatem molestias perspiciatis.	2	User::Agent	0	971.0	900.0	1	Hirthe	Elta Borer	(530)910-2589	treva.mann@shanahankohler.co.uk	10339 Littel Turnpike	2010-12-23 10:53:22.171613	2010-12-23 10:53:22.171613	2010-12-28	Zakary129310160210507 Dietrich	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Quo omnis excepturi vitae.Ut est voluptatum expedita earum quibusdam explicabo vero minima.	Aut a ad et.Totam corporis est sed nobis ut nemo eligendi.	2	User::Agent	0	700.0	999.0	1	Donnelly	Theodore Christiansen	284.059.4841	magdalen@gottliebbatz.uk	8480 Bode Rapid	2010-12-23 10:53:22.249969	2010-12-23 10:53:22.249969	2010-12-28	Zakary129310160210507 Dietrich	1	t	\N	0	0	f	f	-1	1
3	Need assistance in selling a car	3	Et suscipit nobis omnis at.Nobis est voluptas dolorum expedita impedit amet temporibus.	Quis et recusandae facilis.Aut voluptas qui quasi voluptates quia.	2	User::Agent	0	333.0	612.0	1	Lind	Joey Howell II	369.465.1895 x5389	earl_friesen@ferry.co.uk	2759 Rebeca Curve	2010-12-23 10:53:22.315996	2010-12-23 10:53:22.315996	2010-12-28	Zakary129310160210507 Dietrich	1	t	\N	0	0	f	f	-1	1
4	Ipod shipment	3	Ipsa sint perferendis veritatis sed.Atque quod laudantium officia totam exercitationem.	Autem molestiae doloribus molestiae possimus est et aut et.Blanditiis et atque sint assumenda sunt alias.	2	User::Agent	0	645.0	150.0	1	Lindkessler	Levi Bartoletti	222-146-0438 x89670	viviane@hagenes.name	732 Allan Corner	2010-12-23 10:53:22.382233	2010-12-23 10:53:22.382233	2010-12-28	Zakary129310160210507 Dietrich	1	t	\N	0	0	f	f	-1	1
5	Trip to amazonia - looking for offer	3	Animi quo est dolorem voluptas facilis eligendi culpa.Deleniti laboriosam aut earum nisi voluptatem qui.	Aut non earum quibusdam nemo.Fugiat autem quas sint ullam tempore.	2	User::Agent	0	123.0	112.0	1	Johns	Otto Murray	(681)189-6640 x82519	carlos@schultzlarson.name	870 Greenholt Crossroad	2010-12-23 10:53:22.579835	2010-12-23 10:53:22.579835	2010-12-28	Zakary129310160210507 Dietrich	1	t	\N	0	0	f	f	-1	1
6	LCD - Huge amounts	3	Eveniet id corrupti non nostrum.Aut dolores quas sed laudantium quasi nostrum.	Et reiciendis nemo molestiae minus.Repellat blanditiis iure error.	2	User::Agent	0	471.0	304.0	1	Huels	Oleta O'Hara	(722)166-8640 x4010	lurline@hoegerkuvalis.biz	5891 Hills Fords	2010-12-23 10:53:22.646762	2010-12-23 10:53:22.646762	2010-12-28	Zakary129310160210507 Dietrich	1	t	\N	0	0	f	f	-1	1
7	GPS receivers required	3	Maiores dolore minus aliquam quaerat quia sunt.Qui aut a sed eveniet doloribus quas at.	Explicabo corrupti tempore non repudiandae.Quisquam modi unde eligendi rem.	2	User::Agent	0	4.0	495.0	1	Okon	Ulices Hermann	1-616-980-4709	fatima@stiedemann.uk	81604 Bradly Ferry	2010-12-23 10:53:22.712789	2010-12-23 10:53:22.712789	2010-12-28	Zakary129310160210507 Dietrich	1	t	\N	0	0	f	f	-1	1
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
1	default_payout_delay	--- 0\n	2010-12-23 10:53:21.196748	2010-12-23 10:53:21.196748
2	default_leads_per_page	--- 5\n	2010-12-23 10:53:21.212456	2010-12-23 10:53:21.212456
3	certification_level_1	--- 10\n	2010-12-23 10:53:21.214579	2010-12-23 10:53:21.214579
4	certification_level_2	--- 20\n	2010-12-23 10:53:21.216802	2010-12-23 10:53:21.216802
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-23 10:53:21.219051	2010-12-23 10:53:21.219051
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-23 10:53:21.221109	2010-12-23 10:53:21.221109
7	invoicing_seller_name	--- Fairleads\n	2010-12-23 10:53:21.22326	2010-12-23 10:53:21.22326
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-23 10:53:21.225271	2010-12-23 10:53:21.225271
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-23 10:53:21.227435	2010-12-23 10:53:21.227435
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-23 10:53:21.229497	2010-12-23 10:53:21.229497
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
1	blazejek@gmail.com	03e36bad58af1cef3db8fafe64cf75dc211b63ff7587ed9a5733b8cfd09838d9ba88ce42434cc91365108f7d7b7f0a22760077d9cc6989b68b5e7294e323637e	LmxIDDEvwHndt2mEVzt5	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 10:53:21.796161	2010-12-23 10:53:21.673378	\N	2010-12-23 10:53:21.673597	2010-12-23 10:53:21.796449	1	Ross	Schuster	1-288-473-4790 x23525	root	Auer Skyway	New General	06436	Nottinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	OftY5mlHcwd8goZEHKyOPJUQU9JQ1sxBalkoZcfYZoVeww1gNLkay4rEPEbjpM	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	193f9b35270696db387d92660f49578ea2a6b71f7dae0128d0823355d7630583b1da7566d3d2c83413186302116ba4854f6d36140020575f268e6ffe0b6634cb	XWrOaMUM8Nft5gKkFNy-	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 10:53:22.134992	2010-12-23 10:53:22.112786	\N	2010-12-23 10:53:22.112994	2010-12-23 10:53:22.135338	2	Zakary129310160210507	Dietrich	205.418.3730 x53898	Cierra Kunze129310160210457	Tyrel Drive	Maybury	40911-0496	Grampian	3	\N	0	\N	\N	0	\N	\N	\N	\N	q5tK1FaFHtdausP0BTUFgvEvkFzwqhUbkIHYo8vr8PyPuAg7ekIdSrjK1x9OVl	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	b7da7ee557a762166cb59c4809530e9cdb9278c171d6f0a6dda66d38a7a907b9ea3be15d91bcd33919157695a9a6234d8957563ed284acfc3514a3cde5f4f112	jYqa8hEyLJWRHuAuAQOq	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 10:53:22.820706	2010-12-23 10:53:22.800398	\N	2010-12-23 10:53:22.800613	2010-12-23 10:53:22.820971	1	Raymond	Fahey	484-502-8830	Lessie Prosacco129310160279591	Jean Junctions	Dennisborough	37244	Cleveland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	EkWlL3fAEBnD6SP1MFB7FNs6pXb8DEwFlHzZKlvLmMs4RHhwWtA2qBwGGJ9eWr	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	dac666751eebb7004a991149ae607c3f0eb958f5714e0897de2920a48d0e4c564b961910c88c1a5494d2fa925244fba76f8b9026e3517898135f15ad2c5a2129	rzK1ZcKFQJlwPgSiQ8C_	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 10:53:22.872249	2010-12-23 10:53:22.850437	\N	2010-12-23 10:53:22.850654	2010-12-23 10:53:22.872517	48	Arturo	Hoeger	1-756-330-3377	Chance Yundt129310160284589	Ottilie Locks	New Gretchen	70632-4306	Wiltshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	UsvgOdIkTfyU77QFbTQaGLGJw18iiKUqLqfuRbjVb47oJIPxsHOaVluhckpUt7	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	11fd586e9ab753400c4bafaf2ab80897e93e86cb2c9eea83a4c6d6c007ffb25808a01cef9ee6350ff0532baab718a8fc3d2d56d91db62f61d2f15cdc24f0d7bd	C8QsfKnmHgYvd3KzOlHU	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-23 10:53:23.056332	2010-12-23 10:53:22.901836	\N	2010-12-23 10:53:22.902053	2010-12-23 10:53:23.070612	64	Kathleen	Bernhard	158-297-4702 x661	Shakira Mueller129310160289734	Gulgowski Road	North River	02113	County Antrim	1	\N	\N	4	\N	0	\N	\N	\N	\N	rYz3cN2BgERtENbbpYSxxSTcYXWNL3esSe5uN4JOotJtrp5bsdGzFYqvKAhQtJ	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

