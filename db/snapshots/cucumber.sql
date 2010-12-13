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

SELECT pg_catalog.setval('article_translations_id_seq', 18, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 9, true);


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
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('currencies_id_seq', 8, true);


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
1	1	dk	About us	About us	2010-12-09 13:22:03.316282	2010-12-09 13:22:03.316282
2	1	en	About us	About us	2010-12-09 13:22:03.342239	2010-12-09 13:22:03.342239
3	2	dk	Privacy	Privacy	2010-12-09 13:22:03.396219	2010-12-09 13:22:03.396219
4	2	en	Privacy	Privacy	2010-12-09 13:22:03.419892	2010-12-09 13:22:03.419892
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-09 13:22:03.473375	2010-12-09 13:22:03.473375
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-09 13:22:03.51668	2010-12-09 13:22:03.51668
7	4	dk	Blurb sign up	Blurb sign up	2010-12-09 13:22:03.569512	2010-12-09 13:22:03.569512
8	4	en	Blurb sign up	Blurb sign up	2010-12-09 13:22:03.591699	2010-12-09 13:22:03.591699
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-09 13:22:03.644438	2010-12-09 13:22:03.644438
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-09 13:22:03.666845	2010-12-09 13:22:03.666845
11	6	dk	Blurb agent home	Blurb agent home	2010-12-09 13:22:03.728305	2010-12-09 13:22:03.728305
12	6	en	Blurb agent home	Blurb agent home	2010-12-09 13:22:03.754165	2010-12-09 13:22:03.754165
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-09 13:22:03.967945	2010-12-09 13:22:03.967945
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-09 13:22:03.992017	2010-12-09 13:22:03.992017
15	8	dk	Blurb currencies	Blurb currencies	2010-12-09 13:22:04.041428	2010-12-09 13:22:04.041428
16	8	en	Blurb currencies	Blurb currencies	2010-12-09 13:22:04.064486	2010-12-09 13:22:04.064486
17	9	dk	Reset password	Reset password	2010-12-09 13:22:04.113	2010-12-09 13:22:04.113
18	9	en	Reset password	Reset password	2010-12-09 13:22:04.134288	2010-12-09 13:22:04.134288
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-09 13:22:03.303321	2010-12-09 13:22:03.348975	about_us	0	t	2010-12-09 13:22:03.348845
2	Article::Cms	2010-12-09 13:22:03.389943	2010-12-09 13:22:03.426862	privacy	0	t	2010-12-09 13:22:03.426726
3	Article::Cms	2010-12-09 13:22:03.466786	2010-12-09 13:22:03.526871	terms_conditions	0	t	2010-12-09 13:22:03.526742
4	Article::Cms	2010-12-09 13:22:03.563425	2010-12-09 13:22:03.599804	blurb_sign_up	1	t	2010-12-09 13:22:03.59966
5	Article::Cms	2010-12-09 13:22:03.63798	2010-12-09 13:22:03.682954	blurb_buyer_home	1	t	2010-12-09 13:22:03.682818
6	Article::Cms	2010-12-09 13:22:03.721561	2010-12-09 13:22:03.76344	blurb_agent_home	1	t	2010-12-09 13:22:03.763308
7	Article::Cms	2010-12-09 13:22:03.800656	2010-12-09 13:22:03.999663	blurb_start_page_role_selection	1	t	2010-12-09 13:22:03.999535
8	Article::Cms	2010-12-09 13:22:04.035279	2010-12-09 13:22:04.07233	blurb_currencies	1	t	2010-12-09 13:22:04.072187
9	Article::Cms	2010-12-09 13:22:04.106748	2010-12-09 13:22:04.141259	reset_password	2	t	2010-12-09 13:22:04.141131
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
1	Electronics	A distinctio in libero nihil officiis.Modi provident sunt odit porro nisi omnis.	2010-12-09 13:22:01.461886	2010-12-09 13:22:01.461886	\N	1	2	\N	0	1
2	Leisure	Rerum maxime voluptatem culpa.Vel similique vitae corrupti dolorum fuga.	2010-12-09 13:22:01.508771	2010-12-09 13:22:01.508771	\N	3	4	\N	0	2
3	Business	Necessitatibus voluptas iusto non eveniet suscipit dolore placeat.Sed illum voluptas vero laborum.	2010-12-09 13:22:01.547206	2010-12-09 13:22:02.630778	\N	5	6	\N	7	3
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
1	1	dk	A distinctio in libero nihil officiis.Modi provident sunt odit porro nisi omnis.	Electronics	2010-12-09 13:22:01.476186	2010-12-09 13:22:01.476186
2	2	dk	Rerum maxime voluptatem culpa.Vel similique vitae corrupti dolorum fuga.	Leisure	2010-12-09 13:22:01.517242	2010-12-09 13:22:01.517242
3	3	dk	Necessitatibus voluptas iusto non eveniet suscipit dolore placeat.Sed illum voluptas vero laborum.	Business	2010-12-09 13:22:01.553924	2010-12-09 13:22:01.553924
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-09 13:22:00.571767	2010-12-09 13:22:00.571767
2	United Kingdom	2010-12-09 13:22:00.582688	2010-12-09 13:22:00.582688
3	Northern Ireland12919009216038	2010-12-09 13:22:01.605892	2010-12-09 13:22:01.605892
\.


--
-- Data for Name: country_interests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY country_interests (id, country_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY currencies (id, name, symbol, format, active, created_at, updated_at) FROM stdin;
1	et	$	%u%n	t	2010-12-09 13:22:01.852065	2010-12-09 13:22:01.852065
2	illum	$	%u%n	t	2010-12-09 13:22:01.955427	2010-12-09 13:22:01.955427
3	esse	$	%u%n	t	2010-12-09 13:22:02.047404	2010-12-09 13:22:02.047404
4	qui	&euro;	%u%n	t	2010-12-09 13:22:02.13257	2010-12-09 13:22:02.13257
5	placeat	&euro;	%u%n	t	2010-12-09 13:22:02.221213	2010-12-09 13:22:02.221213
6	distinctio	$	%u%n	t	2010-12-09 13:22:02.324785	2010-12-09 13:22:02.324785
7	perferendis	$	%u%n	t	2010-12-09 13:22:02.411728	2010-12-09 13:22:02.411728
8	Euro	&euro;	%u%n	t	2010-12-09 13:22:04.171877	2010-12-09 13:22:04.171877
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2010-12-09 13:22:00.621929	2010-12-09 13:22:00.621929
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2010-12-09 13:22:00.647099	2010-12-09 13:22:00.647099
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2010-12-09 13:22:00.676012	2010-12-09 13:22:00.676012
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2010-12-09 13:22:00.695687	2010-12-09 13:22:00.695687
5	3	en	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	Somebody shared leads with you	2010-12-09 13:22:00.715376	2010-12-09 13:22:00.715376
6	3	dk	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	[DK] Somebody shared leads with you	2010-12-09 13:22:00.860488	2010-12-09 13:22:00.860488
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2010-12-09 13:22:00.878902	2010-12-09 13:22:00.878902
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2010-12-09 13:22:00.897636	2010-12-09 13:22:00.897636
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2010-12-09 13:22:00.917943	2010-12-09 13:22:00.917943
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2010-12-09 13:22:00.938315	2010-12-09 13:22:00.938315
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2010-12-09 13:22:00.96325	2010-12-09 13:22:00.96325
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2010-12-09 13:22:00.981092	2010-12-09 13:22:00.981092
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2010-12-09 13:22:01.008368	2010-12-09 13:22:01.008368
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2010-12-09 13:22:01.030473	2010-12-09 13:22:01.030473
15	8	en	<p></p>	Question	2010-12-09 13:22:01.051265	2010-12-09 13:22:01.051265
16	8	dk	<p></p>	[DK] Question	2010-12-09 13:22:01.069733	2010-12-09 13:22:01.069733
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-09 13:22:00.610468	2010-12-09 13:22:00.640465
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-09 13:22:00.669991	2010-12-09 13:22:00.690047
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-09 13:22:00.709314	2010-12-09 13:22:00.854207
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-09 13:22:00.872892	2010-12-09 13:22:00.892369
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-09 13:22:00.912044	2010-12-09 13:22:00.933143
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-09 13:22:00.955252	2010-12-09 13:22:00.975801
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-09 13:22:00.999003	2010-12-09 13:22:01.023618
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-09 13:22:01.043584	2010-12-09 13:22:01.064482
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
1	1	dk	Officia et vel incidunt aliquid.Reprehenderit praesentium facilis repellat quia possimus sint.	Doloremque quos velit modi quia veniam assumenda.Nemo rerum qui facere minima.	Big deal on printers	2010-12-09 13:22:01.911196	2010-12-09 13:22:01.911196
2	2	dk	Voluptatibus ratione animi quod deleniti consequatur expedita.Placeat ut mollitia quia cum ad.	Corporis non nulla iure voluptatem ipsa voluptates aspernatur aut.Sit rerum voluptas aut ut dolores tempora.	Drills required	2010-12-09 13:22:02.005834	2010-12-09 13:22:02.005834
3	3	dk	Beatae harum quas optio voluptas aut quisquam.Sequi ipsam non dolorum.	Perspiciatis officiis et alias voluptatum ipsa maxime.Nihil consequatur eos nobis sequi aut.	Need assistance in selling a car	2010-12-09 13:22:02.094347	2010-12-09 13:22:02.094347
4	4	dk	Explicabo vel velit sequi similique sed quia asperiores.Est et eum ullam libero beatae rerum porro et.	Praesentium quo odit mollitia consectetur.Voluptatibus corporis ut nam ipsum perferendis accusantium fuga dolor.	Ipod shipment	2010-12-09 13:22:02.179024	2010-12-09 13:22:02.179024
5	5	dk	Est eum veritatis ipsam sunt ut.Dignissimos nesciunt impedit laboriosam.	Ipsam officia natus aut ut amet porro.Molestiae veniam ratione aliquid reiciendis.	Trip to amazonia - looking for offer	2010-12-09 13:22:02.285512	2010-12-09 13:22:02.285512
6	6	dk	Ea labore veniam deleniti ab at.Est sed debitis corrupti et ut nulla.	Dolores quibusdam labore dicta enim laboriosam.Similique itaque sit iste dolores.	LCD - Huge amounts	2010-12-09 13:22:02.372301	2010-12-09 13:22:02.372301
7	7	dk	Saepe temporibus numquam sed illum accusantium repudiandae.Ut illum repellendus unde et maiores ipsam et ut.	Quam sit ex quia saepe voluptas natus sint.Eum ut cupiditate qui.	GPS receivers required	2010-12-09 13:22:02.642772	2010-12-09 13:22:02.642772
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Officia et vel incidunt aliquid.Reprehenderit praesentium facilis repellat quia possimus sint.	Doloremque quos velit modi quia veniam assumenda.Nemo rerum qui facere minima.	2	User::Agent	0	981.0	956.0	1	Brakusconsidine	Forrest Raynor	(286)368-9497 x86624	jodie@dach.biz	384 Wallace Mission	2010-12-09 13:22:01.867971	2010-12-09 13:22:01.867971	2010-12-14	Fae129190092160237 Gerlach	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Voluptatibus ratione animi quod deleniti consequatur expedita.Placeat ut mollitia quia cum ad.	Corporis non nulla iure voluptatem ipsa voluptates aspernatur aut.Sit rerum voluptas aut ut dolores tempora.	2	User::Agent	0	707.0	726.0	1	Daugherty	Abbie Mayer	(571)674-0955 x542	susie@corkery.ca	67134 Heber Via	2010-12-09 13:22:01.966775	2010-12-09 13:22:01.966775	2010-12-14	Fae129190092160237 Gerlach	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Beatae harum quas optio voluptas aut quisquam.Sequi ipsam non dolorum.	Perspiciatis officiis et alias voluptatum ipsa maxime.Nihil consequatur eos nobis sequi aut.	2	User::Agent	0	407.0	705.0	1	Haag	Abigail Kemmer	(491)533-5288 x1712	leland.larson@doylespencer.uk	01413 Marquise Field	2010-12-09 13:22:02.058635	2010-12-09 13:22:02.058635	2010-12-14	Fae129190092160237 Gerlach	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Explicabo vel velit sequi similique sed quia asperiores.Est et eum ullam libero beatae rerum porro et.	Praesentium quo odit mollitia consectetur.Voluptatibus corporis ut nam ipsum perferendis accusantium fuga dolor.	2	User::Agent	0	535.0	200.0	1	Durganmayer	Mitchell Brown	(447)947-8109	lenny@zulauf.us	611 Jean Radial	2010-12-09 13:22:02.143165	2010-12-09 13:22:02.143165	2010-12-14	Fae129190092160237 Gerlach	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Est eum veritatis ipsam sunt ut.Dignissimos nesciunt impedit laboriosam.	Ipsam officia natus aut ut amet porro.Molestiae veniam ratione aliquid reiciendis.	2	User::Agent	0	818.0	616.0	1	Littlehickle	Treva Fadel	431-098-1443	arely@will.com	3986 Turcotte Knolls	2010-12-09 13:22:02.232659	2010-12-09 13:22:02.232659	2010-12-14	Fae129190092160237 Gerlach	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Ea labore veniam deleniti ab at.Est sed debitis corrupti et ut nulla.	Dolores quibusdam labore dicta enim laboriosam.Similique itaque sit iste dolores.	2	User::Agent	0	395.0	359.0	1	Miller	Reyna Crona DDS	(803)690-7997 x06286	sabryna@collier.name	5486 McClure Bridge	2010-12-09 13:22:02.336315	2010-12-09 13:22:02.336315	2010-12-14	Fae129190092160237 Gerlach	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Saepe temporibus numquam sed illum accusantium repudiandae.Ut illum repellendus unde et maiores ipsam et ut.	Quam sit ex quia saepe voluptas natus sint.Eum ut cupiditate qui.	2	User::Agent	0	461.0	855.0	1	Larson	Lauryn Maggio	762-994-6975 x701	effie@barrows.biz	45228 Reynolds Park	2010-12-09 13:22:02.426457	2010-12-09 13:22:02.426457	2010-12-14	Fae129190092160237 Gerlach	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-09 13:22:00.524495	2010-12-09 13:22:00.524495
2	default_leads_per_page	--- 5\n	2010-12-09 13:22:00.535102	2010-12-09 13:22:00.535102
3	certification_level_1	--- 10\n	2010-12-09 13:22:00.541649	2010-12-09 13:22:00.541649
4	certification_level_2	--- 20\n	2010-12-09 13:22:00.54855	2010-12-09 13:22:00.54855
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-09 13:22:00.554837	2010-12-09 13:22:00.554837
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
1	blazejek@gmail.com	52ee1d73631376464d2d609414ce97800b4f237d484075e8457261b06afb6830fdeb00c250431eca507f0de2bbcc83f5d8c3373cf4d4fbcc27f30034e4d73888	Fx6hA4JlC77tTr7PWI4P	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-09 13:22:01.420314	2010-12-09 13:22:01.118361	\N	2010-12-09 13:22:01.118663	2010-12-09 13:22:01.421129	1	Theodora	Kohler	123-143-3929 x1264	root	Torp Springs	Reubenberg	54297-8996	County Down	1	\N	\N	\N	\N	0	\N	\N	\N	\N	A0gRZCeOZDQKeQ2DNP96rY10pUTno6PWBPttXCMAsjq2hdVJDuM5HLvSD0KiEe	f	\N	0	0	0	0	0
2	agent@nbs.com	7e8f5b0bfa101cf5b8038e579adcb086530632a64464638ffe9aa9ef2b7e4f856fcb0b499116fdb1f925600a026f5059dbf3804b39e8d2fe146e3d9d2351c4ef	CaiUstCHjQ1K24LQTCKX	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-09 13:22:01.654983	2010-12-09 13:22:01.618537	\N	2010-12-09 13:22:01.618856	2010-12-09 13:22:01.655607	2	Fae129190092160237	Gerlach	1-216-073-4286	Brody Moore129190092160185	Ebert Point	Makaylahaven	63986	County Fermanagh	3	\N	0	\N	\N	0	\N	\N	\N	\N	vrOcniiRAuAlYF0vHyx75ktc8idBYY37sn5NxG64RNzPK2yB8NllkeLZOADM2H	f	\N	0	0	0	0	0
3	admin@nbs.com	6feec76b5a384a569682868a84bf58043288ef8181e6d2690b8ef89cb2f8a7c0a43c172b2fc3dc2bdd12ad1314f3e81c6ed3a369af52fe095e3b93b5b4316643	yRiGA1aDZQKikV3wnVbL	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-09 13:22:02.772754	2010-12-09 13:22:02.73813	\N	2010-12-09 13:22:02.738491	2010-12-09 13:22:02.77339	1	Bret	Buckridge	848-069-5740 x640	Fletcher Zieme129190092272982	Damian Roads	West Guiseppeburgh	29055-5802	Shropshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	IDCxQ04YV9GQBedxWLKETR50kIngCyAhzjqGZE7IV9eJS7E08ngDBtUCv211mb	f	\N	0	0	0	0	0
4	buyer@nbs.com	e4c2e01adf38f0f7f269cf52442a69434bf22de5db53e8ce8d671ebed634503e65dc53681933fdcbf91c28e6e170970369667ae9a1bd141efea95f0786153334	QOUkyC8EPC478OgOUN-Y	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-09 13:22:02.859905	2010-12-09 13:22:02.822612	\N	2010-12-09 13:22:02.823005	2010-12-09 13:22:02.86073	48	Miracle	Dietrich	1-241-908-4732	Soledad Koepp129190092281378	Neva Islands	Wellingtonfort	04115	Shropshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	MFawt7x8GWNPZqUE27kxjte4A3NjjVVdv9kxxSMmvQsgydXrX4obIO7AWnP1FR	f	t	0	0	0	0	0
5	leaduser@nbs.com	b4d6182332c324fb6ea7785c3ff5979ec947ace36e202fd943385f71d230669578b2267431bde5b99d2023fb25624128fc4a224b6d7fa8b3ba580af09a4fffa5	LQQjYd6OyODwRDxbFaMs	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-09 13:22:02.958036	2010-12-09 13:22:02.92213	\N	2010-12-09 13:22:02.922479	2010-12-09 13:22:02.992402	64	Lenna	Breitenberg	976.916.3024	Jerad Swift Sr.129190092291357	Blick Via	Carrolltown	03234-0458	Merseyside	1	\N	\N	4	\N	0	\N	\N	\N	\N	jPOgm14DQxDssAOHO4077e3C6EcI4eshL95MuMSzRh7VxLxiNjHfCDMvQuYwLx	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

