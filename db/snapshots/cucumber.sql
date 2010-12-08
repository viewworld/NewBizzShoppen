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
1	Electronics	Et numquam magni ut.Sequi consequatur modi tempore.	2010-12-08 12:04:02.51612	2010-12-08 12:04:02.51612	\N	1	2	\N	0	1
2	Leisure	Quia quia quisquam minus recusandae.Laboriosam mollitia ut quam porro alias assumenda.	2010-12-08 12:04:02.543713	2010-12-08 12:04:02.543713	\N	3	4	\N	0	2
3	Business	Molestiae nisi et corporis.Similique soluta fuga sint dolorum.	2010-12-08 12:04:02.564019	2010-12-08 12:04:03.072605	\N	5	6	\N	7	3
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
1	1	dk	Et numquam magni ut.Sequi consequatur modi tempore.	Electronics	2010-12-08 12:04:02.525267	2010-12-08 12:04:02.525267
2	2	dk	Quia quia quisquam minus recusandae.Laboriosam mollitia ut quam porro alias assumenda.	Leisure	2010-12-08 12:04:02.548032	2010-12-08 12:04:02.548032
3	3	dk	Molestiae nisi et corporis.Similique soluta fuga sint dolorum.	Business	2010-12-08 12:04:02.568213	2010-12-08 12:04:02.568213
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-08 12:04:02.080966	2010-12-08 12:04:02.080966
2	United Kingdom	2010-12-08 12:04:02.085657	2010-12-08 12:04:02.085657
3	Northern Ireland129180984259806	2010-12-08 12:04:02.59941	2010-12-08 12:04:02.59941
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-08 12:04:02.111061	2010-12-08 12:04:02.111061
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-08 12:04:02.126164	2010-12-08 12:04:02.126164
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-08 12:04:02.13861	2010-12-08 12:04:02.13861
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-08 12:04:02.150923	2010-12-08 12:04:02.150923
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-08 12:04:02.163378	2010-12-08 12:04:02.163378
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-08 12:04:02.175642	2010-12-08 12:04:02.175642
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-08 12:04:02.188278	2010-12-08 12:04:02.188278
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-08 12:04:02.31463	2010-12-08 12:04:02.31463
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-08 12:04:02.326801	2010-12-08 12:04:02.326801
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-08 12:04:02.338476	2010-12-08 12:04:02.338476
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-08 12:04:02.350452	2010-12-08 12:04:02.350452
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-08 12:04:02.362544	2010-12-08 12:04:02.362544
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-08 12:04:02.374635	2010-12-08 12:04:02.374635
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-08 12:04:02.386319	2010-12-08 12:04:02.386319
15	8	en	Question	<p></p>	2010-12-08 12:04:02.398348	2010-12-08 12:04:02.398348
16	8	dk	[DK] Question	<p></p>	2010-12-08 12:04:02.410352	2010-12-08 12:04:02.410352
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-08 12:04:02.102114	2010-12-08 12:04:02.121853
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-08 12:04:02.134134	2010-12-08 12:04:02.14669
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-08 12:04:02.158921	2010-12-08 12:04:02.171488
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-08 12:04:02.183731	2010-12-08 12:04:02.310562
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-08 12:04:02.322509	2010-12-08 12:04:02.334469
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-08 12:04:02.346168	2010-12-08 12:04:02.358113
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-08 12:04:02.370328	2010-12-08 12:04:02.382312
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-08 12:04:02.394091	2010-12-08 12:04:02.406272
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
1	1	dk	Ut inventore rem quam debitis perferendis.Perferendis mollitia aliquid esse eius.	Big deal on printers	Perspiciatis est est expedita animi quos est nemo.Perspiciatis exercitationem eveniet dolorum cum totam explicabo reprehenderit enim.	2010-12-08 12:04:02.801264	2010-12-08 12:04:02.801264
2	2	dk	Velit qui facere quasi animi.Nihil ipsum qui asperiores enim voluptas.	Drills required	Quisquam enim dolor voluptatem.Dolore quo eum voluptatibus.	2010-12-08 12:04:02.849383	2010-12-08 12:04:02.849383
3	3	dk	Ipsam expedita fugiat et quia dolores.Omnis facere fugiat exercitationem ut ducimus.	Need assistance in selling a car	Eum animi delectus nemo ea commodi excepturi.Nisi alias impedit aut quia eligendi et voluptas provident.	2010-12-08 12:04:02.895267	2010-12-08 12:04:02.895267
4	4	dk	Maiores exercitationem mollitia fugiat est aliquid in.Maiores culpa corporis soluta ad.	Ipod shipment	Est tempore expedita quibusdam et alias.Rem fuga nihil et aperiam et qui impedit voluptatibus.	2010-12-08 12:04:02.940681	2010-12-08 12:04:02.940681
5	5	dk	A sed numquam nisi voluptatem.Iste quam quia aut sit nemo ut maiores quibusdam.	Trip to amazonia - looking for offer	Temporibus magni facere itaque ipsa sit placeat ea quam.Ullam voluptates perferendis voluptatem facere et quaerat aliquid.	2010-12-08 12:04:02.986597	2010-12-08 12:04:02.986597
6	6	dk	Modi eos aliquam saepe officiis.Eveniet quis exercitationem rerum nesciunt voluptatibus mollitia reiciendis.	LCD - Huge amounts	Doloribus velit exercitationem consequatur.Provident labore qui consequuntur id nobis consequatur.	2010-12-08 12:04:03.031907	2010-12-08 12:04:03.031907
7	7	dk	Id optio voluptatem voluptatum.Tempora temporibus nisi corrupti sit non.	GPS receivers required	Id optio enim qui repellat velit sint sit.Qui aut exercitationem at harum dolorem.	2010-12-08 12:04:03.079364	2010-12-08 12:04:03.079364
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating) FROM stdin;
1	Big deal on printers	3	Ut inventore rem quam debitis perferendis.Perferendis mollitia aliquid esse eius.	Perspiciatis est est expedita animi quos est nemo.Perspiciatis exercitationem eveniet dolorum cum totam explicabo reprehenderit enim.	2	User::Agent	0	367.0	111.0	1	Ratke	Elaina Ledner	218.202.2851 x16210	norma@schummbeatty.us	2389 Harber Plain	2010-12-08 12:04:02.655199	2010-12-08 12:04:02.655199	2010-12-13	Joanne129180984259726 Zboncak	1	t	\N	0	0	f	f
2	Drills required	3	Velit qui facere quasi animi.Nihil ipsum qui asperiores enim voluptas.	Quisquam enim dolor voluptatem.Dolore quo eum voluptatibus.	2	User::Agent	0	541.0	788.0	1	Willmswatsica	Rylee Bechtelar Sr.	336-320-4397	syble@waltermarquardt.biz	3462 Darien Glen	2010-12-08 12:04:02.827819	2010-12-08 12:04:02.827819	2010-12-13	Joanne129180984259726 Zboncak	1	t	\N	0	0	f	f
3	Need assistance in selling a car	3	Ipsam expedita fugiat et quia dolores.Omnis facere fugiat exercitationem ut ducimus.	Eum animi delectus nemo ea commodi excepturi.Nisi alias impedit aut quia eligendi et voluptas provident.	2	User::Agent	0	736.0	318.0	1	Medhurst	Miss Columbus Bradtke	728-603-7210	karli@creminfeest.us	94372 Henderson Skyway	2010-12-08 12:04:02.873533	2010-12-08 12:04:02.873533	2010-12-13	Joanne129180984259726 Zboncak	1	t	\N	0	0	f	f
4	Ipod shipment	3	Maiores exercitationem mollitia fugiat est aliquid in.Maiores culpa corporis soluta ad.	Est tempore expedita quibusdam et alias.Rem fuga nihil et aperiam et qui impedit voluptatibus.	2	User::Agent	0	472.0	992.0	1	Mraz	Kacey Jewess	466-569-4611 x044	stefan@stehrframi.biz	28480 Gabrielle Roads	2010-12-08 12:04:02.91912	2010-12-08 12:04:02.91912	2010-12-13	Joanne129180984259726 Zboncak	1	t	\N	0	0	f	f
5	Trip to amazonia - looking for offer	3	A sed numquam nisi voluptatem.Iste quam quia aut sit nemo ut maiores quibusdam.	Temporibus magni facere itaque ipsa sit placeat ea quam.Ullam voluptates perferendis voluptatem facere et quaerat aliquid.	2	User::Agent	0	839.0	323.0	1	Sporerdickens	Simone Nicolas	(678)099-0613 x49518	demond.barton@dickens.info	467 Jacklyn Lane	2010-12-08 12:04:02.96391	2010-12-08 12:04:02.96391	2010-12-13	Joanne129180984259726 Zboncak	1	t	\N	0	0	f	f
6	LCD - Huge amounts	3	Modi eos aliquam saepe officiis.Eveniet quis exercitationem rerum nesciunt voluptatibus mollitia reiciendis.	Doloribus velit exercitationem consequatur.Provident labore qui consequuntur id nobis consequatur.	2	User::Agent	0	358.0	479.0	1	Zemlakstracke	Antonio Bradtke Sr.	1-334-060-7586 x4820	jailyn_watsica@wolf.biz	3923 Maurice Square	2010-12-08 12:04:03.00971	2010-12-08 12:04:03.00971	2010-12-13	Joanne129180984259726 Zboncak	1	t	\N	0	0	f	f
7	GPS receivers required	3	Id optio voluptatem voluptatum.Tempora temporibus nisi corrupti sit non.	Id optio enim qui repellat velit sint sit.Qui aut exercitationem at harum dolorem.	2	User::Agent	0	420.0	378.0	1	Bednar	Mitchell VonRueden	(855)604-0797	lucienne@connelly.com	46913 Rebekah Plain	2010-12-08 12:04:03.05654	2010-12-08 12:04:03.05654	2010-12-13	Joanne129180984259726 Zboncak	1	t	\N	0	0	f	f
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-08 12:04:02.059134	2010-12-08 12:04:02.059134
2	default_leads_per_page	--- 5\n	2010-12-08 12:04:02.068597	2010-12-08 12:04:02.068597
3	certification_level_1	--- 10\n	2010-12-08 12:04:02.070759	2010-12-08 12:04:02.070759
4	certification_level_2	--- 20\n	2010-12-08 12:04:02.072765	2010-12-08 12:04:02.072765
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
1	blazejek@gmail.com	f5f297a11ce76e4c01725e8d068fce2d70266106c220620027018315e59b9e4ecd1f548d07bd3a26e37b1524e7e4fd07d5903eee1e6766c6e1a18bdeac7517f2	YJiiAn10nb2GWj6YeqW5	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 12:04:02.497543	2010-12-08 12:04:02.440172	\N	2010-12-08 12:04:02.44039	2010-12-08 12:04:02.497811	1	Heather	Johnston	1-008-171-2000	root	Brando Turnpike	West Draketon	45379-1574	Warwickshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	5Browfgmm3BTleWfLBeSqWvl6iiL62UULkfaAV8rru80238sHjVSRL1NYfUDZS	f	\N	0	0	0	0	0
2	agent@nbs.com	6bb0f482659d191ba5b3fc4ace82a7a0d5d32ebec14094579416b3ba9267b1c2b7ebbd3bef7bed51167686ac8b6abc0144ad30f75b74ec6e7fc95eb665842680	a27r7MVuBa2aoytuoHzL	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 12:04:02.626498	2010-12-08 12:04:02.60472	\N	2010-12-08 12:04:02.604939	2010-12-08 12:04:02.626781	2	Joanne129180984259726	Zboncak	(494)541-5254	Annalise Grimes129180984259692	Merle Underpass	Noemieside	46685	Gloucestershire	3	\N	0	\N	\N	0	\N	\N	\N	\N	bBzkTekZXbGDIG8O01LMqOj1GlsX0PEw0CYptsDITI1hoAEsXl4bApxHG0MyD4	f	\N	0	0	0	0	0
3	admin@nbs.com	68e79963b604db246723740e3b2f16235217c6544471b150be5ac67e255f14c481372e86b6793f6007addf867a478a4098f4fc227fd363e8b77dfd497864065c	r5sopWvKApAxKQtoR4Zi	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 12:04:03.26391	2010-12-08 12:04:03.243752	\N	2010-12-08 12:04:03.243961	2010-12-08 12:04:03.264189	1	Lenore	Bernier	465.632.5812 x733	Ola Daugherty129180984323934	Creola Locks	East Francisca	17084	Dumfries and Galloway	1	\N	\N	\N	\N	0	\N	\N	\N	\N	B0TBxPkWOLFOGSnmAIiiJcxteghczciUqH9zQHGlRujL1Aj5ysOFNORftaTiID	f	\N	0	0	0	0	0
4	buyer@nbs.com	f3ba178548bd86c80ee9902a749565afeeac6c0e6f9c21c084a338f478d9afd1f46d6aa39f9b000d3c2977bca53b058ca59ecb371d9fdbe38145926f7f0d6b26	ewjEZup6xnrM41KMaaUU	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 12:04:03.314381	2010-12-08 12:04:03.292382	\N	2010-12-08 12:04:03.292705	2010-12-08 12:04:03.314649	48	Caterina	Kuhlman	981.950.1467	Dr. Reina Fisher129180984328751	Estevan Common	Johnsshire	52316	Norfolk	1	\N	\N	\N	\N	0	\N	\N	\N	\N	rCdvfpcON4TJKOlQO96X4hhOdvUgISxIb1XxLMfHaFd67yKoN5pNe5mz5c2jYb	f	t	0	0	0	0	0
5	leaduser@nbs.com	ae54b05c4f2d9f29ff9225926bec0bf595cc0e75940d4e1c61426034aab6ed5774e884b9f23c18ddb11a26422531813763ecc8896543bb055dc500f6e0abcfc7	BJziDSysW_icMLjGU5DC	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 12:04:03.364019	2010-12-08 12:04:03.342092	\N	2010-12-08 12:04:03.342329	2010-12-08 12:04:03.377586	64	Ashlee	Cruickshank	1-026-306-7074 x926	Gudrun Harvey V129180984333763	Weimann Spurs	New Alva	71571-4369	Tayside	1	\N	\N	4	\N	0	\N	\N	\N	\N	MlMMiklyqZjhRSugiWJKGxRfdKbp8zN3hTYjBKEcsocOyihoQVRS0Gye20Q7io	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

