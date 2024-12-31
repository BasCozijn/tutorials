--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100),
    description text,
    center_is_black_hole boolean NOT NULL,
    stars_count bigint
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100),
    planet_id integer,
    distance_to_planet_in_km integer NOT NULL,
    is_rotating boolean DEFAULT true
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    distance_in_millions_of_years numeric(16,6),
    name character varying(100) NOT NULL,
    has_life boolean DEFAULT false
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_society; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_society (
    planet_id integer NOT NULL,
    race character varying(100) NOT NULL,
    has_genders boolean DEFAULT true NOT NULL,
    inhabitants bigint,
    society_key character varying(100) NOT NULL,
    name character varying(100),
    planet_society_id integer NOT NULL
);


ALTER TABLE public.planet_society OWNER TO freecodecamp;

--
-- Name: planet_society_planet_society_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_society_planet_society_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_society_planet_society_id_seq OWNER TO freecodecamp;

--
-- Name: planet_society_planet_society_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_society_planet_society_id_seq OWNED BY public.planet_society.planet_society_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer,
    is_hydrogen_star boolean DEFAULT true
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_society planet_society_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_society ALTER COLUMN planet_society_id SET DEFAULT nextval('public.planet_society_planet_society_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', 'This is where earth is from. We call it home', true, 302342343);
INSERT INTO public.galaxy VALUES (2, 'Gargantia', 'A very big star system. Gravity is ripping you apart.', true, 99642424549833323);
INSERT INTO public.galaxy VALUES (3, 'Andromedia', 'Closest to the milkyway. We are bound to merge with in sometime.', true, 826423);
INSERT INTO public.galaxy VALUES (4, 'Phinwheel Galaxy', 'Crazy like a pinwheel.', true, 2343265726423);
INSERT INTO public.galaxy VALUES (5, 'Whirpool Galaxy', 'Something else', false, 23432230423);
INSERT INTO public.galaxy VALUES (6, 'Hoags Object', 'HOAAAGGG', true, 99999999999999);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 1, 9376, true);
INSERT INTO public.moon VALUES (2, 'Deimos', 1, 23459, true);
INSERT INTO public.moon VALUES (3, 'Io', 2, 421700, true);
INSERT INTO public.moon VALUES (4, 'Europa', 2, 670900, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2, 1070400, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 2, 1882700, true);
INSERT INTO public.moon VALUES (7, 'Mimas', 3, 185520, true);
INSERT INTO public.moon VALUES (8, 'Enceladus', 3, 237948, true);
INSERT INTO public.moon VALUES (9, 'Tethys', 3, 294619, true);
INSERT INTO public.moon VALUES (10, 'Dione', 3, 377396, true);
INSERT INTO public.moon VALUES (11, 'Rhea', 3, 527108, true);
INSERT INTO public.moon VALUES (12, 'Titan', 3, 1221865, true);
INSERT INTO public.moon VALUES (13, 'Hyperion', 3, 1481010, true);
INSERT INTO public.moon VALUES (14, 'Iapetus', 3, 3560820, true);
INSERT INTO public.moon VALUES (15, 'Miranda', 4, 129900, true);
INSERT INTO public.moon VALUES (16, 'Ariel', 4, 191020, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 4, 265970, true);
INSERT INTO public.moon VALUES (18, 'Titania', 4, 435910, true);
INSERT INTO public.moon VALUES (19, 'Oberon', 4, 583520, true);
INSERT INTO public.moon VALUES (20, 'Triton', 5, 354759, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 0.390000, 'Mercury', false);
INSERT INTO public.planet VALUES (2, 1, 0.720000, 'Venus', false);
INSERT INTO public.planet VALUES (3, 1, 1.000000, 'Earth', true);
INSERT INTO public.planet VALUES (4, 1, 1.520000, 'Mars', false);
INSERT INTO public.planet VALUES (5, 1, 5.200000, 'Jupiter', false);
INSERT INTO public.planet VALUES (6, 1, 9.580000, 'Saturn', false);
INSERT INTO public.planet VALUES (8, 2, 0.070000, 'Proxima Centauri c', false);
INSERT INTO public.planet VALUES (10, 4, 0.300000, 'Alpheratz Prime', false);
INSERT INTO public.planet VALUES (11, 4, 0.600000, 'Alpheratz II', false);
INSERT INTO public.planet VALUES (12, 6, 0.150000, 'Groombridge 34 A b', false);
INSERT INTO public.planet VALUES (13, 6, 0.200000, 'Groombridge 34 B c', false);
INSERT INTO public.planet VALUES (7, 2, 0.050000, 'Proxima Centauri b', true);
INSERT INTO public.planet VALUES (9, 2, 0.110000, 'Proxima Centauri d', true);


--
-- Data for Name: planet_society; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_society VALUES (3, 'Human', true, 8000000000, 'earth_human', 'United Earth Federation', 1);
INSERT INTO public.planet_society VALUES (3, 'Atlantean', false, 500000, 'earth_atlantean', 'Atlantis Kingdom', 2);
INSERT INTO public.planet_society VALUES (7, 'Proximian', true, 1500000, 'proxima_b_proximian', 'Proxima Confederation', 3);
INSERT INTO public.planet_society VALUES (9, 'Centauran', false, 2000000, 'proxima_d_centauran', 'Centauran Alliance', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4500, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, true);
INSERT INTO public.star VALUES (3, 'Gliese B', 1, 10, false);
INSERT INTO public.star VALUES (4, 'Alpheratz', 2, 700, true);
INSERT INTO public.star VALUES (5, 'HR 178', 2, NULL, true);
INSERT INTO public.star VALUES (6, 'Groombridge 34', 2, 27540, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_society_planet_society_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_society_planet_society_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_society planet_society_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_society
    ADD CONSTRAINT planet_society_pkey PRIMARY KEY (planet_society_id);


--
-- Name: planet_society planet_society_society_key_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_society
    ADD CONSTRAINT planet_society_society_key_key UNIQUE (society_key);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_society planet_planet_society; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_society
    ADD CONSTRAINT planet_planet_society FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

