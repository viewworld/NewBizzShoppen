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
1	Electronics	Labore culpa delectus error et vero.Ex officia culpa consequatur quibusdam est.	2010-12-07 15:00:39.966256	2010-12-07 15:00:39.966256	\N	1	2	\N	0	1
2	Leisure	Consequatur sit qui architecto accusantium.Rerum molestiae aperiam et libero enim expedita amet aut.	2010-12-07 15:00:40.013944	2010-12-07 15:00:40.013944	\N	3	4	\N	0	2
3	Business	Non tenetur eos autem blanditiis beatae.Optio repudiandae maiores suscipit eos architecto facere autem accusantium.	2010-12-07 15:00:40.058598	2010-12-07 15:00:41.048842	\N	5	6	\N	7	3
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
1	1	dk	Labore culpa delectus error et vero.Ex officia culpa consequatur quibusdam est.	Electronics	2010-12-07 15:00:39.980419	2010-12-07 15:00:39.980419
2	2	dk	Consequatur sit qui architecto accusantium.Rerum molestiae aperiam et libero enim expedita amet aut.	Leisure	2010-12-07 15:00:40.022628	2010-12-07 15:00:40.022628
3	3	dk	Non tenetur eos autem blanditiis beatae.Optio repudiandae maiores suscipit eos architecto facere autem accusantium.	Business	2010-12-07 15:00:40.066718	2010-12-07 15:00:40.066718
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-07 15:00:39.306912	2010-12-07 15:00:39.306912
2	United Kingdom	2010-12-07 15:00:39.318597	2010-12-07 15:00:39.318597
3	Northern Ireland	2010-12-07 15:00:40.124118	2010-12-07 15:00:40.124118
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-07 15:00:39.367445	2010-12-07 15:00:39.367445
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-07 15:00:39.395085	2010-12-07 15:00:39.395085
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-07 15:00:39.416601	2010-12-07 15:00:39.416601
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-07 15:00:39.44045	2010-12-07 15:00:39.44045
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-07 15:00:39.475575	2010-12-07 15:00:39.475575
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-07 15:00:39.496734	2010-12-07 15:00:39.496734
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-07 15:00:39.522765	2010-12-07 15:00:39.522765
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-07 15:00:39.563549	2010-12-07 15:00:39.563549
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-07 15:00:39.604218	2010-12-07 15:00:39.604218
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-07 15:00:39.628267	2010-12-07 15:00:39.628267
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-07 15:00:39.651079	2010-12-07 15:00:39.651079
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-07 15:00:39.674597	2010-12-07 15:00:39.674597
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-07 15:00:39.703769	2010-12-07 15:00:39.703769
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-07 15:00:39.735554	2010-12-07 15:00:39.735554
15	8	en	Question	<p></p>	2010-12-07 15:00:39.761731	2010-12-07 15:00:39.761731
16	8	dk	[DK] Question	<p></p>	2010-12-07 15:00:39.789571	2010-12-07 15:00:39.789571
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-07 15:00:39.355203	2010-12-07 15:00:39.387764
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-07 15:00:39.409775	2010-12-07 15:00:39.431216
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-07 15:00:39.465815	2010-12-07 15:00:39.490232
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-07 15:00:39.513395	2010-12-07 15:00:39.55101
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-07 15:00:39.591883	2010-12-07 15:00:39.621517
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-07 15:00:39.643976	2010-12-07 15:00:39.666791
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-07 15:00:39.690811	2010-12-07 15:00:39.724983
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-07 15:00:39.754871	2010-12-07 15:00:39.77906
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
1	1	dk	Voluptatum ut est velit perspiciatis.Dolores itaque veritatis aliquam sed deleniti magnam.	Cumque consequatur in aut aliquid sit illo voluptatem.Nihil commodi voluptatem eaque dolores id optio rerum rerum.	Big deal on printers	2010-12-07 15:00:40.276842	2010-12-07 15:00:40.276842
2	2	dk	Sit ullam provident sunt corrupti officiis laborum expedita deserunt.Deleniti quia perferendis aut.	Nobis voluptatem adipisci ut omnis omnis veritatis molestias harum.Quia qui inventore in dicta atque aliquam nemo eaque.	Drills required	2010-12-07 15:00:40.369004	2010-12-07 15:00:40.369004
3	3	dk	Minus nostrum aut voluptas commodi nihil cumque est.Laudantium debitis suscipit odio aut reiciendis veritatis pariatur rerum.	Qui quidem voluptas aliquid.Neque distinctio ullam ea aut odio quod atque quia.	Need assistance in selling a car	2010-12-07 15:00:40.443078	2010-12-07 15:00:40.443078
4	4	dk	Voluptas soluta officiis rerum et.Temporibus sequi velit earum dolorum accusantium.	Ea modi exercitationem temporibus rerum magni.Magni ad dolorem aliquid et omnis impedit fugiat.	Ipod shipment	2010-12-07 15:00:40.517978	2010-12-07 15:00:40.517978
5	5	dk	Nesciunt placeat commodi ut maiores.Labore quam minus explicabo facilis id provident aut.	Numquam expedita rem nisi.Asperiores sed officia culpa quos inventore.	Trip to amazonia - looking for offer	2010-12-07 15:00:40.593237	2010-12-07 15:00:40.593237
6	6	dk	Nesciunt modi esse et quia rem.Ab voluptate quas est.	Sed natus odit nemo sit voluptatum quam adipisci harum.Molestiae alias omnis voluptatem nobis.	LCD - Huge amounts	2010-12-07 15:00:40.696141	2010-12-07 15:00:40.696141
7	7	dk	Blanditiis alias architecto atque omnis ab ipsa.Non omnis aspernatur laboriosam hic voluptas temporibus in.	Quos dicta nam voluptatem.Voluptatem aut minus dolorem provident porro.	GPS receivers required	2010-12-07 15:00:41.059446	2010-12-07 15:00:41.059446
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating) FROM stdin;
1	Big deal on printers	3	Cumque consequatur in aut aliquid sit illo voluptatem.Nihil commodi voluptatem eaque dolores id optio rerum rerum.	Voluptatum ut est velit perspiciatis.Dolores itaque veritatis aliquam sed deleniti magnam.	2	User::Agent	0	343.0	166.0	1	Farrell	Geovanny Hyatt	337.400.5659	trinity@marvinleuschke.biz	823 Alvis Viaduct	2010-12-07 15:00:40.228648	2010-12-07 15:00:40.228648	2010-12-12	Nona Kihn	1	f	\N	0	0	f	f
2	Drills required	3	Nobis voluptatem adipisci ut omnis omnis veritatis molestias harum.Quia qui inventore in dicta atque aliquam nemo eaque.	Sit ullam provident sunt corrupti officiis laborum expedita deserunt.Deleniti quia perferendis aut.	2	User::Agent	0	256.0	401.0	1	Gulgowski	Rowland Mitchell	681-206-8094 x342	kaylah@aufderharbashirian.uk	49469 Jakubowski Throughway	2010-12-07 15:00:40.333981	2010-12-07 15:00:40.333981	2010-12-12	Nona Kihn	1	f	\N	0	0	f	f
3	Need assistance in selling a car	3	Qui quidem voluptas aliquid.Neque distinctio ullam ea aut odio quod atque quia.	Minus nostrum aut voluptas commodi nihil cumque est.Laudantium debitis suscipit odio aut reiciendis veritatis pariatur rerum.	2	User::Agent	0	960.0	879.0	1	Schoenhudson	Quinton Gerhold	407-885-5413 x9593	trinity@casper.uk	932 Gleichner Throughway	2010-12-07 15:00:40.40837	2010-12-07 15:00:40.40837	2010-12-12	Nona Kihn	1	f	\N	0	0	f	f
4	Ipod shipment	3	Ea modi exercitationem temporibus rerum magni.Magni ad dolorem aliquid et omnis impedit fugiat.	Voluptas soluta officiis rerum et.Temporibus sequi velit earum dolorum accusantium.	2	User::Agent	0	589.0	167.0	1	Wunschhyatt	Sallie Steuber III	(064)050-8605 x7255	madison@block.ca	51669 Charlene Springs	2010-12-07 15:00:40.482804	2010-12-07 15:00:40.482804	2010-12-12	Nona Kihn	1	f	\N	0	0	f	f
5	Trip to amazonia - looking for offer	3	Numquam expedita rem nisi.Asperiores sed officia culpa quos inventore.	Nesciunt placeat commodi ut maiores.Labore quam minus explicabo facilis id provident aut.	2	User::Agent	0	563.0	602.0	1	Dooley	Melissa King	1-862-851-9160	treva@oreillysporer.ca	95409 Karen Drive	2010-12-07 15:00:40.558263	2010-12-07 15:00:40.558263	2010-12-12	Nona Kihn	1	f	\N	0	0	f	f
6	LCD - Huge amounts	3	Sed natus odit nemo sit voluptatum quam adipisci harum.Molestiae alias omnis voluptatem nobis.	Nesciunt modi esse et quia rem.Ab voluptate quas est.	2	User::Agent	0	701.0	654.0	1	Pagachartmann	Kianna Shanahan	(126)240-2364 x2999	loren@lemkebayer.ca	015 Pfannerstill Burgs	2010-12-07 15:00:40.652969	2010-12-07 15:00:40.652969	2010-12-12	Nona Kihn	1	f	\N	0	0	f	f
7	GPS receivers required	3	Quos dicta nam voluptatem.Voluptatem aut minus dolorem provident porro.	Blanditiis alias architecto atque omnis ab ipsa.Non omnis aspernatur laboriosam hic voluptas temporibus in.	2	User::Agent	0	854.0	466.0	1	Kshleringoodwin	Mr. Kavon Goldner	(997)104-6142	sheldon.mraz@lang.com	79814 VonRueden Rue	2010-12-07 15:00:40.76046	2010-12-07 15:00:40.76046	2010-12-12	Nona Kihn	1	f	\N	0	0	f	f
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-07 15:00:39.259248	2010-12-07 15:00:39.259248
2	default_leads_per_page	--- 5\n	2010-12-07 15:00:39.279518	2010-12-07 15:00:39.279518
3	certification_level_1	--- 10\n	2010-12-07 15:00:39.286668	2010-12-07 15:00:39.286668
4	certification_level_2	--- 20\n	2010-12-07 15:00:39.293848	2010-12-07 15:00:39.293848
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
1	blazejek@gmail.com	d768807487702ee11e1411969c157e001e10bd0901529298d93c3fdd0a5ef186c453cb855229c136343f02f8146c3e3f5139875c667aae4f888ca77b5ef2698c	RLqA_Fn6eFeaQVQ1f2Fr	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 15:00:39.93562	2010-12-07 15:00:39.840044	\N	2010-12-07 15:00:39.840401	2010-12-07 15:00:39.93606	1	Karine	Kohler	(613)893-8766 x409	root	Terrence Mews	New Garretberg	15817	Cambridgeshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	9zcoMBuP3mWShlkc46hi1stPoVVpoISHZixs5Mzo27VcnTs4DCWdSilShyONUR	f	\N	0	0	0	0	0
2	agent@nbs.com	a651bc335920b5084ee96200161f3825898646980753a08afb0768954627cabc1c03e43d8bb3af2849f3f7ab2fb223314a2dec012faee76e6980ac25bc5b5d14	ANFwZ8CSHVM1nnFWzyaY	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 15:00:40.171559	2010-12-07 15:00:40.135149	\N	2010-12-07 15:00:40.135493	2010-12-07 15:00:40.172291	2	Nona	Kihn	138.867.2089	Karen Volkman2438	Carter Motorway	Janchester	92680-2298	Gwynedd County	3	\N	0	\N	\N	0	\N	\N	\N	\N	1DQtv4JsoekUJO2LlXLcpYQyaYaU3vVL4rJfxqDwaLeujokEM9EBo53LRYwLGv	f	\N	0	0	0	0	0
3	admin@nbs.com	f2fc5ff9cf39d3d7a7948d5ed9bd4eb531b3be5970531a06f972fed0f9ef34ad083403e711242677b8c711c6ccbef21fa9a267999d79b04b2956ae7a93757b48	4dD5rPffgxTBrWNqVEYz	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 15:00:41.193077	2010-12-07 15:00:41.150788	\N	2010-12-07 15:00:41.151299	2010-12-07 15:00:41.193517	1	Rico	Hansen	596-462-9575 x372	Miss Joana Stracke3198	Clifford Way	Millston	73355	Gwynedd County	1	\N	\N	\N	\N	0	\N	\N	\N	\N	mWhtcPZZp18gomP2IYml4qf944EqjPUJFPtED36q0j0QfVsGRnxMWYQmxsOfxx	f	\N	0	0	0	0	0
4	buyer@nbs.com	c3d3273cd60549018836007dee475e42f7425b2d1020545f69d497718488a50bdc0db3ec38c92779681ca14a1ca4504cc996494801724ae5dae69ca77684be92	mWpRPyk8Bp_u2fwWSt-J	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 15:00:41.283169	2010-12-07 15:00:41.244649	\N	2010-12-07 15:00:41.245015	2010-12-07 15:00:41.283613	48	Hobart	Vandervort	735-143-3860 x32318	Norene Hauck IV4440	Moises Plain	West Morganhaven	18390-2610	Lincolnshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	8rPKFSeoYvwi8GhnaJ4ZpW94lVZoCK1n2dUDrHuPk9xZBOHclT3D4cczbpGpMp	f	t	0	0	0	0	0
5	leaduser@nbs.com	0acc0a3f047ae388c24d16d219f107518a50c6ce286204ac2130af4dff24d33046b6ab83e1518ced0c004362208e451b7bf7dfc734c8aa8d6a83cabed1240d23	udvB9TdWNZlAMozoSS4a	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 15:00:41.373031	2010-12-07 15:00:41.338026	\N	2010-12-07 15:00:41.338388	2010-12-07 15:00:41.400239	64	Jada	Dach	844.823.9660 x4756	Marjorie Kohler9554	Marguerite Hollow	Leuschketown	91561	Staffordshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	xjodkvcsu2sN6GQAJHfUOprvwWdPxwJJfTZUWlkxe735kYMzD1US90sIRyBKCr	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

