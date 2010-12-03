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
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ckeditor_assets_id_seq', 1, false);


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

SELECT pg_catalog.setval('email_template_translations_id_seq', 10, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 5, true);


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
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, content, title, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2010-12-03 12:19:53.909424	2010-12-03 12:19:53.909424
2	1	en	About us	About us	2010-12-03 12:19:53.946565	2010-12-03 12:19:53.946565
3	2	dk	Privacy	Privacy	2010-12-03 12:19:53.990871	2010-12-03 12:19:53.990871
4	2	en	Privacy	Privacy	2010-12-03 12:19:54.023898	2010-12-03 12:19:54.023898
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-03 12:19:54.066148	2010-12-03 12:19:54.066148
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-03 12:19:54.095453	2010-12-03 12:19:54.095453
7	4	dk	Blurb sign up	Blurb sign up	2010-12-03 12:19:54.137911	2010-12-03 12:19:54.137911
8	4	en	Blurb sign up	Blurb sign up	2010-12-03 12:19:54.161283	2010-12-03 12:19:54.161283
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-03 12:19:54.235922	2010-12-03 12:19:54.235922
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-03 12:19:54.262394	2010-12-03 12:19:54.262394
11	6	dk	Blurb agent home	Blurb agent home	2010-12-03 12:19:54.308112	2010-12-03 12:19:54.308112
12	6	en	Blurb agent home	Blurb agent home	2010-12-03 12:19:54.33609	2010-12-03 12:19:54.33609
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-03 12:19:54.394446	2010-12-03 12:19:54.394446
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-03 12:19:54.420206	2010-12-03 12:19:54.420206
15	8	dk	Reset password	Reset password	2010-12-03 12:19:54.648665	2010-12-03 12:19:54.648665
16	8	en	Reset password	Reset password	2010-12-03 12:19:54.716222	2010-12-03 12:19:54.716222
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, title, content, created_at, updated_at, key, scope) FROM stdin;
1	Article::Cms	About us	About us	2010-12-03 12:19:53.890576	2010-12-03 12:19:53.93942	about_us	0
2	Article::Cms	Privacy	Privacy	2010-12-03 12:19:53.983562	2010-12-03 12:19:54.015494	privacy	0
3	Article::Cms	Terms & Conditions	Terms & Conditions	2010-12-03 12:19:54.058071	2010-12-03 12:19:54.088508	terms_conditions	0
4	Article::Cms	Blurb sign up	Blurb sign up	2010-12-03 12:19:54.129491	2010-12-03 12:19:54.153963	blurb_sign_up	1
5	Article::Cms	Blurb buyer home	Blurb buyer home	2010-12-03 12:19:54.227873	2010-12-03 12:19:54.256136	blurb_buyer_home	1
6	Article::Cms	Blurb agent home	Blurb agent home	2010-12-03 12:19:54.300346	2010-12-03 12:19:54.329085	blurb_agent_home	1
7	Article::Cms	Blurb start page role selection	Blurb start page role selection	2010-12-03 12:19:54.387674	2010-12-03 12:19:54.413392	blurb_start_page_role_selection	1
8	Article::Cms	Reset password	Reset password	2010-12-03 12:19:54.641282	2010-12-03 12:19:54.687457	reset_password	2
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count) FROM stdin;
1	Test category 1	\N	2010-12-03 12:19:52.207144	2010-12-03 12:19:52.207144	\N	1	2	\N	0
2	Test category 2	\N	2010-12-03 12:19:52.279948	2010-12-03 12:19:52.279948	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-12-03 12:19:52.244797	2010-12-03 12:19:52.244797
2	2	en	\N	Test category 2	2010-12-03 12:19:52.293155	2010-12-03 12:19:52.293155
\.


--
-- Data for Name: ckeditor_assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ckeditor_assets (id, data_file_name, data_content_type, data_file_size, assetable_id, assetable_type, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-03 12:19:52.463189	2010-12-03 12:19:52.463189
2	United Kingdom	2010-12-03 12:19:52.473301	2010-12-03 12:19:52.473301
3	Scotland	2010-12-03 12:19:53.575658	2010-12-03 12:19:53.575658
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
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2010-12-03 12:19:52.552138	2010-12-03 12:19:52.552138
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2010-12-03 12:19:52.592838	2010-12-03 12:19:52.592838
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2010-12-03 12:19:52.621149	2010-12-03 12:19:52.621149
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2010-12-03 12:19:52.651332	2010-12-03 12:19:52.651332
5	3	en	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	Somebody shared leads with you	2010-12-03 12:19:52.680635	2010-12-03 12:19:52.680635
6	3	dk	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	[DK] Somebody shared leads with you	2010-12-03 12:19:52.70729	2010-12-03 12:19:52.70729
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2010-12-03 12:19:52.734263	2010-12-03 12:19:52.734263
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2010-12-03 12:19:52.779328	2010-12-03 12:19:52.779328
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2010-12-03 12:19:52.817565	2010-12-03 12:19:52.817565
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2010-12-03 12:19:52.842164	2010-12-03 12:19:52.842164
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-03 12:19:52.514977	2010-12-03 12:19:52.582504
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-03 12:19:52.612872	2010-12-03 12:19:52.643167
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-03 12:19:52.671429	2010-12-03 12:19:52.700469
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-03 12:19:52.726645	2010-12-03 12:19:52.772593
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-03 12:19:52.809634	2010-12-03 12:19:52.836012
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
1	level_one_certification_threshold	--- 0\n	2010-12-03 12:19:52.308633	2010-12-03 12:19:52.308633
2	level_two_certification_threshold	--- 0\n	2010-12-03 12:19:52.337496	2010-12-03 12:19:52.337496
3	level_three_certification_threshold	--- 0\n	2010-12-03 12:19:52.365032	2010-12-03 12:19:52.365032
4	default_payout_delay	--- 0\n	2010-12-03 12:19:52.377255	2010-12-03 12:19:52.377255
5	default_leads_per_page	--- 5\n	2010-12-03 12:19:52.387679	2010-12-03 12:19:52.387679
6	default_news_per_page	--- 5\n	2010-12-03 12:19:52.412119	2010-12-03 12:19:52.412119
7	certification_level_1	--- 10\n	2010-12-03 12:19:52.435566	2010-12-03 12:19:52.435566
8	certification_level_2	--- 20\n	2010-12-03 12:19:52.449345	2010-12-03 12:19:52.449345
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
1	blazejek@gmail.com	d77295750c486779d9fe2959e4fb4a563147cbff2203de111be7d561444e72d0e338cd5109abcc127c93f3834ebaa5c435b154d6064b42a570295082d6e83625	ttHJ3Q9wtSuXMcvHFO26	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-03 12:19:53.419168	2010-12-03 12:19:52.910713	\N	2010-12-03 12:19:52.911065	2010-12-03 12:19:53.419765	1	Eino	Mohr	(086)731-8277 x49603	admin1	Francisco Gardens	New Krischester	69494-0535	Nottinghamshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	mAViQyXELpBrOn3I3z4xQQcyOxlPnhRppSaTliqzr5qUWcb2KSm5kFldd4aITh	f	\N
2	buyer@gmail2.com	14ba866b0e62d9531edf73cdf0ea364f79fa974d5c50fa4d9ffeaf1e965a86a973f823c8250424a0d7f3d5d2476097606adc31a93f231f278c2b970a64af4a10	M8XescxXoOQQ-g_ZGmk8	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-03 12:19:53.52867	2010-12-03 12:19:53.487374	\N	2010-12-03 12:19:53.487756	2010-12-03 12:19:53.529195	48	Giovani	Block	847.013.0012 x62638	Carlotta Mertz	Larson Extensions	East Odieburgh	86140	Devon	1	\N	\N	\N	\N	0	\N	\N	\N	\N	SqvZ6FyUNj76dlhEOtu2YTfhfd3YPqpAVhIrJArhi58j3LZPaHAVSxfLuB5DeQ	f	\N
3	agent@gmail2.com	6eea1c6abcd922fb078375e2306ffd45ef2d8a3c9438afc6183a98414e616c905254667e82d2977484df4686be26109b3679dd2de4e9bd67e7141c9b48b29b16	0ms6_Ap6JIfdhjPQWfrl	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-03 12:19:53.636935	2010-12-03 12:19:53.588665	\N	2010-12-03 12:19:53.588966	2010-12-03 12:19:53.637568	2	Henry	Wilkinson	1-243-238-1481 x48240	Josh Quitzon	Garry Plains	Heaneymouth	09721-0116	Strathclyde	3	\N	0	\N	\N	0	\N	\N	\N	\N	oEmgc24Mn4aUXWMNdmvYAHoWj6oTPUNDcL6HJCrrLubryUyGe5h1bZiQ1owhRb	f	\N
4	leaduser@gmail2.com	d6ef34879f20a604e99fa260d16d022ed44a4fbe808f32c83f567231a114ddeee09d837dec0cf99c8e00f7d59af43dddb6f14622298d8e28c623e3d86ae15d2c	oaVDWFTBN5DuD1j9uGh3	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-03 12:19:53.718546	2010-12-03 12:19:53.683364	\N	2010-12-03 12:19:53.683684	2010-12-03 12:19:53.719121	64	Aron	King	334-296-1457 x2957	Buford Hettinger I	Else Crest	North Arnulfotown	74073-7922	Northumberland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	IiS6PMld8L7mqmnMKR0pXHpE8gW0tW9lbmsH0P6IaTN7W0iwJC4ilYvKcNQclY	f	\N
\.


--
-- PostgreSQL database dump complete
--

