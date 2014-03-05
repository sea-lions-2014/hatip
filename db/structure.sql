--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    title character varying(255),
    youtube_url character varying(255),
    description character varying(255),
    hype integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    stage_name character varying(255),
    twitter_handle character varying(255),
    verified boolean DEFAULT false,
    city character varying(255),
    state character varying(255),
    country character varying(255),
    category character varying(255),
    tagline character varying(255),
    story text,
    hype_score integer DEFAULT 0,
    profile_image_url character varying(255) DEFAULT '/assets/avatar.png'::character varying,
    featured_youtube_url character varying(255),
    is_admin boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provider character varying(255),
    uid character varying(255),
    oauth_token character varying(255),
    oauth_expires_at time without time zone
);


--
-- Name: post_searches; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW post_searches AS
        (         SELECT posts.id AS searchable_id, 
                    'Post'::text AS searchable_type, 
                    posts.title AS term
                   FROM posts
        UNION 
                 SELECT posts.id AS searchable_id, 
                    'Post'::text AS searchable_type, 
                    posts.description AS term
                   FROM posts)
UNION 
         SELECT posts.id AS searchable_id, 
            'Post'::text AS searchable_type, 
            users.stage_name AS term
           FROM (posts
      JOIN users ON ((posts.user_id = users.id)));


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: tips; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tips (
    id integer NOT NULL,
    user_id integer,
    coinbase_id character varying(255),
    post_id character varying(255),
    fiat_iso character varying(255),
    fiat_cents integer,
    crypto_iso character varying(255),
    crypto_cents integer,
    tx_hash character varying(255),
    tx_id character varying(255),
    status character varying(255),
    receive_address character varying(255)
);


--
-- Name: tips_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tips_id_seq OWNED BY tips.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tips ALTER COLUMN id SET DEFAULT nextval('tips_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: tips_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tips
    ADD CONSTRAINT tips_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_posts_on_description; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_posts_on_description ON posts USING gin (to_tsvector('english'::regconfig, (description)::text));


--
-- Name: index_posts_on_title; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_posts_on_title ON posts USING gin (to_tsvector('english'::regconfig, (title)::text));


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_stage_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_stage_name ON users USING gin (to_tsvector('english'::regconfig, (stage_name)::text));


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20140227224309');

INSERT INTO schema_migrations (version) VALUES ('20140228022239');

INSERT INTO schema_migrations (version) VALUES ('20140228032454');

INSERT INTO schema_migrations (version) VALUES ('20140228232337');

INSERT INTO schema_migrations (version) VALUES ('20140304224810');

INSERT INTO schema_migrations (version) VALUES ('20140304225207');