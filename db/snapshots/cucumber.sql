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
1	Electronics	Et et reiciendis repellat sequi dolore voluptatibus et.Autem modi mollitia accusantium ducimus quia ut iure eos.	2010-12-08 14:36:44.877041	2010-12-08 14:36:44.877041	\N	1	2	\N	0	1
2	Leisure	Esse itaque est ducimus.At et ipsum soluta.	2010-12-08 14:36:44.905643	2010-12-08 14:36:44.905643	\N	3	4	\N	0	2
3	Business	Amet odio unde qui autem consequatur magnam nesciunt.Ut vel dolorem unde maxime.	2010-12-08 14:36:44.926143	2010-12-08 14:36:45.443908	\N	5	6	\N	7	3
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
1	1	dk	Et et reiciendis repellat sequi dolore voluptatibus et.Autem modi mollitia accusantium ducimus quia ut iure eos.	Electronics	2010-12-08 14:36:44.886451	2010-12-08 14:36:44.886451
2	2	dk	Esse itaque est ducimus.At et ipsum soluta.	Leisure	2010-12-08 14:36:44.909695	2010-12-08 14:36:44.909695
3	3	dk	Amet odio unde qui autem consequatur magnam nesciunt.Ut vel dolorem unde maxime.	Business	2010-12-08 14:36:44.930403	2010-12-08 14:36:44.930403
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2010-12-08 14:36:44.437323	2010-12-08 14:36:44.437323
2	United Kingdom	2010-12-08 14:36:44.441903	2010-12-08 14:36:44.441903
3	Northern Ireland129181900496058	2010-12-08 14:36:44.96192	2010-12-08 14:36:44.96192
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
1	1	en	Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-08 14:36:44.467241	2010-12-08 14:36:44.467241
2	1	dk	[DK] Confirmation instructions	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	2010-12-08 14:36:44.482262	2010-12-08 14:36:44.482262
3	2	en	Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-08 14:36:44.495024	2010-12-08 14:36:44.495024
4	2	dk	[DK] Reset password instructions	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	2010-12-08 14:36:44.507271	2010-12-08 14:36:44.507271
5	3	en	Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-08 14:36:44.520074	2010-12-08 14:36:44.520074
6	3	dk	[DK] Somebody shared leads with you	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	2010-12-08 14:36:44.532522	2010-12-08 14:36:44.532522
7	4	en	Contact regarding lead	<p>{{lead.id}}</p>	2010-12-08 14:36:44.545254	2010-12-08 14:36:44.545254
8	4	dk	[DK] Contact regarding lead	<p>{{lead.id}}</p>	2010-12-08 14:36:44.674024	2010-12-08 14:36:44.674024
9	5	en	Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-08 14:36:44.686174	2010-12-08 14:36:44.686174
10	5	dk	[DK] Lead Purchase is about to expire	<p>{{lead_purchase.id}}</p>	2010-12-08 14:36:44.698159	2010-12-08 14:36:44.698159
11	6	en	Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-08 14:36:44.710176	2010-12-08 14:36:44.710176
12	6	dk	[DK] Lead has been rated as unsatisfactory	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	2010-12-08 14:36:44.72204	2010-12-08 14:36:44.72204
13	7	en	Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-08 14:36:44.734021	2010-12-08 14:36:44.734021
14	7	dk	[DK] Lead has been updated	<p>Lead {{lead.header}} has been updated by agent.</p>	2010-12-08 14:36:44.747313	2010-12-08 14:36:44.747313
15	8	en	Question	<p></p>	2010-12-08 14:36:44.759545	2010-12-08 14:36:44.759545
16	8	dk	[DK] Question	<p></p>	2010-12-08 14:36:44.771478	2010-12-08 14:36:44.771478
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2010-12-08 14:36:44.458218	2010-12-08 14:36:44.477883
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2010-12-08 14:36:44.490473	2010-12-08 14:36:44.503141
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.id}}</p>\n{% endfor %}	\N	share_leads_by_email_message	t	2010-12-08 14:36:44.515557	2010-12-08 14:36:44.528277
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2010-12-08 14:36:44.540567	2010-12-08 14:36:44.669912
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2010-12-08 14:36:44.681821	2010-12-08 14:36:44.69409
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2010-12-08 14:36:44.705911	2010-12-08 14:36:44.717983
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2010-12-08 14:36:44.729713	2010-12-08 14:36:44.743307
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2010-12-08 14:36:44.755214	2010-12-08 14:36:44.76744
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, accessible, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, description, header, hidden_description, created_at, updated_at) FROM stdin;
1	1	dk	Omnis tempora officia voluptas et.Sit sed quo expedita maiores eos.	Big deal on printers	Error atque dolorum neque pariatur est quisquam nam dignissimos.Reiciendis non asperiores nihil.	2010-12-08 14:36:45.168813	2010-12-08 14:36:45.168813
2	2	dk	Est magnam similique nobis quia officiis repudiandae autem neque.Porro beatae sit non alias impedit quo aut minima.	Drills required	Ut et ut velit.Voluptatem delectus dolores necessitatibus temporibus.	2010-12-08 14:36:45.217715	2010-12-08 14:36:45.217715
3	3	dk	Velit mollitia est voluptates.Ipsum esse quam neque quibusdam suscipit itaque et.	Need assistance in selling a car	Aspernatur nam omnis qui.Delectus vel aperiam debitis.	2010-12-08 14:36:45.266048	2010-12-08 14:36:45.266048
4	4	dk	Qui cum delectus enim beatae dolor culpa ut tempora.Ut qui non quia.	Ipod shipment	Harum autem facilis architecto eos voluptatem blanditiis.Et laudantium commodi quasi saepe.	2010-12-08 14:36:45.311856	2010-12-08 14:36:45.311856
5	5	dk	Sed laudantium libero molestias recusandae deleniti aut doloremque.Repellendus incidunt aperiam ipsam at eius dignissimos praesentium.	Trip to amazonia - looking for offer	Deleniti molestiae commodi eaque voluptatum qui possimus.Dolore excepturi facere exercitationem quis.	2010-12-08 14:36:45.356982	2010-12-08 14:36:45.356982
6	6	dk	Unde sed veniam voluptate maxime.Sit odit molestiae quaerat iusto.	LCD - Huge amounts	Pariatur sint sit earum et officiis quia est aut.Quibusdam delectus qui culpa consequatur aliquid nobis numquam libero.	2010-12-08 14:36:45.403112	2010-12-08 14:36:45.403112
7	7	dk	Iste unde rerum sapiente reprehenderit veniam.Est corrupti laudantium sequi excepturi atque quo neque.	GPS receivers required	Ipsam consequatur consequatur rerum veritatis dolore.Quia ipsam soluta quis doloribus veritatis.	2010-12-08 14:36:45.450725	2010-12-08 14:36:45.450725
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating) FROM stdin;
1	Big deal on printers	3	Omnis tempora officia voluptas et.Sit sed quo expedita maiores eos.	Error atque dolorum neque pariatur est quisquam nam dignissimos.Reiciendis non asperiores nihil.	2	User::Agent	0	612.0	923.0	1	Prohaska	Baron Schneider	1-716-464-5530 x133	lyla@ernser.ca	6287 Tate Turnpike	2010-12-08 14:36:45.01893	2010-12-08 14:36:45.01893	2010-12-13	Mozelle129181900495979 Cole	1	t	\N	0	0	f	f
2	Drills required	3	Est magnam similique nobis quia officiis repudiandae autem neque.Porro beatae sit non alias impedit quo aut minima.	Ut et ut velit.Voluptatem delectus dolores necessitatibus temporibus.	2	User::Agent	0	571.0	335.0	1	Luettgen	Aida Cruickshank Sr.	442.013.6089	sterling@considine.ca	40772 Koch Ridges	2010-12-08 14:36:45.195845	2010-12-08 14:36:45.195845	2010-12-13	Mozelle129181900495979 Cole	1	t	\N	0	0	f	f
3	Need assistance in selling a car	3	Velit mollitia est voluptates.Ipsum esse quam neque quibusdam suscipit itaque et.	Aspernatur nam omnis qui.Delectus vel aperiam debitis.	2	User::Agent	0	418.0	263.0	1	Watsicahoeger	Xzavier Carter	481.082.7998 x56670	thora@rennerstanton.co.uk	023 Lester Points	2010-12-08 14:36:45.243493	2010-12-08 14:36:45.243493	2010-12-13	Mozelle129181900495979 Cole	1	t	\N	0	0	f	f
4	Ipod shipment	3	Qui cum delectus enim beatae dolor culpa ut tempora.Ut qui non quia.	Harum autem facilis architecto eos voluptatem blanditiis.Et laudantium commodi quasi saepe.	2	User::Agent	0	16.0	883.0	1	Stokes	Lucius Bogisich	130-030-7916 x053	trace_lang@auer.co.uk	849 Crist Summit	2010-12-08 14:36:45.289857	2010-12-08 14:36:45.289857	2010-12-13	Mozelle129181900495979 Cole	1	t	\N	0	0	f	f
5	Trip to amazonia - looking for offer	3	Sed laudantium libero molestias recusandae deleniti aut doloremque.Repellendus incidunt aperiam ipsam at eius dignissimos praesentium.	Deleniti molestiae commodi eaque voluptatum qui possimus.Dolore excepturi facere exercitationem quis.	2	User::Agent	0	855.0	573.0	1	Russeldoyle	Kennedi Aufderhar	1-720-926-8448	unique_murphy@reichel.info	232 Erin Crest	2010-12-08 14:36:45.335305	2010-12-08 14:36:45.335305	2010-12-13	Mozelle129181900495979 Cole	1	t	\N	0	0	f	f
6	LCD - Huge amounts	3	Unde sed veniam voluptate maxime.Sit odit molestiae quaerat iusto.	Pariatur sint sit earum et officiis quia est aut.Quibusdam delectus qui culpa consequatur aliquid nobis numquam libero.	2	User::Agent	0	118.0	703.0	1	Mueller	Luciano Greenfelder	995.488.0897 x033	darren_connelly@luettgenframi.uk	358 Amari Lights	2010-12-08 14:36:45.380858	2010-12-08 14:36:45.380858	2010-12-13	Mozelle129181900495979 Cole	1	t	\N	0	0	f	f
7	GPS receivers required	3	Iste unde rerum sapiente reprehenderit veniam.Est corrupti laudantium sequi excepturi atque quo neque.	Ipsam consequatur consequatur rerum veritatis dolore.Quia ipsam soluta quis doloribus veritatis.	2	User::Agent	0	738.0	657.0	1	Weissnat	Helen Dickens	775-730-9419 x83907	alfreda.von@botsforddouglas.us	19711 Randall Lane	2010-12-08 14:36:45.427667	2010-12-08 14:36:45.427667	2010-12-13	Mozelle129181900495979 Cole	1	t	\N	0	0	f	f
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2010-12-08 14:36:44.413394	2010-12-08 14:36:44.413394
2	default_leads_per_page	--- 5\n	2010-12-08 14:36:44.422787	2010-12-08 14:36:44.422787
3	certification_level_1	--- 10\n	2010-12-08 14:36:44.424944	2010-12-08 14:36:44.424944
4	certification_level_2	--- 20\n	2010-12-08 14:36:44.427008	2010-12-08 14:36:44.427008
5	contact_us_email	--- contact@nbs.fake.com\n	2010-12-08 14:36:44.429144	2010-12-08 14:36:44.429144
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
1	blazejek@gmail.com	dcf92a1755fba8ed37ce024cbe7eb9545f2ed027ac9509d52d57443e1f45928ec63fea50492f93b5992cafbd86140ec28b485a3db2aa70be3000c9fb05e6669b	ZAaFaXpJ1k6_ypMUYiWa	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 14:36:44.85823	2010-12-08 14:36:44.80201	\N	2010-12-08 14:36:44.802234	2010-12-08 14:36:44.858525	1	Dariana	Steuber	725.564.7929 x83211	root	Kassulke Ramp	New June	95067-9914	Derbyshire	1	\N	\N	\N	\N	0	\N	\N	\N	\N	x9KI8XE2GqQc5fY0v4fsWf8egoN5fq6QDFOrABKA4lgWPuBIMfxegO5uKpxUq7	f	\N	0	0	0	0	0
2	agent@nbs.com	e946747f889779159863580d8f7696882c572ad624678bdc0bfd8ba88891b1ad65e5d8d9056ed2efb60157348789594818df5954b5bdbd3c859d2903720ef9be	3ySDJ30a6755TQIhEI70	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 14:36:44.989682	2010-12-08 14:36:44.967437	\N	2010-12-08 14:36:44.967636	2010-12-08 14:36:44.989956	2	Mozelle129181900495979	Cole	1-589-784-3714 x7287	Dr. Pietro Anderson129181900495945	Kayleigh Courts	Naomimouth	84231-8019	County Fermanagh	3	\N	0	\N	\N	0	\N	\N	\N	\N	eoApvJ0iXupuMEDVr6FZrhIcYZj57P74XHYuZqb5K3BjQJQRb03EyrhIE8ivr7	f	\N	0	0	0	0	0
3	admin@nbs.com	7b516ad336ad1a126e3853a6dd4bbcdc09983e027e870affd19e18c7a04bf6d4255b1f851ce0853ecf7937ff6bcb8757e278d43297c4be9c42bc011a64240337	LviF4X7gVSywU5t-gB4x	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 14:36:45.636507	2010-12-08 14:36:45.616491	\N	2010-12-08 14:36:45.616707	2010-12-08 14:36:45.636775	1	Rosella	Wunsch	895-367-0452	Mrs. Caleb Altenwerth129181900561222	Corkery Estate	Lake Alexzanderport	51786	Somerset	1	\N	\N	\N	\N	0	\N	\N	\N	\N	FbGiNVul0hpcEWRE4ptbsARzoAQuUtGj5ah7B7zFssgzEQg94q7KHVombxlVo6	f	\N	0	0	0	0	0
4	buyer@nbs.com	e75d08804413a8e7260c6e88ace12b68437cef06e9ab0f6e4ce6eef4c6d38badcf3e5f734fccfce64d978b77bbe727b094fa8c5f4618ef2dcac30f66516ebb3b	yKmAZKDIOKU7my-y7wEM	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 14:36:45.68651	2010-12-08 14:36:45.664635	\N	2010-12-08 14:36:45.664854	2010-12-08 14:36:45.686782	48	Jaleel	Sipes	1-215-867-5325 x560	Ophelia Hoppe129181900565998	Walter Station	Willmsborough	93760	Fife	1	\N	\N	\N	\N	0	\N	\N	\N	\N	ZEeQYYuWIkifJpGrxD3a3ICaD8ldfmK3wOrXkUk8B70Uc19DW1psqBHhfqSTKx	f	t	0	0	0	0	0
5	leaduser@nbs.com	b314949c39601aad2c937042ca4e9b036a21bb7bffa6d7ccdaed4231914a990973f16ea8705debb87692f77963975152ad7bbadb998c00cff9d36800f3ae63b1	_k2737AjKIYodiBff3zX	\N	\N	\N	0	\N	\N	\N	\N	\N	2010-12-08 14:36:45.73608	2010-12-08 14:36:45.714278	\N	2010-12-08 14:36:45.714494	2010-12-08 14:36:45.752453	64	Julio	Osinski	(053)091-0243	Lucie Upton129181900570981	Ashlee Creek	Uliseshaven	17614	South Glamorgan	1	\N	\N	4	\N	0	\N	\N	\N	\N	jhJmtpx2UYZc9tEyAiOi3Y23ksptd4iGhkRedQO02YjYPBnrGABD5rGDI3W32Z	f	\N	0	0	0	0	0
\.


--
-- PostgreSQL database dump complete
--

