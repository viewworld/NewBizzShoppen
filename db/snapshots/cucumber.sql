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
1	1	dk	About us	About us	2010-12-15 15:48:18.690593	2010-12-15 15:48:18.690593
2	1	en	About us	About us	2010-12-15 15:48:18.706029	2010-12-15 15:48:18.706029
3	2	dk	Privacy	Privacy	2010-12-15 15:48:18.736279	2010-12-15 15:48:18.736279
4	2	en	Privacy	Privacy	2010-12-15 15:48:18.748908	2010-12-15 15:48:18.748908
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-15 15:48:18.779903	2010-12-15 15:48:18.779903
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-15 15:48:18.792232	2010-12-15 15:48:18.792232
7	4	dk	Blurb sign up	Blurb sign up	2010-12-15 15:48:18.819674	2010-12-15 15:48:18.819674
8	4	en	Blurb sign up	Blurb sign up	2010-12-15 15:48:18.831775	2010-12-15 15:48:18.831775
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-15 15:48:18.859144	2010-12-15 15:48:18.859144
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-15 15:48:18.872927	2010-12-15 15:48:18.872927
11	6	dk	Blurb agent home	Blurb agent home	2010-12-15 15:48:18.901667	2010-12-15 15:48:18.901667
12	6	en	Blurb agent home	Blurb agent home	2010-12-15 15:48:18.914667	2010-12-15 15:48:18.914667
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-15 15:48:18.943449	2010-12-15 15:48:18.943449
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-15 15:48:18.956039	2010-12-15 15:48:18.956039
15	8	dk	Blurb currencies	Blurb currencies	2010-12-15 15:48:18.984804	2010-12-15 15:48:18.984804
16	8	en	Blurb currencies	Blurb currencies	2010-12-15 15:48:18.997388	2010-12-15 15:48:18.997388
17	9	dk	Reset password	Reset password	2010-12-15 15:48:19.164754	2010-12-15 15:48:19.164754
18	9	en	Reset password	Reset password	2010-12-15 15:48:19.177185	2010-12-15 15:48:19.177185
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-15 15:48:18.682327	2010-12-15 15:48:18.709062	about_us	0	t	2010-12-15 15:48:18.708984
2	Article::Cms	2010-12-15 15:48:18.73232	2010-12-15 15:48:18.751947	privacy	0	t	2010-12-15 15:48:18.751866
3	Article::Cms	2010-12-15 15:48:18.775859	2010-12-15 15:48:18.795228	terms_conditions	0	t	2010-12-15 15:48:18.795146
4	Article::Cms	2010-12-15 15:48:18.815583	2010-12-15 15:48:18.834785	blurb_sign_up	1	t	2010-12-15 15:48:18.834705
5	Article::Cms	2010-12-15 15:48:18.855011	2010-12-15 15:48:18.875995	blurb_buyer_home	1	t	2010-12-15 15:48:18.875915
6	Article::Cms	2010-12-15 15:48:18.897335	2010-12-15 15:48:18.917905	blurb_agent_home	1	t	2010-12-15 15:48:18.917825
7	Article::Cms	2010-12-15 15:48:18.939197	2010-12-15 15:48:18.959646	blurb_start_page_role_selection	1	t	2010-12-15 15:48:18.959558
8	Article::Cms	2010-12-15 15:48:18.980682	2010-12-15 15:48:19.000503	blurb_currencies	1	t	2010-12-15 15:48:19.00042
9	Article::Cms	2010-12-15 15:48:19.160627	2010-12-15 15:48:19.180181	reset_password	2	t	2010-12-15 15:48:19.18009
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
1	Electronics	Est error et neque.Iure corrupti dolore sit vel reiciendis consectetur et dolores.	2010-12-15 15:48:17.26805	2010-12-15 15:48:17.26805	\N	1	2	\N	0	1-electronics	0	f
2	Leisure	Vero ut et cupiditate.Rerum nesciunt eum est illum fuga et eligendi.	2010-12-15 15:48:17.437429	2010-12-15 15:48:17.437429	\N	3	4	\N	0	2-leisure	0	f
3	Business	Atque et voluptatem molestias minima nihil velit.Saepe vero quas laudantium inventore sunt ducimus ea harum.	2010-12-15 15:48:17.468926	2010-12-15 15:48:18.149989	\N	5	6	\N	7	3-business	7	f
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
1	1	en	Est error et neque.Iure corrupti dolore sit vel reiciendis consectetur et dolores.	Electronics	2010-12-15 15:48:17.277349	2010-12-15 15:48:17.277349
2	1	dk	\N	Electronics	2010-12-15 15:48:17.428411	2010-12-15 15:48:17.428411
3	2	en	Vero ut et cupiditate.Rerum nesciunt eum est illum fuga et eligendi.	Leisure	2010-12-15 15:48:17.44161	2010-12-15 15:48:17.44161
4	2	dk	\N	Leisure	2010-12-15 15:48:17.459934	2010-12-15 15:48:17.459934
5	3	en	Atque et voluptatem molestias minima nihil velit.Saepe vero quas laudantium inventore sunt ducimus ea harum.	Business	2010-12-15 15:48:17.473131	2010-12-15 15:48:17.473131
6	3	dk	\N	Business	2010-12-15 15:48:17.491339	2010-12-15 15:48:17.491339
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-15 15:48:16.932159	2010-12-15 15:48:16.932159
2	United Kingdom	2010-12-15 15:48:16.936872	2010-12-15 15:48:16.936872
3	Northern Ireland12924280975154	2010-12-15 15:48:17.516754	2010-12-15 15:48:17.516754
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
1	voluptatem	&euro;	%u%n	t	2010-12-15 15:48:17.574667	2010-12-15 15:48:17.574667
2	labore	$	%u%n	t	2010-12-15 15:48:17.656302	2010-12-15 15:48:17.656302
3	dicta	$	%u%n	t	2010-12-15 15:48:17.722848	2010-12-15 15:48:17.722848
4	reprehenderit	$	%u%n	t	2010-12-15 15:48:17.918788	2010-12-15 15:48:17.918788
5	alias	$	%u%n	t	2010-12-15 15:48:17.986774	2010-12-15 15:48:17.986774
6	ipsum	$	%u%n	t	2010-12-15 15:48:18.054328	2010-12-15 15:48:18.054328
7	sunt	&pound;	%u%n	t	2010-12-15 15:48:18.120613	2010-12-15 15:48:18.120613
8	Euro	&euro;	%u%n	t	2010-12-15 15:48:19.195758	2010-12-15 15:48:19.195758
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-15 15:48:16.962365	2010-12-15 15:48:16.962365
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-15 15:48:16.97696	2010-12-15 15:48:16.97696
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-15 15:48:16.989992	2010-12-15 15:48:16.989992
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-15 15:48:17.002225	2010-12-15 15:48:17.002225
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-15 15:48:17.015111	2010-12-15 15:48:17.015111
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	2010-12-15 15:48:17.026925	2010-12-15 15:48:17.026925
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-15 15:48:17.039803	2010-12-15 15:48:17.039803
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-15 15:48:17.052278	2010-12-15 15:48:17.052278
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-15 15:48:17.065461	2010-12-15 15:48:17.065461
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-15 15:48:17.077892	2010-12-15 15:48:17.077892
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-15 15:48:17.091174	2010-12-15 15:48:17.091174
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-15 15:48:17.104221	2010-12-15 15:48:17.104221
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-15 15:48:17.117418	2010-12-15 15:48:17.117418
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-15 15:48:17.130115	2010-12-15 15:48:17.130115
15	8	en	Question	<p></p>	2010-12-15 15:48:17.142935	2010-12-15 15:48:17.142935
16	8	dk	[DK] Question	<p></p>	2010-12-15 15:48:17.155622	2010-12-15 15:48:17.155622
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-15 15:48:16.953545	2010-12-15 15:48:16.972769
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-15 15:48:16.984842	2010-12-15 15:48:16.997983
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-15 15:48:17.010106	2010-12-15 15:48:17.022927
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-15 15:48:17.034587	2010-12-15 15:48:17.048245
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-15 15:48:17.060385	2010-12-15 15:48:17.07356
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-15 15:48:17.086509	2010-12-15 15:48:17.099706
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-15 15:48:17.112838	2010-12-15 15:48:17.125766
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-15 15:48:17.138353	2010-12-15 15:48:17.151185
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
1	1	dk	In et quis dolore.Non a repellendus natus.	Big deal on printers	Voluptatem libero nesciunt dolores blanditiis nostrum et unde aliquam.Voluptates nostrum sequi officia eos.	2010-12-15 15:48:17.622884	2010-12-15 15:48:17.622884
2	2	dk	Recusandae doloremque modi omnis nulla temporibus.Fugit corrupti nobis rerum ex.	Drills required	Ducimus itaque ipsum molestiae.Quia vitae in error laudantium.	2010-12-15 15:48:17.692582	2010-12-15 15:48:17.692582
3	3	dk	Id aut nihil autem.Sunt dolorem rerum eum voluptatum tempore fugit.	Need assistance in selling a car	Voluptas asperiores dicta porro consequuntur ut.Ipsa blanditiis laboriosam omnis quam.	2010-12-15 15:48:17.887429	2010-12-15 15:48:17.887429
4	4	dk	Velit quod magni ipsum rerum necessitatibus.Cum veniam enim magni suscipit voluptatem non.	Ipod shipment	Dolor doloribus rerum ipsum.Qui magnam est aliquid odit.	2010-12-15 15:48:17.95583	2010-12-15 15:48:17.95583
5	5	dk	Amet quidem repellat magnam.Id exercitationem libero et.	Trip to amazonia - looking for offer	Unde qui odit et.Odio maiores fugit perferendis omnis quae.	2010-12-15 15:48:18.023932	2010-12-15 15:48:18.023932
6	6	dk	Sit ipsum quidem est ut consequatur adipisci sed.Quidem qui et qui sed at harum itaque nobis.	LCD - Huge amounts	Sit et alias iusto laudantium magni quia voluptatem.Repellat dolore voluptatem voluptas.	2010-12-15 15:48:18.090409	2010-12-15 15:48:18.090409
7	7	dk	Est ab et quia accusantium nisi commodi architecto.Perferendis eaque itaque laboriosam sed.	GPS receivers required	Ipsam molestiae vero architecto aut.Excepturi aut beatae et error in cupiditate perspiciatis.	2010-12-15 15:48:18.156808	2010-12-15 15:48:18.156808
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	In et quis dolore.Non a repellendus natus.	Voluptatem libero nesciunt dolores blanditiis nostrum et unde aliquam.Voluptates nostrum sequi officia eos.	2	User::Agent	0	966.0	330.0	1	Ernserdicki	Keshawn Bergnaum	163-740-4706 x0787	audreanne.harris@maggiorempel.com	733 Kautzer Fields	2010-12-15 15:48:17.583478	2010-12-15 15:48:17.583478	2010-12-20	Willa129242809751465 Stiedemann	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Recusandae doloremque modi omnis nulla temporibus.Fugit corrupti nobis rerum ex.	Ducimus itaque ipsum molestiae.Quia vitae in error laudantium.	2	User::Agent	0	46.0	443.0	1	Brakusoconner	Nick Hamill	1-621-424-8058	cecil_price@lehnerlemke.uk	6590 Maribel Mountains	2010-12-15 15:48:17.662161	2010-12-15 15:48:17.662161	2010-12-20	Willa129242809751465 Stiedemann	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Id aut nihil autem.Sunt dolorem rerum eum voluptatum tempore fugit.	Voluptas asperiores dicta porro consequuntur ut.Ipsa blanditiis laboriosam omnis quam.	2	User::Agent	0	193.0	511.0	1	Kozey	Garret Zboncak	1-153-437-8162 x7192	barrett.fisher@reinger.name	8092 Friedrich Drive	2010-12-15 15:48:17.728681	2010-12-15 15:48:17.728681	2010-12-20	Willa129242809751465 Stiedemann	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Velit quod magni ipsum rerum necessitatibus.Cum veniam enim magni suscipit voluptatem non.	Dolor doloribus rerum ipsum.Qui magnam est aliquid odit.	2	User::Agent	0	973.0	303.0	1	Becker	Tia Ritchie	(042)766-2568 x1703	manuela_parisian@frami.info	2578 Theo Mountain	2010-12-15 15:48:17.924697	2010-12-15 15:48:17.924697	2010-12-20	Willa129242809751465 Stiedemann	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Amet quidem repellat magnam.Id exercitationem libero et.	Unde qui odit et.Odio maiores fugit perferendis omnis quae.	2	User::Agent	0	667.0	986.0	1	Dietrich	Joanny Batz	(247)900-3521	murl.hettinger@legros.uk	76196 Emerson Dale	2010-12-15 15:48:17.992691	2010-12-15 15:48:17.992691	2010-12-20	Willa129242809751465 Stiedemann	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Sit ipsum quidem est ut consequatur adipisci sed.Quidem qui et qui sed at harum itaque nobis.	Sit et alias iusto laudantium magni quia voluptatem.Repellat dolore voluptatem voluptas.	2	User::Agent	0	842.0	773.0	1	Willms	Miss Norval Cremin	1-055-188-6549 x752	jermain.ullrich@tillman.name	616 Yost Road	2010-12-15 15:48:18.060159	2010-12-15 15:48:18.060159	2010-12-20	Willa129242809751465 Stiedemann	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Est ab et quia accusantium nisi commodi architecto.Perferendis eaque itaque laboriosam sed.	Ipsam molestiae vero architecto aut.Excepturi aut beatae et error in cupiditate perspiciatis.	2	User::Agent	0	898.0	45.0	1	Schaeferhuels	Madyson Bode	803-765-6238 x843	lelia_zboncak@von.name	73302 Buck Fort	2010-12-15 15:48:18.126336	2010-12-15 15:48:18.126336	2010-12-20	Willa129242809751465 Stiedemann	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-15 15:48:16.911818	2010-12-15 15:48:16.911818
2	default_leads_per_page	--- 5\n	2010-12-15 15:48:16.917432	2010-12-15 15:48:16.917432
3	certification_level_1	--- 10\n	2010-12-15 15:48:16.919619	2010-12-15 15:48:16.919619
4	certification_level_2	--- 20\n	2010-12-15 15:48:16.921748	2010-12-15 15:48:16.921748
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-15 15:48:16.923844	2010-12-15 15:48:16.923844
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
1	blazejek@gmail.com	f648570002aa3502c8750eb09a8819a3f4788a6ab9512526053f65399da50f8ff8aa4326d38debe58f4b57a49a89e655155a7130a9deb10b9d3f383898468117	_ojl6KDWYo0NMbvia_6_	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-15 15:48:17.246722	2010-12-15 15:48:17.188164	\N	2010-12-15 15:48:17.188397	2010-12-15 15:48:17.246997	1	Wilhelm	Wisozk	596.287.8747	root	Morar Burg	Feeneyton	29568	South Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Dd0nCz0BxtrRaEHuXgTd7bu1SkguPRvCycdrHDDCRYv53kp8ZZzMuQLJ7Fwh1S	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
2	agent@nbs.com	d7d2b0122fce65ced7c30e9b399c33f12542cf86ac2d47064f264ac1e78f38d5248ef1bcb93a2e3bc7875e4ac3fb380a0a2e56b4c7a7cb86c495df738129f087	1y7bTDbpgWqJDWEYpOfk	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-15 15:48:17.544425	2010-12-15 15:48:17.522021	\N	2010-12-15 15:48:17.522243	2010-12-15 15:48:17.544712	2	Willa129242809751465	Stiedemann	(240)905-3177 x890	Nathaniel Hagenes129242809751432	Valentina Point	McKenzieland	30496	Cambridgeshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	3FXIguwjOluW0BXNfSuU1ofnf0TUGrn3NROx7eArve8dUoAFOeVnFa3N0O6ppA	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
3	admin@nbs.com	76425ad195d8971d2841d46ddc7247edf020d973989798e033c1bf0891c95ebfc6c59cb3ec4d534407ea5dc8cf8b263e319313e825299221e6d7484c8833f8dd	IH63vSW13Uc26ZCV5_wE	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-15 15:48:18.360256	2010-12-15 15:48:18.210817	\N	2010-12-15 15:48:18.211037	2010-12-15 15:48:18.360684	1	Haleigh	Schowalter	(901)987-3878 x398	Isabelle Raynor I129242809820647	Satterfield Curve	Crooksville	66231-2060	Hertfordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	reE5qil7RT5eqfbEjQUmI1XqqQ9mbhljaNy2dfGFqMzmSFjbHmXQRblnkXDByY	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
4	buyer@nbs.com	d6ca42eebce543152335c685c8f2534282653a1e3b6123b8360540632ddb8f479e529f3def1576542aa5ad9257a4c5e1f215b8c224aa2ed249c130adc31833a8	fR8VhWRbUbPK2Nt3-unB	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-15 15:48:18.41384	2010-12-15 15:48:18.391306	\N	2010-12-15 15:48:18.391538	2010-12-15 15:48:18.414124	48	Kylee	Rohan	587.865.5031 x6653	Cary Nitzsche129242809838636	Hintz Wells	Marquischester	80352-9444	Greater Manchester	1	\N	\N	\N	\N	0	\N	\N	\N	\N	YyiMbXBC4bT0nFvLEWn3h7i28F5lA59e8yxdjdDrjdOA4PfS3tRoLgl8YUjUnc	f	t	0	0	0	0	0	\N	\N	\N	\N	f
5	leaduser@nbs.com	489233736cdc3e2185a86476706e8d5f3e6f5a37aca3197659ace9be16db5091b8293393fb1595f0886db321c82a50cf22d10eacc42abc9a92628f777801cfd6	Q5VLufSefFwLlrWUTCSU	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-15 15:48:18.466647	2010-12-15 15:48:18.444328	\N	2010-12-15 15:48:18.444555	2010-12-15 15:48:18.48032	64	Alfredo	Schiller	397.406.4988	Clarabelle Ernser129242809843949	Alverta Walk	Danielport	44388-3436	Oxfordshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	TLyDUeKfV7IuBP3nbN5F7fb6zdAtHJBshanXmJWLUJvjyY6aqQCIcb5CsndSjO	f	\N	0	0	0	0	0	\N	\N	\N	\N	f
\.


--
-- PostgreSQL database dump complete
--

