--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: abuse_reports; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.abuse_reports (
    id integer NOT NULL,
    reporter_id integer,
    user_id integer,
    message text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    message_html text,
    cached_markdown_version integer
);


ALTER TABLE public.abuse_reports OWNER TO gitlab;

--
-- Name: abuse_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.abuse_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abuse_reports_id_seq OWNER TO gitlab;

--
-- Name: abuse_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.abuse_reports_id_seq OWNED BY public.abuse_reports.id;


--
-- Name: appearances; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.appearances (
    id integer NOT NULL,
    title character varying NOT NULL,
    description text NOT NULL,
    logo character varying,
    updated_by integer,
    header_logo character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    description_html text,
    cached_markdown_version integer,
    new_project_guidelines text,
    new_project_guidelines_html text,
    header_message text,
    header_message_html text,
    footer_message text,
    footer_message_html text,
    message_background_color text,
    message_font_color text,
    favicon character varying
);


ALTER TABLE public.appearances OWNER TO gitlab;

--
-- Name: appearances_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.appearances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appearances_id_seq OWNER TO gitlab;

--
-- Name: appearances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.appearances_id_seq OWNED BY public.appearances.id;


--
-- Name: application_setting_terms; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.application_setting_terms (
    id integer NOT NULL,
    cached_markdown_version integer,
    terms text NOT NULL,
    terms_html text
);


ALTER TABLE public.application_setting_terms OWNER TO gitlab;

--
-- Name: application_setting_terms_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.application_setting_terms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_setting_terms_id_seq OWNER TO gitlab;

--
-- Name: application_setting_terms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.application_setting_terms_id_seq OWNED BY public.application_setting_terms.id;


--
-- Name: application_settings; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.application_settings (
    id integer NOT NULL,
    default_projects_limit integer,
    signup_enabled boolean,
    gravatar_enabled boolean,
    sign_in_text text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    home_page_url character varying,
    default_branch_protection integer DEFAULT 2,
    help_text text,
    restricted_visibility_levels text,
    version_check_enabled boolean DEFAULT true,
    max_attachment_size integer DEFAULT 10 NOT NULL,
    default_project_visibility integer,
    default_snippet_visibility integer,
    domain_whitelist text,
    user_oauth_applications boolean DEFAULT true,
    after_sign_out_path character varying,
    session_expire_delay integer DEFAULT 10080 NOT NULL,
    import_sources text,
    help_page_text text,
    admin_notification_email character varying,
    shared_runners_enabled boolean DEFAULT true NOT NULL,
    max_artifacts_size integer DEFAULT 100 NOT NULL,
    runners_registration_token character varying,
    max_pages_size integer DEFAULT 100 NOT NULL,
    require_two_factor_authentication boolean DEFAULT false,
    two_factor_grace_period integer DEFAULT 48,
    metrics_enabled boolean DEFAULT false,
    metrics_host character varying DEFAULT 'localhost'::character varying,
    metrics_pool_size integer DEFAULT 16,
    metrics_timeout integer DEFAULT 10,
    metrics_method_call_threshold integer DEFAULT 10,
    recaptcha_enabled boolean DEFAULT false,
    recaptcha_site_key character varying,
    recaptcha_private_key character varying,
    metrics_port integer DEFAULT 8089,
    akismet_enabled boolean DEFAULT false,
    akismet_api_key character varying,
    metrics_sample_interval integer DEFAULT 15,
    sentry_enabled boolean DEFAULT false,
    sentry_dsn character varying,
    email_author_in_body boolean DEFAULT false,
    default_group_visibility integer,
    repository_checks_enabled boolean DEFAULT false,
    shared_runners_text text,
    metrics_packet_size integer DEFAULT 1,
    disabled_oauth_sign_in_sources text,
    health_check_access_token character varying,
    send_user_confirmation_email boolean DEFAULT false,
    container_registry_token_expire_delay integer DEFAULT 5,
    after_sign_up_text text,
    user_default_external boolean DEFAULT false NOT NULL,
    elasticsearch_indexing boolean DEFAULT false NOT NULL,
    elasticsearch_search boolean DEFAULT false NOT NULL,
    repository_storages character varying DEFAULT 'default'::character varying,
    enabled_git_access_protocol character varying,
    domain_blacklist_enabled boolean DEFAULT false,
    domain_blacklist text,
    usage_ping_enabled boolean DEFAULT true NOT NULL,
    sign_in_text_html text,
    help_page_text_html text,
    shared_runners_text_html text,
    after_sign_up_text_html text,
    rsa_key_restriction integer DEFAULT 0 NOT NULL,
    dsa_key_restriction integer DEFAULT '-1'::integer NOT NULL,
    ecdsa_key_restriction integer DEFAULT 0 NOT NULL,
    ed25519_key_restriction integer DEFAULT 0 NOT NULL,
    housekeeping_enabled boolean DEFAULT true NOT NULL,
    housekeeping_bitmaps_enabled boolean DEFAULT true NOT NULL,
    housekeeping_incremental_repack_period integer DEFAULT 10 NOT NULL,
    housekeeping_full_repack_period integer DEFAULT 50 NOT NULL,
    housekeeping_gc_period integer DEFAULT 200 NOT NULL,
    html_emails_enabled boolean DEFAULT true,
    plantuml_url character varying,
    plantuml_enabled boolean,
    shared_runners_minutes integer DEFAULT 0 NOT NULL,
    repository_size_limit bigint DEFAULT 0,
    terminal_max_session_time integer DEFAULT 0 NOT NULL,
    unique_ips_limit_per_user integer,
    unique_ips_limit_time_window integer,
    unique_ips_limit_enabled boolean DEFAULT false NOT NULL,
    default_artifacts_expire_in character varying DEFAULT '0'::character varying NOT NULL,
    elasticsearch_url character varying DEFAULT 'http://localhost:9200'::character varying,
    elasticsearch_aws boolean DEFAULT false NOT NULL,
    elasticsearch_aws_region character varying DEFAULT 'us-east-1'::character varying,
    elasticsearch_aws_access_key character varying,
    elasticsearch_aws_secret_access_key character varying,
    geo_status_timeout integer DEFAULT 10,
    uuid character varying,
    polling_interval_multiplier numeric DEFAULT 1.0 NOT NULL,
    elasticsearch_experimental_indexer boolean,
    cached_markdown_version integer,
    clientside_sentry_enabled boolean DEFAULT false NOT NULL,
    clientside_sentry_dsn character varying,
    check_namespace_plan boolean DEFAULT false NOT NULL,
    mirror_max_delay integer DEFAULT 300 NOT NULL,
    mirror_max_capacity integer DEFAULT 100 NOT NULL,
    mirror_capacity_threshold integer DEFAULT 50 NOT NULL,
    prometheus_metrics_enabled boolean DEFAULT true NOT NULL,
    authorized_keys_enabled boolean DEFAULT true NOT NULL,
    help_page_hide_commercial_content boolean DEFAULT false,
    help_page_support_url character varying,
    slack_app_enabled boolean DEFAULT false,
    slack_app_id character varying,
    slack_app_secret character varying,
    slack_app_verification_token character varying,
    performance_bar_allowed_group_id integer,
    allow_group_owners_to_manage_ldap boolean DEFAULT true NOT NULL,
    hashed_storage_enabled boolean DEFAULT false NOT NULL,
    project_export_enabled boolean DEFAULT true NOT NULL,
    auto_devops_enabled boolean DEFAULT true NOT NULL,
    throttle_unauthenticated_enabled boolean DEFAULT false NOT NULL,
    throttle_unauthenticated_requests_per_period integer DEFAULT 3600 NOT NULL,
    throttle_unauthenticated_period_in_seconds integer DEFAULT 3600 NOT NULL,
    throttle_authenticated_api_enabled boolean DEFAULT false NOT NULL,
    throttle_authenticated_api_requests_per_period integer DEFAULT 7200 NOT NULL,
    throttle_authenticated_api_period_in_seconds integer DEFAULT 3600 NOT NULL,
    throttle_authenticated_web_enabled boolean DEFAULT false NOT NULL,
    throttle_authenticated_web_requests_per_period integer DEFAULT 7200 NOT NULL,
    throttle_authenticated_web_period_in_seconds integer DEFAULT 3600 NOT NULL,
    gitaly_timeout_default integer DEFAULT 55 NOT NULL,
    gitaly_timeout_medium integer DEFAULT 30 NOT NULL,
    gitaly_timeout_fast integer DEFAULT 10 NOT NULL,
    mirror_available boolean DEFAULT true NOT NULL,
    default_project_creation integer DEFAULT 2 NOT NULL,
    password_authentication_enabled_for_web boolean,
    password_authentication_enabled_for_git boolean DEFAULT true NOT NULL,
    auto_devops_domain character varying,
    external_authorization_service_enabled boolean DEFAULT false NOT NULL,
    external_authorization_service_url character varying,
    external_authorization_service_default_label character varying,
    pages_domain_verification_enabled boolean DEFAULT true NOT NULL,
    user_default_internal_regex character varying,
    allow_local_requests_from_hooks_and_services boolean DEFAULT false NOT NULL,
    external_authorization_service_timeout double precision DEFAULT 0.5,
    external_auth_client_cert text,
    encrypted_external_auth_client_key text,
    encrypted_external_auth_client_key_iv character varying,
    encrypted_external_auth_client_key_pass character varying,
    encrypted_external_auth_client_key_pass_iv character varying,
    email_additional_text character varying,
    enforce_terms boolean DEFAULT false,
    file_template_project_id integer,
    pseudonymizer_enabled boolean DEFAULT false NOT NULL,
    hide_third_party_offers boolean DEFAULT false NOT NULL,
    snowplow_enabled boolean DEFAULT false NOT NULL,
    snowplow_collector_uri character varying,
    snowplow_site_id character varying,
    snowplow_cookie_domain character varying,
    instance_statistics_visibility_private boolean DEFAULT false NOT NULL,
    web_ide_clientside_preview_enabled boolean DEFAULT false NOT NULL,
    user_show_add_ssh_key_message boolean DEFAULT true NOT NULL,
    custom_project_templates_group_id integer,
    usage_stats_set_by_user_id integer,
    receive_max_input_size integer,
    diff_max_patch_bytes integer DEFAULT 102400 NOT NULL,
    archive_builds_in_seconds integer,
    commit_email_hostname character varying
);


ALTER TABLE public.application_settings OWNER TO gitlab;

--
-- Name: application_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.application_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_settings_id_seq OWNER TO gitlab;

--
-- Name: application_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.application_settings_id_seq OWNED BY public.application_settings.id;


--
-- Name: approvals; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.approvals (
    id integer NOT NULL,
    merge_request_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.approvals OWNER TO gitlab;

--
-- Name: approvals_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.approvals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.approvals_id_seq OWNER TO gitlab;

--
-- Name: approvals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.approvals_id_seq OWNED BY public.approvals.id;


--
-- Name: approver_groups; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.approver_groups (
    id integer NOT NULL,
    target_id integer NOT NULL,
    target_type character varying NOT NULL,
    group_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.approver_groups OWNER TO gitlab;

--
-- Name: approver_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.approver_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.approver_groups_id_seq OWNER TO gitlab;

--
-- Name: approver_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.approver_groups_id_seq OWNED BY public.approver_groups.id;


--
-- Name: approvers; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.approvers (
    id integer NOT NULL,
    target_id integer NOT NULL,
    target_type character varying,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.approvers OWNER TO gitlab;

--
-- Name: approvers_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.approvers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.approvers_id_seq OWNER TO gitlab;

--
-- Name: approvers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.approvers_id_seq OWNED BY public.approvers.id;


--
-- Name: audit_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.audit_events (
    id integer NOT NULL,
    author_id integer NOT NULL,
    type character varying NOT NULL,
    entity_id integer NOT NULL,
    entity_type character varying NOT NULL,
    details text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.audit_events OWNER TO gitlab;

--
-- Name: audit_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.audit_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audit_events_id_seq OWNER TO gitlab;

--
-- Name: audit_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.audit_events_id_seq OWNED BY public.audit_events.id;


--
-- Name: award_emoji; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.award_emoji (
    id integer NOT NULL,
    name character varying,
    user_id integer,
    awardable_id integer,
    awardable_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.award_emoji OWNER TO gitlab;

--
-- Name: award_emoji_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.award_emoji_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.award_emoji_id_seq OWNER TO gitlab;

--
-- Name: award_emoji_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.award_emoji_id_seq OWNED BY public.award_emoji.id;


--
-- Name: badges; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.badges (
    id integer NOT NULL,
    link_url character varying NOT NULL,
    image_url character varying NOT NULL,
    project_id integer,
    group_id integer,
    type character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.badges OWNER TO gitlab;

--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.badges_id_seq OWNER TO gitlab;

--
-- Name: badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.badges_id_seq OWNED BY public.badges.id;


--
-- Name: board_assignees; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.board_assignees (
    id integer NOT NULL,
    board_id integer NOT NULL,
    assignee_id integer NOT NULL
);


ALTER TABLE public.board_assignees OWNER TO gitlab;

--
-- Name: board_assignees_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.board_assignees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.board_assignees_id_seq OWNER TO gitlab;

--
-- Name: board_assignees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.board_assignees_id_seq OWNED BY public.board_assignees.id;


--
-- Name: board_group_recent_visits; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.board_group_recent_visits (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer,
    board_id integer,
    group_id integer
);


ALTER TABLE public.board_group_recent_visits OWNER TO gitlab;

--
-- Name: board_group_recent_visits_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.board_group_recent_visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.board_group_recent_visits_id_seq OWNER TO gitlab;

--
-- Name: board_group_recent_visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.board_group_recent_visits_id_seq OWNED BY public.board_group_recent_visits.id;


--
-- Name: board_labels; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.board_labels (
    id integer NOT NULL,
    board_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE public.board_labels OWNER TO gitlab;

--
-- Name: board_labels_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.board_labels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.board_labels_id_seq OWNER TO gitlab;

--
-- Name: board_labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.board_labels_id_seq OWNED BY public.board_labels.id;


--
-- Name: board_project_recent_visits; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.board_project_recent_visits (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer,
    project_id integer,
    board_id integer
);


ALTER TABLE public.board_project_recent_visits OWNER TO gitlab;

--
-- Name: board_project_recent_visits_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.board_project_recent_visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.board_project_recent_visits_id_seq OWNER TO gitlab;

--
-- Name: board_project_recent_visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.board_project_recent_visits_id_seq OWNED BY public.board_project_recent_visits.id;


--
-- Name: boards; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.boards (
    id integer NOT NULL,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying DEFAULT 'Development'::character varying NOT NULL,
    milestone_id integer,
    group_id integer,
    weight integer
);


ALTER TABLE public.boards OWNER TO gitlab;

--
-- Name: boards_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.boards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_id_seq OWNER TO gitlab;

--
-- Name: boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.boards_id_seq OWNED BY public.boards.id;


--
-- Name: broadcast_messages; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.broadcast_messages (
    id integer NOT NULL,
    message text NOT NULL,
    starts_at timestamp without time zone NOT NULL,
    ends_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    color character varying,
    font character varying,
    message_html text NOT NULL,
    cached_markdown_version integer
);


ALTER TABLE public.broadcast_messages OWNER TO gitlab;

--
-- Name: broadcast_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.broadcast_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.broadcast_messages_id_seq OWNER TO gitlab;

--
-- Name: broadcast_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.broadcast_messages_id_seq OWNED BY public.broadcast_messages.id;


--
-- Name: chat_names; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.chat_names (
    id integer NOT NULL,
    user_id integer NOT NULL,
    service_id integer NOT NULL,
    team_id character varying NOT NULL,
    team_domain character varying,
    chat_id character varying NOT NULL,
    chat_name character varying,
    last_used_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.chat_names OWNER TO gitlab;

--
-- Name: chat_names_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.chat_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_names_id_seq OWNER TO gitlab;

--
-- Name: chat_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.chat_names_id_seq OWNED BY public.chat_names.id;


--
-- Name: chat_teams; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.chat_teams (
    id integer NOT NULL,
    namespace_id integer NOT NULL,
    team_id character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.chat_teams OWNER TO gitlab;

--
-- Name: chat_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.chat_teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_teams_id_seq OWNER TO gitlab;

--
-- Name: chat_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.chat_teams_id_seq OWNED BY public.chat_teams.id;


--
-- Name: ci_build_trace_chunks; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_build_trace_chunks (
    id bigint NOT NULL,
    build_id integer NOT NULL,
    chunk_index integer NOT NULL,
    data_store integer NOT NULL,
    raw_data bytea
);


ALTER TABLE public.ci_build_trace_chunks OWNER TO gitlab;

--
-- Name: ci_build_trace_chunks_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_build_trace_chunks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_build_trace_chunks_id_seq OWNER TO gitlab;

--
-- Name: ci_build_trace_chunks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_build_trace_chunks_id_seq OWNED BY public.ci_build_trace_chunks.id;


--
-- Name: ci_build_trace_section_names; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_build_trace_section_names (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.ci_build_trace_section_names OWNER TO gitlab;

--
-- Name: ci_build_trace_section_names_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_build_trace_section_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_build_trace_section_names_id_seq OWNER TO gitlab;

--
-- Name: ci_build_trace_section_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_build_trace_section_names_id_seq OWNED BY public.ci_build_trace_section_names.id;


--
-- Name: ci_build_trace_sections; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_build_trace_sections (
    id integer NOT NULL,
    project_id integer NOT NULL,
    date_start timestamp without time zone NOT NULL,
    date_end timestamp without time zone NOT NULL,
    byte_start bigint NOT NULL,
    byte_end bigint NOT NULL,
    build_id integer NOT NULL,
    section_name_id integer NOT NULL
);


ALTER TABLE public.ci_build_trace_sections OWNER TO gitlab;

--
-- Name: ci_build_trace_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_build_trace_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_build_trace_sections_id_seq OWNER TO gitlab;

--
-- Name: ci_build_trace_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_build_trace_sections_id_seq OWNED BY public.ci_build_trace_sections.id;


--
-- Name: ci_builds; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_builds (
    id integer NOT NULL,
    status character varying,
    finished_at timestamp without time zone,
    trace text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    started_at timestamp without time zone,
    runner_id integer,
    coverage double precision,
    commit_id integer,
    commands text,
    name character varying,
    options text,
    allow_failure boolean DEFAULT false NOT NULL,
    stage character varying,
    trigger_request_id integer,
    stage_idx integer,
    tag boolean,
    ref character varying,
    user_id integer,
    type character varying,
    target_url character varying,
    description character varying,
    artifacts_file text,
    project_id integer,
    artifacts_metadata text,
    erased_by_id integer,
    erased_at timestamp without time zone,
    artifacts_expire_at timestamp without time zone,
    environment character varying,
    artifacts_size bigint,
    "when" character varying,
    yaml_variables text,
    queued_at timestamp without time zone,
    token character varying,
    lock_version integer,
    coverage_regex character varying,
    auto_canceled_by_id integer,
    retried boolean,
    stage_id integer,
    artifacts_file_store integer,
    artifacts_metadata_store integer,
    protected boolean,
    failure_reason integer,
    scheduled_at timestamp with time zone
);


ALTER TABLE public.ci_builds OWNER TO gitlab;

--
-- Name: ci_builds_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_builds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_builds_id_seq OWNER TO gitlab;

--
-- Name: ci_builds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_builds_id_seq OWNED BY public.ci_builds.id;


--
-- Name: ci_builds_metadata; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_builds_metadata (
    id integer NOT NULL,
    build_id integer NOT NULL,
    project_id integer NOT NULL,
    timeout integer,
    timeout_source integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.ci_builds_metadata OWNER TO gitlab;

--
-- Name: ci_builds_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_builds_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_builds_metadata_id_seq OWNER TO gitlab;

--
-- Name: ci_builds_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_builds_metadata_id_seq OWNED BY public.ci_builds_metadata.id;


--
-- Name: ci_builds_runner_session; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_builds_runner_session (
    id bigint NOT NULL,
    build_id integer NOT NULL,
    url character varying NOT NULL,
    certificate character varying,
    "authorization" character varying
);


ALTER TABLE public.ci_builds_runner_session OWNER TO gitlab;

--
-- Name: ci_builds_runner_session_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_builds_runner_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_builds_runner_session_id_seq OWNER TO gitlab;

--
-- Name: ci_builds_runner_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_builds_runner_session_id_seq OWNED BY public.ci_builds_runner_session.id;


--
-- Name: ci_group_variables; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_group_variables (
    id integer NOT NULL,
    key character varying NOT NULL,
    value text,
    encrypted_value text,
    encrypted_value_salt character varying,
    encrypted_value_iv character varying,
    group_id integer NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.ci_group_variables OWNER TO gitlab;

--
-- Name: ci_group_variables_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_group_variables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_group_variables_id_seq OWNER TO gitlab;

--
-- Name: ci_group_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_group_variables_id_seq OWNED BY public.ci_group_variables.id;


--
-- Name: ci_job_artifacts; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_job_artifacts (
    id integer NOT NULL,
    project_id integer NOT NULL,
    job_id integer NOT NULL,
    file_type integer NOT NULL,
    size bigint,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    expire_at timestamp with time zone,
    file character varying,
    file_store integer,
    file_sha256 bytea,
    file_format smallint,
    file_location smallint
);


ALTER TABLE public.ci_job_artifacts OWNER TO gitlab;

--
-- Name: ci_job_artifacts_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_job_artifacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_job_artifacts_id_seq OWNER TO gitlab;

--
-- Name: ci_job_artifacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_job_artifacts_id_seq OWNED BY public.ci_job_artifacts.id;


--
-- Name: ci_pipeline_chat_data; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_pipeline_chat_data (
    id bigint NOT NULL,
    pipeline_id integer NOT NULL,
    chat_name_id integer NOT NULL,
    response_url text NOT NULL
);


ALTER TABLE public.ci_pipeline_chat_data OWNER TO gitlab;

--
-- Name: ci_pipeline_chat_data_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_pipeline_chat_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_pipeline_chat_data_id_seq OWNER TO gitlab;

--
-- Name: ci_pipeline_chat_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_pipeline_chat_data_id_seq OWNED BY public.ci_pipeline_chat_data.id;


--
-- Name: ci_pipeline_schedule_variables; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_pipeline_schedule_variables (
    id integer NOT NULL,
    key character varying NOT NULL,
    value text,
    encrypted_value text,
    encrypted_value_salt character varying,
    encrypted_value_iv character varying,
    pipeline_schedule_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.ci_pipeline_schedule_variables OWNER TO gitlab;

--
-- Name: ci_pipeline_schedule_variables_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_pipeline_schedule_variables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_pipeline_schedule_variables_id_seq OWNER TO gitlab;

--
-- Name: ci_pipeline_schedule_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_pipeline_schedule_variables_id_seq OWNED BY public.ci_pipeline_schedule_variables.id;


--
-- Name: ci_pipeline_schedules; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_pipeline_schedules (
    id integer NOT NULL,
    description character varying,
    ref character varying,
    cron character varying,
    cron_timezone character varying,
    next_run_at timestamp without time zone,
    project_id integer,
    owner_id integer,
    active boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.ci_pipeline_schedules OWNER TO gitlab;

--
-- Name: ci_pipeline_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_pipeline_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_pipeline_schedules_id_seq OWNER TO gitlab;

--
-- Name: ci_pipeline_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_pipeline_schedules_id_seq OWNED BY public.ci_pipeline_schedules.id;


--
-- Name: ci_pipeline_variables; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_pipeline_variables (
    id integer NOT NULL,
    key character varying NOT NULL,
    value text,
    encrypted_value text,
    encrypted_value_salt character varying,
    encrypted_value_iv character varying,
    pipeline_id integer NOT NULL
);


ALTER TABLE public.ci_pipeline_variables OWNER TO gitlab;

--
-- Name: ci_pipeline_variables_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_pipeline_variables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_pipeline_variables_id_seq OWNER TO gitlab;

--
-- Name: ci_pipeline_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_pipeline_variables_id_seq OWNED BY public.ci_pipeline_variables.id;


--
-- Name: ci_pipelines; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_pipelines (
    id integer NOT NULL,
    ref character varying,
    sha character varying,
    before_sha character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    tag boolean DEFAULT false,
    yaml_errors text,
    committed_at timestamp without time zone,
    project_id integer,
    status character varying,
    started_at timestamp without time zone,
    finished_at timestamp without time zone,
    duration integer,
    user_id integer,
    lock_version integer,
    auto_canceled_by_id integer,
    pipeline_schedule_id integer,
    source integer,
    config_source integer,
    protected boolean,
    failure_reason integer,
    iid integer
);


ALTER TABLE public.ci_pipelines OWNER TO gitlab;

--
-- Name: ci_pipelines_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_pipelines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_pipelines_id_seq OWNER TO gitlab;

--
-- Name: ci_pipelines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_pipelines_id_seq OWNED BY public.ci_pipelines.id;


--
-- Name: ci_runner_namespaces; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_runner_namespaces (
    id integer NOT NULL,
    runner_id integer,
    namespace_id integer
);


ALTER TABLE public.ci_runner_namespaces OWNER TO gitlab;

--
-- Name: ci_runner_namespaces_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_runner_namespaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_runner_namespaces_id_seq OWNER TO gitlab;

--
-- Name: ci_runner_namespaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_runner_namespaces_id_seq OWNED BY public.ci_runner_namespaces.id;


--
-- Name: ci_runner_projects; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_runner_projects (
    id integer NOT NULL,
    runner_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    project_id integer
);


ALTER TABLE public.ci_runner_projects OWNER TO gitlab;

--
-- Name: ci_runner_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_runner_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_runner_projects_id_seq OWNER TO gitlab;

--
-- Name: ci_runner_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_runner_projects_id_seq OWNED BY public.ci_runner_projects.id;


--
-- Name: ci_runners; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_runners (
    id integer NOT NULL,
    token character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description character varying,
    contacted_at timestamp without time zone,
    active boolean DEFAULT true NOT NULL,
    is_shared boolean DEFAULT false,
    name character varying,
    version character varying,
    revision character varying,
    platform character varying,
    architecture character varying,
    run_untagged boolean DEFAULT true NOT NULL,
    locked boolean DEFAULT false NOT NULL,
    access_level integer DEFAULT 0 NOT NULL,
    ip_address character varying,
    maximum_timeout integer,
    runner_type smallint NOT NULL
);


ALTER TABLE public.ci_runners OWNER TO gitlab;

--
-- Name: ci_runners_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_runners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_runners_id_seq OWNER TO gitlab;

--
-- Name: ci_runners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_runners_id_seq OWNED BY public.ci_runners.id;


--
-- Name: ci_sources_pipelines; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_sources_pipelines (
    id integer NOT NULL,
    project_id integer,
    pipeline_id integer,
    source_project_id integer,
    source_job_id integer,
    source_pipeline_id integer
);


ALTER TABLE public.ci_sources_pipelines OWNER TO gitlab;

--
-- Name: ci_sources_pipelines_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_sources_pipelines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_sources_pipelines_id_seq OWNER TO gitlab;

--
-- Name: ci_sources_pipelines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_sources_pipelines_id_seq OWNED BY public.ci_sources_pipelines.id;


--
-- Name: ci_stages; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_stages (
    id integer NOT NULL,
    project_id integer,
    pipeline_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    status integer,
    lock_version integer,
    "position" integer
);


ALTER TABLE public.ci_stages OWNER TO gitlab;

--
-- Name: ci_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_stages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_stages_id_seq OWNER TO gitlab;

--
-- Name: ci_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_stages_id_seq OWNED BY public.ci_stages.id;


--
-- Name: ci_trigger_requests; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_trigger_requests (
    id integer NOT NULL,
    trigger_id integer NOT NULL,
    variables text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    commit_id integer
);


ALTER TABLE public.ci_trigger_requests OWNER TO gitlab;

--
-- Name: ci_trigger_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_trigger_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_trigger_requests_id_seq OWNER TO gitlab;

--
-- Name: ci_trigger_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_trigger_requests_id_seq OWNED BY public.ci_trigger_requests.id;


--
-- Name: ci_triggers; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_triggers (
    id integer NOT NULL,
    token character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    project_id integer,
    owner_id integer,
    description character varying,
    ref character varying
);


ALTER TABLE public.ci_triggers OWNER TO gitlab;

--
-- Name: ci_triggers_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_triggers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_triggers_id_seq OWNER TO gitlab;

--
-- Name: ci_triggers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_triggers_id_seq OWNED BY public.ci_triggers.id;


--
-- Name: ci_variables; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ci_variables (
    id integer NOT NULL,
    key character varying NOT NULL,
    value text,
    encrypted_value text,
    encrypted_value_salt character varying,
    encrypted_value_iv character varying,
    project_id integer NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    environment_scope character varying DEFAULT '*'::character varying NOT NULL
);


ALTER TABLE public.ci_variables OWNER TO gitlab;

--
-- Name: ci_variables_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ci_variables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_variables_id_seq OWNER TO gitlab;

--
-- Name: ci_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ci_variables_id_seq OWNED BY public.ci_variables.id;


--
-- Name: cluster_groups; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.cluster_groups (
    id integer NOT NULL,
    cluster_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.cluster_groups OWNER TO gitlab;

--
-- Name: cluster_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.cluster_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_groups_id_seq OWNER TO gitlab;

--
-- Name: cluster_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.cluster_groups_id_seq OWNED BY public.cluster_groups.id;


--
-- Name: cluster_platforms_kubernetes; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.cluster_platforms_kubernetes (
    id integer NOT NULL,
    cluster_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    api_url text,
    ca_cert text,
    namespace character varying,
    username character varying,
    encrypted_password text,
    encrypted_password_iv character varying,
    encrypted_token text,
    encrypted_token_iv character varying,
    authorization_type smallint
);


ALTER TABLE public.cluster_platforms_kubernetes OWNER TO gitlab;

--
-- Name: cluster_platforms_kubernetes_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.cluster_platforms_kubernetes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_platforms_kubernetes_id_seq OWNER TO gitlab;

--
-- Name: cluster_platforms_kubernetes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.cluster_platforms_kubernetes_id_seq OWNED BY public.cluster_platforms_kubernetes.id;


--
-- Name: cluster_projects; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.cluster_projects (
    id integer NOT NULL,
    project_id integer NOT NULL,
    cluster_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cluster_projects OWNER TO gitlab;

--
-- Name: cluster_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.cluster_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_projects_id_seq OWNER TO gitlab;

--
-- Name: cluster_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.cluster_projects_id_seq OWNED BY public.cluster_projects.id;


--
-- Name: cluster_providers_gcp; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.cluster_providers_gcp (
    id integer NOT NULL,
    cluster_id integer NOT NULL,
    status integer,
    num_nodes integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status_reason text,
    gcp_project_id character varying NOT NULL,
    zone character varying NOT NULL,
    machine_type character varying,
    operation_id character varying,
    endpoint character varying,
    encrypted_access_token text,
    encrypted_access_token_iv character varying,
    legacy_abac boolean DEFAULT true NOT NULL
);


ALTER TABLE public.cluster_providers_gcp OWNER TO gitlab;

--
-- Name: cluster_providers_gcp_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.cluster_providers_gcp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_providers_gcp_id_seq OWNER TO gitlab;

--
-- Name: cluster_providers_gcp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.cluster_providers_gcp_id_seq OWNED BY public.cluster_providers_gcp.id;


--
-- Name: clusters; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.clusters (
    id integer NOT NULL,
    user_id integer,
    provider_type integer,
    platform_type integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    name character varying NOT NULL,
    environment_scope character varying DEFAULT '*'::character varying NOT NULL,
    cluster_type smallint DEFAULT 3 NOT NULL
);


ALTER TABLE public.clusters OWNER TO gitlab;

--
-- Name: clusters_applications_helm; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.clusters_applications_helm (
    id integer NOT NULL,
    cluster_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status integer NOT NULL,
    version character varying NOT NULL,
    status_reason text,
    encrypted_ca_key text,
    encrypted_ca_key_iv text,
    ca_cert text
);


ALTER TABLE public.clusters_applications_helm OWNER TO gitlab;

--
-- Name: clusters_applications_helm_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.clusters_applications_helm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_applications_helm_id_seq OWNER TO gitlab;

--
-- Name: clusters_applications_helm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.clusters_applications_helm_id_seq OWNED BY public.clusters_applications_helm.id;


--
-- Name: clusters_applications_ingress; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.clusters_applications_ingress (
    id integer NOT NULL,
    cluster_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status integer NOT NULL,
    ingress_type integer NOT NULL,
    version character varying NOT NULL,
    cluster_ip character varying,
    status_reason text,
    external_ip character varying
);


ALTER TABLE public.clusters_applications_ingress OWNER TO gitlab;

--
-- Name: clusters_applications_ingress_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.clusters_applications_ingress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_applications_ingress_id_seq OWNER TO gitlab;

--
-- Name: clusters_applications_ingress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.clusters_applications_ingress_id_seq OWNED BY public.clusters_applications_ingress.id;


--
-- Name: clusters_applications_jupyter; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.clusters_applications_jupyter (
    id integer NOT NULL,
    cluster_id integer NOT NULL,
    oauth_application_id integer,
    status integer NOT NULL,
    version character varying NOT NULL,
    hostname character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    status_reason text
);


ALTER TABLE public.clusters_applications_jupyter OWNER TO gitlab;

--
-- Name: clusters_applications_jupyter_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.clusters_applications_jupyter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_applications_jupyter_id_seq OWNER TO gitlab;

--
-- Name: clusters_applications_jupyter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.clusters_applications_jupyter_id_seq OWNED BY public.clusters_applications_jupyter.id;


--
-- Name: clusters_applications_knative; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.clusters_applications_knative (
    id integer NOT NULL,
    cluster_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    status integer NOT NULL,
    version character varying NOT NULL,
    hostname character varying,
    status_reason text
);


ALTER TABLE public.clusters_applications_knative OWNER TO gitlab;

--
-- Name: clusters_applications_knative_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.clusters_applications_knative_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_applications_knative_id_seq OWNER TO gitlab;

--
-- Name: clusters_applications_knative_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.clusters_applications_knative_id_seq OWNED BY public.clusters_applications_knative.id;


--
-- Name: clusters_applications_prometheus; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.clusters_applications_prometheus (
    id integer NOT NULL,
    cluster_id integer NOT NULL,
    status integer NOT NULL,
    version character varying NOT NULL,
    status_reason text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    last_update_started_at timestamp with time zone
);


ALTER TABLE public.clusters_applications_prometheus OWNER TO gitlab;

--
-- Name: clusters_applications_prometheus_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.clusters_applications_prometheus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_applications_prometheus_id_seq OWNER TO gitlab;

--
-- Name: clusters_applications_prometheus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.clusters_applications_prometheus_id_seq OWNED BY public.clusters_applications_prometheus.id;


--
-- Name: clusters_applications_runners; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.clusters_applications_runners (
    id integer NOT NULL,
    cluster_id integer NOT NULL,
    runner_id integer,
    status integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    version character varying NOT NULL,
    status_reason text,
    privileged boolean DEFAULT true NOT NULL
);


ALTER TABLE public.clusters_applications_runners OWNER TO gitlab;

--
-- Name: clusters_applications_runners_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.clusters_applications_runners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_applications_runners_id_seq OWNER TO gitlab;

--
-- Name: clusters_applications_runners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.clusters_applications_runners_id_seq OWNED BY public.clusters_applications_runners.id;


--
-- Name: clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.clusters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_id_seq OWNER TO gitlab;

--
-- Name: clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.clusters_id_seq OWNED BY public.clusters.id;


--
-- Name: clusters_kubernetes_namespaces; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.clusters_kubernetes_namespaces (
    id bigint NOT NULL,
    cluster_id integer NOT NULL,
    project_id integer,
    cluster_project_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    encrypted_service_account_token text,
    encrypted_service_account_token_iv character varying,
    namespace character varying NOT NULL,
    service_account_name character varying
);


ALTER TABLE public.clusters_kubernetes_namespaces OWNER TO gitlab;

--
-- Name: clusters_kubernetes_namespaces_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.clusters_kubernetes_namespaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_kubernetes_namespaces_id_seq OWNER TO gitlab;

--
-- Name: clusters_kubernetes_namespaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.clusters_kubernetes_namespaces_id_seq OWNED BY public.clusters_kubernetes_namespaces.id;


--
-- Name: container_repositories; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.container_repositories (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.container_repositories OWNER TO gitlab;

--
-- Name: container_repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.container_repositories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_repositories_id_seq OWNER TO gitlab;

--
-- Name: container_repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.container_repositories_id_seq OWNED BY public.container_repositories.id;


--
-- Name: conversational_development_index_metrics; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.conversational_development_index_metrics (
    id integer NOT NULL,
    leader_issues double precision NOT NULL,
    instance_issues double precision NOT NULL,
    leader_notes double precision NOT NULL,
    instance_notes double precision NOT NULL,
    leader_milestones double precision NOT NULL,
    instance_milestones double precision NOT NULL,
    leader_boards double precision NOT NULL,
    instance_boards double precision NOT NULL,
    leader_merge_requests double precision NOT NULL,
    instance_merge_requests double precision NOT NULL,
    leader_ci_pipelines double precision NOT NULL,
    instance_ci_pipelines double precision NOT NULL,
    leader_environments double precision NOT NULL,
    instance_environments double precision NOT NULL,
    leader_deployments double precision NOT NULL,
    instance_deployments double precision NOT NULL,
    leader_projects_prometheus_active double precision NOT NULL,
    instance_projects_prometheus_active double precision NOT NULL,
    leader_service_desk_issues double precision NOT NULL,
    instance_service_desk_issues double precision NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    percentage_boards double precision DEFAULT 0.0 NOT NULL,
    percentage_ci_pipelines double precision DEFAULT 0.0 NOT NULL,
    percentage_deployments double precision DEFAULT 0.0 NOT NULL,
    percentage_environments double precision DEFAULT 0.0 NOT NULL,
    percentage_issues double precision DEFAULT 0.0 NOT NULL,
    percentage_merge_requests double precision DEFAULT 0.0 NOT NULL,
    percentage_milestones double precision DEFAULT 0.0 NOT NULL,
    percentage_notes double precision DEFAULT 0.0 NOT NULL,
    percentage_projects_prometheus_active double precision DEFAULT 0.0 NOT NULL,
    percentage_service_desk_issues double precision DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.conversational_development_index_metrics OWNER TO gitlab;

--
-- Name: conversational_development_index_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.conversational_development_index_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversational_development_index_metrics_id_seq OWNER TO gitlab;

--
-- Name: conversational_development_index_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.conversational_development_index_metrics_id_seq OWNED BY public.conversational_development_index_metrics.id;


--
-- Name: deploy_keys_projects; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.deploy_keys_projects (
    id integer NOT NULL,
    deploy_key_id integer NOT NULL,
    project_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    can_push boolean DEFAULT false NOT NULL
);


ALTER TABLE public.deploy_keys_projects OWNER TO gitlab;

--
-- Name: deploy_keys_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.deploy_keys_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deploy_keys_projects_id_seq OWNER TO gitlab;

--
-- Name: deploy_keys_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.deploy_keys_projects_id_seq OWNED BY public.deploy_keys_projects.id;


--
-- Name: deploy_tokens; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.deploy_tokens (
    id integer NOT NULL,
    revoked boolean DEFAULT false,
    read_repository boolean DEFAULT false NOT NULL,
    read_registry boolean DEFAULT false NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    name character varying NOT NULL,
    token character varying NOT NULL
);


ALTER TABLE public.deploy_tokens OWNER TO gitlab;

--
-- Name: deploy_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.deploy_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deploy_tokens_id_seq OWNER TO gitlab;

--
-- Name: deploy_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.deploy_tokens_id_seq OWNED BY public.deploy_tokens.id;


--
-- Name: deployments; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.deployments (
    id integer NOT NULL,
    iid integer NOT NULL,
    project_id integer NOT NULL,
    environment_id integer NOT NULL,
    ref character varying NOT NULL,
    tag boolean NOT NULL,
    sha character varying NOT NULL,
    user_id integer,
    deployable_id integer,
    deployable_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    on_stop character varying,
    status smallint DEFAULT 2 NOT NULL,
    finished_at timestamp with time zone
);


ALTER TABLE public.deployments OWNER TO gitlab;

--
-- Name: deployments_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.deployments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deployments_id_seq OWNER TO gitlab;

--
-- Name: deployments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.deployments_id_seq OWNED BY public.deployments.id;


--
-- Name: draft_notes; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.draft_notes (
    id bigint NOT NULL,
    merge_request_id integer NOT NULL,
    author_id integer NOT NULL,
    resolve_discussion boolean DEFAULT false NOT NULL,
    discussion_id character varying,
    note text NOT NULL,
    "position" text,
    original_position text,
    change_position text
);


ALTER TABLE public.draft_notes OWNER TO gitlab;

--
-- Name: draft_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.draft_notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.draft_notes_id_seq OWNER TO gitlab;

--
-- Name: draft_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.draft_notes_id_seq OWNED BY public.draft_notes.id;


--
-- Name: emails; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.emails (
    id integer NOT NULL,
    user_id integer NOT NULL,
    email character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone
);


ALTER TABLE public.emails OWNER TO gitlab;

--
-- Name: emails_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emails_id_seq OWNER TO gitlab;

--
-- Name: emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.emails_id_seq OWNED BY public.emails.id;


--
-- Name: environments; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.environments (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    external_url character varying,
    environment_type character varying,
    state character varying DEFAULT 'available'::character varying NOT NULL,
    slug character varying NOT NULL
);


ALTER TABLE public.environments OWNER TO gitlab;

--
-- Name: environments_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.environments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.environments_id_seq OWNER TO gitlab;

--
-- Name: environments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.environments_id_seq OWNED BY public.environments.id;


--
-- Name: epic_issues; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.epic_issues (
    id integer NOT NULL,
    epic_id integer NOT NULL,
    issue_id integer NOT NULL,
    relative_position integer DEFAULT 1073741823 NOT NULL
);


ALTER TABLE public.epic_issues OWNER TO gitlab;

--
-- Name: epic_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.epic_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epic_issues_id_seq OWNER TO gitlab;

--
-- Name: epic_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.epic_issues_id_seq OWNED BY public.epic_issues.id;


--
-- Name: epic_metrics; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.epic_metrics (
    id integer NOT NULL,
    epic_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.epic_metrics OWNER TO gitlab;

--
-- Name: epic_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.epic_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epic_metrics_id_seq OWNER TO gitlab;

--
-- Name: epic_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.epic_metrics_id_seq OWNED BY public.epic_metrics.id;


--
-- Name: epics; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.epics (
    id integer NOT NULL,
    milestone_id integer,
    group_id integer NOT NULL,
    author_id integer NOT NULL,
    assignee_id integer,
    iid integer NOT NULL,
    cached_markdown_version integer,
    updated_by_id integer,
    last_edited_by_id integer,
    lock_version integer,
    start_date date,
    end_date date,
    last_edited_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying NOT NULL,
    title_html character varying NOT NULL,
    description text,
    description_html text,
    start_date_sourcing_milestone_id integer,
    due_date_sourcing_milestone_id integer,
    start_date_fixed date,
    due_date_fixed date,
    start_date_is_fixed boolean,
    due_date_is_fixed boolean,
    state smallint DEFAULT 1 NOT NULL,
    closed_by_id integer,
    closed_at timestamp without time zone
);


ALTER TABLE public.epics OWNER TO gitlab;

--
-- Name: epics_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.epics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epics_id_seq OWNER TO gitlab;

--
-- Name: epics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.epics_id_seq OWNED BY public.epics.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.events (
    id integer NOT NULL,
    project_id integer,
    author_id integer NOT NULL,
    target_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    action smallint NOT NULL,
    target_type character varying
);


ALTER TABLE public.events OWNER TO gitlab;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO gitlab;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: feature_gates; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.feature_gates (
    id integer NOT NULL,
    feature_key character varying NOT NULL,
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.feature_gates OWNER TO gitlab;

--
-- Name: feature_gates_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.feature_gates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feature_gates_id_seq OWNER TO gitlab;

--
-- Name: feature_gates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.feature_gates_id_seq OWNED BY public.feature_gates.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.features (
    id integer NOT NULL,
    key character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.features OWNER TO gitlab;

--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.features_id_seq OWNER TO gitlab;

--
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.features_id_seq OWNED BY public.features.id;


--
-- Name: fork_network_members; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.fork_network_members (
    id integer NOT NULL,
    fork_network_id integer NOT NULL,
    project_id integer NOT NULL,
    forked_from_project_id integer
);


ALTER TABLE public.fork_network_members OWNER TO gitlab;

--
-- Name: fork_network_members_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.fork_network_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fork_network_members_id_seq OWNER TO gitlab;

--
-- Name: fork_network_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.fork_network_members_id_seq OWNED BY public.fork_network_members.id;


--
-- Name: fork_networks; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.fork_networks (
    id integer NOT NULL,
    root_project_id integer,
    deleted_root_project_name character varying
);


ALTER TABLE public.fork_networks OWNER TO gitlab;

--
-- Name: fork_networks_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.fork_networks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fork_networks_id_seq OWNER TO gitlab;

--
-- Name: fork_networks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.fork_networks_id_seq OWNED BY public.fork_networks.id;


--
-- Name: forked_project_links; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.forked_project_links (
    id integer NOT NULL,
    forked_to_project_id integer NOT NULL,
    forked_from_project_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.forked_project_links OWNER TO gitlab;

--
-- Name: forked_project_links_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.forked_project_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forked_project_links_id_seq OWNER TO gitlab;

--
-- Name: forked_project_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.forked_project_links_id_seq OWNED BY public.forked_project_links.id;


--
-- Name: gcp_clusters; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.gcp_clusters (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer,
    service_id integer,
    status integer,
    gcp_cluster_size integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    enabled boolean DEFAULT true,
    status_reason text,
    project_namespace character varying,
    endpoint character varying,
    ca_cert text,
    encrypted_kubernetes_token text,
    encrypted_kubernetes_token_iv character varying,
    username character varying,
    encrypted_password text,
    encrypted_password_iv character varying,
    gcp_project_id character varying NOT NULL,
    gcp_cluster_zone character varying NOT NULL,
    gcp_cluster_name character varying NOT NULL,
    gcp_machine_type character varying,
    gcp_operation_id character varying,
    encrypted_gcp_token text,
    encrypted_gcp_token_iv character varying
);


ALTER TABLE public.gcp_clusters OWNER TO gitlab;

--
-- Name: gcp_clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.gcp_clusters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gcp_clusters_id_seq OWNER TO gitlab;

--
-- Name: gcp_clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.gcp_clusters_id_seq OWNED BY public.gcp_clusters.id;


--
-- Name: geo_cache_invalidation_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_cache_invalidation_events (
    id bigint NOT NULL,
    key character varying NOT NULL
);


ALTER TABLE public.geo_cache_invalidation_events OWNER TO gitlab;

--
-- Name: geo_cache_invalidation_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_cache_invalidation_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_cache_invalidation_events_id_seq OWNER TO gitlab;

--
-- Name: geo_cache_invalidation_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_cache_invalidation_events_id_seq OWNED BY public.geo_cache_invalidation_events.id;


--
-- Name: geo_event_log; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_event_log (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    repository_updated_event_id bigint,
    repository_deleted_event_id bigint,
    repository_renamed_event_id bigint,
    repositories_changed_event_id bigint,
    repository_created_event_id bigint,
    hashed_storage_migrated_event_id bigint,
    lfs_object_deleted_event_id bigint,
    hashed_storage_attachments_event_id bigint,
    job_artifact_deleted_event_id bigint,
    upload_deleted_event_id bigint,
    reset_checksum_event_id bigint,
    cache_invalidation_event_id bigint
);


ALTER TABLE public.geo_event_log OWNER TO gitlab;

--
-- Name: geo_event_log_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_event_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_event_log_id_seq OWNER TO gitlab;

--
-- Name: geo_event_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_event_log_id_seq OWNED BY public.geo_event_log.id;


--
-- Name: geo_hashed_storage_attachments_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_hashed_storage_attachments_events (
    id bigint NOT NULL,
    project_id integer NOT NULL,
    old_attachments_path text NOT NULL,
    new_attachments_path text NOT NULL
);


ALTER TABLE public.geo_hashed_storage_attachments_events OWNER TO gitlab;

--
-- Name: geo_hashed_storage_attachments_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_hashed_storage_attachments_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_hashed_storage_attachments_events_id_seq OWNER TO gitlab;

--
-- Name: geo_hashed_storage_attachments_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_hashed_storage_attachments_events_id_seq OWNED BY public.geo_hashed_storage_attachments_events.id;


--
-- Name: geo_hashed_storage_migrated_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_hashed_storage_migrated_events (
    id bigint NOT NULL,
    project_id integer NOT NULL,
    repository_storage_name text NOT NULL,
    old_disk_path text NOT NULL,
    new_disk_path text NOT NULL,
    old_wiki_disk_path text NOT NULL,
    new_wiki_disk_path text NOT NULL,
    old_storage_version smallint,
    new_storage_version smallint NOT NULL
);


ALTER TABLE public.geo_hashed_storage_migrated_events OWNER TO gitlab;

--
-- Name: geo_hashed_storage_migrated_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_hashed_storage_migrated_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_hashed_storage_migrated_events_id_seq OWNER TO gitlab;

--
-- Name: geo_hashed_storage_migrated_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_hashed_storage_migrated_events_id_seq OWNED BY public.geo_hashed_storage_migrated_events.id;


--
-- Name: geo_job_artifact_deleted_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_job_artifact_deleted_events (
    id bigint NOT NULL,
    job_artifact_id integer NOT NULL,
    file_path character varying NOT NULL
);


ALTER TABLE public.geo_job_artifact_deleted_events OWNER TO gitlab;

--
-- Name: geo_job_artifact_deleted_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_job_artifact_deleted_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_job_artifact_deleted_events_id_seq OWNER TO gitlab;

--
-- Name: geo_job_artifact_deleted_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_job_artifact_deleted_events_id_seq OWNED BY public.geo_job_artifact_deleted_events.id;


--
-- Name: geo_lfs_object_deleted_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_lfs_object_deleted_events (
    id bigint NOT NULL,
    lfs_object_id integer NOT NULL,
    oid character varying NOT NULL,
    file_path character varying NOT NULL
);


ALTER TABLE public.geo_lfs_object_deleted_events OWNER TO gitlab;

--
-- Name: geo_lfs_object_deleted_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_lfs_object_deleted_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_lfs_object_deleted_events_id_seq OWNER TO gitlab;

--
-- Name: geo_lfs_object_deleted_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_lfs_object_deleted_events_id_seq OWNED BY public.geo_lfs_object_deleted_events.id;


--
-- Name: geo_node_namespace_links; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_node_namespace_links (
    id integer NOT NULL,
    geo_node_id integer NOT NULL,
    namespace_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.geo_node_namespace_links OWNER TO gitlab;

--
-- Name: geo_node_namespace_links_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_node_namespace_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_node_namespace_links_id_seq OWNER TO gitlab;

--
-- Name: geo_node_namespace_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_node_namespace_links_id_seq OWNED BY public.geo_node_namespace_links.id;


--
-- Name: geo_node_statuses; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_node_statuses (
    id integer NOT NULL,
    geo_node_id integer NOT NULL,
    db_replication_lag_seconds integer,
    repositories_synced_count integer,
    repositories_failed_count integer,
    lfs_objects_count integer,
    lfs_objects_synced_count integer,
    lfs_objects_failed_count integer,
    attachments_count integer,
    attachments_synced_count integer,
    attachments_failed_count integer,
    last_event_id integer,
    last_event_date timestamp without time zone,
    cursor_last_event_id integer,
    cursor_last_event_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    last_successful_status_check_at timestamp without time zone,
    status_message character varying,
    replication_slots_count integer,
    replication_slots_used_count integer,
    replication_slots_max_retained_wal_bytes bigint,
    wikis_synced_count integer,
    wikis_failed_count integer,
    job_artifacts_count integer,
    job_artifacts_synced_count integer,
    job_artifacts_failed_count integer,
    version character varying,
    revision character varying,
    repositories_verified_count integer,
    repositories_verification_failed_count integer,
    wikis_verified_count integer,
    wikis_verification_failed_count integer,
    lfs_objects_synced_missing_on_primary_count integer,
    job_artifacts_synced_missing_on_primary_count integer,
    attachments_synced_missing_on_primary_count integer,
    repositories_checksummed_count integer,
    repositories_checksum_failed_count integer,
    repositories_checksum_mismatch_count integer,
    wikis_checksummed_count integer,
    wikis_checksum_failed_count integer,
    wikis_checksum_mismatch_count integer,
    storage_configuration_digest bytea,
    repositories_retrying_verification_count integer,
    wikis_retrying_verification_count integer,
    projects_count integer
);


ALTER TABLE public.geo_node_statuses OWNER TO gitlab;

--
-- Name: geo_node_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_node_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_node_statuses_id_seq OWNER TO gitlab;

--
-- Name: geo_node_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_node_statuses_id_seq OWNED BY public.geo_node_statuses.id;


--
-- Name: geo_nodes; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_nodes (
    id integer NOT NULL,
    "primary" boolean,
    oauth_application_id integer,
    enabled boolean DEFAULT true NOT NULL,
    access_key character varying,
    encrypted_secret_access_key character varying,
    encrypted_secret_access_key_iv character varying,
    clone_url_prefix character varying,
    files_max_capacity integer DEFAULT 10 NOT NULL,
    repos_max_capacity integer DEFAULT 25 NOT NULL,
    url character varying NOT NULL,
    selective_sync_type character varying,
    selective_sync_shards text,
    verification_max_capacity integer DEFAULT 100 NOT NULL
);


ALTER TABLE public.geo_nodes OWNER TO gitlab;

--
-- Name: geo_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_nodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_nodes_id_seq OWNER TO gitlab;

--
-- Name: geo_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_nodes_id_seq OWNED BY public.geo_nodes.id;


--
-- Name: geo_repositories_changed_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_repositories_changed_events (
    id bigint NOT NULL,
    geo_node_id integer NOT NULL
);


ALTER TABLE public.geo_repositories_changed_events OWNER TO gitlab;

--
-- Name: geo_repositories_changed_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_repositories_changed_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_repositories_changed_events_id_seq OWNER TO gitlab;

--
-- Name: geo_repositories_changed_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_repositories_changed_events_id_seq OWNED BY public.geo_repositories_changed_events.id;


--
-- Name: geo_repository_created_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_repository_created_events (
    id bigint NOT NULL,
    project_id integer NOT NULL,
    repository_storage_name text NOT NULL,
    repo_path text NOT NULL,
    wiki_path text,
    project_name text NOT NULL
);


ALTER TABLE public.geo_repository_created_events OWNER TO gitlab;

--
-- Name: geo_repository_created_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_repository_created_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_repository_created_events_id_seq OWNER TO gitlab;

--
-- Name: geo_repository_created_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_repository_created_events_id_seq OWNED BY public.geo_repository_created_events.id;


--
-- Name: geo_repository_deleted_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_repository_deleted_events (
    id bigint NOT NULL,
    project_id integer NOT NULL,
    repository_storage_name text NOT NULL,
    deleted_path text NOT NULL,
    deleted_wiki_path text,
    deleted_project_name text NOT NULL
);


ALTER TABLE public.geo_repository_deleted_events OWNER TO gitlab;

--
-- Name: geo_repository_deleted_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_repository_deleted_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_repository_deleted_events_id_seq OWNER TO gitlab;

--
-- Name: geo_repository_deleted_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_repository_deleted_events_id_seq OWNED BY public.geo_repository_deleted_events.id;


--
-- Name: geo_repository_renamed_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_repository_renamed_events (
    id bigint NOT NULL,
    project_id integer NOT NULL,
    repository_storage_name text NOT NULL,
    old_path_with_namespace text NOT NULL,
    new_path_with_namespace text NOT NULL,
    old_wiki_path_with_namespace text NOT NULL,
    new_wiki_path_with_namespace text NOT NULL,
    old_path text NOT NULL,
    new_path text NOT NULL
);


ALTER TABLE public.geo_repository_renamed_events OWNER TO gitlab;

--
-- Name: geo_repository_renamed_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_repository_renamed_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_repository_renamed_events_id_seq OWNER TO gitlab;

--
-- Name: geo_repository_renamed_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_repository_renamed_events_id_seq OWNED BY public.geo_repository_renamed_events.id;


--
-- Name: geo_repository_updated_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_repository_updated_events (
    id bigint NOT NULL,
    branches_affected integer NOT NULL,
    tags_affected integer NOT NULL,
    project_id integer NOT NULL,
    source smallint NOT NULL,
    new_branch boolean DEFAULT false NOT NULL,
    remove_branch boolean DEFAULT false NOT NULL,
    ref text
);


ALTER TABLE public.geo_repository_updated_events OWNER TO gitlab;

--
-- Name: geo_repository_updated_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_repository_updated_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_repository_updated_events_id_seq OWNER TO gitlab;

--
-- Name: geo_repository_updated_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_repository_updated_events_id_seq OWNED BY public.geo_repository_updated_events.id;


--
-- Name: geo_reset_checksum_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_reset_checksum_events (
    id bigint NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.geo_reset_checksum_events OWNER TO gitlab;

--
-- Name: geo_reset_checksum_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_reset_checksum_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_reset_checksum_events_id_seq OWNER TO gitlab;

--
-- Name: geo_reset_checksum_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_reset_checksum_events_id_seq OWNED BY public.geo_reset_checksum_events.id;


--
-- Name: geo_upload_deleted_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.geo_upload_deleted_events (
    id bigint NOT NULL,
    upload_id integer NOT NULL,
    file_path character varying NOT NULL,
    model_id integer NOT NULL,
    model_type character varying NOT NULL,
    uploader character varying NOT NULL
);


ALTER TABLE public.geo_upload_deleted_events OWNER TO gitlab;

--
-- Name: geo_upload_deleted_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.geo_upload_deleted_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_upload_deleted_events_id_seq OWNER TO gitlab;

--
-- Name: geo_upload_deleted_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.geo_upload_deleted_events_id_seq OWNED BY public.geo_upload_deleted_events.id;


--
-- Name: gpg_key_subkeys; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.gpg_key_subkeys (
    id integer NOT NULL,
    gpg_key_id integer NOT NULL,
    keyid bytea,
    fingerprint bytea
);


ALTER TABLE public.gpg_key_subkeys OWNER TO gitlab;

--
-- Name: gpg_key_subkeys_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.gpg_key_subkeys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpg_key_subkeys_id_seq OWNER TO gitlab;

--
-- Name: gpg_key_subkeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.gpg_key_subkeys_id_seq OWNED BY public.gpg_key_subkeys.id;


--
-- Name: gpg_keys; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.gpg_keys (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer,
    primary_keyid bytea,
    fingerprint bytea,
    key text
);


ALTER TABLE public.gpg_keys OWNER TO gitlab;

--
-- Name: gpg_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.gpg_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpg_keys_id_seq OWNER TO gitlab;

--
-- Name: gpg_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.gpg_keys_id_seq OWNED BY public.gpg_keys.id;


--
-- Name: gpg_signatures; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.gpg_signatures (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id integer,
    gpg_key_id integer,
    commit_sha bytea,
    gpg_key_primary_keyid bytea,
    gpg_key_user_name text,
    gpg_key_user_email text,
    verification_status smallint DEFAULT 0 NOT NULL,
    gpg_key_subkey_id integer
);


ALTER TABLE public.gpg_signatures OWNER TO gitlab;

--
-- Name: gpg_signatures_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.gpg_signatures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpg_signatures_id_seq OWNER TO gitlab;

--
-- Name: gpg_signatures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.gpg_signatures_id_seq OWNED BY public.gpg_signatures.id;


--
-- Name: group_custom_attributes; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.group_custom_attributes (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    group_id integer NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.group_custom_attributes OWNER TO gitlab;

--
-- Name: group_custom_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.group_custom_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_custom_attributes_id_seq OWNER TO gitlab;

--
-- Name: group_custom_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.group_custom_attributes_id_seq OWNED BY public.group_custom_attributes.id;


--
-- Name: historical_data; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.historical_data (
    id integer NOT NULL,
    date date NOT NULL,
    active_user_count integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.historical_data OWNER TO gitlab;

--
-- Name: historical_data_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.historical_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historical_data_id_seq OWNER TO gitlab;

--
-- Name: historical_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.historical_data_id_seq OWNED BY public.historical_data.id;


--
-- Name: identities; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.identities (
    id integer NOT NULL,
    extern_uid character varying,
    provider character varying,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    secondary_extern_uid character varying,
    saml_provider_id integer
);


ALTER TABLE public.identities OWNER TO gitlab;

--
-- Name: identities_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.identities_id_seq OWNER TO gitlab;

--
-- Name: identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.identities_id_seq OWNED BY public.identities.id;


--
-- Name: import_export_uploads; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.import_export_uploads (
    id integer NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id integer,
    import_file text,
    export_file text
);


ALTER TABLE public.import_export_uploads OWNER TO gitlab;

--
-- Name: import_export_uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.import_export_uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.import_export_uploads_id_seq OWNER TO gitlab;

--
-- Name: import_export_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.import_export_uploads_id_seq OWNED BY public.import_export_uploads.id;


--
-- Name: index_statuses; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.index_statuses (
    id integer NOT NULL,
    project_id integer NOT NULL,
    indexed_at timestamp without time zone,
    note text,
    last_commit character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.index_statuses OWNER TO gitlab;

--
-- Name: index_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.index_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.index_statuses_id_seq OWNER TO gitlab;

--
-- Name: index_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.index_statuses_id_seq OWNED BY public.index_statuses.id;


--
-- Name: internal_ids; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.internal_ids (
    id bigint NOT NULL,
    project_id integer,
    usage integer NOT NULL,
    last_value integer NOT NULL,
    namespace_id integer
);


ALTER TABLE public.internal_ids OWNER TO gitlab;

--
-- Name: internal_ids_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.internal_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.internal_ids_id_seq OWNER TO gitlab;

--
-- Name: internal_ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.internal_ids_id_seq OWNED BY public.internal_ids.id;


--
-- Name: issue_assignees; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.issue_assignees (
    user_id integer NOT NULL,
    issue_id integer NOT NULL
);


ALTER TABLE public.issue_assignees OWNER TO gitlab;

--
-- Name: issue_links; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.issue_links (
    id integer NOT NULL,
    source_id integer NOT NULL,
    target_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.issue_links OWNER TO gitlab;

--
-- Name: issue_links_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.issue_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_links_id_seq OWNER TO gitlab;

--
-- Name: issue_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.issue_links_id_seq OWNED BY public.issue_links.id;


--
-- Name: issue_metrics; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.issue_metrics (
    id integer NOT NULL,
    issue_id integer NOT NULL,
    first_mentioned_in_commit_at timestamp without time zone,
    first_associated_with_milestone_at timestamp without time zone,
    first_added_to_board_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.issue_metrics OWNER TO gitlab;

--
-- Name: issue_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.issue_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_metrics_id_seq OWNER TO gitlab;

--
-- Name: issue_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.issue_metrics_id_seq OWNED BY public.issue_metrics.id;


--
-- Name: issues; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.issues (
    id integer NOT NULL,
    title character varying,
    author_id integer,
    project_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description text,
    milestone_id integer,
    state character varying,
    iid integer,
    updated_by_id integer,
    weight integer,
    confidential boolean DEFAULT false NOT NULL,
    due_date date,
    moved_to_id integer,
    lock_version integer,
    title_html text,
    description_html text,
    time_estimate integer,
    relative_position integer,
    service_desk_reply_to character varying,
    cached_markdown_version integer,
    last_edited_at timestamp without time zone,
    last_edited_by_id integer,
    discussion_locked boolean,
    closed_at timestamp with time zone,
    closed_by_id integer
);


ALTER TABLE public.issues OWNER TO gitlab;

--
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issues_id_seq OWNER TO gitlab;

--
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.issues_id_seq OWNED BY public.issues.id;


--
-- Name: keys; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.keys (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    key text,
    title character varying,
    type character varying,
    fingerprint character varying,
    public boolean DEFAULT false NOT NULL,
    last_used_at timestamp without time zone
);


ALTER TABLE public.keys OWNER TO gitlab;

--
-- Name: keys_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keys_id_seq OWNER TO gitlab;

--
-- Name: keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.keys_id_seq OWNED BY public.keys.id;


--
-- Name: label_links; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.label_links (
    id integer NOT NULL,
    label_id integer,
    target_id integer,
    target_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.label_links OWNER TO gitlab;

--
-- Name: label_links_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.label_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.label_links_id_seq OWNER TO gitlab;

--
-- Name: label_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.label_links_id_seq OWNED BY public.label_links.id;


--
-- Name: label_priorities; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.label_priorities (
    id integer NOT NULL,
    project_id integer NOT NULL,
    label_id integer NOT NULL,
    priority integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.label_priorities OWNER TO gitlab;

--
-- Name: label_priorities_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.label_priorities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.label_priorities_id_seq OWNER TO gitlab;

--
-- Name: label_priorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.label_priorities_id_seq OWNED BY public.label_priorities.id;


--
-- Name: labels; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.labels (
    id integer NOT NULL,
    title character varying,
    color character varying,
    project_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    template boolean DEFAULT false,
    description character varying,
    description_html text,
    type character varying,
    group_id integer,
    cached_markdown_version integer
);


ALTER TABLE public.labels OWNER TO gitlab;

--
-- Name: labels_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.labels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labels_id_seq OWNER TO gitlab;

--
-- Name: labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.labels_id_seq OWNED BY public.labels.id;


--
-- Name: ldap_group_links; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.ldap_group_links (
    id integer NOT NULL,
    cn character varying,
    group_access integer NOT NULL,
    group_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    provider character varying,
    filter character varying
);


ALTER TABLE public.ldap_group_links OWNER TO gitlab;

--
-- Name: ldap_group_links_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.ldap_group_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ldap_group_links_id_seq OWNER TO gitlab;

--
-- Name: ldap_group_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.ldap_group_links_id_seq OWNED BY public.ldap_group_links.id;


--
-- Name: lfs_file_locks; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.lfs_file_locks (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    path character varying(511)
);


ALTER TABLE public.lfs_file_locks OWNER TO gitlab;

--
-- Name: lfs_file_locks_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.lfs_file_locks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lfs_file_locks_id_seq OWNER TO gitlab;

--
-- Name: lfs_file_locks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.lfs_file_locks_id_seq OWNED BY public.lfs_file_locks.id;


--
-- Name: lfs_objects; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.lfs_objects (
    id integer NOT NULL,
    oid character varying NOT NULL,
    size bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    file character varying,
    file_store integer
);


ALTER TABLE public.lfs_objects OWNER TO gitlab;

--
-- Name: lfs_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.lfs_objects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lfs_objects_id_seq OWNER TO gitlab;

--
-- Name: lfs_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.lfs_objects_id_seq OWNED BY public.lfs_objects.id;


--
-- Name: lfs_objects_projects; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.lfs_objects_projects (
    id integer NOT NULL,
    lfs_object_id integer NOT NULL,
    project_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.lfs_objects_projects OWNER TO gitlab;

--
-- Name: lfs_objects_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.lfs_objects_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lfs_objects_projects_id_seq OWNER TO gitlab;

--
-- Name: lfs_objects_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.lfs_objects_projects_id_seq OWNED BY public.lfs_objects_projects.id;


--
-- Name: licenses; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.licenses (
    id integer NOT NULL,
    data text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.licenses OWNER TO gitlab;

--
-- Name: licenses_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.licenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.licenses_id_seq OWNER TO gitlab;

--
-- Name: licenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.licenses_id_seq OWNED BY public.licenses.id;


--
-- Name: lists; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.lists (
    id integer NOT NULL,
    board_id integer NOT NULL,
    label_id integer,
    list_type integer DEFAULT 1 NOT NULL,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    milestone_id integer
);


ALTER TABLE public.lists OWNER TO gitlab;

--
-- Name: lists_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lists_id_seq OWNER TO gitlab;

--
-- Name: lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.lists_id_seq OWNED BY public.lists.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.members (
    id integer NOT NULL,
    access_level integer NOT NULL,
    source_id integer NOT NULL,
    source_type character varying NOT NULL,
    user_id integer,
    notification_level integer NOT NULL,
    type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by_id integer,
    invite_email character varying,
    invite_token character varying,
    invite_accepted_at timestamp without time zone,
    requested_at timestamp without time zone,
    expires_at date,
    ldap boolean DEFAULT false NOT NULL,
    override boolean DEFAULT false NOT NULL
);


ALTER TABLE public.members OWNER TO gitlab;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO gitlab;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: merge_request_diff_commits; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.merge_request_diff_commits (
    authored_date timestamp without time zone,
    committed_date timestamp without time zone,
    merge_request_diff_id integer NOT NULL,
    relative_order integer NOT NULL,
    sha bytea NOT NULL,
    author_name text,
    author_email text,
    committer_name text,
    committer_email text,
    message text
);


ALTER TABLE public.merge_request_diff_commits OWNER TO gitlab;

--
-- Name: merge_request_diff_files; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.merge_request_diff_files (
    merge_request_diff_id integer NOT NULL,
    relative_order integer NOT NULL,
    new_file boolean NOT NULL,
    renamed_file boolean NOT NULL,
    deleted_file boolean NOT NULL,
    too_large boolean NOT NULL,
    a_mode character varying NOT NULL,
    b_mode character varying NOT NULL,
    new_path text NOT NULL,
    old_path text NOT NULL,
    diff text NOT NULL,
    "binary" boolean
);


ALTER TABLE public.merge_request_diff_files OWNER TO gitlab;

--
-- Name: merge_request_diffs; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.merge_request_diffs (
    id integer NOT NULL,
    state character varying,
    merge_request_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    base_commit_sha character varying,
    real_size character varying,
    head_commit_sha character varying,
    start_commit_sha character varying,
    commits_count integer
);


ALTER TABLE public.merge_request_diffs OWNER TO gitlab;

--
-- Name: merge_request_diffs_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.merge_request_diffs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merge_request_diffs_id_seq OWNER TO gitlab;

--
-- Name: merge_request_diffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.merge_request_diffs_id_seq OWNED BY public.merge_request_diffs.id;


--
-- Name: merge_request_metrics; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.merge_request_metrics (
    id integer NOT NULL,
    merge_request_id integer NOT NULL,
    latest_build_started_at timestamp without time zone,
    latest_build_finished_at timestamp without time zone,
    first_deployed_to_production_at timestamp without time zone,
    merged_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pipeline_id integer,
    merged_by_id integer,
    latest_closed_by_id integer,
    latest_closed_at timestamp with time zone
);


ALTER TABLE public.merge_request_metrics OWNER TO gitlab;

--
-- Name: merge_request_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.merge_request_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merge_request_metrics_id_seq OWNER TO gitlab;

--
-- Name: merge_request_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.merge_request_metrics_id_seq OWNED BY public.merge_request_metrics.id;


--
-- Name: merge_requests; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.merge_requests (
    id integer NOT NULL,
    target_branch character varying NOT NULL,
    source_branch character varying NOT NULL,
    source_project_id integer,
    author_id integer,
    assignee_id integer,
    title character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    milestone_id integer,
    state character varying DEFAULT 'opened'::character varying NOT NULL,
    merge_status character varying DEFAULT 'unchecked'::character varying NOT NULL,
    target_project_id integer NOT NULL,
    iid integer,
    description text,
    updated_by_id integer,
    merge_error text,
    merge_params text,
    merge_when_pipeline_succeeds boolean DEFAULT false NOT NULL,
    merge_user_id integer,
    merge_commit_sha character varying,
    approvals_before_merge integer,
    rebase_commit_sha character varying,
    in_progress_merge_commit_sha character varying,
    lock_version integer,
    title_html text,
    description_html text,
    time_estimate integer,
    squash boolean DEFAULT false NOT NULL,
    cached_markdown_version integer,
    last_edited_at timestamp without time zone,
    last_edited_by_id integer,
    head_pipeline_id integer,
    merge_jid character varying,
    discussion_locked boolean,
    latest_merge_request_diff_id integer,
    allow_maintainer_to_push boolean
);


ALTER TABLE public.merge_requests OWNER TO gitlab;

--
-- Name: merge_requests_closing_issues; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.merge_requests_closing_issues (
    id integer NOT NULL,
    merge_request_id integer NOT NULL,
    issue_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.merge_requests_closing_issues OWNER TO gitlab;

--
-- Name: merge_requests_closing_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.merge_requests_closing_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merge_requests_closing_issues_id_seq OWNER TO gitlab;

--
-- Name: merge_requests_closing_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.merge_requests_closing_issues_id_seq OWNED BY public.merge_requests_closing_issues.id;


--
-- Name: merge_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.merge_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merge_requests_id_seq OWNER TO gitlab;

--
-- Name: merge_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.merge_requests_id_seq OWNED BY public.merge_requests.id;


--
-- Name: milestones; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.milestones (
    id integer NOT NULL,
    title character varying NOT NULL,
    project_id integer,
    description text,
    due_date date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state character varying,
    iid integer,
    title_html text,
    description_html text,
    start_date date,
    cached_markdown_version integer,
    group_id integer
);


ALTER TABLE public.milestones OWNER TO gitlab;

--
-- Name: milestones_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.milestones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milestones_id_seq OWNER TO gitlab;

--
-- Name: milestones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.milestones_id_seq OWNED BY public.milestones.id;


--
-- Name: namespace_statistics; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.namespace_statistics (
    id integer NOT NULL,
    namespace_id integer NOT NULL,
    shared_runners_seconds integer DEFAULT 0 NOT NULL,
    shared_runners_seconds_last_reset timestamp without time zone
);


ALTER TABLE public.namespace_statistics OWNER TO gitlab;

--
-- Name: namespace_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.namespace_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.namespace_statistics_id_seq OWNER TO gitlab;

--
-- Name: namespace_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.namespace_statistics_id_seq OWNED BY public.namespace_statistics.id;


--
-- Name: namespaces; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.namespaces (
    id integer NOT NULL,
    name character varying NOT NULL,
    path character varying NOT NULL,
    owner_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying,
    description character varying DEFAULT ''::character varying NOT NULL,
    avatar character varying,
    membership_lock boolean DEFAULT false,
    share_with_group_lock boolean DEFAULT false,
    visibility_level integer DEFAULT 20 NOT NULL,
    request_access_enabled boolean DEFAULT false NOT NULL,
    ldap_sync_status character varying DEFAULT 'ready'::character varying NOT NULL,
    ldap_sync_error character varying,
    ldap_sync_last_update_at timestamp without time zone,
    ldap_sync_last_successful_update_at timestamp without time zone,
    ldap_sync_last_sync_at timestamp without time zone,
    description_html text,
    lfs_enabled boolean,
    parent_id integer,
    shared_runners_minutes_limit integer,
    repository_size_limit bigint,
    require_two_factor_authentication boolean DEFAULT false NOT NULL,
    two_factor_grace_period integer DEFAULT 48 NOT NULL,
    cached_markdown_version integer,
    plan_id integer,
    project_creation_level integer,
    runners_token character varying,
    trial_ends_on timestamp with time zone,
    file_template_project_id integer
);


ALTER TABLE public.namespaces OWNER TO gitlab;

--
-- Name: namespaces_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.namespaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.namespaces_id_seq OWNER TO gitlab;

--
-- Name: namespaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.namespaces_id_seq OWNED BY public.namespaces.id;


--
-- Name: note_diff_files; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.note_diff_files (
    id integer NOT NULL,
    diff_note_id integer NOT NULL,
    diff text NOT NULL,
    new_file boolean NOT NULL,
    renamed_file boolean NOT NULL,
    deleted_file boolean NOT NULL,
    a_mode character varying NOT NULL,
    b_mode character varying NOT NULL,
    new_path text NOT NULL,
    old_path text NOT NULL
);


ALTER TABLE public.note_diff_files OWNER TO gitlab;

--
-- Name: note_diff_files_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.note_diff_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.note_diff_files_id_seq OWNER TO gitlab;

--
-- Name: note_diff_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.note_diff_files_id_seq OWNED BY public.note_diff_files.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    note text,
    noteable_type character varying,
    author_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    project_id integer,
    attachment character varying,
    line_code character varying,
    commit_id character varying,
    noteable_id integer,
    system boolean DEFAULT false NOT NULL,
    st_diff text,
    updated_by_id integer,
    type character varying,
    "position" text,
    original_position text,
    resolved_at timestamp without time zone,
    resolved_by_id integer,
    discussion_id character varying,
    note_html text,
    cached_markdown_version integer,
    change_position text,
    resolved_by_push boolean
);


ALTER TABLE public.notes OWNER TO gitlab;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO gitlab;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- Name: notification_settings; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.notification_settings (
    id integer NOT NULL,
    user_id integer NOT NULL,
    source_id integer,
    source_type character varying,
    level integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    new_note boolean,
    new_issue boolean,
    reopen_issue boolean,
    close_issue boolean,
    reassign_issue boolean,
    new_merge_request boolean,
    reopen_merge_request boolean,
    close_merge_request boolean,
    reassign_merge_request boolean,
    merge_merge_request boolean,
    failed_pipeline boolean,
    success_pipeline boolean,
    push_to_merge_request boolean,
    issue_due boolean,
    new_epic boolean
);


ALTER TABLE public.notification_settings OWNER TO gitlab;

--
-- Name: notification_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.notification_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_settings_id_seq OWNER TO gitlab;

--
-- Name: notification_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.notification_settings_id_seq OWNED BY public.notification_settings.id;


--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.oauth_access_grants (
    id integer NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id integer NOT NULL,
    token character varying NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying
);


ALTER TABLE public.oauth_access_grants OWNER TO gitlab;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_access_grants_id_seq OWNER TO gitlab;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.oauth_access_tokens (
    id integer NOT NULL,
    resource_owner_id integer,
    application_id integer,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying
);


ALTER TABLE public.oauth_access_tokens OWNER TO gitlab;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_access_tokens_id_seq OWNER TO gitlab;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.oauth_applications (
    id integer NOT NULL,
    name character varying NOT NULL,
    uid character varying NOT NULL,
    secret character varying NOT NULL,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    owner_id integer,
    owner_type character varying,
    trusted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.oauth_applications OWNER TO gitlab;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_applications_id_seq OWNER TO gitlab;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;


--
-- Name: oauth_openid_requests; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.oauth_openid_requests (
    id integer NOT NULL,
    access_grant_id integer NOT NULL,
    nonce character varying NOT NULL
);


ALTER TABLE public.oauth_openid_requests OWNER TO gitlab;

--
-- Name: oauth_openid_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.oauth_openid_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_openid_requests_id_seq OWNER TO gitlab;

--
-- Name: oauth_openid_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.oauth_openid_requests_id_seq OWNED BY public.oauth_openid_requests.id;


--
-- Name: operations_feature_flags; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.operations_feature_flags (
    id bigint NOT NULL,
    project_id integer NOT NULL,
    active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.operations_feature_flags OWNER TO gitlab;

--
-- Name: operations_feature_flags_clients; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.operations_feature_flags_clients (
    id bigint NOT NULL,
    project_id integer NOT NULL,
    token character varying NOT NULL
);


ALTER TABLE public.operations_feature_flags_clients OWNER TO gitlab;

--
-- Name: operations_feature_flags_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.operations_feature_flags_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operations_feature_flags_clients_id_seq OWNER TO gitlab;

--
-- Name: operations_feature_flags_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.operations_feature_flags_clients_id_seq OWNED BY public.operations_feature_flags_clients.id;


--
-- Name: operations_feature_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.operations_feature_flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operations_feature_flags_id_seq OWNER TO gitlab;

--
-- Name: operations_feature_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.operations_feature_flags_id_seq OWNED BY public.operations_feature_flags.id;


--
-- Name: packages_maven_metadata; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.packages_maven_metadata (
    id bigint NOT NULL,
    package_id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    app_group character varying NOT NULL,
    app_name character varying NOT NULL,
    app_version character varying,
    path character varying(512) NOT NULL
);


ALTER TABLE public.packages_maven_metadata OWNER TO gitlab;

--
-- Name: packages_maven_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.packages_maven_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.packages_maven_metadata_id_seq OWNER TO gitlab;

--
-- Name: packages_maven_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.packages_maven_metadata_id_seq OWNED BY public.packages_maven_metadata.id;


--
-- Name: packages_package_files; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.packages_package_files (
    id bigint NOT NULL,
    package_id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    size bigint,
    file_type integer,
    file_store integer,
    file_md5 bytea,
    file_sha1 bytea,
    file_name character varying NOT NULL,
    file text NOT NULL
);


ALTER TABLE public.packages_package_files OWNER TO gitlab;

--
-- Name: packages_package_files_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.packages_package_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.packages_package_files_id_seq OWNER TO gitlab;

--
-- Name: packages_package_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.packages_package_files_id_seq OWNED BY public.packages_package_files.id;


--
-- Name: packages_packages; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.packages_packages (
    id bigint NOT NULL,
    project_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying NOT NULL,
    version character varying
);


ALTER TABLE public.packages_packages OWNER TO gitlab;

--
-- Name: packages_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.packages_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.packages_packages_id_seq OWNER TO gitlab;

--
-- Name: packages_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.packages_packages_id_seq OWNED BY public.packages_packages.id;


--
-- Name: pages_domains; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.pages_domains (
    id integer NOT NULL,
    project_id integer,
    certificate text,
    encrypted_key text,
    encrypted_key_iv character varying,
    encrypted_key_salt character varying,
    domain character varying,
    verified_at timestamp with time zone,
    verification_code character varying NOT NULL,
    enabled_until timestamp with time zone
);


ALTER TABLE public.pages_domains OWNER TO gitlab;

--
-- Name: pages_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.pages_domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_domains_id_seq OWNER TO gitlab;

--
-- Name: pages_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.pages_domains_id_seq OWNED BY public.pages_domains.id;


--
-- Name: path_locks; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.path_locks (
    id integer NOT NULL,
    path character varying NOT NULL,
    project_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.path_locks OWNER TO gitlab;

--
-- Name: path_locks_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.path_locks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.path_locks_id_seq OWNER TO gitlab;

--
-- Name: path_locks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.path_locks_id_seq OWNED BY public.path_locks.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.personal_access_tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying,
    name character varying NOT NULL,
    revoked boolean DEFAULT false,
    expires_at date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    scopes character varying DEFAULT '--- []
'::character varying NOT NULL,
    impersonation boolean DEFAULT false NOT NULL,
    token_digest character varying
);


ALTER TABLE public.personal_access_tokens OWNER TO gitlab;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO gitlab;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.plans (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    title character varying,
    active_pipelines_limit integer,
    pipeline_size_limit integer
);


ALTER TABLE public.plans OWNER TO gitlab;

--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plans_id_seq OWNER TO gitlab;

--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- Name: programming_languages; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.programming_languages (
    id integer NOT NULL,
    name character varying NOT NULL,
    color character varying NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.programming_languages OWNER TO gitlab;

--
-- Name: programming_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.programming_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programming_languages_id_seq OWNER TO gitlab;

--
-- Name: programming_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.programming_languages_id_seq OWNED BY public.programming_languages.id;


--
-- Name: project_authorizations; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_authorizations (
    user_id integer NOT NULL,
    project_id integer NOT NULL,
    access_level integer NOT NULL
);


ALTER TABLE public.project_authorizations OWNER TO gitlab;

--
-- Name: project_auto_devops; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_auto_devops (
    id integer NOT NULL,
    project_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    enabled boolean,
    domain character varying,
    deploy_strategy integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.project_auto_devops OWNER TO gitlab;

--
-- Name: project_auto_devops_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.project_auto_devops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_auto_devops_id_seq OWNER TO gitlab;

--
-- Name: project_auto_devops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.project_auto_devops_id_seq OWNED BY public.project_auto_devops.id;


--
-- Name: project_ci_cd_settings; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_ci_cd_settings (
    id integer NOT NULL,
    project_id integer NOT NULL,
    group_runners_enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.project_ci_cd_settings OWNER TO gitlab;

--
-- Name: project_ci_cd_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.project_ci_cd_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_ci_cd_settings_id_seq OWNER TO gitlab;

--
-- Name: project_ci_cd_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.project_ci_cd_settings_id_seq OWNED BY public.project_ci_cd_settings.id;


--
-- Name: project_custom_attributes; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_custom_attributes (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id integer NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.project_custom_attributes OWNER TO gitlab;

--
-- Name: project_custom_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.project_custom_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_custom_attributes_id_seq OWNER TO gitlab;

--
-- Name: project_custom_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.project_custom_attributes_id_seq OWNED BY public.project_custom_attributes.id;


--
-- Name: project_deploy_tokens; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_deploy_tokens (
    id integer NOT NULL,
    project_id integer NOT NULL,
    deploy_token_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.project_deploy_tokens OWNER TO gitlab;

--
-- Name: project_deploy_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.project_deploy_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_deploy_tokens_id_seq OWNER TO gitlab;

--
-- Name: project_deploy_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.project_deploy_tokens_id_seq OWNED BY public.project_deploy_tokens.id;


--
-- Name: project_features; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_features (
    id integer NOT NULL,
    project_id integer NOT NULL,
    merge_requests_access_level integer,
    issues_access_level integer,
    wiki_access_level integer,
    snippets_access_level integer DEFAULT 20 NOT NULL,
    builds_access_level integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    repository_access_level integer DEFAULT 20 NOT NULL,
    pages_access_level integer DEFAULT 20 NOT NULL
);


ALTER TABLE public.project_features OWNER TO gitlab;

--
-- Name: project_features_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.project_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_features_id_seq OWNER TO gitlab;

--
-- Name: project_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.project_features_id_seq OWNED BY public.project_features.id;


--
-- Name: project_group_links; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_group_links (
    id integer NOT NULL,
    project_id integer NOT NULL,
    group_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    group_access integer DEFAULT 30 NOT NULL,
    expires_at date
);


ALTER TABLE public.project_group_links OWNER TO gitlab;

--
-- Name: project_group_links_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.project_group_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_group_links_id_seq OWNER TO gitlab;

--
-- Name: project_group_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.project_group_links_id_seq OWNED BY public.project_group_links.id;


--
-- Name: project_import_data; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_import_data (
    id integer NOT NULL,
    project_id integer,
    data text,
    encrypted_credentials text,
    encrypted_credentials_iv character varying,
    encrypted_credentials_salt character varying
);


ALTER TABLE public.project_import_data OWNER TO gitlab;

--
-- Name: project_import_data_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.project_import_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_import_data_id_seq OWNER TO gitlab;

--
-- Name: project_import_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.project_import_data_id_seq OWNED BY public.project_import_data.id;


--
-- Name: project_mirror_data; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_mirror_data (
    id integer NOT NULL,
    project_id integer NOT NULL,
    retry_count integer DEFAULT 0 NOT NULL,
    last_update_started_at timestamp without time zone,
    last_update_scheduled_at timestamp without time zone,
    next_execution_timestamp timestamp without time zone,
    status character varying,
    jid character varying,
    last_error text,
    last_update_at timestamp with time zone,
    last_successful_update_at timestamp with time zone
);


ALTER TABLE public.project_mirror_data OWNER TO gitlab;

--
-- Name: project_mirror_data_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.project_mirror_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_mirror_data_id_seq OWNER TO gitlab;

--
-- Name: project_mirror_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.project_mirror_data_id_seq OWNED BY public.project_mirror_data.id;


--
-- Name: project_repository_states; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_repository_states (
    id integer NOT NULL,
    project_id integer NOT NULL,
    repository_verification_checksum bytea,
    wiki_verification_checksum bytea,
    last_repository_verification_failure character varying,
    last_wiki_verification_failure character varying,
    repository_retry_at timestamp with time zone,
    wiki_retry_at timestamp with time zone,
    repository_retry_count integer,
    wiki_retry_count integer
);


ALTER TABLE public.project_repository_states OWNER TO gitlab;

--
-- Name: project_repository_states_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.project_repository_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_repository_states_id_seq OWNER TO gitlab;

--
-- Name: project_repository_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.project_repository_states_id_seq OWNED BY public.project_repository_states.id;


--
-- Name: project_statistics; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_statistics (
    id integer NOT NULL,
    project_id integer NOT NULL,
    namespace_id integer NOT NULL,
    commit_count bigint DEFAULT 0 NOT NULL,
    storage_size bigint DEFAULT 0 NOT NULL,
    repository_size bigint DEFAULT 0 NOT NULL,
    lfs_objects_size bigint DEFAULT 0 NOT NULL,
    build_artifacts_size bigint DEFAULT 0 NOT NULL,
    shared_runners_seconds bigint DEFAULT 0 NOT NULL,
    shared_runners_seconds_last_reset timestamp without time zone
);


ALTER TABLE public.project_statistics OWNER TO gitlab;

--
-- Name: project_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.project_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_statistics_id_seq OWNER TO gitlab;

--
-- Name: project_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.project_statistics_id_seq OWNED BY public.project_statistics.id;


--
-- Name: project_tracing_settings; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.project_tracing_settings (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id integer NOT NULL,
    external_url character varying NOT NULL
);


ALTER TABLE public.project_tracing_settings OWNER TO gitlab;

--
-- Name: project_tracing_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.project_tracing_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_tracing_settings_id_seq OWNER TO gitlab;

--
-- Name: project_tracing_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.project_tracing_settings_id_seq OWNED BY public.project_tracing_settings.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying,
    path character varying,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    creator_id integer,
    namespace_id integer NOT NULL,
    last_activity_at timestamp without time zone,
    import_url character varying,
    visibility_level integer DEFAULT 0 NOT NULL,
    archived boolean DEFAULT false NOT NULL,
    avatar character varying,
    import_status character varying,
    merge_requests_template text,
    star_count integer DEFAULT 0 NOT NULL,
    merge_requests_rebase_enabled boolean DEFAULT false,
    import_type character varying,
    import_source character varying,
    approvals_before_merge integer DEFAULT 0 NOT NULL,
    reset_approvals_on_push boolean DEFAULT true,
    merge_requests_ff_only_enabled boolean DEFAULT false,
    issues_template text,
    mirror boolean DEFAULT false NOT NULL,
    mirror_last_update_at timestamp without time zone,
    mirror_last_successful_update_at timestamp without time zone,
    mirror_user_id integer,
    import_error text,
    ci_id integer,
    shared_runners_enabled boolean DEFAULT true NOT NULL,
    runners_token character varying,
    build_coverage_regex character varying,
    build_allow_git_fetch boolean DEFAULT true NOT NULL,
    build_timeout integer DEFAULT 3600 NOT NULL,
    mirror_trigger_builds boolean DEFAULT false NOT NULL,
    pending_delete boolean DEFAULT false,
    public_builds boolean DEFAULT true NOT NULL,
    last_repository_check_failed boolean,
    last_repository_check_at timestamp without time zone,
    container_registry_enabled boolean,
    only_allow_merge_if_pipeline_succeeds boolean DEFAULT false NOT NULL,
    has_external_issue_tracker boolean,
    repository_storage character varying DEFAULT 'default'::character varying NOT NULL,
    repository_read_only boolean,
    request_access_enabled boolean DEFAULT false NOT NULL,
    has_external_wiki boolean,
    ci_config_path character varying,
    lfs_enabled boolean,
    description_html text,
    only_allow_merge_if_all_discussions_are_resolved boolean,
    repository_size_limit bigint,
    printing_merge_request_link_enabled boolean DEFAULT true NOT NULL,
    auto_cancel_pending_pipelines integer DEFAULT 1 NOT NULL,
    service_desk_enabled boolean DEFAULT true,
    import_jid character varying,
    cached_markdown_version integer,
    delete_error text,
    last_repository_updated_at timestamp without time zone,
    disable_overriding_approvers_per_merge_request boolean,
    storage_version smallint,
    resolve_outdated_diff_discussions boolean,
    remote_mirror_available_overridden boolean,
    only_mirror_protected_branches boolean,
    pull_mirror_available_overridden boolean,
    jobs_cache_index integer,
    external_authorization_classification_label character varying,
    mirror_overwrites_diverged_branches boolean,
    pages_https_only boolean DEFAULT true,
    external_webhook_token character varying,
    packages_enabled boolean,
    merge_requests_author_approval boolean,
    pool_repository_id bigint
);


ALTER TABLE public.projects OWNER TO gitlab;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO gitlab;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: prometheus_alert_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.prometheus_alert_events (
    id bigint NOT NULL,
    project_id integer NOT NULL,
    prometheus_alert_id integer NOT NULL,
    started_at timestamp with time zone NOT NULL,
    ended_at timestamp with time zone,
    status smallint,
    payload_key character varying
);


ALTER TABLE public.prometheus_alert_events OWNER TO gitlab;

--
-- Name: prometheus_alert_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.prometheus_alert_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prometheus_alert_events_id_seq OWNER TO gitlab;

--
-- Name: prometheus_alert_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.prometheus_alert_events_id_seq OWNED BY public.prometheus_alert_events.id;


--
-- Name: prometheus_alerts; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.prometheus_alerts (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    threshold double precision NOT NULL,
    operator integer NOT NULL,
    environment_id integer NOT NULL,
    project_id integer NOT NULL,
    prometheus_metric_id integer NOT NULL
);


ALTER TABLE public.prometheus_alerts OWNER TO gitlab;

--
-- Name: prometheus_alerts_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.prometheus_alerts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prometheus_alerts_id_seq OWNER TO gitlab;

--
-- Name: prometheus_alerts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.prometheus_alerts_id_seq OWNED BY public.prometheus_alerts.id;


--
-- Name: prometheus_metrics; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.prometheus_metrics (
    id integer NOT NULL,
    project_id integer,
    title character varying NOT NULL,
    query character varying NOT NULL,
    y_label character varying,
    unit character varying,
    legend character varying,
    "group" integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    common boolean DEFAULT false NOT NULL,
    identifier character varying
);


ALTER TABLE public.prometheus_metrics OWNER TO gitlab;

--
-- Name: prometheus_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.prometheus_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prometheus_metrics_id_seq OWNER TO gitlab;

--
-- Name: prometheus_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.prometheus_metrics_id_seq OWNED BY public.prometheus_metrics.id;


--
-- Name: protected_branch_merge_access_levels; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.protected_branch_merge_access_levels (
    id integer NOT NULL,
    protected_branch_id integer NOT NULL,
    access_level integer DEFAULT 40,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE public.protected_branch_merge_access_levels OWNER TO gitlab;

--
-- Name: protected_branch_merge_access_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.protected_branch_merge_access_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protected_branch_merge_access_levels_id_seq OWNER TO gitlab;

--
-- Name: protected_branch_merge_access_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.protected_branch_merge_access_levels_id_seq OWNED BY public.protected_branch_merge_access_levels.id;


--
-- Name: protected_branch_push_access_levels; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.protected_branch_push_access_levels (
    id integer NOT NULL,
    protected_branch_id integer NOT NULL,
    access_level integer DEFAULT 40,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE public.protected_branch_push_access_levels OWNER TO gitlab;

--
-- Name: protected_branch_push_access_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.protected_branch_push_access_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protected_branch_push_access_levels_id_seq OWNER TO gitlab;

--
-- Name: protected_branch_push_access_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.protected_branch_push_access_levels_id_seq OWNED BY public.protected_branch_push_access_levels.id;


--
-- Name: protected_branch_unprotect_access_levels; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.protected_branch_unprotect_access_levels (
    id integer NOT NULL,
    protected_branch_id integer NOT NULL,
    access_level integer DEFAULT 40,
    user_id integer,
    group_id integer
);


ALTER TABLE public.protected_branch_unprotect_access_levels OWNER TO gitlab;

--
-- Name: protected_branch_unprotect_access_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.protected_branch_unprotect_access_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protected_branch_unprotect_access_levels_id_seq OWNER TO gitlab;

--
-- Name: protected_branch_unprotect_access_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.protected_branch_unprotect_access_levels_id_seq OWNED BY public.protected_branch_unprotect_access_levels.id;


--
-- Name: protected_branches; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.protected_branches (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.protected_branches OWNER TO gitlab;

--
-- Name: protected_branches_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.protected_branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protected_branches_id_seq OWNER TO gitlab;

--
-- Name: protected_branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.protected_branches_id_seq OWNED BY public.protected_branches.id;


--
-- Name: protected_environment_deploy_access_levels; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.protected_environment_deploy_access_levels (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    access_level integer DEFAULT 40,
    protected_environment_id integer NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE public.protected_environment_deploy_access_levels OWNER TO gitlab;

--
-- Name: protected_environment_deploy_access_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.protected_environment_deploy_access_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protected_environment_deploy_access_levels_id_seq OWNER TO gitlab;

--
-- Name: protected_environment_deploy_access_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.protected_environment_deploy_access_levels_id_seq OWNED BY public.protected_environment_deploy_access_levels.id;


--
-- Name: protected_environments; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.protected_environments (
    id integer NOT NULL,
    project_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.protected_environments OWNER TO gitlab;

--
-- Name: protected_environments_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.protected_environments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protected_environments_id_seq OWNER TO gitlab;

--
-- Name: protected_environments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.protected_environments_id_seq OWNED BY public.protected_environments.id;


--
-- Name: protected_tag_create_access_levels; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.protected_tag_create_access_levels (
    id integer NOT NULL,
    protected_tag_id integer NOT NULL,
    access_level integer DEFAULT 40,
    user_id integer,
    group_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.protected_tag_create_access_levels OWNER TO gitlab;

--
-- Name: protected_tag_create_access_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.protected_tag_create_access_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protected_tag_create_access_levels_id_seq OWNER TO gitlab;

--
-- Name: protected_tag_create_access_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.protected_tag_create_access_levels_id_seq OWNED BY public.protected_tag_create_access_levels.id;


--
-- Name: protected_tags; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.protected_tags (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.protected_tags OWNER TO gitlab;

--
-- Name: protected_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.protected_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protected_tags_id_seq OWNER TO gitlab;

--
-- Name: protected_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.protected_tags_id_seq OWNED BY public.protected_tags.id;


--
-- Name: push_event_payloads; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.push_event_payloads (
    commit_count bigint NOT NULL,
    event_id integer NOT NULL,
    action smallint NOT NULL,
    ref_type smallint NOT NULL,
    commit_from bytea,
    commit_to bytea,
    ref text,
    commit_title character varying(70)
);


ALTER TABLE public.push_event_payloads OWNER TO gitlab;

--
-- Name: push_rules; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.push_rules (
    id integer NOT NULL,
    force_push_regex character varying,
    delete_branch_regex character varying,
    commit_message_regex character varying,
    deny_delete_tag boolean,
    project_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    author_email_regex character varying,
    member_check boolean DEFAULT false NOT NULL,
    file_name_regex character varying,
    is_sample boolean DEFAULT false,
    max_file_size integer DEFAULT 0 NOT NULL,
    prevent_secrets boolean DEFAULT false NOT NULL,
    branch_name_regex character varying,
    reject_unsigned_commits boolean,
    commit_committer_check boolean,
    regexp_uses_re2 boolean DEFAULT true,
    commit_message_negative_regex character varying
);


ALTER TABLE public.push_rules OWNER TO gitlab;

--
-- Name: push_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.push_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.push_rules_id_seq OWNER TO gitlab;

--
-- Name: push_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.push_rules_id_seq OWNED BY public.push_rules.id;


--
-- Name: redirect_routes; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.redirect_routes (
    id integer NOT NULL,
    source_id integer NOT NULL,
    source_type character varying NOT NULL,
    path character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.redirect_routes OWNER TO gitlab;

--
-- Name: redirect_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.redirect_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redirect_routes_id_seq OWNER TO gitlab;

--
-- Name: redirect_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.redirect_routes_id_seq OWNED BY public.redirect_routes.id;


--
-- Name: releases; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.releases (
    id integer NOT NULL,
    tag character varying,
    description text,
    project_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description_html text,
    cached_markdown_version integer
);


ALTER TABLE public.releases OWNER TO gitlab;

--
-- Name: releases_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.releases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.releases_id_seq OWNER TO gitlab;

--
-- Name: releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.releases_id_seq OWNED BY public.releases.id;


--
-- Name: remote_mirrors; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.remote_mirrors (
    id integer NOT NULL,
    project_id integer,
    url character varying,
    enabled boolean DEFAULT false,
    update_status character varying,
    last_update_at timestamp without time zone,
    last_successful_update_at timestamp without time zone,
    last_error character varying,
    encrypted_credentials text,
    encrypted_credentials_iv character varying,
    encrypted_credentials_salt character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    last_update_started_at timestamp without time zone,
    only_protected_branches boolean DEFAULT false NOT NULL,
    remote_name character varying
);


ALTER TABLE public.remote_mirrors OWNER TO gitlab;

--
-- Name: remote_mirrors_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.remote_mirrors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remote_mirrors_id_seq OWNER TO gitlab;

--
-- Name: remote_mirrors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.remote_mirrors_id_seq OWNED BY public.remote_mirrors.id;


--
-- Name: repositories; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.repositories (
    id bigint NOT NULL,
    shard_id integer NOT NULL,
    disk_path character varying NOT NULL
);


ALTER TABLE public.repositories OWNER TO gitlab;

--
-- Name: repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.repositories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repositories_id_seq OWNER TO gitlab;

--
-- Name: repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.repositories_id_seq OWNED BY public.repositories.id;


--
-- Name: repository_languages; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.repository_languages (
    project_id integer NOT NULL,
    programming_language_id integer NOT NULL,
    share double precision NOT NULL
);


ALTER TABLE public.repository_languages OWNER TO gitlab;

--
-- Name: resource_label_events; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.resource_label_events (
    id bigint NOT NULL,
    action integer NOT NULL,
    issue_id integer,
    merge_request_id integer,
    epic_id integer,
    label_id integer,
    user_id integer,
    created_at timestamp with time zone NOT NULL,
    cached_markdown_version integer,
    reference text,
    reference_html text
);


ALTER TABLE public.resource_label_events OWNER TO gitlab;

--
-- Name: resource_label_events_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.resource_label_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_label_events_id_seq OWNER TO gitlab;

--
-- Name: resource_label_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.resource_label_events_id_seq OWNED BY public.resource_label_events.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.routes (
    id integer NOT NULL,
    source_id integer NOT NULL,
    source_type character varying NOT NULL,
    path character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying
);


ALTER TABLE public.routes OWNER TO gitlab;

--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.routes_id_seq OWNER TO gitlab;

--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;


--
-- Name: saml_providers; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.saml_providers (
    id integer NOT NULL,
    group_id integer NOT NULL,
    enabled boolean NOT NULL,
    certificate_fingerprint character varying NOT NULL,
    sso_url character varying NOT NULL
);


ALTER TABLE public.saml_providers OWNER TO gitlab;

--
-- Name: saml_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.saml_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saml_providers_id_seq OWNER TO gitlab;

--
-- Name: saml_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.saml_providers_id_seq OWNED BY public.saml_providers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO gitlab;

--
-- Name: sent_notifications; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.sent_notifications (
    id integer NOT NULL,
    project_id integer,
    noteable_id integer,
    noteable_type character varying,
    recipient_id integer,
    commit_id character varying,
    reply_key character varying NOT NULL,
    line_code character varying,
    note_type character varying,
    "position" text,
    in_reply_to_discussion_id character varying
);


ALTER TABLE public.sent_notifications OWNER TO gitlab;

--
-- Name: sent_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.sent_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sent_notifications_id_seq OWNER TO gitlab;

--
-- Name: sent_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.sent_notifications_id_seq OWNED BY public.sent_notifications.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.services (
    id integer NOT NULL,
    type character varying,
    title character varying,
    project_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    active boolean DEFAULT false NOT NULL,
    properties text,
    template boolean DEFAULT false,
    push_events boolean DEFAULT true,
    issues_events boolean DEFAULT true,
    merge_requests_events boolean DEFAULT true,
    tag_push_events boolean DEFAULT true,
    note_events boolean DEFAULT true NOT NULL,
    category character varying DEFAULT 'common'::character varying NOT NULL,
    "default" boolean DEFAULT false,
    wiki_page_events boolean DEFAULT true,
    pipeline_events boolean DEFAULT false NOT NULL,
    confidential_issues_events boolean DEFAULT true NOT NULL,
    commit_events boolean DEFAULT true NOT NULL,
    job_events boolean DEFAULT false NOT NULL,
    confidential_note_events boolean DEFAULT true
);


ALTER TABLE public.services OWNER TO gitlab;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO gitlab;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: shards; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.shards (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.shards OWNER TO gitlab;

--
-- Name: shards_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.shards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shards_id_seq OWNER TO gitlab;

--
-- Name: shards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.shards_id_seq OWNED BY public.shards.id;


--
-- Name: slack_integrations; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.slack_integrations (
    id integer NOT NULL,
    service_id integer NOT NULL,
    team_id character varying NOT NULL,
    team_name character varying NOT NULL,
    alias character varying NOT NULL,
    user_id character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.slack_integrations OWNER TO gitlab;

--
-- Name: slack_integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.slack_integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slack_integrations_id_seq OWNER TO gitlab;

--
-- Name: slack_integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.slack_integrations_id_seq OWNED BY public.slack_integrations.id;


--
-- Name: snippets; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.snippets (
    id integer NOT NULL,
    title character varying,
    content text,
    author_id integer NOT NULL,
    project_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    file_name character varying,
    type character varying,
    visibility_level integer DEFAULT 0 NOT NULL,
    title_html text,
    content_html text,
    cached_markdown_version integer,
    description text,
    description_html text
);


ALTER TABLE public.snippets OWNER TO gitlab;

--
-- Name: snippets_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.snippets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.snippets_id_seq OWNER TO gitlab;

--
-- Name: snippets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.snippets_id_seq OWNED BY public.snippets.id;


--
-- Name: software_license_policies; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.software_license_policies (
    id integer NOT NULL,
    project_id integer NOT NULL,
    software_license_id integer NOT NULL,
    approval_status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.software_license_policies OWNER TO gitlab;

--
-- Name: software_license_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.software_license_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.software_license_policies_id_seq OWNER TO gitlab;

--
-- Name: software_license_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.software_license_policies_id_seq OWNED BY public.software_license_policies.id;


--
-- Name: software_licenses; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.software_licenses (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.software_licenses OWNER TO gitlab;

--
-- Name: software_licenses_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.software_licenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.software_licenses_id_seq OWNER TO gitlab;

--
-- Name: software_licenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.software_licenses_id_seq OWNED BY public.software_licenses.id;


--
-- Name: spam_logs; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.spam_logs (
    id integer NOT NULL,
    user_id integer,
    source_ip character varying,
    user_agent character varying,
    via_api boolean,
    noteable_type character varying,
    title character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    submitted_as_ham boolean DEFAULT false NOT NULL,
    recaptcha_verified boolean DEFAULT false NOT NULL
);


ALTER TABLE public.spam_logs OWNER TO gitlab;

--
-- Name: spam_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.spam_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spam_logs_id_seq OWNER TO gitlab;

--
-- Name: spam_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.spam_logs_id_seq OWNED BY public.spam_logs.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    user_id integer,
    subscribable_id integer,
    subscribable_type character varying,
    subscribed boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    project_id integer
);


ALTER TABLE public.subscriptions OWNER TO gitlab;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO gitlab;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: system_note_metadata; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.system_note_metadata (
    id integer NOT NULL,
    note_id integer NOT NULL,
    commit_count integer,
    action character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.system_note_metadata OWNER TO gitlab;

--
-- Name: system_note_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.system_note_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_note_metadata_id_seq OWNER TO gitlab;

--
-- Name: system_note_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.system_note_metadata_id_seq OWNED BY public.system_note_metadata.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_id integer,
    taggable_type character varying,
    tagger_id integer,
    tagger_type character varying,
    context character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.taggings OWNER TO gitlab;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggings_id_seq OWNER TO gitlab;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.taggings_id_seq OWNED BY public.taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying,
    taggings_count integer DEFAULT 0
);


ALTER TABLE public.tags OWNER TO gitlab;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO gitlab;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: term_agreements; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.term_agreements (
    id integer NOT NULL,
    term_id integer NOT NULL,
    user_id integer NOT NULL,
    accepted boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.term_agreements OWNER TO gitlab;

--
-- Name: term_agreements_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.term_agreements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.term_agreements_id_seq OWNER TO gitlab;

--
-- Name: term_agreements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.term_agreements_id_seq OWNED BY public.term_agreements.id;


--
-- Name: timelogs; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.timelogs (
    id integer NOT NULL,
    time_spent integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    issue_id integer,
    merge_request_id integer,
    spent_at timestamp without time zone
);


ALTER TABLE public.timelogs OWNER TO gitlab;

--
-- Name: timelogs_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.timelogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timelogs_id_seq OWNER TO gitlab;

--
-- Name: timelogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.timelogs_id_seq OWNED BY public.timelogs.id;


--
-- Name: todos; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.todos (
    id integer NOT NULL,
    user_id integer NOT NULL,
    project_id integer,
    target_id integer,
    target_type character varying NOT NULL,
    author_id integer NOT NULL,
    action integer NOT NULL,
    state character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    note_id integer,
    commit_id character varying,
    group_id integer
);


ALTER TABLE public.todos OWNER TO gitlab;

--
-- Name: todos_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.todos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.todos_id_seq OWNER TO gitlab;

--
-- Name: todos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.todos_id_seq OWNED BY public.todos.id;


--
-- Name: trending_projects; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.trending_projects (
    id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.trending_projects OWNER TO gitlab;

--
-- Name: trending_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.trending_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trending_projects_id_seq OWNER TO gitlab;

--
-- Name: trending_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.trending_projects_id_seq OWNED BY public.trending_projects.id;


--
-- Name: u2f_registrations; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.u2f_registrations (
    id integer NOT NULL,
    certificate text,
    key_handle character varying,
    public_key character varying,
    counter integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


ALTER TABLE public.u2f_registrations OWNER TO gitlab;

--
-- Name: u2f_registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.u2f_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.u2f_registrations_id_seq OWNER TO gitlab;

--
-- Name: u2f_registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.u2f_registrations_id_seq OWNED BY public.u2f_registrations.id;


--
-- Name: uploads; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.uploads (
    id integer NOT NULL,
    size bigint NOT NULL,
    path character varying(511) NOT NULL,
    checksum character varying(64),
    model_id integer,
    model_type character varying,
    uploader character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    store integer,
    mount_point character varying,
    secret character varying
);


ALTER TABLE public.uploads OWNER TO gitlab;

--
-- Name: uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uploads_id_seq OWNER TO gitlab;

--
-- Name: uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.uploads_id_seq OWNED BY public.uploads.id;


--
-- Name: user_agent_details; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.user_agent_details (
    id integer NOT NULL,
    user_agent character varying NOT NULL,
    ip_address character varying NOT NULL,
    subject_id integer NOT NULL,
    subject_type character varying NOT NULL,
    submitted boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_agent_details OWNER TO gitlab;

--
-- Name: user_agent_details_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.user_agent_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_agent_details_id_seq OWNER TO gitlab;

--
-- Name: user_agent_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.user_agent_details_id_seq OWNED BY public.user_agent_details.id;


--
-- Name: user_callouts; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.user_callouts (
    id integer NOT NULL,
    feature_name integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_callouts OWNER TO gitlab;

--
-- Name: user_callouts_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.user_callouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_callouts_id_seq OWNER TO gitlab;

--
-- Name: user_callouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.user_callouts_id_seq OWNED BY public.user_callouts.id;


--
-- Name: user_custom_attributes; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.user_custom_attributes (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.user_custom_attributes OWNER TO gitlab;

--
-- Name: user_custom_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.user_custom_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_custom_attributes_id_seq OWNER TO gitlab;

--
-- Name: user_custom_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.user_custom_attributes_id_seq OWNED BY public.user_custom_attributes.id;


--
-- Name: user_interacted_projects; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.user_interacted_projects (
    user_id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.user_interacted_projects OWNER TO gitlab;

--
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.user_preferences (
    id integer NOT NULL,
    user_id integer NOT NULL,
    issue_notes_filter smallint DEFAULT 0 NOT NULL,
    merge_request_notes_filter smallint DEFAULT 0 NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.user_preferences OWNER TO gitlab;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_preferences_id_seq OWNER TO gitlab;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.user_preferences_id_seq OWNED BY public.user_preferences.id;


--
-- Name: user_statuses; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.user_statuses (
    user_id integer NOT NULL,
    cached_markdown_version integer,
    emoji character varying DEFAULT 'speech_balloon'::character varying NOT NULL,
    message character varying(100),
    message_html character varying
);


ALTER TABLE public.user_statuses OWNER TO gitlab;

--
-- Name: user_statuses_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.user_statuses_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_statuses_user_id_seq OWNER TO gitlab;

--
-- Name: user_statuses_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.user_statuses_user_id_seq OWNED BY public.user_statuses.user_id;


--
-- Name: user_synced_attributes_metadata; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.user_synced_attributes_metadata (
    id integer NOT NULL,
    name_synced boolean DEFAULT false,
    email_synced boolean DEFAULT false,
    location_synced boolean DEFAULT false,
    user_id integer NOT NULL,
    provider character varying
);


ALTER TABLE public.user_synced_attributes_metadata OWNER TO gitlab;

--
-- Name: user_synced_attributes_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.user_synced_attributes_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_synced_attributes_metadata_id_seq OWNER TO gitlab;

--
-- Name: user_synced_attributes_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.user_synced_attributes_metadata_id_seq OWNED BY public.user_synced_attributes_metadata.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    admin boolean DEFAULT false NOT NULL,
    projects_limit integer NOT NULL,
    skype character varying DEFAULT ''::character varying NOT NULL,
    linkedin character varying DEFAULT ''::character varying NOT NULL,
    twitter character varying DEFAULT ''::character varying NOT NULL,
    bio character varying,
    failed_attempts integer DEFAULT 0,
    locked_at timestamp without time zone,
    username character varying,
    can_create_group boolean DEFAULT true NOT NULL,
    can_create_team boolean DEFAULT true NOT NULL,
    state character varying,
    color_scheme_id integer DEFAULT 1 NOT NULL,
    password_expires_at timestamp without time zone,
    created_by_id integer,
    last_credential_check_at timestamp without time zone,
    avatar character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    hide_no_ssh_key boolean DEFAULT false,
    website_url character varying DEFAULT ''::character varying NOT NULL,
    admin_email_unsubscribed_at timestamp without time zone,
    notification_email character varying,
    hide_no_password boolean DEFAULT false,
    password_automatically_set boolean DEFAULT false,
    location character varying,
    encrypted_otp_secret character varying,
    encrypted_otp_secret_iv character varying,
    encrypted_otp_secret_salt character varying,
    otp_required_for_login boolean DEFAULT false NOT NULL,
    otp_backup_codes text,
    public_email character varying DEFAULT ''::character varying NOT NULL,
    dashboard integer DEFAULT 0,
    project_view integer DEFAULT 0,
    consumed_timestep integer,
    layout integer DEFAULT 0,
    hide_project_limit boolean DEFAULT false,
    note text,
    unlock_token character varying,
    otp_grace_period_started_at timestamp without time zone,
    external boolean DEFAULT false,
    incoming_email_token character varying,
    organization character varying,
    auditor boolean DEFAULT false NOT NULL,
    require_two_factor_authentication_from_group boolean DEFAULT false NOT NULL,
    two_factor_grace_period integer DEFAULT 48 NOT NULL,
    ghost boolean,
    last_activity_on date,
    notified_of_own_activity boolean,
    support_bot boolean,
    preferred_language character varying,
    email_opted_in boolean,
    email_opted_in_ip character varying,
    email_opted_in_source_id integer,
    email_opted_in_at timestamp without time zone,
    theme_id smallint,
    accepted_term_id integer,
    feed_token character varying,
    private_profile boolean,
    roadmap_layout smallint,
    include_private_contributions boolean,
    commit_email character varying
);


ALTER TABLE public.users OWNER TO gitlab;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gitlab;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_ops_dashboard_projects; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.users_ops_dashboard_projects (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.users_ops_dashboard_projects OWNER TO gitlab;

--
-- Name: users_ops_dashboard_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.users_ops_dashboard_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_ops_dashboard_projects_id_seq OWNER TO gitlab;

--
-- Name: users_ops_dashboard_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.users_ops_dashboard_projects_id_seq OWNED BY public.users_ops_dashboard_projects.id;


--
-- Name: users_star_projects; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.users_star_projects (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users_star_projects OWNER TO gitlab;

--
-- Name: users_star_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.users_star_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_star_projects_id_seq OWNER TO gitlab;

--
-- Name: users_star_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.users_star_projects_id_seq OWNED BY public.users_star_projects.id;


--
-- Name: vulnerability_feedback; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.vulnerability_feedback (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    feedback_type smallint NOT NULL,
    category smallint NOT NULL,
    project_id integer NOT NULL,
    author_id integer NOT NULL,
    pipeline_id integer,
    issue_id integer,
    project_fingerprint character varying(40) NOT NULL
);


ALTER TABLE public.vulnerability_feedback OWNER TO gitlab;

--
-- Name: vulnerability_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.vulnerability_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vulnerability_feedback_id_seq OWNER TO gitlab;

--
-- Name: vulnerability_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.vulnerability_feedback_id_seq OWNED BY public.vulnerability_feedback.id;


--
-- Name: vulnerability_identifiers; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.vulnerability_identifiers (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id integer NOT NULL,
    fingerprint bytea NOT NULL,
    external_type character varying NOT NULL,
    external_id character varying NOT NULL,
    name character varying NOT NULL,
    url text
);


ALTER TABLE public.vulnerability_identifiers OWNER TO gitlab;

--
-- Name: vulnerability_identifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.vulnerability_identifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vulnerability_identifiers_id_seq OWNER TO gitlab;

--
-- Name: vulnerability_identifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.vulnerability_identifiers_id_seq OWNED BY public.vulnerability_identifiers.id;


--
-- Name: vulnerability_occurrence_identifiers; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.vulnerability_occurrence_identifiers (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    occurrence_id bigint NOT NULL,
    identifier_id bigint NOT NULL
);


ALTER TABLE public.vulnerability_occurrence_identifiers OWNER TO gitlab;

--
-- Name: vulnerability_occurrence_identifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.vulnerability_occurrence_identifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vulnerability_occurrence_identifiers_id_seq OWNER TO gitlab;

--
-- Name: vulnerability_occurrence_identifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.vulnerability_occurrence_identifiers_id_seq OWNED BY public.vulnerability_occurrence_identifiers.id;


--
-- Name: vulnerability_occurrence_pipelines; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.vulnerability_occurrence_pipelines (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    occurrence_id bigint NOT NULL,
    pipeline_id integer NOT NULL
);


ALTER TABLE public.vulnerability_occurrence_pipelines OWNER TO gitlab;

--
-- Name: vulnerability_occurrence_pipelines_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.vulnerability_occurrence_pipelines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vulnerability_occurrence_pipelines_id_seq OWNER TO gitlab;

--
-- Name: vulnerability_occurrence_pipelines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.vulnerability_occurrence_pipelines_id_seq OWNED BY public.vulnerability_occurrence_pipelines.id;


--
-- Name: vulnerability_occurrences; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.vulnerability_occurrences (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    severity smallint NOT NULL,
    confidence smallint NOT NULL,
    report_type smallint NOT NULL,
    project_id integer NOT NULL,
    scanner_id bigint NOT NULL,
    primary_identifier_id bigint NOT NULL,
    project_fingerprint bytea NOT NULL,
    location_fingerprint bytea NOT NULL,
    uuid character varying(36) NOT NULL,
    name character varying NOT NULL,
    metadata_version character varying NOT NULL,
    raw_metadata text NOT NULL
);


ALTER TABLE public.vulnerability_occurrences OWNER TO gitlab;

--
-- Name: vulnerability_occurrences_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.vulnerability_occurrences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vulnerability_occurrences_id_seq OWNER TO gitlab;

--
-- Name: vulnerability_occurrences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.vulnerability_occurrences_id_seq OWNED BY public.vulnerability_occurrences.id;


--
-- Name: vulnerability_scanners; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.vulnerability_scanners (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id integer NOT NULL,
    external_id character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.vulnerability_scanners OWNER TO gitlab;

--
-- Name: vulnerability_scanners_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.vulnerability_scanners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vulnerability_scanners_id_seq OWNER TO gitlab;

--
-- Name: vulnerability_scanners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.vulnerability_scanners_id_seq OWNED BY public.vulnerability_scanners.id;


--
-- Name: web_hook_logs; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.web_hook_logs (
    id integer NOT NULL,
    web_hook_id integer NOT NULL,
    trigger character varying,
    url character varying,
    request_headers text,
    request_data text,
    response_headers text,
    response_body text,
    response_status character varying,
    execution_duration double precision,
    internal_error_message character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.web_hook_logs OWNER TO gitlab;

--
-- Name: web_hook_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.web_hook_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_hook_logs_id_seq OWNER TO gitlab;

--
-- Name: web_hook_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.web_hook_logs_id_seq OWNED BY public.web_hook_logs.id;


--
-- Name: web_hooks; Type: TABLE; Schema: public; Owner: gitlab
--

CREATE TABLE public.web_hooks (
    id integer NOT NULL,
    project_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying DEFAULT 'ProjectHook'::character varying,
    service_id integer,
    push_events boolean DEFAULT true NOT NULL,
    issues_events boolean DEFAULT false NOT NULL,
    merge_requests_events boolean DEFAULT false NOT NULL,
    tag_push_events boolean DEFAULT false,
    group_id integer,
    note_events boolean DEFAULT false NOT NULL,
    enable_ssl_verification boolean DEFAULT true,
    wiki_page_events boolean DEFAULT false NOT NULL,
    pipeline_events boolean DEFAULT false NOT NULL,
    confidential_issues_events boolean DEFAULT false NOT NULL,
    repository_update_events boolean DEFAULT false NOT NULL,
    job_events boolean DEFAULT false NOT NULL,
    confidential_note_events boolean,
    push_events_branch_filter text,
    encrypted_token character varying,
    encrypted_token_iv character varying,
    encrypted_url character varying,
    encrypted_url_iv character varying
);


ALTER TABLE public.web_hooks OWNER TO gitlab;

--
-- Name: web_hooks_id_seq; Type: SEQUENCE; Schema: public; Owner: gitlab
--

CREATE SEQUENCE public.web_hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_hooks_id_seq OWNER TO gitlab;

--
-- Name: web_hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitlab
--

ALTER SEQUENCE public.web_hooks_id_seq OWNED BY public.web_hooks.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.abuse_reports ALTER COLUMN id SET DEFAULT nextval('public.abuse_reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.appearances ALTER COLUMN id SET DEFAULT nextval('public.appearances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.application_setting_terms ALTER COLUMN id SET DEFAULT nextval('public.application_setting_terms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.application_settings ALTER COLUMN id SET DEFAULT nextval('public.application_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.approvals ALTER COLUMN id SET DEFAULT nextval('public.approvals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.approver_groups ALTER COLUMN id SET DEFAULT nextval('public.approver_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.approvers ALTER COLUMN id SET DEFAULT nextval('public.approvers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.audit_events ALTER COLUMN id SET DEFAULT nextval('public.audit_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.award_emoji ALTER COLUMN id SET DEFAULT nextval('public.award_emoji_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.badges ALTER COLUMN id SET DEFAULT nextval('public.badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_assignees ALTER COLUMN id SET DEFAULT nextval('public.board_assignees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_group_recent_visits ALTER COLUMN id SET DEFAULT nextval('public.board_group_recent_visits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_labels ALTER COLUMN id SET DEFAULT nextval('public.board_labels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_project_recent_visits ALTER COLUMN id SET DEFAULT nextval('public.board_project_recent_visits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.boards ALTER COLUMN id SET DEFAULT nextval('public.boards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.broadcast_messages ALTER COLUMN id SET DEFAULT nextval('public.broadcast_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.chat_names ALTER COLUMN id SET DEFAULT nextval('public.chat_names_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.chat_teams ALTER COLUMN id SET DEFAULT nextval('public.chat_teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_build_trace_chunks ALTER COLUMN id SET DEFAULT nextval('public.ci_build_trace_chunks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_build_trace_section_names ALTER COLUMN id SET DEFAULT nextval('public.ci_build_trace_section_names_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_build_trace_sections ALTER COLUMN id SET DEFAULT nextval('public.ci_build_trace_sections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds ALTER COLUMN id SET DEFAULT nextval('public.ci_builds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds_metadata ALTER COLUMN id SET DEFAULT nextval('public.ci_builds_metadata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds_runner_session ALTER COLUMN id SET DEFAULT nextval('public.ci_builds_runner_session_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_group_variables ALTER COLUMN id SET DEFAULT nextval('public.ci_group_variables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_job_artifacts ALTER COLUMN id SET DEFAULT nextval('public.ci_job_artifacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_chat_data ALTER COLUMN id SET DEFAULT nextval('public.ci_pipeline_chat_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_schedule_variables ALTER COLUMN id SET DEFAULT nextval('public.ci_pipeline_schedule_variables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_schedules ALTER COLUMN id SET DEFAULT nextval('public.ci_pipeline_schedules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_variables ALTER COLUMN id SET DEFAULT nextval('public.ci_pipeline_variables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipelines ALTER COLUMN id SET DEFAULT nextval('public.ci_pipelines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_runner_namespaces ALTER COLUMN id SET DEFAULT nextval('public.ci_runner_namespaces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_runner_projects ALTER COLUMN id SET DEFAULT nextval('public.ci_runner_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_runners ALTER COLUMN id SET DEFAULT nextval('public.ci_runners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_sources_pipelines ALTER COLUMN id SET DEFAULT nextval('public.ci_sources_pipelines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_stages ALTER COLUMN id SET DEFAULT nextval('public.ci_stages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_trigger_requests ALTER COLUMN id SET DEFAULT nextval('public.ci_trigger_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_triggers ALTER COLUMN id SET DEFAULT nextval('public.ci_triggers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_variables ALTER COLUMN id SET DEFAULT nextval('public.ci_variables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_groups ALTER COLUMN id SET DEFAULT nextval('public.cluster_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_platforms_kubernetes ALTER COLUMN id SET DEFAULT nextval('public.cluster_platforms_kubernetes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_projects ALTER COLUMN id SET DEFAULT nextval('public.cluster_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_providers_gcp ALTER COLUMN id SET DEFAULT nextval('public.cluster_providers_gcp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters ALTER COLUMN id SET DEFAULT nextval('public.clusters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_helm ALTER COLUMN id SET DEFAULT nextval('public.clusters_applications_helm_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_ingress ALTER COLUMN id SET DEFAULT nextval('public.clusters_applications_ingress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_jupyter ALTER COLUMN id SET DEFAULT nextval('public.clusters_applications_jupyter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_knative ALTER COLUMN id SET DEFAULT nextval('public.clusters_applications_knative_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_prometheus ALTER COLUMN id SET DEFAULT nextval('public.clusters_applications_prometheus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_runners ALTER COLUMN id SET DEFAULT nextval('public.clusters_applications_runners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_kubernetes_namespaces ALTER COLUMN id SET DEFAULT nextval('public.clusters_kubernetes_namespaces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.container_repositories ALTER COLUMN id SET DEFAULT nextval('public.container_repositories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.conversational_development_index_metrics ALTER COLUMN id SET DEFAULT nextval('public.conversational_development_index_metrics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.deploy_keys_projects ALTER COLUMN id SET DEFAULT nextval('public.deploy_keys_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.deploy_tokens ALTER COLUMN id SET DEFAULT nextval('public.deploy_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.deployments ALTER COLUMN id SET DEFAULT nextval('public.deployments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.draft_notes ALTER COLUMN id SET DEFAULT nextval('public.draft_notes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.emails ALTER COLUMN id SET DEFAULT nextval('public.emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.environments ALTER COLUMN id SET DEFAULT nextval('public.environments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epic_issues ALTER COLUMN id SET DEFAULT nextval('public.epic_issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epic_metrics ALTER COLUMN id SET DEFAULT nextval('public.epic_metrics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epics ALTER COLUMN id SET DEFAULT nextval('public.epics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.feature_gates ALTER COLUMN id SET DEFAULT nextval('public.feature_gates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.features ALTER COLUMN id SET DEFAULT nextval('public.features_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.fork_network_members ALTER COLUMN id SET DEFAULT nextval('public.fork_network_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.fork_networks ALTER COLUMN id SET DEFAULT nextval('public.fork_networks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.forked_project_links ALTER COLUMN id SET DEFAULT nextval('public.forked_project_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gcp_clusters ALTER COLUMN id SET DEFAULT nextval('public.gcp_clusters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_cache_invalidation_events ALTER COLUMN id SET DEFAULT nextval('public.geo_cache_invalidation_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log ALTER COLUMN id SET DEFAULT nextval('public.geo_event_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_hashed_storage_attachments_events ALTER COLUMN id SET DEFAULT nextval('public.geo_hashed_storage_attachments_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_hashed_storage_migrated_events ALTER COLUMN id SET DEFAULT nextval('public.geo_hashed_storage_migrated_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_job_artifact_deleted_events ALTER COLUMN id SET DEFAULT nextval('public.geo_job_artifact_deleted_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_lfs_object_deleted_events ALTER COLUMN id SET DEFAULT nextval('public.geo_lfs_object_deleted_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_node_namespace_links ALTER COLUMN id SET DEFAULT nextval('public.geo_node_namespace_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_node_statuses ALTER COLUMN id SET DEFAULT nextval('public.geo_node_statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_nodes ALTER COLUMN id SET DEFAULT nextval('public.geo_nodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repositories_changed_events ALTER COLUMN id SET DEFAULT nextval('public.geo_repositories_changed_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repository_created_events ALTER COLUMN id SET DEFAULT nextval('public.geo_repository_created_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repository_deleted_events ALTER COLUMN id SET DEFAULT nextval('public.geo_repository_deleted_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repository_renamed_events ALTER COLUMN id SET DEFAULT nextval('public.geo_repository_renamed_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repository_updated_events ALTER COLUMN id SET DEFAULT nextval('public.geo_repository_updated_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_reset_checksum_events ALTER COLUMN id SET DEFAULT nextval('public.geo_reset_checksum_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_upload_deleted_events ALTER COLUMN id SET DEFAULT nextval('public.geo_upload_deleted_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gpg_key_subkeys ALTER COLUMN id SET DEFAULT nextval('public.gpg_key_subkeys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gpg_keys ALTER COLUMN id SET DEFAULT nextval('public.gpg_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gpg_signatures ALTER COLUMN id SET DEFAULT nextval('public.gpg_signatures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.group_custom_attributes ALTER COLUMN id SET DEFAULT nextval('public.group_custom_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.historical_data ALTER COLUMN id SET DEFAULT nextval('public.historical_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.identities ALTER COLUMN id SET DEFAULT nextval('public.identities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.import_export_uploads ALTER COLUMN id SET DEFAULT nextval('public.import_export_uploads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.index_statuses ALTER COLUMN id SET DEFAULT nextval('public.index_statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.internal_ids ALTER COLUMN id SET DEFAULT nextval('public.internal_ids_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issue_links ALTER COLUMN id SET DEFAULT nextval('public.issue_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issue_metrics ALTER COLUMN id SET DEFAULT nextval('public.issue_metrics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issues ALTER COLUMN id SET DEFAULT nextval('public.issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.keys ALTER COLUMN id SET DEFAULT nextval('public.keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.label_links ALTER COLUMN id SET DEFAULT nextval('public.label_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.label_priorities ALTER COLUMN id SET DEFAULT nextval('public.label_priorities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.labels ALTER COLUMN id SET DEFAULT nextval('public.labels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ldap_group_links ALTER COLUMN id SET DEFAULT nextval('public.ldap_group_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lfs_file_locks ALTER COLUMN id SET DEFAULT nextval('public.lfs_file_locks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lfs_objects ALTER COLUMN id SET DEFAULT nextval('public.lfs_objects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lfs_objects_projects ALTER COLUMN id SET DEFAULT nextval('public.lfs_objects_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.licenses ALTER COLUMN id SET DEFAULT nextval('public.licenses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lists ALTER COLUMN id SET DEFAULT nextval('public.lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_request_diffs ALTER COLUMN id SET DEFAULT nextval('public.merge_request_diffs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_request_metrics ALTER COLUMN id SET DEFAULT nextval('public.merge_request_metrics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests ALTER COLUMN id SET DEFAULT nextval('public.merge_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests_closing_issues ALTER COLUMN id SET DEFAULT nextval('public.merge_requests_closing_issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.milestones ALTER COLUMN id SET DEFAULT nextval('public.milestones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.namespace_statistics ALTER COLUMN id SET DEFAULT nextval('public.namespace_statistics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.namespaces ALTER COLUMN id SET DEFAULT nextval('public.namespaces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.note_diff_files ALTER COLUMN id SET DEFAULT nextval('public.note_diff_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.notification_settings ALTER COLUMN id SET DEFAULT nextval('public.notification_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.oauth_openid_requests ALTER COLUMN id SET DEFAULT nextval('public.oauth_openid_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.operations_feature_flags ALTER COLUMN id SET DEFAULT nextval('public.operations_feature_flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.operations_feature_flags_clients ALTER COLUMN id SET DEFAULT nextval('public.operations_feature_flags_clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.packages_maven_metadata ALTER COLUMN id SET DEFAULT nextval('public.packages_maven_metadata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.packages_package_files ALTER COLUMN id SET DEFAULT nextval('public.packages_package_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.packages_packages ALTER COLUMN id SET DEFAULT nextval('public.packages_packages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.pages_domains ALTER COLUMN id SET DEFAULT nextval('public.pages_domains_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.path_locks ALTER COLUMN id SET DEFAULT nextval('public.path_locks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.programming_languages ALTER COLUMN id SET DEFAULT nextval('public.programming_languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_auto_devops ALTER COLUMN id SET DEFAULT nextval('public.project_auto_devops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_ci_cd_settings ALTER COLUMN id SET DEFAULT nextval('public.project_ci_cd_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_custom_attributes ALTER COLUMN id SET DEFAULT nextval('public.project_custom_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_deploy_tokens ALTER COLUMN id SET DEFAULT nextval('public.project_deploy_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_features ALTER COLUMN id SET DEFAULT nextval('public.project_features_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_group_links ALTER COLUMN id SET DEFAULT nextval('public.project_group_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_import_data ALTER COLUMN id SET DEFAULT nextval('public.project_import_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_mirror_data ALTER COLUMN id SET DEFAULT nextval('public.project_mirror_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_repository_states ALTER COLUMN id SET DEFAULT nextval('public.project_repository_states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_statistics ALTER COLUMN id SET DEFAULT nextval('public.project_statistics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_tracing_settings ALTER COLUMN id SET DEFAULT nextval('public.project_tracing_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_alert_events ALTER COLUMN id SET DEFAULT nextval('public.prometheus_alert_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_alerts ALTER COLUMN id SET DEFAULT nextval('public.prometheus_alerts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_metrics ALTER COLUMN id SET DEFAULT nextval('public.prometheus_metrics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_merge_access_levels ALTER COLUMN id SET DEFAULT nextval('public.protected_branch_merge_access_levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_push_access_levels ALTER COLUMN id SET DEFAULT nextval('public.protected_branch_push_access_levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_unprotect_access_levels ALTER COLUMN id SET DEFAULT nextval('public.protected_branch_unprotect_access_levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branches ALTER COLUMN id SET DEFAULT nextval('public.protected_branches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_environment_deploy_access_levels ALTER COLUMN id SET DEFAULT nextval('public.protected_environment_deploy_access_levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_environments ALTER COLUMN id SET DEFAULT nextval('public.protected_environments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_tag_create_access_levels ALTER COLUMN id SET DEFAULT nextval('public.protected_tag_create_access_levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_tags ALTER COLUMN id SET DEFAULT nextval('public.protected_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.push_rules ALTER COLUMN id SET DEFAULT nextval('public.push_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.redirect_routes ALTER COLUMN id SET DEFAULT nextval('public.redirect_routes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.releases ALTER COLUMN id SET DEFAULT nextval('public.releases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.remote_mirrors ALTER COLUMN id SET DEFAULT nextval('public.remote_mirrors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.repositories ALTER COLUMN id SET DEFAULT nextval('public.repositories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.resource_label_events ALTER COLUMN id SET DEFAULT nextval('public.resource_label_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.saml_providers ALTER COLUMN id SET DEFAULT nextval('public.saml_providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.sent_notifications ALTER COLUMN id SET DEFAULT nextval('public.sent_notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.shards ALTER COLUMN id SET DEFAULT nextval('public.shards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.slack_integrations ALTER COLUMN id SET DEFAULT nextval('public.slack_integrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.snippets ALTER COLUMN id SET DEFAULT nextval('public.snippets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.software_license_policies ALTER COLUMN id SET DEFAULT nextval('public.software_license_policies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.software_licenses ALTER COLUMN id SET DEFAULT nextval('public.software_licenses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.spam_logs ALTER COLUMN id SET DEFAULT nextval('public.spam_logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.system_note_metadata ALTER COLUMN id SET DEFAULT nextval('public.system_note_metadata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.taggings ALTER COLUMN id SET DEFAULT nextval('public.taggings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.term_agreements ALTER COLUMN id SET DEFAULT nextval('public.term_agreements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.timelogs ALTER COLUMN id SET DEFAULT nextval('public.timelogs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.todos ALTER COLUMN id SET DEFAULT nextval('public.todos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.trending_projects ALTER COLUMN id SET DEFAULT nextval('public.trending_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.u2f_registrations ALTER COLUMN id SET DEFAULT nextval('public.u2f_registrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.uploads ALTER COLUMN id SET DEFAULT nextval('public.uploads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_agent_details ALTER COLUMN id SET DEFAULT nextval('public.user_agent_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_callouts ALTER COLUMN id SET DEFAULT nextval('public.user_callouts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_custom_attributes ALTER COLUMN id SET DEFAULT nextval('public.user_custom_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_preferences ALTER COLUMN id SET DEFAULT nextval('public.user_preferences_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_statuses ALTER COLUMN user_id SET DEFAULT nextval('public.user_statuses_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_synced_attributes_metadata ALTER COLUMN id SET DEFAULT nextval('public.user_synced_attributes_metadata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.users_ops_dashboard_projects ALTER COLUMN id SET DEFAULT nextval('public.users_ops_dashboard_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.users_star_projects ALTER COLUMN id SET DEFAULT nextval('public.users_star_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_feedback ALTER COLUMN id SET DEFAULT nextval('public.vulnerability_feedback_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_identifiers ALTER COLUMN id SET DEFAULT nextval('public.vulnerability_identifiers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrence_identifiers ALTER COLUMN id SET DEFAULT nextval('public.vulnerability_occurrence_identifiers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrence_pipelines ALTER COLUMN id SET DEFAULT nextval('public.vulnerability_occurrence_pipelines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrences ALTER COLUMN id SET DEFAULT nextval('public.vulnerability_occurrences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_scanners ALTER COLUMN id SET DEFAULT nextval('public.vulnerability_scanners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.web_hook_logs ALTER COLUMN id SET DEFAULT nextval('public.web_hook_logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.web_hooks ALTER COLUMN id SET DEFAULT nextval('public.web_hooks_id_seq'::regclass);


--
-- Data for Name: abuse_reports; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.abuse_reports (id, reporter_id, user_id, message, created_at, updated_at, message_html, cached_markdown_version) FROM stdin;
\.


--
-- Name: abuse_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.abuse_reports_id_seq', 1, false);


--
-- Data for Name: appearances; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.appearances (id, title, description, logo, updated_by, header_logo, created_at, updated_at, description_html, cached_markdown_version, new_project_guidelines, new_project_guidelines_html, header_message, header_message_html, footer_message, footer_message_html, message_background_color, message_font_color, favicon) FROM stdin;
\.


--
-- Name: appearances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.appearances_id_seq', 1, false);


--
-- Data for Name: application_setting_terms; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.application_setting_terms (id, cached_markdown_version, terms, terms_html) FROM stdin;
\.


--
-- Name: application_setting_terms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.application_setting_terms_id_seq', 1, false);


--
-- Data for Name: application_settings; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.application_settings (id, default_projects_limit, signup_enabled, gravatar_enabled, sign_in_text, created_at, updated_at, home_page_url, default_branch_protection, help_text, restricted_visibility_levels, version_check_enabled, max_attachment_size, default_project_visibility, default_snippet_visibility, domain_whitelist, user_oauth_applications, after_sign_out_path, session_expire_delay, import_sources, help_page_text, admin_notification_email, shared_runners_enabled, max_artifacts_size, runners_registration_token, max_pages_size, require_two_factor_authentication, two_factor_grace_period, metrics_enabled, metrics_host, metrics_pool_size, metrics_timeout, metrics_method_call_threshold, recaptcha_enabled, recaptcha_site_key, recaptcha_private_key, metrics_port, akismet_enabled, akismet_api_key, metrics_sample_interval, sentry_enabled, sentry_dsn, email_author_in_body, default_group_visibility, repository_checks_enabled, shared_runners_text, metrics_packet_size, disabled_oauth_sign_in_sources, health_check_access_token, send_user_confirmation_email, container_registry_token_expire_delay, after_sign_up_text, user_default_external, elasticsearch_indexing, elasticsearch_search, repository_storages, enabled_git_access_protocol, domain_blacklist_enabled, domain_blacklist, usage_ping_enabled, sign_in_text_html, help_page_text_html, shared_runners_text_html, after_sign_up_text_html, rsa_key_restriction, dsa_key_restriction, ecdsa_key_restriction, ed25519_key_restriction, housekeeping_enabled, housekeeping_bitmaps_enabled, housekeeping_incremental_repack_period, housekeeping_full_repack_period, housekeeping_gc_period, html_emails_enabled, plantuml_url, plantuml_enabled, shared_runners_minutes, repository_size_limit, terminal_max_session_time, unique_ips_limit_per_user, unique_ips_limit_time_window, unique_ips_limit_enabled, default_artifacts_expire_in, elasticsearch_url, elasticsearch_aws, elasticsearch_aws_region, elasticsearch_aws_access_key, elasticsearch_aws_secret_access_key, geo_status_timeout, uuid, polling_interval_multiplier, elasticsearch_experimental_indexer, cached_markdown_version, clientside_sentry_enabled, clientside_sentry_dsn, check_namespace_plan, mirror_max_delay, mirror_max_capacity, mirror_capacity_threshold, prometheus_metrics_enabled, authorized_keys_enabled, help_page_hide_commercial_content, help_page_support_url, slack_app_enabled, slack_app_id, slack_app_secret, slack_app_verification_token, performance_bar_allowed_group_id, allow_group_owners_to_manage_ldap, hashed_storage_enabled, project_export_enabled, auto_devops_enabled, throttle_unauthenticated_enabled, throttle_unauthenticated_requests_per_period, throttle_unauthenticated_period_in_seconds, throttle_authenticated_api_enabled, throttle_authenticated_api_requests_per_period, throttle_authenticated_api_period_in_seconds, throttle_authenticated_web_enabled, throttle_authenticated_web_requests_per_period, throttle_authenticated_web_period_in_seconds, gitaly_timeout_default, gitaly_timeout_medium, gitaly_timeout_fast, mirror_available, default_project_creation, password_authentication_enabled_for_web, password_authentication_enabled_for_git, auto_devops_domain, external_authorization_service_enabled, external_authorization_service_url, external_authorization_service_default_label, pages_domain_verification_enabled, user_default_internal_regex, allow_local_requests_from_hooks_and_services, external_authorization_service_timeout, external_auth_client_cert, encrypted_external_auth_client_key, encrypted_external_auth_client_key_iv, encrypted_external_auth_client_key_pass, encrypted_external_auth_client_key_pass_iv, email_additional_text, enforce_terms, file_template_project_id, pseudonymizer_enabled, hide_third_party_offers, snowplow_enabled, snowplow_collector_uri, snowplow_site_id, snowplow_cookie_domain, instance_statistics_visibility_private, web_ide_clientside_preview_enabled, user_show_add_ssh_key_message, custom_project_templates_group_id, usage_stats_set_by_user_id, receive_max_input_size, diff_max_patch_bytes, archive_builds_in_seconds, commit_email_hostname) FROM stdin;
1	100000	t	t	\N	2018-12-11 22:18:47.279021	2018-12-11 22:18:47.279021	\N	2	\N	--- []\n	t	10	0	0	\N	t	\N	10080	---\n- github\n- bitbucket\n- bitbucket_server\n- gitlab\n- google_code\n- fogbugz\n- git\n- gitlab_project\n- gitea\n- manifest\n	\N	\N	t	100	pqdxV59kjuq3zcc7rzvW	100	f	48	f	localhost	16	10	10	f	\N	\N	8089	f	\N	15	f	\N	f	0	t	\N	1	\N	ue7_8zfkp_L76zGgRa79	f	5	\N	f	f	f	---\n- default\n	\N	f	\N	t					0	0	0	0	t	t	10	50	200	t	\N	f	0	0	0	10	3600	f	30 days	http://localhost:9200	f	us-east-1	\N	\N	10	341be2f2-81a4-4a70-9962-6485f585688c	1.0	\N	12	f	\N	f	300	30	15	t	t	f	\N	f	\N	\N	\N	\N	t	f	t	t	f	3600	3600	f	7200	3600	f	7200	3600	55	30	10	t	2	t	t	\N	f	\N	\N	t	\N	f	0.5	\N	\N	\N	\N	\N	\N	f	\N	f	f	f	\N	\N	\N	f	f	t	\N	\N	\N	102400	\N	users.noreply.10.0.0.201
\.


--
-- Name: application_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.application_settings_id_seq', 1, false);


--
-- Data for Name: approvals; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.approvals (id, merge_request_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: approvals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.approvals_id_seq', 1, false);


--
-- Data for Name: approver_groups; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.approver_groups (id, target_id, target_type, group_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: approver_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.approver_groups_id_seq', 1, false);


--
-- Data for Name: approvers; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.approvers (id, target_id, target_type, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: approvers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.approvers_id_seq', 1, false);


--
-- Data for Name: audit_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.audit_events (id, author_id, type, entity_id, entity_type, details, created_at, updated_at) FROM stdin;
\.


--
-- Name: audit_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.audit_events_id_seq', 1, false);


--
-- Data for Name: award_emoji; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.award_emoji (id, name, user_id, awardable_id, awardable_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: award_emoji_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.award_emoji_id_seq', 1, false);


--
-- Data for Name: badges; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.badges (id, link_url, image_url, project_id, group_id, type, created_at, updated_at) FROM stdin;
\.


--
-- Name: badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.badges_id_seq', 1, false);


--
-- Data for Name: board_assignees; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.board_assignees (id, board_id, assignee_id) FROM stdin;
\.


--
-- Name: board_assignees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.board_assignees_id_seq', 1, false);


--
-- Data for Name: board_group_recent_visits; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.board_group_recent_visits (id, created_at, updated_at, user_id, board_id, group_id) FROM stdin;
\.


--
-- Name: board_group_recent_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.board_group_recent_visits_id_seq', 1, false);


--
-- Data for Name: board_labels; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.board_labels (id, board_id, label_id) FROM stdin;
\.


--
-- Name: board_labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.board_labels_id_seq', 1, false);


--
-- Data for Name: board_project_recent_visits; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.board_project_recent_visits (id, created_at, updated_at, user_id, project_id, board_id) FROM stdin;
\.


--
-- Name: board_project_recent_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.board_project_recent_visits_id_seq', 1, false);


--
-- Data for Name: boards; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.boards (id, project_id, created_at, updated_at, name, milestone_id, group_id, weight) FROM stdin;
\.


--
-- Name: boards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.boards_id_seq', 1, false);


--
-- Data for Name: broadcast_messages; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.broadcast_messages (id, message, starts_at, ends_at, created_at, updated_at, color, font, message_html, cached_markdown_version) FROM stdin;
\.


--
-- Name: broadcast_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.broadcast_messages_id_seq', 1, false);


--
-- Data for Name: chat_names; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.chat_names (id, user_id, service_id, team_id, team_domain, chat_id, chat_name, last_used_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: chat_names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.chat_names_id_seq', 1, false);


--
-- Data for Name: chat_teams; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.chat_teams (id, namespace_id, team_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: chat_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.chat_teams_id_seq', 1, false);


--
-- Data for Name: ci_build_trace_chunks; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_build_trace_chunks (id, build_id, chunk_index, data_store, raw_data) FROM stdin;
\.


--
-- Name: ci_build_trace_chunks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_build_trace_chunks_id_seq', 1, false);


--
-- Data for Name: ci_build_trace_section_names; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_build_trace_section_names (id, project_id, name) FROM stdin;
\.


--
-- Name: ci_build_trace_section_names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_build_trace_section_names_id_seq', 1, false);


--
-- Data for Name: ci_build_trace_sections; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_build_trace_sections (id, project_id, date_start, date_end, byte_start, byte_end, build_id, section_name_id) FROM stdin;
\.


--
-- Name: ci_build_trace_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_build_trace_sections_id_seq', 1, false);


--
-- Data for Name: ci_builds; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_builds (id, status, finished_at, trace, created_at, updated_at, started_at, runner_id, coverage, commit_id, commands, name, options, allow_failure, stage, trigger_request_id, stage_idx, tag, ref, user_id, type, target_url, description, artifacts_file, project_id, artifacts_metadata, erased_by_id, erased_at, artifacts_expire_at, environment, artifacts_size, "when", yaml_variables, queued_at, token, lock_version, coverage_regex, auto_canceled_by_id, retried, stage_id, artifacts_file_store, artifacts_metadata_store, protected, failure_reason, scheduled_at) FROM stdin;
\.


--
-- Name: ci_builds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_builds_id_seq', 1, false);


--
-- Data for Name: ci_builds_metadata; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_builds_metadata (id, build_id, project_id, timeout, timeout_source) FROM stdin;
\.


--
-- Name: ci_builds_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_builds_metadata_id_seq', 1, false);


--
-- Data for Name: ci_builds_runner_session; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_builds_runner_session (id, build_id, url, certificate, "authorization") FROM stdin;
\.


--
-- Name: ci_builds_runner_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_builds_runner_session_id_seq', 1, false);


--
-- Data for Name: ci_group_variables; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_group_variables (id, key, value, encrypted_value, encrypted_value_salt, encrypted_value_iv, group_id, protected, created_at, updated_at) FROM stdin;
\.


--
-- Name: ci_group_variables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_group_variables_id_seq', 1, false);


--
-- Data for Name: ci_job_artifacts; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_job_artifacts (id, project_id, job_id, file_type, size, created_at, updated_at, expire_at, file, file_store, file_sha256, file_format, file_location) FROM stdin;
\.


--
-- Name: ci_job_artifacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_job_artifacts_id_seq', 1, false);


--
-- Data for Name: ci_pipeline_chat_data; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_pipeline_chat_data (id, pipeline_id, chat_name_id, response_url) FROM stdin;
\.


--
-- Name: ci_pipeline_chat_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_pipeline_chat_data_id_seq', 1, false);


--
-- Data for Name: ci_pipeline_schedule_variables; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_pipeline_schedule_variables (id, key, value, encrypted_value, encrypted_value_salt, encrypted_value_iv, pipeline_schedule_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: ci_pipeline_schedule_variables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_pipeline_schedule_variables_id_seq', 1, false);


--
-- Data for Name: ci_pipeline_schedules; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_pipeline_schedules (id, description, ref, cron, cron_timezone, next_run_at, project_id, owner_id, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: ci_pipeline_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_pipeline_schedules_id_seq', 1, false);


--
-- Data for Name: ci_pipeline_variables; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_pipeline_variables (id, key, value, encrypted_value, encrypted_value_salt, encrypted_value_iv, pipeline_id) FROM stdin;
\.


--
-- Name: ci_pipeline_variables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_pipeline_variables_id_seq', 1, false);


--
-- Data for Name: ci_pipelines; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_pipelines (id, ref, sha, before_sha, created_at, updated_at, tag, yaml_errors, committed_at, project_id, status, started_at, finished_at, duration, user_id, lock_version, auto_canceled_by_id, pipeline_schedule_id, source, config_source, protected, failure_reason, iid) FROM stdin;
\.


--
-- Name: ci_pipelines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_pipelines_id_seq', 1, false);


--
-- Data for Name: ci_runner_namespaces; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_runner_namespaces (id, runner_id, namespace_id) FROM stdin;
\.


--
-- Name: ci_runner_namespaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_runner_namespaces_id_seq', 1, false);


--
-- Data for Name: ci_runner_projects; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_runner_projects (id, runner_id, created_at, updated_at, project_id) FROM stdin;
\.


--
-- Name: ci_runner_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_runner_projects_id_seq', 1, false);


--
-- Data for Name: ci_runners; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_runners (id, token, created_at, updated_at, description, contacted_at, active, is_shared, name, version, revision, platform, architecture, run_untagged, locked, access_level, ip_address, maximum_timeout, runner_type) FROM stdin;
\.


--
-- Name: ci_runners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_runners_id_seq', 1, false);


--
-- Data for Name: ci_sources_pipelines; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_sources_pipelines (id, project_id, pipeline_id, source_project_id, source_job_id, source_pipeline_id) FROM stdin;
\.


--
-- Name: ci_sources_pipelines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_sources_pipelines_id_seq', 1, false);


--
-- Data for Name: ci_stages; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_stages (id, project_id, pipeline_id, created_at, updated_at, name, status, lock_version, "position") FROM stdin;
\.


--
-- Name: ci_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_stages_id_seq', 1, false);


--
-- Data for Name: ci_trigger_requests; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_trigger_requests (id, trigger_id, variables, created_at, updated_at, commit_id) FROM stdin;
\.


--
-- Name: ci_trigger_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_trigger_requests_id_seq', 1, false);


--
-- Data for Name: ci_triggers; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_triggers (id, token, created_at, updated_at, project_id, owner_id, description, ref) FROM stdin;
\.


--
-- Name: ci_triggers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_triggers_id_seq', 1, false);


--
-- Data for Name: ci_variables; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ci_variables (id, key, value, encrypted_value, encrypted_value_salt, encrypted_value_iv, project_id, protected, environment_scope) FROM stdin;
\.


--
-- Name: ci_variables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ci_variables_id_seq', 1, false);


--
-- Data for Name: cluster_groups; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.cluster_groups (id, cluster_id, group_id) FROM stdin;
\.


--
-- Name: cluster_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.cluster_groups_id_seq', 1, false);


--
-- Data for Name: cluster_platforms_kubernetes; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.cluster_platforms_kubernetes (id, cluster_id, created_at, updated_at, api_url, ca_cert, namespace, username, encrypted_password, encrypted_password_iv, encrypted_token, encrypted_token_iv, authorization_type) FROM stdin;
\.


--
-- Name: cluster_platforms_kubernetes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.cluster_platforms_kubernetes_id_seq', 1, false);


--
-- Data for Name: cluster_projects; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.cluster_projects (id, project_id, cluster_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: cluster_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.cluster_projects_id_seq', 1, false);


--
-- Data for Name: cluster_providers_gcp; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.cluster_providers_gcp (id, cluster_id, status, num_nodes, created_at, updated_at, status_reason, gcp_project_id, zone, machine_type, operation_id, endpoint, encrypted_access_token, encrypted_access_token_iv, legacy_abac) FROM stdin;
\.


--
-- Name: cluster_providers_gcp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.cluster_providers_gcp_id_seq', 1, false);


--
-- Data for Name: clusters; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.clusters (id, user_id, provider_type, platform_type, created_at, updated_at, enabled, name, environment_scope, cluster_type) FROM stdin;
\.


--
-- Data for Name: clusters_applications_helm; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.clusters_applications_helm (id, cluster_id, created_at, updated_at, status, version, status_reason, encrypted_ca_key, encrypted_ca_key_iv, ca_cert) FROM stdin;
\.


--
-- Name: clusters_applications_helm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.clusters_applications_helm_id_seq', 1, false);


--
-- Data for Name: clusters_applications_ingress; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.clusters_applications_ingress (id, cluster_id, created_at, updated_at, status, ingress_type, version, cluster_ip, status_reason, external_ip) FROM stdin;
\.


--
-- Name: clusters_applications_ingress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.clusters_applications_ingress_id_seq', 1, false);


--
-- Data for Name: clusters_applications_jupyter; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.clusters_applications_jupyter (id, cluster_id, oauth_application_id, status, version, hostname, created_at, updated_at, status_reason) FROM stdin;
\.


--
-- Name: clusters_applications_jupyter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.clusters_applications_jupyter_id_seq', 1, false);


--
-- Data for Name: clusters_applications_knative; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.clusters_applications_knative (id, cluster_id, created_at, updated_at, status, version, hostname, status_reason) FROM stdin;
\.


--
-- Name: clusters_applications_knative_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.clusters_applications_knative_id_seq', 1, false);


--
-- Data for Name: clusters_applications_prometheus; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.clusters_applications_prometheus (id, cluster_id, status, version, status_reason, created_at, updated_at, last_update_started_at) FROM stdin;
\.


--
-- Name: clusters_applications_prometheus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.clusters_applications_prometheus_id_seq', 1, false);


--
-- Data for Name: clusters_applications_runners; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.clusters_applications_runners (id, cluster_id, runner_id, status, created_at, updated_at, version, status_reason, privileged) FROM stdin;
\.


--
-- Name: clusters_applications_runners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.clusters_applications_runners_id_seq', 1, false);


--
-- Name: clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.clusters_id_seq', 1, false);


--
-- Data for Name: clusters_kubernetes_namespaces; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.clusters_kubernetes_namespaces (id, cluster_id, project_id, cluster_project_id, created_at, updated_at, encrypted_service_account_token, encrypted_service_account_token_iv, namespace, service_account_name) FROM stdin;
\.


--
-- Name: clusters_kubernetes_namespaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.clusters_kubernetes_namespaces_id_seq', 1, false);


--
-- Data for Name: container_repositories; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.container_repositories (id, project_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: container_repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.container_repositories_id_seq', 1, false);


--
-- Data for Name: conversational_development_index_metrics; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.conversational_development_index_metrics (id, leader_issues, instance_issues, leader_notes, instance_notes, leader_milestones, instance_milestones, leader_boards, instance_boards, leader_merge_requests, instance_merge_requests, leader_ci_pipelines, instance_ci_pipelines, leader_environments, instance_environments, leader_deployments, instance_deployments, leader_projects_prometheus_active, instance_projects_prometheus_active, leader_service_desk_issues, instance_service_desk_issues, created_at, updated_at, percentage_boards, percentage_ci_pipelines, percentage_deployments, percentage_environments, percentage_issues, percentage_merge_requests, percentage_milestones, percentage_notes, percentage_projects_prometheus_active, percentage_service_desk_issues) FROM stdin;
\.


--
-- Name: conversational_development_index_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.conversational_development_index_metrics_id_seq', 1, false);


--
-- Data for Name: deploy_keys_projects; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.deploy_keys_projects (id, deploy_key_id, project_id, created_at, updated_at, can_push) FROM stdin;
\.


--
-- Name: deploy_keys_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.deploy_keys_projects_id_seq', 1, false);


--
-- Data for Name: deploy_tokens; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.deploy_tokens (id, revoked, read_repository, read_registry, expires_at, created_at, name, token) FROM stdin;
\.


--
-- Name: deploy_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.deploy_tokens_id_seq', 1, false);


--
-- Data for Name: deployments; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.deployments (id, iid, project_id, environment_id, ref, tag, sha, user_id, deployable_id, deployable_type, created_at, updated_at, on_stop, status, finished_at) FROM stdin;
\.


--
-- Name: deployments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.deployments_id_seq', 1, false);


--
-- Data for Name: draft_notes; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.draft_notes (id, merge_request_id, author_id, resolve_discussion, discussion_id, note, "position", original_position, change_position) FROM stdin;
\.


--
-- Name: draft_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.draft_notes_id_seq', 1, false);


--
-- Data for Name: emails; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.emails (id, user_id, email, created_at, updated_at, confirmation_token, confirmed_at, confirmation_sent_at) FROM stdin;
\.


--
-- Name: emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.emails_id_seq', 1, false);


--
-- Data for Name: environments; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.environments (id, project_id, name, created_at, updated_at, external_url, environment_type, state, slug) FROM stdin;
\.


--
-- Name: environments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.environments_id_seq', 1, false);


--
-- Data for Name: epic_issues; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.epic_issues (id, epic_id, issue_id, relative_position) FROM stdin;
\.


--
-- Name: epic_issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.epic_issues_id_seq', 1, false);


--
-- Data for Name: epic_metrics; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.epic_metrics (id, epic_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: epic_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.epic_metrics_id_seq', 1, false);


--
-- Data for Name: epics; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.epics (id, milestone_id, group_id, author_id, assignee_id, iid, cached_markdown_version, updated_by_id, last_edited_by_id, lock_version, start_date, end_date, last_edited_at, created_at, updated_at, title, title_html, description, description_html, start_date_sourcing_milestone_id, due_date_sourcing_milestone_id, start_date_fixed, due_date_fixed, start_date_is_fixed, due_date_is_fixed, state, closed_by_id, closed_at) FROM stdin;
\.


--
-- Name: epics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.epics_id_seq', 1, false);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.events (id, project_id, author_id, target_id, created_at, updated_at, action, target_type) FROM stdin;
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Data for Name: feature_gates; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.feature_gates (id, feature_key, key, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: feature_gates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.feature_gates_id_seq', 1, false);


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.features (id, key, created_at, updated_at) FROM stdin;
\.


--
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.features_id_seq', 1, false);


--
-- Data for Name: fork_network_members; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.fork_network_members (id, fork_network_id, project_id, forked_from_project_id) FROM stdin;
\.


--
-- Name: fork_network_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.fork_network_members_id_seq', 1, false);


--
-- Data for Name: fork_networks; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.fork_networks (id, root_project_id, deleted_root_project_name) FROM stdin;
\.


--
-- Name: fork_networks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.fork_networks_id_seq', 1, false);


--
-- Data for Name: forked_project_links; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.forked_project_links (id, forked_to_project_id, forked_from_project_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: forked_project_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.forked_project_links_id_seq', 1, false);


--
-- Data for Name: gcp_clusters; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.gcp_clusters (id, project_id, user_id, service_id, status, gcp_cluster_size, created_at, updated_at, enabled, status_reason, project_namespace, endpoint, ca_cert, encrypted_kubernetes_token, encrypted_kubernetes_token_iv, username, encrypted_password, encrypted_password_iv, gcp_project_id, gcp_cluster_zone, gcp_cluster_name, gcp_machine_type, gcp_operation_id, encrypted_gcp_token, encrypted_gcp_token_iv) FROM stdin;
\.


--
-- Name: gcp_clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.gcp_clusters_id_seq', 1, false);


--
-- Data for Name: geo_cache_invalidation_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_cache_invalidation_events (id, key) FROM stdin;
\.


--
-- Name: geo_cache_invalidation_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_cache_invalidation_events_id_seq', 1, false);


--
-- Data for Name: geo_event_log; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_event_log (id, created_at, repository_updated_event_id, repository_deleted_event_id, repository_renamed_event_id, repositories_changed_event_id, repository_created_event_id, hashed_storage_migrated_event_id, lfs_object_deleted_event_id, hashed_storage_attachments_event_id, job_artifact_deleted_event_id, upload_deleted_event_id, reset_checksum_event_id, cache_invalidation_event_id) FROM stdin;
\.


--
-- Name: geo_event_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_event_log_id_seq', 1, false);


--
-- Data for Name: geo_hashed_storage_attachments_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_hashed_storage_attachments_events (id, project_id, old_attachments_path, new_attachments_path) FROM stdin;
\.


--
-- Name: geo_hashed_storage_attachments_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_hashed_storage_attachments_events_id_seq', 1, false);


--
-- Data for Name: geo_hashed_storage_migrated_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_hashed_storage_migrated_events (id, project_id, repository_storage_name, old_disk_path, new_disk_path, old_wiki_disk_path, new_wiki_disk_path, old_storage_version, new_storage_version) FROM stdin;
\.


--
-- Name: geo_hashed_storage_migrated_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_hashed_storage_migrated_events_id_seq', 1, false);


--
-- Data for Name: geo_job_artifact_deleted_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_job_artifact_deleted_events (id, job_artifact_id, file_path) FROM stdin;
\.


--
-- Name: geo_job_artifact_deleted_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_job_artifact_deleted_events_id_seq', 1, false);


--
-- Data for Name: geo_lfs_object_deleted_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_lfs_object_deleted_events (id, lfs_object_id, oid, file_path) FROM stdin;
\.


--
-- Name: geo_lfs_object_deleted_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_lfs_object_deleted_events_id_seq', 1, false);


--
-- Data for Name: geo_node_namespace_links; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_node_namespace_links (id, geo_node_id, namespace_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: geo_node_namespace_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_node_namespace_links_id_seq', 1, false);


--
-- Data for Name: geo_node_statuses; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_node_statuses (id, geo_node_id, db_replication_lag_seconds, repositories_synced_count, repositories_failed_count, lfs_objects_count, lfs_objects_synced_count, lfs_objects_failed_count, attachments_count, attachments_synced_count, attachments_failed_count, last_event_id, last_event_date, cursor_last_event_id, cursor_last_event_date, created_at, updated_at, last_successful_status_check_at, status_message, replication_slots_count, replication_slots_used_count, replication_slots_max_retained_wal_bytes, wikis_synced_count, wikis_failed_count, job_artifacts_count, job_artifacts_synced_count, job_artifacts_failed_count, version, revision, repositories_verified_count, repositories_verification_failed_count, wikis_verified_count, wikis_verification_failed_count, lfs_objects_synced_missing_on_primary_count, job_artifacts_synced_missing_on_primary_count, attachments_synced_missing_on_primary_count, repositories_checksummed_count, repositories_checksum_failed_count, repositories_checksum_mismatch_count, wikis_checksummed_count, wikis_checksum_failed_count, wikis_checksum_mismatch_count, storage_configuration_digest, repositories_retrying_verification_count, wikis_retrying_verification_count, projects_count) FROM stdin;
\.


--
-- Name: geo_node_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_node_statuses_id_seq', 1, false);


--
-- Data for Name: geo_nodes; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_nodes (id, "primary", oauth_application_id, enabled, access_key, encrypted_secret_access_key, encrypted_secret_access_key_iv, clone_url_prefix, files_max_capacity, repos_max_capacity, url, selective_sync_type, selective_sync_shards, verification_max_capacity) FROM stdin;
\.


--
-- Name: geo_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_nodes_id_seq', 1, false);


--
-- Data for Name: geo_repositories_changed_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_repositories_changed_events (id, geo_node_id) FROM stdin;
\.


--
-- Name: geo_repositories_changed_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_repositories_changed_events_id_seq', 1, false);


--
-- Data for Name: geo_repository_created_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_repository_created_events (id, project_id, repository_storage_name, repo_path, wiki_path, project_name) FROM stdin;
\.


--
-- Name: geo_repository_created_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_repository_created_events_id_seq', 1, false);


--
-- Data for Name: geo_repository_deleted_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_repository_deleted_events (id, project_id, repository_storage_name, deleted_path, deleted_wiki_path, deleted_project_name) FROM stdin;
\.


--
-- Name: geo_repository_deleted_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_repository_deleted_events_id_seq', 1, false);


--
-- Data for Name: geo_repository_renamed_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_repository_renamed_events (id, project_id, repository_storage_name, old_path_with_namespace, new_path_with_namespace, old_wiki_path_with_namespace, new_wiki_path_with_namespace, old_path, new_path) FROM stdin;
\.


--
-- Name: geo_repository_renamed_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_repository_renamed_events_id_seq', 1, false);


--
-- Data for Name: geo_repository_updated_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_repository_updated_events (id, branches_affected, tags_affected, project_id, source, new_branch, remove_branch, ref) FROM stdin;
\.


--
-- Name: geo_repository_updated_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_repository_updated_events_id_seq', 1, false);


--
-- Data for Name: geo_reset_checksum_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_reset_checksum_events (id, project_id) FROM stdin;
\.


--
-- Name: geo_reset_checksum_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_reset_checksum_events_id_seq', 1, false);


--
-- Data for Name: geo_upload_deleted_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.geo_upload_deleted_events (id, upload_id, file_path, model_id, model_type, uploader) FROM stdin;
\.


--
-- Name: geo_upload_deleted_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.geo_upload_deleted_events_id_seq', 1, false);


--
-- Data for Name: gpg_key_subkeys; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.gpg_key_subkeys (id, gpg_key_id, keyid, fingerprint) FROM stdin;
\.


--
-- Name: gpg_key_subkeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.gpg_key_subkeys_id_seq', 1, false);


--
-- Data for Name: gpg_keys; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.gpg_keys (id, created_at, updated_at, user_id, primary_keyid, fingerprint, key) FROM stdin;
\.


--
-- Name: gpg_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.gpg_keys_id_seq', 1, false);


--
-- Data for Name: gpg_signatures; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.gpg_signatures (id, created_at, updated_at, project_id, gpg_key_id, commit_sha, gpg_key_primary_keyid, gpg_key_user_name, gpg_key_user_email, verification_status, gpg_key_subkey_id) FROM stdin;
\.


--
-- Name: gpg_signatures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.gpg_signatures_id_seq', 1, false);


--
-- Data for Name: group_custom_attributes; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.group_custom_attributes (id, created_at, updated_at, group_id, key, value) FROM stdin;
\.


--
-- Name: group_custom_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.group_custom_attributes_id_seq', 1, false);


--
-- Data for Name: historical_data; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.historical_data (id, date, active_user_count, created_at, updated_at) FROM stdin;
\.


--
-- Name: historical_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.historical_data_id_seq', 1, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.identities (id, extern_uid, provider, user_id, created_at, updated_at, secondary_extern_uid, saml_provider_id) FROM stdin;
\.


--
-- Name: identities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.identities_id_seq', 1, false);


--
-- Data for Name: import_export_uploads; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.import_export_uploads (id, updated_at, project_id, import_file, export_file) FROM stdin;
\.


--
-- Name: import_export_uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.import_export_uploads_id_seq', 1, false);


--
-- Data for Name: index_statuses; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.index_statuses (id, project_id, indexed_at, note, last_commit, created_at, updated_at) FROM stdin;
\.


--
-- Name: index_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.index_statuses_id_seq', 1, false);


--
-- Data for Name: internal_ids; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.internal_ids (id, project_id, usage, last_value, namespace_id) FROM stdin;
\.


--
-- Name: internal_ids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.internal_ids_id_seq', 1, false);


--
-- Data for Name: issue_assignees; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.issue_assignees (user_id, issue_id) FROM stdin;
\.


--
-- Data for Name: issue_links; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.issue_links (id, source_id, target_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: issue_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.issue_links_id_seq', 1, false);


--
-- Data for Name: issue_metrics; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.issue_metrics (id, issue_id, first_mentioned_in_commit_at, first_associated_with_milestone_at, first_added_to_board_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: issue_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.issue_metrics_id_seq', 1, false);


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.issues (id, title, author_id, project_id, created_at, updated_at, description, milestone_id, state, iid, updated_by_id, weight, confidential, due_date, moved_to_id, lock_version, title_html, description_html, time_estimate, relative_position, service_desk_reply_to, cached_markdown_version, last_edited_at, last_edited_by_id, discussion_locked, closed_at, closed_by_id) FROM stdin;
\.


--
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.issues_id_seq', 1, false);


--
-- Data for Name: keys; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.keys (id, user_id, created_at, updated_at, key, title, type, fingerprint, public, last_used_at) FROM stdin;
\.


--
-- Name: keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.keys_id_seq', 1, false);


--
-- Data for Name: label_links; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.label_links (id, label_id, target_id, target_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: label_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.label_links_id_seq', 1, false);


--
-- Data for Name: label_priorities; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.label_priorities (id, project_id, label_id, priority, created_at, updated_at) FROM stdin;
\.


--
-- Name: label_priorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.label_priorities_id_seq', 1, false);


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.labels (id, title, color, project_id, created_at, updated_at, template, description, description_html, type, group_id, cached_markdown_version) FROM stdin;
\.


--
-- Name: labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.labels_id_seq', 1, false);


--
-- Data for Name: ldap_group_links; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.ldap_group_links (id, cn, group_access, group_id, created_at, updated_at, provider, filter) FROM stdin;
\.


--
-- Name: ldap_group_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.ldap_group_links_id_seq', 1, false);


--
-- Data for Name: lfs_file_locks; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.lfs_file_locks (id, project_id, user_id, created_at, path) FROM stdin;
\.


--
-- Name: lfs_file_locks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.lfs_file_locks_id_seq', 1, false);


--
-- Data for Name: lfs_objects; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.lfs_objects (id, oid, size, created_at, updated_at, file, file_store) FROM stdin;
\.


--
-- Name: lfs_objects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.lfs_objects_id_seq', 1, false);


--
-- Data for Name: lfs_objects_projects; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.lfs_objects_projects (id, lfs_object_id, project_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: lfs_objects_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.lfs_objects_projects_id_seq', 1, false);


--
-- Data for Name: licenses; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.licenses (id, data, created_at, updated_at) FROM stdin;
\.


--
-- Name: licenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.licenses_id_seq', 1, false);


--
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.lists (id, board_id, label_id, list_type, "position", created_at, updated_at, user_id, milestone_id) FROM stdin;
\.


--
-- Name: lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.lists_id_seq', 1, false);


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.members (id, access_level, source_id, source_type, user_id, notification_level, type, created_at, updated_at, created_by_id, invite_email, invite_token, invite_accepted_at, requested_at, expires_at, ldap, override) FROM stdin;
\.


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.members_id_seq', 1, false);


--
-- Data for Name: merge_request_diff_commits; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.merge_request_diff_commits (authored_date, committed_date, merge_request_diff_id, relative_order, sha, author_name, author_email, committer_name, committer_email, message) FROM stdin;
\.


--
-- Data for Name: merge_request_diff_files; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.merge_request_diff_files (merge_request_diff_id, relative_order, new_file, renamed_file, deleted_file, too_large, a_mode, b_mode, new_path, old_path, diff, "binary") FROM stdin;
\.


--
-- Data for Name: merge_request_diffs; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.merge_request_diffs (id, state, merge_request_id, created_at, updated_at, base_commit_sha, real_size, head_commit_sha, start_commit_sha, commits_count) FROM stdin;
\.


--
-- Name: merge_request_diffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.merge_request_diffs_id_seq', 1, false);


--
-- Data for Name: merge_request_metrics; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.merge_request_metrics (id, merge_request_id, latest_build_started_at, latest_build_finished_at, first_deployed_to_production_at, merged_at, created_at, updated_at, pipeline_id, merged_by_id, latest_closed_by_id, latest_closed_at) FROM stdin;
\.


--
-- Name: merge_request_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.merge_request_metrics_id_seq', 1, false);


--
-- Data for Name: merge_requests; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.merge_requests (id, target_branch, source_branch, source_project_id, author_id, assignee_id, title, created_at, updated_at, milestone_id, state, merge_status, target_project_id, iid, description, updated_by_id, merge_error, merge_params, merge_when_pipeline_succeeds, merge_user_id, merge_commit_sha, approvals_before_merge, rebase_commit_sha, in_progress_merge_commit_sha, lock_version, title_html, description_html, time_estimate, squash, cached_markdown_version, last_edited_at, last_edited_by_id, head_pipeline_id, merge_jid, discussion_locked, latest_merge_request_diff_id, allow_maintainer_to_push) FROM stdin;
\.


--
-- Data for Name: merge_requests_closing_issues; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.merge_requests_closing_issues (id, merge_request_id, issue_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: merge_requests_closing_issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.merge_requests_closing_issues_id_seq', 1, false);


--
-- Name: merge_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.merge_requests_id_seq', 1, false);


--
-- Data for Name: milestones; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.milestones (id, title, project_id, description, due_date, created_at, updated_at, state, iid, title_html, description_html, start_date, cached_markdown_version, group_id) FROM stdin;
\.


--
-- Name: milestones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.milestones_id_seq', 1, false);


--
-- Data for Name: namespace_statistics; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.namespace_statistics (id, namespace_id, shared_runners_seconds, shared_runners_seconds_last_reset) FROM stdin;
\.


--
-- Name: namespace_statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.namespace_statistics_id_seq', 1, false);


--
-- Data for Name: namespaces; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.namespaces (id, name, path, owner_id, created_at, updated_at, type, description, avatar, membership_lock, share_with_group_lock, visibility_level, request_access_enabled, ldap_sync_status, ldap_sync_error, ldap_sync_last_update_at, ldap_sync_last_successful_update_at, ldap_sync_last_sync_at, description_html, lfs_enabled, parent_id, shared_runners_minutes_limit, repository_size_limit, require_two_factor_authentication, two_factor_grace_period, cached_markdown_version, plan_id, project_creation_level, runners_token, trial_ends_on, file_template_project_id) FROM stdin;
1	root	root	1	2018-12-11 22:18:23.969674	2018-12-11 22:18:23.969674	\N		\N	f	f	20	f	ready	\N	\N	\N	\N		\N	\N	\N	\N	f	48	12	\N	\N	\N	\N	\N
\.


--
-- Name: namespaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.namespaces_id_seq', 1, true);


--
-- Data for Name: note_diff_files; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.note_diff_files (id, diff_note_id, diff, new_file, renamed_file, deleted_file, a_mode, b_mode, new_path, old_path) FROM stdin;
\.


--
-- Name: note_diff_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.note_diff_files_id_seq', 1, false);


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.notes (id, note, noteable_type, author_id, created_at, updated_at, project_id, attachment, line_code, commit_id, noteable_id, system, st_diff, updated_by_id, type, "position", original_position, resolved_at, resolved_by_id, discussion_id, note_html, cached_markdown_version, change_position, resolved_by_push) FROM stdin;
\.


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.notes_id_seq', 1, false);


--
-- Data for Name: notification_settings; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.notification_settings (id, user_id, source_id, source_type, level, created_at, updated_at, new_note, new_issue, reopen_issue, close_issue, reassign_issue, new_merge_request, reopen_merge_request, close_merge_request, reassign_merge_request, merge_merge_request, failed_pipeline, success_pipeline, push_to_merge_request, issue_due, new_epic) FROM stdin;
\.


--
-- Name: notification_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.notification_settings_id_seq', 1, false);


--
-- Data for Name: oauth_access_grants; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, created_at, revoked_at, scopes) FROM stdin;
\.


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.oauth_access_grants_id_seq', 1, false);


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, revoked_at, created_at, scopes) FROM stdin;
\.


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.oauth_access_tokens_id_seq', 1, false);


--
-- Data for Name: oauth_applications; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.oauth_applications (id, name, uid, secret, redirect_uri, scopes, created_at, updated_at, owner_id, owner_type, trusted) FROM stdin;
\.


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.oauth_applications_id_seq', 1, false);


--
-- Data for Name: oauth_openid_requests; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.oauth_openid_requests (id, access_grant_id, nonce) FROM stdin;
\.


--
-- Name: oauth_openid_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.oauth_openid_requests_id_seq', 1, false);


--
-- Data for Name: operations_feature_flags; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.operations_feature_flags (id, project_id, active, created_at, updated_at, name, description) FROM stdin;
\.


--
-- Data for Name: operations_feature_flags_clients; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.operations_feature_flags_clients (id, project_id, token) FROM stdin;
\.


--
-- Name: operations_feature_flags_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.operations_feature_flags_clients_id_seq', 1, false);


--
-- Name: operations_feature_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.operations_feature_flags_id_seq', 1, false);


--
-- Data for Name: packages_maven_metadata; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.packages_maven_metadata (id, package_id, created_at, updated_at, app_group, app_name, app_version, path) FROM stdin;
\.


--
-- Name: packages_maven_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.packages_maven_metadata_id_seq', 1, false);


--
-- Data for Name: packages_package_files; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.packages_package_files (id, package_id, created_at, updated_at, size, file_type, file_store, file_md5, file_sha1, file_name, file) FROM stdin;
\.


--
-- Name: packages_package_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.packages_package_files_id_seq', 1, false);


--
-- Data for Name: packages_packages; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.packages_packages (id, project_id, created_at, updated_at, name, version) FROM stdin;
\.


--
-- Name: packages_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.packages_packages_id_seq', 1, false);


--
-- Data for Name: pages_domains; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.pages_domains (id, project_id, certificate, encrypted_key, encrypted_key_iv, encrypted_key_salt, domain, verified_at, verification_code, enabled_until) FROM stdin;
\.


--
-- Name: pages_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.pages_domains_id_seq', 1, false);


--
-- Data for Name: path_locks; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.path_locks (id, path, project_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: path_locks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.path_locks_id_seq', 1, false);


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.personal_access_tokens (id, user_id, token, name, revoked, expires_at, created_at, updated_at, scopes, impersonation, token_digest) FROM stdin;
\.


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.plans (id, created_at, updated_at, name, title, active_pipelines_limit, pipeline_size_limit) FROM stdin;
\.


--
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.plans_id_seq', 1, false);


--
-- Data for Name: programming_languages; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.programming_languages (id, name, color, created_at) FROM stdin;
\.


--
-- Name: programming_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.programming_languages_id_seq', 1, false);


--
-- Data for Name: project_authorizations; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_authorizations (user_id, project_id, access_level) FROM stdin;
\.


--
-- Data for Name: project_auto_devops; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_auto_devops (id, project_id, created_at, updated_at, enabled, domain, deploy_strategy) FROM stdin;
\.


--
-- Name: project_auto_devops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.project_auto_devops_id_seq', 1, false);


--
-- Data for Name: project_ci_cd_settings; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_ci_cd_settings (id, project_id, group_runners_enabled) FROM stdin;
\.


--
-- Name: project_ci_cd_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.project_ci_cd_settings_id_seq', 1, false);


--
-- Data for Name: project_custom_attributes; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_custom_attributes (id, created_at, updated_at, project_id, key, value) FROM stdin;
\.


--
-- Name: project_custom_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.project_custom_attributes_id_seq', 1, false);


--
-- Data for Name: project_deploy_tokens; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_deploy_tokens (id, project_id, deploy_token_id, created_at) FROM stdin;
\.


--
-- Name: project_deploy_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.project_deploy_tokens_id_seq', 1, false);


--
-- Data for Name: project_features; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_features (id, project_id, merge_requests_access_level, issues_access_level, wiki_access_level, snippets_access_level, builds_access_level, created_at, updated_at, repository_access_level, pages_access_level) FROM stdin;
\.


--
-- Name: project_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.project_features_id_seq', 1, false);


--
-- Data for Name: project_group_links; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_group_links (id, project_id, group_id, created_at, updated_at, group_access, expires_at) FROM stdin;
\.


--
-- Name: project_group_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.project_group_links_id_seq', 1, false);


--
-- Data for Name: project_import_data; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_import_data (id, project_id, data, encrypted_credentials, encrypted_credentials_iv, encrypted_credentials_salt) FROM stdin;
\.


--
-- Name: project_import_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.project_import_data_id_seq', 1, false);


--
-- Data for Name: project_mirror_data; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_mirror_data (id, project_id, retry_count, last_update_started_at, last_update_scheduled_at, next_execution_timestamp, status, jid, last_error, last_update_at, last_successful_update_at) FROM stdin;
\.


--
-- Name: project_mirror_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.project_mirror_data_id_seq', 1, false);


--
-- Data for Name: project_repository_states; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_repository_states (id, project_id, repository_verification_checksum, wiki_verification_checksum, last_repository_verification_failure, last_wiki_verification_failure, repository_retry_at, wiki_retry_at, repository_retry_count, wiki_retry_count) FROM stdin;
\.


--
-- Name: project_repository_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.project_repository_states_id_seq', 1, false);


--
-- Data for Name: project_statistics; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_statistics (id, project_id, namespace_id, commit_count, storage_size, repository_size, lfs_objects_size, build_artifacts_size, shared_runners_seconds, shared_runners_seconds_last_reset) FROM stdin;
\.


--
-- Name: project_statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.project_statistics_id_seq', 1, false);


--
-- Data for Name: project_tracing_settings; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.project_tracing_settings (id, created_at, updated_at, project_id, external_url) FROM stdin;
\.


--
-- Name: project_tracing_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.project_tracing_settings_id_seq', 1, false);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.projects (id, name, path, description, created_at, updated_at, creator_id, namespace_id, last_activity_at, import_url, visibility_level, archived, avatar, import_status, merge_requests_template, star_count, merge_requests_rebase_enabled, import_type, import_source, approvals_before_merge, reset_approvals_on_push, merge_requests_ff_only_enabled, issues_template, mirror, mirror_last_update_at, mirror_last_successful_update_at, mirror_user_id, import_error, ci_id, shared_runners_enabled, runners_token, build_coverage_regex, build_allow_git_fetch, build_timeout, mirror_trigger_builds, pending_delete, public_builds, last_repository_check_failed, last_repository_check_at, container_registry_enabled, only_allow_merge_if_pipeline_succeeds, has_external_issue_tracker, repository_storage, repository_read_only, request_access_enabled, has_external_wiki, ci_config_path, lfs_enabled, description_html, only_allow_merge_if_all_discussions_are_resolved, repository_size_limit, printing_merge_request_link_enabled, auto_cancel_pending_pipelines, service_desk_enabled, import_jid, cached_markdown_version, delete_error, last_repository_updated_at, disable_overriding_approvers_per_merge_request, storage_version, resolve_outdated_diff_discussions, remote_mirror_available_overridden, only_mirror_protected_branches, pull_mirror_available_overridden, jobs_cache_index, external_authorization_classification_label, mirror_overwrites_diverged_branches, pages_https_only, external_webhook_token, packages_enabled, merge_requests_author_approval, pool_repository_id) FROM stdin;
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, false);


--
-- Data for Name: prometheus_alert_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.prometheus_alert_events (id, project_id, prometheus_alert_id, started_at, ended_at, status, payload_key) FROM stdin;
\.


--
-- Name: prometheus_alert_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.prometheus_alert_events_id_seq', 1, false);


--
-- Data for Name: prometheus_alerts; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.prometheus_alerts (id, created_at, updated_at, threshold, operator, environment_id, project_id, prometheus_metric_id) FROM stdin;
\.


--
-- Name: prometheus_alerts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.prometheus_alerts_id_seq', 1, false);


--
-- Data for Name: prometheus_metrics; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.prometheus_metrics (id, project_id, title, query, y_label, unit, legend, "group", created_at, updated_at, common, identifier) FROM stdin;
1	\N	Throughput	sum(rate(nginx_upstream_responses_total{upstream=~"%{kube_namespace}-%{ci_environment_slug}-.*"}[2m])) by (status_code)	Requests / Sec	req / sec	Status Code	-1	2018-12-11 22:18:24.141287+00	2018-12-11 22:18:24.141287+00	t	response_metrics_nginx_ingress_throughput_status_code
2	\N	Latency	avg(nginx_upstream_response_msecs_avg{upstream=~"%{kube_namespace}-%{ci_environment_slug}-.*"})	Latency (ms)	ms	Pod average	-1	2018-12-11 22:18:24.149336+00	2018-12-11 22:18:24.149336+00	t	response_metrics_nginx_ingress_latency_pod_average
3	\N	HTTP Error Rate	sum(rate(nginx_upstream_responses_total{status_code="5xx", upstream=~"%{kube_namespace}-%{ci_environment_slug}-.*"}[2m])) / sum(rate(nginx_upstream_responses_total{upstream=~"%{kube_namespace}-%{ci_environment_slug}-.*"}[2m])) * 100	HTTP Errors	%	5xx Errors	-1	2018-12-11 22:18:24.154126+00	2018-12-11 22:18:24.154126+00	t	response_metrics_nginx_ingress_http_error_rate
4	\N	Throughput	sum(rate(haproxy_frontend_http_requests_total{%{environment_filter}}[2m])) by (code)	Requests / Sec	req / sec	Status Code	-2	2018-12-11 22:18:24.159229+00	2018-12-11 22:18:24.159229+00	t	response_metrics_ha_proxy_throughput_status_code
5	\N	HTTP Error Rate	sum(rate(haproxy_frontend_http_responses_total{code="5xx",%{environment_filter}}[2m])) / sum(rate(haproxy_frontend_http_responses_total{%{environment_filter}}[2m]))	Error Rate (%)	%	HTTP Errors	-2	2018-12-11 22:18:24.164049+00	2018-12-11 22:18:24.164049+00	t	response_metrics_ha_proxy_http_error_rate
6	\N	Throughput	sum(aws_elb_request_count_sum{%{environment_filter}}) / 60	Requests / Sec	req / sec	Total	-3	2018-12-11 22:18:24.168915+00	2018-12-11 22:18:24.168915+00	t	response_metrics_aws_elb_throughput_requests
7	\N	Latency	avg(aws_elb_latency_average{%{environment_filter}}) * 1000	Latency (ms)	ms	Average	-3	2018-12-11 22:18:24.173623+00	2018-12-11 22:18:24.173623+00	t	response_metrics_aws_elb_latency_average
8	\N	HTTP Error Rate	sum(aws_elb_httpcode_backend_5_xx_sum{%{environment_filter}}) / sum(aws_elb_request_count_sum{%{environment_filter}})	Error Rate (%)	%	HTTP Errors	-3	2018-12-11 22:18:24.181288+00	2018-12-11 22:18:24.181288+00	t	response_metrics_aws_elb_http_error_rate
9	\N	Throughput	sum(rate(nginx_server_requests{server_zone!="*", server_zone!="_", %{environment_filter}}[2m])) by (code)	Requests / Sec	req / sec	Status Code	-4	2018-12-11 22:18:24.186832+00	2018-12-11 22:18:24.186832+00	t	response_metrics_nginx_throughput_status_code
10	\N	Latency	avg(nginx_server_requestMsec{%{environment_filter}})	Latency (ms)	ms	Upstream	-4	2018-12-11 22:18:24.191929+00	2018-12-11 22:18:24.191929+00	t	response_metrics_nginx_latency
11	\N	HTTP Error Rate	sum(rate(nginx_server_requests{code="5xx", %{environment_filter}}[2m]))	HTTP 500 Errors / Sec	errors / sec	HTTP Errors	-4	2018-12-11 22:18:24.196955+00	2018-12-11 22:18:24.196955+00	t	response_metrics_nginx_http_error_rate
12	\N	Memory Usage (Total)	avg(sum(container_memory_usage_bytes{container_name!="POD",pod_name=~"^%{ci_environment_slug}-(.*)",namespace="%{kube_namespace}"}) by (job)) without (job)  /1024/1024/1024	Total Memory Used	GB	Total	-5	2018-12-11 22:18:24.202053+00	2018-12-11 22:18:24.202053+00	t	system_metrics_kubernetes_container_memory_total
13	\N	Core Usage (Total)	avg(sum(rate(container_cpu_usage_seconds_total{container_name!="POD",pod_name=~"^%{ci_environment_slug}-(.*)",namespace="%{kube_namespace}"}[15m])) by (job)) without (job)	Total Cores	cores	Total	-5	2018-12-11 22:18:24.20718+00	2018-12-11 22:18:24.20718+00	t	system_metrics_kubernetes_container_cores_total
14	\N	Memory Usage (Pod Average)	avg(sum(container_memory_usage_bytes{container_name!="POD",pod_name=~"^%{ci_environment_slug}-([^c].*|c([^a]|a([^n]|n([^a]|a([^r]|r[^y])))).*|)-(.*)",namespace="%{kube_namespace}"}) by (job)) without (job) / count(avg(container_memory_usage_bytes{container_name!="POD",pod_name=~"^%{ci_environment_slug}-([^c].*|c([^a]|a([^n]|n([^a]|a([^r]|r[^y])))).*|)-(.*)",namespace="%{kube_namespace}"}) without (job)) /1024/1024	Memory Used per Pod	MB	Pod average	-5	2018-12-11 22:18:24.215134+00	2018-12-11 22:18:24.215134+00	t	system_metrics_kubernetes_container_memory_average
15	\N	Canary: Memory Usage (Pod Average)	avg(sum(container_memory_usage_bytes{container_name!="POD",pod_name=~"^%{ci_environment_slug}-canary-(.*)",namespace="%{kube_namespace}"}) by (job)) without (job) / count(avg(container_memory_usage_bytes{container_name!="POD",pod_name=~"^%{ci_environment_slug}-canary-(.*)",namespace="%{kube_namespace}"}) without (job)) /1024/1024	Memory Used per Pod	MB	Pod average	-5	2018-12-11 22:18:24.220288+00	2018-12-11 22:18:24.220288+00	t	system_metrics_kubernetes_container_memory_average_canary
16	\N	Core Usage (Pod Average)	avg(sum(rate(container_cpu_usage_seconds_total{container_name!="POD",pod_name=~"^%{ci_environment_slug}-([^c].*|c([^a]|a([^n]|n([^a]|a([^r]|r[^y])))).*|)-(.*)",namespace="%{kube_namespace}"}[15m])) by (job)) without (job) / count(sum(rate(container_cpu_usage_seconds_total{container_name!="POD",pod_name=~"^%{ci_environment_slug}-([^c].*|c([^a]|a([^n]|n([^a]|a([^r]|r[^y])))).*|)-(.*)",namespace="%{kube_namespace}"}[15m])) by (pod_name))	Cores per Pod	cores	Pod average	-5	2018-12-11 22:18:24.225582+00	2018-12-11 22:18:24.225582+00	t	system_metrics_kubernetes_container_core_usage
17	\N	Canary: Core Usage (Pod Average)	avg(sum(rate(container_cpu_usage_seconds_total{container_name!="POD",pod_name=~"^%{ci_environment_slug}-canary-(.*)",namespace="%{kube_namespace}"}[15m])) by (job)) without (job) / count(sum(rate(container_cpu_usage_seconds_total{container_name!="POD",pod_name=~"^%{ci_environment_slug}-canary-(.*)",namespace="%{kube_namespace}"}[15m])) by (pod_name))	Cores per Pod	cores	Pod average	-5	2018-12-11 22:18:24.230745+00	2018-12-11 22:18:24.230745+00	t	system_metrics_kubernetes_container_core_usage_canary
\.


--
-- Name: prometheus_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.prometheus_metrics_id_seq', 17, true);


--
-- Data for Name: protected_branch_merge_access_levels; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.protected_branch_merge_access_levels (id, protected_branch_id, access_level, created_at, updated_at, user_id, group_id) FROM stdin;
\.


--
-- Name: protected_branch_merge_access_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.protected_branch_merge_access_levels_id_seq', 1, false);


--
-- Data for Name: protected_branch_push_access_levels; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.protected_branch_push_access_levels (id, protected_branch_id, access_level, created_at, updated_at, user_id, group_id) FROM stdin;
\.


--
-- Name: protected_branch_push_access_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.protected_branch_push_access_levels_id_seq', 1, false);


--
-- Data for Name: protected_branch_unprotect_access_levels; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.protected_branch_unprotect_access_levels (id, protected_branch_id, access_level, user_id, group_id) FROM stdin;
\.


--
-- Name: protected_branch_unprotect_access_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.protected_branch_unprotect_access_levels_id_seq', 1, false);


--
-- Data for Name: protected_branches; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.protected_branches (id, project_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: protected_branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.protected_branches_id_seq', 1, false);


--
-- Data for Name: protected_environment_deploy_access_levels; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.protected_environment_deploy_access_levels (id, created_at, updated_at, access_level, protected_environment_id, user_id, group_id) FROM stdin;
\.


--
-- Name: protected_environment_deploy_access_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.protected_environment_deploy_access_levels_id_seq', 1, false);


--
-- Data for Name: protected_environments; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.protected_environments (id, project_id, created_at, updated_at, name) FROM stdin;
\.


--
-- Name: protected_environments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.protected_environments_id_seq', 1, false);


--
-- Data for Name: protected_tag_create_access_levels; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.protected_tag_create_access_levels (id, protected_tag_id, access_level, user_id, group_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: protected_tag_create_access_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.protected_tag_create_access_levels_id_seq', 1, false);


--
-- Data for Name: protected_tags; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.protected_tags (id, project_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: protected_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.protected_tags_id_seq', 1, false);


--
-- Data for Name: push_event_payloads; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.push_event_payloads (commit_count, event_id, action, ref_type, commit_from, commit_to, ref, commit_title) FROM stdin;
\.


--
-- Data for Name: push_rules; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.push_rules (id, force_push_regex, delete_branch_regex, commit_message_regex, deny_delete_tag, project_id, created_at, updated_at, author_email_regex, member_check, file_name_regex, is_sample, max_file_size, prevent_secrets, branch_name_regex, reject_unsigned_commits, commit_committer_check, regexp_uses_re2, commit_message_negative_regex) FROM stdin;
\.


--
-- Name: push_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.push_rules_id_seq', 1, false);


--
-- Data for Name: redirect_routes; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.redirect_routes (id, source_id, source_type, path, created_at, updated_at) FROM stdin;
\.


--
-- Name: redirect_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.redirect_routes_id_seq', 1, false);


--
-- Data for Name: releases; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.releases (id, tag, description, project_id, created_at, updated_at, description_html, cached_markdown_version) FROM stdin;
\.


--
-- Name: releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.releases_id_seq', 1, false);


--
-- Data for Name: remote_mirrors; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.remote_mirrors (id, project_id, url, enabled, update_status, last_update_at, last_successful_update_at, last_error, encrypted_credentials, encrypted_credentials_iv, encrypted_credentials_salt, created_at, updated_at, last_update_started_at, only_protected_branches, remote_name) FROM stdin;
\.


--
-- Name: remote_mirrors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.remote_mirrors_id_seq', 1, false);


--
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.repositories (id, shard_id, disk_path) FROM stdin;
\.


--
-- Name: repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.repositories_id_seq', 1, false);


--
-- Data for Name: repository_languages; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.repository_languages (project_id, programming_language_id, share) FROM stdin;
\.


--
-- Data for Name: resource_label_events; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.resource_label_events (id, action, issue_id, merge_request_id, epic_id, label_id, user_id, created_at, cached_markdown_version, reference, reference_html) FROM stdin;
\.


--
-- Name: resource_label_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.resource_label_events_id_seq', 1, false);


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.routes (id, source_id, source_type, path, created_at, updated_at, name) FROM stdin;
1	1	Namespace	root	2018-12-11 22:18:23.982881	2018-12-11 22:18:23.982881	root
\.


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.routes_id_seq', 1, true);


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.saml_providers (id, group_id, enabled, certificate_fingerprint, sso_url) FROM stdin;
\.


--
-- Name: saml_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.saml_providers_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.schema_migrations (version) FROM stdin;
20181123042307
20160610201627
20170502135553
20161020083353
20170803130232
20171204204233
20170130204620
20170809133343
20161206153753
20160509201028
20180515121227
20160225090018
20170407135259
20181016152238
20170622135451
20151210125930
20170506185517
20180115201419
20160412173416
20180511131058
20170407122426
20150806104937
20170502065653
20180503150427
20180815170510
20160703180340
20160209130428
20170210062829
20171214144320
20170126174819
20150516060434
20160608155312
20160615191922
20180607071808
20151105094515
20160817154936
20141121133009
20151210030143
20150502064022
20140428105831
20151026182941
20180613081317
20160801163421
20160722221922
20150730122406
20141216155758
20180517082340
20170426181740
20161018124658
20150211174341
20170524161101
20161114024742
20170407140450
20180831164904
20180223120443
20140611135229
20150116234545
20171207185153
20161206003819
20160803161903
20170622162730
20170428064307
20180628124813
20160504112519
20160305220806
20160819232256
20150310194358
20160301174731
20160615142710
20160419120017
20170717074009
20160516174813
20180503193953
20161124111390
20180426102016
20161201001911
20170419001229
20170413035209
20180101160629
20170502091007
20180503175053
20170503004425
20180416155103
20180601213245
20170802013652
20160227120001
20160610204158
20180216120020
20180425131009
20170901071411
20151103134857
20170623080805
20160705055308
20180214155405
20180508135515
20151103133339
20160508215820
20151106000015
20170421102337
20181009190428
20151210125929
20170503140201
20150425164647
20170827123848
20170521184006
20180702134423
20180102220145
20140416074002
20180813101999
20161031155516
20160412173417
20171106151218
20160525205328
20160713222618
20171103000000
20180713092803
20180629153018
20160226114608
20160608211215
20170727123534
20150914215247
20171216112339
20151016195706
20170831092813
20161213172958
20150916114643
20150125163100
20150423033240
20180901200537
20160831223750
20171006090001
20150812080800
20180723135214
20161207231620
20160413115152
20170124193205
20161209165216
20180420010616
20160119111158
20170924094327
20160412173418
20160817133006
20170825154015
20170608152748
20161124141322
20170217151949
20170622135728
20180504195842
20180718005113
20170904092148
20151023144219
20151228150906
20170516153305
20160705055254
20170724214302
20140415124820
20180910153413
20160728103734
20151110125604
20170407114956
20170608152747
20160106162223
20170828093725
20160314143402
20180201110056
20180417101040
20170928133643
20170927122209
20141006143943
20160120172143
20151109100728
20181025115728
20160608195742
20171106171453
20160902122721
20170918072949
20160106164438
20171222183504
20150429002313
20180406204716
20171106133143
20170523091700
20160831214002
20170404163427
20161202152035
20160810142633
20160616102642
20170405080720
20171124132536
20170330141723
20161130101252
20180327101207
20170120131253
20180508055821
20160808085602
20161017095000
20161106185620
20160328121138
20170425112128
20160119145451
20170809142252
20180625113853
20180831164910
20170127032550
20180403035759
20141217125223
20180925200829
20160518200441
20170602154813
20171106101200
20180515005612
20160504091942
20180531185349
20180831164909
20170312114329
20180216120010
20170217151947
20180216120040
20171114160005
20160316123110
20150918161719
20181014203236
20170313213916
20160527020117
20170531180233
20180223144945
20180209165249
20161223034646
20150817163600
20180508102840
20160907131111
20160121030729
20161227192806
20150915001905
20170523121229
20170918111708
20171212203433
20141121161704
20170406114958
20151210125232
20180612103626
20170906133745
20171211145425
20151201203948
20150206181414
20170725145659
20180320182229
20180424160449
20151231202530
20170613154149
20151020145526
20180531220618
20160314114439
20150205211843
20160819221833
20151002121400
20160316192622
20151210125927
20161024042317
20180109183319
20170918072948
20181023104858
20170914135630
20170317203554
20150116234544
20161206153754
20170506091344
20170329095325
20160616103005
20160801163709
20161206153749
20160808085531
20160705054938
20160302152808
20160328112808
20160725083350
20171220191323
20170312114529
20180717125853
20151002122943
20170503004426
20160202164642
20151016195451
20150509180749
20180425205249
20160522215720
20170423064036
20171012125712
20160915042921
20170503022548
20161006104309
20150213121042
20170909090114
20141226080412
20161209153400
20180413022611
20160830203109
20171006090010
20160920160832
20180704204006
20170824162758
20171101130535
20171114161720
20180711103851
20160415133440
20160407120251
20170919211300
20151109134916
20171216111734
20160713205315
20151210125932
20171012101043
20181019032400
20160508194200
20180227182112
20161220141214
20140729134820
20140914145549
20181101144347
20170305180853
20180626125654
20170320173259
20181019032408
20170731183033
20151221234414
20150306023112
20161202152031
20160830232601
20160227120047
20171229225929
20150920010715
20150425164648
20150411000035
20170720130522
20151007120511
20151023112551
20160316204731
20151104105513
20170425112628
20171006090100
20160217100506
20161020075734
20150324155957
20151109134526
20170707184244
20171215113714
20161031181638
20170503114228
20170614115405
20160328115649
20170314082049
20140729145339
20170307125949
20151005075649
20161115173905
20160913162434
20160705055809
20180927073410
20160329144452
20180503175054
20160129155512
20170927161718
20160721081015
20160416182152
20170707184243
20160320204112
20170508190732
20181019105553
20180521171529
20180530135500
20170601163708
20180221151752
20170710083355
20151210125931
20160901213340
20150417121913
20170928100231
20181005125926
20170620064728
20160610211845
20180308052825
20161206153751
20160610204157
20160331133914
20180831164905
20161124111402
20180702124358
20160718153603
20180924141949
20151019111551
20170217132157
20180711103922
20170828135939
20160610140403
20151210072243
20180101160630
20150827121444
20160802010328
20171031100710
20180222043024
20141118150935
20170816133938
20170913131410
20170301195939
20160716115710
20170525132202
20160128233227
20151203162133
20171106132212
20170519102115
20150417122318
20150916145038
20171124125748
20160425045124
20160716115711
20160419122101
20150609141121
20160811172945
20170918222253
20160705055813
20160310185910
20160729173930
20170530130129
20180910115836
20171122131600
20160804150737
20161118183841
20180125214301
20170731175128
20170124174637
20160615173316
20180425075446
20180105212544
20180710162338
20170309173138
20170305203726
20180420010016
20170824101926
20160217174422
20170921115009
20170503021915
20140729140420
20180508100222
20150425164651
20160715132507
20160416180807
20161207231626
20161025231710
20170525130758
20150327223628
20180524132016
20151020173516
20180319190020
20180608091413
20160212123307
20161128095517
20160223192159
20150421120000
20160519203051
20170216141440
20170816153940
20180726172057
20161019190736
20170406115029
20180814153625
20170222111732
20161201160452
20160824124900
20180216120030
20160122185421
20180924190739
20160610301627
20170525174156
20171025110159
20150425164649
20151103134958
20180430101916
20160315135439
20180326202229
20171114162227
20170619144837
20160926145521
20180503141722
20160128212447
20170711145320
20160308212903
20160109054846
20171121135738
20180808162000
20170807071105
20160823213309
20180201102129
20180511090724
20150713160110
20160629025435
20180720023512
20180103123548
20170809134534
20170131221752
20160628085157
20150411180045
20150824002011
20170929131201
20160210105555
20171116135628
20160229193553
20160302151724
20150902001023
20161228135550
20170121123724
20180119135717
20140914113604
20150918084513
20150213114800
20160620115026
20151002122929
20180523042841
20161021114307
20150924125150
20160621123729
20180305095250
20170927095921
20180323150945
20170928124105
20160603075128
20170503140202
20180417101940
20170410133135
20180907015926
20180722103201
20160818205718
20181108091549
20170516183131
20180129193323
20180705160945
20170703102400
20170217151948
20160715134306
20170327091750
20170820120108
20160220123949
20170720111708
20160727163552
20161007073613
20160724205507
20180608110058
20170210075922
20160309140734
20170816133940
20180815160409
20151013092124
20160825052008
20160314094147
20151016131433
20150413192223
20180529093006
20160805041956
20180226050030
20160222153918
20171017145932
20170905112933
20180208183958
20151008130321
20160614182521
20170427215854
20180831164907
20170929080234
20151218154042
20150814065925
20150930001110
20180216120050
20161103171205
20160901141443
20170706151212
20171004121444
20151005162154
20160804142904
20180122162010
20140729152420
20170328010804
20150313012111
20150529150354
20180503131624
20170918223303
20160728081025
20180418053107
20150930095736
20151231152326
20140502115131
20170720130749
20170717200542
20180216120000
20151229102248
20171006220837
20150610065936
20161020180657
20160713200638
20171106155656
20161228124936
20180815175440
20170315174634
20150327150017
20180201145907
20181023144439
20180912111628
20140313092127
20151209145909
20161017091941
20160324020319
20171114160904
20180330121048
20150916000405
20170329095907
20161128142110
20171013094327
20170222143603
20160412140240
20170204181513
20160119112418
20180906101639
20150920161119
20180815040323
20160823083941
20160816161312
20141205134006
20180215181245
20170222143500
20150213104043
20150327122227
20170525130346
20171006091000
20140907220153
20171106133911
20140903115954
20150225065047
20160913212128
20150320234437
20160707104333
20150328132231
20160301124843
20151020173906
20160516224534
20180206200543
20170629171610
20181106135939
20150425173433
20170329124448
20170503023315
20170909150936
20160118232755
20180502122856
20160310124959
20171124125042
20160610194713
20160823081327
20161117114805
20151019111703
20160827011312
20181015155839
20170830131015
20150206222854
20180916011959
20161223034433
20170301205639
20171230123729
20151008143519
20170130221926
20151209144329
20160129135155
20170506085040
20160727191041
20161018024215
20150331183602
20151103001141
20180119160751
20161020075830
20170602154736
20170214084746
20151118162244
20180405142733
20150425164646
20161128161412
20170713104829
20151228175719
20160530150109
20180308125206
20160225101956
20160603182247
20181016141739
20161201155511
20161019213545
20161014173530
20180924201039
20160331223143
20160914131004
20170508153950
20160715230841
20151224123230
20160508221410
20150301014758
20170912113435
20150219004514
20180503200320
20170503004125
20160118155830
20160421130527
20150717130904
20140414131055
20170720122741
20151229112614
20170817123339
20170210103609
20180301010859
20160712171823
20150924125436
20140407135544
20170204172458
20180302152117
20160509091049
20181022135539
20140416185734
20170830130119
20151228111122
20170616133147
20170418103908
20170918140927
20150425164650
20150406133311
20170222143317
20170206115204
20160819221631
20161103191444
20161221152132
20161012180455
20160307221555
20161031174110
20160317092222
20141223135007
20160415062917
20150529111607
20170316061730
20151008110232
20170216135621
20151005150751
20180910153412
20170424142900
20151230132518
20161226122833
20180423204600
20171115164540
20161212142807
20160919145149
20151215132013
20171106150657
20170830125940
20171114161914
20170825104051
20160508202603
20180901171833
20180417090132
20160725104452
20171106135924
20181017001059
20170825015534
20180306134842
20150211172122
20170816143940
20160528043124
20160204144558
20151028152939
20161010142410
20161124111395
20150108073740
20151012173029
20150217123345
20170622130029
20160830211132
20160810102349
20161130095245
20151002112914
20180408143354
20170301125302
20150306023106
20170424095707
20170301101006
20170526185602
20160705054952
20150818213832
20170121130655
20141007100818
20170124193147
20171123094802
20170524125940
20181002172433
20170507205316
20180807153545
20160824103857
20170622132212
20171121144800
20160725104020
20160508215920
20150620233230
20180219153455
20150826001931
20170315194013
20181010235606
20170503184421
20170322013926
20180212030105
20170816234252
20161113184239
20170402231018
20170606154216
20170426175636
20171114150259
20151116144118
20140730111702
20150930110012
20170316163845
20140625115202
20150223022001
20171127151038
20180113220114
20180214093516
20160603180330
20180116193854
20160617301627
20170502140503
20170425114731
20170503185032
20161031171301
20171206221519
20160616103948
20160113111034
20170511082759
20160919144305
20170608171156
20160831214543
20150209222013
20170504182103
20170622135628
20180305144721
20151210125928
20181005110927
20160616084004
20160202091601
20180831164908
20170707183807
20170531202042
20170504102911
20180213131630
20170603200744
20160829114652
20181026143227
20180309121820
20170210131347
20161017125927
20160727193336
20170809161910
20171222115326
20140914173417
20170206071414
20171019141859
20151008123042
20160715154212
20141126120926
20180228172924
20161007133303
20180813102000
20170511083824
20161207231621
20170820100558
20180424134533
20180503193542
20170925184228
20180309160427
20170427103502
20160715204316
20180424090541
20170620065449
20160705163108
20151203162134
20140502125220
20161018024550
20151114113410
20170815221154
20170211073944
20170324160416
20180916014356
20170518231126
20171128214150
20180306074045
20170516165238
20170516181025
20161128170531
20170815060945
20171005130944
20171123101020
20181107054254
20180212101828
20170406111121
20180809195358
20170425121605
20171207150300
20170913180600
20180523125103
20170106172224
20180529152628
20180305100050
20180603190921
20180212102028
20180514161336
20170209140523
20170511100900
20180405101928
20161221153951
20180604123514
20180216121030
20171123101046
20170828170502
20170526185921
20170214111112
20180119121225
20180204200836
20170607121233
20170425130047
20170306170512
20170104150317
20171221140220
20180619121030
20171213160445
20161221140236
20180704145007
20170627101016
20170406142253
20170526185901
20170907170235
20170503004427
20180502134117
20180629191052
20170609183112
20170106142508
20171106133144
20170215200045
20170831195038
20170508170547
20170921101004
20171207150343
20171205190711
20170412174900
20171207150344
20170525140254
20171026082505
20171121160421
20180521162137
20170807160457
20181026091631
20170523073948
20170717111152
20161011222551
20171215121205
20181014121030
20170511101000
20170526185858
20161109150329
20170531203055
20180914162043
20181013005024
20170206101030
20170926150348
20170206101007
20170502101023
20170807190736
20180301084653
20170612071012
20180914201132
20180409170809
20170728101014
20180816161409
20170510101043
20170717150329
20180306164012
20170404170532
20180122154930
20180511174224
20180216121020
20170518200835
20171124104327
20170830150306
20180913142237
20170703130158
20170719150301
20180307012445
20170927112318
20180104131052
20171114104051
20171012150314
20180507083701
20180826111825
20171103140253
20170503120310
20180917172041
20180430143705
20180220150310
20170803090603
20171215121259
20170309171644
20170606202615
20180212101928
20170206040400
20171106154015
20180608201435
20180202111106
20180816193530
20170828170516
20170711145558
20170502070007
20170317162059
20180723130817
20170131214021
20180512061621
20180223124427
20181030135124
20180702120647
20180913051323
20171106180641
20171013104327
20171101134435
20171219121201
20170828170513
20181008200441
20170613111224
20170628080858
20180706223200
20171124150326
20170526190000
20171124095655
20171124100152
20181008145341
20170408033905
20181008145359
20170629180131
20181105201455
20170621102400
20170526185842
20170313133418
20180408143355
20160824121037
20170927112319
20180906051323
20181022173835
20180424151928
20170830084744
20170816102555
20170822101017
20170301205640
20180420080616
20170523083112
20170215151539
20171107130813
20160317191509
20160414064845
20170901133132
20180329230151
20171110152729
20181004131025
20170808155717
20170522194603
20171218140451
20180401213713
20180105233807
20150507194350
20180720120716
20170808005254
20150709134649
20161030005533
20150324223425
20151208110020
20170622131529
20141030133853
20170920091408
20171129150921
20170914012544
20170626202753
20171107144726
20170130113559
20170515093334
20170726111039
20181017131623
20170620143011
20160615092001
20160705111606
20170811203342
20180308234102
20151215005729
20170522201800
20180917213751
20180607154645
20161230123835
20160221013512
20160721042141
20170620063751
20180317020334
20180621100024
20180215143644
20180831152625
20150929160851
20170509153720
20170215151540
20170306180725
20180711014026
20180720121404
20170525174157
20171211131502
20170216000450
20180423165301
20150717155058
20170905201347
20170910051507
20170421113144
20180531031410
20171017125928
20140513095908
20171010140746
20150312000132
20170106172237
20180103234731
20160530214349
20151110125416
20180917145556
20160119170055
20180104001824
20180623053658
20160302141317
20141213212220
20180803001726
20170525174159
20140811155127
20180615152524
20160316124047
20180910105100
20180702181530
20140813090117
20171207105719
20170207150212
20180626171125
20180307164427
20171006201108
20170202114129
20140414093351
20170525174158
20170118200338
20170215151541
20180926101838
20150731200022
20150125163158
20170801201439
20180723023517
20180612175636
20170404223037
20160112174440
20180201192230
20180502124117
20170622124246
20170505133904
20170718190627
20170706121518
20180709153607
20180823132905
20171129152659
20180719161844
20170906160132
20160913172737
20170718185922
20170719182937
20170512173638
20180315160435
20180131104538
20150605131047
20171124164248
20170308015651
20141027173526
20170818174141
20180926140319
20180607154516
20171002105019
20170928081016
20160829104026
20160303210802
20180709183353
20150827144737
20170513005817
20180930171532
20180115113902
20170517162048
20140907223153
20180225180932
20141230100055
20180320142552
20171204112945
20181001172126
20180709184533
20180503154922
20160204190809
20171124070437
20181001172651
20180917171533
20180416112831
20181004131020
20180419171038
20170420200123
20140319135450
20160812054342
20180920043317
20180115013218
20170512131952
20181012151642
20170118194941
20160321161032
20170403141442
20180720120726
20160718210939
20180724161450
20170602003304
20171120143816
20170210144005
20171017130239
20180917214204
20170106172235
20141010132608
20151113115819
20170911133813
20180803041220
20180314174825
20151228203337
20180206184810
20141103160516
20180325034910
20150501095306
20171013192542
20180314145917
20180302230551
20180917171535
20171130151759
20180831134049
20170911134018
20161021185735
20140508105809
20160916101334
20181025000427
20170614053336
20180718100455
20170926203418
20151209222208
20161030020610
20171130152602
20170106172236
20150707222220
20171222151344
20141212124604
20160718211059
20180531221734
20180806145747
20171120145444
20180621100025
20140811083829
20150225214822
20170224075132
20170801200418
20170625171421
20170419065104
20170427180205
20170605151307
20170118200412
20160913172608
20160718211006
20160831231325
20180201101405
20180115094742
20170623202610
20180126165535
20180314100728
20180910104020
20171012070521
20180702114215
20160906143504
20150609125332
20170905202320
20171109115718
20160611101122
20170120123345
20170623195236
20180917171038
20180711014025
20150609113337
20170627211700
20180524115107
20160601102211
20151007110107
20171124164249
20180416205949
20180723081631
20180209115333
20160915201649
20170926200545
20180720082636
20171107144122
20171010095526
20160810153405
20170208144550
20160721043623
20160615142732
20180419031622
20180924070647
20170717213940
20180917171534
20170808155912
20171031055422
20170106172234
20160229034258
20180723134433
20140813133925
20171214115254
20180502125859
20180607154422
20160718210912
20160129075828
20171107090120
20180109150457
20161005144359
20170614061551
20171103152048
20180502130136
20181014131030
20170510101016
20171201140229
20181116100917
20180618193715
20180417102933
20170530111134
20180309215236
20180608150653
20170427111108
20180914195058
20170808163512
20180605213516
20171124182517
20180815043102
20180713171825
20171124165823
20180509091305
20170811082658
20180314172513
\.


--
-- Data for Name: sent_notifications; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.sent_notifications (id, project_id, noteable_id, noteable_type, recipient_id, commit_id, reply_key, line_code, note_type, "position", in_reply_to_discussion_id) FROM stdin;
\.


--
-- Name: sent_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.sent_notifications_id_seq', 1, false);


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.services (id, type, title, project_id, created_at, updated_at, active, properties, template, push_events, issues_events, merge_requests_events, tag_push_events, note_events, category, "default", wiki_page_events, pipeline_events, confidential_issues_events, commit_events, job_events, confidential_note_events) FROM stdin;
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- Data for Name: shards; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.shards (id, name) FROM stdin;
1	default
\.


--
-- Name: shards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.shards_id_seq', 1, true);


--
-- Data for Name: slack_integrations; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.slack_integrations (id, service_id, team_id, team_name, alias, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: slack_integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.slack_integrations_id_seq', 1, false);


--
-- Data for Name: snippets; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.snippets (id, title, content, author_id, project_id, created_at, updated_at, file_name, type, visibility_level, title_html, content_html, cached_markdown_version, description, description_html) FROM stdin;
\.


--
-- Name: snippets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.snippets_id_seq', 1, false);


--
-- Data for Name: software_license_policies; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.software_license_policies (id, project_id, software_license_id, approval_status) FROM stdin;
\.


--
-- Name: software_license_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.software_license_policies_id_seq', 1, false);


--
-- Data for Name: software_licenses; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.software_licenses (id, name) FROM stdin;
\.


--
-- Name: software_licenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.software_licenses_id_seq', 1, false);


--
-- Data for Name: spam_logs; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.spam_logs (id, user_id, source_ip, user_agent, via_api, noteable_type, title, description, created_at, updated_at, submitted_as_ham, recaptcha_verified) FROM stdin;
\.


--
-- Name: spam_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.spam_logs_id_seq', 1, false);


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.subscriptions (id, user_id, subscribable_id, subscribable_type, subscribed, created_at, updated_at, project_id) FROM stdin;
\.


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 1, false);


--
-- Data for Name: system_note_metadata; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.system_note_metadata (id, note_id, commit_count, action, created_at, updated_at) FROM stdin;
\.


--
-- Name: system_note_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.system_note_metadata_id_seq', 1, false);


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.taggings (id, tag_id, taggable_id, taggable_type, tagger_id, tagger_type, context, created_at) FROM stdin;
\.


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.taggings_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.tags (id, name, taggings_count) FROM stdin;
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- Data for Name: term_agreements; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.term_agreements (id, term_id, user_id, accepted, created_at, updated_at) FROM stdin;
\.


--
-- Name: term_agreements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.term_agreements_id_seq', 1, false);


--
-- Data for Name: timelogs; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.timelogs (id, time_spent, user_id, created_at, updated_at, issue_id, merge_request_id, spent_at) FROM stdin;
\.


--
-- Name: timelogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.timelogs_id_seq', 1, false);


--
-- Data for Name: todos; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.todos (id, user_id, project_id, target_id, target_type, author_id, action, state, created_at, updated_at, note_id, commit_id, group_id) FROM stdin;
\.


--
-- Name: todos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.todos_id_seq', 1, false);


--
-- Data for Name: trending_projects; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.trending_projects (id, project_id) FROM stdin;
\.


--
-- Name: trending_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.trending_projects_id_seq', 1, false);


--
-- Data for Name: u2f_registrations; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.u2f_registrations (id, certificate, key_handle, public_key, counter, user_id, created_at, updated_at, name) FROM stdin;
\.


--
-- Name: u2f_registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.u2f_registrations_id_seq', 1, false);


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.uploads (id, size, path, checksum, model_id, model_type, uploader, created_at, store, mount_point, secret) FROM stdin;
\.


--
-- Name: uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.uploads_id_seq', 1, false);


--
-- Data for Name: user_agent_details; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.user_agent_details (id, user_agent, ip_address, subject_id, subject_type, submitted, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_agent_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.user_agent_details_id_seq', 1, false);


--
-- Data for Name: user_callouts; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.user_callouts (id, feature_name, user_id) FROM stdin;
\.


--
-- Name: user_callouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.user_callouts_id_seq', 1, false);


--
-- Data for Name: user_custom_attributes; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.user_custom_attributes (id, created_at, updated_at, user_id, key, value) FROM stdin;
\.


--
-- Name: user_custom_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.user_custom_attributes_id_seq', 1, false);


--
-- Data for Name: user_interacted_projects; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.user_interacted_projects (user_id, project_id) FROM stdin;
\.


--
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.user_preferences (id, user_id, issue_notes_filter, merge_request_notes_filter, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.user_preferences_id_seq', 1, false);


--
-- Data for Name: user_statuses; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.user_statuses (user_id, cached_markdown_version, emoji, message, message_html) FROM stdin;
\.


--
-- Name: user_statuses_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.user_statuses_user_id_seq', 1, false);


--
-- Data for Name: user_synced_attributes_metadata; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.user_synced_attributes_metadata (id, name_synced, email_synced, location_synced, user_id, provider) FROM stdin;
\.


--
-- Name: user_synced_attributes_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.user_synced_attributes_metadata_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, admin, projects_limit, skype, linkedin, twitter, bio, failed_attempts, locked_at, username, can_create_group, can_create_team, state, color_scheme_id, password_expires_at, created_by_id, last_credential_check_at, avatar, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, hide_no_ssh_key, website_url, admin_email_unsubscribed_at, notification_email, hide_no_password, password_automatically_set, location, encrypted_otp_secret, encrypted_otp_secret_iv, encrypted_otp_secret_salt, otp_required_for_login, otp_backup_codes, public_email, dashboard, project_view, consumed_timestep, layout, hide_project_limit, note, unlock_token, otp_grace_period_started_at, external, incoming_email_token, organization, auditor, require_two_factor_authentication_from_group, two_factor_grace_period, ghost, last_activity_on, notified_of_own_activity, support_bot, preferred_language, email_opted_in, email_opted_in_ip, email_opted_in_source_id, email_opted_in_at, theme_id, accepted_term_id, feed_token, private_profile, roadmap_layout, include_private_contributions, commit_email) FROM stdin;
1	admin@example.com	$2a$10$S.Xb1KkautBfYutRJ6RBGuOZwjIDBnPAaGcVYm4gn1nKCDfRgVOp.	\N	\N	\N	0	\N	\N	\N	\N	2018-12-11 22:18:23.962941	2018-12-11 22:18:23.962941	Administrator	t	100000				\N	0	\N	root	t	f	active	1	\N	\N	\N	\N	\N	2018-12-11 22:18:23.236603	\N	\N	f		\N	admin@example.com	f	t	\N	\N	\N	\N	f	\N		0	2	\N	0	f	\N	\N	\N	f	efb4x5jjvauy91l1gnymojqes	\N	f	f	48	\N	\N	f	\N	en	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Data for Name: users_ops_dashboard_projects; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.users_ops_dashboard_projects (id, created_at, updated_at, user_id, project_id) FROM stdin;
\.


--
-- Name: users_ops_dashboard_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.users_ops_dashboard_projects_id_seq', 1, false);


--
-- Data for Name: users_star_projects; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.users_star_projects (id, project_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: users_star_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.users_star_projects_id_seq', 1, false);


--
-- Data for Name: vulnerability_feedback; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.vulnerability_feedback (id, created_at, updated_at, feedback_type, category, project_id, author_id, pipeline_id, issue_id, project_fingerprint) FROM stdin;
\.


--
-- Name: vulnerability_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.vulnerability_feedback_id_seq', 1, false);


--
-- Data for Name: vulnerability_identifiers; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.vulnerability_identifiers (id, created_at, updated_at, project_id, fingerprint, external_type, external_id, name, url) FROM stdin;
\.


--
-- Name: vulnerability_identifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.vulnerability_identifiers_id_seq', 1, false);


--
-- Data for Name: vulnerability_occurrence_identifiers; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.vulnerability_occurrence_identifiers (id, created_at, updated_at, occurrence_id, identifier_id) FROM stdin;
\.


--
-- Name: vulnerability_occurrence_identifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.vulnerability_occurrence_identifiers_id_seq', 1, false);


--
-- Data for Name: vulnerability_occurrence_pipelines; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.vulnerability_occurrence_pipelines (id, created_at, updated_at, occurrence_id, pipeline_id) FROM stdin;
\.


--
-- Name: vulnerability_occurrence_pipelines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.vulnerability_occurrence_pipelines_id_seq', 1, false);


--
-- Data for Name: vulnerability_occurrences; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.vulnerability_occurrences (id, created_at, updated_at, severity, confidence, report_type, project_id, scanner_id, primary_identifier_id, project_fingerprint, location_fingerprint, uuid, name, metadata_version, raw_metadata) FROM stdin;
\.


--
-- Name: vulnerability_occurrences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.vulnerability_occurrences_id_seq', 1, false);


--
-- Data for Name: vulnerability_scanners; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.vulnerability_scanners (id, created_at, updated_at, project_id, external_id, name) FROM stdin;
\.


--
-- Name: vulnerability_scanners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.vulnerability_scanners_id_seq', 1, false);


--
-- Data for Name: web_hook_logs; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.web_hook_logs (id, web_hook_id, trigger, url, request_headers, request_data, response_headers, response_body, response_status, execution_duration, internal_error_message, created_at, updated_at) FROM stdin;
\.


--
-- Name: web_hook_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.web_hook_logs_id_seq', 1, false);


--
-- Data for Name: web_hooks; Type: TABLE DATA; Schema: public; Owner: gitlab
--

COPY public.web_hooks (id, project_id, created_at, updated_at, type, service_id, push_events, issues_events, merge_requests_events, tag_push_events, group_id, note_events, enable_ssl_verification, wiki_page_events, pipeline_events, confidential_issues_events, repository_update_events, job_events, confidential_note_events, push_events_branch_filter, encrypted_token, encrypted_token_iv, encrypted_url, encrypted_url_iv) FROM stdin;
\.


--
-- Name: web_hooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitlab
--

SELECT pg_catalog.setval('public.web_hooks_id_seq', 1, false);


--
-- Name: abuse_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.abuse_reports
    ADD CONSTRAINT abuse_reports_pkey PRIMARY KEY (id);


--
-- Name: appearances_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.appearances
    ADD CONSTRAINT appearances_pkey PRIMARY KEY (id);


--
-- Name: application_setting_terms_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.application_setting_terms
    ADD CONSTRAINT application_setting_terms_pkey PRIMARY KEY (id);


--
-- Name: application_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.application_settings
    ADD CONSTRAINT application_settings_pkey PRIMARY KEY (id);


--
-- Name: approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.approvals
    ADD CONSTRAINT approvals_pkey PRIMARY KEY (id);


--
-- Name: approver_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.approver_groups
    ADD CONSTRAINT approver_groups_pkey PRIMARY KEY (id);


--
-- Name: approvers_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.approvers
    ADD CONSTRAINT approvers_pkey PRIMARY KEY (id);


--
-- Name: audit_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.audit_events
    ADD CONSTRAINT audit_events_pkey PRIMARY KEY (id);


--
-- Name: award_emoji_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.award_emoji
    ADD CONSTRAINT award_emoji_pkey PRIMARY KEY (id);


--
-- Name: badges_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: board_assignees_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_assignees
    ADD CONSTRAINT board_assignees_pkey PRIMARY KEY (id);


--
-- Name: board_group_recent_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_group_recent_visits
    ADD CONSTRAINT board_group_recent_visits_pkey PRIMARY KEY (id);


--
-- Name: board_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_labels
    ADD CONSTRAINT board_labels_pkey PRIMARY KEY (id);


--
-- Name: board_project_recent_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_project_recent_visits
    ADD CONSTRAINT board_project_recent_visits_pkey PRIMARY KEY (id);


--
-- Name: boards_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);


--
-- Name: broadcast_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.broadcast_messages
    ADD CONSTRAINT broadcast_messages_pkey PRIMARY KEY (id);


--
-- Name: chat_names_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.chat_names
    ADD CONSTRAINT chat_names_pkey PRIMARY KEY (id);


--
-- Name: chat_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.chat_teams
    ADD CONSTRAINT chat_teams_pkey PRIMARY KEY (id);


--
-- Name: ci_build_trace_chunks_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_build_trace_chunks
    ADD CONSTRAINT ci_build_trace_chunks_pkey PRIMARY KEY (id);


--
-- Name: ci_build_trace_section_names_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_build_trace_section_names
    ADD CONSTRAINT ci_build_trace_section_names_pkey PRIMARY KEY (id);


--
-- Name: ci_build_trace_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_build_trace_sections
    ADD CONSTRAINT ci_build_trace_sections_pkey PRIMARY KEY (id);


--
-- Name: ci_builds_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds_metadata
    ADD CONSTRAINT ci_builds_metadata_pkey PRIMARY KEY (id);


--
-- Name: ci_builds_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds
    ADD CONSTRAINT ci_builds_pkey PRIMARY KEY (id);


--
-- Name: ci_builds_runner_session_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds_runner_session
    ADD CONSTRAINT ci_builds_runner_session_pkey PRIMARY KEY (id);


--
-- Name: ci_group_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_group_variables
    ADD CONSTRAINT ci_group_variables_pkey PRIMARY KEY (id);


--
-- Name: ci_job_artifacts_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_job_artifacts
    ADD CONSTRAINT ci_job_artifacts_pkey PRIMARY KEY (id);


--
-- Name: ci_pipeline_chat_data_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_chat_data
    ADD CONSTRAINT ci_pipeline_chat_data_pkey PRIMARY KEY (id);


--
-- Name: ci_pipeline_schedule_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_schedule_variables
    ADD CONSTRAINT ci_pipeline_schedule_variables_pkey PRIMARY KEY (id);


--
-- Name: ci_pipeline_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_schedules
    ADD CONSTRAINT ci_pipeline_schedules_pkey PRIMARY KEY (id);


--
-- Name: ci_pipeline_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_variables
    ADD CONSTRAINT ci_pipeline_variables_pkey PRIMARY KEY (id);


--
-- Name: ci_pipelines_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipelines
    ADD CONSTRAINT ci_pipelines_pkey PRIMARY KEY (id);


--
-- Name: ci_runner_namespaces_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_runner_namespaces
    ADD CONSTRAINT ci_runner_namespaces_pkey PRIMARY KEY (id);


--
-- Name: ci_runner_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_runner_projects
    ADD CONSTRAINT ci_runner_projects_pkey PRIMARY KEY (id);


--
-- Name: ci_runners_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_runners
    ADD CONSTRAINT ci_runners_pkey PRIMARY KEY (id);


--
-- Name: ci_sources_pipelines_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_sources_pipelines
    ADD CONSTRAINT ci_sources_pipelines_pkey PRIMARY KEY (id);


--
-- Name: ci_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_stages
    ADD CONSTRAINT ci_stages_pkey PRIMARY KEY (id);


--
-- Name: ci_trigger_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_trigger_requests
    ADD CONSTRAINT ci_trigger_requests_pkey PRIMARY KEY (id);


--
-- Name: ci_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_triggers
    ADD CONSTRAINT ci_triggers_pkey PRIMARY KEY (id);


--
-- Name: ci_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_variables
    ADD CONSTRAINT ci_variables_pkey PRIMARY KEY (id);


--
-- Name: cluster_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_groups
    ADD CONSTRAINT cluster_groups_pkey PRIMARY KEY (id);


--
-- Name: cluster_platforms_kubernetes_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_platforms_kubernetes
    ADD CONSTRAINT cluster_platforms_kubernetes_pkey PRIMARY KEY (id);


--
-- Name: cluster_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_projects
    ADD CONSTRAINT cluster_projects_pkey PRIMARY KEY (id);


--
-- Name: cluster_providers_gcp_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_providers_gcp
    ADD CONSTRAINT cluster_providers_gcp_pkey PRIMARY KEY (id);


--
-- Name: clusters_applications_helm_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_helm
    ADD CONSTRAINT clusters_applications_helm_pkey PRIMARY KEY (id);


--
-- Name: clusters_applications_ingress_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_ingress
    ADD CONSTRAINT clusters_applications_ingress_pkey PRIMARY KEY (id);


--
-- Name: clusters_applications_jupyter_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_jupyter
    ADD CONSTRAINT clusters_applications_jupyter_pkey PRIMARY KEY (id);


--
-- Name: clusters_applications_knative_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_knative
    ADD CONSTRAINT clusters_applications_knative_pkey PRIMARY KEY (id);


--
-- Name: clusters_applications_prometheus_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_prometheus
    ADD CONSTRAINT clusters_applications_prometheus_pkey PRIMARY KEY (id);


--
-- Name: clusters_applications_runners_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_runners
    ADD CONSTRAINT clusters_applications_runners_pkey PRIMARY KEY (id);


--
-- Name: clusters_kubernetes_namespaces_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_kubernetes_namespaces
    ADD CONSTRAINT clusters_kubernetes_namespaces_pkey PRIMARY KEY (id);


--
-- Name: clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (id);


--
-- Name: container_repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.container_repositories
    ADD CONSTRAINT container_repositories_pkey PRIMARY KEY (id);


--
-- Name: conversational_development_index_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.conversational_development_index_metrics
    ADD CONSTRAINT conversational_development_index_metrics_pkey PRIMARY KEY (id);


--
-- Name: deploy_keys_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.deploy_keys_projects
    ADD CONSTRAINT deploy_keys_projects_pkey PRIMARY KEY (id);


--
-- Name: deploy_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.deploy_tokens
    ADD CONSTRAINT deploy_tokens_pkey PRIMARY KEY (id);


--
-- Name: deployments_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.deployments
    ADD CONSTRAINT deployments_pkey PRIMARY KEY (id);


--
-- Name: draft_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.draft_notes
    ADD CONSTRAINT draft_notes_pkey PRIMARY KEY (id);


--
-- Name: emails_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.emails
    ADD CONSTRAINT emails_pkey PRIMARY KEY (id);


--
-- Name: environments_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.environments
    ADD CONSTRAINT environments_pkey PRIMARY KEY (id);


--
-- Name: epic_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epic_issues
    ADD CONSTRAINT epic_issues_pkey PRIMARY KEY (id);


--
-- Name: epic_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epic_metrics
    ADD CONSTRAINT epic_metrics_pkey PRIMARY KEY (id);


--
-- Name: epics_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epics
    ADD CONSTRAINT epics_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: feature_gates_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.feature_gates
    ADD CONSTRAINT feature_gates_pkey PRIMARY KEY (id);


--
-- Name: features_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: fork_network_members_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.fork_network_members
    ADD CONSTRAINT fork_network_members_pkey PRIMARY KEY (id);


--
-- Name: fork_networks_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.fork_networks
    ADD CONSTRAINT fork_networks_pkey PRIMARY KEY (id);


--
-- Name: forked_project_links_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.forked_project_links
    ADD CONSTRAINT forked_project_links_pkey PRIMARY KEY (id);


--
-- Name: gcp_clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gcp_clusters
    ADD CONSTRAINT gcp_clusters_pkey PRIMARY KEY (id);


--
-- Name: geo_cache_invalidation_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_cache_invalidation_events
    ADD CONSTRAINT geo_cache_invalidation_events_pkey PRIMARY KEY (id);


--
-- Name: geo_event_log_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT geo_event_log_pkey PRIMARY KEY (id);


--
-- Name: geo_hashed_storage_attachments_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_hashed_storage_attachments_events
    ADD CONSTRAINT geo_hashed_storage_attachments_events_pkey PRIMARY KEY (id);


--
-- Name: geo_hashed_storage_migrated_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_hashed_storage_migrated_events
    ADD CONSTRAINT geo_hashed_storage_migrated_events_pkey PRIMARY KEY (id);


--
-- Name: geo_job_artifact_deleted_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_job_artifact_deleted_events
    ADD CONSTRAINT geo_job_artifact_deleted_events_pkey PRIMARY KEY (id);


--
-- Name: geo_lfs_object_deleted_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_lfs_object_deleted_events
    ADD CONSTRAINT geo_lfs_object_deleted_events_pkey PRIMARY KEY (id);


--
-- Name: geo_node_namespace_links_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_node_namespace_links
    ADD CONSTRAINT geo_node_namespace_links_pkey PRIMARY KEY (id);


--
-- Name: geo_node_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_node_statuses
    ADD CONSTRAINT geo_node_statuses_pkey PRIMARY KEY (id);


--
-- Name: geo_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_nodes
    ADD CONSTRAINT geo_nodes_pkey PRIMARY KEY (id);


--
-- Name: geo_repositories_changed_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repositories_changed_events
    ADD CONSTRAINT geo_repositories_changed_events_pkey PRIMARY KEY (id);


--
-- Name: geo_repository_created_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repository_created_events
    ADD CONSTRAINT geo_repository_created_events_pkey PRIMARY KEY (id);


--
-- Name: geo_repository_deleted_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repository_deleted_events
    ADD CONSTRAINT geo_repository_deleted_events_pkey PRIMARY KEY (id);


--
-- Name: geo_repository_renamed_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repository_renamed_events
    ADD CONSTRAINT geo_repository_renamed_events_pkey PRIMARY KEY (id);


--
-- Name: geo_repository_updated_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repository_updated_events
    ADD CONSTRAINT geo_repository_updated_events_pkey PRIMARY KEY (id);


--
-- Name: geo_reset_checksum_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_reset_checksum_events
    ADD CONSTRAINT geo_reset_checksum_events_pkey PRIMARY KEY (id);


--
-- Name: geo_upload_deleted_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_upload_deleted_events
    ADD CONSTRAINT geo_upload_deleted_events_pkey PRIMARY KEY (id);


--
-- Name: gpg_key_subkeys_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gpg_key_subkeys
    ADD CONSTRAINT gpg_key_subkeys_pkey PRIMARY KEY (id);


--
-- Name: gpg_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gpg_keys
    ADD CONSTRAINT gpg_keys_pkey PRIMARY KEY (id);


--
-- Name: gpg_signatures_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gpg_signatures
    ADD CONSTRAINT gpg_signatures_pkey PRIMARY KEY (id);


--
-- Name: group_custom_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.group_custom_attributes
    ADD CONSTRAINT group_custom_attributes_pkey PRIMARY KEY (id);


--
-- Name: historical_data_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.historical_data
    ADD CONSTRAINT historical_data_pkey PRIMARY KEY (id);


--
-- Name: identities_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: import_export_uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.import_export_uploads
    ADD CONSTRAINT import_export_uploads_pkey PRIMARY KEY (id);


--
-- Name: index_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.index_statuses
    ADD CONSTRAINT index_statuses_pkey PRIMARY KEY (id);


--
-- Name: internal_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.internal_ids
    ADD CONSTRAINT internal_ids_pkey PRIMARY KEY (id);


--
-- Name: issue_links_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issue_links
    ADD CONSTRAINT issue_links_pkey PRIMARY KEY (id);


--
-- Name: issue_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issue_metrics
    ADD CONSTRAINT issue_metrics_pkey PRIMARY KEY (id);


--
-- Name: issues_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: keys_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_pkey PRIMARY KEY (id);


--
-- Name: label_links_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.label_links
    ADD CONSTRAINT label_links_pkey PRIMARY KEY (id);


--
-- Name: label_priorities_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.label_priorities
    ADD CONSTRAINT label_priorities_pkey PRIMARY KEY (id);


--
-- Name: labels_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT labels_pkey PRIMARY KEY (id);


--
-- Name: ldap_group_links_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ldap_group_links
    ADD CONSTRAINT ldap_group_links_pkey PRIMARY KEY (id);


--
-- Name: lfs_file_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lfs_file_locks
    ADD CONSTRAINT lfs_file_locks_pkey PRIMARY KEY (id);


--
-- Name: lfs_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lfs_objects
    ADD CONSTRAINT lfs_objects_pkey PRIMARY KEY (id);


--
-- Name: lfs_objects_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lfs_objects_projects
    ADD CONSTRAINT lfs_objects_projects_pkey PRIMARY KEY (id);


--
-- Name: licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.licenses
    ADD CONSTRAINT licenses_pkey PRIMARY KEY (id);


--
-- Name: lists_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);


--
-- Name: members_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: merge_request_diffs_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_request_diffs
    ADD CONSTRAINT merge_request_diffs_pkey PRIMARY KEY (id);


--
-- Name: merge_request_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_request_metrics
    ADD CONSTRAINT merge_request_metrics_pkey PRIMARY KEY (id);


--
-- Name: merge_requests_closing_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests_closing_issues
    ADD CONSTRAINT merge_requests_closing_issues_pkey PRIMARY KEY (id);


--
-- Name: merge_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests
    ADD CONSTRAINT merge_requests_pkey PRIMARY KEY (id);


--
-- Name: milestones_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.milestones
    ADD CONSTRAINT milestones_pkey PRIMARY KEY (id);


--
-- Name: namespace_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.namespace_statistics
    ADD CONSTRAINT namespace_statistics_pkey PRIMARY KEY (id);


--
-- Name: namespaces_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.namespaces
    ADD CONSTRAINT namespaces_pkey PRIMARY KEY (id);


--
-- Name: note_diff_files_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.note_diff_files
    ADD CONSTRAINT note_diff_files_pkey PRIMARY KEY (id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: notification_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.notification_settings
    ADD CONSTRAINT notification_settings_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: oauth_openid_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.oauth_openid_requests
    ADD CONSTRAINT oauth_openid_requests_pkey PRIMARY KEY (id);


--
-- Name: operations_feature_flags_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.operations_feature_flags_clients
    ADD CONSTRAINT operations_feature_flags_clients_pkey PRIMARY KEY (id);


--
-- Name: operations_feature_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.operations_feature_flags
    ADD CONSTRAINT operations_feature_flags_pkey PRIMARY KEY (id);


--
-- Name: packages_maven_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.packages_maven_metadata
    ADD CONSTRAINT packages_maven_metadata_pkey PRIMARY KEY (id);


--
-- Name: packages_package_files_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.packages_package_files
    ADD CONSTRAINT packages_package_files_pkey PRIMARY KEY (id);


--
-- Name: packages_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.packages_packages
    ADD CONSTRAINT packages_packages_pkey PRIMARY KEY (id);


--
-- Name: pages_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.pages_domains
    ADD CONSTRAINT pages_domains_pkey PRIMARY KEY (id);


--
-- Name: path_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.path_locks
    ADD CONSTRAINT path_locks_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: plans_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: programming_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.programming_languages
    ADD CONSTRAINT programming_languages_pkey PRIMARY KEY (id);


--
-- Name: project_auto_devops_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_auto_devops
    ADD CONSTRAINT project_auto_devops_pkey PRIMARY KEY (id);


--
-- Name: project_ci_cd_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_ci_cd_settings
    ADD CONSTRAINT project_ci_cd_settings_pkey PRIMARY KEY (id);


--
-- Name: project_custom_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_custom_attributes
    ADD CONSTRAINT project_custom_attributes_pkey PRIMARY KEY (id);


--
-- Name: project_deploy_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_deploy_tokens
    ADD CONSTRAINT project_deploy_tokens_pkey PRIMARY KEY (id);


--
-- Name: project_features_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_features
    ADD CONSTRAINT project_features_pkey PRIMARY KEY (id);


--
-- Name: project_group_links_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_group_links
    ADD CONSTRAINT project_group_links_pkey PRIMARY KEY (id);


--
-- Name: project_import_data_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_import_data
    ADD CONSTRAINT project_import_data_pkey PRIMARY KEY (id);


--
-- Name: project_mirror_data_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_mirror_data
    ADD CONSTRAINT project_mirror_data_pkey PRIMARY KEY (id);


--
-- Name: project_repository_states_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_repository_states
    ADD CONSTRAINT project_repository_states_pkey PRIMARY KEY (id);


--
-- Name: project_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_statistics
    ADD CONSTRAINT project_statistics_pkey PRIMARY KEY (id);


--
-- Name: project_tracing_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_tracing_settings
    ADD CONSTRAINT project_tracing_settings_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: prometheus_alert_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_alert_events
    ADD CONSTRAINT prometheus_alert_events_pkey PRIMARY KEY (id);


--
-- Name: prometheus_alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_alerts
    ADD CONSTRAINT prometheus_alerts_pkey PRIMARY KEY (id);


--
-- Name: prometheus_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_metrics
    ADD CONSTRAINT prometheus_metrics_pkey PRIMARY KEY (id);


--
-- Name: protected_branch_merge_access_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_merge_access_levels
    ADD CONSTRAINT protected_branch_merge_access_levels_pkey PRIMARY KEY (id);


--
-- Name: protected_branch_push_access_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_push_access_levels
    ADD CONSTRAINT protected_branch_push_access_levels_pkey PRIMARY KEY (id);


--
-- Name: protected_branch_unprotect_access_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_unprotect_access_levels
    ADD CONSTRAINT protected_branch_unprotect_access_levels_pkey PRIMARY KEY (id);


--
-- Name: protected_branches_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branches
    ADD CONSTRAINT protected_branches_pkey PRIMARY KEY (id);


--
-- Name: protected_environment_deploy_access_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_environment_deploy_access_levels
    ADD CONSTRAINT protected_environment_deploy_access_levels_pkey PRIMARY KEY (id);


--
-- Name: protected_environments_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_environments
    ADD CONSTRAINT protected_environments_pkey PRIMARY KEY (id);


--
-- Name: protected_tag_create_access_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_tag_create_access_levels
    ADD CONSTRAINT protected_tag_create_access_levels_pkey PRIMARY KEY (id);


--
-- Name: protected_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_tags
    ADD CONSTRAINT protected_tags_pkey PRIMARY KEY (id);


--
-- Name: push_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.push_rules
    ADD CONSTRAINT push_rules_pkey PRIMARY KEY (id);


--
-- Name: redirect_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.redirect_routes
    ADD CONSTRAINT redirect_routes_pkey PRIMARY KEY (id);


--
-- Name: releases_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.releases
    ADD CONSTRAINT releases_pkey PRIMARY KEY (id);


--
-- Name: remote_mirrors_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.remote_mirrors
    ADD CONSTRAINT remote_mirrors_pkey PRIMARY KEY (id);


--
-- Name: repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);


--
-- Name: resource_label_events_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.resource_label_events
    ADD CONSTRAINT resource_label_events_pkey PRIMARY KEY (id);


--
-- Name: routes_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: saml_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: sent_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.sent_notifications
    ADD CONSTRAINT sent_notifications_pkey PRIMARY KEY (id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: shards_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.shards
    ADD CONSTRAINT shards_pkey PRIMARY KEY (id);


--
-- Name: slack_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.slack_integrations
    ADD CONSTRAINT slack_integrations_pkey PRIMARY KEY (id);


--
-- Name: snippets_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.snippets
    ADD CONSTRAINT snippets_pkey PRIMARY KEY (id);


--
-- Name: software_license_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.software_license_policies
    ADD CONSTRAINT software_license_policies_pkey PRIMARY KEY (id);


--
-- Name: software_licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.software_licenses
    ADD CONSTRAINT software_licenses_pkey PRIMARY KEY (id);


--
-- Name: spam_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.spam_logs
    ADD CONSTRAINT spam_logs_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: system_note_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.system_note_metadata
    ADD CONSTRAINT system_note_metadata_pkey PRIMARY KEY (id);


--
-- Name: taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: term_agreements_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.term_agreements
    ADD CONSTRAINT term_agreements_pkey PRIMARY KEY (id);


--
-- Name: timelogs_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.timelogs
    ADD CONSTRAINT timelogs_pkey PRIMARY KEY (id);


--
-- Name: todos_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT todos_pkey PRIMARY KEY (id);


--
-- Name: trending_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.trending_projects
    ADD CONSTRAINT trending_projects_pkey PRIMARY KEY (id);


--
-- Name: u2f_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.u2f_registrations
    ADD CONSTRAINT u2f_registrations_pkey PRIMARY KEY (id);


--
-- Name: uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.uploads
    ADD CONSTRAINT uploads_pkey PRIMARY KEY (id);


--
-- Name: user_agent_details_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_agent_details
    ADD CONSTRAINT user_agent_details_pkey PRIMARY KEY (id);


--
-- Name: user_callouts_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_callouts
    ADD CONSTRAINT user_callouts_pkey PRIMARY KEY (id);


--
-- Name: user_custom_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_custom_attributes
    ADD CONSTRAINT user_custom_attributes_pkey PRIMARY KEY (id);


--
-- Name: user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- Name: user_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_statuses
    ADD CONSTRAINT user_statuses_pkey PRIMARY KEY (user_id);


--
-- Name: user_synced_attributes_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_synced_attributes_metadata
    ADD CONSTRAINT user_synced_attributes_metadata_pkey PRIMARY KEY (id);


--
-- Name: users_ops_dashboard_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.users_ops_dashboard_projects
    ADD CONSTRAINT users_ops_dashboard_projects_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_star_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.users_star_projects
    ADD CONSTRAINT users_star_projects_pkey PRIMARY KEY (id);


--
-- Name: vulnerability_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_feedback
    ADD CONSTRAINT vulnerability_feedback_pkey PRIMARY KEY (id);


--
-- Name: vulnerability_identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_identifiers
    ADD CONSTRAINT vulnerability_identifiers_pkey PRIMARY KEY (id);


--
-- Name: vulnerability_occurrence_identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrence_identifiers
    ADD CONSTRAINT vulnerability_occurrence_identifiers_pkey PRIMARY KEY (id);


--
-- Name: vulnerability_occurrence_pipelines_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrence_pipelines
    ADD CONSTRAINT vulnerability_occurrence_pipelines_pkey PRIMARY KEY (id);


--
-- Name: vulnerability_occurrences_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrences
    ADD CONSTRAINT vulnerability_occurrences_pkey PRIMARY KEY (id);


--
-- Name: vulnerability_scanners_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_scanners
    ADD CONSTRAINT vulnerability_scanners_pkey PRIMARY KEY (id);


--
-- Name: web_hook_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.web_hook_logs
    ADD CONSTRAINT web_hook_logs_pkey PRIMARY KEY (id);


--
-- Name: web_hooks_pkey; Type: CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.web_hooks
    ADD CONSTRAINT web_hooks_pkey PRIMARY KEY (id);


--
-- Name: idx_issues_on_project_id_and_due_date_and_id_and_state_partial; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX idx_issues_on_project_id_and_due_date_and_id_and_state_partial ON public.issues USING btree (project_id, due_date, id, state) WHERE (due_date IS NOT NULL);


--
-- Name: idx_project_repository_check_partial; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX idx_project_repository_check_partial ON public.projects USING btree (repository_storage, created_at) WHERE (last_repository_check_at IS NULL);


--
-- Name: idx_projects_on_repository_storage_last_repository_updated_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX idx_projects_on_repository_storage_last_repository_updated_at ON public.projects USING btree (id, repository_storage, last_repository_updated_at);


--
-- Name: idx_repository_states_on_repository_failure_partial; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX idx_repository_states_on_repository_failure_partial ON public.project_repository_states USING btree (last_repository_verification_failure) WHERE (last_repository_verification_failure IS NOT NULL);


--
-- Name: idx_repository_states_on_wiki_failure_partial; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX idx_repository_states_on_wiki_failure_partial ON public.project_repository_states USING btree (last_wiki_verification_failure) WHERE (last_wiki_verification_failure IS NOT NULL);


--
-- Name: idx_repository_states_outdated_checksums; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX idx_repository_states_outdated_checksums ON public.project_repository_states USING btree (project_id) WHERE (((repository_verification_checksum IS NULL) AND (last_repository_verification_failure IS NULL)) OR ((wiki_verification_checksum IS NULL) AND (last_wiki_verification_failure IS NULL)));


--
-- Name: index_approvals_on_merge_request_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_approvals_on_merge_request_id ON public.approvals USING btree (merge_request_id);


--
-- Name: index_approver_groups_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_approver_groups_on_group_id ON public.approver_groups USING btree (group_id);


--
-- Name: index_approver_groups_on_target_id_and_target_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_approver_groups_on_target_id_and_target_type ON public.approver_groups USING btree (target_id, target_type);


--
-- Name: index_approvers_on_target_id_and_target_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_approvers_on_target_id_and_target_type ON public.approvers USING btree (target_id, target_type);


--
-- Name: index_approvers_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_approvers_on_user_id ON public.approvers USING btree (user_id);


--
-- Name: index_audit_events_on_entity_id_and_entity_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_audit_events_on_entity_id_and_entity_type ON public.audit_events USING btree (entity_id, entity_type);


--
-- Name: index_award_emoji_on_awardable_type_and_awardable_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_award_emoji_on_awardable_type_and_awardable_id ON public.award_emoji USING btree (awardable_type, awardable_id);


--
-- Name: index_award_emoji_on_user_id_and_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_award_emoji_on_user_id_and_name ON public.award_emoji USING btree (user_id, name);


--
-- Name: index_badges_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_badges_on_group_id ON public.badges USING btree (group_id);


--
-- Name: index_badges_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_badges_on_project_id ON public.badges USING btree (project_id);


--
-- Name: index_board_assignees_on_board_id_and_assignee_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_board_assignees_on_board_id_and_assignee_id ON public.board_assignees USING btree (board_id, assignee_id);


--
-- Name: index_board_group_recent_visits_on_board_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_board_group_recent_visits_on_board_id ON public.board_group_recent_visits USING btree (board_id);


--
-- Name: index_board_group_recent_visits_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_board_group_recent_visits_on_group_id ON public.board_group_recent_visits USING btree (group_id);


--
-- Name: index_board_group_recent_visits_on_user_group_and_board; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_board_group_recent_visits_on_user_group_and_board ON public.board_group_recent_visits USING btree (user_id, group_id, board_id);


--
-- Name: index_board_group_recent_visits_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_board_group_recent_visits_on_user_id ON public.board_group_recent_visits USING btree (user_id);


--
-- Name: index_board_labels_on_board_id_and_label_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_board_labels_on_board_id_and_label_id ON public.board_labels USING btree (board_id, label_id);


--
-- Name: index_board_project_recent_visits_on_board_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_board_project_recent_visits_on_board_id ON public.board_project_recent_visits USING btree (board_id);


--
-- Name: index_board_project_recent_visits_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_board_project_recent_visits_on_project_id ON public.board_project_recent_visits USING btree (project_id);


--
-- Name: index_board_project_recent_visits_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_board_project_recent_visits_on_user_id ON public.board_project_recent_visits USING btree (user_id);


--
-- Name: index_board_project_recent_visits_on_user_project_and_board; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_board_project_recent_visits_on_user_project_and_board ON public.board_project_recent_visits USING btree (user_id, project_id, board_id);


--
-- Name: index_boards_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_boards_on_group_id ON public.boards USING btree (group_id);


--
-- Name: index_boards_on_milestone_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_boards_on_milestone_id ON public.boards USING btree (milestone_id);


--
-- Name: index_boards_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_boards_on_project_id ON public.boards USING btree (project_id);


--
-- Name: index_broadcast_messages_on_starts_at_and_ends_at_and_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_broadcast_messages_on_starts_at_and_ends_at_and_id ON public.broadcast_messages USING btree (starts_at, ends_at, id);


--
-- Name: index_chat_names_on_service_id_and_team_id_and_chat_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_chat_names_on_service_id_and_team_id_and_chat_id ON public.chat_names USING btree (service_id, team_id, chat_id);


--
-- Name: index_chat_names_on_user_id_and_service_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_chat_names_on_user_id_and_service_id ON public.chat_names USING btree (user_id, service_id);


--
-- Name: index_chat_teams_on_namespace_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_chat_teams_on_namespace_id ON public.chat_teams USING btree (namespace_id);


--
-- Name: index_ci_build_trace_chunks_on_build_id_and_chunk_index; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_build_trace_chunks_on_build_id_and_chunk_index ON public.ci_build_trace_chunks USING btree (build_id, chunk_index);


--
-- Name: index_ci_build_trace_section_names_on_project_id_and_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_build_trace_section_names_on_project_id_and_name ON public.ci_build_trace_section_names USING btree (project_id, name);


--
-- Name: index_ci_build_trace_sections_on_build_id_and_section_name_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_build_trace_sections_on_build_id_and_section_name_id ON public.ci_build_trace_sections USING btree (build_id, section_name_id);


--
-- Name: index_ci_build_trace_sections_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_build_trace_sections_on_project_id ON public.ci_build_trace_sections USING btree (project_id);


--
-- Name: index_ci_build_trace_sections_on_section_name_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_build_trace_sections_on_section_name_id ON public.ci_build_trace_sections USING btree (section_name_id);


--
-- Name: index_ci_builds_metadata_on_build_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_builds_metadata_on_build_id ON public.ci_builds_metadata USING btree (build_id);


--
-- Name: index_ci_builds_metadata_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_metadata_on_project_id ON public.ci_builds_metadata USING btree (project_id);


--
-- Name: index_ci_builds_on_artifacts_expire_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_artifacts_expire_at ON public.ci_builds USING btree (artifacts_expire_at) WHERE (artifacts_file <> ''::text);


--
-- Name: index_ci_builds_on_auto_canceled_by_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_auto_canceled_by_id ON public.ci_builds USING btree (auto_canceled_by_id);


--
-- Name: index_ci_builds_on_commit_id_and_stage_idx_and_created_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_commit_id_and_stage_idx_and_created_at ON public.ci_builds USING btree (commit_id, stage_idx, created_at);


--
-- Name: index_ci_builds_on_commit_id_and_status_and_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_commit_id_and_status_and_type ON public.ci_builds USING btree (commit_id, status, type);


--
-- Name: index_ci_builds_on_commit_id_and_type_and_name_and_ref; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_commit_id_and_type_and_name_and_ref ON public.ci_builds USING btree (commit_id, type, name, ref);


--
-- Name: index_ci_builds_on_commit_id_and_type_and_ref; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_commit_id_and_type_and_ref ON public.ci_builds USING btree (commit_id, type, ref);


--
-- Name: index_ci_builds_on_name_for_security_products_values; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_name_for_security_products_values ON public.ci_builds USING btree (name) WHERE ((name)::text = ANY (ARRAY[('container_scanning'::character varying)::text, ('dast'::character varying)::text, ('dependency_scanning'::character varying)::text, ('license_management'::character varying)::text, ('sast'::character varying)::text]));


--
-- Name: index_ci_builds_on_project_id_and_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_project_id_and_id ON public.ci_builds USING btree (project_id, id);


--
-- Name: index_ci_builds_on_protected; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_protected ON public.ci_builds USING btree (protected);


--
-- Name: index_ci_builds_on_runner_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_runner_id ON public.ci_builds USING btree (runner_id);


--
-- Name: index_ci_builds_on_stage_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_stage_id ON public.ci_builds USING btree (stage_id);


--
-- Name: index_ci_builds_on_status_and_type_and_runner_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_status_and_type_and_runner_id ON public.ci_builds USING btree (status, type, runner_id);


--
-- Name: index_ci_builds_on_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_builds_on_token ON public.ci_builds USING btree (token);


--
-- Name: index_ci_builds_on_updated_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_updated_at ON public.ci_builds USING btree (updated_at);


--
-- Name: index_ci_builds_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_builds_on_user_id ON public.ci_builds USING btree (user_id);


--
-- Name: index_ci_builds_runner_session_on_build_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_builds_runner_session_on_build_id ON public.ci_builds_runner_session USING btree (build_id);


--
-- Name: index_ci_group_variables_on_group_id_and_key; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_group_variables_on_group_id_and_key ON public.ci_group_variables USING btree (group_id, key);


--
-- Name: index_ci_job_artifacts_on_expire_at_and_job_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_job_artifacts_on_expire_at_and_job_id ON public.ci_job_artifacts USING btree (expire_at, job_id);


--
-- Name: index_ci_job_artifacts_on_file_store; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_job_artifacts_on_file_store ON public.ci_job_artifacts USING btree (file_store);


--
-- Name: index_ci_job_artifacts_on_job_id_and_file_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_job_artifacts_on_job_id_and_file_type ON public.ci_job_artifacts USING btree (job_id, file_type);


--
-- Name: index_ci_job_artifacts_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_job_artifacts_on_project_id ON public.ci_job_artifacts USING btree (project_id);


--
-- Name: index_ci_pipeline_chat_data_on_pipeline_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_pipeline_chat_data_on_pipeline_id ON public.ci_pipeline_chat_data USING btree (pipeline_id);


--
-- Name: index_ci_pipeline_schedule_variables_on_schedule_id_and_key; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_pipeline_schedule_variables_on_schedule_id_and_key ON public.ci_pipeline_schedule_variables USING btree (pipeline_schedule_id, key);


--
-- Name: index_ci_pipeline_schedules_on_next_run_at_and_active; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_pipeline_schedules_on_next_run_at_and_active ON public.ci_pipeline_schedules USING btree (next_run_at, active);


--
-- Name: index_ci_pipeline_schedules_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_pipeline_schedules_on_project_id ON public.ci_pipeline_schedules USING btree (project_id);


--
-- Name: index_ci_pipeline_variables_on_pipeline_id_and_key; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_pipeline_variables_on_pipeline_id_and_key ON public.ci_pipeline_variables USING btree (pipeline_id, key);


--
-- Name: index_ci_pipelines_on_auto_canceled_by_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_pipelines_on_auto_canceled_by_id ON public.ci_pipelines USING btree (auto_canceled_by_id);


--
-- Name: index_ci_pipelines_on_pipeline_schedule_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_pipelines_on_pipeline_schedule_id ON public.ci_pipelines USING btree (pipeline_schedule_id);


--
-- Name: index_ci_pipelines_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_pipelines_on_project_id ON public.ci_pipelines USING btree (project_id);


--
-- Name: index_ci_pipelines_on_project_id_and_iid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_pipelines_on_project_id_and_iid ON public.ci_pipelines USING btree (project_id, iid) WHERE (iid IS NOT NULL);


--
-- Name: index_ci_pipelines_on_project_id_and_ref_and_status_and_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_pipelines_on_project_id_and_ref_and_status_and_id ON public.ci_pipelines USING btree (project_id, ref, status, id);


--
-- Name: index_ci_pipelines_on_project_id_and_sha; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_pipelines_on_project_id_and_sha ON public.ci_pipelines USING btree (project_id, sha);


--
-- Name: index_ci_pipelines_on_project_id_and_source; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_pipelines_on_project_id_and_source ON public.ci_pipelines USING btree (project_id, source);


--
-- Name: index_ci_pipelines_on_project_id_and_status_and_config_source; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_pipelines_on_project_id_and_status_and_config_source ON public.ci_pipelines USING btree (project_id, status, config_source);


--
-- Name: index_ci_pipelines_on_status; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_pipelines_on_status ON public.ci_pipelines USING btree (status);


--
-- Name: index_ci_pipelines_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_pipelines_on_user_id ON public.ci_pipelines USING btree (user_id);


--
-- Name: index_ci_runner_namespaces_on_namespace_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_runner_namespaces_on_namespace_id ON public.ci_runner_namespaces USING btree (namespace_id);


--
-- Name: index_ci_runner_namespaces_on_runner_id_and_namespace_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_runner_namespaces_on_runner_id_and_namespace_id ON public.ci_runner_namespaces USING btree (runner_id, namespace_id);


--
-- Name: index_ci_runner_projects_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_runner_projects_on_project_id ON public.ci_runner_projects USING btree (project_id);


--
-- Name: index_ci_runner_projects_on_runner_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_runner_projects_on_runner_id ON public.ci_runner_projects USING btree (runner_id);


--
-- Name: index_ci_runners_on_contacted_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_runners_on_contacted_at ON public.ci_runners USING btree (contacted_at);


--
-- Name: index_ci_runners_on_is_shared; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_runners_on_is_shared ON public.ci_runners USING btree (is_shared);


--
-- Name: index_ci_runners_on_locked; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_runners_on_locked ON public.ci_runners USING btree (locked);


--
-- Name: index_ci_runners_on_runner_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_runners_on_runner_type ON public.ci_runners USING btree (runner_type);


--
-- Name: index_ci_runners_on_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_runners_on_token ON public.ci_runners USING btree (token);


--
-- Name: index_ci_sources_pipelines_on_pipeline_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_sources_pipelines_on_pipeline_id ON public.ci_sources_pipelines USING btree (pipeline_id);


--
-- Name: index_ci_sources_pipelines_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_sources_pipelines_on_project_id ON public.ci_sources_pipelines USING btree (project_id);


--
-- Name: index_ci_sources_pipelines_on_source_job_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_sources_pipelines_on_source_job_id ON public.ci_sources_pipelines USING btree (source_job_id);


--
-- Name: index_ci_sources_pipelines_on_source_pipeline_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_sources_pipelines_on_source_pipeline_id ON public.ci_sources_pipelines USING btree (source_pipeline_id);


--
-- Name: index_ci_sources_pipelines_on_source_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_sources_pipelines_on_source_project_id ON public.ci_sources_pipelines USING btree (source_project_id);


--
-- Name: index_ci_stages_on_pipeline_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_stages_on_pipeline_id ON public.ci_stages USING btree (pipeline_id);


--
-- Name: index_ci_stages_on_pipeline_id_and_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_stages_on_pipeline_id_and_name ON public.ci_stages USING btree (pipeline_id, name);


--
-- Name: index_ci_stages_on_pipeline_id_and_position; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_stages_on_pipeline_id_and_position ON public.ci_stages USING btree (pipeline_id, "position");


--
-- Name: index_ci_stages_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_stages_on_project_id ON public.ci_stages USING btree (project_id);


--
-- Name: index_ci_trigger_requests_on_commit_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_trigger_requests_on_commit_id ON public.ci_trigger_requests USING btree (commit_id);


--
-- Name: index_ci_triggers_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_ci_triggers_on_project_id ON public.ci_triggers USING btree (project_id);


--
-- Name: index_ci_variables_on_project_id_and_key_and_environment_scope; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_ci_variables_on_project_id_and_key_and_environment_scope ON public.ci_variables USING btree (project_id, key, environment_scope);


--
-- Name: index_cluster_groups_on_cluster_id_and_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_cluster_groups_on_cluster_id_and_group_id ON public.cluster_groups USING btree (cluster_id, group_id);


--
-- Name: index_cluster_groups_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_cluster_groups_on_group_id ON public.cluster_groups USING btree (group_id);


--
-- Name: index_cluster_platforms_kubernetes_on_cluster_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_cluster_platforms_kubernetes_on_cluster_id ON public.cluster_platforms_kubernetes USING btree (cluster_id);


--
-- Name: index_cluster_projects_on_cluster_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_cluster_projects_on_cluster_id ON public.cluster_projects USING btree (cluster_id);


--
-- Name: index_cluster_projects_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_cluster_projects_on_project_id ON public.cluster_projects USING btree (project_id);


--
-- Name: index_cluster_providers_gcp_on_cluster_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_cluster_providers_gcp_on_cluster_id ON public.cluster_providers_gcp USING btree (cluster_id);


--
-- Name: index_clusters_applications_runners_on_cluster_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_clusters_applications_runners_on_cluster_id ON public.clusters_applications_runners USING btree (cluster_id);


--
-- Name: index_clusters_applications_runners_on_runner_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_clusters_applications_runners_on_runner_id ON public.clusters_applications_runners USING btree (runner_id);


--
-- Name: index_clusters_kubernetes_namespaces_on_cluster_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_clusters_kubernetes_namespaces_on_cluster_id ON public.clusters_kubernetes_namespaces USING btree (cluster_id);


--
-- Name: index_clusters_kubernetes_namespaces_on_cluster_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_clusters_kubernetes_namespaces_on_cluster_project_id ON public.clusters_kubernetes_namespaces USING btree (cluster_project_id);


--
-- Name: index_clusters_kubernetes_namespaces_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_clusters_kubernetes_namespaces_on_project_id ON public.clusters_kubernetes_namespaces USING btree (project_id);


--
-- Name: index_clusters_on_enabled; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_clusters_on_enabled ON public.clusters USING btree (enabled);


--
-- Name: index_clusters_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_clusters_on_user_id ON public.clusters USING btree (user_id);


--
-- Name: index_container_repositories_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_container_repositories_on_project_id ON public.container_repositories USING btree (project_id);


--
-- Name: index_container_repositories_on_project_id_and_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_container_repositories_on_project_id_and_name ON public.container_repositories USING btree (project_id, name);


--
-- Name: index_deploy_keys_projects_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_deploy_keys_projects_on_project_id ON public.deploy_keys_projects USING btree (project_id);


--
-- Name: index_deploy_tokens_on_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_deploy_tokens_on_token ON public.deploy_tokens USING btree (token);


--
-- Name: index_deploy_tokens_on_token_and_expires_at_and_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_deploy_tokens_on_token_and_expires_at_and_id ON public.deploy_tokens USING btree (token, expires_at, id) WHERE (revoked IS FALSE);


--
-- Name: index_deployments_on_created_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_deployments_on_created_at ON public.deployments USING btree (created_at);


--
-- Name: index_deployments_on_deployable_type_and_deployable_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_deployments_on_deployable_type_and_deployable_id ON public.deployments USING btree (deployable_type, deployable_id);


--
-- Name: index_deployments_on_environment_id_and_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_deployments_on_environment_id_and_id ON public.deployments USING btree (environment_id, id);


--
-- Name: index_deployments_on_environment_id_and_iid_and_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_deployments_on_environment_id_and_iid_and_project_id ON public.deployments USING btree (environment_id, iid, project_id);


--
-- Name: index_deployments_on_environment_id_and_status; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_deployments_on_environment_id_and_status ON public.deployments USING btree (environment_id, status);


--
-- Name: index_deployments_on_project_id_and_iid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_deployments_on_project_id_and_iid ON public.deployments USING btree (project_id, iid);


--
-- Name: index_deployments_on_project_id_and_status; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_deployments_on_project_id_and_status ON public.deployments USING btree (project_id, status);


--
-- Name: index_deployments_on_project_id_and_status_and_created_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_deployments_on_project_id_and_status_and_created_at ON public.deployments USING btree (project_id, status, created_at);


--
-- Name: index_draft_notes_on_author_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_draft_notes_on_author_id ON public.draft_notes USING btree (author_id);


--
-- Name: index_draft_notes_on_discussion_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_draft_notes_on_discussion_id ON public.draft_notes USING btree (discussion_id);


--
-- Name: index_draft_notes_on_merge_request_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_draft_notes_on_merge_request_id ON public.draft_notes USING btree (merge_request_id);


--
-- Name: index_emails_on_confirmation_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_emails_on_confirmation_token ON public.emails USING btree (confirmation_token);


--
-- Name: index_emails_on_email; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_emails_on_email ON public.emails USING btree (email);


--
-- Name: index_emails_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_emails_on_user_id ON public.emails USING btree (user_id);


--
-- Name: index_environments_on_name_varchar_pattern_ops; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_environments_on_name_varchar_pattern_ops ON public.environments USING btree (name varchar_pattern_ops);


--
-- Name: index_environments_on_project_id_and_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_environments_on_project_id_and_name ON public.environments USING btree (project_id, name);


--
-- Name: index_environments_on_project_id_and_slug; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_environments_on_project_id_and_slug ON public.environments USING btree (project_id, slug);


--
-- Name: index_epic_issues_on_epic_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_epic_issues_on_epic_id ON public.epic_issues USING btree (epic_id);


--
-- Name: index_epic_issues_on_issue_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_epic_issues_on_issue_id ON public.epic_issues USING btree (issue_id);


--
-- Name: index_epic_metrics; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_epic_metrics ON public.epic_metrics USING btree (epic_id);


--
-- Name: index_epics_on_assignee_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_epics_on_assignee_id ON public.epics USING btree (assignee_id);


--
-- Name: index_epics_on_author_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_epics_on_author_id ON public.epics USING btree (author_id);


--
-- Name: index_epics_on_closed_by_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_epics_on_closed_by_id ON public.epics USING btree (closed_by_id);


--
-- Name: index_epics_on_end_date; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_epics_on_end_date ON public.epics USING btree (end_date);


--
-- Name: index_epics_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_epics_on_group_id ON public.epics USING btree (group_id);


--
-- Name: index_epics_on_iid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_epics_on_iid ON public.epics USING btree (iid);


--
-- Name: index_epics_on_start_date; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_epics_on_start_date ON public.epics USING btree (start_date);


--
-- Name: index_events_on_action; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_events_on_action ON public.events USING btree (action);


--
-- Name: index_events_on_author_id_and_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_events_on_author_id_and_project_id ON public.events USING btree (author_id, project_id);


--
-- Name: index_events_on_project_id_and_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_events_on_project_id_and_id ON public.events USING btree (project_id, id);


--
-- Name: index_events_on_target_type_and_target_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_events_on_target_type_and_target_id ON public.events USING btree (target_type, target_id);


--
-- Name: index_feature_gates_on_feature_key_and_key_and_value; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_feature_gates_on_feature_key_and_key_and_value ON public.feature_gates USING btree (feature_key, key, value);


--
-- Name: index_features_on_key; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_features_on_key ON public.features USING btree (key);


--
-- Name: index_fork_network_members_on_fork_network_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_fork_network_members_on_fork_network_id ON public.fork_network_members USING btree (fork_network_id);


--
-- Name: index_fork_network_members_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_fork_network_members_on_project_id ON public.fork_network_members USING btree (project_id);


--
-- Name: index_fork_networks_on_root_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_fork_networks_on_root_project_id ON public.fork_networks USING btree (root_project_id);


--
-- Name: index_forked_project_links_on_forked_to_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_forked_project_links_on_forked_to_project_id ON public.forked_project_links USING btree (forked_to_project_id);


--
-- Name: index_gcp_clusters_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_gcp_clusters_on_project_id ON public.gcp_clusters USING btree (project_id);


--
-- Name: index_geo_event_log_on_cache_invalidation_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_cache_invalidation_event_id ON public.geo_event_log USING btree (cache_invalidation_event_id) WHERE (cache_invalidation_event_id IS NOT NULL);


--
-- Name: index_geo_event_log_on_hashed_storage_attachments_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_hashed_storage_attachments_event_id ON public.geo_event_log USING btree (hashed_storage_attachments_event_id) WHERE (hashed_storage_attachments_event_id IS NOT NULL);


--
-- Name: index_geo_event_log_on_hashed_storage_migrated_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_hashed_storage_migrated_event_id ON public.geo_event_log USING btree (hashed_storage_migrated_event_id) WHERE (hashed_storage_migrated_event_id IS NOT NULL);


--
-- Name: index_geo_event_log_on_job_artifact_deleted_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_job_artifact_deleted_event_id ON public.geo_event_log USING btree (job_artifact_deleted_event_id) WHERE (job_artifact_deleted_event_id IS NOT NULL);


--
-- Name: index_geo_event_log_on_lfs_object_deleted_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_lfs_object_deleted_event_id ON public.geo_event_log USING btree (lfs_object_deleted_event_id) WHERE (lfs_object_deleted_event_id IS NOT NULL);


--
-- Name: index_geo_event_log_on_repositories_changed_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_repositories_changed_event_id ON public.geo_event_log USING btree (repositories_changed_event_id) WHERE (repositories_changed_event_id IS NOT NULL);


--
-- Name: index_geo_event_log_on_repository_created_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_repository_created_event_id ON public.geo_event_log USING btree (repository_created_event_id) WHERE (repository_created_event_id IS NOT NULL);


--
-- Name: index_geo_event_log_on_repository_deleted_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_repository_deleted_event_id ON public.geo_event_log USING btree (repository_deleted_event_id) WHERE (repository_deleted_event_id IS NOT NULL);


--
-- Name: index_geo_event_log_on_repository_renamed_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_repository_renamed_event_id ON public.geo_event_log USING btree (repository_renamed_event_id) WHERE (repository_renamed_event_id IS NOT NULL);


--
-- Name: index_geo_event_log_on_repository_updated_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_repository_updated_event_id ON public.geo_event_log USING btree (repository_updated_event_id) WHERE (repository_updated_event_id IS NOT NULL);


--
-- Name: index_geo_event_log_on_reset_checksum_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_reset_checksum_event_id ON public.geo_event_log USING btree (reset_checksum_event_id) WHERE (reset_checksum_event_id IS NOT NULL);


--
-- Name: index_geo_event_log_on_upload_deleted_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_event_log_on_upload_deleted_event_id ON public.geo_event_log USING btree (upload_deleted_event_id) WHERE (upload_deleted_event_id IS NOT NULL);


--
-- Name: index_geo_hashed_storage_attachments_events_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_hashed_storage_attachments_events_on_project_id ON public.geo_hashed_storage_attachments_events USING btree (project_id);


--
-- Name: index_geo_hashed_storage_migrated_events_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_hashed_storage_migrated_events_on_project_id ON public.geo_hashed_storage_migrated_events USING btree (project_id);


--
-- Name: index_geo_job_artifact_deleted_events_on_job_artifact_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_job_artifact_deleted_events_on_job_artifact_id ON public.geo_job_artifact_deleted_events USING btree (job_artifact_id);


--
-- Name: index_geo_lfs_object_deleted_events_on_lfs_object_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_lfs_object_deleted_events_on_lfs_object_id ON public.geo_lfs_object_deleted_events USING btree (lfs_object_id);


--
-- Name: index_geo_node_namespace_links_on_geo_node_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_node_namespace_links_on_geo_node_id ON public.geo_node_namespace_links USING btree (geo_node_id);


--
-- Name: index_geo_node_namespace_links_on_geo_node_id_and_namespace_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_geo_node_namespace_links_on_geo_node_id_and_namespace_id ON public.geo_node_namespace_links USING btree (geo_node_id, namespace_id);


--
-- Name: index_geo_node_statuses_on_geo_node_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_geo_node_statuses_on_geo_node_id ON public.geo_node_statuses USING btree (geo_node_id);


--
-- Name: index_geo_nodes_on_access_key; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_nodes_on_access_key ON public.geo_nodes USING btree (access_key);


--
-- Name: index_geo_nodes_on_primary; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_nodes_on_primary ON public.geo_nodes USING btree ("primary");


--
-- Name: index_geo_nodes_on_url; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_geo_nodes_on_url ON public.geo_nodes USING btree (url);


--
-- Name: index_geo_repositories_changed_events_on_geo_node_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_repositories_changed_events_on_geo_node_id ON public.geo_repositories_changed_events USING btree (geo_node_id);


--
-- Name: index_geo_repository_created_events_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_repository_created_events_on_project_id ON public.geo_repository_created_events USING btree (project_id);


--
-- Name: index_geo_repository_deleted_events_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_repository_deleted_events_on_project_id ON public.geo_repository_deleted_events USING btree (project_id);


--
-- Name: index_geo_repository_renamed_events_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_repository_renamed_events_on_project_id ON public.geo_repository_renamed_events USING btree (project_id);


--
-- Name: index_geo_repository_updated_events_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_repository_updated_events_on_project_id ON public.geo_repository_updated_events USING btree (project_id);


--
-- Name: index_geo_repository_updated_events_on_source; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_repository_updated_events_on_source ON public.geo_repository_updated_events USING btree (source);


--
-- Name: index_geo_reset_checksum_events_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_reset_checksum_events_on_project_id ON public.geo_reset_checksum_events USING btree (project_id);


--
-- Name: index_geo_upload_deleted_events_on_upload_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_geo_upload_deleted_events_on_upload_id ON public.geo_upload_deleted_events USING btree (upload_id);


--
-- Name: index_gpg_key_subkeys_on_fingerprint; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_gpg_key_subkeys_on_fingerprint ON public.gpg_key_subkeys USING btree (fingerprint);


--
-- Name: index_gpg_key_subkeys_on_gpg_key_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_gpg_key_subkeys_on_gpg_key_id ON public.gpg_key_subkeys USING btree (gpg_key_id);


--
-- Name: index_gpg_key_subkeys_on_keyid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_gpg_key_subkeys_on_keyid ON public.gpg_key_subkeys USING btree (keyid);


--
-- Name: index_gpg_keys_on_fingerprint; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_gpg_keys_on_fingerprint ON public.gpg_keys USING btree (fingerprint);


--
-- Name: index_gpg_keys_on_primary_keyid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_gpg_keys_on_primary_keyid ON public.gpg_keys USING btree (primary_keyid);


--
-- Name: index_gpg_keys_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_gpg_keys_on_user_id ON public.gpg_keys USING btree (user_id);


--
-- Name: index_gpg_signatures_on_commit_sha; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_gpg_signatures_on_commit_sha ON public.gpg_signatures USING btree (commit_sha);


--
-- Name: index_gpg_signatures_on_gpg_key_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_gpg_signatures_on_gpg_key_id ON public.gpg_signatures USING btree (gpg_key_id);


--
-- Name: index_gpg_signatures_on_gpg_key_primary_keyid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_gpg_signatures_on_gpg_key_primary_keyid ON public.gpg_signatures USING btree (gpg_key_primary_keyid);


--
-- Name: index_gpg_signatures_on_gpg_key_subkey_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_gpg_signatures_on_gpg_key_subkey_id ON public.gpg_signatures USING btree (gpg_key_subkey_id);


--
-- Name: index_gpg_signatures_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_gpg_signatures_on_project_id ON public.gpg_signatures USING btree (project_id);


--
-- Name: index_group_custom_attributes_on_group_id_and_key; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_group_custom_attributes_on_group_id_and_key ON public.group_custom_attributes USING btree (group_id, key);


--
-- Name: index_group_custom_attributes_on_key_and_value; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_group_custom_attributes_on_key_and_value ON public.group_custom_attributes USING btree (key, value);


--
-- Name: index_identities_on_saml_provider_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_identities_on_saml_provider_id ON public.identities USING btree (saml_provider_id) WHERE (saml_provider_id IS NOT NULL);


--
-- Name: index_identities_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_identities_on_user_id ON public.identities USING btree (user_id);


--
-- Name: index_import_export_uploads_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_import_export_uploads_on_project_id ON public.import_export_uploads USING btree (project_id);


--
-- Name: index_import_export_uploads_on_updated_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_import_export_uploads_on_updated_at ON public.import_export_uploads USING btree (updated_at);


--
-- Name: index_index_statuses_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_index_statuses_on_project_id ON public.index_statuses USING btree (project_id);


--
-- Name: index_internal_ids_on_usage_and_namespace_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_internal_ids_on_usage_and_namespace_id ON public.internal_ids USING btree (usage, namespace_id) WHERE (namespace_id IS NOT NULL);


--
-- Name: index_internal_ids_on_usage_and_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_internal_ids_on_usage_and_project_id ON public.internal_ids USING btree (usage, project_id) WHERE (project_id IS NOT NULL);


--
-- Name: index_issue_assignees_on_issue_id_and_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_issue_assignees_on_issue_id_and_user_id ON public.issue_assignees USING btree (issue_id, user_id);


--
-- Name: index_issue_assignees_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issue_assignees_on_user_id ON public.issue_assignees USING btree (user_id);


--
-- Name: index_issue_links_on_source_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issue_links_on_source_id ON public.issue_links USING btree (source_id);


--
-- Name: index_issue_links_on_source_id_and_target_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_issue_links_on_source_id_and_target_id ON public.issue_links USING btree (source_id, target_id);


--
-- Name: index_issue_links_on_target_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issue_links_on_target_id ON public.issue_links USING btree (target_id);


--
-- Name: index_issue_metrics; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issue_metrics ON public.issue_metrics USING btree (issue_id);


--
-- Name: index_issues_on_author_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_author_id ON public.issues USING btree (author_id);


--
-- Name: index_issues_on_confidential; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_confidential ON public.issues USING btree (confidential);


--
-- Name: index_issues_on_description_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_description_trigram ON public.issues USING gin (description public.gin_trgm_ops);


--
-- Name: index_issues_on_milestone_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_milestone_id ON public.issues USING btree (milestone_id);


--
-- Name: index_issues_on_moved_to_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_moved_to_id ON public.issues USING btree (moved_to_id) WHERE (moved_to_id IS NOT NULL);


--
-- Name: index_issues_on_project_id_and_created_at_and_id_and_state; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_project_id_and_created_at_and_id_and_state ON public.issues USING btree (project_id, created_at, id, state);


--
-- Name: index_issues_on_project_id_and_iid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_issues_on_project_id_and_iid ON public.issues USING btree (project_id, iid);


--
-- Name: index_issues_on_project_id_and_updated_at_and_id_and_state; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_project_id_and_updated_at_and_id_and_state ON public.issues USING btree (project_id, updated_at, id, state);


--
-- Name: index_issues_on_relative_position; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_relative_position ON public.issues USING btree (relative_position);


--
-- Name: index_issues_on_state; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_state ON public.issues USING btree (state);


--
-- Name: index_issues_on_title_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_title_trigram ON public.issues USING gin (title public.gin_trgm_ops);


--
-- Name: index_issues_on_updated_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_updated_at ON public.issues USING btree (updated_at);


--
-- Name: index_issues_on_updated_by_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_issues_on_updated_by_id ON public.issues USING btree (updated_by_id) WHERE (updated_by_id IS NOT NULL);


--
-- Name: index_keys_on_fingerprint; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_keys_on_fingerprint ON public.keys USING btree (fingerprint);


--
-- Name: index_keys_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_keys_on_user_id ON public.keys USING btree (user_id);


--
-- Name: index_label_links_on_label_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_label_links_on_label_id ON public.label_links USING btree (label_id);


--
-- Name: index_label_links_on_target_id_and_target_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_label_links_on_target_id_and_target_type ON public.label_links USING btree (target_id, target_type);


--
-- Name: index_label_priorities_on_priority; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_label_priorities_on_priority ON public.label_priorities USING btree (priority);


--
-- Name: index_label_priorities_on_project_id_and_label_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_label_priorities_on_project_id_and_label_id ON public.label_priorities USING btree (project_id, label_id);


--
-- Name: index_labels_on_group_id_and_project_id_and_title; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_labels_on_group_id_and_project_id_and_title ON public.labels USING btree (group_id, project_id, title);


--
-- Name: index_labels_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_labels_on_project_id ON public.labels USING btree (project_id);


--
-- Name: index_labels_on_template; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_labels_on_template ON public.labels USING btree (template) WHERE template;


--
-- Name: index_labels_on_title; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_labels_on_title ON public.labels USING btree (title);


--
-- Name: index_labels_on_type_and_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_labels_on_type_and_project_id ON public.labels USING btree (type, project_id);


--
-- Name: index_lfs_file_locks_on_project_id_and_path; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_lfs_file_locks_on_project_id_and_path ON public.lfs_file_locks USING btree (project_id, path);


--
-- Name: index_lfs_file_locks_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_lfs_file_locks_on_user_id ON public.lfs_file_locks USING btree (user_id);


--
-- Name: index_lfs_objects_on_file_store; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_lfs_objects_on_file_store ON public.lfs_objects USING btree (file_store);


--
-- Name: index_lfs_objects_on_oid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_lfs_objects_on_oid ON public.lfs_objects USING btree (oid);


--
-- Name: index_lfs_objects_projects_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_lfs_objects_projects_on_project_id ON public.lfs_objects_projects USING btree (project_id);


--
-- Name: index_lists_on_board_id_and_label_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_lists_on_board_id_and_label_id ON public.lists USING btree (board_id, label_id);


--
-- Name: index_lists_on_label_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_lists_on_label_id ON public.lists USING btree (label_id);


--
-- Name: index_lists_on_list_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_lists_on_list_type ON public.lists USING btree (list_type);


--
-- Name: index_lists_on_milestone_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_lists_on_milestone_id ON public.lists USING btree (milestone_id);


--
-- Name: index_lists_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_lists_on_user_id ON public.lists USING btree (user_id);


--
-- Name: index_members_on_access_level; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_members_on_access_level ON public.members USING btree (access_level);


--
-- Name: index_members_on_invite_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_members_on_invite_token ON public.members USING btree (invite_token);


--
-- Name: index_members_on_requested_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_members_on_requested_at ON public.members USING btree (requested_at);


--
-- Name: index_members_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_members_on_source_id_and_source_type ON public.members USING btree (source_id, source_type);


--
-- Name: index_members_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_members_on_user_id ON public.members USING btree (user_id);


--
-- Name: index_merge_request_diff_commits_on_mr_diff_id_and_order; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_merge_request_diff_commits_on_mr_diff_id_and_order ON public.merge_request_diff_commits USING btree (merge_request_diff_id, relative_order);


--
-- Name: index_merge_request_diff_commits_on_sha; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_request_diff_commits_on_sha ON public.merge_request_diff_commits USING btree (sha);


--
-- Name: index_merge_request_diff_files_on_mr_diff_id_and_order; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_merge_request_diff_files_on_mr_diff_id_and_order ON public.merge_request_diff_files USING btree (merge_request_diff_id, relative_order);


--
-- Name: index_merge_request_diffs_on_merge_request_id_and_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_request_diffs_on_merge_request_id_and_id ON public.merge_request_diffs USING btree (merge_request_id, id);


--
-- Name: index_merge_request_metrics; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_request_metrics ON public.merge_request_metrics USING btree (merge_request_id);


--
-- Name: index_merge_request_metrics_on_first_deployed_to_production_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_request_metrics_on_first_deployed_to_production_at ON public.merge_request_metrics USING btree (first_deployed_to_production_at);


--
-- Name: index_merge_request_metrics_on_pipeline_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_request_metrics_on_pipeline_id ON public.merge_request_metrics USING btree (pipeline_id);


--
-- Name: index_merge_requests_closing_issues_on_issue_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_closing_issues_on_issue_id ON public.merge_requests_closing_issues USING btree (issue_id);


--
-- Name: index_merge_requests_closing_issues_on_merge_request_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_closing_issues_on_merge_request_id ON public.merge_requests_closing_issues USING btree (merge_request_id);


--
-- Name: index_merge_requests_on_assignee_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_assignee_id ON public.merge_requests USING btree (assignee_id);


--
-- Name: index_merge_requests_on_author_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_author_id ON public.merge_requests USING btree (author_id);


--
-- Name: index_merge_requests_on_created_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_created_at ON public.merge_requests USING btree (created_at);


--
-- Name: index_merge_requests_on_description_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_description_trigram ON public.merge_requests USING gin (description public.gin_trgm_ops);


--
-- Name: index_merge_requests_on_head_pipeline_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_head_pipeline_id ON public.merge_requests USING btree (head_pipeline_id);


--
-- Name: index_merge_requests_on_id_and_merge_jid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_id_and_merge_jid ON public.merge_requests USING btree (id, merge_jid) WHERE ((merge_jid IS NOT NULL) AND ((state)::text = 'locked'::text));


--
-- Name: index_merge_requests_on_latest_merge_request_diff_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_latest_merge_request_diff_id ON public.merge_requests USING btree (latest_merge_request_diff_id);


--
-- Name: index_merge_requests_on_merge_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_merge_user_id ON public.merge_requests USING btree (merge_user_id) WHERE (merge_user_id IS NOT NULL);


--
-- Name: index_merge_requests_on_milestone_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_milestone_id ON public.merge_requests USING btree (milestone_id);


--
-- Name: index_merge_requests_on_source_branch; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_source_branch ON public.merge_requests USING btree (source_branch);


--
-- Name: index_merge_requests_on_source_project_and_branch_state_opened; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_source_project_and_branch_state_opened ON public.merge_requests USING btree (source_project_id, source_branch) WHERE ((state)::text = 'opened'::text);


--
-- Name: index_merge_requests_on_source_project_id_and_source_branch; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_source_project_id_and_source_branch ON public.merge_requests USING btree (source_project_id, source_branch);


--
-- Name: index_merge_requests_on_target_branch; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_target_branch ON public.merge_requests USING btree (target_branch);


--
-- Name: index_merge_requests_on_target_project_id_and_iid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_merge_requests_on_target_project_id_and_iid ON public.merge_requests USING btree (target_project_id, iid);


--
-- Name: index_merge_requests_on_target_project_id_and_iid_opened; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_target_project_id_and_iid_opened ON public.merge_requests USING btree (target_project_id, iid) WHERE ((state)::text = 'opened'::text);


--
-- Name: index_merge_requests_on_title; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_title ON public.merge_requests USING btree (title);


--
-- Name: index_merge_requests_on_title_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_title_trigram ON public.merge_requests USING gin (title public.gin_trgm_ops);


--
-- Name: index_merge_requests_on_tp_id_and_merge_commit_sha_and_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_tp_id_and_merge_commit_sha_and_id ON public.merge_requests USING btree (target_project_id, merge_commit_sha, id);


--
-- Name: index_merge_requests_on_updated_by_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_merge_requests_on_updated_by_id ON public.merge_requests USING btree (updated_by_id) WHERE (updated_by_id IS NOT NULL);


--
-- Name: index_milestone; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_milestone ON public.epics USING btree (milestone_id);


--
-- Name: index_milestones_on_description_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_milestones_on_description_trigram ON public.milestones USING gin (description public.gin_trgm_ops);


--
-- Name: index_milestones_on_due_date; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_milestones_on_due_date ON public.milestones USING btree (due_date);


--
-- Name: index_milestones_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_milestones_on_group_id ON public.milestones USING btree (group_id);


--
-- Name: index_milestones_on_project_id_and_iid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_milestones_on_project_id_and_iid ON public.milestones USING btree (project_id, iid);


--
-- Name: index_milestones_on_title; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_milestones_on_title ON public.milestones USING btree (title);


--
-- Name: index_milestones_on_title_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_milestones_on_title_trigram ON public.milestones USING gin (title public.gin_trgm_ops);


--
-- Name: index_mirror_data_on_next_execution_and_retry_count; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_mirror_data_on_next_execution_and_retry_count ON public.project_mirror_data USING btree (next_execution_timestamp, retry_count);


--
-- Name: index_namespace_statistics_on_namespace_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_namespace_statistics_on_namespace_id ON public.namespace_statistics USING btree (namespace_id);


--
-- Name: index_namespaces_on_created_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_namespaces_on_created_at ON public.namespaces USING btree (created_at);


--
-- Name: index_namespaces_on_ldap_sync_last_successful_update_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_namespaces_on_ldap_sync_last_successful_update_at ON public.namespaces USING btree (ldap_sync_last_successful_update_at);


--
-- Name: index_namespaces_on_ldap_sync_last_update_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_namespaces_on_ldap_sync_last_update_at ON public.namespaces USING btree (ldap_sync_last_update_at);


--
-- Name: index_namespaces_on_name_and_parent_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_namespaces_on_name_and_parent_id ON public.namespaces USING btree (name, parent_id);


--
-- Name: index_namespaces_on_name_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_namespaces_on_name_trigram ON public.namespaces USING gin (name public.gin_trgm_ops);


--
-- Name: index_namespaces_on_owner_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_namespaces_on_owner_id ON public.namespaces USING btree (owner_id);


--
-- Name: index_namespaces_on_parent_id_and_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_namespaces_on_parent_id_and_id ON public.namespaces USING btree (parent_id, id);


--
-- Name: index_namespaces_on_path; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_namespaces_on_path ON public.namespaces USING btree (path);


--
-- Name: index_namespaces_on_path_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_namespaces_on_path_trigram ON public.namespaces USING gin (path public.gin_trgm_ops);


--
-- Name: index_namespaces_on_plan_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_namespaces_on_plan_id ON public.namespaces USING btree (plan_id);


--
-- Name: index_namespaces_on_require_two_factor_authentication; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_namespaces_on_require_two_factor_authentication ON public.namespaces USING btree (require_two_factor_authentication);


--
-- Name: index_namespaces_on_runners_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_namespaces_on_runners_token ON public.namespaces USING btree (runners_token);


--
-- Name: index_namespaces_on_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_namespaces_on_type ON public.namespaces USING btree (type);


--
-- Name: index_note_diff_files_on_diff_note_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_note_diff_files_on_diff_note_id ON public.note_diff_files USING btree (diff_note_id);


--
-- Name: index_notes_on_author_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notes_on_author_id ON public.notes USING btree (author_id);


--
-- Name: index_notes_on_commit_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notes_on_commit_id ON public.notes USING btree (commit_id);


--
-- Name: index_notes_on_created_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notes_on_created_at ON public.notes USING btree (created_at);


--
-- Name: index_notes_on_discussion_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notes_on_discussion_id ON public.notes USING btree (discussion_id);


--
-- Name: index_notes_on_line_code; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notes_on_line_code ON public.notes USING btree (line_code);


--
-- Name: index_notes_on_note_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notes_on_note_trigram ON public.notes USING gin (note public.gin_trgm_ops);


--
-- Name: index_notes_on_noteable_id_and_noteable_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notes_on_noteable_id_and_noteable_type ON public.notes USING btree (noteable_id, noteable_type);


--
-- Name: index_notes_on_noteable_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notes_on_noteable_type ON public.notes USING btree (noteable_type);


--
-- Name: index_notes_on_project_id_and_noteable_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notes_on_project_id_and_noteable_type ON public.notes USING btree (project_id, noteable_type);


--
-- Name: index_notes_on_updated_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notes_on_updated_at ON public.notes USING btree (updated_at);


--
-- Name: index_notification_settings_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notification_settings_on_source_id_and_source_type ON public.notification_settings USING btree (source_id, source_type);


--
-- Name: index_notification_settings_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_notification_settings_on_user_id ON public.notification_settings USING btree (user_id);


--
-- Name: index_notifications_on_user_id_and_source_id_and_source_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_notifications_on_user_id_and_source_id_and_source_type ON public.notification_settings USING btree (user_id, source_id, source_type);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_owner_id_and_owner_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_oauth_applications_on_owner_id_and_owner_type ON public.oauth_applications USING btree (owner_id, owner_type);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);


--
-- Name: index_operations_feature_flags_clients_on_project_id_and_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_operations_feature_flags_clients_on_project_id_and_token ON public.operations_feature_flags_clients USING btree (project_id, token);


--
-- Name: index_operations_feature_flags_on_project_id_and_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_operations_feature_flags_on_project_id_and_name ON public.operations_feature_flags USING btree (project_id, name);


--
-- Name: index_packages_maven_metadata_on_package_id_and_path; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_packages_maven_metadata_on_package_id_and_path ON public.packages_maven_metadata USING btree (package_id, path);


--
-- Name: index_packages_package_files_on_package_id_and_file_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_packages_package_files_on_package_id_and_file_name ON public.packages_package_files USING btree (package_id, file_name);


--
-- Name: index_packages_packages_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_packages_packages_on_project_id ON public.packages_packages USING btree (project_id);


--
-- Name: index_pages_domains_on_domain; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_pages_domains_on_domain ON public.pages_domains USING btree (domain);


--
-- Name: index_pages_domains_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_pages_domains_on_project_id ON public.pages_domains USING btree (project_id);


--
-- Name: index_pages_domains_on_project_id_and_enabled_until; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_pages_domains_on_project_id_and_enabled_until ON public.pages_domains USING btree (project_id, enabled_until);


--
-- Name: index_pages_domains_on_verified_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_pages_domains_on_verified_at ON public.pages_domains USING btree (verified_at);


--
-- Name: index_pages_domains_on_verified_at_and_enabled_until; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_pages_domains_on_verified_at_and_enabled_until ON public.pages_domains USING btree (verified_at, enabled_until);


--
-- Name: index_path_locks_on_path; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_path_locks_on_path ON public.path_locks USING btree (path);


--
-- Name: index_path_locks_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_path_locks_on_project_id ON public.path_locks USING btree (project_id);


--
-- Name: index_path_locks_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_path_locks_on_user_id ON public.path_locks USING btree (user_id);


--
-- Name: index_personal_access_tokens_on_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_personal_access_tokens_on_token ON public.personal_access_tokens USING btree (token);


--
-- Name: index_personal_access_tokens_on_token_digest; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_personal_access_tokens_on_token_digest ON public.personal_access_tokens USING btree (token_digest);


--
-- Name: index_personal_access_tokens_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_personal_access_tokens_on_user_id ON public.personal_access_tokens USING btree (user_id);


--
-- Name: index_plans_on_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_plans_on_name ON public.plans USING btree (name);


--
-- Name: index_programming_languages_on_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_programming_languages_on_name ON public.programming_languages USING btree (name);


--
-- Name: index_project_authorizations_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_project_authorizations_on_project_id ON public.project_authorizations USING btree (project_id);


--
-- Name: index_project_authorizations_on_user_id_project_id_access_level; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_project_authorizations_on_user_id_project_id_access_level ON public.project_authorizations USING btree (user_id, project_id, access_level);


--
-- Name: index_project_auto_devops_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_project_auto_devops_on_project_id ON public.project_auto_devops USING btree (project_id);


--
-- Name: index_project_ci_cd_settings_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_project_ci_cd_settings_on_project_id ON public.project_ci_cd_settings USING btree (project_id);


--
-- Name: index_project_custom_attributes_on_key_and_value; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_project_custom_attributes_on_key_and_value ON public.project_custom_attributes USING btree (key, value);


--
-- Name: index_project_custom_attributes_on_project_id_and_key; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_project_custom_attributes_on_project_id_and_key ON public.project_custom_attributes USING btree (project_id, key);


--
-- Name: index_project_deploy_tokens_on_deploy_token_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_project_deploy_tokens_on_deploy_token_id ON public.project_deploy_tokens USING btree (deploy_token_id);


--
-- Name: index_project_deploy_tokens_on_project_id_and_deploy_token_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_project_deploy_tokens_on_project_id_and_deploy_token_id ON public.project_deploy_tokens USING btree (project_id, deploy_token_id);


--
-- Name: index_project_features_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_project_features_on_project_id ON public.project_features USING btree (project_id);


--
-- Name: index_project_group_links_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_project_group_links_on_group_id ON public.project_group_links USING btree (group_id);


--
-- Name: index_project_group_links_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_project_group_links_on_project_id ON public.project_group_links USING btree (project_id);


--
-- Name: index_project_import_data_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_project_import_data_on_project_id ON public.project_import_data USING btree (project_id);


--
-- Name: index_project_mirror_data_on_jid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_project_mirror_data_on_jid ON public.project_mirror_data USING btree (jid);


--
-- Name: index_project_mirror_data_on_last_successful_update_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_project_mirror_data_on_last_successful_update_at ON public.project_mirror_data USING btree (last_successful_update_at);


--
-- Name: index_project_mirror_data_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_project_mirror_data_on_project_id ON public.project_mirror_data USING btree (project_id);


--
-- Name: index_project_mirror_data_on_status; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_project_mirror_data_on_status ON public.project_mirror_data USING btree (status);


--
-- Name: index_project_repository_states_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_project_repository_states_on_project_id ON public.project_repository_states USING btree (project_id);


--
-- Name: index_project_statistics_on_namespace_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_project_statistics_on_namespace_id ON public.project_statistics USING btree (namespace_id);


--
-- Name: index_project_statistics_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_project_statistics_on_project_id ON public.project_statistics USING btree (project_id);


--
-- Name: index_project_tracing_settings_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_project_tracing_settings_on_project_id ON public.project_tracing_settings USING btree (project_id);


--
-- Name: index_projects_on_ci_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_ci_id ON public.projects USING btree (ci_id);


--
-- Name: index_projects_on_created_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_created_at ON public.projects USING btree (created_at);


--
-- Name: index_projects_on_creator_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_creator_id ON public.projects USING btree (creator_id);


--
-- Name: index_projects_on_description_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_description_trigram ON public.projects USING gin (description public.gin_trgm_ops);


--
-- Name: index_projects_on_id_partial_for_visibility; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_projects_on_id_partial_for_visibility ON public.projects USING btree (id) WHERE (visibility_level = ANY (ARRAY[10, 20]));


--
-- Name: index_projects_on_last_activity_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_last_activity_at ON public.projects USING btree (last_activity_at);


--
-- Name: index_projects_on_last_repository_check_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_last_repository_check_at ON public.projects USING btree (last_repository_check_at) WHERE (last_repository_check_at IS NOT NULL);


--
-- Name: index_projects_on_last_repository_check_failed; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_last_repository_check_failed ON public.projects USING btree (last_repository_check_failed);


--
-- Name: index_projects_on_last_repository_updated_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_last_repository_updated_at ON public.projects USING btree (last_repository_updated_at);


--
-- Name: index_projects_on_mirror_and_mirror_trigger_builds_both_true; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_mirror_and_mirror_trigger_builds_both_true ON public.projects USING btree (id) WHERE ((mirror IS TRUE) AND (mirror_trigger_builds IS TRUE));


--
-- Name: index_projects_on_mirror_last_successful_update_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_mirror_last_successful_update_at ON public.projects USING btree (mirror_last_successful_update_at);


--
-- Name: index_projects_on_name_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_name_trigram ON public.projects USING gin (name public.gin_trgm_ops);


--
-- Name: index_projects_on_namespace_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_namespace_id ON public.projects USING btree (namespace_id);


--
-- Name: index_projects_on_path; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_path ON public.projects USING btree (path);


--
-- Name: index_projects_on_path_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_path_trigram ON public.projects USING gin (path public.gin_trgm_ops);


--
-- Name: index_projects_on_pending_delete; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_pending_delete ON public.projects USING btree (pending_delete);


--
-- Name: index_projects_on_pool_repository_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_pool_repository_id ON public.projects USING btree (pool_repository_id) WHERE (pool_repository_id IS NOT NULL);


--
-- Name: index_projects_on_repository_storage; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_repository_storage ON public.projects USING btree (repository_storage);


--
-- Name: index_projects_on_runners_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_runners_token ON public.projects USING btree (runners_token);


--
-- Name: index_projects_on_star_count; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_star_count ON public.projects USING btree (star_count);


--
-- Name: index_projects_on_visibility_level; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_projects_on_visibility_level ON public.projects USING btree (visibility_level);


--
-- Name: index_prometheus_alert_event_scoped_payload_key; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_prometheus_alert_event_scoped_payload_key ON public.prometheus_alert_events USING btree (prometheus_alert_id, payload_key);


--
-- Name: index_prometheus_alert_events_on_project_id_and_status; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_prometheus_alert_events_on_project_id_and_status ON public.prometheus_alert_events USING btree (project_id, status);


--
-- Name: index_prometheus_alerts_on_environment_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_prometheus_alerts_on_environment_id ON public.prometheus_alerts USING btree (environment_id);


--
-- Name: index_prometheus_alerts_on_project_id_and_prometheus_metric_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_prometheus_alerts_on_project_id_and_prometheus_metric_id ON public.prometheus_alerts USING btree (project_id, prometheus_metric_id);


--
-- Name: index_prometheus_alerts_on_prometheus_metric_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_prometheus_alerts_on_prometheus_metric_id ON public.prometheus_alerts USING btree (prometheus_metric_id);


--
-- Name: index_prometheus_metrics_on_common; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_prometheus_metrics_on_common ON public.prometheus_metrics USING btree (common);


--
-- Name: index_prometheus_metrics_on_group; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_prometheus_metrics_on_group ON public.prometheus_metrics USING btree ("group");


--
-- Name: index_prometheus_metrics_on_identifier; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_prometheus_metrics_on_identifier ON public.prometheus_metrics USING btree (identifier);


--
-- Name: index_prometheus_metrics_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_prometheus_metrics_on_project_id ON public.prometheus_metrics USING btree (project_id);


--
-- Name: index_protected_branch_merge_access; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_branch_merge_access ON public.protected_branch_merge_access_levels USING btree (protected_branch_id);


--
-- Name: index_protected_branch_merge_access_levels_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_branch_merge_access_levels_on_user_id ON public.protected_branch_merge_access_levels USING btree (user_id);


--
-- Name: index_protected_branch_push_access; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_branch_push_access ON public.protected_branch_push_access_levels USING btree (protected_branch_id);


--
-- Name: index_protected_branch_push_access_levels_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_branch_push_access_levels_on_user_id ON public.protected_branch_push_access_levels USING btree (user_id);


--
-- Name: index_protected_branch_unprotect_access; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_branch_unprotect_access ON public.protected_branch_unprotect_access_levels USING btree (protected_branch_id);


--
-- Name: index_protected_branch_unprotect_access_levels_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_branch_unprotect_access_levels_on_group_id ON public.protected_branch_unprotect_access_levels USING btree (group_id);


--
-- Name: index_protected_branch_unprotect_access_levels_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_branch_unprotect_access_levels_on_user_id ON public.protected_branch_unprotect_access_levels USING btree (user_id);


--
-- Name: index_protected_branches_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_branches_on_project_id ON public.protected_branches USING btree (project_id);


--
-- Name: index_protected_environment_deploy_access; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_environment_deploy_access ON public.protected_environment_deploy_access_levels USING btree (protected_environment_id);


--
-- Name: index_protected_environment_deploy_access_levels_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_environment_deploy_access_levels_on_group_id ON public.protected_environment_deploy_access_levels USING btree (group_id);


--
-- Name: index_protected_environment_deploy_access_levels_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_environment_deploy_access_levels_on_user_id ON public.protected_environment_deploy_access_levels USING btree (user_id);


--
-- Name: index_protected_environments_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_environments_on_project_id ON public.protected_environments USING btree (project_id);


--
-- Name: index_protected_environments_on_project_id_and_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_protected_environments_on_project_id_and_name ON public.protected_environments USING btree (project_id, name);


--
-- Name: index_protected_tag_create_access; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_tag_create_access ON public.protected_tag_create_access_levels USING btree (protected_tag_id);


--
-- Name: index_protected_tag_create_access_levels_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_tag_create_access_levels_on_user_id ON public.protected_tag_create_access_levels USING btree (user_id);


--
-- Name: index_protected_tags_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_protected_tags_on_project_id ON public.protected_tags USING btree (project_id);


--
-- Name: index_protected_tags_on_project_id_and_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_protected_tags_on_project_id_and_name ON public.protected_tags USING btree (project_id, name);


--
-- Name: index_push_event_payloads_on_event_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_push_event_payloads_on_event_id ON public.push_event_payloads USING btree (event_id);


--
-- Name: index_push_rules_on_is_sample; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_push_rules_on_is_sample ON public.push_rules USING btree (is_sample) WHERE is_sample;


--
-- Name: index_push_rules_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_push_rules_on_project_id ON public.push_rules USING btree (project_id);


--
-- Name: index_redirect_routes_on_path; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_redirect_routes_on_path ON public.redirect_routes USING btree (path);


--
-- Name: index_redirect_routes_on_source_type_and_source_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_redirect_routes_on_source_type_and_source_id ON public.redirect_routes USING btree (source_type, source_id);


--
-- Name: index_releases_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_releases_on_project_id ON public.releases USING btree (project_id);


--
-- Name: index_releases_on_project_id_and_tag; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_releases_on_project_id_and_tag ON public.releases USING btree (project_id, tag);


--
-- Name: index_remote_mirrors_on_last_successful_update_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_remote_mirrors_on_last_successful_update_at ON public.remote_mirrors USING btree (last_successful_update_at);


--
-- Name: index_remote_mirrors_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_remote_mirrors_on_project_id ON public.remote_mirrors USING btree (project_id);


--
-- Name: index_repositories_on_disk_path; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_repositories_on_disk_path ON public.repositories USING btree (disk_path);


--
-- Name: index_repositories_on_shard_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_repositories_on_shard_id ON public.repositories USING btree (shard_id);


--
-- Name: index_repository_languages_on_project_and_languages_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_repository_languages_on_project_and_languages_id ON public.repository_languages USING btree (project_id, programming_language_id);


--
-- Name: index_resource_label_events_on_epic_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_resource_label_events_on_epic_id ON public.resource_label_events USING btree (epic_id);


--
-- Name: index_resource_label_events_on_issue_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_resource_label_events_on_issue_id ON public.resource_label_events USING btree (issue_id);


--
-- Name: index_resource_label_events_on_label_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_resource_label_events_on_label_id ON public.resource_label_events USING btree (label_id);


--
-- Name: index_resource_label_events_on_merge_request_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_resource_label_events_on_merge_request_id ON public.resource_label_events USING btree (merge_request_id);


--
-- Name: index_resource_label_events_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_resource_label_events_on_user_id ON public.resource_label_events USING btree (user_id);


--
-- Name: index_routes_on_path; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_routes_on_path ON public.routes USING btree (path);


--
-- Name: index_routes_on_path_text_pattern_ops; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_routes_on_path_text_pattern_ops ON public.routes USING btree (path varchar_pattern_ops);


--
-- Name: index_routes_on_source_type_and_source_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_routes_on_source_type_and_source_id ON public.routes USING btree (source_type, source_id);


--
-- Name: index_saml_providers_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_saml_providers_on_group_id ON public.saml_providers USING btree (group_id);


--
-- Name: index_sent_notifications_on_reply_key; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_sent_notifications_on_reply_key ON public.sent_notifications USING btree (reply_key);


--
-- Name: index_services_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_services_on_project_id ON public.services USING btree (project_id);


--
-- Name: index_services_on_template; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_services_on_template ON public.services USING btree (template);


--
-- Name: index_shards_on_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_shards_on_name ON public.shards USING btree (name);


--
-- Name: index_slack_integrations_on_service_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_slack_integrations_on_service_id ON public.slack_integrations USING btree (service_id);


--
-- Name: index_slack_integrations_on_team_id_and_alias; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_slack_integrations_on_team_id_and_alias ON public.slack_integrations USING btree (team_id, alias);


--
-- Name: index_snippets_on_author_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_snippets_on_author_id ON public.snippets USING btree (author_id);


--
-- Name: index_snippets_on_file_name_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_snippets_on_file_name_trigram ON public.snippets USING gin (file_name public.gin_trgm_ops);


--
-- Name: index_snippets_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_snippets_on_project_id ON public.snippets USING btree (project_id);


--
-- Name: index_snippets_on_title_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_snippets_on_title_trigram ON public.snippets USING gin (title public.gin_trgm_ops);


--
-- Name: index_snippets_on_updated_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_snippets_on_updated_at ON public.snippets USING btree (updated_at);


--
-- Name: index_snippets_on_visibility_level; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_snippets_on_visibility_level ON public.snippets USING btree (visibility_level);


--
-- Name: index_software_license_policies_unique_per_project; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_software_license_policies_unique_per_project ON public.software_license_policies USING btree (project_id, software_license_id);


--
-- Name: index_software_licenses_on_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_software_licenses_on_name ON public.software_licenses USING btree (name);


--
-- Name: index_subscriptions_on_subscribable_and_user_id_and_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_subscriptions_on_subscribable_and_user_id_and_project_id ON public.subscriptions USING btree (subscribable_id, subscribable_type, user_id, project_id);


--
-- Name: index_system_note_metadata_on_note_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_system_note_metadata_on_note_id ON public.system_note_metadata USING btree (note_id);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_taggings_on_tag_id ON public.taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type ON public.taggings USING btree (taggable_id, taggable_type);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type_and_context; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type_and_context ON public.taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_tags_on_name ON public.tags USING btree (name);


--
-- Name: index_term_agreements_on_term_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_term_agreements_on_term_id ON public.term_agreements USING btree (term_id);


--
-- Name: index_term_agreements_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_term_agreements_on_user_id ON public.term_agreements USING btree (user_id);


--
-- Name: index_timelogs_on_issue_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_timelogs_on_issue_id ON public.timelogs USING btree (issue_id);


--
-- Name: index_timelogs_on_merge_request_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_timelogs_on_merge_request_id ON public.timelogs USING btree (merge_request_id);


--
-- Name: index_timelogs_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_timelogs_on_user_id ON public.timelogs USING btree (user_id);


--
-- Name: index_todos_on_author_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_todos_on_author_id ON public.todos USING btree (author_id);


--
-- Name: index_todos_on_commit_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_todos_on_commit_id ON public.todos USING btree (commit_id);


--
-- Name: index_todos_on_group_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_todos_on_group_id ON public.todos USING btree (group_id);


--
-- Name: index_todos_on_note_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_todos_on_note_id ON public.todos USING btree (note_id);


--
-- Name: index_todos_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_todos_on_project_id ON public.todos USING btree (project_id);


--
-- Name: index_todos_on_target_type_and_target_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_todos_on_target_type_and_target_id ON public.todos USING btree (target_type, target_id);


--
-- Name: index_todos_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_todos_on_user_id ON public.todos USING btree (user_id);


--
-- Name: index_todos_on_user_id_and_id_done; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_todos_on_user_id_and_id_done ON public.todos USING btree (user_id, id) WHERE ((state)::text = 'done'::text);


--
-- Name: index_todos_on_user_id_and_id_pending; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_todos_on_user_id_and_id_pending ON public.todos USING btree (user_id, id) WHERE ((state)::text = 'pending'::text);


--
-- Name: index_trending_projects_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_trending_projects_on_project_id ON public.trending_projects USING btree (project_id);


--
-- Name: index_u2f_registrations_on_key_handle; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_u2f_registrations_on_key_handle ON public.u2f_registrations USING btree (key_handle);


--
-- Name: index_u2f_registrations_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_u2f_registrations_on_user_id ON public.u2f_registrations USING btree (user_id);


--
-- Name: index_uploads_on_checksum; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_uploads_on_checksum ON public.uploads USING btree (checksum);


--
-- Name: index_uploads_on_model_id_and_model_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_uploads_on_model_id_and_model_type ON public.uploads USING btree (model_id, model_type);


--
-- Name: index_uploads_on_store; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_uploads_on_store ON public.uploads USING btree (store);


--
-- Name: index_uploads_on_uploader_and_path; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_uploads_on_uploader_and_path ON public.uploads USING btree (uploader, path);


--
-- Name: index_user_agent_details_on_subject_id_and_subject_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_user_agent_details_on_subject_id_and_subject_type ON public.user_agent_details USING btree (subject_id, subject_type);


--
-- Name: index_user_callouts_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_user_callouts_on_user_id ON public.user_callouts USING btree (user_id);


--
-- Name: index_user_callouts_on_user_id_and_feature_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_user_callouts_on_user_id_and_feature_name ON public.user_callouts USING btree (user_id, feature_name);


--
-- Name: index_user_custom_attributes_on_key_and_value; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_user_custom_attributes_on_key_and_value ON public.user_custom_attributes USING btree (key, value);


--
-- Name: index_user_custom_attributes_on_user_id_and_key; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_user_custom_attributes_on_user_id_and_key ON public.user_custom_attributes USING btree (user_id, key);


--
-- Name: index_user_interacted_projects_on_project_id_and_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_user_interacted_projects_on_project_id_and_user_id ON public.user_interacted_projects USING btree (project_id, user_id);


--
-- Name: index_user_interacted_projects_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_user_interacted_projects_on_user_id ON public.user_interacted_projects USING btree (user_id);


--
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_user_preferences_on_user_id ON public.user_preferences USING btree (user_id);


--
-- Name: index_user_synced_attributes_metadata_on_user_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_user_synced_attributes_metadata_on_user_id ON public.user_synced_attributes_metadata USING btree (user_id);


--
-- Name: index_users_on_admin; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_admin ON public.users USING btree (admin);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_created_at; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_created_at ON public.users USING btree (created_at);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_email_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_email_trigram ON public.users USING gin (email public.gin_trgm_ops);


--
-- Name: index_users_on_feed_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_feed_token ON public.users USING btree (feed_token);


--
-- Name: index_users_on_ghost; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_ghost ON public.users USING btree (ghost);


--
-- Name: index_users_on_incoming_email_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_incoming_email_token ON public.users USING btree (incoming_email_token);


--
-- Name: index_users_on_name; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_name ON public.users USING btree (name);


--
-- Name: index_users_on_name_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_name_trigram ON public.users USING gin (name public.gin_trgm_ops);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_state; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_state ON public.users USING btree (state);


--
-- Name: index_users_on_state_and_internal_attrs; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_state_and_internal_attrs ON public.users USING btree (state) WHERE ((ghost <> true) AND (support_bot <> true));


--
-- Name: index_users_on_support_bot; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_support_bot ON public.users USING btree (support_bot);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_username ON public.users USING btree (username);


--
-- Name: index_users_on_username_trigram; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_on_username_trigram ON public.users USING gin (username public.gin_trgm_ops);


--
-- Name: index_users_ops_dashboard_projects_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_ops_dashboard_projects_on_project_id ON public.users_ops_dashboard_projects USING btree (project_id);


--
-- Name: index_users_ops_dashboard_projects_on_user_id_and_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_users_ops_dashboard_projects_on_user_id_and_project_id ON public.users_ops_dashboard_projects USING btree (user_id, project_id);


--
-- Name: index_users_star_projects_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_users_star_projects_on_project_id ON public.users_star_projects USING btree (project_id);


--
-- Name: index_users_star_projects_on_user_id_and_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_users_star_projects_on_user_id_and_project_id ON public.users_star_projects USING btree (user_id, project_id);


--
-- Name: index_vulnerability_feedback_on_author_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_vulnerability_feedback_on_author_id ON public.vulnerability_feedback USING btree (author_id);


--
-- Name: index_vulnerability_feedback_on_issue_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_vulnerability_feedback_on_issue_id ON public.vulnerability_feedback USING btree (issue_id);


--
-- Name: index_vulnerability_feedback_on_pipeline_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_vulnerability_feedback_on_pipeline_id ON public.vulnerability_feedback USING btree (pipeline_id);


--
-- Name: index_vulnerability_identifiers_on_project_id_and_fingerprint; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_vulnerability_identifiers_on_project_id_and_fingerprint ON public.vulnerability_identifiers USING btree (project_id, fingerprint);


--
-- Name: index_vulnerability_occurrence_identifiers_on_identifier_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_vulnerability_occurrence_identifiers_on_identifier_id ON public.vulnerability_occurrence_identifiers USING btree (identifier_id);


--
-- Name: index_vulnerability_occurrence_identifiers_on_unique_keys; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_vulnerability_occurrence_identifiers_on_unique_keys ON public.vulnerability_occurrence_identifiers USING btree (occurrence_id, identifier_id);


--
-- Name: index_vulnerability_occurrence_pipelines_on_pipeline_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_vulnerability_occurrence_pipelines_on_pipeline_id ON public.vulnerability_occurrence_pipelines USING btree (pipeline_id);


--
-- Name: index_vulnerability_occurrences_on_primary_identifier_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_vulnerability_occurrences_on_primary_identifier_id ON public.vulnerability_occurrences USING btree (primary_identifier_id);


--
-- Name: index_vulnerability_occurrences_on_scanner_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_vulnerability_occurrences_on_scanner_id ON public.vulnerability_occurrences USING btree (scanner_id);


--
-- Name: index_vulnerability_occurrences_on_unique_keys; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_vulnerability_occurrences_on_unique_keys ON public.vulnerability_occurrences USING btree (project_id, primary_identifier_id, location_fingerprint, scanner_id);


--
-- Name: index_vulnerability_occurrences_on_uuid; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_vulnerability_occurrences_on_uuid ON public.vulnerability_occurrences USING btree (uuid);


--
-- Name: index_vulnerability_scanners_on_project_id_and_external_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX index_vulnerability_scanners_on_project_id_and_external_id ON public.vulnerability_scanners USING btree (project_id, external_id);


--
-- Name: index_web_hook_logs_on_created_at_and_web_hook_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_web_hook_logs_on_created_at_and_web_hook_id ON public.web_hook_logs USING btree (created_at, web_hook_id);


--
-- Name: index_web_hook_logs_on_web_hook_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_web_hook_logs_on_web_hook_id ON public.web_hook_logs USING btree (web_hook_id);


--
-- Name: index_web_hooks_on_project_id; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_web_hooks_on_project_id ON public.web_hooks USING btree (project_id);


--
-- Name: index_web_hooks_on_type; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX index_web_hooks_on_type ON public.web_hooks USING btree (type);


--
-- Name: kubernetes_namespaces_cluster_and_namespace; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX kubernetes_namespaces_cluster_and_namespace ON public.clusters_kubernetes_namespaces USING btree (cluster_id, namespace);


--
-- Name: partial_index_ci_builds_on_id_with_legacy_artifacts; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX partial_index_ci_builds_on_id_with_legacy_artifacts ON public.ci_builds USING btree (id) WHERE (artifacts_file <> ''::text);


--
-- Name: partial_index_ci_builds_on_scheduled_at_with_scheduled_jobs; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX partial_index_ci_builds_on_scheduled_at_with_scheduled_jobs ON public.ci_builds USING btree (scheduled_at) WHERE ((scheduled_at IS NOT NULL) AND ((type)::text = 'Ci::Build'::text) AND ((status)::text = 'scheduled'::text));


--
-- Name: partial_index_deployments_for_legacy_successful_deployments; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX partial_index_deployments_for_legacy_successful_deployments ON public.deployments USING btree (id) WHERE ((finished_at IS NULL) AND (status = 2));


--
-- Name: taggings_idx; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX taggings_idx ON public.taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: term_agreements_unique_index; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX term_agreements_unique_index ON public.term_agreements USING btree (user_id, term_id);


--
-- Name: tmp_build_stage_position_index; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE INDEX tmp_build_stage_position_index ON public.ci_builds USING btree (stage_id, stage_idx) WHERE (stage_idx IS NOT NULL);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: vulnerability_feedback_unique_idx; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX vulnerability_feedback_unique_idx ON public.vulnerability_feedback USING btree (project_id, category, feedback_type, project_fingerprint);


--
-- Name: vulnerability_occurrence_pipelines_on_unique_keys; Type: INDEX; Schema: public; Owner: gitlab
--

CREATE UNIQUE INDEX vulnerability_occurrence_pipelines_on_unique_keys ON public.vulnerability_occurrence_pipelines USING btree (occurrence_id, pipeline_id);


--
-- Name: fk_02de2ded36; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_runners
    ADD CONSTRAINT fk_02de2ded36 FOREIGN KEY (runner_id) REFERENCES public.ci_runners(id) ON DELETE SET NULL;


--
-- Name: fk_05f1e72feb; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT fk_05f1e72feb FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_06067f5644; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests
    ADD CONSTRAINT fk_06067f5644 FOREIGN KEY (latest_merge_request_diff_id) REFERENCES public.merge_request_diffs(id) ON DELETE SET NULL;


--
-- Name: fk_0894651f08; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_interacted_projects
    ADD CONSTRAINT fk_0894651f08 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_0c8ca6d9d1; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.web_hooks
    ADD CONSTRAINT fk_0c8ca6d9d1 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_0c95e91db7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.notification_settings
    ADD CONSTRAINT fk_0c95e91db7 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_0d3f677137; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT fk_0d3f677137 FOREIGN KEY (board_id) REFERENCES public.boards(id) ON DELETE CASCADE;


--
-- Name: fk_162941d509; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.internal_ids
    ADD CONSTRAINT fk_162941d509 FOREIGN KEY (namespace_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_176d3fbb5d; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT fk_176d3fbb5d FOREIGN KEY (job_artifact_deleted_event_id) REFERENCES public.geo_job_artifact_deleted_events(id) ON DELETE CASCADE;


--
-- Name: fk_18513d9b92; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_features
    ADD CONSTRAINT fk_18513d9b92 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_1e53c97c0a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_sources_pipelines
    ADD CONSTRAINT fk_1e53c97c0a FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_1e9a074a35; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT fk_1e9a074a35 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_22cd27ddfc; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.users_star_projects
    ADD CONSTRAINT fk_22cd27ddfc FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_2360681d1d; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_stages
    ADD CONSTRAINT fk_2360681d1d FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_24c15d2f2e; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_ci_cd_settings
    ADD CONSTRAINT fk_24c15d2f2e FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_262d4c2d19; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipelines
    ADD CONSTRAINT fk_262d4c2d19 FOREIGN KEY (auto_canceled_by_id) REFERENCES public.ci_pipelines(id) ON DELETE SET NULL;


--
-- Name: fk_264e112c66; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_build_trace_sections
    ADD CONSTRAINT fk_264e112c66 FOREIGN KEY (section_name_id) REFERENCES public.ci_build_trace_section_names(id) ON DELETE CASCADE;


--
-- Name: fk_27548c6db3; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT fk_27548c6db3 FOREIGN KEY (hashed_storage_migrated_event_id) REFERENCES public.geo_hashed_storage_migrated_events(id) ON DELETE CASCADE;


--
-- Name: fk_2e88fb7ce9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT fk_2e88fb7ce9 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_310d714958; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.approvals
    ADD CONSTRAINT fk_310d714958 FOREIGN KEY (merge_request_id) REFERENCES public.merge_requests(id) ON DELETE CASCADE;


--
-- Name: fk_319256d87a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.namespaces
    ADD CONSTRAINT fk_319256d87a FOREIGN KEY (file_template_project_id) REFERENCES public.projects(id) ON DELETE SET NULL;


--
-- Name: fk_3308fe130c; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests
    ADD CONSTRAINT fk_3308fe130c FOREIGN KEY (source_project_id) REFERENCES public.projects(id) ON DELETE SET NULL;


--
-- Name: fk_33ae4d58d8; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_group_variables
    ADD CONSTRAINT fk_33ae4d58d8 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_3654b61b03; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epics
    ADD CONSTRAINT fk_3654b61b03 FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_36c74129da; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.push_event_payloads
    ADD CONSTRAINT fk_36c74129da FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: fk_3a9eaa254d; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds
    ADD CONSTRAINT fk_3a9eaa254d FOREIGN KEY (stage_id) REFERENCES public.ci_stages(id) ON DELETE CASCADE;


--
-- Name: fk_3d34ab2e06; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipelines
    ADD CONSTRAINT fk_3d34ab2e06 FOREIGN KEY (pipeline_schedule_id) REFERENCES public.ci_pipeline_schedules(id) ON DELETE SET NULL;


--
-- Name: fk_41c35fda51; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_schedule_variables
    ADD CONSTRAINT fk_41c35fda51 FOREIGN KEY (pipeline_schedule_id) REFERENCES public.ci_pipeline_schedules(id) ON DELETE CASCADE;


--
-- Name: fk_42c3b54bed; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT fk_42c3b54bed FOREIGN KEY (cache_invalidation_event_id) REFERENCES public.geo_cache_invalidation_events(id) ON DELETE CASCADE;


--
-- Name: fk_434510edb0; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.forked_project_links
    ADD CONSTRAINT fk_434510edb0 FOREIGN KEY (forked_to_project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_43a9aa4ca8; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.remote_mirrors
    ADD CONSTRAINT fk_43a9aa4ca8 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_4478a6f1e4; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_runner_projects
    ADD CONSTRAINT fk_4478a6f1e4 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_45054f9c45; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT fk_45054f9c45 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_47fe2a0596; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.releases
    ADD CONSTRAINT fk_47fe2a0596 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_4a99ebfd60; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT fk_4a99ebfd60 FOREIGN KEY (repositories_changed_event_id) REFERENCES public.geo_repositories_changed_events(id) ON DELETE CASCADE;


--
-- Name: fk_4ebe41f502; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_build_trace_sections
    ADD CONSTRAINT fk_4ebe41f502 FOREIGN KEY (build_id) REFERENCES public.ci_builds(id) ON DELETE CASCADE;


--
-- Name: fk_5265c98f24; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.path_locks
    ADD CONSTRAINT fk_5265c98f24 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_557e773639; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_prometheus
    ADD CONSTRAINT fk_557e773639 FOREIGN KEY (cluster_id) REFERENCES public.clusters(id) ON DELETE CASCADE;


--
-- Name: fk_58a901ca7e; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.deploy_keys_projects
    ADD CONSTRAINT fk_58a901ca7e FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_5e0c8d9154; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issue_assignees
    ADD CONSTRAINT fk_5e0c8d9154 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_6149611a04; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests
    ADD CONSTRAINT fk_6149611a04 FOREIGN KEY (assignee_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_641731faff; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests
    ADD CONSTRAINT fk_641731faff FOREIGN KEY (updated_by_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_6a5165a692; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests
    ADD CONSTRAINT fk_6a5165a692 FOREIGN KEY (milestone_id) REFERENCES public.milestones(id) ON DELETE SET NULL;


--
-- Name: fk_6e5c14658a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_6e5c14658a FOREIGN KEY (pool_repository_id) REFERENCES public.repositories(id) ON DELETE SET NULL;


--
-- Name: fk_7111b68cdb; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_push_access_levels
    ADD CONSTRAINT fk_7111b68cdb FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_71cce407f9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT fk_71cce407f9 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_722ceba4f7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_interacted_projects
    ADD CONSTRAINT fk_722ceba4f7 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_74b2492545; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.index_statuses
    ADD CONSTRAINT fk_74b2492545 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_789cd90b35; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_789cd90b35 FOREIGN KEY (accepted_term_id) REFERENCES public.application_setting_terms(id) ON DELETE CASCADE;


--
-- Name: fk_78a6492f68; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT fk_78a6492f68 FOREIGN KEY (repository_updated_event_id) REFERENCES public.geo_repository_updated_events(id) ON DELETE CASCADE;


--
-- Name: fk_7a5553d60f; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT fk_7a5553d60f FOREIGN KEY (label_id) REFERENCES public.labels(id) ON DELETE CASCADE;


--
-- Name: fk_7a9c6d93e7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branches
    ADD CONSTRAINT fk_7a9c6d93e7 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_7de4989a69; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT fk_7de4989a69 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_7f28d925f3; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_request_metrics
    ADD CONSTRAINT fk_7f28d925f3 FOREIGN KEY (merged_by_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_83b29894de; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.push_rules
    ADD CONSTRAINT fk_83b29894de FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_8483f3258f; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_request_diffs
    ADD CONSTRAINT fk_8483f3258f FOREIGN KEY (merge_request_id) REFERENCES public.merge_requests(id) ON DELETE CASCADE;


--
-- Name: fk_86635dbd80; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipelines
    ADD CONSTRAINT fk_86635dbd80 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_86c84214ec; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT fk_86c84214ec FOREIGN KEY (repository_renamed_event_id) REFERENCES public.geo_repository_renamed_events(id) ON DELETE CASCADE;


--
-- Name: fk_86f0f182f8; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.packages_package_files
    ADD CONSTRAINT fk_86f0f182f8 FOREIGN KEY (package_id) REFERENCES public.packages_packages(id) ON DELETE CASCADE;


--
-- Name: fk_899c8f3231; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT fk_899c8f3231 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_8a3072ccb3; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_merge_access_levels
    ADD CONSTRAINT fk_8a3072ccb3 FOREIGN KEY (protected_branch_id) REFERENCES public.protected_branches(id) ON DELETE CASCADE;


--
-- Name: fk_8e4af87648; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_tags
    ADD CONSTRAINT fk_8e4af87648 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_8ead60fcc4; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_schedules
    ADD CONSTRAINT fk_8ead60fcc4 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_91d1f47b13; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT fk_91d1f47b13 FOREIGN KEY (note_id) REFERENCES public.notes(id) ON DELETE CASCADE;


--
-- Name: fk_95650a40d4; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.milestones
    ADD CONSTRAINT fk_95650a40d4 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_964370041d; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.application_settings
    ADD CONSTRAINT fk_964370041d FOREIGN KEY (usage_stats_set_by_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_96b1dd429c; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT fk_96b1dd429c FOREIGN KEY (milestone_id) REFERENCES public.milestones(id) ON DELETE SET NULL;


--
-- Name: fk_98f3d044fe; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_merge_access_levels
    ADD CONSTRAINT fk_98f3d044fe FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_99e097b079; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT fk_99e097b079 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_9b9afb1916; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT fk_9b9afb1916 FOREIGN KEY (repository_created_event_id) REFERENCES public.geo_repository_created_events(id) ON DELETE CASCADE;


--
-- Name: fk_9bd0a0c791; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.milestones
    ADD CONSTRAINT fk_9bd0a0c791 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_9ea99f58d2; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_schedules
    ADD CONSTRAINT fk_9ea99f58d2 FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_9ffc86a3d9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_push_access_levels
    ADD CONSTRAINT fk_9ffc86a3d9 FOREIGN KEY (protected_branch_id) REFERENCES public.protected_branches(id) ON DELETE CASCADE;


--
-- Name: fk_a194299be1; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT fk_a194299be1 FOREIGN KEY (moved_to_id) REFERENCES public.issues(id) ON DELETE SET NULL;


--
-- Name: fk_a2141b1522; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds
    ADD CONSTRAINT fk_a2141b1522 FOREIGN KEY (auto_canceled_by_id) REFERENCES public.ci_pipelines(id) ON DELETE SET NULL;


--
-- Name: fk_a6963e8447; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests
    ADD CONSTRAINT fk_a6963e8447 FOREIGN KEY (target_project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_aa5798e761; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epics
    ADD CONSTRAINT fk_aa5798e761 FOREIGN KEY (closed_by_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_aade90f0fc; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT fk_aade90f0fc FOREIGN KEY (saml_provider_id) REFERENCES public.saml_providers(id) ON DELETE CASCADE;


--
-- Name: fk_acd9737679; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_sources_pipelines
    ADD CONSTRAINT fk_acd9737679 FOREIGN KEY (source_project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_ad525e1f87; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests
    ADD CONSTRAINT fk_ad525e1f87 FOREIGN KEY (merge_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_ada5eb64b3; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_variables
    ADD CONSTRAINT fk_ada5eb64b3 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_ae440388cc; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_request_metrics
    ADD CONSTRAINT fk_ae440388cc FOREIGN KEY (latest_closed_by_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_b01280dae4; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.fork_network_members
    ADD CONSTRAINT fk_b01280dae4 FOREIGN KEY (forked_from_project_id) REFERENCES public.projects(id) ON DELETE SET NULL;


--
-- Name: fk_b4eb82fe3c; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_tag_create_access_levels
    ADD CONSTRAINT fk_b4eb82fe3c FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_b7d881734a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issue_assignees
    ADD CONSTRAINT fk_b7d881734a FOREIGN KEY (issue_id) REFERENCES public.issues(id) ON DELETE CASCADE;


--
-- Name: fk_b8ec8b7245; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_trigger_requests
    ADD CONSTRAINT fk_b8ec8b7245 FOREIGN KEY (trigger_id) REFERENCES public.ci_triggers(id) ON DELETE CASCADE;


--
-- Name: fk_b9a3851b82; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.deployments
    ADD CONSTRAINT fk_b9a3851b82 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_be41fd4bb7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.snippets
    ADD CONSTRAINT fk_be41fd4bb7 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_be5624bf37; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_sources_pipelines
    ADD CONSTRAINT fk_be5624bf37 FOREIGN KEY (source_job_id) REFERENCES public.ci_builds(id) ON DELETE CASCADE;


--
-- Name: fk_be88aed360; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.packages_maven_metadata
    ADD CONSTRAINT fk_be88aed360 FOREIGN KEY (package_id) REFERENCES public.packages_packages(id) ON DELETE CASCADE;


--
-- Name: fk_befce0568a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds
    ADD CONSTRAINT fk_befce0568a FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_c1f241c70d; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT fk_c1f241c70d FOREIGN KEY (upload_deleted_event_id) REFERENCES public.geo_upload_deleted_events(id) ON DELETE CASCADE;


--
-- Name: fk_c4b1c1f66e; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT fk_c4b1c1f66e FOREIGN KEY (repository_deleted_event_id) REFERENCES public.geo_repository_deleted_events(id) ON DELETE CASCADE;


--
-- Name: fk_c63cbf6c25; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT fk_c63cbf6c25 FOREIGN KEY (closed_by_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_c900194ff2; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issue_links
    ADD CONSTRAINT fk_c900194ff2 FOREIGN KEY (source_id) REFERENCES public.issues(id) ON DELETE CASCADE;


--
-- Name: fk_ccf0373936; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT fk_ccf0373936 FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_cff7185ad2; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT fk_cff7185ad2 FOREIGN KEY (reset_checksum_event_id) REFERENCES public.geo_reset_checksum_events(id) ON DELETE CASCADE;


--
-- Name: fk_d1aad367d7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_mirror_data
    ADD CONSTRAINT fk_d1aad367d7 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_d1c8c1da6a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.environments
    ADD CONSTRAINT fk_d1c8c1da6a FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_d3130c9a7f; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds
    ADD CONSTRAINT fk_d3130c9a7f FOREIGN KEY (commit_id) REFERENCES public.ci_pipelines(id) ON DELETE CASCADE;


--
-- Name: fk_d4e29af7d7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_sources_pipelines
    ADD CONSTRAINT fk_d4e29af7d7 FOREIGN KEY (source_pipeline_id) REFERENCES public.ci_pipelines(id) ON DELETE CASCADE;


--
-- Name: fk_d5af95fcd9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_event_log
    ADD CONSTRAINT fk_d5af95fcd9 FOREIGN KEY (lfs_object_deleted_event_id) REFERENCES public.geo_lfs_object_deleted_events(id) ON DELETE CASCADE;


--
-- Name: fk_d6cf4279f7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT fk_d6cf4279f7 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_d83a918cb1; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.system_note_metadata
    ADD CONSTRAINT fk_d83a918cb1 FOREIGN KEY (note_id) REFERENCES public.notes(id) ON DELETE CASCADE;


--
-- Name: fk_d94154aa95; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT fk_d94154aa95 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_d97dd08678; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.label_links
    ADD CONSTRAINT fk_d97dd08678 FOREIGN KEY (label_id) REFERENCES public.labels(id) ON DELETE CASCADE;


--
-- Name: fk_daa8cee94c; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_group_links
    ADD CONSTRAINT fk_daa8cee94c FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_dccd3f98fc; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epics
    ADD CONSTRAINT fk_dccd3f98fc FOREIGN KEY (assignee_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_e1bad85861; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_sources_pipelines
    ADD CONSTRAINT fk_e1bad85861 FOREIGN KEY (pipeline_id) REFERENCES public.ci_pipelines(id) ON DELETE CASCADE;


--
-- Name: fk_e3e63f966e; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_triggers
    ADD CONSTRAINT fk_e3e63f966e FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_e719a85f8a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests
    ADD CONSTRAINT fk_e719a85f8a FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_e71bb44f1f; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issue_links
    ADD CONSTRAINT fk_e71bb44f1f FOREIGN KEY (target_id) REFERENCES public.issues(id) ON DELETE CASCADE;


--
-- Name: fk_e7b436b2b5; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.fork_networks
    ADD CONSTRAINT fk_e7b436b2b5 FOREIGN KEY (root_project_id) REFERENCES public.projects(id) ON DELETE SET NULL;


--
-- Name: fk_e8e10d1964; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_triggers
    ADD CONSTRAINT fk_e8e10d1964 FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_ea2f6dfc6f; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.pages_domains
    ADD CONSTRAINT fk_ea2f6dfc6f FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_ec757bd087; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.application_settings
    ADD CONSTRAINT fk_ec757bd087 FOREIGN KEY (file_template_project_id) REFERENCES public.projects(id) ON DELETE SET NULL;


--
-- Name: fk_edfd187b6f; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_edfd187b6f FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_f081aa4489; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epics
    ADD CONSTRAINT fk_f081aa4489 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_f15266b5f9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT fk_f15266b5f9 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_f29c5f4380; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_variables
    ADD CONSTRAINT fk_f29c5f4380 FOREIGN KEY (pipeline_id) REFERENCES public.ci_pipelines(id) ON DELETE CASCADE;


--
-- Name: fk_f7dfda8c51; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_tag_create_access_levels
    ADD CONSTRAINT fk_f7dfda8c51 FOREIGN KEY (protected_tag_id) REFERENCES public.protected_tags(id) ON DELETE CASCADE;


--
-- Name: fk_fb57e6cc56; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_stages
    ADD CONSTRAINT fk_fb57e6cc56 FOREIGN KEY (pipeline_id) REFERENCES public.ci_pipelines(id) ON DELETE CASCADE;


--
-- Name: fk_fd82eae0b9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests
    ADD CONSTRAINT fk_fd82eae0b9 FOREIGN KEY (head_pipeline_id) REFERENCES public.ci_pipelines(id) ON DELETE SET NULL;


--
-- Name: fk_fdd12e5b80; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.namespaces
    ADD CONSTRAINT fk_fdd12e5b80 FOREIGN KEY (plan_id) REFERENCES public.plans(id) ON DELETE SET NULL;


--
-- Name: fk_ffb9ee3a10; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_import_data
    ADD CONSTRAINT fk_ffb9ee3a10 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_ffed080f01; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT fk_ffed080f01 FOREIGN KEY (updated_by_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_oauth_openid_requests_oauth_access_grants_access_grant_id; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.oauth_openid_requests
    ADD CONSTRAINT fk_oauth_openid_requests_oauth_access_grants_access_grant_id FOREIGN KEY (access_grant_id) REFERENCES public.oauth_access_grants(id);


--
-- Name: fk_rails_0062050394; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.namespace_statistics
    ADD CONSTRAINT fk_rails_0062050394 FOREIGN KEY (namespace_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_0434b48643; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_0434b48643 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_08903b8f38; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT fk_rails_08903b8f38 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: fk_rails_09feecd872; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.trending_projects
    ADD CONSTRAINT fk_rails_09feecd872 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_0aca134388; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_deploy_tokens
    ADD CONSTRAINT fk_rails_0aca134388 FOREIGN KEY (deploy_token_id) REFERENCES public.deploy_tokens(id) ON DELETE CASCADE;


--
-- Name: fk_rails_0ecc699c2a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_node_statuses
    ADD CONSTRAINT fk_rails_0ecc699c2a FOREIGN KEY (geo_node_id) REFERENCES public.geo_nodes(id) ON DELETE CASCADE;


--
-- Name: fk_rails_0f2298ca8a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_repository_states
    ADD CONSTRAINT fk_rails_0f2298ca8a FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_0f4aa0981f; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_synced_attributes_metadata
    ADD CONSTRAINT fk_rails_0f4aa0981f FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_0f84bb11f3; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_authorizations
    ADD CONSTRAINT fk_rails_0f84bb11f3 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_1013b761f2; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_build_trace_chunks
    ADD CONSTRAINT fk_rails_1013b761f2 FOREIGN KEY (build_id) REFERENCES public.ci_builds(id) ON DELETE CASCADE;


--
-- Name: fk_rails_106f901176; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_alert_events
    ADD CONSTRAINT fk_rails_106f901176 FOREIGN KEY (prometheus_alert_id) REFERENCES public.prometheus_alerts(id) ON DELETE CASCADE;


--
-- Name: fk_rails_11ae8cb9a7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gpg_signatures
    ADD CONSTRAINT fk_rails_11ae8cb9a7 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_11e7aa3ed9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_authorizations
    ADD CONSTRAINT fk_rails_11e7aa3ed9 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_12c471002f; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_statistics
    ADD CONSTRAINT fk_rails_12c471002f FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_170e03cbaf; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_deploy_tokens
    ADD CONSTRAINT fk_rails_170e03cbaf FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_17df21c98c; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_jupyter
    ADD CONSTRAINT fk_rails_17df21c98c FOREIGN KEY (cluster_id) REFERENCES public.clusters(id) ON DELETE CASCADE;


--
-- Name: fk_rails_19d4f1c6f9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gpg_signatures
    ADD CONSTRAINT fk_rails_19d4f1c6f9 FOREIGN KEY (gpg_key_subkey_id) REFERENCES public.gpg_key_subkeys(id) ON DELETE SET NULL;


--
-- Name: fk_rails_1bf671ebb7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epics
    ADD CONSTRAINT fk_rails_1bf671ebb7 FOREIGN KEY (milestone_id) REFERENCES public.milestones(id) ON DELETE SET NULL;


--
-- Name: fk_rails_1c0ff59e82; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_assignees
    ADD CONSTRAINT fk_rails_1c0ff59e82 FOREIGN KEY (assignee_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_1cdcbd7723; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.approver_groups
    ADD CONSTRAINT fk_rails_1cdcbd7723 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_1f49e46a61; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repository_created_events
    ADD CONSTRAINT fk_rails_1f49e46a61 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_20976e6fd9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_feedback
    ADD CONSTRAINT fk_rails_20976e6fd9 FOREIGN KEY (pipeline_id) REFERENCES public.ci_pipelines(id) ON DELETE SET NULL;


--
-- Name: fk_rails_2178592333; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_statuses
    ADD CONSTRAINT fk_rails_2178592333 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_220a0562db; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.users_ops_dashboard_projects
    ADD CONSTRAINT fk_rails_220a0562db FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_22388594e9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_runners
    ADD CONSTRAINT fk_rails_22388594e9 FOREIGN KEY (cluster_id) REFERENCES public.clusters(id) ON DELETE CASCADE;


--
-- Name: fk_rails_2349b78b91; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_tag_create_access_levels
    ADD CONSTRAINT fk_rails_2349b78b91 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: fk_rails_246e0db83a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.group_custom_attributes
    ADD CONSTRAINT fk_rails_246e0db83a FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_27a1d98fa8; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lfs_file_locks
    ADD CONSTRAINT fk_rails_27a1d98fa8 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_2a8dac9901; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.draft_notes
    ADD CONSTRAINT fk_rails_2a8dac9901 FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_2b70854c08; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repository_updated_events
    ADD CONSTRAINT fk_rails_2b70854c08 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_2d2aba21ef; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_unprotect_access_levels
    ADD CONSTRAINT fk_rails_2d2aba21ef FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_306d459be7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.saml_providers
    ADD CONSTRAINT fk_rails_306d459be7 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_316aaceda3; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_request_diff_commits
    ADD CONSTRAINT fk_rails_316aaceda3 FOREIGN KEY (merge_request_diff_id) REFERENCES public.merge_request_diffs(id) ON DELETE CASCADE;


--
-- Name: fk_rails_32f7bf5aad; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.container_repositories
    ADD CONSTRAINT fk_rails_32f7bf5aad FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: fk_rails_331f0aff78; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_jupyter
    ADD CONSTRAINT fk_rails_331f0aff78 FOREIGN KEY (oauth_application_id) REFERENCES public.oauth_applications(id) ON DELETE SET NULL;


--
-- Name: fk_rails_33ae169d48; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_request_metrics
    ADD CONSTRAINT fk_rails_33ae169d48 FOREIGN KEY (pipeline_id) REFERENCES public.ci_pipelines(id) ON DELETE CASCADE;


--
-- Name: fk_rails_362b0600a3; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_labels
    ADD CONSTRAINT fk_rails_362b0600a3 FOREIGN KEY (label_id) REFERENCES public.labels(id) ON DELETE CASCADE;


--
-- Name: fk_rails_3b543909cb; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.chat_teams
    ADD CONSTRAINT fk_rails_3b543909cb FOREIGN KEY (namespace_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_3d28377556; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_groups
    ADD CONSTRAINT fk_rails_3d28377556 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_3d66047aeb; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.note_diff_files
    ADD CONSTRAINT fk_rails_3d66047aeb FOREIGN KEY (diff_note_id) REFERENCES public.notes(id) ON DELETE CASCADE;


--
-- Name: fk_rails_3e2b1c06bc; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_helm
    ADD CONSTRAINT fk_rails_3e2b1c06bc FOREIGN KEY (cluster_id) REFERENCES public.clusters(id) ON DELETE CASCADE;


--
-- Name: fk_rails_3f6f926bd5; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_assignees
    ADD CONSTRAINT fk_rails_3f6f926bd5 FOREIGN KEY (board_id) REFERENCES public.boards(id) ON DELETE CASCADE;


--
-- Name: fk_rails_40cc7ccbc3; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_kubernetes_namespaces
    ADD CONSTRAINT fk_rails_40cc7ccbc3 FOREIGN KEY (cluster_project_id) REFERENCES public.cluster_projects(id) ON DELETE SET NULL;


--
-- Name: fk_rails_41d556eb65; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gcp_clusters
    ADD CONSTRAINT fk_rails_41d556eb65 FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE SET NULL;


--
-- Name: fk_rails_41ff5fb854; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_node_namespace_links
    ADD CONSTRAINT fk_rails_41ff5fb854 FOREIGN KEY (namespace_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_4209981af6; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epic_issues
    ADD CONSTRAINT fk_rails_4209981af6 FOREIGN KEY (issue_id) REFERENCES public.issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_43df7a0412; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lfs_file_locks
    ADD CONSTRAINT fk_rails_43df7a0412 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_45436b12b2; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_auto_devops
    ADD CONSTRAINT fk_rails_45436b12b2 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_458eda8667; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests_closing_issues
    ADD CONSTRAINT fk_rails_458eda8667 FOREIGN KEY (merge_request_id) REFERENCES public.merge_requests(id) ON DELETE CASCADE;


--
-- Name: fk_rails_45cc02a931; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_environment_deploy_access_levels
    ADD CONSTRAINT fk_rails_45cc02a931 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_4675865839; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_alert_events
    ADD CONSTRAINT fk_rails_4675865839 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_472f69b043; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_feedback
    ADD CONSTRAINT fk_rails_472f69b043 FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_47b91868a8; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_custom_attributes
    ADD CONSTRAINT fk_rails_47b91868a8 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_4bb543d85d; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.issue_metrics
    ADD CONSTRAINT fk_rails_4bb543d85d FOREIGN KEY (issue_id) REFERENCES public.issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_4c8957a707; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_metrics
    ADD CONSTRAINT fk_rails_4c8957a707 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_4e6524febb; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repository_renamed_events
    ADD CONSTRAINT fk_rails_4e6524febb FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_501aa0a391; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_request_diff_files
    ADD CONSTRAINT fk_rails_501aa0a391 FOREIGN KEY (merge_request_diff_id) REFERENCES public.merge_request_diffs(id) ON DELETE CASCADE;


--
-- Name: fk_rails_546bf08d3e; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_node_namespace_links
    ADD CONSTRAINT fk_rails_546bf08d3e FOREIGN KEY (geo_node_id) REFERENCES public.geo_nodes(id) ON DELETE CASCADE;


--
-- Name: fk_rails_54fc91e0a0; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_knative
    ADD CONSTRAINT fk_rails_54fc91e0a0 FOREIGN KEY (cluster_id) REFERENCES public.clusters(id) ON DELETE CASCADE;


--
-- Name: fk_rails_5a7c055bdc; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.badges
    ADD CONSTRAINT fk_rails_5a7c055bdc FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_5ac1d2fc24; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.resource_label_events
    ADD CONSTRAINT fk_rails_5ac1d2fc24 FOREIGN KEY (issue_id) REFERENCES public.issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_5b9f6970fe; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_environment_deploy_access_levels
    ADD CONSTRAINT fk_rails_5b9f6970fe FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_5be1abfc25; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_unprotect_access_levels
    ADD CONSTRAINT fk_rails_5be1abfc25 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_5c2c3bc814; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_providers_gcp
    ADD CONSTRAINT fk_rails_5c2c3bc814 FOREIGN KEY (cluster_id) REFERENCES public.clusters(id) ON DELETE CASCADE;


--
-- Name: fk_rails_5c9d42a221; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_scanners
    ADD CONSTRAINT fk_rails_5c9d42a221 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_5d942936b4; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epic_issues
    ADD CONSTRAINT fk_rails_5d942936b4 FOREIGN KEY (epic_id) REFERENCES public.epics(id) ON DELETE CASCADE;


--
-- Name: fk_rails_5ffb4f3590; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_merge_access_levels
    ADD CONSTRAINT fk_rails_5ffb4f3590 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: fk_rails_6421e35d7d; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrence_pipelines
    ADD CONSTRAINT fk_rails_6421e35d7d FOREIGN KEY (pipeline_id) REFERENCES public.ci_pipelines(id) ON DELETE CASCADE;


--
-- Name: fk_rails_648e241be7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.operations_feature_flags
    ADD CONSTRAINT fk_rails_648e241be7 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_64bfc19bc5; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_group_recent_visits
    ADD CONSTRAINT fk_rails_64bfc19bc5 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_64ebfab6b3; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_chat_data
    ADD CONSTRAINT fk_rails_64ebfab6b3 FOREIGN KEY (pipeline_id) REFERENCES public.ci_pipelines(id) ON DELETE CASCADE;


--
-- Name: fk_rails_6650ed902c; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.operations_feature_flags_clients
    ADD CONSTRAINT fk_rails_6650ed902c FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_666826e111; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.web_hook_logs
    ADD CONSTRAINT fk_rails_666826e111 FOREIGN KEY (web_hook_id) REFERENCES public.web_hooks(id) ON DELETE CASCADE;


--
-- Name: fk_rails_687ed7d7c5; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_hashed_storage_migrated_events
    ADD CONSTRAINT fk_rails_687ed7d7c5 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_6d9b283465; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_alerts
    ADD CONSTRAINT fk_rails_6d9b283465 FOREIGN KEY (environment_id) REFERENCES public.environments(id) ON DELETE CASCADE;


--
-- Name: fk_rails_6ea6520e4a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.term_agreements
    ADD CONSTRAINT fk_rails_6ea6520e4a FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_70707857d3; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds_runner_session
    ADD CONSTRAINT fk_rails_70707857d3 FOREIGN KEY (build_id) REFERENCES public.ci_builds(id) ON DELETE CASCADE;


--
-- Name: fk_rails_719c3dccc5; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_custom_attributes
    ADD CONSTRAINT fk_rails_719c3dccc5 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_73db19721a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.slack_integrations
    ADD CONSTRAINT fk_rails_73db19721a FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: fk_rails_753a7b41c1; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_applications_ingress
    ADD CONSTRAINT fk_rails_753a7b41c1 FOREIGN KEY (cluster_id) REFERENCES public.clusters(id) ON DELETE CASCADE;


--
-- Name: fk_rails_75ec0fefcc; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_repositories_changed_events
    ADD CONSTRAINT fk_rails_75ec0fefcc FOREIGN KEY (geo_node_id) REFERENCES public.geo_nodes(id) ON DELETE CASCADE;


--
-- Name: fk_rails_75efb0a653; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.resource_label_events
    ADD CONSTRAINT fk_rails_75efb0a653 FOREIGN KEY (epic_id) REFERENCES public.epics(id) ON DELETE CASCADE;


--
-- Name: fk_rails_762cdcf942; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.path_locks
    ADD CONSTRAINT fk_rails_762cdcf942 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: fk_rails_7a7a2a92de; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.software_license_policies
    ADD CONSTRAINT fk_rails_7a7a2a92de FOREIGN KEY (software_license_id) REFERENCES public.software_licenses(id) ON DELETE CASCADE;


--
-- Name: fk_rails_7e7688ecaf; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_kubernetes_namespaces
    ADD CONSTRAINT fk_rails_7e7688ecaf FOREIGN KEY (cluster_id) REFERENCES public.clusters(id) ON DELETE CASCADE;


--
-- Name: fk_rails_8767676b7a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_runner_namespaces
    ADD CONSTRAINT fk_rails_8767676b7a FOREIGN KEY (runner_id) REFERENCES public.ci_runners(id) ON DELETE CASCADE;


--
-- Name: fk_rails_87b2247ce5; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.software_license_policies
    ADD CONSTRAINT fk_rails_87b2247ce5 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_898a13b650; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_environment_deploy_access_levels
    ADD CONSTRAINT fk_rails_898a13b650 FOREIGN KEY (protected_environment_id) REFERENCES public.protected_environments(id) ON DELETE CASCADE;


--
-- Name: fk_rails_8b2c90b046; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gpg_key_subkeys
    ADD CONSTRAINT fk_rails_8b2c90b046 FOREIGN KEY (gpg_key_id) REFERENCES public.gpg_keys(id) ON DELETE CASCADE;


--
-- Name: fk_rails_8b8c5caf07; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_projects
    ADD CONSTRAINT fk_rails_8b8c5caf07 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_8c77e5891a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_feedback
    ADD CONSTRAINT fk_rails_8c77e5891a FOREIGN KEY (issue_id) REFERENCES public.issues(id) ON DELETE SET NULL;


--
-- Name: fk_rails_8dcb712d65; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_push_access_levels
    ADD CONSTRAINT fk_rails_8dcb712d65 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: fk_rails_90fed4faba; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrences
    ADD CONSTRAINT fk_rails_90fed4faba FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_910a06f12b; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_reset_checksum_events
    ADD CONSTRAINT fk_rails_910a06f12b FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_9374a16edd; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_labels
    ADD CONSTRAINT fk_rails_9374a16edd FOREIGN KEY (board_id) REFERENCES public.boards(id) ON DELETE CASCADE;


--
-- Name: fk_rails_95a99c2d56; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT fk_rails_95a99c2d56 FOREIGN KEY (shard_id) REFERENCES public.shards(id) ON DELETE RESTRICT;


--
-- Name: fk_rails_9851a00031; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.resource_label_events
    ADD CONSTRAINT fk_rails_9851a00031 FOREIGN KEY (merge_request_id) REFERENCES public.merge_requests(id) ON DELETE CASCADE;


--
-- Name: fk_rails_9862d392f9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_job_artifacts
    ADD CONSTRAINT fk_rails_9862d392f9 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_98f8843922; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_project_recent_visits
    ADD CONSTRAINT fk_rails_98f8843922 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_98fe21e486; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters_kubernetes_namespaces
    ADD CONSTRAINT fk_rails_98fe21e486 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE SET NULL;


--
-- Name: fk_rails_9b4ebf005b; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.users_ops_dashboard_projects
    ADD CONSTRAINT fk_rails_9b4ebf005b FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_9d1f5d8719; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gpg_keys
    ADD CONSTRAINT fk_rails_9d1f5d8719 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_9df4a56538; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.badges
    ADD CONSTRAINT fk_rails_9df4a56538 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_a27c483435; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT fk_rails_a27c483435 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_a354313d11; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_environments
    ADD CONSTRAINT fk_rails_a354313d11 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_a40860a1ca; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.fork_network_members
    ADD CONSTRAINT fk_rails_a40860a1ca FOREIGN KEY (fork_network_id) REFERENCES public.fork_networks(id) ON DELETE CASCADE;


--
-- Name: fk_rails_a5a958bca1; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_projects
    ADD CONSTRAINT fk_rails_a5a958bca1 FOREIGN KEY (cluster_id) REFERENCES public.clusters(id) ON DELETE CASCADE;


--
-- Name: fk_rails_a67a16c885; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_identifiers
    ADD CONSTRAINT fk_rails_a67a16c885 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_a69bfcfd81; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT fk_rails_a69bfcfd81 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_a750ec87a8; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.repository_languages
    ADD CONSTRAINT fk_rails_a750ec87a8 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_a88721bcdf; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.term_agreements
    ADD CONSTRAINT fk_rails_a88721bcdf FOREIGN KEY (term_id) REFERENCES public.application_setting_terms(id);


--
-- Name: fk_rails_ab7c104e26; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_build_trace_sections
    ADD CONSTRAINT fk_rails_ab7c104e26 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_ac3a663d79; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT fk_rails_ac3a663d79 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_rails_b126799f57; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.resource_label_events
    ADD CONSTRAINT fk_rails_b126799f57 FOREIGN KEY (label_id) REFERENCES public.labels(id) ON DELETE SET NULL;


--
-- Name: fk_rails_b1dbe50e98; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gcp_clusters
    ADD CONSTRAINT fk_rails_b1dbe50e98 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_b315dd0c80; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_project_recent_visits
    ADD CONSTRAINT fk_rails_b315dd0c80 FOREIGN KEY (board_id) REFERENCES public.boards(id) ON DELETE CASCADE;


--
-- Name: fk_rails_b53e481273; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.application_settings
    ADD CONSTRAINT fk_rails_b53e481273 FOREIGN KEY (custom_project_templates_group_id) REFERENCES public.namespaces(id) ON DELETE SET NULL;


--
-- Name: fk_rails_baed5f39b7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT fk_rails_baed5f39b7 FOREIGN KEY (milestone_id) REFERENCES public.milestones(id) ON DELETE CASCADE;


--
-- Name: fk_rails_be2e49e1d0; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrence_identifiers
    ADD CONSTRAINT fk_rails_be2e49e1d0 FOREIGN KEY (identifier_id) REFERENCES public.vulnerability_identifiers(id) ON DELETE CASCADE;


--
-- Name: fk_rails_bf5b788ca7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrences
    ADD CONSTRAINT fk_rails_bf5b788ca7 FOREIGN KEY (scanner_id) REFERENCES public.vulnerability_scanners(id) ON DELETE CASCADE;


--
-- Name: fk_rails_bfe6a84544; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.u2f_registrations
    ADD CONSTRAINT fk_rails_bfe6a84544 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: fk_rails_c1ac5161d8; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT fk_rails_c1ac5161d8 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_c5137cb2c1; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_job_artifacts
    ADD CONSTRAINT fk_rails_c5137cb2c1 FOREIGN KEY (job_id) REFERENCES public.ci_builds(id) ON DELETE CASCADE;


--
-- Name: fk_rails_c8661a61eb; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrences
    ADD CONSTRAINT fk_rails_c8661a61eb FOREIGN KEY (primary_identifier_id) REFERENCES public.vulnerability_identifiers(id) ON DELETE CASCADE;


--
-- Name: fk_rails_c97176f5f7; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gpg_signatures
    ADD CONSTRAINT fk_rails_c97176f5f7 FOREIGN KEY (gpg_key_id) REFERENCES public.gpg_keys(id) ON DELETE SET NULL;


--
-- Name: fk_rails_ca04c38720; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_group_recent_visits
    ADD CONSTRAINT fk_rails_ca04c38720 FOREIGN KEY (board_id) REFERENCES public.boards(id) ON DELETE CASCADE;


--
-- Name: fk_rails_d071904753; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.epic_metrics
    ADD CONSTRAINT fk_rails_d071904753 FOREIGN KEY (epic_id) REFERENCES public.epics(id) ON DELETE CASCADE;


--
-- Name: fk_rails_d0c8bda804; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fk_rails_d0c8bda804 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_d496b088e9; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.geo_hashed_storage_attachments_events
    ADD CONSTRAINT fk_rails_d496b088e9 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_dc3ae04693; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrence_pipelines
    ADD CONSTRAINT fk_rails_dc3ae04693 FOREIGN KEY (occurrence_id) REFERENCES public.vulnerability_occurrences(id) ON DELETE CASCADE;


--
-- Name: fk_rails_dc6f095aad; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.gcp_clusters
    ADD CONSTRAINT fk_rails_dc6f095aad FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_rails_ddfdd80f3d; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.user_callouts
    ADD CONSTRAINT fk_rails_ddfdd80f3d FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_debd54e456; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_feedback
    ADD CONSTRAINT fk_rails_debd54e456 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_e161058b0f; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.label_priorities
    ADD CONSTRAINT fk_rails_e161058b0f FOREIGN KEY (label_id) REFERENCES public.labels(id) ON DELETE CASCADE;


--
-- Name: fk_rails_e1ac527425; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.packages_packages
    ADD CONSTRAINT fk_rails_e1ac527425 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_e1e2cf841a; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_platforms_kubernetes
    ADD CONSTRAINT fk_rails_e1e2cf841a FOREIGN KEY (cluster_id) REFERENCES public.clusters(id) ON DELETE CASCADE;


--
-- Name: fk_rails_e20479742e; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds_metadata
    ADD CONSTRAINT fk_rails_e20479742e FOREIGN KEY (build_id) REFERENCES public.ci_builds(id) ON DELETE CASCADE;


--
-- Name: fk_rails_e4ef6d027c; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.vulnerability_occurrence_identifiers
    ADD CONSTRAINT fk_rails_e4ef6d027c FOREIGN KEY (occurrence_id) REFERENCES public.vulnerability_occurrences(id) ON DELETE CASCADE;


--
-- Name: fk_rails_e6351447ec; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_alerts
    ADD CONSTRAINT fk_rails_e6351447ec FOREIGN KEY (prometheus_metric_id) REFERENCES public.prometheus_metrics(id) ON DELETE CASCADE;


--
-- Name: fk_rails_e6d7c24d1b; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_request_metrics
    ADD CONSTRAINT fk_rails_e6d7c24d1b FOREIGN KEY (merge_request_id) REFERENCES public.merge_requests(id) ON DELETE CASCADE;


--
-- Name: fk_rails_e753681674; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.draft_notes
    ADD CONSTRAINT fk_rails_e753681674 FOREIGN KEY (merge_request_id) REFERENCES public.merge_requests(id) ON DELETE CASCADE;


--
-- Name: fk_rails_e9eb8dc025; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.protected_branch_unprotect_access_levels
    ADD CONSTRAINT fk_rails_e9eb8dc025 FOREIGN KEY (protected_branch_id) REFERENCES public.protected_branches(id) ON DELETE CASCADE;


--
-- Name: fk_rails_ef916d14fa; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.label_priorities
    ADD CONSTRAINT fk_rails_ef916d14fa FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_efccadc4ec; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.fork_network_members
    ADD CONSTRAINT fk_rails_efccadc4ec FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_f0e8db86aa; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.prometheus_alerts
    ADD CONSTRAINT fk_rails_f0e8db86aa FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_f129140f9e; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.import_export_uploads
    ADD CONSTRAINT fk_rails_f129140f9e FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_f300456b63; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_pipeline_chat_data
    ADD CONSTRAINT fk_rails_f300456b63 FOREIGN KEY (chat_name_id) REFERENCES public.chat_names(id) ON DELETE CASCADE;


--
-- Name: fk_rails_f410736518; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_group_recent_visits
    ADD CONSTRAINT fk_rails_f410736518 FOREIGN KEY (group_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_f7d46b66c6; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.internal_ids
    ADD CONSTRAINT fk_rails_f7d46b66c6 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_f8540692be; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.merge_requests_closing_issues
    ADD CONSTRAINT fk_rails_f8540692be FOREIGN KEY (issue_id) REFERENCES public.issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_f8cd72cd26; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_build_trace_section_names
    ADD CONSTRAINT fk_rails_f8cd72cd26 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_f9d9ed3308; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_runner_namespaces
    ADD CONSTRAINT fk_rails_f9d9ed3308 FOREIGN KEY (namespace_id) REFERENCES public.namespaces(id) ON DELETE CASCADE;


--
-- Name: fk_rails_fb6fc419cb; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.board_project_recent_visits
    ADD CONSTRAINT fk_rails_fb6fc419cb FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: fk_rails_fdb8648a96; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.cluster_groups
    ADD CONSTRAINT fk_rails_fdb8648a96 FOREIGN KEY (cluster_id) REFERENCES public.clusters(id) ON DELETE CASCADE;


--
-- Name: fk_rails_fe56f57fc6; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.project_tracing_settings
    ADD CONSTRAINT fk_rails_fe56f57fc6 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_fe91ece594; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.resource_label_events
    ADD CONSTRAINT fk_rails_fe91ece594 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: fk_rails_ffcf702a02; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.ci_builds_metadata
    ADD CONSTRAINT fk_rails_ffcf702a02 FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: fk_timelogs_issues_issue_id; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.timelogs
    ADD CONSTRAINT fk_timelogs_issues_issue_id FOREIGN KEY (issue_id) REFERENCES public.issues(id) ON DELETE CASCADE;


--
-- Name: fk_timelogs_merge_requests_merge_request_id; Type: FK CONSTRAINT; Schema: public; Owner: gitlab
--

ALTER TABLE ONLY public.timelogs
    ADD CONSTRAINT fk_timelogs_merge_requests_merge_request_id FOREIGN KEY (merge_request_id) REFERENCES public.merge_requests(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

