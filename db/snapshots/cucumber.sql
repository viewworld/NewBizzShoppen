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

SELECT pg_catalog.setval('category_translations_id_seq', 6, true);


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
-- Name: invoice_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('invoice_lines_id_seq', 1, false);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('invoices_id_seq', 1, false);


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

SELECT pg_catalog.setval('settings_id_seq', 10, true);


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
1	1	dk	About us	About us	2010-12-21 11:08:24.22229	2010-12-21 11:08:24.22229
2	1	en	About us	About us	2010-12-21 11:08:24.243504	2010-12-21 11:08:24.243504
3	2	dk	Privacy	Privacy	2010-12-21 11:08:24.30185	2010-12-21 11:08:24.30185
4	2	en	Privacy	Privacy	2010-12-21 11:08:24.319603	2010-12-21 11:08:24.319603
5	3	dk	Terms & Conditions	Terms & Conditions	2010-12-21 11:08:24.369041	2010-12-21 11:08:24.369041
6	3	en	Terms & Conditions	Terms & Conditions	2010-12-21 11:08:25.212154	2010-12-21 11:08:25.212154
7	4	dk	Blurb sign up	Blurb sign up	2010-12-21 11:08:25.484164	2010-12-21 11:08:25.484164
8	4	en	Blurb sign up	Blurb sign up	2010-12-21 11:08:25.513592	2010-12-21 11:08:25.513592
9	5	dk	Blurb buyer home	Blurb buyer home	2010-12-21 11:08:25.577849	2010-12-21 11:08:25.577849
10	5	en	Blurb buyer home	Blurb buyer home	2010-12-21 11:08:25.596444	2010-12-21 11:08:25.596444
11	6	dk	Blurb agent home	Blurb agent home	2010-12-21 11:08:25.644198	2010-12-21 11:08:25.644198
12	6	en	Blurb agent home	Blurb agent home	2010-12-21 11:08:25.665681	2010-12-21 11:08:25.665681
13	7	dk	Blurb start page role selection	Blurb start page role selection	2010-12-21 11:08:25.707329	2010-12-21 11:08:25.707329
14	7	en	Blurb start page role selection	Blurb start page role selection	2010-12-21 11:08:25.725725	2010-12-21 11:08:25.725725
15	8	dk	Blurb currencies	Blurb currencies	2010-12-21 11:08:25.764917	2010-12-21 11:08:25.764917
16	8	en	Blurb currencies	Blurb currencies	2010-12-21 11:08:25.784152	2010-12-21 11:08:25.784152
17	9	dk	Reset password	Reset password	2010-12-21 11:08:25.824215	2010-12-21 11:08:25.824215
18	9	en	Reset password	Reset password	2010-12-21 11:08:25.842211	2010-12-21 11:08:25.842211
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2010-12-21 11:08:24.206873	2010-12-21 11:08:24.250322	about_us	0	t	2010-12-21 11:08:24.250217
2	Article::Cms	2010-12-21 11:08:24.296934	2010-12-21 11:08:24.325489	privacy	0	t	2010-12-21 11:08:24.325376
3	Article::Cms	2010-12-21 11:08:24.364002	2010-12-21 11:08:25.430076	terms_conditions	0	t	2010-12-21 11:08:25.429913
4	Article::Cms	2010-12-21 11:08:25.47566	2010-12-21 11:08:25.522726	blurb_sign_up	1	t	2010-12-21 11:08:25.522558
5	Article::Cms	2010-12-21 11:08:25.569931	2010-12-21 11:08:25.603465	blurb_buyer_home	1	t	2010-12-21 11:08:25.6033
6	Article::Cms	2010-12-21 11:08:25.639295	2010-12-21 11:08:25.672671	blurb_agent_home	1	t	2010-12-21 11:08:25.672554
7	Article::Cms	2010-12-21 11:08:25.702484	2010-12-21 11:08:25.73116	blurb_start_page_role_selection	1	t	2010-12-21 11:08:25.73106
8	Article::Cms	2010-12-21 11:08:25.760093	2010-12-21 11:08:25.790593	blurb_currencies	1	t	2010-12-21 11:08:25.790495
9	Article::Cms	2010-12-21 11:08:25.818948	2010-12-21 11:08:25.848669	reset_password	2	t	2010-12-21 11:08:25.848571
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, published_leads_count) FROM stdin;
1	Electronics	Soluta repudiandae est id.Illum corporis sit eaque impedit autem ut earum.	2010-12-21 11:08:22.269123	2010-12-21 11:08:22.269123	\N	1	2	\N	0	1-electronics	0
2	Leisure	Aut dolorem esse molestias dignissimos id.Aut quod earum cumque numquam necessitatibus labore.	2010-12-21 11:08:22.336639	2010-12-21 11:08:22.336639	\N	3	4	\N	0	2-leisure	0
3	Business	Temporibus voluptatem numquam voluptatem.Saepe quidem neque qui ut omnis reprehenderit.	2010-12-21 11:08:22.406336	2010-12-21 11:08:23.744479	\N	5	6	\N	7	3-business	7
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
1	1	en	Soluta repudiandae est id.Illum corporis sit eaque impedit autem ut earum.	Electronics	2010-12-21 11:08:22.280252	2010-12-21 11:08:22.280252
2	1	dk	\N	Electronics	2010-12-21 11:08:22.320541	2010-12-21 11:08:22.320541
3	2	en	Aut dolorem esse molestias dignissimos id.Aut quod earum cumque numquam necessitatibus labore.	Leisure	2010-12-21 11:08:22.342402	2010-12-21 11:08:22.342402
4	2	dk	\N	Leisure	2010-12-21 11:08:22.383519	2010-12-21 11:08:22.383519
5	3	en	Temporibus voluptatem numquam voluptatem.Saepe quidem neque qui ut omnis reprehenderit.	Business	2010-12-21 11:08:22.416012	2010-12-21 11:08:22.416012
6	3	dk	\N	Business	2010-12-21 11:08:22.467078	2010-12-21 11:08:22.467078
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-21 11:08:21.582729	2010-12-21 11:08:21.582729
2	United Kingdom	2010-12-21 11:08:21.596281	2010-12-21 11:08:21.596281
3	Scotland129292970275761	2010-12-21 11:08:22.75924	2010-12-21 11:08:22.75924
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
1	cumque	&euro;	%u%n	t	2010-12-21 11:08:22.851582	2010-12-21 11:08:22.851582
2	est	&euro;	%u%n	t	2010-12-21 11:08:23.175935	2010-12-21 11:08:23.175935
3	alias	&pound;	%u%n	t	2010-12-21 11:08:23.284764	2010-12-21 11:08:23.284764
4	commodi	&pound;	%u%n	t	2010-12-21 11:08:23.384474	2010-12-21 11:08:23.384474
5	in	$	%u%n	t	2010-12-21 11:08:23.48115	2010-12-21 11:08:23.48115
6	ducimus	&pound;	%u%n	t	2010-12-21 11:08:23.582554	2010-12-21 11:08:23.582554
7	quisquam	&pound;	%u%n	t	2010-12-21 11:08:23.701658	2010-12-21 11:08:23.701658
8	Euro	&euro;	%u%n	t	2010-12-21 11:08:25.875083	2010-12-21 11:08:25.875083
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2010-12-21 11:08:21.650788	2010-12-21 11:08:21.650788
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2010-12-21 11:08:21.682497	2010-12-21 11:08:21.682497
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2010-12-21 11:08:21.714074	2010-12-21 11:08:21.714074
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2010-12-21 11:08:21.737372	2010-12-21 11:08:21.737372
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2010-12-21 11:08:21.758003	2010-12-21 11:08:21.758003
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2010-12-21 11:08:21.787227	2010-12-21 11:08:21.787227
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2010-12-21 11:08:21.818447	2010-12-21 11:08:21.818447
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2010-12-21 11:08:21.841386	2010-12-21 11:08:21.841386
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2010-12-21 11:08:21.871016	2010-12-21 11:08:21.871016
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2010-12-21 11:08:21.900957	2010-12-21 11:08:21.900957
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2010-12-21 11:08:21.928065	2010-12-21 11:08:21.928065
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2010-12-21 11:08:21.949741	2010-12-21 11:08:21.949741
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2010-12-21 11:08:21.980903	2010-12-21 11:08:21.980903
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2010-12-21 11:08:22.010696	2010-12-21 11:08:22.010696
15	8	en	<p></p>	Question	2010-12-21 11:08:22.045074	2010-12-21 11:08:22.045074
16	8	dk	<p></p>	[DK] Question	2010-12-21 11:08:22.073203	2010-12-21 11:08:22.073203
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-21 11:08:21.63515	2010-12-21 11:08:21.673911
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-21 11:08:21.705205	2010-12-21 11:08:21.731514
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-21 11:08:21.750827	2010-12-21 11:08:21.777333
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-21 11:08:21.808364	2010-12-21 11:08:21.83466
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-21 11:08:21.860907	2010-12-21 11:08:21.891597
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-21 11:08:21.922163	2010-12-21 11:08:21.941338
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-21 11:08:21.970809	2010-12-21 11:08:22.001539
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-21 11:08:22.032088	2010-12-21 11:08:22.065475
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, pkwiu, unit, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at) FROM stdin;
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
1	1	dk	Itaque eligendi voluptatem ad atque eos quo id.Voluptas et repellendus sit odio dolores quam sit.	Quod modi itaque sit assumenda aut dolores.Minima et voluptatum neque possimus.	Big deal on printers	2010-12-21 11:08:23.122173	2010-12-21 11:08:23.122173
2	2	dk	Iure ut odio voluptatem odit quia.Blanditiis ab sunt minima quo ut.	Id beatae sit qui amet eos et inventore est.Iste molestiae nam libero debitis dolor.	Drills required	2010-12-21 11:08:23.231939	2010-12-21 11:08:23.231939
3	3	dk	Ex odit laudantium sit a quod est sequi ducimus.Iusto ullam sunt et dolore.	Facilis eligendi id qui qui.Eaque unde cumque exercitationem commodi.	Need assistance in selling a car	2010-12-21 11:08:23.341454	2010-12-21 11:08:23.341454
4	4	dk	Ut laborum laboriosam quis architecto dolores.Dolorem voluptatibus quo quisquam consequatur aperiam ea ut.	Nisi ut modi quaerat quod ut aut magnam tempora.Necessitatibus est eos omnis ut recusandae.	Ipod shipment	2010-12-21 11:08:23.437215	2010-12-21 11:08:23.437215
5	5	dk	Dolores expedita earum architecto nam corporis deleniti magni qui.Est ea est ullam omnis.	Voluptas quos velit tempora quis neque molestias.Qui nihil minus qui nisi ut architecto.	Trip to amazonia - looking for offer	2010-12-21 11:08:23.532805	2010-12-21 11:08:23.532805
6	6	dk	Necessitatibus cupiditate et corporis reiciendis.Assumenda minima qui beatae eius numquam distinctio aut debitis.	Voluptate iste rerum beatae voluptas ut eos soluta ad.Excepturi et accusamus deserunt sint id est fuga.	LCD - Huge amounts	2010-12-21 11:08:23.649629	2010-12-21 11:08:23.649629
7	7	dk	Eos molestiae ab in ex.Error consequatur quas magni tempora maiores non maxime.	Sit quia qui commodi itaque rerum dolores tempore.Odit ipsa voluptatem ad assumenda aut voluptate sint accusantium.	GPS receivers required	2010-12-21 11:08:23.754337	2010-12-21 11:08:23.754337
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id) FROM stdin;
1	Big deal on printers	3	Quod modi itaque sit assumenda aut dolores.Minima et voluptatum neque possimus.	Itaque eligendi voluptatem ad atque eos quo id.Voluptas et repellendus sit odio dolores quam sit.	2	User::Agent	0	478.0	913.0	1	Smithblock	Scarlett Mraz	847-855-0037 x45378	ursula@swaniawskimorissette.com	7272 Bode Springs	2010-12-21 11:08:23.056614	2010-12-21 11:08:23.056614	2010-12-26	Winfield129292970275677 Friesen	1	t	\N	0	0	f	f	-1	1
2	Drills required	3	Id beatae sit qui amet eos et inventore est.Iste molestiae nam libero debitis dolor.	Iure ut odio voluptatem odit quia.Blanditiis ab sunt minima quo ut.	2	User::Agent	0	333.0	490.0	1	Homenick	Yoshiko Funk	450-015-5311 x5836	zula.klein@rueckerratke.us	94037 Purdy Passage	2010-12-21 11:08:23.188038	2010-12-21 11:08:23.188038	2010-12-26	Winfield129292970275677 Friesen	1	t	\N	0	0	f	f	-1	2
3	Need assistance in selling a car	3	Facilis eligendi id qui qui.Eaque unde cumque exercitationem commodi.	Ex odit laudantium sit a quod est sequi ducimus.Iusto ullam sunt et dolore.	2	User::Agent	0	932.0	82.0	1	Schimmel	Adrianna Brakus	(855)678-1833 x58979	eda@luettgen.us	947 Blanda Road	2010-12-21 11:08:23.296698	2010-12-21 11:08:23.296698	2010-12-26	Winfield129292970275677 Friesen	1	t	\N	0	0	f	f	-1	3
4	Ipod shipment	3	Nisi ut modi quaerat quod ut aut magnam tempora.Necessitatibus est eos omnis ut recusandae.	Ut laborum laboriosam quis architecto dolores.Dolorem voluptatibus quo quisquam consequatur aperiam ea ut.	2	User::Agent	0	793.0	493.0	1	Jones	Mathias Mayer	(577)988-7900	nadia.legros@hyattondricka.uk	888 Schiller Roads	2010-12-21 11:08:23.394778	2010-12-21 11:08:23.394778	2010-12-26	Winfield129292970275677 Friesen	1	t	\N	0	0	f	f	-1	4
5	Trip to amazonia - looking for offer	3	Voluptas quos velit tempora quis neque molestias.Qui nihil minus qui nisi ut architecto.	Dolores expedita earum architecto nam corporis deleniti magni qui.Est ea est ullam omnis.	2	User::Agent	0	938.0	773.0	1	Schneiderbogisich	Chadd Maggio	1-672-331-5864 x2110	leonardo.moen@olsondickens.biz	232 Johnson Neck	2010-12-21 11:08:23.492153	2010-12-21 11:08:23.492153	2010-12-26	Winfield129292970275677 Friesen	1	t	\N	0	0	f	f	-1	5
6	LCD - Huge amounts	3	Voluptate iste rerum beatae voluptas ut eos soluta ad.Excepturi et accusamus deserunt sint id est fuga.	Necessitatibus cupiditate et corporis reiciendis.Assumenda minima qui beatae eius numquam distinctio aut debitis.	2	User::Agent	0	539.0	567.0	1	Bauch	Wilhelm Kozey	1-104-148-2391	unique.robel@bernhard.co.uk	531 Shanna Road	2010-12-21 11:08:23.597876	2010-12-21 11:08:23.597876	2010-12-26	Winfield129292970275677 Friesen	1	t	\N	0	0	f	f	-1	6
7	GPS receivers required	3	Sit quia qui commodi itaque rerum dolores tempore.Odit ipsa voluptatem ad assumenda aut voluptate sint accusantium.	Eos molestiae ab in ex.Error consequatur quas magni tempora maiores non maxime.	2	User::Agent	0	35.0	587.0	1	Legros	Tomasa Collins	073.765.1449 x774	rebeka@white.ca	508 Arvid Islands	2010-12-21 11:08:23.711047	2010-12-21 11:08:23.711047	2010-12-26	Winfield129292970275677 Friesen	1	t	\N	0	0	f	f	-1	7
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-21 11:08:21.496237	2010-12-21 11:08:21.496237
2	default_leads_per_page	--- 5\n	2010-12-21 11:08:21.50554	2010-12-21 11:08:21.50554
3	certification_level_1	--- 10\n	2010-12-21 11:08:21.51148	2010-12-21 11:08:21.51148
4	certification_level_2	--- 20\n	2010-12-21 11:08:21.517919	2010-12-21 11:08:21.517919
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-21 11:08:21.524301	2010-12-21 11:08:21.524301
6	invoicing_default_payment_deadline_date	--- 14\n	2010-12-21 11:08:21.531773	2010-12-21 11:08:21.531773
7	invoicing_seller_name	--- Fairleads\n	2010-12-21 11:08:21.539181	2010-12-21 11:08:21.539181
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2010-12-21 11:08:21.54687	2010-12-21 11:08:21.54687
9	invoicing_seller_vat_number	--- 123-456-789\n	2010-12-21 11:08:21.554039	2010-12-21 11:08:21.554039
10	invoicing_seller_payment_account	--- "0011400000000000000000001"\n	2010-12-21 11:08:21.56083	2010-12-21 11:08:21.56083
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
1	blazejek@gmail.com	8294e53c24a56c85eacfc8e3916bb5ba9be75388f8c32d7a113434797c7b12258ba0d047409c0f436f4d670f45077356e167c8039c99e457569d3c67b31738fe	kYbaG4qi-Dzfz36g18yk	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 11:08:22.236147	2010-12-21 11:08:22.142193	\N	2010-12-21 11:08:22.142496	2010-12-21 11:08:22.2366	1	Orin	Runolfsson	1-437-611-8735 x5924	root	Schiller Trail	West Dorothy	43455-8704	Rutland	1	\N	\N	\N	\N	0	\N	\N	\N	\N	3P8sxj4oR2H8P0Zdi3fjHxYGee3V4zULj3EzzGoN4AOhvz9YE2QShD8gMU9gpE	f	\N	0	0	0	0	0
2	agent@nbs.com	707156be239df312b6ba79a0a3911142d898b293624ccb13a95cbcbae6eaf64a37e215780c3f3b86e42d5fa9b9dec49e0235c68a214f860844ae603a1f26e576	NTqE1ZlBNX2dKbDc1COu	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 11:08:22.802023	2010-12-21 11:08:22.768439	\N	2010-12-21 11:08:22.768703	2010-12-21 11:08:22.802574	2	Winfield129292970275677	Friesen	924.913.2403 x16999	Mr. Oceane Swaniawski129292970275637	Anahi Harbor	Kuhlmanfort	27652-6390	Borders	3	\N	0	\N	\N	0	\N	\N	\N	\N	DakfSp32vM1x6Mr8QUkWzU2JTvdOGffpTNZmiGLHZBlnakspSerXs9R7PqqoW4	f	\N	0	0	0	0	0
3	admin@nbs.com	6f9a0434b7818266a24e37f3b9e617c2da463dbc7d5cf1c7f5d3f38f197225d7d6ea8e5a06a6b0585e4ca0881c313038164a78936333616267c86637da41384e	Q4KLU2ZXGStki9LYW-OK	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 11:08:23.865999	2010-12-21 11:08:23.835494	\N	2010-12-21 11:08:23.835942	2010-12-21 11:08:23.866405	1	Aleen	McClure	095-747-0820 x02074	Gay Gottlieb129292970382851	Janis Groves	Friesenland	47083	Devon	1	\N	\N	\N	\N	0	\N	\N	\N	\N	lojMzRulVdTOAldUxg2Xy9uLbvsgQR78QehwiRD8ZWSb8LkPfytRdowDNFlDUp	f	\N	0	0	0	0	0
4	buyer@nbs.com	fb0ad391b6e85066364d5bd05dfa1bde32b4ddd6450afc7d21aac98cf58cbc67a007ba106bf5cc5faccdb68682db924fc7173f1357db438273703de65e811950	Rky3-sLH_0XXlg1mK_pC	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 11:08:23.94666	2010-12-21 11:08:23.917466	\N	2010-12-21 11:08:23.917752	2010-12-21 11:08:23.947097	48	Columbus	Wilderman	184.638.3239 x235	Mrs. Renee Monahan129292970391103	Adams Drives	Lake Luisview	83938-8284	Gloucestershire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	Td1oEkQwoUo7iIIbzN54LDD0u9w8XqWNLJD5go6RiTdZLQfDq69eToxaDy4cW3	f	t	0	0	0	0	0
5	leaduser@nbs.com	95cec231bad9cab666380b855ae679e6a5ce3c1dbc499171ba67588fee46060da20e38e8c3edeffcac5860744742703d1ff4b3be6bc4993c3000d97e1ca612c6	ZpwhhBzLQjeNtpcPDIQ3	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-21 11:08:24.038835	2010-12-21 11:08:24.008022	\N	2010-12-21 11:08:24.008298	2010-12-21 11:08:24.072372	64	Kenyon	Crist	062.147.1035 x506	Constance Russel129292970399945	Schowalter Orchard	North Noemi	08227-6337	Warwickshire	1	\N	\N	4	\N	0	\N	\N	\N	\N	2NFXoWVTWzKyBj6qlu6Z8LErq6q2XGYYBtimkzUhBbqoGEXbHksMcscjWDPiZK	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

