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

SELECT pg_catalog.setval('email_template_translations_id_seq', 14, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 7, true);


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
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug) FROM stdin;
1	Electronics	Ut similique repellendus laborum enim dolor quia rerum.Doloremque molestiae voluptatem provident sequi eos.	2010-12-06 09:27:54.758889	2010-12-06 09:27:54.758889	\N	1	2	\N	0	1
2	Leisure	Molestias maiores eius minus illum eos nulla et sapiente.Officia quam porro est ipsa.	2010-12-06 09:27:54.78977	2010-12-06 09:27:54.78977	\N	3	4	\N	0	2
3	Business	Deleniti et corporis minima.Autem deserunt voluptas consequatur.	2010-12-06 09:27:54.809347	2010-12-06 09:28:05.089742	\N	5	6	\N	7	3
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
1	1	dk	Ut similique repellendus laborum enim dolor quia rerum.Doloremque molestiae voluptatem provident sequi eos.	Electronics	2010-12-06 09:27:54.768774	2010-12-06 09:27:54.768774
2	2	dk	Molestias maiores eius minus illum eos nulla et sapiente.Officia quam porro est ipsa.	Leisure	2010-12-06 09:27:54.793793	2010-12-06 09:27:54.793793
3	3	dk	Deleniti et corporis minima.Autem deserunt voluptas consequatur.	Business	2010-12-06 09:27:54.813538	2010-12-06 09:27:54.813538
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-06 09:27:54.311444	2010-12-06 09:27:54.311444
2	United Kingdom	2010-12-06 09:27:54.315724	2010-12-06 09:27:54.315724
3	Northern Ireland	2010-12-06 09:27:54.843684	2010-12-06 09:27:54.843684
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-06 09:27:54.341958	2010-12-06 09:27:54.341958
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-06 09:27:54.356565	2010-12-06 09:27:54.356565
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-06 09:27:54.36884	2010-12-06 09:27:54.36884
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-06 09:27:54.381527	2010-12-06 09:27:54.381527
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-06 09:27:54.394306	2010-12-06 09:27:54.394306
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-06 09:27:54.406758	2010-12-06 09:27:54.406758
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-06 09:27:54.41952	2010-12-06 09:27:54.41952
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-06 09:27:54.431883	2010-12-06 09:27:54.431883
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-06 09:27:54.444583	2010-12-06 09:27:54.444583
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-06 09:27:54.456915	2010-12-06 09:27:54.456915
11	6	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-06 09:27:54.471582	2010-12-06 09:27:54.471582
12	6	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-06 09:27:54.484156	2010-12-06 09:27:54.484156
13	7	en	Question	<p></p>	2010-12-06 09:27:54.604966	2010-12-06 09:27:54.604966
14	7	dk	[DK] Question	<p></p>	2010-12-06 09:27:54.616808	2010-12-06 09:27:54.616808
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-06 09:27:54.333118	2010-12-06 09:27:54.352494
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-06 09:27:54.364305	2010-12-06 09:27:54.377127
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-06 09:27:54.389823	2010-12-06 09:27:54.402507
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-06 09:27:54.414947	2010-12-06 09:27:54.427614
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-06 09:27:54.440002	2010-12-06 09:27:54.452703
6	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-06 09:27:54.465431	2010-12-06 09:27:54.479873
7	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-06 09:27:54.600552	2010-12-06 09:27:54.612761
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
1	1	en	Ducimus sapiente suscipit quas aut iusto dolor aut.Doloremque eum hic nisi.	Voluptatibus et in quo beatae consequatur temporibus sunt aliquam.Illum iste esse omnis commodi voluptatem.	Big deal on printers	2010-12-06 09:28:04.888035	2010-12-06 09:28:04.888035
2	2	en	Non aliquam labore aut assumenda.Natus optio et rerum eaque totam quia.	Perferendis consequuntur vitae aliquid id ut.Rerum magnam praesentium et non officia sit.	Drills required	2010-12-06 09:28:04.918322	2010-12-06 09:28:04.918322
3	3	en	Natus adipisci repellat incidunt.Aut vitae est dolorem aut repudiandae.	Tenetur mollitia accusantium optio saepe.Ut autem officia et.	Need assistance in selling a car	2010-12-06 09:28:04.946533	2010-12-06 09:28:04.946533
4	4	en	Aut incidunt voluptatibus nam pariatur.Maxime placeat autem excepturi sed.	Sit deleniti laboriosam quia aut et.Provident harum aliquam pariatur dicta ut et ratione enim.	Ipod shipment	2010-12-06 09:28:04.975822	2010-12-06 09:28:04.975822
5	5	en	Qui voluptatem est dolor perspiciatis.Harum repellat eaque quam consequatur necessitatibus.	Culpa eaque fugit voluptatem.Non est et sunt laborum.	Trip to amazonia - looking for offer	2010-12-06 09:28:05.004036	2010-12-06 09:28:05.004036
6	6	en	Eum quidem nesciunt optio fuga.Sunt delectus molestiae eum autem eos officiis et.	Quos nihil esse et debitis amet impedit.Eaque et quam quod excepturi sunt sapiente voluptatem porro.	LCD - Huge amounts	2010-12-06 09:28:05.032316	2010-12-06 09:28:05.032316
7	7	en	Velit inventore quia maiores tempora illo et et.Dolorum similique id deserunt natus.	Inventore odio aut qui praesentium accusantium dolorum.Dolore ea facilis veniam ut officia corporis.	GPS receivers required	2010-12-06 09:28:05.060428	2010-12-06 09:28:05.060428
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured) FROM stdin;
1	Big deal on printers	3	Ducimus sapiente suscipit quas aut iusto dolor aut.Doloremque eum hic nisi.	Voluptatibus et in quo beatae consequatur temporibus sunt aliquam.Illum iste esse omnis commodi voluptatem.	2	User::Agent	0	44.0	898.0	1	Jones	Dee Dibbert	(957)747-7277	henderson@glover.uk	399 Hoeger Rapid	2010-12-06 09:28:04.869626	2010-12-06 09:28:04.869626	2010-12-11	Waylon Herman	1	f	\N	0	0	f
2	Drills required	3	Non aliquam labore aut assumenda.Natus optio et rerum eaque totam quia.	Perferendis consequuntur vitae aliquid id ut.Rerum magnam praesentium et non officia sit.	2	User::Agent	0	43.0	745.0	1	Gibsondare	Rose Funk	402.278.2216	kallie_romaguera@wisokyboyer.co.uk	979 Erna Glen	2010-12-06 09:28:04.906114	2010-12-06 09:28:04.906114	2010-12-11	Waylon Herman	1	f	\N	0	0	f
3	Need assistance in selling a car	3	Natus adipisci repellat incidunt.Aut vitae est dolorem aut repudiandae.	Tenetur mollitia accusantium optio saepe.Ut autem officia et.	2	User::Agent	0	731.0	794.0	1	Blick	Ernestine Witting	758-491-3638 x53352	lavern@hills.ca	58947 Heller Streets	2010-12-06 09:28:04.9337	2010-12-06 09:28:04.9337	2010-12-11	Waylon Herman	1	f	\N	0	0	f
4	Ipod shipment	3	Aut incidunt voluptatibus nam pariatur.Maxime placeat autem excepturi sed.	Sit deleniti laboriosam quia aut et.Provident harum aliquam pariatur dicta ut et ratione enim.	2	User::Agent	0	461.0	65.0	1	Blandaschinner	Felipe Koelpin DVM	1-125-056-7273 x8121	ezekiel@runolfsson.com	6139 Muhammad Ranch	2010-12-06 09:28:04.962052	2010-12-06 09:28:04.962052	2010-12-11	Waylon Herman	1	f	\N	0	0	f
5	Trip to amazonia - looking for offer	3	Qui voluptatem est dolor perspiciatis.Harum repellat eaque quam consequatur necessitatibus.	Culpa eaque fugit voluptatem.Non est et sunt laborum.	2	User::Agent	0	40.0	51.0	1	Kohler	Kaycee Donnelly	1-809-318-4751 x502	sabryna@halvorson.biz	7851 Rosenbaum River	2010-12-06 09:28:04.991129	2010-12-06 09:28:04.991129	2010-12-11	Waylon Herman	1	f	\N	0	0	f
6	LCD - Huge amounts	3	Eum quidem nesciunt optio fuga.Sunt delectus molestiae eum autem eos officiis et.	Quos nihil esse et debitis amet impedit.Eaque et quam quod excepturi sunt sapiente voluptatem porro.	2	User::Agent	0	334.0	471.0	1	Dietrich	Gunnar Beier	(347)038-8085	anissa.mayer@dooleylueilwitz.uk	8368 Viola Road	2010-12-06 09:28:05.019532	2010-12-06 09:28:05.019532	2010-12-11	Waylon Herman	1	f	\N	0	0	f
7	GPS receivers required	3	Velit inventore quia maiores tempora illo et et.Dolorum similique id deserunt natus.	Inventore odio aut qui praesentium accusantium dolorum.Dolore ea facilis veniam ut officia corporis.	2	User::Agent	0	636.0	264.0	1	Boyerhammes	Lincoln Brakus	(433)131-7579 x87448	jerald_reynolds@koss.uk	67839 Gorczany Cliff	2010-12-06 09:28:05.047738	2010-12-06 09:28:05.047738	2010-12-11	Waylon Herman	1	f	\N	0	0	f
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-06 09:27:54.294695	2010-12-06 09:27:54.294695
2	default_leads_per_page	--- 5\n	2010-12-06 09:27:54.299595	2010-12-06 09:27:54.299595
3	certification_level_1	--- 10\n	2010-12-06 09:27:54.301829	2010-12-06 09:27:54.301829
4	certification_level_2	--- 20\n	2010-12-06 09:27:54.303981	2010-12-06 09:27:54.303981
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-06 09:27:54.306097	2010-12-06 09:27:54.306097
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
1	blazejek@gmail.com	84b7c693f740ad40a2a49a385fe20179db6ccbbe27b26a573dd8c6a21cb6a9febff8935551ab5372e1b5b44f6f4ccda47c1f6e5e7a80ce6ea860d673375f29fe	i9s30LjueCtm3H6-yVUl	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-06 09:27:54.739617	2010-12-06 09:27:54.650453	\N	2010-12-06 09:27:54.650682	2010-12-06 09:27:54.73991	1	Kellen	Hills	375.735.7654	root	Stacey Port	Port Kale	38351-3051	Greater Manchester	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Pu4joFMUxMCtYBRMdiVEdVzj3tJtKIbpAz4oKLmE84YFtgFGdBvZKYUO24k6Ic	f	\N	0	0	0	0	0
2	agent@nbs.com	55cd1767fce1e8ffe977027f4ca6723397ee03deb3cafd35b602b9bde5ad1ee05644be6836a5a327b145db7ca77313c987fc06a2a435d3cb51fafc2dc64c12ec	n-CH78xlvhp-vMqiEIw2	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-06 09:27:54.871272	2010-12-06 09:27:54.849129	\N	2010-12-06 09:27:54.849338	2010-12-06 09:27:54.871553	2	Waylon	Herman	(723)379-8873	Mr. Sam Koelpin866	Olson Stravenue	Port Marinaside	56374	Buckinghamshire	3	\N	0	\N	\N	0	\N	\N	\N	\N	aoB4wQkiB96lApv6NJuikcSh12R8rn8w0gXz4rX1BoknCytdCsfz0WN6UJ7Hwn	f	\N	0	0	0	0	0
3	admin@nbs.com	7749decbf5bb64cc84e0aea0debc879ea495f7bd1d712ebc7b3ff6880729e79b95c8a1a53aaa1454bdc592bd024fce7d67aab534a2f7571290014165159e0610	UHis0oTIaQV4tzA6s4RW	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-06 09:28:05.335115	2010-12-06 09:28:05.121437	\N	2010-12-06 09:28:05.121666	2010-12-06 09:28:05.335391	1	Bud	Heathcote	(429)741-4631 x15168	Derek Bailey2961	Misty Trafficway	Deltaland	69183-8550	Berkshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	t7rqcU1gqmJCy0Sali2l6SC6BlnZWLQOChaI9SKOsQioDTDUFKbmgntr8FGOUR	f	\N	0	0	0	0	0
4	buyer@nbs.com	91d302475db64f4dea4fd943fde7efffe81facfeb5910a594f19389e33eb73d225c95be5298257a5fe6e2c4c69793eed77ffe2419c90178a263867f7781d51e8	jIV_bA15iZ7MW8i7RoDZ	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-06 09:28:05.38541	2010-12-06 09:28:05.363256	\N	2010-12-06 09:28:05.363494	2010-12-06 09:28:05.38569	48	Macy	Wisoky	901.719.0978 x3376	Diego Walter3266	Walker Drive	Carlostad	97577	Strathclyde	1	\N	\N	\N	\N	0	\N	\N	\N	\N	6MSG47fCq37UCFkE14f65lZy7zMNQLgqcvnk0cCd4lDrOYitDs6AG6YUkZ8I7l	f	t	0	0	0	0	0
5	leaduser@nbs.com	15be1f6c88750084b768e8de7e98c724a5ca488ac527f4d0e799056751591120d7e805e6129bdba8568b59c55c0d28d3608715cebae6e36f4f2984651d0e58ad	2VqsAGUlivY6XTlecS7i	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-06 09:28:05.435569	2010-12-06 09:28:05.413772	\N	2010-12-06 09:28:05.413999	2010-12-06 09:28:05.449177	64	Meta	Brakus	219.525.5263	Taurean Kertzmann2533	Lisandro Green	East Dorothyview	32999	Fife	1	\N	\N	4	\N	0	\N	\N	\N	\N	67HfmDudnFEIy9ulsVAdItUaTNtJadSDmV5WGTFzshltx1GLTBZCZZPMQLMyiJ	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

