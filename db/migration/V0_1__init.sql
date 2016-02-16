-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.1
-- PostgreSQL version: 9.3
-- Project Site: pgmodeler.com.br
-- Model Author: ---

-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: renison | type: DATABASE --
DROP DATABASE IF EXISTS renison;
CREATE DATABASE renison
    TEMPLATE = template0
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
;
-- -- ddl-end --
--

-- object: public."AUTHOR_ENTRY" | type: TABLE --
DROP TABLE IF EXISTS public."AUTHOR_ENTRY" CASCADE;
CREATE TABLE public."AUTHOR_ENTRY"(
    id integer NOT NULL,
    middlename_original character varying(1024),
    middlename_romanized character varying(1024),
    title_original character varying(32),
    title_romanized character varying(32),
    firstname_original character varying(256),
    firstname_romanized character varying(256) NOT NULL,
    lastname_original character varying(256),
    lastname_romanized character varying(256) NOT NULL,
    CONSTRAINT authorentry_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."AUTHOR_ENTRY" OWNER TO renison;
-- ddl-end --

-- object: authorentry_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.authorentry_id_idx CASCADE;
CREATE INDEX authorentry_id_idx ON public."AUTHOR_ENTRY"
    USING btree
    (
      id
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: public."BOOK_AUTHOR" | type: TABLE --
DROP TABLE IF EXISTS public."BOOK_AUTHOR" CASCADE;
CREATE TABLE public."BOOK_AUTHOR"(
    id integer NOT NULL,
    "id_AUTHOR_ENTRY" integer,
    "id_BOOK_ENTRY" integer,
    CONSTRAINT bookauthor_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."BOOK_AUTHOR" OWNER TO renison;
-- ddl-end --

-- object: public."BOOK_CATEGORY" | type: TABLE --
DROP TABLE IF EXISTS public."BOOK_CATEGORY" CASCADE;
CREATE TABLE public."BOOK_CATEGORY"(
    id integer NOT NULL,
    "id_BOOK_ENTRY" integer,
    "id_CATEGORY_ENTRY" integer,
    CONSTRAINT bookcategory_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."BOOK_CATEGORY" OWNER TO renison;
-- ddl-end --

-- object: public."BOOK_COVER" | type: TABLE --
DROP TABLE IF EXISTS public."BOOK_COVER" CASCADE;
CREATE TABLE public."BOOK_COVER"(
    id integer NOT NULL,
    "id_BOOK_ENTRY" integer,
    "id_BOOK_COVER_ENTRY" integer,
    CONSTRAINT bookcover_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."BOOK_COVER" OWNER TO renison;
-- ddl-end --

-- object: book_cover_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_cover_id_idx CASCADE;
CREATE INDEX book_cover_id_idx ON public."BOOK_COVER"
    USING btree
    (
      id
    );
-- ddl-end --

-- object: public."BOOK_COVER_ENTRY" | type: TABLE --
DROP TABLE IF EXISTS public."BOOK_COVER_ENTRY" CASCADE;
CREATE TABLE public."BOOK_COVER_ENTRY"(
    id integer NOT NULL,
    asset_name character varying(1024) NOT NULL,
    CONSTRAINT bookcoverentry_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."BOOK_COVER_ENTRY" OWNER TO renison;
-- ddl-end --

-- object: bookcoverentry_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.bookcoverentry_id_idx CASCADE;
CREATE INDEX bookcoverentry_id_idx ON public."BOOK_COVER_ENTRY"
    USING btree
    (
      id
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: bookcoverentry_assetname_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.bookcoverentry_assetname_idx CASCADE;
CREATE INDEX bookcoverentry_assetname_idx ON public."BOOK_COVER_ENTRY"
    USING btree
    (
      asset_name
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: public."BOOK_ENTRY" | type: TABLE --
DROP TABLE IF EXISTS public."BOOK_ENTRY" CASCADE;
CREATE TABLE public."BOOK_ENTRY"(
    edition character varying(128),
    issn char(16),
    lccn char(16),
    barcode character varying(64),
    isbn char(16),
    id integer NOT NULL,
    pages integer,
    alttitle_original character varying(2048),
    alttitle_romanized character varying(1024),
    publisher_original character varying(2048),
    publisher_romanized character varying(1024),
    title_original character varying(2048),
    date_released date,
    title_romanized character varying(1024) NOT NULL,
    dewey varchar(64),
    CONSTRAINT bookentry_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."BOOK_ENTRY" OWNER TO renison;
-- ddl-end --

-- object: bookentry_barcode_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.bookentry_barcode_idx CASCADE;
CREATE INDEX bookentry_barcode_idx ON public."BOOK_ENTRY"
    USING btree
    (
      barcode
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: bookentry_isbn_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.bookentry_isbn_idx CASCADE;
CREATE INDEX bookentry_isbn_idx ON public."BOOK_ENTRY"
    USING btree
    (
      isbn
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: bookentry_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.bookentry_id_idx CASCADE;
CREATE INDEX bookentry_id_idx ON public."BOOK_ENTRY"
    USING btree
    (
      id
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: public."BOOK_KEYWORD" | type: TABLE --
DROP TABLE IF EXISTS public."BOOK_KEYWORD" CASCADE;
CREATE TABLE public."BOOK_KEYWORD"(
    id integer NOT NULL,
    "id_BOOK_ENTRY" integer,
    "id_KEYWORD_ENTRY" integer,
    CONSTRAINT bookkeyword_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."BOOK_KEYWORD" OWNER TO renison;
-- ddl-end --

-- object: book_keyword_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_keyword_id_idx CASCADE;
CREATE INDEX book_keyword_id_idx ON public."BOOK_KEYWORD"
    USING btree
    (
      id
    );
-- ddl-end --

-- object: public."BOOK_LANGUAGE" | type: TABLE --
DROP TABLE IF EXISTS public."BOOK_LANGUAGE" CASCADE;
CREATE TABLE public."BOOK_LANGUAGE"(
    id integer NOT NULL,
    "id_BOOK_ENTRY" integer,
    "id_LANGUAGE_ENTRY" integer,
    CONSTRAINT booklanguage_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."BOOK_LANGUAGE" OWNER TO renison;
-- ddl-end --

-- object: booklanguage_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.booklanguage_id_idx CASCADE;
CREATE INDEX booklanguage_id_idx ON public."BOOK_LANGUAGE"
    USING btree
    (
      id
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: public."BOOK_SPONSOR" | type: TABLE --
DROP TABLE IF EXISTS public."BOOK_SPONSOR" CASCADE;
CREATE TABLE public."BOOK_SPONSOR"(
    id integer NOT NULL,
    "id_BOOK_ENTRY" integer,
    "id_SPONSOR_ENTRY" integer,
    CONSTRAINT booksponsor_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."BOOK_SPONSOR" OWNER TO renison;
-- ddl-end --

-- object: book_sponsor_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_sponsor_id_idx CASCADE;
CREATE INDEX book_sponsor_id_idx ON public."BOOK_SPONSOR"
    USING btree
    (
      id
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: public."CATEGORY_ENTRY" | type: TABLE --
DROP TABLE IF EXISTS public."CATEGORY_ENTRY" CASCADE;
CREATE TABLE public."CATEGORY_ENTRY"(
    id integer NOT NULL,
    category varchar(1024) NOT NULL,
    CONSTRAINT categoryentry_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."CATEGORY_ENTRY" OWNER TO renison;
-- ddl-end --

-- object: categoryentry_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.categoryentry_id_idx CASCADE;
CREATE INDEX categoryentry_id_idx ON public."CATEGORY_ENTRY"
    USING btree
    (
      id
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: categoryentry_category_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.categoryentry_category_idx CASCADE;
CREATE INDEX categoryentry_category_idx ON public."CATEGORY_ENTRY"
    USING btree
    (
      category
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: public."KEYWORD_ENTRY" | type: TABLE --
DROP TABLE IF EXISTS public."KEYWORD_ENTRY" CASCADE;
CREATE TABLE public."KEYWORD_ENTRY"(
    id integer NOT NULL,
    keyword character varying(1024) NOT NULL,
    CONSTRAINT keywordentry_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."KEYWORD_ENTRY" OWNER TO renison;
-- ddl-end --

-- object: keywordentry_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.keywordentry_id_idx CASCADE;
CREATE INDEX keywordentry_id_idx ON public."KEYWORD_ENTRY"
    USING btree
    (
      id
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: keywordentry_keyword_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.keywordentry_keyword_idx CASCADE;
CREATE INDEX keywordentry_keyword_idx ON public."KEYWORD_ENTRY"
    USING btree
    (
      keyword
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: public."LANGUAGE_ENTRY" | type: TABLE --
DROP TABLE IF EXISTS public."LANGUAGE_ENTRY" CASCADE;
CREATE TABLE public."LANGUAGE_ENTRY"(
    id integer NOT NULL,
    language character varying(128) NOT NULL,
    CONSTRAINT languageentry_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."LANGUAGE_ENTRY" OWNER TO renison;
-- ddl-end --

-- object: languageentry_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.languageentry_id_idx CASCADE;
CREATE INDEX languageentry_id_idx ON public."LANGUAGE_ENTRY"
    USING btree
    (
      id
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: languageentry_language_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.languageentry_language_idx CASCADE;
CREATE INDEX languageentry_language_idx ON public."LANGUAGE_ENTRY"
    USING btree
    (
      language
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: public."SPONSOR_ENTRY" | type: TABLE --
DROP TABLE IF EXISTS public."SPONSOR_ENTRY" CASCADE;
CREATE TABLE public."SPONSOR_ENTRY"(
    description character varying(1024),
    name character varying(1024) NOT NULL,
    url character varying(1024),
    id integer NOT NULL,
    CONSTRAINT sponsorentry_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."SPONSOR_ENTRY" OWNER TO renison;
-- ddl-end --

-- object: sponsorentry_name_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.sponsorentry_name_idx CASCADE;
CREATE INDEX sponsorentry_name_idx ON public."SPONSOR_ENTRY"
    USING btree
    (
      name
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: sponsorentry_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.sponsorentry_id_idx CASCADE;
CREATE INDEX sponsorentry_id_idx ON public."SPONSOR_ENTRY"
    USING btree
    (
      id
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: "AUTHOR_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_AUTHOR" -- DROP CONSTRAINT IF EXISTS "AUTHOR_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_AUTHOR" ADD CONSTRAINT "AUTHOR_ENTRY_fk" FOREIGN KEY ("id_AUTHOR_ENTRY")
REFERENCES public."AUTHOR_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "BOOK_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_AUTHOR" -- DROP CONSTRAINT IF EXISTS "BOOK_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_AUTHOR" ADD CONSTRAINT "BOOK_ENTRY_fk" FOREIGN KEY ("id_BOOK_ENTRY")
REFERENCES public."BOOK_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: book_author_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_author_id_idx CASCADE;
CREATE INDEX book_author_id_idx ON public."BOOK_AUTHOR"
    USING btree
    (
      id ASC NULLS LAST
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: book_cover_book_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_cover_book_idx CASCADE;
CREATE INDEX book_cover_book_idx ON public."BOOK_AUTHOR"
    USING btree
    (
      "id_BOOK_ENTRY" ASC NULLS LAST
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: book_author_author_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_author_author_idx CASCADE;
CREATE INDEX book_author_author_idx ON public."BOOK_AUTHOR"
    USING btree
    (
      "id_AUTHOR_ENTRY" ASC NULLS LAST
    )	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: "BOOK_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_COVER" -- DROP CONSTRAINT IF EXISTS "BOOK_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_COVER" ADD CONSTRAINT "BOOK_ENTRY_fk" FOREIGN KEY ("id_BOOK_ENTRY")
REFERENCES public."BOOK_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "BOOK_COVER_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_COVER" -- DROP CONSTRAINT IF EXISTS "BOOK_COVER_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_COVER" ADD CONSTRAINT "BOOK_COVER_ENTRY_fk" FOREIGN KEY ("id_BOOK_COVER_ENTRY")
REFERENCES public."BOOK_COVER_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "BOOK_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_CATEGORY" -- DROP CONSTRAINT IF EXISTS "BOOK_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_CATEGORY" ADD CONSTRAINT "BOOK_ENTRY_fk" FOREIGN KEY ("id_BOOK_ENTRY")
REFERENCES public."BOOK_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "CATEGORY_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_CATEGORY" -- DROP CONSTRAINT IF EXISTS "CATEGORY_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_CATEGORY" ADD CONSTRAINT "CATEGORY_ENTRY_fk" FOREIGN KEY ("id_CATEGORY_ENTRY")
REFERENCES public."CATEGORY_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "BOOK_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_KEYWORD" -- DROP CONSTRAINT IF EXISTS "BOOK_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_KEYWORD" ADD CONSTRAINT "BOOK_ENTRY_fk" FOREIGN KEY ("id_BOOK_ENTRY")
REFERENCES public."BOOK_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "BOOK_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_SPONSOR" -- DROP CONSTRAINT IF EXISTS "BOOK_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_SPONSOR" ADD CONSTRAINT "BOOK_ENTRY_fk" FOREIGN KEY ("id_BOOK_ENTRY")
REFERENCES public."BOOK_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "BOOK_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_LANGUAGE" -- DROP CONSTRAINT IF EXISTS "BOOK_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_LANGUAGE" ADD CONSTRAINT "BOOK_ENTRY_fk" FOREIGN KEY ("id_BOOK_ENTRY")
REFERENCES public."BOOK_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "SPONSOR_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_SPONSOR" -- DROP CONSTRAINT IF EXISTS "SPONSOR_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_SPONSOR" ADD CONSTRAINT "SPONSOR_ENTRY_fk" FOREIGN KEY ("id_SPONSOR_ENTRY")
REFERENCES public."SPONSOR_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "LANGUAGE_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_LANGUAGE" -- DROP CONSTRAINT IF EXISTS "LANGUAGE_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_LANGUAGE" ADD CONSTRAINT "LANGUAGE_ENTRY_fk" FOREIGN KEY ("id_LANGUAGE_ENTRY")
REFERENCES public."LANGUAGE_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "KEYWORD_ENTRY_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOOK_KEYWORD" -- DROP CONSTRAINT IF EXISTS "KEYWORD_ENTRY_fk" CASCADE;
ALTER TABLE public."BOOK_KEYWORD" ADD CONSTRAINT "KEYWORD_ENTRY_fk" FOREIGN KEY ("id_KEYWORD_ENTRY")
REFERENCES public."KEYWORD_ENTRY" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: bookcover_book_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.bookcover_book_id_idx CASCADE;
CREATE INDEX bookcover_book_id_idx ON public."BOOK_COVER"
    USING btree
    (
      "id_BOOK_ENTRY" ASC NULLS LAST
    );
-- ddl-end --

-- object: book_category_book_id_index | type: INDEX --
-- DROP INDEX IF EXISTS public.book_category_book_id_index CASCADE;
CREATE INDEX book_category_book_id_index ON public."BOOK_CATEGORY"
    USING btree
    (
      "id_BOOK_ENTRY"
    );
-- ddl-end --

-- object: book_category_category_id_index | type: INDEX --
-- DROP INDEX IF EXISTS public.book_category_category_id_index CASCADE;
CREATE INDEX book_category_category_id_index ON public."BOOK_CATEGORY"
    USING btree
    (
      "id_CATEGORY_ENTRY"
    );
-- ddl-end --

-- object: book_sponsor_book_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_sponsor_book_id_idx CASCADE;
CREATE INDEX book_sponsor_book_id_idx ON public."BOOK_SPONSOR"
    USING btree
    (
      "id_BOOK_ENTRY"
    );
-- ddl-end --

-- object: book_sponsor_sponsor_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_sponsor_sponsor_id_idx CASCADE;
CREATE INDEX book_sponsor_sponsor_id_idx ON public."BOOK_SPONSOR"
    USING btree
    (
      "id_SPONSOR_ENTRY"
    );
-- ddl-end --

-- object: bookcover_cover_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.bookcover_cover_id_idx CASCADE;
CREATE INDEX bookcover_cover_id_idx ON public."BOOK_COVER"
    USING btree
    (
      "id_BOOK_COVER_ENTRY" ASC NULLS LAST
    );
-- ddl-end --

-- object: book_keyword_book_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_keyword_book_id_idx CASCADE;
CREATE INDEX book_keyword_book_id_idx ON public."BOOK_KEYWORD"
    USING btree
    (
      "id_BOOK_ENTRY"
    );
-- ddl-end --

-- object: book_keyword_keyword_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_keyword_keyword_id_idx CASCADE;
CREATE INDEX book_keyword_keyword_id_idx ON public."BOOK_KEYWORD"
    USING btree
    (
      "id_KEYWORD_ENTRY"
    );
-- ddl-end --

-- object: book_language_book_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_language_book_id_idx CASCADE;
CREATE INDEX book_language_book_id_idx ON public."BOOK_LANGUAGE"
    USING btree
    (
      "id_BOOK_ENTRY"
    );
-- ddl-end --

-- object: book_language_language_id_idx | type: INDEX --
-- DROP INDEX IF EXISTS public.book_language_language_id_idx CASCADE;
CREATE INDEX book_language_language_id_idx ON public."BOOK_LANGUAGE"
    USING btree
    (
      "id_LANGUAGE_ENTRY"
    );
-- ddl-end --

-- object: grant_357ce26529 | type: PERMISSION --
GRANT CONNECT,TEMPORARY
   ON DATABASE renison
   TO PUBLIC;
-- ddl-end --

-- object: grant_e6280c65f2 | type: PERMISSION --
GRANT CREATE,CONNECT,TEMPORARY
   ON DATABASE renison
   TO postgres;
-- ddl-end --

-- object: grant_c3133b7fc1 | type: PERMISSION --
GRANT CREATE,CONNECT,TEMPORARY
   ON DATABASE renison
   TO admin;
-- ddl-end --

-- object: grant_eabed7c316 | type: PERMISSION --
GRANT CREATE,CONNECT,TEMPORARY
   ON DATABASE renison
   TO renison;
-- ddl-end --
