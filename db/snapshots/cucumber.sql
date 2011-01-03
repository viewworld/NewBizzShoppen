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
1	1	dk	About us	About us	2011-01-03 08:37:05.169713	2011-01-03 08:37:05.169713
2	1	en	About us	About us	2011-01-03 08:37:05.183344	2011-01-03 08:37:05.183344
3	2	dk	Privacy	Privacy	2011-01-03 08:37:05.213005	2011-01-03 08:37:05.213005
4	2	en	Privacy	Privacy	2011-01-03 08:37:05.223862	2011-01-03 08:37:05.223862
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-03 08:37:05.379301	2011-01-03 08:37:05.379301
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-03 08:37:05.390129	2011-01-03 08:37:05.390129
7	4	dk	Blurb sign up	Blurb sign up	2011-01-03 08:37:05.417383	2011-01-03 08:37:05.417383
8	4	en	Blurb sign up	Blurb sign up	2011-01-03 08:37:05.42888	2011-01-03 08:37:05.42888
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-03 08:37:05.456763	2011-01-03 08:37:05.456763
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-03 08:37:05.468103	2011-01-03 08:37:05.468103
11	6	dk	Blurb agent home	Blurb agent home	2011-01-03 08:37:05.495157	2011-01-03 08:37:05.495157
12	6	en	Blurb agent home	Blurb agent home	2011-01-03 08:37:05.506218	2011-01-03 08:37:05.506218
13	7	dk	Blurb start page role selection	Blurb start page role selection	2011-01-03 08:37:05.533475	2011-01-03 08:37:05.533475
14	7	en	Blurb start page role selection	Blurb start page role selection	2011-01-03 08:37:05.544734	2011-01-03 08:37:05.544734
15	8	dk	Blurb currencies	Blurb currencies	2011-01-03 08:37:05.573196	2011-01-03 08:37:05.573196
16	8	en	Blurb currencies	Blurb currencies	2011-01-03 08:37:05.584355	2011-01-03 08:37:05.584355
17	9	dk	Reset password	Reset password	2011-01-03 08:37:05.612379	2011-01-03 08:37:05.612379
18	9	en	Reset password	Reset password	2011-01-03 08:37:05.623409	2011-01-03 08:37:05.623409
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-03 08:37:05.161192	2011-01-03 08:37:05.186027	about_us	0	t	2011-01-03 08:37:05.185949
2	Article::Cms	2011-01-03 08:37:05.209134	2011-01-03 08:37:05.226485	privacy	0	t	2011-01-03 08:37:05.226409
3	Article::Cms	2011-01-03 08:37:05.375334	2011-01-03 08:37:05.392736	terms_conditions	0	t	2011-01-03 08:37:05.392663
4	Article::Cms	2011-01-03 08:37:05.413271	2011-01-03 08:37:05.431815	blurb_sign_up	1	t	2011-01-03 08:37:05.431735
5	Article::Cms	2011-01-03 08:37:05.452799	2011-01-03 08:37:05.470959	blurb_buyer_home	1	t	2011-01-03 08:37:05.470878
6	Article::Cms	2011-01-03 08:37:05.491277	2011-01-03 08:37:05.509215	blurb_agent_home	1	t	2011-01-03 08:37:05.509134
7	Article::Cms	2011-01-03 08:37:05.52951	2011-01-03 08:37:05.547505	blurb_start_page_role_selection	1	t	2011-01-03 08:37:05.547429
8	Article::Cms	2011-01-03 08:37:05.569002	2011-01-03 08:37:05.587058	blurb_currencies	1	t	2011-01-03 08:37:05.58698
9	Article::Cms	2011-01-03 08:37:05.608182	2011-01-03 08:37:05.626251	reset_password	2	t	2011-01-03 08:37:05.626169
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
1	Electronics	Ut eaque dolorem omnis non.Iure blanditiis culpa recusandae.	2011-01-03 08:37:03.888149	2011-01-03 08:37:03.888149	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Temporibus vitae qui incidunt quibusdam nesciunt et aliquam non.Sit quo magnam veniam.	2011-01-03 08:37:03.932384	2011-01-03 08:37:03.932384	\N	3	4	\N	0	2-leisure	f	0
3	Business	Eligendi veniam rerum sit et et est eaque incidunt.Maxime tempore eum et id illum omnis.	2011-01-03 08:37:03.965055	2011-01-03 08:37:04.756983	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Ut eaque dolorem omnis non.Iure blanditiis culpa recusandae.	Electronics	2011-01-03 08:37:03.89729	2011-01-03 08:37:03.89729
2	1	dk	\N	Electronics	2011-01-03 08:37:03.922843	2011-01-03 08:37:03.922843
3	2	en	Temporibus vitae qui incidunt quibusdam nesciunt et aliquam non.Sit quo magnam veniam.	Leisure	2011-01-03 08:37:03.936713	2011-01-03 08:37:03.936713
4	2	dk	\N	Leisure	2011-01-03 08:37:03.955739	2011-01-03 08:37:03.955739
5	3	en	Eligendi veniam rerum sit et et est eaque incidunt.Maxime tempore eum et id illum omnis.	Business	2011-01-03 08:37:03.969544	2011-01-03 08:37:03.969544
6	3	dk	\N	Business	2011-01-03 08:37:03.988498	2011-01-03 08:37:03.988498
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-03 08:37:03.420114	2011-01-03 08:37:03.420114
2	United Kingdom	2011-01-03 08:37:03.424896	2011-01-03 08:37:03.424896
3	Scotland129404382413607	2011-01-03 08:37:04.137399	2011-01-03 08:37:04.137399
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
1	Euro	&euro;	%u%n	t	2011-01-03 08:37:03.866976	2011-01-03 08:37:03.866976
2	PLN	&pln;	%u%n	t	2011-01-03 08:37:03.871176	2011-01-03 08:37:03.871176
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-03 08:37:03.451302	2011-01-03 08:37:03.451302
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-03 08:37:03.466732	2011-01-03 08:37:03.466732
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-03 08:37:03.479457	2011-01-03 08:37:03.479457
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-03 08:37:03.491945	2011-01-03 08:37:03.491945
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-03 08:37:03.504632	2011-01-03 08:37:03.504632
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-03 08:37:03.640158	2011-01-03 08:37:03.640158
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-03 08:37:03.652755	2011-01-03 08:37:03.652755
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-03 08:37:03.664913	2011-01-03 08:37:03.664913
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-03 08:37:03.677102	2011-01-03 08:37:03.677102
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-03 08:37:03.688984	2011-01-03 08:37:03.688984
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-03 08:37:03.701613	2011-01-03 08:37:03.701613
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-03 08:37:03.713532	2011-01-03 08:37:03.713532
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-03 08:37:03.725899	2011-01-03 08:37:03.725899
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-03 08:37:03.738159	2011-01-03 08:37:03.738159
15	8	en	Question	<p></p>	2011-01-03 08:37:03.750571	2011-01-03 08:37:03.750571
16	8	dk	[DK] Question	<p></p>	2011-01-03 08:37:03.762583	2011-01-03 08:37:03.762583
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-03 08:37:03.442039	2011-01-03 08:37:03.462207
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-03 08:37:03.474956	2011-01-03 08:37:03.487644
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-03 08:37:03.500072	2011-01-03 08:37:03.636065
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-03 08:37:03.64805	2011-01-03 08:37:03.660672
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-03 08:37:03.672805	2011-01-03 08:37:03.684834
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-03 08:37:03.697242	2011-01-03 08:37:03.70944
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-03 08:37:03.721534	2011-01-03 08:37:03.733965
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-03 08:37:03.746119	2011-01-03 08:37:03.758516
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
1	1	dk	Quia est culpa libero facilis perspiciatis.Non aspernatur et quis reiciendis sapiente.	In nesciunt et dolores fugit non blanditiis voluptatem.Eaque modi expedita quis consectetur doloremque dignissimos.	Big deal on printers	2011-01-03 08:37:04.240265	2011-01-03 08:37:04.240265
2	2	dk	Alias sequi necessitatibus nisi et debitis deserunt qui maiores.Iure est alias et voluptate ex corrupti.	Doloribus qui ab cum repellendus non.Unde id ut inventore laudantium animi dolorem.	Drills required	2011-01-03 08:37:04.309903	2011-01-03 08:37:04.309903
3	3	dk	Odit iste nesciunt consequatur eligendi sit ratione et.Autem est nulla maxime qui nihil.	Labore odit fugiat soluta autem harum velit consectetur.Modi corrupti eligendi neque non.	Need assistance in selling a car	2011-01-03 08:37:04.374615	2011-01-03 08:37:04.374615
4	4	dk	Voluptatibus ut facilis nemo nihil vero.Saepe iusto error natus suscipit sunt laboriosam.	Assumenda perspiciatis natus deserunt cupiditate itaque.Qui culpa dolor ipsum.	Ipod shipment	2011-01-03 08:37:04.439275	2011-01-03 08:37:04.439275
5	5	dk	Ipsa aspernatur cupiditate voluptas.Autem cupiditate laborum qui quasi quae quis.	Est labore dolorem repellat quo autem libero accusamus.Rerum culpa fuga ea.	Trip to amazonia - looking for offer	2011-01-03 08:37:04.63164	2011-01-03 08:37:04.63164
6	6	dk	Ab officiis repellendus architecto tempore incidunt eveniet.Non consequatur illo animi sunt laboriosam dolores.	Voluptas eos impedit saepe omnis quasi ipsum suscipit.Dolores eum aliquid eaque quia inventore.	LCD - Huge amounts	2011-01-03 08:37:04.698166	2011-01-03 08:37:04.698166
7	7	dk	Nihil quae officia nam sequi.Similique eos aut magni.	Enim eos quo ut nihil non libero deserunt sed.Nostrum itaque sint asperiores et natus corrupti veniam.	GPS receivers required	2011-01-03 08:37:04.763703	2011-01-03 08:37:04.763703
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url) FROM stdin;
1	Big deal on printers	3	In nesciunt et dolores fugit non blanditiis voluptatem.Eaque modi expedita quis consectetur doloremque dignissimos.	Quia est culpa libero facilis perspiciatis.Non aspernatur et quis reiciendis sapiente.	2	User::Agent	0	245.0	596.0	1	Considine	Velma Weissnat	759-699-6643 x03315	daryl.stiedemann@schuster.uk	386 Furman Corner	2011-01-03 08:37:04.200915	2011-01-03 08:37:04.200915	2011-01-08	Alberta129404382413529 Eichmann	1	t	\N	0	0	f	f	-1	1	2011-01-03 08:37:04.209971	\N	\N
2	Drills required	3	Doloribus qui ab cum repellendus non.Unde id ut inventore laudantium animi dolorem.	Alias sequi necessitatibus nisi et debitis deserunt qui maiores.Iure est alias et voluptate ex corrupti.	2	User::Agent	0	418.0	731.0	1	Casperbaumbach	Denis Mueller	138.799.0366	jayme@sanford.com	80856 Hansen Station	2011-01-03 08:37:04.277625	2011-01-03 08:37:04.277625	2011-01-08	Alberta129404382413529 Eichmann	1	t	\N	0	0	f	f	-1	1	2011-01-03 08:37:04.284689	\N	\N
3	Need assistance in selling a car	3	Labore odit fugiat soluta autem harum velit consectetur.Modi corrupti eligendi neque non.	Odit iste nesciunt consequatur eligendi sit ratione et.Autem est nulla maxime qui nihil.	2	User::Agent	0	603.0	286.0	1	Morar	Sheridan Yost	610.311.0889	maya@bins.uk	1528 Lakin Cove	2011-01-03 08:37:04.343825	2011-01-03 08:37:04.343825	2011-01-08	Alberta129404382413529 Eichmann	1	t	\N	0	0	f	f	-1	1	2011-01-03 08:37:04.350243	\N	\N
4	Ipod shipment	3	Assumenda perspiciatis natus deserunt cupiditate itaque.Qui culpa dolor ipsum.	Voluptatibus ut facilis nemo nihil vero.Saepe iusto error natus suscipit sunt laboriosam.	2	User::Agent	0	454.0	173.0	1	Flatley	Benjamin Grimes	(037)399-0657 x5256	kenton@walsh.biz	842 Elisha Island	2011-01-03 08:37:04.408207	2011-01-03 08:37:04.408207	2011-01-08	Alberta129404382413529 Eichmann	1	t	\N	0	0	f	f	-1	1	2011-01-03 08:37:04.414457	\N	\N
5	Trip to amazonia - looking for offer	3	Est labore dolorem repellat quo autem libero accusamus.Rerum culpa fuga ea.	Ipsa aspernatur cupiditate voluptas.Autem cupiditate laborum qui quasi quae quis.	2	User::Agent	0	223.0	220.0	1	Mrazdooley	Joshua Yundt	683-254-7723	jamar.quitzon@hermiston.uk	485 Yundt Dale	2011-01-03 08:37:04.59944	2011-01-03 08:37:04.59944	2011-01-08	Alberta129404382413529 Eichmann	1	t	\N	0	0	f	f	-1	1	2011-01-03 08:37:04.605962	\N	\N
6	LCD - Huge amounts	3	Voluptas eos impedit saepe omnis quasi ipsum suscipit.Dolores eum aliquid eaque quia inventore.	Ab officiis repellendus architecto tempore incidunt eveniet.Non consequatur illo animi sunt laboriosam dolores.	2	User::Agent	0	128.0	264.0	1	Cruickshank	Mariela Cassin	537.662.4338	kasey_brown@heathcote.info	15125 Gleason Road	2011-01-03 08:37:04.666314	2011-01-03 08:37:04.666314	2011-01-08	Alberta129404382413529 Eichmann	1	t	\N	0	0	f	f	-1	1	2011-01-03 08:37:04.672709	\N	\N
7	GPS receivers required	3	Enim eos quo ut nihil non libero deserunt sed.Nostrum itaque sint asperiores et natus corrupti veniam.	Nihil quae officia nam sequi.Similique eos aut magni.	2	User::Agent	0	14.0	210.0	1	Thiel	Darron Dietrich V	1-551-612-4188	wilbert@bechtelar.com	87944 Cristopher Lodge	2011-01-03 08:37:04.732594	2011-01-03 08:37:04.732594	2011-01-08	Alberta129404382413529 Eichmann	1	t	\N	0	0	f	f	-1	1	2011-01-03 08:37:04.738949	\N	\N
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
1	default_payout_delay	--- 0\n	2011-01-03 08:37:03.389484	2011-01-03 08:37:03.389484
2	default_leads_per_page	--- 5\n	2011-01-03 08:37:03.395073	2011-01-03 08:37:03.395073
3	certification_level_1	--- 10\n	2011-01-03 08:37:03.397325	2011-01-03 08:37:03.397325
4	certification_level_2	--- 20\n	2011-01-03 08:37:03.399359	2011-01-03 08:37:03.399359
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-03 08:37:03.401452	2011-01-03 08:37:03.401452
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-03 08:37:03.403521	2011-01-03 08:37:03.403521
7	invoicing_seller_name	--- Fairleads\n	2011-01-03 08:37:03.405652	2011-01-03 08:37:03.405652
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-03 08:37:03.407839	2011-01-03 08:37:03.407839
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-03 08:37:03.409858	2011-01-03 08:37:03.409858
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-03 08:37:03.411854	2011-01-03 08:37:03.411854
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information) FROM stdin;
1	blazejek@gmail.com	49f7b3e3d69dd87c741b1ed315ccbd0de7cfe742bc9cf4900a84306910215bdb3c6a8c96f6105d63c3e8a743ba813a668c6979b50c224137ff4b2153f69adcd4	gjphYyyZZlPC9Gj3Jma5	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-03 08:37:03.857567	2011-01-03 08:37:03.79813	\N	2011-01-03 08:37:03.798347	2011-01-03 08:37:03.857951	1	Icie	Schmitt	703.682.4878 x95444	root	Rosie Isle	New Richmondhaven	99268-6430	Lincolnshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	kZZSBhZmSpyF0ZdEDxDUOE9FAuzZHqqxX6sjdcAw6nWOGHoCjZc35W48RWFULh	f	\N	0	0	0	0	0	\N	\N	\N	f
2	agent@nbs.com	0ae00c755f1c32888def2fe76d060f88b04a3df28ae57155a82ecaab80450fd0e1a19b834c90213978fc8665056d0fc3e510c7cdddd8e1559c6a48d6c8f5e2ac	sPbvuHAUZlKhvucDprmm	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-03 08:37:04.164911	2011-01-03 08:37:04.142535	\N	2011-01-03 08:37:04.142741	2011-01-03 08:37:04.16518	2	Alberta129404382413529	Eichmann	1-900-003-9665 x1750	Velda Farrell129404382413494	Austyn Valley	Nikkofort	38978-1800	Lancashire	3	\N	0	\N	\N	0	\N	\N	\N	\N	gaGmaNOZDnUnUvNZIREBdMC9uUAAv3IxmW9pkmEm9pka1j2kxeFKawVNLqncO0	f	\N	0	0	0	0	0	\N	\N	\N	f
3	admin@nbs.com	fa62bbd779972255160be9551d6f1d368d22bb92bb55715b4493e0b66cf3de4c7cdf08cc91f134e87e8a7be755fbabc8aaee5b19ab5d092689e7a0912f1151a8	UUJYD2ZNMpamuRbxvONk	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-03 08:37:04.836548	2011-01-03 08:37:04.816833	\N	2011-01-03 08:37:04.817049	2011-01-03 08:37:04.836848	1	Gregorio	West	1-206-480-8795 x11983	Greyson Gibson129404382481265	Parker Forge	Krajcikside	74048-9589	Gloucestershire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	oqAScN2OQkv0gB42Q4GmHE3rDo4q4pnUU8ysUmupy2P1oohJ8XnFxFSoSQdEvq	f	\N	0	0	0	0	0	\N	\N	\N	f
4	buyer@nbs.com	19740c93c18d940e46218fecbf2e1b2c47ecb93455af599e26246934b6a6c84bd97cc4550e2ecf607de7ebaf51fec19752f143102b9c4bdaec27622ca9b8633f	-xXBkCDPPdVB7HmzQZzw	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-03 08:37:04.887182	2011-01-03 08:37:04.865592	\N	2011-01-03 08:37:04.865812	2011-01-03 08:37:04.887463	48	Angelita	Cormier	(411)172-7882 x0345	Mr. Nakia Powlowski129404382486095	Dorthy Summit	Flatleyfort	14639-4105	County Antrim	1	\N	\N	\N	\N	0	\N	\N	\N	\N	fdRGFW7U77S3oUknCKuOow0g1wBDdwkwBXEqqY8RWAP68NUKT4td81Xf76onVH	f	t	0	0	0	0	0	\N	\N	\N	f
5	leaduser@nbs.com	117d47275382b7e4744fff6bec65e24c1c82e85a609fcfdb395231270b529d0c320414040118891aa98f3c70faa594bd197e44b9cbd4f28dddeda336bac81ffe	LzhxbKe-F13esKT2NqCI	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-03 08:37:05.066635	2011-01-03 08:37:04.916024	\N	2011-01-03 08:37:04.91623	2011-01-03 08:37:05.080336	64	Douglas	Paucek	428-357-7458 x15516	Carlotta Lowe MD129404382491163	Schroeder Turnpike	Consueloburgh	19084-6195	Buckinghamshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	5EywZzn9cb81faybph4Z1XIeR7YQILi69OC30ZVcTabSjw0FxxQUrxQfudYfYO	f	\N	0	0	0	0	0	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

