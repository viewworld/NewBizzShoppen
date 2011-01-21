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
-- Name: vat_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vat_rates_id_seq', 1, false);


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-01-20 14:33:40.146606	2011-01-20 14:33:40.146606
2	1	en	About us	About us	2011-01-20 14:33:40.17143	2011-01-20 14:33:40.17143
3	2	dk	Privacy	Privacy	2011-01-20 14:33:40.222429	2011-01-20 14:33:40.222429
4	2	en	Privacy	Privacy	2011-01-20 14:33:40.242076	2011-01-20 14:33:40.242076
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-20 14:33:40.295286	2011-01-20 14:33:40.295286
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-20 14:33:40.315939	2011-01-20 14:33:40.315939
7	4	dk	Blurb sign up	Blurb sign up	2011-01-20 14:33:40.363986	2011-01-20 14:33:40.363986
8	4	en	Blurb sign up	Blurb sign up	2011-01-20 14:33:40.385206	2011-01-20 14:33:40.385206
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-20 14:33:40.436021	2011-01-20 14:33:40.436021
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-20 14:33:40.456147	2011-01-20 14:33:40.456147
11	6	dk	Blurb agent home	Blurb agent home	2011-01-20 14:33:40.50076	2011-01-20 14:33:40.50076
12	6	en	Blurb agent home	Blurb agent home	2011-01-20 14:33:40.518003	2011-01-20 14:33:40.518003
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-20 14:33:40.566138	2011-01-20 14:33:40.566138
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-20 14:33:40.583088	2011-01-20 14:33:40.583088
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-20 14:33:40.629614	2011-01-20 14:33:40.629614
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-20 14:33:40.648518	2011-01-20 14:33:40.648518
17	9	dk	Blurb currencies	Blurb currencies	2011-01-20 14:33:40.691947	2011-01-20 14:33:40.691947
18	9	en	Blurb currencies	Blurb currencies	2011-01-20 14:33:40.712804	2011-01-20 14:33:40.712804
19	10	dk	Reset password	Reset password	2011-01-20 14:33:40.770561	2011-01-20 14:33:40.770561
20	10	en	Reset password	Reset password	2011-01-20 14:33:40.788713	2011-01-20 14:33:40.788713
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-20 14:33:40.136037	2011-01-20 14:33:40.178254	about_us	0	t	2011-01-20 14:33:40.178137
2	Article::Cms	2011-01-20 14:33:40.216873	2011-01-20 14:33:40.250073	privacy	0	t	2011-01-20 14:33:40.249959
3	Article::Cms	2011-01-20 14:33:40.28966	2011-01-20 14:33:40.323339	terms_conditions	0	t	2011-01-20 14:33:40.323204
4	Article::Cms	2011-01-20 14:33:40.357937	2011-01-20 14:33:40.393307	blurb_sign_up	1	t	2011-01-20 14:33:40.3932
5	Article::Cms	2011-01-20 14:33:40.430538	2011-01-20 14:33:40.463123	blurb_buyer_home	1	t	2011-01-20 14:33:40.463022
6	Article::Cms	2011-01-20 14:33:40.495246	2011-01-20 14:33:40.524337	blurb_agent_home	1	t	2011-01-20 14:33:40.524236
7	Article::Cms	2011-01-20 14:33:40.558659	2011-01-20 14:33:40.588745	blurb_purchase_manager_home	1	t	2011-01-20 14:33:40.588629
8	Article::Cms	2011-01-20 14:33:40.62429	2011-01-20 14:33:40.654148	blurb_start_page_role_selection	1	t	2011-01-20 14:33:40.65405
9	Article::Cms	2011-01-20 14:33:40.686239	2011-01-20 14:33:40.719488	blurb_currencies	1	t	2011-01-20 14:33:40.719355
10	Article::Cms	2011-01-20 14:33:40.761829	2011-01-20 14:33:40.794968	reset_password	2	t	2011-01-20 14:33:40.794865
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
1	Electronics	Ea aperiam maxime qui.Sunt natus hic et doloribus doloremque non cumque illum.	2011-01-20 14:33:38.817084	2011-01-20 14:33:38.817084	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Sunt perspiciatis quis aut delectus vero.Delectus veniam consequuntur illo.	2011-01-20 14:33:38.879253	2011-01-20 14:33:38.879253	\N	3	4	\N	0	2-leisure	f	0
3	Business	Voluptates aliquid possimus nihil.Assumenda tempora accusamus consequatur.	2011-01-20 14:33:38.927491	2011-01-20 14:33:39.71568	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Ea aperiam maxime qui.Sunt natus hic et doloribus doloremque non cumque illum.	Electronics	2011-01-20 14:33:38.827962	2011-01-20 14:33:38.827962
2	1	dk	\N	Electronics	2011-01-20 14:33:38.864224	2011-01-20 14:33:38.864224
3	2	en	Sunt perspiciatis quis aut delectus vero.Delectus veniam consequuntur illo.	Leisure	2011-01-20 14:33:38.884581	2011-01-20 14:33:38.884581
4	2	dk	\N	Leisure	2011-01-20 14:33:38.913039	2011-01-20 14:33:38.913039
5	3	en	Voluptates aliquid possimus nihil.Assumenda tempora accusamus consequatur.	Business	2011-01-20 14:33:38.932785	2011-01-20 14:33:38.932785
6	3	dk	\N	Business	2011-01-20 14:33:38.957566	2011-01-20 14:33:38.957566
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-20 14:33:38.23649	2011-01-20 14:33:38.23649
2	United Kingdom	2011-01-20 14:33:38.24761	2011-01-20 14:33:38.24761
3	Northern Ireland129553401899619	2011-01-20 14:33:38.997877	2011-01-20 14:33:38.997877
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
1	Euro	&euro;	%u%n	t	2011-01-20 14:33:38.77505	2011-01-20 14:33:38.77505
2	PLN	&pln;	%u%n	t	2011-01-20 14:33:38.783339	2011-01-20 14:33:38.783339
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-01-20 14:33:38.290208	2011-01-20 14:33:38.290208
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-01-20 14:33:38.316432	2011-01-20 14:33:38.316432
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-01-20 14:33:38.337214	2011-01-20 14:33:38.337214
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-01-20 14:33:38.357047	2011-01-20 14:33:38.357047
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-01-20 14:33:38.374914	2011-01-20 14:33:38.374914
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-01-20 14:33:38.394946	2011-01-20 14:33:38.394946
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-01-20 14:33:38.421083	2011-01-20 14:33:38.421083
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-01-20 14:33:38.439985	2011-01-20 14:33:38.439985
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-01-20 14:33:38.457513	2011-01-20 14:33:38.457513
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-01-20 14:33:38.475777	2011-01-20 14:33:38.475777
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-01-20 14:33:38.494241	2011-01-20 14:33:38.494241
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-01-20 14:33:38.511388	2011-01-20 14:33:38.511388
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-01-20 14:33:38.531407	2011-01-20 14:33:38.531407
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-01-20 14:33:38.551562	2011-01-20 14:33:38.551562
15	8	en	<p></p>	Question	2011-01-20 14:33:38.573561	2011-01-20 14:33:38.573561
16	8	dk	<p></p>	[DK] Question	2011-01-20 14:33:38.592171	2011-01-20 14:33:38.592171
17	9	en	<p></p>	Invoice	2011-01-20 14:33:38.610143	2011-01-20 14:33:38.610143
18	9	dk	<p></p>	[DK] Invoice	2011-01-20 14:33:38.629366	2011-01-20 14:33:38.629366
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-20 14:33:38.279346	2011-01-20 14:33:38.308647
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-20 14:33:38.331109	2011-01-20 14:33:38.349376
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-20 14:33:38.369439	2011-01-20 14:33:38.388046
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-20 14:33:38.411241	2011-01-20 14:33:38.434847
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-20 14:33:38.452086	2011-01-20 14:33:38.470777
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-20 14:33:38.48886	2011-01-20 14:33:38.506383
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-20 14:33:38.523861	2011-01-20 14:33:38.545826
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-20 14:33:38.567867	2011-01-20 14:33:38.587197
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-20 14:33:38.604535	2011-01-20 14:33:38.623654
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
1	1	dk	Big deal on printers	Et fugit delectus dolorum nemo.Ut quisquam quia voluptatibus.	Et ipsam et nobis.Nisi fugit veritatis voluptas quia et autem.	2011-01-20 14:33:39.150813	2011-01-20 14:33:39.150813
2	2	dk	Drills required	Optio ab nostrum distinctio odit molestias.At sequi autem magni ipsa excepturi consequatur.	Molestias tenetur debitis blanditiis amet.Nihil consectetur quod aliquid deleniti similique voluptatum velit aut.	2011-01-20 14:33:39.252131	2011-01-20 14:33:39.252131
3	3	dk	Need assistance in selling a car	Dolorem eaque ad et voluptate beatae aut.Itaque repudiandae est reiciendis magnam.	Quia et expedita consequatur possimus laudantium.Et consequatur ut libero et perferendis.	2011-01-20 14:33:39.358296	2011-01-20 14:33:39.358296
4	4	dk	Ipod shipment	Voluptas omnis voluptatem sit.Vitae nihil earum laboriosam nisi.	Molestias dolorum laborum ullam iusto ea voluptas.Voluptatibus tenetur id et doloremque porro fugiat.	2011-01-20 14:33:39.450733	2011-01-20 14:33:39.450733
5	5	dk	Trip to amazonia - looking for offer	Suscipit sed repudiandae quae officiis id laborum saepe unde.Asperiores assumenda modi veniam fuga tenetur.	Voluptas quam rerum porro reiciendis expedita ut earum.Repellat eum a reiciendis occaecati omnis beatae fugit.	2011-01-20 14:33:39.541779	2011-01-20 14:33:39.541779
6	6	dk	LCD - Huge amounts	Rerum voluptas consequuntur delectus et praesentium dignissimos est similique.Enim labore aliquam nihil cum ut.	Excepturi officiis aut est est expedita qui in velit.Necessitatibus iure quia aut dolore.	2011-01-20 14:33:39.633852	2011-01-20 14:33:39.633852
7	7	dk	GPS receivers required	Vitae et quis provident dolor et consequuntur.Doloremque cupiditate ducimus qui.	Eos corrupti asperiores est fugit eaque recusandae perferendis qui.Sunt sunt excepturi suscipit et asperiores.	2011-01-20 14:33:39.725177	2011-01-20 14:33:39.725177
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Et fugit delectus dolorum nemo.Ut quisquam quia voluptatibus.	Et ipsam et nobis.Nisi fugit veritatis voluptas quia et autem.	2	User::Agent	0	956.0	475.0	1	Kuhic	Lucienne Wilkinson	1-131-569-3043 x187	laila@boyerkling.biz	2011-01-20 14:33:39.092621	2011-01-20 14:33:39.092621	2011-01-25	Helen129553401899537 Cremin	1	t	\N	0	0	f	f	-1	1	2011-01-20 14:33:39.108043	\N	\N	40413 Roberts Greens	\N	\N	East Rolandoburgh	54451-6820	Fife
2	Drills required	3	Optio ab nostrum distinctio odit molestias.At sequi autem magni ipsa excepturi consequatur.	Molestias tenetur debitis blanditiis amet.Nihil consectetur quod aliquid deleniti similique voluptatum velit aut.	2	User::Agent	0	836.0	892.0	1	Stantonschroeder	Larry Rosenbaum	905-330-8444	shany.kuvalis@effertzhickle.co.uk	2011-01-20 14:33:39.209307	2011-01-20 14:33:39.209307	2011-01-25	Helen129553401899537 Cremin	1	t	\N	0	0	f	f	-1	1	2011-01-20 14:33:39.217756	\N	\N	9734 Jakubowski Point	\N	\N	Corrineshire	96068-1150	Devon
3	Need assistance in selling a car	3	Dolorem eaque ad et voluptate beatae aut.Itaque repudiandae est reiciendis magnam.	Quia et expedita consequatur possimus laudantium.Et consequatur ut libero et perferendis.	2	User::Agent	0	319.0	681.0	1	Kiehn	Diamond Olson	1-591-088-1064 x735	mohamed@corkery.biz	2011-01-20 14:33:39.312005	2011-01-20 14:33:39.312005	2011-01-25	Helen129553401899537 Cremin	1	t	\N	0	0	f	f	-1	1	2011-01-20 14:33:39.320115	\N	\N	71359 Nienow Rapids	\N	\N	Schummbury	31169	Gloucestershire
4	Ipod shipment	3	Voluptas omnis voluptatem sit.Vitae nihil earum laboriosam nisi.	Molestias dolorum laborum ullam iusto ea voluptas.Voluptatibus tenetur id et doloremque porro fugiat.	2	User::Agent	0	30.0	629.0	1	Mclaughlin	Alena Ritchie	1-849-556-2080 x3040	alexandrine_gleason@lind.ca	2011-01-20 14:33:39.408896	2011-01-20 14:33:39.408896	2011-01-25	Helen129553401899537 Cremin	1	t	\N	0	0	f	f	-1	1	2011-01-20 14:33:39.416932	\N	\N	1164 Hartmann Wells	\N	\N	Yundtburgh	42437	Cleveland
5	Trip to amazonia - looking for offer	3	Suscipit sed repudiandae quae officiis id laborum saepe unde.Asperiores assumenda modi veniam fuga tenetur.	Voluptas quam rerum porro reiciendis expedita ut earum.Repellat eum a reiciendis occaecati omnis beatae fugit.	2	User::Agent	0	56.0	132.0	1	Fay	Rachel Hand	186.859.4350 x03787	jaylin@hagenes.uk	2011-01-20 14:33:39.499172	2011-01-20 14:33:39.499172	2011-01-25	Helen129553401899537 Cremin	1	t	\N	0	0	f	f	-1	1	2011-01-20 14:33:39.50758	\N	\N	203 Kozey River	\N	\N	Lake Adellaland	80557	Norfolk
6	LCD - Huge amounts	3	Rerum voluptas consequuntur delectus et praesentium dignissimos est similique.Enim labore aliquam nihil cum ut.	Excepturi officiis aut est est expedita qui in velit.Necessitatibus iure quia aut dolore.	2	User::Agent	0	617.0	284.0	1	Jaskolski	Brennon Nader	328.114.9300 x1402	gerda@tillman.co.uk	2011-01-20 14:33:39.591514	2011-01-20 14:33:39.591514	2011-01-25	Helen129553401899537 Cremin	1	t	\N	0	0	f	f	-1	1	2011-01-20 14:33:39.599545	\N	\N	143 Gibson Haven	\N	\N	North Nameshire	33639-5128	Norfolk
7	GPS receivers required	3	Vitae et quis provident dolor et consequuntur.Doloremque cupiditate ducimus qui.	Eos corrupti asperiores est fugit eaque recusandae perferendis qui.Sunt sunt excepturi suscipit et asperiores.	2	User::Agent	0	408.0	210.0	1	Rutherford	Hermann Berge	027-383-5414 x12073	beth_mohr@kemmer.com	2011-01-20 14:33:39.683095	2011-01-20 14:33:39.683095	2011-01-25	Helen129553401899537 Cremin	1	t	\N	0	0	f	f	-1	1	2011-01-20 14:33:39.691073	\N	\N	745 Peyton Spring	\N	\N	Medhurstborough	36696-2494	Essex
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
1	default_payout_delay	--- 0\n	2011-01-20 14:33:38.137829	2011-01-20 14:33:38.137829
2	default_leads_per_page	--- 5\n	2011-01-20 14:33:38.146896	2011-01-20 14:33:38.146896
3	certification_level_1	--- 10\n	2011-01-20 14:33:38.15579	2011-01-20 14:33:38.15579
4	certification_level_2	--- 20\n	2011-01-20 14:33:38.164772	2011-01-20 14:33:38.164772
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-20 14:33:38.171143	2011-01-20 14:33:38.171143
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-20 14:33:38.176823	2011-01-20 14:33:38.176823
7	invoicing_seller_name	--- Fairleads\n	2011-01-20 14:33:38.183837	2011-01-20 14:33:38.183837
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-20 14:33:38.191799	2011-01-20 14:33:38.191799
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-20 14:33:38.200166	2011-01-20 14:33:38.200166
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-20 14:33:38.207471	2011-01-20 14:33:38.207471
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-20 14:33:38.215282	2011-01-20 14:33:38.215282
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers, vat_number, not_charge_vat) FROM stdin;
1	blazejek@gmail.com	cfc2c8c658dcc67cbdb46850deb29e7343ef6c9a68cee0fd85f4c5b87726a9c497ec7150a3eefcbf7b8f09421dcc7329da7b09b6d51afa0e5daf5e8b285b4dbe	hEG7KpvMPdpOvnylHBA4	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 14:33:38.757841	2011-01-20 14:33:38.67734	\N	2011-01-20 14:33:38.677638	2011-01-20 14:33:38.758272	1	Garrett	Wintheiser	131.510.4512 x4911	root	Haag Camp	Lawsonport	19076	Dyfed	1	\N	\N	\N	\N	0	\N	\N	\N	\N	OJwXdEiFuVzZwEAYeu8Q8wQivqYKMiTzFfk6V74qKJHbilNN1hAh7UK7G00kIr	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f
2	agent@nbs.com	6d1ba5bfe280147d47ec4e6c025aedbf53c748cf64d4766d07d862b82c291a0f157d0f73c2942fd3ec837315a65b12798d27b8acce08190122facdf80f567c6c	aUh51L4GQZKoUQZAejt8	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 14:33:39.038374	2011-01-20 14:33:39.009057	\N	2011-01-20 14:33:39.009338	2011-01-20 14:33:39.038843	2	Helen129553401899537	Cremin	1-191-674-1451	Dr. Raquel Cronin129553401899505	Brandy Roads	Lilyanmouth	70604	County Antrim	3	\N	0	\N	\N	0	\N	\N	\N	\N	iRb3Yngr2knRRCg2F3TCFI3YbFfLW3UWdD4F5JqtZa1JuIeGwZWm9NbIQzJ0s3	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f
3	admin@nbs.com	d5a2b9fdeacaec5f04c64f45d897dff2b348465c94dd3fc6feef0885152de377990629d7bb3a76ad36dd46da59be24a44cbaa741df7dc9c6648491797e51416a	8E4uIWiDmaryeEFOBb9k	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 14:33:39.82973	2011-01-20 14:33:39.80363	\N	2011-01-20 14:33:39.803912	2011-01-20 14:33:39.830202	1	Joelle	Welch	(569)003-2830 x39519	Vicky Bechtelar129553401979734	Zulauf Rue	New Nolahaven	53821-4699	Norfolk	1	\N	\N	\N	\N	0	\N	\N	\N	\N	wxQG79QQMata2beAuryLGv6obuJEU5CnwKdEzA8IIQI0jBDUtjNPHwfTeBxgpa	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f
4	buyer@nbs.com	432c6f31bd4d8e7f461a9d3c124ae5acb5f091bb6e59b624651babec306c3e87424f7208c20367e03a8286ebe0a01ca82d7de4aedb773fc74abe23d6e4a7b8cb	jzVeDw3IlMw2oWQ06Vvp	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 14:33:39.916923	2011-01-20 14:33:39.885947	\N	2011-01-20 14:33:39.886245	2011-01-20 14:33:39.917354	48	Leone	Nitzsche	(559)332-6764 x8665	Verna Boehm129553401987651	Willow Way	Crooksland	36442-0709	Strathclyde	1	\N	\N	\N	\N	0	\N	\N	\N	\N	E82tCt6rwsWXPPfkfYM238SGLdraEDECzUtMsbTAmirHXCvAomz4K8gPF6fdqz	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f
5	leaduser@nbs.com	943d3b9aa1c4aa5dd24fd26ccbdabec6850395e9bac1c2fb58c4974b8e35ced70304a67ed51a78d4d90be653ac617d9d44758a4691d66cc2d3e6f9eec5023464	3Whxwewblqt_P9y9IAIH	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-20 14:33:40.000579	2011-01-20 14:33:39.969902	\N	2011-01-20 14:33:39.970191	2011-01-20 14:33:40.031132	64	Casimer	Ritchie	448-828-3673 x972	Reynold Zulauf DVM129553401996356	Maudie Parkway	Weimanntown	26370-0557	Lancashire	1	\N	\N	4	\N	0	\N	\N	\N	\N	DhA5hypRp07WCr2cQwHFGXNYWCuxWX2x77rSr3eSb5Do3OmZ1eZJGMFl9Bd4BN	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

