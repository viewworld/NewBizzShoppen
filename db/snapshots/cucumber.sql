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

SELECT pg_catalog.setval('categories_id_seq', 2, true);


--
-- Name: category_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_interests_id_seq', 1, false);


--
-- Name: category_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_translations_id_seq', 2, true);


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

SELECT pg_catalog.setval('lead_translations_id_seq', 1, false);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('leads_id_seq', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('settings_id_seq', 8, true);


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

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug) FROM stdin;
1	Test category 1	\N	2010-12-01 15:18:45.560325	2010-12-01 15:18:45.560325	\N	1	2	\N	0	1-test-category-1
2	Test category 2	\N	2010-12-01 15:18:45.587128	2010-12-01 15:18:45.587128	\N	3	4	\N	0	2-test-category-2
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
1	1	en	\N	Test category 1	2010-12-01 15:18:45.568717	2010-12-01 15:18:45.568717
2	2	en	\N	Test category 2	2010-12-01 15:18:45.590318	2010-12-01 15:18:45.590318
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-01 15:18:45.629443	2010-12-01 15:18:45.629443
2	United Kingdom	2010-12-01 15:18:45.63437	2010-12-01 15:18:45.63437
3	Northern Ireland	2010-12-01 15:18:46.315136	2010-12-01 15:18:46.315136
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-01 15:18:45.659143	2010-12-01 15:18:45.659143
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-01 15:18:45.671262	2010-12-01 15:18:45.671262
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-01 15:18:45.680727	2010-12-01 15:18:45.680727
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-01 15:18:45.787553	2010-12-01 15:18:45.787553
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-01 15:18:45.796925	2010-12-01 15:18:45.796925
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-01 15:18:45.806201	2010-12-01 15:18:45.806201
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-01 15:18:45.815605	2010-12-01 15:18:45.815605
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-01 15:18:45.824901	2010-12-01 15:18:45.824901
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-01 15:18:45.834232	2010-12-01 15:18:45.834232
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-01 15:18:45.844428	2010-12-01 15:18:45.844428
11	6	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-01 15:18:45.853662	2010-12-01 15:18:45.853662
12	6	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-01 15:18:45.862838	2010-12-01 15:18:45.862838
13	7	en	Question	<p></p>	2010-12-01 15:18:45.872019	2010-12-01 15:18:45.872019
14	7	dk	[DK] Question	<p></p>	2010-12-01 15:18:45.880991	2010-12-01 15:18:45.880991
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-01 15:18:45.650807	2010-12-01 15:18:45.668354
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-01 15:18:45.677324	2010-12-01 15:18:45.78393
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-01 15:18:45.793546	2010-12-01 15:18:45.8033
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-01 15:18:45.811956	2010-12-01 15:18:45.821928
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-01 15:18:45.830722	2010-12-01 15:18:45.841607
6	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-01 15:18:45.850282	2010-12-01 15:18:45.860019
7	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-01 15:18:45.868634	2010-12-01 15:18:45.878274
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, hidden_description, header, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	level_one_certification_threshold	--- 0\n	2010-12-01 15:18:45.602309	2010-12-01 15:18:45.602309
2	level_two_certification_threshold	--- 0\n	2010-12-01 15:18:45.607653	2010-12-01 15:18:45.607653
3	level_three_certification_threshold	--- 0\n	2010-12-01 15:18:45.610394	2010-12-01 15:18:45.610394
4	default_payout_delay	--- 0\n	2010-12-01 15:18:45.613035	2010-12-01 15:18:45.613035
5	default_leads_per_page	--- 5\n	2010-12-01 15:18:45.615616	2010-12-01 15:18:45.615616
6	certification_level_1	--- 10\n	2010-12-01 15:18:45.618229	2010-12-01 15:18:45.618229
7	certification_level_2	--- 20\n	2010-12-01 15:18:45.620804	2010-12-01 15:18:45.620804
8	contact_us_email	--- contact@nbs.fake.com\n	2010-12-01 15:18:45.62373	2010-12-01 15:18:45.62373
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, street, city, zip_code, county, country, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer) FROM stdin;
1	blazejek@gmail.com	87dc69a9eae3c80c8958d2fc1f9fc496424e1cc80d892f9b3881f83fbfc728173836bb1d150b296b92afb9acf67f85b5292fd93c90f05e6c3aa58c7bf3baf818	CB8mzvRKxar5yJLH-qwz	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 15:18:46.232443	2010-12-01 15:18:45.91403	\N	2010-12-01 15:18:45.914264	2010-12-01 15:18:46.232732	1	Nathanial	Lueilwitz	585.384.1753	admin1	Andre Club	North Danial	54512	Cheshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	76lbxQwC0F1z5TWj3kFo2PFo0LosD1hSl1gVXEFptrNvI8bJm21GzDh44Nu6Wq	f	\N
2	buyer@gmail2.com	02bfb1a3457e7b1ef65113579d80f9bbf83f1194abe6ecbb808cdb501e2727c5e6743f4b886e647b9181abec68c288158940fd01d2e5819c74730b7d30c1cb6b	FG0uyhzKcM3ePKS-baS2	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 15:18:46.289385	2010-12-01 15:18:46.262761	\N	2010-12-01 15:18:46.262995	2010-12-01 15:18:46.289685	48	Leopoldo	Toy	1-114-556-8363	Alfreda Graham	Eriberto Place	Zanefort	09762	West Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	0fbhB0CQwqWlvmWf0lRMLWlEdPM2PVzPYBF5B1qSwCIzhT4yLZCGzbWFW6OQFt	f	\N
3	agent@gmail2.com	39155639b5475d21ceafff5414cf367567fb62d9cbbe661fa75a817fc52bec884c44c351ee4d630e506b274eb5cb7fdc9f196f2c0dcbfb6fef1b7ff970df68dc	cxtI5J1-9ATYZ6jQiXhB	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 15:18:46.34542	2010-12-01 15:18:46.321438	\N	2010-12-01 15:18:46.321717	2010-12-01 15:18:46.345732	2	Jacquelyn	Macejkovic	300.992.3273	Rashad Bogisich	Ward Vista	West Donatoview	50942-0374	Kent	3	\N	0	\N	\N	0	\N	\N	\N	\N	j6OWlyywOwXCnQ9mEJtgZZTaz70w83quOj8X1VoauxJFVAJUdb5kZ7tVmyFvu0	f	\N
4	leaduser@gmail2.com	7b5d4e5989f4132187d666ce0be4fc0ebaf2beaeb968ec9438397a6fcdedf88e62c823aac8ce2ff7d7bfa5b5488d72c63fcf6ca8ff3cbc293aded7c99f909b40	avtj11IFK64Hfb6d-ry2	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-01 15:18:46.397406	2010-12-01 15:18:46.374375	\N	2010-12-01 15:18:46.374601	2010-12-01 15:18:46.397723	64	Santino	Oberbrunner	655-828-6792 x758	Pearlie Ebert PhD	Orrin Passage	West Lindsay	64021	Oxfordshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	VfsVOkT7AtaXC2C8XugAUcczLKt224qHQjyTSmCzJ2NQyYQWTRfA4hgd4FmNhO	f	\N
\.


--
-- PostgreSQL database dump complete
--

