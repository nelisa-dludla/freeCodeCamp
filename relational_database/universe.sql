--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    type character varying(30),
    distance_from_earth_in_light_years integer,
    has_black_hole boolean,
    is_active boolean
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
    planet_id integer,
    name character varying(30) NOT NULL,
    diameter_in_km numeric(10,2),
    mass_in_kg numeric(25,2),
    distance_from_planet_in_km integer,
    has_water boolean,
    is_inhabited boolean,
    composition text
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    location character varying(30),
    size_in_arcmin integer,
    is_visible boolean,
    is_emission boolean
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    diameter_in_km numeric(10,2),
    distance_from_star_in_km numeric(25,2),
    orbital_period_in_days integer,
    has_moons boolean,
    is_habitable boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    spectral_type character varying(30),
    luminosity numeric(10,2),
    temperature_in_kelvin integer,
    distance_from_earth_in_light_years integer,
    is_supernova boolean,
    has_planetery_system boolean
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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 13000000, true, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 28000000, true, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 31000000, false, false);
INSERT INTO public.galaxy VALUES (7, 'Unknown', NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Ganymede', 5268.00, 148000000000000000000.00, 1070400, true, false, 'Ice and rock');
INSERT INTO public.moon VALUES (2, 5, 'Titan', 5150.00, 135000000000000000000.00, 1221870, true, false, 'Nitrogen-rich atomsphere, with hydrocarbon lakes and icy surface');
INSERT INTO public.moon VALUES (3, 3, 'Callisto', 4820.00, 108000000000000000000.00, 1883000, false, false, 'Ice and rock');
INSERT INTO public.moon VALUES (4, 3, 'Io', 3643.00, 89300000000000000000.00, 421700, false, false, 'Rock and sulphur');
INSERT INTO public.moon VALUES (5, 3, 'Europa', 3121.00, 48000000000000000000.00, 670900, true, false, 'Ice and rock');
INSERT INTO public.moon VALUES (6, 6, 'Triton', 2706.00, 21400000000000000000.00, 354759, true, false, 'Nitrogen and ice');
INSERT INTO public.moon VALUES (7, 5, 'Enceladus', 504.00, 108000000000000000.00, 238020, true, false, 'Water, ice and silicates');
INSERT INTO public.moon VALUES (8, 5, 'Rhea', 1528.00, 231000000000000000000.00, 527108, false, false, 'Ice and rock');
INSERT INTO public.moon VALUES (9, 8, 'Miranda', 471.00, 659000000000000000.00, 129390, true, false, 'Ice and rock');
INSERT INTO public.moon VALUES (10, 5, 'Dione', 1123.00, 1100000000000000000000.00, 377396, false, false, 'Ice and rock');
INSERT INTO public.moon VALUES (11, 8, 'Ariel', 1157.00, 1270000000000000000000.00, 190900, true, false, 'Ice and rock');
INSERT INTO public.moon VALUES (12, 8, 'Oberon', 1522.00, 3010000000000000000000.00, 583500, false, false, 'Ice and rock');
INSERT INTO public.moon VALUES (13, 8, 'Titania', 1578.00, 3520000000000000000000.00, 436300, false, false, 'Ice and rock');
INSERT INTO public.moon VALUES (14, 11, 'Charon', 1207.00, 1520000000000000000000.00, 19571, false, false, 'Ice and rock');
INSERT INTO public.moon VALUES (15, 2, 'Phobos', 22.00, 108000000000000000.00, 9377, false, false, 'Rocky');
INSERT INTO public.moon VALUES (16, 2, 'Deimos', 12.00, 20000000000000000.00, 23460, false, false, 'Rocky');
INSERT INTO public.moon VALUES (17, 6, 'Nerid', 340.00, 300000000000000000.00, 5513400, false, false, 'Ice and rock');
INSERT INTO public.moon VALUES (18, 5, 'Hyperion', 270.00, 56200000000000000.00, 1481100, false, false, 'Ice and rock');
INSERT INTO public.moon VALUES (19, 5, 'Mimas', 396.00, 375000000000000000.00, 185520, false, false, 'Ice and rock');
INSERT INTO public.moon VALUES (20, 6, 'Proteus', 418.00, 50700000000000000000.00, 117646, false, false, 'Water, ice and silicates');


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion', 'Emission', 'Orion Constellation', 24, true, true);
INSERT INTO public.nebula VALUES (2, 'Eagle', 'Diffuse', 'Serpens Constellation', 15, true, false);
INSERT INTO public.nebula VALUES (3, 'Carina', 'Diffuse', 'Carina Constellation', 260, true, true);
INSERT INTO public.nebula VALUES (4, 'Rosette', 'Emission', 'Monoceros Constellation', 130, true, true);
INSERT INTO public.nebula VALUES (5, 'Horsehead', 'Dark', 'Orion Constellation', 8, false, false);
INSERT INTO public.nebula VALUES (6, 'Ring', 'Planetary', 'Lyra Constellation', 1, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 7, 'Earth', 12742.00, 149600000.00, 365, true, true);
INSERT INTO public.planet VALUES (2, 7, 'Mars', 6779.00, 227900000.00, 687, true, false);
INSERT INTO public.planet VALUES (3, 7, 'Jupiter', 139820.00, 778500000.00, 12, true, false);
INSERT INTO public.planet VALUES (4, 7, 'Venus', 12104.00, 108200000.00, 225, false, false);
INSERT INTO public.planet VALUES (5, 7, 'Saturn', 116460.00, 1400000000.00, 30, true, false);
INSERT INTO public.planet VALUES (6, 7, 'Neptune', 49530.00, 4500000000.00, 165, true, false);
INSERT INTO public.planet VALUES (7, 8, 'Kepler-186f', 11000.00, 52500000.00, 130, NULL, true);
INSERT INTO public.planet VALUES (8, 7, 'Uranus', 51120.00, 2900000000.00, 30660, true, false);
INSERT INTO public.planet VALUES (9, 7, 'Mercury', 4879.00, 57900000.00, 88, false, false);
INSERT INTO public.planet VALUES (10, 9, 'Kepler-22b', 24600.00, 210000000.00, 289, NULL, true);
INSERT INTO public.planet VALUES (11, 7, 'Pluto', 2377.00, 5900000000.00, 248, true, false);
INSERT INTO public.planet VALUES (12, 10, 'Kepler-452b', 17800.00, 225000000.00, 385, NULL, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sirius', 'A1V', 25.40, 9940, 9, false, true);
INSERT INTO public.star VALUES (2, 1, 'Alpha Centauri A', 'G2V', 1.52, 5770, 4, false, true);
INSERT INTO public.star VALUES (3, 1, 'Proxima Centauri', 'M5Ve', 0.00, 2800, 4, false, true);
INSERT INTO public.star VALUES (4, 1, 'Betelgeuse', 'M1-2la-lab', 90000.00, 3500, 643, false, false);
INSERT INTO public.star VALUES (5, 1, 'Vega', 'A0V', 37.00, 9600, 25, false, false);
INSERT INTO public.star VALUES (6, 1, 'Antares', 'M1.5lab-lb', 65000.00, 3600, 550, false, false);
INSERT INTO public.star VALUES (7, 1, 'Sun', 'G2V', 1.00, 5773, 0, false, true);
INSERT INTO public.star VALUES (8, 1, 'Kepler-186', 'M-type dwarf', NULL, NULL, 561, NULL, true);
INSERT INTO public.star VALUES (9, 1, 'Kepler-22', 'G-Type star', NULL, NULL, 620, NULL, true);
INSERT INTO public.star VALUES (10, 1, 'Kepler-452', 'G-Type star', NULL, NULL, 1402, NULL, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: nebula nebula_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_unique_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
