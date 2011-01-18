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
1	1	dk	About us	About us	2011-01-18 08:34:56.402612	2011-01-18 08:34:56.402612
2	1	en	About us	About us	2011-01-18 08:34:56.423347	2011-01-18 08:34:56.423347
3	2	dk	Privacy	Privacy	2011-01-18 08:34:56.471081	2011-01-18 08:34:56.471081
4	2	en	Privacy	Privacy	2011-01-18 08:34:56.493213	2011-01-18 08:34:56.493213
5	3	dk	Terms & Conditions	Terms & Conditions	2011-01-18 08:34:56.539428	2011-01-18 08:34:56.539428
6	3	en	Terms & Conditions	Terms & Conditions	2011-01-18 08:34:56.557426	2011-01-18 08:34:56.557426
7	4	dk	Blurb sign up	Blurb sign up	2011-01-18 08:34:56.600264	2011-01-18 08:34:56.600264
8	4	en	Blurb sign up	Blurb sign up	2011-01-18 08:34:56.617135	2011-01-18 08:34:56.617135
9	5	dk	Blurb buyer home	Blurb buyer home	2011-01-18 08:34:56.657846	2011-01-18 08:34:56.657846
10	5	en	Blurb buyer home	Blurb buyer home	2011-01-18 08:34:56.673545	2011-01-18 08:34:56.673545
11	6	dk	Blurb agent home	Blurb agent home	2011-01-18 08:34:56.730516	2011-01-18 08:34:56.730516
12	6	en	Blurb agent home	Blurb agent home	2011-01-18 08:34:56.747861	2011-01-18 08:34:56.747861
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-01-18 08:34:56.80314	2011-01-18 08:34:56.80314
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-01-18 08:34:56.858836	2011-01-18 08:34:56.858836
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-01-18 08:34:56.928784	2011-01-18 08:34:56.928784
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-01-18 08:34:56.958538	2011-01-18 08:34:56.958538
17	9	dk	Blurb currencies	Blurb currencies	2011-01-18 08:34:57.032339	2011-01-18 08:34:57.032339
18	9	en	Blurb currencies	Blurb currencies	2011-01-18 08:34:57.076889	2011-01-18 08:34:57.076889
19	10	dk	Reset password	Reset password	2011-01-18 08:34:57.163978	2011-01-18 08:34:57.163978
20	10	en	Reset password	Reset password	2011-01-18 08:34:57.199921	2011-01-18 08:34:57.199921
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-01-18 08:34:56.391884	2011-01-18 08:34:56.429929	about_us	0	t	2011-01-18 08:34:56.429828
2	Article::Cms	2011-01-18 08:34:56.465349	2011-01-18 08:34:56.499676	privacy	0	t	2011-01-18 08:34:56.499579
3	Article::Cms	2011-01-18 08:34:56.534465	2011-01-18 08:34:56.563826	terms_conditions	0	t	2011-01-18 08:34:56.563724
4	Article::Cms	2011-01-18 08:34:56.59546	2011-01-18 08:34:56.623002	blurb_sign_up	1	t	2011-01-18 08:34:56.622904
5	Article::Cms	2011-01-18 08:34:56.652803	2011-01-18 08:34:56.678761	blurb_buyer_home	1	t	2011-01-18 08:34:56.678664
6	Article::Cms	2011-01-18 08:34:56.722623	2011-01-18 08:34:56.753083	blurb_agent_home	1	t	2011-01-18 08:34:56.752972
7	Article::Cms	2011-01-18 08:34:56.796947	2011-01-18 08:34:56.878523	blurb_purchase_manager_home	1	t	2011-01-18 08:34:56.878416
8	Article::Cms	2011-01-18 08:34:56.911806	2011-01-18 08:34:56.975811	blurb_start_page_role_selection	1	t	2011-01-18 08:34:56.975686
9	Article::Cms	2011-01-18 08:34:57.026673	2011-01-18 08:34:57.082986	blurb_currencies	1	t	2011-01-18 08:34:57.082864
10	Article::Cms	2011-01-18 08:34:57.158028	2011-01-18 08:34:57.214	reset_password	2	t	2011-01-18 08:34:57.213884
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
1	Electronics	Praesentium omnis laboriosam et debitis fugiat.Quo consequatur eligendi dolore quis sapiente nostrum labore hic.	2011-01-18 08:34:54.956991	2011-01-18 08:34:54.956991	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Quia hic a vero dolores.Soluta commodi officia assumenda corporis ut.	2011-01-18 08:34:55.019841	2011-01-18 08:34:55.019841	\N	3	4	\N	0	2-leisure	f	0
3	Business	Est sed modi dolore.Odit ea a sequi officia nostrum porro.	2011-01-18 08:34:55.068238	2011-01-18 08:34:55.935117	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Praesentium omnis laboriosam et debitis fugiat.Quo consequatur eligendi dolore quis sapiente nostrum labore hic.	Electronics	2011-01-18 08:34:54.967774	2011-01-18 08:34:54.967774
2	1	dk	\N	Electronics	2011-01-18 08:34:55.002302	2011-01-18 08:34:55.002302
3	2	en	Quia hic a vero dolores.Soluta commodi officia assumenda corporis ut.	Leisure	2011-01-18 08:34:55.025201	2011-01-18 08:34:55.025201
4	2	dk	\N	Leisure	2011-01-18 08:34:55.053054	2011-01-18 08:34:55.053054
5	3	en	Est sed modi dolore.Odit ea a sequi officia nostrum porro.	Business	2011-01-18 08:34:55.077415	2011-01-18 08:34:55.077415
6	3	dk	\N	Business	2011-01-18 08:34:55.112057	2011-01-18 08:34:55.112057
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-01-18 08:34:54.031128	2011-01-18 08:34:54.031128
2	United Kingdom	2011-01-18 08:34:54.042148	2011-01-18 08:34:54.042148
3	Scotland12953396951504	2011-01-18 08:34:55.151977	2011-01-18 08:34:55.151977
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
1	Euro	&euro;	%u%n	t	2011-01-18 08:34:54.920293	2011-01-18 08:34:54.920293
2	PLN	&pln;	%u%n	t	2011-01-18 08:34:54.928273	2011-01-18 08:34:54.928273
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-01-18 08:34:54.094417	2011-01-18 08:34:54.094417
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-01-18 08:34:54.122991	2011-01-18 08:34:54.122991
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-01-18 08:34:54.144519	2011-01-18 08:34:54.144519
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-01-18 08:34:54.162524	2011-01-18 08:34:54.162524
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-01-18 08:34:54.182032	2011-01-18 08:34:54.182032
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-01-18 08:34:54.200807	2011-01-18 08:34:54.200807
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-01-18 08:34:54.227607	2011-01-18 08:34:54.227607
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-01-18 08:34:54.252276	2011-01-18 08:34:54.252276
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-01-18 08:34:54.273942	2011-01-18 08:34:54.273942
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-01-18 08:34:54.292382	2011-01-18 08:34:54.292382
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-01-18 08:34:54.311449	2011-01-18 08:34:54.311449
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-01-18 08:34:54.330084	2011-01-18 08:34:54.330084
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-01-18 08:34:54.350281	2011-01-18 08:34:54.350281
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-01-18 08:34:54.371341	2011-01-18 08:34:54.371341
15	8	en	<p></p>	Question	2011-01-18 08:34:54.39147	2011-01-18 08:34:54.39147
16	8	dk	<p></p>	[DK] Question	2011-01-18 08:34:54.41479	2011-01-18 08:34:54.41479
17	9	en	<p></p>	Invoice	2011-01-18 08:34:54.4363	2011-01-18 08:34:54.4363
18	9	dk	<p></p>	[DK] Invoice	2011-01-18 08:34:54.456578	2011-01-18 08:34:54.456578
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-01-18 08:34:54.080106	2011-01-18 08:34:54.115745
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-01-18 08:34:54.138178	2011-01-18 08:34:54.157223
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-01-18 08:34:54.17642	2011-01-18 08:34:54.195559
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-01-18 08:34:54.221692	2011-01-18 08:34:54.246956
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-01-18 08:34:54.265693	2011-01-18 08:34:54.287085
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-01-18 08:34:54.305741	2011-01-18 08:34:54.324557
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-01-18 08:34:54.34463	2011-01-18 08:34:54.366088
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-01-18 08:34:54.385891	2011-01-18 08:34:54.405137
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-01-18 08:34:54.429165	2011-01-18 08:34:54.450625
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
1	1	dk	Big deal on printers	Veritatis et expedita ut delectus.Quibusdam pariatur minima reprehenderit ab illo.	Perspiciatis molestiae magnam praesentium dolores nemo dolor quibusdam.Fuga dolores sit nemo reprehenderit adipisci sed aliquid.	2011-01-18 08:34:55.305324	2011-01-18 08:34:55.305324
2	2	dk	Drills required	In dolores distinctio quo rem et ducimus.Consectetur quis maxime magni itaque magnam nesciunt perferendis.	Voluptatum quaerat quia adipisci rem.Debitis vero delectus recusandae molestias non dolorem.	2011-01-18 08:34:55.406891	2011-01-18 08:34:55.406891
3	3	dk	Need assistance in selling a car	Necessitatibus dolorem quo ea architecto ea reiciendis.Non nihil commodi expedita unde et occaecati rerum.	Eius debitis quisquam reprehenderit alias modi qui.Est ex nobis et et.	2011-01-18 08:34:55.509097	2011-01-18 08:34:55.509097
4	4	dk	Ipod shipment	Qui est debitis alias commodi repudiandae officia perspiciatis quos.Ut autem accusamus consequuntur reiciendis eos qui sequi est.	Magni quidem est qui placeat non.Est tenetur quo dolorum.	2011-01-18 08:34:55.621936	2011-01-18 08:34:55.621936
5	5	dk	Trip to amazonia - looking for offer	Id fugit perferendis cumque.Aut sit odio nostrum aperiam provident dolorem.	Cumque nesciunt molestiae voluptatem iste et quia officia.Omnis quis sapiente voluptates.	2011-01-18 08:34:55.740964	2011-01-18 08:34:55.740964
6	6	dk	LCD - Huge amounts	Voluptate facilis cum voluptatem enim incidunt.Perspiciatis qui enim consectetur facere blanditiis non error ea.	At iure accusamus ullam ea aliquam sint quas.Corrupti consequatur et esse est sunt consequuntur amet doloremque.	2011-01-18 08:34:55.84066	2011-01-18 08:34:55.84066
7	7	dk	GPS receivers required	Vero voluptas vel culpa in magnam harum explicabo quas.Voluptas sint et accusantium odit beatae quaerat.	Dolore quisquam deleniti ea cum.Deleniti optio repudiandae in sequi non ipsam commodi quia.	2011-01-18 08:34:55.945504	2011-01-18 08:34:55.945504
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Perspiciatis molestiae magnam praesentium dolores nemo dolor quibusdam.Fuga dolores sit nemo reprehenderit adipisci sed aliquid.	Veritatis et expedita ut delectus.Quibusdam pariatur minima reprehenderit ab illo.	2	User::Agent	0	492.0	606.0	1	Lehner	Russell Monahan	357.882.3902 x13797	elmira.koch@boyle.biz	2011-01-18 08:34:55.252286	2011-01-18 08:34:55.252286	2011-01-23	Myah129533969514952 Olson	1	t	\N	0	0	f	f	-1	1	2011-01-18 08:34:55.264912	\N	\N	3380 Gina Prairie	\N	\N	Port Blancachester	43876	Buckinghamshire
2	Drills required	3	Voluptatum quaerat quia adipisci rem.Debitis vero delectus recusandae molestias non dolorem.	In dolores distinctio quo rem et ducimus.Consectetur quis maxime magni itaque magnam nesciunt perferendis.	2	User::Agent	0	717.0	467.0	1	Haleyhayes	Karelle Tromp	353.678.8313 x224	reina@buckridge.uk	2011-01-18 08:34:55.359548	2011-01-18 08:34:55.359548	2011-01-23	Myah129533969514952 Olson	1	t	\N	0	0	f	f	-1	1	2011-01-18 08:34:55.369407	\N	\N	626 Isom Route	\N	\N	South Jayden	34147	Powys
3	Need assistance in selling a car	3	Eius debitis quisquam reprehenderit alias modi qui.Est ex nobis et et.	Necessitatibus dolorem quo ea architecto ea reiciendis.Non nihil commodi expedita unde et occaecati rerum.	2	User::Agent	0	85.0	43.0	1	Gusikowski	Ms. Jeremy Tillman	(795)462-0824 x8216	dessie.torp@kertzmann.co.uk	2011-01-18 08:34:55.46261	2011-01-18 08:34:55.46261	2011-01-23	Myah129533969514952 Olson	1	t	\N	0	0	f	f	-1	1	2011-01-18 08:34:55.470923	\N	\N	700 Allene Skyway	\N	\N	Lake Gussie	24265	South Yorkshire
4	Ipod shipment	3	Magni quidem est qui placeat non.Est tenetur quo dolorum.	Qui est debitis alias commodi repudiandae officia perspiciatis quos.Ut autem accusamus consequuntur reiciendis eos qui sequi est.	2	User::Agent	0	905.0	148.0	1	Windler	Percy Huel	208-652-2170 x98326	aisha_fritsch@keeling.co.uk	2011-01-18 08:34:55.573546	2011-01-18 08:34:55.573546	2011-01-23	Myah129533969514952 Olson	1	t	\N	0	0	f	f	-1	1	2011-01-18 08:34:55.58229	\N	\N	351 Tommie Cliffs	\N	\N	South Bretchester	03629-7505	Highlands and Islands
5	Trip to amazonia - looking for offer	3	Cumque nesciunt molestiae voluptatem iste et quia officia.Omnis quis sapiente voluptates.	Id fugit perferendis cumque.Aut sit odio nostrum aperiam provident dolorem.	2	User::Agent	0	292.0	808.0	1	Gibson	Jennifer Schultz Jr.	417-869-4295 x93415	marcella@leannonsimonis.uk	2011-01-18 08:34:55.685691	2011-01-18 08:34:55.685691	2011-01-23	Myah129533969514952 Olson	1	t	\N	0	0	f	f	-1	1	2011-01-18 08:34:55.69481	\N	\N	918 Hartmann Summit	\N	\N	Hilllton	13428-2528	Lincolnshire
6	LCD - Huge amounts	3	At iure accusamus ullam ea aliquam sint quas.Corrupti consequatur et esse est sunt consequuntur amet doloremque.	Voluptate facilis cum voluptatem enim incidunt.Perspiciatis qui enim consectetur facere blanditiis non error ea.	2	User::Agent	0	96.0	276.0	1	Grimes	Derick Corwin	986-696-4602	mattie@paucek.name	2011-01-18 08:34:55.792951	2011-01-18 08:34:55.792951	2011-01-23	Myah129533969514952 Olson	1	t	\N	0	0	f	f	-1	1	2011-01-18 08:34:55.801804	\N	\N	336 Christian Station	\N	\N	North Hunter	69997	Grampian
7	GPS receivers required	3	Dolore quisquam deleniti ea cum.Deleniti optio repudiandae in sequi non ipsam commodi quia.	Vero voluptas vel culpa in magnam harum explicabo quas.Voluptas sint et accusantium odit beatae quaerat.	2	User::Agent	0	96.0	6.0	1	Hageneslakin	Miss Chelsey Marvin	(437)049-2403 x9958	anna@maggiohowell.uk	2011-01-18 08:34:55.896837	2011-01-18 08:34:55.896837	2011-01-23	Myah129533969514952 Olson	1	t	\N	0	0	f	f	-1	1	2011-01-18 08:34:55.908905	\N	\N	263 Janelle Plaza	\N	\N	Marciaville	35235-1887	Isle of Wight
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
1	default_payout_delay	--- 0\n	2011-01-18 08:34:53.701956	2011-01-18 08:34:53.701956
2	default_leads_per_page	--- 5\n	2011-01-18 08:34:53.714997	2011-01-18 08:34:53.714997
3	certification_level_1	--- 10\n	2011-01-18 08:34:53.727452	2011-01-18 08:34:53.727452
4	certification_level_2	--- 20\n	2011-01-18 08:34:53.738154	2011-01-18 08:34:53.738154
5	contact_us_email	--- contact@nbs.fake.com\n	2011-01-18 08:34:53.7471	2011-01-18 08:34:53.7471
6	invoicing_default_payment_deadline_date	--- 14\n	2011-01-18 08:34:53.755206	2011-01-18 08:34:53.755206
7	invoicing_seller_name	--- Fairleads\n	2011-01-18 08:34:53.76411	2011-01-18 08:34:53.76411
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-01-18 08:34:53.772886	2011-01-18 08:34:53.772886
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-01-18 08:34:53.781888	2011-01-18 08:34:53.781888
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2011-01-18 08:34:53.7924	2011-01-18 08:34:53.7924
11	invoicing_default_vat_rate	--- 0.15\n	2011-01-18 08:34:53.800603	2011-01-18 08:34:53.800603
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
1	blazejek@gmail.com	0135486fa0223f9c33f7512c35ba0594914f06b4d1fc42d3df69b23fe5ec657cc78c5156980da3a2475de4a2311021a1c57a9441186ba44041f9721c9126b558	cNucF8YJF7_oogjQ1squ	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-18 08:34:54.896065	2011-01-18 08:34:54.782993	\N	2011-01-18 08:34:54.78328	2011-01-18 08:34:54.896756	1	Cydney	Morissette	150.924.9621 x9080	root	Eden Points	Derekberg	79475	Tayside	1	\N	\N	\N	\N	0	\N	\N	\N	\N	wzxRqadFYnG9CyWD4ZeTY8qZ4DAiCyOoifA1d5YfKWMNqfNQ8MrjURn7Wy2vQu	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
2	agent@nbs.com	f94602221ed200c948a9e41f69f1d7a7bf5f0ba10d178d6545f09debfd4238a3b45be6c57e1d1e7bf82dd2d255e2c8c636637c753fe15efaa343073ae0598d5e	ONBJtaWm8OzLhGs9WqYe	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-18 08:34:55.191061	2011-01-18 08:34:55.16198	\N	2011-01-18 08:34:55.162254	2011-01-18 08:34:55.191479	2	Myah129533969514952	Olson	(009)237-1976 x82072	Mrs. Maverick Lehner129533969514929	Bernhard Brooks	Port Dougton	38985-0446	Bedfordshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	da1wI6SsnWiX6SVRDoZ2VaGkhBPOdvohpTNkC2WTM7XZZoFcsoSJRzkkpYTCZr	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
3	admin@nbs.com	3b7637c098d1ea39053f84843f04306c824ba4bb60ea274c9b6e3342997fcbac924c4c958a0613ad13b95163ba31341ee8b3a247f4b8ee23dd36b4e2152a23af	svqP8GeLTwrWmCQKnl9h	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-18 08:34:56.062883	2011-01-18 08:34:56.035498	\N	2011-01-18 08:34:56.035824	2011-01-18 08:34:56.063476	1	Elisha	Dooley	895-037-1732	Lula Zulauf129533969602891	Melyna Road	Harryview	05648	Central	1	\N	\N	\N	\N	0	\N	\N	\N	\N	blIq7DF23qrI2M8A0MZsXmOitaNWE5Rf38uzcb38fatKsRdBkbJM3miBwGaKaz	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
4	buyer@nbs.com	b009ba1763c6dcc0f812920dab3b292ebed02d8dc44445629e9bb4e58c1a3e178363a6d56932bf2d5a4aa53427efb481e2dab8aac46ce64743c9a097f2836419	Z06YteEZf5pF4QX6sCXU	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-18 08:34:56.152111	2011-01-18 08:34:56.119861	\N	2011-01-18 08:34:56.120167	2011-01-18 08:34:56.152579	48	Nickolas	Ernser	1-960-088-6348 x527	Darlene Okuneva129533969611268	Thora Wall	Goodwinfort	20287	West Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	KsNwsPYvhIE3fUG1HIX0dEUJQy0slKu6NECOwZz8amohvwYVfAOcrICa97cHv1	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
5	leaduser@nbs.com	b9d8a670d97875013e9ed4bde2a1562bbf350c6fafb51d7cc0cdd2bc32657fb2fd7108bb32c58245e91f172e022f3deba42302e297ceabbc6dfb95ebe6dd4dbc	mxSE8ybnZUAZaNqo4BEx	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-01-18 08:34:56.240474	2011-01-18 08:34:56.201733	\N	2011-01-18 08:34:56.202021	2011-01-18 08:34:56.26391	64	Hershel	Towne	202.617.1931 x1239	Jules Pfeffer12953396961928	Annabel Trafficway	New Tillmantown	32745-0612	Lincolnshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	FCBzzDUWWLh3E2lwmp4tgVibDE2zaXaWiMagPxC4gdK64tqiNz30qhKlyywbe8	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f
\.


--
-- PostgreSQL database dump complete
--

