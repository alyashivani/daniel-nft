--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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

--
-- Name: account_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_categories (
    id bigint NOT NULL,
    account_id integer,
    category_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.account_categories OWNER TO postgres;

--
-- Name: account_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_categories_id_seq OWNER TO postgres;

--
-- Name: account_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_categories_id_seq OWNED BY public.account_categories.id;


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    full_phone_number character varying,
    country_code integer,
    phone_number bigint,
    email character varying,
    activated boolean DEFAULT false NOT NULL,
    device_id character varying,
    unique_auth_id text,
    password_digest character varying,
    type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_name character varying,
    platform character varying,
    user_type character varying,
    app_language_id integer,
    last_visit_at timestamp without time zone,
    is_blacklisted boolean DEFAULT false,
    suspend_until date,
    status integer DEFAULT 0 NOT NULL,
    stripe_id character varying,
    stripe_subscription_id character varying,
    stripe_subscription_date timestamp without time zone,
    role_id integer,
    full_name character varying,
    gender integer,
    date_of_birth date,
    age integer,
    is_paid boolean DEFAULT false,
    notify_receive_request boolean DEFAULT true,
    notify_accept_request boolean DEFAULT true,
    notify_post_comment_reply boolean DEFAULT true,
    push_receive_request boolean DEFAULT true,
    push_accept_request boolean DEFAULT true,
    push_post_comment_reply boolean DEFAULT true,
    account_status integer DEFAULT 0 NOT NULL,
    two_factor_auth boolean DEFAULT true,
    account_verified_date date
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_chats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_chats (
    id bigint NOT NULL,
    account_id bigint,
    chat_id bigint,
    status character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.accounts_chats OWNER TO postgres;

--
-- Name: accounts_chats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_chats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_chats_id_seq OWNER TO postgres;

--
-- Name: accounts_chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_chats_id_seq OWNED BY public.accounts_chats.id;


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: achievements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievements (
    id bigint NOT NULL,
    title character varying,
    achievement_date date,
    detail text,
    url character varying,
    profile_bio_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.achievements OWNER TO postgres;

--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.achievements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.achievements_id_seq OWNER TO postgres;

--
-- Name: achievements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.achievements_id_seq OWNED BY public.achievements.id;


--
-- Name: action_mailbox_inbound_emails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_mailbox_inbound_emails (
    id bigint NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    message_id character varying NOT NULL,
    message_checksum character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_mailbox_inbound_emails OWNER TO postgres;

--
-- Name: action_mailbox_inbound_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_mailbox_inbound_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_mailbox_inbound_emails_id_seq OWNER TO postgres;

--
-- Name: action_mailbox_inbound_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_mailbox_inbound_emails_id_seq OWNED BY public.action_mailbox_inbound_emails.id;


--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_text_rich_texts OWNER TO postgres;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_text_rich_texts_id_seq OWNER TO postgres;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_admin_comments OWNER TO postgres;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO postgres;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    default_image boolean DEFAULT false
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    country character varying,
    latitude double precision,
    longitude double precision,
    address character varying,
    addressble_id integer,
    addressble_type character varying,
    address_type integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: advertisements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advertisements (
    id bigint NOT NULL,
    name character varying,
    description text,
    plan_id integer,
    duration character varying,
    advertisement_for integer,
    status integer,
    seller_account_id integer,
    start_at timestamp without time zone,
    expire_at timestamp without time zone
);


ALTER TABLE public.advertisements OWNER TO postgres;

--
-- Name: advertisements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.advertisements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.advertisements_id_seq OWNER TO postgres;

--
-- Name: advertisements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.advertisements_id_seq OWNED BY public.advertisements.id;


--
-- Name: application_message_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_message_translations (
    id bigint NOT NULL,
    application_message_id bigint NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.application_message_translations OWNER TO postgres;

--
-- Name: application_message_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.application_message_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_message_translations_id_seq OWNER TO postgres;

--
-- Name: application_message_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.application_message_translations_id_seq OWNED BY public.application_message_translations.id;


--
-- Name: application_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_messages (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.application_messages OWNER TO postgres;

--
-- Name: application_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.application_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_messages_id_seq OWNER TO postgres;

--
-- Name: application_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.application_messages_id_seq OWNED BY public.application_messages.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: associated_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associated_projects (
    id bigint NOT NULL,
    project_id integer,
    associated_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.associated_projects OWNER TO postgres;

--
-- Name: associated_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.associated_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.associated_projects_id_seq OWNER TO postgres;

--
-- Name: associated_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.associated_projects_id_seq OWNED BY public.associated_projects.id;


--
-- Name: associateds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associateds (
    id bigint NOT NULL,
    associated_with_name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.associateds OWNER TO postgres;

--
-- Name: associateds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.associateds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.associateds_id_seq OWNER TO postgres;

--
-- Name: associateds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.associateds_id_seq OWNED BY public.associateds.id;


--
-- Name: audio_podcasts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audio_podcasts (
    id bigint NOT NULL,
    heading character varying,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.audio_podcasts OWNER TO postgres;

--
-- Name: audio_podcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audio_podcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audio_podcasts_id_seq OWNER TO postgres;

--
-- Name: audio_podcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audio_podcasts_id_seq OWNED BY public.audio_podcasts.id;


--
-- Name: audios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audios (
    id bigint NOT NULL,
    attached_item_id integer,
    attached_item_type character varying,
    audio character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.audios OWNER TO postgres;

--
-- Name: audios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audios_id_seq OWNER TO postgres;

--
-- Name: audios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audios_id_seq OWNED BY public.audios.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id bigint NOT NULL,
    name character varying,
    bio text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: availabilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.availabilities (
    id bigint NOT NULL,
    service_provider_id bigint,
    start_time character varying,
    end_time character varying,
    unavailable_start_time character varying,
    unavailable_end_time character varying,
    availability_date character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    timeslots jsonb,
    available_slots_count integer
);


ALTER TABLE public.availabilities OWNER TO postgres;

--
-- Name: availabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.availabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.availabilities_id_seq OWNER TO postgres;

--
-- Name: availabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.availabilities_id_seq OWNED BY public.availabilities.id;


--
-- Name: awards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.awards (
    id bigint NOT NULL,
    title character varying,
    associated_with character varying,
    issuer character varying,
    issue_date timestamp without time zone,
    description text,
    make_public boolean DEFAULT false NOT NULL,
    profile_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.awards OWNER TO postgres;

--
-- Name: awards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.awards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.awards_id_seq OWNER TO postgres;

--
-- Name: awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.awards_id_seq OWNED BY public.awards.id;


--
-- Name: black_list_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.black_list_users (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.black_list_users OWNER TO postgres;

--
-- Name: black_list_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.black_list_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_list_users_id_seq OWNER TO postgres;

--
-- Name: black_list_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.black_list_users_id_seq OWNED BY public.black_list_users.id;


--
-- Name: block_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.block_users (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    current_user_id bigint,
    account_id bigint
);


ALTER TABLE public.block_users OWNER TO postgres;

--
-- Name: block_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.block_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.block_users_id_seq OWNER TO postgres;

--
-- Name: block_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.block_users_id_seq OWNED BY public.block_users.id;


--
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookmarks (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    content_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.bookmarks OWNER TO postgres;

--
-- Name: bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookmarks_id_seq OWNER TO postgres;

--
-- Name: bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookmarks_id_seq OWNED BY public.bookmarks.id;


--
-- Name: bx_block_appointment_management_booked_slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bx_block_appointment_management_booked_slots (
    id bigint NOT NULL,
    order_id bigint,
    start_time character varying,
    end_time character varying,
    service_provider_id bigint,
    booking_date date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.bx_block_appointment_management_booked_slots OWNER TO postgres;

--
-- Name: bx_block_appointment_management_booked_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bx_block_appointment_management_booked_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bx_block_appointment_management_booked_slots_id_seq OWNER TO postgres;

--
-- Name: bx_block_appointment_management_booked_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bx_block_appointment_management_booked_slots_id_seq OWNED BY public.bx_block_appointment_management_booked_slots.id;


--
-- Name: career_experience_employment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.career_experience_employment_types (
    id bigint NOT NULL,
    career_experience_id integer,
    employment_type_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.career_experience_employment_types OWNER TO postgres;

--
-- Name: career_experience_employment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.career_experience_employment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.career_experience_employment_types_id_seq OWNER TO postgres;

--
-- Name: career_experience_employment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.career_experience_employment_types_id_seq OWNED BY public.career_experience_employment_types.id;


--
-- Name: career_experience_industry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.career_experience_industry (
    id bigint NOT NULL,
    career_experience_id integer,
    industry_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.career_experience_industry OWNER TO postgres;

--
-- Name: career_experience_industry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.career_experience_industry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.career_experience_industry_id_seq OWNER TO postgres;

--
-- Name: career_experience_industry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.career_experience_industry_id_seq OWNED BY public.career_experience_industry.id;


--
-- Name: career_experience_system_experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.career_experience_system_experiences (
    id bigint NOT NULL,
    career_experience_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    system_experience_id integer
);


ALTER TABLE public.career_experience_system_experiences OWNER TO postgres;

--
-- Name: career_experience_system_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.career_experience_system_experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.career_experience_system_experiences_id_seq OWNER TO postgres;

--
-- Name: career_experience_system_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.career_experience_system_experiences_id_seq OWNED BY public.career_experience_system_experiences.id;


--
-- Name: career_experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.career_experiences (
    id bigint NOT NULL,
    job_title character varying,
    start_date date,
    end_date date,
    company_name character varying,
    description text,
    add_key_achievements character varying[] DEFAULT '{}'::character varying[],
    make_key_achievements_public boolean DEFAULT false NOT NULL,
    profile_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    current_salary numeric DEFAULT 0.0,
    notice_period text,
    notice_period_end_date date,
    currently_working_here boolean DEFAULT false
);


ALTER TABLE public.career_experiences OWNER TO postgres;

--
-- Name: career_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.career_experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.career_experiences_id_seq OWNER TO postgres;

--
-- Name: career_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.career_experiences_id_seq OWNED BY public.career_experiences.id;


--
-- Name: careers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.careers (
    id bigint NOT NULL,
    profession character varying,
    is_current boolean DEFAULT false,
    experience_from character varying,
    experience_to character varying,
    payscale character varying,
    company_name character varying,
    accomplishment character varying[],
    sector integer,
    profile_bio_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.careers OWNER TO postgres;

--
-- Name: careers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.careers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.careers_id_seq OWNER TO postgres;

--
-- Name: careers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.careers_id_seq OWNED BY public.careers.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    admin_user_id integer,
    rank integer,
    light_icon character varying,
    light_icon_active character varying,
    light_icon_inactive character varying,
    dark_icon character varying,
    dark_icon_active character varying,
    dark_icon_inactive character varying,
    identifier integer
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categories_sub_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories_sub_categories (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    sub_category_id bigint NOT NULL
);


ALTER TABLE public.categories_sub_categories OWNER TO postgres;

--
-- Name: categories_sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_sub_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_sub_categories_id_seq OWNER TO postgres;

--
-- Name: categories_sub_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_sub_categories_id_seq OWNED BY public.categories_sub_categories.id;


--
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_messages (
    id bigint NOT NULL,
    account_id bigint,
    chat_id bigint,
    message character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.chat_messages OWNER TO postgres;

--
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_messages_id_seq OWNER TO postgres;

--
-- Name: chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_messages_id_seq OWNED BY public.chat_messages.id;


--
-- Name: chats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chats (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    recipient_id integer,
    sender_id integer
);


ALTER TABLE public.chats OWNER TO postgres;

--
-- Name: chats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chats_id_seq OWNER TO postgres;

--
-- Name: chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chats_id_seq OWNED BY public.chats.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    account_id bigint,
    post_id bigint,
    comment text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    comment_id integer
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: connections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.connections (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    receipient_id integer,
    status character varying DEFAULT 'pending'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    follow boolean DEFAULT false
);


ALTER TABLE public.connections OWNER TO postgres;

--
-- Name: connections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.connections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connections_id_seq OWNER TO postgres;

--
-- Name: connections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.connections_id_seq OWNED BY public.connections.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id bigint NOT NULL,
    account_id bigint,
    name character varying,
    email character varying,
    phone_number character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    subject character varying,
    message text
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: content_texts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_texts (
    id bigint NOT NULL,
    headline character varying,
    content character varying,
    hyperlink character varying,
    affiliation character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.content_texts OWNER TO postgres;

--
-- Name: content_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.content_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_texts_id_seq OWNER TO postgres;

--
-- Name: content_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.content_texts_id_seq OWNED BY public.content_texts.id;


--
-- Name: content_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_types (
    id bigint NOT NULL,
    name character varying,
    type integer,
    identifier integer,
    rank integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.content_types OWNER TO postgres;

--
-- Name: content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_types_id_seq OWNER TO postgres;

--
-- Name: content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.content_types_id_seq OWNED BY public.content_types.id;


--
-- Name: content_videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_videos (
    id bigint NOT NULL,
    separate_section character varying,
    headline character varying,
    description character varying,
    thumbnails character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.content_videos OWNER TO postgres;

--
-- Name: content_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.content_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_videos_id_seq OWNER TO postgres;

--
-- Name: content_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.content_videos_id_seq OWNED BY public.content_videos.id;


--
-- Name: contents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contents (
    id bigint NOT NULL,
    sub_category_id integer,
    category_id integer,
    content_type_id integer,
    language_id integer,
    status integer,
    publish_date timestamp without time zone,
    archived boolean DEFAULT false,
    feature_article boolean,
    feature_video boolean,
    searchable_text character varying,
    review_status integer,
    feedback character varying,
    admin_user_id integer,
    view_count bigint DEFAULT 0,
    contentable_type character varying,
    contentable_id bigint,
    author_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.contents OWNER TO postgres;

--
-- Name: contents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contents_id_seq OWNER TO postgres;

--
-- Name: contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contents_id_seq OWNED BY public.contents.id;


--
-- Name: contents_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contents_languages (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    language_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.contents_languages OWNER TO postgres;

--
-- Name: contents_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contents_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contents_languages_id_seq OWNER TO postgres;

--
-- Name: contents_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contents_languages_id_seq OWNED BY public.contents_languages.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    course_name character varying,
    duration character varying,
    year character varying,
    profile_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: cta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cta (
    id bigint NOT NULL,
    headline character varying,
    description text,
    category_id bigint,
    long_background_image character varying,
    square_background_image character varying,
    button_text character varying,
    redirect_url character varying,
    text_alignment integer,
    button_alignment integer,
    is_square_cta boolean,
    is_long_rectangle_cta boolean,
    is_text_cta boolean,
    is_image_cta boolean,
    has_button boolean,
    visible_on_home_page boolean,
    visible_on_details_page boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cta OWNER TO postgres;

--
-- Name: cta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cta_id_seq OWNER TO postgres;

--
-- Name: cta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cta_id_seq OWNED BY public.cta.id;


--
-- Name: current_annual_salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_annual_salaries (
    id bigint NOT NULL,
    current_annual_salary character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.current_annual_salaries OWNER TO postgres;

--
-- Name: current_annual_salaries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_annual_salaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_annual_salaries_id_seq OWNER TO postgres;

--
-- Name: current_annual_salaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_annual_salaries_id_seq OWNED BY public.current_annual_salaries.id;


--
-- Name: current_annual_salary_current_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_annual_salary_current_status (
    id bigint NOT NULL,
    current_status_id integer,
    current_annual_salary_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.current_annual_salary_current_status OWNER TO postgres;

--
-- Name: current_annual_salary_current_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_annual_salary_current_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_annual_salary_current_status_id_seq OWNER TO postgres;

--
-- Name: current_annual_salary_current_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_annual_salary_current_status_id_seq OWNED BY public.current_annual_salary_current_status.id;


--
-- Name: current_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_status (
    id bigint NOT NULL,
    most_recent_job_title character varying,
    company_name character varying,
    notice_period text,
    end_date date,
    profile_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.current_status OWNER TO postgres;

--
-- Name: current_status_employment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_status_employment_types (
    id bigint NOT NULL,
    current_status_id integer,
    employment_type_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.current_status_employment_types OWNER TO postgres;

--
-- Name: current_status_employment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_status_employment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_status_employment_types_id_seq OWNER TO postgres;

--
-- Name: current_status_employment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_status_employment_types_id_seq OWNED BY public.current_status_employment_types.id;


--
-- Name: current_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_status_id_seq OWNER TO postgres;

--
-- Name: current_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_status_id_seq OWNED BY public.current_status.id;


--
-- Name: current_status_industries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_status_industries (
    id bigint NOT NULL,
    current_status_id integer,
    industry_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.current_status_industries OWNER TO postgres;

--
-- Name: current_status_industries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_status_industries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_status_industries_id_seq OWNER TO postgres;

--
-- Name: current_status_industries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_status_industries_id_seq OWNED BY public.current_status_industries.id;


--
-- Name: degree_educational_qualifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.degree_educational_qualifications (
    id bigint NOT NULL,
    educational_qualification_id integer,
    degree_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.degree_educational_qualifications OWNER TO postgres;

--
-- Name: degree_educational_qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.degree_educational_qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.degree_educational_qualifications_id_seq OWNER TO postgres;

--
-- Name: degree_educational_qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.degree_educational_qualifications_id_seq OWNED BY public.degree_educational_qualifications.id;


--
-- Name: degrees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.degrees (
    id bigint NOT NULL,
    degree_name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.degrees OWNER TO postgres;

--
-- Name: degrees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.degrees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.degrees_id_seq OWNER TO postgres;

--
-- Name: degrees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.degrees_id_seq OWNED BY public.degrees.id;


--
-- Name: educational_qualification_field_study; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.educational_qualification_field_study (
    id bigint NOT NULL,
    educational_qualification_id integer,
    field_study_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.educational_qualification_field_study OWNER TO postgres;

--
-- Name: educational_qualification_field_study_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.educational_qualification_field_study_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.educational_qualification_field_study_id_seq OWNER TO postgres;

--
-- Name: educational_qualification_field_study_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.educational_qualification_field_study_id_seq OWNED BY public.educational_qualification_field_study.id;


--
-- Name: educational_qualifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.educational_qualifications (
    id bigint NOT NULL,
    school_name character varying,
    start_date date,
    end_date date,
    grades character varying,
    description text,
    make_grades_public boolean DEFAULT false NOT NULL,
    profile_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.educational_qualifications OWNER TO postgres;

--
-- Name: educational_qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.educational_qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.educational_qualifications_id_seq OWNER TO postgres;

--
-- Name: educational_qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.educational_qualifications_id_seq OWNED BY public.educational_qualifications.id;


--
-- Name: educations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.educations (
    id bigint NOT NULL,
    qualification character varying,
    profile_bio_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    year_from character varying,
    year_to character varying,
    description text
);


ALTER TABLE public.educations OWNER TO postgres;

--
-- Name: educations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.educations_id_seq OWNER TO postgres;

--
-- Name: educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.educations_id_seq OWNED BY public.educations.id;


--
-- Name: email_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_notifications (
    id bigint NOT NULL,
    notification_id bigint NOT NULL,
    send_to_email character varying,
    sent_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.email_notifications OWNER TO postgres;

--
-- Name: email_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_notifications_id_seq OWNER TO postgres;

--
-- Name: email_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_notifications_id_seq OWNED BY public.email_notifications.id;


--
-- Name: email_otps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_otps (
    id bigint NOT NULL,
    email character varying,
    pin integer,
    activated boolean DEFAULT false NOT NULL,
    valid_until timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.email_otps OWNER TO postgres;

--
-- Name: email_otps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_otps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_otps_id_seq OWNER TO postgres;

--
-- Name: email_otps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_otps_id_seq OWNED BY public.email_otps.id;


--
-- Name: employment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employment_types (
    id bigint NOT NULL,
    employment_type_name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.employment_types OWNER TO postgres;

--
-- Name: employment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employment_types_id_seq OWNER TO postgres;

--
-- Name: employment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employment_types_id_seq OWNED BY public.employment_types.id;


--
-- Name: epubs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.epubs (
    id bigint NOT NULL,
    heading character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.epubs OWNER TO postgres;

--
-- Name: epubs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.epubs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epubs_id_seq OWNER TO postgres;

--
-- Name: epubs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.epubs_id_seq OWNED BY public.epubs.id;


--
-- Name: exams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exams (
    id bigint NOT NULL,
    heading character varying,
    description text,
    "to" date,
    "from" date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.exams OWNER TO postgres;

--
-- Name: exams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exams_id_seq OWNER TO postgres;

--
-- Name: exams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exams_id_seq OWNED BY public.exams.id;


--
-- Name: favourites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favourites (
    id bigint NOT NULL,
    favourite_by_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    favouriteable_id integer,
    favouriteable_type character varying
);


ALTER TABLE public.favourites OWNER TO postgres;

--
-- Name: favourites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favourites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favourites_id_seq OWNER TO postgres;

--
-- Name: favourites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favourites_id_seq OWNED BY public.favourites.id;


--
-- Name: field_study; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.field_study (
    id bigint NOT NULL,
    field_of_study character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.field_study OWNER TO postgres;

--
-- Name: field_study_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.field_study_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.field_study_id_seq OWNER TO postgres;

--
-- Name: field_study_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.field_study_id_seq OWNED BY public.field_study.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.follows (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    current_user_id bigint
);


ALTER TABLE public.follows OWNER TO postgres;

--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.follows_id_seq OWNER TO postgres;

--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


--
-- Name: global_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_settings (
    id bigint NOT NULL,
    notice_period character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    token_valid_days integer
);


ALTER TABLE public.global_settings OWNER TO postgres;

--
-- Name: global_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.global_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.global_settings_id_seq OWNER TO postgres;

--
-- Name: global_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.global_settings_id_seq OWNED BY public.global_settings.id;


--
-- Name: hobbies_and_interests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hobbies_and_interests (
    id bigint NOT NULL,
    title character varying,
    category character varying,
    description text,
    make_public boolean DEFAULT false NOT NULL,
    profile_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.hobbies_and_interests OWNER TO postgres;

--
-- Name: hobbies_and_interests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hobbies_and_interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hobbies_and_interests_id_seq OWNER TO postgres;

--
-- Name: hobbies_and_interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hobbies_and_interests_id_seq OWNED BY public.hobbies_and_interests.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id bigint NOT NULL,
    attached_item_id integer,
    attached_item_type character varying,
    image character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: industries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.industries (
    id bigint NOT NULL,
    industry_name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.industries OWNER TO postgres;

--
-- Name: industries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.industries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.industries_id_seq OWNER TO postgres;

--
-- Name: industries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.industries_id_seq OWNED BY public.industries.id;


--
-- Name: interactive_faqs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interactive_faqs (
    id bigint NOT NULL,
    question character varying,
    answer text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.interactive_faqs OWNER TO postgres;

--
-- Name: interactive_faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interactive_faqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interactive_faqs_id_seq OWNER TO postgres;

--
-- Name: interactive_faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interactive_faqs_id_seq OWNED BY public.interactive_faqs.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id bigint NOT NULL,
    language character varying,
    proficiency character varying,
    profile_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    id bigint NOT NULL,
    like_by_id integer,
    likeable_type character varying NOT NULL,
    likeable_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: live_streams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.live_streams (
    id bigint NOT NULL,
    headline character varying,
    description character varying,
    comment_section character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.live_streams OWNER TO postgres;

--
-- Name: live_streams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.live_streams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.live_streams_id_seq OWNER TO postgres;

--
-- Name: live_streams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.live_streams_id_seq OWNED BY public.live_streams.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    latitude double precision,
    longitude double precision,
    van_id integer,
    address text,
    locationable_type character varying NOT NULL,
    locationable_id bigint NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    id bigint NOT NULL,
    imageable_type character varying,
    imageable_id character varying,
    file_name character varying,
    file_size character varying,
    presigned_url character varying,
    status integer,
    category character varying
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: nfts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nfts (
    id bigint NOT NULL,
    asset_id character varying,
    token_id character varying,
    owner_id character varying,
    name character varying,
    description character varying,
    image_url character varying,
    image_preview_url character varying,
    image_thumbnail_url character varying,
    image_original_url character varying,
    animation_url character varying,
    animation_original_url character varying,
    external_link character varying,
    asset_contract_address character varying,
    permalink character varying,
    asset_details jsonb,
    wallet_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    account_id bigint,
    usd_amount double precision,
    eth_amount double precision
);


ALTER TABLE public.nfts OWNER TO postgres;

--
-- Name: nfts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nfts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nfts_id_seq OWNER TO postgres;

--
-- Name: nfts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nfts_id_seq OWNED BY public.nfts.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    created_by integer,
    headings character varying,
    contents character varying,
    app_url character varying,
    is_read boolean DEFAULT false,
    read_at timestamp without time zone,
    account_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    sender_id integer,
    post_id character varying,
    connection_id integer
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: pdfs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pdfs (
    id bigint NOT NULL,
    attached_item_id integer,
    attached_item_type character varying,
    pdf character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pdfs OWNER TO postgres;

--
-- Name: pdfs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pdfs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pdfs_id_seq OWNER TO postgres;

--
-- Name: pdfs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pdfs_id_seq OWNED BY public.pdfs.id;


--
-- Name: photo_libraries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photo_libraries (
    id bigint NOT NULL,
    photo character varying,
    caption character varying,
    account_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.photo_libraries OWNER TO postgres;

--
-- Name: photo_libraries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photo_libraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_libraries_id_seq OWNER TO postgres;

--
-- Name: photo_libraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photo_libraries_id_seq OWNED BY public.photo_libraries.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    account_id integer,
    token_id character varying,
    owner_id character varying,
    nft_name character varying,
    nft_description character varying,
    image_url character varying,
    image_preview_url character varying,
    image_thumbnail_url character varying,
    image_original_url character varying,
    animation_url character varying,
    animation_original_url character varying,
    external_link character varying,
    asset_details jsonb,
    usd_amount double precision,
    eth_amount double precision,
    virality_score integer,
    recent_update timestamp without time zone
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preferences (
    id bigint NOT NULL,
    seeking integer,
    discover_people character varying[],
    location text,
    distance integer,
    height_type integer,
    body_type integer,
    religion integer,
    smoking integer,
    drinking integer,
    profile_bio_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    friend boolean DEFAULT false,
    business boolean DEFAULT false,
    match_making boolean DEFAULT false,
    travel_partner boolean DEFAULT false,
    cross_path boolean DEFAULT false,
    age_range_start integer,
    age_range_end integer,
    height_range_start character varying,
    height_range_end character varying,
    account_id integer
);


ALTER TABLE public.preferences OWNER TO postgres;

--
-- Name: preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.preferences_id_seq OWNER TO postgres;

--
-- Name: preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.preferences_id_seq OWNED BY public.preferences.id;


--
-- Name: previously_owned_nfts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.previously_owned_nfts (
    id bigint NOT NULL,
    token_id character varying,
    owner_id character varying,
    name character varying,
    description character varying,
    image_url character varying,
    image_preview_url character varying,
    image_thumbnail_url character varying,
    image_original_url character varying,
    animation_url character varying,
    animation_original_url character varying,
    external_link character varying,
    asset_contract_address character varying,
    permalink character varying,
    asset_details jsonb,
    usd_amount double precision,
    eth_amount double precision,
    wallet_id bigint NOT NULL,
    account_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.previously_owned_nfts OWNER TO postgres;

--
-- Name: previously_owned_nfts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.previously_owned_nfts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.previously_owned_nfts_id_seq OWNER TO postgres;

--
-- Name: previously_owned_nfts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.previously_owned_nfts_id_seq OWNED BY public.previously_owned_nfts.id;


--
-- Name: privacy_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privacy_policies (
    id bigint NOT NULL,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.privacy_policies OWNER TO postgres;

--
-- Name: privacy_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.privacy_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.privacy_policies_id_seq OWNER TO postgres;

--
-- Name: privacy_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.privacy_policies_id_seq OWNED BY public.privacy_policies.id;


--
-- Name: privacy_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privacy_settings (
    id bigint NOT NULL,
    account_id integer,
    latest_activity boolean DEFAULT true,
    older_activity boolean DEFAULT false,
    in_app_notification boolean DEFAULT true,
    chat_notification boolean DEFAULT true,
    friend_request boolean DEFAULT true,
    interest_received boolean DEFAULT true,
    viewed_profile boolean DEFAULT true,
    off_all_notification boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.privacy_settings OWNER TO postgres;

--
-- Name: privacy_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.privacy_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.privacy_settings_id_seq OWNER TO postgres;

--
-- Name: privacy_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.privacy_settings_id_seq OWNED BY public.privacy_settings.id;


--
-- Name: profile_bios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_bios (
    id bigint NOT NULL,
    account_id integer,
    height character varying,
    weight character varying,
    height_type integer,
    weight_type integer,
    body_type integer,
    mother_tougue integer,
    religion integer,
    zodiac integer,
    marital_status integer,
    languages character varying[],
    about_me text,
    personality character varying[],
    interests character varying[],
    smoking integer,
    drinking integer,
    looking_for integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    about_business text
);


ALTER TABLE public.profile_bios OWNER TO postgres;

--
-- Name: profile_bios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profile_bios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_bios_id_seq OWNER TO postgres;

--
-- Name: profile_bios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profile_bios_id_seq OWNED BY public.profile_bios.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id bigint NOT NULL,
    country character varying,
    address character varying,
    postal_code character varying,
    account_id integer,
    photo character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    profile_role integer,
    city character varying,
    about character varying,
    date_of_birth date,
    state character varying,
    mobile_number character varying
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO postgres;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    project_name character varying,
    start_date date,
    end_date date,
    add_members character varying,
    url character varying,
    description text,
    make_projects_public boolean DEFAULT false NOT NULL,
    profile_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: publication_patents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publication_patents (
    id bigint NOT NULL,
    title character varying,
    publication character varying,
    authors character varying,
    url character varying,
    description text,
    make_public boolean DEFAULT false NOT NULL,
    profile_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.publication_patents OWNER TO postgres;

--
-- Name: publication_patents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publication_patents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publication_patents_id_seq OWNER TO postgres;

--
-- Name: publication_patents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publication_patents_id_seq OWNED BY public.publication_patents.id;


--
-- Name: push_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.push_notifications (
    id bigint NOT NULL,
    account_id bigint,
    push_notificable_type character varying NOT NULL,
    push_notificable_id bigint NOT NULL,
    remarks character varying,
    is_read boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    notify_type character varying
);


ALTER TABLE public.push_notifications OWNER TO postgres;

--
-- Name: push_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.push_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.push_notifications_id_seq OWNER TO postgres;

--
-- Name: push_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.push_notifications_id_seq OWNED BY public.push_notifications.id;


--
-- Name: question_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_answers (
    id bigint NOT NULL,
    question character varying,
    answer text,
    question_sub_type_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_answers OWNER TO postgres;

--
-- Name: question_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_answers_id_seq OWNER TO postgres;

--
-- Name: question_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_answers_id_seq OWNED BY public.question_answers.id;


--
-- Name: question_sub_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_sub_types (
    id bigint NOT NULL,
    sub_type character varying,
    description text,
    question_type_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_sub_types OWNER TO postgres;

--
-- Name: question_sub_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_sub_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_sub_types_id_seq OWNER TO postgres;

--
-- Name: question_sub_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_sub_types_id_seq OWNED BY public.question_sub_types.id;


--
-- Name: question_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_types (
    id bigint NOT NULL,
    que_type character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_types OWNER TO postgres;

--
-- Name: question_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_types_id_seq OWNER TO postgres;

--
-- Name: question_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_types_id_seq OWNED BY public.question_types.id;


--
-- Name: report_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_posts (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    post_id bigint NOT NULL,
    report_reason_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.report_posts OWNER TO postgres;

--
-- Name: report_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_posts_id_seq OWNER TO postgres;

--
-- Name: report_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_posts_id_seq OWNED BY public.report_posts.id;


--
-- Name: report_reasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_reasons (
    id bigint NOT NULL,
    content character varying,
    report_reason_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.report_reasons OWNER TO postgres;

--
-- Name: report_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_reasons_id_seq OWNER TO postgres;

--
-- Name: report_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_reasons_id_seq OWNED BY public.report_reasons.id;


--
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests (
    id bigint NOT NULL,
    account_id integer,
    sender_id integer,
    status integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.requests OWNER TO postgres;

--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requests_id_seq OWNER TO postgres;

--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requests_id_seq OWNED BY public.requests.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id bigint NOT NULL,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: search_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search_histories (
    id bigint NOT NULL,
    account_id bigint,
    search_params character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.search_histories OWNER TO postgres;

--
-- Name: search_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.search_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.search_histories_id_seq OWNER TO postgres;

--
-- Name: search_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.search_histories_id_seq OWNED BY public.search_histories.id;


--
-- Name: seller_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seller_accounts (
    id bigint NOT NULL,
    firm_name character varying,
    full_phone_number character varying,
    location text,
    country_code integer,
    phone_number bigint,
    gstin_number character varying,
    wholesaler boolean,
    retailer boolean,
    manufacturer boolean,
    hallmarking_center boolean,
    buy_gold double precision,
    buy_silver double precision,
    sell_gold double precision,
    sell_silver double precision,
    deal_in character varying[] DEFAULT '{}'::character varying[],
    about_us text,
    activated boolean DEFAULT false NOT NULL,
    account_id bigint NOT NULL,
    lat numeric(10,6),
    long numeric(10,6),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.seller_accounts OWNER TO postgres;

--
-- Name: seller_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seller_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seller_accounts_id_seq OWNER TO postgres;

--
-- Name: seller_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seller_accounts_id_seq OWNED BY public.seller_accounts.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    title character varying,
    name character varying
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: sms_otps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sms_otps (
    id bigint NOT NULL,
    full_phone_number character varying,
    pin integer,
    activated boolean DEFAULT false NOT NULL,
    valid_until timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.sms_otps OWNER TO postgres;

--
-- Name: sms_otps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sms_otps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sms_otps_id_seq OWNER TO postgres;

--
-- Name: sms_otps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sms_otps_id_seq OWNED BY public.sms_otps.id;


--
-- Name: social_media_shares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_media_shares (
    id bigint NOT NULL,
    account_id integer,
    is_whatsapp_shared boolean DEFAULT false,
    is_facebook_shared boolean DEFAULT false,
    is_twitter_shared boolean DEFAULT false,
    is_instagram_shared boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.social_media_shares OWNER TO postgres;

--
-- Name: social_media_shares_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_media_shares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_media_shares_id_seq OWNER TO postgres;

--
-- Name: social_media_shares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_media_shares_id_seq OWNED BY public.social_media_shares.id;


--
-- Name: sub_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    parent_id bigint,
    rank integer
);


ALTER TABLE public.sub_categories OWNER TO postgres;

--
-- Name: sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sub_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_categories_id_seq OWNER TO postgres;

--
-- Name: sub_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sub_categories_id_seq OWNED BY public.sub_categories.id;


--
-- Name: system_experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_experiences (
    id bigint NOT NULL,
    system_experience character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.system_experiences OWNER TO postgres;

--
-- Name: system_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.system_experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_experiences_id_seq OWNER TO postgres;

--
-- Name: system_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.system_experiences_id_seq OWNED BY public.system_experiences.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_type character varying,
    taggable_id integer,
    tagger_type character varying,
    tagger_id integer,
    context character varying(128),
    created_at timestamp without time zone
);


ALTER TABLE public.taggings OWNER TO postgres;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taggings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggings_id_seq OWNER TO postgres;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taggings_id_seq OWNED BY public.taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    taggings_count integer DEFAULT 0
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: terms_and_conditions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terms_and_conditions (
    id bigint NOT NULL,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.terms_and_conditions OWNER TO postgres;

--
-- Name: terms_and_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terms_and_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terms_and_conditions_id_seq OWNER TO postgres;

--
-- Name: terms_and_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terms_and_conditions_id_seq OWNED BY public.terms_and_conditions.id;


--
-- Name: test_score_and_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test_score_and_courses (
    id bigint NOT NULL,
    title character varying,
    associated_with character varying,
    score character varying,
    test_date timestamp without time zone,
    description text,
    make_public boolean DEFAULT false NOT NULL,
    profile_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.test_score_and_courses OWNER TO postgres;

--
-- Name: test_score_and_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.test_score_and_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_score_and_courses_id_seq OWNER TO postgres;

--
-- Name: test_score_and_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_score_and_courses_id_seq OWNED BY public.test_score_and_courses.id;


--
-- Name: tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tests (
    id bigint NOT NULL,
    description text,
    headline character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.tests OWNER TO postgres;

--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tests_id_seq OWNER TO postgres;

--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;


--
-- Name: user_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_categories (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    category_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_categories OWNER TO postgres;

--
-- Name: user_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_categories_id_seq OWNER TO postgres;

--
-- Name: user_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_categories_id_seq OWNED BY public.user_categories.id;


--
-- Name: user_sub_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_sub_categories (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    sub_category_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_sub_categories OWNER TO postgres;

--
-- Name: user_sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_sub_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_sub_categories_id_seq OWNER TO postgres;

--
-- Name: user_sub_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_sub_categories_id_seq OWNED BY public.user_sub_categories.id;


--
-- Name: van_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.van_members (
    id bigint NOT NULL,
    account_id integer,
    van_id integer
);


ALTER TABLE public.van_members OWNER TO postgres;

--
-- Name: van_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.van_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.van_members_id_seq OWNER TO postgres;

--
-- Name: van_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.van_members_id_seq OWNED BY public.van_members.id;


--
-- Name: vans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vans (
    id bigint NOT NULL,
    name character varying,
    bio text,
    is_offline boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.vans OWNER TO postgres;

--
-- Name: vans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vans_id_seq OWNER TO postgres;

--
-- Name: vans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vans_id_seq OWNED BY public.vans.id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.videos (
    id bigint NOT NULL,
    attached_item_id integer,
    attached_item_type character varying,
    video character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.videos OWNER TO postgres;

--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videos_id_seq OWNER TO postgres;

--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.videos_id_seq OWNED BY public.videos.id;


--
-- Name: view_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.view_profiles (
    id bigint NOT NULL,
    profile_bio_id integer,
    view_by_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    account_id integer
);


ALTER TABLE public.view_profiles OWNER TO postgres;

--
-- Name: view_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.view_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.view_profiles_id_seq OWNER TO postgres;

--
-- Name: view_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.view_profiles_id_seq OWNED BY public.view_profiles.id;


--
-- Name: wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallets (
    id bigint NOT NULL,
    wallet_type integer DEFAULT 0,
    address character varying,
    account_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.wallets OWNER TO postgres;

--
-- Name: wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallets_id_seq OWNER TO postgres;

--
-- Name: wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallets_id_seq OWNED BY public.wallets.id;


--
-- Name: account_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_categories ALTER COLUMN id SET DEFAULT nextval('public.account_categories_id_seq'::regclass);


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: accounts_chats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_chats ALTER COLUMN id SET DEFAULT nextval('public.accounts_chats_id_seq'::regclass);


--
-- Name: achievements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements ALTER COLUMN id SET DEFAULT nextval('public.achievements_id_seq'::regclass);


--
-- Name: action_mailbox_inbound_emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_mailbox_inbound_emails ALTER COLUMN id SET DEFAULT nextval('public.action_mailbox_inbound_emails_id_seq'::regclass);


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: advertisements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advertisements ALTER COLUMN id SET DEFAULT nextval('public.advertisements_id_seq'::regclass);


--
-- Name: application_message_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_message_translations ALTER COLUMN id SET DEFAULT nextval('public.application_message_translations_id_seq'::regclass);


--
-- Name: application_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_messages ALTER COLUMN id SET DEFAULT nextval('public.application_messages_id_seq'::regclass);


--
-- Name: associated_projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_projects ALTER COLUMN id SET DEFAULT nextval('public.associated_projects_id_seq'::regclass);


--
-- Name: associateds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associateds ALTER COLUMN id SET DEFAULT nextval('public.associateds_id_seq'::regclass);


--
-- Name: audio_podcasts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audio_podcasts ALTER COLUMN id SET DEFAULT nextval('public.audio_podcasts_id_seq'::regclass);


--
-- Name: audios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audios ALTER COLUMN id SET DEFAULT nextval('public.audios_id_seq'::regclass);


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: availabilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availabilities ALTER COLUMN id SET DEFAULT nextval('public.availabilities_id_seq'::regclass);


--
-- Name: awards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards ALTER COLUMN id SET DEFAULT nextval('public.awards_id_seq'::regclass);


--
-- Name: black_list_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.black_list_users ALTER COLUMN id SET DEFAULT nextval('public.black_list_users_id_seq'::regclass);


--
-- Name: block_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users ALTER COLUMN id SET DEFAULT nextval('public.block_users_id_seq'::regclass);


--
-- Name: bookmarks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks ALTER COLUMN id SET DEFAULT nextval('public.bookmarks_id_seq'::regclass);


--
-- Name: bx_block_appointment_management_booked_slots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bx_block_appointment_management_booked_slots ALTER COLUMN id SET DEFAULT nextval('public.bx_block_appointment_management_booked_slots_id_seq'::regclass);


--
-- Name: career_experience_employment_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_experience_employment_types ALTER COLUMN id SET DEFAULT nextval('public.career_experience_employment_types_id_seq'::regclass);


--
-- Name: career_experience_industry id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_experience_industry ALTER COLUMN id SET DEFAULT nextval('public.career_experience_industry_id_seq'::regclass);


--
-- Name: career_experience_system_experiences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_experience_system_experiences ALTER COLUMN id SET DEFAULT nextval('public.career_experience_system_experiences_id_seq'::regclass);


--
-- Name: career_experiences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_experiences ALTER COLUMN id SET DEFAULT nextval('public.career_experiences_id_seq'::regclass);


--
-- Name: careers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.careers ALTER COLUMN id SET DEFAULT nextval('public.careers_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: categories_sub_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_sub_categories ALTER COLUMN id SET DEFAULT nextval('public.categories_sub_categories_id_seq'::regclass);


--
-- Name: chat_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages ALTER COLUMN id SET DEFAULT nextval('public.chat_messages_id_seq'::regclass);


--
-- Name: chats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats ALTER COLUMN id SET DEFAULT nextval('public.chats_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: connections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connections ALTER COLUMN id SET DEFAULT nextval('public.connections_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: content_texts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_texts ALTER COLUMN id SET DEFAULT nextval('public.content_texts_id_seq'::regclass);


--
-- Name: content_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_types ALTER COLUMN id SET DEFAULT nextval('public.content_types_id_seq'::regclass);


--
-- Name: content_videos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_videos ALTER COLUMN id SET DEFAULT nextval('public.content_videos_id_seq'::regclass);


--
-- Name: contents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents ALTER COLUMN id SET DEFAULT nextval('public.contents_id_seq'::regclass);


--
-- Name: contents_languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents_languages ALTER COLUMN id SET DEFAULT nextval('public.contents_languages_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: cta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cta ALTER COLUMN id SET DEFAULT nextval('public.cta_id_seq'::regclass);


--
-- Name: current_annual_salaries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_annual_salaries ALTER COLUMN id SET DEFAULT nextval('public.current_annual_salaries_id_seq'::regclass);


--
-- Name: current_annual_salary_current_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_annual_salary_current_status ALTER COLUMN id SET DEFAULT nextval('public.current_annual_salary_current_status_id_seq'::regclass);


--
-- Name: current_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_status ALTER COLUMN id SET DEFAULT nextval('public.current_status_id_seq'::regclass);


--
-- Name: current_status_employment_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_status_employment_types ALTER COLUMN id SET DEFAULT nextval('public.current_status_employment_types_id_seq'::regclass);


--
-- Name: current_status_industries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_status_industries ALTER COLUMN id SET DEFAULT nextval('public.current_status_industries_id_seq'::regclass);


--
-- Name: degree_educational_qualifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degree_educational_qualifications ALTER COLUMN id SET DEFAULT nextval('public.degree_educational_qualifications_id_seq'::regclass);


--
-- Name: degrees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degrees ALTER COLUMN id SET DEFAULT nextval('public.degrees_id_seq'::regclass);


--
-- Name: educational_qualification_field_study id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educational_qualification_field_study ALTER COLUMN id SET DEFAULT nextval('public.educational_qualification_field_study_id_seq'::regclass);


--
-- Name: educational_qualifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educational_qualifications ALTER COLUMN id SET DEFAULT nextval('public.educational_qualifications_id_seq'::regclass);


--
-- Name: educations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educations ALTER COLUMN id SET DEFAULT nextval('public.educations_id_seq'::regclass);


--
-- Name: email_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_notifications ALTER COLUMN id SET DEFAULT nextval('public.email_notifications_id_seq'::regclass);


--
-- Name: email_otps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_otps ALTER COLUMN id SET DEFAULT nextval('public.email_otps_id_seq'::regclass);


--
-- Name: employment_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employment_types ALTER COLUMN id SET DEFAULT nextval('public.employment_types_id_seq'::regclass);


--
-- Name: epubs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.epubs ALTER COLUMN id SET DEFAULT nextval('public.epubs_id_seq'::regclass);


--
-- Name: exams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams ALTER COLUMN id SET DEFAULT nextval('public.exams_id_seq'::regclass);


--
-- Name: favourites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites ALTER COLUMN id SET DEFAULT nextval('public.favourites_id_seq'::regclass);


--
-- Name: field_study id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.field_study ALTER COLUMN id SET DEFAULT nextval('public.field_study_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


--
-- Name: global_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_settings ALTER COLUMN id SET DEFAULT nextval('public.global_settings_id_seq'::regclass);


--
-- Name: hobbies_and_interests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hobbies_and_interests ALTER COLUMN id SET DEFAULT nextval('public.hobbies_and_interests_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: industries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries ALTER COLUMN id SET DEFAULT nextval('public.industries_id_seq'::regclass);


--
-- Name: interactive_faqs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactive_faqs ALTER COLUMN id SET DEFAULT nextval('public.interactive_faqs_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: live_streams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.live_streams ALTER COLUMN id SET DEFAULT nextval('public.live_streams_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: nfts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfts ALTER COLUMN id SET DEFAULT nextval('public.nfts_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: pdfs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pdfs ALTER COLUMN id SET DEFAULT nextval('public.pdfs_id_seq'::regclass);


--
-- Name: photo_libraries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo_libraries ALTER COLUMN id SET DEFAULT nextval('public.photo_libraries_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: preferences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preferences ALTER COLUMN id SET DEFAULT nextval('public.preferences_id_seq'::regclass);


--
-- Name: previously_owned_nfts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.previously_owned_nfts ALTER COLUMN id SET DEFAULT nextval('public.previously_owned_nfts_id_seq'::regclass);


--
-- Name: privacy_policies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies ALTER COLUMN id SET DEFAULT nextval('public.privacy_policies_id_seq'::regclass);


--
-- Name: privacy_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_settings ALTER COLUMN id SET DEFAULT nextval('public.privacy_settings_id_seq'::regclass);


--
-- Name: profile_bios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_bios ALTER COLUMN id SET DEFAULT nextval('public.profile_bios_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: publication_patents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publication_patents ALTER COLUMN id SET DEFAULT nextval('public.publication_patents_id_seq'::regclass);


--
-- Name: push_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications ALTER COLUMN id SET DEFAULT nextval('public.push_notifications_id_seq'::regclass);


--
-- Name: question_answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_answers ALTER COLUMN id SET DEFAULT nextval('public.question_answers_id_seq'::regclass);


--
-- Name: question_sub_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_sub_types ALTER COLUMN id SET DEFAULT nextval('public.question_sub_types_id_seq'::regclass);


--
-- Name: question_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_types ALTER COLUMN id SET DEFAULT nextval('public.question_types_id_seq'::regclass);


--
-- Name: report_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_posts ALTER COLUMN id SET DEFAULT nextval('public.report_posts_id_seq'::regclass);


--
-- Name: report_reasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_reasons ALTER COLUMN id SET DEFAULT nextval('public.report_reasons_id_seq'::regclass);


--
-- Name: requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests ALTER COLUMN id SET DEFAULT nextval('public.requests_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Name: search_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_histories ALTER COLUMN id SET DEFAULT nextval('public.search_histories_id_seq'::regclass);


--
-- Name: seller_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seller_accounts ALTER COLUMN id SET DEFAULT nextval('public.seller_accounts_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: sms_otps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sms_otps ALTER COLUMN id SET DEFAULT nextval('public.sms_otps_id_seq'::regclass);


--
-- Name: social_media_shares id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_media_shares ALTER COLUMN id SET DEFAULT nextval('public.social_media_shares_id_seq'::regclass);


--
-- Name: sub_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_categories ALTER COLUMN id SET DEFAULT nextval('public.sub_categories_id_seq'::regclass);


--
-- Name: system_experiences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_experiences ALTER COLUMN id SET DEFAULT nextval('public.system_experiences_id_seq'::regclass);


--
-- Name: taggings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggings ALTER COLUMN id SET DEFAULT nextval('public.taggings_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: terms_and_conditions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions ALTER COLUMN id SET DEFAULT nextval('public.terms_and_conditions_id_seq'::regclass);


--
-- Name: test_score_and_courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test_score_and_courses ALTER COLUMN id SET DEFAULT nextval('public.test_score_and_courses_id_seq'::regclass);


--
-- Name: tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);


--
-- Name: user_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_categories ALTER COLUMN id SET DEFAULT nextval('public.user_categories_id_seq'::regclass);


--
-- Name: user_sub_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sub_categories ALTER COLUMN id SET DEFAULT nextval('public.user_sub_categories_id_seq'::regclass);


--
-- Name: van_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.van_members ALTER COLUMN id SET DEFAULT nextval('public.van_members_id_seq'::regclass);


--
-- Name: vans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vans ALTER COLUMN id SET DEFAULT nextval('public.vans_id_seq'::regclass);


--
-- Name: videos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videos ALTER COLUMN id SET DEFAULT nextval('public.videos_id_seq'::regclass);


--
-- Name: view_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.view_profiles ALTER COLUMN id SET DEFAULT nextval('public.view_profiles_id_seq'::regclass);


--
-- Name: wallets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets ALTER COLUMN id SET DEFAULT nextval('public.wallets_id_seq'::regclass);


--
-- Data for Name: account_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_categories (id, account_id, category_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, first_name, last_name, full_phone_number, country_code, phone_number, email, activated, device_id, unique_auth_id, password_digest, type, created_at, updated_at, user_name, platform, user_type, app_language_id, last_visit_at, is_blacklisted, suspend_until, status, stripe_id, stripe_subscription_id, stripe_subscription_date, role_id, full_name, gender, date_of_birth, age, is_paid, notify_receive_request, notify_accept_request, notify_post_comment_reply, push_receive_request, push_accept_request, push_post_comment_reply, account_status, two_factor_auth, account_verified_date) FROM stdin;
38	arun	murugan		\N	\N	ujjavalbarot2+18@gmail.com	t	\N	JIAEZC0CSt586hsONTuqNwtt	$2a$12$w.amA93lX2w8Lkvxd7wKT.oDVF6eFqVnTQCCkzDZoMPbuyqyu1itK	EmailAccount	2021-10-27 04:17:09.286144	2021-12-23 11:16:44.397632	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
37	arun	murugan		\N	\N	ujjavalbarot2+17@gmail.com	t	\N	blOJE57T2NH0s6uGqAXLkgtt	$2a$12$/EsgdYC6jNQdrIAfsQ68w.1tWhhY6rZp5Oy/EqfVncm4sXHVor.pu	EmailAccount	2021-10-27 04:14:40.182559	2021-12-23 11:16:44.407513	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
36	arun	murugan		\N	\N	ujjavalbarot2+16@gmail.com	t	\N	FiWIME2vY3sOy5e1f5942Qtt	$2a$12$6VyKm9lLkjz0VabjXYsoxu/e3LPFltwF7PuamEwJYDZvquBbItv3C	EmailAccount	2021-10-27 04:12:36.759509	2021-12-23 11:16:44.479783	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
33	arun	murugan		\N	\N	ujjavalbarot2+14@gmail.com	t	\N	C0djY1rZCdfqu27yBp4sKAtt	$2a$12$589IadaYtQvoqnFuYkICOumSGBhrnpyN39NF5AmL./JmFx3bhRhXm	EmailAccount	2021-10-27 04:04:53.058394	2021-12-23 11:16:44.489301	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
28	arun	murugan		\N	\N	ujjavalbarot2+11@gmail.com	t	\N	1MrplARbzLSBNIrkwjLQzwtt	$2a$12$JXuYlOU51pmDx8Th4O5qPOViEQTokYBYy8Y7cUrGYzJStxjSZe1.a	EmailAccount	2021-10-26 14:30:46.187993	2021-12-23 11:16:44.497362	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
18	test	test		\N	\N	test8@gmail.com	t	\N	xxSTbZWVCQvzOtGP625NOAtt	$2a$12$U2Kxk1U5LyuEBDZR0b7giOBsqiUlb2uW.D9Ym8G2rJ28bndpJGVvm	EmailAccount	2021-10-26 11:00:33.580093	2021-12-23 11:16:44.590191	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
32	arun	murugan		\N	\N	ujjavalbarot2+13@gmail.com	t	\N	fnGNRPIs2a1UmekPmo3qCwtt	$2a$12$6V4np9LefvX6oOKMtGD3Se0vVW5vPvUKHT7k2ZDopBGMPCWOJqvIC	EmailAccount	2021-10-27 03:55:35.888492	2021-12-23 11:16:44.614881	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
34	arun	murugan		\N	\N	ujjavalbarot2+15@gmail.com	t	\N	w1tUuLoUnxPZOiQtNQuAPQtt	$2a$12$mHXdkk4UhZTc2q2geMKfteNelNHjProRpBq6lxwaiCTwtYBWPZ1Fu	EmailAccount	2021-10-27 04:06:48.686286	2021-12-23 11:16:43.716505	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
2	Firstname	Lastname	13105551212	1	3105551212	4ldb30l0vze@email.com	t	\N	1h8s5MU2QrO2nubT4l6h4Qtt	$2a$12$R6Yzqx0lgg8MX91Grggu3eZAVfBq0PRzxl3LJ4swwBEXv4RubkZBC	EmailAccount	2021-10-21 15:16:52.563518	2021-12-23 11:16:44.307576	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
1	\N	\N		\N	\N	v43icotkx8k@email.com	t	\N	B6w001CzO2GGgcxbFrdg7gtt	$2a$12$ZeInkhe6VLYUitfjH5kbTuLItpAIGezIWYQi8M96M0qmoTokwad16	EmailAccount	2021-10-21 15:15:57.889756	2021-12-23 11:16:44.379283	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
39	arun	murugan		\N	\N	ujjavalbarot2+19@gmail.com	t	\N	VGlnxdLghZoZf9fQYOBdvQtt	$2a$12$mDvti0kVVksUa12Rb.cmTOjtgcQ.mj2DDeLDBfIN5Y17xn6KS5fVa	EmailAccount	2021-10-27 04:41:35.086048	2021-12-23 11:16:44.389272	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
71	arun	murugan		\N	\N	ujjavalbarot2+50@gmail.com	t	\N	pkOVOe4qMfyoNJ4m9Hy6hgtt	$2a$12$IbzRA.t2kSYSbTD8i29aDeJyPPv/0GwLU3de999GFVzwr4/zrdJam	EmailAccount	2021-10-29 06:43:03.775512	2021-12-23 11:16:44.686349	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
70	arun	murugan		\N	\N	ujjavalbarot2+49@gmail.com	t	\N	vTH2USzbmEn03D6XReKSnQtt	$2a$12$6uhqN/ISGkVAaKL4yanel.xG8lXOpjRYhAgSisI45xc1/wKpICpXS	EmailAccount	2021-10-29 06:41:19.684364	2021-12-23 11:16:44.695116	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
69	arun	murugan		\N	\N	ujjavalbarot2+48@gmail.com	t	\N	fzauUTTrsOfmTFOG9y32mAtt	$2a$12$z0bAID3pdF4nc0a8SQO9J.UvChqKa/LO8n8r.ff82S95ldqK1wXFO	EmailAccount	2021-10-29 06:38:57.564589	2021-12-23 11:16:44.708502	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
68	arun	murugan		\N	\N	ujjavalbarot2+47@gmail.com	t	\N	I3IoWPIj7U5ajsreBcubIgtt	$2a$12$/NjKUDIULlDJYOPdEfOwsOTDd6YydScVLBACxL2zZgjI/L/0GHDoe	EmailAccount	2021-10-29 06:37:40.671045	2021-12-23 11:16:44.77722	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
67	arun	murugan		\N	\N	ujjavalbarot2+46@gmail.com	t	\N	MaCzGfXKFEYnC8lkeRZUhgtt	$2a$12$A0.EWUxOOBf4QVmxhBo3L.Ggom21hpY1MQifMAVZKo7ZE/Wk6Emnu	EmailAccount	2021-10-29 06:34:42.172782	2021-12-23 11:16:44.787397	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
66	arun	murugan		\N	\N	ujjavalbarot2+45@gmail.com	t	\N	PHm7yW48EZnjHxHDwLkVRAtt	$2a$12$.ErrkxuCsuF4VnzMnhYw.u1gTWI/GDj1poJF43m381PRmWQpsPCYS	EmailAccount	2021-10-29 06:32:50.357853	2021-12-23 11:16:44.797473	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
64	arun	murugan		\N	\N	ujjavalbarot2+43@gmail.com	t	\N	Xk3ezBFEQXdPDMFwJLk1lwtt	$2a$12$/yzieogx/Bp2YQEszRHDD.YnYcYXiwm98/iI9pBaeU3XBplX.P5uq	EmailAccount	2021-10-29 06:27:00.56341	2021-12-23 11:16:44.808763	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
63	arun	murugan		\N	\N	ujjavalbarot2+42@gmail.com	t	\N	Ti7MNYAB3KsajF67A6VnXQtt	$2a$12$feis9Xr9dZJC31LOLHvDnOFszg5BoXDrtw3xe.voZSCwd5D9DSeIq	EmailAccount	2021-10-29 06:19:41.270167	2021-12-23 11:16:44.819079	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
62	arun	murugan		\N	\N	ujjavalbarot2+41@gmail.com	t	\N	1cr4A7w6Mw8SbayRqp5YIAtt	$2a$12$hlpOq70GKmIuB1QjaUgVoOr.OvS5dnkovOXrv6Lu5PvtizAh22Zsi	EmailAccount	2021-10-29 06:18:53.960809	2021-12-23 11:16:44.883667	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
61	arun	murugan		\N	\N	ujjavalbarot2+40@gmail.com	t	\N	ZBOGhoZdKLSD264RIUI8QQtt	$2a$12$paJqC1CG20azlUJxSs9eSenIUFbHWqTeeyh9axNP8zPb7SkqViwdy	EmailAccount	2021-10-29 06:06:31.865358	2021-12-23 11:16:44.898225	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
60	arun	murugan		\N	\N	ujjavalbarot2+39@gmail.com	t	\N	B8R2ujzDKE8Pfr0lVWi0iwtt	$2a$12$Pf3wz4O.q.wJk3p.LghMRuIVi3SR9B6XT4d1kYjxyHPwaM4Y2Mbqy	EmailAccount	2021-10-29 06:04:59.361275	2021-12-23 11:16:44.911329	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
59	arun	murugan		\N	\N	ujjavalbarot2+38@gmail.com	t	\N	QLGWrPsokjpjpmAOreQ5KQtt	$2a$12$55Uok2CKl0aGEwf2c7v0cueSSpVNruxZzqEwH.o5OVOKzOky0AE1O	EmailAccount	2021-10-29 06:02:42.46846	2021-12-23 11:16:44.978475	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
58	arun	murugan		\N	\N	ujjavalbarot2+37@gmail.com	t	\N	UDrMQVZtO2VhzLcGQarK4gtt	$2a$12$hS.c0U5s7ndMrIfeMpegGe7NsdenSee7VtA2SzR/xfUe5VVBJMbx2	EmailAccount	2021-10-29 06:01:40.182211	2021-12-23 11:16:44.98776	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
57	arun	murugan		\N	\N	ujjavalbarot2+36@gmail.com	t	\N	8V8ibJE24nCyLmmDY3okrwtt	$2a$12$ikDY/wg/A4Tww12TkbC4U.3wCL9XNtealtvc/chGjiiA26b/ajKXa	EmailAccount	2021-10-29 05:56:03.861477	2021-12-23 11:16:45.00559	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
56	arun	murugan		\N	\N	ujjavalbarot2+35@gmail.com	t	\N	aJ3XnQsfT1QAj2tGiJnVFQtt	$2a$12$iRMIi8UNni7yFhuC8OZ0g.CbH59sLZ91LEvWSjJzcoN9kQ4f73PgC	EmailAccount	2021-10-29 05:50:50.381107	2021-12-23 11:16:45.015917	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
55	arun	murugan		\N	\N	ujjavalbarot2+34@gmail.com	t	\N	rWG4ggHRQsTUYnrFPGed7gtt	$2a$12$euEyPjmoZtpyCY363aDRPuHvU3IDEQJbn72kmcL0TJ5ngYTKXpqUi	EmailAccount	2021-10-29 04:34:34.975076	2021-12-23 11:16:45.082969	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
54	arun	murugan		\N	\N	ujjavalbarot2+33@gmail.com	t	\N	xqngBnoYUrzLtKfQDHJJ3gtt	$2a$12$II.o9OIAZ3ZD/LbP7lDKaOpqADq7HwIJmQtNWGoEJAQAbEZbUchma	EmailAccount	2021-10-29 03:35:33.565499	2021-12-23 11:16:45.093699	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
53	arun	murugan		\N	\N	ujjavalbarot2+32@gmail.com	t	\N	Cfl6Nu2ipPYAtfhDdRhysgtt	$2a$12$2Wq9WwB9T0/Ed6XwmxqcwehNJmsgUq35ph8ub7yuepqbmQSY3zh42	EmailAccount	2021-10-28 14:11:29.573689	2021-12-23 11:16:45.106295	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
52	arun	murugan		\N	\N	ujjavalbarot2+31@gmail.com	t	\N	otsvo26OeY3W8hZBbcI2Twtt	$2a$12$3Loc8eKix9t6ZurYy22RoeHruZd3WQV1Bcf/FlME2OLWCG5YiRE.K	EmailAccount	2021-10-28 14:06:53.182721	2021-12-23 11:16:45.179167	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
51	arun	murugan		\N	\N	ujjavalbarot2+30@gmail.com	t	\N	Z8VXDKzR8EXQYs19xafWdAtt	$2a$12$o9HEpfjQUfLGa0YxMZpTGeIE1K3SR8sWE2Mdh/KIEhjAwQQeIaBxq	EmailAccount	2021-10-28 06:29:46.584424	2021-12-23 11:16:45.188537	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
50	arun	murugan		\N	\N	ujjavalbarot2+28@gmail.com	t	\N	JYbO6jIXorQ2H9khbtSx1gtt	$2a$12$zSadcgKpwf5vF.jQ5RRSZOJFdLEtslbZeM547DBvdVQPVBQ5KRqmO	EmailAccount	2021-10-27 10:32:10.281275	2021-12-23 11:16:45.197353	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
49	arun	murugan		\N	\N	ujjavalbarot2+27@gmail.com	t	\N	29gTgY49mtYLIN7Cn2rXkQtt	$2a$12$P9/NTZezyz.pgbTJzsl7quRmuYfnL3ebNX2ztgcPd49vaHRTpNswG	EmailAccount	2021-10-27 10:31:19.574798	2021-12-23 11:16:45.219889	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
48	arun	murugan		\N	\N	ujjavalbarot2+26@gmail.com	t	\N	PpQUWOMhAt9jdD0btmQ9gQtt	$2a$12$VCCJ/Agyi86H4kX1RRq./ehGYCkOPPZyE.QMsA/VF.WMnDifBCPF2	EmailAccount	2021-10-27 10:30:24.970602	2021-12-23 11:16:45.230062	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
47	arun	murugan		\N	\N	ujjavalbarot2+25@gmail.com	t	\N	wgni8hIH3D4I90sqxbXJFQtt	$2a$12$4xV/hZlLjZ48pFYz5xFrc.tHxmkRy0Nx8SjyqSc9uN8dyDjbElmCS	EmailAccount	2021-10-27 10:28:54.089341	2021-12-23 11:16:45.28527	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
46	arun	murugan		\N	\N	ujjavalbarot2+24@gmail.com	t	\N	cL0rPxOhOsRv1URUROCyTAtt	$2a$12$.ygH7iplRVas.ecGDcySfugssKZPLpvVzbMiOYD8EWDoZiRLiditW	EmailAccount	2021-10-27 10:18:21.280778	2021-12-23 11:16:45.303543	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
45	arun	murugan		\N	\N	ujjavalbarot2+23@gmail.com	t	\N	y0ATQbCeFM82ZAyZ76zLmwtt	$2a$12$8xMkcJSXIYKcPZZIJFAeTuqN3rmQYTjRJri3HvIBAUWzliXz65aeq	EmailAccount	2021-10-27 10:14:57.680712	2021-12-23 11:16:45.315952	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
44	arun	murugan		\N	\N	ujjavalbarot2+22@gmail.com	t	\N	rYlbVL131rL7XxvK3toLsQtt	$2a$12$jW6KnZxceWR719xqRrhCg.LOx8Vw0wLvAMlHvdgV/Gj66MKJ3efYW	EmailAccount	2021-10-27 10:10:33.879362	2021-12-23 11:16:45.326458	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
76	arun	murugan		\N	\N	ujjavalbarot2+55@gmail.com	t	\N	Sl1yNdPwCNzsUGn3IOqKFAtt	$2a$12$WX.QrKZI5KrLZL1FhoSJ2eHF7fQ/E.jkLzFpyskdSNxbQR3w.FQVu	EmailAccount	2021-10-29 07:01:56.674787	2021-12-23 11:16:45.377209	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
75	arun	murugan		\N	\N	ujjavalbarot2+54@gmail.com	t	\N	qZFR7KAr8eanrybMgtT7qQtt	$2a$12$I3xL.sLrD0gCzcoBl84iR.KbtXXk6XaTRAf8cTbDjbB6BkYJ.ViMy	EmailAccount	2021-10-29 06:58:05.475648	2021-12-23 11:16:45.389802	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
74	arun	murugan		\N	\N	ujjavalbarot2+53@gmail.com	t	\N	9M8VqGgCtun6hrmfnPD7jwtt	$2a$12$0ClrdAi19ye596Hff7FJl.cOttArnPDnIqCq.5/KYbJV8zeRtAwpW	EmailAccount	2021-10-29 06:55:20.995438	2021-12-23 11:16:45.417203	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
73	arun	murugan		\N	\N	ujjavalbarot2+52@gmail.com	t	\N	MawnUV5tB5oJczS4pXTOlgtt	$2a$12$yit.BZQA.YQC8yGwnBahc.Ll/mk0GejX9w.R62Lop4n3mcTxqNUg2	EmailAccount	2021-10-29 06:50:41.471128	2021-12-23 11:16:45.486132	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
72	arun	murugan		\N	\N	ujjavalbarot2+51@gmail.com	t	\N	8Au2mHzwKLK98uAH2XvNYwtt	$2a$12$W0piG9NnBrTAXAu.RuqvBu3xu1PuZHOb.5aJ0dNjmRgfHG.M74.gu	EmailAccount	2021-10-29 06:47:45.057311	2021-12-23 11:16:45.495117	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
40	arun	murugan		\N	\N	ujjavalbarot2+20@gmail.com	t	\N	F01xnAZ7YrjbKWwlDIQXywtt	$2a$12$/anP1mtxwdJ.oVZQgbSKB.b6GER/KLM9w03bZ3onZ6hpkXwZWSTyq	EmailAccount	2021-10-27 04:43:50.870443	2021-12-23 11:16:44.676575	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
99	arun	murugan		\N	\N	ujjavalbarot2+78@gmail.com	t	\N	VpFaTCM45JeiklwYKBYKuQtt	$2a$12$vuR2gQenzKYYud63UTS5ZeU7D3CNM0arIY8wCuvCH9nrO/BDXOJ4a	EmailAccount	2021-10-29 10:38:25.460534	2021-12-23 11:16:45.514886	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
98	arun	murugan		\N	\N	ujjavalbarot2+77@gmail.com	t	\N	niHZfgEyXg7koGQQRGkCsgtt	$2a$12$4vU0.aUAHWwG06/VyykX6.bkZ.iXz2ycdlNn11NdaZMrFRFm7Jy6e	EmailAccount	2021-10-29 10:28:25.272696	2021-12-23 11:16:45.584221	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
97	arun	murugan		\N	\N	ujjavalbarot2+76@gmail.com	t	\N	IhJ8AtKtyGqNlDjiTSJynQtt	$2a$12$8O.EloE3IFunZQUZMeKAge.TB9IBuFBb1mMKrL8yiJkx0/3W2o73G	EmailAccount	2021-10-29 10:27:30.55736	2021-12-23 11:16:45.593907	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
96	arun	murugan		\N	\N	ujjavalbarot2+75@gmail.com	t	\N	b7ojwj7Vxcez4urwtZJBogtt	$2a$12$i9qTnQBGBwxSNlKpbEXSkeq43w58lOeGB/R21QdKaTHbzxDjzSwKq	EmailAccount	2021-10-29 10:21:46.782328	2021-12-23 11:16:45.604994	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
95	arun	murugan		\N	\N	ujjavalbarot2+74@gmail.com	t	\N	K29DX2gczrNUwdEIVpNyfQtt	$2a$12$oEj2wz.NZKdPNDf0LDUZOemL2XZXL9frEN4H8Decw/KxONnKRFJkW	EmailAccount	2021-10-29 10:04:49.672437	2021-12-23 11:16:45.613255	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
94	arun	murugan		\N	\N	ujjavalbarot2+73@gmail.com	t	\N	nShuYuXWBTSG7JPYihI6KAtt	$2a$12$ZiBFxEx6fFDxIdbjYl3sAeLzazJy1v4IYMaxz.aKp/N2gQvtWqQxS	EmailAccount	2021-10-29 09:48:59.185263	2021-12-23 11:16:45.677745	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
92	arun	murugan		\N	\N	ujjavalbarot2+71@gmail.com	t	\N	yJQsQpr82nidZGriS2dK6gtt	$2a$12$8hvFiQHp82TQBg3GK/Kon.8ipkCPjfg49wAEj709Ic2xr0YGO6dra	EmailAccount	2021-10-29 09:35:31.17163	2021-12-23 11:16:45.686439	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
91	arun	murugan		\N	\N	ujjavalbarot2+70@gmail.com	t	\N	jHtkXb7Jhw45Z8flCgWGEgtt	$2a$12$JQuKYwkuS63y6W3cNaA0DuMsaw.zHFlk/I4cgciOpvtWlL/wXzLFu	EmailAccount	2021-10-29 09:30:54.585874	2021-12-23 11:16:45.694775	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
90	arun	murugan		\N	\N	ujjavalbarot2+69@gmail.com	t	\N	d7qgMQC7x9yQAXMEcOEjFQtt	$2a$12$rUgWB.B4Gv4xe9tZsZKLGeCyoVQ8Uix3fR9biv2PdCE32ioRZafzS	EmailAccount	2021-10-29 08:53:32.38829	2021-12-23 11:16:45.703002	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
89	arun	murugan		\N	\N	ujjavalbarot2+68@gmail.com	t	\N	j5TtnFp08rRKNNYKMrgRGgtt	$2a$12$4CuGtDajWi.jm499YMxgkuguffvUKJ7KCQy2PuxWmib2tkb10Y.Fe	EmailAccount	2021-10-29 08:50:16.461513	2021-12-23 11:16:45.710882	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
88	arun	murugan		\N	\N	ujjavalbarot2+67@gmail.com	t	\N	h7d6XdzZModqge4xmaQDnwtt	$2a$12$E9TyrNs2kGBMQSjm6tNzPOcOrkQyhqdcjyENEL/ECXwp8hVBf52Zi	EmailAccount	2021-10-29 08:29:37.260277	2021-12-23 11:16:45.785367	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
86	arun	murugan		\N	\N	ujjavalbarot2+65@gmail.com	t	\N	Be0eYWjCUZTrJRrXfPluCgtt	$2a$12$kFSRQpNsk0DtNExpInOl2uryZHnlqB0ZA6nQ9wxCW3G0X0yNPY7Ty	EmailAccount	2021-10-29 08:07:02.386564	2021-12-23 11:16:45.800781	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
85	arun	murugan		\N	\N	ujjavalbarot2+64@gmail.com	t	\N	sj457M0LIFjTyCSNAwexSAtt	$2a$12$QH/1g9Yg.Vxk2QezW3QfPexwCH9RL5hA7YTQIxUsPyf3YMomQBCey	EmailAccount	2021-10-29 08:03:27.967607	2021-12-23 11:16:45.811073	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
84	arun	murugan		\N	\N	ujjavalbarot2+63@gmail.com	t	\N	bgjMwV5U6I5A04RiF9QrAgtt	$2a$12$ngXJjorIiewKC1o5HVScNe8C1SZy90Ii7NVSTGyy7SPM9KBnVud82	EmailAccount	2021-10-29 07:25:46.357552	2021-12-23 11:16:45.819322	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
83	arun	murugan		\N	\N	ujjavalbarot2+62@gmail.com	t	\N	TImrEMP2WkHpMf7bIVhekgtt	$2a$12$lf.BcgQObkTkzFgmRFRKF.akwUS3xPb6RMbRg0Kv1/i0YIDHgwj9.	EmailAccount	2021-10-29 07:24:45.484298	2021-12-23 11:16:45.881623	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
82	arun	murugan		\N	\N	ujjavalbarot2+61@gmail.com	t	\N	TTV6kHlk0NBAjqo5XR9cgAtt	$2a$12$9KEsUKwUQyhOhgd0VzlBNOWdNaUiRFGN4ZMS3J47M1xmoZizZNUDe	EmailAccount	2021-10-29 07:24:06.857281	2021-12-23 11:16:45.891681	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
81	arun	murugan		\N	\N	ujjavalbarot2+60@gmail.com	t	\N	BztG1jm88ckeP1rbQUFC6wtt	$2a$12$sVwN5BppE.bj1ZgprXz4fefNRWwAzkR17sEmK0IQnzk5LKWHHqW.q	EmailAccount	2021-10-29 07:23:07.576829	2021-12-23 11:16:45.901363	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
80	arun	murugan		\N	\N	ujjavalbarot2+59@gmail.com	t	\N	tEGtrPOiBGUX3gvCGsEKqgtt	$2a$12$Vsci2c/UYB1RXZUjOyuV4OvEqW5jewIS1bmhmf3RMh56COaVjL1oW	EmailAccount	2021-10-29 07:16:45.56922	2021-12-23 11:16:45.911308	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
79	arun	murugan		\N	\N	ujjavalbarot2+58@gmail.com	t	\N	0cYrqa19iLvWkoV26chVTQtt	$2a$12$l5cmjT9HBWXhU3dAkFQAqu6qLlY4zJbNlwdRPCefIpr0EqydaSjWi	EmailAccount	2021-10-29 07:15:31.358767	2021-12-23 11:16:45.920499	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
78	arun	murugan		\N	\N	ujjavalbarot2+57@gmail.com	t	\N	lkHp6FTykrIlyrz6fL9eNwtt	$2a$12$rV9rT4wPtxv6xfgslxkyzuYa48pmeRTEzPIxujctA0UsPtivhl7Zi	EmailAccount	2021-10-29 07:12:26.885988	2021-12-23 11:16:45.981608	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
77	arun	murugan		\N	\N	ujjavalbarot2+56@gmail.com	t	\N	XOx3TxRLZdgnv5DTuHHwMgtt	$2a$12$7/yaVGujuyjz1Lb/2zry3O57mtIeRkRhtzlMGx57zrWwT1rYBEije	EmailAccount	2021-10-29 07:10:28.460218	2021-12-23 11:16:45.99084	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
113	arun	murugan		\N	\N	ujjavalbarot2+90@gmail.com	t	\N	3xJOzb7lWQOgkgGkCwjANAtt	$2a$12$6Hd2JJ7EOKmiAJw3Ikp/g.GdTrnDELxtP.djsDOWSpxkVRg5/A7vC	EmailAccount	2021-11-08 10:32:05.070612	2021-12-23 11:16:45.999574	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
112	arun	murugan		\N	\N	ujjavalbarot2+89@gmail.com	t	\N	V8nHhVjSV2wMeSGUQS5mAQtt	$2a$12$30uWtEk8GtBuZPAzH/NJiOF81WXirDkiijNEdW/6X0FXSjIGqTDrC	EmailAccount	2021-11-08 10:28:25.272587	2021-12-23 11:16:46.008625	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
111	arun	murugan		\N	\N	ujjavalbarot2+88@gmail.com	t	\N	KJt5G2uicfkchmJSpBXRRwtt	$2a$12$d35FYineiH1SnWJEUjs4nu/keDSD0sdPgarIvOfFNbQhgA4NSga8i	EmailAccount	2021-11-08 09:56:54.288434	2021-12-23 11:16:46.019189	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
110	arun	murugan		\N	\N	ujjavalbarot2+87@gmail.com	t	\N	BEiPIRlCjdhY306f3Uxz7Att	$2a$12$Wgc8SA50RLY28ooMjmhlIOsaaNQicYYXtzOQ2fGBio7fSJXbJaX3i	EmailAccount	2021-11-08 09:35:45.964025	2021-12-23 11:16:46.082911	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
109	lalji	Solanki		\N	\N	testuseremail@gmail.com	t	\N	VnE9Vogy0tCu5QxY0D4rBgtt	$2a$12$FpK9XET/dYsSuGzbYw90w.F2FoCNYeEGNOmXO3nNVNWntB/QCoV0q	EmailAccount	2021-11-03 12:22:48.87914	2021-12-23 11:16:46.094351	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
108	dharani	arun		\N	\N	dharani.a@protonshub.com	t	\N	pI4NoDKQjbj4aSSyd7QSMgtt	$2a$12$PveRvi10p5Sbhjlzs26T5ucpUweiXWRgUleViMP.PEqEobU4KFgwi	EmailAccount	2021-11-03 10:11:07.97639	2021-12-23 11:16:46.105665	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
107	arun	murugan		\N	\N	ujjavalbarot2+86@gmail.com	t	\N	3Gt9Yd3YCaqo3roKoIWt1gtt	$2a$12$as9WdNCVstszLBi7Ckhm8uRsyvJqN.aEQhzH6UPRboycKGpQ.4QKq	EmailAccount	2021-10-29 11:25:59.171587	2021-12-23 11:16:46.114699	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
106	arun	murugan		\N	\N	ujjavalbarot2+85@gmail.com	t	\N	GsEKi91sik6LrkVN2wJYyAtt	$2a$12$3ljKeJe1YA4jzywW5YSabua1B27EXJbd9pTfLUhr0PMceFXAkIKbS	EmailAccount	2021-10-29 11:24:06.383854	2021-12-23 11:16:46.124528	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
105	arun	murugan		\N	\N	ujjavalbarot2+84@gmail.com	t	\N	wQXxNd5Hl7HVMOCNc0TBhQtt	$2a$12$0BxH.qrRKjV8jDYrvgfz6ObIHZAYwDKzY/dY.JPitV9HdCQXSEIym	EmailAccount	2021-10-29 11:22:54.386907	2021-12-23 11:16:46.184319	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
104	arun	murugan		\N	\N	ujjavalbarot2+83@gmail.com	t	\N	1LgrARZ5QVrQGrM7a6pDsAtt	$2a$12$QPJCwKkqTr8FuABl3UoJEeMvp3btTm388goFw9.DqwlIUMFDan6xa	EmailAccount	2021-10-29 11:12:45.861901	2021-12-23 11:16:46.193283	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
103	arun	murugan		\N	\N	ujjavalbarot2+82@gmail.com	t	\N	W6oUVnMsaVPYwkE4lKa3Rwtt	$2a$12$FlXeCycPsFU0eyzezNfQPuxc/WeT5nV4NgFcg2jt0fPt.9os5oAs.	EmailAccount	2021-10-29 11:10:55.981987	2021-12-23 11:16:46.202176	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
102	arun	murugan		\N	\N	ujjavalbarot2+81@gmail.com	t	\N	r9mxOfzivsyEuHcDW1mf9gtt	$2a$12$ong07YSNe1BWIio.Q9.jcuPPRaIHDJyf366rGAPPDTJRoVQ8umm5O	EmailAccount	2021-10-29 11:05:06.473498	2021-12-23 11:16:46.211676	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
100	arun	murugan		\N	\N	ujjavalbarot2+79@gmail.com	t	\N	kH2u78TTzKCB9FxrLjurXQtt	$2a$12$1DJrD1ZG6JLUgGOYR5Tc2O.HeIY3Cu210jN2DxmSQ6eUb8tdGjCWK	EmailAccount	2021-10-29 10:40:17.091208	2021-12-23 11:16:45.505629	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
142	DB	USER2		\N	\N	bayoxoc313@gyn5.com	t	\N	p5YmreHcUGMZn8glQ3CxDgtt	$2a$12$2SHEkBkaIx1U2tIPxLSGM.A77rlmh3RZHiH/qU7oYj7BANaaAcdCy	EmailAccount	2021-11-12 07:13:02.687969	2021-12-23 11:16:46.297961	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
151	Namename	Lastname		\N	\N	hagaraw742@erpipo.com	t	\N	XR9mrrfbTjfwkkSoS7TvBQtt	$2a$12$NhI6s3bP5UxJJcFyqdEfgOPn4PXChW3D.LwZlfr.mw5TaaG.PYmKm	EmailAccount	2021-11-12 11:03:25.490706	2021-12-23 11:16:46.322588	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
150	Name	Lastname		\N	\N	witib64980@elastit.com	t	\N	I7zczNAVZ70INxvu4ceE9Qtt	$2a$12$UZnT/tE2tE.O874/JZxWiuMkwWGdWvAclSucybf0Y6PPDKQ6PwAoW	EmailAccount	2021-11-12 11:01:57.060321	2021-12-23 11:16:46.38517	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
149	Kaxe	Ma		\N	\N	kaxema5289@gyn5.com	t	\N	JGWft2NmJr0PCypidSBCkAtt	$2a$12$6aCHvnaO0ZzTNPFBUu4mZOSpxF.goqBkoHdf3GAWMg.ZSQKmCw79G	EmailAccount	2021-11-12 10:31:52.06631	2021-12-23 11:16:46.394174	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
148	Dharani	A		\N	\N	dharu@protonshub.com	t	\N	mvqWSpoTrfScGwQQUl5mfAtt	$2a$12$HWM0m4FmuNqejFmsq9mMk.f2sH3yBI2ypRJa/eDboc79anLWjlsGi	EmailAccount	2021-11-12 10:24:58.288954	2021-12-23 11:16:46.401261	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
147	arun	murugan		\N	\N	test23456@mail.com	t	\N	QTbJXR0EFXKH6M2MqjAp8Att	$2a$12$dOBypJ6rQI4/8YEz0cT7qetwqlKVMSLwYxurA/oZANRQF88VxJ0CC	EmailAccount	2021-11-12 10:24:01.365786	2021-12-23 11:16:46.411884	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
146	Some	Name		\N	\N	veteko2855@erpipo.com	t	\N	v6mPQ5ZXZVI6kTDcCborwgtt	$2a$12$xjB0/SdIYsqaYgxLe06HMOvLOL50cR.6ztDRMxpOdmHYyBhT2NKG6	EmailAccount	2021-11-12 09:57:20.063333	2021-12-23 11:16:46.420944	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
145	Brandan	Stark		\N	\N	povise2830@erpipo.com	t	\N	FoiQIyP5UsEw1EE4uVD6twtt	$2a$12$3Gg3MBqcn9ppYCZNftWQ/.ltsV2LOgEDbQyQEyOXk4LDOZgPhWMsW	EmailAccount	2021-11-12 09:52:58.085711	2021-12-23 11:16:46.481592	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
143	arun	murugan		\N	\N	ujjavalbarot2+120@gmail.com	t	\N	8D0bZQltJI7Elpr8nrfTSQtt	$2a$12$MDc7xyCIkJJYfE1TinG9We.GcVufNN8WZsMGX2wJkUBrP2vgJfc0C	EmailAccount	2021-11-12 09:18:41.381578	2021-12-23 11:16:46.490542	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
141	arun	murugan		\N	\N	ujjavalbarot2+119@gmail.com	t	\N	iEIqOMSrM8924qCKTAO2QQtt	$2a$12$kCFl.n4YcsvwKJU4RBdZluwqaoOsu0mJnjLNP4EObPmZhSUB.8Owi	EmailAccount	2021-11-11 13:37:34.766661	2021-12-23 11:16:46.49943	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
140	arun	murugan		\N	\N	ujjavalbarot2+118@gmail.com	t	\N	72a4B1MSe4ZGVi15NvIXegtt	$2a$12$592xv1Z1AWA6iH5gPaT5W.btOJNyU8x/PNL5Uf/WU3UXl.NcpSH8.	EmailAccount	2021-11-11 13:26:11.365457	2021-12-23 11:16:46.507118	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
138	arun	murugan		\N	\N	ujjavalbarot2+115@gmail.com	t	\N	BdvKj8vUUcvHwBpdZrtEfQtt	$2a$12$rnh/EclZkv0o7uQ309qbyOyz5CrWfZPQbrkbE57/ixM7aHODQ4jVC	EmailAccount	2021-11-11 13:16:54.061745	2021-12-23 11:16:46.517634	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
135	John#	Jajajaja		\N	\N	jajajaj@gmail.com	t	\N	GIzGMETSGL2kGXFrDz9GyQtt	$2a$12$ooULD7Z5hYn3eeSuGvk0fedUtbpC6mybyqkdXmDqK7M7djod1cgna	EmailAccount	2021-11-11 09:51:10.869855	2021-12-23 11:16:46.580781	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
132	Userone	Userlastname		\N	\N	bivew83666@epeva.com	t	\N	jOHUiJrraauK8m6DBcOM1Att	$2a$12$tTFhJSwDLOgBn9/4DsyU8e2n8pOGDxESSa2ZQxyI5dUhfPeZ9qmRy	EmailAccount	2021-11-11 08:08:08.38242	2021-12-23 11:16:46.600006	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
131	John	Snow		\N	\N	johnsnow@gmail.com	t	\N	9QyeQ3jUA9yJjyRwrTRc5Qtt	$2a$12$H6fwpXFsB/azqm2aLs9VOu2Ed1XwiYCdTF/JXfgEUqt9OMLfCAvg6	EmailAccount	2021-11-11 07:21:01.583092	2021-12-23 11:16:46.611785	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
130	arun	murugan		\N	\N	ujjavalbarot2+116@gmail.com	t	\N	QwqnMvZE0FuyHJ5AlQElYgtt	$2a$12$KLdmRlVmrJxXmyRFzj.ko.zODWz94YIXm3safNnLaeWfcYS6weSl6	EmailAccount	2021-11-11 07:05:33.759081	2021-12-23 11:16:46.622043	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
144	Michael	Core		\N	\N	michaelcoredg@gmail.com	f	\N	DEjwFfQJyB3KjHHz0QI7QAtt	$2a$12$mxVysARGRp5TyJ2LEsFdyOjuSN92nud2uRNRYGzyz.jYcOkf.QBy6	EmailAccount	2021-11-12 09:43:49.159914	2022-02-01 09:03:16.597076	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	3	t	\N
128	bfhfghgfhq	BOGUS		\N	\N	lalji.tatvasxoft@gmail.com	t	\N	LZoRR6FUA0v019rhpSv1SQtt	$2a$12$xh5ibMwQQFio35p39OHPrejUFXKIEgnRPl4Vu9IeTcTADlJYSiTXu	EmailAccount	2021-11-10 11:13:39.388548	2021-12-23 11:16:46.681411	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
127	bfhfghgfhq	BOGUS		\N	\N	lalabthai.solanki@tatvasoft.com	t	\N	LIQzrYZwbWvYrPqoD5sblwtt	$2a$12$HoJTpsL7rvagbJPL3wteAO.TbQZFpLqpumVlwbnqjGTJyebr6P59O	EmailAccount	2021-11-09 14:12:11.96029	2021-12-23 11:16:46.692299	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
126	bfhfghgfhq	gjnghkhjkj		\N	\N	lalabhai.solandki@tatvasoft.com	t	\N	KrfMQfonCncrfeZqg0gIXwtt	$2a$12$mSJtpPzfn5dcWNlqnmYJQ.x63T.RS8pR9r2NOrz2kkk2mtTxSN9h2	EmailAccount	2021-11-09 14:10:44.378413	2021-12-23 11:16:46.699607	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
125	arun	murugan		\N	\N	ujjavalbarot2+105@gmail.com	t	\N	qF8rrzBxHxY1OsMVQ8rLggtt	$2a$12$N4H7obgofer0XjeGCKV7d.fPQwYTCSd5dZtdQr8tavwWJuJA2y0pq	EmailAccount	2021-11-09 13:25:39.257276	2021-12-23 11:16:46.707201	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
123	arun	murugan		\N	\N	ujjavalbarot2+103@gmail.com	t	\N	nixfZvBvMqWejfJ2nFThmgtt	$2a$12$EdC2Mt4TlESIqlJpHcoDY.8dpoddvnNFP.lH8WO9k4TroI9PEkBQW	EmailAccount	2021-11-09 13:11:51.761839	2021-12-23 11:16:46.716892	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
122	arun	murugan		\N	\N	ujjavalbarot2+102@gmail.com	t	\N	GdDQiG5eDbiQ9O56SOw9FQtt	$2a$12$oju4XkEvSdyWvqQU1482iOS8INebqvGljWO9lmgy7aRKTWVdUKfAi	EmailAccount	2021-11-09 13:08:58.081029	2021-12-23 11:16:46.780607	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
121	arun	murugan		\N	\N	ujjavalbarot2+101@gmail.com	t	\N	c7QWaao2ww9F51MEhqcDxgtt	$2a$12$lJ1JF8AFwscgIMbNpjS7.e8mia4pKlC23/ssFQmu7Cqd4PbcdpYLO	EmailAccount	2021-11-09 12:57:32.488103	2021-12-23 11:16:46.789687	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
120	arun	murugan		\N	\N	ujjavalbarot2+100@gmail.com	t	\N	RIZ38maYRXOXQsgQ8R2wMQtt	$2a$12$8WXrC0RDU297NL9b9w/CfeE1CB1up1rsB9MEdCcABvBTdtp/xOJz2	EmailAccount	2021-11-09 11:43:29.056974	2021-12-23 11:16:46.799973	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
119	arun	murugan		\N	\N	ujjavalbarot2+96@gmail.com	t	\N	8O9Bv36MDLxYKVCFwKtzywtt	$2a$12$/XNh3c5nmUOB98COPPbxPejAzWPD.luC3NGf7Nd/pLCiu7sXT3x2i	EmailAccount	2021-11-09 10:53:53.363881	2021-12-23 11:16:46.809535	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
118	arun	murugan		\N	\N	ujjavalbarot2+95@gmail.com	t	\N	BRkEl2byhEBOEUu1rGDY6gtt	$2a$12$Rw/IQe.gvuow04yFZMIZvuRq4AFDeuXB1ChUy/xc/Cf031h23Bye.	EmailAccount	2021-11-08 12:27:19.977887	2021-12-23 11:16:46.818465	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
117	arun	murugan		\N	\N	ujjavalbarot2+94@gmail.com	t	\N	kaCv6IoFr2XAbrJOawYhkgtt	$2a$12$hkOSUcAf6cussc/8lvdvWeGRkh9Lqvnkiud6y/4JV28kX8aDF6TOG	EmailAccount	2021-11-08 12:07:25.661182	2021-12-23 11:16:46.880696	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
116	arun	murugan		\N	\N	ujjavalbarot2+93@gmail.com	t	\N	87dBXrokWKA75Qeh52OO3Att	$2a$12$Hop3Q4f0OOUcj0P8Ma282OZHXWpOdAFd.Bxy9rT6c19buTdOC3s9y	EmailAccount	2021-11-08 11:03:28.970513	2021-12-23 11:16:46.890988	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
115	arun	murugan		\N	\N	ujjavalbarot2+92@gmail.com	t	\N	2QsVS1wHOOnT1CqQ8vLIwgtt	$2a$12$CReo.zmsU7l2q0gKXt2qTuKLMvp/L7eUiNl96MMmXJKLYTyDeNpb2	EmailAccount	2021-11-08 10:44:09.578446	2021-12-23 11:16:46.900589	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
114	arun	murugan		\N	\N	ujjavalbarot2+91@gmail.com	t	\N	osOthOukpDXol44f1O6z3Att	$2a$12$J.gf34U7tGQk.gsfnfkuzejfROsxg2T8z71PIHLxhU2WnoV3Yqm1a	EmailAccount	2021-11-08 10:34:59.373189	2021-12-23 11:16:46.908534	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
175	test	tests		\N	\N	himanshu.kumar@protonshub.com	f	\N	aFsWIbagUTANIhZr2dO7kwtt	$2a$12$DAzgicSy4T8W1d7tLt05ZuCrk54HSaJEy.pc7bLtjoTsiEx9NegdS	EmailAccount	2021-11-15 12:57:41.258375	2021-11-22 12:05:55.182052	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
184	himanshu	kumar		\N	\N	himanshu.kumar@protonshub.com	f	\N	F302kbrrrGQCNN1e4leJrgtt	$2a$12$Zszdf3MyAN/f80IkhrpDDexgucUCrcvUCKV2qIc1abyLoGSGCCAx6	EmailAccount	2021-11-15 13:41:33.458827	2021-11-15 13:41:33.458827	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
188	Ssss	Ssss		\N	\N	vihivi5001@funboxcn.com	t	\N	WrfYBhinmQJsijRcIHlsRAtt	$2a$12$f/fmlO1UOjIyJmrRjx2jLOzfjYfoQBOn2QPWWcGgKdDounQHuBzcG	EmailAccount	2021-11-15 14:08:13.061942	2021-12-23 11:16:46.990875	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
187	arun	murugan		\N	\N	ujjavalbarot2+166@gmail.com	t	\N	V7BkKR1BcT7YBrwGBiGOrwtt	$2a$12$VPKQLF0nqvaeMKanJTxS6u4da9T8wWc7y3OZcIG4dPGyL9mQG0ChC	EmailAccount	2021-11-15 13:51:46.290359	2021-12-23 11:16:47.002492	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
186	arun	murugan		\N	\N	ujjavalbarot2+165@gmail.com	t	\N	t7jXugH1CrZrhrtwD0lFLgtt	$2a$12$H3obHFUlZ2XfN3ny3J/8uOuF/QfdVhcubxhvPPi8oKjMw04CSd4La	EmailAccount	2021-11-15 13:51:05.464151	2021-12-23 11:16:47.012422	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
183	arun	murugan		\N	\N	test10@yopmail.com	t	\N	KH4eKbzJbHLc07YN4OZEMwtt	$2a$12$UQRqZR4BJN5uNr/1SsWnqeyQ/UsDxbW7Kwkuw2cmuuvpFucdnzecO	EmailAccount	2021-11-15 13:35:03.368595	2021-12-23 11:16:47.021678	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
182	arun	murugan		\N	\N	test11@yopmail.com	t	\N	WDBLyWLeIrQb9Q7MkrR1UQtt	$2a$12$lcRO1HeoDQsGJY1Rf3MgxeZgGpq6hFmbUvekxvptyR.uzPuWGHw3O	EmailAccount	2021-11-15 13:34:20.779724	2021-12-23 11:16:47.087049	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
181	arun	murugan		\N	\N	test12@yopmail.com	t	\N	kh3V3YjlfX2ma5s8yXdpMAtt	$2a$12$xI3Fdqr86jd8XZCNROEPT.uetmnEjptnaGzWA.i70oyilYMXZ7Yh2	EmailAccount	2021-11-15 13:33:54.480229	2021-12-23 11:16:47.095636	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
180	Some	Some		\N	\N	beyelog707@gyn5.com	t	\N	Fw9hAKTQiZsBitkQWBaVUwtt	$2a$12$YGhe/q3br2l7SeMrpzgDheCobWnZMDxmZ7/XD.148ddTD1UHaohs6	EmailAccount	2021-11-15 13:20:23.485037	2021-12-23 11:16:47.106435	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
179	Amelia	Rose		\N	\N	yovivoy369@elastit.com	t	\N	d7QAVRguPn00CedjhuXJcAtt	$2a$12$KxVkD6a4sWKg0DxT5UsmQe8pf4KrTbXqWKtB8qBG5WrRr8nI2MsaG	EmailAccount	2021-11-15 13:19:50.283497	2021-12-23 11:16:47.116416	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
178	bfhfghgfhq	BOGUS		\N	\N	lalji.tatvasoft7@gmail.com	t	\N	WhY7wbH06kAeZtTF1he6swtt	$2a$12$4wv2lj5KtyQeFt7tNVshq.yVfvNdFwkJHnWdepEenrIhtCphI5PWq	EmailAccount	2021-11-15 13:19:28.982031	2021-12-23 11:16:47.18096	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
177	bfhfghgfhq	BOGUS		\N	\N	lalji.tatvasoft6@gmail.com	t	\N	lvlBbe5mNNAs5Okot13gFAtt	$2a$12$n17BcJoKnGogyodw/HxZcOGhGxYatkAW62p.vBuSaW0uJ7XJeL3YK	EmailAccount	2021-11-15 13:18:52.089978	2021-12-23 11:16:47.189358	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
176	bfhfghgfhq	BOGUS		\N	\N	lalji.tatvasoft5@gmail.com	t	\N	PltbaaeXXc5yPaW2rz7sagtt	$2a$12$lDuZnHuO0NI2RUTgkSMVXei0zyEsMEbyZLcAMbCiJCi76rnQ1ZPPG	EmailAccount	2021-11-15 13:18:37.176478	2021-12-23 11:16:47.197393	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
174	bfhfghgfhq	BOGUS		\N	\N	lalji.tatvasoft4@gmail.com	t	\N	a6Sb5xE7cHQEDs81hw4UNAtt	$2a$12$w0ApKUsHWfYiL1JEuVxDi.YktfA.m7/.8LcYNoXZ5gM9LNZ7KMQ9S	EmailAccount	2021-11-15 12:40:06.970293	2021-12-23 11:16:47.205488	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
172	bfhfghgfhq	BOGUS		\N	\N	lalji.tatvasoft3@gmail.com	t	\N	8MfKCNYHdjgmKmjPQaUkPgtt	$2a$12$0voALH6uPeFbQMfUlWF8SeINOwdjFUQeqtX9PSpC9kvgGPly6pKBa	EmailAccount	2021-11-15 09:50:18.158657	2021-12-23 11:16:47.215114	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
171	Some	Some		\N	\N	hamined845@elastit.com	t	\N	9syWW1urYFzjVBw7X3Oh6gtt	$2a$12$5aeazTfzzhan59eEpLyLb.654tGH9x86hd587PcpltAGmUuwCnFvS	EmailAccount	2021-11-15 09:31:45.582216	2021-12-23 11:16:47.224592	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
170	test	test		\N	\N	test1234@yopmail.com	t	\N	5hKOjbukleLvlt1JA846NAtt	$2a$12$ynj/nFCszzWRyBtmqZzfNew.PQsfGUYY10zkXqyhZBPY7KnTRmHCW	EmailAccount	2021-11-15 07:41:56.788162	2021-12-23 11:16:47.282903	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
168	Dharani	A		\N	\N	dharu12@protonshub.com	t	\N	yXYK0EwQfN91xD8dUljy0Att	$2a$12$kl1Wqt9tj0llCq3aLvYkGOAOFg4sRaTv30gHIaHyN4zeTX11tOJDq	EmailAccount	2021-11-15 06:07:16.382883	2021-12-23 11:16:47.302736	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
167	Ujjaval	Barot		\N	\N	ujjavalbarot2+301@gmail.com	t	\N	CbeFKJdNru94LaGTQr9dWAtt	$2a$12$ZNsh11/k.xQS8w2FOi9x/uG38oNOoYnx4R74.2pIPVo3JqvnHP0bS	EmailAccount	2021-11-12 17:34:04.978335	2021-12-23 11:16:47.312919	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
166	denny	BOGUS		\N	\N	lalji.tatvasoft2@gmail.com	t	\N	idM0VodHD427xXyMsxhbzgtt	$2a$12$1.CSeLJZVpXuI6MMtiQKdOyy.a6MckO1Ov7qRIzHvzfyNsGg09ule	EmailAccount	2021-11-12 15:16:41.763638	2021-12-23 11:16:47.376355	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
165	bfhfghgfhq	BOGUS		\N	\N	lalji.tatvasoft1@gmail.com	t	\N	8J1ugQ3jpNFZbvLUkvSHuwtt	$2a$12$mL/RiDLKzKGaKbYib1dg4OdmY/uZselCn/UWOh1yWkreP9wUIa/oq	EmailAccount	2021-11-12 15:06:10.057827	2021-12-23 11:16:47.385535	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
164	New	Evo		\N	\N	newevo7751@elastit.com	t	\N	JRCY1tlwQT18X4wd3qprQwtt	$2a$12$RF4StEcGhTge5Dq9iUK37eVSVeCJaveeED/yOW.i8618DdMaR5T0u	EmailAccount	2021-11-12 14:51:57.180124	2021-12-23 11:16:47.395839	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
163	Cewa	Axex		\N	\N	cewaxex878@elastit.com	t	\N	yKRySe9q7ggygjRChlK6igtt	$2a$12$yLqI5Ag9K/yhx5U0PgJgDOUHNTqeWCFpV/zBrAIe84MrjyloXldp2	EmailAccount	2021-11-12 13:38:05.08645	2021-12-23 11:16:47.406667	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
161	Name	Name		\N	\N	logobe4461@gyn5.com	t	\N	6uyACQ7AuI7VNFVt9TdLpwtt	$2a$12$/Q4wnSXQiq.sNwCdReCuzeZmY6PehTRDA0eIbr8pgoI2aSZlAbvbq	EmailAccount	2021-11-12 12:32:48.092091	2021-12-23 11:16:47.4779	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
160	Name	Name		\N	\N	heneger340@funboxcn.com	t	\N	MQtrO6Q5p1kgGaLFAfPhpQtt	$2a$12$fXcmkaVd8Xhsv.ta4uqTNOHAZEQewKDU.NUp3pgGDoOP5jMVYaygK	EmailAccount	2021-11-12 12:25:59.390668	2021-12-23 11:16:47.489068	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
159	arun	murugan		\N	\N	apple123@mail.com	t	\N	t0Irv9LfkGp6ify3WV5B7Qtt	$2a$12$7U37ijsOfCaBdGoUxc/HrOXULXSiHFU8/iO88kzmi5sSrcqaw4Obm	EmailAccount	2021-11-12 12:06:33.865413	2021-12-23 11:16:47.498661	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
158	Last	Name		\N	\N	yoliso3578@funboxcn.com	t	\N	X6yXb4t7QPgQZgZpi6R8agtt	$2a$12$DcJiGd/um0RstZ9xiNK9ye5J/VKiWkU9f15BF6qt4uRPuX.vEUHky	EmailAccount	2021-11-12 12:01:31.372201	2021-12-23 11:16:47.50821	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
157	Name	Last		\N	\N	givefiw846@gyn5.com	t	\N	2rWWlCbSQTej3BrmSp10hQtt	$2a$12$S68bz7RY95bqtw5x6zgvKuV0.EuPKHM6YXpAgFCoe8A4IwnKZhDFO	EmailAccount	2021-11-12 11:58:11.680147	2021-12-23 11:16:47.516334	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
155	arun	murugan		\N	\N	test23@mail.com	t	\N	T85DUnQbvMSzrZHQAoCmAQtt	$2a$12$B9u8zpt/AF5XhkEcbSpD5.mk3jRYhg8PIBD8ioI0NTzoN5En29tA6	EmailAccount	2021-11-12 11:46:21.461093	2021-12-23 11:16:47.577406	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
154	arun	murugan		\N	\N	ujjavalbarot2+201@gmail.com	t	\N	riDpJglFeWfXrudRZNwG3Att	$2a$12$TWkvAi5VhVDIh4CizD0BYOgeoOLgexg8XC3t3Y6ystQ6GveRvQEl2	EmailAccount	2021-11-12 11:23:05.178598	2021-12-23 11:16:47.585574	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
153	arun	murugan		\N	\N	ujjavalbarot2+200@gmail.com	t	\N	B8IBnOIpU3KrNKifFq3YSgtt	$2a$12$KKcGkaEF10y3SfkKejH3D.eRqCLdYA1MFiHavrSGcbGx6sB8hOiV2	EmailAccount	2021-11-12 11:19:45.289601	2021-12-23 11:16:47.597813	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
152	arun	murugan		\N	\N	test234@mail.com	t	\N	7uJRekdPKSsbcfOAKQqr2wtt	$2a$12$MRqMXNU9As79PKjb18MxTOnN5cNz5x.aBw0S5y6PU7bzS4uMF0nqu	EmailAccount	2021-11-12 11:03:39.889125	2021-12-23 11:16:47.608294	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
189	bfhfghgfhq	BOGUS		\N	\N	lalji.tatvasoft8@gmail.com	t	\N	QOOMpvHyFvgacSfMa6RpVgtt	$2a$12$z59Vk6emLybHw1BI0jkGa.IKX0fJnQUDDZA8vEuH0F12xdkE8laeK	EmailAccount	2021-11-15 14:31:49.18135	2021-12-23 11:16:46.981226	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
225	TEST	USER		\N	\N	lalji.test@gmail.com	t	\N	H0Dh1rDahQIzqSsbqrnr4gtt	$2a$12$BzZm5mywumU9WhfxrXOgUueBvrFQrrLR666ZOfohZLuTztlaIw42a	EmailAccount	2021-11-19 09:23:50.058083	2021-12-23 11:16:47.68998	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
224	Dharani 	barath		\N	\N	dharanikv97@gmail.com	t	\N	krWsBleQj3Kd9O6lw05aUwtt	$2a$12$/0R.aMbKhB0Ef.NoWxEWdu726JeNrhMuG7Np4GaUMVWRN272SCjRG	EmailAccount	2021-11-19 06:31:59.386565	2021-12-23 11:16:47.698882	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
223	Tisos	Sosti		\N	\N	tisos95322@gyn5.com	t	\N	uV7f5TCQTDyR9jhtOHcegQtt	$2a$12$gS4V2GzOm9mRcr2FgMtwA.RfqWDSsMMENf9VTB.U97PjefAvbuXva	EmailAccount	2021-11-18 14:52:01.381911	2021-12-23 11:16:47.708244	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
222	Some	Spome		\N	\N	casij68040@erpipo.com	t	\N	CcI57SO010gwlXR2PQEoNAtt	$2a$12$6.nTi9LJD9nHgcKYEemcMObf4hQLGGPZon2YdiSFkbzGvek8l2Swe	EmailAccount	2021-11-18 13:55:41.88164	2021-12-23 11:16:47.717739	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
221	testuser	BOGUS		\N	\N	lalji.tatvasoftKL@gmail.com	t	\N	zVAQ1Z7iM4ShCeMgHC0NXQtt	$2a$12$uzRNH6ryrZ6cMZlumQwFZuS9gyZNWrKowvIu2iChvK0n3z/RSC.Wy	EmailAccount	2021-11-18 13:53:49.681891	2021-12-23 11:16:47.77686	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
220	testuser	BOGUS		\N	\N	lalji.ls@gmail.com	t	\N	07nAXHhQQ3cT4q3f7PLGFAtt	$2a$12$fNnAji6A0VZ3vueDiVYmfei/F684zI1L14qKqCI2Ksur6GzMrSFZq	EmailAccount	2021-11-18 13:48:55.670981	2021-12-23 11:16:47.786955	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
219	test	account		\N	\N	test_account@yopmail.com	t	\N	sgQ8gQPXtzpvZOF7MJiOVgtt	$2a$12$SB.40gOUyzyvVmvjd6FP6epXK6CmJCXLCRracL85bSe.eQ5VbebfK	EmailAccount	2021-11-18 12:39:29.866559	2021-12-23 11:16:47.80443	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
218	testuser	BOGUS		\N	\N	lalji.tatvasoftABA@gmail.com	t	\N	iB8hWRryriwJrvQVwgSAfgtt	$2a$12$rgn4ta5V2dlzPBro8i65l./Wlxah9i4LvJDaa8YlvMOvY6QzsOe0q	EmailAccount	2021-11-18 11:55:26.461415	2021-12-23 11:16:47.815595	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
217	testuser	BOGUS		\N	\N	lalji.tatvasoftAA@gmail.com	t	\N	p01aiZwLXN5AHjVlk6VaWgtt	$2a$12$ysChQl3yS26TDqxazhl2HOpl41KqnxP7jkkgP2Xqq/s.b/onocQ26	EmailAccount	2021-11-18 11:54:17.377747	2021-12-23 11:16:47.825844	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
216	Some	Name		\N	\N	vagota9376@erpipo.com	t	\N	6yZv45MwThmyo1qKXOP9Agtt	$2a$12$CYr7z.GUQOUoiuLf.cOkYOn6cv321D2OnI9tPhU0pa8plFRurBLX2	EmailAccount	2021-11-18 11:02:33.486272	2021-12-23 11:16:47.832901	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
215	Robert	Johnson		\N	\N	vilek25339@healteas.com	t	\N	Qhsozrw6hsTg0eRwaEkyuAtt	$2a$12$ZyGjHhdDjHnC1Z19pKqYK.QmpT2Bo90ZC2RpwvCWbQkao8n2lcJ1O	EmailAccount	2021-11-18 08:09:37.781785	2021-12-23 11:16:47.886042	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
214	BOGUS	BOGUS		\N	\N	lalji.tatvasoftLS@gmail.com	t	\N	H238euQiaXzGyWCSLfduPAtt	$2a$12$oxqKyHEJ3tHh6lXMyeb.R.MsDspqPnrzIgq/LFLpoF6qVIK1OKJGC	EmailAccount	2021-11-18 05:24:00.070279	2021-12-23 11:16:47.894503	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
213	Kesne	Lalsja		\N	\N	rixedef836@funboxcn.com	t	\N	OoNns9zpiPkU2CQgtTr1kQtt	$2a$12$n3.i3oY3dfLvfsuqsGBWBOHMHQTHz4sVeuT2P6KIAJSWaywkoJyhC	EmailAccount	2021-11-17 14:48:10.271207	2021-12-23 11:16:47.910819	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
211	Some	Name		\N	\N	hidan20187@gyn5.com	t	\N	qoc1IsicDzXsbiYaIM3KRgtt	$2a$12$wup0XnEEumFkJ8zjfNEwY.7xea8LpdB0lBM/yFJdEN5HPYMh8U9ZG	EmailAccount	2021-11-17 14:13:06.558087	2021-12-23 11:16:47.921707	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
210	Some	Name		\N	\N	tokobo7881@elastit.com	t	\N	30lgB1mBFzZ4nqhLQYfmjwtt	$2a$12$lQUJ.B38y64c6IgleXvCKuhgPN7GFZVfEklS3KGwomhsuPWfOK1Fe	EmailAccount	2021-11-17 14:04:50.994934	2021-12-23 11:16:47.984515	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
209	Babab	Baba		\N	\N	canacob942@elastit.com	t	\N	NWFGZ7HUUrXE7rpKheg2twtt	$2a$12$/atsrOnk16U04IWJ2P441.RFFbJRDLZ75Yi6O4ytJZV5VR6zbeQri	EmailAccount	2021-11-17 12:07:15.274121	2021-12-23 11:16:47.994098	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
208	Miji	Baba		\N	\N	mijiba6162@gyn5.com	t	\N	hXZCN5itwvQmuiiqLoC4dAtt	$2a$12$w2TAD1o/VZiVN/17LwaO/euf5ygT28WkaoBIcZI3WEWUPpecvt6a6	EmailAccount	2021-11-17 10:12:54.676288	2021-12-23 11:16:48.002579	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
207	Olena-Olena	Olena-Olena		\N	\N	xivah10783@elastit.com	t	\N	FFuIEhKlEP3IAYCWreW6Mwtt	$2a$12$hwWjCT2ajmiW40Rm1u9C1eqFIzrbYGsgXsyrUPo1HEuLbjLdwXP12	EmailAccount	2021-11-17 09:50:37.675508	2021-12-23 11:16:48.012161	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
206	Ci	Hej		\N	\N	kofedax649@funboxcn.com	t	\N	0VbpUDrPOlcQOyKbuNxjWgtt	$2a$12$3zKz5qCVS1n3F8j3qleXm.OS/6o2/opcDZF3kfaChcyLI9AHhJhXm	EmailAccount	2021-11-17 07:53:59.678854	2021-12-23 11:16:48.021342	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
205	Ci	Hej		\N	\N	fejaged786@funboxcn.com	t	\N	RauVwxWIbsAFrHqwJ2HJPgtt	$2a$12$PHQwOcdBElmjnRv8giGqbOMbCDm/jxdNGY5QhnTOXiIE6jxHYuw0q	EmailAccount	2021-11-17 07:53:42.985982	2021-12-23 11:16:48.079594	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
204	arun	murugan		\N	\N	ujjavalbarot2+135@gmail.com	t	\N	ErUXuYA9wNO80U0iGeu7Uwtt	$2a$12$G8dSjySD3C6QpBIpWt8oSu.70/BzYh4FYXGHasn.yz3DYfovF/84K	EmailAccount	2021-11-17 06:00:43.867916	2021-12-23 11:16:48.090322	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
203	bfhfghgfhq	BOGUS		\N	\N	lalji.tatvasoftK@gmail.com	t	\N	YTRr7F29ThSwWzuEhSB6Bgtt	$2a$12$kKwOU2c94nuKhljLJ7pXU.OcHXav.BjgALza3hMpa7jrQ/Lp.66vq	EmailAccount	2021-11-17 04:36:59.383873	2021-12-23 11:16:48.099656	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
202	Ci	Hej		\N	\N	cihej74415@erpipo.com	t	\N	2crvLpAdDKLkx92drQvbyAtt	$2a$12$MGiYrb.lh/DPmxSO/tzBieZZiX.kzd.QJtZS6lDt/6KUWWdjL/BE2	EmailAccount	2021-11-16 11:50:14.48219	2021-12-23 11:16:48.109858	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
201	Name	Surname		\N	\N	dibabab573@elastit.com	t	\N	KIdxVzjGSBwoAH66AUaiHQtt	$2a$12$ihdZx/.88/1o1WtzBIeOIe.q9zVs9NTsLWAR0msLogmxVwitcuaoW	EmailAccount	2021-11-16 11:20:45.787669	2021-12-23 11:16:48.121523	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
200	Some	Sine		\N	\N	somana2214@gyn5.com	t	\N	PeQCq3XwTl0HQVjUauQ0Vwtt	$2a$12$QeLAb/44HDfF0G6mUtvqRuKSEiq/qEC/oEsw9buGmMb..TczLYPFu	EmailAccount	2021-11-16 11:14:28.560225	2021-12-23 11:16:48.182693	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
199	Dharani 	Arun		\N	\N	arunmurugan2528@gmail.com	t	\N	iiN3wlWBKPW3Hin1VRiEKQtt	$2a$12$TTmJcz4SU/iLxuq1vuSduuk43qIf3gUoxMDEJwkm5Lh4PN1422Fpa	EmailAccount	2021-11-16 11:10:15.589825	2021-12-23 11:16:48.192755	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
198	Dogi	 Ciw		\N	\N	dogiciw550@funboxcn.com	t	\N	WZW22S1l7Om1js5jtiQ8dAtt	$2a$12$QDM4AGljwyELuyVem4nTgut2Ju42wtTooyrgfy04sAp3TCkK0srIy	EmailAccount	2021-11-16 10:44:48.290341	2021-12-23 11:16:48.201249	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
196	arun	murugan		\N	\N	test101@yopmail.com	t	\N	uYvQgI1gEs0whNoD0RUndAtt	$2a$12$/AOB6cUSZiTyWYzyqHyV6upBFTWt80SDwZoU21pQQvbv1ry0Lws7G	EmailAccount	2021-11-16 05:01:36.673541	2021-12-23 11:16:48.277154	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
195	Dharani 	Arun		\N	\N	arun.nm0591@gmail.com	t	\N	hTtdSWCSXohx4tFVhoy00Att	$2a$12$LbX8BaC.Po/ad.7/m3VJ9ec0dz7MiZ2IfhJEESL0QivpX4iwqdtZ2	EmailAccount	2021-11-16 04:46:57.186931	2021-12-23 11:16:48.398287	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
194	testuser	BOGUS		\N	\N	lalji.tatvasoft9@gmail.com	t	\N	0HJsdOPSquhdTWljrsRqcgtt	$2a$12$YZFPqLQBigsLNCr/THABLOJYENMr9msApA.nRiooYwN.7fQ9dMwni	EmailAccount	2021-11-16 04:25:08.474209	2021-12-23 11:16:48.40853	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
193	arun	murugan		\N	\N	ujjavalbarot2+128@gmail.com	t	\N	WjQa3GIQtoKsmGQGpPpT7Qtt	$2a$12$BCiWj9fwtyfDagIlB4OU.ecaSTeQaNfGQKLmK1MhGEte8iepVlDTe	EmailAccount	2021-11-16 04:08:41.995722	2021-12-23 11:16:48.419268	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
192	Dharani 	Arun		\N	\N	nmarun@gmail.com	t	\N	9GzHyriyU1w0TPXUQOEbXwtt	$2a$12$ajkq.bZYyxpuLEFxSy7JEuOsLuYb.yxCadEeaN08OzTDZ2vsdR6ki	EmailAccount	2021-11-15 17:09:03.38903	2021-12-23 11:16:48.484758	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
191	Dharani 	Arun		\N	\N	nmarun91@gmail.com	t	\N	VdeirXV2ZGrucr4yxCHxQAtt	$2a$12$OiI8HA9/DlVsf0ad2OBqy.ijpe0khuzmIrrEM7bW4p7M997Rq0eWC	EmailAccount	2021-11-15 17:02:25.658771	2021-12-23 11:16:48.498292	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
230	Svan	Drive		\N	\N	dfdf@gmail.com	f	\N	keo2BSWtOeAKSrXgQp4FvAtt	$2a$12$ArGRLsxJxOfFC/r1SeIdXOGDUA0z.H23vuFs2lFWvHlsCsc4pFSES	EmailAccount	2021-11-22 11:13:12.311495	2021-11-22 11:13:12.311495	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
231	Svan	Drive		\N	\N	dfdf@gmail.com	f	\N	Ow98gPcQT9eCKO7KrduMyAtt	$2a$12$f2WfCAM7BMYQajdWbq.vuOGrNnuk3Z.5radEPMXcuk8tWeSqsWcIK	EmailAccount	2021-11-22 11:13:12.310188	2021-11-22 11:13:12.310188	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
232	Svan	Drive		\N	\N	dfdff@gmail.com	f	\N	qkuOg7QocXYyMCqsCuwrlQtt	$2a$12$5F1u7uD8Xwfj9g9VIJ9IKO7iABZuwZ.zQjGQULz3B6g/KAJCDK1dO	EmailAccount	2021-11-22 11:14:16.689882	2021-11-22 11:14:16.689882	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
233	Svan	Drive		\N	\N	dfdff@gmail.com	f	\N	s0FIQJZDZMJOWil9qsoLTQtt	$2a$12$kG6g6j8gtlU87avxcLd0neTlxp.Kl.RJe07toOZB7Xk4KrEWp3kdK	EmailAccount	2021-11-22 11:14:16.704503	2021-11-22 11:14:16.704503	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
235	Some	Name		\N	\N	hohav69912@kyrescu.com	f	\N	B7ZQf8iyjzkpcNhsyOEAQQtt	$2a$12$zlEMo.G5Q2r24e2vjOYKy.EoKsEwoFqWfet2hVtqYYo0LyTDO8Eqe	EmailAccount	2021-11-22 12:55:47.159763	2021-11-22 12:55:47.159763	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
236	Some	Name		\N	\N	hohav69912@kyrescu.com	f	\N	rupKXIEEFvLWixgu4AuR6gtt	$2a$12$DWwmNcFcIT.YZC557DXE7erp1GRGUlxm6/0KqvrA0ZKha5PpL4ptW	EmailAccount	2021-11-22 12:55:47.30055	2021-11-22 12:55:47.30055	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
263	deegee	craig		\N	\N	deegee.deegee@gmail.com	t	\N	xqn8QXxG8uLJqrCXaZ13sgtt	$2a$12$I5ncepASMS0/WR/7j8/hnek2jDYhMgUuFSlHwIa9iei0/BnfeAx0C	EmailAccount	2021-11-29 13:23:13.34132	2021-12-23 11:16:48.602296	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
262	deegee	io		\N	\N	deegee@gmail.com	t	\N	QVTpzETYo6hLHriohN4EgAtt	$2a$12$kk2mlMY76ubH4EdxVYNA8OF9DaOVfNPIsv5lcZhtcWYJrN1XrC5hS	EmailAccount	2021-11-29 13:20:04.679904	2021-12-23 11:16:48.610474	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
261	Ssfsw	Swwew		\N	\N	ssswwweeww@gmail.com	t	\N	AMWMwupHSQiwsrySjdMKNwtt	$2a$12$Xwi5tCyyrYkYfXFPqAew5uS3NHnI0GF0Js317O6xi7VftYT1xxavy	EmailAccount	2021-11-29 10:17:42.265355	2021-12-23 11:16:48.675553	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
257	Dimpal	Kapadiya		\N	\N	dimple123@mail.com	t	\N	13EI8GjI4JfvdrsfDBfmVwtt	$2a$12$Y46k1jW1YvO9jhRdtxtLjeyRBh7wpWlK5UCaX8kVud0FGosM6/pPm	EmailAccount	2021-11-29 08:56:20.878792	2021-12-23 11:16:48.695203	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
256	Some	Ssss		\N	\N	affdfddf@gmail.com	t	\N	3OxLQKlvT3IQAomrGETqkAtt	$2a$12$11ZjO.WUxCnyFjnY8rH.iuNRmtB8xFjuoTb2jD.2OiGlfpj4Zk6KO	EmailAccount	2021-11-26 10:20:29.01094	2021-12-23 11:16:48.702491	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
250	Semene	Meneme		\N	\N	menemeseneme@gmail.com	t	\N	ssCFiVIxn4aU1Ii4Qkglagtt	$2a$12$WtiRFzfvo.jw.yn/hBmN5.dH6/vFvFEstcoLi6RblmKzRM0A2LdmW	EmailAccount	2021-11-24 10:21:05.489913	2021-12-23 11:16:48.783806	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
255	Veki	Gegi		\N	\N	metiye3716@keagenan.com	t	\N	4ueqNAPpIJsmliexlf7QSQtt	$2a$12$mC52pU8lsZ0DCP6WvlEmZe7qbUw/P0pqEmZdz26OQk4BCx2Mr1v16	EmailAccount	2021-11-25 12:31:21.101026	2021-12-09 07:17:39.435361	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
251	jason	webdale		\N	\N	jrwebdal@buffalo.edu	t	\N	gfz8YId7uBAfpll7Cx2E9Qtt	$2a$12$JChE/exrDXZKQZVoGxFbD.pu/HMIY8FQp55jwKu7tcxjVSh4jWQIi	EmailAccount	2021-11-24 15:12:11.736814	2021-12-09 07:20:57.031776	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
252	jason	webdale		\N	\N	jrwebdal@buffalo.edu	t	\N	9BMdF8osrSZl8wVs7pTWCAtt	$2a$12$Fy5rFyVxIZd4YkzRoYk7Tel1dmAZBytcrxsPLuLTiQpma7fvfLYCq	EmailAccount	2021-11-24 15:12:12.0993	2021-12-09 07:21:29.41855	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
237	Besaya	Kegan		\N	\N	besaya3529@keagenan.com	t	\N	QrzL1zPBlnTka1yUTnfZ6gtt	$2a$12$PPZOui0nCgkJvEhPv1izVOpnuWcuGBONw4sJPNwbAP7ePYc67x8rS	EmailAccount	2021-11-22 14:17:36.199494	2021-12-23 11:16:48.8044	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
254	Veki	Gegi		\N	\N	metiye3716@keagenan.com	t	\N	OMVM387NgQjI6JeL7d74YAtt	$2a$12$pEyNDGTYv5kDNd1kYhOs2uN/Y6rPYKuVfwzW9JCKCfA9kMjmgCGF2	EmailAccount	2021-11-25 12:31:20.205726	2021-12-09 07:22:22.838932	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
253	Veki	Gegi		\N	\N	metiye3716@keagenan.com	t	\N	kPgTYHtDZFPOjdH7Mca2XAtt	$2a$12$AsSPyi.HR4Muw3KuVSTU4.KngaA5CJw0JUBU/OkVeaM11pDL1EsbC	EmailAccount	2021-11-25 12:31:20.202012	2021-12-09 07:22:39.193715	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
249	test	test		\N	\N	test@tests.com	t	\N	Y5EyQ5kiL9Amz5UIyvRA4gtt	$2a$12$HIZw1o4jCwqGzu5YYQAML.ud63Til/h1cYWVdC5FQRXv0DLBarrly	EmailAccount	2021-11-24 08:21:01.585689	2021-12-23 11:16:48.81513	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
247	Sssss	SSSS		\N	\N	gsfs@gmail.com	t	\N	lehpJrwkQUq1Q4WpTo4UfAtt	$2a$12$VL34EWWJQFvRQETK2c/2QuKPpaTJLDwkGCbat77/RiNlvV.V36dk6	EmailAccount	2021-11-23 13:01:51.997188	2021-12-23 11:16:48.878548	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
246	Some	Interesting		\N	\N	vekig82333@ineedsa.com	t	\N	1mWxsgfNDQkayTIkgp4FVAtt	$2a$12$9BZ5l96suEdM93lRbtEJa.Xi0nnPcy6CzWSHE3jabuxVdU4k1jvKe	EmailAccount	2021-11-23 12:35:42.57603	2021-12-23 11:16:48.889888	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
245	Name	Name		\N	\N	yixerol489@keagenan.com	t	\N	szumlmZiIiG1u3T10CmJ6wtt	$2a$12$b86yPPek3mXnTVQvGSEjienobLcuy8shFxohIirZxDiWjSiC4tiuG	EmailAccount	2021-11-23 11:39:45.310627	2021-12-23 11:16:48.899986	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
244	Nhame	Shome		\N	\N	mepalox992@keagenan.com	t	\N	j7QYNgVrMEJhQoTQd09g7Qtt	$2a$12$TzK7IiJ/5GG7LI1d/VirkOsHS3AVA5Fv10XPDzAbWzvEe/Fxpd72.	EmailAccount	2021-11-23 11:22:51.724886	2021-12-23 11:16:48.910088	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
243	Some	Some		\N	\N	vetegok806@ineedsa.com	t	\N	a2sEpDsGNgEQjOPePHFZQAtt	$2a$12$RGXgk.qayeUyTbBN6NUrr.8TgV0Z5TsF1xC/R4Jr4djU3w4xfGfgq	EmailAccount	2021-11-23 11:21:24.604864	2021-12-23 11:16:48.9191	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
241	Some	Name		\N	\N	fotogo1877@ineedsa.com	t	\N	yVQpxkSEBd6alKzrnePW8Qtt	$2a$12$fEKyh3nUJ1gm4QonhRlSnu2dDtOpyEhMsu8lTk5JpPaMfdpQBODqy	EmailAccount	2021-11-23 11:18:45.182866	2021-12-23 11:16:48.977416	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
240	Some	Name		\N	\N	totase9455@jasmne.com	t	\N	puIc4Dk93uImY72AKweUNAtt	$2a$12$kbSUXrx.kRUC5iWuQfXWq.0xy8juSdQ9G05m5ZvFHVwkE60X4AeMu	EmailAccount	2021-11-23 10:50:47.49097	2021-12-23 11:16:48.987192	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
239	arun	murugan		\N	\N	ujjavalbarot2+139@gmail.com	t	\N	IRhItb8z534clnlNr4U9Zwtt	$2a$12$9roVQEJ5PVaQHWiUkNIqF.chfftLmn2I0gHVorwZgGLah7PIIuFL6	EmailAccount	2021-11-23 10:24:26.383639	2021-12-23 11:16:48.996491	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
238	Sasha	Hasha		\N	\N	helan18540@jasmne.com	t	\N	T9icxXpIfF4ir5alUxvFogtt	$2a$12$IZF/lA1Vh.Jv1RhR8mrFu.uJK2hB01jgMpjPsT1iWRl9TNfmxOX9C	EmailAccount	2021-11-23 07:33:24.187971	2021-12-23 11:16:49.004615	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
234	John	Ewan		\N	\N	hacoso2157@jasmne.com	t	\N	sDT0vHtHr6Q9HHYPgc445wtt	$2a$12$6UE.MlETdd7qglY3mfPGu.5XGJQAVRvZkzmBgTdbGRMDAf1PhY8.q	EmailAccount	2021-11-22 11:50:41.103787	2021-12-23 11:16:49.015029	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
229	Name	Name		\N	\N	liloyo6279@ineedsa.com	t	\N	7AXF3ReawgnmQEwLJW4UiAtt	$2a$12$D5bzoEfR2.Qg0jqQx9A4gewCbOXsQS1/XV1Ex46zyvvcxVCqaBKxq	EmailAccount	2021-11-22 09:58:11.681868	2021-12-23 11:16:49.082106	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
228	Waden	Waden		\N	\N	dicano4396@kyrescu.com	t	\N	C6F6YARIqFCqxrGKUy7h0gtt	$2a$12$FS12xEEPNr2eq6A6G6fD9OSnULDbzACmNuIdD7yodx6m.xoM3v2PO	EmailAccount	2021-11-19 13:11:46.079941	2021-12-23 11:16:49.092656	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
227	Some	Some		\N	\N	waden77568@kyrescu.com	t	\N	5LprM8XZ8k2KnayRhZtn6Qtt	$2a$12$gXcUihdP8PcCc.0yIvIP7Ob5TIY7zy2RnBo8FLTeq8NmMEPSCvJLu	EmailAccount	2021-11-19 12:09:26.068015	2021-12-23 11:16:49.106018	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
258	Rajesh	Khanna		\N	\N	khanna123@mail.com	t	\N	tryhYcYHFdCNnqluXuDeAwtt	$2a$12$CucVCuTURjwfE0d987yqP.wpht7k/T7R5aWnYOqKG.zrafrxQK9UG	EmailAccount	2021-11-29 08:59:17.088698	2021-12-23 11:16:48.581864	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
291	Some	Some		\N	\N	s33r22@gmail.com	t	\N	0DdnFr6BrWdQNAwIzOVKHAtt	$2a$12$YMLQLtUMuFehVX63.RHewup.2GldcpdIoDJ.KzfX/yN69xq7Lqc7.	EmailAccount	2021-12-06 11:16:03.459395	2021-12-23 11:16:49.488527	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
295	Feri	cort		\N	\N	feri123@mail.com	t	\N	BVCGqPJJiPrC04ltRWrzkgtt	$2a$12$xvDAQ7queFc.uAPW4xI.U.dAGE2dePe8ak1idg6yG1Vl93ZwNLsZS	EmailAccount	2021-12-08 13:41:39.501928	2021-12-23 11:16:49.69321	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
265	Daniel	Valles		\N	\N	daniel@onebayes.com	t	\N	AJe3RXpWcFZ6rIfrvsfRvQtt	$2a$12$f05h6Oh1zgV9eP3iQEs4h.IJTreWQzwLNO1BvS01O/KpJLvx9TK/G	EmailAccount	2021-11-29 20:38:22.609476	2021-12-08 14:15:13.079272	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
264	Daniel	Valles		\N	\N	daniel@onebayes.com	t	\N	fcsX582gqJaylBWRPUruAQtt	$2a$12$DuKLfAuOA/8iybi.CgrmnuihuF7y02VqfZFF2azuD1qJwg5m6MhwW	EmailAccount	2021-11-29 20:38:22.000312	2021-12-08 14:15:37.602385	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
275	Some	Some		\N	\N	sfsaf34rt2r@gmail.com	t	\N	r8jTEXXOT9CUcMNspcqrkQtt	$2a$12$c5vD8T6tQ3DyHqKG0mh.9uzTmRbfFqcz8XApwiJtNfKnTLpzBCezS	EmailAccount	2021-12-01 13:37:16.357461	2021-12-23 11:16:49.785153	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
274	Fff	Aaa		\N	\N	fffaa@gmail.com	t	\N	VVuCrlKA3d4haq0cRkpx7wtt	$2a$12$bzsoIUUZeOkVdb7/5Jv5bOfA9LHp4ECjzP72sRC.Awqfk3QzRaHhi	EmailAccount	2021-12-01 13:33:53.460304	2021-12-23 11:16:49.798947	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
273	Ssfsw	Sfff		\N	\N	sssfff@gmail.com	t	\N	KHIsQDI7AsxbwkvLv1ypoQtt	$2a$12$O8K4NL.rsjXBNTYLAGP6UO2eejmzX95hswbsM.riDtZLHgm2dr/UK	EmailAccount	2021-12-01 13:25:31.172301	2021-12-23 11:16:49.808984	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
272	Kaxe	Maxe		\N	\N	kaxemae@gmail.com	t	\N	QyX2vrr7J9kbXr3yrIBfGgtt	$2a$12$1kxxYDB8SAk655wdhBghVOyI0zknHwNyCngaY9uAwgn81umcHUbf.	EmailAccount	2021-12-01 08:41:25.28657	2021-12-23 11:16:49.885649	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
270	Test	Friend		\N	\N	testfriend@gmail.com	t	\N	OvzjERnumdjvt9TEEhOyYgtt	$2a$12$0.sxeaRBn522zapxzXgeA.kiAnFWgQoyRPXofHchNMckb96ffH61K	EmailAccount	2021-11-30 11:48:34.910829	2021-12-23 11:16:49.902009	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
269	Int	Var		\N	\N	varint@gmail.com	t	\N	m5a5hB37MK5uhwlUYgu8LQtt	$2a$12$aHcUUNx78PhhjHeEMH9JsOFJ62YJEMnc1Ro0QaH8vCFrSOaJUg.i2	EmailAccount	2021-11-30 10:24:40.818992	2021-12-23 11:16:49.924836	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
268	Some	Some		\N	\N	gmailmailmail@gmail.com	t	\N	l4QFDFRtbqY8vrB8ThW29Qtt	$2a$12$6eyMYXeS6xKJ5jp0P47j2eML5cbcMw4YpQk3WzX9v0ZyGlQGsTusK	EmailAccount	2021-11-30 07:58:24.591813	2021-12-23 11:16:49.948374	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
267	Some	Some		\N	\N	somesome@gmail.com	t	\N	ljnrmEdfywqsrZB8NrMljAtt	$2a$12$2G6BV3otulyZDED5x.iDqOuR4k4Leo3E2R1NET4mbv1mR16.lFLg6	EmailAccount	2021-11-30 07:50:09.79369	2021-12-23 11:16:49.958165	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
278	Steave	Rogers		\N	\N	steave123@mail.com	t	\N	S32YyJ5bpWqKQrbdhY9Zewtt	$2a$12$KEDvbGo6Z5i5Z1rRlm17Meu9yXI6Mw02o2bOCJyrGNb2jtx2BlVFK	EmailAccount	2021-12-03 09:28:49.575532	2021-12-23 11:16:49.128535	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
279	chris	hemsworth		\N	\N	crish123@mail.com	t	\N	8T2rZYIGnc4NyKLWXOK3SAtt	$2a$12$1YprF97RSYNc3w6RVHSToeKwCMDCDP.ZEGq0M.N0ZEK2pPZF.5Pq2	EmailAccount	2021-12-03 09:36:00.004857	2021-12-23 11:16:49.184812	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
281	Brie	Larson		\N	\N	brie123@mail.com	t	\N	1D4wV25D6dqu5kr6Sqs38Att	$2a$12$6sqWj6N3eiY/TBPtWsIn0ezj0X0sVHcTTwbKcrLXPlrAprhH2FaMy	EmailAccount	2021-12-03 09:55:43.896005	2021-12-23 11:16:49.206586	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
293	Name	Lastname		\N	\N	someinters2ting@gmail.com	t	\N	OcXRYrypTxbM34z2QCnlAQtt	$2a$12$1FdNIZVEnd.57CUz4kd4.uISOSYJfXfq14A1hSIM3Rma7RoKMJyi.	EmailAccount	2021-12-06 14:51:03.506592	2021-12-23 11:16:49.277174	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
283	Some	Some		\N	\N	somesomse@gmail.com	t	\N	fipJmpGvo8pVrisPWpCrswtt	$2a$12$QtnsdaoXMg03fBltaWlQX.tZeOejV/04qL/j05kHDCdnDFPD47OS2	EmailAccount	2021-12-03 13:30:26.28852	2021-12-23 11:16:49.287398	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
284	Mfdd	FDff		\N	\N	ff22aAf@mail.com	t	\N	wgjQHFQbud5KaQrk897prwtt	$2a$12$pWOeIpeM899mQ8cPJ3DCC.dKTKbxyd0URtg1p5mWhwics5hyltZK.	EmailAccount	2021-12-03 13:50:49.182957	2021-12-23 11:16:49.295789	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
286	Sammir	sharma		\N	\N	sammir123@mail.com	t	\N	cDgyYisDsRhvxKF2GG05jAtt	$2a$12$A6646jcb4Tur8Tf4Qpc1qe1HNJpRla8CS.I4DU878SprjFgf6GM.2	EmailAccount	2021-12-06 04:49:12.067771	2021-12-23 11:16:49.319438	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
287	Utsav	Patel		\N	\N	Utsav123@mail.com	t	\N	zidCPbP8NwsUvR7sRI72LAtt	$2a$12$l63iHjr1W3mu5l2vZZZtlOJ5niQdlFg7G6/FkbKswaTn24uQMSVdC	EmailAccount	2021-12-06 04:50:39.303176	2021-12-23 11:16:49.385946	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
288	Famina	Kolhata		\N	\N	famina123@mail.com	t	\N	N3tornaAke6zoccIcOxQIAtt	$2a$12$E34Eaa8VqGSrjdaLQ26AmOL4DK4rEOjJM8RQk5E4R2x6574Hw1wx2	EmailAccount	2021-12-06 04:52:37.384715	2021-12-23 11:16:49.394705	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
290	Some	Ssss		\N	\N	ss@gmail.com	t	\N	dvHbCOCr1IM6UFns2uTYdgtt	$2a$12$dYhyePaS/4v6UPGhONTK/OssJbZvclhbxUtVuUef158gU6U2yJozy	EmailAccount	2021-12-06 08:17:38.277026	2021-12-23 11:16:49.415456	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
285	Ritika	Verma		\N	\N	ritika123@mail.com	f	\N	95a5QUvmP0xVQZHXi1CulQtt	$2a$12$97eCPEHOkSU4da/Bfv/G3ezNhKXNukfCbRN03t0Drkchtzbe/VyZm	EmailAccount	2021-12-06 04:48:01.667983	2022-01-21 07:53:00.995788	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
280	Scarlett	Johasson		\N	\N	scar123@mail.com	t	\N	HHy1bfXHd2gDzkNPwJjE0gtt	$2a$12$Zwcan.hizLxIJ5Q63v6yUeiFsZtsEj6QyFIuqRh70ZypikN2emO62	EmailAccount	2021-12-03 09:40:36.094512	2022-02-02 04:37:22.972729	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
292	New	Account		\N	\N	newaccount@gmail.com	t	\N	AWAg0uXPWkLc8QdsQvWvpAtt	$2a$12$EefO7FOPSswaKWgC5/ARnOHci3r.ORfZTEdR8j8uFfgqoNPjiwXZm	EmailAccount	2021-12-06 13:11:32.505433	2021-12-23 11:16:49.592339	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
296	jason	webdale		\N	\N	jrwebdal@buffalol.edu	t	\N	XxluFQsKBmEpfsnWR1uXOgtt	$2a$12$RiyWB2mxYDjW2AzsOI9VMuBcrSa/klZeCfC02ARz.vKHBlGZvF8oy	EmailAccount	2021-12-08 14:27:35.080122	2021-12-23 11:16:49.711553	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
276	Some	Buddy		\N	\N	wastoldme@gmail.com	t	\N	pjkHJwlCChFkoPbuRm2Qpgtt	$2a$12$8uG.YmOG3xhXD9FejCfyVONl1SO53Z4DU2kuj.jc1/mgarP5HBVAG	EmailAccount	2021-12-02 08:08:02.470103	2021-12-23 11:16:49.719993	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
310	arun	murugan		\N	\N	test123@gmail.com	t	\N	NvIVvOyzmyaIwQ55JNAhuQtt	$2a$12$D2dbAqyJGKvILJcZBruFBeQ6znrTWJRPOtHXoRxOCh.y.yQ15me0.	EmailAccount	2021-12-10 11:06:15.096555	2021-12-23 11:16:50.298185	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
306	project	test		\N	\N	project123@yopmail.com	t	\N	hxNSVyZHMIcgX78ptpxP1Att	$2a$12$oMsYyZdH9B9NMPqDPIGV9.S/4/DzY3iyDATrVBQAwtXXkE7/l.rwy	EmailAccount	2021-12-10 10:13:28.230908	2021-12-10 10:13:28.230908	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
307	project	test		\N	\N	project123@yopmail.com	t	\N	NoCrH9Z6ld9KWWaKfb93yAtt	$2a$12$j0.ITlJDw2HJSQ8U9v5cAuMaPEzngmpB1/ZRKxEKuX/hU5xr0nqq2	EmailAccount	2021-12-10 10:13:28.306601	2021-12-10 10:13:28.306601	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
308	project	abc		\N	\N	projectabc@yopmail.com	t	\N	pNYiZ71HuySyqxJtJ2Q9aAtt	$2a$12$OTgsWhGB/.YhkThvjf92NevMxpccmGF15SHWPbA35Me9Lt8/.Q2JG	EmailAccount	2021-12-10 10:59:15.300043	2021-12-10 10:59:15.300043	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
309	project	abc		\N	\N	projectabc@yopmail.com	t	\N	nZ5SOcxCmXivton93D93Mwtt	$2a$12$Ty0KN9mWzih2Tzwi0.BLjepWsv3j/FQlPA3CBtSvu3aGUb5kEYFi6	EmailAccount	2021-12-10 10:59:15.680149	2021-12-10 10:59:15.680149	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
312	project	klm		\N	\N	projectklm@yopmail.com	t	\N	idtOMKcRkpAIZhr0XWOr4gtt	$2a$12$P6QMUteK/r2Z4QwgL7Azue..O481QAK6wXFU23gIsBJITvPTG1s2C	EmailAccount	2021-12-10 11:11:28.087219	2021-12-10 11:11:28.087219	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
313	project	klm		\N	\N	projectklm@yopmail.com	t	\N	qbJMVrdhMAbasJFIT6XQ9Qtt	$2a$12$vdFR7KfFhpjI5OvNrxoIjOUw5JthsPTZk5dY.yVN4jklrqnrMMnyG	EmailAccount	2021-12-10 11:11:28.49965	2021-12-10 11:11:28.49965	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
320	Jackie	Chain		\N	\N	Jackie123@mail.com	t	\N	rUPUGUMxmn8sLJKipaNUgAtt	$2a$12$eEGka8LtF0M3kElqiAJqouDIih8QKUJReZsq8nY6WP/ySJgsRU4TK	EmailAccount	2021-12-14 11:27:38.118482	2021-12-23 11:16:50.578796	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
318	Name	Name		\N	\N	ponado3408@mediafate.com	t	\N	D2vYNic6DlLRntYw7X0FmQtt	$2a$12$SMN/R3JpCh1FzmsrBu3Ddu/sRPWlKRMEzboHXg30ipFBHXMAZyNDm	EmailAccount	2021-12-14 10:44:28.111118	2021-12-23 11:16:50.602891	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
317	Skaj	Jask		\N	\N	yobem47142@leanrights.com	t	\N	vA1SapSjFPWlFOpvg1Z0hwtt	$2a$12$B1fNr6eVWhNSHRRQGacxUubG9LWWFjwPNi1MjfnANJ.MfixC.IgWC	EmailAccount	2021-12-14 10:43:23.501934	2021-12-23 11:16:50.617028	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
316	Sign	Ngis		\N	\N	sss22@mail.ru	t	\N	jzhaRNNx6vIHWJEfA6GdTAtt	$2a$12$VzdvNImFJwAqjw/V08Ns6.ZgMK2BjayTZuUmiv16MNVxpXsXahUJC	EmailAccount	2021-12-14 10:42:24.887909	2021-12-23 11:16:50.680483	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
315	testst	testst		\N	\N	testst@yopmail.com	t	\N	YpvSkXt1TlKD4TfZbvWZ2Qtt	$2a$12$0rzzyJVsibiEOecml8Dr3OufZLDeqXTLAxEqSlxQdSIFs3.5wUbkm	EmailAccount	2021-12-14 08:25:28.166422	2021-12-23 11:16:50.688671	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
321	Some	Thing		\N	\N	something@gmail.com	t	\N	x5OJI5Tlfw5dkE2B0sktrAtt	$2a$12$g7osQfR3JTWKXSe4ZbTk9.ywJ8UDx/uo24ilBo/oKVhT7WV70CwHG	EmailAccount	2021-12-14 13:45:59.799615	2021-12-23 11:16:50.699141	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
322	Namwe	See		\N	\N	ees@gmail.com	f	\N	aTE7bMAL7OhBNyvQqwe2tgtt	$2a$12$3/S9B/xd5nde3HLZ7gn64O1zYqb86lhFvpHxuRvQjJhzBjihFTDZW	EmailAccount	2021-12-14 16:14:38.60497	2021-12-23 11:16:50.707093	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
298	jason	test		\N	\N	nitefo1116@iistoria.com	t	\N	Ax4n2quNobi45LeipHQoNQtt	$2a$12$v2ll0OJBTLYvmdsqSoSj4O.UlFuc4pfEcZQQTqG45StXuye8KGhLG	EmailAccount	2021-12-08 14:32:45.991394	2021-12-23 11:16:50.026488	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
277	Ssss	Ssss		\N	\N	adssf2@gmail.com	t	\N	DoSFrQht5Kf0QTjDcb0YEgtt	$2a$12$FcOvJC6hNVKBkBIQQSsUjO9r2/e3jQ9c/e88Np89EpBK3N1RJGHB6	EmailAccount	2021-12-02 08:17:26.780553	2021-12-23 11:16:50.045133	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
185	himanshu	kumar		\N	\N	himanshu@protonshub.com	t	\N	OR1TS4GahvPhnCcz9YuKwgtt	$2a$12$gyAyZrarTIxR9sEeHnN/WuVwExHiZBUfRX3rdMOaNimOaXiznPZki	EmailAccount	2021-11-15 13:48:52.092	2021-12-23 11:16:50.094591	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
299	test	account		\N	\N	test_account1@yopmail.com	t	\N	zU3tXnczuDz8dQRNZxlQhQtt	$2a$12$ji9laybIQX7vnPRbRemZXuTw9ImHocLQR/zZ4uTYxzoYCO3BQJVpW	EmailAccount	2021-12-09 07:41:47.683074	2021-12-23 11:16:50.107162	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
301	Some	Some		\N	\N	so2232ame@gmail.com	t	\N	p4aMHwVLFtws5z4E9H96Wgtt	$2a$12$7uBN3koL40Rv9UzEGxzBkOxN6j6aXtwO2FDJ97ea9C3fM0X7kYhkq	EmailAccount	2021-12-09 12:05:36.89987	2021-12-23 11:16:50.115748	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
302	Name	Lastname		\N	\N	seommassa@gmail.com	t	\N	zo2Vfb3e6Y4rIpvDEWFbHgtt	$2a$12$aNiDgwzZth6Vxi9ydn2EQOl4NjYHBAkqqNo/3CfXBzccBkDdxBda6	EmailAccount	2021-12-09 12:16:26.957784	2021-12-23 11:16:50.183262	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
303	Some	Name		\N	\N	2222ss@gmail.com	t	\N	ZdmczOKalywXBpoOUkkS9gtt	$2a$12$gi9AVW9MiaGHTg.//t9Ehu3LkKjTzWdCIauBJ20gQQuq881tzERhW	EmailAccount	2021-12-09 12:58:04.887803	2021-12-23 11:16:50.195706	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
304	NAME	name		\N	\N	namewmeme@gmail.com	t	\N	l2fh5IyLDCbljp7ECDPOxAtt	$2a$12$Z9elXhf7.Lg9jYh34zfaWeMxYJ9Avcu6GpQVCwYy568l3Db/Ur/4C	EmailAccount	2021-12-09 12:58:31.484495	2021-12-23 11:16:50.207272	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
311	project	xyz		\N	\N	projectxyz@yopmail.com	t	\N	iGEOsnh3nKQzB7mxM3G4DAtt	$2a$12$IcCpYfc65w6bYpD7.dB/tOjRBp74yFhMtITkamLn7T7zNR5hK1As2	EmailAccount	2021-12-10 11:08:49.520664	2021-12-23 11:16:50.308107	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
242	Some-Some	Name-Name		\N	\N	sagomog605@keagenan.com	t	\N	lfrjeUKX9uxoHywuRdOnhgtt	$2a$12$NlPPg2ONzyQnkEnn/8P4Eurl5HeBeelFBLqeE0DBLMnrV7qjbgAIK	EmailAccount	2021-11-23 11:20:10.629473	2021-12-23 11:16:50.384703	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
305	Sara	Greem		\N	\N	talojuz@boximail.com	t	eKzJIAcx9XS8sCiKe8EPQv:APA91bHdvbwdzW9QiX0kzBQ47SeQQ1p4s2W83_QRX5FiXwTkcKmuW-qcTCPrb5dj5n0qgNinF8zCwinmhcljgWCu2BLuzX4gWHqCC2nDLMX9IIgkdi1sm_ARuNTPq2HnYZAJbdd9hiE5	WUVsT4kpua8h8pKWplWrBAtt	$2a$12$hmgLzAaiGEqVHq33UTbPWe.9YT5H2QBUn8JyxF4UEE8AF1XAHPbfO	EmailAccount	2021-12-10 06:53:53.507636	2022-02-02 07:15:10.261785	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
319	dem	sure		\N	\N	dem@123mail.com	t	dOtTA-cK1_ZUj8o2Xn2Sfi:APA91bGhqzKzt_NmhA0G1K3vI4eNNOE-LvfogcJEJDvVGZWwfzjazwMdXfuKBwFMx5zIkqJdrdsXTrfixtmd7YUZuIejkwA35ka8EC1P8dAtoSNCL8xhv8nwifL3bsfXkv9_q2WoZsuK	YRWGU4BeSxtPavwTw1MJtAtt	$2a$12$9HmPmOyTQdiyOaSkFjAHOOHAbc4NJFrIUIZNrJwX02YjWlG/UeW8C	EmailAccount	2021-12-14 10:53:33.803369	2022-01-17 04:12:19.282245	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
271	test	testt		\N	\N	test9@yopmail.com	t	d8rg75qeqg8XJJFTLNZL8r:APA91bFCY2tEu2uI7bxu-CgEcR8boCrxXSZsUmmBnB8gDxFfJDATGkkBLbJuaK_PhCiINUy4hYByvWH2I-f92UqqVYgnhqtgMXuyOEvQMZ5BGLPfrcHTPm6Szcd_UYDQKrT4JBqsZ7S-	uZCGiw26H2LKs6ljc3dwZQtt	$2a$12$wIbuvFncco9gxiexcVjWZuR4tBlZBZjHkeomPqOXdyq488nDsbGWW	EmailAccount	2021-12-01 05:34:48.790498	2022-02-04 10:56:57.664265	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
297	Temp	User		\N	\N	tifaxe1388@leanrights.com	t	fLVV-JQM4ngReUEDqh4RxB:APA91bEH2OQVn0pIrutbf_GUc438I0oz-TD883jGQgOON2kz3TjDVzmtE0B1sGN-Kz9mDXxO5VfavamEKdb8mEYPsWr1e3awGETaLj3eD1dVde53USbqw7tkpz061iaWxW96vA9GugQA	uBj5buPS6pa8IvkjQP4WAgtt	$2a$12$znBW4tcSY0xo9JSR6fA05OtFe3tnNErYhzhPGh5olgH1zjIhge0Yq	EmailAccount	2021-12-08 14:27:39.573635	2022-01-17 10:50:41.230407	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
156	arun	murugan		\N	\N	testing128883@mail.com	t	\N	edjlvjO9ovsdux9mw22w8gtt	$2a$12$fEByjQkb2bk4G20oRBuIeO22dokepxG6mg/r0bxocjI7xxowAlzSC	EmailAccount	2021-11-12 11:50:07.272151	2021-12-23 11:16:50.395058	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
139	arun	murugan		\N	\N	ujjavalbarot2+117@gmail.com	t	\N	pdQQJ8gMAGCq70lWK3cbrwtt	$2a$12$QHAq0YNmERzHOwd.pzyE1.aqRFxIgRHL3yCUukFoeph9dFBhoMZtK	EmailAccount	2021-11-11 13:22:40.078232	2021-12-23 11:16:50.404421	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
41	arun	murugan		\N	\N	ujjavalbarot2+21@gmail.com	t	\N	UpLWKPkisx0evcYrbvepXwtt	$2a$12$j9gQbfnrprubiBHgFOuQZO3XTI9IZp6phsiGZDw69PWnu50DmZ10i	EmailAccount	2021-10-27 08:12:45.638056	2021-12-23 11:16:50.412803	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
20	arun	murugan		\N	\N	ujjavalbarot2+5@gmail.com	t	\N	iO21NcfJQvKe87xuQC0TKAtt	$2a$12$T69ErrczMdFte16G3/bGJuElQqm0qeiNsKfm8FJCpxpD12RRzqE16	EmailAccount	2021-10-26 12:30:49.680923	2021-12-23 11:16:50.422046	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
65	arun	murugan		\N	\N	ujjavalbarot2+44@gmail.com	t	\N	8HfAeRiYeGvd3TzeCJLDVgtt	$2a$12$0fdiWVcyww2tkJxXiq.WXupJ.wlee/9PH9IG8xx.bVFxLIq3Gvy2W	EmailAccount	2021-10-29 06:28:51.262173	2021-12-23 11:16:50.484824	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
101	arun	murugan		\N	\N	ujjavalbarot2+80@gmail.com	t	\N	T1hg0b2rw3ibr70zSUY60wtt	$2a$12$SjK/6mvBiHew.i7iqZO8pOnzZpP0K0WUz97qNE0iztiJQGLKSJ1Si	EmailAccount	2021-10-29 10:50:55.258046	2021-12-23 11:16:50.501231	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
93	arun	murugan		\N	\N	ujjavalbarot2+72@gmail.com	t	\N	cd081rRkTJzdfMI85rWWrgtt	$2a$12$ZjcjMsxOJBoJeVnaGoDkE.rTt4m1snRXIERkwPmQCfwWmr9ii4hVW	EmailAccount	2021-10-29 09:45:58.666009	2021-12-23 11:16:50.509012	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
314	tesstt	tesstt		\N	\N	tesstt@yopmail.com	t	\N	g7wA0oDH3mco0mfrTrwa7Att	$2a$12$afoX1E2eep4hP.CwezV6U.yvl8lEEyhHb2sXKGF0Y3cV0TccCtS0S	EmailAccount	2021-12-14 07:53:01.875659	2021-12-23 11:16:50.518084	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
339	gopal	bhai		\N	\N	prajapati3968@gmail.com	f	\N	jSC9F2BXYxfzrv8PoEeY4Att	$2a$12$O/S3mNfaYFnY9/6f7u2CYu3eqbJcGV1eS0z6DyLLjZ6iDQDnz83ky	EmailAccount	2021-12-23 13:13:48.279391	2021-12-23 13:14:13.763256	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	\N
340	arun	murugan		\N	\N	prajapati14399+1@gmail.com	f	\N	gM95Vr1LgBD3HGOUZ6Txxwtt	$2a$12$cb93og/1tNWoKnd3cSGb8u4JEOByKve5hMRhuI/QvOrdaQ/H/15lW	EmailAccount	2021-12-23 13:26:16.982722	2021-12-23 13:26:42.362275	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	\N
326	Some	Ffsddd		\N	\N	safoge72222@ineedsa.com	f	\N	9Urjy41xrJKo6tP5joIodAtt	$2a$12$j40Ws0d.T6hs47wk4kznde/cOCH0Gi7bG8CeZyaYKGkyJNGrwt2ai	EmailAccount	2021-12-15 12:04:02.787102	2021-12-23 11:16:50.78125	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
327	Name	Lastnmae		\N	\N	sfdsfgcvc@gmail.com	f	\N	xXQhZfoIDefRHLr70ZbLDQtt	$2a$12$IZ.GOrA54LJa5NkUvnXDBOCiQTql3zzxdRadLIXebOEAAKlAFeIYK	EmailAccount	2021-12-16 13:10:52.695325	2021-12-23 11:16:50.790762	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
333	Ujjaval 	Barot		\N	\N	ujjavalbarot2+1001@gmail.com	t	\N	Yjvx2Tg9CPKu9LH1f8HZAAtt	$2a$12$amTZR24rYV7O3hBrYDtXzOruOYaYYzTkxDLCMuS.PZVrFRgQFgcNG	EmailAccount	2021-12-22 09:19:10.185956	2021-12-22 09:27:27.003309	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
335	Name	Lastname		\N	\N	lastnameandname2A@mail.ru	f	\N	cHBPlVDywS83IlaTMNYrTAtt	$2a$12$affCacP531Srx9w242NqgO/S.a5RRdIyRJsa7Rsu3Xhcb56Kli71G	EmailAccount	2021-12-22 09:48:50.911761	2021-12-22 09:48:50.911761	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
336	Name	Lastname		\N	\N	lastnameandname2A@mail.ru	f	\N	VASWl80SgUoIe44rCT6RGQtt	$2a$12$jZhihh9AVsemOQpAohj1sev.bnh67V7gCNZQn/ArcUypXcwj7xfq2	EmailAccount	2021-12-22 09:48:51.917005	2021-12-22 09:48:51.917005	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
342	hsbhbss	nsnjnsnjnsj		\N	\N	prajapati14399+2@gmail.com	f	\N	hjSdqrERaFiEfasuTIJxLQtt	$2a$12$xOqYjQCdFn9VD1/9NwRwqOxIA9sn0JJP8r6KFZFbLKEUh18tTBW3K	EmailAccount	2021-12-23 13:37:13.763131	2021-12-23 13:37:21.4127	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	\N
87	arun	murugan		\N	\N	ujjavalbarot2+66@gmail.com	t	\N	943oMHt0BB6WTyelUTRkkQtt	$2a$12$HxzxkVakwgGOTbDklDCdQ.M9a62Fxhxws6ZaGPN7a9/VYp9VMHslO	EmailAccount	2021-10-29 08:22:34.759503	2021-12-23 11:16:45.792889	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
134	John123	Johnson		\N	\N	johnjohnson@gmai.com	t	\N	6SMe6BGAkQrnMSsCnkZJsAtt	$2a$12$8fs1BHClpMPEJ2.mEZpM0esEzIidMLrYBiPhnFGSt/ulmyloldLDy	EmailAccount	2021-11-11 09:36:00.680839	2021-12-23 11:16:46.589758	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
162	bfhfghgfhq	BOGUS		\N	\N	lalji.tatvascoft@gmail.com	t	\N	4H7rAo080r9I6rEdJO1hpQtt	$2a$12$932pRAeQWYeVg6CvJM4W9uQ6P1ef3hQLZjEo6KorHD6FXhKmXY1Ku	EmailAccount	2021-11-12 13:12:31.076428	2021-12-23 11:16:47.416999	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
197	Vivi	Hivi		\N	\N	titahi9461@gyn5.com	t	\N	nk2lZb1nBXMrp3cqQlwGswtt	$2a$12$huX02hGn7bWMDGnryjsTTO5w7W8SkH84WUGqU4nqSAec4IyzJhxtK	EmailAccount	2021-11-16 10:33:06.073587	2021-12-23 11:16:48.212706	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
226	Name	Name		\N	\N	safoge7222@ineedsa.com	t	\N	b55dOQQ68pqfyHQQjfAaRgtt	$2a$12$gDwUnD3He34fn4tP2yWBVeo2T9sFuRFExgvZF6mLxGUnIgPwI41kW	EmailAccount	2021-11-19 12:04:09.373319	2021-12-23 11:16:49.118155	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
282	Interesting	Man		\N	\N	Interesting@gmail.com	t	\N	C2qdoKvduXIHPRIAmD7dUwtt	$2a$12$Sy0RxI.mwwgaGEOJDk8WH.2dfP3Vh6ZzUmT9yFGwzcvV4cZGuI5nS	EmailAccount	2021-12-03 10:45:47.078014	2021-12-23 11:16:49.217445	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
294	Name	Mane		\N	\N	manemane@gmail.com	t	\N	MQGrlujoS3DkPCWF5NY5Fgtt	$2a$12$8zu0ncv3NnFdztViHK/nr.wGSRVX80Ucks2kOYCoVy7HKDbTuOdga	EmailAccount	2021-12-08 10:38:14.419003	2021-12-23 11:16:49.680342	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
325	Some	Name		\N	\N	somename@gmail.com	f	\N	OkO4kLYrcuvFysTAN47GvQtt	$2a$12$kDVxKZDEetO96iXNx4wpVueMG7Q54clScgI6asgyZTgexJK5m0h8u	EmailAccount	2021-12-15 08:20:56.996981	2021-12-23 11:16:50.716717	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
328	Sss	Ss		\N	\N	ssadad@gmail.com	f	\N	LZjOW4U1zuKDtlNarCvCigtt	$2a$12$7pJI57.llNMyYuJwdNHepeP0Dy8pLhimaK5yjzyRpXjwf699wqU.G	EmailAccount	2021-12-17 08:39:01.491011	2021-12-23 11:16:50.799613	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
329	test	again		\N	\N	test_again@yopmail.com	f	\N	5mFA3NJUWTFCfTuV3Zaq6Att	$2a$12$AD/Xjs2p3LShOO5WiSHgve.CMoZ42SYLxIcZ778f0hQsneO1j8KSe	EmailAccount	2021-12-20 06:44:47.520678	2021-12-23 11:16:50.808564	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
330	Reeddhi	Pandya		\N	\N	reeddhi.pandya@tatvasoft.com	f	\N	QWjXFSsEHRJirG4zZGk49Qtt	$2a$12$PK7zcPd02elhTjSrESWDhuk7teierV7qYbBOGiNRWuVszHAtswRq6	EmailAccount	2021-12-20 15:12:10.665074	2021-12-23 11:16:50.818031	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
331	Reeddhi	Pandya		\N	\N	reeddhi.pandya@test.com	f	\N	ioKIbChUMFerCkqH5QQTjwtt	$2a$12$KPPoCW9AHKo15Z7aVqyCVu7i9I8kb9cYOUkLmRf1GVk5yDlkldYJK	EmailAccount	2021-12-20 15:18:10.785442	2021-12-23 11:16:50.880577	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
332	Son 	Flow		\N	\N	sonflower123@mail.com	f	\N	bLEBPgRYVWAE3vcLTM71Swtt	$2a$12$GDfKyM57cSqvhvTR1xtpbeToQO8lyMFkRk8Qfygomyn6RPs.SmeN6	EmailAccount	2021-12-21 10:26:00.184672	2021-12-23 11:16:50.890279	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
334	Praja 	pati		\N	\N	prajapati14399@gmail.com	f	\N	7ZHgq2TKLELwBMIyw73rWwtt	$2a$12$1DUkh6KrDVQxdWp74KI8ROYBl3WbBPZJK5g1t66P/Y31CHtjxsPm6	EmailAccount	2021-12-22 09:47:17.890105	2021-12-23 11:16:50.915118	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
337	Hale	Male		\N	\N	bijow74866@xtrempro.com	f	\N	0tKsGQ0w2xJ9ilB6wDqldAtt	$2a$12$8qn9DpfYmoBNovPn8QpqDuIJy3VkbLvMsbHLA/9.X1fAWmu08/nei	EmailAccount	2021-12-22 09:49:55.88409	2021-12-23 11:16:50.977143	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
338	Some 	Some		\N	\N	retay41714@ztymm.com	f	\N	2AEHk1GrKtkA1TrEhdfZ6Qtt	$2a$12$3ct3ZgSt79404F16oJb8euxIJHPHMDNIfRCS4h3YAnR8SPhKY9Tk6	EmailAccount	2021-12-22 11:36:49.485529	2021-12-23 11:16:50.986617	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
343	hardik	patel		\N	\N	prajapati14399+3@gmail.com	f	\N	qir407UaKDh1q27heBcvQwtt	$2a$12$fBHk51OHC6fKNeZl8BJPoekwYgf2PSICnep09ZFEBG5wY0BcT/TFe	EmailAccount	2021-12-23 14:08:33.408924	2021-12-23 14:08:38.732411	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	\N
190	Jason	Webdale		\N	\N	jason.webdale@builder.ai	t	\N	15tZ8z3SOUMlKTadUXibiQtt	$2a$12$MS3yjC5QJhoSmBONdlJtoeywM0EjewmnbJeVDwo.y6PC.eObUaLKO	EmailAccount	2021-11-15 14:49:47.988018	2022-01-26 14:06:11.728279	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
344	arun	murugan		\N	\N	prajapati14399+4@gmail.com	f	\N	ZocQai7lnWBtfv3tvJicZwtt	$2a$12$uQGSDO/TWw8VJv5jLwk5Q.lpZENiJIYAqy2sUXott3q9EYus543be	EmailAccount	2021-12-23 14:12:33.392931	2021-12-23 14:12:54.775111	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	\N
345	ajay	murugan		\N	\N	prajapati14399+6@gmail.com	f	\N	Qk2GjnajlYmrajrF8Lew3Qtt	$2a$12$sunzpyXPkRl38RpDepzkG.R0VjPKHJ17hOWfPNEXGHsT1EVeqrEpK	EmailAccount	2021-12-23 14:16:04.20695	2021-12-23 14:16:07.579681	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	\N
289	crish	gayle		\N	\N	Chrish123@mail.com	t	\N	ESV32QBnqxMmhTOnmTzMdwtt	$2a$12$r3uEOvRki17wldYdqtwNRex7G8QprA.zP1fsKwtio56ZaMVA5AWVW	EmailAccount	2021-12-06 05:03:04.679921	2022-01-03 05:52:53.082486	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
356	sharukh	khan		\N	\N	prajapati14399+14@gmail.com	t	\N	1GVQ62nQRuPTj51bJJt3egtt	$2a$12$OygzN529lSy3UuOPtLLnceRPKIAZeUsUs6JlHl/oDjeuvVA2xnhy.	EmailAccount	2021-12-24 07:23:22.123165	2021-12-24 07:24:51.421596	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
346	Arun	Murugan		\N	\N	prajapati14399+7@gmail.com	t	\N	pz1gpeZE9F3yNQCsEM7twQtt	$2a$12$BFMj39kmwhS2Or0fG7E.k.OaJuBwW3dRLp2/llxEoUR1lWeF7AwVO	EmailAccount	2021-12-23 15:14:41.778663	2021-12-23 15:15:12.595341	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
347	arun	murugan		\N	\N	prajapati14399+8@gmail.com	t	\N	g8Gr23hB4yUeBLFdnygUfQtt	$2a$12$0dKToP/yCMZTpRaGRxTM3.hOJn2WNBWODIs9N5kRy1zjovNOvw7ae	EmailAccount	2021-12-24 03:58:48.010117	2021-12-24 04:24:06.892999	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
348	arun	murugan		\N	\N	prajapati14399+9@gmail.com	t	\N	hFiB6CVdGisB4sEo3Oziawtt	$2a$12$A/y69VFYmLxxdJNfZ.OP2u.mTFOLnks7aexMHoY5BjjqMFXcx194q	EmailAccount	2021-12-24 04:42:14.707479	2021-12-24 04:59:38.710478	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
349	ema 	recka		\N	\N	prajapati14399+10@gmail.com	t	\N	geRRromgpmSraZH7O2Fekgtt	$2a$12$VmMnu3/NAGVc0F4xmRqdZ.V.PS7PPTfd.lO0ltM4akGWvjWo2tVD2	EmailAccount	2021-12-24 05:01:42.986322	2021-12-24 05:33:23.903237	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
357	kajol	devgan		\N	\N	prajapati14399+15@gmail.com	t	\N	0e3OjRmaFYtLDXNRqnJP9wtt	$2a$12$FlzTlKStcdo4ZCA2enY60ePCGBd9JDv1/Uln5FegOJ9LRcYg2rtPW	EmailAccount	2021-12-24 07:25:48.003328	2021-12-24 07:28:42.686812	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
350	asvin	Prajapati		\N	\N	prajapati14399+11@gmail.com	t	\N	hh7V2sYcjsX4OnVG6mFYJAtt	$2a$12$tE8mrRHOwY6zBB7TtAl.Au2SZmU55uRyea5CLFn4LNK6D.TxW.ADS	EmailAccount	2021-12-24 05:38:18.666683	2021-12-24 05:40:54.721941	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
358	Hanna	Test		\N	\N	gosesifa@getnada.com	f	\N	vmCv2GYaGEdzBVDe3YwHeQtt	$2a$12$vvmk1Bz87lL4rIlcQN6pIOEhYPyE44NOKmGbWo6855SHBGuJwz9YK	EmailAccount	2021-12-24 07:47:55.096746	2021-12-24 07:47:55.096746	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
351	sima	ben		\N	\N	prajapati14399+12@gmail.com	t	\N	tk7arzcG2o6HpeExj4AOuAtt	$2a$12$P0NWfho5F1oJnBMtwdU49.yhYR4L5sefcv1AlUUv.yjlhfE7urU6C	EmailAccount	2021-12-24 05:47:59.976499	2021-12-24 05:55:02.228614	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
354	test	user		\N	\N	yaxaxi5431@wolfpat.com	f	\N	wOhrtIZ63mmLMi3V21GW4Qtt	$2a$12$yi6b3uU0Qg2STB5sCo9YfugmnWK9WkjchjVkAYuFLsw/DvIk7kvRC	EmailAccount	2021-12-24 07:17:14.730919	2021-12-24 08:12:06.286441	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	\N
352	ujaval	barot		\N	\N	ujjavalbarot2+1100@gmail.com	t	\N	t5QL0X6fW0JCEZj6D6cppQtt	$2a$12$gXqclbc6iI4fkfSCus/sku6rcm06Ed57l1a60sevafJxZ600JW5ea	EmailAccount	2021-12-24 06:05:39.203516	2021-12-24 06:06:50.784413	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
353	abcd	jdnjnd		\N	\N	ujjavalbarot2+1200@gmail.com	t	\N	BXvIQaLrFcx8voNlbz1MPwtt	$2a$12$Feroo.VGEoJaM18XMKMlBuIl.A50yOb0F4nhaKQpun5NB/X17d2uS	EmailAccount	2021-12-24 06:07:59.788547	2021-12-24 06:09:13.678974	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
355	salman	murugan		\N	\N	prajapati14399+13@gmail.com	t	\N	Hyskpeo8GWSHktKtuMVVcgtt	$2a$12$unqLmNeN58SPItGpJ1/d6u7/eJKewa/LeDIowK06h9P8kOlpTeP5.	EmailAccount	2021-12-24 07:21:33.99034	2021-12-24 07:22:27.179489	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
359	Ritu	Music		\N	\N	vewej58220@ritumusic.com	t	\N	ZrJJ6iUFfdRFOcK3GLjvdgtt	$2a$12$jNPc6Ba1qNzqLq2WaQ.Y5O2pExVJXqW1DH8OppLqqQmSKZO.l3Buy	EmailAccount	2021-12-24 08:14:56.972218	2021-12-24 08:15:50.760047	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
260	Twinkal	Khanna Kumar		\N	\N	twinkal123@mail.com	f	\N	raKLjhluNrOoMyigldbRUAtt	$2a$12$i6OYfm0rzY8Fc5w3ubuqSu..1gMf7SeG4ZNFP3TNv6u109sW29IG.	EmailAccount	2021-11-29 09:08:11.881714	2022-01-21 07:36:38.396407	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
259	Aksay	Kumar		\N	\N	aksay123@mail.com	t	eJkB0mSucP_W5y75UvOmrs:APA91bHJjux3dYL2OKvj4z2YYonvyejx1BdXUrOJfhU_9ozj_DCopb-YxLPr12XwJkxVeE4JBIOssjVY8nxrXWL2QXegLq4jyc6Vy-85TVKcDFEMlh3TN650QSWyh2kK6ydO44rgR3oS	j8EqX3ZSJ4mCetNU0F3VRQtt	$2a$12$qeY.UIo2PhFYLs2odtsHiOMWGsH6aRUnCVNHP9.BuVKmLNQZLU4ty	EmailAccount	2021-11-29 09:01:19.206662	2022-02-04 10:51:52.567828	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	f	f	f	t	t	t	2	t	\N
362	Peter	Parker		\N	\N	cebal43434@zherben.com	t	\N	AQtcgNMrAzcUnEDQQyMazQtt	$2a$12$MQ0ZHoKNt50TarSCF/i.F.pq1kn0tN76WDzSV2b7fmViNbL2POlee	EmailAccount	2022-01-04 10:17:48.331395	2022-01-04 10:19:29.336382	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
129	bhawna	p		\N	\N	test123@yopmail.com	t	e0aOQv3MhIfpxAo1MerhQj:APA91bEpM4CHYR4s6jovY5ko7cAq4ipnM5LbbZqebb0GoFQKLTEka8s4sy9TyXBuo-PgyJ_QIFjUGLAQ32UZKgCbpgWdg5RZtuKy1s5hSDeJZCiIbESon6LbHS-uCiFLGi0GoHe5cz2b	iQRVBkw7MKH7QBrsQFfzbQtt	$2a$12$VRF3FMc8FeQGDNm7gXVSkesuktMABX78BaknH81t6c92bvcBtYzCi	EmailAccount	2021-11-10 12:36:51.358082	2022-02-07 13:08:50.660745	test123	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	2022-02-02
363	Peter	Parker		\N	\N	facamo4596@zherben.com	t	\N	4rCtzIqXVlwW1UKDe9oibwtt	$2a$12$2dhX3Qryp.XhZSb70UFOQuOgpmsFRnrZRybT/ioiWVKjRYaOIJE4.	EmailAccount	2022-01-04 10:27:22.00646	2022-01-04 10:28:35.599657	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
364	Kaxer	Rexak		\N	\N	wojipan893@xxyxi.com	f	\N	NHDEdWRr6FGKQNr7Pc2QQAtt	$2a$12$e0UbVOLv7KS2LETXD8U6K.t93lMFZU5WfiExB7xg2e9l6YvvEdK8q	EmailAccount	2022-01-04 10:44:32.515913	2022-01-04 10:44:39.132043	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	\N
365	Dan	Vall		\N	\N	j.valles5116@gmail.com	t	du2XX-iMy2fmlEA3GAGsMZ:APA91bH6TCuCPyWEBMAtZrqqZzeFj93oB1_2TlrfeAudeR7TcgoHfirVVZiCDezixt9JPjOOMdL5hBjtENv8C8QDQh1KclCtJswUmZdH4Xqh7vjE7Ev8oLdhXNjfUJvBSoTR1GWgcgXW	bEV04f0PyedWMF70lrPM4Qtt	$2a$12$pfONy1gs8DCfyvCz3LNG8uBvUzfsqgIUwDCfTYsmAngzViLT/obMu	EmailAccount	2022-01-04 15:11:49.289762	2022-01-04 15:12:51.122844	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
136	Will	Smith		\N	\N	willsmithdg@protonmail.com	t	\N	8kuD14WV4Rz1Tl6ghNZKjgtt	$2a$12$Eb8GDllEKGShastDT0YdqeGy8NvGtkELZ4kBu60b.wZLoA./yvAdK	EmailAccount	2021-11-11 10:48:50.860522	2022-02-07 15:33:46.286612	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
366	Weti	Vix		\N	\N	wetivix854@vinopub.com	t	\N	2r1uisH2ajZHQrzGw49NIAtt	$2a$12$7Q5NN.1QY0GL7DUg/0Tfce0EcZ.dVVNYhkcRVU7VVpYnr1lZi3kXC	EmailAccount	2022-01-06 11:50:03.363107	2022-01-06 11:51:05.125911	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
266	Robert	Downy		\N	\N	robert123@mail.com	t	\N	Rwg6gHCI1pgGYEjADBCLPgtt	$2a$12$yT5TU5fzs/98g1EZDKuGge41boD0b9pFBKY6cnzG76n4dghzwlqwq	EmailAccount	2021-11-30 06:09:15.700981	2022-02-02 08:26:00.280457	robertdowny	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	2022-02-02
367	Rawe	Vit		\N	\N	rawevit371@wusehe.com	t	\N	vk5fbLQatXNBBHrcODWseQtt	$2a$12$m9B5D8F7WuPI0fcied.oN.AdM8YfcW5tCQyL0z4Qe8pctvAzJOPJu	EmailAccount	2022-01-06 13:18:17.327449	2022-01-06 13:18:34.180543	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
382	Evan	Peters		\N	\N	112@protonmail.com	f	\N	def6eGLlAk02mwnpPkpcbwtt	$2a$12$FEJTf1GwieYJJ/I.PyGUguL66lm3GtFE4DY5SJii087FY7u4MAwfS	EmailAccount	2022-01-28 13:06:55.419699	2022-01-28 13:17:12.871735	112	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	\N
212	Daniel	Valles		\N	\N	dvalles500@gmail.com	t	du2XX-iMy2fmlEA3GAGsMZ:APA91bH6TCuCPyWEBMAtZrqqZzeFj93oB1_2TlrfeAudeR7TcgoHfirVVZiCDezixt9JPjOOMdL5hBjtENv8C8QDQh1KclCtJswUmZdH4Xqh7vjE7Ev8oLdhXNjfUJvBSoTR1GWgcgXW	IRSjPvfPoCngP7YH6eFbgAtt	$2a$12$ofpkwDfJ8P8j330WG.vSPO.Is4gcV8k7j42TT4KgwoBuJVKRG4UPu	EmailAccount	2021-11-17 14:40:56.772649	2022-01-12 14:03:14.292352	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
368	Re	Pid		\N	\N	repid42944@whecode.com	t	\N	zjl6ZXipT2EyJOcmOupyOAtt	$2a$12$C8aO6Z47TSBOPDgQkwArVudUsrBM15NFD9DZA1690BDrKxrj849aG	EmailAccount	2022-01-10 10:35:07.259433	2022-01-10 10:35:30.787272	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
248	Olena	Romanek		\N	\N	1lenarom1@gmail.com	t	eKzJIAcx9XS8sCiKe8EPQv:APA91bHdvbwdzW9QiX0kzBQ47SeQQ1p4s2W83_QRX5FiXwTkcKmuW-qcTCPrb5dj5n0qgNinF8zCwinmhcljgWCu2BLuzX4gWHqCC2nDLMX9IIgkdi1sm_ARuNTPq2HnYZAJbdd9hiE5	HecZkxJ2YFp0jo63HUGPtwtt	$2a$12$E50m4fMbPCI9bNxFs/VLKOXBsWevocfx72bj/Iy8K83BiUDS.BSZS	EmailAccount	2021-11-24 07:59:48.276885	2022-02-04 06:50:25.868197	lena	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	2022-02-02
369	Ge	Rib		\N	\N	gerib23355@whecode.com	t	\N	778dlDraxf7FkLXaAvfcvQtt	$2a$12$2w9t4O.3McS7fcfNqTX90euMQV7g3JpM6a5kukxxOT4CSO3ZoMEoS	EmailAccount	2022-01-10 10:57:34.184265	2022-01-10 10:58:33.492846	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
390	govind	Komath		\N	\N	prajapati14399+885@gmail.com	t	\N	Wvi9rYrXj1d4u7gJQf5OUwtt	$2a$12$femQF7N065oq5Cp0QqJg2ON1p7pwLY6o8CjzM36rZeAzG/0KOaJgO	EmailAccount	2022-02-03 05:22:35.073137	2022-02-04 07:30:40.492054	prajapati14399+885	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	2022-02-03
124	arun	murugan		\N	\N	ujjavalbarot2+104@gmail.com	t	ecqJO_tljc-8LvPNgqBgdx:APA91bEErp9l2KQbh2fXhaR5iA5G7SIqnn13IWOfQF5TeOSdFKvm3-3RiWWdoMvDCpLlhx0PTgUVt5ngT4U53AVg3eybiskmIAoPxaggkCzM6QTKDoiXyb7cAOWX_hFI4XXq9Y0DV30U	5koQr2cXA4ibsltAKBfoywtt	$2a$12$Fa2w0zZE1UBqIqoebOilv.mdQJnrAcEsuJIZWGIglBLc9SzEL26MO	EmailAccount	2021-11-09 13:17:40.262297	2022-02-08 08:51:46.397327	tempuser1	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	f	t	t	f	t	2	t	\N
387	Lily	Sand		\N	\N	lily@clrmail.com	f	\N	1VQQx87UE5QPNr85oWLKtAtt	$2a$12$H/9k3F2ezk.PRhIl7iGJlO1sBn4vf5VdAL3ySXm/2clqa.Ek3wHOi	EmailAccount	2022-02-02 12:56:39.256994	2022-02-02 12:56:39.256994	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
389	Lily	Sand		\N	\N	lily@abyssmail.com	t	e3yYJdx03aBjmMeEmJFs9-:APA91bHa37ntJkhe3FxX7bcVFloaj3DOAKSqQwfHtBQf0zo7cNZeQcJlhavZF7TTVAsgjKhL4YxRYNyVpl224eRyFucE7HoaWcUR_IzT7T_B0fV6AXh96ulD2TlrcGVZNGuvpIJJB0dX	7dmna2S9myRGdImIBbnBEQtt	$2a$12$zo7QWWB/vRH5/f9g2oiU2uD3qkG49qOCCy1IV1GJm/Kmp/h20/yL6	EmailAccount	2022-02-02 12:58:08.311622	2022-02-02 13:13:09.020976	lily	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	2022-02-02
373	Waden	Waden		\N	\N	lofex73215@vinopub.com	t	\N	URPWPlxu4YctvZJC5PdtQwtt	$2a$12$oXY68ACJQDjxKYPTPftDoOg0gwqS4ELH7etN2lWqByCJ9P2l0436S	EmailAccount	2022-01-13 07:39:19.678525	2022-01-14 00:00:19.077327	lofex73215	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	2022-01-13
379	Ben	Wise		\N	\N	BenWise111@protonmail.com	f	\N	7Gr8dXwfg2RVzlm6D3uhNAtt	$2a$12$Q8tN8NnWrjnhCq6tBiL.tumW7IMC8MbOSvnuuYUb.FX6GhtkoWGTK	EmailAccount	2022-01-21 08:46:23.46105	2022-01-28 11:00:58.519753	BenWise111	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	2022-01-21
381	..........	...........		\N	\N	111@protonmail.com	f	\N	LUrjv2N5kOQWt7erJTZgbwtt	$2a$12$4C3vRDFTLIBm4tsa1.bZl.jOSOUDTAGe9WCSfjYBoQJR3o/uZM50y	EmailAccount	2022-01-28 13:00:52.622512	2022-01-28 13:00:52.714575	111	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
377	dharani	senthil		\N	\N	dsenthil.60@gmail.com	f	fuR6QmSHT-ITD68UUuT0y_:APA91bHm1NCu_sKzTes0r_O6xSdQW2KtPhBcocZrYLmDqVsIVVTuPxSNPP4OtbFY7UU2RzsBhqNbtvAKLNo5O8o-ssEeKPOSFKxVznc_hgDcGxBk6ktDgI3Bjloqekd0vo9x28iIE3lb	gWpqiftzSMu9sEwyKAtrbwtt	$2a$12$HUKLfbngxPyKajWs6x8yW.Damd3Nf1IUVO6arlLtcVT1dFn.Qp1gi	EmailAccount	2022-01-13 11:32:25.817569	2022-01-13 11:33:25.504396	dsenthil.60	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
374	himanshu	dwivedi		\N	\N	himanshu.kumar+1@protonshub.com	t	d_XI-ieX-B17QOZ5574qtc:APA91bH5oZxl3_KlpmjgTt4tO6XPPLSB5GwZjvw_esktYuz_FsB3Im_fCSEk7zApdlcijQ1ujDAuTqw2c9vQ_V6mD6XVY0W-DUHjc8kzBhLgJxNvXh1xwGSopvdzqnqhlUucDvD5FaNl	tK0QwD5IbIe5gdhvlSAgNwtt	$2a$12$i4eDhRhVAryK4I6FbQtOr.U28dWzM3n7Q7POm2GO97xy3uHsa2bFi	EmailAccount	2022-01-13 08:21:46.760631	2022-01-14 00:00:19.19349	himanshu.kumar+1	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	2022-01-13
380	test	testnew		\N	\N	testnew123@gmail.com	f	\N	XFBNFl2KhtpZ01vvVSpqMgtt	$2a$12$Kkal79vppNl7/kJePfEJXu35YfheBSBfk2x2q6EjpHdorXnXXe4J.	EmailAccount	2022-01-25 07:50:42.979467	2022-01-25 07:51:02.415541	testnew123	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	1	t	\N
133	DB	USER		\N	\N	lacoyeh382@ingfix.com	t	fLVV-JQM4ngReUEDqh4RxB:APA91bEH2OQVn0pIrutbf_GUc438I0oz-TD883jGQgOON2kz3TjDVzmtE0B1sGN-Kz9mDXxO5VfavamEKdb8mEYPsWr1e3awGETaLj3eD1dVde53USbqw7tkpz061iaWxW96vA9GugQA	Q2rDQ5lm7ocY351ELt6oaAtt	$2a$12$kjDJsRhsExLYWtMQD/meAOOitHKLbj09VjzOHgutkd8YdOikDaMPG	EmailAccount	2021-11-11 09:25:47.189702	2022-02-01 07:13:57.929505	dbuser	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	\N
378	Devid	Cane 		\N	\N	DevidCane111@protonmail.com	t	\N	rwXIGoU1B1hYtVEYfKbRVwtt	$2a$12$9VsB3O.xUlao3qjwhVRMLuoN7iba1KWyDY61lKvIK09kuZgUWODNS	EmailAccount	2022-01-17 10:00:58.270861	2022-02-02 11:55:56.078526	DevidCane111	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	f	t	f	t	t	t	2	t	2022-01-17
371	Akshay	Prajapati		\N	\N	akshay786prajapati@gmail.com	t	ezgHnGAd5ym_mnSgzwyiAb:APA91bFzbBdpP4BFXflu9ijn5qs8Bk5SqxAx2ODZBb0HQz5bt6ebswoqESP87ZhzwsIgBQ3qfEs_LjKpDm4xmzv__1fLwjSSJvnqwprnqZiok59cnHisRGUfjbBVEoqhEaziYp2YQV_4	G3yoQSeBeC7OGQT5mtdYuwtt	$2a$12$trDROC.qJYVGsQduduhRKOjDU.Hs5ZjgC/evyHKJ8pPXi1.LsByz.	EmailAccount	2022-01-11 10:54:54.17721	2022-02-08 08:47:10.364001	akshayprajapati	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	2022-02-02
388	Lily	Sand		\N	\N	lily@clrmail.com	f	\N	ePCfcQeJL36OTArvkJWRkAtt	$2a$12$RDAUWAZ.TM83icT0opGeU.LcesLDDeyOFKa2uWT8ZkjGU19vzvAFW	EmailAccount	2022-02-02 12:56:39.194427	2022-02-02 12:56:39.194427	\N	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
383	Testt	Userr		\N	\N	TestUser070597@protonmail.com	t	cRRlNGPjhbb7rNHlrUalyx:APA91bGFsemB21P__1sf18x0mryn4kjsTq4RQo_w2e0svXn_8uE97ZRjNp7nDKdmJCYBWTRIpBo6UyCUTJOT7PFhIBq9n6F0cmTt0xxx8jbcBvNQ671m8yxTa41ZBVUMMQUc79sgFS9O	kzoYuUtHPf46o1gwmW6uiwtt	$2a$12$IYEVRArqsr304bNY6kPYlO4ktPk1JBPaU/YZxqqzo3N7gMTi.D9Ly	EmailAccount	2022-01-31 10:23:47.090917	2022-02-02 11:47:45.169957	TestUser070597	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	2022-01-31
370	Evann	Peterss		\N	\N	evanpeterstest@protonmail.com	f	cRRlNGPjhbb7rNHlrUalyx:APA91bGFsemB21P__1sf18x0mryn4kjsTq4RQo_w2e0svXn_8uE97ZRjNp7nDKdmJCYBWTRIpBo6UyCUTJOT7PFhIBq9n6F0cmTt0xxx8jbcBvNQ671m8yxTa41ZBVUMMQUc79sgFS9O	rL9KNguQzbXQrl5niOvFHwtt	$2a$12$kNLe2z/aB7g3oMU/6WpeDOEB0yVsl7XHDGYWTs01qMiS6W.DeZUmu	EmailAccount	2022-01-10 15:05:12.909103	2022-02-07 07:47:56.76431	evannpeterss	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	3	t	2022-02-02
376	Sarah	Paulson		\N	\N	SarahPaulsonAHS@protonmail.com	t	\N	4SueNzyC9SqVBshcmhTGeQtt	$2a$12$/FabcE5NU2DtWn8CtBSRxOiAr5Fj6491OgKl.2rOT0Y57lsn8SyXK	EmailAccount	2022-01-13 09:14:26.765384	2022-02-02 13:06:31.727484	___1	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	2022-02-02
137	Emmas	Johnsons		\N	\N	emmajohnsondg@protonmail.com	t	cRRlNGPjhbb7rNHlrUalyx:APA91bGFsemB21P__1sf18x0mryn4kjsTq4RQo_w2e0svXn_8uE97ZRjNp7nDKdmJCYBWTRIpBo6UyCUTJOT7PFhIBq9n6F0cmTt0xxx8jbcBvNQ671m8yxTa41ZBVUMMQUc79sgFS9O	3yMUcR7w2G85xhQkPgAkyAtt	$2a$12$.vCZKirdQgjybY1h.YEkAuZzQU6Z5nU492a1MnyFF.xcXAc78FTZS	EmailAccount	2021-11-11 11:50:57.276896	2022-02-03 08:17:18.190843	ej	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	f	t	f	t	t	t	2	t	2022-02-03
392	Rohit	mehra		\N	\N	prajapati14399+887@gmail.com	t	\N	C5ZRDExmPZBTGr0iAI6rPwtt	$2a$12$HoJdUDkpXlBJ7BSbVjjZOu677.B6gRYI6qlCgbKoqr5o9UVJIMOMy	EmailAccount	2022-02-03 05:42:47.915412	2022-02-03 05:43:35.240567	prajapati14399+887	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	2022-02-03
391	Mohit	rana		\N	\N	prajapati14399+886@gmail.com	t	eJkB0mSucP_W5y75UvOmrs:APA91bHJjux3dYL2OKvj4z2YYonvyejx1BdXUrOJfhU_9ozj_DCopb-YxLPr12XwJkxVeE4JBIOssjVY8nxrXWL2QXegLq4jyc6Vy-85TVKcDFEMlh3TN650QSWyh2kK6ydO44rgR3oS	Q1nVAP4fkTFZjIroaAytXAtt	$2a$12$uIizfCWCdACEO8cEBr1xGONpNXdr2BtTqCznMAFw.gW/YAjp/2AI6	EmailAccount	2022-02-03 05:27:01.591722	2022-02-04 07:30:15.189929	prajapati14399+886	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	2	t	2022-02-03
393	him	S		\N	\N	himanshu+2@gmail.com	f	\N	rwsErBier9pGeBXZHILuAwtt	$2a$12$LH1yYKWD0vuvvmYGKeFcDegL0f12mXgjPKz7ydLfSVYpqYPoiWdNe	EmailAccount	2022-02-07 12:32:17.383348	2022-02-07 12:32:17.456947	himanshu+2	\N	\N	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	f	t	t	t	t	t	t	0	t	\N
\.


--
-- Data for Name: accounts_chats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_chats (id, account_id, chat_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: achievements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievements (id, title, achievement_date, detail, url, profile_bio_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: action_mailbox_inbound_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action_mailbox_inbound_emails (id, status, message_id, message_checksum, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, default_image) FROM stdin;
1	photo	BxBlockProfile::Profile	1	1	2021-10-26 12:27:57.360401	f
2	photo	BxBlockProfile::Profile	15	2	2021-10-27 04:43:17.374167	f
3	photo	BxBlockProfile::Profile	19	3	2021-10-27 10:28:32.369077	f
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
1	g7csgiulqom3kjm84z4vkvl7avgj	mindset.jpg	image/jpeg	{"identified":true,"width":1600,"height":1005,"analyzed":true}	374545	tkNQiK8xrG106xXRNqGCFA==	2021-10-26 12:27:57.297639
2	ep0oughc57c3p8wuoq9dqd2ng99q	mindset.jpg	image/jpeg	{"identified":true,"width":1600,"height":1005,"analyzed":true}	374545	tkNQiK8xrG106xXRNqGCFA==	2021-10-27 04:43:17.372195
3	te7obea58ruapwjrm1vbq3vo9vpl	mindset.jpg	image/jpeg	{"identified":true,"width":1600,"height":1005,"analyzed":true}	374545	tkNQiK8xrG106xXRNqGCFA==	2021-10-27 10:28:32.367108
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, country, latitude, longitude, address, addressble_id, addressble_type, address_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
1	admin@gmail.com	$2a$12$/6iLbRRi2YikWwY0CAGMvuPRPUzpVn1FaPbczIISY9.qqKwl362ei	\N	\N	2022-02-02 12:52:14.827616	2021-10-25 11:07:29.307648	2022-02-02 12:52:14.827962
\.


--
-- Data for Name: advertisements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advertisements (id, name, description, plan_id, duration, advertisement_for, status, seller_account_id, start_at, expire_at) FROM stdin;
\.


--
-- Data for Name: application_message_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_message_translations (id, application_message_id, locale, created_at, updated_at, message) FROM stdin;
\.


--
-- Data for Name: application_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_messages (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2021-10-21 14:53:13.782306	2021-10-25 14:07:12.058704
\.


--
-- Data for Name: associated_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.associated_projects (id, project_id, associated_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: associateds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.associateds (id, associated_with_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: audio_podcasts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audio_podcasts (id, heading, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: audios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audios (id, attached_item_id, attached_item_type, audio, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (id, name, bio, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: availabilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.availabilities (id, service_provider_id, start_time, end_time, unavailable_start_time, unavailable_end_time, availability_date, created_at, updated_at, timeslots, available_slots_count) FROM stdin;
\.


--
-- Data for Name: awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.awards (id, title, associated_with, issuer, issue_date, description, make_public, profile_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: black_list_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.black_list_users (id, account_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: block_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.block_users (id, created_at, updated_at, current_user_id, account_id) FROM stdin;
72	2021-12-10 11:57:59.04199	2021-12-10 11:57:59.04199	124	262
73	2021-12-10 11:58:40.972882	2021-12-10 11:58:40.972882	124	140
104	2022-02-01 07:27:08.592432	2022-02-01 07:27:08.592432	133	124
\.


--
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookmarks (id, account_id, content_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bx_block_appointment_management_booked_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bx_block_appointment_management_booked_slots (id, order_id, start_time, end_time, service_provider_id, booking_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: career_experience_employment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.career_experience_employment_types (id, career_experience_id, employment_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: career_experience_industry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.career_experience_industry (id, career_experience_id, industry_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: career_experience_system_experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.career_experience_system_experiences (id, career_experience_id, created_at, updated_at, system_experience_id) FROM stdin;
\.


--
-- Data for Name: career_experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.career_experiences (id, job_title, start_date, end_date, company_name, description, add_key_achievements, make_key_achievements_public, profile_id, created_at, updated_at, current_salary, notice_period, notice_period_end_date, currently_working_here) FROM stdin;
\.


--
-- Data for Name: careers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.careers (id, profession, is_current, experience_from, experience_to, payscale, company_name, accomplishment, sector, profile_bio_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at, admin_user_id, rank, light_icon, light_icon_active, light_icon_inactive, dark_icon, dark_icon_active, dark_icon_inactive, identifier) FROM stdin;
1	K12	2021-10-21 14:53:11.082738	2021-10-21 14:53:11.082738	\N	\N	\N	\N	\N	\N	\N	\N	0
2	Higher Education	2021-10-21 14:53:11.248502	2021-10-21 14:53:11.248502	\N	\N	\N	\N	\N	\N	\N	\N	1
3	Govt Job	2021-10-21 14:53:11.555414	2021-10-21 14:53:11.555414	\N	\N	\N	\N	\N	\N	\N	\N	2
4	Competitive Exams	2021-10-21 14:53:11.711956	2021-10-21 14:53:11.711956	\N	\N	\N	\N	\N	\N	\N	\N	3
5	Upskilling	2021-10-21 14:53:11.786422	2021-10-21 14:53:11.786422	\N	\N	\N	\N	\N	\N	\N	\N	4
\.


--
-- Data for Name: categories_sub_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories_sub_categories (id, category_id, sub_category_id) FROM stdin;
1	1	1
2	1	1
3	1	2
4	1	2
5	1	3
6	1	3
7	1	4
8	1	4
9	1	5
10	1	5
11	2	6
12	2	6
13	2	7
14	2	7
15	2	8
16	2	8
17	2	9
18	2	9
19	2	10
20	2	10
21	2	11
22	2	11
23	2	12
24	2	12
25	2	13
26	2	13
27	2	14
28	2	14
29	2	15
30	2	15
31	2	16
32	2	16
33	2	17
34	2	17
35	2	18
36	2	18
37	2	19
38	2	19
39	2	20
40	2	20
41	2	21
42	2	21
43	2	22
44	2	22
45	2	23
46	2	23
47	2	24
48	2	24
49	3	25
50	3	25
51	3	26
52	3	26
53	3	27
54	3	27
55	3	28
56	3	28
57	3	29
58	3	29
59	3	30
60	3	30
61	3	31
62	3	31
63	3	32
64	3	32
65	3	33
66	3	33
67	3	34
68	3	34
69	4	35
70	4	35
71	4	36
72	4	36
73	4	37
74	4	37
\.


--
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_messages (id, account_id, chat_id, message, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chats (id, created_at, updated_at, recipient_id, sender_id) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, account_id, post_id, comment, created_at, updated_at, comment_id) FROM stdin;
1	124	2	this is reply comment	2022-01-05 04:27:34.796991	2022-01-05 04:27:34.796991	\N
2	124	2	this is reply comment	2022-01-05 04:27:34.863053	2022-01-05 04:27:34.863053	\N
3	124	2	this is reply comment	2022-01-05 04:27:34.858452	2022-01-05 04:27:34.858452	\N
4	124	2	this is reply comment	2022-01-05 04:27:34.866282	2022-01-05 04:27:34.866282	\N
5	124	2	this is reply comment	2022-01-05 04:27:34.835571	2022-01-05 04:27:34.835571	\N
6	124	2	this is reply comment	2022-01-05 04:27:34.886472	2022-01-05 04:27:34.886472	\N
7	124	2	this is reply comment	2022-01-05 04:27:34.973549	2022-01-05 04:27:34.973549	\N
8	124	2	this is reply comment	2022-01-05 04:27:34.90299	2022-01-05 04:27:34.90299	\N
9	124	2	this is reply comment	2022-01-05 04:27:34.841071	2022-01-05 04:27:34.841071	\N
10	124	2	this is reply comment	2022-01-05 04:27:36.344402	2022-01-05 04:27:36.344402	\N
11	124	2	this is reply comment	2022-01-05 04:27:36.349266	2022-01-05 04:27:36.349266	\N
12	124	2	this is reply comment	2022-01-05 04:27:36.370032	2022-01-05 04:27:36.370032	\N
13	124	2	this is reply comment	2022-01-05 04:27:36.384861	2022-01-05 04:27:36.384861	\N
14	124	2	this is reply comment	2022-01-05 04:27:36.414314	2022-01-05 04:27:36.414314	\N
15	124	2	this is reply comment	2022-01-05 04:27:36.41927	2022-01-05 04:27:36.41927	\N
16	124	2	this is reply comment	2022-01-05 04:27:36.463123	2022-01-05 04:27:36.463123	\N
17	124	2	this is reply comment	2022-01-05 04:27:36.493092	2022-01-05 04:27:36.493092	\N
18	124	2	this is reply comment	2022-01-05 04:27:36.578102	2022-01-05 04:27:36.578102	\N
19	124	46	Nice tree	2022-01-05 04:42:55.276311	2022-01-05 04:42:55.276311	\N
20	124	46	Hello	2022-01-05 06:41:17.144918	2022-01-05 06:41:17.144918	\N
21	124	45	Wow!! what a view, inimitable	2022-01-05 07:03:53.260416	2022-01-05 07:03:53.260416	\N
22	124	45	It looks superior	2022-01-05 07:07:33.641213	2022-01-05 07:07:33.641213	\N
23	124	45	Waterfall is tremendous	2022-01-05 07:09:46.650184	2022-01-05 07:09:46.650184	\N
24	124	45	Where this place is?	2022-01-05 07:11:48.817824	2022-01-05 07:11:48.817824	\N
25	124	45	do u knw the country name?	2022-01-05 07:12:13.433059	2022-01-05 07:12:13.433059	\N
26	124	46	What a picture..	2022-01-05 11:11:03.144333	2022-01-05 11:11:03.144333	\N
27	124	38	beautiful jungle	2022-01-06 05:02:17.526801	2022-01-06 05:02:17.526801	\N
28	259	45	Very nice picture	2022-01-06 09:49:08.490849	2022-01-06 09:49:08.490849	\N
29	259	46	why it cannot be in real world	2022-01-06 09:49:47.567716	2022-01-06 09:49:47.567716	\N
30	259	39	What a book is this	2022-01-06 09:51:59.692557	2022-01-06 09:51:59.692557	\N
266	378	46	wow	2022-02-03 09:00:07.366404	2022-02-03 09:00:07.366404	\N
32	124	39	yes aksay, it's nice 	2022-01-06 10:03:42.854983	2022-01-06 10:03:42.854983	\N
33	124	39	but one thing i would like to tell u about this, is just picture, not a book	2022-01-06 10:04:40.005168	2022-01-06 10:04:40.005168	\N
34	259	46	Hi aksay, thanks for your interest on this, yes i too wonder sometimes why it cannot be in real world..	2022-01-06 10:08:43.563622	2022-01-06 10:08:43.563622	\N
35	259	39	Hi Arun, i know this, i'm not insane	2022-01-06 10:21:01.367775	2022-01-06 10:21:01.367775	\N
36	259	46	nice looking	2022-01-06 10:27:43.302614	2022-01-06 10:27:43.302614	\N
37	124	46	yes bro	2022-01-07 08:47:07.936446	2022-01-07 08:47:07.936446	34
38	124	2	this is reply comment	2022-01-07 08:47:30.151037	2022-01-07 08:47:30.151037	2
39	124	46	that is very nice	2022-01-07 09:12:30.725123	2022-01-07 09:12:30.725123	34
40	124	46	hello aksay	2022-01-07 09:13:40.646361	2022-01-07 09:13:40.646361	34
41	124	46	hi u pls say something	2022-01-07 09:17:38.027466	2022-01-07 09:17:38.027466	34
42	124	46	hi akki	2022-01-07 09:20:03.950917	2022-01-07 09:20:03.950917	34
43	124	46	yes aksay it is looking nice	2022-01-07 09:25:59.364927	2022-01-07 09:25:59.364927	36
44	124	46	hi	2022-01-07 09:30:14.094442	2022-01-07 09:30:14.094442	20
45	124	46	hi aksay	2022-01-07 09:33:54.122482	2022-01-07 09:33:54.122482	29
46	124	46	hi	2022-01-07 09:37:12.893189	2022-01-07 09:37:12.893189	36
47	124	46	hhhhahahha	2022-01-07 10:05:35.042049	2022-01-07 10:05:35.042049	34
48	259	46	yes arun	2022-01-07 10:09:25.120777	2022-01-07 10:09:25.120777	36
49	259	46	sorry for late reply	2022-01-07 10:09:39.789146	2022-01-07 10:09:39.789146	36
50	259	46	yes pls arun	2022-01-07 10:10:11.901848	2022-01-07 10:10:11.901848	34
51	259	46	tell me	2022-01-07 10:10:21.783407	2022-01-07 10:10:21.783407	34
52	259	46	hi arun say	2022-01-07 10:10:44.80448	2022-01-07 10:10:44.80448	29
269	378	46	1	2022-02-04 09:05:08.685486	2022-02-04 09:05:08.685486	\N
55	136	55	Comment	2022-01-10 08:49:33.679716	2022-01-10 08:49:33.679716	\N
56	136	55	helo	2022-01-10 08:49:52.513977	2022-01-10 08:49:52.513977	\N
57	136	55	hi 	2022-01-10 08:50:10.401236	2022-01-10 08:50:10.401236	\N
58	136	55	hello	2022-01-10 08:51:02.911275	2022-01-10 08:51:02.911275	57
59	136	55	hello	2022-01-10 08:51:09.848606	2022-01-10 08:51:09.848606	57
64	271	61	good	2022-01-10 11:23:55.064765	2022-01-10 11:23:55.064765	\N
65	129	61	thanks	2022-01-10 11:24:27.298626	2022-01-10 11:24:27.298626	64
66	271	61	:-)	2022-01-10 11:25:22.324612	2022-01-10 11:25:22.324612	64
70	136	55	Good post!	2022-01-11 07:30:43.895768	2022-01-11 07:30:43.895768	\N
71	305	55	Cool!	2022-01-11 07:41:36.312395	2022-01-11 07:41:36.312395	\N
81	129	61	hello	2022-01-11 13:00:34.979404	2022-01-11 13:00:34.979404	\N
83	271	60	hiiiiiiiii	2022-01-13 05:35:08.536902	2022-01-13 05:35:08.536902	\N
84	129	60	hiii	2022-01-13 05:46:24.733547	2022-01-13 05:46:24.733547	83
85	271	61	fjhtfgjfg	2022-01-13 05:54:17.430093	2022-01-13 05:54:17.430093	\N
86	271	61	gjmhkh	2022-01-13 05:54:55.715879	2022-01-13 05:54:55.715879	\N
87	133	13	comment testing	2022-01-13 07:09:17.066958	2022-01-13 07:09:17.066958	\N
88	133	61	Good picture	2022-01-13 07:10:18.895023	2022-01-13 07:10:18.895023	\N
89	129	61	thanks	2022-01-13 07:10:54.993315	2022-01-13 07:10:54.993315	88
90	129	13	nice	2022-01-13 07:17:02.663123	2022-01-13 07:17:02.663123	\N
91	129	13	niceee	2022-01-13 07:18:15.340075	2022-01-13 07:18:15.340075	\N
267	137	31	cool	2022-02-03 15:51:30.516762	2022-02-03 15:51:30.516762	\N
270	378	46	2	2022-02-04 09:05:18.379331	2022-02-04 09:05:18.379331	269
97	374	61	hello	2022-01-13 09:13:20.951385	2022-01-13 09:13:20.951385	\N
98	129	61	hiii	2022-01-13 09:14:59.456511	2022-01-13 09:14:59.456511	97
99	271	59	nice	2022-01-13 09:30:13.645503	2022-01-13 09:30:13.645503	\N
100	129	59	thanks	2022-01-13 09:30:45.125733	2022-01-13 09:30:45.125733	99
126	133	61	hi whats up	2022-01-14 15:17:25.487021	2022-01-14 15:17:25.487021	\N
127	297	13	nice	2022-01-14 15:21:24.986421	2022-01-14 15:21:24.986421	\N
128	133	13	thanks Temp	2022-01-14 15:24:47.696903	2022-01-14 15:24:47.696903	127
129	297	9	this is good	2022-01-14 15:33:55.338838	2022-01-14 15:33:55.338838	\N
130	133	9	thanks	2022-01-14 15:34:32.681559	2022-01-14 15:34:32.681559	129
131	133	9	thanks2	2022-01-14 15:37:12.792901	2022-01-14 15:37:12.792901	129
132	259	46	superb view	2022-01-17 04:29:49.050736	2022-01-17 04:29:49.050736	\N
133	124	46	yes aksay	2022-01-17 06:22:37.142983	2022-01-17 06:22:37.142983	132
134	124	20	what a fire	2022-01-17 06:31:39.774337	2022-01-17 06:31:39.774337	\N
135	124	45	yes aksay	2022-01-17 07:02:28.547104	2022-01-17 07:02:28.547104	28
136	297	13	ok	2022-01-17 07:32:52.670153	2022-01-17 07:32:52.670153	127
137	370	55	Cool!	2022-01-17 07:44:42.579902	2022-01-17 07:44:42.579902	\N
138	370	55	POST like	2022-01-17 07:45:19.22885	2022-01-17 07:45:19.22885	\N
140	144	22	Like-like	2022-01-17 07:55:16.30399	2022-01-17 07:55:16.30399	\N
143	259	76	nice water fall	2022-01-18 06:33:14.63383	2022-01-18 06:33:14.63383	\N
144	124	76	this is nice aksay	2022-01-18 09:01:07.25511	2022-01-18 09:01:07.25511	\N
145	124	76	u should try atleast once	2022-01-18 09:01:25.457357	2022-01-18 09:01:25.457357	143
146	259	76	yes arun	2022-01-18 10:52:28.846989	2022-01-18 10:52:28.846989	\N
147	259	74	nice lake	2022-01-18 12:18:50.597201	2022-01-18 12:18:50.597201	\N
148	259	76	that is nice	2022-01-18 12:49:09.185994	2022-01-18 12:49:09.185994	146
156	124	76	beautifull	2022-01-19 11:58:33.011808	2022-01-19 11:58:33.011808	\N
157	124	46	kyun	2022-01-19 12:48:12.630346	2022-01-19 12:48:12.630346	\N
158	124	46	son	2022-01-19 12:54:30.490961	2022-01-19 12:54:30.490961	\N
159	124	46	sun	2022-01-19 12:54:42.183667	2022-01-19 12:54:42.183667	\N
160	129	76	yes 	2022-01-19 13:21:06.15184	2022-01-19 13:21:06.15184	156
161	124	46	hi ggood mornig	2022-01-20 04:55:07.484692	2022-01-20 04:55:07.484692	36
162	124	46	good morning aksay	2022-01-20 04:56:47.469572	2022-01-20 04:56:47.469572	34
163	124	46	beautifull picture	2022-01-20 05:12:21.380471	2022-01-20 05:12:21.380471	\N
164	124	76	such huge	2022-01-20 05:21:32.306961	2022-01-20 05:21:32.306961	\N
165	124	76	it's huge	2022-01-20 05:25:26.682133	2022-01-20 05:25:26.682133	\N
166	124	74	yes nice lale	2022-01-20 06:13:18.766496	2022-01-20 06:13:18.766496	\N
167	124	74	u may go there	2022-01-20 06:13:36.738207	2022-01-20 06:13:36.738207	\N
168	124	74	once atleast	2022-01-20 06:13:53.866306	2022-01-20 06:13:53.866306	\N
169	124	74	pls	2022-01-20 06:14:29.746394	2022-01-20 06:14:29.746394	\N
170	124	46	yes it is	2022-01-20 06:40:50.027727	2022-01-20 06:40:50.027727	163
171	124	46	nice	2022-01-20 06:41:43.026852	2022-01-20 06:41:43.026852	163
172	124	76	hi	2022-01-20 06:46:17.060264	2022-01-20 06:46:17.060264	165
173	124	76	hhhhh	2022-01-20 07:05:09.259841	2022-01-20 07:05:09.259841	\N
174	124	58	hhh	2022-01-20 07:05:28.769934	2022-01-20 07:05:28.769934	\N
175	124	75	nice jungle	2022-01-20 11:32:42.734283	2022-01-20 11:32:42.734283	\N
176	124	76	hi aksay	2022-01-20 13:07:36.045789	2022-01-20 13:07:36.045789	143
177	124	76	how are u	2022-01-20 13:07:44.776005	2022-01-20 13:07:44.776005	143
178	371	46	badhiya	2022-01-20 13:11:32.209338	2022-01-20 13:11:32.209338	\N
179	133	77	hello	2022-01-21 07:18:00.27987	2022-01-21 07:18:00.27987	\N
180	133	77	whats up	2022-01-21 07:18:10.929394	2022-01-21 07:18:10.929394	179
181	124	46	hi aksay	2022-01-21 08:59:17.070612	2022-01-21 08:59:17.070612	29
182	124	46	how r u	2022-01-21 08:59:32.758325	2022-01-21 08:59:32.758325	29
183	124	46	badhiya	2022-01-21 09:03:00.322094	2022-01-21 09:03:00.322094	\N
184	124	46	nice	2022-01-21 09:03:39.79855	2022-01-21 09:03:39.79855	26
185	124	46	hi	2022-01-21 09:11:02.224847	2022-01-21 09:11:02.224847	34
186	129	90	8gutvgvgcyfc	2022-01-24 11:46:39.740404	2022-01-24 11:46:39.740404	\N
188	133	83	hello	2022-01-25 07:08:41.981931	2022-01-25 07:08:41.981931	\N
191	124	90	beautifull	2022-01-25 11:26:30.044716	2022-01-25 11:26:30.044716	\N
192	124	90	what a eyes	2022-01-25 11:29:23.524513	2022-01-25 11:29:23.524513	\N
193	124	90	pretty women	2022-01-25 11:30:19.167129	2022-01-25 11:30:19.167129	\N
194	124	90	nice dress	2022-01-25 11:33:25.858951	2022-01-25 11:33:25.858951	\N
195	124	90	nice pic	2022-01-25 11:36:19.671328	2022-01-25 11:36:19.671328	\N
196	124	90	what a pic	2022-01-25 11:39:47.748922	2022-01-25 11:39:47.748922	\N
197	124	90	pls blink once	2022-01-25 11:40:56.766893	2022-01-25 11:40:56.766893	\N
198	124	75	nice look	2022-01-25 11:42:40.552212	2022-01-25 11:42:40.552212	\N
199	124	75	nice whole pic	2022-01-25 11:44:11.272706	2022-01-25 11:44:11.272706	\N
200	124	75	i wanna go there	2022-01-25 11:44:26.234115	2022-01-25 11:44:26.234115	\N
201	124	75	one day	2022-01-25 11:44:36.222943	2022-01-25 11:44:36.222943	\N
202	124	73	nice waterflow	2022-01-25 12:09:25.416085	2022-01-25 12:09:25.416085	\N
203	124	81	test	2022-01-25 12:23:43.034829	2022-01-25 12:23:43.034829	\N
204	124	53	nice	2022-01-25 12:46:54.745004	2022-01-25 12:46:54.745004	\N
205	124	53	pretty	2022-01-25 12:47:23.606756	2022-01-25 12:47:23.606756	\N
206	124	90	wow man	2022-01-25 12:54:16.613073	2022-01-25 12:54:16.613073	\N
207	124	90	nice	2022-01-25 12:54:49.485498	2022-01-25 12:54:49.485498	\N
268	137	30	wow	2022-02-03 15:53:30.960053	2022-02-03 15:53:30.960053	\N
209	124	90	nice one	2022-01-25 12:58:17.958011	2022-01-25 12:58:17.958011	\N
210	124	90	wow dear	2022-01-25 12:58:38.779908	2022-01-25 12:58:38.779908	\N
211	124	35	nice girl	2022-01-25 12:59:32.588405	2022-01-25 12:59:32.588405	\N
212	370	46	Great	2022-01-25 14:33:41.213231	2022-01-25 14:33:41.213231	\N
216	124	77	nice 	2022-01-27 04:36:40.44144	2022-01-27 04:36:40.44144	\N
218	124	61	nice creature	2022-01-27 04:49:56.163246	2022-01-27 04:49:56.163246	\N
219	124	61	nice 	2022-01-27 04:50:49.652534	2022-01-27 04:50:49.652534	\N
220	124	61	wow	2022-01-27 04:53:17.579372	2022-01-27 04:53:17.579372	\N
221	124	77	wow	2022-01-27 04:57:27.706244	2022-01-27 04:57:27.706244	\N
223	124	90	oohh	2022-01-27 05:06:47.342971	2022-01-27 05:06:47.342971	\N
224	124	59	nice	2022-01-27 05:10:10.882706	2022-01-27 05:10:10.882706	\N
225	124	59	greattt	2022-01-27 05:11:12.416766	2022-01-27 05:11:12.416766	\N
226	124	77	gone	2022-01-27 05:48:30.037196	2022-01-27 05:48:30.037196	\N
227	124	73	greattt	2022-01-27 06:10:53.102515	2022-01-27 06:10:53.102515	\N
230	124	90	123	2022-01-27 07:02:39.745704	2022-01-27 07:02:39.745704	\N
231	124	82	1234	2022-01-27 07:03:49.512602	2022-01-27 07:03:49.512602	\N
232	133	83	hi	2022-01-27 07:08:16.438889	2022-01-27 07:08:16.438889	\N
233	133	77	good	2022-01-27 07:09:17.255231	2022-01-27 07:09:17.255231	\N
236	370	94	cool	2022-01-27 13:18:37.836997	2022-01-27 13:18:37.836997	\N
240	133	94	Good NFT	2022-01-31 07:20:59.013991	2022-01-31 07:20:59.013991	\N
241	371	46	Good NFT	2022-01-31 07:56:40.247446	2022-01-31 07:56:40.247446	\N
249	376	46	beauty	2022-01-31 13:26:12.278893	2022-01-31 13:26:12.278893	\N
250	133	93	Cool fish	2022-02-01 07:11:29.062569	2022-02-01 07:11:29.062569	\N
251	371	76	Good	2022-02-01 08:02:41.222243	2022-02-01 08:02:41.222243	\N
254	137	46	frhkrh	2022-02-01 13:02:21.395966	2022-02-01 13:02:21.395966	\N
263	266	76	nice	2022-02-02 11:19:31.257274	2022-02-02 11:19:31.257274	\N
\.


--
-- Data for Name: connections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connections (id, account_id, receipient_id, status, created_at, updated_at, follow) FROM stdin;
254	124	280	approved	2021-12-20 08:30:26.872804	2022-01-06 04:10:29.413363	t
249	260	280	approved	2021-12-16 06:47:38.010877	2022-01-06 04:11:01.408223	t
88	248	266	pending	2021-12-01 07:45:52.366884	2021-12-01 07:45:52.366884	f
261	271	148	pending	2021-12-20 12:58:23.224773	2021-12-20 12:58:23.224773	f
204	133	129	approved	2021-12-08 07:47:50.233286	2021-12-08 08:00:25.601104	t
102	258	\N	pending	2021-12-01 13:19:22.072251	2021-12-01 13:19:22.072251	f
101	258	\N	approved	2021-12-01 13:19:12.924206	2021-12-07 13:18:11.843011	t
263	330	258	pending	2021-12-20 15:14:35.673316	2021-12-20 15:14:35.673316	f
324	366	136	approved	2022-01-06 11:57:48.309471	2022-01-10 12:52:56.447662	t
264	331	331	pending	2021-12-20 15:19:38.194664	2021-12-20 15:19:38.194664	f
404	129	124	approved	2022-02-01 12:49:40.57326	2022-02-01 15:16:06.380599	t
20	20	124	pending	2021-11-26 03:48:19.844276	2021-11-26 03:48:19.844276	f
265	331	330	approved	2021-12-20 15:20:11.993316	2021-12-20 15:20:25.922965	t
65	133	5	pending	2021-11-30 07:06:54.575365	2021-11-30 07:06:54.575365	f
66	136	251	pending	2021-11-30 09:52:18.302923	2021-11-30 09:52:18.302923	f
23	167	36	pending	2021-11-26 06:48:02.2274	2021-11-26 06:48:02.2274	f
104	133	32	pending	2021-12-01 16:15:36.438217	2021-12-01 16:15:36.438217	f
326	136	248	approved	2022-01-10 09:25:24.13359	2022-01-11 07:02:47.757461	t
28	140	139	pending	2021-11-29 08:52:00.781545	2021-11-29 08:52:00.781545	f
105	133	265	pending	2021-12-02 06:58:09.372504	2021-12-02 06:58:09.372504	f
330	136	370	approved	2022-01-11 08:02:17.669559	2022-01-11 08:10:07.564618	t
169	136	282	pending	2021-12-06 15:26:25.59366	2021-12-06 15:26:25.59366	f
338	137	136	approved	2022-01-11 12:12:49.125448	2022-02-01 15:41:13.501802	f
233	144	137	approved	2021-12-13 11:50:34.77818	2021-12-13 12:13:52.043241	t
270	124	281	pending	2021-12-21 05:24:04.296482	2021-12-21 05:24:04.296482	f
36	258	10	pending	2021-11-29 12:16:54.97906	2021-11-29 12:16:54.97906	f
271	124	320	pending	2021-12-21 05:26:00.429475	2021-12-21 05:26:00.429475	f
272	124	215	pending	2021-12-21 05:32:51.01045	2021-12-21 05:32:51.01045	f
412	124	287	approved	2022-02-02 06:01:06.190862	2022-02-02 06:01:23.8015	t
416	137	370	pending	2022-02-02 09:27:43.789891	2022-02-02 09:27:43.789891	f
227	305	144	pending	2021-12-10 07:59:43.279283	2021-12-10 07:59:43.279283	f
274	124	3	pending	2021-12-21 05:36:42.722353	2021-12-21 05:36:42.722353	f
334	371	11	approved	2022-01-11 11:02:14.900857	2022-01-13 03:58:59.370032	t
46	262	10	pending	2021-11-29 13:20:48.140365	2021-11-29 13:20:48.140365	f
47	263	262	pending	2021-11-29 13:23:46.935903	2021-11-29 13:23:46.935903	f
48	262	262	pending	2021-11-29 13:24:44.533431	2021-11-29 13:24:44.533431	f
73	257	\N	pending	2021-11-30 10:53:04.435952	2021-11-30 10:53:04.435952	f
49	262	263	approved	2021-11-29 13:27:49.173389	2021-11-29 14:39:18.700338	t
26	130	124	approved	2021-11-29 08:44:41.817749	2021-12-21 10:15:06.56584	t
253	297	11	approved	2021-12-20 07:07:00.643556	2021-12-22 05:57:30.163264	t
130	258	260	approved	2021-12-03 07:19:55.417054	2021-12-07 07:26:19.55903	t
53	258	2	pending	2021-11-30 05:35:30.311126	2021-11-30 05:35:30.311126	f
25	138	124	approved	2021-11-29 08:42:54.908829	2021-12-22 06:27:57.26584	t
248	287	259	approved	2021-12-16 06:38:42.427907	2021-12-23 04:29:29.433247	t
56	124	263	pending	2021-11-30 05:46:06.260278	2021-11-30 05:46:06.260278	f
426	259	257	approved	2022-02-03 05:19:13.094583	2022-02-03 05:19:24.578459	t
340	271	133	approved	2022-01-13 07:19:27.283078	2022-01-13 07:23:09.719878	t
236	124	258	pending	2021-12-15 08:17:18.179709	2021-12-15 08:17:18.179709	f
347	374	18	pending	2022-01-13 08:50:39.853047	2022-01-13 08:50:39.853047	f
349	374	249	pending	2022-01-13 08:50:42.907429	2022-01-13 08:50:42.907429	f
351	374	170	pending	2022-01-13 08:51:05.348362	2022-01-13 08:51:05.348362	f
238	124	261	pending	2021-12-15 08:24:16.773895	2021-12-15 08:24:16.773895	f
202	133	98	pending	2021-12-08 07:05:14.644225	2021-12-08 07:05:14.644225	f
143	133	111	pending	2021-12-03 13:47:43.180034	2021-12-03 13:47:43.180034	f
203	133	2	pending	2021-12-08 07:15:06.335392	2021-12-08 07:15:06.335392	f
206	298	3	pending	2021-12-08 14:41:19.861942	2021-12-08 14:41:19.861942	f
84	124	10	pending	2021-11-30 14:19:29.873022	2021-11-30 14:19:29.873022	f
208	297	264	pending	2021-12-08 14:45:05.783477	2021-12-08 14:45:05.783477	f
201	133	11	approved	2021-12-08 07:05:02.525221	2021-12-10 04:08:53.823371	t
155	287	285	approved	2021-12-06 04:51:38.503212	2021-12-06 04:55:50.645909	t
156	288	285	approved	2021-12-06 04:53:05.562507	2021-12-06 04:55:54.629968	t
147	133	212	pending	2021-12-03 14:08:18.594049	2021-12-03 14:08:18.594049	f
209	264	133	approved	2021-12-08 14:49:02.13963	2021-12-09 07:12:40.637824	t
154	286	285	approved	2021-12-06 04:49:51.771125	2021-12-06 04:55:57.490287	t
158	286	287	approved	2021-12-06 04:55:12.506566	2021-12-06 04:56:20.02554	t
157	288	287	approved	2021-12-06 04:54:42.395242	2021-12-06 04:56:22.447279	t
148	133	169	pending	2021-12-03 14:08:57.340843	2021-12-03 14:08:57.340843	f
218	297	133	approved	2021-12-09 07:14:15.956299	2021-12-09 07:17:38.399551	t
159	289	287	pending	2021-12-06 05:04:45.119645	2021-12-06 05:04:45.119645	f
220	299	129	approved	2021-12-09 07:53:08.124094	2021-12-09 07:54:45.569883	t
184	280	11	approved	2021-12-07 04:24:06.155716	2021-12-10 04:08:57.011595	t
194	289	259	approved	2021-12-07 13:26:07.950085	2021-12-13 06:27:23.341359	f
239	124	270	pending	2021-12-15 08:28:18.178832	2021-12-15 08:28:18.178832	f
243	124	274	pending	2021-12-15 10:04:32.441273	2021-12-15 10:04:32.441273	f
226	305	248	approved	2021-12-10 07:00:56.617393	2021-12-10 07:01:18.139249	t
152	260	259	approved	2021-12-06 04:41:40.16022	2021-12-10 12:00:33.701436	t
241	124	279	pending	2021-12-15 08:42:48.801351	2021-12-15 08:42:48.801351	f
242	124	278	pending	2021-12-15 09:48:25.742383	2021-12-15 09:48:25.742383	f
132	248	137	approved	2021-12-03 07:22:57.117141	2021-12-13 12:13:50.124167	f
246	124	277	pending	2021-12-15 11:22:14.877038	2021-12-15 11:22:14.877038	f
234	133	137	approved	2021-12-14 07:33:34.675218	2021-12-15 20:00:51.35648	t
277	129	259	pending	2021-12-21 05:49:11.476916	2021-12-21 05:49:11.476916	f
278	129	258	pending	2021-12-21 05:51:00.886847	2021-12-21 05:51:00.886847	f
279	129	331	pending	2021-12-21 06:44:10.656745	2021-12-21 06:44:10.656745	f
280	129	330	pending	2021-12-21 06:44:19.510485	2021-12-21 06:44:19.510485	f
281	124	167	pending	2021-12-21 06:49:27.325668	2021-12-21 06:49:27.325668	f
282	297	142	pending	2021-12-21 07:33:58.757155	2021-12-21 07:33:58.757155	f
283	305	137	approved	2021-12-21 07:48:00.472779	2021-12-21 07:49:41.255151	t
323	365	133	approved	2022-01-05 13:53:52.033943	2022-01-06 07:32:15.997194	t
325	367	136	approved	2022-01-06 13:18:52.724597	2022-01-06 13:28:05.22103	t
290	124	285	pending	2021-12-21 12:35:45.943109	2021-12-21 12:35:45.943109	f
313	133	248	approved	2021-12-24 08:27:43.339428	2022-01-10 06:47:11.977005	t
395	266	371	approved	2022-01-31 11:55:54.571572	2022-02-02 04:49:47.132154	t
293	124	108	pending	2021-12-22 06:57:01.967583	2021-12-22 06:57:01.967583	f
294	297	108	pending	2021-12-22 07:12:04.473461	2021-12-22 07:12:04.473461	f
329	136	368	approved	2022-01-10 10:48:43.100624	2022-01-10 10:48:57.380983	t
411	286	260	approved	2022-02-02 05:31:53.819277	2022-02-02 05:32:12.921522	t
387	129	271	approved	2022-01-28 05:27:41.671156	2022-02-02 07:38:44.730779	t
299	259	258	pending	2021-12-23 04:30:32.721431	2021-12-23 04:30:32.721431	f
302	124	191	pending	2021-12-23 07:40:01.524404	2021-12-23 07:40:01.524404	f
343	374	129	approved	2022-01-13 08:36:41.835494	2022-01-13 08:37:59.114265	t
399	383	370	approved	2022-01-31 14:36:00.876372	2022-02-02 11:49:30.230185	t
348	374	175	pending	2022-01-13 08:50:41.457271	2022-01-13 08:50:41.457271	f
308	136	281	pending	2021-12-23 17:45:15.543205	2021-12-23 17:45:15.543205	f
309	136	280	pending	2021-12-23 17:45:22.251474	2021-12-23 17:45:22.251474	f
311	359	297	pending	2021-12-24 08:16:25.195996	2021-12-24 08:16:25.195996	f
312	359	133	approved	2021-12-24 08:16:44.614128	2021-12-24 08:17:39.341583	t
314	133	341	pending	2021-12-24 08:30:07.055972	2021-12-24 08:30:07.055972	f
315	133	108	pending	2021-12-24 08:31:21.077161	2021-12-24 08:31:21.077161	f
350	374	6	pending	2022-01-13 08:51:02.071772	2022-01-13 08:51:02.071772	f
310	259	124	approved	2021-12-24 06:17:07.858899	2021-12-28 04:14:01.167649	t
423	389	248	approved	2022-02-02 13:02:09.719526	2022-02-02 13:04:01.486765	t
317	124	260	approved	2021-12-28 04:29:17.092621	2021-12-28 04:30:35.721609	t
425	137	376	approved	2022-02-02 13:11:41.459996	2022-02-02 13:11:54.192369	t
427	390	391	approved	2022-02-03 05:29:12.829562	2022-02-03 05:29:21.639894	t
320	266	280	approved	2022-01-03 06:11:09.382374	2022-01-03 06:11:47.129232	t
321	306	129	approved	2022-01-04 07:36:10.800315	2022-01-04 07:37:30.904355	t
429	137	378	approved	2022-02-03 11:47:06.39674	2022-02-03 11:47:45.722933	t
409	129	371	approved	2022-02-02 04:41:23.68441	2022-02-07 04:17:28.774769	t
316	133	136	approved	2021-12-24 08:32:16.968664	2022-01-04 11:55:06.566151	t
396	124	371	approved	2022-01-31 11:56:28.085459	2022-01-31 12:14:21.436962	t
380	248	144	pending	2022-01-27 07:27:15.584242	2022-01-27 07:27:15.584242	f
359	374	371	approved	2022-01-13 13:08:22.213519	2022-01-19 05:04:48.543845	t
398	376	370	approved	2022-01-31 12:43:42.820986	2022-01-31 12:44:18.79046	t
386	271	170	pending	2022-01-28 04:58:46.205648	2022-01-28 04:58:46.205648	f
362	248	376	approved	2022-01-17 07:48:46.706254	2022-01-28 08:27:23.505122	t
401	285	259	approved	2022-02-01 10:56:10.972255	2022-02-01 10:56:30.828615	t
391	370	144	pending	2022-01-28 13:29:48.965714	2022-01-28 13:29:48.965714	f
364	371	259	approved	2022-01-17 09:29:51.295974	2022-02-01 11:22:04.795766	t
402	288	124	approved	2022-02-01 11:32:44.333682	2022-02-01 11:33:21.282609	t
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, account_id, name, email, phone_number, description, created_at, updated_at, subject, message) FROM stdin;
1	259	\N	\N	\N	\N	2021-12-24 05:27:30.788734	2021-12-24 05:27:30.788734	Unbounce	Unbounce’s contact page places the header front and center for the user. It’s welcoming and accounts for all types of support inquiries including both customer support and marketing partnerships.
13	136	\N	\N	\N	\N	2021-12-24 13:56:10.900363	2021-12-24 13:56:10.900363	Something	Something
14	136	\N	\N	\N	\N	2021-12-24 13:56:10.902212	2021-12-24 13:56:10.902212	Something	Something
15	136	\N	\N	\N	\N	2021-12-24 13:56:10.969542	2021-12-24 13:56:10.969542	Something	Something
16	136	\N	\N	\N	\N	2021-12-24 13:56:11.105543	2021-12-24 13:56:11.105543	Something	Something
17	136	\N	\N	\N	\N	2021-12-24 13:56:11.234605	2021-12-24 13:56:11.234605	Something	Something
18	136	\N	\N	\N	\N	2021-12-24 13:56:15.286645	2021-12-24 13:56:15.286645	Something	Something
19	136	\N	\N	\N	\N	2021-12-24 13:56:30.417379	2021-12-24 13:56:30.417379	Something	Something
20	136	\N	\N	\N	\N	2021-12-24 13:56:32.590422	2021-12-24 13:56:32.590422	Something	Something
21	136	\N	\N	\N	\N	2021-12-24 13:56:51.308237	2021-12-24 13:56:51.308237	Something	Something
22	136	\N	\N	\N	\N	2021-12-24 13:57:06.624161	2021-12-24 13:57:06.624161	s	S
23	136	\N	\N	\N	\N	2021-12-24 13:57:59.311841	2021-12-24 13:57:59.311841	s	s
24	136	\N	\N	\N	\N	2021-12-24 13:59:30.89286	2021-12-24 13:59:30.89286	s	s
25	136	\N	\N	\N	\N	2021-12-24 13:59:37.8664	2021-12-24 13:59:37.8664	s	s
26	136	\N	\N	\N	\N	2021-12-24 14:01:13.990076	2021-12-24 14:01:13.990076	s	s
39	136	\N	\N	\N	\N	2021-12-28 08:41:56.84646	2021-12-28 08:41:56.84646	Sss	ssSS
40	136	\N	\N	\N	\N	2021-12-28 08:41:59.062372	2021-12-28 08:41:59.062372	Sss	ssSS
41	136	\N	\N	\N	\N	2021-12-28 08:41:59.681132	2021-12-28 08:41:59.681132	Sss	ssSS
42	136	\N	\N	\N	\N	2021-12-28 08:41:59.850895	2021-12-28 08:41:59.850895	Sss	ssSS
43	136	\N	\N	\N	\N	2021-12-28 08:42:00.056106	2021-12-28 08:42:00.056106	Sss	ssSS
44	136	\N	\N	\N	\N	2021-12-28 08:42:00.18678	2021-12-28 08:42:00.18678	Sss	ssSS
45	136	\N	\N	\N	\N	2021-12-28 08:42:00.312302	2021-12-28 08:42:00.312302	Sss	ssSS
46	136	\N	\N	\N	\N	2021-12-28 08:42:00.474154	2021-12-28 08:42:00.474154	Sss	ssSS
47	133	\N	\N	\N	\N	2021-12-28 08:42:59.397006	2021-12-28 08:42:59.397006	S	s
48	133	\N	\N	\N	\N	2021-12-28 08:43:01.412471	2021-12-28 08:43:01.412471	SS	ss
49	133	\N	\N	\N	\N	2021-12-28 08:43:01.574245	2021-12-28 08:43:01.574245	SS	ss
50	136	\N	\N	\N	\N	2021-12-28 14:02:52.376998	2021-12-28 14:02:52.376998	Sss	sss
51	136	\N	\N	\N	\N	2021-12-29 13:59:31.92298	2021-12-29 13:59:31.92298	Sssss	SSSSSSSSS
52	136	\N	\N	\N	\N	2021-12-29 13:59:32.281092	2021-12-29 13:59:32.281092	Sssss	SSSSSSSSS
53	136	\N	\N	\N	\N	2021-12-29 13:59:32.410122	2021-12-29 13:59:32.410122	Sssss	SSSSSSSSS
54	136	\N	\N	\N	\N	2021-12-29 13:59:32.559412	2021-12-29 13:59:32.559412	Sssss	SSSSSSSSS
55	136	\N	\N	\N	\N	2021-12-29 13:59:33.902519	2021-12-29 13:59:33.902519	Sssss	SSSSSSSSSssssssssss
56	136	\N	\N	\N	\N	2021-12-29 13:59:34.051758	2021-12-29 13:59:34.051758	Sssss	SSSSSSSSSssssssssss
57	136	\N	\N	\N	\N	2021-12-29 13:59:34.179502	2021-12-29 13:59:34.179502	Sssss	SSSSSSSSSssssssssss
58	136	\N	\N	\N	\N	2021-12-29 13:59:34.350856	2021-12-29 13:59:34.350856	Sssss	SSSSSSSSSssssssssss
59	136	\N	\N	\N	\N	2022-01-04 10:00:54.270793	2022-01-04 10:00:54.270793	Something	zsasss
60	136	\N	\N	\N	\N	2022-01-04 10:00:54.950681	2022-01-04 10:00:54.950681	Something	zsasss
61	136	\N	\N	\N	\N	2022-01-04 10:00:58.153248	2022-01-04 10:00:58.153248	Something	zsasss
62	136	\N	\N	\N	\N	2022-01-05 11:07:56.280222	2022-01-05 11:07:56.280222	Somethings	sss
63	124	\N	\N	\N	\N	2022-01-06 11:28:21.322147	2022-01-06 11:28:21.322147	working	Nothing
64	136	\N	\N	\N	\N	2022-01-06 11:35:48.407148	2022-01-06 11:35:48.407148	Something	Something
65	124	\N	\N	\N	\N	2022-01-07 08:10:57.320184	2022-01-07 08:10:57.320184	hdbhd	kmkdd
66	136	\N	\N	\N	\N	2022-01-10 09:23:30.594303	2022-01-10 09:23:30.594303	Some	Some
67	136	\N	\N	\N	\N	2022-01-10 12:52:27.463516	2022-01-10 12:52:27.463516	Something	Something
68	137	\N	\N	\N	\N	2022-01-11 13:57:58.036235	2022-01-11 13:57:58.036235	Hi	Hi
69	133	\N	\N	\N	\N	2022-01-12 07:25:39.118072	2022-01-12 07:25:39.118072	Hello	Got an issue
70	129	\N	\N	\N	\N	2022-01-12 09:37:32.933232	2022-01-12 09:37:32.933232	GJHGJN	HJKHGKH
71	133	\N	\N	\N	\N	2022-01-14 15:12:11.602897	2022-01-14 15:12:11.602897	Hello	Sending contact info
72	137	\N	\N	\N	\N	2022-01-17 12:04:27.953832	2022-01-17 12:04:27.953832	1	1
73	378	\N	\N	\N	\N	2022-01-17 13:29:51.715611	2022-01-17 13:29:51.715611	Hi	gy
74	376	\N	\N	\N	\N	2022-01-20 10:17:43.270801	2022-01-20 10:17:43.270801	1	1
75	370	\N	\N	\N	\N	2022-01-21 08:56:03.45788	2022-01-21 08:56:03.45788	1	1
76	370	\N	\N	\N	\N	2022-01-21 09:56:04.045197	2022-01-21 09:56:04.045197	1	1
77	379	\N	\N	\N	\N	2022-01-24 13:48:34.584799	2022-01-24 13:48:34.584799	1	1
78	370	\N	\N	\N	\N	2022-01-25 15:02:27.507403	2022-01-25 15:02:27.507403	1	1
79	370	\N	\N	\N	\N	2022-01-25 15:02:28.957267	2022-01-25 15:02:28.957267	1	1
80	370	\N	\N	\N	\N	2022-01-26 13:15:41.384481	2022-01-26 13:15:41.384481	1	1
81	370	\N	\N	\N	\N	2022-01-27 14:20:24.877099	2022-01-27 14:20:24.877099	1	1
82	370	\N	\N	\N	\N	2022-01-28 15:57:45.728265	2022-01-28 15:57:45.728265	1	1
83	383	\N	\N	\N	\N	2022-01-31 10:31:14.642442	2022-01-31 10:31:14.642442	1	1
84	371	\N	\N	\N	\N	2022-01-31 14:08:26.402837	2022-01-31 14:08:26.402837	Login	not able to login
85	376	\N	\N	\N	\N	2022-01-31 14:10:54.397376	2022-01-31 14:10:54.397376	1	1
86	371	\N	\N	\N	\N	2022-01-31 14:10:58.624517	2022-01-31 14:10:58.624517	sign up	not able to sign up
87	371	\N	\N	\N	\N	2022-01-31 14:11:46.594016	2022-01-31 14:11:46.594016	test	test
88	370	\N	\N	\N	\N	2022-02-01 08:54:32.823991	2022-02-01 08:54:32.823991	1	1
89	370	\N	\N	\N	\N	2022-02-01 08:55:41.995961	2022-02-01 08:55:41.995961	2	2
90	137	\N	\N	\N	\N	2022-02-01 12:15:20.100304	2022-02-01 12:15:20.100304	Sss	111
91	378	\N	\N	\N	\N	2022-02-02 11:56:11.772196	2022-02-02 11:56:11.772196	1	1
\.


--
-- Data for Name: content_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_texts (id, headline, content, hyperlink, affiliation, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: content_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_types (id, name, type, identifier, rank, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: content_videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_videos (id, separate_section, headline, description, thumbnails, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contents (id, sub_category_id, category_id, content_type_id, language_id, status, publish_date, archived, feature_article, feature_video, searchable_text, review_status, feedback, admin_user_id, view_count, contentable_type, contentable_id, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: contents_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contents_languages (id, account_id, language_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, course_name, duration, year, profile_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cta (id, headline, description, category_id, long_background_image, square_background_image, button_text, redirect_url, text_alignment, button_alignment, is_square_cta, is_long_rectangle_cta, is_text_cta, is_image_cta, has_button, visible_on_home_page, visible_on_details_page, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: current_annual_salaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_annual_salaries (id, current_annual_salary, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: current_annual_salary_current_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_annual_salary_current_status (id, current_status_id, current_annual_salary_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: current_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_status (id, most_recent_job_title, company_name, notice_period, end_date, profile_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: current_status_employment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_status_employment_types (id, current_status_id, employment_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: current_status_industries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_status_industries (id, current_status_id, industry_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: degree_educational_qualifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.degree_educational_qualifications (id, educational_qualification_id, degree_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: degrees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.degrees (id, degree_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: educational_qualification_field_study; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.educational_qualification_field_study (id, educational_qualification_id, field_study_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: educational_qualifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.educational_qualifications (id, school_name, start_date, end_date, grades, description, make_grades_public, profile_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: educations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.educations (id, qualification, profile_bio_id, created_at, updated_at, year_from, year_to, description) FROM stdin;
\.


--
-- Data for Name: email_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_notifications (id, notification_id, send_to_email, sent_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: email_otps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_otps (id, email, pin, activated, valid_until, created_at, updated_at) FROM stdin;
1	lalabhai.solanki@tatvasoft.com	9879	f	2021-10-25 12:04:28.992478	2021-10-25 11:59:28.992382	2021-10-25 11:59:28.992382
2	lalabhai.solanki@tatvasoft.com	2426	f	2021-10-25 12:05:35.963004	2021-10-25 12:00:35.962923	2021-10-25 12:00:35.962923
3	lalabhai.solanki@tatvasoft.com	4614	f	2021-10-25 12:06:08.077041	2021-10-25 12:01:08.076946	2021-10-25 12:01:08.076946
4	lalabhai.solanki@tatvasoft.com	6384	f	2021-10-25 12:06:46.369868	2021-10-25 12:01:46.369801	2021-10-25 12:01:46.369801
5	lalabhai.solanki@tatvasoft.com	3803	f	2021-10-25 12:29:07.792988	2021-10-25 12:24:07.79286	2021-10-25 12:24:07.79286
6	lalabhai.solanki@tatvasoft.com	8177	f	2021-10-25 12:29:41.159034	2021-10-25 12:24:41.158971	2021-10-25 12:24:41.158971
589	prajapati14399+17@gmail.com	8254	t	2021-12-24 09:18:52.909793	2021-12-24 09:13:52.909722	2021-12-24 09:14:19.963902
594	cebal43434@zherben.com	2560	t	2022-01-04 10:22:55.355075	2022-01-04 10:17:55.354683	2022-01-04 10:19:29.328726
513	testst@yopmail.com	3149	f	2021-12-14 08:30:28.179115	2021-12-14 08:25:28.179043	2021-12-14 08:25:28.179043
519	aksay123@mail.com	1805	f	2021-12-14 13:02:45.536477	2021-12-14 12:57:45.536408	2021-12-14 12:57:45.536408
525	somename@gmail.com	5389	f	2021-12-15 08:25:57.196025	2021-12-15 08:20:57.195917	2021-12-15 08:20:57.195917
538	reeddhi.pandya@test.com	4851	f	2021-12-20 15:23:10.871875	2021-12-20 15:18:10.871802	2021-12-20 15:18:10.871802
539	reeddhi.pandya@test.com	9638	f	2021-12-20 15:23:17.837402	2021-12-20 15:18:17.837189	2021-12-20 15:18:17.837189
544	ujjavalbarot2+1001@gmail.com	2704	t	2021-12-22 09:28:53.677915	2021-12-22 09:23:53.677845	2021-12-22 09:27:26.993544
549	bijow74866@xtrempro.com	6755	f	2021-12-22 09:55:01.483197	2021-12-22 09:50:01.483125	2021-12-22 09:50:01.483125
554	prajapati3968@gmail.com	8219	f	2021-12-23 13:19:15.072271	2021-12-23 13:14:15.072175	2021-12-23 13:14:15.072175
559	prajapati14399+4@gmail.com	5103	f	2021-12-23 14:17:54.783012	2021-12-23 14:12:54.78295	2021-12-23 14:12:54.78295
649	BenWise111@protonmail.com	4624	f	2022-01-24 13:55:50.936623	2022-01-24 13:50:50.936551	2022-01-24 13:50:50.936551
612	j.valles5116@gmail.com	7151	t	2022-01-04 15:17:02.557204	2022-01-04 15:12:02.557108	2022-01-04 15:12:51.117136
579	ujjavalbarot2+1200@gmail.com	6769	t	2021-12-24 06:13:39.429738	2021-12-24 06:08:39.429644	2021-12-24 06:09:13.673687
585	prajapati14399+15@gmail.com	4919	t	2021-12-24 07:33:11.386549	2021-12-24 07:28:11.386426	2021-12-24 07:28:37.281078
654	111@protonmail.com	8728	f	2022-01-28 13:08:37.119184	2022-01-28 13:03:37.119087	2022-01-28 13:03:37.119087
625	himanshu.kumar@protonshub.com	9414	t	2022-01-13 08:23:33.126934	2022-01-13 08:18:33.126762	2022-01-13 08:19:11.426972
752	bhawnap@witmates.com	5643	t	2022-02-02 12:21:36.224429	2022-02-02 12:16:36.224363	2022-02-02 12:17:03.980358
757	SarahPaulsonAHS@protonmail.com	6271	t	2022-02-02 13:10:58.984291	2022-02-02 13:05:58.984228	2022-02-02 13:06:31.722726
762	prajapati14399+887@gmail.com	6773	t	2022-02-03 05:47:53.634011	2022-02-03 05:42:53.633915	2022-02-03 05:43:35.23339
67	lalabhai.solanki@tatvasoft.com	5651	f	2021-10-27 12:58:09.440268	2021-10-27 12:53:09.440204	2021-10-27 12:53:09.440204
650	testnew123@gmail.com	2693	f	2022-01-25 07:56:02.464732	2022-01-25 07:51:02.464505	2022-01-25 07:51:02.464505
655	112@protonmail.com	7795	f	2022-01-28 13:22:12.894821	2022-01-28 13:17:12.89472	2022-01-28 13:17:12.89472
764	emmajohnsondg@protonmail.com	4291	t	2022-02-03 08:14:08.562379	2022-02-03 08:09:08.562317	2022-02-03 08:09:30.804789
514	sss22@mail.ru	1439	f	2021-12-14 10:47:24.978586	2021-12-14 10:42:24.978495	2021-12-14 10:42:24.978495
515	yobem47142@leanrights.com	9245	f	2021-12-14 10:48:23.584859	2021-12-14 10:43:23.58479	2021-12-14 10:43:23.58479
520	something@gmail.com	6351	f	2021-12-14 13:50:59.882611	2021-12-14 13:45:59.882555	2021-12-14 13:45:59.882555
770	himanshu.kumar+1@protonshub.com	1717	f	2022-02-07 13:27:53.421275	2022-02-07 13:22:53.421194	2022-02-07 13:22:53.421194
608	wojipan893@xxyxi.com	3592	f	2022-01-04 10:54:45.657673	2022-01-04 10:49:45.657611	2022-01-04 10:49:45.657611
540	reeddhi.pandya@test.com	5973	f	2021-12-20 15:23:17.923816	2021-12-20 15:18:17.92372	2021-12-20 15:18:17.92372
614	wetivix854@vinopub.com	1033	t	2022-01-06 11:55:34.312445	2022-01-06 11:50:34.312365	2022-01-06 11:51:05.117327
555	prajapati14399+1@gmail.com	3716	f	2021-12-23 13:31:42.402544	2021-12-23 13:26:42.402454	2021-12-23 13:26:42.402454
565	prajapati14399+8@gmail.com	4981	t	2021-12-24 04:28:44.220049	2021-12-24 04:23:44.219991	2021-12-24 04:24:06.879674
570	prajapati14399+10@gmail.com	6236	t	2021-12-24 05:38:07.565741	2021-12-24 05:33:07.565665	2021-12-24 05:33:23.898242
580	prajapati14399+13@gmail.com	2552	t	2021-12-24 07:27:04.680043	2021-12-24 07:22:04.679949	2021-12-24 07:22:27.094402
586	yaxaxi5431@wolfpat.com	9522	f	2021-12-24 08:17:06.361612	2021-12-24 08:12:06.361522	2021-12-24 08:12:06.361522
102	lalabhai.solanki@tatvasoft.com	1054	f	2021-10-28 09:33:35.711704	2021-10-28 09:28:35.711645	2021-10-28 09:28:35.711645
753	test123@yopmail.com	8781	t	2022-02-02 13:02:51.811386	2022-02-02 12:57:51.811241	2022-02-02 12:58:06.597834
758	1lenarom1@gmail.com	8519	t	2022-02-02 13:49:36.573921	2022-02-02 13:44:36.572951	2022-02-02 13:44:57.729808
155	lalabhai.solanki@tatvasoft.com	7983	f	2021-10-29 07:20:48.225978	2021-10-29 07:15:48.225908	2021-10-29 07:15:48.225908
591	lalji.tatvasoft@gmail.com	6199	t	2021-12-27 10:02:19.484797	2021-12-27 09:57:19.483931	2021-12-27 09:57:32.794187
516	ponado3408@mediafate.com	1920	f	2021-12-14 10:49:28.19304	2021-12-14 10:44:28.192715	2021-12-14 10:44:28.192715
521	ees@gmail.com	3635	f	2021-12-14 16:19:38.630047	2021-12-14 16:14:38.629954	2021-12-14 16:14:38.629954
527	safoge72222@ineedsa.com	3354	f	2021-12-15 12:09:02.897077	2021-12-15 12:04:02.896983	2021-12-15 12:04:02.896983
532	ssadad@gmail.com	8074	f	2021-12-17 08:44:01.787657	2021-12-17 08:39:01.787556	2021-12-17 08:39:01.787556
533	ssadad@gmail.com	9286	f	2021-12-17 08:44:04.284838	2021-12-17 08:39:04.284744	2021-12-17 08:39:04.284744
541	sonflower123@mail.com	6778	f	2021-12-21 10:31:00.279101	2021-12-21 10:26:00.279012	2021-12-21 10:26:00.279012
546	lastnameandname2A@mail.ru	5629	f	2021-12-22 09:53:51.993655	2021-12-22 09:48:51.993575	2021-12-22 09:48:51.993575
551	prajapati14399@gmail.com	7043	f	2021-12-22 10:38:04.892616	2021-12-22 10:33:04.892545	2021-12-22 10:33:04.892545
615	rawevit371@wusehe.com	8645	t	2022-01-06 13:23:19.830803	2022-01-06 13:18:19.830711	2022-01-06 13:18:34.173671
561	prajapati14399+7@gmail.com	8689	t	2021-12-23 15:19:49.021977	2021-12-23 15:14:49.021897	2021-12-23 15:15:12.492528
674	michaelcoredg@gmail.com	3319	f	2022-02-01 09:08:39.405174	2022-02-01 09:03:39.405104	2022-02-01 09:03:39.405104
576	prajapati14399+12@gmail.com	1682	t	2021-12-24 05:59:34.464344	2021-12-24 05:54:34.464267	2021-12-24 05:55:02.22135
582	prajapati14399+14@gmail.com	9181	t	2021-12-24 07:29:11.893071	2021-12-24 07:24:11.892988	2021-12-24 07:24:49.723356
587	vewej58220@ritumusic.com	4097	t	2021-12-24 08:20:29.433398	2021-12-24 08:15:29.433202	2021-12-24 08:15:50.753943
754	lily@abyssmail.com	1938	t	2022-02-02 13:06:10.973112	2022-02-02 13:01:10.970537	2022-02-02 13:01:43.418683
633	test123acc@yopmail.com	3335	t	2022-01-14 04:50:45.055535	2022-01-14 04:45:45.055466	2022-01-14 04:46:03.38547
207	dharani.a@protonshub.com	9127	f	2021-11-12 08:40:15.036998	2021-11-12 08:35:15.03693	2021-11-12 08:35:15.03693
243	dharani.a@protonshub.com	6994	f	2021-11-12 16:19:19.785162	2021-11-12 16:14:19.785096	2021-11-12 16:14:19.785096
244	dharani.a@protonshub.com	8937	f	2021-11-15 06:07:15.372425	2021-11-15 06:02:15.371432	2021-11-15 06:02:15.371432
250	arun.nm0591@gmail.com	2143	f	2021-11-16 04:53:30.293144	2021-11-16 04:48:30.293041	2021-11-16 04:48:30.293041
592	testproject@yopmail.com	3187	t	2021-12-28 06:47:19.289115	2021-12-28 06:42:19.289026	2021-12-28 06:42:38.100173
599	facamo4596@zherben.com	8171	t	2022-01-04 10:33:00.986907	2022-01-04 10:28:00.98674	2022-01-04 10:28:35.591701
517	dem@123mail.com	8957	f	2021-12-14 10:58:33.900148	2021-12-14 10:53:33.900083	2021-12-14 10:53:33.900083
523	testttt@yopmail.com	9987	f	2021-12-15 05:48:21.309454	2021-12-15 05:43:21.309386	2021-12-15 05:43:21.309386
610	willsmithdg@protonmail.com	9093	t	2022-01-04 11:54:15.052633	2022-01-04 11:49:15.052564	2022-01-04 11:50:56.231793
534	test_again@yopmail.com	1357	f	2021-12-20 06:49:47.621395	2021-12-20 06:44:47.620494	2021-12-20 06:44:47.620494
535	test_again@yopmail.com	7063	f	2021-12-20 06:51:00.818809	2021-12-20 06:46:00.818688	2021-12-20 06:46:00.818688
616	repid42944@whecode.com	8582	t	2022-01-10 10:40:16.699454	2022-01-10 10:35:16.699265	2022-01-10 10:35:30.780292
766	evanpeterstest@protonmail.com	3806	f	2022-02-07 07:52:57.120929	2022-02-07 07:47:57.120807	2022-02-07 07:47:57.120807
552	retay41714@ztymm.com	2502	f	2021-12-22 11:41:49.564216	2021-12-22 11:36:49.563709	2021-12-22 11:36:49.563709
557	prajapati14399+2@gmail.com	4804	f	2021-12-23 13:42:21.421963	2021-12-23 13:37:21.421902	2021-12-23 13:37:21.421902
716	akshay786prajapati@gmail.com	7083	t	2022-02-02 07:56:38.623034	2022-02-02 07:51:38.622975	2022-02-02 07:51:52.207033
577	ujjavalbarot2+1100@gmail.com	1800	t	2021-12-24 06:11:33.239322	2021-12-24 06:06:33.239264	2021-12-24 06:06:50.769132
744	TestUser070597@protonmail.com	9300	f	2022-02-02 09:27:12.852444	2022-02-02 09:22:12.852376	2022-02-02 09:22:12.852376
760	prajapati14399+885@gmail.com	6672	t	2022-02-03 05:29:16.625356	2022-02-03 05:24:16.625284	2022-02-03 05:24:58.654616
473	khanna123@mail.com	2948	f	2021-12-01 08:27:19.210848	2021-12-01 08:22:19.210783	2021-12-01 08:22:19.210783
593	project123@yopmail.com	7818	t	2022-01-04 07:39:38.45178	2022-01-04 07:34:38.45077	2022-01-04 07:35:57.321895
512	tesstt@yopmail.com	8352	f	2021-12-14 07:58:01.997259	2021-12-14 07:53:01.997157	2021-12-14 07:53:01.997157
262	dsenthil.60@gmail.com	4854	f	2021-11-16 11:14:20.867739	2021-11-16 11:09:20.867675	2021-11-16 11:09:20.867675
518	Jackie123@mail.com	8987	f	2021-12-14 11:32:38.303116	2021-12-14 11:27:38.303023	2021-12-14 11:27:38.303023
524	test12345678@yopmail.com	4573	f	2021-12-15 07:46:32.965335	2021-12-15 07:41:32.965228	2021-12-15 07:41:32.965228
529	sfdsfgcvc@gmail.com	8235	f	2021-12-16 13:15:53.083284	2021-12-16 13:10:53.083223	2021-12-16 13:10:53.083223
536	reeddhi.pandya@tatvasoft.com	1270	f	2021-12-20 15:17:10.775861	2021-12-20 15:12:10.775757	2021-12-20 15:12:10.775757
537	reeddhi.pandya@tatvasoft.com	2628	f	2021-12-20 15:17:20.226907	2021-12-20 15:12:20.226836	2021-12-20 15:12:20.226836
548	bijow74866@xtrempro.com	9797	f	2021-12-22 09:54:56.174879	2021-12-22 09:49:56.174746	2021-12-22 09:49:56.174746
553	retay41714@ztymm.com	7329	f	2021-12-22 11:41:51.912693	2021-12-22 11:36:51.912354	2021-12-22 11:36:51.912354
558	prajapati14399+3@gmail.com	9084	f	2021-12-23 14:13:38.853983	2021-12-23 14:08:38.853893	2021-12-23 14:08:38.853893
568	prajapati14399+9@gmail.com	6814	t	2021-12-24 05:04:15.616571	2021-12-24 04:59:15.616497	2021-12-24 04:59:38.704861
573	prajapati14399+11@gmail.com	4751	t	2021-12-24 05:45:36.292658	2021-12-24 05:40:36.2926	2021-12-24 05:40:54.709568
719	robert123@mail.com	4668	t	2022-02-02 08:02:27.212129	2022-02-02 07:57:27.212065	2022-02-02 07:57:43.736142
618	gerib23355@whecode.com	5788	t	2022-01-10 11:02:56.37798	2022-01-10 10:57:56.377914	2022-01-10 10:58:33.485813
624	lofex73215@vinopub.com	4328	t	2022-01-13 07:44:36.516303	2022-01-13 07:39:36.516207	2022-01-13 07:39:54.947052
640	DevidCane111@protonmail.com	1174	t	2022-01-17 10:06:02.90838	2022-01-17 10:01:02.908305	2022-01-17 10:01:31.425913
291	bivew83666@epeva.com	6860	f	2021-11-18 08:21:26.877792	2021-11-18 08:16:26.877719	2021-11-18 08:16:26.877719
761	prajapati14399+886@gmail.com	4567	t	2022-02-03 05:32:06.905516	2022-02-03 05:27:06.905368	2022-02-03 05:27:26.13792
296	dsenthil.60@gmail.com	8143	f	2021-11-19 06:35:36.372515	2021-11-19 06:30:36.372415	2021-11-19 06:30:36.372415
\.


--
-- Data for Name: employment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employment_types (id, employment_type_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: epubs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.epubs (id, heading, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: exams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exams (id, heading, description, "to", "from", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favourites (id, favourite_by_id, created_at, updated_at, favouriteable_id, favouriteable_type) FROM stdin;
\.


--
-- Data for Name: field_study; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.field_study (id, field_of_study, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.follows (id, account_id, created_at, updated_at, current_user_id) FROM stdin;
\.


--
-- Data for Name: global_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_settings (id, notice_period, created_at, updated_at, token_valid_days) FROM stdin;
1	\N	2021-12-15 11:04:48.164257	2021-12-15 11:04:48.164257	45
\.


--
-- Data for Name: hobbies_and_interests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hobbies_and_interests (id, title, category, description, make_public, profile_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, attached_item_id, attached_item_type, image, created_at, updated_at) FROM stdin;
1	35	BxBlockProfile::Profile	lion.png	2021-11-03 10:14:06.811266	2021-11-03 10:14:06.811266
2	36	BxBlockProfile::Profile	image001.png	2021-11-03 12:24:46.762185	2021-11-03 12:24:46.762185
3	40	BxBlockProfile::Profile	mindset.jpg	2021-11-08 11:12:38.697248	2021-11-08 11:12:38.697248
58	157	BxBlockProfile::Profile	9.png	2021-12-03 13:31:55.697705	2021-12-03 13:31:55.697705
59	157	BxBlockProfile::Profile	9.png	2021-12-03 13:31:55.727273	2021-12-03 13:31:55.727273
67	189	BxBlockProfile::Profile	bhawna.png	2021-12-23 13:14:33.599094	2021-12-23 13:14:33.599094
77	230	BxBlockProfile::Profile	friends.png	2022-02-02 11:46:03.965242	2022-02-02 11:46:03.965242
28	112	BxBlockProfile::Profile	download.png	2021-11-19 09:24:33.803993	2021-11-19 09:24:33.803993
33	32	BxBlockProfile::Profile	NFT.jpg	2021-11-23 10:30:15.569762	2021-12-06 13:06:49.195382
78	234	BxBlockProfile::Profile	images__1_.jpeg	2022-02-02 13:01:25.432707	2022-02-02 13:01:25.432707
7	69	BxBlockProfile::Profile	Screenshot_2021-10-19_173909.png	2021-11-12 11:24:27.618949	2021-11-12 11:24:27.618949
8	70	BxBlockProfile::Profile	mindset.jpg	2021-11-12 11:48:32.719023	2021-11-12 11:48:32.719023
9	71	BxBlockProfile::Profile	lion__3_.jpg	2021-11-12 12:02:19.708984	2021-11-12 12:02:19.708984
10	74	BxBlockProfile::Profile	mindset.jpg	2021-11-12 12:07:13.910283	2021-11-12 12:07:13.910283
11	81	BxBlockProfile::Profile	image_background_1X.png	2021-11-12 17:34:42.908157	2021-11-12 17:34:42.908157
60	169	BxBlockProfile::Profile	avatara__2_.jpg	2021-12-08 14:28:18.823541	2021-12-08 14:28:18.823541
45	143	BxBlockProfile::Profile	3.png	2021-11-30 10:25:49.232391	2021-11-30 10:26:15.502319
61	169	BxBlockProfile::Profile	avatara__2_.jpg	2021-12-08 14:28:19.10226	2021-12-08 14:28:19.10226
13	84	BxBlockProfile::Profile	31.png	2021-11-15 09:33:49.497616	2021-11-15 09:33:49.497616
12	83	BxBlockProfile::Profile	Bitmap-13.jpg	2021-11-15 07:42:55.994184	2021-11-15 11:57:40.691817
29	56	BxBlockProfile::Profile	QA.jpeg	2021-11-22 07:39:49.568512	2021-11-22 07:39:49.568512
16	88	BxBlockProfile::Profile	mARVEL.jpg	2021-11-16 04:09:29.232199	2021-11-16 04:09:29.232199
62	177	BxBlockProfile::Profile	images__1_.jpeg	2021-12-10 07:00:10.843638	2021-12-10 07:00:10.843638
63	177	BxBlockProfile::Profile	images__1_.jpeg	2021-12-10 07:00:11.009129	2021-12-10 07:00:11.009129
68	197	BxBlockProfile::Profile	dharani.png	2021-12-24 03:59:19.327018	2021-12-24 03:59:19.821537
47	145	BxBlockProfile::Profile	download.jpeg	2021-12-01 05:35:10.131137	2021-12-01 05:35:10.131137
17	90	BxBlockProfile::Profile	24.png	2021-11-16 10:37:35.894124	2021-11-16 10:37:35.894124
31	117	BxBlockProfile::Profile	Без_названия.png	2021-11-22 13:06:31.098288	2021-11-22 13:06:31.098288
32	118	BxBlockProfile::Profile	Без_названия.png	2021-11-22 13:10:02.501731	2021-11-22 13:10:02.501731
30	117	BxBlockProfile::Profile	12.png	2021-11-22 13:06:31.077873	2021-11-22 13:30:52.828351
48	145	BxBlockProfile::Profile	download.jpeg	2021-12-01 05:35:10.186378	2021-12-01 05:35:10.186378
18	95	BxBlockProfile::Profile	SPIDER.jpg	2021-11-17 06:01:53.781229	2021-11-17 06:01:53.781229
35	44	BxBlockProfile::Profile	IMG_aCEDEMY.jpg	2021-11-24 13:29:10.425381	2021-11-24 13:29:10.425381
20	96	BxBlockProfile::Profile	Без_названия.png	2021-11-17 07:54:47.182653	2021-11-17 07:55:28.702985
69	207	BxBlockProfile::Profile	avatara__2_.jpg	2021-12-24 08:12:34.923688	2021-12-24 08:12:34.923688
36	132	BxBlockProfile::Profile	lion.jpg	2021-11-29 08:57:28.011497	2021-11-29 08:57:28.011497
37	133	BxBlockProfile::Profile	mindset.jpg	2021-11-29 09:00:05.689379	2021-11-29 09:00:05.689379
38	134	BxBlockProfile::Profile	aksay.jpg	2021-11-29 09:07:14.020181	2021-11-29 09:07:14.020181
22	100	BxBlockProfile::Profile	1.png	2021-11-17 12:32:03.804192	2021-11-17 12:32:03.804192
39	135	BxBlockProfile::Profile	twinkle.jpg	2021-11-29 09:08:46.459234	2021-11-29 09:08:46.459234
23	101	BxBlockProfile::Profile	1.png	2021-11-17 14:05:20.985028	2021-11-17 14:05:20.985028
24	102	BxBlockProfile::Profile	10.png	2021-11-17 14:14:27.273877	2021-11-17 14:14:27.273877
25	104	BxBlockProfile::Profile	12.png	2021-11-17 15:14:21.782754	2021-11-17 15:14:21.782754
41	140	BxBlockProfile::Profile	Marvel-star-Robert-Downey-Jr.jpg	2021-11-30 06:10:28.420559	2021-11-30 06:10:28.420559
42	140	BxBlockProfile::Profile	Marvel-star-Robert-Downey-Jr.jpg	2021-11-30 06:10:28.434471	2021-11-30 06:10:28.434471
40	50	BxBlockProfile::Profile	download.jpeg	2021-11-30 05:52:46.832212	2021-12-01 06:05:18.408724
34	126	BxBlockProfile::Profile	5-1.jpg	2021-11-24 08:05:15.718219	2021-12-10 08:18:56.206525
26	105	BxBlockProfile::Profile	QA.jpeg	2021-11-18 08:11:18.698344	2021-11-18 08:11:18.698344
43	142	BxBlockProfile::Profile	12.png	2021-11-30 08:38:17.009312	2021-11-30 08:38:17.009312
44	142	BxBlockProfile::Profile	12.png	2021-11-30 08:38:17.02554	2021-11-30 08:38:17.02554
64	179	BxBlockProfile::Profile	Bitmap-13.jpg	2021-12-10 11:09:14.621624	2021-12-10 11:09:15.2289
70	208	BxBlockProfile::Profile	avatara__2_.jpg	2021-12-24 08:15:37.318219	2021-12-24 08:15:37.318219
71	212	BxBlockProfile::Profile	Screenshot_80.png	2022-01-04 10:18:29.759254	2022-01-04 10:18:29.759254
21	54	BxBlockProfile::Profile	12.png	2021-11-17 07:54:53.484835	2021-12-13 13:08:08.53994
74	221	BxBlockProfile::Profile	peter-vanosdall-ktpyjH2h9xs-unsplash.jpg	2022-01-17 09:37:44.506675	2022-01-17 09:37:44.506675
4	49	BxBlockProfile::Profile	Bitmap-13.jpg	2021-11-10 12:38:03.770743	2021-11-18 12:33:38.905829
27	109	BxBlockProfile::Profile	Bitmap-13.jpg	2021-11-18 12:40:03.697653	2021-11-18 12:40:03.697653
49	149	BxBlockProfile::Profile	8.png	2021-12-01 13:37:24.989082	2021-12-01 13:37:24.989082
50	149	BxBlockProfile::Profile	8.png	2021-12-01 13:37:25.016579	2021-12-01 13:37:25.016579
51	152	BxBlockProfile::Profile	steve.jpg	2021-12-03 09:31:53.027537	2021-12-03 09:31:53.027537
52	152	BxBlockProfile::Profile	steve.jpg	2021-12-03 09:31:53.058891	2021-12-03 09:31:53.058891
53	153	BxBlockProfile::Profile	chrish.jpg	2021-12-03 09:36:43.108833	2021-12-03 09:36:43.108833
54	153	BxBlockProfile::Profile	chrish.jpg	2021-12-03 09:36:43.209957	2021-12-03 09:36:43.209957
55	154	BxBlockProfile::Profile	Scarlett-Johanson.jpg	2021-12-03 09:41:21.624613	2021-12-03 09:41:22.108363
56	155	BxBlockProfile::Profile	brie_larson.jpg	2021-12-03 09:56:29.518465	2021-12-03 09:56:29.518465
57	155	BxBlockProfile::Profile	brie_larson.jpg	2021-12-03 09:56:29.707176	2021-12-03 09:56:29.707176
19	52	BxBlockProfile::Profile	nftboy.png	2021-11-17 07:11:43.828778	2021-12-15 07:25:11.326992
65	182	BxBlockProfile::Profile	user_img.png	2021-12-20 15:13:10.830726	2021-12-20 15:13:10.830726
66	189	BxBlockProfile::Profile	bhawna.png	2021-12-23 13:14:33.40233	2021-12-23 13:14:33.40233
46	55	BxBlockProfile::Profile	png-transparent-computer-icons-female-youtube-woman-avatar-business-woman-face-black-hair-head.png	2021-11-30 11:11:33.107439	2022-01-12 08:48:28.794294
73	225	BxBlockProfile::Profile	a65832155622ac173337874f02b218fb--people-icon-avatar.jpg	2022-01-13 09:28:59.626448	2022-01-13 09:50:04.184432
72	220	BxBlockProfile::Profile	download.jpg	2022-01-10 15:15:53.041075	2022-01-19 12:02:00.487422
76	231	BxBlockProfile::Profile	images.png	2022-02-02 09:02:44.602243	2022-02-02 09:02:44.602243
\.


--
-- Data for Name: industries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.industries (id, industry_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: interactive_faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interactive_faqs (id, question, answer, created_at, updated_at) FROM stdin;
2	where to create post ?	click on create post button.	2021-12-23 12:18:02.510662	2021-12-29 10:46:36.161703
3	where i can see my friend request?	on your profile click on friend requests button.	2021-12-23 12:19:24.430535	2021-12-29 10:48:17.153702
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, language, proficiency, profile_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (id, like_by_id, likeable_type, likeable_id, created_at, updated_at) FROM stdin;
78	133	BxBlockPosts::Post	9	2021-12-03 15:14:19.424335	2021-12-03 15:14:19.424335
151	136	BxBlockPosts::Post	53	2021-12-22 21:02:56.265909	2021-12-22 21:02:56.265909
79	133	BxBlockPosts::Post	2	2021-12-03 15:15:04.361147	2021-12-03 15:15:04.361147
317	259	BxBlockPosts::Post	76	2022-01-18 12:51:38.290172	2022-01-18 12:51:38.290172
81	129	BxBlockPosts::Post	2	2021-12-06 05:43:25.900615	2021-12-06 05:43:25.900615
153	259	BxBlockPosts::Post	45	2021-12-23 08:22:03.77001	2021-12-23 08:22:03.77001
154	259	BxBlockPosts::Post	39	2021-12-23 08:22:12.278483	2021-12-23 08:22:12.278483
320	129	BxBlockPosts::Post	77	2022-01-19 04:42:29.405995	2022-01-19 04:42:29.405995
576	133	BxBlockPosts::Post	93	2022-02-01 07:11:13.094576	2022-02-01 07:11:13.094576
158	133	BxBlockPosts::Post	53	2021-12-24 07:07:16.183847	2021-12-24 07:07:16.183847
159	133	BxBlockPosts::Post	55	2021-12-24 08:27:38.530212	2021-12-24 08:27:38.530212
578	133	BxBlockPosts::Post	92	2022-02-01 07:12:07.81265	2022-02-01 07:12:07.81265
92	129	BxBlockPosts::Post	33	2021-12-07 06:39:46.51305	2021-12-07 06:39:46.51305
98	124	BxBlockPosts::Post	38	2021-12-08 11:04:14.039234	2021-12-08 11:04:14.039234
23	133	BxBlockPosts::Post	13	2021-11-29 16:25:24.162247	2021-11-29 16:25:24.162247
99	124	BxBlockPosts::Post	39	2021-12-08 11:04:19.333135	2021-12-08 11:04:19.333135
100	264	BxBlockPosts::Post	9	2021-12-08 14:39:17.673738	2021-12-08 14:39:17.673738
101	129	BxBlockPosts::Post	13	2021-12-09 06:53:39.837381	2021-12-09 06:53:39.837381
102	129	BxBlockPosts::Post	9	2021-12-09 06:53:45.617117	2021-12-09 06:53:45.617117
105	137	BxBlockPosts::Post	31	2021-12-09 13:23:54.215388	2021-12-09 13:23:54.215388
167	124	BxBlockComments::Comment	1	2022-01-05 08:36:42.985669	2022-01-05 08:36:42.985669
168	124	BxBlockComments::Comment	1	2022-01-05 08:40:22.789224	2022-01-05 08:40:22.789224
109	305	BxBlockPosts::Post	22	2021-12-10 07:21:15.091028	2021-12-10 07:21:15.091028
606	137	BxBlockPosts::Post	46	2022-02-02 11:36:13.140986	2022-02-02 11:36:13.140986
39	129	BxBlockPosts::Post	23	2021-12-01 06:06:05.984135	2021-12-01 06:06:05.984135
40	129	BxBlockPosts::Post	24	2021-12-01 06:06:10.108849	2021-12-01 06:06:10.108849
42	129	BxBlockPosts::Post	26	2021-12-01 06:06:17.257614	2021-12-01 06:06:17.257614
610	378	BxBlockComments::Comment	266	2022-02-04 09:04:54.488568	2022-02-04 09:04:54.488568
613	124	BxBlockPosts::Post	76	2022-02-07 06:55:10.36839	2022-02-07 06:55:10.36839
173	124	BxBlockComments::Comment	19	2022-01-05 09:03:16.597192	2022-01-05 09:03:16.597192
175	136	BxBlockPosts::Post	13	2022-01-05 09:48:51.804693	2022-01-05 09:48:51.804693
48	258	BxBlockPosts::Post	20	2021-12-01 11:43:47.800504	2021-12-01 11:43:47.800504
179	124	BxBlockComments::Comment	20	2022-01-05 11:10:27.714651	2022-01-05 11:10:27.714651
54	136	BxBlockPosts::Post	22	2021-12-02 07:44:31.809014	2021-12-02 07:44:31.809014
56	248	BxBlockPosts::Post	22	2021-12-03 07:48:06.679316	2021-12-03 07:48:06.679316
182	365	BxBlockPosts::Post	13	2022-01-05 13:54:46.653281	2022-01-05 13:54:46.653281
59	11	BxBlockPosts::Post	22	2021-12-03 12:44:48.052855	2021-12-03 12:44:48.052855
63	129	BxBlockPosts::Post	22	2021-12-03 13:13:07.576333	2021-12-03 13:13:07.576333
65	129	BxBlockPosts::Post	25	2021-12-03 13:15:02.880711	2021-12-03 13:15:02.880711
128	133	BxBlockPosts::Post	33	2021-12-14 07:31:49.60911	2021-12-14 07:31:49.60911
195	124	BxBlockComments::Comment	37	2022-01-07 09:30:01.640525	2022-01-07 09:30:01.640525
196	124	BxBlockComments::Comment	45	2022-01-07 09:50:49.274207	2022-01-07 09:50:49.274207
197	124	BxBlockComments::Comment	41	2022-01-07 12:59:10.789715	2022-01-07 12:59:10.789715
137	297	BxBlockPosts::Post	9	2021-12-20 07:22:33.210432	2021-12-20 07:22:33.210432
203	136	BxBlockComments::Comment	56	2022-01-10 08:50:56.308644	2022-01-10 08:50:56.308644
204	136	BxBlockComments::Comment	57	2022-01-10 08:50:57.827904	2022-01-10 08:50:57.827904
205	136	BxBlockComments::Comment	58	2022-01-10 08:51:12.027476	2022-01-10 08:51:12.027476
146	305	BxBlockPosts::Post	55	2021-12-21 10:46:14.092979	2021-12-21 10:46:14.092979
211	129	BxBlockPosts::Post	61	2022-01-10 10:18:07.125361	2022-01-10 10:18:07.125361
212	271	BxBlockPosts::Post	61	2022-01-10 10:18:52.433511	2022-01-10 10:18:52.433511
213	271	BxBlockPosts::Post	60	2022-01-10 10:18:54.689033	2022-01-10 10:18:54.689033
214	271	BxBlockPosts::Post	59	2022-01-10 10:19:00.552285	2022-01-10 10:19:00.552285
215	271	BxBlockPosts::Post	58	2022-01-10 10:19:01.972108	2022-01-10 10:19:01.972108
216	271	BxBlockPosts::Post	53	2022-01-10 10:19:03.684975	2022-01-10 10:19:03.684975
217	271	BxBlockPosts::Post	33	2022-01-10 10:19:05.654695	2022-01-10 10:19:05.654695
218	271	BxBlockPosts::Post	26	2022-01-10 10:19:10.487205	2022-01-10 10:19:10.487205
219	271	BxBlockPosts::Post	25	2022-01-10 10:19:12.299276	2022-01-10 10:19:12.299276
220	271	BxBlockPosts::Post	23	2022-01-10 10:19:16.023119	2022-01-10 10:19:16.023119
222	271	BxBlockPosts::Post	2	2022-01-10 10:19:19.99111	2022-01-10 10:19:19.99111
228	129	BxBlockPosts::Post	60	2022-01-10 11:06:51.622063	2022-01-10 11:06:51.622063
229	129	BxBlockPosts::Post	59	2022-01-10 11:06:56.154303	2022-01-10 11:06:56.154303
230	129	BxBlockPosts::Post	58	2022-01-10 11:07:00.640644	2022-01-10 11:07:00.640644
231	129	BxBlockPosts::Post	53	2022-01-10 11:07:05.579853	2022-01-10 11:07:05.579853
238	129	BxBlockComments::Comment	66	2022-01-10 12:02:50.390073	2022-01-10 12:02:50.390073
240	305	BxBlockComments::Comment	70	2022-01-11 07:41:48.589154	2022-01-11 07:41:48.589154
243	129	BxBlockComments::Comment	81	2022-01-11 13:00:56.676751	2022-01-11 13:00:56.676751
244	124	BxBlockComments::Comment	46	2022-01-12 09:15:10.311279	2022-01-12 09:15:10.311279
245	124	BxBlockComments::Comment	43	2022-01-12 09:15:16.231499	2022-01-12 09:15:16.231499
252	124	BxBlockComments::Comment	36	2022-01-12 09:34:31.176811	2022-01-12 09:34:31.176811
253	124	BxBlockComments::Comment	49	2022-01-12 09:34:41.570188	2022-01-12 09:34:41.570188
254	124	BxBlockComments::Comment	48	2022-01-12 09:34:52.930265	2022-01-12 09:34:52.930265
321	129	BxBlockPosts::Post	74	2022-01-19 04:42:41.665235	2022-01-19 04:42:41.665235
327	133	BxBlockPosts::Post	74	2022-01-19 07:11:15.066371	2022-01-19 07:11:15.066371
436	133	BxBlockPosts::Post	77	2022-01-21 07:17:44.196541	2022-01-21 07:17:44.196541
444	124	BxBlockComments::Comment	157	2022-01-21 09:03:21.328819	2022-01-21 09:03:21.328819
448	124	BxBlockComments::Comment	174	2022-01-21 10:40:28.093343	2022-01-21 10:40:28.093343
451	124	BxBlockComments::Comment	156	2022-01-21 11:38:48.215179	2022-01-21 11:38:48.215179
344	124	BxBlockComments::Comment	132	2022-01-19 12:50:30.349094	2022-01-19 12:50:30.349094
349	124	BxBlockComments::Comment	169	2022-01-20 06:21:38.642201	2022-01-20 06:21:38.642201
455	124	BxBlockComments::Comment	183	2022-01-24 12:18:16.404652	2022-01-24 12:18:16.404652
352	124	BxBlockComments::Comment	170	2022-01-20 06:40:53.701877	2022-01-20 06:40:53.701877
461	133	BxBlockComments::Comment	188	2022-01-25 07:08:46.673933	2022-01-25 07:08:46.673933
604	124	BxBlockComments::Comment	240	2022-02-02 04:47:09.539633	2022-02-02 04:47:09.539633
611	136	BxBlockPosts::Post	30	2022-02-04 10:39:00.292829	2022-02-04 10:39:00.292829
474	124	BxBlockComments::Comment	166	2022-01-25 09:31:01.991219	2022-01-25 09:31:01.991219
614	136	BxBlockComments::Comment	70	2022-02-08 07:58:23.598751	2022-02-08 07:58:23.598751
485	124	BxBlockComments::Comment	194	2022-01-25 11:33:45.212561	2022-01-25 11:33:45.212561
487	124	BxBlockComments::Comment	196	2022-01-25 11:40:08.408944	2022-01-25 11:40:08.408944
489	129	BxBlockComments::Comment	195	2022-01-25 11:41:49.426299	2022-01-25 11:41:49.426299
491	129	BxBlockComments::Comment	197	2022-01-25 11:41:55.652818	2022-01-25 11:41:55.652818
493	129	BxBlockComments::Comment	192	2022-01-25 11:41:59.3832	2022-01-25 11:41:59.3832
389	124	BxBlockPosts::Post	61	2022-01-20 11:23:51.979173	2022-01-20 11:23:51.979173
496	124	BxBlockComments::Comment	204	2022-01-25 12:47:43.097637	2022-01-25 12:47:43.097637
498	124	BxBlockComments::Comment	211	2022-01-25 12:59:38.056618	2022-01-25 12:59:38.056618
393	124	BxBlockComments::Comment	168	2022-01-20 11:32:12.787767	2022-01-20 11:32:12.787767
404	124	BxBlockComments::Comment	97	2022-01-20 11:43:37.868397	2022-01-20 11:43:37.868397
412	124	BxBlockComments::Comment	177	2022-01-20 13:07:49.065349	2022-01-20 13:07:49.065349
413	124	BxBlockComments::Comment	143	2022-01-20 13:07:53.969305	2022-01-20 13:07:53.969305
509	370	BxBlockPosts::Post	46	2022-01-26 13:14:29.703617	2022-01-26 13:14:29.703617
511	124	BxBlockComments::Comment	216	2022-01-27 04:36:54.532075	2022-01-27 04:36:54.532075
514	124	BxBlockComments::Comment	218	2022-01-27 04:50:00.61157	2022-01-27 04:50:00.61157
516	124	BxBlockComments::Comment	210	2022-01-27 04:55:04.155637	2022-01-27 04:55:04.155637
517	124	BxBlockComments::Comment	28	2022-01-27 04:55:57.996291	2022-01-27 04:55:57.996291
523	124	BxBlockComments::Comment	224	2022-01-27 05:10:14.390884	2022-01-27 05:10:14.390884
536	124	BxBlockComments::Comment	226	2022-01-27 05:48:50.636852	2022-01-27 05:48:50.636852
545	124	BxBlockComments::Comment	202	2022-01-27 06:11:01.124384	2022-01-27 06:11:01.124384
552	124	BxBlockComments::Comment	230	2022-01-27 07:02:45.19371	2022-01-27 07:02:45.19371
553	124	BxBlockComments::Comment	231	2022-01-27 07:03:53.542232	2022-01-27 07:03:53.542232
556	124	BxBlockComments::Comment	212	2022-01-27 07:50:01.164473	2022-01-27 07:50:01.164473
559	124	BxBlockPosts::Post	94	2022-01-27 09:36:10.928033	2022-01-27 09:36:10.928033
567	124	BxBlockPosts::Post	90	2022-01-28 04:18:02.286176	2022-01-28 04:18:02.286176
257	124	BxBlockComments::Comment	24	2022-01-12 09:39:16.890749	2022-01-12 09:39:16.890749
434	124	BxBlockComments::Comment	178	2022-01-21 06:50:45.113512	2022-01-21 06:50:45.113512
261	259	BxBlockComments::Comment	49	2022-01-12 09:59:22.330988	2022-01-12 09:59:22.330988
262	259	BxBlockComments::Comment	36	2022-01-12 09:59:30.887096	2022-01-12 09:59:30.887096
263	259	BxBlockComments::Comment	48	2022-01-12 09:59:40.735685	2022-01-12 09:59:40.735685
264	124	BxBlockComments::Comment	26	2022-01-13 06:17:38.079905	2022-01-13 06:17:38.079905
265	133	BxBlockPosts::Post	61	2022-01-13 07:10:03.654429	2022-01-13 07:10:03.654429
266	129	BxBlockComments::Comment	88	2022-01-13 07:10:41.313606	2022-01-13 07:10:41.313606
268	129	BxBlockComments::Comment	97	2022-01-13 09:15:10.035936	2022-01-13 09:15:10.035936
439	124	BxBlockPosts::Post	77	2022-01-21 07:22:54.401093	2022-01-21 07:22:54.401093
441	124	BxBlockComments::Comment	179	2022-01-21 07:23:32.14573	2022-01-21 07:23:32.14573
442	124	BxBlockComments::Comment	182	2022-01-21 08:59:42.355752	2022-01-21 08:59:42.355752
443	124	BxBlockComments::Comment	181	2022-01-21 09:00:00.065382	2022-01-21 09:00:00.065382
445	124	BxBlockComments::Comment	34	2022-01-21 09:07:19.431197	2022-01-21 09:07:19.431197
282	133	BxBlockComments::Comment	126	2022-01-14 15:17:33.510649	2022-01-14 15:17:33.510649
283	297	BxBlockPosts::Post	13	2022-01-14 15:21:09.692107	2022-01-14 15:21:09.692107
284	133	BxBlockComments::Comment	127	2022-01-14 15:24:37.552033	2022-01-14 15:24:37.552033
285	133	BxBlockComments::Comment	129	2022-01-14 15:34:24.725245	2022-01-14 15:34:24.725245
286	124	BxBlockComments::Comment	133	2022-01-17 06:22:44.845318	2022-01-17 06:22:44.845318
287	124	BxBlockPosts::Post	34	2022-01-17 06:27:06.922093	2022-01-17 06:27:06.922093
289	124	BxBlockPosts::Post	20	2022-01-17 06:31:21.77619	2022-01-17 06:31:21.77619
291	297	BxBlockComments::Comment	91	2022-01-17 07:33:41.798536	2022-01-17 07:33:41.798536
292	297	BxBlockComments::Comment	128	2022-01-17 07:33:43.215216	2022-01-17 07:33:43.215216
293	297	BxBlockComments::Comment	127	2022-01-17 07:33:45.283644	2022-01-17 07:33:45.283644
294	297	BxBlockComments::Comment	129	2022-01-17 07:33:53.571985	2022-01-17 07:33:53.571985
295	144	BxBlockPosts::Post	22	2022-01-17 07:55:07.761753	2022-01-17 07:55:07.761753
297	259	BxBlockComments::Comment	143	2022-01-18 06:33:23.014777	2022-01-18 06:33:23.014777
605	124	BxBlockComments::Comment	263	2022-02-02 11:21:08.208576	2022-02-02 11:21:08.208576
608	137	BxBlockPosts::Post	30	2022-02-03 15:53:22.889827	2022-02-03 15:53:22.889827
449	124	BxBlockPosts::Post	45	2022-01-21 10:40:49.045853	2022-01-21 10:40:49.045853
345	124	BxBlockComments::Comment	158	2022-01-19 12:54:54.002079	2022-01-19 12:54:54.002079
452	124	BxBlockComments::Comment	88	2022-01-21 11:52:25.747135	2022-01-21 11:52:25.747135
612	124	BxBlockComments::Comment	269	2022-02-07 05:43:42.683389	2022-02-07 05:43:42.683389
311	259	BxBlockComments::Comment	146	2022-01-18 10:52:37.123691	2022-01-18 10:52:37.123691
314	259	BxBlockComments::Comment	147	2022-01-18 12:18:57.545149	2022-01-18 12:18:57.545149
315	259	BxBlockComments::Comment	148	2022-01-18 12:49:19.480182	2022-01-18 12:49:19.480182
466	124	BxBlockPosts::Post	74	2022-01-25 08:30:58.872077	2022-01-25 08:30:58.872077
477	124	BxBlockComments::Comment	159	2022-01-25 09:42:24.419146	2022-01-25 09:42:24.419146
484	124	BxBlockComments::Comment	186	2022-01-25 11:26:14.216999	2022-01-25 11:26:14.216999
486	124	BxBlockComments::Comment	195	2022-01-25 11:36:35.18217	2022-01-25 11:36:35.18217
488	129	BxBlockComments::Comment	194	2022-01-25 11:41:47.706457	2022-01-25 11:41:47.706457
490	129	BxBlockComments::Comment	196	2022-01-25 11:41:53.371839	2022-01-25 11:41:53.371839
492	129	BxBlockComments::Comment	193	2022-01-25 11:41:57.410839	2022-01-25 11:41:57.410839
494	129	BxBlockComments::Comment	191	2022-01-25 11:42:01.521901	2022-01-25 11:42:01.521901
397	124	BxBlockComments::Comment	164	2022-01-20 11:33:24.292618	2022-01-20 11:33:24.292618
400	124	BxBlockComments::Comment	167	2022-01-20 11:43:00.158735	2022-01-20 11:43:00.158735
403	124	BxBlockPosts::Post	53	2022-01-20 11:43:25.338033	2022-01-20 11:43:25.338033
405	124	BxBlockComments::Comment	86	2022-01-20 11:43:42.963438	2022-01-20 11:43:42.963438
408	124	BxBlockComments::Comment	173	2022-01-20 12:05:27.123538	2022-01-20 12:05:27.123538
495	124	BxBlockComments::Comment	201	2022-01-25 11:44:41.219567	2022-01-25 11:44:41.219567
415	371	BxBlockPosts::Post	76	2022-01-20 13:11:10.030315	2022-01-20 13:11:10.030315
417	212	BxBlockPosts::Post	46	2022-01-20 19:11:20.842048	2022-01-20 19:11:20.842048
504	370	BxBlockComments::Comment	212	2022-01-25 14:35:26.081564	2022-01-25 14:35:26.081564
515	124	BxBlockComments::Comment	219	2022-01-27 04:50:54.388938	2022-01-27 04:50:54.388938
518	124	BxBlockComments::Comment	221	2022-01-27 04:57:31.515418	2022-01-27 04:57:31.515418
521	124	BxBlockComments::Comment	23	2022-01-27 05:02:49.642302	2022-01-27 05:02:49.642302
524	124	BxBlockComments::Comment	225	2022-01-27 05:11:24.913964	2022-01-27 05:11:24.913964
526	124	BxBlockPosts::Post	59	2022-01-27 05:14:23.991734	2022-01-27 05:14:23.991734
528	124	BxBlockPosts::Post	2	2022-01-27 05:18:15.15593	2022-01-27 05:18:15.15593
541	124	BxBlockPosts::Post	46	2022-01-27 06:07:49.564116	2022-01-27 06:07:49.564116
543	124	BxBlockPosts::Post	73	2022-01-27 06:10:43.156272	2022-01-27 06:10:43.156272
544	124	BxBlockComments::Comment	227	2022-01-27 06:10:56.506723	2022-01-27 06:10:56.506723
554	124	BxBlockPosts::Post	83	2022-01-27 07:05:29.637747	2022-01-27 07:05:29.637747
555	133	BxBlockPosts::Post	83	2022-01-27 07:08:21.384535	2022-01-27 07:08:21.384535
560	370	BxBlockPosts::Post	94	2022-01-27 13:18:21.118657	2022-01-27 13:18:21.118657
565	124	BxBlockComments::Comment	236	2022-01-28 04:16:36.587592	2022-01-28 04:16:36.587592
570	133	BxBlockPosts::Post	94	2022-01-31 07:19:41.655324	2022-01-31 07:19:41.655324
\.


--
-- Data for Name: live_streams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.live_streams (id, headline, description, comment_section, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, latitude, longitude, van_id, address, locationable_type, locationable_id) FROM stdin;
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (id, imageable_type, imageable_id, file_name, file_size, presigned_url, status, category) FROM stdin;
\.


--
-- Data for Name: nfts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nfts (id, asset_id, token_id, owner_id, name, description, image_url, image_preview_url, image_thumbnail_url, image_original_url, animation_url, animation_original_url, external_link, asset_contract_address, permalink, asset_details, wallet_id, created_at, updated_at, account_id, usd_amount, eth_amount) FROM stdin;
57	\N	94917191697056562607218248236920854735255553739488847967192288876080857612289	0xd1d93a087cab89c0d9401a096ce7adf7c362f492	555	\N	https://lh3.googleusercontent.com/nSBjOfRjmMagWO-XsRbutNZyOYhOsnZ6npaDVcsjPktPkpSNpJ5oe-Ol_tSFZ15TxTzlXji5qlgV6ImaOA6LqeVVnJdErZoMCtTq	https://lh3.googleusercontent.com/nSBjOfRjmMagWO-XsRbutNZyOYhOsnZ6npaDVcsjPktPkpSNpJ5oe-Ol_tSFZ15TxTzlXji5qlgV6ImaOA6LqeVVnJdErZoMCtTq=s250	https://lh3.googleusercontent.com/nSBjOfRjmMagWO-XsRbutNZyOYhOsnZ6npaDVcsjPktPkpSNpJ5oe-Ol_tSFZ15TxTzlXji5qlgV6ImaOA6LqeVVnJdErZoMCtTq=s128	\N	\N	\N	\N	\N	\N	\N	82	2022-01-21 15:06:25.910456	2022-01-21 15:06:25.910456	370	\N	\N
60	\N	3514	0xfa91ab5befe9a24813f4c6b104d999164464b46e	Fishy Fam #3514	Fishy Fam	https://lh3.googleusercontent.com/fP6U0JV4gB4k804e4__nGJ8KZ2TXKGLlSeW_zcxWulQCcUfweabe2ywl7RjjD9j3S7_CugC-st3l8I2Q7OS4ladXPpiWVngLXMuD	https://lh3.googleusercontent.com/fP6U0JV4gB4k804e4__nGJ8KZ2TXKGLlSeW_zcxWulQCcUfweabe2ywl7RjjD9j3S7_CugC-st3l8I2Q7OS4ladXPpiWVngLXMuD=s250	https://lh3.googleusercontent.com/fP6U0JV4gB4k804e4__nGJ8KZ2TXKGLlSeW_zcxWulQCcUfweabe2ywl7RjjD9j3S7_CugC-st3l8I2Q7OS4ladXPpiWVngLXMuD=s128	https://herodev.mypinata.cloud/ipfs/QmQvUfqhLMSNYKLVaBcMnaHfmtP2zRxfFP2gLMCk6fN7DX/3514.png	\N	\N	\N	\N	\N	\N	89	2022-01-27 09:15:33.470849	2022-02-08 00:01:42.065294	129	3.14907000000000004	0.00100000000000000002
63	\N	8920650261906539551707462159971082682358764236800752495046729211047367933953	0x13b8e8bc3229d713c26b7862078ae7acd368314d	test nft 2	\N	https://lh3.googleusercontent.com/VBEKbjU3flxS_v4P6c_6G9Jawa8BOLP1GKDQ8PX-9mmsEXK_gg7DefH_RA8UA-Q2OUUEGiR2DmN2_qJ1MLRIqwNKMUOwvBw1_3syJw	https://lh3.googleusercontent.com/VBEKbjU3flxS_v4P6c_6G9Jawa8BOLP1GKDQ8PX-9mmsEXK_gg7DefH_RA8UA-Q2OUUEGiR2DmN2_qJ1MLRIqwNKMUOwvBw1_3syJw=s250	https://lh3.googleusercontent.com/VBEKbjU3flxS_v4P6c_6G9Jawa8BOLP1GKDQ8PX-9mmsEXK_gg7DefH_RA8UA-Q2OUUEGiR2DmN2_qJ1MLRIqwNKMUOwvBw1_3syJw=s128	\N	\N	\N	\N	\N	\N	\N	71	2022-02-01 10:36:33.709625	2022-02-01 10:36:33.709625	129	\N	\N
52	\N	94917191697056562607218248236920854735255553739488847967192288871682811101185	0xd1d93a087cab89c0d9401a096ce7adf7c362f492	Space	\N	https://lh3.googleusercontent.com/i2bARisE5W0NX5OxSm6abkGtl9QzVaJYGCSqmF4VCHy4inIEJ5AY7dK89eJ_lyVLDqcqmTnEm5qFs6av9ofwFjghPyyO9pT630zh	https://lh3.googleusercontent.com/i2bARisE5W0NX5OxSm6abkGtl9QzVaJYGCSqmF4VCHy4inIEJ5AY7dK89eJ_lyVLDqcqmTnEm5qFs6av9ofwFjghPyyO9pT630zh=s250	https://lh3.googleusercontent.com/i2bARisE5W0NX5OxSm6abkGtl9QzVaJYGCSqmF4VCHy4inIEJ5AY7dK89eJ_lyVLDqcqmTnEm5qFs6av9ofwFjghPyyO9pT630zh=s128	\N	\N	\N	\N	\N	\N	\N	82	2022-01-19 09:39:49.967334	2022-01-19 09:39:49.967334	370	\N	\N
15	\N	22078292088351105558096269372419564704342872007289489882381637824928630702081	0x30cfded81b9c4a2d408a73fbdc9e3470f8019a60	QA	\N	https://lh3.googleusercontent.com/Ws5W-LbILTIMXPZ3OySx_mNBi6c2SCp2OQ6LPVNI2Vepw7BJ1A06sgKGiNoYi8WXaSZ92qRS8FJ3KWsg5h9bGG7xkwZ21jxt-Z0o9w	https://lh3.googleusercontent.com/Ws5W-LbILTIMXPZ3OySx_mNBi6c2SCp2OQ6LPVNI2Vepw7BJ1A06sgKGiNoYi8WXaSZ92qRS8FJ3KWsg5h9bGG7xkwZ21jxt-Z0o9w=s250	https://lh3.googleusercontent.com/Ws5W-LbILTIMXPZ3OySx_mNBi6c2SCp2OQ6LPVNI2Vepw7BJ1A06sgKGiNoYi8WXaSZ92qRS8FJ3KWsg5h9bGG7xkwZ21jxt-Z0o9w=s128	\N	\N	\N	\N	\N	\N	\N	75	2021-11-24 14:18:14.502117	2021-11-24 14:18:14.502117	248	\N	\N
26	\N	22078292088351105558096269372419564704342872007289489882381637824928630702081	0x30cfded81b9c4a2d408a73fbdc9e3470f8019a60	QA	\N	https://lh3.googleusercontent.com/Ws5W-LbILTIMXPZ3OySx_mNBi6c2SCp2OQ6LPVNI2Vepw7BJ1A06sgKGiNoYi8WXaSZ92qRS8FJ3KWsg5h9bGG7xkwZ21jxt-Z0o9w	https://lh3.googleusercontent.com/Ws5W-LbILTIMXPZ3OySx_mNBi6c2SCp2OQ6LPVNI2Vepw7BJ1A06sgKGiNoYi8WXaSZ92qRS8FJ3KWsg5h9bGG7xkwZ21jxt-Z0o9w=s250	https://lh3.googleusercontent.com/Ws5W-LbILTIMXPZ3OySx_mNBi6c2SCp2OQ6LPVNI2Vepw7BJ1A06sgKGiNoYi8WXaSZ92qRS8FJ3KWsg5h9bGG7xkwZ21jxt-Z0o9w=s128	\N	\N	\N	\N	\N	\N	\N	75	2021-12-01 07:05:31.558485	2021-12-01 07:05:31.558485	248	\N	\N
53	\N	8920650261906539551707462159971082682358764236800752495046729209947856306177	0x13b8e8bc3229d713c26b7862078ae7acd368314d	test nft	\N	https://lh3.googleusercontent.com/8CG6QCRPtnFphPXIa6IAjkmLjHfrfdgtWOw7SfKxzCr2xjRW7ezQjSuvLqbMXsTT9DHOaEcfbV6OTmMUEqOu8qph6EMOIbw-_VS2	https://lh3.googleusercontent.com/8CG6QCRPtnFphPXIa6IAjkmLjHfrfdgtWOw7SfKxzCr2xjRW7ezQjSuvLqbMXsTT9DHOaEcfbV6OTmMUEqOu8qph6EMOIbw-_VS2=s250	https://lh3.googleusercontent.com/8CG6QCRPtnFphPXIa6IAjkmLjHfrfdgtWOw7SfKxzCr2xjRW7ezQjSuvLqbMXsTT9DHOaEcfbV6OTmMUEqOu8qph6EMOIbw-_VS2=s128	\N	\N	\N	\N	\N	\N	\N	71	2022-01-20 08:58:57.901142	2022-01-20 08:58:57.901142	129	\N	\N
56	\N	94917191697056562607218248236920854735255553739488847967192288874981345984513	0xd1d93a087cab89c0d9401a096ce7adf7c362f492	!!""!!	\N	https://lh3.googleusercontent.com/16JQiz6XboTXQTP13bY20-4gDl7JsWnsXCqg4twbrODPEzFsZR13iTrDFfwLPXlMvtv2EIp72rwPZTEFLiXYxojaIiE7d6WrrGm9_Ow	https://lh3.googleusercontent.com/16JQiz6XboTXQTP13bY20-4gDl7JsWnsXCqg4twbrODPEzFsZR13iTrDFfwLPXlMvtv2EIp72rwPZTEFLiXYxojaIiE7d6WrrGm9_Ow=s250	https://lh3.googleusercontent.com/16JQiz6XboTXQTP13bY20-4gDl7JsWnsXCqg4twbrODPEzFsZR13iTrDFfwLPXlMvtv2EIp72rwPZTEFLiXYxojaIiE7d6WrrGm9_Ow=s128	\N	\N	\N	\N	\N	\N	\N	82	2022-01-20 09:56:05.419696	2022-01-20 09:56:05.419696	370	\N	\N
59	\N	65569813975474620673902548000198134111328772481840197608553053252622105968641	0x90f73314f8fca4eeae0f79176f1b78ed386727ae	Some girl	\N	https://lh3.googleusercontent.com/uWsWcdme1qvIamhfx8O0dzE5ovC01wCpKiY59xG0tbMOKTnJ0EJFbdLDpdiBbqJrP1eHZjAFfyWt9iGvESM8lxyiBSQ0CVKEIt1yqe4	https://lh3.googleusercontent.com/uWsWcdme1qvIamhfx8O0dzE5ovC01wCpKiY59xG0tbMOKTnJ0EJFbdLDpdiBbqJrP1eHZjAFfyWt9iGvESM8lxyiBSQ0CVKEIt1yqe4=s250	https://lh3.googleusercontent.com/uWsWcdme1qvIamhfx8O0dzE5ovC01wCpKiY59xG0tbMOKTnJ0EJFbdLDpdiBbqJrP1eHZjAFfyWt9iGvESM8lxyiBSQ0CVKEIt1yqe4=s128	\N	\N	\N	\N	\N	\N	\N	81	2022-01-27 09:03:58.081869	2022-01-27 09:03:58.081869	370	\N	\N
62	\N	34085485605809858234645056736246100833627908360907625323341304708241972789249	0x4b5bb38095168619fabcb9fb5c8f011fc8d911d8	Byteosaurus #4619	\N	https://lh3.googleusercontent.com/hywuPHHBa56JeH8B4BTfbXmT6-YN0BjksjGV4BMfbUKVjZ5ETQ0iZPKZ_Nbn-W5BHYhaZdm2kyZQ1-9wIEb9f5rOOCe0iJMZggc3Nl4	https://lh3.googleusercontent.com/hywuPHHBa56JeH8B4BTfbXmT6-YN0BjksjGV4BMfbUKVjZ5ETQ0iZPKZ_Nbn-W5BHYhaZdm2kyZQ1-9wIEb9f5rOOCe0iJMZggc3Nl4=s250	https://lh3.googleusercontent.com/hywuPHHBa56JeH8B4BTfbXmT6-YN0BjksjGV4BMfbUKVjZ5ETQ0iZPKZ_Nbn-W5BHYhaZdm2kyZQ1-9wIEb9f5rOOCe0iJMZggc3Nl4=s128	\N	\N	\N	\N	\N	\N	\N	90	2022-01-27 09:25:45.618651	2022-02-08 00:04:32.443854	129	110.320000000000007	0.0350000000000000033
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, created_by, headings, contents, app_url, is_read, read_at, account_id, created_at, updated_at, sender_id, post_id, connection_id) FROM stdin;
1	\N	Friend Request	You recived new friend request from DharaniA	\N	f	\N	2	2021-11-19 07:20:53.062221	2021-11-19 07:20:53.062221	\N	\N	\N
1135	\N	Friend Request	You received new friend request from 	\N	t	2022-02-01 14:53:09.195151	124	2022-02-01 12:49:41.657399	2022-02-01 14:53:09.196638	129	\N	\N
1155	\N	New comment on post	 has commented on your post	\N	f	\N	136	2022-02-01 15:41:52.653268	2022-02-01 15:41:52.653268	137	17	\N
6	\N	Friend Request	You recived new friend request from laljisolanki	\N	f	\N	2	2021-11-25 11:26:42.755063	2021-11-25 11:26:42.755063	\N	\N	\N
1173	\N	Friend Request	You received new friend request from 	\N	t	2022-02-02 11:11:06.108174	124	2022-02-02 11:05:16.996884	2022-02-02 11:11:06.109346	266	\N	417
1187	\N	Friend Request	You received new friend request from 	\N	f	\N	376	2022-02-02 13:08:02.459933	2022-02-02 13:08:02.459933	137	\N	424
1191	\N	New comment on post	 has commented on your post	\N	f	\N	136	2022-02-02 13:16:01.785595	2022-02-02 13:16:01.785595	389	57	\N
23	\N	Friend Request	You recived new friend request from UjjavalBarot	\N	f	\N	36	2021-11-26 06:48:02.24486	2021-11-26 06:48:02.24486	\N	\N	\N
1208	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-02-07 04:31:53.178263	129	2022-02-07 04:17:28.787522	2022-02-07 04:31:53.179611	371	\N	409
28	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	139	2021-11-29 08:52:00.79664	2021-11-29 08:52:00.79664	\N	\N	\N
29	\N	Friend Request	You recived new friend request from DimpalKapadiya	\N	f	\N	258	2021-11-29 09:09:44.769381	2021-11-29 09:09:44.769381	\N	\N	\N
30	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-11-29 09:10:24.615585	2021-11-29 09:10:24.615585	\N	\N	\N
31	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-11-29 09:12:07.076806	2021-11-29 09:12:07.076806	\N	\N	\N
32	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-11-29 10:47:36.338779	2021-11-29 10:47:36.338779	\N	\N	\N
39	\N	Friend Request	You recived new friend request from laljisolanki	\N	f	\N	2	2021-11-29 12:28:55.530817	2021-11-29 12:28:55.530817	\N	\N	\N
44	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-11-29 12:53:21.84735	2021-11-29 12:53:21.84735	\N	\N	\N
45	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-11-29 12:54:20.771703	2021-11-29 12:54:20.771703	\N	\N	\N
47	\N	Friend Request	You recived new friend request from deegeecraig	\N	f	\N	262	2021-11-29 13:23:46.964667	2021-11-29 13:23:46.964667	\N	\N	\N
48	\N	Friend Request	You recived new friend request from deegeeio	\N	f	\N	262	2021-11-29 13:24:44.541751	2021-11-29 13:24:44.541751	\N	\N	\N
49	\N	Friend Request	You recived new friend request from deegeeio	\N	f	\N	263	2021-11-29 13:27:49.203581	2021-11-29 13:27:49.203581	\N	\N	\N
50	\N	Friend Request	You recived new friend request from laljisolanki	\N	f	\N	2	2021-11-29 13:52:16.896819	2021-11-29 13:52:16.896819	\N	\N	\N
51	\N	Friend Request	You recived new friend request from deegeeio	\N	f	\N	258	2021-11-29 13:55:58.614229	2021-11-29 13:55:58.614229	\N	\N	\N
52	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-11-30 05:26:44.042421	2021-11-30 05:26:44.042421	\N	\N	\N
53	\N	Friend Request	You recived new friend request from RajeshKhanna	\N	f	\N	2	2021-11-30 05:35:30.396313	2021-11-30 05:35:30.396313	\N	\N	\N
54	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	258	2021-11-30 05:45:31.98561	2021-11-30 05:45:31.98561	\N	\N	\N
55	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	262	2021-11-30 05:45:55.369337	2021-11-30 05:45:55.369337	\N	\N	\N
56	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	263	2021-11-30 05:46:06.267729	2021-11-30 05:46:06.267729	\N	\N	\N
57	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-11-30 05:48:04.903569	2021-11-30 05:48:04.903569	\N	\N	\N
58	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-11-30 06:05:27.899217	2021-11-30 06:05:27.899217	\N	\N	\N
59	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-11-30 06:06:34.585875	2021-11-30 06:06:34.585875	\N	\N	\N
60	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-11-30 06:07:56.554752	2021-11-30 06:07:56.554752	\N	\N	\N
61	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	258	2021-11-30 06:10:56.597483	2021-11-30 06:10:56.597483	\N	\N	\N
62	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	258	2021-11-30 06:12:12.356679	2021-11-30 06:12:12.356679	\N	\N	\N
63	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-11-30 06:12:40.826021	2021-11-30 06:12:40.826021	\N	\N	\N
64	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-11-30 06:13:13.590758	2021-11-30 06:13:13.590758	\N	\N	\N
1136	\N	New comment on post	 has commented on your post	\N	f	\N	136	2022-02-01 12:53:32.970084	2022-02-01 12:53:32.970084	137	57	\N
66	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	251	2021-11-30 09:52:18.312285	2021-11-30 09:52:18.312285	\N	\N	\N
67	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-11-30 09:55:38.872888	2021-11-30 09:55:38.872888	\N	\N	\N
69	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-11-30 10:50:49.340373	2021-11-30 10:50:49.340373	\N	\N	\N
70	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	258	2021-11-30 10:51:30.989501	2021-11-30 10:51:30.989501	\N	\N	\N
71	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-11-30 10:52:07.169787	2021-11-30 10:52:07.169787	\N	\N	\N
72	\N	Friend Request	You recived new friend request from DimpalKapadiya	\N	f	\N	258	2021-11-30 10:52:44.10082	2021-11-30 10:52:44.10082	\N	\N	\N
73	\N	Friend Request	You recived new friend request from TestFriend	\N	f	\N	137	2021-11-30 11:49:36.010819	2021-11-30 11:49:36.010819	\N	\N	\N
75	\N	Friend Request	You recived new friend request from RajeshKhanna	\N	f	\N	260	2021-11-30 11:53:49.778559	2021-11-30 11:53:49.778559	\N	\N	\N
76	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-11-30 12:06:12.179038	2021-11-30 12:06:12.179038	\N	\N	\N
77	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-11-30 12:06:43.977063	2021-11-30 12:06:43.977063	\N	\N	\N
78	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-11-30 12:32:49.972212	2021-11-30 12:32:49.972212	\N	\N	\N
79	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-11-30 12:33:44.392341	2021-11-30 12:33:44.392341	\N	\N	\N
80	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-11-30 12:52:58.313055	2021-11-30 12:52:58.313055	\N	\N	\N
81	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-11-30 12:53:43.493526	2021-11-30 12:53:43.493526	\N	\N	\N
82	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-11-30 13:27:30.787525	2021-11-30 13:27:30.787525	\N	\N	\N
1174	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	266	2022-02-02 11:05:45.100432	2022-02-02 11:05:45.100432	124	\N	417
1188	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	137	2022-02-02 13:11:09.983489	2022-02-02 13:11:09.983489	376	\N	424
1190	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	137	2022-02-02 13:11:54.198977	2022-02-02 13:11:54.198977	376	\N	425
88	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-01 08:06:30.39161	2021-12-01 08:06:30.39161	\N	\N	\N
89	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-01 08:15:49.96138	2021-12-01 08:15:49.96138	\N	\N	\N
90	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-01 08:39:31.328063	2021-12-01 08:39:31.328063	\N	\N	\N
91	\N	Friend Request	You recived new friend request from KaxeMaxe	\N	f	\N	137	2021-12-01 08:42:22.56688	2021-12-01 08:42:22.56688	\N	\N	\N
92	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-01 08:49:13.661233	2021-12-01 08:49:13.661233	\N	\N	\N
94	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	258	2021-12-01 12:10:17.99496	2021-12-01 12:10:17.99496	\N	\N	\N
96	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	258	2021-12-01 12:54:19.812134	2021-12-01 12:54:19.812134	\N	\N	\N
97	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-01 12:56:08.360361	2021-12-01 12:56:08.360361	\N	\N	\N
1156	\N	Friend Request	You received new friend request from 	\N	t	2022-02-07 05:49:35.96673	371	2022-02-02 04:41:23.788438	2022-02-07 05:49:35.971942	129	\N	\N
99	\N	Friend Request	You recived new friend request from laljisolanki	\N	f	\N	98	2021-12-01 13:09:16.840026	2021-12-01 13:09:16.840026	\N	\N	\N
101	\N	Friend Request	You recived new friend request from DBUSER	\N	f	\N	32	2021-12-01 16:15:36.450566	2021-12-01 16:15:36.450566	\N	\N	\N
102	\N	Friend Request	You recived new friend request from DBUSER	\N	f	\N	265	2021-12-02 06:58:09.395823	2021-12-02 06:58:09.395823	\N	\N	\N
103	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-12-02 07:02:49.913842	2021-12-02 07:02:49.913842	\N	\N	\N
104	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-02 07:03:42.344432	2021-12-02 07:03:42.344432	\N	\N	\N
105	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	258	2021-12-02 07:04:38.782914	2021-12-02 07:04:38.782914	\N	\N	\N
106	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	258	2021-12-02 07:34:07.560266	2021-12-02 07:34:07.560266	\N	\N	\N
107	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-02 07:34:40.266487	2021-12-02 07:34:40.266487	\N	\N	\N
108	\N	Friend Request	You recived new friend request from DimpalKapadiya	\N	f	\N	258	2021-12-02 07:35:21.20709	2021-12-02 07:35:21.20709	\N	\N	\N
109	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-12-02 07:35:50.76678	2021-12-02 07:35:50.76678	\N	\N	\N
110	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-12-02 09:17:43.189205	2021-12-02 09:17:43.189205	\N	\N	\N
111	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-02 09:18:29.158133	2021-12-02 09:18:29.158133	\N	\N	\N
112	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	258	2021-12-02 09:19:13.61965	2021-12-02 09:19:13.61965	\N	\N	\N
113	\N	Friend Request	You recived new friend request from DimpalKapadiya	\N	f	\N	258	2021-12-02 09:19:54.815429	2021-12-02 09:19:54.815429	\N	\N	\N
114	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-12-03 04:45:50.56452	2021-12-03 04:45:50.56452	\N	\N	\N
115	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-03 04:46:41.532247	2021-12-03 04:46:41.532247	\N	\N	\N
116	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	258	2021-12-03 04:47:25.478166	2021-12-03 04:47:25.478166	\N	\N	\N
117	\N	Friend Request	You recived new friend request from DimpalKapadiya	\N	f	\N	258	2021-12-03 04:48:01.681103	2021-12-03 04:48:01.681103	\N	\N	\N
118	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-03 04:55:28.105968	2021-12-03 04:55:28.105968	\N	\N	\N
119	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	258	2021-12-03 04:55:59.823568	2021-12-03 04:55:59.823568	\N	\N	\N
120	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-03 04:58:02.303082	2021-12-03 04:58:02.303082	\N	\N	\N
100	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:32:07.37476	136	2021-12-01 13:46:59.370188	2021-12-24 11:32:07.376062	\N	\N	\N
68	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:32:07.985741	136	2021-11-30 09:56:30.389993	2021-12-24 11:32:07.987539	\N	\N	\N
87	\N	Friend Request	You recived new friend request from OlenaRomanek	\N	t	2022-01-24 12:17:57.02248	266	2021-12-01 07:45:52.377049	2022-01-24 12:17:57.023714	\N	\N	\N
121	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	258	2021-12-03 04:58:26.405729	2021-12-03 04:58:26.405729	\N	\N	\N
122	\N	Friend Request	You recived new friend request from DimpalKapadiya	\N	f	\N	258	2021-12-03 04:58:56.45322	2021-12-03 04:58:56.45322	\N	\N	\N
123	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	258	2021-12-03 04:59:41.00178	2021-12-03 04:59:41.00178	\N	\N	\N
1137	\N	New comment on post	 has commented on your post	\N	f	\N	136	2022-02-01 12:53:48.521657	2022-02-01 12:53:48.521657	137	57	\N
127	\N	Friend Request	You recived new friend request from RajeshKhanna	\N	f	\N	260	2021-12-03 07:19:55.436359	2021-12-03 07:19:55.436359	\N	\N	\N
129	\N	Friend Request	You recived new friend request from OlenaRomanek	\N	f	\N	137	2021-12-03 07:22:57.12752	2021-12-03 07:22:57.12752	\N	\N	\N
130	\N	Friend Request	You recived new friend request from OlenaRomanek	\N	f	\N	144	2021-12-03 07:57:42.354816	2021-12-03 07:57:42.354816	\N	\N	\N
1157	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	266	2022-02-02 04:49:47.138004	2022-02-02 04:49:47.138004	371	\N	\N
132	\N	Friend Request	You recived new friend request from ScarlettJohasson	\N	f	\N	278	2021-12-03 09:41:49.214967	2021-12-03 09:41:49.214967	\N	\N	\N
133	\N	Friend Request	You recived new friend request from chrishemsworth	\N	f	\N	278	2021-12-03 09:43:53.324648	2021-12-03 09:43:53.324648	\N	\N	\N
134	\N	Friend Request	You recived new friend request from BrieLarson	\N	f	\N	280	2021-12-03 09:57:39.245841	2021-12-03 09:57:39.245841	\N	\N	\N
135	\N	Friend Request	You recived new friend request from chrishemsworth	\N	f	\N	280	2021-12-03 09:58:09.994838	2021-12-03 09:58:09.994838	\N	\N	\N
136	\N	Friend Request	You recived new friend request from InterestingMan	\N	f	\N	137	2021-12-03 10:46:04.929446	2021-12-03 10:46:04.929446	\N	\N	\N
140	\N	Friend Request	You recived new friend request from DBUSER	\N	f	\N	111	2021-12-03 13:47:43.189206	2021-12-03 13:47:43.189206	\N	\N	\N
1175	\N	Friend Request	You received new friend request from 	\N	t	2022-02-02 11:15:57.289173	124	2022-02-02 11:13:51.569886	2022-02-02 11:15:57.290287	266	\N	418
143	\N	Friend Request	You recived new friend request from DBUSER	\N	f	\N	264	2021-12-03 14:07:38.11488	2021-12-03 14:07:38.11488	\N	\N	\N
1192	\N	New comment on post	 has commented on your post	\N	f	\N	136	2022-02-02 13:37:27.632511	2022-02-02 13:37:27.632511	248	57	\N
147	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-03 14:52:12.804458	2021-12-03 14:52:12.804458	\N	\N	\N
148	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	259	2021-12-06 04:40:11.955433	2021-12-06 04:40:11.955433	\N	\N	\N
149	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	259	2021-12-06 04:41:40.169343	2021-12-06 04:41:40.169343	\N	\N	\N
150	\N	Friend Request	You recived new friend request from DimpalKapadiya	\N	f	\N	259	2021-12-06 04:42:36.208684	2021-12-06 04:42:36.208684	\N	\N	\N
151	\N	Friend Request	You recived new friend request from Sammirsharma	\N	f	\N	285	2021-12-06 04:49:51.887185	2021-12-06 04:49:51.887185	\N	\N	\N
152	\N	Friend Request	You recived new friend request from UtsavPatel	\N	f	\N	285	2021-12-06 04:51:38.526916	2021-12-06 04:51:38.526916	\N	\N	\N
153	\N	Friend Request	You recived new friend request from FaminaKolhata	\N	f	\N	285	2021-12-06 04:53:05.577906	2021-12-06 04:53:05.577906	\N	\N	\N
154	\N	Friend Request	You recived new friend request from FaminaKolhata	\N	f	\N	287	2021-12-06 04:54:42.410178	2021-12-06 04:54:42.410178	\N	\N	\N
155	\N	Friend Request	You recived new friend request from Sammirsharma	\N	f	\N	287	2021-12-06 04:55:12.51573	2021-12-06 04:55:12.51573	\N	\N	\N
156	\N	Friend Request	You recived new friend request from crishgayle	\N	f	\N	287	2021-12-06 05:04:45.127648	2021-12-06 05:04:45.127648	\N	\N	\N
158	\N	Friend Request	You recived new friend request from laljisolanki	\N	f	\N	285	2021-12-06 06:25:38.74572	2021-12-06 06:25:38.74572	\N	\N	\N
159	\N	Friend Request	You recived new friend request from laljisolanki	\N	f	\N	289	2021-12-06 06:33:38.275598	2021-12-06 06:33:38.275598	\N	\N	\N
163	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 14:43:30.629218	2021-12-06 14:43:30.629218	\N	\N	\N
164	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	144	2021-12-06 15:15:07.287191	2021-12-06 15:15:07.287191	\N	\N	\N
166	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	282	2021-12-06 15:26:25.606616	2021-12-06 15:26:25.606616	\N	\N	\N
167	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 15:29:24.155958	2021-12-06 15:29:24.155958	\N	\N	\N
170	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 16:10:05.097169	2021-12-06 16:10:05.097169	\N	\N	\N
171	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 16:11:32.394589	2021-12-06 16:11:32.394589	\N	\N	\N
172	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 16:12:18.659597	2021-12-06 16:12:18.659597	\N	\N	\N
173	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 16:13:22.144847	2021-12-06 16:13:22.144847	\N	\N	\N
174	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 16:13:44.968057	2021-12-06 16:13:44.968057	\N	\N	\N
175	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 16:14:04.407307	2021-12-06 16:14:04.407307	\N	\N	\N
176	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 16:14:19.666984	2021-12-06 16:14:19.666984	\N	\N	\N
177	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 16:14:36.652263	2021-12-06 16:14:36.652263	\N	\N	\N
178	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 16:14:59.044956	2021-12-06 16:14:59.044956	\N	\N	\N
179	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 16:15:38.880799	2021-12-06 16:15:38.880799	\N	\N	\N
180	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-06 16:24:26.999198	2021-12-06 16:24:26.999198	\N	\N	\N
161	\N	Friend Request	You recived new friend request from testtest	\N	t	2021-12-24 07:04:28.218293	133	2021-12-06 07:08:56.620694	2021-12-24 07:04:28.219732	\N	\N	\N
165	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 08:23:16.085622	136	2021-12-06 15:16:41.847346	2021-12-24 08:23:16.087235	\N	\N	\N
169	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 08:23:14.274186	136	2021-12-06 16:09:48.112882	2021-12-24 08:23:14.277377	\N	\N	\N
138	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:32:06.138151	136	2021-12-03 10:48:09.999193	2021-12-24 11:32:06.139684	\N	\N	\N
168	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 08:23:17.534638	136	2021-12-06 15:59:52.702188	2021-12-24 08:23:17.536009	\N	\N	\N
146	\N	Friend Request	You recived new friend request from WillSmith	\N	t	2022-01-11 07:03:07.639141	248	2021-12-03 14:42:13.702585	2022-01-11 07:03:07.640966	\N	\N	\N
144	\N	Friend Request	You recived new friend request from DBUSER	\N	t	2022-01-10 18:43:35.835928	212	2021-12-03 14:08:18.607995	2022-01-10 18:43:35.900968	\N	\N	\N
182	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-07 05:26:15.434618	2021-12-07 05:26:15.434618	\N	\N	\N
183	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-07 10:33:01.424448	2021-12-07 10:33:01.424448	\N	\N	\N
1176	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	266	2022-02-02 11:16:15.834128	2022-02-02 11:16:15.834128	124	\N	418
189	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-07 13:17:43.104545	2021-12-07 13:17:43.104545	\N	\N	\N
191	\N	Friend Request	You recived new friend request from crishgayle	\N	f	\N	259	2021-12-07 13:26:07.965956	2021-12-07 13:26:07.965956	\N	\N	\N
192	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	259	2021-12-08 04:43:33.160121	2021-12-08 04:43:33.160121	\N	\N	\N
193	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	259	2021-12-08 05:12:24.260658	2021-12-08 05:12:24.260658	\N	\N	\N
196	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	259	2021-12-08 05:27:09.414242	2021-12-08 05:27:09.414242	\N	\N	\N
197	\N	Friend Request	You recived new friend request from RobertDowny	\N	f	\N	259	2021-12-08 06:30:06.977686	2021-12-08 06:30:06.977686	\N	\N	\N
199	\N	Friend Request	You recived new friend request from DBUSER	\N	f	\N	98	2021-12-08 07:05:14.654642	2021-12-08 07:05:14.654642	\N	\N	\N
200	\N	Friend Request	You recived new friend request from DBUSER	\N	f	\N	2	2021-12-08 07:15:06.350602	2021-12-08 07:15:06.350602	\N	\N	\N
202	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-08 08:42:28.612656	2021-12-08 08:42:28.612656	\N	\N	\N
1158	\N	Friend Request	You received new friend request from 	\N	t	2022-02-02 07:03:49.570937	124	2022-02-02 05:27:12.148421	2022-02-02 07:03:49.572621	286	\N	\N
1138	\N	New comment on post	 has commented on your post	\N	t	2022-02-02 10:53:45.857084	124	2022-02-01 13:02:21.411116	2022-02-02 10:53:45.859562	137	46	\N
205	\N	Friend Request	You recived new friend request from TempUser	\N	f	\N	264	2021-12-08 14:45:05.80208	2021-12-08 14:45:05.80208	\N	\N	\N
207	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-08 14:52:38.766404	2021-12-08 14:52:38.766404	\N	\N	\N
1193	\N	Friend Request	You received new friend request from 	\N	f	\N	257	2022-02-03 05:19:13.100565	2022-02-03 05:19:13.100565	259	\N	426
216	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	f	\N	144	2021-12-09 07:37:50.858043	2021-12-09 07:37:50.858043	\N	\N	\N
222	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	259	2021-12-10 04:42:44.689631	2021-12-10 04:42:44.689631	\N	\N	\N
1194	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	259	2022-02-03 05:19:24.583924	2022-02-03 05:19:24.583924	257	\N	426
224	\N	Friend Request	You recived new friend request from SaraGreem	\N	f	\N	144	2021-12-10 07:59:43.288962	2021-12-10 07:59:43.288962	\N	\N	\N
225	\N	Friend Request	You recived new friend request from SaraGreem	\N	f	\N	137	2021-12-10 08:00:12.183617	2021-12-10 08:00:12.183617	\N	\N	\N
226	\N	hello	testing	\N	f	\N	259	2021-12-10 13:31:29.397306	2021-12-10 13:31:29.397306	\N	\N	\N
227	\N	hello	testing	\N	f	\N	259	2021-12-10 13:35:27.237388	2021-12-10 13:35:27.237388	\N	\N	\N
228	\N	hello	testing	\N	f	\N	259	2021-12-10 13:40:32.928534	2021-12-10 13:40:32.928534	\N	\N	\N
229	\N	hello	testing	\N	f	\N	259	2021-12-10 13:41:28.951655	2021-12-10 13:41:28.951655	\N	\N	\N
230	\N	hello	testing	\N	f	\N	259	2021-12-10 13:41:56.035525	2021-12-10 13:41:56.035525	\N	\N	\N
231	\N	hello	testing	\N	f	\N	259	2021-12-10 13:43:57.340541	2021-12-10 13:43:57.340541	\N	\N	\N
232	\N	hello	testing	\N	f	\N	259	2021-12-10 13:46:06.213842	2021-12-10 13:46:06.213842	\N	\N	\N
233	\N	hello	testing	\N	f	\N	259	2021-12-10 13:46:55.007496	2021-12-10 13:46:55.007496	\N	\N	\N
234	\N	hello	testing	\N	f	\N	259	2021-12-10 13:47:13.735696	2021-12-10 13:47:13.735696	\N	\N	\N
235	\N	hello	testing	\N	f	\N	259	2021-12-10 13:50:43.450479	2021-12-10 13:50:43.450479	\N	\N	\N
236	\N	Friend Request	You recived new friend request from laljisolanki	\N	f	\N	259	2021-12-10 13:51:22.390406	2021-12-10 13:51:22.390406	\N	\N	\N
237	\N	hello	testing	\N	f	\N	259	2021-12-10 13:51:32.509709	2021-12-10 13:51:32.509709	\N	\N	\N
238	\N	hello	testing	\N	f	\N	259	2021-12-10 13:53:55.230132	2021-12-10 13:53:55.230132	\N	\N	\N
240	\N	hello	testing	\N	f	\N	259	2021-12-13 04:21:01.639784	2021-12-13 04:21:01.639784	\N	\N	\N
241	\N	hello	testing	\N	f	\N	259	2021-12-13 04:22:02.140009	2021-12-13 04:22:02.140009	\N	\N	\N
242	\N	hello	testing	\N	f	\N	259	2021-12-13 04:24:41.396371	2021-12-13 04:24:41.396371	\N	\N	\N
243	\N	hello	testing	\N	f	\N	259	2021-12-13 04:25:40.939007	2021-12-13 04:25:40.939007	\N	\N	\N
244	\N	hello	testing	\N	f	\N	259	2021-12-13 04:27:13.165602	2021-12-13 04:27:13.165602	\N	\N	\N
245	\N	hello	testing	\N	f	\N	259	2021-12-13 04:29:14.975601	2021-12-13 04:29:14.975601	\N	\N	\N
246	\N	hello	testing	\N	f	\N	259	2021-12-13 04:31:08.05453	2021-12-13 04:31:08.05453	\N	\N	\N
247	\N	hello	testing	\N	f	\N	259	2021-12-13 04:34:16.079958	2021-12-13 04:34:16.079958	\N	\N	\N
248	\N	hello	testing	\N	f	\N	259	2021-12-13 04:35:35.256848	2021-12-13 04:35:35.256848	\N	\N	\N
249	\N	hello	testing	\N	f	\N	259	2021-12-13 04:36:51.791395	2021-12-13 04:36:51.791395	\N	\N	\N
250	\N	hello	testing	\N	f	\N	259	2021-12-13 04:37:56.071376	2021-12-13 04:37:56.071376	\N	\N	\N
185	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 08:23:18.275541	136	2021-12-07 10:47:40.193852	2021-12-24 08:23:18.276863	\N	\N	\N
194	\N	Friend Request	You recived new friend request from AksayKumar	\N	t	2022-01-25 10:16:14.809678	266	2021-12-08 05:16:50.164338	2022-01-25 10:16:14.81082	\N	\N	\N
206	\N	Friend Request	You recived new friend request from DanielValles	\N	t	2021-12-24 07:04:48.913211	133	2021-12-08 14:49:02.171917	2021-12-24 07:04:48.91457	\N	\N	\N
186	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 08:23:19.140035	136	2021-12-07 10:49:56.525252	2021-12-24 08:23:19.141702	\N	\N	\N
218	\N	Friend Request	You recived new friend request from MichaelCore	\N	t	2021-12-24 11:31:41.67905	136	2021-12-09 10:41:44.819646	2021-12-24 11:31:41.681007	\N	\N	\N
239	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 08:23:36.032181	136	2021-12-10 14:44:12.147791	2021-12-24 08:23:36.033402	\N	\N	\N
221	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:31:58.092836	136	2021-12-09 14:02:34.729191	2021-12-24 11:31:58.102286	\N	\N	\N
220	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:31:58.591367	136	2021-12-09 13:34:01.317029	2021-12-24 11:31:58.592529	\N	\N	\N
219	\N	Friend Request	You recived new friend request from NameLastname	\N	t	2021-12-24 11:31:59.217316	136	2021-12-09 12:18:24.637541	2021-12-24 11:31:59.219133	\N	\N	\N
209	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:32:00.488973	136	2021-12-08 15:16:30.196689	2021-12-24 11:32:00.490332	\N	\N	\N
208	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:32:01.037558	136	2021-12-08 15:16:11.909507	2021-12-24 11:32:01.038705	\N	\N	\N
214	\N	Friend Request	You recived new friend request from DBUSER	\N	t	2021-12-27 11:48:37.787284	271	2021-12-09 07:11:04.796305	2021-12-27 11:48:37.788443	\N	\N	\N
187	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:32:02.206251	136	2021-12-07 11:51:36.481969	2021-12-24 11:32:02.207972	\N	\N	\N
188	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:32:03.750319	136	2021-12-07 12:50:42.573628	2021-12-24 11:32:03.751619	\N	\N	\N
211	\N	Friend Request	You recived new friend request from testtest	\N	t	2021-12-27 11:48:42.694422	271	2021-12-09 05:38:36.529448	2021-12-27 11:48:42.696313	\N	\N	\N
210	\N	Friend Request	You recived new friend request from testtest	\N	t	2021-12-27 11:48:44.755027	271	2021-12-09 05:37:23.980005	2021-12-27 11:48:44.757825	\N	\N	\N
251	\N	hello	testing	\N	f	\N	259	2021-12-13 04:40:32.611515	2021-12-13 04:40:32.611515	\N	\N	\N
252	\N	hello	testing	\N	f	\N	259	2021-12-13 04:41:21.359665	2021-12-13 04:41:21.359665	\N	\N	\N
253	\N	hello	testing	\N	f	\N	259	2021-12-13 04:42:16.791262	2021-12-13 04:42:16.791262	\N	\N	\N
254	\N	hello	testing	\N	f	\N	259	2021-12-13 04:42:43.898097	2021-12-13 04:42:43.898097	\N	\N	\N
255	\N	hello	testing	\N	f	\N	259	2021-12-13 04:43:55.801306	2021-12-13 04:43:55.801306	\N	\N	\N
256	\N	hello	testing	\N	f	\N	259	2021-12-13 04:46:50.899521	2021-12-13 04:46:50.899521	\N	\N	\N
257	\N	hello	testing	\N	f	\N	259	2021-12-13 04:48:18.107813	2021-12-13 04:48:18.107813	\N	\N	\N
258	\N	hello	testing	\N	f	\N	259	2021-12-13 04:49:30.99197	2021-12-13 04:49:30.99197	\N	\N	\N
259	\N	hello	testing	\N	f	\N	259	2021-12-13 04:52:17.877584	2021-12-13 04:52:17.877584	\N	\N	\N
260	\N	hello	testing	\N	f	\N	259	2021-12-13 04:53:26.670142	2021-12-13 04:53:26.670142	\N	\N	\N
261	\N	hello	testing	\N	f	\N	259	2021-12-13 05:06:10.67304	2021-12-13 05:06:10.67304	\N	\N	\N
262	\N	hello	testing	\N	f	\N	259	2021-12-13 05:08:10.580812	2021-12-13 05:08:10.580812	\N	\N	\N
263	\N	hello	testing	\N	f	\N	259	2021-12-13 05:10:10.006889	2021-12-13 05:10:10.006889	\N	\N	\N
264	\N	hello	testing	\N	f	\N	259	2021-12-13 05:13:20.27846	2021-12-13 05:13:20.27846	\N	\N	\N
265	\N	hello	testing	\N	f	\N	259	2021-12-13 05:16:49.145961	2021-12-13 05:16:49.145961	\N	\N	\N
266	\N	hello	testing	\N	f	\N	259	2021-12-13 05:18:33.038287	2021-12-13 05:18:33.038287	\N	\N	\N
267	\N	hello	testing	\N	f	\N	259	2021-12-13 05:23:40.126923	2021-12-13 05:23:40.126923	\N	\N	\N
268	\N	hello	testing	\N	f	\N	259	2021-12-13 05:24:08.159396	2021-12-13 05:24:08.159396	\N	\N	\N
269	\N	hello	testing	\N	f	\N	259	2021-12-13 05:24:52.552018	2021-12-13 05:24:52.552018	\N	\N	\N
270	\N	hello	testing	\N	f	\N	259	2021-12-13 05:33:26.578149	2021-12-13 05:33:26.578149	\N	\N	\N
271	\N	hello	testing	\N	f	\N	259	2021-12-13 05:41:34.277021	2021-12-13 05:41:34.277021	\N	\N	\N
272	\N	hello	testing	\N	f	\N	259	2021-12-13 05:51:41.650851	2021-12-13 05:51:41.650851	\N	\N	\N
273	\N	hello	testing	\N	f	\N	259	2021-12-13 05:56:40.637204	2021-12-13 05:56:40.637204	\N	\N	\N
274	\N	hello	testing	\N	f	\N	259	2021-12-13 05:57:34.758951	2021-12-13 05:57:34.758951	\N	\N	\N
275	\N	hello	testing	\N	f	\N	259	2021-12-13 06:03:19.853021	2021-12-13 06:03:19.853021	\N	\N	\N
284	\N	hello	testing	\N	f	\N	259	2021-12-13 06:18:52.457238	2021-12-13 06:18:52.457238	\N	\N	\N
285	\N	hello	testing	\N	f	\N	259	2021-12-13 06:19:02.346372	2021-12-13 06:19:02.346372	\N	\N	\N
286	\N	hello	testing	\N	f	\N	259	2021-12-13 06:19:12.635588	2021-12-13 06:19:12.635588	\N	\N	\N
287	\N	hello	testing	\N	f	\N	259	2021-12-13 06:23:27.987066	2021-12-13 06:23:27.987066	\N	\N	\N
288	\N	hello	testing	\N	f	\N	259	2021-12-13 06:26:00.431101	2021-12-13 06:26:00.431101	\N	\N	\N
289	\N	hello	testing	\N	f	\N	259	2021-12-13 06:29:36.234586	2021-12-13 06:29:36.234586	\N	\N	\N
290	\N	hello	testing	\N	f	\N	259	2021-12-13 06:29:41.24375	2021-12-13 06:29:41.24375	\N	\N	\N
291	\N	hello	testing	\N	f	\N	259	2021-12-13 06:32:23.487793	2021-12-13 06:32:23.487793	\N	\N	\N
292	\N	hello	testing	\N	f	\N	259	2021-12-13 06:35:40.866633	2021-12-13 06:35:40.866633	\N	\N	\N
293	\N	hello	testing	\N	f	\N	259	2021-12-13 06:36:15.029354	2021-12-13 06:36:15.029354	\N	\N	\N
294	\N	hello	testing	\N	f	\N	259	2021-12-13 06:37:01.134265	2021-12-13 06:37:01.134265	\N	\N	\N
295	\N	hello	testing	\N	f	\N	259	2021-12-13 06:43:33.01821	2021-12-13 06:43:33.01821	\N	\N	\N
296	\N	hello	testing	\N	f	\N	259	2021-12-13 06:44:15.353293	2021-12-13 06:44:15.353293	\N	\N	\N
297	\N	hello	testing	\N	f	\N	259	2021-12-13 06:44:34.557123	2021-12-13 06:44:34.557123	\N	\N	\N
298	\N	hello	testing	\N	f	\N	259	2021-12-13 06:45:24.914501	2021-12-13 06:45:24.914501	\N	\N	\N
299	\N	hello	testing	\N	f	\N	259	2021-12-13 06:45:54.243906	2021-12-13 06:45:54.243906	\N	\N	\N
300	\N	hello	testing	\N	f	\N	259	2021-12-13 06:50:20.797866	2021-12-13 06:50:20.797866	\N	\N	\N
301	\N	hello	testing	\N	f	\N	259	2021-12-13 06:51:27.63037	2021-12-13 06:51:27.63037	\N	\N	\N
302	\N	hello	testing	\N	f	\N	259	2021-12-13 06:54:38.515509	2021-12-13 06:54:38.515509	\N	\N	\N
303	\N	hello	testing	\N	f	\N	259	2021-12-13 06:57:55.944022	2021-12-13 06:57:55.944022	\N	\N	\N
304	\N	hello	testing	\N	f	\N	259	2021-12-13 06:58:08.587359	2021-12-13 06:58:08.587359	\N	\N	\N
305	\N	hello	testing	\N	f	\N	259	2021-12-13 06:58:32.965859	2021-12-13 06:58:32.965859	\N	\N	\N
306	\N	hello	testing	\N	f	\N	259	2021-12-13 06:59:02.751282	2021-12-13 06:59:02.751282	\N	\N	\N
307	\N	hello	testing	\N	f	\N	259	2021-12-13 06:59:27.015752	2021-12-13 06:59:27.015752	\N	\N	\N
308	\N	hello	testing	\N	f	\N	259	2021-12-13 06:59:49.019977	2021-12-13 06:59:49.019977	\N	\N	\N
309	\N	hello	testing	\N	f	\N	259	2021-12-13 08:16:31.012692	2021-12-13 08:16:31.012692	\N	\N	\N
310	\N	hello	testing	\N	f	\N	259	2021-12-13 08:52:59.519721	2021-12-13 08:52:59.519721	\N	\N	\N
311	\N	hello	testing	\N	f	\N	259	2021-12-13 08:53:34.667931	2021-12-13 08:53:34.667931	\N	\N	\N
312	\N	hello	testing	\N	f	\N	259	2021-12-13 09:01:07.598808	2021-12-13 09:01:07.598808	\N	\N	\N
313	\N	hello	testing	\N	f	\N	259	2021-12-13 09:01:32.672916	2021-12-13 09:01:32.672916	\N	\N	\N
314	\N	hello	testing	\N	f	\N	259	2021-12-13 09:01:33.124017	2021-12-13 09:01:33.124017	\N	\N	\N
315	\N	hello	testing	\N	f	\N	259	2021-12-13 09:01:33.759576	2021-12-13 09:01:33.759576	\N	\N	\N
316	\N	hello	testing	\N	f	\N	259	2021-12-13 09:01:34.094271	2021-12-13 09:01:34.094271	\N	\N	\N
317	\N	hello	testing	\N	f	\N	259	2021-12-13 09:01:34.486521	2021-12-13 09:01:34.486521	\N	\N	\N
318	\N	hello	testing	\N	f	\N	259	2021-12-13 09:02:41.609038	2021-12-13 09:02:41.609038	\N	\N	\N
319	\N	hello	testing	\N	f	\N	259	2021-12-13 09:03:35.372182	2021-12-13 09:03:35.372182	\N	\N	\N
320	\N	hello	testing	\N	f	\N	259	2021-12-13 09:04:23.591903	2021-12-13 09:04:23.591903	\N	\N	\N
321	\N	hello	testing	\N	f	\N	259	2021-12-13 09:05:06.023831	2021-12-13 09:05:06.023831	\N	\N	\N
322	\N	hello	testing	\N	f	\N	259	2021-12-13 09:10:05.724203	2021-12-13 09:10:05.724203	\N	\N	\N
323	\N	hello	testing	\N	f	\N	259	2021-12-13 09:11:04.646439	2021-12-13 09:11:04.646439	\N	\N	\N
324	\N	hello	testing	\N	f	\N	259	2021-12-13 09:14:40.438573	2021-12-13 09:14:40.438573	\N	\N	\N
325	\N	hello	testing	\N	f	\N	259	2021-12-13 09:15:05.320397	2021-12-13 09:15:05.320397	\N	\N	\N
326	\N	hello	testing	\N	f	\N	259	2021-12-13 09:15:05.75153	2021-12-13 09:15:05.75153	\N	\N	\N
327	\N	hello	testing	\N	f	\N	259	2021-12-13 09:15:06.374918	2021-12-13 09:15:06.374918	\N	\N	\N
328	\N	hello	testing	\N	f	\N	259	2021-12-13 09:15:06.736009	2021-12-13 09:15:06.736009	\N	\N	\N
329	\N	hello	testing	\N	f	\N	259	2021-12-13 09:15:07.148418	2021-12-13 09:15:07.148418	\N	\N	\N
330	\N	hello	testing	\N	f	\N	259	2021-12-13 09:15:07.559082	2021-12-13 09:15:07.559082	\N	\N	\N
331	\N	hello	testing	\N	f	\N	259	2021-12-13 09:17:28.707547	2021-12-13 09:17:28.707547	\N	\N	\N
332	\N	hello	testing	\N	f	\N	259	2021-12-13 09:17:58.148214	2021-12-13 09:17:58.148214	\N	\N	\N
333	\N	hello	testing	\N	f	\N	259	2021-12-13 09:21:28.944603	2021-12-13 09:21:28.944603	\N	\N	\N
334	\N	hello	testing	\N	f	\N	259	2021-12-13 09:24:45.612749	2021-12-13 09:24:45.612749	\N	\N	\N
335	\N	hello	testing	\N	f	\N	259	2021-12-13 09:26:08.271854	2021-12-13 09:26:08.271854	\N	\N	\N
336	\N	hello	testing	\N	f	\N	259	2021-12-13 09:26:45.220025	2021-12-13 09:26:45.220025	\N	\N	\N
337	\N	hello	testing	\N	f	\N	259	2021-12-13 09:30:28.385478	2021-12-13 09:30:28.385478	\N	\N	\N
338	\N	hello	testing	\N	f	\N	259	2021-12-13 09:34:10.520303	2021-12-13 09:34:10.520303	\N	\N	\N
339	\N	hello	testing	\N	f	\N	259	2021-12-13 09:35:09.767217	2021-12-13 09:35:09.767217	\N	\N	\N
340	\N	hello	testing	\N	f	\N	259	2021-12-13 09:35:38.096752	2021-12-13 09:35:38.096752	\N	\N	\N
341	\N	hello	testing	\N	f	\N	259	2021-12-13 09:40:33.668253	2021-12-13 09:40:33.668253	\N	\N	\N
342	\N	hello	testing	\N	f	\N	259	2021-12-13 09:40:52.873931	2021-12-13 09:40:52.873931	\N	\N	\N
343	\N	hello	testing	\N	f	\N	259	2021-12-13 09:41:29.678195	2021-12-13 09:41:29.678195	\N	\N	\N
344	\N	hello	testing	\N	f	\N	259	2021-12-13 09:42:17.851746	2021-12-13 09:42:17.851746	\N	\N	\N
345	\N	hello	testing	\N	f	\N	259	2021-12-13 09:43:48.118187	2021-12-13 09:43:48.118187	\N	\N	\N
346	\N	hello	testing	\N	f	\N	259	2021-12-13 09:44:41.630288	2021-12-13 09:44:41.630288	\N	\N	\N
347	\N	hello	testing	\N	f	\N	259	2021-12-13 09:54:07.288219	2021-12-13 09:54:07.288219	\N	\N	\N
348	\N	hello	testing	\N	f	\N	259	2021-12-13 09:54:59.48	2021-12-13 09:54:59.48	\N	\N	\N
349	\N	hello	testing	\N	f	\N	259	2021-12-13 09:55:59.17264	2021-12-13 09:55:59.17264	\N	\N	\N
350	\N	hello	testing	\N	f	\N	259	2021-12-13 10:12:57.036069	2021-12-13 10:12:57.036069	\N	\N	\N
351	\N	hello	testing	\N	f	\N	259	2021-12-13 10:14:49.389198	2021-12-13 10:14:49.389198	\N	\N	\N
352	\N	hello	testing	\N	f	\N	259	2021-12-13 10:23:51.117328	2021-12-13 10:23:51.117328	\N	\N	\N
353	\N	hello	testing	\N	f	\N	259	2021-12-13 10:25:45.93547	2021-12-13 10:25:45.93547	\N	\N	\N
354	\N	hello	testing	\N	f	\N	259	2021-12-13 10:26:28.381507	2021-12-13 10:26:28.381507	\N	\N	\N
355	\N	hello	testing	\N	f	\N	259	2021-12-13 10:27:32.274574	2021-12-13 10:27:32.274574	\N	\N	\N
356	\N	hello	testing	\N	f	\N	259	2021-12-13 10:29:25.101631	2021-12-13 10:29:25.101631	\N	\N	\N
357	\N	hello	testing	\N	f	\N	259	2021-12-13 10:29:34.330246	2021-12-13 10:29:34.330246	\N	\N	\N
358	\N	hello	testing	\N	f	\N	259	2021-12-13 10:34:13.716641	2021-12-13 10:34:13.716641	\N	\N	\N
359	\N	hello	testing	\N	f	\N	259	2021-12-13 10:35:34.751304	2021-12-13 10:35:34.751304	\N	\N	\N
360	\N	hello	testing	\N	f	\N	259	2021-12-13 10:37:48.201179	2021-12-13 10:37:48.201179	\N	\N	\N
361	\N	hello	testing	\N	f	\N	259	2021-12-13 10:39:24.834212	2021-12-13 10:39:24.834212	\N	\N	\N
362	\N	hello	testing	\N	f	\N	259	2021-12-13 10:41:14.35216	2021-12-13 10:41:14.35216	\N	\N	\N
363	\N	hello	testing	\N	f	\N	259	2021-12-13 10:41:47.439427	2021-12-13 10:41:47.439427	\N	\N	\N
364	\N	hello	testing	\N	f	\N	259	2021-12-13 10:44:13.12664	2021-12-13 10:44:13.12664	\N	\N	\N
365	\N	hello	testing	\N	f	\N	259	2021-12-13 10:55:42.128102	2021-12-13 10:55:42.128102	\N	\N	\N
366	\N	hello	testing	\N	f	\N	259	2021-12-13 11:02:13.516649	2021-12-13 11:02:13.516649	\N	\N	\N
367	\N	hello	testing	\N	f	\N	259	2021-12-13 11:02:30.30713	2021-12-13 11:02:30.30713	\N	\N	\N
368	\N	hello	testing	\N	f	\N	259	2021-12-13 11:04:49.110641	2021-12-13 11:04:49.110641	\N	\N	\N
369	\N	hello	testing	\N	f	\N	259	2021-12-13 11:06:56.222036	2021-12-13 11:06:56.222036	\N	\N	\N
370	\N	hello	testing	\N	f	\N	259	2021-12-13 11:16:07.505447	2021-12-13 11:16:07.505447	\N	\N	\N
371	\N	hello	testing	\N	f	\N	259	2021-12-13 11:16:50.252691	2021-12-13 11:16:50.252691	\N	\N	\N
372	\N	hello	testing	\N	f	\N	259	2021-12-13 11:17:56.086152	2021-12-13 11:17:56.086152	\N	\N	\N
373	\N	hello	testing	\N	f	\N	259	2021-12-13 11:22:48.510808	2021-12-13 11:22:48.510808	\N	\N	\N
374	\N	hello	testing	\N	f	\N	259	2021-12-13 11:24:34.390373	2021-12-13 11:24:34.390373	\N	\N	\N
375	\N	hello	testing	\N	f	\N	259	2021-12-13 11:25:22.99423	2021-12-13 11:25:22.99423	\N	\N	\N
376	\N	hello	testing	\N	f	\N	259	2021-12-13 11:28:27.213529	2021-12-13 11:28:27.213529	\N	\N	\N
377	\N	hello	testing	\N	f	\N	259	2021-12-13 11:28:55.518531	2021-12-13 11:28:55.518531	\N	\N	\N
378	\N	hello	testing	\N	f	\N	259	2021-12-13 11:30:22.098831	2021-12-13 11:30:22.098831	\N	\N	\N
379	\N	hello	testing	\N	f	\N	259	2021-12-13 11:30:51.610357	2021-12-13 11:30:51.610357	\N	\N	\N
380	\N	hello	testing	\N	f	\N	259	2021-12-13 11:32:30.009832	2021-12-13 11:32:30.009832	\N	\N	\N
381	\N	hello	testing	\N	f	\N	259	2021-12-13 11:33:28.268506	2021-12-13 11:33:28.268506	\N	\N	\N
382	\N	hello	testing	\N	f	\N	259	2021-12-13 11:34:06.489566	2021-12-13 11:34:06.489566	\N	\N	\N
383	\N	hello	testing	\N	f	\N	259	2021-12-13 11:34:57.615657	2021-12-13 11:34:57.615657	\N	\N	\N
384	\N	hello	testing	\N	f	\N	259	2021-12-13 11:40:28.309591	2021-12-13 11:40:28.309591	\N	\N	\N
385	\N	hello	testing	\N	f	\N	259	2021-12-13 11:43:59.798893	2021-12-13 11:43:59.798893	\N	\N	\N
387	\N	hello	testing	\N	f	\N	259	2021-12-13 11:46:26.030874	2021-12-13 11:46:26.030874	\N	\N	\N
388	\N	hello	testing	\N	f	\N	259	2021-12-13 11:48:28.968903	2021-12-13 11:48:28.968903	\N	\N	\N
1139	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	370	2022-02-01 13:40:18.169769	2022-02-01 13:40:18.169769	137	\N	\N
390	\N	Friend Request	You recived new friend request from MichaelCore	\N	f	\N	137	2021-12-13 11:50:34.789324	2021-12-13 11:50:34.789324	\N	\N	\N
391	\N	hello	testing	\N	f	\N	259	2021-12-13 11:50:39.327978	2021-12-13 11:50:39.327978	\N	\N	\N
392	\N	hello	testing	\N	f	\N	259	2021-12-13 11:51:33.303993	2021-12-13 11:51:33.303993	\N	\N	\N
393	\N	hello	testing	\N	f	\N	259	2021-12-13 11:51:53.710009	2021-12-13 11:51:53.710009	\N	\N	\N
394	\N	hello	testing	\N	f	\N	259	2021-12-13 11:54:15.088762	2021-12-13 11:54:15.088762	\N	\N	\N
395	\N	hello	testing	\N	f	\N	259	2021-12-13 11:54:33.014347	2021-12-13 11:54:33.014347	\N	\N	\N
396	\N	hello	testing	\N	f	\N	259	2021-12-13 11:57:21.212321	2021-12-13 11:57:21.212321	\N	\N	\N
397	\N	hello	testing	\N	f	\N	259	2021-12-13 11:58:41.230335	2021-12-13 11:58:41.230335	\N	\N	\N
398	\N	hello	testing	\N	f	\N	259	2021-12-13 11:59:27.390354	2021-12-13 11:59:27.390354	\N	\N	\N
399	\N	hello	testing	\N	f	\N	259	2021-12-13 12:01:48.185946	2021-12-13 12:01:48.185946	\N	\N	\N
400	\N	hello	testing	\N	f	\N	259	2021-12-13 12:03:18.477447	2021-12-13 12:03:18.477447	\N	\N	\N
401	\N	hello	testing	\N	f	\N	259	2021-12-13 12:06:47.607493	2021-12-13 12:06:47.607493	\N	\N	\N
402	\N	hello	testing	\N	f	\N	259	2021-12-13 12:07:31.847181	2021-12-13 12:07:31.847181	\N	\N	\N
403	\N	hello	testing	\N	f	\N	259	2021-12-13 12:13:09.585058	2021-12-13 12:13:09.585058	\N	\N	\N
404	\N	hello	testing	\N	f	\N	259	2021-12-13 12:16:50.377999	2021-12-13 12:16:50.377999	\N	\N	\N
405	\N	hello	testing	\N	f	\N	259	2021-12-13 12:17:00.836849	2021-12-13 12:17:00.836849	\N	\N	\N
406	\N	hello	testing	\N	f	\N	259	2021-12-13 12:17:01.184583	2021-12-13 12:17:01.184583	\N	\N	\N
407	\N	hello	testing	\N	f	\N	259	2021-12-13 12:17:01.527858	2021-12-13 12:17:01.527858	\N	\N	\N
408	\N	hello	testing	\N	f	\N	259	2021-12-13 12:20:54.851729	2021-12-13 12:20:54.851729	\N	\N	\N
409	\N	hello	testing	\N	f	\N	259	2021-12-13 12:21:42.081413	2021-12-13 12:21:42.081413	\N	\N	\N
410	\N	hello	testing	\N	f	\N	259	2021-12-13 12:22:29.642139	2021-12-13 12:22:29.642139	\N	\N	\N
411	\N	hello	testing	\N	f	\N	259	2021-12-13 12:23:17.52985	2021-12-13 12:23:17.52985	\N	\N	\N
412	\N	hello	testing	\N	f	\N	259	2021-12-13 12:24:07.152411	2021-12-13 12:24:07.152411	\N	\N	\N
413	\N	hello	testing	\N	f	\N	259	2021-12-13 12:26:00.591736	2021-12-13 12:26:00.591736	\N	\N	\N
414	\N	hello	testing	\N	f	\N	259	2021-12-13 12:29:55.154091	2021-12-13 12:29:55.154091	\N	\N	\N
415	\N	hello	testing	\N	f	\N	259	2021-12-13 12:31:34.6987	2021-12-13 12:31:34.6987	\N	\N	\N
416	\N	hello	testing	\N	f	\N	259	2021-12-13 12:39:43.352157	2021-12-13 12:39:43.352157	\N	\N	\N
417	\N	hello	testing	\N	f	\N	259	2021-12-13 12:45:04.24113	2021-12-13 12:45:04.24113	\N	\N	\N
418	\N	hello	testing	\N	f	\N	259	2021-12-13 12:47:29.592223	2021-12-13 12:47:29.592223	\N	\N	\N
420	\N	hello	testing	\N	f	\N	259	2021-12-13 12:48:30.714013	2021-12-13 12:48:30.714013	\N	\N	\N
421	\N	hello	testing	\N	f	\N	259	2021-12-13 12:48:55.443761	2021-12-13 12:48:55.443761	\N	\N	\N
422	\N	hello	testing	\N	f	\N	259	2021-12-13 12:49:49.997429	2021-12-13 12:49:49.997429	\N	\N	\N
423	\N	hello	testing	\N	f	\N	285	2021-12-14 04:24:06.869001	2021-12-14 04:24:06.869001	\N	\N	\N
424	\N	hello	testing	\N	f	\N	285	2021-12-14 04:24:07.545795	2021-12-14 04:24:07.545795	\N	\N	\N
425	\N	hello	testing	\N	f	\N	285	2021-12-14 04:24:08.112729	2021-12-14 04:24:08.112729	\N	\N	\N
1159	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	286	2022-02-02 05:27:26.08097	2022-02-02 05:27:26.08097	124	\N	\N
427	\N	hello	testing	\N	f	\N	285	2021-12-14 04:35:38.911586	2021-12-14 04:35:38.911586	\N	\N	\N
419	\N	hello	testing	\N	t	2022-02-02 11:21:53.287802	259	2021-12-13 12:48:04.582405	2022-02-02 11:21:53.290626	\N	\N	\N
1177	\N	New comment on post	 has commented on your post	\N	t	2022-02-02 11:21:01.66081	124	2022-02-02 11:19:31.29585	2022-02-02 11:21:01.662313	266	76	\N
1195	\N	Friend Request	You received new friend request from 	\N	f	\N	391	2022-02-03 05:29:12.839733	2022-02-03 05:29:12.839733	390	\N	427
1196	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	390	2022-02-03 05:29:21.651553	2022-02-03 05:29:21.651553	391	\N	427
386	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:31:56.612216	136	2021-12-13 11:44:07.36762	2021-12-24 11:31:56.613945	\N	\N	\N
462	\N	hello	testing	\N	f	\N	259	2021-12-14 06:33:40.178177	2021-12-14 06:33:40.178177	\N	\N	\N
468	\N	Friend Request	You recived new friend request from DBUSER	\N	f	\N	137	2021-12-14 07:33:34.684253	2021-12-14 07:33:34.684253	\N	\N	\N
1141	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	370	2022-02-01 13:43:08.977012	2022-02-01 13:43:08.977012	137	\N	\N
1140	\N	Friend Request	You received new friend request from 	\N	t	2022-02-01 14:24:06.502094	137	2022-02-01 13:42:34.135275	2022-02-01 14:24:06.504002	370	\N	\N
1160	\N	Friend Request	You received new friend request from 	\N	f	\N	260	2022-02-02 05:31:53.825976	2022-02-02 05:31:53.825976	286	\N	\N
1178	\N	Friend Request	You received new friend request from 	\N	t	2022-02-02 11:22:35.719448	124	2022-02-02 11:21:36.504132	2022-02-02 11:22:35.72085	266	\N	419
1197	\N	Friend Request	You received new friend request from 	\N	f	\N	378	2022-02-03 08:57:36.146129	2022-02-03 08:57:36.146129	137	\N	428
1142	\N	Friend Request	You received new friend request from 	\N	t	2022-02-01 14:24:02.671848	137	2022-02-01 13:51:03.733336	2022-02-01 14:24:02.673707	370	\N	\N
1161	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	286	2022-02-02 05:32:12.928075	2022-02-02 05:32:12.928075	260	\N	\N
1179	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	266	2022-02-02 11:22:24.27307	2022-02-02 11:22:24.27307	124	\N	419
1198	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	137	2022-02-03 08:57:42.276491	2022-02-03 08:57:42.276491	378	\N	428
625	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	259	2021-12-15 08:11:39.361749	2021-12-15 08:11:39.361749	\N	\N	\N
626	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	258	2021-12-15 08:17:18.205032	2021-12-15 08:17:18.205032	\N	\N	\N
628	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	261	2021-12-15 08:24:16.802969	2021-12-15 08:24:16.802969	\N	\N	\N
629	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	270	2021-12-15 08:28:18.198143	2021-12-15 08:28:18.198143	\N	\N	\N
631	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	279	2021-12-15 08:42:48.810666	2021-12-15 08:42:48.810666	\N	\N	\N
630	\N	Friend Request	You recived new friend request from arunmurugan	\N	t	2022-01-24 12:17:41.942068	266	2021-12-15 08:30:17.104282	2022-01-24 12:17:41.944782	\N	\N	\N
1143	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	370	2022-02-01 13:51:21.695793	2022-02-01 13:51:21.695793	137	\N	\N
1162	\N	Friend Request	You received new friend request from 	\N	f	\N	287	2022-02-02 06:01:06.196669	2022-02-02 06:01:06.196669	124	\N	\N
1180	\N	Friend Request	You received new friend request from 	\N	t	2022-02-02 11:27:24.386299	124	2022-02-02 11:26:45.576272	2022-02-02 11:27:24.387551	266	\N	420
1199	\N	New comment on post	 has commented on your post	\N	t	2022-02-07 05:43:53.422107	124	2022-02-03 09:00:07.392095	2022-02-07 05:43:53.423431	378	46	\N
662	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	278	2021-12-15 09:48:25.752746	2021-12-15 09:48:25.752746	\N	\N	\N
672	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	274	2021-12-15 10:04:32.449057	2021-12-15 10:04:32.449057	\N	\N	\N
674	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	281	2021-12-15 11:18:12.57352	2021-12-15 11:18:12.57352	\N	\N	\N
675	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	277	2021-12-15 11:22:14.901483	2021-12-15 11:22:14.901483	\N	\N	\N
721	\N	Friend Request Accepted	Your friend requested was accepted by WillSmith	\N	f	\N	137	2021-12-15 13:47:05.56126	2021-12-15 13:47:05.56126	\N	\N	\N
720	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 08:23:30.924865	136	2021-12-15 13:46:49.514003	2021-12-24 08:23:30.926017	\N	\N	\N
1144	\N	Friend Request	You received new friend request from 	\N	t	2022-02-01 14:24:01.842465	137	2022-02-01 14:02:56.692812	2022-02-01 14:24:01.957284	376	\N	\N
1163	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-02-02 10:54:10.819659	124	2022-02-02 06:01:23.807838	2022-02-02 10:54:10.821309	287	\N	\N
1169	\N	Friend Request	You received new friend request from 	\N	t	2022-02-02 11:36:59.419946	137	2022-02-02 08:16:48.734496	2022-02-02 11:36:59.421401	370	\N	\N
1200	\N	Friend Request	You received new friend request from 	\N	f	\N	378	2022-02-03 11:47:06.403187	2022-02-03 11:47:06.403187	137	\N	429
1145	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-02-01 14:06:27.875116	376	2022-02-01 14:03:11.980191	2022-02-01 14:06:27.877176	137	\N	\N
1164	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-02-02 07:42:14.918974	129	2022-02-02 07:38:44.736335	2022-02-02 07:42:14.92052	271	\N	\N
1181	\N	Friend Request	You received new friend request from 	\N	f	\N	378	2022-02-02 11:56:55.410891	2022-02-02 11:56:55.410891	137	\N	421
1201	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	137	2022-02-03 11:47:45.730787	2022-02-03 11:47:45.730787	378	\N	429
757	\N	Friend Request	You recived new friend request from UtsavPatel	\N	f	\N	259	2021-12-16 06:38:42.44683	2021-12-16 06:38:42.44683	\N	\N	\N
758	\N	Friend Request	You recived new friend request from TwinkalKhanna Kumar	\N	f	\N	280	2021-12-16 06:47:38.021035	2021-12-16 06:47:38.021035	\N	\N	\N
760	\N	Friend Request Accepted	Your friend requested was accepted by WillSmith	\N	f	\N	137	2021-12-16 07:27:24.878048	2021-12-16 07:27:24.878048	\N	\N	\N
763	\N	Friend Request Accepted	Your friend requested was accepted by WillSmith	\N	f	\N	137	2021-12-17 09:31:29.933699	2021-12-17 09:31:29.933699	\N	\N	\N
765	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	280	2021-12-20 08:30:26.960962	2021-12-20 08:30:26.960962	\N	\N	\N
767	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	285	2021-12-20 08:43:10.945909	2021-12-20 08:43:10.945909	\N	\N	\N
768	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-20 12:09:15.337528	2021-12-20 12:09:15.337528	\N	\N	\N
770	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-20 12:10:57.962419	2021-12-20 12:10:57.962419	\N	\N	\N
771	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-20 12:21:26.644185	2021-12-20 12:21:26.644185	\N	\N	\N
774	\N	Friend Request Accepted	Your friend requested was accepted by WillSmith	\N	f	\N	137	2021-12-20 12:46:52.475706	2021-12-20 12:46:52.475706	\N	\N	\N
775	\N	Friend Request	You recived new friend request from testtestt	\N	f	\N	148	2021-12-20 12:58:23.234581	2021-12-20 12:58:23.234581	\N	\N	\N
778	\N	Friend Request	You recived new friend request from ReeddhiPandya	\N	f	\N	258	2021-12-20 15:14:35.682381	2021-12-20 15:14:35.682381	\N	\N	\N
779	\N	Friend Request	You recived new friend request from ReeddhiPandya	\N	f	\N	331	2021-12-20 15:19:38.27803	2021-12-20 15:19:38.27803	\N	\N	\N
780	\N	Friend Request	You recived new friend request from ReeddhiPandya	\N	f	\N	330	2021-12-20 15:20:12.00134	2021-12-20 15:20:12.00134	\N	\N	\N
781	\N	Friend Request Accepted	Your friend requested was accepted by ReeddhiPandya	\N	f	\N	331	2021-12-20 15:20:25.937521	2021-12-20 15:20:25.937521	\N	\N	\N
782	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	281	2021-12-21 04:32:10.197173	2021-12-21 04:32:10.197173	\N	\N	\N
783	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	259	2021-12-21 04:35:56.099278	2021-12-21 04:35:56.099278	\N	\N	\N
784	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	289	2021-12-21 04:38:14.605898	2021-12-21 04:38:14.605898	\N	\N	\N
785	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	259	2021-12-21 05:03:43.257306	2021-12-21 05:03:43.257306	\N	\N	\N
787	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	281	2021-12-21 05:24:04.313657	2021-12-21 05:24:04.313657	\N	\N	\N
788	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	320	2021-12-21 05:26:00.437174	2021-12-21 05:26:00.437174	\N	\N	\N
789	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	215	2021-12-21 05:32:51.026688	2021-12-21 05:32:51.026688	124	\N	\N
792	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	289	2021-12-21 05:42:20.102614	2021-12-21 05:42:20.102614	124	\N	\N
793	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	259	2021-12-21 05:43:51.662	2021-12-21 05:43:51.662	124	\N	\N
794	\N	Friend Request	You recived new friend request from testtest	\N	f	\N	259	2021-12-21 05:49:11.492843	2021-12-21 05:49:11.492843	129	\N	\N
795	\N	Friend Request	You recived new friend request from testtest	\N	f	\N	258	2021-12-21 05:51:00.903741	2021-12-21 05:51:00.903741	129	\N	\N
796	\N	Friend Request	You recived new friend request from testtest	\N	f	\N	331	2021-12-21 06:44:10.702436	2021-12-21 06:44:10.702436	129	\N	\N
797	\N	Friend Request	You recived new friend request from testtest	\N	f	\N	330	2021-12-21 06:44:19.535369	2021-12-21 06:44:19.535369	129	\N	\N
790	\N	Friend Request	You recived new friend request from arunmurugan	\N	t	2021-12-23 10:29:57.50064	259	2021-12-21 05:34:51.503021	2021-12-23 10:29:57.501626	124	\N	\N
756	\N	Friend Request Accepted	Your friend requested was accepted by EmmaJohnson	\N	t	2021-12-24 08:10:17.413326	133	2021-12-15 20:00:51.362978	2021-12-24 08:10:17.414402	\N	\N	\N
776	\N	Friend Request Accepted	Your friend requested was accepted by testtestt	\N	t	2021-12-24 08:10:16.703157	133	2021-12-20 12:58:49.158065	2021-12-24 08:10:16.704486	\N	\N	\N
772	\N	Friend Request Accepted	Your friend requested was accepted by EmmaJohnson	\N	t	2021-12-24 08:23:24.247254	136	2021-12-20 12:24:16.497654	2021-12-24 08:23:24.24845	\N	\N	\N
769	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 08:23:28.356294	136	2021-12-20 12:10:13.680343	2021-12-24 08:23:28.357794	\N	\N	\N
762	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 08:23:28.886473	136	2021-12-17 08:23:16.073465	2021-12-24 08:23:28.887931	\N	\N	\N
759	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 08:23:29.881491	136	2021-12-16 07:27:13.275991	2021-12-24 08:23:29.883116	\N	\N	\N
773	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:31:52.916627	136	2021-12-20 12:46:22.900249	2021-12-24 11:31:52.918539	\N	\N	\N
761	\N	Friend Request	You recived new friend request from WillSmith	\N	t	2022-01-11 07:03:10.937903	248	2021-12-16 13:10:10.100123	2022-01-11 07:03:10.939677	\N	\N	\N
798	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	167	2021-12-21 06:49:27.340363	2021-12-21 06:49:27.340363	124	\N	\N
799	\N	Friend Request	You recived new friend request from TempUser	\N	f	\N	142	2021-12-21 07:33:58.77332	2021-12-21 07:33:58.77332	297	\N	\N
801	\N	Friend Request	You recived new friend request from SaraGreem	\N	f	\N	137	2021-12-21 07:48:00.487717	2021-12-21 07:48:00.487717	305	\N	\N
1146	\N	New comment on post	 has commented on your post	\N	f	\N	376	2022-02-01 14:09:00.533739	2022-02-01 14:09:00.533739	137	72	\N
1165	\N	Friend Request	You received new friend request from 	\N	f	\N	370	2022-02-02 08:07:40.56495	2022-02-02 08:07:40.56495	137	\N	\N
807	\N	Friend Request Accepted	Your friend requested was accepted by arunmurugan	\N	f	\N	130	2021-12-21 10:15:06.578693	2021-12-21 10:15:06.578693	124	\N	\N
812	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	285	2021-12-21 12:35:45.955845	2021-12-21 12:35:45.955845	124	\N	\N
813	\N	Friend Request	You recived new friend request from WillSmith	\N	f	\N	137	2021-12-21 13:26:27.593414	2021-12-21 13:26:27.593414	136	\N	\N
817	\N	Friend Request Accepted	Your friend requested was accepted by arunmurugan	\N	f	\N	138	2021-12-22 06:27:57.28045	2021-12-22 06:27:57.28045	124	\N	\N
820	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	108	2021-12-22 06:57:01.986036	2021-12-22 06:57:01.986036	124	\N	\N
821	\N	Friend Request	You recived new friend request from TempUser	\N	f	\N	108	2021-12-22 07:12:04.488522	2021-12-22 07:12:04.488522	297	\N	\N
823	\N	Friend Request Accepted	Your friend requested was accepted by WillSmith	\N	f	\N	137	2021-12-22 09:37:30.270609	2021-12-22 09:37:30.270609	136	\N	\N
828	\N	Friend Request Accepted	Your friend requested was accepted by WillSmith	\N	f	\N	137	2021-12-22 10:35:57.824846	2021-12-22 10:35:57.824846	136	\N	\N
830	\N	Friend Request	You recived new friend request from AksayKumar	\N	f	\N	258	2021-12-23 04:30:32.733773	2021-12-23 04:30:32.733773	259	\N	\N
836	\N	Friend Request	You recived new friend request from arunmurugan	\N	f	\N	191	2021-12-23 07:40:01.535569	2021-12-23 07:40:01.535569	124	\N	\N
844	\N	Friend Request	You recived new friend request from Will Smith	\N	t	2022-01-12 08:58:51.0625	137	2021-12-23 16:24:42.00383	2022-01-12 08:58:51.065155	136	\N	\N
829	\N	Friend Request Accepted	Your friend requested was accepted by AksayKumar	\N	t	2021-12-23 10:28:31.045882	287	2021-12-23 04:29:29.443463	2021-12-23 10:28:31.047985	259	\N	\N
131	\N	Friend Request	You recived new friend request from RajeshKhanna	\N	t	2021-12-23 10:30:22.543445	259	2021-12-03 08:04:31.243747	2021-12-23 10:30:22.545472	\N	\N	\N
74	\N	Friend Request	You recived new friend request from RajeshKhanna	\N	t	2021-12-23 10:33:43.76637	260	2021-11-30 11:51:05.568135	2021-12-23 10:33:43.768087	\N	\N	\N
1098	\N	Friend Request	You received new friend request from 	\N	f	\N	144	2022-01-28 13:29:48.975461	2022-01-28 13:29:48.975461	370	\N	\N
840	\N	Friend Request	You recived new friend request from arun murugan	\N	t	2021-12-23 10:37:42.575681	260	2021-12-23 10:37:06.585473	2021-12-23 10:37:42.577899	124	\N	\N
841	\N	Friend Request	You recived new friend request from arun murugan	\N	t	2021-12-23 10:46:49.505547	260	2021-12-23 10:38:19.225915	2021-12-23 10:46:49.507121	124	\N	\N
627	\N	Friend Request	You recived new friend request from arunmurugan	\N	t	2021-12-23 10:46:56.946072	260	2021-12-15 08:19:44.54335	2021-12-23 10:46:56.947429	\N	\N	\N
1166	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-02-02 11:37:04.653551	137	2022-02-02 08:07:52.234636	2022-02-02 11:37:04.654734	370	\N	\N
846	\N	Friend Request	You recived new friend request from Will Smith	\N	f	\N	281	2021-12-23 17:45:15.580136	2021-12-23 17:45:15.580136	136	\N	\N
827	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 09:53:54.230196	136	2021-12-22 10:35:34.98018	2021-12-24 09:53:54.231514	137	\N	\N
822	\N	Friend Request	You recived new friend request from EmmaJohnson	\N	t	2021-12-24 11:24:52.780231	136	2021-12-22 09:37:24.133487	2021-12-24 11:24:52.781763	137	\N	\N
802	\N	Friend Request	You recived new friend request from SaraGreem	\N	t	2021-12-24 08:23:44.978417	136	2021-12-21 07:48:29.114076	2021-12-24 08:23:44.980148	305	\N	\N
833	\N	Friend Request Accepted	Your friend requested was accepted by testtest	\N	t	2021-12-27 11:48:24.062372	271	2021-12-23 07:05:54.178312	2021-12-27 11:48:24.063775	129	\N	\N
814	\N	Friend Request Accepted	Your friend requested was accepted by EmmaJohnson	\N	t	2021-12-24 09:54:01.163685	136	2021-12-21 13:28:10.470853	2021-12-24 09:54:01.168408	137	\N	\N
800	\N	Friend Request Accepted	Your friend requested was accepted by OlenaRomanek	\N	t	2021-12-24 11:31:28.442563	136	2021-12-21 07:46:33.179783	2021-12-24 11:31:28.448086	248	\N	\N
845	\N	Friend Request Accepted	Your friend requested was accepted by Emma Johnson	\N	t	2021-12-24 11:32:22.444962	136	2021-12-23 16:33:46.015229	2021-12-24 11:32:22.446458	137	\N	\N
837	\N	Friend Request	You recived new friend request from testtest	\N	t	2021-12-27 11:48:21.645605	271	2021-12-23 09:26:22.067604	2021-12-27 11:48:21.675499	129	\N	\N
834	\N	Friend Request	You recived new friend request from testtest	\N	t	2021-12-27 11:48:22.963001	271	2021-12-23 07:10:22.070278	2021-12-27 11:48:22.964412	129	\N	\N
826	\N	Friend Request Accepted	Your friend requested was accepted by testtest	\N	t	2021-12-27 11:48:29.133473	271	2021-12-22 10:10:25.386616	2021-12-27 11:48:29.134543	129	\N	\N
819	\N	Friend Request Accepted	Your friend requested was accepted by testtest	\N	t	2021-12-27 11:48:31.337373	271	2021-12-22 06:46:02.700723	2021-12-27 11:48:31.338601	129	\N	\N
805	\N	Friend Request Accepted	Your friend requested was accepted by testtest	\N	t	2021-12-27 11:48:35.485084	271	2021-12-21 08:00:09.576263	2021-12-27 11:48:35.486378	129	\N	\N
1202	\N	New comment on post	 has commented on your post	\N	t	2022-02-03 15:52:53.081417	136	2022-02-03 15:51:30.557837	2022-02-03 15:52:53.082774	137	31	\N
803	\N	Friend Request Accepted	Your friend requested was accepted by EmmaJohnson	\N	t	2022-01-11 07:42:18.369541	305	2021-12-21 07:49:41.268907	2022-01-11 07:42:18.371246	137	\N	\N
816	\N	Friend Request Accepted	Your friend requested was accepted by laljisolanki	\N	t	2022-01-14 15:25:13.556711	297	2021-12-22 05:57:30.177961	2022-01-14 15:25:13.558043	11	\N	\N
847	\N	Friend Request	You recived new friend request from Will Smith	\N	f	\N	280	2021-12-23 17:45:22.26487	2021-12-23 17:45:22.26487	136	\N	\N
1203	\N	New comment on post	 has commented on your post	\N	t	2022-02-03 15:53:45.462843	136	2022-02-03 15:53:31.003071	2022-02-03 15:53:45.464122	137	30	\N
874	\N	Friend Request Accepted	Your friend requested was accepted by Scarlett Johasson	\N	f	\N	260	2022-01-06 04:11:01.413538	2022-01-06 04:11:01.413538	280	\N	\N
204	\N	Friend Request	You recived new friend request from TempUser	\N	t	2021-12-24 06:52:15.528574	133	2021-12-08 14:44:53.685411	2021-12-24 06:52:15.529697	\N	\N	\N
872	\N	Friend Request	You recived new friend request from Dan Vall	\N	t	2022-01-13 07:13:52.112865	133	2022-01-05 13:53:52.044082	2022-01-13 07:13:52.161434	365	\N	\N
866	\N	Friend Request	You recived new friend request from Robert Downy	\N	f	\N	280	2022-01-03 06:11:09.39383	2022-01-03 06:11:09.39383	266	\N	\N
852	\N	Friend Request	You recived new friend request from DB USER	\N	t	2022-01-11 07:03:11.494838	248	2021-12-24 08:27:43.348718	2022-01-11 07:03:11.496377	133	\N	\N
215	\N	Friend Request	You recived new friend request from TempUser	\N	t	2021-12-24 08:10:18.112865	133	2021-12-09 07:14:15.978238	2021-12-24 08:10:18.113992	\N	\N	\N
867	\N	Friend Request Accepted	Your friend requested was accepted by Scarlett Johasson	\N	t	2022-01-21 09:48:16.913331	266	2022-01-03 06:11:47.136455	2022-01-21 09:48:16.915104	280	\N	\N
850	\N	Friend Request	You recived new friend request from Ritu Music	\N	t	2021-12-24 08:17:23.814947	133	2021-12-24 08:16:44.625167	2021-12-24 08:17:23.816416	359	\N	\N
1147	\N	New comment on post	 has commented on your post	\N	f	\N	136	2022-02-01 14:10:06.902217	2022-02-01 14:10:06.902217	137	57	\N
851	\N	Friend Request Accepted	Your friend requested was accepted by DB USER	\N	t	2021-12-24 08:18:45.865218	359	2021-12-24 08:17:39.348462	2021-12-24 08:18:45.866919	133	\N	\N
854	\N	Friend Request	You recived new friend request from DB USER	\N	f	\N	108	2021-12-24 08:31:21.088187	2021-12-24 08:31:21.088187	133	\N	\N
856	\N	Friend Request Accepted	Your friend requested was accepted by Will Smith	\N	t	2022-01-03 07:37:41.508298	133	2021-12-24 09:51:08.684629	2022-01-03 07:37:41.511831	136	\N	\N
1167	\N	Friend Request	You received new friend request from 	\N	t	2022-02-02 11:37:02.572357	137	2022-02-02 08:08:34.963359	2022-02-02 11:37:02.576402	370	\N	\N
855	\N	Friend Request	You recived new friend request from DB USER	\N	t	2021-12-24 09:53:51.896765	136	2021-12-24 08:32:16.98325	2021-12-24 09:53:51.900317	133	\N	\N
1182	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	137	2022-02-02 11:57:03.708101	2022-02-02 11:57:03.708101	378	\N	421
389	\N	Friend Request	You recived new friend request from MichaelCore	\N	t	2021-12-24 11:31:55.226564	136	2021-12-13 11:50:10.317475	2021-12-24 11:31:55.22783	\N	\N	\N
137	\N	Friend Request	You recived new friend request from InterestingMan	\N	t	2021-12-24 11:32:06.696781	136	2021-12-03 10:46:15.658827	2021-12-24 11:32:06.697805	\N	\N	\N
857	\N	Friend Request Accepted	Your friend requested was accepted by arun murugan	\N	f	\N	259	2021-12-28 04:14:01.17658	2021-12-28 04:14:01.17658	124	\N	\N
858	\N	Friend Request Accepted	Your friend requested was accepted by arun murugan	\N	f	\N	260	2021-12-28 04:14:04.88731	2021-12-28 04:14:04.88731	124	\N	\N
861	\N	Friend Request	You recived new friend request from arun murugan	\N	t	2021-12-28 04:30:10.861361	260	2021-12-28 04:29:17.101162	2021-12-28 04:30:10.862501	124	\N	\N
871	\N	Friend Request	You recived new friend request from Will Smith	\N	t	2022-01-11 07:03:12.009841	248	2022-01-04 12:43:43.826733	2022-01-11 07:03:12.011462	136	\N	\N
864	\N	Friend Request	You recived new friend request from test testproject	\N	f	\N	170	2021-12-28 06:45:24.443185	2021-12-28 06:45:24.443185	361	\N	\N
882	\N	Friend Request	You recived new friend request from Will Smith	\N	t	2022-01-11 07:03:12.565344	248	2022-01-10 09:25:24.142611	2022-01-11 07:03:12.570266	136	\N	\N
876	\N	Friend Request	You recived new friend request from Weti Vix	\N	t	2022-01-06 11:58:18.534881	136	2022-01-06 11:57:48.321126	2022-01-06 11:58:18.536167	366	\N	\N
877	\N	Friend Request Accepted	Your friend requested was accepted by Will Smith	\N	f	\N	366	2022-01-06 11:58:21.37799	2022-01-06 11:58:21.37799	136	\N	\N
875	\N	Friend Request Accepted	Your friend requested was accepted by DB USER	\N	f	\N	365	2022-01-06 07:32:16.002773	2022-01-06 07:32:16.002773	133	\N	\N
879	\N	Friend Request Accepted	Your friend requested was accepted by Will Smith	\N	f	\N	367	2022-01-06 13:28:05.226891	2022-01-06 13:28:05.226891	136	\N	\N
870	\N	Friend Request Accepted	Your friend requested was accepted by test test	\N	t	2022-01-04 07:38:11.385983	306	2022-01-04 07:37:30.917383	2022-01-04 07:38:11.387518	129	\N	\N
878	\N	Friend Request	You recived new friend request from Rawe Vit	\N	t	2022-01-06 14:52:00.009214	136	2022-01-06 13:18:52.732456	2022-01-06 14:52:00.01102	367	\N	\N
884	\N	Friend Request Accepted	Your friend requested was accepted by Will Smith	\N	f	\N	368	2022-01-10 10:36:33.583204	2022-01-10 10:36:33.583204	136	\N	\N
881	\N	Friend Request Accepted	Your friend requested was accepted by Olena Romanek	\N	t	2022-01-14 15:18:00.837787	133	2022-01-10 06:47:11.994314	2022-01-14 15:18:00.838874	248	\N	\N
883	\N	Friend Request	You received new friend request from Re Pid	\N	t	2022-01-10 10:38:46.78622	136	2022-01-10 10:35:54.819873	2022-01-10 10:38:46.790633	368	\N	\N
885	\N	Friend Request	You received new friend request from Re Pid	\N	t	2022-01-10 10:47:11.197514	136	2022-01-10 10:46:56.779922	2022-01-10 10:47:11.198664	368	\N	\N
880	\N	Friend Request Accepted	Your friend requested was accepted by Olena Romanek	\N	t	2022-01-10 10:38:51.57402	136	2022-01-10 06:47:08.578132	2022-01-10 10:38:51.575446	248	\N	\N
886	\N	Friend Request Accepted	Your friend requested was accepted by Will Smith	\N	f	\N	368	2022-01-10 10:48:30.372387	2022-01-10 10:48:30.372387	136	\N	\N
887	\N	Friend Request	You received new friend request from Will Smith	\N	f	\N	368	2022-01-10 10:48:43.108834	2022-01-10 10:48:43.108834	136	\N	\N
888	\N	Friend Request Accepted	Your friend requested was accepted by Re Pid	\N	t	2022-01-10 10:49:36.396741	136	2022-01-10 10:48:57.460029	2022-01-10 10:49:36.457216	368	\N	\N
184	\N	Friend Request	You recived new friend request from WillSmith	\N	t	2022-01-11 07:03:09.63906	248	2021-12-07 10:34:11.031872	2022-01-11 07:03:09.640313	\N	\N	\N
223	\N	Friend Request	You recived new friend request from SaraGreem	\N	t	2022-01-11 07:03:10.314963	248	2021-12-10 07:00:56.630331	2022-01-11 07:03:10.317432	\N	\N	\N
889	\N	Friend Request Accepted	Your friend requested was accepted by Olena Romanek	\N	t	2022-01-11 07:29:35.69857	136	2022-01-11 07:02:47.767439	2022-01-11 07:29:35.699704	248	\N	\N
806	\N	Friend Request Accepted	Your friend requested was accepted by WillSmith	\N	t	2022-01-11 07:42:12.66831	305	2021-12-21 08:46:01.326475	2022-01-11 07:42:12.669771	136	\N	\N
849	\N	Friend Request	You recived new friend request from Ritu Music	\N	t	2022-01-14 15:59:34.308721	297	2021-12-24 08:16:25.214232	2022-01-14 15:59:34.311061	359	\N	\N
911	\N	Friend Request Accepted	Your friend requested was accepted by DB USER	\N	t	2022-01-13 09:28:48.164077	271	2022-01-13 07:23:09.727179	2022-01-13 09:28:48.165608	133	\N	\N
1148	\N	New comment on post	 has commented on your post	\N	f	\N	136	2022-02-01 15:15:34.706439	2022-02-01 15:15:34.706439	370	57	\N
890	\N	Friend Request	You received new friend request from Will Smith	\N	t	2022-01-11 08:09:39.604021	370	2022-01-11 08:02:17.683074	2022-01-11 08:09:39.605844	136	\N	\N
891	\N	Friend Request Accepted	Your friend requested was accepted by Evan Peters	\N	t	2022-01-11 08:12:34.968835	136	2022-01-11 08:10:07.579081	2022-01-11 08:12:34.971574	370	\N	\N
892	\N	Friend Request	You received new friend request from Evan Peters	\N	t	2022-01-11 08:25:57.94052	144	2022-01-11 08:25:36.307216	2022-01-11 08:25:57.942085	370	\N	\N
893	\N	Friend Request Accepted	Your friend requested was accepted by Michael Core	\N	t	2022-01-11 08:26:35.665468	370	2022-01-11 08:26:13.843716	2022-01-11 08:26:35.666769	144	\N	\N
894	\N	Friend Request	You received new friend request from Evan Peters	\N	t	2022-01-11 08:29:11.01786	137	2022-01-11 08:28:58.978415	2022-01-11 08:29:11.019295	370	\N	\N
895	\N	Friend Request Accepted	Your friend requested was accepted by Emma Johnson	\N	t	2022-01-11 08:30:54.477327	370	2022-01-11 08:29:22.134213	2022-01-11 08:30:54.478712	137	\N	\N
896	\N	Friend Request	You received new friend request from Evan Peters	\N	t	2022-01-11 08:38:35.31221	137	2022-01-11 08:38:24.395212	2022-01-11 08:38:35.314028	370	\N	\N
897	\N	Friend Request Accepted	Your friend requested was accepted by Emma Johnson	\N	t	2022-01-11 08:39:03.88085	370	2022-01-11 08:38:46.620383	2022-01-11 08:39:03.884224	137	\N	\N
1149	\N	New comment on post	 has commented on your post	\N	f	\N	136	2022-02-01 15:15:44.493592	2022-02-01 15:15:44.493592	370	57	\N
910	\N	Friend Request	You received new friend request from test testt	\N	t	2022-01-19 07:22:23.611668	133	2022-01-13 07:19:27.303581	2022-01-19 07:22:23.613572	271	\N	\N
909	\N	Friend Request Accepted	Your friend requested was accepted by test test	\N	t	2022-01-13 09:29:07.239865	271	2022-01-13 05:58:06.235142	2022-01-13 09:29:07.24126	129	\N	\N
901	\N	Friend Request Accepted	Your friend requested was accepted by Emma Johnson	\N	t	2022-01-11 11:39:21.374488	136	2022-01-11 11:35:50.488308	2022-01-11 11:39:21.3759	137	\N	\N
1151	\N	Friend Request	You received new friend request from 	\N	t	2022-02-02 10:54:03.489045	124	2022-02-01 15:18:23.929339	2022-02-02 10:54:03.490543	266	\N	\N
900	\N	Friend Request	You received new friend request from Will Smith	\N	t	2022-01-11 11:39:36.074321	137	2022-01-11 11:32:10.060747	2022-01-11 11:39:36.075794	136	\N	\N
902	\N	Friend Request	You received new friend request from Emma Johnson	\N	t	2022-01-11 11:40:35.670421	136	2022-01-11 11:39:39.918995	2022-01-11 11:40:35.671656	137	\N	\N
903	\N	Friend Request Accepted	Your friend requested was accepted by Will Smith	\N	t	2022-01-11 11:43:18.701547	137	2022-01-11 11:40:42.771782	2022-01-11 11:43:18.70276	136	\N	\N
904	\N	Friend Request	You received new friend request from Will Smith	\N	t	2022-01-11 12:12:00.372425	137	2022-01-11 12:11:11.954027	2022-01-11 12:12:00.373876	136	\N	\N
906	\N	Friend Request	You received new friend request from Emma Johnson	\N	t	2022-01-11 13:25:01.370321	136	2022-01-11 12:12:49.132208	2022-01-11 13:25:01.371721	137	\N	\N
905	\N	Friend Request Accepted	Your friend requested was accepted by Emma Johnson	\N	t	2022-01-11 13:25:07.272252	136	2022-01-11 12:12:20.048437	2022-01-11 13:25:07.273598	137	\N	\N
907	\N	Friend Request Accepted	Your friend requested was accepted by Will Smith	\N	t	2022-01-12 08:58:30.131061	137	2022-01-11 12:13:14.430587	2022-01-12 08:58:30.132471	136	\N	\N
1204	\N	New comment on post	 has commented on your post	\N	t	2022-02-07 05:43:50.023494	124	2022-02-04 09:05:08.880465	2022-02-07 05:43:50.024921	378	46	\N
915	\N	Friend Request Accepted	Your friend requested was accepted by Evan Peters	\N	t	2022-01-13 08:32:55.075107	137	2022-01-13 08:27:41.682103	2022-01-13 08:32:55.083153	370	\N	\N
912	\N	Friend Request	You received new friend request from Evan Peters	\N	t	2022-01-13 08:32:59.084452	137	2022-01-13 08:19:56.899437	2022-01-13 08:32:59.086391	370	\N	\N
917	\N	Friend Request Accepted	Your friend requested was accepted by test test	\N	f	\N	374	2022-01-13 08:37:59.122134	2022-01-13 08:37:59.122134	129	\N	\N
918	\N	Friend Request	You received new friend request from test test	\N	f	\N	185	2022-01-13 08:41:01.546925	2022-01-13 08:41:01.546925	375	\N	\N
919	\N	Friend Request	You received new friend request from test test	\N	f	\N	184	2022-01-13 08:41:02.351636	2022-01-13 08:41:02.351636	375	\N	\N
920	\N	Friend Request	You received new friend request from test test	\N	f	\N	374	2022-01-13 08:41:48.599052	2022-01-13 08:41:48.599052	375	\N	\N
922	\N	Friend Request	You received new friend request from himanshu dwivedi	\N	f	\N	18	2022-01-13 08:50:39.860436	2022-01-13 08:50:39.860436	374	\N	\N
923	\N	Friend Request	You received new friend request from himanshu dwivedi	\N	f	\N	175	2022-01-13 08:50:41.467623	2022-01-13 08:50:41.467623	374	\N	\N
924	\N	Friend Request	You received new friend request from himanshu dwivedi	\N	f	\N	249	2022-01-13 08:50:42.9143	2022-01-13 08:50:42.9143	374	\N	\N
930	\N	Friend Request Accepted	Your friend requested was accepted by test test	\N	t	2022-02-02 07:39:00.508236	271	2022-01-13 09:29:44.851864	2022-02-02 07:39:00.509438	129	\N	\N
926	\N	Friend Request	You received new friend request from himanshu dwivedi	\N	f	\N	170	2022-01-13 08:51:05.356743	2022-01-13 08:51:05.356743	374	\N	\N
927	\N	Friend Request	You received new friend request from test test	\N	f	\N	374	2022-01-13 08:51:57.680567	2022-01-13 08:51:57.680567	375	\N	\N
932	\N	New comment on post	Emma Johnson has commented on your post	\N	t	2022-01-13 10:08:40.471347	370	2022-01-13 09:56:56.075901	2022-01-13 10:08:40.472835	137	\N	\N
914	\N	Friend Request	You received new friend request from Emma Johnson	\N	t	2022-01-13 10:08:44.473363	370	2022-01-13 08:27:13.330686	2022-01-13 10:08:44.475241	137	\N	\N
913	\N	Friend Request Accepted	Your friend requested was accepted by Emma Johnson	\N	t	2022-01-13 10:08:46.038373	370	2022-01-13 08:20:34.408989	2022-01-13 10:08:46.040502	137	\N	\N
939	\N	New comment on post	Emma Johnson has commented on your post	\N	t	2022-01-13 11:12:41.658686	370	2022-01-13 11:12:26.77591	2022-01-13 11:12:41.660258	137	\N	\N
1168	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	370	2022-02-02 08:15:28.870434	2022-02-02 08:15:28.870434	137	\N	\N
938	\N	New comment on post	Sarah Paulson has commented on your post	\N	t	2022-01-13 11:14:50.794843	137	2022-01-13 11:10:51.615369	2022-01-13 11:14:50.796346	376	\N	\N
937	\N	New comment on post	Sarah Paulson has commented on your post	\N	t	2022-01-13 11:15:03.329063	137	2022-01-13 11:08:27.759007	2022-01-13 11:15:03.330119	376	\N	\N
935	\N	Friend Request	You received new friend request from Sarah Paulson	\N	t	2022-01-13 11:15:08.44221	137	2022-01-13 11:07:00.401282	2022-01-13 11:15:08.444601	376	\N	\N
934	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-13 11:15:20.896161	137	2022-01-13 10:02:31.258698	2022-01-13 11:15:20.898966	370	\N	\N
933	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-13 11:15:25.153405	137	2022-01-13 10:00:47.804801	2022-01-13 11:15:25.154729	370	\N	\N
940	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-13 11:14:43.601021	137	2022-01-13 11:14:09.963452	2022-01-13 11:14:43.607201	370	\N	\N
936	\N	Friend Request Accepted	Your friend requested was accepted by Emma Johnson	\N	t	2022-01-13 12:16:08.777835	376	2022-01-13 11:08:01.36106	2022-01-13 12:16:08.781256	137	\N	\N
967	\N	New comment on post	Temp User has commented on your post	\N	t	2022-01-14 15:24:25.35439	133	2022-01-14 15:21:24.993819	2022-01-14 15:24:25.356635	297	\N	\N
947	\N	Friend Request	You received new friend request from Evan Peters	\N	t	2022-01-13 12:40:20.237573	376	2022-01-13 12:39:12.333747	2022-01-13 12:40:20.242501	370	\N	\N
948	\N	Friend Request Accepted	Your friend requested was accepted by Sarah Paulson	\N	t	2022-01-13 12:41:19.085625	370	2022-01-13 12:40:33.221865	2022-01-13 12:41:19.091539	376	\N	\N
955	\N	New comment on post	Sarah Paulson has commented on your post	\N	t	2022-01-13 12:51:43.415556	370	2022-01-13 12:51:30.974216	2022-01-13 12:51:43.41742	376	\N	\N
953	\N	New comment on post	Sarah Paulson has commented on your post	\N	t	2022-01-13 12:51:45.182441	370	2022-01-13 12:47:26.285434	2022-01-13 12:51:45.183965	376	\N	\N
949	\N	Friend Request	You received new friend request from Sarah Paulson	\N	t	2022-01-13 12:51:46.199052	370	2022-01-13 12:42:24.502041	2022-01-13 12:51:46.200789	376	\N	\N
954	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-13 12:52:27.440942	376	2022-01-13 12:49:55.718163	2022-01-13 12:52:27.442918	370	\N	\N
952	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-13 12:52:29.973627	376	2022-01-13 12:46:10.391208	2022-01-13 12:52:29.97514	370	\N	\N
951	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-13 12:52:31.665896	376	2022-01-13 12:44:17.636691	2022-01-13 12:52:31.667863	370	\N	\N
950	\N	Friend Request Accepted	Your friend requested was accepted by Evan Peters	\N	t	2022-01-13 12:52:32.588842	376	2022-01-13 12:43:05.968194	2022-01-13 12:52:32.590386	370	\N	\N
956	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-13 12:54:21.573368	376	2022-01-13 12:53:29.867871	2022-01-13 12:54:21.575536	370	\N	\N
957	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-13 12:59:54.768287	376	2022-01-13 12:56:24.945726	2022-01-13 12:59:54.77094	370	\N	\N
973	\N	Reply on your comment	Arun Murugan replied to your comment	\N	f	\N	259	2022-01-17 06:22:37.155986	2022-01-17 06:22:37.155986	124	\N	\N
974	\N	Reply on your comment	Arun Murugan replied to your comment	\N	f	\N	259	2022-01-17 07:02:28.565956	2022-01-17 07:02:28.565956	124	\N	\N
958	\N	New comment on post	Sarah Paulson has commented on your post	\N	t	2022-01-13 13:15:42.950419	370	2022-01-13 13:01:45.438162	2022-01-13 13:15:42.951536	376	\N	\N
963	\N	New comment on post	Sarah Paulson has commented on your post	\N	f	\N	137	2022-01-14 08:23:38.018481	2022-01-14 08:23:38.018481	376	\N	\N
964	\N	Friend Request	You received new friend request from Sarah Paulson	\N	f	\N	137	2022-01-14 08:26:47.089258	2022-01-14 08:26:47.089258	376	\N	\N
971	\N	Reply on your comment	Db User replied to your comment	\N	t	2022-01-17 07:19:46.145895	297	2022-01-14 15:37:12.801473	2022-01-17 07:19:46.147441	133	\N	\N
968	\N	Reply on your comment	Db User replied to your comment	\N	t	2022-01-14 15:25:21.734051	297	2022-01-14 15:24:47.720134	2022-01-14 15:25:21.735895	133	\N	\N
969	\N	New comment on post	Temp User has commented on your post	\N	t	2022-01-14 15:34:13.225906	133	2022-01-14 15:33:55.351602	2022-01-14 15:34:13.227141	297	\N	\N
970	\N	Reply on your comment	Db User replied to your comment	\N	f	\N	297	2022-01-14 15:34:32.691989	2022-01-14 15:34:32.691989	133	\N	\N
976	\N	Friend Request	You received new friend request from Evan Peters	\N	t	2022-01-17 07:46:46.373741	248	2022-01-17 07:43:46.337437	2022-01-17 07:46:46.375329	370	\N	\N
977	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-17 07:52:05.452441	248	2022-01-17 07:44:42.586377	2022-01-17 07:52:05.45504	370	\N	\N
945	\N	Friend Request	You received new friend request from himanshu dwivedi	\N	t	2022-01-17 04:15:03.951561	371	2022-01-13 12:26:50.336598	2022-01-17 04:15:03.953418	374	\N	\N
959	\N	Friend Request	You received new friend request from himanshu dwivedi	\N	t	2022-01-17 04:15:10.645391	371	2022-01-13 13:08:22.223008	2022-01-17 04:15:10.64791	374	\N	\N
987	\N	Friend Request Accepted	Your friend requested was accepted by Devid Cane 	\N	t	2022-02-01 13:30:35.73399	137	2022-01-17 10:09:52.616213	2022-02-01 13:30:35.736299	378	\N	\N
978	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-17 07:52:07.204506	248	2022-01-17 07:45:19.236332	2022-01-17 07:52:07.206483	370	\N	\N
982	\N	Friend Request	You received new friend request from Olena Romanek	\N	f	\N	144	2022-01-17 07:53:31.20366	2022-01-17 07:53:31.20366	248	\N	\N
965	\N	Friend Request Accepted	Your friend requested was accepted by Emma Johnson	\N	t	2022-01-31 12:18:13.048931	376	2022-01-14 08:27:24.835336	2022-01-31 12:18:13.052032	137	\N	\N
979	\N	Friend Request Accepted	Your friend requested was accepted by Olena Romanek	\N	t	2022-01-31 10:07:43.183999	370	2022-01-17 07:47:19.996624	2022-01-31 10:07:43.185424	248	\N	\N
981	\N	New comment on post	Olena Romanek has commented on your post	\N	t	2022-01-27 14:56:40.293599	376	2022-01-17 07:51:21.964339	2022-01-27 14:56:40.295319	248	\N	\N
980	\N	Friend Request	You received new friend request from Olena Romanek	\N	t	2022-02-01 14:06:45.891964	376	2022-01-17 07:48:46.713237	2022-02-01 14:06:45.893209	248	\N	\N
962	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-17 09:26:57.603116	376	2022-01-14 08:19:40.719158	2022-01-17 09:26:57.604727	370	\N	\N
961	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-17 09:26:59.827593	376	2022-01-14 08:18:24.257361	2022-01-17 09:26:59.828664	370	\N	\N
960	\N	New comment on post	Evan Peters has commented on your post	\N	t	2022-01-17 09:27:01.675085	376	2022-01-13 13:18:25.686118	2022-01-17 09:27:01.676995	370	\N	\N
985	\N	Friend Request	You received new friend request from Akshay Prajapati	\N	f	\N	259	2022-01-17 09:29:51.304069	2022-01-17 09:29:51.304069	371	\N	\N
988	\N	New comment on post	Devid Cane  has commented on your post	\N	t	2022-01-17 10:15:16.957164	137	2022-01-17 10:12:17.191179	2022-01-17 10:15:16.958416	378	\N	\N
989	\N	New comment on post	Devid Cane  has commented on your post	\N	f	\N	137	2022-01-17 10:16:08.470976	2022-01-17 10:16:08.470976	378	\N	\N
991	\N	Friend Request Accepted	Your friend requested was accepted by Devid Cane 	\N	f	\N	137	2022-01-17 10:17:46.61812	2022-01-17 10:17:46.61812	378	\N	\N
986	\N	Friend Request	You received new friend request from Emma Johnson	\N	t	2022-01-17 15:25:00.427177	378	2022-01-17 10:09:19.203868	2022-01-17 15:25:00.428896	137	\N	\N
983	\N	Friend Request Accepted	Your friend requested was accepted by Michael Core	\N	t	2022-01-18 06:56:26.794773	248	2022-01-17 07:54:08.530395	2022-01-18 06:56:26.796545	144	\N	\N
984	\N	New comment on post	Michael Core has commented on your post	\N	t	2022-01-18 06:57:09.648842	248	2022-01-17 07:55:16.312268	2022-01-18 06:57:09.650831	144	\N	\N
975	\N	New comment on post	Temp User has commented on your post	\N	t	2022-01-19 07:21:38.273908	133	2022-01-17 07:32:52.678989	2022-01-19 07:21:38.276002	297	\N	\N
990	\N	Friend Request	You received new friend request from Emma Johnson	\N	t	2022-01-17 15:24:58.710862	378	2022-01-17 10:17:20.665239	2022-01-17 15:24:58.735622	137	\N	\N
993	\N	Reply on your comment	Arun Murugan replied to your comment	\N	f	\N	259	2022-01-18 09:01:25.468669	2022-01-18 09:01:25.468669	124	\N	\N
1004	\N	Friend Request	You received new friend request from Evan Peters	\N	t	2022-02-01 13:30:22.71818	137	2022-01-19 11:35:56.82798	2022-02-01 13:30:22.720509	370	\N	\N
1205	\N	New comment on post	 has commented on your post	\N	t	2022-02-07 05:42:36.249111	124	2022-02-04 09:05:18.404049	2022-02-07 05:42:36.250706	378	46	\N
999	\N	Friend Request Accepted	Your friend requested was accepted by Akshay Prajapati	\N	f	\N	374	2022-01-19 05:04:48.55646	2022-01-19 05:04:48.55646	371	\N	\N
1000	\N	New comment on post	Db User has commented on your post	\N	f	\N	136	2022-01-19 07:08:24.466506	2022-01-19 07:08:24.466506	133	\N	\N
1006	\N	New comment on post	Emma Johnson has commented on your post	\N	t	2022-01-19 11:58:20.685195	370	2022-01-19 11:43:31.651765	2022-01-19 11:58:20.686486	137	\N	\N
1009	\N	Reply on your comment	Arun Murugan replied to your comment	\N	f	\N	259	2022-01-20 04:55:07.791222	2022-01-20 04:55:07.791222	124	46	\N
1010	\N	Reply on your comment	Arun Murugan replied to your comment	\N	f	\N	259	2022-01-20 04:56:47.590394	2022-01-20 04:56:47.590394	124	46	\N
1016	\N	Reply on your comment	Arun Murugan replied to your comment	\N	f	\N	259	2022-01-20 13:07:36.076055	2022-01-20 13:07:36.076055	124	76	\N
1017	\N	Reply on your comment	Arun Murugan replied to your comment	\N	f	\N	259	2022-01-20 13:07:44.816984	2022-01-20 13:07:44.816984	124	76	\N
1015	\N	Friend Request Accepted	Your friend requested was accepted by Sarah Paulson	\N	t	2022-01-21 08:37:43.50591	370	2022-01-20 10:55:26.733251	2022-01-21 08:37:43.507086	376	\N	\N
1026	\N	Friend Request	You received new friend request from Benn Wisee	\N	t	2022-01-31 10:07:43.275721	370	2022-01-24 13:54:13.210614	2022-01-31 10:07:43.277326	379	\N	\N
1012	\N	Friend Request	You received new friend request from Sarah Paulson	\N	t	2022-01-21 08:37:49.115871	370	2022-01-20 10:13:22.332404	2022-01-21 08:37:49.117007	376	\N	\N
1005	\N	Friend Request Accepted	Your friend requested was accepted by Emma Johnson	\N	t	2022-01-21 08:37:52.301779	370	2022-01-19 11:36:58.53089	2022-01-21 08:37:52.303097	137	\N	\N
1002	\N	New comment on post	Devid Cane  has commented on your post	\N	t	2022-01-21 08:37:55.434344	370	2022-01-19 10:14:23.507853	2022-01-21 08:37:55.435468	378	\N	\N
1001	\N	Friend Request	You received new friend request from Devid Cane 	\N	t	2022-01-21 08:38:00.29562	370	2022-01-19 10:12:51.55236	2022-01-21 08:38:00.296711	378	\N	\N
1003	\N	Friend Request Accepted	Your friend requested was accepted by Evan Peters	\N	t	2022-01-21 08:39:55.404637	378	2022-01-19 11:35:20.595852	2022-01-21 08:39:55.406132	370	\N	\N
1021	\N	Reply on your comment	Arun Murugan replied to your comment	\N	f	\N	259	2022-01-21 08:59:17.17678	2022-01-21 08:59:17.17678	124	46	\N
1022	\N	Reply on your comment	Arun Murugan replied to your comment	\N	f	\N	259	2022-01-21 08:59:32.776973	2022-01-21 08:59:32.776973	124	46	\N
1023	\N	Reply on your comment	Arun Murugan replied to your comment	\N	f	\N	259	2022-01-21 09:11:02.258581	2022-01-21 09:11:02.258581	124	46	\N
1152	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	266	2022-02-01 15:28:19.085483	2022-02-01 15:28:19.085483	124	\N	\N
1024	\N	Friend Request	You received new friend request from Robert Downy	\N	t	2022-01-21 09:49:08.49871	371	2022-01-21 09:46:21.447182	2022-01-21 09:49:08.501804	266	\N	\N
1030	\N	Friend Request	You received new friend request from Robert Downy	\N	t	2022-01-25 10:15:17.674477	371	2022-01-25 10:12:42.475373	2022-01-25 10:15:17.676075	266	\N	\N
1170	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	370	2022-02-02 08:17:08.209427	2022-02-02 08:17:08.209427	137	\N	\N
1031	\N	Friend Request Accepted	Your friend requested was accepted by Akshay Prajapati	\N	t	2022-01-25 10:57:44.284915	266	2022-01-25 10:15:28.559795	2022-01-25 10:57:44.286364	371	\N	\N
1025	\N	Friend Request Accepted	Your friend requested was accepted by Akshay Prajapati	\N	t	2022-01-24 12:17:34.303256	266	2022-01-21 10:05:45.522949	2022-01-24 12:17:34.304624	371	\N	\N
1027	\N	New comment on post	Benn Wisee has commented on your post	\N	f	\N	137	2022-01-24 13:56:38.060936	2022-01-24 13:56:38.060936	379	56	\N
1028	\N	Friend Request Accepted	Your friend requested was accepted by Evan Peters	\N	f	\N	379	2022-01-24 14:18:44.205865	2022-01-24 14:18:44.205865	370	\N	\N
1014	\N	Friend Request	You received new friend request from Evan Peters	\N	t	2022-01-27 14:56:42.62967	376	2022-01-20 10:14:41.182724	2022-01-27 14:56:42.631079	370	\N	\N
1013	\N	Friend Request	You received new friend request from Sarah Paulson	\N	t	2022-01-31 10:07:33.828132	370	2022-01-20 10:13:55.029378	2022-01-31 10:07:33.830015	376	\N	\N
1049	\N	Friend Request	You received new friend request from Robert Downy	\N	f	\N	260	2022-01-25 13:34:12.127654	2022-01-25 13:34:12.127654	266	\N	\N
1050	\N	Friend Request	You received new friend request from Akshay Prajapati	\N	f	\N	260	2022-01-25 13:35:16.535876	2022-01-25 13:35:16.535876	371	\N	\N
1048	\N	Friend Request	You received new friend request from Twinkal Khanna Kumar	\N	t	2022-01-25 13:57:26.706312	266	2022-01-25 13:33:09.64681	2022-01-25 13:57:26.707823	260	\N	\N
1052	\N	New comment on post	Evan Peters has commented on your post	\N	f	\N	376	2022-01-25 14:44:09.072947	2022-01-25 14:44:09.072947	370	72	\N
1053	\N	New comment on post	Evan Peters has commented on your post	\N	f	\N	376	2022-01-25 14:46:02.471802	2022-01-25 14:46:02.471802	370	72	\N
1054	\N	New comment on post	Evan Peters has commented on your post	\N	f	\N	376	2022-01-25 14:46:10.209508	2022-01-25 14:46:10.209508	370	72	\N
1153	\N	New comment on post	 has commented on your post	\N	f	\N	376	2022-02-01 15:37:19.557531	2022-02-01 15:37:19.557531	137	72	\N
1058	\N	New comment on post	Arun Murugan has commented on your post	\N	t	2022-02-01 14:06:43.282038	376	2022-01-27 04:45:56.716737	2022-02-01 14:06:43.283218	124	72	\N
1063	\N	New comment on post	Arun Murugan has commented on your post	\N	f	\N	136	2022-01-27 04:59:06.738793	2022-01-27 04:59:06.738793	124	62	\N
1074	\N	Friend Request	You received new friend request from Olena Romanek	\N	f	\N	144	2022-01-27 07:27:15.668269	2022-01-27 07:27:15.668269	248	\N	\N
1056	\N	Friend Request Accepted	Your friend requested was accepted by arun murugan	\N	t	2022-02-01 07:06:46.004106	371	2022-01-27 04:08:31.95016	2022-02-01 07:06:46.006556	124	\N	\N
1089	\N	Friend Request	You received new friend request from 	\N	f	\N	170	2022-01-28 04:58:46.211864	2022-01-28 04:58:46.211864	271	\N	\N
1075	\N	New comment on post	Evanт Petersт has commented on your post	\N	t	2022-01-27 09:19:31.661293	376	2022-01-27 09:07:23.597068	2022-01-27 09:19:31.671202	370	72	\N
1076	\N	Friend Request	You received new friend request from Sarah Paulson	\N	t	2022-01-27 09:30:44.286507	370	2022-01-27 09:30:26.031972	2022-01-27 09:30:44.288385	376	\N	\N
1068	\N	New comment on post	Arun Murugan has commented on your post	\N	t	2022-02-01 14:06:42.570948	376	2022-01-27 06:11:32.673568	2022-02-01 14:06:42.572296	124	72	\N
1081	\N	New comment on post	 has commented on your post	\N	t	2022-01-27 13:34:45.283237	376	2022-01-27 13:27:36.963415	2022-01-27 13:34:45.284286	370	72	\N
1079	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-01-27 13:34:53.747311	376	2022-01-27 12:46:50.308833	2022-01-27 13:34:53.748765	370	\N	\N
1077	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-01-27 13:34:57.195798	376	2022-01-27 12:41:29.353714	2022-01-27 13:34:57.1971	370	\N	\N
1084	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-01-27 14:56:06.21214	376	2022-01-27 13:35:58.459632	2022-01-27 14:56:06.213529	370	\N	\N
1090	\N	Friend Request	You received new friend request from 	\N	t	2022-02-02 08:12:34.269601	271	2022-01-28 05:27:41.677774	2022-02-02 08:12:34.271829	129	\N	\N
1085	\N	Friend Request	You received new friend request from 	\N	t	2022-01-27 14:59:07.283714	376	2022-01-27 14:58:58.658118	2022-01-27 14:59:07.28524	370	\N	\N
1088	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	376	2022-01-27 15:02:55.382739	2022-01-27 15:02:55.382739	370	\N	\N
1092	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	376	2022-01-28 08:03:11.357912	2022-01-28 08:03:11.357912	370	\N	\N
1094	\N	New comment on post	 has commented on your post	\N	f	\N	376	2022-01-28 09:38:04.78815	2022-01-28 09:38:04.78815	370	72	\N
1086	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-01-28 11:26:26.384181	370	2022-01-27 14:59:28.948943	2022-01-28 11:26:26.385442	376	\N	\N
1091	\N	Friend Request	You received new friend request from 	\N	t	2022-01-28 11:26:22.57938	370	2022-01-28 08:02:54.35594	2022-01-28 11:26:22.58092	376	\N	\N
1087	\N	Friend Request	You received new friend request from 	\N	t	2022-01-28 11:26:26.38776	370	2022-01-27 15:02:26.049795	2022-01-28 11:26:26.45715	376	\N	\N
1095	\N	Friend Request	You received new friend request from 	\N	t	2022-01-28 11:26:24.686626	370	2022-01-28 10:38:50.186668	2022-01-28 11:26:24.688037	376	\N	\N
1083	\N	Friend Request	You received new friend request from 	\N	t	2022-01-31 10:08:50.454497	370	2022-01-27 13:35:21.048759	2022-01-31 10:08:50.455931	376	\N	\N
1096	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	376	2022-01-28 11:53:47.952865	2022-01-28 11:53:47.952865	370	\N	\N
1078	\N	Friend Request	You received new friend request from 	\N	t	2022-01-31 10:08:56.231499	370	2022-01-27 12:45:32.062596	2022-01-31 10:08:56.232754	376	\N	\N
1093	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-02-01 16:03:54.968935	248	2022-01-28 08:27:23.511538	2022-02-01 16:03:54.971641	376	\N	\N
1069	\N	New comment on post	Arun Murugan has commented on your post	\N	t	2022-02-02 08:09:48.096332	137	2022-01-27 06:23:58.582016	2022-02-02 08:09:48.159425	124	56	\N
1171	\N	New comment on post	 has commented on your post	\N	f	\N	136	2022-02-02 08:47:31.060719	2022-02-02 08:47:31.060719	137	57	\N
1185	\N	Friend Request	You received new friend request from 	\N	t	2022-02-02 13:04:20.482229	248	2022-02-02 13:02:09.725813	2022-02-02 13:04:20.483822	389	\N	423
1100	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	376	2022-01-28 15:42:20.289861	2022-01-28 15:42:20.289861	370	\N	\N
1131	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-02-07 05:49:41.117852	371	2022-02-01 11:22:04.802075	2022-02-07 05:49:41.119174	259	\N	\N
1101	\N	Friend Request	You received new friend request from 	\N	t	2022-01-31 09:57:50.877458	370	2022-01-28 15:47:24.955512	2022-01-31 09:57:50.879145	376	\N	\N
1082	\N	New comment on post	 has commented on your post	\N	t	2022-01-31 09:57:58.089693	370	2022-01-27 13:32:32.405988	2022-01-31 09:57:58.092166	376	95	\N
1099	\N	Friend Request	You received new friend request from 	\N	t	2022-01-31 10:07:11.891401	370	2022-01-28 15:41:56.530863	2022-01-31 10:07:11.994441	376	\N	\N
1106	\N	Friend Request	You received new friend request from 	\N	t	2022-01-31 10:11:43.287559	376	2022-01-31 10:10:59.505764	2022-01-31 10:11:43.288916	370	\N	\N
1109	\N	New comment on post	 has commented on your post	\N	t	2022-01-31 10:14:40.892724	370	2022-01-31 10:14:28.654673	2022-01-31 10:14:40.893992	376	96	\N
1107	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-01-31 10:14:45.896006	370	2022-01-31 10:11:54.252943	2022-01-31 10:14:45.897512	376	\N	\N
1113	\N	New comment on post	 has commented on your post	\N	t	2022-01-31 12:16:01.257585	370	2022-01-31 12:15:16.154769	2022-01-31 12:16:01.258749	376	96	\N
1114	\N	Friend Request	You received new friend request from 	\N	t	2022-01-31 12:16:48.071009	370	2022-01-31 12:15:42.4366	2022-01-31 12:16:48.073529	376	\N	\N
1115	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-01-31 12:17:48.265072	376	2022-01-31 12:17:42.460725	2022-01-31 12:17:48.266887	370	\N	\N
1102	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-01-31 12:17:59.785984	376	2022-01-28 15:47:38.845243	2022-01-31 12:17:59.78714	370	\N	\N
1116	\N	New comment on post	 has commented on your post	\N	f	\N	136	2022-01-31 12:30:28.533676	2022-01-31 12:30:28.533676	376	62	\N
1117	\N	Friend Request	You received new friend request from 	\N	t	2022-01-31 12:44:01.846574	370	2022-01-31 12:43:42.826993	2022-01-31 12:44:01.848338	376	\N	\N
1118	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	376	2022-01-31 12:44:18.810036	2022-01-31 12:44:18.810036	370	\N	\N
1119	\N	New comment on post	 has commented on your post	\N	f	\N	136	2022-01-31 12:48:30.522867	2022-01-31 12:48:30.522867	370	62	\N
1121	\N	Friend Request	You received new friend request from 	\N	f	\N	370	2022-01-31 14:36:00.888802	2022-01-31 14:36:00.888802	383	\N	\N
1111	\N	Friend Request	You received new friend request from 	\N	t	2022-02-01 04:42:35.221114	371	2022-01-31 11:56:28.091369	2022-02-01 04:42:35.222654	124	\N	\N
1110	\N	Friend Request	You received new friend request from 	\N	t	2022-02-01 04:42:59.751193	371	2022-01-31 11:55:54.580303	2022-02-01 04:42:59.752745	266	\N	\N
1122	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-02-01 09:00:34.910063	383	2022-01-31 14:36:15.726377	2022-02-01 09:00:34.913874	370	\N	\N
1126	\N	Friend Request	You received new friend request from 	\N	f	\N	370	2022-02-01 09:59:34.608365	2022-02-01 09:59:34.608365	137	\N	\N
1129	\N	Friend Request	You received new friend request from 	\N	f	\N	259	2022-02-01 10:56:10.989254	2022-02-01 10:56:10.989254	285	\N	\N
1130	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	285	2022-02-01 10:56:30.840066	2022-02-01 10:56:30.840066	259	\N	\N
1133	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	f	\N	288	2022-02-01 11:33:21.288648	2022-02-01 11:33:21.288648	124	\N	\N
1108	\N	New comment on post	 has commented on your post	\N	t	2022-02-01 14:06:33.123424	376	2022-01-31 10:13:03.380655	2022-02-01 14:06:33.125154	370	72	\N
1134	\N	Friend Request	You received new friend request from 	\N	t	2022-02-01 14:24:06.586858	137	2022-02-01 11:57:49.313811	2022-02-01 14:24:06.588238	370	\N	\N
1127	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-02-01 14:24:07.18681	137	2022-02-01 09:59:49.462783	2022-02-01 14:24:07.187974	370	\N	\N
1154	\N	New comment on post	 has commented on your post	\N	f	\N	376	2022-02-01 15:39:56.611395	2022-02-01 15:39:56.611395	137	72	\N
1123	\N	New comment on post	 has commented on your post	\N	t	2022-02-02 04:51:20.330434	129	2022-02-01 07:11:29.097146	2022-02-02 04:51:20.33185	133	93	\N
1172	\N	Friend Request	You received new friend request from 	\N	f	\N	370	2022-02-02 09:27:43.796304	2022-02-02 09:27:43.796304	137	\N	\N
1189	\N	Friend Request	You received new friend request from 	\N	f	\N	376	2022-02-02 13:11:41.475912	2022-02-02 13:11:41.475912	137	\N	425
1186	\N	Friend Request Accepted	Your friend requested was accepted by 	\N	t	2022-02-02 13:14:55.911432	389	2022-02-02 13:04:01.495854	2022-02-02 13:14:55.912837	248	\N	423
\.


--
-- Data for Name: pdfs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pdfs (id, attached_item_id, attached_item_type, pdf, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: photo_libraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photo_libraries (id, photo, caption, account_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, name, description, created_at, updated_at, account_id, token_id, owner_id, nft_name, nft_description, image_url, image_preview_url, image_thumbnail_url, image_original_url, animation_url, animation_original_url, external_link, asset_details, usd_amount, eth_amount, virality_score, recent_update) FROM stdin;
3	Helol	jdnjndjnd	2021-11-11 14:26:38.075395	2021-11-11 14:26:38.075395	125	111982549053372676219054687507750154555544423443438340520672469301571142811649	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	tenor	\N	https://lh3.googleusercontent.com/szHyjy0vz0yIjp8XgXKe9mTRi-1tM376RMUqwvAgSJR8iLlWmkrL92SHSFmGhfXeJ2CiUCqaahXn4_Igh8FXb78gZGE3LCZqcqTvSQ	https://lh3.googleusercontent.com/szHyjy0vz0yIjp8XgXKe9mTRi-1tM376RMUqwvAgSJR8iLlWmkrL92SHSFmGhfXeJ2CiUCqaahXn4_Igh8FXb78gZGE3LCZqcqTvSQ=s250	https://lh3.googleusercontent.com/szHyjy0vz0yIjp8XgXKe9mTRi-1tM376RMUqwvAgSJR8iLlWmkrL92SHSFmGhfXeJ2CiUCqaahXn4_Igh8FXb78gZGE3LCZqcqTvSQ=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	Helol	jdnjndjnd	2021-11-12 08:20:55.210507	2021-11-12 08:20:55.210507	141	111982549053372676219054687507750154555544423443438340520672469302670654439425	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	demo	\N	https://lh3.googleusercontent.com/-yByAzbA7fuWmNMV2xTXjKr5UDPw6hWpb5wURJllAwqG46SK5CAFysVwwUfDgKQtptTMU_Eqv1MmSH4VEWtUsHfg8fqhmwdCKamIhnw	https://lh3.googleusercontent.com/-yByAzbA7fuWmNMV2xTXjKr5UDPw6hWpb5wURJllAwqG46SK5CAFysVwwUfDgKQtptTMU_Eqv1MmSH4VEWtUsHfg8fqhmwdCKamIhnw=s250	https://lh3.googleusercontent.com/-yByAzbA7fuWmNMV2xTXjKr5UDPw6hWpb5wURJllAwqG46SK5CAFysVwwUfDgKQtptTMU_Eqv1MmSH4VEWtUsHfg8fqhmwdCKamIhnw=s128	\N	https://storage.opensea.io/files/5616fa355abe65b3ec77e589ae4b11a2.mp4	https://storage.opensea.io/files/5616fa355abe65b3ec77e589ae4b11a2.mp4	\N	\N	\N	\N	\N	\N
6	Nature	Sunset	2021-11-12 13:18:22.285491	2021-11-12 13:18:22.285491	141	111982549053372676219054687507750154555544423443438340520672469300471631183873	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	Made it	\N	https://lh3.googleusercontent.com/aJsSaAZGWUCt1VHInpBC0q7PkQRAF1bWV6szMMA6SjUeihG2iP9g5hh4QpcmNXSJwKMXQHENs0bk3PXvo3mRHuWEwzRCAVzTgGbwAw	https://lh3.googleusercontent.com/aJsSaAZGWUCt1VHInpBC0q7PkQRAF1bWV6szMMA6SjUeihG2iP9g5hh4QpcmNXSJwKMXQHENs0bk3PXvo3mRHuWEwzRCAVzTgGbwAw=s250	https://lh3.googleusercontent.com/aJsSaAZGWUCt1VHInpBC0q7PkQRAF1bWV6szMMA6SjUeihG2iP9g5hh4QpcmNXSJwKMXQHENs0bk3PXvo3mRHuWEwzRCAVzTgGbwAw=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	Nature	Sunset	2021-11-10 12:38:48.115918	2022-02-08 00:01:00.843916	129	53043543350033854982381974050717097219780962640427547974224833759867205320705	0xacd7c2c7f4dc72368b0ffafa401946e6f47ca73e	Gogh Dog #1833	I hope it becomes a universal currency.❤	https://lh3.googleusercontent.com/jT35YQI28U_CIDcKhhZe__9gMwvOOnJYXQoxWuIbS99JYEvL42RFLxKbOoNCX3octEcHjkiuWJpk6KiKqNHXBiy6zGEs0m4JfOGMopE	https://lh3.googleusercontent.com/jT35YQI28U_CIDcKhhZe__9gMwvOOnJYXQoxWuIbS99JYEvL42RFLxKbOoNCX3octEcHjkiuWJpk6KiKqNHXBiy6zGEs0m4JfOGMopE=s250	https://lh3.googleusercontent.com/jT35YQI28U_CIDcKhhZe__9gMwvOOnJYXQoxWuIbS99JYEvL42RFLxKbOoNCX3octEcHjkiuWJpk6KiKqNHXBiy6zGEs0m4JfOGMopE=s128	\N	\N	\N	\N	\N	3147.73000000000002	1	103	2022-01-27 05:18:15.175891
81	Profile Name	hhfjggc	2022-01-20 08:58:57.852137	2022-01-25 12:23:43.048731	129	8920650261906539551707462159971082682358764236800752495046729209947856306177	0x13b8e8bc3229d713c26b7862078ae7acd368314d	test nft	\N	https://lh3.googleusercontent.com/8CG6QCRPtnFphPXIa6IAjkmLjHfrfdgtWOw7SfKxzCr2xjRW7ezQjSuvLqbMXsTT9DHOaEcfbV6OTmMUEqOu8qph6EMOIbw-_VS2	https://lh3.googleusercontent.com/8CG6QCRPtnFphPXIa6IAjkmLjHfrfdgtWOw7SfKxzCr2xjRW7ezQjSuvLqbMXsTT9DHOaEcfbV6OTmMUEqOu8qph6EMOIbw-_VS2=s250	https://lh3.googleusercontent.com/8CG6QCRPtnFphPXIa6IAjkmLjHfrfdgtWOw7SfKxzCr2xjRW7ezQjSuvLqbMXsTT9DHOaEcfbV6OTmMUEqOu8qph6EMOIbw-_VS2=s128	\N	\N	\N	\N	\N	\N	\N	5	2022-01-25 12:23:43.045593
11	arun murugan	Spiderman	2021-11-17 11:21:37.988614	2021-11-17 11:21:37.988614	193	111982549053372676219054687507750154555544423443438340520672469305969189322753	0xf793e06d2f2b899842f58c85279abeb672b2abb0	SPIDER	\N	https://lh3.googleusercontent.com/bC1DGzesO5eA6lzGiEnxcyJoy70OhkZ8Yk-K8ccDnWScYH1JZGyerItte6kejrS31qujo1ahy-lk20ZQH_nULU_viKg8L6AkeE83	https://lh3.googleusercontent.com/bC1DGzesO5eA6lzGiEnxcyJoy70OhkZ8Yk-K8ccDnWScYH1JZGyerItte6kejrS31qujo1ahy-lk20ZQH_nULU_viKg8L6AkeE83=s250	https://lh3.googleusercontent.com/bC1DGzesO5eA6lzGiEnxcyJoy70OhkZ8Yk-K8ccDnWScYH1JZGyerItte6kejrS31qujo1ahy-lk20ZQH_nULU_viKg8L6AkeE83=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	Ujjaval Barot	Man Jump	2021-11-18 07:14:07.258494	2021-11-18 07:14:07.258494	167	48378650749719933251351117953539765029019693784285209044920607886338466775041	0x6af558913a6b3032f50ffe1cc4971d711230d50e	Jump	\N	https://lh3.googleusercontent.com/jxvkZgSv8ljoziQycXVXNQO59x8DshkIPPVZvDpFlBPgSg4jjDUZKOYmZtLKV6kYHlNn2jts0kmUnRoDWP7hiqW5pqFcl9cceSfO	https://lh3.googleusercontent.com/jxvkZgSv8ljoziQycXVXNQO59x8DshkIPPVZvDpFlBPgSg4jjDUZKOYmZtLKV6kYHlNn2jts0kmUnRoDWP7hiqW5pqFcl9cceSfO=s250	https://lh3.googleusercontent.com/jxvkZgSv8ljoziQycXVXNQO59x8DshkIPPVZvDpFlBPgSg4jjDUZKOYmZtLKV6kYHlNn2jts0kmUnRoDWP7hiqW5pqFcl9cceSfO=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	Nature	Sunset	2022-01-27 09:15:33.441904	2022-02-08 00:01:42.044741	129	3514	0xfa91ab5befe9a24813f4c6b104d999164464b46e	Fishy Fam #3514	Fishy Fam	https://lh3.googleusercontent.com/fP6U0JV4gB4k804e4__nGJ8KZ2TXKGLlSeW_zcxWulQCcUfweabe2ywl7RjjD9j3S7_CugC-st3l8I2Q7OS4ladXPpiWVngLXMuD	https://lh3.googleusercontent.com/fP6U0JV4gB4k804e4__nGJ8KZ2TXKGLlSeW_zcxWulQCcUfweabe2ywl7RjjD9j3S7_CugC-st3l8I2Q7OS4ladXPpiWVngLXMuD=s250	https://lh3.googleusercontent.com/fP6U0JV4gB4k804e4__nGJ8KZ2TXKGLlSeW_zcxWulQCcUfweabe2ywl7RjjD9j3S7_CugC-st3l8I2Q7OS4ladXPpiWVngLXMuD=s128	https://herodev.mypinata.cloud/ipfs/QmQvUfqhLMSNYKLVaBcMnaHfmtP2zRxfFP2gLMCk6fN7DX/3514.png	\N	\N	\N	\N	3.14907000000000004	0.00100000000000000002	2	2022-02-01 07:12:07.823681
13	DB USER	Post title placholder	2021-11-18 09:07:06.85222	2022-02-08 00:02:33.158098	133	4520	0x0a42e79c81397c0e412ab07f68088c4905b772a9	Rich Kid #4520	By hip-hop artist, Rich the Kid, RICH KIDS is a collection of 7,427 cartoon-styled, blockchain baby bad asses, that Plug Walks the trust fund lifestyle to the hood!	https://lh3.googleusercontent.com/jfNMdHkn9U0ttG-4rYkYdpoTRUmXU0uP1XXZbfsqaXyAiXtT-nJb7-1hml6zII8K7nQ-fcw8lN-6VXJmdKEnwgB3EzaPO0288P2Y	https://lh3.googleusercontent.com/jfNMdHkn9U0ttG-4rYkYdpoTRUmXU0uP1XXZbfsqaXyAiXtT-nJb7-1hml6zII8K7nQ-fcw8lN-6VXJmdKEnwgB3EzaPO0288P2Y=s250	https://lh3.googleusercontent.com/jfNMdHkn9U0ttG-4rYkYdpoTRUmXU0uP1XXZbfsqaXyAiXtT-nJb7-1hml6zII8K7nQ-fcw8lN-6VXJmdKEnwgB3EzaPO0288P2Y=s128	https://ipfs.io/ipfs/QmP6gw5JzJ8HWKcdtDBY5v6Hn61P9578Pz3shYFv4t6d7q/4520.png	\N	\N	\N	\N	3150.57000000000016	1	\N	\N
82	Profile Name	teddyyyyy	2022-01-20 09:08:51.449703	2022-01-27 07:03:49.521347	129	8920650261906539551707462159971082682358764236800752495046729212146879561729	0x13b8e8bc3229d713c26b7862078ae7acd368314d	teddy	\N	https://lh3.googleusercontent.com/2-xOHok8jry8C1pa5t2gnHXI8yNhqV5pOqQEQVi8w7XicT2FpGIoyOgsfisoVg2EONiVvcW-V6XrPDdF1nAAMIdxsoildSFlu7IUAqU	https://lh3.googleusercontent.com/2-xOHok8jry8C1pa5t2gnHXI8yNhqV5pOqQEQVi8w7XicT2FpGIoyOgsfisoVg2EONiVvcW-V6XrPDdF1nAAMIdxsoildSFlu7IUAqU=s250	https://lh3.googleusercontent.com/2-xOHok8jry8C1pa5t2gnHXI8yNhqV5pOqQEQVi8w7XicT2FpGIoyOgsfisoVg2EONiVvcW-V6XrPDdF1nAAMIdxsoildSFlu7IUAqU=s128	\N	\N	\N	\N	\N	\N	\N	5	2022-01-27 07:03:49.519563
22	Olena Romanek	QA	2021-11-24 14:41:14.738602	2021-11-24 14:41:14.738602	248	22078292088351105558096269372419564704342872007289489882381637826028142329857	0x30cfded81b9c4a2d408a73fbdc9e3470f8019a60	QA	\N	https://lh3.googleusercontent.com/iOTqsR4NlaUho53zpya2SmGKRu5c0jultOfiEizNb4ujItB-fhi0QoVN-HKXOi1pZIJpvzakl63WorOscdrSbrpqQecJIebttCQ0	https://lh3.googleusercontent.com/iOTqsR4NlaUho53zpya2SmGKRu5c0jultOfiEizNb4ujItB-fhi0QoVN-HKXOi1pZIJpvzakl63WorOscdrSbrpqQecJIebttCQ0=s250	https://lh3.googleusercontent.com/iOTqsR4NlaUho53zpya2SmGKRu5c0jultOfiEizNb4ujItB-fhi0QoVN-HKXOi1pZIJpvzakl63WorOscdrSbrpqQecJIebttCQ0=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	test test	test post	2021-11-25 05:12:37.864015	2021-11-25 05:12:37.864015	129	8920650261906539551707462159971082682358764236800752495046729201151763283969	0x13b8e8bc3229d713c26b7862078ae7acd368314d	asdfasdf	\N	https://lh3.googleusercontent.com/iNwcCD7hxHHxouwYRSwnfdbzuPvtDFAY9njF9afgRHTlcMi6O2SazVN6NwH10ZyyfMAmKuh3PtyUq553BIxs0b22WCYH4mkrTBMjWa8	https://lh3.googleusercontent.com/iNwcCD7hxHHxouwYRSwnfdbzuPvtDFAY9njF9afgRHTlcMi6O2SazVN6NwH10ZyyfMAmKuh3PtyUq553BIxs0b22WCYH4mkrTBMjWa8=s250	https://lh3.googleusercontent.com/iNwcCD7hxHHxouwYRSwnfdbzuPvtDFAY9njF9afgRHTlcMi6O2SazVN6NwH10ZyyfMAmKuh3PtyUq553BIxs0b22WCYH4mkrTBMjWa8=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	test test	hmhjbljk	2021-11-25 11:30:59.61115	2021-11-25 11:30:59.61115	129	8920650261906539551707462159971082682358764236800752495046729200052251656193	0x13b8e8bc3229d713c26b7862078ae7acd368314d	test	\N	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw=s250	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	arun murugan	Fire Fences	2021-11-24 09:57:17.849028	2021-12-03 12:12:31.026484	124	15783352966874752169781050108002202296622710187720993940958879536061809164289	0x22e50fab0832b81f24609232d4fa3ae71fac0534	fire	\N	https://lh3.googleusercontent.com/fpN_tVsKzBroew6ns8SXkf4DwOT07jisw3j0AYcxmuRDPGo4X1MyP__hkXf1oBOAZhe5Nxx8OpfB33LVgdpzsvZ4Rr7_totOw81H	https://lh3.googleusercontent.com/fpN_tVsKzBroew6ns8SXkf4DwOT07jisw3j0AYcxmuRDPGo4X1MyP__hkXf1oBOAZhe5Nxx8OpfB33LVgdpzsvZ4Rr7_totOw81H=s250	https://lh3.googleusercontent.com/fpN_tVsKzBroew6ns8SXkf4DwOT07jisw3j0AYcxmuRDPGo4X1MyP__hkXf1oBOAZhe5Nxx8OpfB33LVgdpzsvZ4Rr7_totOw81H=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	test test	600*400	2021-11-25 12:07:06.33695	2021-11-25 12:07:06.33695	129	8920650261906539551707462159971082682358764236800752495046729205549809795073	0x13b8e8bc3229d713c26b7862078ae7acd368314d	600*400	\N	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q=s250	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	test test	HJKHKHG	2021-11-25 12:17:46.7912	2021-11-25 12:17:46.7912	129	8920650261906539551707462159971082682358764236800752495046729203350786539521	0x13b8e8bc3229d713c26b7862078ae7acd368314d	fjfgjfg	\N	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw=s250	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	Will Smith	This is my decription of Post	2021-11-30 16:10:24.274459	2022-02-03 15:51:30.525046	136	78662940693526771398492373862579024926097613520112440480537826112831253118977	0xade9a58a8411993ef3f6348d5e566cd94b2f2ed9	Welcome	\N	https://lh3.googleusercontent.com/rp-LomZ-x3CCPh1qVNmn7hyhb48X5fHR-ecKf9Q3ZXIk58EWNuTBZHZ2S1B29_oVMmg61sPZX23w8CcQwxz-d56CqTGCJvmWMsIZ	https://lh3.googleusercontent.com/rp-LomZ-x3CCPh1qVNmn7hyhb48X5fHR-ecKf9Q3ZXIk58EWNuTBZHZ2S1B29_oVMmg61sPZX23w8CcQwxz-d56CqTGCJvmWMsIZ=s250	https://lh3.googleusercontent.com/rp-LomZ-x3CCPh1qVNmn7hyhb48X5fHR-ecKf9Q3ZXIk58EWNuTBZHZ2S1B29_oVMmg61sPZX23w8CcQwxz-d56CqTGCJvmWMsIZ=s128	\N	\N	\N	\N	\N	\N	\N	7	2022-02-03 15:51:30.52296
34	arun murugan	natural view	2021-12-06 07:06:18.756637	2021-12-06 07:06:18.756637	124	37290782357520938070490606247120271157146584960653533670334535951183270379521	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	View	\N	https://lh3.googleusercontent.com/G13qqnqbTBnbVKzkt58kBfbvDyX2iJ6G0p2RS9PCz4viXbD_rQoNr2vspKOZhHaRD8YbVHD4ezY0g-eaU6utEdr1SxR7QZjy7U9bBQ	https://lh3.googleusercontent.com/G13qqnqbTBnbVKzkt58kBfbvDyX2iJ6G0p2RS9PCz4viXbD_rQoNr2vspKOZhHaRD8YbVHD4ezY0g-eaU6utEdr1SxR7QZjy7U9bBQ=s250	https://lh3.googleusercontent.com/G13qqnqbTBnbVKzkt58kBfbvDyX2iJ6G0p2RS9PCz4viXbD_rQoNr2vspKOZhHaRD8YbVHD4ezY0g-eaU6utEdr1SxR7QZjy7U9bBQ=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	arun murugan	Green land with pretty girl	2021-12-06 08:09:01.839163	2022-01-25 12:59:32.598397	124	37290782357520938070490606247120271157146584960653533670334535952282782007297	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Greenary	\N	https://lh3.googleusercontent.com/XOs2KosuHFApZNwSW15ZzHJfHSUXmaTYlDobtyNVtvP8QJMCbTe-8zHzhYG-j_2VQ_AEVxPbcA3jvvKAuIRBhYv43wMrGbBLKAv032I	https://lh3.googleusercontent.com/XOs2KosuHFApZNwSW15ZzHJfHSUXmaTYlDobtyNVtvP8QJMCbTe-8zHzhYG-j_2VQ_AEVxPbcA3jvvKAuIRBhYv43wMrGbBLKAv032I=s250	https://lh3.googleusercontent.com/XOs2KosuHFApZNwSW15ZzHJfHSUXmaTYlDobtyNVtvP8QJMCbTe-8zHzhYG-j_2VQ_AEVxPbcA3jvvKAuIRBhYv43wMrGbBLKAv032I=s128	\N	\N	\N	\N	\N	\N	\N	5	2022-01-25 12:59:32.596211
33	test test	Test nft	2021-12-06 05:19:53.398245	2021-12-10 07:34:58.547105	129	8920650261906539551707462159971082682358764236800752495046729206649321422849	0x13b8e8bc3229d713c26b7862078ae7acd368314d	test	\N	https://lh3.googleusercontent.com/vANIDQHiP69JdSyUWWjdeYIVnOisFyOG4vsj_QCZj6iDQzqpmQzyiGdxkuPcjZ0Y21rDwAlcor8sVXx_c3qZXRZT-Ppk5QMBAHP-0Q	https://lh3.googleusercontent.com/vANIDQHiP69JdSyUWWjdeYIVnOisFyOG4vsj_QCZj6iDQzqpmQzyiGdxkuPcjZ0Y21rDwAlcor8sVXx_c3qZXRZT-Ppk5QMBAHP-0Q=s250	https://lh3.googleusercontent.com/vANIDQHiP69JdSyUWWjdeYIVnOisFyOG4vsj_QCZj6iDQzqpmQzyiGdxkuPcjZ0Y21rDwAlcor8sVXx_c3qZXRZT-Ppk5QMBAHP-0Q=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
93	Nature	Sunset	2022-01-27 09:16:02.066935	2022-02-01 07:11:29.08257	129	4357	0xfa91ab5befe9a24813f4c6b104d999164464b46e	Fishy Fam #4357	Fishy Fam	https://lh3.googleusercontent.com/gz5TT5_f4gbVvm-THuK0YKFYxVo4SVDw233b2JtfyhYEl-rf6vZiPKnzx4SjWf3Mh__Wfn_v8CYgu1MtIvykwV7k6QQwPyGG1Ifj	https://lh3.googleusercontent.com/gz5TT5_f4gbVvm-THuK0YKFYxVo4SVDw233b2JtfyhYEl-rf6vZiPKnzx4SjWf3Mh__Wfn_v8CYgu1MtIvykwV7k6QQwPyGG1Ifj=s250	https://lh3.googleusercontent.com/gz5TT5_f4gbVvm-THuK0YKFYxVo4SVDw233b2JtfyhYEl-rf6vZiPKnzx4SjWf3Mh__Wfn_v8CYgu1MtIvykwV7k6QQwPyGG1Ifj=s128	https://herodev.mypinata.cloud/ipfs/QmQvUfqhLMSNYKLVaBcMnaHfmtP2zRxfFP2gLMCk6fN7DX/4357.png	\N	\N	\N	\N	2.55277000000000021	0.00100000000000000002	7	2022-02-01 07:11:29.077881
30	Will Smith	My best NFT	2021-11-30 16:10:15.66431	2022-02-04 10:39:00.339136	136	78662940693526771398492373862579024926097613520112440480537826113930764746753	0xade9a58a8411993ef3f6348d5e566cd94b2f2ed9	Bug	\N	https://lh3.googleusercontent.com/fjlzeGKK6MFWWVgGfkciY1dFMeb7YU2NC07fmaYB9s_jVTgKCK3rtD6xagMfvbfjf_DBeYfu_Ts9ji4MGbGLltchBXPeHgiiQITV	https://lh3.googleusercontent.com/fjlzeGKK6MFWWVgGfkciY1dFMeb7YU2NC07fmaYB9s_jVTgKCK3rtD6xagMfvbfjf_DBeYfu_Ts9ji4MGbGLltchBXPeHgiiQITV=s250	https://lh3.googleusercontent.com/fjlzeGKK6MFWWVgGfkciY1dFMeb7YU2NC07fmaYB9s_jVTgKCK3rtD6xagMfvbfjf_DBeYfu_Ts9ji4MGbGLltchBXPeHgiiQITV=s128	\N	\N	\N	\N	\N	\N	\N	9	2022-02-04 10:39:00.334814
38	arun murugan	Trees	2021-12-06 08:26:35.714475	2021-12-06 08:41:26.783082	124	37290782357520938070490606247120271157146584960653533670334535953382293635073	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Fences	\N	https://lh3.googleusercontent.com/Cp1qBu2k3GKvstStjVMv1Tr_MwTutkw55cJVwVJzGtm5--Xy0A-P5zq34UDvaPhLxsVJ04W9dSAw2RxPRNQ1f1MRGjgFaiGRVCAl	https://lh3.googleusercontent.com/Cp1qBu2k3GKvstStjVMv1Tr_MwTutkw55cJVwVJzGtm5--Xy0A-P5zq34UDvaPhLxsVJ04W9dSAw2RxPRNQ1f1MRGjgFaiGRVCAl=s250	https://lh3.googleusercontent.com/Cp1qBu2k3GKvstStjVMv1Tr_MwTutkw55cJVwVJzGtm5--Xy0A-P5zq34UDvaPhLxsVJ04W9dSAw2RxPRNQ1f1MRGjgFaiGRVCAl=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	arun murugan	Whole world	2021-12-07 06:49:06.646487	2021-12-10 04:41:17.514595	124	37290782357520938070490606247120271157146584960653533670334535954481805262849	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Nature in book	\N	https://lh3.googleusercontent.com/Aa0MdSmh5FsDaWlKW8HaMVkl8C3u4FJh78RUHI4gHKuTTM8Sbyg9pyxcq3sQX-RBdKrwE9K4f6MgC0air_-yMkU8znRRcX-D4vM-SA	https://lh3.googleusercontent.com/Aa0MdSmh5FsDaWlKW8HaMVkl8C3u4FJh78RUHI4gHKuTTM8Sbyg9pyxcq3sQX-RBdKrwE9K4f6MgC0air_-yMkU8znRRcX-D4vM-SA=s250	https://lh3.googleusercontent.com/Aa0MdSmh5FsDaWlKW8HaMVkl8C3u4FJh78RUHI4gHKuTTM8Sbyg9pyxcq3sQX-RBdKrwE9K4f6MgC0air_-yMkU8znRRcX-D4vM-SA=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	Nature	Sunset	2022-01-27 09:25:45.594277	2022-02-08 00:04:32.424207	129	34085485605809858234645056736246100833627908360907625323341304708241972789249	0x4b5bb38095168619fabcb9fb5c8f011fc8d911d8	Byteosaurus #4619	\N	https://lh3.googleusercontent.com/hywuPHHBa56JeH8B4BTfbXmT6-YN0BjksjGV4BMfbUKVjZ5ETQ0iZPKZ_Nbn-W5BHYhaZdm2kyZQ1-9wIEb9f5rOOCe0iJMZggc3Nl4	https://lh3.googleusercontent.com/hywuPHHBa56JeH8B4BTfbXmT6-YN0BjksjGV4BMfbUKVjZ5ETQ0iZPKZ_Nbn-W5BHYhaZdm2kyZQ1-9wIEb9f5rOOCe0iJMZggc3Nl4=s250	https://lh3.googleusercontent.com/hywuPHHBa56JeH8B4BTfbXmT6-YN0BjksjGV4BMfbUKVjZ5ETQ0iZPKZ_Nbn-W5BHYhaZdm2kyZQ1-9wIEb9f5rOOCe0iJMZggc3Nl4=s128	\N	\N	\N	\N	\N	110.320000000000007	0.0350000000000000033	16	2022-01-31 07:20:59.026272
45	arun murugan	Mountaing Hiils	2021-12-13 06:12:21.280098	2022-01-21 10:40:49.067271	124	37290782357520938070490606247120271157146584960653533670334535950083758751745	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Nature	\N	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh=s250	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh=s128	\N	\N	\N	\N	\N	\N	\N	39	2022-01-21 10:40:49.064359
46	arun murugan	tree nsnsns	2021-12-13 06:12:52.759488	2022-02-04 09:05:18.388757	124	37290782357520938070490606247120271157146584960653533670334535951183270379521	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	View	\N	https://lh3.googleusercontent.com/G13qqnqbTBnbVKzkt58kBfbvDyX2iJ6G0p2RS9PCz4viXbD_rQoNr2vspKOZhHaRD8YbVHD4ezY0g-eaU6utEdr1SxR7QZjy7U9bBQ	https://lh3.googleusercontent.com/G13qqnqbTBnbVKzkt58kBfbvDyX2iJ6G0p2RS9PCz4viXbD_rQoNr2vspKOZhHaRD8YbVHD4ezY0g-eaU6utEdr1SxR7QZjy7U9bBQ=s250	https://lh3.googleusercontent.com/G13qqnqbTBnbVKzkt58kBfbvDyX2iJ6G0p2RS9PCz4viXbD_rQoNr2vspKOZhHaRD8YbVHD4ezY0g-eaU6utEdr1SxR7QZjy7U9bBQ=s128	\N	\N	\N	\N	\N	\N	\N	228	2022-02-04 09:05:18.385712
55	Olena Romanek	Sunglasses	2021-12-21 10:41:54.887869	2021-12-21 10:41:54.887869	248	22078292088351105558096269372419564704342872007289489882381637826028142329857	0x30cfded81b9c4a2d408a73fbdc9e3470f8019a60	Sunglasses  black	\N	https://lh3.googleusercontent.com/93HtUX3CPLcaDCz-CO8hK_NFVoq5BXK8BoNxRUF9pbdMRhiYr6iplTMgevJ1UmtlSUJGrDUf1rz0SUzCpsfPf47rYoMdnu0MEsupqQ	https://lh3.googleusercontent.com/93HtUX3CPLcaDCz-CO8hK_NFVoq5BXK8BoNxRUF9pbdMRhiYr6iplTMgevJ1UmtlSUJGrDUf1rz0SUzCpsfPf47rYoMdnu0MEsupqQ=s250	https://lh3.googleusercontent.com/93HtUX3CPLcaDCz-CO8hK_NFVoq5BXK8BoNxRUF9pbdMRhiYr6iplTMgevJ1UmtlSUJGrDUf1rz0SUzCpsfPf47rYoMdnu0MEsupqQ=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	Profile Name	hjschsd	2022-01-18 09:30:04.812875	2022-01-27 07:09:17.266838	129	8920650261906539551707462159971082682358764236800752495046729211047367933953	0x13b8e8bc3229d713c26b7862078ae7acd368314d	test nft 2	\N	https://lh3.googleusercontent.com/VBEKbjU3flxS_v4P6c_6G9Jawa8BOLP1GKDQ8PX-9mmsEXK_gg7DefH_RA8UA-Q2OUUEGiR2DmN2_qJ1MLRIqwNKMUOwvBw1_3syJw	https://lh3.googleusercontent.com/VBEKbjU3flxS_v4P6c_6G9Jawa8BOLP1GKDQ8PX-9mmsEXK_gg7DefH_RA8UA-Q2OUUEGiR2DmN2_qJ1MLRIqwNKMUOwvBw1_3syJw=s250	https://lh3.googleusercontent.com/VBEKbjU3flxS_v4P6c_6G9Jawa8BOLP1GKDQ8PX-9mmsEXK_gg7DefH_RA8UA-Q2OUUEGiR2DmN2_qJ1MLRIqwNKMUOwvBw1_3syJw=s128	\N	\N	\N	\N	\N	\N	\N	36	2022-01-27 07:09:17.264096
58	Profile Name	testing	2022-01-06 06:21:12.241199	2022-01-20 07:05:28.779569	129	8920650261906539551707462159971082682358764236800752495046729202251274911745	0x13b8e8bc3229d713c26b7862078ae7acd368314d	test2	\N	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw=s250	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw=s128	\N	\N	\N	\N	\N	\N	\N	9	2022-01-20 07:05:28.777335
59	Profile Name	testingggggggggggggggg	2022-01-06 06:53:52.657445	2022-01-27 05:14:24.0248	129	8920650261906539551707462159971082682358764236800752495046729207748833050625	0x13b8e8bc3229d713c26b7862078ae7acd368314d	600*400 test nft	\N	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q=s250	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q=s128	\N	\N	\N	\N	\N	\N	\N	41	2022-01-27 05:14:24.019932
9	Helol	Title #12345	2021-11-15 09:26:37.695868	2022-02-08 00:06:04.720653	133	1924	0x66A0670E8196B2055F4D7AF367e6ee52395Dd26D	Rich Kid #1924	By hip-hop artist, Rich the Kid, RICH KIDS is a collection of 7,427 cartoon-styled, blockchain baby bad asses, that Plug Walks the trust fund lifestyle to the hood!	https://lh3.googleusercontent.com/xg463baBEqMpyTrfW9qhy6F5VbcTHexspHQfRKcNA527zfvF28sSYOSfwHaYH9QI1WoJMP0MbWGGBto3yTjHVvge3tZN5VUty9ujOg	https://lh3.googleusercontent.com/xg463baBEqMpyTrfW9qhy6F5VbcTHexspHQfRKcNA527zfvF28sSYOSfwHaYH9QI1WoJMP0MbWGGBto3yTjHVvge3tZN5VUty9ujOg=s250	https://lh3.googleusercontent.com/xg463baBEqMpyTrfW9qhy6F5VbcTHexspHQfRKcNA527zfvF28sSYOSfwHaYH9QI1WoJMP0MbWGGBto3yTjHVvge3tZN5VUty9ujOg=s128	https://ipfs.io/ipfs/QmP6gw5JzJ8HWKcdtDBY5v6Hn61P9578Pz3shYFv4t6d7q/1924.png	\N	\N	\N	\N	3141.11000000000013	1	\N	\N
83	Nature	Sunset	2022-01-20 09:29:53.876621	2022-02-08 00:05:54.173818	129	76822989335434484463650117884557904463548554515250910540000741672058596884481	0x1bf98ce92b915d8246a0eac8aa3b9ae682259dee	Castlevania: Circle of the Moon - Main Visual Art Global ver.	【Item Description】\nWe have picked up the main visual art from the Global version of Castlevania: Circle of the Moon. The art illustrates the protagonist Nathan's determination to save his master, with the Dracula’s Castle in the background.\n\n【First-Purchaser Campaign】\nYou will be entitled to have your nickname posted on our website (https://www.konami.com/games/memorial-nft/) as the first NFT purchaser.\nPlease check (https://www.konami.com/games/memorial-nft/) for details.\n\n【Terms of Use】\n・There are no other authorities established for the purchaser under this agreement for the NFT concluded between the Purchaser and Konami Digital Entertainment Co., Ltd. (“Konami”) than the right of usage of the NFT and the purchaser benefits as separately described outside this Terms of Use in OpenSea, a platform used in relation to this agreement (i.e. the right granted to the person who purchased the NFT from Konami to indicate the fact that the purchaser purchased the NFT using the nickname on the Konami homepage (https://www.konami.com/games/memorial-nft/). \n・The purchaser’s nickname will be displayed when Konami deems the nickname to be reasonable based on social standards (e.g. a nickname containing information that can be used to identify a specific individual is unacceptable).  Also, in the event a nickname is not reported by the date indicated by Konami using the designated method, a socially acceptable nickname is not reported to Konami, the purchaser causes or is deemed to cause the purchaser benefits to be used by a third party (e.g. causing a third party to report the nickname on behalf of the purchaser), or the NFT is transferred to a third party, the purchaser will lose the right to receive the benefits (the nickname, once displayed, will not be deleted during the period of time separately specified by Konami). Notwithstanding the above provisions, in the event Konami determines that the purchaser will illegally or inappropriately use the NFT, the purchaser will lose the right to receive the benefits (the displayed nickname will be deleted). \n・The purchaser will not, by purchasing the NFT, obtain intellectual property rights (e.g. copyrights, trademark rights) in relation to the data linked to the NFT. Thus, the purchaser may not use the data linked to the NFT (e.g. reproductions) for commercial purposes.\n・Konami is not able to preclude the purchaser from spreading on social media the fact that the purchaser purchased the NFT nor from transferring the NFT to a third party. \n・Konami will not sell another NFT that is linked to the same data that is linked to the current NFT at any time in the future, but may sell a NFT that is linked to data based on Castlevania series in the future.\n・Minors may not purchase the NFT.\n・The purchaser may not cancel (e.g. return, refund) this agreement after it has been concluded.\n・Konami will not be responsible for the unavailability of the HP due to maintenance, accident, or other reasons. \n・Konami will only be responsible for granting the use of the NFT and purchaser benefits for the NFT and will not provide any guarantee for the NFT itself (e.g. continuity, compatibility with other services).\n・Konami does not guarantee that the value of the NFT will increase after the purchase.\n\n\n【商品説明】\n「Castlevania: Circle of the Moon」グローバル版のメインビジュアルアートをピックアップしました。悪魔城をバックに主人公ネイサンの師匠救出への決意が現れたアートとなっています。\n\n【初回購入者特典】\n「KONAMI MEMORIAL NFT」ホームページ( https://www.konami.com/games/memorial-nft/ )にNFT初回購入者としてニックネームを掲載する権利を得ます。\n詳細は( https://www.konami.com/games/memorial-nft/ )をご確認ください。\n\n【販売規約】\n・ご購入者様と株式会社コナミデジタルエンタテインメント（コナミ）との間で締結される本NFTを対象とした本契約によって、ご購入者様に設定される権限は、本NFTの利用権限と本契約の際に利用するプラットフォームであるOpenSeaにおいて本規約外に別途詳細する購入者特典（コナミから本NFTを購入者した方のみを対象とし、コナミのホームページ上（ https://www.konami.com/games/memorial-nft/ ）に、ニックネームを利用して、ご購入者様が本NFTの購入した事実を示す権利）以外にございません。\n・ご購入者様のニックネームの表示に際しては、社会通念上妥当なニックネームとコナミが判断した場合に表示いたします（例：個人を特定できる情報を含むニックネームは不可）。また、別途、コナミがお知らせする期限までに所定の方法で、ニックネームをご通知いただけない場合、もしくは社会通念上妥当なニックネームをご通知いただけない場合、他者に購入者特典の利用させる、もしくはそのおそれのある行為があると認められた場合（例：ご購入者様に代わり、第三者にニックネームの通知をさせる）、または第三者に本ＮＦＴを移転した場合は、本特典を受ける権利を失います（一旦、掲載されたニックネームは、別途コナミが指定する期間中は、削除されません）。上記の規定にかかわらず、ご購入者様が違法・不適当な利用を本NFTに関して行うとコナミが判断した場合は、本特典を受ける権利を失います（一旦、掲載されたニックネームは削除されます）。\n・ご購入者様は、本NFTの購入によって、本NFTに紐づくデータに関連する知的財産権（著作権、商標権等）を取得しません。従いまして、商用目的で、本NFTに紐づくデータの利用（複製等）はできません。\n・コナミは、ご購入者様が本NFTを購入した事実をSNSで拡散すること、および本NFTを第三者に移転することを妨げません。\n・コナミは、本NFTに紐づくデータと同一のデータに紐づくNFTを今後販売しませんが、同データが依拠するゲームタイトルである「悪魔城ドラキュラ」シリーズに依拠するデータを紐づけるNFTを今後販売する可能性がございます。\n・未成年者は本NFTを購入できません。\n・ご購入者様は、一旦成立した本契約の取消し（返品、返金等）はできません。\n・コナミは、HPがメンテナンスまたは事故等で利用不能になった場合でも責任を負いません。\n・コナミは、本NFTの利用権限と購入者特典の設定に関する責任のみ負い、本NFT自体については何ら保証をしません（存続性、他サービスとの互換性等）。\n・コナミは本NFTが購入後に、価値が上昇することを保証しません。	https://lh3.googleusercontent.com/3Pi6msFOhnuLJMOXhTGutDUEWcjCm5hJtIwkCpvEIwmBqN7FySzmJTdiA_9E3ixKtVDMKGjsY-Go9Q3UTpKz3AzTtSi75zOKQOp3dQ	https://lh3.googleusercontent.com/3Pi6msFOhnuLJMOXhTGutDUEWcjCm5hJtIwkCpvEIwmBqN7FySzmJTdiA_9E3ixKtVDMKGjsY-Go9Q3UTpKz3AzTtSi75zOKQOp3dQ=s250	https://lh3.googleusercontent.com/3Pi6msFOhnuLJMOXhTGutDUEWcjCm5hJtIwkCpvEIwmBqN7FySzmJTdiA_9E3ixKtVDMKGjsY-Go9Q3UTpKz3AzTtSi75zOKQOp3dQ=s128	https://ipfs.io/ipfs/bafybeih6c4yqm574i3zwa4c6usb56wearapdfmk3tqqqj65t3jrxnqbetq/image	\N	\N	https://www.konami.com/games/memorial-nft/	\N	94250.1000000000058	30	14	2022-01-27 07:08:21.39847
60	Nature	#NFT #first_nft #my_nft	2022-01-07 11:03:18.421228	2022-01-21 06:43:03.738005	129	15	0x4772331d243eb2ee23fa7361b492139773207307	CreatureToad #15	A creature and a toadz were left in the wallet for too long...	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g=s250	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g=s128	https://ipfs.io/ipfs/QmNy9Sh8PxGPRJpXVyC3ndmCLRvffvBcZQzg8vBcmtwMmW	\N	\N	\N	\N	336.261200000000031	0.110000000000000001	14	2022-01-21 06:43:03.735078
53	Nature	fjghjgkjhbkj	2021-12-21 06:45:56.756131	2022-02-08 00:06:25.546599	129	97	0x3ee965ae147e95aaebb7aff6e04e8090fe608157	Cinderella: Revenant #97	Cinderella is a kind young woman who became a servant to her step-mother and step-sisters after her father died. She is a moral individual who chooses to treat others well even if they haven't done the same for her. Eventually she becomes a princess and strives to maintain her character and dignity as royalty.	https://lh3.googleusercontent.com/CX3GvvYgl7Vm_XWQ_D97mk0l3rWZ5lDgTlvaV90Ka1mU-8fUPnjJmtPUV_GEUDVyDSObkoZdOlRxJXJK7vC7_c02DhK5Ir7pasNuMA	https://lh3.googleusercontent.com/CX3GvvYgl7Vm_XWQ_D97mk0l3rWZ5lDgTlvaV90Ka1mU-8fUPnjJmtPUV_GEUDVyDSObkoZdOlRxJXJK7vC7_c02DhK5Ir7pasNuMA=s250	https://lh3.googleusercontent.com/CX3GvvYgl7Vm_XWQ_D97mk0l3rWZ5lDgTlvaV90Ka1mU-8fUPnjJmtPUV_GEUDVyDSObkoZdOlRxJXJK7vC7_c02DhK5Ir7pasNuMA=s128	https://alethea.ai/media/character_images/Cinderella_3TyCN6t.jpg	https://storage.opensea.io/files/6893c5748a61dacd514eb7bcdfc2edd0.mp4	https://alethea.ai/media/waiting_video/Cinderella.mp4	https://alethea.ai	\N	122396.820000000007	39	20	2022-01-25 12:47:23.625237
61	Nature	#NFT #first_nft #my_nft	2022-01-10 09:51:27.977603	2022-01-27 04:53:17.593044	129	15	0x4772331d243eb2ee23fa7361b492139773207307	CreatureToad #15	A creature and a toadz were left in the wallet for too long...	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g=s250	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g=s128	https://ipfs.io/ipfs/QmNy9Sh8PxGPRJpXVyC3ndmCLRvffvBcZQzg8vBcmtwMmW	\N	\N	\N	\N	\N	\N	78	2022-01-27 04:53:17.589537
76	Profile Name	kmdkmd	2022-01-18 05:46:03.974502	2022-02-07 06:55:10.414029	124	37290782357520938070490606247120271157146584960653533670334535950083758751745	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Nature	\N	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh=s250	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh=s128	\N	\N	\N	\N	\N	\N	\N	81	2022-02-07 06:55:10.407168
90	Profile Name	gcgcbvnv	2022-01-24 10:44:01.990911	2022-01-28 04:18:02.30848	129	8920650261906539551707462159971082682358764236800752495046729208848344678401	0x13b8e8bc3229d713c26b7862078ae7acd368314d	 gcjfg	\N	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw=s250	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw=s128	\N	\N	\N	\N	\N	\N	\N	72	2022-01-28 04:18:02.305047
73	Profile Name	demo check	2022-01-18 05:00:54.337275	2022-01-27 06:10:53.119827	124	37290782357520938070490606247120271157146584960653533670334535950083758751745	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Nature	\N	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh=s250	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh=s128	\N	\N	\N	\N	\N	\N	\N	12	2022-01-27 06:10:53.114417
74	Profile Name	sbhbhs	2022-01-18 05:18:38.398727	2022-01-25 08:30:58.895443	124	37290782357520938070490606247120271157146584960653533670334535956680828518401	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Mountain	\N	https://lh3.googleusercontent.com/zi-paysXrBkjl0O5ORQQ-MGHXQq0YNnSW0vRe8E66PbvfLs-Hfn4OQIkiFuUap01Xy4p8iJd09ly88Uq-UzVZyJ-iSeAnKkiQjaaFw	https://lh3.googleusercontent.com/zi-paysXrBkjl0O5ORQQ-MGHXQq0YNnSW0vRe8E66PbvfLs-Hfn4OQIkiFuUap01Xy4p8iJd09ly88Uq-UzVZyJ-iSeAnKkiQjaaFw=s250	https://lh3.googleusercontent.com/zi-paysXrBkjl0O5ORQQ-MGHXQq0YNnSW0vRe8E66PbvfLs-Hfn4OQIkiFuUap01Xy4p8iJd09ly88Uq-UzVZyJ-iSeAnKkiQjaaFw=s128	\N	\N	\N	\N	\N	\N	\N	31	2022-01-25 08:30:58.889713
75	Profile Name	govinda	2022-01-18 05:22:06.99674	2022-01-25 11:44:36.231814	124	37290782357520938070490606247120271157146584960653533670334535955581316890625	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Beauty of nature	\N	https://lh3.googleusercontent.com/yPYgU1zLsf2JyVTiFXpPvNkuYV7PkLWRCKY0Due-tQrtulzYtUjS4CbK33EVytcYOBFX9NlLywEH6e017iujZYvGHDjMoH2lLEiB8A	https://lh3.googleusercontent.com/yPYgU1zLsf2JyVTiFXpPvNkuYV7PkLWRCKY0Due-tQrtulzYtUjS4CbK33EVytcYOBFX9NlLywEH6e017iujZYvGHDjMoH2lLEiB8A=s250	https://lh3.googleusercontent.com/yPYgU1zLsf2JyVTiFXpPvNkuYV7PkLWRCKY0Due-tQrtulzYtUjS4CbK33EVytcYOBFX9NlLywEH6e017iujZYvGHDjMoH2lLEiB8A=s128	\N	\N	\N	\N	\N	\N	\N	25	2022-01-25 11:44:36.229442
\.


--
-- Data for Name: preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.preferences (id, seeking, discover_people, location, distance, height_type, body_type, religion, smoking, drinking, profile_bio_id, created_at, updated_at, friend, business, match_making, travel_partner, cross_path, age_range_start, age_range_end, height_range_start, height_range_end, account_id) FROM stdin;
\.


--
-- Data for Name: previously_owned_nfts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.previously_owned_nfts (id, token_id, owner_id, name, description, image_url, image_preview_url, image_thumbnail_url, image_original_url, animation_url, animation_original_url, external_link, asset_contract_address, permalink, asset_details, usd_amount, eth_amount, wallet_id, account_id, created_at, updated_at) FROM stdin;
1	8920650261906539551707462159971082682358764236800752495046729204450298167297	0x13b8e8bc3229d713c26b7862078ae7acd368314d	bear	\N	https://lh3.googleusercontent.com/xE3e4XddcnohiqfyuVVGdhLdXT4ANv2IIRK4G4i-rbHwD64jrk6thsYGi2CIYXmP0XaYw5JVyasjGA5XoV0NP4x-r-ej7D-fWtCr	https://lh3.googleusercontent.com/xE3e4XddcnohiqfyuVVGdhLdXT4ANv2IIRK4G4i-rbHwD64jrk6thsYGi2CIYXmP0XaYw5JVyasjGA5XoV0NP4x-r-ej7D-fWtCr=s250	https://lh3.googleusercontent.com/xE3e4XddcnohiqfyuVVGdhLdXT4ANv2IIRK4G4i-rbHwD64jrk6thsYGi2CIYXmP0XaYw5JVyasjGA5XoV0NP4x-r-ej7D-fWtCr=s128	\N	\N	\N	https://tenor.com/view/hug-bear-hugs-bear-hugs-big-bear-gif-9878172	\N	\N	\N	\N	\N	71	129	2022-01-05 10:37:29.363076	2022-01-05 10:37:29.363076
2	8920650261906539551707462159971082682358764236800752495046729201151763283969	0x13b8e8bc3229d713c26b7862078ae7acd368314d	asdfasdf	\N	https://lh3.googleusercontent.com/iNwcCD7hxHHxouwYRSwnfdbzuPvtDFAY9njF9afgRHTlcMi6O2SazVN6NwH10ZyyfMAmKuh3PtyUq553BIxs0b22WCYH4mkrTBMjWa8	https://lh3.googleusercontent.com/iNwcCD7hxHHxouwYRSwnfdbzuPvtDFAY9njF9afgRHTlcMi6O2SazVN6NwH10ZyyfMAmKuh3PtyUq553BIxs0b22WCYH4mkrTBMjWa8=s250	https://lh3.googleusercontent.com/iNwcCD7hxHHxouwYRSwnfdbzuPvtDFAY9njF9afgRHTlcMi6O2SazVN6NwH10ZyyfMAmKuh3PtyUq553BIxs0b22WCYH4mkrTBMjWa8=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	71	129	2022-01-05 10:37:29.723662	2022-01-05 10:37:29.723662
3	8920650261906539551707462159971082682358764236800752495046729205549809795073	0x13b8e8bc3229d713c26b7862078ae7acd368314d	600*400	\N	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q=s250	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	71	129	2022-01-05 10:37:30.874982	2022-01-05 10:37:30.874982
4	8920650261906539551707462159971082682358764236800752495046729203350786539521	0x13b8e8bc3229d713c26b7862078ae7acd368314d	fjfgjfg	\N	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw=s250	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	71	129	2022-01-05 10:37:30.968344	2022-01-05 10:37:30.968344
5	8920650261906539551707462159971082682358764236800752495046729206649321422849	0x13b8e8bc3229d713c26b7862078ae7acd368314d	test	\N	https://lh3.googleusercontent.com/vANIDQHiP69JdSyUWWjdeYIVnOisFyOG4vsj_QCZj6iDQzqpmQzyiGdxkuPcjZ0Y21rDwAlcor8sVXx_c3qZXRZT-Ppk5QMBAHP-0Q	https://lh3.googleusercontent.com/vANIDQHiP69JdSyUWWjdeYIVnOisFyOG4vsj_QCZj6iDQzqpmQzyiGdxkuPcjZ0Y21rDwAlcor8sVXx_c3qZXRZT-Ppk5QMBAHP-0Q=s250	https://lh3.googleusercontent.com/vANIDQHiP69JdSyUWWjdeYIVnOisFyOG4vsj_QCZj6iDQzqpmQzyiGdxkuPcjZ0Y21rDwAlcor8sVXx_c3qZXRZT-Ppk5QMBAHP-0Q=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	71	129	2022-01-05 10:37:32.096813	2022-01-05 10:37:32.096813
6	8920650261906539551707462159971082682358764236800752495046729200052251656193	0x13b8e8bc3229d713c26b7862078ae7acd368314d	test	\N	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw=s250	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	71	129	2022-01-05 15:58:43.044752	2022-01-05 15:58:43.044752
7	8920650261906539551707462159971082682358764236800752495046729202251274911745	0x13b8e8bc3229d713c26b7862078ae7acd368314d	test2	\N	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw=s250	https://lh3.googleusercontent.com/tlvY_4YxoSM61Dy7DuOzOUZH3y-tn0e6jHaAhCLA5b2UqeTnXWSsB_ABvV8CzWnYhquPSAPnKDr3C7jLurpKxjmPBAo7TR_LqxTvyw=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	71	129	2022-01-06 11:51:47.04539	2022-01-06 11:51:47.04539
8	8920650261906539551707462159971082682358764236800752495046729207748833050625	0x13b8e8bc3229d713c26b7862078ae7acd368314d	600*400 test nft	\N	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q=s250	https://lh3.googleusercontent.com/ysR-nk0rhnWUEAoo1EMf_5FkwWOmnrMDiOdKIsVuE3OwrSUqFW8-WZQ09_9RhTosDFq2XPP0tXS35v7i6cJcaDgQVhbOWWP8pu-G0Q=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	71	129	2022-01-06 11:59:11.802819	2022-01-06 11:59:11.802819
12	48378650749719933251351117953539765029019693784285209044920607886338466775041	0x6af558913a6b3032f50ffe1cc4971d711230d50e	Jump	\N	https://lh3.googleusercontent.com/jxvkZgSv8ljoziQycXVXNQO59x8DshkIPPVZvDpFlBPgSg4jjDUZKOYmZtLKV6kYHlNn2jts0kmUnRoDWP7hiqW5pqFcl9cceSfO	https://lh3.googleusercontent.com/jxvkZgSv8ljoziQycXVXNQO59x8DshkIPPVZvDpFlBPgSg4jjDUZKOYmZtLKV6kYHlNn2jts0kmUnRoDWP7hiqW5pqFcl9cceSfO=s250	https://lh3.googleusercontent.com/jxvkZgSv8ljoziQycXVXNQO59x8DshkIPPVZvDpFlBPgSg4jjDUZKOYmZtLKV6kYHlNn2jts0kmUnRoDWP7hiqW5pqFcl9cceSfO=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	68	167	2022-01-17 17:15:52.970888	2022-01-17 17:15:52.970888
10	15	0x4772331d243eb2ee23fa7361b492139773207307	CreatureToad #15	A creature and a toadz were left in the wallet for too long...	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g=s250	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g=s128	https://ipfs.io/ipfs/QmNy9Sh8PxGPRJpXVyC3ndmCLRvffvBcZQzg8vBcmtwMmW	\N	\N	\N	\N	\N	\N	\N	\N	80	129	2022-01-11 01:01:08.123935	2022-02-08 00:06:35.670062
9	15	0x4772331d243eb2ee23fa7361b492139773207307	CreatureToad #15	A creature and a toadz were left in the wallet for too long...	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g=s250	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g=s128	https://ipfs.io/ipfs/QmNy9Sh8PxGPRJpXVyC3ndmCLRvffvBcZQzg8vBcmtwMmW	\N	\N	\N	\N	\N	\N	\N	\N	80	129	2022-01-11 01:00:17.495432	2022-01-31 00:08:21.477235
13	4520	0x0a42e79c81397c0e412ab07f68088c4905b772a9	Rich Kid #4520	By hip-hop artist, Rich the Kid, RICH KIDS is a collection of 7,427 cartoon-styled, blockchain baby bad asses, that Plug Walks the trust fund lifestyle to the hood!	https://lh3.googleusercontent.com/jfNMdHkn9U0ttG-4rYkYdpoTRUmXU0uP1XXZbfsqaXyAiXtT-nJb7-1hml6zII8K7nQ-fcw8lN-6VXJmdKEnwgB3EzaPO0288P2Y	https://lh3.googleusercontent.com/jfNMdHkn9U0ttG-4rYkYdpoTRUmXU0uP1XXZbfsqaXyAiXtT-nJb7-1hml6zII8K7nQ-fcw8lN-6VXJmdKEnwgB3EzaPO0288P2Y=s250	https://lh3.googleusercontent.com/jfNMdHkn9U0ttG-4rYkYdpoTRUmXU0uP1XXZbfsqaXyAiXtT-nJb7-1hml6zII8K7nQ-fcw8lN-6VXJmdKEnwgB3EzaPO0288P2Y=s128	https://ipfs.io/ipfs/QmP6gw5JzJ8HWKcdtDBY5v6Hn61P9578Pz3shYFv4t6d7q/4520.png	\N	\N	\N	\N	\N	\N	3311.80000000000018	1	69	133	2022-01-17 17:15:54.595502	2022-01-17 17:15:54.595502
14	39841589757375987020179860192791172453541796315291545094567323953149398482945	0x58158a69cfeef287216526d59dd27ffd199e255f	Some	\N	https://lh3.googleusercontent.com/MggAMfqHhU90wE-5UtzkmmyFu5uJPyeaCTYh-BRRp0Ibok---V8PktuMTEB7m741_wFStCqut8e_VOl2jVtioXMmGtyy5cRb0EpOTQ	https://lh3.googleusercontent.com/MggAMfqHhU90wE-5UtzkmmyFu5uJPyeaCTYh-BRRp0Ibok---V8PktuMTEB7m741_wFStCqut8e_VOl2jVtioXMmGtyy5cRb0EpOTQ=s250	https://lh3.googleusercontent.com/MggAMfqHhU90wE-5UtzkmmyFu5uJPyeaCTYh-BRRp0Ibok---V8PktuMTEB7m741_wFStCqut8e_VOl2jVtioXMmGtyy5cRb0EpOTQ=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	72	136	2022-01-17 17:15:54.683849	2022-01-17 17:15:54.683849
15	24501000788968321885223797920636612367815649423775425214830530321270735634433	0x362b13343e901f61753c8dbc9baba1aa47f2c83f	Nature	\N	https://lh3.googleusercontent.com/Yd823EDSIi2Wmj-jB5QmBkcNXlPTdXui1JMK2NP6MjXwaE0AlaslVNd5Xuxs8BmLwfmI0Tc3YgE2fw7Ou0RMoiAn8vSN6LZXnjKJrQ	https://lh3.googleusercontent.com/Yd823EDSIi2Wmj-jB5QmBkcNXlPTdXui1JMK2NP6MjXwaE0AlaslVNd5Xuxs8BmLwfmI0Tc3YgE2fw7Ou0RMoiAn8vSN6LZXnjKJrQ=s250	https://lh3.googleusercontent.com/Yd823EDSIi2Wmj-jB5QmBkcNXlPTdXui1JMK2NP6MjXwaE0AlaslVNd5Xuxs8BmLwfmI0Tc3YgE2fw7Ou0RMoiAn8vSN6LZXnjKJrQ=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	76	137	2022-01-17 17:15:55.054829	2022-01-17 17:15:55.054829
16	37290782357520938070490606247120271157146584960653533670334535951183270379521	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	View	\N	https://lh3.googleusercontent.com/G13qqnqbTBnbVKzkt58kBfbvDyX2iJ6G0p2RS9PCz4viXbD_rQoNr2vspKOZhHaRD8YbVHD4ezY0g-eaU6utEdr1SxR7QZjy7U9bBQ	https://lh3.googleusercontent.com/G13qqnqbTBnbVKzkt58kBfbvDyX2iJ6G0p2RS9PCz4viXbD_rQoNr2vspKOZhHaRD8YbVHD4ezY0g-eaU6utEdr1SxR7QZjy7U9bBQ=s250	https://lh3.googleusercontent.com/G13qqnqbTBnbVKzkt58kBfbvDyX2iJ6G0p2RS9PCz4viXbD_rQoNr2vspKOZhHaRD8YbVHD4ezY0g-eaU6utEdr1SxR7QZjy7U9bBQ=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	78	124	2022-01-17 17:15:55.096953	2022-01-17 17:15:55.096953
17	37290782357520938070490606247120271157146584960653533670334535956680828518401	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Mountain	\N	https://lh3.googleusercontent.com/zi-paysXrBkjl0O5ORQQ-MGHXQq0YNnSW0vRe8E66PbvfLs-Hfn4OQIkiFuUap01Xy4p8iJd09ly88Uq-UzVZyJ-iSeAnKkiQjaaFw	https://lh3.googleusercontent.com/zi-paysXrBkjl0O5ORQQ-MGHXQq0YNnSW0vRe8E66PbvfLs-Hfn4OQIkiFuUap01Xy4p8iJd09ly88Uq-UzVZyJ-iSeAnKkiQjaaFw=s250	https://lh3.googleusercontent.com/zi-paysXrBkjl0O5ORQQ-MGHXQq0YNnSW0vRe8E66PbvfLs-Hfn4OQIkiFuUap01Xy4p8iJd09ly88Uq-UzVZyJ-iSeAnKkiQjaaFw=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	78	124	2022-01-17 17:15:55.196795	2022-01-17 17:15:55.196795
18	37290782357520938070490606247120271157146584960653533670334535955581316890625	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Beauty of nature	\N	https://lh3.googleusercontent.com/yPYgU1zLsf2JyVTiFXpPvNkuYV7PkLWRCKY0Due-tQrtulzYtUjS4CbK33EVytcYOBFX9NlLywEH6e017iujZYvGHDjMoH2lLEiB8A	https://lh3.googleusercontent.com/yPYgU1zLsf2JyVTiFXpPvNkuYV7PkLWRCKY0Due-tQrtulzYtUjS4CbK33EVytcYOBFX9NlLywEH6e017iujZYvGHDjMoH2lLEiB8A=s250	https://lh3.googleusercontent.com/yPYgU1zLsf2JyVTiFXpPvNkuYV7PkLWRCKY0Due-tQrtulzYtUjS4CbK33EVytcYOBFX9NlLywEH6e017iujZYvGHDjMoH2lLEiB8A=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	78	124	2022-01-17 17:15:55.293907	2022-01-17 17:15:55.293907
19	37290782357520938070490606247120271157146584960653533670334535952282782007297	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Greenary	\N	https://lh3.googleusercontent.com/XOs2KosuHFApZNwSW15ZzHJfHSUXmaTYlDobtyNVtvP8QJMCbTe-8zHzhYG-j_2VQ_AEVxPbcA3jvvKAuIRBhYv43wMrGbBLKAv032I	https://lh3.googleusercontent.com/XOs2KosuHFApZNwSW15ZzHJfHSUXmaTYlDobtyNVtvP8QJMCbTe-8zHzhYG-j_2VQ_AEVxPbcA3jvvKAuIRBhYv43wMrGbBLKAv032I=s250	https://lh3.googleusercontent.com/XOs2KosuHFApZNwSW15ZzHJfHSUXmaTYlDobtyNVtvP8QJMCbTe-8zHzhYG-j_2VQ_AEVxPbcA3jvvKAuIRBhYv43wMrGbBLKAv032I=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	78	124	2022-01-17 17:15:55.38528	2022-01-17 17:15:55.38528
20	78662940693526771398492373862579024926097613520112440480537826112831253118977	0xade9a58a8411993ef3f6348d5e566cd94b2f2ed9	Welcome	\N	https://lh3.googleusercontent.com/rp-LomZ-x3CCPh1qVNmn7hyhb48X5fHR-ecKf9Q3ZXIk58EWNuTBZHZ2S1B29_oVMmg61sPZX23w8CcQwxz-d56CqTGCJvmWMsIZ	https://lh3.googleusercontent.com/rp-LomZ-x3CCPh1qVNmn7hyhb48X5fHR-ecKf9Q3ZXIk58EWNuTBZHZ2S1B29_oVMmg61sPZX23w8CcQwxz-d56CqTGCJvmWMsIZ=s250	https://lh3.googleusercontent.com/rp-LomZ-x3CCPh1qVNmn7hyhb48X5fHR-ecKf9Q3ZXIk58EWNuTBZHZ2S1B29_oVMmg61sPZX23w8CcQwxz-d56CqTGCJvmWMsIZ=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	73	136	2022-01-17 17:15:55.457938	2022-01-17 17:15:55.457938
21	78662940693526771398492373862579024926097613520112440480537826113930764746753	0xade9a58a8411993ef3f6348d5e566cd94b2f2ed9	Bug	\N	https://lh3.googleusercontent.com/fjlzeGKK6MFWWVgGfkciY1dFMeb7YU2NC07fmaYB9s_jVTgKCK3rtD6xagMfvbfjf_DBeYfu_Ts9ji4MGbGLltchBXPeHgiiQITV	https://lh3.googleusercontent.com/fjlzeGKK6MFWWVgGfkciY1dFMeb7YU2NC07fmaYB9s_jVTgKCK3rtD6xagMfvbfjf_DBeYfu_Ts9ji4MGbGLltchBXPeHgiiQITV=s250	https://lh3.googleusercontent.com/fjlzeGKK6MFWWVgGfkciY1dFMeb7YU2NC07fmaYB9s_jVTgKCK3rtD6xagMfvbfjf_DBeYfu_Ts9ji4MGbGLltchBXPeHgiiQITV=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	73	136	2022-01-17 17:15:55.568818	2022-01-17 17:15:55.568818
22	37290782357520938070490606247120271157146584960653533670334535953382293635073	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Fences	\N	https://lh3.googleusercontent.com/Cp1qBu2k3GKvstStjVMv1Tr_MwTutkw55cJVwVJzGtm5--Xy0A-P5zq34UDvaPhLxsVJ04W9dSAw2RxPRNQ1f1MRGjgFaiGRVCAl	https://lh3.googleusercontent.com/Cp1qBu2k3GKvstStjVMv1Tr_MwTutkw55cJVwVJzGtm5--Xy0A-P5zq34UDvaPhLxsVJ04W9dSAw2RxPRNQ1f1MRGjgFaiGRVCAl=s250	https://lh3.googleusercontent.com/Cp1qBu2k3GKvstStjVMv1Tr_MwTutkw55cJVwVJzGtm5--Xy0A-P5zq34UDvaPhLxsVJ04W9dSAw2RxPRNQ1f1MRGjgFaiGRVCAl=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	78	124	2022-01-17 17:15:55.626624	2022-01-17 17:15:55.626624
23	37290782357520938070490606247120271157146584960653533670334535954481805262849	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Nature in book	\N	https://lh3.googleusercontent.com/Aa0MdSmh5FsDaWlKW8HaMVkl8C3u4FJh78RUHI4gHKuTTM8Sbyg9pyxcq3sQX-RBdKrwE9K4f6MgC0air_-yMkU8znRRcX-D4vM-SA	https://lh3.googleusercontent.com/Aa0MdSmh5FsDaWlKW8HaMVkl8C3u4FJh78RUHI4gHKuTTM8Sbyg9pyxcq3sQX-RBdKrwE9K4f6MgC0air_-yMkU8znRRcX-D4vM-SA=s250	https://lh3.googleusercontent.com/Aa0MdSmh5FsDaWlKW8HaMVkl8C3u4FJh78RUHI4gHKuTTM8Sbyg9pyxcq3sQX-RBdKrwE9K4f6MgC0air_-yMkU8znRRcX-D4vM-SA=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	78	124	2022-01-17 17:15:55.757332	2022-01-17 17:15:55.757332
24	37290782357520938070490606247120271157146584960653533670334535950083758751745	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	Nature	\N	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh=s250	https://lh3.googleusercontent.com/egxRf-gpT2gYILwGLhvvd04Byd1-nrn3jN5stfihQ4hwPpuUPywNsgvd_Y2HlT1l0Lpl6Bu8ulNMLeia5KNVCnxxsLwgQbqyWsMh=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	78	124	2022-01-17 17:15:55.815652	2022-01-17 17:15:55.815652
25	22078292088351105558096269372419564704342872007289489882381637826028142329857	0x30cfded81b9c4a2d408a73fbdc9e3470f8019a60	Sunglasses  black	\N	https://lh3.googleusercontent.com/93HtUX3CPLcaDCz-CO8hK_NFVoq5BXK8BoNxRUF9pbdMRhiYr6iplTMgevJ1UmtlSUJGrDUf1rz0SUzCpsfPf47rYoMdnu0MEsupqQ	https://lh3.googleusercontent.com/93HtUX3CPLcaDCz-CO8hK_NFVoq5BXK8BoNxRUF9pbdMRhiYr6iplTMgevJ1UmtlSUJGrDUf1rz0SUzCpsfPf47rYoMdnu0MEsupqQ=s250	https://lh3.googleusercontent.com/93HtUX3CPLcaDCz-CO8hK_NFVoq5BXK8BoNxRUF9pbdMRhiYr6iplTMgevJ1UmtlSUJGrDUf1rz0SUzCpsfPf47rYoMdnu0MEsupqQ=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	75	248	2022-01-17 17:15:55.97396	2022-01-17 17:15:55.97396
26	24501000788968321885223797920636612367815649423775425214830530322370247262209	0x362b13343e901f61753c8dbc9baba1aa47f2c83f	Smile	\N	https://lh3.googleusercontent.com/IW-3kCRz_WkTuT-U4JstDNW8WGDnA7a4edzx-qNApdx5IuyWjaFLhJk0KqqFo_eETEny9_ObsznOSv2623DhzjYb1VrXwO6nnwYVzA	https://lh3.googleusercontent.com/IW-3kCRz_WkTuT-U4JstDNW8WGDnA7a4edzx-qNApdx5IuyWjaFLhJk0KqqFo_eETEny9_ObsznOSv2623DhzjYb1VrXwO6nnwYVzA=s250	https://lh3.googleusercontent.com/IW-3kCRz_WkTuT-U4JstDNW8WGDnA7a4edzx-qNApdx5IuyWjaFLhJk0KqqFo_eETEny9_ObsznOSv2623DhzjYb1VrXwO6nnwYVzA=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	76	137	2022-01-17 17:15:56.020533	2022-01-17 17:15:56.020533
27	78662940693526771398492373862579024926097613520112440480537826116129788002305	0xade9a58a8411993ef3f6348d5e566cd94b2f2ed9	Smile	\N	https://lh3.googleusercontent.com/Dl-QHwryqB_30fXxFI1odRw8eo7WFY4R5peLW3AaYUi5CJ1u3Genl_iizMW-lxjRVODt5DfsJm_q4y5moicue2zczsnPEZj6XcKl	https://lh3.googleusercontent.com/Dl-QHwryqB_30fXxFI1odRw8eo7WFY4R5peLW3AaYUi5CJ1u3Genl_iizMW-lxjRVODt5DfsJm_q4y5moicue2zczsnPEZj6XcKl=s250	https://lh3.googleusercontent.com/Dl-QHwryqB_30fXxFI1odRw8eo7WFY4R5peLW3AaYUi5CJ1u3Genl_iizMW-lxjRVODt5DfsJm_q4y5moicue2zczsnPEZj6XcKl=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	73	136	2022-01-17 17:15:56.112643	2022-01-17 17:15:56.112643
28	1924	0x66A0670E8196B2055F4D7AF367e6ee52395Dd26D	Rich Kid #1924	By hip-hop artist, Rich the Kid, RICH KIDS is a collection of 7,427 cartoon-styled, blockchain baby bad asses, that Plug Walks the trust fund lifestyle to the hood!	https://lh3.googleusercontent.com/xg463baBEqMpyTrfW9qhy6F5VbcTHexspHQfRKcNA527zfvF28sSYOSfwHaYH9QI1WoJMP0MbWGGBto3yTjHVvge3tZN5VUty9ujOg	https://lh3.googleusercontent.com/xg463baBEqMpyTrfW9qhy6F5VbcTHexspHQfRKcNA527zfvF28sSYOSfwHaYH9QI1WoJMP0MbWGGBto3yTjHVvge3tZN5VUty9ujOg=s250	https://lh3.googleusercontent.com/xg463baBEqMpyTrfW9qhy6F5VbcTHexspHQfRKcNA527zfvF28sSYOSfwHaYH9QI1WoJMP0MbWGGBto3yTjHVvge3tZN5VUty9ujOg=s128	https://ipfs.io/ipfs/QmP6gw5JzJ8HWKcdtDBY5v6Hn61P9578Pz3shYFv4t6d7q/1924.png	\N	\N	\N	\N	\N	\N	3312.44000000000005	1	58	133	2022-01-17 17:15:56.221466	2022-01-17 17:15:56.221466
29	94917191697056562607218248236920854735255553739488847967192288868384276217857	0xd1d93a087cab89c0d9401a096ce7adf7c362f492	Test	\N	https://lh3.googleusercontent.com/nhXO_JevaFNqExYswhPoAYrPLC9JvhdsZgizigBbncE4oTxrNh-0aX3M49uuhXEb9eAHrBnLi97vkRhLopUdC0v-jDkoO_8YQAMg	https://lh3.googleusercontent.com/nhXO_JevaFNqExYswhPoAYrPLC9JvhdsZgizigBbncE4oTxrNh-0aX3M49uuhXEb9eAHrBnLi97vkRhLopUdC0v-jDkoO_8YQAMg=s250	https://lh3.googleusercontent.com/nhXO_JevaFNqExYswhPoAYrPLC9JvhdsZgizigBbncE4oTxrNh-0aX3M49uuhXEb9eAHrBnLi97vkRhLopUdC0v-jDkoO_8YQAMg=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	82	370	2022-01-17 17:15:56.370055	2022-01-17 17:15:56.370055
30	94917191697056562607218248236920854735255553739488847967192288867284764590081	0xd1d93a087cab89c0d9401a096ce7adf7c362f492	!"№	\N	https://lh3.googleusercontent.com/Fe157nTILmGkxMrGR73wsbgOWwvPySY6Z3SPz1LakhP5PwpqbPi5dQ1BLewb8WmJuwzsZFmJTUkEC4lfMGpPmbfqRwUjnGsS_LuFtw	https://lh3.googleusercontent.com/Fe157nTILmGkxMrGR73wsbgOWwvPySY6Z3SPz1LakhP5PwpqbPi5dQ1BLewb8WmJuwzsZFmJTUkEC4lfMGpPmbfqRwUjnGsS_LuFtw=s250	https://lh3.googleusercontent.com/Fe157nTILmGkxMrGR73wsbgOWwvPySY6Z3SPz1LakhP5PwpqbPi5dQ1BLewb8WmJuwzsZFmJTUkEC4lfMGpPmbfqRwUjnGsS_LuFtw=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	82	370	2022-01-17 17:15:56.420471	2022-01-17 17:15:56.420471
31	94917191697056562607218248236920854735255553739488847967192288870583299473409	0xd1d93a087cab89c0d9401a096ce7adf7c362f492	Cat	\N	https://lh3.googleusercontent.com/5fXeAYJEZ8yVRsismpzgwp2qifCx6bXLV0_lrWRNbH2JRrAPQipFo_Z4rrumO6Z2SNlRjiIPHd-Wvw-e4NZje_L9qvElBf1aL9SA	https://lh3.googleusercontent.com/5fXeAYJEZ8yVRsismpzgwp2qifCx6bXLV0_lrWRNbH2JRrAPQipFo_Z4rrumO6Z2SNlRjiIPHd-Wvw-e4NZje_L9qvElBf1aL9SA=s250	https://lh3.googleusercontent.com/5fXeAYJEZ8yVRsismpzgwp2qifCx6bXLV0_lrWRNbH2JRrAPQipFo_Z4rrumO6Z2SNlRjiIPHd-Wvw-e4NZje_L9qvElBf1aL9SA=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	82	370	2022-01-17 17:15:56.476923	2022-01-17 17:15:56.476923
32	94917191697056562607218248236920854735255553739488847967192288869483787845633	0xd1d93a087cab89c0d9401a096ce7adf7c362f492	Some girl	\N	https://lh3.googleusercontent.com/uWsWcdme1qvIamhfx8O0dzE5ovC01wCpKiY59xG0tbMOKTnJ0EJFbdLDpdiBbqJrP1eHZjAFfyWt9iGvESM8lxyiBSQ0CVKEIt1yqe4	https://lh3.googleusercontent.com/uWsWcdme1qvIamhfx8O0dzE5ovC01wCpKiY59xG0tbMOKTnJ0EJFbdLDpdiBbqJrP1eHZjAFfyWt9iGvESM8lxyiBSQ0CVKEIt1yqe4=s250	https://lh3.googleusercontent.com/uWsWcdme1qvIamhfx8O0dzE5ovC01wCpKiY59xG0tbMOKTnJ0EJFbdLDpdiBbqJrP1eHZjAFfyWt9iGvESM8lxyiBSQ0CVKEIt1yqe4=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	82	370	2022-01-17 17:15:56.518217	2022-01-17 17:15:56.518217
33	88937684538989715579577518373334711287579191296089263723076787610456372019201	0xc4a0f21132fd9d2b49c150d0888d5c01a14020bd	Owl	\N	https://lh3.googleusercontent.com/nRKSfj1HZ845OXvGvNEUBgFPLTHPauskpIfoR_1u-1qhtEKFr058B-4PkTaglOda2gK1UivRzkcgm3WebZ6nUL7HCmZtKtbQhDh-Og	https://lh3.googleusercontent.com/nRKSfj1HZ845OXvGvNEUBgFPLTHPauskpIfoR_1u-1qhtEKFr058B-4PkTaglOda2gK1UivRzkcgm3WebZ6nUL7HCmZtKtbQhDh-Og=s250	https://lh3.googleusercontent.com/nRKSfj1HZ845OXvGvNEUBgFPLTHPauskpIfoR_1u-1qhtEKFr058B-4PkTaglOda2gK1UivRzkcgm3WebZ6nUL7HCmZtKtbQhDh-Og=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	85	376	2022-01-17 17:15:56.582866	2022-01-17 17:15:56.582866
34	97	0x3ee965ae147e95aaebb7aff6e04e8090fe608157	Cinderella: Revenant #97	Cinderella is a kind young woman who became a servant to her step-mother and step-sisters after her father died. She is a moral individual who chooses to treat others well even if they haven't done the same for her. Eventually she becomes a princess and strives to maintain her character and dignity as royalty.	https://lh3.googleusercontent.com/CX3GvvYgl7Vm_XWQ_D97mk0l3rWZ5lDgTlvaV90Ka1mU-8fUPnjJmtPUV_GEUDVyDSObkoZdOlRxJXJK7vC7_c02DhK5Ir7pasNuMA	https://lh3.googleusercontent.com/CX3GvvYgl7Vm_XWQ_D97mk0l3rWZ5lDgTlvaV90Ka1mU-8fUPnjJmtPUV_GEUDVyDSObkoZdOlRxJXJK7vC7_c02DhK5Ir7pasNuMA=s250	https://lh3.googleusercontent.com/CX3GvvYgl7Vm_XWQ_D97mk0l3rWZ5lDgTlvaV90Ka1mU-8fUPnjJmtPUV_GEUDVyDSObkoZdOlRxJXJK7vC7_c02DhK5Ir7pasNuMA=s128	https://alethea.ai/media/character_images/Cinderella_3TyCN6t.jpg	https://storage.opensea.io/files/6893c5748a61dacd514eb7bcdfc2edd0.mp4	https://alethea.ai/media/waiting_video/Cinderella.mp4	https://alethea.ai	\N	\N	\N	129246.389999999999	39	79	129	2022-01-17 17:15:56.623164	2022-01-17 17:15:56.623164
35	111982549053372676219054687507750154555544423443438340520672469305969189322753	0xf793e06d2f2b899842f58c85279abeb672b2abb0	SPIDER	\N	https://lh3.googleusercontent.com/bC1DGzesO5eA6lzGiEnxcyJoy70OhkZ8Yk-K8ccDnWScYH1JZGyerItte6kejrS31qujo1ahy-lk20ZQH_nULU_viKg8L6AkeE83	https://lh3.googleusercontent.com/bC1DGzesO5eA6lzGiEnxcyJoy70OhkZ8Yk-K8ccDnWScYH1JZGyerItte6kejrS31qujo1ahy-lk20ZQH_nULU_viKg8L6AkeE83=s250	https://lh3.googleusercontent.com/bC1DGzesO5eA6lzGiEnxcyJoy70OhkZ8Yk-K8ccDnWScYH1JZGyerItte6kejrS31qujo1ahy-lk20ZQH_nULU_viKg8L6AkeE83=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	60	193	2022-01-18 02:17:39.860299	2022-01-18 02:17:39.860299
36	4520	0x0a42e79c81397c0e412ab07f68088c4905b772a9	Rich Kid #4520	By hip-hop artist, Rich the Kid, RICH KIDS is a collection of 7,427 cartoon-styled, blockchain baby bad asses, that Plug Walks the trust fund lifestyle to the hood!	https://lh3.googleusercontent.com/jfNMdHkn9U0ttG-4rYkYdpoTRUmXU0uP1XXZbfsqaXyAiXtT-nJb7-1hml6zII8K7nQ-fcw8lN-6VXJmdKEnwgB3EzaPO0288P2Y	https://lh3.googleusercontent.com/jfNMdHkn9U0ttG-4rYkYdpoTRUmXU0uP1XXZbfsqaXyAiXtT-nJb7-1hml6zII8K7nQ-fcw8lN-6VXJmdKEnwgB3EzaPO0288P2Y=s250	https://lh3.googleusercontent.com/jfNMdHkn9U0ttG-4rYkYdpoTRUmXU0uP1XXZbfsqaXyAiXtT-nJb7-1hml6zII8K7nQ-fcw8lN-6VXJmdKEnwgB3EzaPO0288P2Y=s128	https://ipfs.io/ipfs/QmP6gw5JzJ8HWKcdtDBY5v6Hn61P9578Pz3shYFv4t6d7q/4520.png	\N	\N	\N	\N	\N	\N	3211.23000000000002	1	69	133	2022-01-18 02:17:41.22687	2022-01-18 02:17:41.22687
37	15783352966874752169781050108002202296622710187720993940958879536061809164289	0x22e50fab0832b81f24609232d4fa3ae71fac0534	fire	\N	https://lh3.googleusercontent.com/fpN_tVsKzBroew6ns8SXkf4DwOT07jisw3j0AYcxmuRDPGo4X1MyP__hkXf1oBOAZhe5Nxx8OpfB33LVgdpzsvZ4Rr7_totOw81H	https://lh3.googleusercontent.com/fpN_tVsKzBroew6ns8SXkf4DwOT07jisw3j0AYcxmuRDPGo4X1MyP__hkXf1oBOAZhe5Nxx8OpfB33LVgdpzsvZ4Rr7_totOw81H=s250	https://lh3.googleusercontent.com/fpN_tVsKzBroew6ns8SXkf4DwOT07jisw3j0AYcxmuRDPGo4X1MyP__hkXf1oBOAZhe5Nxx8OpfB33LVgdpzsvZ4Rr7_totOw81H=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	70	124	2022-01-18 02:17:41.263802	2022-01-18 02:17:41.263802
38	8920650261906539551707462159971082682358764236800752495046729211047367933953	0x13b8e8bc3229d713c26b7862078ae7acd368314d	test nft 2	\N	https://lh3.googleusercontent.com/VBEKbjU3flxS_v4P6c_6G9Jawa8BOLP1GKDQ8PX-9mmsEXK_gg7DefH_RA8UA-Q2OUUEGiR2DmN2_qJ1MLRIqwNKMUOwvBw1_3syJw	https://lh3.googleusercontent.com/VBEKbjU3flxS_v4P6c_6G9Jawa8BOLP1GKDQ8PX-9mmsEXK_gg7DefH_RA8UA-Q2OUUEGiR2DmN2_qJ1MLRIqwNKMUOwvBw1_3syJw=s250	https://lh3.googleusercontent.com/VBEKbjU3flxS_v4P6c_6G9Jawa8BOLP1GKDQ8PX-9mmsEXK_gg7DefH_RA8UA-Q2OUUEGiR2DmN2_qJ1MLRIqwNKMUOwvBw1_3syJw=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	71	129	2022-01-19 00:00:41.609393	2022-01-19 00:00:41.609393
39	53043543350033854982381974050717097219780962640427547974224833759867205320705	0xacd7c2c7f4dc72368b0ffafa401946e6f47ca73e	Gogh Dog #1833	I hope it becomes a universal currency.❤	https://lh3.googleusercontent.com/jT35YQI28U_CIDcKhhZe__9gMwvOOnJYXQoxWuIbS99JYEvL42RFLxKbOoNCX3octEcHjkiuWJpk6KiKqNHXBiy6zGEs0m4JfOGMopE	https://lh3.googleusercontent.com/jT35YQI28U_CIDcKhhZe__9gMwvOOnJYXQoxWuIbS99JYEvL42RFLxKbOoNCX3octEcHjkiuWJpk6KiKqNHXBiy6zGEs0m4JfOGMopE=s250	https://lh3.googleusercontent.com/jT35YQI28U_CIDcKhhZe__9gMwvOOnJYXQoxWuIbS99JYEvL42RFLxKbOoNCX3octEcHjkiuWJpk6KiKqNHXBiy6zGEs0m4JfOGMopE=s128	\N	\N	\N	\N	\N	\N	\N	3165.51999999999998	1	1	129	2022-01-20 00:00:08.419875	2022-01-20 00:00:08.419875
40	22078292088351105558096269372419564704342872007289489882381637826028142329857	0x30cfded81b9c4a2d408a73fbdc9e3470f8019a60	QA	\N	https://lh3.googleusercontent.com/iOTqsR4NlaUho53zpya2SmGKRu5c0jultOfiEizNb4ujItB-fhi0QoVN-HKXOi1pZIJpvzakl63WorOscdrSbrpqQecJIebttCQ0	https://lh3.googleusercontent.com/iOTqsR4NlaUho53zpya2SmGKRu5c0jultOfiEizNb4ujItB-fhi0QoVN-HKXOi1pZIJpvzakl63WorOscdrSbrpqQecJIebttCQ0=s250	https://lh3.googleusercontent.com/iOTqsR4NlaUho53zpya2SmGKRu5c0jultOfiEizNb4ujItB-fhi0QoVN-HKXOi1pZIJpvzakl63WorOscdrSbrpqQecJIebttCQ0=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	75	248	2022-01-20 00:00:08.655705	2022-01-20 00:00:08.655705
41	8920650261906539551707462159971082682358764236800752495046729212146879561729	0x13b8e8bc3229d713c26b7862078ae7acd368314d	teddy	\N	https://lh3.googleusercontent.com/2-xOHok8jry8C1pa5t2gnHXI8yNhqV5pOqQEQVi8w7XicT2FpGIoyOgsfisoVg2EONiVvcW-V6XrPDdF1nAAMIdxsoildSFlu7IUAqU	https://lh3.googleusercontent.com/2-xOHok8jry8C1pa5t2gnHXI8yNhqV5pOqQEQVi8w7XicT2FpGIoyOgsfisoVg2EONiVvcW-V6XrPDdF1nAAMIdxsoildSFlu7IUAqU=s250	https://lh3.googleusercontent.com/2-xOHok8jry8C1pa5t2gnHXI8yNhqV5pOqQEQVi8w7XicT2FpGIoyOgsfisoVg2EONiVvcW-V6XrPDdF1nAAMIdxsoildSFlu7IUAqU=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	71	129	2022-01-20 00:00:09.689849	2022-01-20 00:00:09.689849
42	76822989335434484463650117884557904463548554515250910540000741672058596884481	0x1bf98ce92b915d8246a0eac8aa3b9ae682259dee	Castlevania: Circle of the Moon - Main Visual Art Global ver.	【Item Description】\nWe have picked up the main visual art from the Global version of Castlevania: Circle of the Moon. The art illustrates the protagonist Nathan's determination to save his master, with the Dracula’s Castle in the background.\n\n【First-Purchaser Campaign】\nYou will be entitled to have your nickname posted on our website (https://www.konami.com/games/memorial-nft/) as the first NFT purchaser.\nPlease check (https://www.konami.com/games/memorial-nft/) for details.\n\n【Terms of Use】\n・There are no other authorities established for the purchaser under this agreement for the NFT concluded between the Purchaser and Konami Digital Entertainment Co., Ltd. (“Konami”) than the right of usage of the NFT and the purchaser benefits as separately described outside this Terms of Use in OpenSea, a platform used in relation to this agreement (i.e. the right granted to the person who purchased the NFT from Konami to indicate the fact that the purchaser purchased the NFT using the nickname on the Konami homepage (https://www.konami.com/games/memorial-nft/). \n・The purchaser’s nickname will be displayed when Konami deems the nickname to be reasonable based on social standards (e.g. a nickname containing information that can be used to identify a specific individual is unacceptable).  Also, in the event a nickname is not reported by the date indicated by Konami using the designated method, a socially acceptable nickname is not reported to Konami, the purchaser causes or is deemed to cause the purchaser benefits to be used by a third party (e.g. causing a third party to report the nickname on behalf of the purchaser), or the NFT is transferred to a third party, the purchaser will lose the right to receive the benefits (the nickname, once displayed, will not be deleted during the period of time separately specified by Konami). Notwithstanding the above provisions, in the event Konami determines that the purchaser will illegally or inappropriately use the NFT, the purchaser will lose the right to receive the benefits (the displayed nickname will be deleted). \n・The purchaser will not, by purchasing the NFT, obtain intellectual property rights (e.g. copyrights, trademark rights) in relation to the data linked to the NFT. Thus, the purchaser may not use the data linked to the NFT (e.g. reproductions) for commercial purposes.\n・Konami is not able to preclude the purchaser from spreading on social media the fact that the purchaser purchased the NFT nor from transferring the NFT to a third party. \n・Konami will not sell another NFT that is linked to the same data that is linked to the current NFT at any time in the future, but may sell a NFT that is linked to data based on Castlevania series in the future.\n・Minors may not purchase the NFT.\n・The purchaser may not cancel (e.g. return, refund) this agreement after it has been concluded.\n・Konami will not be responsible for the unavailability of the HP due to maintenance, accident, or other reasons. \n・Konami will only be responsible for granting the use of the NFT and purchaser benefits for the NFT and will not provide any guarantee for the NFT itself (e.g. continuity, compatibility with other services).\n・Konami does not guarantee that the value of the NFT will increase after the purchase.\n\n\n【商品説明】\n「Castlevania: Circle of the Moon」グローバル版のメインビジュアルアートをピックアップしました。悪魔城をバックに主人公ネイサンの師匠救出への決意が現れたアートとなっています。\n\n【初回購入者特典】\n「KONAMI MEMORIAL NFT」ホームページ( https://www.konami.com/games/memorial-nft/ )にNFT初回購入者としてニックネームを掲載する権利を得ます。\n詳細は( https://www.konami.com/games/memorial-nft/ )をご確認ください。\n\n【販売規約】\n・ご購入者様と株式会社コナミデジタルエンタテインメント（コナミ）との間で締結される本NFTを対象とした本契約によって、ご購入者様に設定される権限は、本NFTの利用権限と本契約の際に利用するプラットフォームであるOpenSeaにおいて本規約外に別途詳細する購入者特典（コナミから本NFTを購入者した方のみを対象とし、コナミのホームページ上（ https://www.konami.com/games/memorial-nft/ ）に、ニックネームを利用して、ご購入者様が本NFTの購入した事実を示す権利）以外にございません。\n・ご購入者様のニックネームの表示に際しては、社会通念上妥当なニックネームとコナミが判断した場合に表示いたします（例：個人を特定できる情報を含むニックネームは不可）。また、別途、コナミがお知らせする期限までに所定の方法で、ニックネームをご通知いただけない場合、もしくは社会通念上妥当なニックネームをご通知いただけない場合、他者に購入者特典の利用させる、もしくはそのおそれのある行為があると認められた場合（例：ご購入者様に代わり、第三者にニックネームの通知をさせる）、または第三者に本ＮＦＴを移転した場合は、本特典を受ける権利を失います（一旦、掲載されたニックネームは、別途コナミが指定する期間中は、削除されません）。上記の規定にかかわらず、ご購入者様が違法・不適当な利用を本NFTに関して行うとコナミが判断した場合は、本特典を受ける権利を失います（一旦、掲載されたニックネームは削除されます）。\n・ご購入者様は、本NFTの購入によって、本NFTに紐づくデータに関連する知的財産権（著作権、商標権等）を取得しません。従いまして、商用目的で、本NFTに紐づくデータの利用（複製等）はできません。\n・コナミは、ご購入者様が本NFTを購入した事実をSNSで拡散すること、および本NFTを第三者に移転することを妨げません。\n・コナミは、本NFTに紐づくデータと同一のデータに紐づくNFTを今後販売しませんが、同データが依拠するゲームタイトルである「悪魔城ドラキュラ」シリーズに依拠するデータを紐づけるNFTを今後販売する可能性がございます。\n・未成年者は本NFTを購入できません。\n・ご購入者様は、一旦成立した本契約の取消し（返品、返金等）はできません。\n・コナミは、HPがメンテナンスまたは事故等で利用不能になった場合でも責任を負いません。\n・コナミは、本NFTの利用権限と購入者特典の設定に関する責任のみ負い、本NFT自体については何ら保証をしません（存続性、他サービスとの互換性等）。\n・コナミは本NFTが購入後に、価値が上昇することを保証しません。	https://lh3.googleusercontent.com/3Pi6msFOhnuLJMOXhTGutDUEWcjCm5hJtIwkCpvEIwmBqN7FySzmJTdiA_9E3ixKtVDMKGjsY-Go9Q3UTpKz3AzTtSi75zOKQOp3dQ	https://lh3.googleusercontent.com/3Pi6msFOhnuLJMOXhTGutDUEWcjCm5hJtIwkCpvEIwmBqN7FySzmJTdiA_9E3ixKtVDMKGjsY-Go9Q3UTpKz3AzTtSi75zOKQOp3dQ=s250	https://lh3.googleusercontent.com/3Pi6msFOhnuLJMOXhTGutDUEWcjCm5hJtIwkCpvEIwmBqN7FySzmJTdiA_9E3ixKtVDMKGjsY-Go9Q3UTpKz3AzTtSi75zOKQOp3dQ=s128	https://ipfs.io/ipfs/bafybeih6c4yqm574i3zwa4c6usb56wearapdfmk3tqqqj65t3jrxnqbetq/image	\N	\N	https://www.konami.com/games/memorial-nft/	\N	\N	\N	93789.8999999999942	30	87	129	2022-01-21 00:00:37.008703	2022-01-21 00:00:37.008703
43	53043543350033854982381974050717097219780962640427547974224833759867205320705	0xacd7c2c7f4dc72368b0ffafa401946e6f47ca73e	Gogh Dog #1833	I hope it becomes a universal currency.❤	https://lh3.googleusercontent.com/jT35YQI28U_CIDcKhhZe__9gMwvOOnJYXQoxWuIbS99JYEvL42RFLxKbOoNCX3octEcHjkiuWJpk6KiKqNHXBiy6zGEs0m4JfOGMopE	https://lh3.googleusercontent.com/jT35YQI28U_CIDcKhhZe__9gMwvOOnJYXQoxWuIbS99JYEvL42RFLxKbOoNCX3octEcHjkiuWJpk6KiKqNHXBiy6zGEs0m4JfOGMopE=s250	https://lh3.googleusercontent.com/jT35YQI28U_CIDcKhhZe__9gMwvOOnJYXQoxWuIbS99JYEvL42RFLxKbOoNCX3octEcHjkiuWJpk6KiKqNHXBiy6zGEs0m4JfOGMopE=s128	\N	\N	\N	\N	\N	\N	\N	2999.40000000000009	1	1	129	2022-01-22 00:00:03.591571	2022-01-22 00:00:03.591571
44	8920650261906539551707462159971082682358764236800752495046729208848344678401	0x13b8e8bc3229d713c26b7862078ae7acd368314d	 gcjfg	\N	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw=s250	https://lh3.googleusercontent.com/jnReG0HO3aaNMMjG1JzSNO3q8Pc6RnpG3XpQC65KoH2GMfj4nx8VGcTjbn55YOumRmzBP-Rsp02uNEgtcrC9EZQQUH664zNdhav0jw=s128	\N	\N	\N	\N	\N	\N	\N	\N	\N	71	129	2022-01-25 00:00:16.025018	2022-01-25 00:00:16.025018
11	15	0x4772331d243eb2ee23fa7361b492139773207307	CreatureToad #15	A creature and a toadz were left in the wallet for too long...	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g=s250	https://lh3.googleusercontent.com/BccQYqu1m1Vx3nSK3i0KznlvDHU-7yKnxCdQ3_jPvXtcOlA-ROljlh1i6rf51RCDKu-lha10dmRDBUWF8vkwTJ5n_vk_TZZt15QX7g=s128	https://ipfs.io/ipfs/QmNy9Sh8PxGPRJpXVyC3ndmCLRvffvBcZQzg8vBcmtwMmW	\N	\N	\N	\N	\N	\N	\N	\N	80	129	2022-01-11 01:02:10.219147	2022-01-29 00:08:07.703471
45	4357	0xfa91ab5befe9a24813f4c6b104d999164464b46e	Fishy Fam #4357	Fishy Fam	https://lh3.googleusercontent.com/gz5TT5_f4gbVvm-THuK0YKFYxVo4SVDw233b2JtfyhYEl-rf6vZiPKnzx4SjWf3Mh__Wfn_v8CYgu1MtIvykwV7k6QQwPyGG1Ifj	https://lh3.googleusercontent.com/gz5TT5_f4gbVvm-THuK0YKFYxVo4SVDw233b2JtfyhYEl-rf6vZiPKnzx4SjWf3Mh__Wfn_v8CYgu1MtIvykwV7k6QQwPyGG1Ifj=s250	https://lh3.googleusercontent.com/gz5TT5_f4gbVvm-THuK0YKFYxVo4SVDw233b2JtfyhYEl-rf6vZiPKnzx4SjWf3Mh__Wfn_v8CYgu1MtIvykwV7k6QQwPyGG1Ifj=s128	https://herodev.mypinata.cloud/ipfs/QmQvUfqhLMSNYKLVaBcMnaHfmtP2zRxfFP2gLMCk6fN7DX/4357.png	\N	\N	\N	\N	\N	\N	2.55277000000000021	0.00100000000000000002	89	129	2022-01-30 00:04:57.315403	2022-01-30 00:04:57.328007
\.


--
-- Data for Name: privacy_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privacy_policies (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: privacy_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privacy_settings (id, account_id, latest_activity, older_activity, in_app_notification, chat_notification, friend_request, interest_received, viewed_profile, off_all_notification, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: profile_bios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_bios (id, account_id, height, weight, height_type, weight_type, body_type, mother_tougue, religion, zodiac, marital_status, languages, about_me, personality, interests, smoking, drinking, looking_for, created_at, updated_at, about_business) FROM stdin;
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, country, address, postal_code, account_id, photo, created_at, updated_at, profile_role, city, about, date_of_birth, state, mobile_number) FROM stdin;
55		\N	\N	137	\N	2021-11-11 11:53:09.116965	2022-02-03 08:54:08.03382	\N	Kharkiv		1989-05-08		12895549588m
2	India	\N	\N	19	\N	2021-10-26 12:28:48.610415	2021-10-26 12:28:48.610415	\N		hello	\N		8611111111
3	India	\N	\N	20	\N	2021-10-26 12:31:09.137342	2021-10-26 12:31:09.137342	\N	Kanpur	hello	\N	UttarPradesh	8611111111
5	India	\N	\N	28	\N	2021-10-26 14:31:07.361757	2021-10-26 14:31:07.361757	\N		hello	\N		8611111111
7	India	\N	\N	29	\N	2021-10-26 14:33:16.475042	2021-10-26 14:33:16.475042	\N		hello	\N		8611111111
9	India	\N	\N	31	\N	2021-10-27 03:58:48.364873	2021-10-27 03:58:48.364873	\N	Kanpur	hello	\N	Uttar Pradesh	8611111111
10	India	\N	\N	33	\N	2021-10-27 04:05:17.902914	2021-10-27 04:05:17.902914	\N	Kanpur	hello	\N	UttarPradesh	8611111111
11	India	\N	\N	34	\N	2021-10-27 04:07:57.663093	2021-10-27 04:07:57.663093	\N	Kanpur	hello	\N	Uttar Pradesh	8611111111
12	India	\N	\N	34	\N	2021-10-27 04:07:57.662944	2021-10-27 04:07:57.662944	\N	Kanpur	hello	\N	Uttar Pradesh	8611111111
13	India	\N	\N	36	\N	2021-10-27 04:14:15.622104	2021-10-27 04:14:15.622104	\N	Kanpur	hello	\N	Uttar Pradesh	8611111111
14	India	\N	\N	37	\N	2021-10-27 04:15:34.80656	2021-10-27 04:15:34.80656	\N		hello\n	\N		8611111111
15	India	\N	\N	38	\N	2021-10-27 04:18:17.374546	2021-10-27 04:43:17.376437	\N	Kanpur	hello	\N	Uttar Pradesh	8611111111
16	India	\N	\N	41	\N	2021-10-27 08:14:10.651948	2021-10-27 08:14:10.651948	\N		hello	\N		8611111111
17	India	\N	\N	44	\N	2021-10-27 10:10:52.870084	2021-10-27 10:10:52.870084	2	Kanpur	hello	\N	UttarPradesh	8611111111
18	India	\N	\N	45	\N	2021-10-27 10:17:29.896812	2021-10-27 10:17:29.896812	\N		hello	\N		8611111111
19	India	\N	\N	46	\N	2021-10-27 10:19:43.258277	2021-10-27 10:28:32.372881	\N		hello	\N		8611111111
20	India	\N	\N	47	\N	2021-10-27 11:34:55.83747	2021-10-27 11:34:55.83747	\N		hello	\N		8611111111
21	India	\N	\N	47	\N	2021-10-27 11:36:02.918342	2021-10-27 11:36:02.918342	\N		hello	\N		8611111111
22	India	\N	\N	51	\N	2021-10-28 06:30:18.965478	2021-10-28 06:30:18.965478	\N		Ujjval barot	\N		8611111111
23	India	\N	\N	51	\N	2021-10-28 06:32:18.701741	2021-10-28 06:32:18.701741	\N		hello	\N		8611111111
24	India	\N	\N	52	\N	2021-10-28 14:09:18.75257	2021-10-28 14:09:18.75257	\N		hello	\N		8611111111
25	India	\N	\N	53	\N	2021-10-28 14:13:41.204772	2021-10-28 14:13:41.204772	\N		hello	\N		8611111111
26	India	\N	\N	54	\N	2021-10-29 03:36:06.481777	2021-10-29 03:36:06.481777	\N		Hello	\N		8611111111
27	India	\N	\N	55	\N	2021-10-29 04:35:06.224218	2021-10-29 04:35:06.224218	\N		hello	\N		8611111111
28	India	\N	\N	95	\N	2021-10-29 10:06:10.069937	2021-10-29 10:06:10.069937	\N		helo	\N		8611111111
29	India	\N	\N	96	\N	2021-10-29 10:22:22.649284	2021-10-29 10:22:22.649284	\N		hello	\N		8611111111
30	India	\N	\N	97	\N	2021-10-29 10:27:53.754723	2021-10-29 10:27:53.754723	\N		hello	\N		8611111111
33	India	\N	\N	105	\N	2021-10-29 11:23:19.555638	2021-10-29 11:23:19.555638	\N		hello	\N		8611111111
34	India	\N	\N	107	\N	2021-10-29 11:26:18.931534	2021-10-29 11:26:18.931534	\N		hello	\N		8611111111
35	India	\N	\N	108	\N	2021-11-03 10:13:50.737027	2021-11-03 10:14:24.631333	2	Chennai	Software engineer	1992-05-25	Tamilnadu	73828111121
37	India	\N	\N	110	\N	2021-11-08 09:37:38.996102	2021-11-08 09:37:38.996102	\N	Patan	hello	\N	Gujarat	8611111111
38	India	\N	\N	111	\N	2021-11-08 09:58:04.422812	2021-11-08 09:58:04.422812	2	Kanpur	hello	\N	UttarPradesh	8611111111
39	India	\N	\N	115	\N	2021-11-08 10:44:55.815232	2021-11-08 10:44:55.815232	\N	Bandora	hello	\N	Goa	8611111111
40	India	\N	\N	116	\N	2021-11-08 11:04:05.422196	2021-11-08 11:04:05.422196	\N	Patan	hello	\N	Gujarat	8611111111
41	India	\N	\N	117	\N	2021-11-08 12:08:11.149208	2021-11-08 12:08:11.149208	\N		hello	\N	Haryana	8611111111
42	India	\N	\N	118	\N	2021-11-08 12:27:49.033527	2021-11-08 12:27:49.033527	2	Kanpur	hello	\N	UttarPradesh	8611111111
43	India	\N	\N	123	\N	2021-11-09 13:12:53.167861	2021-11-09 13:12:53.167861	\N	Amod	hello	\N	Gujarat	8611111111
45	Angola	\N	\N	125	\N	2021-11-09 13:26:03.984856	2021-11-09 13:26:03.984856	\N		hello	\N		8611111111
46	Azerbaijan	\N	\N	126	\N	2021-11-09 14:11:08.454286	2021-11-09 14:11:08.454286	\N		fr	2021-09-11		7878787856
47	Antigua And Barbuda	\N	\N	127	\N	2021-11-09 14:12:24.780994	2021-11-09 14:12:24.780994	\N		fgfg	\N		7878787856
48	American Samoa	\N	\N	128	\N	2021-11-10 11:13:56.589915	2021-11-10 11:13:56.589915	\N		dfdf	\N		7878787856
51	India	\N	\N	130	\N	2021-11-11 07:06:08.128	2021-11-11 07:06:08.128	\N		hello	\N		8611111111
53	Ukraine	\N	\N	135	\N	2021-11-11 09:52:48.501594	2021-11-11 09:52:48.501594	\N	Kharkiv	D	2022-07-10	Kharkiv Oblast	3333333
57	India	\N	\N	138	\N	2021-11-11 13:17:13.38234	2021-11-11 13:17:13.38234	\N		hello	\N		8611111111
59	India	\N	\N	139	\N	2021-11-11 13:23:03.973427	2021-11-11 13:23:03.973427	\N		hello	\N		8611111111
60	India	\N	\N	140	\N	2021-11-11 13:32:28.120153	2021-11-11 13:32:28.120153	\N		hello	\N		8611111111
62	Brazil	\N	\N	142	\N	2021-11-12 07:13:47.249138	2021-11-12 07:13:47.249138	\N	Mossoró	NFT 	1993-05-11	Rio Grande do Norte	9876543210
63	United Kingdom	\N	\N	144	\N	2021-11-12 09:45:20.03691	2021-11-12 09:45:20.03691	\N	Blackpool	Mechanic from Blackpool	1997-01-01	England	447458148482
64	Aruba	\N	\N	145	\N	2021-11-12 09:53:25.463145	2021-11-12 09:53:25.463145	\N		Some bio	\N		3242134234
65	Armenia	\N	\N	146	\N	2021-11-12 09:57:31.583218	2021-11-12 09:57:31.583218	\N		Some bio	\N		32421342134231
66	Afghanistan	\N	\N	149	\N	2021-11-12 10:32:07.805625	2021-11-12 10:32:07.805625	\N		Bio	\N		123412341234
67	Afghanistan	\N	\N	150	\N	2021-11-12 11:02:37.461755	2021-11-12 11:02:37.461755	\N		Somebio	\N		043225533
68	Armenia	\N	\N	151	\N	2021-11-12 11:03:50.366265	2021-11-12 11:03:50.366265	\N		Armenia	\N		043225533
69	India	\N	\N	154	\N	2021-11-12 11:23:40.201485	2021-11-12 11:23:40.201485	\N	Kanpur	hello	2010-01-11	UttarPradesh111	8611111111
70	India	\N	\N	155	\N	2021-11-12 11:46:51.282494	2021-11-12 11:46:51.282494	\N	Kanpur	hello	2010-01-11	UttarPradesh	8611111111
71	Iceland	\N	\N	156	\N	2021-11-12 11:50:26.64169	2021-11-12 11:50:26.64169	\N		hello	\N		8611111111
72	Afghanistan	\N	\N	157	\N	2021-11-12 11:59:17.746492	2021-11-12 11:59:17.746492	\N		Somebio	\N		099999999
73	Argentina	\N	\N	158	\N	2021-11-12 12:02:13.166952	2021-11-12 12:02:13.166952	\N		Bio	\N		099999999
54	AF	\N	\N	136	\N	2021-11-11 11:09:53.73058	2022-01-10 12:53:36.975858	\N	Chīras	Some info	1986-07-01	SAR	
56	Kharkov	\N	\N	132	\N	2021-11-11 12:26:36.037813	2021-11-18 08:06:04.802887	\N	Kharkov	bio	2000-11-01	Kharkov	477583954
52	IN	\N	\N	133	\N	2021-11-11 09:27:09.766546	2022-02-01 07:15:23.401788	\N	Lakshadweep		\N	LD	
50	IN	\N	\N	129	\N	2021-11-11 06:20:10.213331	2022-02-01 07:15:07.092115	2	Bodhan		1994-05-25	TG	7382811121
49	AR	\N	\N	129	\N	2021-11-10 12:37:56.073714	2022-01-31 12:54:05.403162	2	Capioví		2021-11-05	N	
44	AO	\N	\N	124	\N	2021-11-09 13:18:28.100451	2022-02-02 07:05:55.565086	\N	Saurimo	Good	2020-10-03	LSU	9898989898
74	India	\N	\N	159	\N	2021-11-12 12:06:57.815575	2021-11-12 12:06:57.815575	\N		hello	\N		8611111111
75	Armenia	\N	\N	160	\N	2021-11-12 12:26:23.041489	2021-11-12 12:26:23.041489	\N		ss	\N		034234241
76	Afghanistan	\N	\N	161	\N	2021-11-12 12:33:32.480699	2021-11-12 12:33:32.480699	\N		Bio	\N		32424234
77	Azerbaijan	\N	\N	162	\N	2021-11-12 13:18:00.421738	2021-11-12 13:18:00.421738	\N		ghg	\N		7878787856
78	Australia	\N	\N	163	\N	2021-11-12 13:41:41.820075	2021-11-12 13:41:41.820075	\N	Angle Vale	Fff	\N	South Australia	324234234
79	Armenia	\N	\N	164	\N	2021-11-12 14:52:15.805151	2021-11-12 14:52:15.805151	\N		33	\N		32412341234
36	India	\N	\N	109	\N	2021-11-03 12:24:33.434539	2021-11-12 15:03:39.974213	2	Chennai	Software engineer	1994-05-25	Tamilnadu	7382811121
80	Bahrain	\N	\N	166	\N	2021-11-12 15:17:05.678365	2021-11-12 15:17:05.678365	\N		ok	\N		7878787856
81	India	\N	\N	167	\N	2021-11-12 17:34:31.096273	2021-11-12 17:34:31.096273	\N		test	2021-12-11		8200504955
82	India	\N	\N	168	\N	2021-11-15 06:07:50.728012	2021-11-15 06:07:50.728012	\N	Kanpur	hello	2010-01-11	UttarPradesh	8611111111
83	India	\N	\N	170	\N	2021-11-15 07:42:45.160089	2021-11-15 09:15:50.997851	\N	indore	Software engineer	1994-05-25	Mp	7382811121
84	Australia	\N	\N	171	\N	2021-11-15 09:33:40.55806	2021-11-15 09:33:40.55806	\N		343	\N		2314234322
85	Azerbaijan	\N	\N	172	\N	2021-11-15 09:50:38.1664	2021-11-15 09:50:38.1664	\N		fine	\N		7878787856
87	Comoros	\N	\N	175	\N	2021-11-15 12:58:47.582203	2021-11-15 12:58:47.582203	\N	Fomboni	test	2021-03-05	Mohéli	1123456889
88	India	\N	\N	193	\N	2021-11-16 04:09:05.672145	2021-11-16 04:09:05.672145	\N		hello	\N		8611111111
89	Aruba	\N	\N	194	\N	2021-11-16 04:25:33.247884	2021-11-16 04:25:33.247884	\N		test	\N		7878787856
90	Algeria	\N	\N	197	\N	2021-11-16 10:36:20.316539	2021-11-16 10:36:20.316539	\N		Sss	\N		1 275 865 3764
91	Aruba	\N	\N	198	\N	2021-11-16 10:45:04.332475	2021-11-16 10:45:04.332475	\N		334	\N		1 275 865 3764
92	Aruba	\N	\N	200	\N	2021-11-16 11:14:59.970829	2021-11-16 11:14:59.970829	\N		some bio	\N		1 275 865 3764
93	Armenia	\N	\N	202	\N	2021-11-16 11:53:57.142055	2021-11-16 11:53:57.142055	\N		32423	\N		2423421343
94	Aruba	\N	\N	203	\N	2021-11-17 04:37:16.342013	2021-11-17 04:37:16.342013	\N		ok	\N		7878787856
95	India	\N	\N	204	\N	2021-11-17 06:01:21.610774	2021-11-17 06:01:21.610774	\N	Kanpur	hello	2010-01-11	UttarPradesh	8611111111
96	Afghanistan	\N	\N	206	\N	2021-11-17 07:54:38.057317	2021-11-17 07:54:38.057317	\N	Aībak	Some	\N	Samangan	2342342423
97	Armenia	\N	\N	207	\N	2021-11-17 09:50:58.316788	2021-11-17 09:50:58.316788	\N		22	\N		+23134213412
98	Aruba	\N	\N	208	\N	2021-11-17 10:13:48.501002	2021-11-17 10:13:48.501002	\N		23	2021-01-11		1 275 865 3764
135	IN	\N	\N	260	\N	2021-11-29 09:08:36.939044	2022-01-21 06:37:06.400346	\N	Barbil		\N	OR	8611111111
100	Australia	\N	\N	209	\N	2021-11-17 12:07:53.709853	2021-11-17 12:07:53.709853	\N		222	2021-03-11		2342342134
101	234234234	\N	\N	210	\N	2021-11-17 14:05:09.641272	2021-11-17 14:07:18.90139	\N	234234234	ssss	2021-01-11	234234234	3242342314
127	Angola	\N	\N	249	\N	2021-11-24 08:21:44.164017	2021-11-24 08:21:44.164017	\N	Saurimo	asasaswwd	\N	Lunda Sul Province	1123456889
102	12222	\N	\N	211	\N	2021-11-17 14:13:31.453137	2021-11-17 14:16:16.305739	\N	12222	112333	2001-03-03	12222	55555555
103	United States	\N	\N	212	\N	2021-11-17 14:44:08.569316	2021-11-17 14:44:08.569316	\N	El Paso	i love deegee	\N	Texas	9152407341
128	Aruba	\N	\N	250	\N	2021-11-24 10:21:27.708906	2021-11-24 10:21:27.708906	\N			\N		
126	AO	\N	\N	248	\N	2021-11-24 08:03:41.767889	2022-02-02 13:44:20.76979	\N	Caxito		2018-01-03	BGO	4423456789
104	2222	\N	\N	213	\N	2021-11-17 14:48:32.219608	2021-11-18 08:06:59.469158	\N	2222	2222	2021-10-11	2222	2222222
105	United States	\N	\N	215	\N	2021-11-18 08:11:01.00726	2021-11-18 08:11:01.00726	\N	Benbrook	bio	1995-01-11	Texas	+442365448896
106	Armenia	\N	\N	216	\N	2021-11-18 11:03:05.394686	2021-11-18 11:03:05.394686	\N		234	\N		2342342342
107		\N	\N	217	\N	2021-11-18 11:54:27.759208	2021-11-18 11:54:27.759208	\N			\N		
108		\N	\N	218	\N	2021-11-18 11:55:36.183793	2021-11-18 11:55:36.183793	\N			\N		
109	India	\N	\N	219	\N	2021-11-18 12:39:57.156378	2021-11-18 12:39:57.156378	\N		sfgdshh	\N		9412345678
110		\N	\N	220	\N	2021-11-18 13:49:37.167488	2021-11-18 13:49:37.167488	\N			\N		
111		\N	\N	221	\N	2021-11-18 13:53:55.390446	2021-11-18 13:53:55.390446	\N			\N		
112	Aruba	\N	\N	225	\N	2021-11-19 09:24:23.069539	2021-11-19 09:24:23.069539	\N			\N		
113	Andorra	\N	\N	226	\N	2021-11-19 12:04:47.591173	2021-11-19 12:04:47.591173	\N	Encamp	Ffefe	2021-01-01	Encamp	2342342224
114	Aruba	\N	\N	227	\N	2021-11-19 12:09:39.193884	2021-11-19 12:09:39.193884	\N		33	\N		2342341413
115	234234	\N	\N	229	\N	2021-11-22 09:58:31.702946	2021-11-22 10:02:04.829308	\N	234234	sssssssss	2021-10-03	234234	12342134231
116	Afghanistan	\N	\N	234	\N	2021-11-22 11:51:04.689244	2021-11-22 11:51:04.689244	\N		222	\N		2342342332
129	United States	\N	\N	252	\N	2021-11-24 15:13:09.480668	2021-11-24 15:13:09.480668	\N	Brooklyn	test	\N	New York	9894278185
130		\N	\N	255	\N	2021-11-25 12:31:44.490008	2021-11-25 12:31:44.490008	\N			\N		
131		\N	\N	256	\N	2021-11-26 10:20:32.949002	2021-11-26 10:20:32.949002	\N			\N		
117	222	\N	\N	236	\N	2021-11-22 13:06:21.647743	2021-11-22 13:21:19.763081	\N	222	222	2020-07-07	222	2222222222
118	222	\N	\N	236	\N	2021-11-22 13:06:21.648788	2021-11-22 13:21:40.373056	\N	222	222	2021-08-09	222	2222222222
119	Australia	\N	\N	237	\N	2021-11-22 14:21:24.684364	2021-11-22 14:21:24.684364	\N		U	2021-02-11		5555555556
132	India	\N	\N	257	\N	2021-11-29 08:57:01.136611	2021-11-29 08:57:01.136611	\N		Dimple Kapadiya	\N		1234567890
134	India	\N	\N	259	\N	2021-11-29 09:01:42.867485	2021-11-29 09:01:42.867485	\N		Axay	\N		8611111111
136		\N	\N	261	\N	2021-11-29 10:17:48.539331	2021-11-29 10:17:48.539331	\N			\N		
137		\N	\N	262	\N	2021-11-29 13:20:17.016563	2021-11-29 13:20:17.016563	\N			\N		
140	IN	\N	\N	266	\N	2021-11-30 06:09:45.603295	2022-02-02 08:26:16.492723	\N	Benaulim		1999-03-02	GA	9876543210
147		\N	\N	273	\N	2021-12-01 13:25:40.719881	2021-12-01 13:25:40.719881	\N			\N		
120	23423423423	\N	\N	240	\N	2021-11-23 10:51:11.899363	2021-11-23 10:53:04.330331	\N	23423423423	232423344	2021-11-17	23423423423	3423422234
121		\N	\N	243	\N	2021-11-23 11:21:44.157657	2021-11-23 11:21:44.157657	\N			\N		
122		\N	\N	244	\N	2021-11-23 11:23:19.109678	2021-11-23 11:23:19.109678	\N			\N		
123		\N	\N	245	\N	2021-11-23 11:40:06.534372	2021-11-23 11:40:06.534372	\N			\N		
138		\N	\N	263	\N	2021-11-29 13:23:16.802481	2021-11-29 13:23:16.802481	\N			\N		
124		\N	\N	246	\N	2021-11-23 12:38:23.975078	2021-11-23 12:45:37.670222	\N			\N		+92f@gmail.com@4fess2331
125		\N	\N	247	\N	2021-11-23 13:01:55.184838	2021-11-23 13:01:55.184838	\N			\N		
133	AU	\N	\N	258	\N	2021-11-29 08:59:53.128871	2021-11-30 05:57:03.721222	\N	Altona Meadows	Khanna	\N	VIC	
141		\N	\N	267	\N	2021-11-30 07:50:48.301311	2021-11-30 07:50:48.301311	\N			\N		
142		\N	\N	268	\N	2021-11-30 07:58:25.923884	2021-11-30 07:58:25.923884	\N			\N		
143		\N	\N	269	\N	2021-11-30 10:24:42.997109	2021-11-30 10:24:42.997109	\N			\N		
144		\N	\N	270	\N	2021-11-30 11:48:38.111629	2021-11-30 11:48:38.111629	\N			\N		
145		\N	\N	271	\N	2021-12-01 05:34:59.280539	2021-12-01 05:34:59.280539	\N			\N		0123456789
146		\N	\N	272	\N	2021-12-01 08:41:42.238549	2021-12-01 08:41:42.238549	\N			\N		
148		\N	\N	274	\N	2021-12-01 13:33:55.782372	2021-12-01 13:33:55.782372	\N			\N		
149		\N	\N	275	\N	2021-12-01 13:37:18.388191	2021-12-01 13:37:18.388191	\N			\N		
150		\N	\N	276	\N	2021-12-02 08:08:03.822508	2021-12-02 08:08:03.822508	\N			\N		
151		\N	\N	277	\N	2021-12-02 08:17:29.726487	2021-12-02 08:17:29.726487	\N			\N		
152	United States	\N	\N	278	\N	2021-12-03 09:29:20.144245	2021-12-03 09:29:20.144245	\N		Captain America	\N		6358456557
153	Australia	\N	\N	279	\N	2021-12-03 09:36:30.569103	2021-12-03 09:36:30.569103	\N		Thor	\N		4568456458
154	United States	\N	\N	280	\N	2021-12-03 09:41:08.623154	2021-12-03 09:41:08.623154	\N		black window	\N		3568546865
155	United States	\N	\N	281	\N	2021-12-03 09:56:12.653697	2021-12-03 09:56:12.653697	\N		Captain marvel	\N		15454646545
156		\N	\N	282	\N	2021-12-03 10:45:48.765816	2021-12-03 10:45:48.765816	\N			\N		
157		\N	\N	283	\N	2021-12-03 13:30:28.769906	2021-12-03 13:30:28.769906	\N			\N		
158		\N	\N	284	\N	2021-12-03 13:50:51.2768	2021-12-03 13:50:51.2768	\N			\N		
159	India	\N	\N	285	\N	2021-12-06 04:48:15.729157	2021-12-06 04:48:15.729157	\N			\N		
160	Aruba	\N	\N	286	\N	2021-12-06 04:49:22.934458	2021-12-06 04:49:22.934458	\N			\N		
161	Australia	\N	\N	287	\N	2021-12-06 04:50:54.014305	2021-12-06 04:50:54.014305	\N			\N		
162	Aland Islands	\N	\N	288	\N	2021-12-06 04:52:46.665968	2021-12-06 04:52:46.665968	\N			\N		
163		\N	\N	289	\N	2021-12-06 05:03:10.327079	2021-12-06 05:03:10.327079	\N			\N		
164		\N	\N	291	\N	2021-12-06 11:16:15.584708	2021-12-06 11:16:15.584708	\N			\N		
165		\N	\N	292	\N	2021-12-06 13:11:34.465162	2021-12-06 13:11:34.465162	\N			\N		
166		\N	\N	293	\N	2021-12-06 14:51:06.255907	2021-12-06 14:51:06.255907	\N			\N		
32		\N	\N	11	\N	2021-10-29 10:31:03.781198	2021-12-07 06:07:00.013006	11	Kosh	software Eng	\N		7887098787
167		\N	\N	294	\N	2021-12-08 10:38:18.377331	2021-12-08 10:38:18.377331	\N			\N		
168	Afghanistan	\N	\N	295	\N	2021-12-08 13:41:53.714557	2021-12-08 13:41:53.714557	\N			\N		
235		\N	\N	390	\N	2022-02-03 05:22:45.201554	2022-02-03 05:22:45.201554	\N			\N		
139		\N	\N	264	\N	2021-11-29 20:38:54.356756	2021-12-08 14:20:37.903982	\N	El Paso	I LOVE deegee	\N		9152407340
170	United States	\N	\N	296	\N	2021-12-08 14:28:11.3221	2021-12-08 14:28:11.3221	\N		test 	2021-02-11		9894278185
171	United States	\N	\N	298	\N	2021-12-08 14:33:27.787551	2021-12-08 14:33:27.787551	\N	Browns Point	test 123	2021-03-11	Washington	7169827625
169	BT	\N	\N	297	\N	2021-12-08 14:28:00.141576	2021-12-08 14:44:33.718384	\N	Lhuentse	NFT junkyard	\N	44	
172		\N	\N	299	\N	2021-12-09 07:41:54.384558	2021-12-09 07:41:54.384558	\N			\N		
173		\N	\N	301	\N	2021-12-09 12:05:39.325911	2021-12-09 12:05:39.325911	\N			\N		
174		\N	\N	302	\N	2021-12-09 12:16:28.126715	2021-12-09 12:16:28.126715	\N			\N		
175		\N	\N	303	\N	2021-12-09 12:58:07.747979	2021-12-09 12:58:07.747979	\N			\N		
176		\N	\N	304	\N	2021-12-09 12:58:33.340697	2021-12-09 12:58:33.340697	\N			\N		
177	Canada	\N	\N	305	\N	2021-12-10 06:54:40.054651	2021-12-10 06:54:40.054651	\N		NFT	2000-01-12		
178		\N	\N	307	\N	2021-12-10 10:14:01.714582	2021-12-10 10:14:01.714582	\N			\N		
179		\N	\N	311	\N	2021-12-10 11:09:06.108247	2021-12-10 11:09:06.108247	\N			\N		
180		\N	\N	328	\N	2021-12-17 08:39:03.976623	2021-12-17 08:39:03.976623	\N			\N		
181		\N	\N	329	\N	2021-12-20 06:46:00.800854	2021-12-20 06:46:00.800854	\N			\N		
182		\N	\N	330	\N	2021-12-20 15:12:20.210879	2021-12-20 15:12:20.210879	\N			\N		
183		\N	\N	331	\N	2021-12-20 15:18:17.816169	2021-12-20 15:18:17.816169	\N			\N		
184		\N	\N	331	\N	2021-12-20 15:18:17.829232	2021-12-20 15:18:17.829232	\N			\N		
185	India	\N	\N	333	\N	2021-12-22 09:20:36.966001	2021-12-22 09:20:36.966001	\N	Kanpur	hello	2010-01-11	UttarPradesh	8200000000
186	India	\N	\N	334	\N	2021-12-22 09:49:35.349663	2021-12-22 09:49:35.349663	\N	Kanpur	hello	2010-01-11	UttarPradesh	86898989898
187		\N	\N	337	\N	2021-12-22 09:50:01.465515	2021-12-22 09:50:01.465515	\N			\N		
188		\N	\N	338	\N	2021-12-22 11:36:51.881074	2021-12-22 11:36:51.881074	\N			\N		
189	India	\N	\N	339	\N	2021-12-23 13:14:12.572583	2021-12-23 13:14:12.572583	\N		ok	\N		
190	India	\N	\N	340	\N	2021-12-23 13:26:42.355084	2021-12-23 13:26:42.355084	\N			\N		
192		\N	\N	342	\N	2021-12-23 13:37:21.407151	2021-12-23 13:37:21.407151	\N			\N		
193		\N	\N	343	\N	2021-12-23 14:08:38.558657	2021-12-23 14:08:38.558657	\N			\N		
194		\N	\N	344	\N	2021-12-23 14:12:54.769346	2021-12-23 14:12:54.769346	\N			\N		
195		\N	\N	345	\N	2021-12-23 14:16:07.574093	2021-12-23 14:16:07.574093	\N			\N		
196		\N	\N	346	\N	2021-12-23 15:14:49.009913	2021-12-23 15:14:49.009913	\N			\N		
197		\N	\N	347	\N	2021-12-24 03:59:00.031903	2021-12-24 03:59:00.031903	\N			\N		
198		\N	\N	348	\N	2021-12-24 04:57:45.61612	2021-12-24 04:57:45.61612	\N			\N		
199		\N	\N	349	\N	2021-12-24 05:22:18.065032	2021-12-24 05:22:18.065032	\N			\N		
200		\N	\N	350	\N	2021-12-24 05:39:02.165381	2021-12-24 05:39:02.165381	\N			\N		
201		\N	\N	351	\N	2021-12-24 05:48:11.176982	2021-12-24 05:48:11.176982	\N			\N		
202		\N	\N	352	\N	2021-12-24 06:06:33.226381	2021-12-24 06:06:33.226381	\N			\N		
203		\N	\N	353	\N	2021-12-24 06:08:07.211831	2021-12-24 06:08:07.211831	\N			\N		
204		\N	\N	355	\N	2021-12-24 07:22:04.569937	2021-12-24 07:22:04.569937	\N			\N		
205		\N	\N	356	\N	2021-12-24 07:23:31.679338	2021-12-24 07:23:31.679338	\N			\N		
206		\N	\N	357	\N	2021-12-24 07:26:09.130228	2021-12-24 07:26:09.130228	\N			\N		
207	Hungary	\N	\N	354	\N	2021-12-24 08:12:06.262082	2021-12-24 08:12:06.262082	\N		NFT collector	1989-01-12	Sopron	9876543210
208	Bolivia	\N	\N	359	\N	2021-12-24 08:15:29.402331	2021-12-24 08:15:29.402331	\N	Provincia Méndez	NFT Devil	\N	Tarija Department	9876543210
211		\N	\N	306	\N	2022-01-04 07:34:38.346849	2022-01-04 07:34:38.346849	\N			\N		
212		\N	\N	362	\N	2022-01-04 10:17:55.338362	2022-01-04 10:17:55.338362	\N			\N		
213		\N	\N	363	\N	2022-01-04 10:27:24.594669	2022-01-04 10:27:24.594669	\N			\N		
214		\N	\N	364	\N	2022-01-04 10:44:39.113393	2022-01-04 10:44:39.113393	\N			\N		
215	United States	\N	\N	365	\N	2022-01-04 15:12:02.532437	2022-01-04 15:12:02.532437	\N			\N		
216		\N	\N	366	\N	2022-01-06 11:50:07.290987	2022-01-06 11:50:07.290987	\N			\N		
217		\N	\N	367	\N	2022-01-06 13:18:19.788306	2022-01-06 13:18:19.788306	\N			\N		
218		\N	\N	368	\N	2022-01-10 10:35:16.65135	2022-01-10 10:35:16.65135	\N			\N		3333343431
219		\N	\N	369	\N	2022-01-10 10:57:49.319688	2022-01-10 10:57:49.319688	\N			\N		
222		\N	\N	373	\N	2022-01-13 07:39:36.432997	2022-01-13 07:39:36.432997	\N			\N		
223	India	\N	\N	374	\N	2022-01-13 08:22:53.267724	2022-01-13 08:22:53.267724	\N	Kanpur	test	1994-10-07	Uttar Pradesh	8887761352
229		\N	\N	382	\N	2022-01-28 13:17:12.825741	2022-01-28 13:17:12.825741	\N			\N		
220	default	\N	\N	370	\N	2022-01-10 15:15:40.49136	2022-02-01 10:31:11.349357	\N	default		2021-09-08		hellob
225	AU	\N	\N	376	\N	2022-01-13 09:16:42.050804	2022-01-13 09:48:20.415945	\N	Braitling	Athlete	\N	NT	
226		\N	\N	378	\N	2022-01-17 10:01:02.879435	2022-01-17 10:01:02.879435	\N			\N		
232		\N	\N	384	\N	2022-02-02 09:02:25.325192	2022-02-02 09:02:25.325192	\N			\N		
236		\N	\N	391	\N	2022-02-03 05:27:06.806939	2022-02-03 05:27:06.806939	\N			\N		
227		\N	\N	379	\N	2022-01-21 08:46:26.909535	2022-01-24 14:01:04.582912	\N	Departamento de San Carlos		2022-01-01		0666680978
228		\N	\N	380	\N	2022-01-25 07:51:02.40384	2022-01-25 07:51:02.40384	\N			\N		
221	IE	\N	\N	371	\N	2022-01-11 10:55:04.064573	2022-02-01 06:58:28.93449	\N	Athgarvan		2022-06-01	L	0000000005
237		\N	\N	392	\N	2022-02-03 05:42:53.617357	2022-02-03 05:42:53.617357	\N			\N		
230	UA	\N	\N	383	\N	2022-01-31 10:23:50.624334	2022-02-02 11:48:43.911157	\N	Balakliya		2016-02-02	63	ggggggggg
234	United States	\N	\N	389	\N	2022-02-02 13:01:10.947895	2022-02-02 13:01:10.947895	\N	Orlando		\N	Florida	1-289-554-9588
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, project_name, start_date, end_date, add_members, url, description, make_projects_public, profile_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: publication_patents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publication_patents (id, title, publication, authors, url, description, make_public, profile_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: push_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.push_notifications (id, account_id, push_notificable_type, push_notificable_id, remarks, is_read, created_at, updated_at, notify_type) FROM stdin;
2	124	AccountBlock::Account	1	arun murugan                   liked your post	f	2021-11-23 06:48:16.197777	2021-11-23 06:48:16.197777	\N
15	124	AccountBlock::Account	20	arun murugan                   liked your post	f	2021-11-29 08:19:42.48607	2021-11-29 08:19:42.48607	\N
18	133	AccountBlock::Account	13	DB USER                   liked your post	f	2021-11-29 16:23:10.519546	2021-11-29 16:23:10.519546	\N
19	133	AccountBlock::Account	13	DB USER                   liked your post	f	2021-11-29 16:23:11.057469	2021-11-29 16:23:11.057469	\N
20	133	AccountBlock::Account	13	DB USER                   liked your post	f	2021-11-29 16:23:19.922511	2021-11-29 16:23:19.922511	\N
21	133	AccountBlock::Account	13	DB USER                   liked your post	f	2021-11-29 16:23:27.492816	2021-11-29 16:23:27.492816	\N
22	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-11-29 16:23:30.344393	2021-11-29 16:23:30.344393	\N
23	133	AccountBlock::Account	13	DB USER                   liked your post	f	2021-11-29 16:25:24.169509	2021-11-29 16:25:24.169509	\N
25	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-11-30 07:31:55.975599	2021-11-30 07:31:55.975599	\N
33	137	AccountBlock::Account	27	Emma Johnson                   liked your post	f	2021-11-30 12:23:54.869522	2021-11-30 12:23:54.869522	\N
34	129	AccountBlock::Account	2	test test                   liked your post	f	2021-12-01 06:05:41.737592	2021-12-01 06:05:41.737592	\N
35	129	AccountBlock::Account	2	test test                   liked your post	f	2021-12-01 06:05:58.164585	2021-12-01 06:05:58.164585	\N
36	129	AccountBlock::Account	15	test test                   liked your post	f	2021-12-01 06:06:02.088287	2021-12-01 06:06:02.088287	\N
37	129	AccountBlock::Account	23	test test                   liked your post	f	2021-12-01 06:06:05.995071	2021-12-01 06:06:05.995071	\N
38	129	AccountBlock::Account	24	test test                   liked your post	f	2021-12-01 06:06:10.1188	2021-12-01 06:06:10.1188	\N
39	129	AccountBlock::Account	25	test test                   liked your post	f	2021-12-01 06:06:13.768059	2021-12-01 06:06:13.768059	\N
40	129	AccountBlock::Account	26	test test                   liked your post	f	2021-12-01 06:06:17.267026	2021-12-01 06:06:17.267026	\N
41	248	AccountBlock::Account	22	Olena Romanek                   liked your post	f	2021-12-01 06:56:15.086397	2021-12-01 06:56:15.086397	\N
42	248	AccountBlock::Account	22	Olena Romanek                   liked your post	f	2021-12-01 07:46:38.202293	2021-12-01 07:46:38.202293	\N
43	248	AccountBlock::Account	32	Olena Romanek                   liked your post	f	2021-12-01 07:46:42.55019	2021-12-01 07:46:42.55019	\N
46	258	AccountBlock::Account	20	Rajesh Khanna                   liked your post	f	2021-12-01 11:43:47.812682	2021-12-01 11:43:47.812682	\N
47	124	AccountBlock::Account	20	arun murugan                   liked your post	f	2021-12-01 11:44:38.205876	2021-12-01 11:44:38.205876	\N
49	136	AccountBlock::Account	31	Will Smith                   liked your post	f	2021-12-01 15:17:55.617818	2021-12-01 15:17:55.617818	\N
50	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-12-02 07:09:08.103489	2021-12-02 07:09:08.103489	\N
51	136	AccountBlock::Account	27	Will Smith                   liked your post	f	2021-12-02 07:42:39.257281	2021-12-02 07:42:39.257281	\N
52	136	AccountBlock::Account	22	Will Smith                   liked your post	f	2021-12-02 07:44:31.814864	2021-12-02 07:44:31.814864	\N
53	133	AccountBlock::Account	2	DB USER                   liked your post	f	2021-12-03 07:10:08.959425	2021-12-03 07:10:08.959425	\N
54	248	AccountBlock::Account	22	Olena Romanek                   liked your post	f	2021-12-03 07:48:06.687272	2021-12-03 07:48:06.687272	\N
55	248	AccountBlock::Account	32	Olena Romanek                   liked your post	f	2021-12-03 07:48:11.061161	2021-12-03 07:48:11.061161	\N
56	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-12-03 07:50:45.76429	2021-12-03 07:50:45.76429	\N
61	129	AccountBlock::Account	22	test test                   liked your post	f	2021-12-03 13:13:07.585361	2021-12-03 13:13:07.585361	\N
62	129	AccountBlock::Account	32	test test                   liked your post	f	2021-12-03 13:13:14.726829	2021-12-03 13:13:14.726829	\N
63	129	AccountBlock::Account	25	test test                   liked your post	f	2021-12-03 13:15:02.894168	2021-12-03 13:15:02.894168	\N
64	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-12-03 13:24:50.538449	2021-12-03 13:24:50.538449	\N
65	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-12-03 13:25:14.201812	2021-12-03 13:25:14.201812	\N
66	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-12-03 13:35:18.131041	2021-12-03 13:35:18.131041	\N
67	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-12-03 13:43:27.473977	2021-12-03 13:43:27.473977	\N
68	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-12-03 14:00:41.504141	2021-12-03 14:00:41.504141	\N
73	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-12-03 14:41:59.55379	2021-12-03 14:41:59.55379	\N
74	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-12-03 15:00:04.819244	2021-12-03 15:00:04.819244	\N
75	133	AccountBlock::Account	2	DB USER                   liked your post	f	2021-12-03 15:12:39.546491	2021-12-03 15:12:39.546491	\N
76	133	AccountBlock::Account	9	DB USER                   liked your post	f	2021-12-03 15:14:19.490314	2021-12-03 15:14:19.490314	\N
77	133	AccountBlock::Account	2	DB USER                   liked your post	f	2021-12-03 15:15:04.380333	2021-12-03 15:15:04.380333	\N
79	129	AccountBlock::Account	2	test test                   liked your post	f	2021-12-06 05:43:25.910989	2021-12-06 05:43:25.910989	\N
84	136	AccountBlock::Account	27	Will Smith                   liked your post	f	2021-12-06 14:43:36.918027	2021-12-06 14:43:36.918027	\N
85	136	AccountBlock::Account	32	Will Smith                   liked your post	f	2021-12-06 14:47:33.262853	2021-12-06 14:47:33.262853	\N
86	137	AccountBlock::Account	32	Emma Johnson                   liked your post	f	2021-12-06 15:26:53.909066	2021-12-06 15:26:53.909066	\N
87	137	AccountBlock::Account	27	Emma Johnson                   liked your post	f	2021-12-06 16:09:37.886925	2021-12-06 16:09:37.886925	\N
88	137	AccountBlock::Account	27	Emma Johnson                   liked your post	f	2021-12-06 16:28:15.08295	2021-12-06 16:28:15.08295	\N
89	136	AccountBlock::Account	31	Will Smith                   liked your post	f	2021-12-06 16:48:27.74518	2021-12-06 16:48:27.74518	\N
90	129	AccountBlock::Account	33	test test                   liked your post	f	2021-12-07 06:39:46.529724	2021-12-07 06:39:46.529724	\N
91	133	AccountBlock::Account	33	DB USER                   liked your post	f	2021-12-07 07:23:49.414025	2021-12-07 07:23:49.414025	\N
92	137	AccountBlock::Account	27	Emma Johnson                   liked your post	f	2021-12-08 10:54:50.342514	2021-12-08 10:54:50.342514	\N
93	124	AccountBlock::Account	36	arun murugan                   liked your post	f	2021-12-08 11:03:48.227845	2021-12-08 11:03:48.227845	\N
94	124	AccountBlock::Account	35	arun murugan                   liked your post	f	2021-12-08 11:03:55.395352	2021-12-08 11:03:55.395352	\N
95	124	AccountBlock::Account	34	arun murugan                   liked your post	f	2021-12-08 11:03:59.439373	2021-12-08 11:03:59.439373	\N
96	124	AccountBlock::Account	38	arun murugan                   liked your post	f	2021-12-08 11:04:14.047986	2021-12-08 11:04:14.047986	\N
97	124	AccountBlock::Account	39	arun murugan                   liked your post	f	2021-12-08 11:04:19.340988	2021-12-08 11:04:19.340988	\N
98	264	AccountBlock::Account	9	Daniel Valles                   liked your post	f	2021-12-08 14:39:17.757568	2021-12-08 14:39:17.757568	\N
99	129	AccountBlock::Account	13	test test                   liked your post	f	2021-12-09 06:53:39.975791	2021-12-09 06:53:39.975791	\N
100	129	AccountBlock::Account	9	test test                   liked your post	f	2021-12-09 06:53:45.625447	2021-12-09 06:53:45.625447	\N
103	137	AccountBlock::Account	31	Emma Johnson                   liked your post	f	2021-12-09 13:23:54.221323	2021-12-09 13:23:54.221323	\N
104	136	AccountBlock::Account	31	Will Smith                   liked your post	f	2021-12-09 13:24:00.536301	2021-12-09 13:24:00.536301	\N
105	124	AccountBlock::Account	35	arun murugan                   liked your post	f	2021-12-10 04:48:50.656773	2021-12-10 04:48:50.656773	\N
106	305	AccountBlock::Account	32	Sara Greem                   liked your post	f	2021-12-10 07:21:11.26541	2021-12-10 07:21:11.26541	\N
107	305	AccountBlock::Account	22	Sara Greem                   liked your post	f	2021-12-10 07:21:15.097665	2021-12-10 07:21:15.097665	\N
108	305	AccountBlock::Account	27	Sara Greem                   liked your post	f	2021-12-10 07:25:52.749834	2021-12-10 07:25:52.749834	\N
109	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-10 10:24:57.517274	2021-12-10 10:24:57.517274	\N
110	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:11:08.830004	2021-12-13 11:11:08.830004	\N
111	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:11:17.243298	2021-12-13 11:11:17.243298	\N
112	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:11:19.223391	2021-12-13 11:11:19.223391	\N
113	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:11:29.814381	2021-12-13 11:11:29.814381	\N
114	136	AccountBlock::Account	31	Will Smith                   liked your post	f	2021-12-13 11:11:36.041127	2021-12-13 11:11:36.041127	\N
115	136	AccountBlock::Account	31	Will Smith                   liked your post	f	2021-12-13 11:11:37.82574	2021-12-13 11:11:37.82574	\N
116	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:27:11.442103	2021-12-13 11:27:11.442103	\N
117	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:28:10.784149	2021-12-13 11:28:10.784149	\N
118	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:28:13.862327	2021-12-13 11:28:13.862327	\N
119	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:28:18.3286	2021-12-13 11:28:18.3286	\N
120	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:34:34.383783	2021-12-13 11:34:34.383783	\N
121	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:38:31.965709	2021-12-13 11:38:31.965709	\N
122	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:38:41.585955	2021-12-13 11:38:41.585955	\N
123	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:41:26.867806	2021-12-13 11:41:26.867806	\N
124	136	AccountBlock::Account	43	Will Smith                   liked your post	f	2021-12-13 11:41:39.575848	2021-12-13 11:41:39.575848	\N
125	136	AccountBlock::Account	47	Will Smith                   liked your post	f	2021-12-13 14:24:27.482758	2021-12-13 14:24:27.482758	\N
126	133	AccountBlock::Account	33	DB USER                   liked your post	f	2021-12-14 07:31:49.618673	2021-12-14 07:31:49.618673	\N
127	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2021-12-14 10:25:49.701091	2021-12-14 10:25:49.701091	\N
128	136	BxBlockPosts::Post	27	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-15 19:52:03.197337	2021-12-15 19:52:03.197337	\N
129	136	BxBlockPosts::Post	47	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-16 13:09:10.781669	2021-12-16 13:09:10.781669	\N
130	136	BxBlockPosts::Post	4	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-16 16:36:25.272285	2021-12-16 16:36:25.272285	\N
131	137	BxBlockPosts::Post	27	Emma Johnson                   liked your BxBlockPosts::Post	f	2021-12-17 08:34:20.987383	2021-12-17 08:34:20.987383	\N
132	136	BxBlockPosts::Post	27	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-17 11:00:22.481858	2021-12-17 11:00:22.481858	\N
133	264	BxBlockPosts::Post	13	Daniel Valles                   liked your BxBlockPosts::Post	f	2021-12-17 14:25:37.306373	2021-12-17 14:25:37.306373	\N
134	297	BxBlockPosts::Post	13	Temp User                   liked your BxBlockPosts::Post	f	2021-12-20 07:19:10.191401	2021-12-20 07:19:10.191401	\N
135	297	BxBlockPosts::Post	9	Temp User                   liked your BxBlockPosts::Post	f	2021-12-20 07:22:33.310713	2021-12-20 07:22:33.310713	\N
136	124	BxBlockPosts::Post	45	arun murugan                   liked your BxBlockPosts::Post	f	2021-12-20 07:25:10.458953	2021-12-20 07:25:10.458953	\N
137	136	BxBlockPosts::Post	47	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-20 07:27:38.15373	2021-12-20 07:27:38.15373	\N
138	136	BxBlockPosts::Post	27	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-20 07:49:26.30737	2021-12-20 07:49:26.30737	\N
139	136	BxBlockPosts::Post	47	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-20 08:00:27.983853	2021-12-20 08:00:27.983853	\N
140	297	BxBlockPosts::Post	13	Temp User                   liked your BxBlockPosts::Post	f	2021-12-20 11:15:47.386449	2021-12-20 11:15:47.386449	\N
141	136	BxBlockPosts::Post	47	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-20 12:03:05.14491	2021-12-20 12:03:05.14491	\N
142	136	BxBlockPosts::Post	47	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-20 12:03:53.326674	2021-12-20 12:03:53.326674	\N
143	136	BxBlockPosts::Post	47	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-20 12:03:56.491789	2021-12-20 12:03:56.491789	\N
144	305	BxBlockPosts::Post	55	Sara Greem                   liked your BxBlockPosts::Post	f	2021-12-21 10:46:14.145356	2021-12-21 10:46:14.145356	\N
145	136	BxBlockPosts::Post	56	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-21 13:25:35.381787	2021-12-21 13:25:35.381787	\N
146	136	BxBlockPosts::Post	57	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-22 09:17:26.684368	2021-12-22 09:17:26.684368	\N
147	137	BxBlockPosts::Post	56	Emma Johnson                   liked your BxBlockPosts::Post	f	2021-12-22 10:29:38.175963	2021-12-22 10:29:38.175963	\N
148	136	BxBlockPosts::Post	57	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-22 20:28:14.191317	2021-12-22 20:28:14.191317	\N
149	136	BxBlockPosts::Post	53	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-22 21:02:56.274207	2021-12-22 21:02:56.274207	\N
150	259	BxBlockPosts::Post	46	Aksay Kumar                   liked your BxBlockPosts::Post	f	2021-12-23 08:21:54.780978	2021-12-23 08:21:54.780978	\N
151	259	BxBlockPosts::Post	45	Aksay Kumar                   liked your BxBlockPosts::Post	f	2021-12-23 08:22:03.776985	2021-12-23 08:22:03.776985	\N
152	259	BxBlockPosts::Post	39	Aksay Kumar                   liked your BxBlockPosts::Post	f	2021-12-23 08:22:12.295221	2021-12-23 08:22:12.295221	\N
153	136	BxBlockPosts::Post	55	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-23 08:24:44.776363	2021-12-23 08:24:44.776363	\N
154	136	BxBlockPosts::Post	57	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-23 16:38:24.877264	2021-12-23 16:38:24.877264	\N
155	136	BxBlockPosts::Post	56	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-23 16:39:01.084988	2021-12-23 16:39:01.084988	\N
156	133	BxBlockPosts::Post	53	DB USER                   liked your BxBlockPosts::Post	f	2021-12-24 07:07:16.233769	2021-12-24 07:07:16.233769	\N
157	133	BxBlockPosts::Post	55	DB USER                   liked your BxBlockPosts::Post	f	2021-12-24 08:27:38.736457	2021-12-24 08:27:38.736457	\N
158	136	BxBlockPosts::Post	57	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-24 09:51:33.1087	2021-12-24 09:51:33.1087	\N
159	136	BxBlockPosts::Post	57	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-24 11:36:03.793542	2021-12-24 11:36:03.793542	\N
160	136	BxBlockPosts::Post	13	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-28 10:14:09.294971	2021-12-28 10:14:09.294971	\N
161	136	BxBlockPosts::Post	43	Will Smith                   liked your BxBlockPosts::Post	f	2021-12-28 10:15:17.65735	2021-12-28 10:15:17.65735	\N
162	136	BxBlockPosts::Post	56	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-04 09:04:25.785194	2022-01-04 09:04:25.785194	\N
163	136	BxBlockPosts::Post	57	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-04 11:54:43.956479	2022-01-04 11:54:43.956479	\N
164	136	BxBlockPosts::Post	13	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-04 11:56:36.215681	2022-01-04 11:56:36.215681	\N
165	124	BxBlockComments::Comment	1	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-05 08:36:43.097529	2022-01-05 08:36:43.097529	\N
166	124	BxBlockComments::Comment	1	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-05 08:40:22.827017	2022-01-05 08:40:22.827017	\N
167	124	BxBlockComments::Comment	20	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-05 08:47:54.791985	2022-01-05 08:47:54.791985	\N
168	124	BxBlockComments::Comment	20	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-05 08:55:03.09441	2022-01-05 08:55:03.09441	\N
169	124	BxBlockComments::Comment	20	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-05 08:59:41.758896	2022-01-05 08:59:41.758896	\N
170	124	BxBlockComments::Comment	20	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-05 09:00:00.124764	2022-01-05 09:00:00.124764	\N
171	124	BxBlockComments::Comment	19	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-05 09:03:16.606414	2022-01-05 09:03:16.606414	\N
172	136	BxBlockPosts::Post	56	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-05 09:47:04.063975	2022-01-05 09:47:04.063975	\N
173	136	BxBlockPosts::Post	13	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-05 09:48:51.892587	2022-01-05 09:48:51.892587	\N
174	124	BxBlockPosts::Post	45	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-05 10:33:38.577887	2022-01-05 10:33:38.577887	\N
175	124	BxBlockPosts::Post	45	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-05 10:38:21.483647	2022-01-05 10:38:21.483647	\N
176	124	BxBlockPosts::Post	45	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-05 10:38:34.971343	2022-01-05 10:38:34.971343	\N
177	124	BxBlockComments::Comment	20	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-05 11:10:27.720201	2022-01-05 11:10:27.720201	\N
178	259	BxBlockPosts::Post	46	Aksay Kumar                   liked your BxBlockPosts::Post	f	2022-01-05 11:18:14.075241	2022-01-05 11:18:14.075241	\N
179	259	BxBlockPosts::Post	46	Aksay Kumar                   liked your BxBlockPosts::Post	f	2022-01-05 11:23:58.359272	2022-01-05 11:23:58.359272	\N
180	365	BxBlockPosts::Post	13	Dan Vall                   liked your BxBlockPosts::Post	f	2022-01-05 13:54:46.704808	2022-01-05 13:54:46.704808	\N
181	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-06 04:19:45.940746	2022-01-06 04:19:45.940746	\N
182	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-06 04:44:12.421052	2022-01-06 04:44:12.421052	\N
183	124	BxBlockComments::Comment	25	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-06 04:44:29.424888	2022-01-06 04:44:29.424888	\N
184	124	BxBlockComments::Comment	26	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-06 06:21:18.175691	2022-01-06 06:21:18.175691	\N
185	136	BxBlockPosts::Post	57	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-06 08:09:33.377306	2022-01-06 08:09:33.377306	\N
186	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-06 08:42:25.639574	2022-01-06 08:42:25.639574	\N
187	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-06 08:44:41.106905	2022-01-06 08:44:41.106905	\N
188	124	BxBlockComments::Comment	26	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-06 08:44:47.113122	2022-01-06 08:44:47.113122	\N
189	259	BxBlockComments::Comment	29	Aksay Kumar                   liked your BxBlockComments::Comment	f	2022-01-06 09:50:29.282084	2022-01-06 09:50:29.282084	\N
190	259	BxBlockPosts::Post	46	Aksay Kumar                   liked your BxBlockPosts::Post	f	2022-01-06 10:24:50.286053	2022-01-06 10:24:50.286053	\N
191	136	BxBlockPosts::Post	57	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-06 11:37:50.320487	2022-01-06 11:37:50.320487	\N
192	124	BxBlockComments::Comment	37	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-07 09:23:55.558081	2022-01-07 09:23:55.558081	\N
193	124	BxBlockComments::Comment	37	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-07 09:30:01.679768	2022-01-07 09:30:01.679768	\N
194	124	BxBlockComments::Comment	45	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-07 09:50:49.282785	2022-01-07 09:50:49.282785	\N
195	124	BxBlockComments::Comment	41	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-07 12:59:10.798133	2022-01-07 12:59:10.798133	\N
196	248	BxBlockComments::Comment	53	Olena Romanek                   liked your BxBlockComments::Comment	f	2022-01-10 06:47:59.091198	2022-01-10 06:47:59.091198	\N
197	248	BxBlockComments::Comment	53	Olena Romanek                   liked your BxBlockComments::Comment	f	2022-01-10 06:48:06.681881	2022-01-10 06:48:06.681881	\N
198	248	BxBlockPosts::Post	27	Olena Romanek                   liked your BxBlockPosts::Post	f	2022-01-10 06:48:40.215319	2022-01-10 06:48:40.215319	\N
199	136	BxBlockPosts::Post	57	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-10 08:06:16.628119	2022-01-10 08:06:16.628119	\N
200	136	BxBlockComments::Comment	55	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 08:49:37.361816	2022-01-10 08:49:37.361816	\N
201	136	BxBlockComments::Comment	56	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 08:50:56.345277	2022-01-10 08:50:56.345277	\N
202	136	BxBlockComments::Comment	57	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 08:50:57.834755	2022-01-10 08:50:57.834755	\N
203	136	BxBlockComments::Comment	58	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 08:51:12.033992	2022-01-10 08:51:12.033992	\N
204	136	BxBlockPosts::Post	56	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-10 09:29:34.004777	2022-01-10 09:29:34.004777	\N
205	136	BxBlockPosts::Post	56	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-10 09:29:35.624376	2022-01-10 09:29:35.624376	\N
206	136	BxBlockPosts::Post	56	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-10 09:29:37.010736	2022-01-10 09:29:37.010736	\N
207	136	BxBlockPosts::Post	56	Will Smith                   liked your BxBlockPosts::Post	f	2022-01-10 09:29:38.198226	2022-01-10 09:29:38.198226	\N
208	136	BxBlockComments::Comment	60	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 09:47:50.059937	2022-01-10 09:47:50.059937	\N
209	129	BxBlockPosts::Post	61	test test                   liked your BxBlockPosts::Post	f	2022-01-10 10:18:07.189188	2022-01-10 10:18:07.189188	\N
210	271	BxBlockPosts::Post	61	test testt                   liked your BxBlockPosts::Post	f	2022-01-10 10:18:52.449449	2022-01-10 10:18:52.449449	\N
211	271	BxBlockPosts::Post	60	test testt                   liked your BxBlockPosts::Post	f	2022-01-10 10:18:54.732931	2022-01-10 10:18:54.732931	\N
212	271	BxBlockPosts::Post	59	test testt                   liked your BxBlockPosts::Post	f	2022-01-10 10:19:00.570011	2022-01-10 10:19:00.570011	\N
213	271	BxBlockPosts::Post	58	test testt                   liked your BxBlockPosts::Post	f	2022-01-10 10:19:01.978684	2022-01-10 10:19:01.978684	\N
214	271	BxBlockPosts::Post	53	test testt                   liked your BxBlockPosts::Post	f	2022-01-10 10:19:03.69776	2022-01-10 10:19:03.69776	\N
215	271	BxBlockPosts::Post	33	test testt                   liked your BxBlockPosts::Post	f	2022-01-10 10:19:05.661474	2022-01-10 10:19:05.661474	\N
216	271	BxBlockPosts::Post	26	test testt                   liked your BxBlockPosts::Post	f	2022-01-10 10:19:10.495426	2022-01-10 10:19:10.495426	\N
217	271	BxBlockPosts::Post	25	test testt                   liked your BxBlockPosts::Post	f	2022-01-10 10:19:12.305944	2022-01-10 10:19:12.305944	\N
218	271	BxBlockPosts::Post	23	test testt                   liked your BxBlockPosts::Post	f	2022-01-10 10:19:16.033824	2022-01-10 10:19:16.033824	\N
220	271	BxBlockPosts::Post	2	test testt                   liked your BxBlockPosts::Post	f	2022-01-10 10:19:19.997363	2022-01-10 10:19:19.997363	\N
219	271	BxBlockPosts::Post	15	test testt                   liked your BxBlockPosts::Post	f	2022-01-10 10:19:17.820294	2022-01-10 10:19:17.820294	\N
221	368	BxBlockPosts::Post	62	Re Pid                   liked your BxBlockPosts::Post	f	2022-01-10 10:35:59.707605	2022-01-10 10:35:59.707605	\N
222	368	BxBlockComments::Comment	61	Re Pid                   liked your BxBlockComments::Comment	f	2022-01-10 10:36:18.397105	2022-01-10 10:36:18.397105	\N
223	368	BxBlockComments::Comment	62	Re Pid                   liked your BxBlockComments::Comment	f	2022-01-10 10:45:58.071617	2022-01-10 10:45:58.071617	\N
224	136	BxBlockComments::Comment	62	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 10:46:12.652662	2022-01-10 10:46:12.652662	\N
225	136	BxBlockComments::Comment	61	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 10:46:13.919794	2022-01-10 10:46:13.919794	\N
226	129	BxBlockPosts::Post	60	test test                   liked your BxBlockPosts::Post	f	2022-01-10 11:06:51.629965	2022-01-10 11:06:51.629965	\N
227	129	BxBlockPosts::Post	59	test test                   liked your BxBlockPosts::Post	f	2022-01-10 11:06:56.162158	2022-01-10 11:06:56.162158	\N
228	129	BxBlockPosts::Post	58	test test                   liked your BxBlockPosts::Post	f	2022-01-10 11:07:00.649451	2022-01-10 11:07:00.649451	\N
229	129	BxBlockPosts::Post	53	test test                   liked your BxBlockPosts::Post	f	2022-01-10 11:07:05.591221	2022-01-10 11:07:05.591221	\N
230	136	BxBlockComments::Comment	61	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 11:15:35.966348	2022-01-10 11:15:35.966348	\N
231	136	BxBlockComments::Comment	67	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 11:44:29.468938	2022-01-10 11:44:29.468938	\N
232	136	BxBlockComments::Comment	62	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 11:54:44.911796	2022-01-10 11:54:44.911796	\N
233	136	BxBlockComments::Comment	62	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 11:54:46.956258	2022-01-10 11:54:46.956258	\N
234	136	BxBlockComments::Comment	62	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 11:58:37.712343	2022-01-10 11:58:37.712343	\N
235	136	BxBlockComments::Comment	62	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 11:58:46.510406	2022-01-10 11:58:46.510406	\N
236	129	BxBlockComments::Comment	66	test test                   liked your BxBlockComments::Comment	f	2022-01-10 12:02:50.39906	2022-01-10 12:02:50.39906	\N
237	136	BxBlockComments::Comment	68	Will Smith                   liked your BxBlockComments::Comment	f	2022-01-10 12:03:20.247097	2022-01-10 12:03:20.247097	\N
238	305	BxBlockComments::Comment	70	Sara Greem                   liked your BxBlockComments::Comment	f	2022-01-11 07:41:48.84811	2022-01-11 07:41:48.84811	\N
239	370	BxBlockPosts::Post	56	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-11 08:33:25.00698	2022-01-11 08:33:25.00698	\N
240	137	BxBlockComments::Comment	74	Emma Johnson                   liked your BxBlockComments::Comment	f	2022-01-11 08:40:03.109827	2022-01-11 08:40:03.109827	\N
241	129	BxBlockComments::Comment	81	test test                   liked your BxBlockComments::Comment	f	2022-01-11 13:00:56.72445	2022-01-11 13:00:56.72445	\N
242	124	BxBlockComments::Comment	46	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:15:10.348307	2022-01-12 09:15:10.348307	\N
243	124	BxBlockComments::Comment	43	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:15:16.238587	2022-01-12 09:15:16.238587	\N
244	124	BxBlockComments::Comment	36	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:17:14.846311	2022-01-12 09:17:14.846311	\N
245	124	BxBlockComments::Comment	36	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:21:59.77942	2022-01-12 09:21:59.77942	\N
246	137	BxBlockPosts::Post	67	Emma Johnson                   liked your BxBlockPosts::Post	f	2022-01-12 09:28:20.458333	2022-01-12 09:28:20.458333	\N
247	370	BxBlockComments::Comment	82	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-12 09:29:53.799579	2022-01-12 09:29:53.799579	\N
248	124	BxBlockComments::Comment	36	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:30:07.382522	2022-01-12 09:30:07.382522	\N
249	124	BxBlockComments::Comment	49	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:30:26.585241	2022-01-12 09:30:26.585241	\N
250	124	BxBlockComments::Comment	36	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:34:31.185936	2022-01-12 09:34:31.185936	\N
251	124	BxBlockComments::Comment	49	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:34:41.598039	2022-01-12 09:34:41.598039	\N
252	124	BxBlockComments::Comment	48	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:34:52.940863	2022-01-12 09:34:52.940863	\N
253	124	BxBlockComments::Comment	28	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:39:06.326442	2022-01-12 09:39:06.326442	\N
254	124	BxBlockComments::Comment	24	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:39:11.413698	2022-01-12 09:39:11.413698	\N
255	124	BxBlockComments::Comment	24	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-12 09:39:16.904239	2022-01-12 09:39:16.904239	\N
256	259	BxBlockComments::Comment	36	Aksay Kumar                   liked your BxBlockComments::Comment	f	2022-01-12 09:56:12.610054	2022-01-12 09:56:12.610054	\N
257	259	BxBlockComments::Comment	36	Aksay Kumar                   liked your BxBlockComments::Comment	f	2022-01-12 09:56:36.50969	2022-01-12 09:56:36.50969	\N
258	259	BxBlockComments::Comment	49	Aksay Kumar                   liked your BxBlockComments::Comment	f	2022-01-12 09:56:46.291075	2022-01-12 09:56:46.291075	\N
259	259	BxBlockComments::Comment	49	Aksay Kumar                   liked your BxBlockComments::Comment	f	2022-01-12 09:59:22.343946	2022-01-12 09:59:22.343946	\N
260	259	BxBlockComments::Comment	36	Aksay Kumar                   liked your BxBlockComments::Comment	f	2022-01-12 09:59:30.903358	2022-01-12 09:59:30.903358	\N
261	259	BxBlockComments::Comment	48	Aksay Kumar                   liked your BxBlockComments::Comment	f	2022-01-12 09:59:40.746605	2022-01-12 09:59:40.746605	\N
262	124	BxBlockComments::Comment	26	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-13 06:17:38.157237	2022-01-13 06:17:38.157237	\N
263	133	BxBlockPosts::Post	61	DB USER                   liked your BxBlockPosts::Post	f	2022-01-13 07:10:03.664305	2022-01-13 07:10:03.664305	\N
264	129	BxBlockComments::Comment	88	test test                   liked your BxBlockComments::Comment	f	2022-01-13 07:10:41.357769	2022-01-13 07:10:41.357769	\N
265	370	BxBlockComments::Comment	92	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-13 08:18:17.82841	2022-01-13 08:18:17.82841	\N
266	129	BxBlockComments::Comment	97	test test                   liked your BxBlockComments::Comment	f	2022-01-13 09:15:10.068421	2022-01-13 09:15:10.068421	\N
267	370	BxBlockPosts::Post	68	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-13 09:55:35.299936	2022-01-13 09:55:35.299936	\N
268	370	BxBlockPosts::Post	68	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-13 09:55:39.987923	2022-01-13 09:55:39.987923	\N
269	137	BxBlockPosts::Post	68	Emma Johnson                   liked your BxBlockPosts::Post	f	2022-01-13 09:56:33.621489	2022-01-13 09:56:33.621489	\N
270	137	BxBlockPosts::Post	68	Emma Johnson                   liked your BxBlockPosts::Post	f	2022-01-13 09:56:40.517529	2022-01-13 09:56:40.517529	\N
271	137	BxBlockComments::Comment	103	Emma Johnson                   liked your BxBlockComments::Comment	f	2022-01-13 10:03:37.442784	2022-01-13 10:03:37.442784	\N
272	370	BxBlockComments::Comment	101	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-13 10:04:38.604135	2022-01-13 10:04:38.604135	\N
273	137	BxBlockComments::Comment	106	Emma Johnson                   liked your BxBlockComments::Comment	f	2022-01-13 11:08:55.861437	2022-01-13 11:08:55.861437	\N
274	137	BxBlockPosts::Post	69	Emma Johnson                   liked your BxBlockPosts::Post	f	2022-01-13 11:12:20.610035	2022-01-13 11:12:20.610035	\N
275	370	BxBlockPosts::Post	72	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-13 12:43:56.302273	2022-01-13 12:43:56.302273	\N
276	370	BxBlockComments::Comment	110	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-13 13:38:44.253283	2022-01-13 13:38:44.253283	\N
277	376	BxBlockComments::Comment	110	Sarah Paulson                   liked your BxBlockComments::Comment	f	2022-01-13 13:39:28.559024	2022-01-13 13:39:28.559024	\N
278	370	BxBlockPosts::Post	70	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-14 08:15:13.834147	2022-01-14 08:15:13.834147	\N
279	370	BxBlockComments::Comment	109	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-14 08:15:20.453804	2022-01-14 08:15:20.453804	\N
280	133	BxBlockComments::Comment	126	DB USER                   liked your BxBlockComments::Comment	f	2022-01-14 15:17:33.518961	2022-01-14 15:17:33.518961	\N
281	297	BxBlockPosts::Post	13	Temp User                   liked your BxBlockPosts::Post	f	2022-01-14 15:21:09.703056	2022-01-14 15:21:09.703056	\N
282	133	BxBlockComments::Comment	127	DB USER                   liked your BxBlockComments::Comment	f	2022-01-14 15:24:37.560234	2022-01-14 15:24:37.560234	\N
283	133	BxBlockComments::Comment	129	DB USER                   liked your BxBlockComments::Comment	f	2022-01-14 15:34:24.732659	2022-01-14 15:34:24.732659	\N
284	124	BxBlockComments::Comment	133	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-17 06:22:44.961385	2022-01-17 06:22:44.961385	\N
285	124	BxBlockPosts::Post	34	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-17 06:27:06.936705	2022-01-17 06:27:06.936705	\N
286	124	BxBlockPosts::Post	20	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-17 06:30:37.381992	2022-01-17 06:30:37.381992	\N
287	124	BxBlockPosts::Post	20	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-17 06:31:21.782258	2022-01-17 06:31:21.782258	\N
288	124	BxBlockComments::Comment	134	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-17 06:32:01.22833	2022-01-17 06:32:01.22833	\N
289	297	BxBlockComments::Comment	91	Temp User                   liked your BxBlockComments::Comment	f	2022-01-17 07:33:41.806455	2022-01-17 07:33:41.806455	\N
290	297	BxBlockComments::Comment	128	Temp User                   liked your BxBlockComments::Comment	f	2022-01-17 07:33:43.220093	2022-01-17 07:33:43.220093	\N
291	297	BxBlockComments::Comment	127	Temp User                   liked your BxBlockComments::Comment	f	2022-01-17 07:33:45.289192	2022-01-17 07:33:45.289192	\N
292	297	BxBlockComments::Comment	129	Temp User                   liked your BxBlockComments::Comment	f	2022-01-17 07:33:53.582261	2022-01-17 07:33:53.582261	\N
293	144	BxBlockPosts::Post	22	Michael Core                   liked your BxBlockPosts::Post	f	2022-01-17 07:55:07.768777	2022-01-17 07:55:07.768777	\N
294	137	BxBlockComments::Comment	95	Emma Johnson                   liked your BxBlockComments::Comment	f	2022-01-17 13:31:44.443679	2022-01-17 13:31:44.443679	\N
295	259	BxBlockComments::Comment	143	Aksay Kumar                   liked your BxBlockComments::Comment	f	2022-01-18 06:33:23.103064	2022-01-18 06:33:23.103064	\N
296	248	BxBlockPosts::Post	70	Olena Romanek                   liked your BxBlockPosts::Post	f	2022-01-18 06:56:38.044638	2022-01-18 06:56:38.044638	\N
297	248	BxBlockPosts::Post	69	Olena Romanek                   liked your BxBlockPosts::Post	f	2022-01-18 06:56:41.956182	2022-01-18 06:56:41.956182	\N
298	248	BxBlockPosts::Post	67	Olena Romanek                   liked your BxBlockPosts::Post	f	2022-01-18 06:57:21.423223	2022-01-18 06:57:21.423223	\N
299	248	BxBlockPosts::Post	68	Olena Romanek                   liked your BxBlockPosts::Post	f	2022-01-18 07:00:35.672182	2022-01-18 07:00:35.672182	\N
300	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-18 08:54:35.883088	2022-01-18 08:54:35.883088	\N
301	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-18 08:55:49.428549	2022-01-18 08:55:49.428549	\N
302	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-18 08:59:30.172191	2022-01-18 08:59:30.172191	\N
303	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-18 08:59:53.941472	2022-01-18 08:59:53.941472	\N
304	124	BxBlockComments::Comment	144	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-18 09:01:45.607616	2022-01-18 09:01:45.607616	\N
305	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-18 09:06:16.710508	2022-01-18 09:06:16.710508	\N
306	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-18 09:06:34.87605	2022-01-18 09:06:34.87605	\N
307	129	BxBlockPosts::Post	77	test test                   liked your BxBlockPosts::Post	f	2022-01-18 09:30:27.454483	2022-01-18 09:30:27.454483	\N
308	259	BxBlockPosts::Post	76	Aksay Kumar                   liked your BxBlockPosts::Post	f	2022-01-18 10:52:12.645517	2022-01-18 10:52:12.645517	\N
309	259	BxBlockComments::Comment	146	Aksay Kumar                   liked your BxBlockComments::Comment	f	2022-01-18 10:52:37.132415	2022-01-18 10:52:37.132415	\N
310	259	BxBlockPosts::Post	75	Aksay Kumar                   liked your BxBlockPosts::Post	f	2022-01-18 12:17:48.519712	2022-01-18 12:17:48.519712	\N
311	259	BxBlockPosts::Post	74	Aksay Kumar                   liked your BxBlockPosts::Post	f	2022-01-18 12:17:53.400743	2022-01-18 12:17:53.400743	\N
312	259	BxBlockComments::Comment	147	Aksay Kumar                   liked your BxBlockComments::Comment	f	2022-01-18 12:18:57.551514	2022-01-18 12:18:57.551514	\N
313	259	BxBlockComments::Comment	148	Aksay Kumar                   liked your BxBlockComments::Comment	f	2022-01-18 12:49:19.486276	2022-01-18 12:49:19.486276	\N
314	259	BxBlockPosts::Post	76	Aksay Kumar                   liked your BxBlockPosts::Post	f	2022-01-18 12:51:29.382435	2022-01-18 12:51:29.382435	\N
315	259	BxBlockPosts::Post	76	Aksay Kumar                   liked your BxBlockPosts::Post	f	2022-01-18 12:51:38.389873	2022-01-18 12:51:38.389873	\N
316	259	BxBlockPosts::Post	75	Aksay Kumar                   liked your BxBlockPosts::Post	f	2022-01-18 12:51:52.27978	2022-01-18 12:51:52.27978	\N
317	259	BxBlockPosts::Post	74	Aksay Kumar                   liked your BxBlockPosts::Post	f	2022-01-18 12:51:59.162011	2022-01-18 12:51:59.162011	\N
318	129	BxBlockPosts::Post	77	test test                   liked your BxBlockPosts::Post	f	2022-01-19 04:42:26.447274	2022-01-19 04:42:26.447274	\N
319	129	BxBlockPosts::Post	77	test test                   liked your BxBlockPosts::Post	f	2022-01-19 04:42:29.462985	2022-01-19 04:42:29.462985	\N
320	129	BxBlockPosts::Post	74	test test                   liked your BxBlockPosts::Post	f	2022-01-19 04:42:41.759032	2022-01-19 04:42:41.759032	\N
321	124	BxBlockPosts::Post	75	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 04:51:50.759792	2022-01-19 04:51:50.759792	\N
322	124	BxBlockPosts::Post	78	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 06:37:40.727935	2022-01-19 06:37:40.727935	\N
323	124	BxBlockPosts::Post	77	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 06:38:05.778432	2022-01-19 06:38:05.778432	\N
324	124	BxBlockPosts::Post	78	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 06:41:19.991587	2022-01-19 06:41:19.991587	\N
325	124	BxBlockPosts::Post	77	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 06:41:28.208221	2022-01-19 06:41:28.208221	\N
326	124	BxBlockPosts::Post	78	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 06:41:31.286129	2022-01-19 06:41:31.286129	\N
327	124	BxBlockPosts::Post	78	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 06:41:40.077467	2022-01-19 06:41:40.077467	\N
328	248	BxBlockPosts::Post	62	Olena Romanek                   liked your BxBlockPosts::Post	f	2022-01-19 07:02:11.625078	2022-01-19 07:02:11.625078	\N
329	133	BxBlockPosts::Post	74	DB USER                   liked your BxBlockPosts::Post	f	2022-01-19 07:11:15.082939	2022-01-19 07:11:15.082939	\N
330	370	BxBlockPosts::Post	62	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-19 07:51:22.196622	2022-01-19 07:51:22.196622	\N
331	370	BxBlockPosts::Post	62	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-19 07:51:25.478148	2022-01-19 07:51:25.478148	\N
332	124	BxBlockPosts::Post	73	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 08:40:48.047628	2022-01-19 08:40:48.047628	\N
333	370	BxBlockPosts::Post	79	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-19 09:40:01.977249	2022-01-19 09:40:01.977249	\N
334	370	BxBlockComments::Comment	150	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-19 09:40:51.262866	2022-01-19 09:40:51.262866	\N
335	370	BxBlockPosts::Post	80	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-19 10:04:57.298295	2022-01-19 10:04:57.298295	\N
336	370	BxBlockComments::Comment	151	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-19 10:05:07.284481	2022-01-19 10:05:07.284481	\N
337	370	BxBlockComments::Comment	152	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-19 10:05:17.461815	2022-01-19 10:05:17.461815	\N
338	370	BxBlockComments::Comment	62	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-19 10:06:41.965663	2022-01-19 10:06:41.965663	\N
339	370	BxBlockPosts::Post	57	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-19 10:08:06.323255	2022-01-19 10:08:06.323255	\N
340	370	BxBlockPosts::Post	67	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-19 10:08:20.041024	2022-01-19 10:08:20.041024	\N
341	370	BxBlockPosts::Post	67	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-19 10:08:23.830029	2022-01-19 10:08:23.830029	\N
342	370	BxBlockPosts::Post	67	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-19 10:16:14.485032	2022-01-19 10:16:14.485032	\N
343	124	BxBlockPosts::Post	78	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 11:17:41.813983	2022-01-19 11:17:41.813983	\N
344	137	BxBlockPosts::Post	80	Emma Johnson                   liked your BxBlockPosts::Post	f	2022-01-19 11:42:48.873813	2022-01-19 11:42:48.873813	\N
345	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 12:43:28.772088	2022-01-19 12:43:28.772088	\N
346	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 12:47:50.714106	2022-01-19 12:47:50.714106	\N
347	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 12:47:54.524916	2022-01-19 12:47:54.524916	\N
348	124	BxBlockComments::Comment	157	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-19 12:49:23.80899	2022-01-19 12:49:23.80899	\N
349	124	BxBlockComments::Comment	132	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-19 12:50:30.357002	2022-01-19 12:50:30.357002	\N
350	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-19 12:54:49.868381	2022-01-19 12:54:49.868381	\N
351	124	BxBlockComments::Comment	158	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-19 12:54:54.012835	2022-01-19 12:54:54.012835	\N
352	376	BxBlockPosts::Post	80	Sarah Paulson                   liked your BxBlockPosts::Post	f	2022-01-19 13:15:59.598108	2022-01-19 13:15:59.598108	\N
353	376	BxBlockPosts::Post	80	Sarah Paulson                   liked your BxBlockPosts::Post	f	2022-01-19 13:16:01.75573	2022-01-19 13:16:01.75573	\N
354	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 05:25:37.659095	2022-01-20 05:25:37.659095	\N
355	124	BxBlockComments::Comment	169	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 06:19:41.456819	2022-01-20 06:19:41.456819	\N
356	124	BxBlockComments::Comment	169	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 06:21:38.675217	2022-01-20 06:21:38.675217	\N
357	124	BxBlockPosts::Post	74	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 06:22:33.447264	2022-01-20 06:22:33.447264	\N
358	124	BxBlockPosts::Post	74	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 06:25:35.538765	2022-01-20 06:25:35.538765	\N
359	124	BxBlockComments::Comment	170	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 06:40:53.709346	2022-01-20 06:40:53.709346	\N
360	124	BxBlockComments::Comment	126	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 08:06:08.124362	2022-01-20 08:06:08.124362	\N
361	124	BxBlockPosts::Post	61	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 08:08:41.393879	2022-01-20 08:08:41.393879	\N
362	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 09:18:36.22633	2022-01-20 09:18:36.22633	\N
363	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 09:22:20.762018	2022-01-20 09:22:20.762018	\N
364	124	BxBlockPosts::Post	73	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 09:44:35.868877	2022-01-20 09:44:35.868877	\N
365	124	BxBlockPosts::Post	75	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 09:45:29.97363	2022-01-20 09:45:29.97363	\N
366	124	BxBlockPosts::Post	75	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 09:58:47.748508	2022-01-20 09:58:47.748508	\N
367	124	BxBlockPosts::Post	60	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:00:03.753355	2022-01-20 10:00:03.753355	\N
368	124	BxBlockPosts::Post	75	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:19:04.346773	2022-01-20 10:19:04.346773	\N
369	124	BxBlockPosts::Post	60	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:19:15.23033	2022-01-20 10:19:15.23033	\N
370	124	BxBlockPosts::Post	73	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:19:46.447236	2022-01-20 10:19:46.447236	\N
371	124	BxBlockPosts::Post	60	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:19:53.151727	2022-01-20 10:19:53.151727	\N
372	124	BxBlockPosts::Post	60	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:21:38.496829	2022-01-20 10:21:38.496829	\N
373	124	BxBlockPosts::Post	59	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:22:31.990105	2022-01-20 10:22:31.990105	\N
374	124	BxBlockPosts::Post	60	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:46:43.879028	2022-01-20 10:46:43.879028	\N
375	124	BxBlockPosts::Post	45	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:46:52.917456	2022-01-20 10:46:52.917456	\N
376	124	BxBlockPosts::Post	61	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:48:45.729597	2022-01-20 10:48:45.729597	\N
377	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:49:27.696022	2022-01-20 10:49:27.696022	\N
378	124	BxBlockPosts::Post	74	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:49:38.591119	2022-01-20 10:49:38.591119	\N
379	124	BxBlockPosts::Post	61	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:49:50.458874	2022-01-20 10:49:50.458874	\N
380	124	BxBlockPosts::Post	60	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:49:56.002104	2022-01-20 10:49:56.002104	\N
381	124	BxBlockPosts::Post	75	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:50:05.719451	2022-01-20 10:50:05.719451	\N
382	124	BxBlockPosts::Post	73	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:55:06.91799	2022-01-20 10:55:06.91799	\N
383	124	BxBlockPosts::Post	45	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:55:40.490641	2022-01-20 10:55:40.490641	\N
384	124	BxBlockPosts::Post	77	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:56:21.918972	2022-01-20 10:56:21.918972	\N
385	124	BxBlockPosts::Post	74	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 10:56:27.032668	2022-01-20 10:56:27.032668	\N
386	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:00:33.773856	2022-01-20 11:00:33.773856	\N
387	124	BxBlockPosts::Post	75	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:01:51.366801	2022-01-20 11:01:51.366801	\N
388	124	BxBlockPosts::Post	60	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:06:14.307046	2022-01-20 11:06:14.307046	\N
389	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:08:00.667267	2022-01-20 11:08:00.667267	\N
390	124	BxBlockPosts::Post	75	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:08:18.641979	2022-01-20 11:08:18.641979	\N
391	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:12:52.616829	2022-01-20 11:12:52.616829	\N
392	124	BxBlockPosts::Post	75	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:15:28.337445	2022-01-20 11:15:28.337445	\N
393	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:22:42.753509	2022-01-20 11:22:42.753509	\N
394	124	BxBlockPosts::Post	75	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:22:58.252023	2022-01-20 11:22:58.252023	\N
395	124	BxBlockPosts::Post	77	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:23:12.040944	2022-01-20 11:23:12.040944	\N
396	124	BxBlockPosts::Post	61	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:23:51.98725	2022-01-20 11:23:51.98725	\N
397	124	BxBlockPosts::Post	75	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:24:04.213713	2022-01-20 11:24:04.213713	\N
398	124	BxBlockPosts::Post	45	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:24:16.358413	2022-01-20 11:24:16.358413	\N
399	124	BxBlockComments::Comment	173	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:30:30.121135	2022-01-20 11:30:30.121135	\N
400	124	BxBlockComments::Comment	168	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:32:12.794761	2022-01-20 11:32:12.794761	\N
401	124	BxBlockComments::Comment	156	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:32:26.26994	2022-01-20 11:32:26.26994	\N
402	124	BxBlockComments::Comment	173	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:33:06.546055	2022-01-20 11:33:06.546055	\N
403	124	BxBlockComments::Comment	175	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:33:17.345727	2022-01-20 11:33:17.345727	\N
404	124	BxBlockComments::Comment	164	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:33:24.304722	2022-01-20 11:33:24.304722	\N
405	124	BxBlockComments::Comment	111	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:33:35.993019	2022-01-20 11:33:35.993019	\N
406	124	BxBlockComments::Comment	28	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:37:51.370746	2022-01-20 11:37:51.370746	\N
407	124	BxBlockComments::Comment	167	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:43:00.178443	2022-01-20 11:43:00.178443	\N
408	124	BxBlockComments::Comment	23	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:43:11.615727	2022-01-20 11:43:11.615727	\N
409	124	BxBlockPosts::Post	45	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:43:17.091465	2022-01-20 11:43:17.091465	\N
411	124	BxBlockComments::Comment	97	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:43:37.880994	2022-01-20 11:43:37.880994	\N
413	124	BxBlockComments::Comment	166	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:43:55.459133	2022-01-20 11:43:55.459133	\N
410	124	BxBlockPosts::Post	53	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 11:43:25.346556	2022-01-20 11:43:25.346556	\N
412	124	BxBlockComments::Comment	86	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:43:42.969418	2022-01-20 11:43:42.969418	\N
414	124	BxBlockComments::Comment	165	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 11:44:03.517178	2022-01-20 11:44:03.517178	\N
415	124	BxBlockComments::Comment	173	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 12:05:27.130095	2022-01-20 12:05:27.130095	\N
416	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 12:05:51.627205	2022-01-20 12:05:51.627205	\N
417	124	BxBlockPosts::Post	75	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 12:06:09.108541	2022-01-20 12:06:09.108541	\N
418	124	BxBlockPosts::Post	83	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 12:15:06.222313	2022-01-20 12:15:06.222313	\N
419	124	BxBlockComments::Comment	177	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 13:07:49.07209	2022-01-20 13:07:49.07209	\N
420	124	BxBlockComments::Comment	143	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-20 13:07:53.992089	2022-01-20 13:07:53.992089	\N
421	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-20 13:07:59.178475	2022-01-20 13:07:59.178475	\N
422	371	BxBlockPosts::Post	76	Akshay Prajapati                   liked your BxBlockPosts::Post	f	2022-01-20 13:11:10.036769	2022-01-20 13:11:10.036769	\N
423	212	BxBlockPosts::Post	46	Daniel Valles                   liked your BxBlockPosts::Post	f	2022-01-20 19:11:15.601714	2022-01-20 19:11:15.601714	\N
424	212	BxBlockPosts::Post	46	Daniel Valles                   liked your BxBlockPosts::Post	f	2022-01-20 19:11:20.847195	2022-01-20 19:11:20.847195	\N
425	124	BxBlockPosts::Post	60	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 04:25:30.982979	2022-01-21 04:25:30.982979	\N
426	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 04:41:32.458051	2022-01-21 04:41:32.458051	\N
427	124	BxBlockPosts::Post	67	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 04:42:52.170272	2022-01-21 04:42:52.170272	\N
428	124	BxBlockPosts::Post	70	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 04:43:43.081126	2022-01-21 04:43:43.081126	\N
429	124	BxBlockPosts::Post	62	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 04:50:06.694499	2022-01-21 04:50:06.694499	\N
430	124	BxBlockPosts::Post	77	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 04:53:27.552759	2022-01-21 04:53:27.552759	\N
431	124	BxBlockPosts::Post	2	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 04:57:22.778716	2022-01-21 04:57:22.778716	\N
432	124	BxBlockPosts::Post	35	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 04:58:11.887169	2022-01-21 04:58:11.887169	\N
433	124	BxBlockPosts::Post	70	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 05:20:20.663063	2022-01-21 05:20:20.663063	\N
434	124	BxBlockPosts::Post	77	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 05:21:55.591794	2022-01-21 05:21:55.591794	\N
435	124	BxBlockPosts::Post	70	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 06:04:13.82866	2022-01-21 06:04:13.82866	\N
436	124	BxBlockPosts::Post	2	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 06:10:40.828199	2022-01-21 06:10:40.828199	\N
437	124	BxBlockComments::Comment	83	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 06:35:28.732788	2022-01-21 06:35:28.732788	\N
438	124	BxBlockPosts::Post	60	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 06:36:08.807139	2022-01-21 06:36:08.807139	\N
439	124	BxBlockComments::Comment	83	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 06:38:22.194375	2022-01-21 06:38:22.194375	\N
440	124	BxBlockComments::Comment	28	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 06:41:05.888938	2022-01-21 06:41:05.888938	\N
441	124	BxBlockComments::Comment	178	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 06:50:45.12241	2022-01-21 06:50:45.12241	\N
442	133	BxBlockPosts::Post	62	DB USER                   liked your BxBlockPosts::Post	f	2022-01-21 07:17:36.059838	2022-01-21 07:17:36.059838	\N
443	133	BxBlockPosts::Post	77	DB USER                   liked your BxBlockPosts::Post	f	2022-01-21 07:17:44.203024	2022-01-21 07:17:44.203024	\N
444	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 07:21:59.281272	2022-01-21 07:21:59.281272	\N
445	124	BxBlockComments::Comment	149	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 07:22:06.014393	2022-01-21 07:22:06.014393	\N
446	124	BxBlockPosts::Post	77	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 07:22:54.406884	2022-01-21 07:22:54.406884	\N
447	124	BxBlockPosts::Post	45	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 07:23:02.091094	2022-01-21 07:23:02.091094	\N
448	124	BxBlockComments::Comment	179	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 07:23:32.160233	2022-01-21 07:23:32.160233	\N
449	124	BxBlockComments::Comment	182	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 08:59:42.361181	2022-01-21 08:59:42.361181	\N
450	124	BxBlockComments::Comment	181	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 09:00:00.071006	2022-01-21 09:00:00.071006	\N
451	124	BxBlockComments::Comment	157	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 09:03:21.335624	2022-01-21 09:03:21.335624	\N
452	124	BxBlockComments::Comment	34	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 09:07:19.438534	2022-01-21 09:07:19.438534	\N
453	124	BxBlockComments::Comment	82	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 10:39:25.487114	2022-01-21 10:39:25.487114	\N
454	124	BxBlockComments::Comment	174	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 10:40:20.914332	2022-01-21 10:40:20.914332	\N
455	124	BxBlockComments::Comment	174	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 10:40:28.099471	2022-01-21 10:40:28.099471	\N
456	124	BxBlockPosts::Post	45	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-21 10:40:49.055689	2022-01-21 10:40:49.055689	\N
457	124	BxBlockComments::Comment	62	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 10:50:34.752074	2022-01-21 10:50:34.752074	\N
458	124	BxBlockComments::Comment	156	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 11:38:48.221925	2022-01-21 11:38:48.221925	\N
459	124	BxBlockComments::Comment	88	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-21 11:52:25.754071	2022-01-21 11:52:25.754071	\N
460	124	BxBlockPosts::Post	90	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-24 11:11:47.959092	2022-01-24 11:11:47.959092	\N
461	124	BxBlockComments::Comment	186	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-24 12:17:58.07623	2022-01-24 12:17:58.07623	\N
462	124	BxBlockComments::Comment	183	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-24 12:18:16.412651	2022-01-24 12:18:16.412651	\N
463	370	BxBlockPosts::Post	72	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-24 13:05:08.540573	2022-01-24 13:05:08.540573	\N
464	370	BxBlockComments::Comment	122	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-24 13:05:14.776225	2022-01-24 13:05:14.776225	\N
465	379	BxBlockPosts::Post	56	Benn Wisee                   liked your BxBlockPosts::Post	f	2022-01-24 13:56:32.571678	2022-01-24 13:56:32.571678	\N
466	379	BxBlockComments::Comment	187	Benn Wisee                   liked your BxBlockComments::Comment	f	2022-01-24 13:56:42.930684	2022-01-24 13:56:42.930684	\N
467	124	BxBlockPosts::Post	88	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-25 06:09:21.103661	2022-01-25 06:09:21.103661	\N
468	133	BxBlockComments::Comment	188	DB USER                   liked your BxBlockComments::Comment	f	2022-01-25 07:08:46.743596	2022-01-25 07:08:46.743596	\N
469	124	BxBlockPosts::Post	90	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-25 08:12:15.163526	2022-01-25 08:12:15.163526	\N
470	124	BxBlockPosts::Post	90	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-25 08:13:37.629744	2022-01-25 08:13:37.629744	\N
471	124	BxBlockPosts::Post	72	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-25 08:18:05.292601	2022-01-25 08:18:05.292601	\N
472	124	BxBlockPosts::Post	59	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-25 08:19:36.756839	2022-01-25 08:19:36.756839	\N
473	124	BxBlockPosts::Post	74	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-25 08:30:58.879542	2022-01-25 08:30:58.879542	\N
474	124	BxBlockPosts::Post	59	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-25 08:31:51.965783	2022-01-25 08:31:51.965783	\N
475	124	BxBlockComments::Comment	188	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 08:59:44.385967	2022-01-25 08:59:44.385967	\N
476	124	BxBlockComments::Comment	163	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:03:53.265861	2022-01-25 09:03:53.265861	\N
477	124	BxBlockComments::Comment	163	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:09:11.406283	2022-01-25 09:09:11.406283	\N
478	124	BxBlockComments::Comment	163	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:13:49.946952	2022-01-25 09:13:49.946952	\N
479	124	BxBlockComments::Comment	163	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:23:06.1965	2022-01-25 09:23:06.1965	\N
480	124	BxBlockComments::Comment	163	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:30:34.660509	2022-01-25 09:30:34.660509	\N
481	124	BxBlockComments::Comment	166	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:31:01.999471	2022-01-25 09:31:01.999471	\N
482	124	BxBlockComments::Comment	99	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:31:48.90384	2022-01-25 09:31:48.90384	\N
483	124	BxBlockComments::Comment	122	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:32:08.037405	2022-01-25 09:32:08.037405	\N
484	124	BxBlockComments::Comment	159	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:42:24.425039	2022-01-25 09:42:24.425039	\N
485	124	BxBlockComments::Comment	92	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:42:39.242486	2022-01-25 09:42:39.242486	\N
486	124	BxBlockComments::Comment	95	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:44:36.094596	2022-01-25 09:44:36.094596	\N
487	124	BxBlockPosts::Post	67	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-25 09:45:32.785173	2022-01-25 09:45:32.785173	\N
488	124	BxBlockComments::Comment	95	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:46:19.93513	2022-01-25 09:46:19.93513	\N
489	124	BxBlockPosts::Post	67	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-25 09:50:07.580313	2022-01-25 09:50:07.580313	\N
490	124	BxBlockComments::Comment	60	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 09:50:25.358495	2022-01-25 09:50:25.358495	\N
491	124	BxBlockComments::Comment	186	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 11:26:14.223788	2022-01-25 11:26:14.223788	\N
492	124	BxBlockComments::Comment	194	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 11:33:45.21821	2022-01-25 11:33:45.21821	\N
493	124	BxBlockComments::Comment	195	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 11:36:35.195992	2022-01-25 11:36:35.195992	\N
494	124	BxBlockComments::Comment	196	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 11:40:08.416112	2022-01-25 11:40:08.416112	\N
495	129	BxBlockComments::Comment	194	test test                   liked your BxBlockComments::Comment	f	2022-01-25 11:41:47.711736	2022-01-25 11:41:47.711736	\N
496	129	BxBlockComments::Comment	195	test test                   liked your BxBlockComments::Comment	f	2022-01-25 11:41:49.431635	2022-01-25 11:41:49.431635	\N
497	129	BxBlockComments::Comment	196	test test                   liked your BxBlockComments::Comment	f	2022-01-25 11:41:53.378285	2022-01-25 11:41:53.378285	\N
498	129	BxBlockComments::Comment	197	test test                   liked your BxBlockComments::Comment	f	2022-01-25 11:41:55.658355	2022-01-25 11:41:55.658355	\N
499	129	BxBlockComments::Comment	193	test test                   liked your BxBlockComments::Comment	f	2022-01-25 11:41:57.457187	2022-01-25 11:41:57.457187	\N
500	129	BxBlockComments::Comment	192	test test                   liked your BxBlockComments::Comment	f	2022-01-25 11:41:59.388383	2022-01-25 11:41:59.388383	\N
501	129	BxBlockComments::Comment	191	test test                   liked your BxBlockComments::Comment	f	2022-01-25 11:42:01.526286	2022-01-25 11:42:01.526286	\N
502	124	BxBlockComments::Comment	201	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 11:44:41.228133	2022-01-25 11:44:41.228133	\N
503	124	BxBlockComments::Comment	204	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 12:47:43.104181	2022-01-25 12:47:43.104181	\N
504	124	BxBlockComments::Comment	208	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 12:56:43.67499	2022-01-25 12:56:43.67499	\N
505	124	BxBlockComments::Comment	211	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-25 12:59:38.061983	2022-01-25 12:59:38.061983	\N
506	370	BxBlockPosts::Post	46	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-25 14:33:20.547635	2022-01-25 14:33:20.547635	\N
507	370	BxBlockPosts::Post	46	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-25 14:33:23.778365	2022-01-25 14:33:23.778365	\N
508	370	BxBlockPosts::Post	46	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-25 14:34:59.65053	2022-01-25 14:34:59.65053	\N
509	370	BxBlockPosts::Post	46	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-25 14:35:06.566534	2022-01-25 14:35:06.566534	\N
510	370	BxBlockPosts::Post	46	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-25 14:35:19.652542	2022-01-25 14:35:19.652542	\N
511	370	BxBlockComments::Comment	212	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-25 14:35:26.093554	2022-01-25 14:35:26.093554	\N
512	370	BxBlockPosts::Post	46	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-25 14:41:17.326833	2022-01-25 14:41:17.326833	\N
513	370	BxBlockPosts::Post	46	Evan Peters                   liked your BxBlockPosts::Post	f	2022-01-25 14:45:10.363765	2022-01-25 14:45:10.363765	\N
514	370	BxBlockComments::Comment	214	Evan Peters                   liked your BxBlockComments::Comment	f	2022-01-25 14:46:06.182305	2022-01-25 14:46:06.182305	\N
515	370	BxBlockPosts::Post	72	Evanт Petersт                   liked your BxBlockPosts::Post	f	2022-01-26 13:13:06.809988	2022-01-26 13:13:06.809988	\N
516	370	BxBlockPosts::Post	46	Evanт Petersт                   liked your BxBlockPosts::Post	f	2022-01-26 13:14:29.711619	2022-01-26 13:14:29.711619	\N
517	370	BxBlockPosts::Post	62	Evanт Petersт                   liked your BxBlockPosts::Post	f	2022-01-26 14:17:14.846623	2022-01-26 14:17:14.846623	\N
518	124	BxBlockComments::Comment	216	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 04:36:54.547022	2022-01-27 04:36:54.547022	\N
519	124	BxBlockComments::Comment	217	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 04:46:13.51614	2022-01-27 04:46:13.51614	\N
520	124	BxBlockComments::Comment	139	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 04:49:31.922377	2022-01-27 04:49:31.922377	\N
521	124	BxBlockComments::Comment	218	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 04:50:00.621782	2022-01-27 04:50:00.621782	\N
522	124	BxBlockComments::Comment	219	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 04:50:54.395095	2022-01-27 04:50:54.395095	\N
523	124	BxBlockComments::Comment	210	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 04:55:04.168467	2022-01-27 04:55:04.168467	\N
524	124	BxBlockComments::Comment	28	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 04:55:58.019986	2022-01-27 04:55:58.019986	\N
525	124	BxBlockComments::Comment	221	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 04:57:31.528297	2022-01-27 04:57:31.528297	\N
526	124	BxBlockComments::Comment	222	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 04:59:10.286691	2022-01-27 04:59:10.286691	\N
527	124	BxBlockComments::Comment	222	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 04:59:22.024472	2022-01-27 04:59:22.024472	\N
528	124	BxBlockComments::Comment	23	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 05:02:49.647514	2022-01-27 05:02:49.647514	\N
529	124	BxBlockComments::Comment	61	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 05:03:03.373732	2022-01-27 05:03:03.373732	\N
530	124	BxBlockComments::Comment	224	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 05:10:14.396889	2022-01-27 05:10:14.396889	\N
531	124	BxBlockComments::Comment	225	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 05:11:24.921018	2022-01-27 05:11:24.921018	\N
532	124	BxBlockPosts::Post	62	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 05:13:16.829981	2022-01-27 05:13:16.829981	\N
533	124	BxBlockPosts::Post	59	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 05:14:24.004686	2022-01-27 05:14:24.004686	\N
534	124	BxBlockPosts::Post	90	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 05:15:56.956799	2022-01-27 05:15:56.956799	\N
535	124	BxBlockPosts::Post	2	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 05:18:15.164811	2022-01-27 05:18:15.164811	\N
536	124	BxBlockComments::Comment	212	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 05:22:14.813918	2022-01-27 05:22:14.813918	\N
537	124	BxBlockPosts::Post	90	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 05:23:45.10452	2022-01-27 05:23:45.10452	\N
538	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 05:29:03.306417	2022-01-27 05:29:03.306417	\N
539	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 05:36:42.690017	2022-01-27 05:36:42.690017	\N
540	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 05:40:34.501507	2022-01-27 05:40:34.501507	\N
541	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 05:44:44.504971	2022-01-27 05:44:44.504971	\N
542	124	BxBlockPosts::Post	90	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 05:47:52.560312	2022-01-27 05:47:52.560312	\N
543	124	BxBlockComments::Comment	226	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 05:48:50.643029	2022-01-27 05:48:50.643029	\N
544	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 05:50:56.382472	2022-01-27 05:50:56.382472	\N
545	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 06:01:04.568192	2022-01-27 06:01:04.568192	\N
546	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 06:02:45.987993	2022-01-27 06:02:45.987993	\N
547	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 06:05:48.132234	2022-01-27 06:05:48.132234	\N
548	124	BxBlockPosts::Post	46	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 06:07:51.368049	2022-01-27 06:07:51.368049	\N
549	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 06:10:22.095808	2022-01-27 06:10:22.095808	\N
550	124	BxBlockPosts::Post	73	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 06:10:43.163177	2022-01-27 06:10:43.163177	\N
551	124	BxBlockComments::Comment	227	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 06:10:56.557433	2022-01-27 06:10:56.557433	\N
552	124	BxBlockComments::Comment	202	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 06:11:01.132598	2022-01-27 06:11:01.132598	\N
553	124	BxBlockPosts::Post	72	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 06:11:23.190197	2022-01-27 06:11:23.190197	\N
554	124	BxBlockComments::Comment	214	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 06:11:28.341277	2022-01-27 06:11:28.341277	\N
555	124	BxBlockComments::Comment	228	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 06:11:35.670828	2022-01-27 06:11:35.670828	\N
556	124	BxBlockComments::Comment	106	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 06:23:49.183567	2022-01-27 06:23:49.183567	\N
557	124	BxBlockComments::Comment	229	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 06:24:04.19098	2022-01-27 06:24:04.19098	\N
558	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 06:24:19.562443	2022-01-27 06:24:19.562443	\N
559	124	BxBlockComments::Comment	230	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 07:02:45.228611	2022-01-27 07:02:45.228611	\N
560	124	BxBlockComments::Comment	231	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 07:03:53.547914	2022-01-27 07:03:53.547914	\N
561	124	BxBlockPosts::Post	83	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 07:05:29.643155	2022-01-27 07:05:29.643155	\N
562	133	BxBlockPosts::Post	83	DB USER123                   liked your BxBlockPosts::Post	f	2022-01-27 07:08:21.391183	2022-01-27 07:08:21.391183	\N
563	124	BxBlockComments::Comment	212	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-27 07:50:01.206661	2022-01-27 07:50:01.206661	\N
564	370	BxBlockPosts::Post	91	Evanт Petersт                   liked your BxBlockPosts::Post	f	2022-01-27 09:04:10.967833	2022-01-27 09:04:10.967833	\N
565	370	BxBlockComments::Comment	234	Evanт Petersт                   liked your BxBlockComments::Comment	f	2022-01-27 09:04:39.338282	2022-01-27 09:04:39.338282	\N
566	124	BxBlockPosts::Post	94	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-27 09:36:10.935279	2022-01-27 09:36:10.935279	\N
567	370	BxBlockPosts::Post	94	Evanт Petersт                   liked your BxBlockPosts::Post	f	2022-01-27 13:18:21.168397	2022-01-27 13:18:21.168397	\N
568	370	BxBlockComments::Comment	237	Evanт Petersт                   liked your BxBlockComments::Comment	f	2022-01-27 13:27:40.953454	2022-01-27 13:27:40.953454	\N
569	370	BxBlockComments::Comment	235	Evanт Petersт                   liked your BxBlockComments::Comment	f	2022-01-27 13:27:45.14549	2022-01-27 13:27:45.14549	\N
570	370	BxBlockPosts::Post	95	Evanт Petersт                   liked your BxBlockPosts::Post	f	2022-01-27 13:30:42.967602	2022-01-27 13:30:42.967602	\N
571	376	BxBlockPosts::Post	95	Sarah Paulson                   liked your BxBlockPosts::Post	f	2022-01-27 13:32:25.836008	2022-01-27 13:32:25.836008	\N
572	124	BxBlockComments::Comment	236	arun murugan                   liked your BxBlockComments::Comment	f	2022-01-28 04:16:36.617456	2022-01-28 04:16:36.617456	\N
573	124	BxBlockPosts::Post	88	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-28 04:17:03.992799	2022-01-28 04:17:03.992799	\N
574	124	BxBlockPosts::Post	90	arun murugan                   liked your BxBlockPosts::Post	f	2022-01-28 04:18:02.294713	2022-01-28 04:18:02.294713	\N
575	370	BxBlockPosts::Post	72	Evanт Petersт                   liked your BxBlockPosts::Post	f	2022-01-28 09:37:56.684038	2022-01-28 09:37:56.684038	\N
576	370	BxBlockComments::Comment	239	Evanт Petersт                   liked your BxBlockComments::Comment	f	2022-01-28 09:38:09.87958	2022-01-28 09:38:09.87958	\N
577	133	BxBlockPosts::Post	94	DB USER123                   liked your BxBlockPosts::Post	f	2022-01-31 07:19:41.712073	2022-01-31 07:19:41.712073	\N
578	376	BxBlockPosts::Post	96	Sarah Paulson                   liked your BxBlockPosts::Post	f	2022-01-31 10:14:30.127638	2022-01-31 10:14:30.127638	\N
579	370	BxBlockPosts::Post	96	Evann Peterss                   liked your BxBlockPosts::Post	f	2022-01-31 12:10:13.167356	2022-01-31 12:10:13.167356	\N
580	370	BxBlockComments::Comment	243	Evann Peterss                   liked your BxBlockComments::Comment	f	2022-01-31 12:10:35.180695	2022-01-31 12:10:35.180695	\N
581	370	BxBlockComments::Comment	243	Evann Peterss                   liked your BxBlockComments::Comment	f	2022-01-31 12:10:37.04823	2022-01-31 12:10:37.04823	\N
582	370	BxBlockComments::Comment	244	Evann Peterss                   liked your BxBlockComments::Comment	f	2022-01-31 12:11:02.768861	2022-01-31 12:11:02.768861	\N
583	133	BxBlockPosts::Post	93	DB USER123                   liked your BxBlockPosts::Post	f	2022-02-01 07:11:13.150478	2022-02-01 07:11:13.150478	\N
584	248	BxBlockPosts::Post	47	Olena Romanek                   liked your BxBlockPosts::Post	f	2022-02-01 07:11:39.723406	2022-02-01 07:11:39.723406	\N
585	133	BxBlockPosts::Post	92	DB USER123                   liked your BxBlockPosts::Post	f	2022-02-01 07:12:07.817794	2022-02-01 07:12:07.817794	\N
586	137	BxBlockPosts::Post	57	Emma Johnson                   liked your BxBlockPosts::Post	f	2022-02-01 12:53:22.694024	2022-02-01 12:53:22.694024	\N
587	137	BxBlockComments::Comment	252	Emma Johnson                   liked your BxBlockComments::Comment	f	2022-02-01 12:53:35.683918	2022-02-01 12:53:35.683918	\N
588	137	BxBlockComments::Comment	60	Emma Johnson                   liked your BxBlockComments::Comment	f	2022-02-01 12:53:37.592995	2022-02-01 12:53:37.592995	\N
589	137	BxBlockPosts::Post	46	Emma Johnson                   liked your BxBlockPosts::Post	f	2022-02-01 13:02:11.425909	2022-02-01 13:02:11.425909	\N
590	137	BxBlockPosts::Post	72	Emmas Johnsons                   liked your BxBlockPosts::Post	f	2022-02-01 14:08:51.939531	2022-02-01 14:08:51.939531	\N
591	370	BxBlockComments::Comment	257	Evann Peterss                   liked your BxBlockComments::Comment	f	2022-02-01 15:15:38.186227	2022-02-01 15:15:38.186227	\N
592	137	BxBlockPosts::Post	72	Emmas Johnsons                   liked your BxBlockPosts::Post	f	2022-02-01 15:37:14.811652	2022-02-01 15:37:14.811652	\N
593	137	BxBlockComments::Comment	259	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:37:24.969354	2022-02-01 15:37:24.969354	\N
594	137	BxBlockComments::Comment	259	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:37:28.059868	2022-02-01 15:37:28.059868	\N
595	137	BxBlockComments::Comment	259	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:37:29.220955	2022-02-01 15:37:29.220955	\N
596	137	BxBlockComments::Comment	259	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:37:29.378535	2022-02-01 15:37:29.378535	\N
597	137	BxBlockComments::Comment	259	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:37:29.678772	2022-02-01 15:37:29.678772	\N
598	137	BxBlockComments::Comment	259	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:37:29.738893	2022-02-01 15:37:29.738893	\N
599	137	BxBlockComments::Comment	255	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:37:30.878024	2022-02-01 15:37:30.878024	\N
600	137	BxBlockComments::Comment	255	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:37:31.073831	2022-02-01 15:37:31.073831	\N
601	137	BxBlockComments::Comment	255	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:37:31.483872	2022-02-01 15:37:31.483872	\N
602	137	BxBlockComments::Comment	259	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:38:29.816138	2022-02-01 15:38:29.816138	\N
603	137	BxBlockComments::Comment	259	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:38:35.41205	2022-02-01 15:38:35.41205	\N
604	137	BxBlockComments::Comment	242	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:38:45.193344	2022-02-01 15:38:45.193344	\N
605	137	BxBlockComments::Comment	239	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:38:49.901953	2022-02-01 15:38:49.901953	\N
606	137	BxBlockComments::Comment	260	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:40:22.082367	2022-02-01 15:40:22.082367	\N
607	137	BxBlockComments::Comment	260	Emmas Johnsons                   liked your BxBlockComments::Comment	f	2022-02-01 15:40:27.132291	2022-02-01 15:40:27.132291	\N
608	137	BxBlockPosts::Post	17	Emmas Johnsons                   liked your BxBlockPosts::Post	f	2022-02-01 15:41:46.138476	2022-02-01 15:41:46.138476	\N
609	137	BxBlockPosts::Post	56	Emmas Johnsons                   liked your BxBlockPosts::Post	f	2022-02-01 15:43:45.640884	2022-02-01 15:43:45.640884	\N
610	124	BxBlockPosts::Post	97	arun murugan                   liked your BxBlockPosts::Post	f	2022-02-02 04:47:02.275078	2022-02-02 04:47:02.275078	\N
611	124	BxBlockComments::Comment	240	arun murugan                   liked your BxBlockComments::Comment	f	2022-02-02 04:47:09.610397	2022-02-02 04:47:09.610397	\N
612	124	BxBlockComments::Comment	263	arun murugan                   liked your BxBlockComments::Comment	f	2022-02-02 11:21:08.2412	2022-02-02 11:21:08.2412	\N
613	137	BxBlockPosts::Post	46	Emmas Johnsons                   liked your BxBlockPosts::Post	f	2022-02-02 11:36:13.150851	2022-02-02 11:36:13.150851	\N
614	248	BxBlockPosts::Post	57	Olena Romanek                   liked your BxBlockPosts::Post	f	2022-02-02 13:37:45.790019	2022-02-02 13:37:45.790019	\N
615	137	BxBlockPosts::Post	30	Emmas Johnsons                   liked your BxBlockPosts::Post	f	2022-02-03 15:53:22.923888	2022-02-03 15:53:22.923888	\N
616	378	BxBlockPosts::Post	46	Devid Cane                    liked your BxBlockPosts::Post	f	2022-02-04 09:04:49.308941	2022-02-04 09:04:49.308941	\N
617	378	BxBlockComments::Comment	266	Devid Cane                    liked your BxBlockComments::Comment	f	2022-02-04 09:04:54.493282	2022-02-04 09:04:54.493282	\N
618	136	BxBlockPosts::Post	30	Will Smith                   liked your BxBlockPosts::Post	f	2022-02-04 10:39:00.326079	2022-02-04 10:39:00.326079	\N
619	124	BxBlockComments::Comment	269	arun murugan                   liked your BxBlockComments::Comment	f	2022-02-07 05:43:42.782783	2022-02-07 05:43:42.782783	\N
620	124	BxBlockPosts::Post	76	arun murugan                   liked your BxBlockPosts::Post	f	2022-02-07 06:55:10.389577	2022-02-07 06:55:10.389577	\N
621	136	BxBlockComments::Comment	70	Will Smith                   liked your BxBlockComments::Comment	f	2022-02-08 07:58:23.646284	2022-02-08 07:58:23.646284	\N
\.


--
-- Data for Name: question_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_answers (id, question, answer, question_sub_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_sub_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_sub_types (id, sub_type, description, question_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_types (id, que_type, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: report_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_posts (id, account_id, post_id, report_reason_id, created_at, updated_at) FROM stdin;
1	371	46	3	2022-01-28 11:17:46.098768	2022-01-28 11:17:46.098768
4	371	61	3	2022-01-28 11:24:25.642	2022-01-28 11:24:25.642
5	371	76	3	2022-01-28 14:11:36.28693	2022-01-28 14:11:36.28693
6	371	75	1	2022-01-28 14:14:20.606204	2022-01-28 14:14:20.606204
7	371	75	3	2022-01-28 14:16:40.142335	2022-01-28 14:16:40.142335
8	371	74	2	2022-01-28 14:17:16.138799	2022-01-28 14:17:16.138799
9	266	74	3	2022-01-31 05:08:55.278449	2022-01-31 05:08:55.278449
10	266	2	2	2022-01-31 05:56:46.903349	2022-01-31 05:56:46.903349
12	370	46	1	2022-01-31 10:38:03.566966	2022-01-31 10:38:03.566966
15	371	76	2	2022-01-31 12:46:33.776066	2022-01-31 12:46:33.776066
16	371	34	2	2022-01-31 14:07:10.489029	2022-01-31 14:07:10.489029
17	371	20	3	2022-01-31 14:07:39.514185	2022-01-31 14:07:39.514185
19	133	94	1	2022-02-01 07:21:46.369824	2022-02-01 07:21:46.369824
22	137	46	1	2022-02-01 13:02:41.965599	2022-02-01 13:02:41.965599
33	133	2	1	2022-02-08 07:53:44.26315	2022-02-08 07:53:44.26315
\.


--
-- Data for Name: report_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_reasons (id, content, report_reason_id, created_at, updated_at) FROM stdin;
1	NFT ownership and rights	\N	2022-01-10 07:38:59.623352	2022-01-10 07:38:59.623352
2	Fraudulent or suspicious	\N	2022-01-10 07:40:05.780828	2022-01-10 07:40:05.780828
3	harmful or inappropriate	\N	2022-01-10 07:47:01.509752	2022-01-10 07:47:01.509752
4	Something else	\N	2022-01-10 07:47:16.651038	2022-01-10 07:47:16.651038
5	just report it	4	2022-01-28 07:21:50.381177	2022-01-28 07:21:50.381177
6	report it now	4	2022-01-28 07:23:49.843455	2022-01-28 07:23:49.843455
\.


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requests (id, account_id, sender_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, email, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20211014043233
20211014043234
20211014043235
20211014043236
20211014043237
20211014043238
20211014043239
20211014043240
20211014043241
20211014043242
20211014043243
20211014043244
20211014043245
20211014043246
20211014043247
20211014043248
20211014043249
20211014043250
20211014043251
20211014043252
20211014043253
20211014043254
20211014043255
20211014043256
20211014043257
20211014043258
20211014043259
20211014043260
20211014043261
20211014043262
20211014043263
20211014043264
20211014043265
20211014043266
20211014043267
20211014043268
20211014043269
20211014043270
20211014043271
20211014043272
20211014043273
20211014043274
20211014043275
20211014043276
20211014043277
20211014043278
20211014043279
20211014043280
20211014043281
20211014043282
20211014043283
20211014043284
20211014043285
20211014043286
20211014043287
20211014043288
20211014043289
20211014043290
20211014043291
20211014043292
20211014043293
20211014043294
20211014043295
20211014043296
20211014043297
20211014043298
20211014043299
20211014043300
20211014043301
20211014043302
20211014043303
20211014043304
20211014043305
20211014043306
20211014043307
20211014043308
20211014043309
20211014043310
20211014043311
20211014043312
20211014043313
20211014043314
20211014043315
20211014043316
20211014043317
20211014043318
20211014043319
20211014043320
20211014043321
20211014043322
20211014043323
20211014043324
20211014043325
20211014043326
20211014043327
20211014043328
20211014043329
20211014043330
20211014043331
20211014043332
20211014043333
20211014043334
20211014043335
20211014043336
20211014043337
20211014043338
20211014043339
20211014043340
20211014043341
20211014043342
20211014043343
20211014043344
20211014043345
20211014043346
20211014043347
20211014043348
20211014043349
20211014043350
20211014043351
20211014043352
20211014043353
20211014043354
20211014043355
20211014043356
20211014043357
20211014043358
20211014043359
20211014043360
20211014043361
20211014043362
20211014043363
20211014043364
20211014043365
20211014043366
20211014043367
20211014043368
20211014043369
20211014043370
20211014043371
20211014043372
20211014043373
20211014043374
20211014043375
20211014043376
20211014043377
20211014043378
20211014043379
20211014043380
20211014043381
20211014043382
20211014043383
20211014043384
20211014043385
20211014043386
20211014043387
20211014043388
20211014043389
20211014043390
20211015113738
20211025130403
20211022092754
20211029051159
20211103060615
20211103093505
20211103134807
20211109050024
20211110091850
20211115110534
20211108051919
20211124125007
20211126073929
20211201062005
20211202110634
20211201085248
20211202193258
20211208125858
20211210111411
20211210112241
20211215045605
20211215132401
20211220190828
20211221130313
20211222091740
20220106092527
20220106095901
20220110090410
20220118121135
20220119113422
20220202093711
\.


--
-- Data for Name: search_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.search_histories (id, account_id, search_params, created_at, updated_at) FROM stdin;
1	129	nature	2021-11-30 11:03:44.680805	2021-11-30 11:03:44.680805
2	129	test	2021-11-30 11:03:56.90081	2021-11-30 11:03:56.90081
3	129	arun	2021-11-30 11:04:04.73747	2021-11-30 11:04:04.73747
4	129	aru	2021-11-30 11:04:09.198453	2021-11-30 11:04:09.198453
7	124	tr	2021-12-17 05:47:33.774912	2021-12-17 05:47:33.774912
8	124	t	2021-12-17 05:47:33.780064	2021-12-17 05:47:33.780064
9	124	tre	2021-12-17 05:47:34.120204	2021-12-17 05:47:34.120204
10	124	tres	2021-12-17 05:47:34.238311	2021-12-17 05:47:34.238311
11	124	tress	2021-12-17 05:47:34.435471	2021-12-17 05:47:34.435471
12	124	tree	2021-12-17 05:47:37.024543	2021-12-17 05:47:37.024543
13	124	trees	2021-12-17 05:47:37.294082	2021-12-17 05:47:37.294082
14	124	treess	2021-12-17 05:47:37.663985	2021-12-17 05:47:37.663985
15	124	b	2021-12-17 05:47:56.102911	2021-12-17 05:47:56.102911
16	124	br	2021-12-17 05:47:56.594185	2021-12-17 05:47:56.594185
17	124	bru	2021-12-17 05:47:57.118406	2021-12-17 05:47:57.118406
18	124	bri	2021-12-17 05:47:58.133176	2021-12-17 05:47:58.133176
19	124	brie	2021-12-17 05:47:58.139909	2021-12-17 05:47:58.139909
20	124	h	2021-12-17 05:53:02.479158	2021-12-17 05:53:02.479158
21	124	hd	2021-12-17 05:53:02.480655	2021-12-17 05:53:02.480655
22	124	hdn	2021-12-17 05:53:03.526547	2021-12-17 05:53:03.526547
23	124	hdnd	2021-12-17 05:53:03.727184	2021-12-17 05:53:03.727184
24	124	bi	2021-12-17 06:22:37.133645	2021-12-17 06:22:37.133645
25	124	bir	2021-12-17 06:22:37.248898	2021-12-17 06:22:37.248898
26	124	bire	2021-12-17 06:22:37.873345	2021-12-17 06:22:37.873345
27	124	ter	2021-12-17 06:59:33.849079	2021-12-17 06:59:33.849079
28	124	te	2021-12-17 06:59:33.880046	2021-12-17 06:59:33.880046
29	124	hdh	2021-12-17 07:24:56.124044	2021-12-17 07:24:56.124044
30	124	hdhdhd	2021-12-17 07:24:56.421482	2021-12-17 07:24:56.421482
31	124	hdhdhdh	2021-12-17 07:24:56.47059	2021-12-17 07:24:56.47059
32	124	hdhd	2021-12-17 07:24:57.018375	2021-12-17 07:24:57.018375
33	124	hdhdh	2021-12-17 07:24:57.420914	2021-12-17 07:24:57.420914
34	124	jdjd	2021-12-17 07:25:01.051398	2021-12-17 07:25:01.051398
35	124	jdjdnjn	2021-12-17 07:25:01.244423	2021-12-17 07:25:01.244423
36	124	j	2021-12-17 07:25:05.982945	2021-12-17 07:25:05.982945
37	124	jdjdnjnd	2021-12-17 07:25:06.348912	2021-12-17 07:25:06.348912
38	124	jd	2021-12-17 07:25:09.082414	2021-12-17 07:25:09.082414
39	124	jdj	2021-12-17 07:25:10.182087	2021-12-17 07:25:10.182087
40	124	jdjdn	2021-12-17 07:25:17.924615	2021-12-17 07:25:17.924615
41	124	jdjdnj	2021-12-17 07:25:21.180852	2021-12-17 07:25:21.180852
42	124	brue	2021-12-17 07:29:56.07376	2021-12-17 07:29:56.07376
43	129	will	2021-12-17 07:32:37.404739	2021-12-17 07:32:37.404739
44	124	d	2021-12-17 09:20:47.786069	2021-12-17 09:20:47.786069
45	124	btre	2021-12-17 09:40:50.944344	2021-12-17 09:40:50.944344
46	124	btree	2021-12-17 09:40:51.003389	2021-12-17 09:40:51.003389
47	124	r	2021-12-17 09:40:58.303959	2021-12-17 09:40:58.303959
48	124	broe	2021-12-17 10:11:24.234224	2021-12-17 10:11:24.234224
49	124	bre	2021-12-17 13:01:29.623769	2021-12-17 13:01:29.623769
50	124	dds	2021-12-20 07:11:01.689088	2021-12-20 07:11:01.689088
51	124	dd	2021-12-20 07:11:01.719962	2021-12-20 07:11:01.719962
52	124	ddsd	2021-12-20 07:11:02.36063	2021-12-20 07:11:02.36063
53	124	ddsddd	2021-12-20 07:11:03.93651	2021-12-20 07:11:03.93651
54	124	ds	2021-12-20 07:11:12.538426	2021-12-20 07:11:12.538426
55	124	dss	2021-12-20 07:11:12.848894	2021-12-20 07:11:12.848894
56	124	dssd	2021-12-20 07:11:13.29422	2021-12-20 07:11:13.29422
57	124	dssdd	2021-12-20 07:11:16.383733	2021-12-20 07:11:16.383733
58	124	nature	2021-12-20 07:59:24.876639	2021-12-20 07:59:24.876639
59	124	ak	2021-12-20 08:17:31.168047	2021-12-20 08:17:31.168047
60	124	aksay	2021-12-20 08:17:31.207805	2021-12-20 08:17:31.207805
61	124	ra	2021-12-20 08:17:52.959209	2021-12-20 08:17:52.959209
62	124	rajes	2021-12-20 08:17:53.102775	2021-12-20 08:17:53.102775
63	124	rajesh	2021-12-20 08:22:55.425468	2021-12-20 08:22:55.425468
64	124	aks	2021-12-20 08:23:48.171393	2021-12-20 08:23:48.171393
65	124	a	2021-12-20 08:24:13.1135	2021-12-20 08:24:13.1135
66	129	ar	2021-12-20 08:28:34.520836	2021-12-20 08:28:34.520836
67	129	te	2021-12-20 08:29:25.105526	2021-12-20 08:29:25.105526
68	124	scar	2021-12-20 08:29:56.868958	2021-12-20 08:29:56.868958
69	124	scarl	2021-12-20 08:29:56.871449	2021-12-20 08:29:56.871449
70	124	scarlett	2021-12-20 08:29:57.291705	2021-12-20 08:29:57.291705
71	124	scarlet	2021-12-20 08:30:46.40369	2021-12-20 08:30:46.40369
72	124	sca	2021-12-20 08:30:48.490802	2021-12-20 08:30:48.490802
73	124	sc	2021-12-20 08:30:49.111522	2021-12-20 08:30:49.111522
74	124	scarle	2021-12-20 08:30:59.016238	2021-12-20 08:30:59.016238
75	124	robert	2021-12-20 08:32:33.56223	2021-12-20 08:32:33.56223
76	124	chri	2021-12-20 08:35:48.496036	2021-12-20 08:35:48.496036
77	124	komal	2021-12-20 08:40:18.68998	2021-12-20 08:40:18.68998
78	124	koma	2021-12-20 08:40:21.326837	2021-12-20 08:40:21.326837
79	124	koam	2021-12-20 08:40:39.148417	2021-12-20 08:40:39.148417
80	124	koaml	2021-12-20 08:40:39.678849	2021-12-20 08:40:39.678849
81	124	ri	2021-12-20 08:43:02.50346	2021-12-20 08:43:02.50346
82	124	riti	2021-12-20 08:43:03.36394	2021-12-20 08:43:03.36394
83	124	ritika	2021-12-20 08:43:03.907002	2021-12-20 08:43:03.907002
84	129	bear	2021-12-20 09:16:44.382768	2021-12-20 09:16:44.382768
85	129	be	2021-12-20 09:25:49.119259	2021-12-20 09:25:49.119259
86	129	rich	2021-12-20 09:26:03.24819	2021-12-20 09:26:03.24819
87	129	qa	2021-12-20 09:27:37.851665	2021-12-20 09:27:37.851665
88	129	600*400	2021-12-20 09:27:52.556756	2021-12-20 09:27:52.556756
89	129	Rich Kid	2021-12-20 09:28:27.278348	2021-12-20 09:28:27.278348
90	129	Greenary	2021-12-20 09:28:45.906046	2021-12-20 09:28:45.906046
91	129	ri	2021-12-20 09:29:49.463345	2021-12-20 09:29:49.463345
92	129	r	2021-12-20 09:30:27.689954	2021-12-20 09:30:27.689954
93	136	у	2021-12-20 10:36:36.064356	2021-12-20 10:36:36.064356
94	136	e	2021-12-20 10:36:40.182761	2021-12-20 10:36:40.182761
95	136	e,,	2021-12-20 10:36:41.07892	2021-12-20 10:36:41.07892
96	136	emma	2021-12-20 10:36:53.570769	2021-12-20 10:36:53.570769
97	137	N	2021-12-20 10:43:45.015793	2021-12-20 10:43:45.015793
98	137	M	2021-12-20 10:43:47.955696	2021-12-20 10:43:47.955696
99	137	Michael	2021-12-20 10:43:49.84987	2021-12-20 10:43:49.84987
100	137	Micha	2021-12-20 10:43:52.861663	2021-12-20 10:43:52.861663
101	137	Mi	2021-12-20 10:43:54.38174	2021-12-20 10:43:54.38174
102	137	W	2021-12-20 10:44:14.253066	2021-12-20 10:44:14.253066
103	137	Will	2021-12-20 10:44:14.984218	2021-12-20 10:44:14.984218
104	271	r	2021-12-20 11:20:35.49223	2021-12-20 11:20:35.49223
105	271	re	2021-12-20 11:20:37.305878	2021-12-20 11:20:37.305878
106	271	res	2021-12-20 11:20:39.15563	2021-12-20 11:20:39.15563
107	271	resu	2021-12-20 11:20:40.200809	2021-12-20 11:20:40.200809
108	271	b	2021-12-20 11:21:17.332077	2021-12-20 11:21:17.332077
109	271	bea	2021-12-20 11:21:17.988238	2021-12-20 11:21:17.988238
110	271	bear	2021-12-20 11:21:18.182009	2021-12-20 11:21:18.182009
111	271	ar	2021-12-20 11:21:32.305167	2021-12-20 11:21:32.305167
112	271	aru	2021-12-20 11:21:32.310514	2021-12-20 11:21:32.310514
113	271	a	2021-12-20 11:21:32.575654	2021-12-20 11:21:32.575654
114	271	arun	2021-12-20 11:21:32.898199	2021-12-20 11:21:32.898199
115	136	Ы	2021-12-20 12:40:41.717886	2021-12-20 12:40:41.717886
116	136	w	2021-12-20 12:40:44.897102	2021-12-20 12:40:44.897102
117	136	Ц	2021-12-20 12:40:44.978233	2021-12-20 12:40:44.978233
118	136	Will Smith	2021-12-20 12:40:49.48695	2021-12-20 12:40:49.48695
119	136	Will Smithg	2021-12-20 12:40:49.557072	2021-12-20 12:40:49.557072
120	136	Wi	2021-12-20 12:44:10.077677	2021-12-20 12:44:10.077677
121	136	Olena	2021-12-20 12:44:10.511654	2021-12-20 12:44:10.511654
122	136	Olew	2021-12-20 12:44:32.967431	2021-12-20 12:44:32.967431
123	136	Emmm	2021-12-20 12:44:37.175525	2021-12-20 12:44:37.175525
124	136	Emma	2021-12-20 12:44:38.490585	2021-12-20 12:44:38.490585
125	137	Wil	2021-12-20 12:46:14.489661	2021-12-20 12:46:14.489661
126	137	Will s	2021-12-20 12:49:30.930559	2021-12-20 12:49:30.930559
127	137	Will Smith	2021-12-20 12:49:33.126417	2021-12-20 12:49:33.126417
128	137	Will sM	2021-12-20 12:49:33.58911	2021-12-20 12:49:33.58911
129	136	WI	2021-12-20 13:02:11.77619	2021-12-20 13:02:11.77619
130	136	WILL	2021-12-20 13:02:12.07725	2021-12-20 13:02:12.07725
131	136	W	2021-12-20 13:02:13.177154	2021-12-20 13:02:13.177154
132	136	Will smith	2021-12-20 13:02:17.080045	2021-12-20 13:02:17.080045
133	136	Will S	2021-12-20 13:02:33.274176	2021-12-20 13:02:33.274176
134	136	will smith	2021-12-20 13:02:47.18212	2021-12-20 13:02:47.18212
135	136	www	2021-12-20 13:05:21.390281	2021-12-20 13:05:21.390281
136	136	ww	2021-12-20 13:05:22.091326	2021-12-20 13:05:22.091326
137	136	will	2021-12-20 13:05:30.993834	2021-12-20 13:05:30.993834
138	136	wil	2021-12-20 13:05:31.375716	2021-12-20 13:05:31.375716
139	124	u	2021-12-20 13:08:39.288655	2021-12-20 13:08:39.288655
140	137	Will smith	2021-12-20 13:14:23.459953	2021-12-20 13:14:23.459953
141	297	db	2021-12-20 13:21:29.188371	2021-12-20 13:21:29.188371
142	297	dbu	2021-12-20 13:21:29.688117	2021-12-20 13:21:29.688117
143	297	db u	2021-12-20 13:21:32.868374	2021-12-20 13:21:32.868374
144	297	tes	2021-12-20 13:21:33.088998	2021-12-20 13:21:33.088998
145	297	te	2021-12-20 13:21:34.278183	2021-12-20 13:21:34.278183
146	297	test	2021-12-20 13:21:40.698812	2021-12-20 13:21:40.698812
147	297	d	2021-12-20 13:21:49.487698	2021-12-20 13:21:49.487698
148	297	dbus	2021-12-20 13:21:51.086946	2021-12-20 13:21:51.086946
149	297	dbuser	2021-12-20 13:21:52.170208	2021-12-20 13:21:52.170208
150	297	dbuse	2021-12-20 13:21:54.598427	2021-12-20 13:21:54.598427
151	136	wILL	2021-12-20 13:31:01.917513	2021-12-20 13:31:01.917513
152	136	eMMA	2021-12-20 13:31:04.994661	2021-12-20 13:31:04.994661
153	297	t	2021-12-20 13:34:58.063233	2021-12-20 13:34:58.063233
154	297	r	2021-12-20 13:35:03.783124	2021-12-20 13:35:03.783124
155	297	ra	2021-12-20 13:35:04.128558	2021-12-20 13:35:04.128558
156	297	raj	2021-12-20 13:35:04.675374	2021-12-20 13:35:04.675374
157	297	raje	2021-12-20 13:35:06.045084	2021-12-20 13:35:06.045084
158	297	rajes	2021-12-20 13:35:06.606693	2021-12-20 13:35:06.606693
159	297	rajesh	2021-12-20 13:35:06.976479	2021-12-20 13:35:06.976479
160	297	ram	2021-12-20 13:35:11.212786	2021-12-20 13:35:11.212786
161	297	devi	2021-12-20 13:35:15.74123	2021-12-20 13:35:15.74123
162	297	devil	2021-12-20 13:35:16.051718	2021-12-20 13:35:16.051718
163	297	nft	2021-12-20 13:35:19.217853	2021-12-20 13:35:19.217853
164	297	p	2021-12-20 13:35:25.973705	2021-12-20 13:35:25.973705
165	297	pi	2021-12-20 13:35:27.146223	2021-12-20 13:35:27.146223
166	297	pip	2021-12-20 13:35:27.554721	2021-12-20 13:35:27.554721
167	297	pipl	2021-12-20 13:35:32.91188	2021-12-20 13:35:32.91188
168	297	o	2021-12-20 13:35:38.802921	2021-12-20 13:35:38.802921
169	297	oi	2021-12-20 13:35:39.10562	2021-12-20 13:35:39.10562
170	297	oiu	2021-12-20 13:35:39.400965	2021-12-20 13:35:39.400965
171	297	nor	2021-12-20 13:35:43.909759	2021-12-20 13:35:43.909759
172	297	nores	2021-12-20 13:35:44.490529	2021-12-20 13:35:44.490529
173	297	noresiu	2021-12-20 13:35:51.079046	2021-12-20 13:35:51.079046
174	297	noresiut	2021-12-20 13:35:52.098758	2021-12-20 13:35:52.098758
175	297	wh	2021-12-20 13:35:59.555027	2021-12-20 13:35:59.555027
176	297	wha	2021-12-20 13:35:59.824962	2021-12-20 13:35:59.824962
177	297	what	2021-12-20 13:36:01.530849	2021-12-20 13:36:01.530849
178	297	e	2021-12-20 13:36:04.647858	2021-12-20 13:36:04.647858
179	297	ev	2021-12-20 13:36:04.93039	2021-12-20 13:36:04.93039
180	297	evr	2021-12-20 13:36:08.033938	2021-12-20 13:36:08.033938
181	297	whathte	2021-12-20 13:36:19.32507	2021-12-20 13:36:19.32507
182	297	w	2021-12-20 13:36:20.004834	2021-12-20 13:36:20.004834
183	297	wtf	2021-12-20 13:36:20.476094	2021-12-20 13:36:20.476094
184	297	tfn	2021-12-20 13:36:25.792957	2021-12-20 13:36:25.792957
185	136	S	2021-12-20 13:42:49.563052	2021-12-20 13:42:49.563052
186	136	Some	2021-12-20 13:42:54.729166	2021-12-20 13:42:54.729166
187	136	Som	2021-12-20 13:43:03.631431	2021-12-20 13:43:03.631431
188	136	DB	2021-12-20 13:43:09.672191	2021-12-20 13:43:09.672191
189	297	tf	2021-12-20 13:45:35.360473	2021-12-20 13:45:35.360473
190	297	re	2021-12-20 13:45:42.527422	2021-12-20 13:45:42.527422
191	297	res	2021-12-20 13:45:44.14805	2021-12-20 13:45:44.14805
192	297	resp	2021-12-20 13:45:46.080461	2021-12-20 13:45:46.080461
193	297	respi	2021-12-20 13:45:46.545349	2021-12-20 13:45:46.545349
194	297	respin	2021-12-20 13:45:46.874792	2021-12-20 13:45:46.874792
195	297	a	2021-12-20 13:45:54.530736	2021-12-20 13:45:54.530736
196	297	aw	2021-12-20 13:45:55.121006	2021-12-20 13:45:55.121006
197	297	aws	2021-12-20 13:45:55.972244	2021-12-20 13:45:55.972244
198	297	awsm	2021-12-20 13:45:57.365342	2021-12-20 13:45:57.365342
199	297	an	2021-12-20 13:46:02.98429	2021-12-20 13:46:02.98429
200	297	ank	2021-12-20 13:46:03.250599	2021-12-20 13:46:03.250599
201	297	anki	2021-12-20 13:46:03.837766	2021-12-20 13:46:03.837766
202	133	tem	2021-12-20 13:53:54.778377	2021-12-20 13:53:54.778377
203	133	temp	2021-12-20 13:53:58.074171	2021-12-20 13:53:58.074171
204	136	wi	2021-12-20 14:10:52.87567	2021-12-20 14:10:52.87567
205	136	Will	2021-12-20 14:10:54.775331	2021-12-20 14:10:54.775331
206	136	Will s	2021-12-20 14:33:24.512238	2021-12-20 14:33:24.512238
207	136	Will SMith	2021-12-20 14:33:25.417123	2021-12-20 14:33:25.417123
208	136	Will SMm	2021-12-20 14:33:26.11267	2021-12-20 14:33:26.11267
209	136	Will Smiut	2021-12-20 14:33:27.020814	2021-12-20 14:33:27.020814
210	124	aka	2021-12-21 04:13:09.968911	2021-12-21 04:13:09.968911
211	124	aksa	2021-12-21 04:35:48.571498	2021-12-21 04:35:48.571498
212	124	c	2021-12-21 04:37:58.008785	2021-12-21 04:37:58.008785
213	124	cri	2021-12-21 04:38:02.72048	2021-12-21 04:38:02.72048
214	124	crich	2021-12-21 04:38:02.722949	2021-12-21 04:38:02.722949
215	124	crish	2021-12-21 04:38:03.960144	2021-12-21 04:38:03.960144
216	124	ja	2021-12-21 05:25:46.488026	2021-12-21 05:25:46.488026
217	124	jac	2021-12-21 05:25:50.982218	2021-12-21 05:25:50.982218
218	124	jachie	2021-12-21 05:25:51.134397	2021-12-21 05:25:51.134397
219	124	ritik	2021-12-21 05:27:21.164649	2021-12-21 05:27:21.164649
220	124	raje	2021-12-21 05:27:29.389497	2021-12-21 05:27:29.389497
221	124	ro	2021-12-21 05:32:35.866068	2021-12-21 05:32:35.866068
222	124	rober	2021-12-21 05:32:36.079352	2021-12-21 05:32:36.079352
223	124	cris	2021-12-21 05:42:05.190688	2021-12-21 05:42:05.190688
224	124	cr	2021-12-21 05:42:53.13129	2021-12-21 05:42:53.13129
225	124	nat	2021-12-21 06:01:31.42789	2021-12-21 06:01:31.42789
226	124	n	2021-12-21 06:01:31.432141	2021-12-21 06:01:31.432141
227	124	natu	2021-12-21 06:01:31.614933	2021-12-21 06:01:31.614933
228	124	tree nsnsns	2021-12-21 06:07:35.120642	2021-12-21 06:07:35.120642
229	124	ak 	2021-12-21 06:42:07.011221	2021-12-21 06:42:07.011221
230	124	aksayt	2021-12-21 06:43:16.233128	2021-12-21 06:43:16.233128
231	124	tko	2021-12-21 06:43:23.630791	2021-12-21 06:43:23.630791
232	124	tkop	2021-12-21 06:43:24.111282	2021-12-21 06:43:24.111282
233	124	@	2021-12-21 06:43:43.175048	2021-12-21 06:43:43.175048
234	124	w	2021-12-21 06:44:03.646944	2021-12-21 06:44:03.646944
235	124	wq	2021-12-21 06:44:03.645935	2021-12-21 06:44:03.645935
236	124	wql	2021-12-21 06:44:03.917772	2021-12-21 06:44:03.917772
237	124	ujjava	2021-12-21 06:48:49.579653	2021-12-21 06:48:49.579653
238	124	ujjaval	2021-12-21 06:48:50.153528	2021-12-21 06:48:50.153528
239	124	ujjaval\\	2021-12-21 06:49:52.914496	2021-12-21 06:49:52.914496
240	124	ak2	2021-12-21 06:55:37.183633	2021-12-21 06:55:37.183633
241	124	aksa3	2021-12-21 06:56:38.710345	2021-12-21 06:56:38.710345
242	124	a3	2021-12-21 06:56:45.783831	2021-12-21 06:56:45.783831
243	124	2	2021-12-21 06:56:58.18836	2021-12-21 06:56:58.18836
244	124	1	2021-12-21 06:57:13.048952	2021-12-21 06:57:13.048952
245	124	a1	2021-12-21 06:57:27.41224	2021-12-21 06:57:27.41224
246	124	a@	2021-12-21 06:58:21.370379	2021-12-21 06:58:21.370379
247	124	22	2021-12-21 07:04:08.266019	2021-12-21 07:04:08.266019
248	297	dbuser1	2021-12-21 07:15:18.591346	2021-12-21 07:15:18.591346
249	297	dbuser6	2021-12-21 07:15:31.434411	2021-12-21 07:15:31.434411
250	297	dbuser9	2021-12-21 07:15:33.265411	2021-12-21 07:15:33.265411
251	297	dbuser90	2021-12-21 07:15:34.223804	2021-12-21 07:15:34.223804
252	297	dbuser900	2021-12-21 07:15:34.744105	2021-12-21 07:15:34.744105
253	297	ret	2021-12-21 07:15:42.365405	2021-12-21 07:15:42.365405
254	297	rety	2021-12-21 07:15:42.783238	2021-12-21 07:15:42.783238
255	297	h	2021-12-21 07:16:14.828549	2021-12-21 07:16:14.828549
256	297	ho	2021-12-21 07:16:15.207199	2021-12-21 07:16:15.207199
257	297	hol	2021-12-21 07:16:15.997938	2021-12-21 07:16:15.997938
258	297	hola	2021-12-21 07:16:18.693525	2021-12-21 07:16:18.693525
259	124	2jj	2021-12-21 07:20:29.171264	2021-12-21 07:20:29.171264
260	124	kkdnkdmd	2021-12-21 07:20:32.632661	2021-12-21 07:20:32.632661
261	124	kkdnkdmd1	2021-12-21 07:20:32.951229	2021-12-21 07:20:32.951229
262	129	t	2021-12-21 07:51:25.362956	2021-12-21 07:51:25.362956
263	129	tes	2021-12-21 07:51:30.439792	2021-12-21 07:51:30.439792
264	124	kkdnkdm	2021-12-21 07:53:46.33678	2021-12-21 07:53:46.33678
265	124	k	2021-12-21 07:53:47.205734	2021-12-21 07:53:47.205734
266	124	a1@	2021-12-21 07:53:55.145319	2021-12-21 07:53:55.145319
267	124	a1@dhdh	2021-12-21 07:53:58.133191	2021-12-21 07:53:58.133191
268	124	hshbs	2021-12-21 07:54:28.689718	2021-12-21 07:54:28.689718
269	124	hdbdh	2021-12-21 07:55:18.186664	2021-12-21 07:55:18.186664
270	124	ak\\s	2021-12-21 07:55:31.303892	2021-12-21 07:55:31.303892
271	124	7	2021-12-21 07:55:39.563053	2021-12-21 07:55:39.563053
272	124	kakak	2021-12-21 07:55:53.673402	2021-12-21 07:55:53.673402
273	124	kaka	2021-12-21 07:55:55.381018	2021-12-21 07:55:55.381018
274	124	hdbghvdggdvghd	2021-12-21 07:56:02.257638	2021-12-21 07:56:02.257638
275	124	bdbdhd	2021-12-21 07:56:19.459719	2021-12-21 07:56:19.459719
276	271	t	2021-12-21 07:58:43.645324	2021-12-21 07:58:43.645324
277	271	te	2021-12-21 07:58:47.121528	2021-12-21 07:58:47.121528
278	271	tes	2021-12-21 07:58:47.426938	2021-12-21 07:58:47.426938
279	271	test	2021-12-21 07:58:47.862791	2021-12-21 07:58:47.862791
280	271	test tes	2021-12-21 07:58:54.48324	2021-12-21 07:58:54.48324
281	271	test t	2021-12-21 07:58:54.486412	2021-12-21 07:58:54.486412
282	271	test test	2021-12-21 07:58:54.58938	2021-12-21 07:58:54.58938
283	271	test1	2021-12-21 07:59:08.090416	2021-12-21 07:59:08.090416
284	271	test12	2021-12-21 07:59:08.489269	2021-12-21 07:59:08.489269
285	271	test123	2021-12-21 07:59:08.875901	2021-12-21 07:59:08.875901
286	271	test123@	2021-12-21 07:59:09.747331	2021-12-21 07:59:09.747331
287	271	test123@y	2021-12-21 07:59:11.12463	2021-12-21 07:59:11.12463
288	271	test123@yop	2021-12-21 07:59:11.755685	2021-12-21 07:59:11.755685
289	271	test123@yopm	2021-12-21 07:59:12.067101	2021-12-21 07:59:12.067101
290	271	test123@yopma	2021-12-21 07:59:12.456797	2021-12-21 07:59:12.456797
291	271	test123@yopmai	2021-12-21 07:59:12.905648	2021-12-21 07:59:12.905648
292	271	test123@yopmail	2021-12-21 07:59:13.187456	2021-12-21 07:59:13.187456
293	271	test123@yopmail.	2021-12-21 07:59:13.493793	2021-12-21 07:59:13.493793
294	271	test123@yopmail.c	2021-12-21 07:59:13.790512	2021-12-21 07:59:13.790512
295	271	test123@yopmail.co	2021-12-21 07:59:14.07185	2021-12-21 07:59:14.07185
296	271	test123@yopmail.com	2021-12-21 07:59:14.359431	2021-12-21 07:59:14.359431
297	124	jndjd	2021-12-21 08:00:36.830153	2021-12-21 08:00:36.830153
298	124	^$^T$	2021-12-21 08:01:07.515252	2021-12-21 08:01:07.515252
299	124	^$^T	2021-12-21 08:01:08.244207	2021-12-21 08:01:08.244207
300	124	1646	2021-12-21 08:01:58.373457	2021-12-21 08:01:58.373457
301	124	164	2021-12-21 08:02:15.611264	2021-12-21 08:02:15.611264
302	124	hdb	2021-12-21 08:02:21.664385	2021-12-21 08:02:21.664385
303	124	hbhd	2021-12-21 08:02:45.194489	2021-12-21 08:02:45.194489
304	124	jndbjd	2021-12-21 08:02:49.270328	2021-12-21 08:02:49.270328
305	124	jndbj	2021-12-21 08:02:49.379766	2021-12-21 08:02:49.379766
306	124	dnjmdnjk	2021-12-21 08:02:51.907523	2021-12-21 08:02:51.907523
307	124	dnjmdnj	2021-12-21 08:02:53.86742	2021-12-21 08:02:53.86742
308	124	35r53	2021-12-21 08:02:58.592584	2021-12-21 08:02:58.592584
309	124	35r5	2021-12-21 08:03:00.745122	2021-12-21 08:03:00.745122
310	124	ajaj	2021-12-21 08:11:00.897923	2021-12-21 08:11:00.897923
311	124	hdbh	2021-12-21 08:13:41.260818	2021-12-21 08:13:41.260818
312	124	js	2021-12-21 08:13:57.404227	2021-12-21 08:13:57.404227
313	124	kakakkaak	2021-12-21 08:32:07.476388	2021-12-21 08:32:07.476388
314	305	c	2021-12-21 08:48:56.711059	2021-12-21 08:48:56.711059
315	305	co	2021-12-21 08:49:01.343967	2021-12-21 08:49:01.343967
316	305	core	2021-12-21 08:49:02.005119	2021-12-21 08:49:02.005119
317	124	na	2021-12-21 10:32:44.061617	2021-12-21 10:32:44.061617
318	124	aksay1	2021-12-21 11:16:23.02106	2021-12-21 11:16:23.02106
319	136	щДУ	2021-12-21 12:14:41.923463	2021-12-21 12:14:41.923463
320	136	oL	2021-12-21 12:14:44.792578	2021-12-21 12:14:44.792578
321	124	arun	2021-12-21 12:23:13.189505	2021-12-21 12:23:13.189505
322	124	ut	2021-12-21 12:28:59.814115	2021-12-21 12:28:59.814115
323	124	utsav	2021-12-21 12:29:05.364467	2021-12-21 12:29:05.364467
324	136	Sm	2021-12-21 13:07:49.809223	2021-12-21 13:07:49.809223
325	136	Smi	2021-12-21 13:07:53.291327	2021-12-21 13:07:53.291327
326	136	уььф	2021-12-21 13:26:19.095574	2021-12-21 13:26:19.095574
327	137	m	2021-12-21 13:59:09.605253	2021-12-21 13:59:09.605253
328	297	trnf	2021-12-21 15:02:29.7677	2021-12-21 15:02:29.7677
329	297	tn	2021-12-21 15:02:38.91572	2021-12-21 15:02:38.91572
330	297	tnf	2021-12-21 15:02:42.431789	2021-12-21 15:02:42.431789
331	297	tnfr	2021-12-21 15:02:45.014067	2021-12-21 15:02:45.014067
332	297	tnt	2021-12-21 15:02:55.326891	2021-12-21 15:02:55.326891
333	297	bd	2021-12-21 15:02:59.915656	2021-12-21 15:02:59.915656
334	297	bdu	2021-12-21 15:03:02.031074	2021-12-21 15:03:02.031074
335	297	us	2021-12-21 15:03:05.928165	2021-12-21 15:03:05.928165
336	297	usr	2021-12-21 15:03:07.803573	2021-12-21 15:03:07.803573
337	297	tempo	2021-12-21 15:03:13.43113	2021-12-21 15:03:13.43113
338	297	ar	2021-12-22 07:08:50.508281	2021-12-22 07:08:50.508281
339	297	aru	2021-12-22 07:09:03.632565	2021-12-22 07:09:03.632565
340	297	arun	2021-12-22 07:09:08.064729	2021-12-22 07:09:08.064729
341	297	aruna	2021-12-22 07:09:24.783943	2021-12-22 07:09:24.783943
342	129	db	2021-12-22 07:09:43.551749	2021-12-22 07:09:43.551749
343	129	temp	2021-12-22 07:14:03.810824	2021-12-22 07:14:03.810824
344	136	db	2021-12-22 08:51:39.126332	2021-12-22 08:51:39.126332
345	136	ar	2021-12-22 09:11:19.612785	2021-12-22 09:11:19.612785
346	136	Hello	2021-12-22 09:42:09.229684	2021-12-22 09:42:09.229684
347	137	Olena	2021-12-22 10:30:20.583447	2021-12-22 10:30:20.583447
348	259	arun	2021-12-23 05:51:55.752308	2021-12-23 05:51:55.752308
349	260	arun	2021-12-23 10:56:30.168582	2021-12-23 10:56:30.168582
350	260	arun murugan	2021-12-23 10:56:39.086284	2021-12-23 10:56:39.086284
351	136	Emm	2021-12-23 16:38:36.338306	2021-12-23 16:38:36.338306
352	136	s	2021-12-23 17:32:12.558014	2021-12-23 17:32:12.558014
353	353	arun	2021-12-24 06:09:29.452062	2021-12-24 06:09:29.452062
354	133	dbus	2021-12-24 06:52:24.086867	2021-12-24 06:52:24.086867
355	133	dbu	2021-12-24 06:52:28.971118	2021-12-24 06:52:28.971118
356	133	dbuser	2021-12-24 06:52:37.476115	2021-12-24 06:52:37.476115
357	133	tes	2021-12-24 06:53:00.761071	2021-12-24 06:53:00.761071
358	297	lal	2021-12-24 06:59:36.487846	2021-12-24 06:59:36.487846
359	359	temp	2021-12-24 08:16:21.866035	2021-12-24 08:16:21.866035
360	359	dbus	2021-12-24 08:16:32.267598	2021-12-24 08:16:32.267598
361	359	dbuser	2021-12-24 08:16:35.897253	2021-12-24 08:16:35.897253
362	133	Hanna	2021-12-24 08:27:15.419722	2021-12-24 08:27:15.419722
363	133	lena	2021-12-24 08:27:22.332212	2021-12-24 08:27:22.332212
364	133	ujwa	2021-12-24 08:28:04.55188	2021-12-24 08:28:04.55188
365	133	ujj	2021-12-24 08:28:10.254395	2021-12-24 08:28:10.254395
366	133	ujjwa	2021-12-24 08:28:13.938906	2021-12-24 08:28:13.938906
367	133	uj	2021-12-24 08:28:19.240082	2021-12-24 08:28:19.240082
368	133	ujjawa	2021-12-24 08:28:26.546394	2021-12-24 08:28:26.546394
369	133	ujjaw	2021-12-24 08:28:28.059601	2021-12-24 08:28:28.059601
370	133	dharan	2021-12-24 08:28:31.780982	2021-12-24 08:28:31.780982
371	133	dharani	2021-12-24 08:28:58.560583	2021-12-24 08:28:58.560583
372	133	himan	2021-12-24 08:30:13.251635	2021-12-24 08:30:13.251635
373	133	hima	2021-12-24 08:30:17.897578	2021-12-24 08:30:17.897578
374	133	dbuse	2021-12-24 14:21:15.393218	2021-12-24 14:21:15.393218
375	124	lalji	2021-12-27 12:58:35.372791	2021-12-27 12:58:35.372791
377	136	Db	2021-12-28 10:17:47.165607	2021-12-28 10:17:47.165607
379	266	scarle	2022-01-03 06:10:57.607816	2022-01-03 06:10:57.607816
380	266	scarlett	2022-01-03 06:11:05.861291	2022-01-03 06:11:05.861291
381	306	test	2022-01-04 07:36:06.504261	2022-01-04 07:36:06.504261
382	365	db	2022-01-05 13:53:41.561598	2022-01-05 13:53:41.561598
383	365	rich kid	2022-01-05 13:54:33.679291	2022-01-05 13:54:33.679291
384	129	testing	2022-01-06 09:11:32.975628	2022-01-06 09:11:32.975628
385	129	600	2022-01-06 09:19:41.610009	2022-01-06 09:19:41.610009
386	366	will	2022-01-06 11:57:42.224785	2022-01-06 11:57:42.224785
387	136	dbsf	2022-01-06 13:12:33.524438	2022-01-06 13:12:33.524438
388	367	wILL	2022-01-06 13:18:42.303553	2022-01-06 13:18:42.303553
389	129	NFT	2022-01-07 11:03:22.546722	2022-01-07 11:03:22.546722
390	271	NFT	2022-01-10 10:21:19.094542	2022-01-10 10:21:19.094542
391	368	wILL	2022-01-10 10:35:46.167394	2022-01-10 10:35:46.167394
392	129	0x4772331d243eb2ee23fa7361b492139773207307	2022-01-10 10:39:18.06566	2022-01-10 10:39:18.06566
393	368	will	2022-01-10 10:45:36.776209	2022-01-10 10:45:36.776209
394	369	w	2022-01-10 12:03:47.857345	2022-01-10 12:03:47.857345
395	369	Wil	2022-01-10 12:03:52.411466	2022-01-10 12:03:52.411466
396	136	E	2022-01-11 08:01:23.921654	2022-01-11 08:01:23.921654
397	136	Ev	2022-01-11 08:01:30.860936	2022-01-11 08:01:30.860936
398	136	Evan P	2022-01-11 08:01:33.537093	2022-01-11 08:01:33.537093
399	136	Evan Peters	2022-01-11 08:01:35.423772	2022-01-11 08:01:35.423772
400	370	Ьшш	2022-01-11 08:25:22.500663	2022-01-11 08:25:22.500663
401	370	Michael	2022-01-11 08:25:28.524884	2022-01-11 08:25:28.524884
402	370	Michael Core	2022-01-11 08:25:31.032242	2022-01-11 08:25:31.032242
403	370	Emma John	2022-01-11 08:28:38.936888	2022-01-11 08:28:38.936888
404	370	Emma	2022-01-11 08:28:48.378586	2022-01-11 08:28:48.378586
405	371	lalji	2022-01-11 11:01:59.709707	2022-01-11 11:01:59.709707
406	136	emm	2022-01-11 11:32:04.085775	2022-01-11 11:32:04.085775
407	137	evan	2022-01-11 11:37:05.078976	2022-01-11 11:37:05.078976
408	129	lalji	2022-01-12 08:18:53.797427	2022-01-12 08:18:53.797427
409	371	ujjaval	2022-01-12 12:23:54.858105	2022-01-12 12:23:54.858105
410	124	aksat	2022-01-12 12:45:19.993264	2022-01-12 12:45:19.993264
411	212	db	2022-01-12 14:15:30.829099	2022-01-12 14:15:30.829099
412	271	db	2022-01-13 07:19:23.681608	2022-01-13 07:19:23.681608
413	370	emma	2022-01-13 08:19:51.692673	2022-01-13 08:19:51.692673
414	137	e	2022-01-13 08:27:01.571572	2022-01-13 08:27:01.571572
415	374	bha	2022-01-13 08:31:46.602838	2022-01-13 08:31:46.602838
416	374	a	2022-01-13 08:32:23.723248	2022-01-13 08:32:23.723248
417	374	as	2022-01-13 08:33:31.642547	2022-01-13 08:33:31.642547
418	374	test	2022-01-13 08:36:30.744816	2022-01-13 08:36:30.744816
420	374	te	2022-01-13 08:50:27.734471	2022-01-13 08:50:27.734471
421	374	test12	2022-01-13 08:50:54.058686	2022-01-13 08:50:54.058686
422	374	test123	2022-01-13 08:50:55.206937	2022-01-13 08:50:55.206937
425	376	emma	2022-01-13 11:06:53.867572	2022-01-13 11:06:53.867572
427	374	ak	2022-01-13 12:26:37.596595	2022-01-13 12:26:37.596595
428	374	aksha	2022-01-13 12:26:46.993022	2022-01-13 12:26:46.993022
429	370	Sa	2022-01-13 12:39:01.273972	2022-01-13 12:39:01.273972
430	370	Sarah	2022-01-13 12:39:07.707	2022-01-13 12:39:07.707
431	376	Evan	2022-01-13 12:42:20.501645	2022-01-13 12:42:20.501645
432	297	temp	2022-01-14 15:47:41.76399	2022-01-14 15:47:41.76399
433	370	roman	2022-01-17 07:42:43.684589	2022-01-17 07:42:43.684589
434	370	Roman	2022-01-17 07:42:51.79394	2022-01-17 07:42:51.79394
435	370	Romanek	2022-01-17 07:42:54.838274	2022-01-17 07:42:54.838274
436	248	Paulson	2022-01-17 07:48:42.775629	2022-01-17 07:48:42.775629
437	248	C••••••••ore	2022-01-17 07:53:12.991943	2022-01-17 07:53:12.991943
438	137	Ву	2022-01-17 10:09:02.472978	2022-01-17 10:09:02.472978
439	137	Вумшв	2022-01-17 10:09:12.262617	2022-01-17 10:09:12.262617
440	137	Devid	2022-01-17 10:09:16.942232	2022-01-17 10:09:16.942232
441	137	В	2022-01-17 10:16:53.180876	2022-01-17 10:16:53.180876
442	137	D	2022-01-17 10:17:04.476459	2022-01-17 10:17:04.476459
443	137	De	2022-01-17 10:17:06.077652	2022-01-17 10:17:06.077652
444	137	Dev	2022-01-17 10:17:10.953975	2022-01-17 10:17:10.953975
445	137	Devi	2022-01-17 10:17:17.098817	2022-01-17 10:17:17.098817
446	378	Sa	2022-01-17 10:55:35.207277	2022-01-17 10:55:35.207277
447	378	S	2022-01-17 10:55:46.598523	2022-01-17 10:55:46.598523
448	378	Sar	2022-01-17 10:56:02.437007	2022-01-17 10:56:02.437007
449	378	Sarah	2022-01-17 10:56:10.325909	2022-01-17 10:56:10.325909
450	378	EMM	2022-01-17 11:10:25.28308	2022-01-17 11:10:25.28308
451	378	H	2022-01-17 11:10:46.656729	2022-01-17 11:10:46.656729
452	378	He	2022-01-17 11:10:48.922799	2022-01-17 11:10:48.922799
453	378	===	2022-01-17 11:11:02.674274	2022-01-17 11:11:02.674274
454	378	======	2022-01-17 11:11:06.408615	2022-01-17 11:11:06.408615
455	378	=	2022-01-17 11:11:10.24514	2022-01-17 11:11:10.24514
456	378	De	2022-01-17 11:11:13.877002	2022-01-17 11:11:13.877002
457	378	Sara	2022-01-17 11:13:15.471873	2022-01-17 11:13:15.471873
458	137	Ь	2022-01-17 11:19:46.308979	2022-01-17 11:19:46.308979
459	137	Ц	2022-01-17 11:23:39.936875	2022-01-17 11:23:39.936875
460	137	Wi	2022-01-17 11:23:49.228812	2022-01-17 11:23:49.228812
461	137	Ьшш	2022-01-17 11:25:31.523599	2022-01-17 11:25:31.523599
462	137	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum	2022-01-17 11:25:48.872704	2022-01-17 11:25:48.872704
463	137	Сара	2022-01-17 11:27:07.378337	2022-01-17 11:27:07.378337
464	137	Sa	2022-01-17 11:27:14.380961	2022-01-17 11:27:14.380961
465	137	Sara	2022-01-17 11:27:18.335964	2022-01-17 11:27:18.335964
466	137	emma	2022-01-17 11:27:43.518277	2022-01-17 11:27:43.518277
467	137	E	2022-01-17 11:27:57.136302	2022-01-17 11:27:57.136302
468	137	Evan	2022-01-17 11:27:59.025542	2022-01-17 11:27:59.025542
469	137	TEst	2022-01-17 11:28:40.764625	2022-01-17 11:28:40.764625
470	137	T	2022-01-17 11:28:52.249073	2022-01-17 11:28:52.249073
474	137	Music	2022-01-17 11:29:31.294958	2022-01-17 11:29:31.294958
475	137	...	2022-01-17 11:29:48.351067	2022-01-17 11:29:48.351067
477	137	)))	2022-01-17 11:30:08.862083	2022-01-17 11:30:08.862083
478	137	Еван	2022-01-17 11:30:19.228411	2022-01-17 11:30:19.228411
479	137	У	2022-01-17 11:30:28.315195	2022-01-17 11:30:28.315195
471	137	Teat	2022-01-17 11:28:53.909705	2022-01-17 11:28:53.909705
472	137	Te	2022-01-17 11:28:55.685419	2022-01-17 11:28:55.685419
473	137	Test	2022-01-17 11:28:57.09272	2022-01-17 11:28:57.09272
476	137	///	2022-01-17 11:29:56.633713	2022-01-17 11:29:56.633713
480	137	Eva	2022-01-17 11:30:37.720183	2022-01-17 11:30:37.720183
481	137	Ev	2022-01-17 11:31:01.350991	2022-01-17 11:31:01.350991
482	137	Evo	2022-01-17 11:31:25.634151	2022-01-17 11:31:25.634151
483	137	Em	2022-01-17 11:31:41.737244	2022-01-17 11:31:41.737244
484	137	Emm	2022-01-17 11:31:47.236502	2022-01-17 11:31:47.236502
485	137	Security	2022-01-17 11:35:44.769943	2022-01-17 11:35:44.769943
486	137	Emma	2022-01-17 11:35:59.227189	2022-01-17 11:35:59.227189
487	137	EMMA	2022-01-17 11:36:15.33327	2022-01-17 11:36:15.33327
488	137	EV	2022-01-17 11:36:24.209062	2022-01-17 11:36:24.209062
489	137	EVA	2022-01-17 11:36:26.191504	2022-01-17 11:36:26.191504
490	137	EVAN	2022-01-17 11:36:28.804929	2022-01-17 11:36:28.804929
491	137	Peters	2022-01-17 11:36:53.9974	2022-01-17 11:36:53.9974
492	137	Peters EVA	2022-01-17 11:36:58.508523	2022-01-17 11:36:58.508523
493	137	Peters EVAN	2022-01-17 11:37:00.16657	2022-01-17 11:37:00.16657
494	137	Enna	2022-01-17 11:37:20.314929	2022-01-17 11:37:20.314929
495	137	Eva_	2022-01-17 11:37:35.719357	2022-01-17 11:37:35.719357
496	137	Ev__	2022-01-17 11:37:43.892137	2022-01-17 11:37:43.892137
497	137	E_an	2022-01-17 11:37:49.49853	2022-01-17 11:37:49.49853
498	137	Зуеук	2022-01-17 11:43:00.38213	2022-01-17 11:43:00.38213
499	378	Em	2022-01-17 11:56:50.143147	2022-01-17 11:56:50.143147
500	378	e	2022-01-17 12:27:34.601934	2022-01-17 12:27:34.601934
501	378	A	2022-01-17 12:28:34.283113	2022-01-17 12:28:34.283113
502	378	Ar	2022-01-17 12:29:21.774297	2022-01-17 12:29:21.774297
503	137	Joh	2022-01-17 12:45:27.238314	2022-01-17 12:45:27.238314
504	137	John	2022-01-17 12:45:32.596026	2022-01-17 12:45:32.596026
505	137	Johnson	2022-01-17 12:45:39.94083	2022-01-17 12:45:39.94083
506	137	Johnso	2022-01-17 12:45:45.320155	2022-01-17 12:45:45.320155
507	137	Johns	2022-01-17 12:45:47.271556	2022-01-17 12:45:47.271556
508	137	Johnss	2022-01-17 12:45:56.958608	2022-01-17 12:45:56.958608
509	137	Recka	2022-01-17 12:46:19.012962	2022-01-17 12:46:19.012962
510	137	Rec	2022-01-17 12:46:21.840699	2022-01-17 12:46:21.840699
511	137	Re	2022-01-17 12:46:24.825673	2022-01-17 12:46:24.825673
512	137	R	2022-01-17 12:46:28.506511	2022-01-17 12:46:28.506511
513	137	Ca	2022-01-17 12:47:09.15407	2022-01-17 12:47:09.15407
514	137	Cane	2022-01-17 12:47:12.451999	2022-01-17 12:47:12.451999
515	137	C	2022-01-17 12:47:18.309488	2022-01-17 12:47:18.309488
516	137	Can	2022-01-17 12:47:24.75902	2022-01-17 12:47:24.75902
517	137	Da	2022-01-17 12:47:49.526207	2022-01-17 12:47:49.526207
518	137	Dan	2022-01-17 12:47:52.298729	2022-01-17 12:47:52.298729
519	137	Va	2022-01-17 12:47:58.563635	2022-01-17 12:47:58.563635
520	137	Val	2022-01-17 12:48:03.36247	2022-01-17 12:48:03.36247
521	137	Vall	2022-01-17 12:48:06.933651	2022-01-17 12:48:06.933651
522	137	Ro	2022-01-17 12:48:43.193844	2022-01-17 12:48:43.193844
523	137	Rob	2022-01-17 12:48:45.944856	2022-01-17 12:48:45.944856
524	137	Rober	2022-01-17 12:48:49.130524	2022-01-17 12:48:49.130524
525	137	johnson	2022-01-17 12:49:15.241274	2022-01-17 12:49:15.241274
526	137	john	2022-01-17 12:49:22.113079	2022-01-17 12:49:22.113079
527	137	johns	2022-01-17 12:49:28.456557	2022-01-17 12:49:28.456557
528	137	johnso	2022-01-17 12:49:30.603869	2022-01-17 12:49:30.603869
529	137	johnsonn	2022-01-17 12:49:32.966245	2022-01-17 12:49:32.966245
530	137	r	2022-01-17 12:49:46.277281	2022-01-17 12:49:46.277281
531	137	rpt	2022-01-17 12:50:04.352853	2022-01-17 12:50:04.352853
532	137	Smi	2022-01-17 12:52:49.378158	2022-01-17 12:52:49.378158
533	137	Smith	2022-01-17 12:52:53.366431	2022-01-17 12:52:53.366431
534	137	Smit	2022-01-17 12:52:56.226581	2022-01-17 12:52:56.226581
535	137	Bla	2022-01-17 12:53:12.099776	2022-01-17 12:53:12.099776
536	137	Black	2022-01-17 12:53:15.712103	2022-01-17 12:53:15.712103
537	137	Jenifer	2022-01-17 12:53:33.419204	2022-01-17 12:53:33.419204
538	137	Mich	2022-01-17 12:53:54.981758	2022-01-17 12:53:54.981758
539	137	Mic	2022-01-17 12:53:56.539907	2022-01-17 12:53:56.539907
540	137	Michae	2022-01-17 12:54:08.705795	2022-01-17 12:54:08.705795
541	137	Pet	2022-01-17 12:54:31.580988	2022-01-17 12:54:31.580988
542	137	Pete	2022-01-17 12:54:34.836766	2022-01-17 12:54:34.836766
543	137	Pa	2022-01-17 12:55:18.82117	2022-01-17 12:55:18.82117
544	137	Par	2022-01-17 12:55:20.516513	2022-01-17 12:55:20.516513
545	137	Parke	2022-01-17 12:55:24.400809	2022-01-17 12:55:24.400809
546	137	Parker	2022-01-17 12:55:26.544736	2022-01-17 12:55:26.544736
547	137	Park	2022-01-17 12:55:41.921616	2022-01-17 12:55:41.921616
548	137	Sar	2022-01-17 12:56:34.348892	2022-01-17 12:56:34.348892
549	137	Den	2022-01-17 12:56:48.685537	2022-01-17 12:56:48.685537
550	137	Deni	2022-01-17 12:56:53.184696	2022-01-17 12:56:53.184696
551	137	Denn	2022-01-17 12:57:01.483414	2022-01-17 12:57:01.483414
552	137	Denie	2022-01-17 12:57:08.953634	2022-01-17 12:57:08.953634
553	137	Deniel	2022-01-17 12:57:11.343793	2022-01-17 12:57:11.343793
554	137	all	2022-01-17 12:57:40.085419	2022-01-17 12:57:40.085419
555	137	Sarah	2022-01-17 13:14:34.073848	2022-01-17 13:14:34.073848
556	137	Wo	2022-01-17 13:15:05.829544	2022-01-17 13:15:05.829544
557	137	some	2022-01-17 13:17:44.01949	2022-01-17 13:17:44.01949
558	137	some N	2022-01-17 13:17:45.216887	2022-01-17 13:17:45.216887
559	137	some NFT	2022-01-17 13:17:47.608979	2022-01-17 13:17:47.608979
560	137	some NFT's	2022-01-17 13:17:53.5503	2022-01-17 13:17:53.5503
561	378	Music	2022-01-17 13:28:26.8111	2022-01-17 13:28:26.8111
562	378	ghbf	2022-01-17 13:35:47.599102	2022-01-17 13:35:47.599102
563	378	Test	2022-01-17 13:36:08.269839	2022-01-17 13:36:08.269839
564	137	Cat	2022-01-17 13:43:17.67092	2022-01-17 13:43:17.67092
565	137	Ьгы	2022-01-17 13:44:47.282425	2022-01-17 13:44:47.282425
566	137	Musi	2022-01-17 13:44:52.219143	2022-01-17 13:44:52.219143
567	137	Mus	2022-01-17 13:44:53.320749	2022-01-17 13:44:53.320749
568	378	E	2022-01-17 13:47:06.021673	2022-01-17 13:47:06.021673
569	378	Emm	2022-01-17 13:47:13.624821	2022-01-17 13:47:13.624821
570	378	УЬЬФ	2022-01-17 15:13:29.220073	2022-01-17 15:13:29.220073
571	378	M	2022-01-17 15:13:37.295532	2022-01-17 15:13:37.295532
572	137	Ы	2022-01-18 09:25:10.201905	2022-01-18 09:25:10.201905
573	129	ujjaval	2022-01-18 09:27:39.465048	2022-01-18 09:27:39.465048
574	370	Умф	2022-01-18 09:33:08.610543	2022-01-18 09:33:08.610543
575	370	E	2022-01-18 09:33:16.46473	2022-01-18 09:33:16.46473
576	370	Evan	2022-01-18 09:33:17.788499	2022-01-18 09:33:17.788499
577	370	Eva	2022-01-18 09:34:35.396965	2022-01-18 09:34:35.396965
578	370	test	2022-01-18 10:49:28.262788	2022-01-18 10:49:28.262788
579	370	nat	2022-01-18 11:23:09.136912	2022-01-18 11:23:09.136912
580	370	nature	2022-01-18 11:23:10.847923	2022-01-18 11:23:10.847923
581	370	Go	2022-01-18 12:12:21.359139	2022-01-18 12:12:21.359139
582	370	Goh	2022-01-18 12:12:25.289649	2022-01-18 12:12:25.289649
583	370	Gohdog	2022-01-18 12:12:27.284896	2022-01-18 12:12:27.284896
584	248	roman	2022-01-19 07:02:32.616532	2022-01-19 07:02:32.616532
585	248	romanek	2022-01-19 07:02:45.609734	2022-01-19 07:02:45.609734
586	248	emma	2022-01-19 07:03:02.235422	2022-01-19 07:03:02.235422
587	248	user	2022-01-19 07:03:54.565239	2022-01-19 07:03:54.565239
588	370	еуые	2022-01-19 07:49:30.26219	2022-01-19 07:49:30.26219
589	378	Rich Kid 	2022-01-19 08:54:25.463048	2022-01-19 08:54:25.463048
590	370	Test	2022-01-19 09:11:26.581739	2022-01-19 09:11:26.581739
591	378	evan	2022-01-19 10:11:28.832045	2022-01-19 10:11:28.832045
592	378	emma	2022-01-19 10:11:40.837881	2022-01-19 10:11:40.837881
593	378	test	2022-01-19 10:11:49.463261	2022-01-19 10:11:49.463261
594	378	Evan\\	2022-01-19 10:12:48.432241	2022-01-19 10:12:48.432241
595	370	DB	2022-01-19 10:38:00.976308	2022-01-19 10:38:00.976308
596	370	Ema	2022-01-19 10:39:20.993549	2022-01-19 10:39:20.993549
597	370	music	2022-01-19 10:40:15.480714	2022-01-19 10:40:15.480714
598	370	mich	2022-01-19 10:40:44.48003	2022-01-19 10:40:44.48003
599	370	michael	2022-01-19 10:40:51.36523	2022-01-19 10:40:51.36523
600	370	Will	2022-01-19 10:41:30.801506	2022-01-19 10:41:30.801506
601	370	will4	2022-01-19 10:41:40.10589	2022-01-19 10:41:40.10589
602	370	Peter	2022-01-19 10:42:05.156085	2022-01-19 10:42:05.156085
603	129	Te	2022-01-19 10:58:24.222624	2022-01-19 10:58:24.222624
604	129	Temp	2022-01-19 10:58:28.186947	2022-01-19 10:58:28.186947
605	378	DB	2022-01-19 11:16:25.41296	2022-01-19 11:16:25.41296
606	378	hj	2022-01-19 11:16:53.083707	2022-01-19 11:16:53.083707
607	378	em	2022-01-19 11:17:01.768053	2022-01-19 11:17:01.768053
608	378	ema	2022-01-19 11:17:03.691909	2022-01-19 11:17:03.691909
609	370	Bd	2022-01-19 12:39:22.899017	2022-01-19 12:39:22.899017
610	370	В	2022-01-20 08:12:38.669532	2022-01-20 08:12:38.669532
611	370	tenor	2022-01-20 08:23:04.39407	2022-01-20 08:23:04.39407
612	370	teno	2022-01-20 08:23:17.894419	2022-01-20 08:23:17.894419
613	370	ten	2022-01-20 08:23:27.109417	2022-01-20 08:23:27.109417
614	370	tentere	2022-01-20 08:23:28.169146	2022-01-20 08:23:28.169146
615	370	tere	2022-01-20 08:23:33.594685	2022-01-20 08:23:33.594685
616	370	demo	2022-01-20 08:23:49.215096	2022-01-20 08:23:49.215096
617	370	Made it	2022-01-20 08:24:07.492904	2022-01-20 08:24:07.492904
618	370	SPIDER	2022-01-20 08:24:21.488097	2022-01-20 08:24:21.488097
619	370	fire	2022-01-20 08:24:47.218993	2022-01-20 08:24:47.218993
620	370	Rich Kid 	2022-01-20 08:25:20.502616	2022-01-20 08:25:20.502616
621	376	a	2022-01-20 08:46:09.825614	2022-01-20 08:46:09.825614
622	376	ab	2022-01-20 08:46:13.468339	2022-01-20 08:46:13.468339
623	370	sa	2022-01-20 09:17:00.871756	2022-01-20 09:17:00.871756
624	370	sarah	2022-01-20 09:17:07.521807	2022-01-20 09:17:07.521807
625	370	cinderella	2022-01-20 09:22:40.967275	2022-01-20 09:22:40.967275
626	376	умф	2022-01-20 10:13:13.873637	2022-01-20 10:13:13.873637
627	376	evan	2022-01-20 10:13:19.851554	2022-01-20 10:13:19.851554
628	370	sara	2022-01-20 10:14:38.885783	2022-01-20 10:14:38.885783
629	370	Castlevania	2022-01-20 10:20:54.005641	2022-01-20 10:20:54.005641
630	371	*	2022-01-20 12:56:08.212304	2022-01-20 12:56:08.212304
631	124	rob	2022-01-21 08:35:17.859993	2022-01-21 08:35:17.859993
632	266	akshay	2022-01-21 09:46:18.37843	2022-01-21 09:46:18.37843
633	370	ben	2022-01-21 15:04:34.378407	2022-01-21 15:04:34.378407
634	266	lala	2022-01-24 08:50:39.283758	2022-01-24 08:50:39.283758
635	266	lalji	2022-01-24 08:50:43.878642	2022-01-24 08:50:43.878642
636	266	la	2022-01-24 12:16:56.568697	2022-01-24 12:16:56.568697
637	266	jhj	2022-01-24 12:27:33.803245	2022-01-24 12:27:33.803245
638	370	em	2022-01-24 12:51:18.874507	2022-01-24 12:51:18.874507
639	370	ema	2022-01-24 13:06:56.88612	2022-01-24 13:06:56.88612
640	379	eva	2022-01-24 13:54:07.201866	2022-01-24 13:54:07.201866
641	379	evan	2022-01-24 13:56:02.038028	2022-01-24 13:56:02.038028
642	379	emma	2022-01-24 13:56:20.668135	2022-01-24 13:56:20.668135
643	266	ak	2022-01-25 09:23:38.584234	2022-01-25 09:23:38.584234
644	260	robert	2022-01-25 13:33:06.362797	2022-01-25 13:33:06.362797
645	266	twinkal	2022-01-25 13:34:10.417616	2022-01-25 13:34:10.417616
646	371	twinkal	2022-01-25 13:35:14.412567	2022-01-25 13:35:14.412567
647	266	arun	2022-01-25 13:40:17.018181	2022-01-25 13:40:17.018181
648	266	arun murgan	2022-01-25 13:56:50.990256	2022-01-25 13:56:50.990256
649	266	arun murugan	2022-01-25 13:56:55.451656	2022-01-25 13:56:55.451656
650	370	db	2022-01-25 14:06:33.469407	2022-01-25 14:06:33.469407
651	370	user	2022-01-25 14:14:10.166814	2022-01-25 14:14:10.166814
652	370	Ar	2022-01-25 14:17:45.984127	2022-01-25 14:17:45.984127
653	370	Arun	2022-01-25 14:17:50.657103	2022-01-25 14:17:50.657103
654	370	Sara	2022-01-26 13:42:14.190037	2022-01-26 13:42:14.190037
655	371	arun	2022-01-27 04:07:07.607054	2022-01-27 04:07:07.607054
656	133	test	2022-01-27 07:14:24.03608	2022-01-27 07:14:24.03608
657	248	core	2022-01-27 07:27:07.393124	2022-01-27 07:27:07.393124
658	370	core	2022-01-27 09:05:14.001135	2022-01-27 09:05:14.001135
659	376	e	2022-01-27 09:17:28.670284	2022-01-27 09:17:28.670284
660	376	evan peter	2022-01-27 09:17:39.752625	2022-01-27 09:17:39.752625
661	376	evan peters	2022-01-27 09:17:41.102733	2022-01-27 09:17:41.102733
662	376	Evan Peters	2022-01-27 09:29:59.484203	2022-01-27 09:29:59.484203
663	376	Evant	2022-01-27 09:30:15.345614	2022-01-27 09:30:15.345614
664	376	Evanе	2022-01-27 09:30:17.198224	2022-01-27 09:30:17.198224
665	376	Умфт	2022-01-27 09:38:54.366874	2022-01-27 09:38:54.366874
666	371	asdcscdscsdcsdv	2022-01-27 10:23:11.300104	2022-01-27 10:23:11.300104
667	376	evaa	2022-01-27 12:43:24.468383	2022-01-27 12:43:24.468383
668	370	de	2022-01-27 13:16:48.504976	2022-01-27 13:16:48.504976
669	370	devid	2022-01-27 13:16:54.296387	2022-01-27 13:16:54.296387
670	376	у	2022-01-27 13:35:05.693047	2022-01-27 13:35:05.693047
671	370	вумшв	2022-01-27 15:27:15.004651	2022-01-27 15:27:15.004651
672	370	devid cane	2022-01-27 15:27:21.130505	2022-01-27 15:27:21.130505
673	129	test tes	2022-01-28 05:33:19.582573	2022-01-28 05:33:19.582573
674	129	test123acc	2022-01-28 05:33:24.673048	2022-01-28 05:33:24.673048
675	371	db	2022-01-28 07:42:01.061791	2022-01-28 07:42:01.061791
676	370	test test	2022-01-28 08:13:05.158604	2022-01-28 08:13:05.158604
677	376	db	2022-01-28 08:13:32.44174	2022-01-28 08:13:32.44174
678	376	test	2022-01-28 08:13:54.292381	2022-01-28 08:13:54.292381
679	370	black	2022-01-28 08:19:07.984019	2022-01-28 08:19:07.984019
680	370	elena	2022-01-28 08:20:13.997445	2022-01-28 08:20:13.997445
681	370	Ыфк	2022-01-28 09:40:19.174934	2022-01-28 09:40:19.174934
682	370	nsture	2022-01-28 10:48:27.781941	2022-01-28 10:48:27.781941
683	370	ben wise	2022-01-28 10:59:04.954923	2022-01-28 10:59:04.954923
684	376	Ben Wise	2022-01-28 11:01:47.575828	2022-01-28 11:01:47.575828
685	379	Ben Wise	2022-01-28 11:02:02.318274	2022-01-28 11:02:02.318274
686	379	Sarah	2022-01-28 11:02:16.138076	2022-01-28 11:02:16.138076
687	379	Sar	2022-01-28 11:02:25.686649	2022-01-28 11:02:25.686649
688	379	db	2022-01-28 11:02:37.18762	2022-01-28 11:02:37.18762
689	370	evan	2022-01-28 12:34:23.888805	2022-01-28 12:34:23.888805
690	376	умфт	2022-01-28 15:47:06.72538	2022-01-28 15:47:06.72538
691	129	111	2022-01-31 06:42:59.131836	2022-01-31 06:42:59.131836
692	124	ujja	2022-01-31 07:01:31.657171	2022-01-31 07:01:31.657171
693	376	ema	2022-01-31 09:39:59.779	2022-01-31 09:39:59.779
694	376	w	2022-01-31 09:40:30.572373	2022-01-31 09:40:30.572373
695	370	testtestnew	2022-01-31 09:49:08.362374	2022-01-31 09:49:08.362374
696	266	akshay prajapati	2022-01-31 11:55:51.792208	2022-01-31 11:55:51.792208
697	124	akshay	2022-01-31 11:56:24.768471	2022-01-31 11:56:24.768471
698	370	ыфк	2022-01-31 12:29:06.38638	2022-01-31 12:29:06.38638
699	376	will	2022-01-31 12:30:12.259726	2022-01-31 12:30:12.259726
700	376	EVAN	2022-01-31 12:43:29.667546	2022-01-31 12:43:29.667546
701	248	 nbf	2022-01-31 13:04:57.298044	2022-01-31 13:04:57.298044
702	248	 user	2022-01-31 13:05:04.112482	2022-01-31 13:05:04.112482
703	370	sar	2022-01-31 13:29:57.058048	2022-01-31 13:29:57.058048
704	370	ви	2022-01-31 13:39:49.461464	2022-01-31 13:39:49.461464
705	370	Hanna	2022-01-31 13:41:21.181561	2022-01-31 13:41:21.181561
706	370	ritu	2022-01-31 13:41:56.673267	2022-01-31 13:41:56.673267
707	383	evan	2022-01-31 14:31:37.262951	2022-01-31 14:31:37.262951
708	370	test user	2022-01-31 14:34:30.185334	2022-01-31 14:34:30.185334
709	133	lalj	2022-02-01 07:20:30.813287	2022-02-01 07:20:30.813287
710	133	lal	2022-02-01 07:20:35.507642	2022-02-01 07:20:35.507642
711	133	test test	2022-02-01 07:20:46.975657	2022-02-01 07:20:46.975657
712	133	Arun	2022-02-01 07:27:58.376175	2022-02-01 07:27:58.376175
713	133	Arun Murugan	2022-02-01 07:28:10.093474	2022-02-01 07:28:10.093474
714	370	Black	2022-02-01 09:04:19.966113	2022-02-01 09:04:19.966113
715	370	cor	2022-02-01 09:04:39.066571	2022-02-01 09:04:39.066571
716	370	jeni	2022-02-01 09:22:27.958312	2022-02-01 09:22:27.958312
717	370	jenifer	2022-02-01 09:22:34.230339	2022-02-01 09:22:34.230339
718	137	sarah	2022-02-01 09:42:22.506524	2022-02-01 09:42:22.506524
719	285	aksay	2022-02-01 10:56:07.767233	2022-02-01 10:56:07.767233
720	285	arun	2022-02-01 11:29:47.206239	2022-02-01 11:29:47.206239
721	288	arun	2022-02-01 11:32:31.485052	2022-02-01 11:32:31.485052
722	370	db user	2022-02-01 12:06:20.467829	2022-02-01 12:06:20.467829
723	129	ujjavalbarot 104@gmail.com	2022-02-01 12:49:00.768719	2022-02-01 12:49:00.768719
724	370	у	2022-02-01 13:39:22.791107	2022-02-01 13:39:22.791107
725	370	wmm	2022-02-01 13:42:18.292887	2022-02-01 13:42:18.292887
726	370	уььф	2022-02-01 13:42:24.422236	2022-02-01 13:42:24.422236
727	137	ar	2022-02-01 14:25:49.792825	2022-02-01 14:25:49.792825
728	137	aru	2022-02-01 14:25:55.394242	2022-02-01 14:25:55.394242
729	137	arun	2022-02-01 14:26:16.621908	2022-02-01 14:26:16.621908
730	137	test	2022-02-01 14:30:14.005955	2022-02-01 14:30:14.005955
731	137	user	2022-02-01 15:00:43.122894	2022-02-01 15:00:43.122894
732	137	will	2022-02-01 15:09:08.284981	2022-02-01 15:09:08.284981
733	370	arun	2022-02-01 15:11:38.565671	2022-02-01 15:11:38.565671
734	124	test	2022-02-01 16:20:53.55801	2022-02-01 16:20:53.55801
735	371	arun murug	2022-02-02 04:40:21.467285	2022-02-02 04:40:21.467285
736	371	arun murugan	2022-02-02 04:40:26.565956	2022-02-02 04:40:26.565956
737	371	arun murugun	2022-02-02 04:40:37.185136	2022-02-02 04:40:37.185136
738	129	akshay	2022-02-02 04:41:17.068979	2022-02-02 04:41:17.068979
739	129	aksh	2022-02-02 04:52:13.761499	2022-02-02 04:52:13.761499
740	129	akshs	2022-02-02 04:52:20.109537	2022-02-02 04:52:20.109537
741	129	aksha	2022-02-02 04:52:25.217421	2022-02-02 04:52:25.217421
742	129	a	2022-02-02 04:56:02.389777	2022-02-02 04:56:02.389777
743	271	aks	2022-02-02 05:05:36.756451	2022-02-02 05:05:36.756451
744	271	aksha	2022-02-02 05:05:42.193439	2022-02-02 05:05:42.193439
745	286	arun	2022-02-02 05:26:56.62408	2022-02-02 05:26:56.62408
746	286	twin	2022-02-02 05:31:43.817171	2022-02-02 05:31:43.817171
747	286	twinkal	2022-02-02 05:31:50.058208	2022-02-02 05:31:50.058208
748	371	test test	2022-02-02 05:44:09.828827	2022-02-02 05:44:09.828827
749	124	utsa	2022-02-02 06:01:03.448166	2022-02-02 06:01:03.448166
750	305	sara	2022-02-02 07:18:32.809176	2022-02-02 07:18:32.809176
751	137	use	2022-02-02 08:43:21.157756	2022-02-02 08:43:21.157756
752	137	devi	2022-02-02 11:56:51.665205	2022-02-02 11:56:51.665205
753	137	usr	2022-02-02 12:11:43.666159	2022-02-02 12:11:43.666159
754	137	Ыфкфр	2022-02-02 12:12:51.080155	2022-02-02 12:12:51.080155
756	389	Olena	2022-02-02 13:02:05.790237	2022-02-02 13:02:05.790237
757	137	ыфкф	2022-02-02 13:11:32.589796	2022-02-02 13:11:32.589796
758	389	will	2022-02-02 13:15:19.112091	2022-02-02 13:15:19.112091
759	389	smith	2022-02-02 13:15:39.157108	2022-02-02 13:15:39.157108
760	137	qwl	2022-02-02 13:30:52.372652	2022-02-02 13:30:52.372652
761	137	owl	2022-02-02 13:30:56.07278	2022-02-02 13:30:56.07278
762	137	smile	2022-02-02 13:32:11.67086	2022-02-02 13:32:11.67086
763	376	тфегку	2022-02-02 13:35:23.670524	2022-02-02 13:35:23.670524
764	376	тфегкуnature	2022-02-02 13:35:25.666726	2022-02-02 13:35:25.666726
765	376	nature	2022-02-02 13:35:28.661726	2022-02-02 13:35:28.661726
766	137	nature	2022-02-02 13:39:15.006955	2022-02-02 13:39:15.006955
767	259	dim	2022-02-03 05:19:05.23448	2022-02-03 05:19:05.23448
768	259	dimpal	2022-02-03 05:19:10.854206	2022-02-03 05:19:10.854206
769	390	mohi	2022-02-03 05:29:07.69687	2022-02-03 05:29:07.69687
770	137	test test	2022-02-03 08:12:06.085254	2022-02-03 08:12:06.085254
771	137	devid	2022-02-03 08:57:32.902491	2022-02-03 08:57:32.902491
772	378	еуые	2022-02-03 09:51:06.090584	2022-02-03 09:51:06.090584
773	390	aksay	2022-02-04 08:05:16.877232	2022-02-04 08:05:16.877232
774	390	aksa	2022-02-04 08:24:23.054385	2022-02-04 08:24:23.054385
775	136	user	2022-02-04 09:48:37.765687	2022-02-04 09:48:37.765687
776	136	sara	2022-02-04 09:49:07.741988	2022-02-04 09:49:07.741988
777	136	Фкгт	2022-02-04 09:51:02.882751	2022-02-04 09:51:02.882751
778	136	Arun	2022-02-04 09:51:07.916108	2022-02-04 09:51:07.916108
779	136	Bha	2022-02-04 09:51:50.070717	2022-02-04 09:51:50.070717
780	136	Bhawna	2022-02-04 09:51:55.544273	2022-02-04 09:51:55.544273
781	136	test	2022-02-04 10:19:56.707401	2022-02-04 10:19:56.707401
782	378	devid	2022-02-04 10:28:11.81232	2022-02-04 10:28:11.81232
783	378	will	2022-02-04 10:28:18.702097	2022-02-04 10:28:18.702097
784	378	цшдд4	2022-02-04 10:31:09.114345	2022-02-04 10:31:09.114345
785	136	вумшв	2022-02-04 10:33:08.501156	2022-02-04 10:33:08.501156
786	136	dev	2022-02-04 10:33:14.001645	2022-02-04 10:33:14.001645
787	136	devid	2022-02-04 10:33:15.22221	2022-02-04 10:33:15.22221
788	136	evan	2022-02-08 08:02:39.174874	2022-02-08 08:02:39.174874
789	124	dsdcsdc	2022-02-08 08:53:18.09073	2022-02-08 08:53:18.09073
\.


--
-- Data for Name: seller_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seller_accounts (id, firm_name, full_phone_number, location, country_code, phone_number, gstin_number, wholesaler, retailer, manufacturer, hallmarking_center, buy_gold, buy_silver, sell_gold, sell_silver, deal_in, about_us, activated, account_id, lat, long, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, title, name) FROM stdin;
\.


--
-- Data for Name: sms_otps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sms_otps (id, full_phone_number, pin, activated, valid_until, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: social_media_shares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_media_shares (id, account_id, is_whatsapp_shared, is_facebook_shared, is_twitter_shared, is_instagram_shared, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sub_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_categories (id, name, created_at, updated_at, parent_id, rank) FROM stdin;
1	Pre Primary (kg)	2021-10-21 14:53:11.181411	2021-10-21 14:53:11.181411	\N	\N
2	Primary (1 to 5)	2021-10-21 14:53:11.200678	2021-10-21 14:53:11.200678	\N	\N
3	Middle (6 to 8)	2021-10-21 14:53:11.214432	2021-10-21 14:53:11.214432	\N	\N
4	Secondary (9 & 10)	2021-10-21 14:53:11.227456	2021-10-21 14:53:11.227456	\N	\N
5	Senior Secondary (11 & 12)	2021-10-21 14:53:11.239496	2021-10-21 14:53:11.239496	\N	\N
6	Accounting & Commerce	2021-10-21 14:53:11.261276	2021-10-21 14:53:11.261276	\N	\N
7	Animation	2021-10-21 14:53:11.273853	2021-10-21 14:53:11.273853	\N	\N
8	Architecture & Alanning	2021-10-21 14:53:11.286513	2021-10-21 14:53:11.286513	\N	\N
9	Arts (Fine/Visual/Performing)	2021-10-21 14:53:11.298847	2021-10-21 14:53:11.298847	\N	\N
10	Aviation	2021-10-21 14:53:11.311392	2021-10-21 14:53:11.311392	\N	\N
11	Banking, Finance & Insurance	2021-10-21 14:53:11.327783	2021-10-21 14:53:11.327783	\N	\N
12	Beauty & Fitness	2021-10-21 14:53:11.340104	2021-10-21 14:53:11.340104	\N	\N
13	Business & Management Studies	2021-10-21 14:53:11.351988	2021-10-21 14:53:11.351988	\N	\N
14	Design	2021-10-21 14:53:11.36463	2021-10-21 14:53:11.36463	\N	\N
15	Engineering	2021-10-21 14:53:11.378031	2021-10-21 14:53:11.378031	\N	\N
16	Hospitality & Travel	2021-10-21 14:53:11.389759	2021-10-21 14:53:11.389759	\N	\N
17	Humanities & Social Sciences	2021-10-21 14:53:11.403335	2021-10-21 14:53:11.403335	\N	\N
18	IT & Software	2021-10-21 14:53:11.418216	2021-10-21 14:53:11.418216	\N	\N
19	Law	2021-10-21 14:53:11.430366	2021-10-21 14:53:11.430366	\N	\N
20	Mass Communication & Media	2021-10-21 14:53:11.454954	2021-10-21 14:53:11.454954	\N	\N
21	Medicine & Health Sciences	2021-10-21 14:53:11.484193	2021-10-21 14:53:11.484193	\N	\N
22	Nursing	2021-10-21 14:53:11.503956	2021-10-21 14:53:11.503956	\N	\N
23	Science	2021-10-21 14:53:11.530403	2021-10-21 14:53:11.530403	\N	\N
24	Teaching & Education	2021-10-21 14:53:11.545607	2021-10-21 14:53:11.545607	\N	\N
25	Banking	2021-10-21 14:53:11.569911	2021-10-21 14:53:11.569911	\N	\N
26	Railways	2021-10-21 14:53:11.586327	2021-10-21 14:53:11.586327	\N	\N
27	Defense	2021-10-21 14:53:11.602385	2021-10-21 14:53:11.602385	\N	\N
28	Police	2021-10-21 14:53:11.616356	2021-10-21 14:53:11.616356	\N	\N
29	UGC NET	2021-10-21 14:53:11.62903	2021-10-21 14:53:11.62903	\N	\N
30	Teaching	2021-10-21 14:53:11.641371	2021-10-21 14:53:11.641371	\N	\N
31	SSC	2021-10-21 14:53:11.656849	2021-10-21 14:53:11.656849	\N	\N
32	UPSC	2021-10-21 14:53:11.67218	2021-10-21 14:53:11.67218	\N	\N
33	State PSCs	2021-10-21 14:53:11.686726	2021-10-21 14:53:11.686726	\N	\N
34	Judiciary	2021-10-21 14:53:11.699171	2021-10-21 14:53:11.699171	\N	\N
35	JEE	2021-10-21 14:53:11.725017	2021-10-21 14:53:11.725017	\N	\N
36	NEET	2021-10-21 14:53:11.763786	2021-10-21 14:53:11.763786	\N	\N
37	CLAT	2021-10-21 14:53:11.778439	2021-10-21 14:53:11.778439	\N	\N
\.


--
-- Data for Name: system_experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_experiences (id, system_experience, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taggings (id, tag_id, taggable_type, taggable_id, tagger_type, tagger_id, context, created_at) FROM stdin;
1	1	BxBlockPosts::Post	61	AccountBlock::Account	129	tags	2022-01-10 09:51:28.078594
2	2	BxBlockPosts::Post	61	AccountBlock::Account	129	tags	2022-01-10 09:51:28.113316
3	3	BxBlockPosts::Post	61	AccountBlock::Account	129	tags	2022-01-10 09:51:28.124672
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name, created_at, updated_at, taggings_count) FROM stdin;
1	NFT	2022-01-10 09:51:28.009553	2022-01-10 09:51:28.009553	1
2	first_nft	2022-01-10 09:51:28.018346	2022-01-10 09:51:28.018346	1
3	my_nft	2022-01-10 09:51:28.022011	2022-01-10 09:51:28.022011	1
\.


--
-- Data for Name: terms_and_conditions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.terms_and_conditions (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: test_score_and_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test_score_and_courses (id, title, associated_with, score, test_date, description, make_public, profile_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tests (id, description, headline, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_categories (id, account_id, category_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_sub_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_sub_categories (id, account_id, sub_category_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: van_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.van_members (id, account_id, van_id) FROM stdin;
\.


--
-- Data for Name: vans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vans (id, name, bio, is_offline, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.videos (id, attached_item_id, attached_item_type, video, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: view_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.view_profiles (id, profile_bio_id, view_by_id, created_at, updated_at, account_id) FROM stdin;
\.


--
-- Data for Name: wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallets (id, wallet_type, address, account_id, created_at, updated_at) FROM stdin;
1	0	0xacd7c2c7f4dc72368b0ffafa401946e6f47ca73e	129	2021-11-10 12:38:38.68583	2021-11-10 12:38:38.68583
4	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 11:44:53.324782	2021-11-11 11:44:53.324782
5	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 11:46:19.227779	2021-11-11 11:46:19.227779
6	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 11:58:08.773568	2021-11-11 11:58:08.773568
7	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 11:59:37.353193	2021-11-11 11:59:37.353193
8	0	0x87f5923aaf806c84831ad6a468a4d20891514434	108	2021-11-11 12:24:03.588993	2021-11-11 12:24:03.588993
10	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:26:30.147617	2021-11-11 12:26:30.147617
12	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:29:59.708056	2021-11-11 12:29:59.708056
13	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:30:53.145195	2021-11-11 12:30:53.145195
14	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:32:41.040695	2021-11-11 12:32:41.040695
15	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:32:48.636241	2021-11-11 12:32:48.636241
16	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:32:54.997279	2021-11-11 12:32:54.997279
17	0	0x61cc669f3eb0dc4c34206b99bba094f1022a8ca5	108	2021-11-11 12:33:15.646579	2021-11-11 12:33:15.646579
18	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:33:48.308518	2021-11-11 12:33:48.308518
19	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:34:50.851123	2021-11-11 12:34:50.851123
20	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:36:18.760292	2021-11-11 12:36:18.760292
21	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:38:32.682574	2021-11-11 12:38:32.682574
22	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:40:03.206789	2021-11-11 12:40:03.206789
23	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:40:46.502993	2021-11-11 12:40:46.502993
24	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:42:19.682955	2021-11-11 12:42:19.682955
25	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:42:26.605333	2021-11-11 12:42:26.605333
26	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:43:36.353902	2021-11-11 12:43:36.353902
27	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:46:27.911239	2021-11-11 12:46:27.911239
28	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:47:33.179395	2021-11-11 12:47:33.179395
29	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:48:25.993044	2021-11-11 12:48:25.993044
30	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:49:28.028477	2021-11-11 12:49:28.028477
31	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:51:45.989028	2021-11-11 12:51:45.989028
32	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:54:06.501024	2021-11-11 12:54:06.501024
33	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:54:10.909411	2021-11-11 12:54:10.909411
34	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:54:13.7202	2021-11-11 12:54:13.7202
35	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:54:35.840574	2021-11-11 12:54:35.840574
36	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:58:10.679606	2021-11-11 12:58:10.679606
37	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 12:58:53.286839	2021-11-11 12:58:53.286839
38	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 13:57:11.12211	2021-11-11 13:57:11.12211
39	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 14:26:16.776971	2021-11-11 14:26:16.776971
40	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	125	2021-11-11 14:36:52.073596	2021-11-11 14:36:52.073596
41	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	141	2021-11-12 05:42:03.827843	2021-11-12 05:42:03.827843
42	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	141	2021-11-12 05:42:05.496772	2021-11-12 05:42:05.496772
43	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	141	2021-11-12 06:15:17.374093	2021-11-12 06:15:17.374093
44	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	141	2021-11-12 06:20:10.851183	2021-11-12 06:20:10.851183
45	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	141	2021-11-12 06:21:08.185397	2021-11-12 06:21:08.185397
46	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	141	2021-11-12 06:23:13.583575	2021-11-12 06:23:13.583575
47	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	141	2021-11-12 06:26:15.338726	2021-11-12 06:26:15.338726
48	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	141	2021-11-12 06:28:49.240237	2021-11-12 06:28:49.240237
49	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	141	2021-11-12 06:38:02.248586	2021-11-12 06:38:02.248586
50	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	124	2021-11-12 07:22:10.940912	2021-11-12 07:22:10.940912
52	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	141	2021-11-12 08:20:47.496729	2021-11-12 08:20:47.496729
53	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	124	2021-11-12 09:58:16.347198	2021-11-12 09:58:16.347198
54	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	124	2021-11-12 09:58:17.729741	2021-11-12 09:58:17.729741
55	0	0xf793e06D2F2b899842F58C85279AbeB672B2aBB0	124	2021-11-12 09:58:17.879835	2021-11-12 09:58:17.879835
57	0	0x6AF558913a6b3032F50fFE1CC4971D711230d50E	124	2021-11-12 14:41:42.137255	2021-11-12 14:41:42.137255
58	0	0x66A0670E8196B2055F4D7AF367e6ee52395Dd26D	133	2021-11-15 08:43:20.36081	2021-11-15 08:43:20.36081
60	0	0xf793e06d2f2b899842f58c85279abeb672b2abb0	193	2021-11-16 05:57:53.960313	2021-11-16 05:57:53.960313
61	0	0xa1b793da4bc34d3013aa7cad9fd1fa7f5e55112d	193	2021-11-16 06:10:59.851903	2021-11-16 06:10:59.851903
62	0	0xA1b793da4Bc34D3013aa7Cad9fd1FA7F5e55112d	124	2021-11-17 13:41:44.080648	2021-11-17 13:41:44.080648
63	0	0x66a0670e8196b2055f4d7af367e6ee52395dd26d	212	2021-11-17 14:46:17.739445	2021-11-17 14:46:17.739445
64	0	0xe30a9da5bbe39322d781ea5579e9178e1c0b9372	124	2021-11-18 05:25:48.656812	2021-11-18 05:25:48.656812
65	0	0xafa21db28c8be14e5ad5e2b51de975ec75dc68cc	124	2021-11-18 05:27:00.326932	2021-11-18 05:27:00.326932
66	0	0xb4cad8b3c52636fcce0d95157f23078ac84a4a4a	170	2021-11-18 06:19:12.399756	2021-11-18 06:19:12.399756
67	0	0xf06f52167448074352070bd7e06a4fd9569b1252	170	2021-11-18 06:19:37.944719	2021-11-18 06:19:37.944719
68	0	0x6af558913a6b3032f50ffe1cc4971d711230d50e	167	2021-11-18 07:08:35.132098	2021-11-18 07:08:35.132098
69	0	0x0a42e79c81397c0e412ab07f68088c4905b772a9	133	2021-11-18 09:06:11.116984	2021-11-18 09:06:11.116984
70	0	0x22e50fab0832b81f24609232d4fa3ae71fac0534	124	2021-11-18 09:35:55.537934	2021-11-18 09:35:55.537934
71	0	0x13b8e8bc3229d713c26b7862078ae7acd368314d	129	2021-11-18 12:31:24.263713	2021-11-18 12:31:24.263713
72	0	0x58158a69cfeef287216526d59dd27ffd199e255f	136	2021-11-23 10:59:00.080421	2021-11-23 10:59:00.080421
73	0	0xade9a58a8411993ef3f6348d5e566cd94b2f2ed9	136	2021-11-23 12:56:03.671169	2021-11-23 12:56:03.671169
74	0	0xc0a62b55b992ab97c5323c8bf138d28360e816cd	136	2021-11-23 15:34:31.901715	2021-11-23 15:34:31.901715
75	0	0x30cfded81b9c4a2d408a73fbdc9e3470f8019a60	248	2021-11-24 12:38:18.001645	2021-11-24 12:38:18.001645
76	0	0x362b13343e901f61753c8dbc9baba1aa47f2c83f	137	2021-11-30 12:19:22.565617	2021-11-30 12:19:22.565617
77	0	0x8be8d9d57b7f21f831717780b1956836139f4f8b	108	2021-12-03 16:01:36.078026	2021-12-03 16:01:36.078026
78	0	0x5271d5b8d8397024de04a16ae6cd995bfa430d53	124	2021-12-06 07:03:34.502066	2021-12-06 07:03:34.502066
79	0	0x3ee965ae147e95aaebb7aff6e04e8090fe608157	129	2021-12-21 06:23:05.050439	2021-12-21 06:23:05.050439
80	0	0x4772331d243eb2ee23fa7361b492139773207307	129	2022-01-07 11:03:14.66602	2022-01-07 11:03:14.66602
81	0	0x90f73314f8fca4eeae0f79176f1b78ed386727ae	370	2022-01-11 07:53:50.85561	2022-01-11 07:53:50.85561
82	0	0xd1d93a087cab89c0d9401a096ce7adf7c362f492	370	2022-01-11 10:02:45.467035	2022-01-11 10:02:45.467035
83	0	0x29745b503d656f71e32e01a4e044bb8623ce7f0c	129	2022-01-12 11:02:53.565331	2022-01-12 11:02:53.565331
84	0	0xcf5c21b7de6a39c9c2c5ec0115b5260047eeb643	376	2022-01-13 12:25:15.522676	2022-01-13 12:25:15.522676
85	0	0xc4a0f21132fd9d2b49c150d0888d5c01a14020bd	376	2022-01-13 12:35:59.216823	2022-01-13 12:35:59.216823
86	0	0x4f6842ff1f45a52f16cb21159f8a32b1f545a549	378	2022-01-19 08:09:24.984548	2022-01-19 08:09:24.984548
87	0	0x1bf98ce92b915d8246a0eac8aa3b9ae682259dee	129	2022-01-20 09:29:08.573632	2022-01-20 09:29:08.573632
88	0	0x5d25c1179cf237041f0ca1ce9ae57b7f3734ef8e	190	2022-01-26 14:12:14.913173	2022-01-26 14:12:14.913173
89	0	0xfa91ab5befe9a24813f4c6b104d999164464b46e	129	2022-01-27 09:15:29.262641	2022-01-27 09:15:29.262641
90	0	0x4b5bb38095168619fabcb9fb5c8f011fc8d911d8	129	2022-01-27 09:25:40.973677	2022-01-27 09:25:40.973677
91	0	0xac11ac533d537c71060ba7c134a955896e6a1d1c	137	2022-02-01 12:10:59.087808	2022-02-01 12:10:59.087808
92	0	0xe3dee8086db1186f587fe52d3576c43fe0546b90	271	2022-02-02 08:12:48.868018	2022-02-02 08:12:48.868018
\.


--
-- Name: account_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_categories_id_seq', 1, false);


--
-- Name: accounts_chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_chats_id_seq', 1, false);


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 393, true);


--
-- Name: achievements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.achievements_id_seq', 1, false);


--
-- Name: action_mailbox_inbound_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_mailbox_inbound_emails_id_seq', 1, false);


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 1, false);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 3, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 3, true);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 1, false);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: advertisements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.advertisements_id_seq', 1, false);


--
-- Name: application_message_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.application_message_translations_id_seq', 1, false);


--
-- Name: application_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.application_messages_id_seq', 1, false);


--
-- Name: associated_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.associated_projects_id_seq', 1, false);


--
-- Name: associateds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.associateds_id_seq', 1, false);


--
-- Name: audio_podcasts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audio_podcasts_id_seq', 1, false);


--
-- Name: audios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audios_id_seq', 1, false);


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_id_seq', 1, false);


--
-- Name: availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.availabilities_id_seq', 1, false);


--
-- Name: awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.awards_id_seq', 1, false);


--
-- Name: black_list_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.black_list_users_id_seq', 6, true);


--
-- Name: block_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.block_users_id_seq', 114, true);


--
-- Name: bookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookmarks_id_seq', 1, false);


--
-- Name: bx_block_appointment_management_booked_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bx_block_appointment_management_booked_slots_id_seq', 1, false);


--
-- Name: career_experience_employment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.career_experience_employment_types_id_seq', 1, false);


--
-- Name: career_experience_industry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.career_experience_industry_id_seq', 1, false);


--
-- Name: career_experience_system_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.career_experience_system_experiences_id_seq', 1, false);


--
-- Name: career_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.career_experiences_id_seq', 1, false);


--
-- Name: careers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.careers_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: categories_sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_sub_categories_id_seq', 74, true);


--
-- Name: chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_messages_id_seq', 1, false);


--
-- Name: chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chats_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 270, true);


--
-- Name: connections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.connections_id_seq', 430, true);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 91, true);


--
-- Name: content_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.content_texts_id_seq', 1, false);


--
-- Name: content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.content_types_id_seq', 1, false);


--
-- Name: content_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.content_videos_id_seq', 1, false);


--
-- Name: contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contents_id_seq', 1, false);


--
-- Name: contents_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contents_languages_id_seq', 1, false);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 1, false);


--
-- Name: cta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cta_id_seq', 1, false);


--
-- Name: current_annual_salaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.current_annual_salaries_id_seq', 1, false);


--
-- Name: current_annual_salary_current_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.current_annual_salary_current_status_id_seq', 1, false);


--
-- Name: current_status_employment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.current_status_employment_types_id_seq', 1, false);


--
-- Name: current_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.current_status_id_seq', 1, false);


--
-- Name: current_status_industries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.current_status_industries_id_seq', 1, false);


--
-- Name: degree_educational_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.degree_educational_qualifications_id_seq', 1, false);


--
-- Name: degrees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.degrees_id_seq', 1, false);


--
-- Name: educational_qualification_field_study_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.educational_qualification_field_study_id_seq', 1, false);


--
-- Name: educational_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.educational_qualifications_id_seq', 1, false);


--
-- Name: educations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.educations_id_seq', 1, false);


--
-- Name: email_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.email_notifications_id_seq', 1, false);


--
-- Name: email_otps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.email_otps_id_seq', 770, true);


--
-- Name: employment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employment_types_id_seq', 1, false);


--
-- Name: epubs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.epubs_id_seq', 1, false);


--
-- Name: exams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exams_id_seq', 1, false);


--
-- Name: favourites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favourites_id_seq', 1, false);


--
-- Name: field_study_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.field_study_id_seq', 1, false);


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.follows_id_seq', 1, false);


--
-- Name: global_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.global_settings_id_seq', 1, true);


--
-- Name: hobbies_and_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hobbies_and_interests_id_seq', 1, false);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 78, true);


--
-- Name: industries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.industries_id_seq', 1, false);


--
-- Name: interactive_faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interactive_faqs_id_seq', 3, true);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 1, false);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likes_id_seq', 614, true);


--
-- Name: live_streams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.live_streams_id_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_id_seq', 1, false);


--
-- Name: nfts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nfts_id_seq', 63, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1208, true);


--
-- Name: pdfs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pdfs_id_seq', 1, false);


--
-- Name: photo_libraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photo_libraries_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 97, true);


--
-- Name: preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.preferences_id_seq', 1, false);


--
-- Name: previously_owned_nfts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.previously_owned_nfts_id_seq', 45, true);


--
-- Name: privacy_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.privacy_policies_id_seq', 1, false);


--
-- Name: privacy_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.privacy_settings_id_seq', 1, false);


--
-- Name: profile_bios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_bios_id_seq', 1, false);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profiles_id_seq', 237, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, false);


--
-- Name: publication_patents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publication_patents_id_seq', 1, false);


--
-- Name: push_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.push_notifications_id_seq', 621, true);


--
-- Name: question_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_answers_id_seq', 1, false);


--
-- Name: question_sub_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_sub_types_id_seq', 1, false);


--
-- Name: question_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_types_id_seq', 1, false);


--
-- Name: report_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_posts_id_seq', 33, true);


--
-- Name: report_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_reasons_id_seq', 6, true);


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requests_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 1, false);


--
-- Name: search_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.search_histories_id_seq', 789, true);


--
-- Name: seller_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seller_accounts_id_seq', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, false);


--
-- Name: sms_otps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sms_otps_id_seq', 1, false);


--
-- Name: social_media_shares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_media_shares_id_seq', 1, false);


--
-- Name: sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_categories_id_seq', 37, true);


--
-- Name: system_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.system_experiences_id_seq', 1, false);


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taggings_id_seq', 3, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 3, true);


--
-- Name: terms_and_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terms_and_conditions_id_seq', 1, false);


--
-- Name: test_score_and_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_score_and_courses_id_seq', 1, false);


--
-- Name: tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tests_id_seq', 1, false);


--
-- Name: user_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_categories_id_seq', 1, false);


--
-- Name: user_sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_sub_categories_id_seq', 1, false);


--
-- Name: van_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.van_members_id_seq', 1, false);


--
-- Name: vans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vans_id_seq', 1, false);


--
-- Name: videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.videos_id_seq', 1, false);


--
-- Name: view_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.view_profiles_id_seq', 1, false);


--
-- Name: wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallets_id_seq', 92, true);


--
-- Name: account_categories account_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_categories
    ADD CONSTRAINT account_categories_pkey PRIMARY KEY (id);


--
-- Name: accounts_chats accounts_chats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_chats
    ADD CONSTRAINT accounts_chats_pkey PRIMARY KEY (id);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: action_mailbox_inbound_emails action_mailbox_inbound_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_mailbox_inbound_emails
    ADD CONSTRAINT action_mailbox_inbound_emails_pkey PRIMARY KEY (id);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: advertisements advertisements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advertisements
    ADD CONSTRAINT advertisements_pkey PRIMARY KEY (id);


--
-- Name: application_message_translations application_message_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_message_translations
    ADD CONSTRAINT application_message_translations_pkey PRIMARY KEY (id);


--
-- Name: application_messages application_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_messages
    ADD CONSTRAINT application_messages_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: associated_projects associated_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_projects
    ADD CONSTRAINT associated_projects_pkey PRIMARY KEY (id);


--
-- Name: associateds associateds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associateds
    ADD CONSTRAINT associateds_pkey PRIMARY KEY (id);


--
-- Name: audio_podcasts audio_podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audio_podcasts
    ADD CONSTRAINT audio_podcasts_pkey PRIMARY KEY (id);


--
-- Name: audios audios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audios
    ADD CONSTRAINT audios_pkey PRIMARY KEY (id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: availabilities availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availabilities
    ADD CONSTRAINT availabilities_pkey PRIMARY KEY (id);


--
-- Name: awards awards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (id);


--
-- Name: black_list_users black_list_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.black_list_users
    ADD CONSTRAINT black_list_users_pkey PRIMARY KEY (id);


--
-- Name: block_users block_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users
    ADD CONSTRAINT block_users_pkey PRIMARY KEY (id);


--
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


--
-- Name: bx_block_appointment_management_booked_slots bx_block_appointment_management_booked_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bx_block_appointment_management_booked_slots
    ADD CONSTRAINT bx_block_appointment_management_booked_slots_pkey PRIMARY KEY (id);


--
-- Name: career_experience_employment_types career_experience_employment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_experience_employment_types
    ADD CONSTRAINT career_experience_employment_types_pkey PRIMARY KEY (id);


--
-- Name: career_experience_industry career_experience_industry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_experience_industry
    ADD CONSTRAINT career_experience_industry_pkey PRIMARY KEY (id);


--
-- Name: career_experience_system_experiences career_experience_system_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_experience_system_experiences
    ADD CONSTRAINT career_experience_system_experiences_pkey PRIMARY KEY (id);


--
-- Name: career_experiences career_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_experiences
    ADD CONSTRAINT career_experiences_pkey PRIMARY KEY (id);


--
-- Name: careers careers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.careers
    ADD CONSTRAINT careers_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories_sub_categories categories_sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_sub_categories
    ADD CONSTRAINT categories_sub_categories_pkey PRIMARY KEY (id);


--
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: connections connections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: content_texts content_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_texts
    ADD CONSTRAINT content_texts_pkey PRIMARY KEY (id);


--
-- Name: content_types content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_types
    ADD CONSTRAINT content_types_pkey PRIMARY KEY (id);


--
-- Name: content_videos content_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_videos
    ADD CONSTRAINT content_videos_pkey PRIMARY KEY (id);


--
-- Name: contents_languages contents_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents_languages
    ADD CONSTRAINT contents_languages_pkey PRIMARY KEY (id);


--
-- Name: contents contents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents
    ADD CONSTRAINT contents_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: cta cta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cta
    ADD CONSTRAINT cta_pkey PRIMARY KEY (id);


--
-- Name: current_annual_salaries current_annual_salaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_annual_salaries
    ADD CONSTRAINT current_annual_salaries_pkey PRIMARY KEY (id);


--
-- Name: current_annual_salary_current_status current_annual_salary_current_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_annual_salary_current_status
    ADD CONSTRAINT current_annual_salary_current_status_pkey PRIMARY KEY (id);


--
-- Name: current_status_employment_types current_status_employment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_status_employment_types
    ADD CONSTRAINT current_status_employment_types_pkey PRIMARY KEY (id);


--
-- Name: current_status_industries current_status_industries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_status_industries
    ADD CONSTRAINT current_status_industries_pkey PRIMARY KEY (id);


--
-- Name: current_status current_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_status
    ADD CONSTRAINT current_status_pkey PRIMARY KEY (id);


--
-- Name: degree_educational_qualifications degree_educational_qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degree_educational_qualifications
    ADD CONSTRAINT degree_educational_qualifications_pkey PRIMARY KEY (id);


--
-- Name: degrees degrees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degrees
    ADD CONSTRAINT degrees_pkey PRIMARY KEY (id);


--
-- Name: educational_qualification_field_study educational_qualification_field_study_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educational_qualification_field_study
    ADD CONSTRAINT educational_qualification_field_study_pkey PRIMARY KEY (id);


--
-- Name: educational_qualifications educational_qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educational_qualifications
    ADD CONSTRAINT educational_qualifications_pkey PRIMARY KEY (id);


--
-- Name: educations educations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (id);


--
-- Name: email_notifications email_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_notifications
    ADD CONSTRAINT email_notifications_pkey PRIMARY KEY (id);


--
-- Name: email_otps email_otps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_otps
    ADD CONSTRAINT email_otps_pkey PRIMARY KEY (id);


--
-- Name: employment_types employment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employment_types
    ADD CONSTRAINT employment_types_pkey PRIMARY KEY (id);


--
-- Name: epubs epubs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.epubs
    ADD CONSTRAINT epubs_pkey PRIMARY KEY (id);


--
-- Name: exams exams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_pkey PRIMARY KEY (id);


--
-- Name: favourites favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_pkey PRIMARY KEY (id);


--
-- Name: field_study field_study_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.field_study
    ADD CONSTRAINT field_study_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: global_settings global_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_settings
    ADD CONSTRAINT global_settings_pkey PRIMARY KEY (id);


--
-- Name: hobbies_and_interests hobbies_and_interests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hobbies_and_interests
    ADD CONSTRAINT hobbies_and_interests_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: industries industries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries
    ADD CONSTRAINT industries_pkey PRIMARY KEY (id);


--
-- Name: interactive_faqs interactive_faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactive_faqs
    ADD CONSTRAINT interactive_faqs_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: live_streams live_streams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.live_streams
    ADD CONSTRAINT live_streams_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: nfts nfts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfts
    ADD CONSTRAINT nfts_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: pdfs pdfs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pdfs
    ADD CONSTRAINT pdfs_pkey PRIMARY KEY (id);


--
-- Name: photo_libraries photo_libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo_libraries
    ADD CONSTRAINT photo_libraries_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: preferences preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (id);


--
-- Name: previously_owned_nfts previously_owned_nfts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.previously_owned_nfts
    ADD CONSTRAINT previously_owned_nfts_pkey PRIMARY KEY (id);


--
-- Name: privacy_policies privacy_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies
    ADD CONSTRAINT privacy_policies_pkey PRIMARY KEY (id);


--
-- Name: privacy_settings privacy_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_settings
    ADD CONSTRAINT privacy_settings_pkey PRIMARY KEY (id);


--
-- Name: profile_bios profile_bios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_bios
    ADD CONSTRAINT profile_bios_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: publication_patents publication_patents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publication_patents
    ADD CONSTRAINT publication_patents_pkey PRIMARY KEY (id);


--
-- Name: push_notifications push_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications
    ADD CONSTRAINT push_notifications_pkey PRIMARY KEY (id);


--
-- Name: question_answers question_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_answers
    ADD CONSTRAINT question_answers_pkey PRIMARY KEY (id);


--
-- Name: question_sub_types question_sub_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_sub_types
    ADD CONSTRAINT question_sub_types_pkey PRIMARY KEY (id);


--
-- Name: question_types question_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_types
    ADD CONSTRAINT question_types_pkey PRIMARY KEY (id);


--
-- Name: report_posts report_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_posts
    ADD CONSTRAINT report_posts_pkey PRIMARY KEY (id);


--
-- Name: report_reasons report_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_reasons
    ADD CONSTRAINT report_reasons_pkey PRIMARY KEY (id);


--
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: search_histories search_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_histories
    ADD CONSTRAINT search_histories_pkey PRIMARY KEY (id);


--
-- Name: seller_accounts seller_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seller_accounts
    ADD CONSTRAINT seller_accounts_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: sms_otps sms_otps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sms_otps
    ADD CONSTRAINT sms_otps_pkey PRIMARY KEY (id);


--
-- Name: social_media_shares social_media_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_media_shares
    ADD CONSTRAINT social_media_shares_pkey PRIMARY KEY (id);


--
-- Name: sub_categories sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_categories
    ADD CONSTRAINT sub_categories_pkey PRIMARY KEY (id);


--
-- Name: system_experiences system_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_experiences
    ADD CONSTRAINT system_experiences_pkey PRIMARY KEY (id);


--
-- Name: taggings taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: terms_and_conditions terms_and_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions
    ADD CONSTRAINT terms_and_conditions_pkey PRIMARY KEY (id);


--
-- Name: test_score_and_courses test_score_and_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test_score_and_courses
    ADD CONSTRAINT test_score_and_courses_pkey PRIMARY KEY (id);


--
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: user_categories user_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT user_categories_pkey PRIMARY KEY (id);


--
-- Name: user_sub_categories user_sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sub_categories
    ADD CONSTRAINT user_sub_categories_pkey PRIMARY KEY (id);


--
-- Name: van_members van_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.van_members
    ADD CONSTRAINT van_members_pkey PRIMARY KEY (id);


--
-- Name: vans vans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vans
    ADD CONSTRAINT vans_pkey PRIMARY KEY (id);


--
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: view_profiles view_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.view_profiles
    ADD CONSTRAINT view_profiles_pkey PRIMARY KEY (id);


--
-- Name: wallets wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- Name: index_4df4694a81c904bef7786f2b09342fde44adca5f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_4df4694a81c904bef7786f2b09342fde44adca5f ON public.application_message_translations USING btree (application_message_id);


--
-- Name: index_accounts_chats_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_accounts_chats_on_account_id ON public.accounts_chats USING btree (account_id);


--
-- Name: index_accounts_chats_on_chat_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_accounts_chats_on_chat_id ON public.accounts_chats USING btree (chat_id);


--
-- Name: index_accounts_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_accounts_on_email ON public.accounts USING btree (email);


--
-- Name: index_action_mailbox_inbound_emails_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_action_mailbox_inbound_emails_uniqueness ON public.action_mailbox_inbound_emails USING btree (message_id, message_checksum);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_admin_users_on_email ON public.admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON public.admin_users USING btree (reset_password_token);


--
-- Name: index_application_message_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_application_message_translations_on_locale ON public.application_message_translations USING btree (locale);


--
-- Name: index_audios_on_attached_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_audios_on_attached_item_id ON public.audios USING btree (attached_item_id);


--
-- Name: index_audios_on_attached_item_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_audios_on_attached_item_type ON public.audios USING btree (attached_item_type);


--
-- Name: index_availabilities_on_service_provider_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_availabilities_on_service_provider_id ON public.availabilities USING btree (service_provider_id);


--
-- Name: index_black_list_users_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_black_list_users_on_account_id ON public.black_list_users USING btree (account_id);


--
-- Name: index_block_users_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_block_users_on_account_id ON public.block_users USING btree (account_id);


--
-- Name: index_block_users_on_current_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_block_users_on_current_user_id ON public.block_users USING btree (current_user_id);


--
-- Name: index_bookmarks_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_bookmarks_on_account_id ON public.bookmarks USING btree (account_id);


--
-- Name: index_bookmarks_on_content_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_bookmarks_on_content_id ON public.bookmarks USING btree (content_id);


--
-- Name: index_categories_sub_categories_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_categories_sub_categories_on_category_id ON public.categories_sub_categories USING btree (category_id);


--
-- Name: index_categories_sub_categories_on_sub_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_categories_sub_categories_on_sub_category_id ON public.categories_sub_categories USING btree (sub_category_id);


--
-- Name: index_chat_messages_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_chat_messages_on_account_id ON public.chat_messages USING btree (account_id);


--
-- Name: index_chat_messages_on_chat_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_chat_messages_on_chat_id ON public.chat_messages USING btree (chat_id);


--
-- Name: index_chats_on_recipient_id_and_sender_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_chats_on_recipient_id_and_sender_id ON public.chats USING btree (recipient_id, sender_id);


--
-- Name: index_comments_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_account_id ON public.comments USING btree (account_id);


--
-- Name: index_comments_on_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_post_id ON public.comments USING btree (post_id);


--
-- Name: index_connections_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_connections_on_account_id ON public.connections USING btree (account_id);


--
-- Name: index_contacts_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_contacts_on_account_id ON public.contacts USING btree (account_id);


--
-- Name: index_contents_languages_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_contents_languages_on_account_id ON public.contents_languages USING btree (account_id);


--
-- Name: index_contents_languages_on_language_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_contents_languages_on_language_id ON public.contents_languages USING btree (language_id);


--
-- Name: index_contents_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_contents_on_author_id ON public.contents USING btree (author_id);


--
-- Name: index_contents_on_contentable_type_and_contentable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_contents_on_contentable_type_and_contentable_id ON public.contents USING btree (contentable_type, contentable_id);


--
-- Name: index_cta_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_cta_on_category_id ON public.cta USING btree (category_id);


--
-- Name: index_email_notifications_on_notification_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_email_notifications_on_notification_id ON public.email_notifications USING btree (notification_id);


--
-- Name: index_follows_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_follows_on_account_id ON public.follows USING btree (account_id);


--
-- Name: index_follows_on_current_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_follows_on_current_user_id ON public.follows USING btree (current_user_id);


--
-- Name: index_images_on_attached_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_images_on_attached_item_id ON public.images USING btree (attached_item_id);


--
-- Name: index_images_on_attached_item_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_images_on_attached_item_type ON public.images USING btree (attached_item_type);


--
-- Name: index_likes_on_likeable_type_and_likeable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_likes_on_likeable_type_and_likeable_id ON public.likes USING btree (likeable_type, likeable_id);


--
-- Name: index_locations_on_locationable_type_and_locationable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_locations_on_locationable_type_and_locationable_id ON public.locations USING btree (locationable_type, locationable_id);


--
-- Name: index_nfts_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_nfts_on_account_id ON public.nfts USING btree (account_id);


--
-- Name: index_nfts_on_wallet_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_nfts_on_wallet_id ON public.nfts USING btree (wallet_id);


--
-- Name: index_notifications_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_notifications_on_account_id ON public.notifications USING btree (account_id);


--
-- Name: index_pdfs_on_attached_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_pdfs_on_attached_item_id ON public.pdfs USING btree (attached_item_id);


--
-- Name: index_pdfs_on_attached_item_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_pdfs_on_attached_item_type ON public.pdfs USING btree (attached_item_type);


--
-- Name: index_photo_libraries_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_photo_libraries_on_account_id ON public.photo_libraries USING btree (account_id);


--
-- Name: index_previously_owned_nfts_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_previously_owned_nfts_on_account_id ON public.previously_owned_nfts USING btree (account_id);


--
-- Name: index_previously_owned_nfts_on_wallet_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_previously_owned_nfts_on_wallet_id ON public.previously_owned_nfts USING btree (wallet_id);


--
-- Name: index_push_notification_type_and_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_push_notification_type_and_id ON public.push_notifications USING btree (push_notificable_type, push_notificable_id);


--
-- Name: index_push_notifications_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_push_notifications_on_account_id ON public.push_notifications USING btree (account_id);


--
-- Name: index_question_answers_on_question_sub_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_question_answers_on_question_sub_type_id ON public.question_answers USING btree (question_sub_type_id);


--
-- Name: index_question_sub_types_on_question_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_question_sub_types_on_question_type_id ON public.question_sub_types USING btree (question_type_id);


--
-- Name: index_report_posts_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_report_posts_on_account_id ON public.report_posts USING btree (account_id);


--
-- Name: index_report_posts_on_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_report_posts_on_post_id ON public.report_posts USING btree (post_id);


--
-- Name: index_report_posts_on_report_reason_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_report_posts_on_report_reason_id ON public.report_posts USING btree (report_reason_id);


--
-- Name: index_search_histories_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_search_histories_on_account_id ON public.search_histories USING btree (account_id);


--
-- Name: index_seller_accounts_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_seller_accounts_on_account_id ON public.seller_accounts USING btree (account_id);


--
-- Name: index_taggings_on_context; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_context ON public.taggings USING btree (context);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_tag_id ON public.taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_taggable_id ON public.taggings USING btree (taggable_id);


--
-- Name: index_taggings_on_taggable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_taggable_type ON public.taggings USING btree (taggable_type);


--
-- Name: index_taggings_on_tagger_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_tagger_id ON public.taggings USING btree (tagger_id);


--
-- Name: index_taggings_on_tagger_id_and_tagger_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_tagger_id_and_tagger_type ON public.taggings USING btree (tagger_id, tagger_type);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_tags_on_name ON public.tags USING btree (name);


--
-- Name: index_user_categories_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_categories_on_account_id ON public.user_categories USING btree (account_id);


--
-- Name: index_user_categories_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_categories_on_category_id ON public.user_categories USING btree (category_id);


--
-- Name: index_user_sub_categories_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_sub_categories_on_account_id ON public.user_sub_categories USING btree (account_id);


--
-- Name: index_user_sub_categories_on_sub_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_sub_categories_on_sub_category_id ON public.user_sub_categories USING btree (sub_category_id);


--
-- Name: index_videos_on_attached_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_videos_on_attached_item_id ON public.videos USING btree (attached_item_id);


--
-- Name: index_videos_on_attached_item_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_videos_on_attached_item_type ON public.videos USING btree (attached_item_type);


--
-- Name: index_wallets_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_wallets_on_account_id ON public.wallets USING btree (account_id);


--
-- Name: taggings_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX taggings_idx ON public.taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: taggings_idy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggings_idy ON public.taggings USING btree (taggable_id, taggable_type, tagger_id, context);


--
-- Name: taggings_taggable_context_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggings_taggable_context_idx ON public.taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: user_categories fk_rails_0457e32cde; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT fk_rails_0457e32cde FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: bookmarks fk_rails_0d2b48f1f4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT fk_rails_0d2b48f1f4 FOREIGN KEY (content_id) REFERENCES public.contents(id);


--
-- Name: notifications fk_rails_1c0a19e3ee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_rails_1c0a19e3ee FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: seller_accounts fk_rails_1c7bc2e3d5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seller_accounts
    ADD CONSTRAINT fk_rails_1c7bc2e3d5 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: black_list_users fk_rails_1d6c1cb6b7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.black_list_users
    ADD CONSTRAINT fk_rails_1d6c1cb6b7 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: chat_messages fk_rails_2024dfabfd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT fk_rails_2024dfabfd FOREIGN KEY (chat_id) REFERENCES public.chats(id);


--
-- Name: block_users fk_rails_25da0192d6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users
    ADD CONSTRAINT fk_rails_25da0192d6 FOREIGN KEY (current_user_id) REFERENCES public.accounts(id);


--
-- Name: previously_owned_nfts fk_rails_2669ec5a65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.previously_owned_nfts
    ADD CONSTRAINT fk_rails_2669ec5a65 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: report_posts fk_rails_2b0824697b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_posts
    ADD CONSTRAINT fk_rails_2b0824697b FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: user_categories fk_rails_2de1c69cdd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT fk_rails_2de1c69cdd FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: comments fk_rails_2fd19c0db7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_2fd19c0db7 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: categories_sub_categories fk_rails_3a299ddce3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_sub_categories
    ADD CONSTRAINT fk_rails_3a299ddce3 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: report_posts fk_rails_3f5a03bbf6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_posts
    ADD CONSTRAINT fk_rails_3f5a03bbf6 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: categories_sub_categories fk_rails_48d9b570bc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_sub_categories
    ADD CONSTRAINT fk_rails_48d9b570bc FOREIGN KEY (sub_category_id) REFERENCES public.sub_categories(id);


--
-- Name: push_notifications fk_rails_75238ea861; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications
    ADD CONSTRAINT fk_rails_75238ea861 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: question_answers fk_rails_81a1a29ad9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_answers
    ADD CONSTRAINT fk_rails_81a1a29ad9 FOREIGN KEY (question_sub_type_id) REFERENCES public.question_sub_types(id);


--
-- Name: contents_languages fk_rails_8b5175b69d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents_languages
    ADD CONSTRAINT fk_rails_8b5175b69d FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: chat_messages fk_rails_8e0becf885; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT fk_rails_8e0becf885 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: contents_languages fk_rails_8e312705b2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents_languages
    ADD CONSTRAINT fk_rails_8e312705b2 FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: wallets fk_rails_9a119836b0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT fk_rails_9a119836b0 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: nfts fk_rails_9ab0d824b0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfts
    ADD CONSTRAINT fk_rails_9ab0d824b0 FOREIGN KEY (wallet_id) REFERENCES public.wallets(id);


--
-- Name: question_sub_types fk_rails_9d6d92272c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_sub_types
    ADD CONSTRAINT fk_rails_9d6d92272c FOREIGN KEY (question_type_id) REFERENCES public.question_types(id);


--
-- Name: bookmarks fk_rails_9f6ac182a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT fk_rails_9f6ac182a6 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: taggings fk_rails_9fcd2e236b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT fk_rails_9fcd2e236b FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: report_posts fk_rails_a52440e73e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_posts
    ADD CONSTRAINT fk_rails_a52440e73e FOREIGN KEY (report_reason_id) REFERENCES public.report_reasons(id);


--
-- Name: user_sub_categories fk_rails_b043233e7b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sub_categories
    ADD CONSTRAINT fk_rails_b043233e7b FOREIGN KEY (sub_category_id) REFERENCES public.sub_categories(id);


--
-- Name: connections fk_rails_b202e9a6e9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT fk_rails_b202e9a6e9 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: contents fk_rails_c7629c0d88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents
    ADD CONSTRAINT fk_rails_c7629c0d88 FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: block_users fk_rails_c89dc66938; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users
    ADD CONSTRAINT fk_rails_c89dc66938 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: comments fk_rails_cf9764b6b1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_cf9764b6b1 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: user_sub_categories fk_rails_d356e1f684; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sub_categories
    ADD CONSTRAINT fk_rails_d356e1f684 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: follows fk_rails_da6b19de37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fk_rails_da6b19de37 FOREIGN KEY (current_user_id) REFERENCES public.accounts(id);


--
-- Name: photo_libraries fk_rails_ded71a0c71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo_libraries
    ADD CONSTRAINT fk_rails_ded71a0c71 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: email_notifications fk_rails_e4b30bd02a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_notifications
    ADD CONSTRAINT fk_rails_e4b30bd02a FOREIGN KEY (notification_id) REFERENCES public.notifications(id);


--
-- Name: previously_owned_nfts fk_rails_ef6f9354f0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.previously_owned_nfts
    ADD CONSTRAINT fk_rails_ef6f9354f0 FOREIGN KEY (wallet_id) REFERENCES public.wallets(id);


--
-- Name: follows fk_rails_f59577ad9d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fk_rails_f59577ad9d FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- PostgreSQL database dump complete
--

