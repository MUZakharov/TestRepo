CREATE FUNCTION "public"."long_long_long_long_long_long_long_long_long_long_long_name1"()
  RETURNS integer AS
$$
	SELECT 1
$$
LANGUAGE sql
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;
ALTER FUNCTION "public"."long_long_long_long_long_long_long_long_long_long_long_name1"() OWNER TO postgres;