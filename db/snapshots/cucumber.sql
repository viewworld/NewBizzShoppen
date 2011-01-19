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
1	1	dk	About us	About us	2011-01-19 15:09:41.626552	2011-01-19 15:09:41.626552
2	1	en	About us	About us	2011-01-19 15:09:41.640425	2011-01-19 15:09:41.640425
3	2	dk	Privacy	Privacy	2011-01-19 15:09:41.674325	2011-01-19 15:09:41.674325
4	2	en	Privacy	Privacy	2011-01-19 15:09:41.685831	2011-01-19 15:09:41.685831
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-19 15:09:41.716652	2011-01-19 15:09:41.716652
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-19 15:09:41.727917	2011-01-19 15:09:41.727917
7	4	dk	Blurb sign up	Blurb sign up	2011-01-19 15:09:41.755136	2011-01-19 15:09:41.755136
8	4	en	Blurb sign up	Blurb sign up	2011-01-19 15:09:41.769152	2011-01-19 15:09:41.769152
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-19 15:09:41.796784	2011-01-19 15:09:41.796784
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-19 15:09:41.80749	2011-01-19 15:09:41.80749
11	6	dk	Blurb agent home	Blurb agent home	2011-01-19 15:09:41.835607	2011-01-19 15:09:41.835607
12	6	en	Blurb agent home	Blurb agent home	2011-01-19 15:09:41.846933	2011-01-19 15:09:41.846933
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-19 15:09:41.881069	2011-01-19 15:09:41.881069
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-19 15:09:41.892506	2011-01-19 15:09:41.892506
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-19 15:09:42.073607	2011-01-19 15:09:42.073607
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-19 15:09:42.085511	2011-01-19 15:09:42.085511
17	9	dk	Blurb currencies	Blurb currencies	2011-01-19 15:09:42.112924	2011-01-19 15:09:42.112924
18	9	en	Blurb currencies	Blurb currencies	2011-01-19 15:09:42.124335	2011-01-19 15:09:42.124335
19	10	dk	Reset password	Reset password	2011-01-19 15:09:42.152262	2011-01-19 15:09:42.152262
20	10	en	Reset password	Reset password	2011-01-19 15:09:42.168355	2011-01-19 15:09:42.168355
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-19 15:09:41.618079	2011-01-19 15:09:41.643091	about_us	0	t	2011-01-19 15:09:41.643017
2	Article::Cms	2011-01-19 15:09:41.669338	2011-01-19 15:09:41.68872	privacy	0	t	2011-01-19 15:09:41.688639
3	Article::Cms	2011-01-19 15:09:41.712734	2011-01-19 15:09:41.730837	terms_conditions	0	t	2011-01-19 15:09:41.73076
4	Article::Cms	2011-01-19 15:09:41.751216	2011-01-19 15:09:41.771863	blurb_sign_up	1	t	2011-01-19 15:09:41.77179
5	Article::Cms	2011-01-19 15:09:41.792902	2011-01-19 15:09:41.810432	blurb_buyer_home	1	t	2011-01-19 15:09:41.810357
6	Article::Cms	2011-01-19 15:09:41.831589	2011-01-19 15:09:41.849853	blurb_agent_home	1	t	2011-01-19 15:09:41.849773
7	Article::Cms	2011-01-19 15:09:41.876722	2011-01-19 15:09:41.89527	blurb_purchase_manager_home	1	t	2011-01-19 15:09:41.895196
8	Article::Cms	2011-01-19 15:09:42.069545	2011-01-19 15:09:42.088449	blurb_start_page_role_selection	1	t	2011-01-19 15:09:42.088368
9	Article::Cms	2011-01-19 15:09:42.108934	2011-01-19 15:09:42.127083	blurb_currencies	1	t	2011-01-19 15:09:42.127005
10	Article::Cms	2011-01-19 15:09:42.148042	2011-01-19 15:09:42.171128	reset_password	2	t	2011-01-19 15:09:42.171054
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
1	Electronics	Accusamus eius et quia exercitationem et.Quos fuga nulla et repellat et dolores.	2011-01-19 15:09:40.216938	2011-01-19 15:09:40.216938	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Et esse repellendus sed impedit explicabo exercitationem doloremque.Placeat est et odio.	2011-01-19 15:09:40.259627	2011-01-19 15:09:40.259627	\N	3	4	\N	0	2-leisure	f	0
3	Business	Aut id quasi modi ipsam et eaque eius.Nam doloribus at ut.	2011-01-19 15:09:40.297727	2011-01-19 15:09:41.029435	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Accusamus eius et quia exercitationem et.Quos fuga nulla et repellat et dolores.	Electronics	2011-01-19 15:09:40.226041	2011-01-19 15:09:40.226041
2	1	dk	\N	Electronics	2011-01-19 15:09:40.250521	2011-01-19 15:09:40.250521
3	2	en	Et esse repellendus sed impedit explicabo exercitationem doloremque.Placeat est et odio.	Leisure	2011-01-19 15:09:40.269386	2011-01-19 15:09:40.269386
4	2	dk	\N	Leisure	2011-01-19 15:09:40.288538	2011-01-19 15:09:40.288538
5	3	en	Aut id quasi modi ipsam et eaque eius.Nam doloribus at ut.	Business	2011-01-19 15:09:40.301954	2011-01-19 15:09:40.301954
6	3	dk	\N	Business	2011-01-19 15:09:40.320499	2011-01-19 15:09:40.320499
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-19 15:09:39.67434	2011-01-19 15:09:39.67434
2	United Kingdom	2011-01-19 15:09:39.679431	2011-01-19 15:09:39.679431
3	England129544978034768	2011-01-19 15:09:40.34907	2011-01-19 15:09:40.34907
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
1	Euro	&euro;	%u%n	t	2011-01-19 15:09:40.049931	2011-01-19 15:09:40.049931
2	PLN	&pln;	%u%n	t	2011-01-19 15:09:40.053974	2011-01-19 15:09:40.053974
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-19 15:09:39.705611	2011-01-19 15:09:39.705611
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2011-01-19 15:09:39.720901	2011-01-19 15:09:39.720901
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-19 15:09:39.73371	2011-01-19 15:09:39.73371
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2011-01-19 15:09:39.746549	2011-01-19 15:09:39.746549
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-19 15:09:39.759565	2011-01-19 15:09:39.759565
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2011-01-19 15:09:39.775807	2011-01-19 15:09:39.775807
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2011-01-19 15:09:39.788326	2011-01-19 15:09:39.788326
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2011-01-19 15:09:39.800676	2011-01-19 15:09:39.800676
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-19 15:09:39.813649	2011-01-19 15:09:39.813649
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2011-01-19 15:09:39.826458	2011-01-19 15:09:39.826458
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-19 15:09:39.83996	2011-01-19 15:09:39.83996
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2011-01-19 15:09:39.852793	2011-01-19 15:09:39.852793
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-19 15:09:39.870822	2011-01-19 15:09:39.870822
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2011-01-19 15:09:39.884046	2011-01-19 15:09:39.884046
15	8	en	Question	<p></p>	2011-01-19 15:09:39.89756	2011-01-19 15:09:39.89756
16	8	dk	[DK] Question	<p></p>	2011-01-19 15:09:39.910922	2011-01-19 15:09:39.910922
17	9	en	Invoice	<p></p>	2011-01-19 15:09:39.924034	2011-01-19 15:09:39.924034
18	9	dk	[DK] Invoice	<p></p>	2011-01-19 15:09:39.938976	2011-01-19 15:09:39.938976
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-19 15:09:39.69672	2011-01-19 15:09:39.716428
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-19 15:09:39.729161	2011-01-19 15:09:39.742452
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-19 15:09:39.754677	2011-01-19 15:09:39.771487
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-19 15:09:39.783915	2011-01-19 15:09:39.79636
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-19 15:09:39.808986	2011-01-19 15:09:39.822186
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-19 15:09:39.834952	2011-01-19 15:09:39.848363
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-19 15:09:39.863187	2011-01-19 15:09:39.879675
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-19 15:09:39.89271	2011-01-19 15:09:39.906689
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-19 15:09:39.919515	2011-01-19 15:09:39.932346
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

COPY lead_translations (id, lead_id, locale, hidden_description, description, header, created_at, updated_at) FROM stdin;
1	1	dk	Sunt rem error saepe molestiae sit sint ab.Minima ex rerum ipsam eum nam.	Sed eum est autem quo a quo blanditiis praesentium.Eligendi eos et quis praesentium.	Big deal on printers	2011-01-19 15:09:40.458166	2011-01-19 15:09:40.458166
2	2	dk	Rerum inventore saepe consequuntur.Quidem minus fugiat adipisci eos aperiam non et quia.	Reiciendis nihil vel vitae consequuntur consequatur qui.Quo dolore ipsa sed sed vel voluptas.	Drills required	2011-01-19 15:09:40.537884	2011-01-19 15:09:40.537884
3	3	dk	Qui dolorem et quidem.Atque fuga cupiditate expedita provident at.	Voluptatem dolores tempora ea.Sed impedit aut deleniti aut earum quis.	Need assistance in selling a car	2011-01-19 15:09:40.751525	2011-01-19 15:09:40.751525
4	4	dk	Et debitis sint quo voluptates.Rerum corporis aliquid voluptatibus aut.	Quam nihil dolores veniam voluptas rem sequi.Eum quasi recusandae explicabo.	Ipod shipment	2011-01-19 15:09:40.824535	2011-01-19 15:09:40.824535
5	5	dk	Animi ut enim sint pariatur rerum porro iste.Rerum et distinctio occaecati.	Ducimus et omnis dolorem cumque quos.Aut iure quia non sit enim omnis voluptas quo.	Trip to amazonia - looking for offer	2011-01-19 15:09:40.893779	2011-01-19 15:09:40.893779
6	6	dk	Odit nemo impedit ad tempora voluptas ipsam sint est.Eaque dolorem exercitationem tempore dicta explicabo non cumque ut.	Magni aut est amet dolores iste.Ipsa voluptatibus voluptatem labore dolorem voluptas odit id officiis.	LCD - Huge amounts	2011-01-19 15:09:40.967016	2011-01-19 15:09:40.967016
7	7	dk	Veniam alias illum velit dolor beatae ab nam vel.Sunt saepe incidunt quis dolorem totam.	Sit tempore ut similique.Et cum ut voluptatem ea ut et.	GPS receivers required	2011-01-19 15:09:41.036533	2011-01-19 15:09:41.036533
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Sed eum est autem quo a quo blanditiis praesentium.Eligendi eos et quis praesentium.	Sunt rem error saepe molestiae sit sint ab.Minima ex rerum ipsam eum nam.	2	User::Agent	0	546.0	92.0	1	Wisozkbednar	Vada Schiller	475.062.3305 x391	amara@metzwindler.name	2011-01-19 15:09:40.414805	2011-01-19 15:09:40.414805	2011-01-24	Destinee129544978034688 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-19 15:09:40.424607	\N	\N	230 Rachelle Manor	\N	\N	Masonberg	22759	Cumbria
2	Drills required	3	Reiciendis nihil vel vitae consequuntur consequatur qui.Quo dolore ipsa sed sed vel voluptas.	Rerum inventore saepe consequuntur.Quidem minus fugiat adipisci eos aperiam non et quia.	2	User::Agent	0	399.0	933.0	1	Gutmannswaniawski	Mr. Katarina Dietrich	162-565-8975 x269	macie@gradypadberg.name	2011-01-19 15:09:40.506187	2011-01-19 15:09:40.506187	2011-01-24	Destinee129544978034688 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-19 15:09:40.512762	\N	\N	801 Nikolas Drive	\N	\N	Ritastad	35113-8115	Devon
3	Need assistance in selling a car	3	Voluptatem dolores tempora ea.Sed impedit aut deleniti aut earum quis.	Qui dolorem et quidem.Atque fuga cupiditate expedita provident at.	2	User::Agent	0	317.0	452.0	1	Runte	Ronaldo Sipes	1-224-498-4632	emiliano.hammes@eichmann.co.uk	2011-01-19 15:09:40.718931	2011-01-19 15:09:40.718931	2011-01-24	Destinee129544978034688 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-19 15:09:40.725727	\N	\N	5688 Elmo River	\N	\N	New Claude	10080-6356	Clwyd
4	Ipod shipment	3	Quam nihil dolores veniam voluptas rem sequi.Eum quasi recusandae explicabo.	Et debitis sint quo voluptates.Rerum corporis aliquid voluptatibus aut.	2	User::Agent	0	233.0	763.0	1	Prosacco	Loraine Schmeler	106.798.6236 x9091	christelle_kshlerin@lockman.com	2011-01-19 15:09:40.79186	2011-01-19 15:09:40.79186	2011-01-24	Destinee129544978034688 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-19 15:09:40.798575	\N	\N	6573 Maggio Loaf	\N	\N	Alexandreafurt	38704	Tayside
5	Trip to amazonia - looking for offer	3	Ducimus et omnis dolorem cumque quos.Aut iure quia non sit enim omnis voluptas quo.	Animi ut enim sint pariatur rerum porro iste.Rerum et distinctio occaecati.	2	User::Agent	0	215.0	942.0	1	Mrazgreen	Ole Weimann	(514)844-2236	cody.hoppe@thiel.name	2011-01-19 15:09:40.860022	2011-01-19 15:09:40.860022	2011-01-24	Destinee129544978034688 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-19 15:09:40.868021	\N	\N	90509 Georgianna Hill	\N	\N	Port Gregg	77398-1727	Leicestershire
6	LCD - Huge amounts	3	Magni aut est amet dolores iste.Ipsa voluptatibus voluptatem labore dolorem voluptas odit id officiis.	Odit nemo impedit ad tempora voluptas ipsam sint est.Eaque dolorem exercitationem tempore dicta explicabo non cumque ut.	2	User::Agent	0	922.0	492.0	1	Swaniawski	Dr. Golden Rempel	1-746-360-2656	demetris@kling.uk	2011-01-19 15:09:40.92901	2011-01-19 15:09:40.92901	2011-01-24	Destinee129544978034688 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-19 15:09:40.935611	\N	\N	0226 Bartell Harbor	\N	\N	New Mackenziebury	22303-2794	County Fermanagh
7	GPS receivers required	3	Sit tempore ut similique.Et cum ut voluptatem ea ut et.	Veniam alias illum velit dolor beatae ab nam vel.Sunt saepe incidunt quis dolorem totam.	2	User::Agent	0	476.0	779.0	1	Schummkuhn	Ruthie Johnson	556-403-2870 x0509	shyanne.willms@raukiehn.co.uk	2011-01-19 15:09:41.003085	2011-01-19 15:09:41.003085	2011-01-24	Destinee129544978034688 Hermann	1	t	\N	0	0	f	f	-1	1	2011-01-19 15:09:41.009703	\N	\N	2686 Schowalter Isle	\N	\N	East Vickiestad	51025-4251	Gwynedd County
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
1	default_payout_delay	--- 0\n	2011-01-19 15:09:39.487784	2011-01-19 15:09:39.487784
2	default_leads_per_page	--- 5\n	2011-01-19 15:09:39.49355	2011-01-19 15:09:39.49355
3	certification_level_1	--- 10\n	2011-01-19 15:09:39.497631	2011-01-19 15:09:39.497631
4	certification_level_2	--- 20\n	2011-01-19 15:09:39.500934	2011-01-19 15:09:39.500934
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-19 15:09:39.503501	2011-01-19 15:09:39.503501
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-19 15:09:39.646999	2011-01-19 15:09:39.646999
7	invoicing_seller_name	--- Fairleads\n	2011-01-19 15:09:39.649927	2011-01-19 15:09:39.649927
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-19 15:09:39.652295	2011-01-19 15:09:39.652295
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-19 15:09:39.654962	2011-01-19 15:09:39.654962
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-19 15:09:39.657264	2011-01-19 15:09:39.657264
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-19 15:09:39.659484	2011-01-19 15:09:39.659484
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
1	blazejek@gmail.com	cc1918145fdbfeb72f5e1ac016b557c2a77e810ded566fb0bcf2e2a5eef010d785eaa71d4c910739684cd0b8c30feebfdc28ab3a5a0d35f62f67eafc91f5062e	ffZtzfB_y61BM4XDBEdt	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 15:09:40.040221	2011-01-19 15:09:39.978053	\N	2011-01-19 15:09:39.978281	2011-01-19 15:09:40.040506	1	Ava	Romaguera	1-254-900-3950 x1310	root	Kassulke Center	Port Rosinafurt	95586-2072	Highlands and Islands	1	\N	\N	\N	\N	0	\N	\N	\N	\N	vZuhBibJm75SwJGVaWtqYOktzEEFKyVAPyWOWstl5jHmm2M0Ysjz9IgJqk1nI3	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	a01ca6afafa7d598c500354061256c7a62b3f625c35665bb82a62c063e59e64ce73ff981be42a50cc3ee8b76f5f9abb6896804c207f20e0cf8416b3995487996	hxz1xZesrwcESSrWQjwQ	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 15:09:40.379749	2011-01-19 15:09:40.354482	\N	2011-01-19 15:09:40.354693	2011-01-19 15:09:40.380099	2	Destinee129544978034688	Hermann	543-803-3343	Gregorio Streich DDS129544978034653	Colby Gateway	Averyton	20939-7116	Essex	3	\N	0	\N	\N	0	\N	\N	\N	\N	XnX6TdVr28kR64jZsivuGhmsrrKH63NSlmrTOUVEZCQkpQvomq4dYrkC5I09aL	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	0e4f78e5f4f036497720704f89bb8a901f6254c99b88ce0acaf64a5a0352a424ef788fc07c7cbb8f150e2e57f881750cc2ab1409f1c85e76e4738e4fba4f8ce7	TgZjxI1AKVLU30_lzGRC	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 15:09:41.26652	2011-01-19 15:09:41.2418	\N	2011-01-19 15:09:41.242019	2011-01-19 15:09:41.266799	1	Jadon	Wolff	1-274-096-7892 x975	Cassidy Windler PhD129544978123711	Cletus Ferry	Kierantown	83880	Cornwall	1	\N	\N	\N	\N	0	\N	\N	\N	\N	MxbHpDtmRHor0FgbDoT7I1doONchpkpteQyQ6WR4m3ZiX20M5eecGIm3ACbYR7	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	9700179ea5edda0e16986b11fc6c1446354315e21bf7113ea6fca80ead96a8a80191653c451e7df77d1015cab5301dd6a772b25691fbc4c45b02a374bb2970b8	XXqL63mDox0IP4NfSakN	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 15:09:41.323937	2011-01-19 15:09:41.301833	\N	2011-01-19 15:09:41.302066	2011-01-19 15:09:41.324226	48	Darian	Hagenes	203.558.9223	Lily Keeling129544978129695	Konopelski Estates	East Kelli	13020	Bedfordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	zm01WZ7R18SDHaqmWqPmcKbd0qaL8ImzFKNhJs9nrrEO57S3QWEHYvI6nLXc6n	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	8a01f24f8bbe5fa6e6b63a0bb44dc48b721a6490b29ce231c17eea630fcfdcf0da60f46aa7c352ef5041b6d9befd3af35b42093602886edd40a7a9d51725709c	n9TeFPJ3ehYFH4D-F3WU	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-19 15:09:41.381323	2011-01-19 15:09:41.357442	\N	2011-01-19 15:09:41.35766	2011-01-19 15:09:41.396144	64	Kaelyn	Walter	173-723-0978 x718	Clotilde Sauer129544978135265	Baumbach Green	Eichmannshire	66948-3424	County Fermanagh	1	\N	\N	4	\N	0	\N	\N	\N	\N	P1zEJ5uQYetv1n2CxBVU7VEohUWKL4LG2D1iU3Dfq2NfewaCRG9yzxhAhBt9bR	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

