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

SELECT pg_catalog.setval('article_translations_id_seq', 16, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 8, true);


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
1	1	dk	About us	About us	2010-12-09 10:09:40.471784	2010-12-09 10:09:40.471784
2	1	en	About us	About us	2010-12-09 10:09:40.48676	2010-12-09 10:09:40.48676
3	2	dk	Privacy	Privacy	2010-12-09 10:09:40.516729	2010-12-09 10:09:40.516729
4	2	en	Privacy	Privacy	2010-12-09 10:09:40.529027	2010-12-09 10:09:40.529027
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-09 10:09:40.559625	2010-12-09 10:09:40.559625
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-09 10:09:40.571837	2010-12-09 10:09:40.571837
7	4	dk	Blurb sign up	Blurb sign up	2010-12-09 10:09:40.599043	2010-12-09 10:09:40.599043
8	4	en	Blurb sign up	Blurb sign up	2010-12-09 10:09:40.61104	2010-12-09 10:09:40.61104
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-09 10:09:40.637846	2010-12-09 10:09:40.637846
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-09 10:09:40.649709	2010-12-09 10:09:40.649709
11	6	dk	Blurb agent home	Blurb agent home	2010-12-09 10:09:40.681258	2010-12-09 10:09:40.681258
12	6	en	Blurb agent home	Blurb agent home	2010-12-09 10:09:40.693933	2010-12-09 10:09:40.693933
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-09 10:09:40.722232	2010-12-09 10:09:40.722232
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-09 10:09:40.735169	2010-12-09 10:09:40.735169
15	8	dk	Reset password	Reset password	2010-12-09 10:09:40.89375	2010-12-09 10:09:40.89375
16	8	en	Reset password	Reset password	2010-12-09 10:09:40.906344	2010-12-09 10:09:40.906344
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-09 10:09:40.463475	2010-12-09 10:09:40.489743	about_us	0	t	2010-12-09 10:09:40.489675
2	Article::Cms	2010-12-09 10:09:40.512734	2010-12-09 10:09:40.53213	privacy	0	t	2010-12-09 10:09:40.532055
3	Article::Cms	2010-12-09 10:09:40.555689	2010-12-09 10:09:40.574865	terms_conditions	0	t	2010-12-09 10:09:40.574792
4	Article::Cms	2010-12-09 10:09:40.595129	2010-12-09 10:09:40.614031	blurb_sign_up	1	t	2010-12-09 10:09:40.613961
5	Article::Cms	2010-12-09 10:09:40.633888	2010-12-09 10:09:40.652623	blurb_buyer_home	1	t	2010-12-09 10:09:40.652554
6	Article::Cms	2010-12-09 10:09:40.677194	2010-12-09 10:09:40.697055	blurb_agent_home	1	t	2010-12-09 10:09:40.69698
7	Article::Cms	2010-12-09 10:09:40.718005	2010-12-09 10:09:40.738661	blurb_start_page_role_selection	1	t	2010-12-09 10:09:40.738578
8	Article::Cms	2010-12-09 10:09:40.889284	2010-12-09 10:09:40.909314	reset_password	2	t	2010-12-09 10:09:40.909246
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug) FROM stdin;
1	Electronics	Dignissimos non distinctio nulla qui voluptatem quia inventore sit.Laboriosam dicta saepe velit ipsa nulla sed excepturi.	2010-12-09 10:09:39.406794	2010-12-09 10:09:39.406794	\N	1	2	\N	0	1
2	Leisure	Exercitationem ab nihil et quo.Qui molestias quo voluptatem.	2010-12-09 10:09:39.434609	2010-12-09 10:09:39.434609	\N	3	4	\N	0	2
3	Business	Voluptatem voluptatum ipsum exercitationem ea maiores veniam atque suscipit.Et sunt quia reiciendis eaque tempore at.	2010-12-09 10:09:39.454983	2010-12-09 10:09:39.963907	\N	5	6	\N	7	3
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
1	1	dk	Dignissimos non distinctio nulla qui voluptatem quia inventore sit.Laboriosam dicta saepe velit ipsa nulla sed excepturi.	Electronics	2010-12-09 10:09:39.416026	2010-12-09 10:09:39.416026
2	2	dk	Exercitationem ab nihil et quo.Qui molestias quo voluptatem.	Leisure	2010-12-09 10:09:39.438826	2010-12-09 10:09:39.438826
3	3	dk	Voluptatem voluptatum ipsum exercitationem ea maiores veniam atque suscipit.Et sunt quia reiciendis eaque tempore at.	Business	2010-12-09 10:09:39.459357	2010-12-09 10:09:39.459357
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-09 10:09:38.964472	2010-12-09 10:09:38.964472
2	United Kingdom	2010-12-09 10:09:38.969173	2010-12-09 10:09:38.969173
3	Wales129188937948884	2010-12-09 10:09:39.490171	2010-12-09 10:09:39.490171
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-09 10:09:38.994497	2010-12-09 10:09:38.994497
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-09 10:09:39.009575	2010-12-09 10:09:39.009575
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-09 10:09:39.022535	2010-12-09 10:09:39.022535
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-09 10:09:39.034809	2010-12-09 10:09:39.034809
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-09 10:09:39.047471	2010-12-09 10:09:39.047471
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-09 10:09:39.059704	2010-12-09 10:09:39.059704
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-09 10:09:39.189536	2010-12-09 10:09:39.189536
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-09 10:09:39.205273	2010-12-09 10:09:39.205273
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-09 10:09:39.217467	2010-12-09 10:09:39.217467
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-09 10:09:39.229549	2010-12-09 10:09:39.229549
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-09 10:09:39.241561	2010-12-09 10:09:39.241561
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-09 10:09:39.253453	2010-12-09 10:09:39.253453
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-09 10:09:39.265477	2010-12-09 10:09:39.265477
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-09 10:09:39.277306	2010-12-09 10:09:39.277306
15	8	en	Question	<p></p>	2010-12-09 10:09:39.289638	2010-12-09 10:09:39.289638
16	8	dk	[DK] Question	<p></p>	2010-12-09 10:09:39.301557	2010-12-09 10:09:39.301557
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-09 10:09:38.985641	2010-12-09 10:09:39.005267
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-09 10:09:39.017897	2010-12-09 10:09:39.030631
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-09 10:09:39.042982	2010-12-09 10:09:39.055539
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-09 10:09:39.067969	2010-12-09 10:09:39.201218
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-09 10:09:39.213009	2010-12-09 10:09:39.225484
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-09 10:09:39.237305	2010-12-09 10:09:39.249298
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-09 10:09:39.261225	2010-12-09 10:09:39.273282
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-09 10:09:39.285209	2010-12-09 10:09:39.297529
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
1	1	dk	Qui at est laboriosam.Aut enim velit et possimus optio repellat corrupti quam.	Asperiores vel qui rerum quia et adipisci.Eius consequatur tenetur et et dolorem repellat facilis voluptates.	Big deal on printers	2010-12-09 10:09:39.693302	2010-12-09 10:09:39.693302
2	2	dk	Maxime ut id debitis sequi qui.Impedit optio cupiditate aperiam eaque.	Amet aliquam recusandae saepe quisquam accusantium quos id sed.Fugit laboriosam tempore enim ut magni.	Drills required	2010-12-09 10:09:39.741726	2010-12-09 10:09:39.741726
3	3	dk	Cum ab voluptas fugiat dicta vero deleniti.Saepe sapiente quisquam quae minus reprehenderit.	Adipisci ut unde et expedita delectus quia.Magni temporibus sunt consequatur eum voluptatem praesentium non fugiat.	Need assistance in selling a car	2010-12-09 10:09:39.787198	2010-12-09 10:09:39.787198
4	4	dk	Molestias dolor ullam deleniti aut atque.Deleniti dolorem veniam earum quas aut.	Aspernatur et magni quisquam ea recusandae autem.Alias iusto deserunt doloribus ipsam reprehenderit quis temporibus.	Ipod shipment	2010-12-09 10:09:39.832666	2010-12-09 10:09:39.832666
5	5	dk	Laudantium voluptatem necessitatibus quam sapiente nulla impedit corporis.Nihil laudantium vel ullam eius.	Quos doloremque cumque fuga voluptatibus aspernatur voluptatem recusandae.Sed id eos magni.	Trip to amazonia - looking for offer	2010-12-09 10:09:39.878439	2010-12-09 10:09:39.878439
6	6	dk	Quaerat vel suscipit deserunt temporibus alias cupiditate non officiis.Cum qui quae error nihil.	Consectetur vel blanditiis qui qui voluptatum voluptas.Mollitia aut ut voluptatem culpa animi maxime aliquam iste.	LCD - Huge amounts	2010-12-09 10:09:39.923573	2010-12-09 10:09:39.923573
7	7	dk	Placeat ut exercitationem totam sed expedita aliquid assumenda.Enim quibusdam temporibus harum.	Quasi in commodi impedit quas.Et est et sint libero quasi nisi consequatur non.	GPS receivers required	2010-12-09 10:09:39.970571	2010-12-09 10:09:39.970571
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating) FROM stdin;
1	Big deal on printers	3	Qui at est laboriosam.Aut enim velit et possimus optio repellat corrupti quam.	Asperiores vel qui rerum quia et adipisci.Eius consequatur tenetur et et dolorem repellat facilis voluptates.	2	User::Agent	0	411.0	641.0	1	Gislason	Yadira Rosenbaum	647.061.8185 x789	roxane.murazik@lynchbogisich.uk	44498 Borer Cape	2010-12-09 10:09:39.546319	2010-12-09 10:09:39.546319	2010-12-14	Francisco129188937948812 Schuster	1	t	\N	0	0	f	f	-1
2	Drills required	3	Maxime ut id debitis sequi qui.Impedit optio cupiditate aperiam eaque.	Amet aliquam recusandae saepe quisquam accusantium quos id sed.Fugit laboriosam tempore enim ut magni.	2	User::Agent	0	81.0	46.0	1	Hintz	Ora Purdy	783-457-9848 x505	nyasia.gerlach@schmelerwiegand.com	25621 Laurel Points	2010-12-09 10:09:39.719951	2010-12-09 10:09:39.719951	2010-12-14	Francisco129188937948812 Schuster	1	t	\N	0	0	f	f	-1
3	Need assistance in selling a car	3	Cum ab voluptas fugiat dicta vero deleniti.Saepe sapiente quisquam quae minus reprehenderit.	Adipisci ut unde et expedita delectus quia.Magni temporibus sunt consequatur eum voluptatem praesentium non fugiat.	2	User::Agent	0	414.0	21.0	1	Olson	Eduardo Hudson	376.946.4372 x0358	jaunita_watsica@hintz.info	61351 Lemuel Plain	2010-12-09 10:09:39.765228	2010-12-09 10:09:39.765228	2010-12-14	Francisco129188937948812 Schuster	1	t	\N	0	0	f	f	-1
4	Ipod shipment	3	Molestias dolor ullam deleniti aut atque.Deleniti dolorem veniam earum quas aut.	Aspernatur et magni quisquam ea recusandae autem.Alias iusto deserunt doloribus ipsam reprehenderit quis temporibus.	2	User::Agent	0	18.0	373.0	1	Rogahnturner	Myrtle Swaniawski PhD	447.314.3594	keaton_glover@smithmiller.uk	3092 Strosin Turnpike	2010-12-09 10:09:39.810571	2010-12-09 10:09:39.810571	2010-12-14	Francisco129188937948812 Schuster	1	t	\N	0	0	f	f	-1
5	Trip to amazonia - looking for offer	3	Laudantium voluptatem necessitatibus quam sapiente nulla impedit corporis.Nihil laudantium vel ullam eius.	Quos doloremque cumque fuga voluptatibus aspernatur voluptatem recusandae.Sed id eos magni.	2	User::Agent	0	721.0	40.0	1	Greenfelder	Emerald Bode	(882)593-7113 x5267	delphine@bednar.ca	91388 Timmothy Rue	2010-12-09 10:09:39.856885	2010-12-09 10:09:39.856885	2010-12-14	Francisco129188937948812 Schuster	1	t	\N	0	0	f	f	-1
6	LCD - Huge amounts	3	Quaerat vel suscipit deserunt temporibus alias cupiditate non officiis.Cum qui quae error nihil.	Consectetur vel blanditiis qui qui voluptatum voluptas.Mollitia aut ut voluptatem culpa animi maxime aliquam iste.	2	User::Agent	0	349.0	630.0	1	Kshlerin	Genesis Brekke	(248)434-1091 x36599	matteo@king.uk	997 Purdy Wells	2010-12-09 10:09:39.901755	2010-12-09 10:09:39.901755	2010-12-14	Francisco129188937948812 Schuster	1	t	\N	0	0	f	f	-1
7	GPS receivers required	3	Placeat ut exercitationem totam sed expedita aliquid assumenda.Enim quibusdam temporibus harum.	Quasi in commodi impedit quas.Et est et sint libero quasi nisi consequatur non.	2	User::Agent	0	710.0	486.0	1	Hermann	Devon Wyman	229-757-0609 x76101	taylor@macejkovic.uk	9162 Jacobs Neck	2010-12-09 10:09:39.947758	2010-12-09 10:09:39.947758	2010-12-14	Francisco129188937948812 Schuster	1	t	\N	0	0	f	f	-1
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-09 10:09:38.944142	2010-12-09 10:09:38.944142
2	default_leads_per_page	--- 5\n	2010-12-09 10:09:38.949598	2010-12-09 10:09:38.949598
3	certification_level_1	--- 10\n	2010-12-09 10:09:38.951753	2010-12-09 10:09:38.951753
4	certification_level_2	--- 20\n	2010-12-09 10:09:38.953812	2010-12-09 10:09:38.953812
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-09 10:09:38.956017	2010-12-09 10:09:38.956017
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
1	blazejek@gmail.com	69ca600ca4f507420d975d8c32a3beb5ab1cb91e559290eedb3c73761f14c97c99040f63a29f4df556b761ec455b847234e8a60474206fc14d9c7b648936582a	lHCywAyRV1Upc8TYlhR1	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-09 10:09:39.388135	2010-12-09 10:09:39.331669	\N	2010-12-09 10:09:39.331898	2010-12-09 10:09:39.388418	1	Blair	Rohan	(121)675-4457 x509	root	Devante Station	Lake Betsy	21854	Devon	1	\N	\N	\N	\N	0	\N	\N	\N	\N	0sOHMJRomalzawmVGvRv0Omj4mTQ2jvfDC038pynNLxBdQIH3QpJFnW29Eh8p3	f	\N	0	0	0	0	0
2	agent@nbs.com	add4eaa61b1742a0129fb727a4fe2e6b91c71abea69afd54ac67ed1ad24ced841fc9aadf28c23e894484f5413418a46f77c93ff0b90ec0aba678abb5b0f7a33a	G98IDu5O8MD5AIKZ8of8	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-09 10:09:39.517086	2010-12-09 10:09:39.495571	\N	2010-12-09 10:09:39.495794	2010-12-09 10:09:39.517378	2	Francisco129188937948812	Schuster	1-181-128-1890 x70860	Ahmed Schimmel129188937948789	Breitenberg Burg	North Jarrett	58134	Nottinghamshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	PrPZw3rQGSXZxZ8KjAHGkDdapQJQrhfUSQ1mwDP4kv6RvFmQOBGN0W3xdWcIhZ	f	\N	0	0	0	0	0
3	admin@nbs.com	6bf2698bce5f91aaca617b6aa6a197183ba572e562050ff8b3a00866aac4a0d3588db7610d637a574d322ed4752a33cd3cf2fd0fbd4a7194028d444fb1b2e72b	6QJQ19cXRpcu3WxHoG2s	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-09 10:09:40.153581	2010-12-09 10:09:40.133808	\N	2010-12-09 10:09:40.134033	2010-12-09 10:09:40.153862	1	Carolyn	Deckow	(421)030-3291 x1339	Sanford Gleichner129188938012942	Berneice Alley	East Aniya	43983-2477	Oxfordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	3AHQ6W1ZlOYhrMOoRg0gDtP2Crif9Bx8TyDQFJXznSzI1U0SsPlhGn7IKYrTTh	f	\N	0	0	0	0	0
4	buyer@nbs.com	7c4b63ee0eb5749abeba796a7d578818cf822927ace36f7ebef1c91e43fbc9d57dd243bc3bd5579461b6570b09920b3018eda8b26a314951ddd87c0e1135fd49	mPv1KDxY1xlEPkkdIF0_	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-09 10:09:40.205903	2010-12-09 10:09:40.18403	\N	2010-12-09 10:09:40.184292	2010-12-09 10:09:40.206192	48	Giuseppe	Cronin	(234)566-5740	Tabitha Reichert12918893801794	Bauch Camp	New Wadeborough	76976	Northamptonshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	01PDaChxuSRnjcRnjaJs8JqHWgrOyoMfEhzmGDvyP5vpuhs01L5KkRX0X39UmX	f	t	0	0	0	0	0
5	leaduser@nbs.com	4a67059dc1f0eea1df2716f8351c8dacb70dd237f1644cd3a2e4eaee423575e6060eb36a442b4e75f451eedf836d5e2e0d19c0ba810a11e954e623715e7dcacd	J04LXo2Vb7swG-5rupEr	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-09 10:09:40.25531	2010-12-09 10:09:40.233957	\N	2010-12-09 10:09:40.234181	2010-12-09 10:09:40.268859	64	Marietta	Brekke	778.107.9615	Jarrell Stoltenberg129188938022922	Kathryne Hills	North Madelineville	54891	Isle of Wight	1	\N	\N	4	\N	0	\N	\N	\N	\N	d8mBBuOcr3bTCuiGqcG5oWLLdRlLAmXlPXXzTK7kr7GwFswaiLyJxjSv4J4fLU	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

