-- Verify hpms_geocode:city_abbrevs on pg

BEGIN;

SELECT *
  FROM geocoding.city_abbrev
 WHERE FALSE;

ROLLBACK;
