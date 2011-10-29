--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: SCHEMA paste; Type: COMMENT; Schema: -; Owner: paste
--

COMMENT ON SCHEMA paste IS 'schema for paste';


SET search_path = paste, pg_catalog;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: paste; Owner: paste
--

CREATE SEQUENCE comments_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE paste.comments_id_seq OWNER TO "paste";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: comments; Type: TABLE; Schema: paste; Owner: paste; Tablespace: 
--

CREATE TABLE comments (
    id integer DEFAULT nextval('comments_id_seq'::regclass) NOT NULL,
    text character varying,
    name character varying,
    date timestamp without time zone,
    paste_id integer
);


ALTER TABLE paste.comments OWNER TO "paste";

--
-- Name: lang; Type: TABLE; Schema: paste; Owner: paste; Tablespace: 
--

CREATE TABLE lang (
    "desc" text,
    lang_id integer NOT NULL
);


ALTER TABLE paste.lang OWNER TO "paste";

--
-- Name: lang_lang_id_seq; Type: SEQUENCE; Schema: paste; Owner: paste
--

CREATE SEQUENCE lang_lang_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE paste.lang_lang_id_seq OWNER TO "paste";

--
-- Name: lang_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: paste; Owner: paste
--

ALTER SEQUENCE lang_lang_id_seq OWNED BY lang.lang_id;


--
-- Name: paste; Type: TABLE; Schema: paste; Owner: paste; Tablespace: 
--

CREATE TABLE paste (
    id integer NOT NULL,
    poster character varying,
    posted timestamp without time zone,
    code character varying,
    lang_id bigint,
    expires bigint,
    sha1 text,
    sessionid text,
    hidden boolean
);


ALTER TABLE paste.paste OWNER TO "paste";

--
-- Name: paste_id_seq; Type: SEQUENCE; Schema: paste; Owner: paste
--

CREATE SEQUENCE paste_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE paste.paste_id_seq OWNER TO "paste";

--
-- Name: paste_id_seq; Type: SEQUENCE OWNED BY; Schema: paste; Owner: paste
--

ALTER SEQUENCE paste_id_seq OWNED BY paste.id;


--
-- Name: lang_id; Type: DEFAULT; Schema: paste; Owner: paste
--

ALTER TABLE lang ALTER COLUMN lang_id SET DEFAULT nextval('lang_lang_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: paste; Owner: paste
--

ALTER TABLE paste ALTER COLUMN id SET DEFAULT nextval('paste_id_seq'::regclass);


--
-- Name: lang_pkey; Type: CONSTRAINT; Schema: paste; Owner: paste; Tablespace: 
--

ALTER TABLE ONLY lang
    ADD CONSTRAINT lang_pkey PRIMARY KEY (lang_id);


--
-- Name: paste_pkey; Type: CONSTRAINT; Schema: paste; Owner: paste; Tablespace: 
--

ALTER TABLE ONLY paste
    ADD CONSTRAINT paste_pkey PRIMARY KEY (id);


--
-- Name: id_index; Type: INDEX; Schema: paste; Owner: paste; Tablespace: 
--

CREATE UNIQUE INDEX id_index ON paste USING btree (id);


--
-- Name: index_id; Type: INDEX; Schema: paste; Owner: paste; Tablespace: 
--

CREATE UNIQUE INDEX index_id ON lang USING btree (lang_id);


