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
1	Electronics	Fugiat ipsum placeat nihil expedita repellat ipsam.Quia beatae asperiores aut incidunt alias voluptatem.	2010-12-08 12:26:45.978054	2010-12-08 12:26:45.978054	\N	1	2	\N	0	1
2	Leisure	Necessitatibus ab consequatur error.Sed itaque iusto doloremque est beatae officiis.	2010-12-08 12:26:46.020656	2010-12-08 12:26:46.020656	\N	3	4	\N	0	2
3	Business	Explicabo aut officia quam et magnam omnis.Ut culpa dolor optio corrupti ut aut non.	2010-12-08 12:26:46.053212	2010-12-08 12:26:46.648727	\N	5	6	\N	7	3
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
1	1	dk	Fugiat ipsum placeat nihil expedita repellat ipsam.Quia beatae asperiores aut incidunt alias voluptatem.	Electronics	2010-12-08 12:26:45.990657	2010-12-08 12:26:45.990657
2	2	dk	Necessitatibus ab consequatur error.Sed itaque iusto doloremque est beatae officiis.	Leisure	2010-12-08 12:26:46.026576	2010-12-08 12:26:46.026576
3	3	dk	Explicabo aut officia quam et magnam omnis.Ut culpa dolor optio corrupti ut aut non.	Business	2010-12-08 12:26:46.059452	2010-12-08 12:26:46.059452
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-08 12:26:45.443654	2010-12-08 12:26:45.443654
2	United Kingdom	2010-12-08 12:26:45.452242	2010-12-08 12:26:45.452242
3	Northern Ireland129181120610561	2010-12-08 12:26:46.107262	2010-12-08 12:26:46.107262
\.


--
-- Data for Name: country_interests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY country_interests (id, country_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2010-12-08 12:26:45.490175	2010-12-08 12:26:45.490175
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2010-12-08 12:26:45.514504	2010-12-08 12:26:45.514504
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2010-12-08 12:26:45.535458	2010-12-08 12:26:45.535458
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2010-12-08 12:26:45.553681	2010-12-08 12:26:45.553681
5	3	en	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	Somebody shared leads with you	2010-12-08 12:26:45.572621	2010-12-08 12:26:45.572621
6	3	dk	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	[DK] Somebody shared leads with you	2010-12-08 12:26:45.593246	2010-12-08 12:26:45.593246
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2010-12-08 12:26:45.617238	2010-12-08 12:26:45.617238
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2010-12-08 12:26:45.63783	2010-12-08 12:26:45.63783
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2010-12-08 12:26:45.656681	2010-12-08 12:26:45.656681
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2010-12-08 12:26:45.678821	2010-12-08 12:26:45.678821
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2010-12-08 12:26:45.706383	2010-12-08 12:26:45.706383
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2010-12-08 12:26:45.724375	2010-12-08 12:26:45.724375
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2010-12-08 12:26:45.742853	2010-12-08 12:26:45.742853
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2010-12-08 12:26:45.761888	2010-12-08 12:26:45.761888
15	8	en	<p></p>	Question	2010-12-08 12:26:45.781376	2010-12-08 12:26:45.781376
16	8	dk	<p></p>	[DK] Question	2010-12-08 12:26:45.801264	2010-12-08 12:26:45.801264
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-08 12:26:45.478791	2010-12-08 12:26:45.508252
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-08 12:26:45.529031	2010-12-08 12:26:45.548331
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-08 12:26:45.566903	2010-12-08 12:26:45.586582
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-08 12:26:45.611503	2010-12-08 12:26:45.630047
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-08 12:26:45.650833	2010-12-08 12:26:45.672901
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-08 12:26:45.697547	2010-12-08 12:26:45.719068
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-08 12:26:45.737159	2010-12-08 12:26:45.756319
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-08 12:26:45.775675	2010-12-08 12:26:45.795464
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
1	1	dk	Explicabo dicta recusandae rerum nihil est.Commodi in voluptatem vel sed excepturi.	Mollitia earum autem officiis rerum id commodi exercitationem et.Et voluptas aliquid quia non et.	Big deal on printers	2010-12-08 12:26:46.232968	2010-12-08 12:26:46.232968
2	2	dk	Laboriosam deleniti culpa voluptatem autem sit.Ut tempore voluptates suscipit nihil magni voluptatem omnis.	Debitis ut aliquid quidem sint illo rerum voluptates.Assumenda dignissimos magnam aut vel qui pariatur odit autem.	Drills required	2010-12-08 12:26:46.313758	2010-12-08 12:26:46.313758
3	3	dk	Exercitationem praesentium est beatae autem modi voluptate est earum.Ut eveniet distinctio ea reprehenderit recusandae repellat ipsam.	Alias tenetur quisquam ex aliquam dignissimos.Maxime in adipisci quis vel ad velit.	Need assistance in selling a car	2010-12-08 12:26:46.390029	2010-12-08 12:26:46.390029
4	4	dk	Dolorum harum quia nulla consequatur totam mollitia similique.Illo vero vel quae incidunt iste.	Mollitia non eveniet earum qui nostrum.Enim quis cumque ipsam consequatur.	Ipod shipment	2010-12-08 12:26:46.460262	2010-12-08 12:26:46.460262
5	5	dk	Illo perspiciatis temporibus et nesciunt ipsum quia.A commodi et id.	Aut earum illum eum inventore hic rerum non error.Et sit et dolorem voluptatibus beatae aspernatur eius inventore.	Trip to amazonia - looking for offer	2010-12-08 12:26:46.526936	2010-12-08 12:26:46.526936
6	6	dk	Autem recusandae modi maxime esse assumenda.Id qui totam est est.	Omnis neque accusantium ducimus atque.Omnis est voluptatem provident est.	LCD - Huge amounts	2010-12-08 12:26:46.593198	2010-12-08 12:26:46.593198
7	7	dk	Dolorem sequi maiores natus est debitis aut qui.Et minima dolor omnis nam autem saepe quo iusto.	Eius in quidem laborum qui soluta repellat molestiae.Sint aut at omnis porro voluptas eaque voluptates magni.	GPS receivers required	2010-12-08 12:26:46.658157	2010-12-08 12:26:46.658157
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating) FROM stdin;
1	Big deal on printers	3	Mollitia earum autem officiis rerum id commodi exercitationem et.Et voluptas aliquid quia non et.	Explicabo dicta recusandae rerum nihil est.Commodi in voluptatem vel sed excepturi.	2	User::Agent	0	81.0	96.0	1	Nolan	Jamarcus Towne	002.632.0291 x593	linnie@wintheisermante.us	4511 Reilly Mill	2010-12-08 12:26:46.194072	2010-12-08 12:26:46.194072	2010-12-13	Joseph129181120610451 Dicki	1	t	\N	0	0	f	f
2	Drills required	3	Debitis ut aliquid quidem sint illo rerum voluptates.Assumenda dignissimos magnam aut vel qui pariatur odit autem.	Laboriosam deleniti culpa voluptatem autem sit.Ut tempore voluptates suscipit nihil magni voluptatem omnis.	2	User::Agent	0	24.0	445.0	1	Gerhold	Courtney Mohr	851.778.5163 x67068	lance.gutmann@simonis.uk	94476 Elsie Avenue	2010-12-08 12:26:46.279937	2010-12-08 12:26:46.279937	2010-12-13	Joseph129181120610451 Dicki	1	t	\N	0	0	f	f
3	Need assistance in selling a car	3	Alias tenetur quisquam ex aliquam dignissimos.Maxime in adipisci quis vel ad velit.	Exercitationem praesentium est beatae autem modi voluptate est earum.Ut eveniet distinctio ea reprehenderit recusandae repellat ipsam.	2	User::Agent	0	830.0	494.0	1	Bailey	Marilou Bernier	(831)874-7077	agustina@olson.ca	65785 Hyatt Glens	2010-12-08 12:26:46.354801	2010-12-08 12:26:46.354801	2010-12-13	Joseph129181120610451 Dicki	1	t	\N	0	0	f	f
4	Ipod shipment	3	Mollitia non eveniet earum qui nostrum.Enim quis cumque ipsam consequatur.	Dolorum harum quia nulla consequatur totam mollitia similique.Illo vero vel quae incidunt iste.	2	User::Agent	0	884.0	149.0	1	Dubuquecrist	Litzy Glover	1-467-729-7172	imelda@breitenberg.name	0824 Bosco Plaza	2010-12-08 12:26:46.426945	2010-12-08 12:26:46.426945	2010-12-13	Joseph129181120610451 Dicki	1	t	\N	0	0	f	f
5	Trip to amazonia - looking for offer	3	Aut earum illum eum inventore hic rerum non error.Et sit et dolorem voluptatibus beatae aspernatur eius inventore.	Illo perspiciatis temporibus et nesciunt ipsum quia.A commodi et id.	2	User::Agent	0	767.0	683.0	1	Gerlach	Gilda Feil Sr.	019-888-6923 x4620	cindy_kuphal@collins.uk	5239 Hoeger Parkways	2010-12-08 12:26:46.496858	2010-12-08 12:26:46.496858	2010-12-13	Joseph129181120610451 Dicki	1	t	\N	0	0	f	f
6	LCD - Huge amounts	3	Omnis neque accusantium ducimus atque.Omnis est voluptatem provident est.	Autem recusandae modi maxime esse assumenda.Id qui totam est est.	2	User::Agent	0	124.0	0.0	1	Rutherfordoconnell	Julien Raynor	374.369.4894	audie.monahan@schmidtgleichner.biz	8920 Mckayla Expressway	2010-12-08 12:26:46.563355	2010-12-08 12:26:46.563355	2010-12-13	Joseph129181120610451 Dicki	1	t	\N	0	0	f	f
7	GPS receivers required	3	Eius in quidem laborum qui soluta repellat molestiae.Sint aut at omnis porro voluptas eaque voluptates magni.	Dolorem sequi maiores natus est debitis aut qui.Et minima dolor omnis nam autem saepe quo iusto.	2	User::Agent	0	388.0	2.0	1	Homenickluettgen	Ms. Nathanial Jacobs	1-801-649-3081 x5478	blanche_ratke@daniel.biz	1795 Logan Bypass	2010-12-08 12:26:46.628212	2010-12-08 12:26:46.628212	2010-12-13	Joseph129181120610451 Dicki	1	t	\N	0	0	f	f
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-08 12:26:45.398165	2010-12-08 12:26:45.398165
2	default_leads_per_page	--- 5\n	2010-12-08 12:26:45.412378	2010-12-08 12:26:45.412378
3	certification_level_1	--- 10\n	2010-12-08 12:26:45.418132	2010-12-08 12:26:45.418132
4	certification_level_2	--- 20\n	2010-12-08 12:26:45.425482	2010-12-08 12:26:45.425482
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
1	blazejek@gmail.com	05f3807a77e291e53d9ffac8817bc2b5c06db270a3d89aa5b710968529a65bd56e6ba7e81f7940fc290b07a44a8c21e3713db9ff53b156a132fb460af39c33d6	FcaBEX5w16_5rmIdw2ko	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 12:26:45.937256	2010-12-08 12:26:45.847839	\N	2010-12-08 12:26:45.848131	2010-12-08 12:26:45.937825	1	Karolann	Rolfson	510.701.2414	root	Jennifer Spur	Yostberg	77843	Lancashire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	jfzQYx3Rzxh4Ap4Q8Sx7VZv62V1MjVgUvlvLyYE4oxAXCTYnpPcfWynqfl6m2W	f	\N	0	0	0	0	0
2	agent@nbs.com	dec3eda40775ec20808810a9ca56aa449a65799d8a98cc33ea5f8a5ede7c5bf58696c445e8ffeb19cf099868fb4a6c040c1f7b001d31efedadbc4a4ae9d7e048	-OwhlwS6zQ6X7rdYZoGl	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 12:26:46.152789	2010-12-08 12:26:46.117846	\N	2010-12-08 12:26:46.118111	2010-12-08 12:26:46.153225	2	Joseph129181120610451	Dicki	676-113-5376	Mrs. Reilly Thompson129181120610409	Armand Pike	Port Chancebury	27269-4750	Cornwall	3	\N	0	\N	\N	0	\N	\N	\N	\N	IZHkQ4Lrejdf0aGw0EudcIUTxHsnyWgsqKzYxKc7IddxWjDrnaqA7CNe4XVUCh	f	\N	0	0	0	0	0
3	admin@nbs.com	f151f9f2321156ae48f38d626c8820c29229475ea0142e5793ac7b18f756cf4016a949bbc4863e607f113f8e2ac59ac4f724f10e9949da1e6c8c105193c2cfdb	qjKjWPMxJO-j9kvJrTVW	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 12:26:46.757154	2010-12-08 12:26:46.727878	\N	2010-12-08 12:26:46.728158	2010-12-08 12:26:46.757581	1	Vicky	Hahn	1-034-302-5765	Michaela Bogisich129181120672167	Vanessa Plains	Tomville	54058-9579	East Sussex	1	\N	\N	\N	\N	0	\N	\N	\N	\N	G7rkdHIiVcw40gVYeTTlWQjJMcop4LlMSsuUy581TM9ssV3ajwVFvQaIp7SWap	f	\N	0	0	0	0	0
4	buyer@nbs.com	ce0da1d4f5c02772ecd4183af1b478b93b9b8db0b33394ed1f53482087badc9d9327bdbe1ed6e285e5d4a50e29c7d3f893c79afb60643a0c6350079fc26e84f7	XBTg8F8r6RPALK40qX0w	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 12:26:46.826583	2010-12-08 12:26:46.795919	\N	2010-12-08 12:26:46.796213	2010-12-08 12:26:46.827955	48	Darryl	Ortiz	190-998-7549	Jo Torp129181120678923	Edgar Fields	Elsafurt	46675-9806	West Yorkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	T5k1DiZ4kDSBgXmfw7CWtOKL2G7KO5zmzLsbdDWK8FDI2mMZaYu1woWNprt0Py	f	t	0	0	0	0	0
5	leaduser@nbs.com	a41e9f46fc571efc1fa31e8d97eae2b44b52ae18a5d6e68080947f4f75bc1a3f8aee927b5ea4f7d7cc44ece46819a43d30a819b27c70656bbd0612849a9cc708	IoN7V3HrjK6smsy-EXmw	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 12:26:47.166551	2010-12-08 12:26:47.133489	\N	2010-12-08 12:26:47.133776	2010-12-08 12:26:47.193003	64	Magnolia	Ebert	(532)953-4086	Mr. Mozelle Thompson129181120712748	Luisa Squares	Lake Carey	77475	Shropshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	IGTYIpZCFC4QMkWp6rjLqDoP4gg5wBDYqLhOvOmW0Mxe2VAuOIqMorjGPM6vEr	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

