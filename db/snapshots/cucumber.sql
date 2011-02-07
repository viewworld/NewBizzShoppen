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
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('addresses_id_seq', 1307, true);


--
-- Name: article_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('article_translations_id_seq', 97, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 87, true);


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('assets_id_seq', 5, true);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('bank_accounts_id_seq', 20, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('categories_id_seq', 861, true);


--
-- Name: category_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_interests_id_seq', 6, true);


--
-- Name: category_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_translations_id_seq', 864, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('countries_id_seq', 2, true);


--
-- Name: country_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_interests_id_seq', 2, true);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('currencies_id_seq', 650, true);


--
-- Name: email_template_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_template_translations_id_seq', 18, true);


--
-- Name: email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_templates_id_seq', 9, true);


--
-- Name: invoice_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('invoice_lines_id_seq', 44, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('invoices_id_seq', 55, true);


--
-- Name: lead_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_purchases_id_seq', 300, true);


--
-- Name: lead_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lead_translations_id_seq', 662, true);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('leads_id_seq', 661, true);


--
-- Name: payment_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('payment_notifications_id_seq', 16, true);


--
-- Name: payment_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('payment_transactions_id_seq', 30, true);


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

SELECT pg_catalog.setval('users_id_seq', 1549, true);


--
-- Name: vat_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vat_rates_id_seq', 4, true);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY addresses (id, street, city, zip_code, county, country_id, addressable_type, addressable_id, created_at, updated_at) FROM stdin;
1	Chandler Forge	Dallasland	10933-4027	Oxfordshire	1	BankAccount	1	2011-02-04 11:20:31.217003	2011-02-04 11:20:31.242013
2	Madeline Wells	West Fredy	22617-5027	Cornwall	1	User::Admin	1	2011-02-04 11:20:31.711981	2011-02-04 11:20:31.813342
3	Emmanuelle Haven	Sarahhaven	01241	Dyfed	1	User::Agent	2	2011-02-04 11:20:32.096764	2011-02-04 11:20:32.14536
4	Jerad Lake	West Amalia	06058	County Down	1	User::Admin	3	2011-02-04 11:20:32.997154	2011-02-04 11:20:33.038437
5	Sedrick Radial	Eichmannport	48574	Isle of Wight	1	User::Customer	4	2011-02-04 11:20:33.09039	2011-02-04 11:20:33.130813
6	Noemi Lakes	North Verliebury	98957	Mid Glamorgan	1	User::LeadUser	5	2011-02-04 11:20:33.18617	2011-02-04 11:20:33.244415
\.


--
-- Data for Name: article_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article_translations (id, article_id, locale, title, content, created_at, updated_at) FROM stdin;
1	1	dk	About us	About us	2011-02-04 11:20:33.408933	2011-02-04 11:20:33.408933
2	1	en	About us	About us	2011-02-04 11:20:33.438343	2011-02-04 11:20:33.438343
3	2	dk	Privacy	Privacy	2011-02-04 11:20:33.501509	2011-02-04 11:20:33.501509
4	2	en	Privacy	Privacy	2011-02-04 11:20:33.527084	2011-02-04 11:20:33.527084
5	3	dk	Terms & Conditions	Terms & Conditions	2011-02-04 11:20:33.577854	2011-02-04 11:20:33.577854
6	3	en	Terms & Conditions	Terms & Conditions	2011-02-04 11:20:33.597873	2011-02-04 11:20:33.597873
7	4	dk	Blurb sign up	Blurb sign up	2011-02-04 11:20:33.645707	2011-02-04 11:20:33.645707
8	4	en	Blurb sign up	Blurb sign up	2011-02-04 11:20:33.666549	2011-02-04 11:20:33.666549
9	5	dk	Blurb buyer home	Blurb buyer home	2011-02-04 11:20:33.714111	2011-02-04 11:20:33.714111
10	5	en	Blurb buyer home	Blurb buyer home	2011-02-04 11:20:33.732612	2011-02-04 11:20:33.732612
11	6	dk	Blurb agent home	Blurb agent home	2011-02-04 11:20:33.777814	2011-02-04 11:20:33.777814
12	6	en	Blurb agent home	Blurb agent home	2011-02-04 11:20:33.795471	2011-02-04 11:20:33.795471
13	7	dk	Blurb purchase manager home	Blurb purchase manager home	2011-02-04 11:20:33.84755	2011-02-04 11:20:33.84755
14	7	en	Blurb purchase manager home	Blurb purchase manager home	2011-02-04 11:20:33.866336	2011-02-04 11:20:33.866336
15	8	dk	Blurb start page role selection	Blurb start page role selection	2011-02-04 11:20:33.91628	2011-02-04 11:20:33.91628
16	8	en	Blurb start page role selection	Blurb start page role selection	2011-02-04 11:20:33.938988	2011-02-04 11:20:33.938988
17	9	dk	Blurb currencies	Blurb currencies	2011-02-04 11:20:33.988301	2011-02-04 11:20:33.988301
18	9	en	Blurb currencies	Blurb currencies	2011-02-04 11:20:34.005629	2011-02-04 11:20:34.005629
19	10	dk	Reset password	Reset password	2011-02-04 11:20:34.05078	2011-02-04 11:20:34.05078
20	10	en	Reset password	Reset password	2011-02-04 11:20:34.071058	2011-02-04 11:20:34.071058
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, type, created_at, updated_at, key, scope, published, published_date) FROM stdin;
1	Article::Cms	2011-02-04 11:20:33.395261	2011-02-04 11:20:33.446039	about_us	0	t	2011-02-04 11:20:33.445875
2	Article::Cms	2011-02-04 11:20:33.493031	2011-02-04 11:20:33.532642	privacy	0	t	2011-02-04 11:20:33.532536
3	Article::Cms	2011-02-04 11:20:33.572301	2011-02-04 11:20:33.603535	terms_conditions	0	t	2011-02-04 11:20:33.603435
4	Article::Cms	2011-02-04 11:20:33.640317	2011-02-04 11:20:33.673047	blurb_sign_up	1	t	2011-02-04 11:20:33.672933
5	Article::Cms	2011-02-04 11:20:33.707916	2011-02-04 11:20:33.740314	blurb_buyer_home	1	t	2011-02-04 11:20:33.74021
6	Article::Cms	2011-02-04 11:20:33.771972	2011-02-04 11:20:33.802186	blurb_agent_home	1	t	2011-02-04 11:20:33.802072
7	Article::Cms	2011-02-04 11:20:33.842119	2011-02-04 11:20:33.873058	blurb_purchase_manager_home	1	t	2011-02-04 11:20:33.872912
8	Article::Cms	2011-02-04 11:20:33.910862	2011-02-04 11:20:33.945827	blurb_start_page_role_selection	1	t	2011-02-04 11:20:33.945711
9	Article::Cms	2011-02-04 11:20:33.981964	2011-02-04 11:20:34.012128	blurb_currencies	1	t	2011-02-04 11:20:34.012026
10	Article::Cms	2011-02-04 11:20:34.045462	2011-02-04 11:20:34.076793	reset_password	2	t	2011-02-04 11:20:34.076693
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assets (id, asset_file_name, asset_content_type, asset_file_size, asset_type, asset_updated_at, resource_type, resource_id, type, guid, locale, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY bank_accounts (id, bank_name, iban_no, local_bank_number, swift, payment_conditions, country_default, created_at, updated_at, global_default) FROM stdin;
1	Default Bank	DK00 0000 0000 0000 00	0	DKDKDK	\N	t	2011-02-04 11:20:31.237498	2011-02-04 11:20:31.237498	t
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, name, description, created_at, updated_at, parent_id, lft, rgt, depth, total_leads_count, cached_slug, is_locked, published_leads_count) FROM stdin;
1	Electronics	Aspernatur est aut est voluptatum consequatur saepe illo.Necessitatibus cum neque et nisi asperiores aut.	2011-02-04 11:20:31.887655	2011-02-04 11:20:31.887655	\N	1	2	\N	0	1-electronics	f	0
2	Leisure	Quidem sed cumque suscipit repellat.Iure aperiam voluptatum rerum libero praesentium.	2011-02-04 11:20:31.964784	2011-02-04 11:20:31.964784	\N	3	4	\N	0	2-leisure	f	0
3	Business	Qui ut reprehenderit suscipit nihil itaque nobis.Fugiat ea nam est adipisci blanditiis.	2011-02-04 11:20:32.019213	2011-02-04 11:20:32.908087	\N	5	6	\N	7	3-business	f	7
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
1	1	en	Aspernatur est aut est voluptatum consequatur saepe illo.Necessitatibus cum neque et nisi asperiores aut.	Electronics	2011-02-04 11:20:31.901319	2011-02-04 11:20:31.901319
2	1	dk	\N	Electronics	2011-02-04 11:20:31.943757	2011-02-04 11:20:31.943757
3	2	en	Quidem sed cumque suscipit repellat.Iure aperiam voluptatum rerum libero praesentium.	Leisure	2011-02-04 11:20:31.970731	2011-02-04 11:20:31.970731
4	2	dk	\N	Leisure	2011-02-04 11:20:32.004139	2011-02-04 11:20:32.004139
5	3	en	Qui ut reprehenderit suscipit nihil itaque nobis.Fugiat ea nam est adipisci blanditiis.	Business	2011-02-04 11:20:32.025678	2011-02-04 11:20:32.025678
6	3	dk	\N	Business	2011-02-04 11:20:32.053367	2011-02-04 11:20:32.053367
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	Denmark	2011-02-04 11:20:31.185337	2011-02-04 11:20:31.185337
2	United Kingdom	2011-02-04 11:20:31.195078	2011-02-04 11:20:31.195078
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
1	Euro	&euro;	%u%n	t	2011-02-04 11:20:31.846183	2011-02-04 11:20:31.846183
2	PLN	&pln;	%u%n	t	2011-02-04 11:20:31.857166	2011-02-04 11:20:31.857166
\.


--
-- Data for Name: email_template_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_template_translations (id, email_template_id, locale, body, subject, created_at, updated_at) FROM stdin;
1	1	en	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	Confirmation instructions	2011-02-04 11:20:31.287569	2011-02-04 11:20:31.287569
2	1	dk	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	[DK] Confirmation instructions	2011-02-04 11:20:31.311335	2011-02-04 11:20:31.311335
3	2	en	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	Reset password instructions	2011-02-04 11:20:31.334149	2011-02-04 11:20:31.334149
4	2	dk	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	[DK] Reset password instructions	2011-02-04 11:20:31.362343	2011-02-04 11:20:31.362343
5	3	en	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	Somebody shared leads with you	2011-02-04 11:20:31.38875	2011-02-04 11:20:31.38875
6	3	dk	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	[DK] Somebody shared leads with you	2011-02-04 11:20:31.407928	2011-02-04 11:20:31.407928
7	4	en	<p>{{lead.id}}</p>	Contact regarding lead	2011-02-04 11:20:31.425982	2011-02-04 11:20:31.425982
8	4	dk	<p>{{lead.id}}</p>	[DK] Contact regarding lead	2011-02-04 11:20:31.444093	2011-02-04 11:20:31.444093
9	5	en	<p>{{lead_purchase.id}}</p>	Lead Purchase is about to expire	2011-02-04 11:20:31.464261	2011-02-04 11:20:31.464261
10	5	dk	<p>{{lead_purchase.id}}</p>	[DK] Lead Purchase is about to expire	2011-02-04 11:20:31.484005	2011-02-04 11:20:31.484005
11	6	en	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	Lead has been rated as unsatisfactory	2011-02-04 11:20:31.503668	2011-02-04 11:20:31.503668
12	6	dk	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	[DK] Lead has been rated as unsatisfactory	2011-02-04 11:20:31.524583	2011-02-04 11:20:31.524583
13	7	en	<p>Lead {{lead.header}} has been updated by agent.</p>	Lead has been updated	2011-02-04 11:20:31.546447	2011-02-04 11:20:31.546447
14	7	dk	<p>Lead {{lead.header}} has been updated by agent.</p>	[DK] Lead has been updated	2011-02-04 11:20:31.574618	2011-02-04 11:20:31.574618
15	8	en	<p></p>	Question	2011-02-04 11:20:31.59269	2011-02-04 11:20:31.59269
16	8	dk	<p></p>	[DK] Question	2011-02-04 11:20:31.610764	2011-02-04 11:20:31.610764
17	9	en	<p></p>	Invoice	2011-02-04 11:20:31.637183	2011-02-04 11:20:31.637183
18	9	dk	<p></p>	[DK] Invoice	2011-02-04 11:20:31.65911	2011-02-04 11:20:31.65911
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email_templates (id, name, subject, "from", bcc, cc, body, template, uniq_id, persist, created_at, updated_at) FROM stdin;
1	confirmation instructions	[DK] Confirmation instructions	noreply@newbizzshoppen.com	\N	\N	<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href="{{user.confirmation_instructions_url}}">Confirm my account</a></p>	\N	confirmation_instructions	t	2011-02-04 11:20:31.274441	2011-02-04 11:20:31.306056
2	reset_password_instructions	[DK] Reset password instructions	noreply@newbizzshoppen.com	\N	\N	<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href="{{ user.reset_password_instructions_url }}">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>	\N	reset_password_instructions	t	2011-02-04 11:20:31.325962	2011-02-04 11:20:31.35306
3	Share leads by email message	[DK] Somebody shared leads with you	noreply@newbizzshoppen.com	\N	\N	{% for lead in leads %}\n<p>{{lead.header}}<br />\n{{lead.description}}<br /></p>\n{% endfor %}	\N	share_leads_by_email_message	t	2011-02-04 11:20:31.382459	2011-02-04 11:20:31.402347
4	Contact Lead by email message	[DK] Contact regarding lead	noreply@newbizzshoppen.com	\N	\N	<p>{{lead.id}}</p>	\N	contact_lead_by_email_message	t	2011-02-04 11:20:31.420104	2011-02-04 11:20:31.438891
5	Lead Purchase is about to expire	[DK] Lead Purchase is about to expire	noreply@newbizzshoppen.com	\N	\N	<p>{{lead_purchase.id}}</p>	\N	lead_purchase_is_about_to_expire	t	2011-02-04 11:20:31.457838	2011-02-04 11:20:31.478029
6	Lead rated as unsatisfactory	[DK] Lead has been rated as unsatisfactory	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>	\N	lead_rated_as_unsatisfactory	t	2011-02-04 11:20:31.498115	2011-02-04 11:20:31.517558
7	Notify buyers about lead update	[DK] Lead has been updated	noreply@newbizzshoppen.com	\N	\N	<p>Lead {{lead.header}} has been updated by agent.</p>	\N	notify_buyers_about_lead_update	t	2011-02-04 11:20:31.539843	2011-02-04 11:20:31.566965
8	Contact us	[DK] Question	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	contact_us	t	2011-02-04 11:20:31.587314	2011-02-04 11:20:31.605047
9	Invoice	[DK] Invoice	noreply@newbizzshoppen.com	\N	\N	<p></p>	\N	invoice	t	2011-02-04 11:20:31.628837	2011-02-04 11:20:31.652496
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoice_lines (id, number, name, quantity, vat_rate, netto_price, netto_value, brutto_value, vat_value, payable_id, payable_type, invoice_id, revenue_frozen, created_at, paid_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY invoices (id, number, paid_at, emailed_at, currency_id, user_id, seller_name, seller_address, seller_vat_no, seller_first_name, seller_last_name, customer_name, customer_address, customer_vat_no, cash_flow, creation_place, creation_date, sale_date, payment_deadline_date, payment_account_information, payment_method, vat_paid_in_customer_country, english_version, total_in_words, revenue_frozen, invoices, vat_text_in_customer_country, created_at, updated_at, ean_number, details, bank_account_id) FROM stdin;
\.


--
-- Data for Name: lead_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_purchases (id, lead_id, owner_id, assignee_id, paid, created_at, updated_at, requested_by, state, expiration_status, response_deadline, contacted, assigned_at, rating_level, rating_reason, accessible_from) FROM stdin;
\.


--
-- Data for Name: lead_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lead_translations (id, lead_id, locale, header, hidden_description, description, created_at, updated_at) FROM stdin;
1	1	dk	Big deal on printers	Alias molestiae praesentium consequatur.Ad quidem dolor excepturi fugiat nesciunt iure.	Consequatur quisquam sed id.Excepturi aut quam doloribus aliquid.	2011-02-04 11:20:32.289803	2011-02-04 11:20:32.289803
2	2	dk	Drills required	Est facere voluptates non accusantium earum nisi.Labore quas tenetur iusto minima aspernatur tempore dolores.	Doloremque fugiat excepturi aliquam ea.Inventore nostrum in velit quibusdam deserunt eos.	2011-02-04 11:20:32.398992	2011-02-04 11:20:32.398992
3	3	dk	Need assistance in selling a car	Nihil delectus autem ea minus quia quod.A quibusdam et esse.	Quaerat magni omnis odit quod in et nihil.Consequatur deleniti aliquid iusto necessitatibus.	2011-02-04 11:20:32.503209	2011-02-04 11:20:32.503209
4	4	dk	Ipod shipment	Autem porro earum quasi.Sunt id quis magni.	Veniam aut est quibusdam aut adipisci.Necessitatibus fuga odio nulla eaque et nisi nemo.	2011-02-04 11:20:32.615319	2011-02-04 11:20:32.615319
5	5	dk	Trip to amazonia - looking for offer	Sit enim aut eaque dolorem facilis sunt voluptatem velit.Nisi sunt omnis quisquam eaque.	Sed odio ipsum eos tempore porro accusantium aliquid.Totam nostrum voluptates molestiae.	2011-02-04 11:20:32.714884	2011-02-04 11:20:32.714884
6	6	dk	LCD - Huge amounts	Quo consequatur non adipisci.Eos porro et quasi amet fugiat numquam culpa.	Illo inventore at eligendi distinctio.Corporis nihil perferendis debitis aspernatur.	2011-02-04 11:20:32.818602	2011-02-04 11:20:32.818602
7	7	dk	GPS receivers required	Itaque nihil modi ipsum quae iusto iure facere.Vel illo itaque eos laboriosam eius velit veritatis.	Officia distinctio impedit est corrupti consectetur repellendus tempora.Iusto dolorum dolor tempora quaerat vitae qui.	2011-02-04 11:20:32.918269	2011-02-04 11:20:32.918269
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY leads (id, header, category_id, description, hidden_description, creator_id, creator_type, clicks_count, purchase_value, price, country_id, company_name, contact_name, phone_number, email_address, created_at, updated_at, purchase_decision_date, creator_name, sale_limit, published, www_address, lead_purchases_counter, exposures_count, featured, has_unsatisfactory_rating, average_rating, currency_id, published_at, linkedin_url, facebook_url, address_line_1, address_line_2, address_line_3, city, zip_code, county) FROM stdin;
1	Big deal on printers	3	Consequatur quisquam sed id.Excepturi aut quam doloribus aliquid.	Alias molestiae praesentium consequatur.Ad quidem dolor excepturi fugiat nesciunt iure.	2	User::Agent	0	958.0	14.0	1	Kiehn	Lauriane Koepp	359.568.0655 x2927	carmella@huel.info	2011-02-04 11:20:32.226238	2011-02-04 11:20:32.226238	2011-02-09	Providenci129681843209306 Kemmer	1	t	\N	0	0	f	f	-1	1	2011-02-04 11:20:32.240826	\N	\N	81258 O'Conner Light	\N	\N	Nickolasmouth	64782-6491	South Yorkshire
2	Drills required	3	Doloremque fugiat excepturi aliquam ea.Inventore nostrum in velit quibusdam deserunt eos.	Est facere voluptates non accusantium earum nisi.Labore quas tenetur iusto minima aspernatur tempore dolores.	2	User::Agent	0	129.0	208.0	1	Hodkiewiczbahringer	Courtney Walsh	399.356.5707	camila@leffler.biz	2011-02-04 11:20:32.34393	2011-02-04 11:20:32.34393	2011-02-09	Providenci129681843209306 Kemmer	1	t	\N	0	0	f	f	-1	1	2011-02-04 11:20:32.352696	\N	\N	79753 Jamar Prairie	\N	\N	Grahamstad	46325-8716	Nottinghamshire
3	Need assistance in selling a car	3	Quaerat magni omnis odit quod in et nihil.Consequatur deleniti aliquid iusto necessitatibus.	Nihil delectus autem ea minus quia quod.A quibusdam et esse.	2	User::Agent	0	60.0	287.0	1	Ziemegoyette	Trycia Doyle	504.456.6340	noemi@stark.co.uk	2011-02-04 11:20:32.453685	2011-02-04 11:20:32.453685	2011-02-09	Providenci129681843209306 Kemmer	1	t	\N	0	0	f	f	-1	1	2011-02-04 11:20:32.461823	\N	\N	5864 Tierra Mountain	\N	\N	South Freidamouth	25155-0524	Worcestershire
4	Ipod shipment	3	Veniam aut est quibusdam aut adipisci.Necessitatibus fuga odio nulla eaque et nisi nemo.	Autem porro earum quasi.Sunt id quis magni.	2	User::Agent	0	834.0	959.0	1	Hodkiewiczfisher	Marian Quigley	1-556-094-0893 x45764	roy.koepp@stammsimonis.com	2011-02-04 11:20:32.571623	2011-02-04 11:20:32.571623	2011-02-09	Providenci129681843209306 Kemmer	1	t	\N	0	0	f	f	-1	1	2011-02-04 11:20:32.580464	\N	\N	8605 Pfannerstill Glens	\N	\N	Port Myrlmouth	47431-2267	South Glamorgan
5	Trip to amazonia - looking for offer	3	Sed odio ipsum eos tempore porro accusantium aliquid.Totam nostrum voluptates molestiae.	Sit enim aut eaque dolorem facilis sunt voluptatem velit.Nisi sunt omnis quisquam eaque.	2	User::Agent	0	420.0	197.0	1	Cartercassin	Marques Rempel	014.435.3434 x41360	kassandra_daniel@reichert.uk	2011-02-04 11:20:32.666593	2011-02-04 11:20:32.666593	2011-02-09	Providenci129681843209306 Kemmer	1	t	\N	0	0	f	f	-1	1	2011-02-04 11:20:32.674766	\N	\N	7715 Hansen Meadow	\N	\N	Lake Lexie	89280	West Midlands
6	LCD - Huge amounts	3	Illo inventore at eligendi distinctio.Corporis nihil perferendis debitis aspernatur.	Quo consequatur non adipisci.Eos porro et quasi amet fugiat numquam culpa.	2	User::Agent	0	799.0	741.0	1	Kulas	Judson Veum	1-700-734-4819	kitty@wisoky.info	2011-02-04 11:20:32.76958	2011-02-04 11:20:32.76958	2011-02-09	Providenci129681843209306 Kemmer	1	t	\N	0	0	f	f	-1	1	2011-02-04 11:20:32.778112	\N	\N	4608 Grant Coves	\N	\N	Vitoberg	65273	Cumbria
7	GPS receivers required	3	Officia distinctio impedit est corrupti consectetur repellendus tempora.Iusto dolorum dolor tempora quaerat vitae qui.	Itaque nihil modi ipsum quae iusto iure facere.Vel illo itaque eos laboriosam eius velit veritatis.	2	User::Agent	0	264.0	100.0	1	Blick	Hilma Mohr	(908)853-2362 x85401	kaleb.hessel@reinger.com	2011-02-04 11:20:32.871447	2011-02-04 11:20:32.871447	2011-02-09	Providenci129681843209306 Kemmer	1	t	\N	0	0	f	f	-1	1	2011-02-04 11:20:32.882301	\N	\N	5570 Gulgowski Causeway	\N	\N	Port Karianeburgh	10460	Greater Manchester
\.


--
-- Data for Name: payment_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY payment_notifications (id, params, buyer_id, status, transaction_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: payment_transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY payment_transactions (id, invoice_id, payment_notification_id, type, paid_at, amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY settings (id, var, value, created_at, updated_at) FROM stdin;
1	default_payout_delay	--- 0\n	2011-02-04 11:20:31.097211	2011-02-04 11:20:31.097211
2	default_leads_per_page	--- 5\n	2011-02-04 11:20:31.106901	2011-02-04 11:20:31.106901
3	certification_level_1	--- 10\n	2011-02-04 11:20:31.115524	2011-02-04 11:20:31.115524
4	certification_level_2	--- 20\n	2011-02-04 11:20:31.122738	2011-02-04 11:20:31.122738
5	contact_us_email	--- contact@nbs.fake.com\n	2011-02-04 11:20:31.128049	2011-02-04 11:20:31.128049
6	invoicing_default_payment_deadline_date	--- 14\n	2011-02-04 11:20:31.134427	2011-02-04 11:20:31.134427
7	invoicing_seller_name	--- Fairleads\n	2011-02-04 11:20:31.141844	2011-02-04 11:20:31.141844
8	invoicing_seller_address	--- |-\nStreeet\nPost Code City\nCounty\nCountry\n	2011-02-04 11:20:31.150159	2011-02-04 11:20:31.150159
9	invoicing_seller_vat_number	--- 123-456-789\n	2011-02-04 11:20:31.156942	2011-02-04 11:20:31.156942
10	invoicing_default_vat_rate	--- 0.15\n	2011-02-04 11:20:31.165264	2011-02-04 11:20:31.165264
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

COPY users (id, email, encrypted_password, password_salt, reset_password_token, remember_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, locked_at, created_at, updated_at, roles_mask, first_name, last_name, phone, screen_name, newsletter_on, payout, parent_id, age, subaccounts_counter, mobile_phone, department, deal_value_range_start, deal_value_range_end, rss_token, notify_about_new_leads, big_buyer, completed_leads_counter, leads_requested_counter, leads_assigned_month_ago_counter, leads_assigned_year_ago_counter, total_leads_assigned_counter, paypal_email, bank_swift_number, bank_iban_number, can_edit_payout_information, leads_created_counter, leads_volume_sold_counter, leads_revenue_counter, leads_purchased_month_ago_counter, leads_purchased_year_ago_counter, leads_rated_good_counter, leads_rated_bad_counter, leads_not_rated_counter, leads_rating_avg, certification_level, team_buyers, vat_number, not_charge_vat, bank_account_id) FROM stdin;
1	blazejek@gmail.com	93973a6443be50885a9cae98234e9c012329c5a28d5b2e0a7bbddc547f892883a191b5cdc6285fdfe8d8ef783d6d8cc2d6271202db0e22ccd6856c35feb030f9	Y6I5X5Racth8n-3N4DPf	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-04 11:20:31.820854	2011-02-04 11:20:31.731024	\N	2011-02-04 11:20:31.733325	2011-02-04 11:20:31.821286	1	Cristopher	Metz	1-830-547-3407 x930	root	\N	\N	\N	\N	0	\N	\N	\N	\N	xKF8t2BilrqEzNRDVPyhDSB5QGF4mPpq0kyKxajIz6dh8UgBh6RPn8WrUQ56CQ	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
2	agent@nbs.com	a3b10de64f37b3aefa4f2d664a59912c1306bedf67705f3b4a0e59b89a7dd642487f35cea7a584d5f6ab11c6410c413a279bba04c1e390f296c656d50ac038c6	482blDQuzCeTzwF3FUhl	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-04 11:20:32.152136	2011-02-04 11:20:32.109599	\N	2011-02-04 11:20:32.110792	2011-02-04 11:20:32.153515	2	Providenci129681843209306	Kemmer	(990)100-9905 x52516	Quincy Lesch129681843209287	\N	0	\N	\N	0	\N	\N	\N	\N	IOgjp4vzYXTdCRuJiytEZ76SAXydRndpCA9BuFZYkK1ebZv7n9t0RiiQCL0PMV	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
3	admin@nbs.com	659f7db2437a2e132e347d4302ee538d367215f18a097d413bacf67accd3f72e326c53a148eb150fa318563986af57056c07ab775eaeb93c730e256bae060a45	IGFExWeLV9erATP-4iwv	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-04 11:20:33.045132	2011-02-04 11:20:33.012124	\N	2011-02-04 11:20:33.013636	2011-02-04 11:20:33.045639	1	Joesph	Welch	1-190-534-6992	Ewald Altenwerth129681843299408	\N	\N	\N	\N	0	\N	\N	\N	\N	dBzhHKbytIyavKalPxka0EVig68vwDOoOh9ECgiGqEHf0IxLv2KpYFhiJ537qv	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
4	buyer@nbs.com	01a25e3299cfca93fe2e619e8663ff7af5a2b1ed10874d25e92e3eca82f8da2556539371856b3616e5cfe7d4b3c57952b2d0d246661d45d737c4ad511dc0dbf3	L3SZA_GC1pJaIbsvLR0j	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-04 11:20:33.138175	2011-02-04 11:20:33.105715	\N	2011-02-04 11:20:33.107025	2011-02-04 11:20:33.138612	48	Mack	Romaguera	353.453.3942 x012	Caroline O'Connell129681843308712	\N	\N	\N	\N	0	\N	\N	\N	\N	zH3bqmB1U8AVmaop0Uzobqn9py6cYVajZN0mx4wboRKFyluSK1UQuqFoUBMiP8	f	t	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
5	leaduser@nbs.com	e0505510ab9286f95818c3c8992e7ec797af92e98264ed5fcdbd0b4699113c56293988033d009de8b3e73adb7db330f1715423614d578a2abfb0f1fca7ca23b7	PAEHRQrV7wdnSe3hFgiA	\N	\N	\N	0	\N	\N	\N	\N	\N	2011-02-04 11:20:33.251693	2011-02-04 11:20:33.200714	\N	2011-02-04 11:20:33.202728	2011-02-04 11:20:33.282502	64	Bettye	Bergstrom	1-157-410-3952 x3578	Margret Towne129681843318218	\N	\N	4	\N	0	\N	\N	\N	\N	sjGxRd9EEHBtWM0P9c2aAGQgy0WzyJlUWqbefoC2cQ17oHgUJJBE3UYxHtzFnL	f	\N	0	0	0	0	0	\N	\N	\N	f	0	0	0	0	0	0	0	0	0	0	f	\N	f	1
\.


--
-- Data for Name: vat_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vat_rates (id, country_id, rate, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

