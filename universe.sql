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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_type text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    name character varying(30) NOT NULL,
    target_type text,
    target_id integer,
    success boolean,
    launch_year integer
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    is_spherical boolean,
    has_life boolean,
    distance_from_planet numeric(5,2),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    planet_type text,
    has_life boolean,
    distance_from_earth numeric(12,2),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Spiral', 13600, 0.00);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Spiral', 10000, 2537000.00);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 'Spiral', 12000, 3000000.00);
INSERT INTO public.galaxy VALUES ('Sombrero', 4, 'Elliptical', 13000, 29000000.00);
INSERT INTO public.galaxy VALUES ('Whirlpool', 5, 'Spiral', 11000, 23000000.00);
INSERT INTO public.galaxy VALUES ('Centaurus A', 6, 'Elliptical', 13000, 12000000.00);


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (1, 'Apollo 11', 'moon', 1, true, 1969);
INSERT INTO public.mission VALUES (2, 'Voyager 1', 'planet', 3, true, 1977);
INSERT INTO public.mission VALUES (3, 'Curiosity', 'planet', 2, true, 2011);
INSERT INTO public.mission VALUES (4, 'Artemis I', 'moon', 1, true, 2022);
INSERT INTO public.mission VALUES (5, 'Europa Clipper', 'moon', 4, false, 2025);
INSERT INTO public.mission VALUES (6, 'Titan Rover', 'moon', 5, true, 2005);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, true, false, 0.38, 1);
INSERT INTO public.moon VALUES ('Phobos', 2, true, false, 0.01, 2);
INSERT INTO public.moon VALUES ('Deimos', 3, true, false, 0.02, 2);
INSERT INTO public.moon VALUES ('Europa', 4, true, false, 0.67, 3);
INSERT INTO public.moon VALUES ('Ganymede', 5, true, false, 1.07, 3);
INSERT INTO public.moon VALUES ('Callisto', 6, true, false, 1.88, 3);
INSERT INTO public.moon VALUES ('Io', 7, true, false, 0.42, 3);
INSERT INTO public.moon VALUES ('Prox-moon1', 8, false, false, 0.50, 4);
INSERT INTO public.moon VALUES ('Prox-moon2', 9, false, false, 0.70, 4);
INSERT INTO public.moon VALUES ('Sirius-m1', 10, true, false, 1.10, 5);
INSERT INTO public.moon VALUES ('Sirius-m2', 11, false, false, 0.90, 6);
INSERT INTO public.moon VALUES ('Rigel-m1', 12, true, false, 2.00, 7);
INSERT INTO public.moon VALUES ('Rigel-m2', 13, true, false, 2.10, 7);
INSERT INTO public.moon VALUES ('Rigel-m3', 14, false, false, 1.50, 8);
INSERT INTO public.moon VALUES ('Vega-m1', 15, true, false, 1.00, 9);
INSERT INTO public.moon VALUES ('Vega-m2', 16, true, false, 1.40, 9);
INSERT INTO public.moon VALUES ('Vega-m3', 17, false, false, 1.30, 10);
INSERT INTO public.moon VALUES ('Betel-A1', 18, true, false, 3.20, 11);
INSERT INTO public.moon VALUES ('Betel-A2', 19, false, false, 2.80, 11);
INSERT INTO public.moon VALUES ('Betel-B1', 20, false, false, 3.00, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 'Terrestrial', true, 0.00, 1);
INSERT INTO public.planet VALUES ('Mars', 2, 'Terrestrial', false, 78.00, 1);
INSERT INTO public.planet VALUES ('Jupiter', 3, 'Gas Giant', false, 628.00, 1);
INSERT INTO public.planet VALUES ('Proxima b', 4, 'Terrestrial', false, 4000.00, 2);
INSERT INTO public.planet VALUES ('Sirius A-1', 5, 'Ice Giant', false, 8600.00, 3);
INSERT INTO public.planet VALUES ('Sirius A-2', 6, 'Terrestrial', false, 8700.00, 3);
INSERT INTO public.planet VALUES ('Rigel-1', 7, 'Gas Giant', false, 2400000.00, 4);
INSERT INTO public.planet VALUES ('Rigel-2', 8, 'Terrestrial', false, 2399000.00, 4);
INSERT INTO public.planet VALUES ('Vega-1', 9, 'Terrestrial', false, 2500000.00, 5);
INSERT INTO public.planet VALUES ('Vega-2', 10, 'Gas Giant', false, 2510000.00, 5);
INSERT INTO public.planet VALUES ('Betel-A', 11, 'Ice Giant', false, 29000000.00, 6);
INSERT INTO public.planet VALUES ('Betel-B', 12, 'Terrestrial', false, 29050000.00, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, true, 4600, 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 2, true, 4500, 1);
INSERT INTO public.star VALUES ('Sirius', 3, true, 300, 1);
INSERT INTO public.star VALUES ('Rigel', 4, true, 800, 2);
INSERT INTO public.star VALUES ('Vega', 5, true, 455, 3);
INSERT INTO public.star VALUES ('Betelgeuse', 6, false, 10000, 4);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: mission mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_name_key UNIQUE (name);


--
-- Name: mission missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT missions_pkey PRIMARY KEY (mission_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

