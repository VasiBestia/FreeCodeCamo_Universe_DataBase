--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    comets_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_years integer,
    galaxy_id integer
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comets_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comets_id_seq OWNED BY public.comets.comets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_milions_of_years integer,
    distance_from_earth_years_of_light integer,
    distance_from_sun_years_of_light numeric(11,1),
    description text NOT NULL,
    has_life boolean,
    has_black_holes boolean
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
    name character varying(30) NOT NULL,
    age_years integer,
    distance_from_earth integer,
    distance_from_sun numeric(11,1),
    description text NOT NULL,
    has_life boolean,
    has_gravity boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_milions_of_years integer,
    distance_from_sun_years_of_light numeric(11,1),
    description text NOT NULL,
    has_life boolean,
    has_gravity boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    age_in_milions_of_years integer,
    distance_from_earth integer,
    distance_from_sun_years_of_light numeric(4,1),
    description text NOT NULL,
    has_life boolean,
    has_gravity boolean,
    galaxy_id integer
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
-- Name: comets comets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets ALTER COLUMN comets_id SET DEFAULT nextval('public.comets_comets_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES (1, 'Halley', 'A short-period comet visible from Earth every 75–79 years.', 45000, 1);
INSERT INTO public.comets VALUES (2, 'Hale-Bopp', 'One of the most widely observed comets of the 20th century.', 40000, 1);
INSERT INTO public.comets VALUES (3, 'Encke', 'A periodic comet that completes an orbit every 3.3 years.', 35000, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, 0.0, 'The galaxy containing our solar system.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537000, 25370.0, 'The nearest major galaxy to the Milky Way.', false, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 13250, 29000000, 290000.0, 'A galaxy with a bright nucleus and a large central bulge.', false, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 12000, 2730000, 2730000.0, 'A spiral galaxy in the constellation Triangulum.', false, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 4000, 23000000, 23000000.0, 'An interacting grand-design spiral galaxy.', false, true);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 13000, 17000000, 17000000.0, 'Known for its spectacular dark band of absorbing dust.', false, true);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel', 13000, 20900000, 20900000.0, 'A spiral galaxy twice the size of the Milky Way.', false, true);
INSERT INTO public.galaxy VALUES (8, 'Cigar Galaxy', 13000, 11500000, 11500000.0, 'A starburst galaxy in the constellation Ursa Major.', false, true);
INSERT INTO public.galaxy VALUES (9, 'Large Magellanic Cloud', 13000, 158000, 158000.0, 'A satellite galaxy of the Milky Way.', false, false);
INSERT INTO public.galaxy VALUES (10, 'Small Magellanic Cloud', 13000, 200000, 200000.0, 'One of the nearest neighbors of the Milky Way.', false, false);
INSERT INTO public.galaxy VALUES (11, 'Hoags Object', 10000, 600000000, 600000000.0, 'A rare ring-shaped non-typical galaxy.', false, true);
INSERT INTO public.galaxy VALUES (12, 'Centaurus A', 13200, 11000000, 11000000.0, 'Known for its prominent dust lane and giant jets.', false, true);
INSERT INTO public.galaxy VALUES (13, 'Sunflower Galaxy', 13000, 27000000, 27000000.0, 'A spiral galaxy with tightly wound arms.', false, true);
INSERT INTO public.galaxy VALUES (14, 'Tadpole Galaxy', 13000, 420000000, 420000000.0, 'Disrupted barred spiral galaxy with a long tail.', false, true);
INSERT INTO public.galaxy VALUES (15, 'Cosmic Horseshoe', 10000, 900000, 900000.0, 'A distant galaxy magnified by gravitational lensing.', false, true);
INSERT INTO public.galaxy VALUES (16, 'Sombrero', 13250, 29000000, 29000000.0, 'A galaxy with a bright nucleus.', false, true);
INSERT INTO public.galaxy VALUES (17, 'Cartwheel', 13000, 500000000, 500000000.0, 'A rare ring galaxy.', false, true);
INSERT INTO public.galaxy VALUES (18, 'Butterfly', 12000, 60000000, 60000000.0, 'Two colliding spiral galaxies.', false, true);
INSERT INTO public.galaxy VALUES (19, 'Fireworks', 13000, 22000000, 22000000.0, 'Intermediate spiral galaxy.', false, true);
INSERT INTO public.galaxy VALUES (20, 'Mayall Object', 10000, 450000000, 450000000.0, 'A peculiar galaxy result of collision.', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'Moon', 450000, 384400, 1.0, 'Earths only natural satellite.', false, true, 1);
INSERT INTO public.moon VALUES (5, 'Phobos', 40000, 22500, 1.5, 'The larger of the two Martian moons.', false, false, 2);
INSERT INTO public.moon VALUES (6, 'Europa', 450000, 628300, 5.2, 'An icy moon of Jupiter with a subsurface ocean.', false, true, 3);
INSERT INTO public.moon VALUES (24, 'Titan', 4000000, 1200000, 9.5, 'Largest moon of Saturn.', false, true, 4);
INSERT INTO public.moon VALUES (25, 'Ganymede', 4500000, 628000, 5.2, 'Largest moon in solar system.', false, true, 5);
INSERT INTO public.moon VALUES (26, 'Callisto', 4500000, 628000, 5.2, 'Heavily cratered moon.', false, true, 6);
INSERT INTO public.moon VALUES (27, 'Io', 4500000, 628000, 5.2, 'Most volcanic world.', false, true, 7);
INSERT INTO public.moon VALUES (28, 'Enceladus', 4000000, 1200000, 9.5, 'Icy moon with geysers.', false, true, 8);
INSERT INTO public.moon VALUES (29, 'Triton', 4000000, 4300000, 30.0, 'Neptunes largest moon.', false, true, 9);
INSERT INTO public.moon VALUES (30, 'Charon', 4500000, 5900000, 39.5, 'Plutos largest moon.', false, true, 10);
INSERT INTO public.moon VALUES (31, 'Dione', 4000000, 1200000, 9.5, 'Moon of Saturn.', false, true, 11);
INSERT INTO public.moon VALUES (32, 'Rhea', 4000000, 1200000, 9.5, 'Second largest moon of Saturn.', false, true, 12);
INSERT INTO public.moon VALUES (33, 'Kepler Moon A', 10600000, 560000, 560.0, 'Exomoon candidate.', false, true, 13);
INSERT INTO public.moon VALUES (34, 'Kepler Moon B', 2900000, 1206000, 0.0, 'Rocky exomoon.', false, true, 14);
INSERT INTO public.moon VALUES (35, 'Gliese Moon', 6000000, 42000, 42.0, 'Ocean moon candidate.', false, true, 15);
INSERT INTO public.moon VALUES (36, 'Rigel Moon', 8000000, 860000, 860.0, 'High radiation moon.', false, true, 16);
INSERT INTO public.moon VALUES (37, 'Antares Moon', 12000000, 550000, 550.0, 'Red-lit world.', false, true, 17);
INSERT INTO public.moon VALUES (38, 'Spica Moon', 12500000, 260000, 260.0, 'Fast orbiting moon.', false, true, 18);
INSERT INTO public.moon VALUES (39, 'Pollux Moon', 7240000, 34000, 34.0, 'Dark rocky moon.', false, true, 19);
INSERT INTO public.moon VALUES (40, 'Deneb Moon', 10000000, 2600000, 0.0, 'Extreme cold moon.', false, true, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 0, 4543, 0.0, 'The only planet with liquid water on surface.', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Kepler-186f', 582, 4000, 582.0, 'The first Earth-sized planet in a habitable zone.', false, true, 3);
INSERT INTO public.planet VALUES (3, 'Proxima b', 4, 4850, 4.2, 'An Earth-sized planet in the habitable zone.', false, true, 2);
INSERT INTO public.planet VALUES (4, 'Kepler-186f', 582, 4000, 582.0, 'First Earth-sized planet in habitable zone.', false, true, 4);
INSERT INTO public.planet VALUES (5, 'TRAPPIST-1e', 40, 7600, 39.6, 'Potentially rocky planet in TRAPPIST-1.', false, true, 5);
INSERT INTO public.planet VALUES (6, 'Gliese 581c', 20, 8000, 20.3, 'Super-Earth exoplanet orbiting Gliese 581.', false, true, 6);
INSERT INTO public.planet VALUES (9, 'Epsilon Eridani b', 10, 800, 10.5, 'A gas giant planet with an eccentric orbit.', false, true, 9);
INSERT INTO public.planet VALUES (10, 'HD 40307 g', 42, 7000, 41.8, 'A super-Earth located in the habitable zone.', false, true, 11);
INSERT INTO public.planet VALUES (11, 'Gliese 667 Cc', 23, 5000, 23.6, 'A planet orbiting a red dwarf star.', false, true, 12);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 1402, 6000, 0.0, 'The most Earth-like planet found so far.', false, true, 10);
INSERT INTO public.planet VALUES (13, 'Kepler-22b', 635, 4000, 635.0, 'First planet found in sun-like habitable zone.', false, true, 7);
INSERT INTO public.planet VALUES (14, 'Tau Ceti e', 12, 5800, 11.9, 'A candidate planet for habitability.', false, true, 8);
INSERT INTO public.planet VALUES (15, 'Kepler-10b', 560, 10600, 560.0, 'The first rocky planet found.', false, true, 13);
INSERT INTO public.planet VALUES (16, 'Kepler-442b', 1206, 2900, 0.0, 'A rocky near-Earth-sized exoplanet.', false, true, 14);
INSERT INTO public.planet VALUES (17, 'Gliese 1214 b', 42, 6000, 42.0, 'A potential water world.', false, true, 15);
INSERT INTO public.planet VALUES (18, 'Rigel Prime', 860, 8000, 860.0, 'Hypothetical planet near Rigel.', false, true, 16);
INSERT INTO public.planet VALUES (19, 'Antares b', 550, 12000, 550.0, 'Planet orbiting a red supergiant.', false, true, 17);
INSERT INTO public.planet VALUES (20, 'Spica I', 260, 12500, 260.0, 'Massive planet in a binary system.', false, true, 18);
INSERT INTO public.planet VALUES (7, 'Pollux b', 34, 7240, 34.0, 'Gas giant orbiting Pollux.', false, true, 19);
INSERT INTO public.planet VALUES (8, 'Deneb Minor', 2600, 10000, 0.0, 'Frozen world far from Deneb.', false, true, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 0, 0.0, 'The central star of our system.', true, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4850, 4, 4.2, 'The closest star system to us.', false, true, 2);
INSERT INTO public.star VALUES (3, 'Kepler-186', 4000, 8, 8.6, 'A very bright star in the night sky.', false, true, 3);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 6000000, 4, 4.3, 'The closest star system to the Solar System.', false, true, 4);
INSERT INTO public.star VALUES (5, 'Vega', 4550000, 25, 25.0, 'One of the most luminous stars in the solar neighborhood.', false, true, 5);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 4850000, 4, 4.2, 'The closest individual star to the Sun.', false, true, 6);
INSERT INTO public.star VALUES (9, 'TRAPPIST-1', 7600000, 40, 39.6, 'Ultra-cool red dwarf star.', false, true, 8);
INSERT INTO public.star VALUES (10, 'Gliese 581', 8000000, 20, 20.3, 'Red dwarf star in Libra.', false, true, 9);
INSERT INTO public.star VALUES (11, 'Kepler-22', 4000000, 635, 635.0, 'G-type star like our Sun.', false, true, 10);
INSERT INTO public.star VALUES (12, 'Tau Ceti', 5800000, 12, 11.9, 'Star similar to the Sun in Cetus.', false, true, 11);
INSERT INTO public.star VALUES (13, 'Epsilon Eridani', 800000, 10, 10.5, 'Young star with debris disks.', false, true, 12);
INSERT INTO public.star VALUES (14, 'Kepler-452', 6000000, 1400, 0.0, 'G-type star, cousin to the Sun.', false, true, 13);
INSERT INTO public.star VALUES (15, 'HD 40307', 7000000, 42, 41.8, 'K-type main-sequence star.', false, true, 14);
INSERT INTO public.star VALUES (7, 'Kepler-186', 4000000, 582, 582.0, 'M-type main-sequence star.', false, true, 7);
INSERT INTO public.star VALUES (8, 'Gliese 667 C', 5000000, 23, 23.6, 'Part of a triple star system.', false, true, 15);
INSERT INTO public.star VALUES (16, 'Rigel', 8000000, 860, 860.0, 'Blue supergiant in Orion.', false, true, 16);
INSERT INTO public.star VALUES (17, 'Antares', 12000000, 550, 550.0, 'Red supergiant in Scorpius.', false, true, 17);
INSERT INTO public.star VALUES (18, 'Spica', 12500000, 260, 260.0, 'Brightest object in Virgo.', false, true, 18);
INSERT INTO public.star VALUES (19, 'Pollux', 7240000, 34, 34.0, 'Orange-hued evolved giant star.', false, true, 19);
INSERT INTO public.star VALUES (20, 'Deneb', 10000000, 2600, 0.0, 'Blue-white supergiant star.', false, true, 20);


--
-- Name: comets_comets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comets_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 44, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 21, true);


--
-- Name: comets comets_description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_description_unique UNIQUE (description);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


--
-- Name: galaxy galaxy_description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_unique UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_unique UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_unique UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: star star_description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_unique UNIQUE (description);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comets comets_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

