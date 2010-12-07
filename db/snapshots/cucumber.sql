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

SELECT pg_catalog.setval('category_translations_id_seq', 3, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('countries_id_seq', 3, true);


--
-- Name: country_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_interests_id_seq', 1, false);


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

SELECT pg_catalog.setval('settings_id_seq', 4, true);


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
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug) FROM stdin;
1	Electronics	Dicta esse sapiente voluptatibus aliquid accusantium temporibus deleniti.Ab aperiam doloremque qui.	2010-12-07 08:45:31.890841	2010-12-07 08:45:31.890841	\N	1	2	\N	0	1
2	Leisure	Repellendus eum voluptas aut repellat quis impedit.Nihil sit unde non fugit aperiam.	2010-12-07 08:45:31.918626	2010-12-07 08:45:31.918626	\N	3	4	\N	0	2
3	Business	Qui ullam consectetur cupiditate.Dolorum alias in quibusdam dolores dolorem nostrum ipsa.	2010-12-07 08:45:31.938595	2010-12-07 08:45:32.445915	\N	5	6	\N	7	3
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
1	1	dk	Dicta esse sapiente voluptatibus aliquid accusantium temporibus deleniti.Ab aperiam doloremque qui.	Electronics	2010-12-07 08:45:31.900055	2010-12-07 08:45:31.900055
2	2	dk	Repellendus eum voluptas aut repellat quis impedit.Nihil sit unde non fugit aperiam.	Leisure	2010-12-07 08:45:31.922635	2010-12-07 08:45:31.922635
3	3	dk	Qui ullam consectetur cupiditate.Dolorum alias in quibusdam dolores dolorem nostrum ipsa.	Business	2010-12-07 08:45:31.942978	2010-12-07 08:45:31.942978
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-07 08:45:31.452843	2010-12-07 08:45:31.452843
2	United Kingdom	2010-12-07 08:45:31.456964	2010-12-07 08:45:31.456964
3	Northern Ireland	2010-12-07 08:45:31.973109	2010-12-07 08:45:31.973109
\.


--
-- Data for Name: country_interests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY country_interests (id, country_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, subject, body, created_at, updated_at) FROM stdin;
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-07 08:45:31.482711	2010-12-07 08:45:31.482711
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-07 08:45:31.497714	2010-12-07 08:45:31.497714
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-07 08:45:31.51081	2010-12-07 08:45:31.51081
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-07 08:45:31.523438	2010-12-07 08:45:31.523438
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-07 08:45:31.536026	2010-12-07 08:45:31.536026
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-07 08:45:31.548354	2010-12-07 08:45:31.548354
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-07 08:45:31.560927	2010-12-07 08:45:31.560927
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-07 08:45:31.689895	2010-12-07 08:45:31.689895
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-07 08:45:31.701844	2010-12-07 08:45:31.701844
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-07 08:45:31.713535	2010-12-07 08:45:31.713535
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-07 08:45:31.725742	2010-12-07 08:45:31.725742
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-07 08:45:31.737312	2010-12-07 08:45:31.737312
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-07 08:45:31.749171	2010-12-07 08:45:31.749171
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-07 08:45:31.760823	2010-12-07 08:45:31.760823
15	8	en	Question	<p></p>	2010-12-07 08:45:31.772978	2010-12-07 08:45:31.772978
16	8	dk	[DK] Question	<p></p>	2010-12-07 08:45:31.784675	2010-12-07 08:45:31.784675
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-07 08:45:31.473706	2010-12-07 08:45:31.493349
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-07 08:45:31.50583	2010-12-07 08:45:31.518904
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-07 08:45:31.531579	2010-12-07 08:45:31.544225
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-07 08:45:31.556389	2010-12-07 08:45:31.685459
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-07 08:45:31.697612	2010-12-07 08:45:31.709566
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-07 08:45:31.721129	2010-12-07 08:45:31.733383
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-07 08:45:31.744861	2010-12-07 08:45:31.75688
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-07 08:45:31.768691	2010-12-07 08:45:31.780689
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
1	1	dk	Blanditiis facilis quas enim.Exercitationem libero quasi illum voluptatibus voluptas.	Big deal on printers	Aut vero corrupti praesentium est nostrum optio.Est eius perspiciatis rerum dolorem id non.	2010-12-07 08:45:32.176449	2010-12-07 08:45:32.176449
2	2	dk	Vitae sunt delectus ea reiciendis dignissimos quia.Omnis modi et ex molestiae.	Drills required	Aut illum dignissimos accusamus.Ut est et eum.	2010-12-07 08:45:32.22434	2010-12-07 08:45:32.22434
3	3	dk	Sequi consequuntur maiores laudantium reprehenderit in.Doloremque voluptas quam vel accusamus laboriosam pariatur.	Need assistance in selling a car	Sint nostrum error unde enim beatae aspernatur.Et id rerum sit distinctio assumenda.	2010-12-07 08:45:32.270631	2010-12-07 08:45:32.270631
4	4	dk	Nam a doloremque harum eos fugiat.Optio delectus facere commodi maxime aut porro soluta quia.	Ipod shipment	Perspiciatis cumque qui accusantium voluptate suscipit.Fugiat nesciunt quia quis.	2010-12-07 08:45:32.31606	2010-12-07 08:45:32.31606
5	5	dk	Quasi sunt deserunt ut pariatur repellat.Ipsum officia sapiente ea unde.	Trip to amazonia - looking for offer	Tempora id et est voluptatem quo nihil.Aut dicta vero ut officiis quae.	2010-12-07 08:45:32.360582	2010-12-07 08:45:32.360582
6	6	dk	Dolores fugiat totam unde delectus repudiandae.Perspiciatis quidem asperiores eveniet incidunt nihil.	LCD - Huge amounts	Dignissimos sunt dolorum quam.Ea officiis incidunt accusamus est eius numquam.	2010-12-07 08:45:32.406082	2010-12-07 08:45:32.406082
7	7	dk	Ut accusamus dolor est ipsum.Soluta optio suscipit nisi.	GPS receivers required	Et velit dolores odio laboriosam aperiam nesciunt.Facilis aliquid rerum voluptatibus minima.	2010-12-07 08:45:32.452507	2010-12-07 08:45:32.452507
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating) FROM stdin;
1	Big deal on printers	3	Blanditiis facilis quas enim.Exercitationem libero quasi illum voluptatibus voluptas.	Aut vero corrupti praesentium est nostrum optio.Est eius perspiciatis rerum dolorem id non.	2	User::Agent	0	116.0	916.0	1	Collins	Hardy Stehr	038.619.3485 x650	garry.hagenes@steuberschmidt.biz	6383 Dario River	2010-12-07 08:45:32.028554	2010-12-07 08:45:32.028554	2010-12-12	Lavern Klocko	1	f	\N	0	0	f	f
2	Drills required	3	Vitae sunt delectus ea reiciendis dignissimos quia.Omnis modi et ex molestiae.	Aut illum dignissimos accusamus.Ut est et eum.	2	User::Agent	0	318.0	470.0	1	Mclaughlin	Amaya Klein	443-969-3985 x2893	rashad_swaniawski@spinka.info	5435 Ivy Trail	2010-12-07 08:45:32.203063	2010-12-07 08:45:32.203063	2010-12-12	Lavern Klocko	1	f	\N	0	0	f	f
3	Need assistance in selling a car	3	Sequi consequuntur maiores laudantium reprehenderit in.Doloremque voluptas quam vel accusamus laboriosam pariatur.	Sint nostrum error unde enim beatae aspernatur.Et id rerum sit distinctio assumenda.	2	User::Agent	0	91.0	371.0	1	Hodkiewicz	Charlotte Hodkiewicz	1-155-068-9533 x1598	andres_baumbach@hicklekrajcik.name	15851 Smitham Ville	2010-12-07 08:45:32.248149	2010-12-07 08:45:32.248149	2010-12-12	Lavern Klocko	1	f	\N	0	0	f	f
4	Ipod shipment	3	Nam a doloremque harum eos fugiat.Optio delectus facere commodi maxime aut porro soluta quia.	Perspiciatis cumque qui accusantium voluptate suscipit.Fugiat nesciunt quia quis.	2	User::Agent	0	485.0	290.0	1	Bailey	Effie Dibbert	951-924-6283 x792	lisandro.sauer@bogan.uk	605 Kuhlman Estate	2010-12-07 08:45:32.294452	2010-12-07 08:45:32.294452	2010-12-12	Lavern Klocko	1	f	\N	0	0	f	f
5	Trip to amazonia - looking for offer	3	Quasi sunt deserunt ut pariatur repellat.Ipsum officia sapiente ea unde.	Tempora id et est voluptatem quo nihil.Aut dicta vero ut officiis quae.	2	User::Agent	0	514.0	905.0	1	Padberg	Miss Shemar Wolf	1-316-630-3179	karson@abernathy.ca	363 Collins Knoll	2010-12-07 08:45:32.339196	2010-12-07 08:45:32.339196	2010-12-12	Lavern Klocko	1	f	\N	0	0	f	f
6	LCD - Huge amounts	3	Dolores fugiat totam unde delectus repudiandae.Perspiciatis quidem asperiores eveniet incidunt nihil.	Dignissimos sunt dolorum quam.Ea officiis incidunt accusamus est eius numquam.	2	User::Agent	0	776.0	845.0	1	Terry	Barbara Simonis	680-452-2829 x98722	fidel@oconnell.name	3639 Farrell Keys	2010-12-07 08:45:32.383963	2010-12-07 08:45:32.383963	2010-12-12	Lavern Klocko	1	f	\N	0	0	f	f
7	GPS receivers required	3	Ut accusamus dolor est ipsum.Soluta optio suscipit nisi.	Et velit dolores odio laboriosam aperiam nesciunt.Facilis aliquid rerum voluptatibus minima.	2	User::Agent	0	342.0	875.0	1	Vonrueden	Mrs. Gertrude Upton	1-231-007-0187	davion@toy.name	53642 Jaskolski Drive	2010-12-07 08:45:32.429979	2010-12-07 08:45:32.429979	2010-12-12	Lavern Klocko	1	f	\N	0	0	f	f
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-07 08:45:31.43427	2010-12-07 08:45:31.43427
2	default_leads_per_page	--- 5\n	2010-12-07 08:45:31.443776	2010-12-07 08:45:31.443776
3	certification_level_1	--- 10\n	2010-12-07 08:45:31.445894	2010-12-07 08:45:31.445894
4	certification_level_2	--- 20\n	2010-12-07 08:45:31.447954	2010-12-07 08:45:31.447954
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter) FROM stdin;
1	blazejek@gmail.com	f34a9410ed7c4235ba9a87e730c02112bd777ad0522a1c4cf95d278b6c4fcea21f0d64edaa8c3e3de9fa950416359f56822ca24cb6977a08cbfd6b478e866133	8vGPTbpi3gycB68HR7c_	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 08:45:31.8726	2010-12-07 08:45:31.817091	\N	2010-12-07 08:45:31.817307	2010-12-07 08:45:31.872865	1	Alene	Glover	(194)317-4209 x353	root	Edwardo Run	Easterland	66174	Dumfries and Galloway	1	\N	\N	\N	\N	0	\N	\N	\N	\N	wJzsP5C2ZeLvhreVFXllrWbWRBqDx2OmJ1nhiAEWGI3XySLUk8arLGmxuaXduR	f	\N	0	0	0	0	0
2	agent@nbs.com	38b2f61227825f0600befae978c98c108001ce13dd688f6cc312f03ccf18efc0d32d4e0f863f559b2812476c76f706bad87daf70df48262a6e5c92802e68b4e0	qGNd33mB5SHxrTGmV81B	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 08:45:31.999795	2010-12-07 08:45:31.978377	\N	2010-12-07 08:45:31.978574	2010-12-07 08:45:32.000075	2	Lavern	Klocko	1-775-246-6219 x2330	Cletus Feeney4886	Schaefer Lodge	East Toy	96878	Wiltshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	sWWzn2mTANBodehbJGZ0GYnNBRmldaFbHIlQwp9ky7lOUInwECRby88xUPtsRs	f	\N	0	0	0	0	0
3	admin@nbs.com	47e904c153633e9e75f2754083c6c1243a93ab11f9a5324bd7a6811c686001945233f02324fed5a77541e804c002ed31414885f04ea2cb4153f283422c068105	Ul8t_G9mB-Lbz3q-iPw-	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 08:45:32.633919	2010-12-07 08:45:32.614397	\N	2010-12-07 08:45:32.614613	2010-12-07 08:45:32.634213	1	Desiree	Mitchell	272-671-3109 x1514	Terence Bode4208	Marjory Court	Port Inesfurt	03254	Cambridgeshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	teL2mEULWNS7BLMk5CX247ZYmCVo2hzqGiInHQUk4dKlpJkJzpd8bR2CSnniGw	f	\N	0	0	0	0	0
4	buyer@nbs.com	d3a43f934c656ac42fcbb037c65261b11e96cfc55f83b122dbcd819a389cd7f9f5fb09151303607c301d93e6c1111ff41a0345a2dbc3ec372fe31389501e886a	Lj-bPCyBhvTO3AqxakAY	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 08:45:32.684558	2010-12-07 08:45:32.662989	\N	2010-12-07 08:45:32.663209	2010-12-07 08:45:32.684864	48	Lisa	Mayer	1-675-304-3945	Brody Zboncak6423	Verna Key	South Bret	12500	West Midlands	1	\N	\N	\N	\N	0	\N	\N	\N	\N	iRpaJe2kE8wAhmv1i9n2S5VzKv8eZRcCMzUjloKNDaynPRg8KZiUkfSdcc5Xwk	f	t	0	0	0	0	0
5	leaduser@nbs.com	d34fecac6478cdb4d9f6c25ead932261e63e93cd711cd9d05ac70ba4a715a44067925aba477ae622825871bc4caabc8808f5c0d03e75359bb75d20423fa5a6b6	ks65dFW0Yu6Z_Nz_-1JS	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 08:45:32.733556	2010-12-07 08:45:32.7121	\N	2010-12-07 08:45:32.712328	2010-12-07 08:45:32.746814	64	Shyanne	Brakus	270.145.1870 x2715	Skyla Strosin PhD2032	Gregg Valley	Alishastad	21591	East Sussex	1	\N	\N	4	\N	0	\N	\N	\N	\N	tCJZDvujPeiL0SpPStdawSiDzObY5jsoyTR3WVrqaFO40wBNbeipcG16t9gp2M	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

