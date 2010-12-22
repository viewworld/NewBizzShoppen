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
1	1	dk	About us	About us	2010-12-22 10:26:39.719059	2010-12-22 10:26:39.719059
2	1	en	About us	About us	2010-12-22 10:26:39.733775	2010-12-22 10:26:39.733775
3	2	dk	Privacy	Privacy	2010-12-22 10:26:39.886895	2010-12-22 10:26:39.886895
4	2	en	Privacy	Privacy	2010-12-22 10:26:39.899271	2010-12-22 10:26:39.899271
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-22 10:26:39.929554	2010-12-22 10:26:39.929554
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-22 10:26:39.941595	2010-12-22 10:26:39.941595
7	4	dk	Blurb sign up	Blurb sign up	2010-12-22 10:26:39.969123	2010-12-22 10:26:39.969123
8	4	en	Blurb sign up	Blurb sign up	2010-12-22 10:26:39.981573	2010-12-22 10:26:39.981573
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-22 10:26:40.010507	2010-12-22 10:26:40.010507
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-22 10:26:40.023344	2010-12-22 10:26:40.023344
11	6	dk	Blurb agent home	Blurb agent home	2010-12-22 10:26:40.051487	2010-12-22 10:26:40.051487
12	6	en	Blurb agent home	Blurb agent home	2010-12-22 10:26:40.064204	2010-12-22 10:26:40.064204
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-22 10:26:40.092856	2010-12-22 10:26:40.092856
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-22 10:26:40.10694	2010-12-22 10:26:40.10694
15	8	dk	Blurb currencies	Blurb currencies	2010-12-22 10:26:40.135671	2010-12-22 10:26:40.135671
16	8	en	Blurb currencies	Blurb currencies	2010-12-22 10:26:40.148283	2010-12-22 10:26:40.148283
17	9	dk	Reset password	Reset password	2010-12-22 10:26:40.176597	2010-12-22 10:26:40.176597
18	9	en	Reset password	Reset password	2010-12-22 10:26:40.189184	2010-12-22 10:26:40.189184
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-22 10:26:39.710792	2010-12-22 10:26:39.736791	about_us	0	t	2010-12-22 10:26:39.736715
2	Article::Cms	2010-12-22 10:26:39.760109	2010-12-22 10:26:39.902313	privacy	0	t	2010-12-22 10:26:39.902234
3	Article::Cms	2010-12-22 10:26:39.92568	2010-12-22 10:26:39.944614	terms_conditions	0	t	2010-12-22 10:26:39.944534
4	Article::Cms	2010-12-22 10:26:39.96487	2010-12-22 10:26:39.984593	blurb_sign_up	1	t	2010-12-22 10:26:39.984517
5	Article::Cms	2010-12-22 10:26:40.006036	2010-12-22 10:26:40.026613	blurb_buyer_home	1	t	2010-12-22 10:26:40.026431
6	Article::Cms	2010-12-22 10:26:40.047566	2010-12-22 10:26:40.067629	blurb_agent_home	1	t	2010-12-22 10:26:40.067543
7	Article::Cms	2010-12-22 10:26:40.088699	2010-12-22 10:26:40.110943	blurb_start_page_role_selection	1	t	2010-12-22 10:26:40.110854
8	Article::Cms	2010-12-22 10:26:40.131742	2010-12-22 10:26:40.151365	blurb_currencies	1	t	2010-12-22 10:26:40.151287
9	Article::Cms	2010-12-22 10:26:40.172551	2010-12-22 10:26:40.192582	reset_password	2	t	2010-12-22 10:26:40.192498
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
1	Electronics	Qui autem impedit qui aliquam asperiores.Rem magnam voluptatibus enim quam veritatis eveniet.	2010-12-22 10:26:38.371197	2010-12-22 10:26:38.371197	\N	1	2	\N	0	1-electronics	0	f
2	Leisure	Ducimus voluptas enim consequatur quod ea amet.Minima repellendus autem sequi qui eius alias.	2010-12-22 10:26:38.415599	2010-12-22 10:26:38.415599	\N	3	4	\N	0	2-leisure	0	f
3	Business	Dolor in optio dolores quos sint maiores vel.Reiciendis facilis quibusdam eaque voluptatem neque mollitia inventore.	2010-12-22 10:26:38.448694	2010-12-22 10:26:39.275907	\N	5	6	\N	7	3-business	7	f
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
1	1	en	Qui autem impedit qui aliquam asperiores.Rem magnam voluptatibus enim quam veritatis eveniet.	Electronics	2010-12-22 10:26:38.380676	2010-12-22 10:26:38.380676
2	1	dk	\N	Electronics	2010-12-22 10:26:38.405993	2010-12-22 10:26:38.405993
3	2	en	Ducimus voluptas enim consequatur quod ea amet.Minima repellendus autem sequi qui eius alias.	Leisure	2010-12-22 10:26:38.419913	2010-12-22 10:26:38.419913
4	2	dk	\N	Leisure	2010-12-22 10:26:38.43891	2010-12-22 10:26:38.43891
5	3	en	Dolor in optio dolores quos sint maiores vel.Reiciendis facilis quibusdam eaque voluptatem neque mollitia inventore.	Business	2010-12-22 10:26:38.453353	2010-12-22 10:26:38.453353
6	3	dk	\N	Business	2010-12-22 10:26:38.596538	2010-12-22 10:26:38.596538
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-22 10:26:37.872393	2010-12-22 10:26:37.872393
2	United Kingdom	2010-12-22 10:26:37.877025	2010-12-22 10:26:37.877025
3	Northern Ireland129301359862273	2010-12-22 10:26:38.624055	2010-12-22 10:26:38.624055
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
1	ut	&pound;	%u%n	t	2010-12-22 10:26:38.685805	2010-12-22 10:26:38.685805
2	magni	&euro;	%u%n	t	2010-12-22 10:26:38.766957	2010-12-22 10:26:38.766957
3	maxime	&euro;	%u%n	t	2010-12-22 10:26:38.834896	2010-12-22 10:26:38.834896
4	voluptate	&pound;	%u%n	t	2010-12-22 10:26:38.904325	2010-12-22 10:26:38.904325
5	animi	&euro;	%u%n	t	2010-12-22 10:26:39.110055	2010-12-22 10:26:39.110055
6	ex	&pound;	%u%n	t	2010-12-22 10:26:39.179229	2010-12-22 10:26:39.179229
7	quae	$	%u%n	t	2010-12-22 10:26:39.246234	2010-12-22 10:26:39.246234
8	Euro	&euro;	%u%n	t	2010-12-22 10:26:40.208768	2010-12-22 10:26:40.208768
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-22 10:26:37.903088	2010-12-22 10:26:37.903088
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-22 10:26:37.918509	2010-12-22 10:26:37.918509
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-22 10:26:37.931171	2010-12-22 10:26:37.931171
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-22 10:26:38.065422	2010-12-22 10:26:38.065422
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-22 10:26:38.077789	2010-12-22 10:26:38.077789
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-22 10:26:38.089802	2010-12-22 10:26:38.089802
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-22 10:26:38.10237	2010-12-22 10:26:38.10237
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-22 10:26:38.118842	2010-12-22 10:26:38.118842
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-22 10:26:38.130982	2010-12-22 10:26:38.130982
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-22 10:26:38.142975	2010-12-22 10:26:38.142975
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-22 10:26:38.155412	2010-12-22 10:26:38.155412
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-22 10:26:38.16765	2010-12-22 10:26:38.16765
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-22 10:26:38.180008	2010-12-22 10:26:38.180008
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-22 10:26:38.192412	2010-12-22 10:26:38.192412
15	8	en	Question	<p></p>	2010-12-22 10:26:38.205159	2010-12-22 10:26:38.205159
16	8	dk	[DK] Question	<p></p>	2010-12-22 10:26:38.217847	2010-12-22 10:26:38.217847
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-22 10:26:37.894038	2010-12-22 10:26:37.914042
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-22 10:26:37.92656	2010-12-22 10:26:37.939382
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-22 10:26:38.073421	2010-12-22 10:26:38.085725
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-22 10:26:38.097785	2010-12-22 10:26:38.114657
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-22 10:26:38.126541	2010-12-22 10:26:38.138929
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-22 10:26:38.150938	2010-12-22 10:26:38.163636
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-22 10:26:38.175642	2010-12-22 10:26:38.187948
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-22 10:26:38.200664	2010-12-22 10:26:38.213587
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
1	1	dk	Ad nihil nihil occaecati voluptatum veritatis.Cum consequuntur sint ullam est quia ipsum.	Big deal on printers	Aut ut consequatur fuga velit et iste corrupti tenetur.Distinctio qui accusamus et reiciendis velit officia.	2010-12-22 10:26:38.73333	2010-12-22 10:26:38.73333
2	2	dk	Et maiores modi nihil non.Atque hic ad est.	Drills required	Delectus rerum minima pariatur voluptate beatae quis in.Quas exercitationem numquam iusto nam tempore autem.	2010-12-22 10:26:38.804493	2010-12-22 10:26:38.804493
3	3	dk	Perspiciatis vero placeat provident ullam.Et minus ipsum molestiae ratione ea et.	Need assistance in selling a car	In nihil vel quisquam cupiditate temporibus voluptatem qui.Aliquam animi dolor aspernatur rem quibusdam rerum explicabo.	2010-12-22 10:26:38.873535	2010-12-22 10:26:38.873535
4	4	dk	Id impedit quisquam veritatis.Natus optio et veniam quam qui.	Ipod shipment	Reiciendis sed ratione non ut mollitia.Eaque non voluptatem architecto voluptatem voluptas.	2010-12-22 10:26:39.074275	2010-12-22 10:26:39.074275
5	5	dk	Inventore sapiente totam repellendus nam sed.Eos ipsum qui porro rerum animi dolores.	Trip to amazonia - looking for offer	Amet et quam ducimus.Molestiae minima error vitae deserunt dolore tempore mollitia perferendis.	2010-12-22 10:26:39.14755	2010-12-22 10:26:39.14755
6	6	dk	Recusandae veniam qui vero possimus iure eius reiciendis fuga.Est assumenda amet pariatur quia molestias sed quis.	LCD - Huge amounts	Corrupti omnis suscipit iure quia sit.Accusantium praesentium eius fugiat consequatur qui eaque tempore.	2010-12-22 10:26:39.216162	2010-12-22 10:26:39.216162
7	7	dk	Doloribus culpa ab nihil sint accusamus rem autem voluptatem.Alias non ipsam a optio nesciunt.	GPS receivers required	Sit fugiat doloribus ipsam quia perferendis ipsa rem.Fugit consequatur quia sed.	2010-12-22 10:26:39.282598	2010-12-22 10:26:39.282598
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Ad nihil nihil occaecati voluptatum veritatis.Cum consequuntur sint ullam est quia ipsum.	Aut ut consequatur fuga velit et iste corrupti tenetur.Distinctio qui accusamus et reiciendis velit officia.	2	User::Agent	0	145.0	801.0	1	Ferry	Dereck Lemke	734-702-6464 x81839	vickie.koelpin@boscodavis.co.uk	406 Franz Corners	2010-12-22 10:26:38.694653	2010-12-22 10:26:38.694653	2010-12-27	Nicklaus129301359862192 Roberts	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Et maiores modi nihil non.Atque hic ad est.	Delectus rerum minima pariatur voluptate beatae quis in.Quas exercitationem numquam iusto nam tempore autem.	2	User::Agent	0	15.0	574.0	1	Treutel	Joan Cummerata	1-113-321-2014	colleen@willmsharber.ca	69681 Efrain Corner	2010-12-22 10:26:38.773059	2010-12-22 10:26:38.773059	2010-12-27	Nicklaus129301359862192 Roberts	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Perspiciatis vero placeat provident ullam.Et minus ipsum molestiae ratione ea et.	In nihil vel quisquam cupiditate temporibus voluptatem qui.Aliquam animi dolor aspernatur rem quibusdam rerum explicabo.	2	User::Agent	0	461.0	415.0	1	Goodwin	Mrs. Helen Jewess	103-828-6447 x254	dangelo.cole@wizapowlowski.com	3788 Marks Light	2010-12-22 10:26:38.841122	2010-12-22 10:26:38.841122	2010-12-27	Nicklaus129301359862192 Roberts	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Id impedit quisquam veritatis.Natus optio et veniam quam qui.	Reiciendis sed ratione non ut mollitia.Eaque non voluptatem architecto voluptatem voluptas.	2	User::Agent	0	106.0	578.0	1	Mccullough	Molly Homenick	1-812-636-8022 x8365	nia.lakin@langoshvandervort.uk	685 Champlin Manors	2010-12-22 10:26:38.910245	2010-12-22 10:26:38.910245	2010-12-27	Nicklaus129301359862192 Roberts	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Inventore sapiente totam repellendus nam sed.Eos ipsum qui porro rerum animi dolores.	Amet et quam ducimus.Molestiae minima error vitae deserunt dolore tempore mollitia perferendis.	2	User::Agent	0	648.0	815.0	1	Beier	Bryana Bosco MD	1-364-426-3438	helga_witting@zulauf.co.uk	6738 Olson Cliffs	2010-12-22 10:26:39.11595	2010-12-22 10:26:39.11595	2010-12-27	Nicklaus129301359862192 Roberts	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Recusandae veniam qui vero possimus iure eius reiciendis fuga.Est assumenda amet pariatur quia molestias sed quis.	Corrupti omnis suscipit iure quia sit.Accusantium praesentium eius fugiat consequatur qui eaque tempore.	2	User::Agent	0	928.0	110.0	1	Berge	Hiram Muller	074-150-2212 x477	troy@smithwillms.com	339 Lindsay Wells	2010-12-22 10:26:39.185253	2010-12-22 10:26:39.185253	2010-12-27	Nicklaus129301359862192 Roberts	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Doloribus culpa ab nihil sint accusamus rem autem voluptatem.Alias non ipsam a optio nesciunt.	Sit fugiat doloribus ipsam quia perferendis ipsa rem.Fugit consequatur quia sed.	2	User::Agent	0	467.0	578.0	1	Block	Coy Funk	(296)677-2823	royal_bartoletti@schmittpowlowski.com	108 Forrest Village	2010-12-22 10:26:39.25206	2010-12-22 10:26:39.25206	2010-12-27	Nicklaus129301359862192 Roberts	1	t	\N	0	0	f	f	-1	7
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
1	default_payout_delay	--- 0\n	2010-12-22 10:26:37.841608	2010-12-22 10:26:37.841608
2	default_leads_per_page	--- 5\n	2010-12-22 10:26:37.847024	2010-12-22 10:26:37.847024
3	certification_level_1	--- 10\n	2010-12-22 10:26:37.849155	2010-12-22 10:26:37.849155
4	certification_level_2	--- 20\n	2010-12-22 10:26:37.851246	2010-12-22 10:26:37.851246
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-22 10:26:37.853314	2010-12-22 10:26:37.853314
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-22 10:26:37.855386	2010-12-22 10:26:37.855386
7	invoicing_seller_name	--- Fairleads\n	2010-12-22 10:26:37.857412	2010-12-22 10:26:37.857412
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-22 10:26:37.85976	2010-12-22 10:26:37.85976
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-22 10:26:37.861902	2010-12-22 10:26:37.861902
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-22 10:26:37.863977	2010-12-22 10:26:37.863977
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
1	blazejek@gmail.com	9868d1a8af43173ae0e993efcf91517df8a1b55419eb89b2eca78b68c9db3018b5e2607adb44de09b5c0bad599261ade3c144a09cc72d0b8dcc6f92150557f70	m3HOVC8TaShXfp3PY4kl	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 10:26:38.348402	2010-12-22 10:26:38.250636	\N	2010-12-22 10:26:38.250854	2010-12-22 10:26:38.348681	1	Ashleigh	Gorczany	896-598-5725 x755	root	Chance Cape	Beierstad	23111	Derbyshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	PcN7K9hvoKvLAM7zVDtt4QmrURuTGeEESwqfzboK9xVNSW4NdCYjLpAS8F7Uqt	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	28af2573c6dafa0967239e53a87694404ecaa7d08af8aa72e44bcad8f6fba840e918422ad2f09704d2cdac2240e8e37b395b8ee291846008797a2f0a3949cf24	HYzRTO_MADOh6EUS4BEK	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 10:26:38.65145	2010-12-22 10:26:38.629331	\N	2010-12-22 10:26:38.629547	2010-12-22 10:26:38.651725	2	Nicklaus129301359862192	Roberts	283-421-1307	Missouri O'Hara129301359862168	Labadie Point	New Nicholas	61165-2121	Norfolk	3	\N	0	\N	\N	0	\N	\N	\N	\N	cijGlPUWPtOavQHl9nYBHgSYhTTCAhs6iQJX4XL2rHH3rlr5T0h9SoY4xecrjL	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	730cdd0fb3055cea329d58040e22b8a85f6b0d231138ee264539b26002dc310b64d4ef2dda97dee1a681f4f98d65e58319893f00857275a56c95bf4f87afb928	kunP78EJ8pwannfMGXXr	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 10:26:39.354531	2010-12-22 10:26:39.334758	\N	2010-12-22 10:26:39.335031	2010-12-22 10:26:39.35481	1	Tina	Sawayn	(082)760-8489 x4623	Kendrick Schultz I129301359933061	Terry Extension	Ewellland	75231	Strathclyde	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Hn6IAHLYwBqKWYZ2h9TGx2ifvroPvrvrGm9T7VTmw5cQLgzWca3v9Fp7SGZSFd	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	67635a39f673c429deb584ae2dacb8222aa5fc7e5805d0e4f86df8dd9be8c41226a1f74e4acfa3f8956f29d61446c6e336edb2fafe519e549acec3c70ea5b16b	ynJpLy1uH1NtDtEFPBqb	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 10:26:39.40622	2010-12-22 10:26:39.38462	\N	2010-12-22 10:26:39.384851	2010-12-22 10:26:39.406484	48	Shawn	Reichel	621.513.1615 x37593	Toney Doyle129301359937983	Thad Tunnel	Eliport	46011-3672	Lancashire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	lVqHpPxfo52zKXdjCed3bSR6Z4K99jxB1Z9kQ43ZbwiH0OciASI1WRQD8JYyz6	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	2e504ed9a0657211d2abcadb2ed32729087843d8e6c5698a2fe9c8f57f35a443f6f3367980ab98465cb283688986eb43c38168f72b78e93780d92102ae6bbfbd	E2QGgMgXO0ypiCpj5XyP	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-22 10:26:39.587205	2010-12-22 10:26:39.564665	\N	2010-12-22 10:26:39.564915	2010-12-22 10:26:39.601563	64	Bernita	Halvorson	1-870-919-0105 x3998	Dr. Donato Franecki129301359955969	Paige Plains	Halvorsonside	25949	Shropshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	xpQuqV8QGFOiKkn6ve3YObcfBJF7WVmzYwBBTOtqWKBlNM0egV7xi3KBz0a9cZ	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

