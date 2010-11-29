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

SELECT pg_catalog.setval('email_template_translations_id_seq', 12, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 6, true);


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

SELECT pg_catalog.setval('settings_id_seq', 7, true);


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

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count) FROM stdin;
1	Test category 1	\N	2010-11-29 14:08:48.783756	2010-11-29 14:08:48.783756	\N	1	2	\N	0
2	Test category 2	\N	2010-11-29 14:08:48.799956	2010-11-29 14:08:48.799956	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-11-29 14:08:48.791773	2010-11-29 14:08:48.791773
2	2	en	\N	Test category 2	2010-11-29 14:08:48.803078	2010-11-29 14:08:48.803078
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-11-29 14:08:48.835053	2010-11-29 14:08:48.835053
2	United Kingdom	2010-11-29 14:08:48.83995	2010-11-29 14:08:48.83995
3	Northern Ireland	2010-11-29 14:08:49.490091	2010-11-29 14:08:49.490091
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-29 14:08:48.863413	2010-11-29 14:08:48.863413
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-11-29 14:08:48.87532	2010-11-29 14:08:48.87532
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-29 14:08:48.884638	2010-11-29 14:08:48.884638
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-11-29 14:08:48.893718	2010-11-29 14:08:48.893718
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-29 14:08:48.903094	2010-11-29 14:08:48.903094
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-11-29 14:08:48.912201	2010-11-29 14:08:48.912201
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-11-29 14:08:48.921509	2010-11-29 14:08:48.921509
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-11-29 14:08:48.930484	2010-11-29 14:08:48.930484
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-29 14:08:48.939934	2010-11-29 14:08:48.939934
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-11-29 14:08:48.949131	2010-11-29 14:08:48.949131
11	6	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-11-29 14:08:49.048336	2010-11-29 14:08:49.048336
12	6	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-11-29 14:08:49.061839	2010-11-29 14:08:49.061839
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-11-29 14:08:48.855351	2010-11-29 14:08:48.872484
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-11-29 14:08:48.88127	2010-11-29 14:08:48.890835
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-11-29 14:08:48.899668	2010-11-29 14:08:48.90933
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-11-29 14:08:48.918138	2010-11-29 14:08:48.92761
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-11-29 14:08:48.936321	2010-11-29 14:08:48.946288
6	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-11-29 14:08:48.954908	2010-11-29 14:08:49.058993
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, hidden_description, description, header, created_at, updated_at) FROM stdin;
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
1	level_one_certification_threshold	--- 0\n	2010-11-29 14:08:48.811187	2010-11-29 14:08:48.811187
2	level_two_certification_threshold	--- 0\n	2010-11-29 14:08:48.816444	2010-11-29 14:08:48.816444
3	level_three_certification_threshold	--- 0\n	2010-11-29 14:08:48.819142	2010-11-29 14:08:48.819142
4	default_payout_delay	--- 0\n	2010-11-29 14:08:48.821741	2010-11-29 14:08:48.821741
5	default_leads_per_page	--- 5\n	2010-11-29 14:08:48.824276	2010-11-29 14:08:48.824276
6	certification_level_1	--- 10\n	2010-11-29 14:08:48.826823	2010-11-29 14:08:48.826823
7	certification_level_2	--- 20\n	2010-11-29 14:08:48.829538	2010-11-29 14:08:48.829538
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
1	blazejek@gmail.com	925af476c1bdc4b1b39eebd0ec3e7b03275eae233a28c7cbbe147e3bb0b8e6dcd8ea5f63f77d193b9ee5fcf47a87f290936ecf97e95b371cdd27c8501d5dae19	iSbQ2amNVsGBAfl4bmZo	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-29 14:08:49.286322	2010-11-29 14:08:49.097011	\N	2010-11-29 14:08:49.097244	2010-11-29 14:08:49.286631	1	Ivory	Pagac	727.718.2721 x6826	admin1	Carissa Harbor	West Barbara	98281-5993	West Glamorgan	1	\N	\N	\N	\N	0	\N	\N	\N	\N	LfrtlVnYQfAt8gkBRUEjF6MDP1FPakueTLGvDFURQON5jbiitobHnU4EZkp8gY	f	\N
2	buyer@gmail2.com	083dca1fff35cd37515fe60dfec1a6737a850f5ee505c7db2fb2cc2323fb06643dbaa6f1742091f191bf80443875084485df599a0f1cce8e70ffc7f3a7e3b3bb	uKOoWPTjKXflUryyNw3v	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-29 14:08:49.464099	2010-11-29 14:08:49.440459	\N	2010-11-29 14:08:49.440713	2010-11-29 14:08:49.464393	48	Judah	Borer	1-092-247-8318 x361	Benjamin Tillman	Esther Valleys	Port Wilhelmine	72462	Isle of Wight	1	\N	\N	\N	\N	0	\N	\N	\N	\N	u5ArLm7lI4fkP8xe97IIvM0tjZTTKp2riTQpmqmSSiIsA3dJLwHts8YQzFDgZf	f	\N
3	agent@gmail2.com	5f5ae6c5e5b7335fbe443c1e8d3295e46abef1bfc4f64bace9d97e16b00c76181260ff1db91794ff2c6081f5048998b3b136448a2df6b9b31f302cc5e13e959e	iF1GAa_vfv2PC7JPLnlR	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-29 14:08:49.520374	2010-11-29 14:08:49.496642	\N	2010-11-29 14:08:49.496858	2010-11-29 14:08:49.520678	2	Angelica	Rippin	411.667.1880 x83964	Arnulfo Welch	Brennan Ranch	South Candido	04828	Cumbria	3	\N	0	\N	\N	0	\N	\N	\N	\N	NsC63oyypNHcgxVCl7cZGzx62Hyl8HHGqSQ3kmIosNl8461hfudqAVzIdzro07	f	\N
4	leaduser@gmail2.com	a7ed554ff4dec88072173b75c87c0943304ae6c182d879d90a888029daac3434d21aaffe410538a2a15dd9467a287ec4f3788824f4c3e3bd5ee4d83fa1e5f5e0	_QvVxLfOkw7tD10awofP	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-11-29 14:08:49.572594	2010-11-29 14:08:49.549015	\N	2010-11-29 14:08:49.549254	2010-11-29 14:08:49.572987	64	Bernardo	Collier	1-216-653-9390	Mariah Wilkinson	Wuckert Passage	Jaydeshire	19495-8941	Devon	1	\N	\N	\N	\N	0	\N	\N	\N	\N	jX5ELJzR2T0qf6uGOcrMo1zQGBpL2PciHW4Vq7fq1ExtgRFOieuGd63Af94de3	f	\N
\.


--
-- PostgreSQL database dump complete
--

