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
1	1	dk	About us	About us	2011-01-12 08:59:44.779389	2011-01-12 08:59:44.779389
2	1	en	About us	About us	2011-01-12 08:59:44.799057	2011-01-12 08:59:44.799057
3	2	dk	Privacy	Privacy	2011-01-12 08:59:44.842859	2011-01-12 08:59:44.842859
4	2	en	Privacy	Privacy	2011-01-12 08:59:44.863275	2011-01-12 08:59:44.863275
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-12 08:59:44.906537	2011-01-12 08:59:44.906537
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-12 08:59:44.925878	2011-01-12 08:59:44.925878
7	4	dk	Blurb sign up	Blurb sign up	2011-01-12 08:59:44.978718	2011-01-12 08:59:44.978718
8	4	en	Blurb sign up	Blurb sign up	2011-01-12 08:59:44.997531	2011-01-12 08:59:44.997531
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-12 08:59:45.048794	2011-01-12 08:59:45.048794
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-12 08:59:45.066524	2011-01-12 08:59:45.066524
11	6	dk	Blurb agent home	Blurb agent home	2011-01-12 08:59:45.120248	2011-01-12 08:59:45.120248
12	6	en	Blurb agent home	Blurb agent home	2011-01-12 08:59:45.139514	2011-01-12 08:59:45.139514
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-12 08:59:45.181332	2011-01-12 08:59:45.181332
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-12 08:59:45.19906	2011-01-12 08:59:45.19906
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-12 08:59:45.239313	2011-01-12 08:59:45.239313
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-12 08:59:45.25546	2011-01-12 08:59:45.25546
17	9	dk	Blurb currencies	Blurb currencies	2011-01-12 08:59:45.2962	2011-01-12 08:59:45.2962
18	9	en	Blurb currencies	Blurb currencies	2011-01-12 08:59:45.314678	2011-01-12 08:59:45.314678
19	10	dk	Reset password	Reset password	2011-01-12 08:59:45.356686	2011-01-12 08:59:45.356686
20	10	en	Reset password	Reset password	2011-01-12 08:59:45.376961	2011-01-12 08:59:45.376961
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-12 08:59:44.769065	2011-01-12 08:59:44.804298	about_us	0	t	2011-01-12 08:59:44.804204
2	Article::Cms	2011-01-12 08:59:44.837845	2011-01-12 08:59:44.869158	privacy	0	t	2011-01-12 08:59:44.869062
3	Article::Cms	2011-01-12 08:59:44.901677	2011-01-12 08:59:44.932168	terms_conditions	0	t	2011-01-12 08:59:44.932062
4	Article::Cms	2011-01-12 08:59:44.973351	2011-01-12 08:59:45.004606	blurb_sign_up	1	t	2011-01-12 08:59:45.004457
5	Article::Cms	2011-01-12 08:59:45.04401	2011-01-12 08:59:45.071762	blurb_buyer_home	1	t	2011-01-12 08:59:45.071668
6	Article::Cms	2011-01-12 08:59:45.114493	2011-01-12 08:59:45.145459	blurb_agent_home	1	t	2011-01-12 08:59:45.145354
7	Article::Cms	2011-01-12 08:59:45.176552	2011-01-12 08:59:45.205327	blurb_purchase_manager_home	1	t	2011-01-12 08:59:45.205222
8	Article::Cms	2011-01-12 08:59:45.234574	2011-01-12 08:59:45.261447	blurb_start_page_role_selection	1	t	2011-01-12 08:59:45.261349
9	Article::Cms	2011-01-12 08:59:45.291208	2011-01-12 08:59:45.319989	blurb_currencies	1	t	2011-01-12 08:59:45.319896
10	Article::Cms	2011-01-12 08:59:45.351854	2011-01-12 08:59:45.383302	reset_password	2	t	2011-01-12 08:59:45.383205
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
1	Electronics	Cumque porro hic excepturi iusto ut nihil id blanditiis.Beatae magnam aut ex inventore eius esse.	2011-01-12 08:59:43.198133	2011-01-12 08:59:43.198133	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Dignissimos pariatur possimus quisquam ex consequatur itaque veritatis.Mollitia est animi repellat.	2011-01-12 08:59:43.25937	2011-01-12 08:59:43.25937	\N	3	4	\N	0	2-leisure	f	0
3	Business	Sapiente rerum distinctio amet ad.Quia eius eum sequi et illum molestiae et.	2011-01-12 08:59:43.338845	2011-01-12 08:59:44.367609	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Cumque porro hic excepturi iusto ut nihil id blanditiis.Beatae magnam aut ex inventore eius esse.	Electronics	2011-01-12 08:59:43.208995	2011-01-12 08:59:43.208995
2	1	dk	\N	Electronics	2011-01-12 08:59:43.243679	2011-01-12 08:59:43.243679
3	2	en	Dignissimos pariatur possimus quisquam ex consequatur itaque veritatis.Mollitia est animi repellat.	Leisure	2011-01-12 08:59:43.264706	2011-01-12 08:59:43.264706
4	2	dk	\N	Leisure	2011-01-12 08:59:43.311863	2011-01-12 08:59:43.311863
5	3	en	Sapiente rerum distinctio amet ad.Quia eius eum sequi et illum molestiae et.	Business	2011-01-12 08:59:43.346983	2011-01-12 08:59:43.346983
6	3	dk	\N	Business	2011-01-12 08:59:43.374812	2011-01-12 08:59:43.374812
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-12 08:59:42.154004	2011-01-12 08:59:42.154004
2	United Kingdom	2011-01-12 08:59:42.166946	2011-01-12 08:59:42.166946
3	Scotland129482278341511	2011-01-12 08:59:43.41709	2011-01-12 08:59:43.41709
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
1	Euro	&euro;	%u%n	t	2011-01-12 08:59:43.160707	2011-01-12 08:59:43.160707
2	PLN	&pln;	%u%n	t	2011-01-12 08:59:43.170453	2011-01-12 08:59:43.170453
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-01-12 08:59:42.22385	2011-01-12 08:59:42.22385
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-01-12 08:59:42.251569	2011-01-12 08:59:42.251569
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-01-12 08:59:42.271147	2011-01-12 08:59:42.271147
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-01-12 08:59:42.315564	2011-01-12 08:59:42.315564
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-01-12 08:59:42.33774	2011-01-12 08:59:42.33774
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-01-12 08:59:42.36136	2011-01-12 08:59:42.36136
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-01-12 08:59:42.388505	2011-01-12 08:59:42.388505
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-01-12 08:59:42.411126	2011-01-12 08:59:42.411126
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-01-12 08:59:42.433377	2011-01-12 08:59:42.433377
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-01-12 08:59:42.454984	2011-01-12 08:59:42.454984
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-01-12 08:59:42.474465	2011-01-12 08:59:42.474465
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-01-12 08:59:42.502198	2011-01-12 08:59:42.502198
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-01-12 08:59:42.523615	2011-01-12 08:59:42.523615
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-01-12 08:59:42.556928	2011-01-12 08:59:42.556928
15	8	en	<p></p>	Question	2011-01-12 08:59:42.581997	2011-01-12 08:59:42.581997
16	8	dk	<p></p>	[DK] Question	2011-01-12 08:59:42.606157	2011-01-12 08:59:42.606157
17	9	en	<p></p>	Invoice	2011-01-12 08:59:42.634505	2011-01-12 08:59:42.634505
18	9	dk	<p></p>	[DK] Invoice	2011-01-12 08:59:42.661057	2011-01-12 08:59:42.661057
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-12 08:59:42.210552	2011-01-12 08:59:42.2441
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-12 08:59:42.264491	2011-01-12 08:59:42.307495
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-12 08:59:42.330714	2011-01-12 08:59:42.354312
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-12 08:59:42.379098	2011-01-12 08:59:42.404337
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-12 08:59:42.425184	2011-01-12 08:59:42.447712
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-12 08:59:42.468098	2011-01-12 08:59:42.495218
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-12 08:59:42.516838	2011-01-12 08:59:42.538167
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-12 08:59:42.573409	2011-01-12 08:59:42.598972
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-12 08:59:42.626608	2011-01-12 08:59:42.652579
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

COPY lead_translations (id, lead_id, locale, header, description, hidden_description, created_at, updated_at) FROM stdin;
1	1	dk	Big deal on printers	Quia magni est dolorem sit vero cupiditate nostrum temporibus.Illum nisi expedita voluptatum quam nulla dolores id sed.	Et sint et doloremque et eligendi est rerum.At nihil officiis dolorum eius nostrum enim.	2011-01-12 08:59:43.574877	2011-01-12 08:59:43.574877
2	2	dk	Drills required	Sint delectus dolores temporibus dolorem inventore dolorum beatae.Vel et velit ut ut.	Itaque optio in et quis.Est et deserunt esse et veniam nostrum eveniet.	2011-01-12 08:59:43.674217	2011-01-12 08:59:43.674217
3	3	dk	Need assistance in selling a car	Nam ut voluptatem voluptas magni et aut incidunt et.Quisquam beatae temporibus enim commodi iusto consectetur dolores.	Totam aut accusamus est quod autem facilis doloribus cum.Sed consequatur ea et ipsam.	2011-01-12 08:59:43.770074	2011-01-12 08:59:43.770074
4	4	dk	Ipod shipment	Libero quisquam ea in dolores.Quo non porro velit cupiditate est consequatur consequatur ullam.	Qui aliquid molestiae asperiores rerum dignissimos.Modi vel dolore porro in eius quas.	2011-01-12 08:59:44.09352	2011-01-12 08:59:44.09352
5	5	dk	Trip to amazonia - looking for offer	Sunt qui minima error nam sed sit.Aperiam quos nobis repellendus.	Asperiores rerum ipsa vitae voluptates magnam ut qui.Omnis perferendis ad vero at ut molestiae delectus.	2011-01-12 08:59:44.188208	2011-01-12 08:59:44.188208
6	6	dk	LCD - Huge amounts	Voluptas aut error nesciunt perspiciatis.Quos enim omnis inventore sit est voluptatem neque.	Fugiat ut voluptatem voluptatum quia officia suscipit aut.Quas autem qui quia fuga dolorem laboriosam sunt eius.	2011-01-12 08:59:44.282283	2011-01-12 08:59:44.282283
7	7	dk	GPS receivers required	Nesciunt et molestiae praesentium provident fugit nobis quia omnis.Quia aut sapiente doloribus sit.	Aut necessitatibus debitis cum quisquam reiciendis quos minima omnis.Laborum aut aut maiores corrupti minima deserunt at eum.	2011-01-12 08:59:44.376714	2011-01-12 08:59:44.376714
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url) FROM stdin;
1	Big deal on printers	3	Quia magni est dolorem sit vero cupiditate nostrum temporibus.Illum nisi expedita voluptatum quam nulla dolores id sed.	Et sint et doloremque et eligendi est rerum.At nihil officiis dolorum eius nostrum enim.	2	User::Agent	0	820.0	856.0	1	Boyerjaskolski	Corbin Hayes	(258)735-7968	ayden.kling@zemlak.co.uk	14585 McDermott Falls	2011-01-12 08:59:43.523153	2011-01-12 08:59:43.523153	2011-01-17	Shaun129482278341429 Rath	1	t	\N	0	0	f	f	-1	1	2011-01-12 08:59:43.534146	\N	\N
2	Drills required	3	Sint delectus dolores temporibus dolorem inventore dolorum beatae.Vel et velit ut ut.	Itaque optio in et quis.Est et deserunt esse et veniam nostrum eveniet.	2	User::Agent	0	529.0	699.0	1	Nolan	Erica Funk	1-780-164-8464	erick.schoen@grimesbode.ca	27761 Huels Glen	2011-01-12 08:59:43.629687	2011-01-12 08:59:43.629687	2011-01-17	Shaun129482278341429 Rath	1	t	\N	0	0	f	f	-1	1	2011-01-12 08:59:43.637424	\N	\N
3	Need assistance in selling a car	3	Nam ut voluptatem voluptas magni et aut incidunt et.Quisquam beatae temporibus enim commodi iusto consectetur dolores.	Totam aut accusamus est quod autem facilis doloribus cum.Sed consequatur ea et ipsam.	2	User::Agent	0	81.0	45.0	1	Windler	Alisha Rau	899-569-5978 x389	marco@feeney.co.uk	13680 Reyes Mills	2011-01-12 08:59:43.724794	2011-01-12 08:59:43.724794	2011-01-17	Shaun129482278341429 Rath	1	t	\N	0	0	f	f	-1	1	2011-01-12 08:59:43.732897	\N	\N
4	Ipod shipment	3	Libero quisquam ea in dolores.Quo non porro velit cupiditate est consequatur consequatur ullam.	Qui aliquid molestiae asperiores rerum dignissimos.Modi vel dolore porro in eius quas.	2	User::Agent	0	548.0	902.0	1	Keeling	Shayne Schimmel	700.772.5566	howard.mcclure@tillman.co.uk	235 Janis Shoal	2011-01-12 08:59:44.049154	2011-01-12 08:59:44.049154	2011-01-17	Shaun129482278341429 Rath	1	t	\N	0	0	f	f	-1	1	2011-01-12 08:59:44.059561	\N	\N
5	Trip to amazonia - looking for offer	3	Sunt qui minima error nam sed sit.Aperiam quos nobis repellendus.	Asperiores rerum ipsa vitae voluptates magnam ut qui.Omnis perferendis ad vero at ut molestiae delectus.	2	User::Agent	0	739.0	724.0	1	Leuschke	Gerald Hermann	162-433-6664 x59181	ursula_medhurst@baumbach.uk	5682 Fay Dale	2011-01-12 08:59:44.145957	2011-01-12 08:59:44.145957	2011-01-17	Shaun129482278341429 Rath	1	t	\N	0	0	f	f	-1	1	2011-01-12 08:59:44.153795	\N	\N
6	LCD - Huge amounts	3	Voluptas aut error nesciunt perspiciatis.Quos enim omnis inventore sit est voluptatem neque.	Fugiat ut voluptatem voluptatum quia officia suscipit aut.Quas autem qui quia fuga dolorem laboriosam sunt eius.	2	User::Agent	0	226.0	748.0	1	Collins	Makenzie Hahn	1-681-799-3283 x8844	edwina@zieme.com	98544 Kayley Roads	2011-01-12 08:59:44.239443	2011-01-12 08:59:44.239443	2011-01-17	Shaun129482278341429 Rath	1	t	\N	0	0	f	f	-1	1	2011-01-12 08:59:44.247226	\N	\N
7	GPS receivers required	3	Nesciunt et molestiae praesentium provident fugit nobis quia omnis.Quia aut sapiente doloribus sit.	Aut necessitatibus debitis cum quisquam reiciendis quos minima omnis.Laborum aut aut maiores corrupti minima deserunt at eum.	2	User::Agent	0	972.0	451.0	1	Bode	Cleta Turner II	(448)498-3366	roman@klocko.biz	00427 Tromp Throughway	2011-01-12 08:59:44.335387	2011-01-12 08:59:44.335387	2011-01-17	Shaun129482278341429 Rath	1	t	\N	0	0	f	f	-1	1	2011-01-12 08:59:44.343048	\N	\N
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
1	default_payout_delay	--- 0\n	2011-01-12 08:59:41.738262	2011-01-12 08:59:41.738262
2	default_leads_per_page	--- 5\n	2011-01-12 08:59:42.063624	2011-01-12 08:59:42.063624
3	certification_level_1	--- 10\n	2011-01-12 08:59:42.074678	2011-01-12 08:59:42.074678
4	certification_level_2	--- 20\n	2011-01-12 08:59:42.084046	2011-01-12 08:59:42.084046
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-12 08:59:42.091983	2011-01-12 08:59:42.091983
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-12 08:59:42.099753	2011-01-12 08:59:42.099753
7	invoicing_seller_name	--- Fairleads\n	2011-01-12 08:59:42.10654	2011-01-12 08:59:42.10654
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-12 08:59:42.116023	2011-01-12 08:59:42.116023
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-12 08:59:42.125036	2011-01-12 08:59:42.125036
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-12 08:59:42.133238	2011-01-12 08:59:42.133238
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level) FROM stdin;
1	blazejek@gmail.com	8f2e772c9b00bc294e3823dbd41d5b60da6f23ca88c08c06d87a0722b0d408a57d7b2e4b44cb5966a6664e66b54ed815fa9a861fdca1c33df0ab22111474b054	DQpPLM4P-brAKex1F4jb	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-12 08:59:43.142953	2011-01-12 08:59:43.055419	\N	2011-01-12 08:59:43.055705	2011-01-12 08:59:43.143402	1	Beth	Okuneva	066-768-0936	root	Hills Springs	Wildermanview	71015	South Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	YOqFM3QHfwiKRcmhH8QKqYrm55SA7RLPhhJ3UBPAoRMoyDQSK04DcH6SC7NHc6	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
2	agent@nbs.com	84bb8c1167981f98e48b34c120267f4a2247415d1955849a589811d2c685f522a8e0dea677f3f01197c457d1af8e68fee8f274d72a84cbc674bc4728807b3243	uEu7LcPaUd6mON5Z8G74	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-12 08:59:43.462398	2011-01-12 08:59:43.428353	\N	2011-01-12 08:59:43.428658	2011-01-12 08:59:43.462816	2	Shaun129482278341429	Rath	102.666.9580 x91510	Kelsi Donnelly129482278341392	Breanne Springs	Humbertoland	59223-8029	Northumberland	3	\N	0	\N	\N	0	\N	\N	\N	\N	ahHDrvqWIDULQBi7TrLPTXyTFHoFUspn9VtKG3gWDg8bhyxYZSDzkOB0CXqp0E	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
3	admin@nbs.com	15d1d1e71a80d7b054827b541dc33c577c79e63c83a681b3ceb23327f405d68467195e4429bde85f606659155a710593b74f25075c1e83ad7d0179d1ec78937d	5G0S66DJAYH5UcFEt81Z	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-12 08:59:44.484252	2011-01-12 08:59:44.456608	\N	2011-01-12 08:59:44.45689	2011-01-12 08:59:44.484674	1	Maia	Kub	968.455.8161 x8645	Stanton Rodriguez129482278444996	Goodwin Point	South George	62232	Clwyd	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Wr9oJQoA8mpDB3xx9Fcr6qIK8zeRaysFBuCJEMiHnKr0DXNF4uJqjwCN1Bf2v1	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
4	buyer@nbs.com	f5e8d254f2510b9b1d2315ecc2ab3611eeed74a66e1adcb40d4d4262fd3dacc958f9b0a33d618955267ff1036a299dff3d9bb3cec7568d09da3a6a6f8ab07359	4XYREVnffo3n-1IXwt3p	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-12 08:59:44.563171	2011-01-12 08:59:44.532142	\N	2011-01-12 08:59:44.532428	2011-01-12 08:59:44.563645	48	Nola	Kozey	(715)353-2242 x163	Maya Weber129482278452583	Stoltenberg Haven	New Greggberg	47030	Powys	1	\N	\N	\N	\N	0	\N	\N	\N	\N	HRS41XaxI0ZQ86QamtkgIaocFwVCaTEb2wX4pKcXAMOnpdjUpjfRzN3AyOYhru	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
5	leaduser@nbs.com	22a8bb3c6685d7ba61ddbc7342ffca53fb3757bd9dbed8ee115ba21641435dafeb985ade65417b8d505cb2aa17dfb67ff45cbf9ddb5b5eba271ed3b8f88909f5	839VPIQap0dhVvsAKR6h	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-12 08:59:44.641983	2011-01-12 08:59:44.609149	\N	2011-01-12 08:59:44.609448	2011-01-12 08:59:44.666261	64	Carley	Grady	1-234-210-1104 x89931	Karen Haag129482278460296	Casper Prairie	Lylafurt	05481	West Sussex	1	\N	\N	4	\N	0	\N	\N	\N	\N	fgyrVgspDx3uOKDQG2WBAbp1OolRizhMTFIHtVIkJ1N3LoUZFSDxFETPIgvOvK	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

