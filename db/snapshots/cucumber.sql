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
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('settings_id_seq', 5, true);


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
1	1	dk	About us	About us	2010-12-14 13:19:31.346813	2010-12-14 13:19:31.346813
2	1	en	About us	About us	2010-12-14 13:19:31.362264	2010-12-14 13:19:31.362264
3	2	dk	Privacy	Privacy	2010-12-14 13:19:31.393857	2010-12-14 13:19:31.393857
4	2	en	Privacy	Privacy	2010-12-14 13:19:31.406398	2010-12-14 13:19:31.406398
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-14 13:19:31.43723	2010-12-14 13:19:31.43723
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-14 13:19:31.450392	2010-12-14 13:19:31.450392
7	4	dk	Blurb sign up	Blurb sign up	2010-12-14 13:19:31.479281	2010-12-14 13:19:31.479281
8	4	en	Blurb sign up	Blurb sign up	2010-12-14 13:19:31.491739	2010-12-14 13:19:31.491739
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-14 13:19:31.519966	2010-12-14 13:19:31.519966
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-14 13:19:31.664293	2010-12-14 13:19:31.664293
11	6	dk	Blurb agent home	Blurb agent home	2010-12-14 13:19:31.693357	2010-12-14 13:19:31.693357
12	6	en	Blurb agent home	Blurb agent home	2010-12-14 13:19:31.707284	2010-12-14 13:19:31.707284
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-14 13:19:31.735945	2010-12-14 13:19:31.735945
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-14 13:19:31.748352	2010-12-14 13:19:31.748352
15	8	dk	Blurb currencies	Blurb currencies	2010-12-14 13:19:31.776731	2010-12-14 13:19:31.776731
16	8	en	Blurb currencies	Blurb currencies	2010-12-14 13:19:31.79477	2010-12-14 13:19:31.79477
17	9	dk	Reset password	Reset password	2010-12-14 13:19:31.821645	2010-12-14 13:19:31.821645
18	9	en	Reset password	Reset password	2010-12-14 13:19:31.833626	2010-12-14 13:19:31.833626
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-14 13:19:31.337839	2010-12-14 13:19:31.365354	about_us	0	t	2010-12-14 13:19:31.365278
2	Article::Cms	2010-12-14 13:19:31.389649	2010-12-14 13:19:31.409414	privacy	0	t	2010-12-14 13:19:31.409341
3	Article::Cms	2010-12-14 13:19:31.433123	2010-12-14 13:19:31.453649	terms_conditions	0	t	2010-12-14 13:19:31.453571
4	Article::Cms	2010-12-14 13:19:31.475172	2010-12-14 13:19:31.494812	blurb_sign_up	1	t	2010-12-14 13:19:31.494731
5	Article::Cms	2010-12-14 13:19:31.515697	2010-12-14 13:19:31.667259	blurb_buyer_home	1	t	2010-12-14 13:19:31.667187
6	Article::Cms	2010-12-14 13:19:31.688959	2010-12-14 13:19:31.710945	blurb_agent_home	1	t	2010-12-14 13:19:31.710869
7	Article::Cms	2010-12-14 13:19:31.731935	2010-12-14 13:19:31.751404	blurb_start_page_role_selection	1	t	2010-12-14 13:19:31.751331
8	Article::Cms	2010-12-14 13:19:31.772782	2010-12-14 13:19:31.797894	blurb_currencies	1	t	2010-12-14 13:19:31.797816
9	Article::Cms	2010-12-14 13:19:31.817646	2010-12-14 13:19:31.836594	reset_password	2	t	2010-12-14 13:19:31.836522
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked) FROM stdin;
1	Electronics	Laboriosam veniam sapiente aut beatae ratione odit.Asperiores cupiditate esse dolorum suscipit atque culpa.	2010-12-14 13:19:30.175854	2010-12-14 13:19:30.175854	\N	1	2	\N	0	1-electronics	f
2	Leisure	Animi qui autem maiores enim natus eveniet possimus.Inventore delectus deserunt aut reprehenderit qui.	2010-12-14 13:19:30.220346	2010-12-14 13:19:30.220346	\N	3	4	\N	0	2-leisure	f
3	Business	Similique ipsum et eos et modi aspernatur doloribus.Eveniet ducimus ratione accusamus velit natus.	2010-12-14 13:19:30.252838	2010-12-14 13:19:30.935864	\N	5	6	\N	7	3-business	f
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
1	1	en	Laboriosam veniam sapiente aut beatae ratione odit.Asperiores cupiditate esse dolorum suscipit atque culpa.	Electronics	2010-12-14 13:19:30.18492	2010-12-14 13:19:30.18492
2	1	dk	\N	Electronics	2010-12-14 13:19:30.211144	2010-12-14 13:19:30.211144
3	2	en	Animi qui autem maiores enim natus eveniet possimus.Inventore delectus deserunt aut reprehenderit qui.	Leisure	2010-12-14 13:19:30.224736	2010-12-14 13:19:30.224736
4	2	dk	\N	Leisure	2010-12-14 13:19:30.243587	2010-12-14 13:19:30.243587
5	3	en	Similique ipsum et eos et modi aspernatur doloribus.Eveniet ducimus ratione accusamus velit natus.	Business	2010-12-14 13:19:30.257097	2010-12-14 13:19:30.257097
6	3	dk	\N	Business	2010-12-14 13:19:30.393764	2010-12-14 13:19:30.393764
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-14 13:19:29.72746	2010-12-14 13:19:29.72746
2	United Kingdom	2010-12-14 13:19:29.732022	2010-12-14 13:19:29.732022
3	Wales129233277041619	2010-12-14 13:19:30.417518	2010-12-14 13:19:30.417518
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
1	sit	&pound;	%u%n	t	2010-12-14 13:19:30.474846	2010-12-14 13:19:30.474846
2	numquam	$	%u%n	t	2010-12-14 13:19:30.536542	2010-12-14 13:19:30.536542
3	at	&pound;	%u%n	t	2010-12-14 13:19:30.586555	2010-12-14 13:19:30.586555
4	non	&pound;	%u%n	t	2010-12-14 13:19:30.635414	2010-12-14 13:19:30.635414
5	sunt	$	%u%n	t	2010-12-14 13:19:30.685261	2010-12-14 13:19:30.685261
6	quisquam	&pound;	%u%n	t	2010-12-14 13:19:30.862511	2010-12-14 13:19:30.862511
7	unde	&pound;	%u%n	t	2010-12-14 13:19:30.914079	2010-12-14 13:19:30.914079
8	Euro	&euro;	%u%n	t	2010-12-14 13:19:31.852062	2010-12-14 13:19:31.852062
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-14 13:19:29.758534	2010-12-14 13:19:29.758534
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-14 13:19:29.774077	2010-12-14 13:19:29.774077
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-14 13:19:29.903421	2010-12-14 13:19:29.903421
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-14 13:19:29.915623	2010-12-14 13:19:29.915623
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-14 13:19:29.927891	2010-12-14 13:19:29.927891
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-14 13:19:29.939812	2010-12-14 13:19:29.939812
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-14 13:19:29.952159	2010-12-14 13:19:29.952159
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-14 13:19:29.964369	2010-12-14 13:19:29.964369
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-14 13:19:29.976545	2010-12-14 13:19:29.976545
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-14 13:19:29.988628	2010-12-14 13:19:29.988628
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-14 13:19:30.000798	2010-12-14 13:19:30.000798
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-14 13:19:30.012924	2010-12-14 13:19:30.012924
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-14 13:19:30.025516	2010-12-14 13:19:30.025516
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-14 13:19:30.037998	2010-12-14 13:19:30.037998
15	8	en	Question	<p></p>	2010-12-14 13:19:30.050971	2010-12-14 13:19:30.050971
16	8	dk	[DK] Question	<p></p>	2010-12-14 13:19:30.063689	2010-12-14 13:19:30.063689
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-14 13:19:29.749406	2010-12-14 13:19:29.769711
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-14 13:19:29.782229	2010-12-14 13:19:29.911474
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-14 13:19:29.923557	2010-12-14 13:19:29.935738
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-14 13:19:29.947671	2010-12-14 13:19:29.960314
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-14 13:19:29.972248	2010-12-14 13:19:29.984512
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-14 13:19:29.996382	2010-12-14 13:19:30.008922
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-14 13:19:30.020868	2010-12-14 13:19:30.033744
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-14 13:19:30.046204	2010-12-14 13:19:30.059281
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
1	1	dk	Veniam voluptas ipsam aperiam fuga non quis sint.Et amet consequuntur ut totam molestiae odit porro.	Aut quasi ut inventore excepturi sed veritatis quidem.Dicta quia eligendi dolorem explicabo itaque ut voluptates repudiandae.	Big deal on printers	2010-12-14 13:19:30.512662	2010-12-14 13:19:30.512662
2	2	dk	Hic et excepturi quia totam quas.Quo quam consequuntur sit mollitia.	Voluptatem et et quam nesciunt facere consectetur et.Molestiae unde pariatur ut ab debitis est.	Drills required	2010-12-14 13:19:30.565052	2010-12-14 13:19:30.565052
3	3	dk	Dolor vitae explicabo quia eos.Et dolores labore voluptatem corrupti unde.	Et cumque et sunt.Eligendi saepe commodi exercitationem velit laboriosam perspiciatis porro.	Need assistance in selling a car	2010-12-14 13:19:30.614358	2010-12-14 13:19:30.614358
4	4	dk	Adipisci consequatur ut ut autem repudiandae.Omnis eum et at animi cupiditate.	Esse ullam qui beatae.Blanditiis qui autem expedita dolore.	Ipod shipment	2010-12-14 13:19:30.663543	2010-12-14 13:19:30.663543
5	5	dk	Debitis voluptates earum eveniet dicta et.Eum iste voluptas eos fuga modi sit.	Omnis illo quasi repellendus officia et cum labore.Consequatur omnis aliquam eaque sed vero quos.	Trip to amazonia - looking for offer	2010-12-14 13:19:30.714467	2010-12-14 13:19:30.714467
6	6	dk	Beatae et illum provident architecto expedita illo.Occaecati tenetur at necessitatibus et omnis dicta qui.	In odit ut maiores unde omnis sint.Fuga est illum error mollitia rerum ut sed suscipit.	LCD - Huge amounts	2010-12-14 13:19:30.891919	2010-12-14 13:19:30.891919
7	7	dk	Odio fugit nesciunt vel rerum.Dolorum temporibus tempora aut rerum.	Sed est placeat quasi dolorem voluptas ullam.Aspernatur sunt rem aliquam nulla dolorem.	GPS receivers required	2010-12-14 13:19:30.943017	2010-12-14 13:19:30.943017
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Veniam voluptas ipsam aperiam fuga non quis sint.Et amet consequuntur ut totam molestiae odit porro.	Aut quasi ut inventore excepturi sed veritatis quidem.Dicta quia eligendi dolorem explicabo itaque ut voluptates repudiandae.	2	User::Agent	0	540.0	373.0	1	Dietrichhauck	Montana Ledner	913-502-9349 x199	alberto.tremblay@bradtke.ca	2155 Greenfelder Ridge	2010-12-14 13:19:30.483686	2010-12-14 13:19:30.483686	2010-12-19	Name129233277041548 Stehr	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Hic et excepturi quia totam quas.Quo quam consequuntur sit mollitia.	Voluptatem et et quam nesciunt facere consectetur et.Molestiae unde pariatur ut ab debitis est.	2	User::Agent	0	745.0	638.0	1	Yost	Kira Nitzsche	1-796-451-5865	orie@mraz.us	292 Aufderhar Hill	2010-12-14 13:19:30.542346	2010-12-14 13:19:30.542346	2010-12-19	Name129233277041548 Stehr	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Dolor vitae explicabo quia eos.Et dolores labore voluptatem corrupti unde.	Et cumque et sunt.Eligendi saepe commodi exercitationem velit laboriosam perspiciatis porro.	2	User::Agent	0	967.0	16.0	1	Lang	Annabell Hettinger	1-367-776-6306 x86966	wilfredo@wintheiserwintheiser.info	8731 Donnelly Squares	2010-12-14 13:19:30.592286	2010-12-14 13:19:30.592286	2010-12-19	Name129233277041548 Stehr	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Adipisci consequatur ut ut autem repudiandae.Omnis eum et at animi cupiditate.	Esse ullam qui beatae.Blanditiis qui autem expedita dolore.	2	User::Agent	0	185.0	510.0	1	Doyle	Amie Hartmann	1-739-594-2612	cathy.larkin@krajcik.info	268 Charlotte Motorway	2010-12-14 13:19:30.641224	2010-12-14 13:19:30.641224	2010-12-19	Name129233277041548 Stehr	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Debitis voluptates earum eveniet dicta et.Eum iste voluptas eos fuga modi sit.	Omnis illo quasi repellendus officia et cum labore.Consequatur omnis aliquam eaque sed vero quos.	2	User::Agent	0	48.0	264.0	1	Smitham	Celine Feil	589.906.8015	tevin@nienowokeefe.us	32336 Marvin Keys	2010-12-14 13:19:30.691068	2010-12-14 13:19:30.691068	2010-12-19	Name129233277041548 Stehr	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Beatae et illum provident architecto expedita illo.Occaecati tenetur at necessitatibus et omnis dicta qui.	In odit ut maiores unde omnis sint.Fuga est illum error mollitia rerum ut sed suscipit.	2	User::Agent	0	543.0	788.0	1	Wisozk	Rhiannon Little	928-613-7945 x938	lina@bailey.ca	949 Tamia Dam	2010-12-14 13:19:30.868944	2010-12-14 13:19:30.868944	2010-12-19	Name129233277041548 Stehr	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Odio fugit nesciunt vel rerum.Dolorum temporibus tempora aut rerum.	Sed est placeat quasi dolorem voluptas ullam.Aspernatur sunt rem aliquam nulla dolorem.	2	User::Agent	0	873.0	638.0	1	Yundt	Valerie Schoen DDS	626.601.8541 x85676	stella_bartoletti@goyette.ca	3024 Kohler Courts	2010-12-14 13:19:30.920122	2010-12-14 13:19:30.920122	2010-12-19	Name129233277041548 Stehr	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-14 13:19:29.707062	2010-12-14 13:19:29.707062
2	default_leads_per_page	--- 5\n	2010-12-14 13:19:29.71271	2010-12-14 13:19:29.71271
3	certification_level_1	--- 10\n	2010-12-14 13:19:29.7149	2010-12-14 13:19:29.7149
4	certification_level_2	--- 20\n	2010-12-14 13:19:29.71703	2010-12-14 13:19:29.71703
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-14 13:19:29.719117	2010-12-14 13:19:29.719117
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, linkedin_url) FROM stdin;
1	blazejek@gmail.com	ae9aa4b1a2973ca832fb7e135a25d309815e90876b66807765a4a52465f0167f7a4977ffa80338739512cff7c24277b7f40829eedd269ddff5cf3943026d5f52	X3_FjQsbWcJgNwfH3pfU	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-14 13:19:30.154832	2010-12-14 13:19:30.095805	\N	2010-12-14 13:19:30.096023	2010-12-14 13:19:30.155108	1	Jorge	Schowalter	676-975-6572	root	Kreiger Prairie	Lake Adrien	54593-8726	Shropshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	GgCIXmnM7zQl0gi3FMZt7G0XFop8Z8Mtfub92xPODItuWUMrBdM6o8TjwEshK2	f	\N	0	0	0	0	0	\N
2	agent@nbs.com	51f0d54f39d707d195075b80f6930d9b53e571524e95f74718c241b8fb96f48f364960920d00c084c6c0c524a9e7758f8b335389c955b2e4df029ae28a65aa11	c-l_jVnop2ZCmZ-a1Fbl	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-14 13:19:30.444655	2010-12-14 13:19:30.422649	\N	2010-12-14 13:19:30.42286	2010-12-14 13:19:30.444927	2	Name129233277041548	Stehr	859.188.0789 x13506	Mr. Jensen Parker129233277041524	White Brook	North Eugenia	84487-1891	Leicestershire	3	\N	0	\N	\N	0	\N	\N	\N	\N	zxFNKjzeV5Y3bI1x6cpvOEmmDf4LqTuKdrbs8JwgkcY3rL3r5VBGVtGiOYFimm	f	\N	0	0	0	0	0	\N
3	admin@nbs.com	4651e44773aac812e0882f187aa49c054a94c0dcd4e4622e7e52476a233f50464f964a9a1e7f16a62d2c19d3a75866aa1bf9a062e5bdf739c01d7396b96a137d	rFaIzrp3nz27y5Y5NpFK	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-14 13:19:31.010334	2010-12-14 13:19:30.99014	\N	2010-12-14 13:19:30.990359	2010-12-14 13:19:31.010629	1	Octavia	Jast	415.560.7808 x2730	Arno Yundt129233277098556	Rippin Summit	Koepphaven	65200-8190	Isle of Wight	1	\N	\N	\N	\N	0	\N	\N	\N	\N	bnwfzgOCAre5IVMTL6auEJUIPz7IvNoyTV7oeDrcVdSjNL5IBq5pAgyDRsKS4i	f	\N	0	0	0	0	0	\N
4	buyer@nbs.com	db410af8c6949638597dccb693e04c7456a531cb37a0c06e7f6a80151cc00148128bd355210a27f394da86cdaa7a8d812a5a16517c32ca4fa219c03d01a39f55	8gNDwKeNtOOMqwkavlZv	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-14 13:19:31.061501	2010-12-14 13:19:31.039332	\N	2010-12-14 13:19:31.039552	2010-12-14 13:19:31.061836	48	Fern	Conn	780.919.4406	Wilmer Baumbach129233277103448	Spencer Divide	Kshlerinview	36121-5154	Dyfed	1	\N	\N	\N	\N	0	\N	\N	\N	\N	3BUIS8iQmM4l7Si0OoPju2DaHYwHQgNVku5XYb9dgtz3bfx6Kxa0u4s95mXmZC	f	t	0	0	0	0	0	\N
5	leaduser@nbs.com	6ec869a7e47bb42d55032e1310bb30cb82c1b41970d9291a97f7db4551252a596825c1ad16fd85ee4e624f5b03ee221e9034d2aa87caede3ccd2fcdb6ad8c5d4	XmbDU4JGK6J2BO_OVcRC	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-14 13:19:31.11309	2010-12-14 13:19:31.090744	\N	2010-12-14 13:19:31.090967	2010-12-14 13:19:31.126741	64	Kathlyn	Johnston	702.766.2042	Ross Roberts I129233277108618	Terrance Crescent	East Garrymouth	78202	Central	1	\N	\N	4	\N	0	\N	\N	\N	\N	kNvJk3XWKNKYJyA7OWEheM2ZxC7paztL4SSp6vSWAAl20W1joKB44Bf2mr0Nyn	f	\N	0	0	0	0	0	\N
\.


--
-- PostgreSQL database dump complete
--

