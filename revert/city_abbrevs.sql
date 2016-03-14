-- Revert hpms_geocode:city_abbrevs from pg

BEGIN;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = geocoding, pg_catalog;

drop table if exists geocoding.city_abbrev;

COMMIT;
