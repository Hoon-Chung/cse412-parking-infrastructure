--
-- PostgreSQL database dump
--

\restrict YGdTeFd4cbRPVX3PT3Hv34thSmOAr4A8t8ODf2TRy9WvSnreSdTMdkBa60NNMXg

-- Dumped from database version 13.23
-- Dumped by pg_dump version 13.23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: census_block_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.census_block_group (
    census_block_group_id character(4) NOT NULL,
    county_fips_code character(5) NOT NULL,
    total_on_street_parking integer,
    total_off_street_parking integer,
    total_all_types_parking integer
);


ALTER TABLE public.census_block_group OWNER TO postgres;

--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    fips_code character varying(10) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: county; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.county (
    fips_code character(5) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.county OWNER TO postgres;

--
-- Name: parcel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parcel (
    apn character varying(20) NOT NULL,
    census_block_group_id character(4) NOT NULL,
    county_fips_code character(5) NOT NULL,
    property_use_code character varying(20),
    property_type character varying(100),
    total_square_footage numeric(12,2),
    year_of_construction integer,
    total_estimated_parking_spaces integer,
    longitude_centroid numeric(9,6),
    latitude_centroid numeric(9,6)
);


ALTER TABLE public.parcel OWNER TO postgres;

--
-- Name: parking_meter_block; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parking_meter_block (
    parking_meter_block_id character varying(20) NOT NULL,
    city_fips_code character varying(10) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.parking_meter_block OWNER TO postgres;

--
-- Name: street_parking_meter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.street_parking_meter (
    meter_number character varying(20) NOT NULL,
    street_address character varying(200) NOT NULL,
    city_fips_code character varying(10) NOT NULL,
    type character varying(50),
    rate_time_limit character varying(100),
    active boolean,
    ada_accessible boolean,
    motorcycle_only boolean,
    bike_rack boolean
);


ALTER TABLE public.street_parking_meter OWNER TO postgres;

--
-- Data for Name: census_block_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.census_block_group (census_block_group_id, county_fips_code, total_on_street_parking, total_off_street_parking, total_all_types_parking) FROM stdin;
1001	04013	1200	3400	4600
1002	04013	800	2100	2900
1003	04013	950	2800	3750
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (fips_code, name) FROM stdin;
04-37000	Phoenix
\.


--
-- Data for Name: county; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.county (fips_code, name) FROM stdin;
04013	Maricopa County
\.


--
-- Data for Name: parcel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parcel (apn, census_block_group_id, county_fips_code, property_use_code, property_type, total_square_footage, year_of_construction, total_estimated_parking_spaces, longitude_centroid, latitude_centroid) FROM stdin;
123-45-678	1001	04013	R101	Residential	2500.00	1995	2	-112.074000	33.448400
234-56-789	1001	04013	C201	Commercial	15000.00	2003	45	-112.075000	33.449000
345-67-890	1002	04013	R101	Residential	1800.00	\N	1	-112.080000	33.450000
456-78-901	1002	04013	C201	Commercial	22000.00	2010	80	-112.081000	33.451000
567-89-012	1003	04013	I301	Industrial	50000.00	1988	120	-112.082000	33.452000
\.


--
-- Data for Name: parking_meter_block; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parking_meter_block (parking_meter_block_id, city_fips_code, latitude, longitude) FROM stdin;
PMB001	04-37000	33.448300	-112.073800
PMB002	04-37000	33.449200	-112.074500
PMB003	04-37000	33.450100	-112.075200
\.


--
-- Data for Name: street_parking_meter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.street_parking_meter (meter_number, street_address, city_fips_code, type, rate_time_limit, active, ada_accessible, motorcycle_only, bike_rack) FROM stdin;
M001	100 N 1ST AVE	04-37000	Single	1HR/7AM-6PM	t	t	f	f
M002	200 N CENTRAL AVE	04-37000	Single	2HR/8AM-5PM	t	f	f	f
M003	300 W WASHINGTON	04-37000	Multi	30MIN/9AM-6PM	t	t	f	t
M004	400 E JEFFERSON	04-37000	Single	1HR/7AM-6PM	f	f	t	f
M005	500 N 3RD ST	04-37000	Multi	2HR/8AM-6PM	t	t	f	f
\.


--
-- Name: census_block_group census_block_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.census_block_group
    ADD CONSTRAINT census_block_group_pkey PRIMARY KEY (census_block_group_id, county_fips_code);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (fips_code);


--
-- Name: county county_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.county
    ADD CONSTRAINT county_pkey PRIMARY KEY (fips_code);


--
-- Name: parcel parcel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcel
    ADD CONSTRAINT parcel_pkey PRIMARY KEY (apn, census_block_group_id, county_fips_code);


--
-- Name: parking_meter_block parking_meter_block_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking_meter_block
    ADD CONSTRAINT parking_meter_block_pkey PRIMARY KEY (latitude, longitude);


--
-- Name: street_parking_meter street_parking_meter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.street_parking_meter
    ADD CONSTRAINT street_parking_meter_pkey PRIMARY KEY (meter_number, street_address);


--
-- Name: census_block_group census_block_group_county_fips_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.census_block_group
    ADD CONSTRAINT census_block_group_county_fips_code_fkey FOREIGN KEY (county_fips_code) REFERENCES public.county(fips_code);


--
-- Name: parcel parcel_census_block_group_id_county_fips_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcel
    ADD CONSTRAINT parcel_census_block_group_id_county_fips_code_fkey FOREIGN KEY (census_block_group_id, county_fips_code) REFERENCES public.census_block_group(census_block_group_id, county_fips_code);


--
-- Name: parking_meter_block parking_meter_block_city_fips_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking_meter_block
    ADD CONSTRAINT parking_meter_block_city_fips_code_fkey FOREIGN KEY (city_fips_code) REFERENCES public.city(fips_code);


--
-- Name: street_parking_meter street_parking_meter_city_fips_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.street_parking_meter
    ADD CONSTRAINT street_parking_meter_city_fips_code_fkey FOREIGN KEY (city_fips_code) REFERENCES public.city(fips_code);


--
-- PostgreSQL database dump complete
--

\unrestrict YGdTeFd4cbRPVX3PT3Hv34thSmOAr4A8t8ODf2TRy9WvSnreSdTMdkBa60NNMXg

