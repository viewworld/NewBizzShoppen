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

SELECT pg_catalog.setval('article_translations_id_seq', 33, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 17, true);


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

SELECT pg_catalog.setval('users_id_seq', 5, true);


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, content, title, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2010-12-07 10:54:44.962365	2010-12-07 10:54:44.962365
2	1	en	About us	About us	2010-12-07 10:54:44.993925	2010-12-07 10:54:44.993925
3	2	dk	Privacy	Privacy	2010-12-07 10:54:45.05759	2010-12-07 10:54:45.05759
4	2	en	Privacy	Privacy	2010-12-07 10:54:45.085134	2010-12-07 10:54:45.085134
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-07 10:54:45.267657	2010-12-07 10:54:45.267657
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-07 10:54:45.306468	2010-12-07 10:54:45.306468
7	4	dk	Blurb sign up	Blurb sign up	2010-12-07 10:54:45.378856	2010-12-07 10:54:45.378856
8	4	en	Blurb sign up	Blurb sign up	2010-12-07 10:54:45.407997	2010-12-07 10:54:45.407997
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-07 10:54:45.461986	2010-12-07 10:54:45.461986
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-07 10:54:45.48808	2010-12-07 10:54:45.48808
11	6	dk	Blurb agent home	Blurb agent home	2010-12-07 10:54:45.768269	2010-12-07 10:54:45.768269
12	6	en	Blurb agent home	Blurb agent home	2010-12-07 10:54:45.803795	2010-12-07 10:54:45.803795
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-07 10:54:45.884659	2010-12-07 10:54:45.884659
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-07 10:54:45.909317	2010-12-07 10:54:45.909317
15	8	dk	Reset password	Reset password	2010-12-07 10:54:45.960365	2010-12-07 10:54:45.960365
16	8	en	Reset password	Reset password	2010-12-07 10:54:45.998226	2010-12-07 10:54:45.998226
18	10	dk	About us	About us	2010-12-07 13:54:01.285794	2010-12-07 13:54:01.285794
19	10	en	About us	About us	2010-12-07 13:54:01.315059	2010-12-07 13:54:01.315059
20	11	dk	Privacy	Privacy	2010-12-07 13:54:01.382545	2010-12-07 13:54:01.382545
21	11	en	Privacy	Privacy	2010-12-07 13:54:01.407215	2010-12-07 13:54:01.407215
22	12	dk	Terms & Conditions	Terms & Conditions	2010-12-07 13:54:01.475686	2010-12-07 13:54:01.475686
23	12	en	Terms & Conditions	Terms & Conditions	2010-12-07 13:54:01.511539	2010-12-07 13:54:01.511539
24	13	dk	Blurb sign up	Blurb sign up	2010-12-07 13:54:01.587624	2010-12-07 13:54:01.587624
25	13	en	Blurb sign up	Blurb sign up	2010-12-07 13:54:01.624643	2010-12-07 13:54:01.624643
26	14	dk	Blurb buyer home	Blurb buyer home	2010-12-07 13:54:01.670261	2010-12-07 13:54:01.670261
27	14	en	Blurb buyer home	Blurb buyer home	2010-12-07 13:54:01.692633	2010-12-07 13:54:01.692633
28	15	dk	Blurb agent home	Blurb agent home	2010-12-07 13:54:01.768092	2010-12-07 13:54:01.768092
29	15	en	Blurb agent home	Blurb agent home	2010-12-07 13:54:01.791188	2010-12-07 13:54:01.791188
30	16	dk	Blurb start page role selection	Blurb start page role selection	2010-12-07 13:54:01.841492	2010-12-07 13:54:01.841492
31	16	en	Blurb start page role selection	Blurb start page role selection	2010-12-07 13:54:01.86256	2010-12-07 13:54:01.86256
32	17	dk	Reset password	Reset password	2010-12-07 13:54:01.912319	2010-12-07 13:54:01.912319
33	17	en	Reset password	Reset password	2010-12-07 13:54:01.938908	2010-12-07 13:54:01.938908
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
10	Article::Cms	2010-12-07 13:54:01.271877	2010-12-07 13:54:01.321437	about_us	0	t	2010-12-07 13:54:01.321312
11	Article::Cms	2010-12-07 13:54:01.375736	2010-12-07 13:54:01.414591	privacy	0	t	2010-12-07 13:54:01.414468
12	Article::Cms	2010-12-07 13:54:01.466078	2010-12-07 13:54:01.521468	terms_conditions	0	t	2010-12-07 13:54:01.521277
13	Article::Cms	2010-12-07 13:54:01.578186	2010-12-07 13:54:01.630882	blurb_sign_up	1	t	2010-12-07 13:54:01.630774
14	Article::Cms	2010-12-07 13:54:01.663716	2010-12-07 13:54:01.701951	blurb_buyer_home	1	t	2010-12-07 13:54:01.701775
15	Article::Cms	2010-12-07 13:54:01.760869	2010-12-07 13:54:01.798848	blurb_agent_home	1	t	2010-12-07 13:54:01.798735
16	Article::Cms	2010-12-07 13:54:01.835421	2010-12-07 13:54:01.868967	blurb_start_page_role_selection	1	t	2010-12-07 13:54:01.868857
17	Article::Cms	2010-12-07 13:54:01.902928	2010-12-07 13:54:01.947558	reset_password	2	t	2010-12-07 13:54:01.94734
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count) FROM stdin;
1	Test category 1	\N	2010-12-07 10:54:43.7098	2010-12-07 10:54:43.7098	\N	1	2	\N	0
2	Test category 2	\N	2010-12-07 10:54:43.748366	2010-12-07 10:54:43.748366	\N	3	4	\N	0
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
1	1	en	\N	Test category 1	2010-12-07 10:54:43.721117	2010-12-07 10:54:43.721117
2	2	en	\N	Test category 2	2010-12-07 10:54:43.753789	2010-12-07 10:54:43.753789
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-07 10:54:43.848963	2010-12-07 10:54:43.848963
2	United Kingdom	2010-12-07 10:54:43.860387	2010-12-07 10:54:43.860387
3	Scotland	2010-12-07 10:54:44.565925	2010-12-07 10:54:44.565925
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
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2010-12-07 10:54:43.902702	2010-12-07 10:54:43.902702
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2010-12-07 10:54:43.94108	2010-12-07 10:54:43.94108
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2010-12-07 10:54:43.961868	2010-12-07 10:54:43.961868
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2010-12-07 10:54:43.982622	2010-12-07 10:54:43.982622
5	3	en	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	Somebody shared leads with you	2010-12-07 10:54:44.006282	2010-12-07 10:54:44.006282
6	3	dk	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	[DK] Somebody shared leads with you	2010-12-07 10:54:44.029022	2010-12-07 10:54:44.029022
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2010-12-07 10:54:44.159969	2010-12-07 10:54:44.159969
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2010-12-07 10:54:44.179301	2010-12-07 10:54:44.179301
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2010-12-07 10:54:44.200722	2010-12-07 10:54:44.200722
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2010-12-07 10:54:44.226495	2010-12-07 10:54:44.226495
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-07 10:54:43.888693	2010-12-07 10:54:43.934795
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-07 10:54:43.954614	2010-12-07 10:54:43.976518
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-07 10:54:43.998106	2010-12-07 10:54:44.022224
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-07 10:54:44.153102	2010-12-07 10:54:44.173555
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-07 10:54:44.194098	2010-12-07 10:54:44.217366
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
1	level_one_certification_threshold	--- 0\n	2010-12-07 10:54:43.768821	2010-12-07 10:54:43.768821
2	level_two_certification_threshold	--- 0\n	2010-12-07 10:54:43.780699	2010-12-07 10:54:43.780699
3	level_three_certification_threshold	--- 0\n	2010-12-07 10:54:43.789577	2010-12-07 10:54:43.789577
4	default_payout_delay	--- 0\n	2010-12-07 10:54:43.799397	2010-12-07 10:54:43.799397
5	default_leads_per_page	--- 5\n	2010-12-07 10:54:43.807828	2010-12-07 10:54:43.807828
6	default_news_per_page	--- 5\n	2010-12-07 10:54:43.815569	2010-12-07 10:54:43.815569
7	certification_level_1	--- 10\n	2010-12-07 10:54:43.824626	2010-12-07 10:54:43.824626
8	certification_level_2	--- 20\n	2010-12-07 10:54:43.833376	2010-12-07 10:54:43.833376
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
1	blazejek@gmail.com	ec1d46f87f9135815e1cf828760d065529a1b3505ccc6a133e723e93b98ae46b41c33b18e0aa360ba858e5a8bf0d08e906e7c3e08811586843d3723396be5522	ZxYvzNgjEZpIyoL3etq6	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 10:54:44.443345	2010-12-07 10:54:44.309214	\N	2010-12-07 10:54:44.309542	2010-12-07 10:54:44.443803	1	Humberto	Kiehn	1-579-342-1526 x45730	admin1	Luisa Valley	Klockofort	80241	Tyne and Wear	1	\N	\N	\N	\N	0	\N	\N	\N	\N	rxtovF4CaihajtgsjjooipODNL6sdIj1vH7oI7kn4jcx0PTm6nBo6oykefKL4T	f	\N
2	buyer@gmail2.com	e8f6c0e4e0174cc42cd8a50e7afcf609acdd28776d41b5a31c6c38cf72345347d2c624e7162930f8c765367f6ff0c7f9abe436344b4eb7764b69e7422e317bfe	dNaQ9NX6V9-RKX57Y3M8	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 10:54:44.527724	2010-12-07 10:54:44.493431	\N	2010-12-07 10:54:44.493755	2010-12-07 10:54:44.528225	48	Alek	Gerhold	1-122-655-4594 x5079	Myrna Williamson	Brad Plaza	Lake Zachery	25009	Merseyside	1	\N	\N	\N	\N	0	\N	\N	\N	\N	eR6qycH2S6rE4XetKTkfUJLIEnJ0fqBlTKCqIS4Z2QoEKeVvTdsSlVHynUG9Lb	f	\N
3	agent@gmail2.com	877dd7cbbd55ba7510425354fef8b192839d003bf5637450d64c8a7d2844c9f0167cb45e117d7dd093e7d7ba9d8c9e5cadf37fb5e79c9f03a09775daf47ed607	qJGwCVhxqZQ9g3cFiB8K	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 10:54:44.62017	2010-12-07 10:54:44.580524	\N	2010-12-07 10:54:44.580931	2010-12-07 10:54:44.620772	2	Michale	Haley	373-778-5193	Urban Bednar	Verona Terrace	Lake Anibal	15664-0546	Greater Manchester	3	\N	0	\N	\N	0	\N	\N	\N	\N	PNevmv4qj3629rVQ5aS6WgZclmyisqblV4AyTYlOssrlQiWxqPHQogzeMX0Yej	f	\N
4	leaduser@gmail2.com	2072f9f27be40810e82e8b36097df325ac3020547fc8f1f2b658a5a17e649c0a02faa12d0fdfba406f9c4ef2d25f310b29e55e29df60e97e5ae010d5dc9bf499	0A5cRV6XQP4XbRaxsuDj	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-07 10:54:44.817864	2010-12-07 10:54:44.670505	\N	2010-12-07 10:54:44.670818	2010-12-07 10:54:44.818308	64	Myrtie	Heathcote	272.416.7291 x4382	Miss Elyssa Carter	Dibbert Drive	New Michaleport	57490-7866	Isle of Wight	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Bw1ZSFMOSno7WNOmSTMWGENOXadezuczkMiX3978A9G7NOlrnB3t7pHeTC5Pb1	f	\N
\.


--
-- PostgreSQL database dump complete
--

