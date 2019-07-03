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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: flight_airline; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.flight_airline AS ENUM (
    'ryanair',
    'wizzair'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: airports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.airports (
    id bigint NOT NULL,
    icao character varying(4),
    iata character varying(3),
    name character varying,
    city character varying,
    state character varying,
    country character varying,
    elevation integer,
    lat numeric(10,6),
    lng numeric(10,6),
    tz character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: airports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.airports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: airports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.airports_id_seq OWNED BY public.airports.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: flights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flights (
    id bigint NOT NULL,
    from_airport_id bigint,
    to_airport_id bigint,
    start_date timestamp without time zone,
    duration integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    airline public.flight_airline
);


--
-- Name: flights_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.flights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.flights_id_seq OWNED BY public.flights.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: trip_fares; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trip_fares (
    id bigint NOT NULL,
    trip_id bigint,
    price integer,
    currency character varying(3),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: trip_fares_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trip_fares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trip_fares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trip_fares_id_seq OWNED BY public.trip_fares.id;


--
-- Name: trip_follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trip_follows (
    id bigint NOT NULL,
    trip_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: trip_follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trip_follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trip_follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trip_follows_id_seq OWNED BY public.trip_follows.id;


--
-- Name: trips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trips (
    id bigint NOT NULL,
    flight_id bigint,
    seats integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: trips_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trips_id_seq OWNED BY public.trips.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    username character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: airports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.airports ALTER COLUMN id SET DEFAULT nextval('public.airports_id_seq'::regclass);


--
-- Name: flights id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights ALTER COLUMN id SET DEFAULT nextval('public.flights_id_seq'::regclass);


--
-- Name: trip_fares id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trip_fares ALTER COLUMN id SET DEFAULT nextval('public.trip_fares_id_seq'::regclass);


--
-- Name: trip_follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trip_follows ALTER COLUMN id SET DEFAULT nextval('public.trip_follows_id_seq'::regclass);


--
-- Name: trips id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trips ALTER COLUMN id SET DEFAULT nextval('public.trips_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: airports airports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: trip_fares trip_fares_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trip_fares
    ADD CONSTRAINT trip_fares_pkey PRIMARY KEY (id);


--
-- Name: trip_follows trip_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trip_follows
    ADD CONSTRAINT trip_follows_pkey PRIMARY KEY (id);


--
-- Name: trips trips_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_flights_on_airline; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_flights_on_airline ON public.flights USING btree (airline);


--
-- Name: index_flights_on_from_airport_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_flights_on_from_airport_id ON public.flights USING btree (from_airport_id);


--
-- Name: index_flights_on_to_airport_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_flights_on_to_airport_id ON public.flights USING btree (to_airport_id);


--
-- Name: index_trip_fares_on_trip_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trip_fares_on_trip_id ON public.trip_fares USING btree (trip_id);


--
-- Name: index_trip_follows_on_trip_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trip_follows_on_trip_id ON public.trip_follows USING btree (trip_id);


--
-- Name: index_trip_follows_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trip_follows_on_user_id ON public.trip_follows USING btree (user_id);


--
-- Name: index_trips_on_flight_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trips_on_flight_id ON public.trips USING btree (flight_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: trip_follows fk_rails_005bf1f146; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trip_follows
    ADD CONSTRAINT fk_rails_005bf1f146 FOREIGN KEY (trip_id) REFERENCES public.trips(id);


--
-- Name: trips fk_rails_0f85f9bf5e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT fk_rails_0f85f9bf5e FOREIGN KEY (flight_id) REFERENCES public.flights(id);


--
-- Name: trip_follows fk_rails_932761364a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trip_follows
    ADD CONSTRAINT fk_rails_932761364a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: flights fk_rails_d0f4cd1e78; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT fk_rails_d0f4cd1e78 FOREIGN KEY (to_airport_id) REFERENCES public.airports(id);


--
-- Name: trip_fares fk_rails_d50f28d3d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trip_fares
    ADD CONSTRAINT fk_rails_d50f28d3d9 FOREIGN KEY (trip_id) REFERENCES public.trips(id);


--
-- Name: flights fk_rails_ee2bcf8964; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT fk_rails_ee2bcf8964 FOREIGN KEY (from_airport_id) REFERENCES public.airports(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20190701054137'),
('20190701072925'),
('20190702063237'),
('20190702063700'),
('20190703184618'),
('20190703194636'),
('20190703203129');


