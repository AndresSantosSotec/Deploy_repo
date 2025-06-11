--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Ubuntu 14.18-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 17.2

-- Started on 2025-06-11 13:21:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3953 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 17352)
-- Name: advisor_commission_rates; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.advisor_commission_rates (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    rate numeric(5,2) DEFAULT '0'::numeric NOT NULL,
    effective_from date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.advisor_commission_rates OWNER TO asm_prod_user;

--
-- TOC entry 210 (class 1259 OID 17356)
-- Name: advisor_commission_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.advisor_commission_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.advisor_commission_rates_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3955 (class 0 OID 0)
-- Dependencies: 210
-- Name: advisor_commission_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.advisor_commission_rates_id_seq OWNED BY public.advisor_commission_rates.id;


--
-- TOC entry 211 (class 1259 OID 17357)
-- Name: approval_flows; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.approval_flows (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    code character varying(40) NOT NULL,
    description text,
    scope character varying(30) NOT NULL,
    is_active boolean DEFAULT true,
    parallel boolean DEFAULT false,
    auto_escalate boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.approval_flows OWNER TO asm_prod_user;

--
-- TOC entry 212 (class 1259 OID 17367)
-- Name: approval_flows_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.approval_flows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.approval_flows_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3956 (class 0 OID 0)
-- Dependencies: 212
-- Name: approval_flows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.approval_flows_id_seq OWNED BY public.approval_flows.id;


--
-- TOC entry 213 (class 1259 OID 17368)
-- Name: approval_stages; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.approval_stages (
    id integer NOT NULL,
    flow_id integer,
    stage_order integer NOT NULL,
    title character varying(120) NOT NULL,
    approver_role_id integer,
    approver_role_slug character varying(60),
    max_hours integer DEFAULT 24,
    mandatory boolean DEFAULT true,
    notify_requester boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.approval_stages OWNER TO asm_prod_user;

--
-- TOC entry 214 (class 1259 OID 17376)
-- Name: approval_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.approval_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.approval_stages_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3957 (class 0 OID 0)
-- Dependencies: 214
-- Name: approval_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.approval_stages_id_seq OWNED BY public.approval_stages.id;


--
-- TOC entry 215 (class 1259 OID 17377)
-- Name: auditlogs; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.auditlogs (
    id integer NOT NULL,
    user_id integer NOT NULL,
    action character varying(50),
    module character varying(50),
    target_id integer,
    ip_address character varying(45),
    user_agent text,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    level character varying(10),
    details text,
    view character varying(100),
    CONSTRAINT auditlogs_level_check CHECK (((level)::text = ANY (ARRAY[('Info'::character varying)::text, ('Alerta'::character varying)::text, ('Error'::character varying)::text])))
);


ALTER TABLE public.auditlogs OWNER TO asm_prod_user;

--
-- TOC entry 216 (class 1259 OID 17384)
-- Name: auditlogs_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.auditlogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auditlogs_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3958 (class 0 OID 0)
-- Dependencies: 216
-- Name: auditlogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.auditlogs_id_seq OWNED BY public.auditlogs.id;


--
-- TOC entry 217 (class 1259 OID 17385)
-- Name: column_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.column_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.column_configurations_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 218 (class 1259 OID 17386)
-- Name: column_configurations; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.column_configurations (
    id bigint DEFAULT nextval('public.column_configurations_id_seq'::regclass) NOT NULL,
    id_tipo bigint NOT NULL,
    column_name character varying(100) NOT NULL,
    excel_column_name character varying(100) NOT NULL,
    column_number integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.column_configurations OWNER TO asm_prod_user;

--
-- TOC entry 219 (class 1259 OID 17390)
-- Name: commission_configs; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.commission_configs (
    id bigint NOT NULL,
    base_rate numeric(5,2) DEFAULT '0'::numeric NOT NULL,
    bonus_threshold integer DEFAULT 0 NOT NULL,
    bonus_rate numeric(5,2) DEFAULT '0'::numeric NOT NULL,
    period character varying(255) DEFAULT 'monthly'::character varying NOT NULL,
    respect_personalized boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT commission_configs_period_check CHECK (((period)::text = ANY (ARRAY[('monthly'::character varying)::text, ('quarterly'::character varying)::text])))
);


ALTER TABLE public.commission_configs OWNER TO asm_prod_user;

--
-- TOC entry 220 (class 1259 OID 17399)
-- Name: commission_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.commission_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commission_configs_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3959 (class 0 OID 0)
-- Dependencies: 220
-- Name: commission_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.commission_configs_id_seq OWNED BY public.commission_configs.id;


--
-- TOC entry 221 (class 1259 OID 17400)
-- Name: commissions; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.commissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    period_start date NOT NULL,
    period_end date NOT NULL,
    total_income numeric(14,2) DEFAULT '0'::numeric NOT NULL,
    conversions integer DEFAULT 0 NOT NULL,
    rate_applied numeric(5,2) DEFAULT '0'::numeric NOT NULL,
    commission_amount numeric(14,2) DEFAULT '0'::numeric NOT NULL,
    difference numeric(14,2) DEFAULT '0'::numeric NOT NULL,
    config_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.commissions OWNER TO asm_prod_user;

--
-- TOC entry 222 (class 1259 OID 17408)
-- Name: commissions_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.commissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commissions_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3960 (class 0 OID 0)
-- Dependencies: 222
-- Name: commissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.commissions_id_seq OWNED BY public.commissions.id;


--
-- TOC entry 223 (class 1259 OID 17409)
-- Name: contactos_enviados; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.contactos_enviados (
    id bigint NOT NULL,
    prospecto_id bigint NOT NULL,
    canal character varying(50) NOT NULL,
    tipo_contacto character varying(50),
    fecha_envio timestamp without time zone DEFAULT now() NOT NULL,
    resultado character varying(100),
    observaciones text,
    creado_por integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.contactos_enviados OWNER TO asm_prod_user;

--
-- TOC entry 224 (class 1259 OID 17416)
-- Name: contactos_enviados_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.contactos_enviados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contactos_enviados_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3961 (class 0 OID 0)
-- Dependencies: 224
-- Name: contactos_enviados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.contactos_enviados_id_seq OWNED BY public.contactos_enviados.id;


--
-- TOC entry 225 (class 1259 OID 17417)
-- Name: courses; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    area character varying(255) NOT NULL,
    credits smallint NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    schedule character varying(255) NOT NULL,
    duration character varying(255) NOT NULL,
    facilitator_id bigint,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    students integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT courses_area_check CHECK (((area)::text = ANY (ARRAY[('common'::character varying)::text, ('specialty'::character varying)::text]))),
    CONSTRAINT courses_status_check CHECK (((status)::text = ANY (ARRAY[('draft'::character varying)::text, ('approved'::character varying)::text, ('synced'::character varying)::text])))
);


ALTER TABLE public.courses OWNER TO asm_prod_user;

--
-- TOC entry 226 (class 1259 OID 17426)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3962 (class 0 OID 0)
-- Dependencies: 226
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- TOC entry 227 (class 1259 OID 17427)
-- Name: cuotas_programa_estudiante; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.cuotas_programa_estudiante (
    id bigint NOT NULL,
    estudiante_programa_id bigint NOT NULL,
    numero_cuota integer NOT NULL,
    fecha_vencimiento date NOT NULL,
    monto numeric(12,2) NOT NULL,
    estado character varying(20) DEFAULT 'pendiente'::character varying NOT NULL,
    paid_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.cuotas_programa_estudiante OWNER TO asm_prod_user;

--
-- TOC entry 228 (class 1259 OID 17433)
-- Name: cuotas_programa_estudiante_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.cuotas_programa_estudiante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cuotas_programa_estudiante_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3963 (class 0 OID 0)
-- Dependencies: 228
-- Name: cuotas_programa_estudiante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.cuotas_programa_estudiante_id_seq OWNED BY public.cuotas_programa_estudiante.id;


--
-- TOC entry 229 (class 1259 OID 17434)
-- Name: curso_prospecto; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.curso_prospecto (
    id bigint NOT NULL,
    prospecto_id bigint NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.curso_prospecto OWNER TO asm_prod_user;

--
-- TOC entry 230 (class 1259 OID 17437)
-- Name: curso_prospecto_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.curso_prospecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.curso_prospecto_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3964 (class 0 OID 0)
-- Dependencies: 230
-- Name: curso_prospecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.curso_prospecto_id_seq OWNED BY public.curso_prospecto.id;


--
-- TOC entry 231 (class 1259 OID 17438)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.departamentos (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    pais_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.departamentos OWNER TO asm_prod_user;

--
-- TOC entry 232 (class 1259 OID 17441)
-- Name: departamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.departamentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamentos_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3965 (class 0 OID 0)
-- Dependencies: 232
-- Name: departamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.departamentos_id_seq OWNED BY public.departamentos.id;


--
-- TOC entry 233 (class 1259 OID 17442)
-- Name: duplicate_records; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.duplicate_records (
    id bigint NOT NULL,
    original_prospect_id bigint NOT NULL,
    duplicate_prospect_id bigint NOT NULL,
    similarity_score integer NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT duplicate_records_status_check CHECK (((status)::text = ANY (ARRAY[('pending'::character varying)::text, ('resolved'::character varying)::text])))
);


ALTER TABLE public.duplicate_records OWNER TO asm_prod_user;

--
-- TOC entry 234 (class 1259 OID 17447)
-- Name: duplicate_records_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.duplicate_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.duplicate_records_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3966 (class 0 OID 0)
-- Dependencies: 234
-- Name: duplicate_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.duplicate_records_id_seq OWNED BY public.duplicate_records.id;


--
-- TOC entry 235 (class 1259 OID 17448)
-- Name: estudiante_programa; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.estudiante_programa (
    id bigint NOT NULL,
    prospecto_id bigint NOT NULL,
    programa_id bigint NOT NULL,
    convenio_id bigint,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    duracion_meses integer NOT NULL,
    inscripcion numeric(12,2) NOT NULL,
    cuota_mensual numeric(12,2) NOT NULL,
    inversion_total numeric(14,2) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    deleted_by integer
);


ALTER TABLE public.estudiante_programa OWNER TO asm_prod_user;

--
-- TOC entry 236 (class 1259 OID 17453)
-- Name: estudiante_programa_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.estudiante_programa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiante_programa_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3967 (class 0 OID 0)
-- Dependencies: 236
-- Name: estudiante_programa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.estudiante_programa_id_seq OWNED BY public.estudiante_programa.id;


--
-- TOC entry 237 (class 1259 OID 17454)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO asm_prod_user;

--
-- TOC entry 238 (class 1259 OID 17460)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3968 (class 0 OID 0)
-- Dependencies: 238
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 239 (class 1259 OID 17461)
-- Name: flow_program; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.flow_program (
    flow_id integer NOT NULL,
    program_id bigint NOT NULL
);


ALTER TABLE public.flow_program OWNER TO asm_prod_user;

--
-- TOC entry 240 (class 1259 OID 17464)
-- Name: groupmemberships; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.groupmemberships (
    group_id integer NOT NULL,
    member_id integer NOT NULL,
    member_type character varying(10),
    joined_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT groupmemberships_member_type_check CHECK (((member_type)::text = ANY (ARRAY[('user'::character varying)::text, ('group'::character varying)::text])))
);


ALTER TABLE public.groupmemberships OWNER TO asm_prod_user;

--
-- TOC entry 241 (class 1259 OID 17469)
-- Name: groups; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    parent_group_id integer,
    type character varying(20)
);


ALTER TABLE public.groups OWNER TO asm_prod_user;

--
-- TOC entry 242 (class 1259 OID 17475)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3969 (class 0 OID 0)
-- Dependencies: 242
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 243 (class 1259 OID 17476)
-- Name: kardex_pagos; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.kardex_pagos (
    id bigint NOT NULL,
    estudiante_programa_id bigint NOT NULL,
    cuota_id bigint,
    fecha_pago date NOT NULL,
    monto_pagado numeric(12,2) NOT NULL,
    metodo_pago character varying(50),
    observaciones text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.kardex_pagos OWNER TO asm_prod_user;

--
-- TOC entry 244 (class 1259 OID 17483)
-- Name: kardex_pagos_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.kardex_pagos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kardex_pagos_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3970 (class 0 OID 0)
-- Dependencies: 244
-- Name: kardex_pagos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.kardex_pagos_id_seq OWNED BY public.kardex_pagos.id;


--
-- TOC entry 245 (class 1259 OID 17484)
-- Name: mfaconfigurations; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.mfaconfigurations (
    id integer NOT NULL,
    user_id integer NOT NULL,
    method character varying(20),
    secret character varying(255),
    last_used timestamp without time zone,
    is_primary boolean DEFAULT false,
    is_enabled boolean DEFAULT true,
    CONSTRAINT mfaconfigurations_method_check CHECK (((method)::text = ANY (ARRAY[('App'::character varying)::text, ('SMS'::character varying)::text, ('Email'::character varying)::text, ('FIDO2'::character varying)::text])))
);


ALTER TABLE public.mfaconfigurations OWNER TO asm_prod_user;

--
-- TOC entry 246 (class 1259 OID 17490)
-- Name: mfaconfigurations_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.mfaconfigurations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mfaconfigurations_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3971 (class 0 OID 0)
-- Dependencies: 246
-- Name: mfaconfigurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.mfaconfigurations_id_seq OWNED BY public.mfaconfigurations.id;


--
-- TOC entry 247 (class 1259 OID 17491)
-- Name: migrations; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO asm_prod_user;

--
-- TOC entry 248 (class 1259 OID 17494)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3972 (class 0 OID 0)
-- Dependencies: 248
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 249 (class 1259 OID 17495)
-- Name: modules; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.modules (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    status boolean DEFAULT true,
    view_count integer DEFAULT 0,
    icon character varying(50),
    order_num integer
);


ALTER TABLE public.modules OWNER TO asm_prod_user;

--
-- TOC entry 250 (class 1259 OID 17502)
-- Name: modules_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modules_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3973 (class 0 OID 0)
-- Dependencies: 250
-- Name: modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.modules_id_seq OWNED BY public.modules.id;


--
-- TOC entry 251 (class 1259 OID 17503)
-- Name: moduleviews; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.moduleviews (
    id integer NOT NULL,
    module_id integer NOT NULL,
    menu character varying(100),
    submenu character varying(100),
    view_path character varying(255),
    status character varying(20),
    order_num integer,
    icon character varying(255)
);


ALTER TABLE public.moduleviews OWNER TO asm_prod_user;

--
-- TOC entry 252 (class 1259 OID 17508)
-- Name: moduleviews_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.moduleviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moduleviews_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3974 (class 0 OID 0)
-- Dependencies: 252
-- Name: moduleviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.moduleviews_id_seq OWNED BY public.moduleviews.id;


--
-- TOC entry 253 (class 1259 OID 17509)
-- Name: municipios; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.municipios (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    departamento_id bigint NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now(),
    updated_at timestamp(0) without time zone DEFAULT now()
);


ALTER TABLE public.municipios OWNER TO asm_prod_user;

--
-- TOC entry 254 (class 1259 OID 17514)
-- Name: municipios_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.municipios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.municipios_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3975 (class 0 OID 0)
-- Dependencies: 254
-- Name: municipios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.municipios_id_seq OWNED BY public.municipios.id;


--
-- TOC entry 255 (class 1259 OID 17515)
-- Name: nom_id_tipo_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.nom_id_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nom_id_tipo_seq OWNER TO asm_prod_user;

--
-- TOC entry 256 (class 1259 OID 17516)
-- Name: nom; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.nom (
    id_tipo bigint DEFAULT nextval('public.nom_id_tipo_seq'::regclass) NOT NULL,
    nombre_tipo character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.nom OWNER TO asm_prod_user;

--
-- TOC entry 257 (class 1259 OID 17520)
-- Name: paises; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.paises (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.paises OWNER TO asm_prod_user;

--
-- TOC entry 258 (class 1259 OID 17523)
-- Name: paises_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.paises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paises_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3976 (class 0 OID 0)
-- Dependencies: 258
-- Name: paises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.paises_id_seq OWNED BY public.paises.id;


--
-- TOC entry 259 (class 1259 OID 17524)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO asm_prod_user;

--
-- TOC entry 260 (class 1259 OID 17529)
-- Name: permissions; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    module character varying(50),
    section character varying(50),
    resource character varying(50),
    action character varying(50),
    effect character varying(10),
    description text,
    route_path character varying(255),
    file_name character varying(100),
    object_id integer,
    is_enabled boolean DEFAULT true,
    level character varying(20),
    CONSTRAINT permissions_effect_check CHECK (((effect)::text = ANY (ARRAY[('allow'::character varying)::text, ('deny'::character varying)::text]))),
    CONSTRAINT permissions_level_check CHECK (((level)::text = ANY (ARRAY[('view'::character varying)::text, ('create'::character varying)::text, ('edit'::character varying)::text, ('delete'::character varying)::text, ('export'::character varying)::text])))
);


ALTER TABLE public.permissions OWNER TO asm_prod_user;

--
-- TOC entry 261 (class 1259 OID 17537)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3977 (class 0 OID 0)
-- Dependencies: 261
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 262 (class 1259 OID 17538)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO asm_prod_user;

--
-- TOC entry 263 (class 1259 OID 17543)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3978 (class 0 OID 0)
-- Dependencies: 263
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 264 (class 1259 OID 17544)
-- Name: prospectos; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.prospectos (
    id bigint NOT NULL,
    fecha date NOT NULL,
    nombre_completo character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    correo_electronico character varying(255) NOT NULL,
    genero character varying(255) NOT NULL,
    empresa_donde_labora_actualmente character varying(255),
    puesto character varying(255),
    notas_generales text,
    observaciones text,
    interes character varying(255),
    nota1 character varying(255),
    nota2 character varying(255),
    nota3 character varying(255),
    cierre text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    status character varying(255),
    correo_corporativo character varying(255),
    pais_origen character varying(100),
    pais_residencia character varying(100),
    numero_identificacion character varying(20),
    fecha_nacimiento date,
    modalidad character varying(50),
    fecha_inicio_especifica date,
    fecha_taller_reduccion date,
    fecha_taller_integracion date,
    medio_conocimiento_institucion character varying(255),
    metodo_pago character varying(100),
    departamento character varying(100),
    municipio character varying(100),
    created_by integer,
    updated_by integer,
    deleted_by integer,
    direccion_residencia character varying(255),
    telefono_corporativo character varying(50),
    direccion_empresa character varying(255),
    ultimo_titulo_obtenido character varying(255),
    institucion_titulo character varying(255),
    anio_graduacion smallint,
    cantidad_cursos_aprobados integer,
    monto_inscripcion numeric(10,2),
    convenio_pago_id bigint,
    dia_estudio character varying(20)
);


ALTER TABLE public.prospectos OWNER TO asm_prod_user;

--
-- TOC entry 265 (class 1259 OID 17549)
-- Name: prospectos_documentos; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.prospectos_documentos (
    id bigint NOT NULL,
    prospecto_id bigint NOT NULL,
    tipo_documento character varying(100) NOT NULL,
    ruta_archivo character varying(500) NOT NULL,
    subida_at timestamp without time zone DEFAULT now() NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    deleted_by integer,
    estado character varying(20) DEFAULT 'pendiente'::character varying NOT NULL,
    CONSTRAINT chk_estado_documento CHECK (((estado)::text = ANY (ARRAY[('pendiente'::character varying)::text, ('aprobado'::character varying)::text, ('rechazado'::character varying)::text])))
);


ALTER TABLE public.prospectos_documentos OWNER TO asm_prod_user;

--
-- TOC entry 266 (class 1259 OID 17559)
-- Name: prospectos_documentos_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.prospectos_documentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prospectos_documentos_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3979 (class 0 OID 0)
-- Dependencies: 266
-- Name: prospectos_documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.prospectos_documentos_id_seq OWNED BY public.prospectos_documentos.id;


--
-- TOC entry 267 (class 1259 OID 17560)
-- Name: prospectos_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.prospectos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prospectos_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3980 (class 0 OID 0)
-- Dependencies: 267
-- Name: prospectos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.prospectos_id_seq OWNED BY public.prospectos.id;


--
-- TOC entry 268 (class 1259 OID 17561)
-- Name: rolepermissions; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.rolepermissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    scope character varying(20),
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT rolepermissions_scope_check CHECK (((scope)::text = ANY (ARRAY[('global'::character varying)::text, ('group'::character varying)::text, ('self'::character varying)::text])))
);


ALTER TABLE public.rolepermissions OWNER TO asm_prod_user;

--
-- TOC entry 269 (class 1259 OID 17566)
-- Name: rolepermissions_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.rolepermissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rolepermissions_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3981 (class 0 OID 0)
-- Dependencies: 269
-- Name: rolepermissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.rolepermissions_id_seq OWNED BY public.rolepermissions.id;


--
-- TOC entry 270 (class 1259 OID 17567)
-- Name: roles; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    is_system boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_count integer DEFAULT 0,
    type character varying(50),
    updated_at timestamp without time zone
);


ALTER TABLE public.roles OWNER TO asm_prod_user;

--
-- TOC entry 271 (class 1259 OID 17575)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3982 (class 0 OID 0)
-- Dependencies: 271
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 272 (class 1259 OID 17576)
-- Name: securitypolicies; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.securitypolicies (
    id integer NOT NULL,
    password_min_length integer,
    require_uppercase boolean,
    require_numbers boolean,
    require_special_chars boolean,
    block_common_passwords boolean,
    password_expiry_days integer,
    password_history_limit integer,
    notify_before_expiry_days integer,
    force_change_on_first_login boolean,
    failed_attempts_limit integer,
    session_timeout_minutes integer,
    session_max_duration_hours integer,
    max_simultaneous_sessions integer,
    validate_ip boolean,
    close_inactive_sessions boolean,
    restrict_by_country boolean,
    restrict_by_network boolean,
    restrict_by_device boolean,
    access_hours_enabled boolean,
    notify_unusual_access boolean,
    enforce_2fa boolean,
    enforce_2fa_for_roles boolean,
    trusted_device_days integer,
    captcha_on_failures boolean,
    sso_enabled boolean,
    biometric_auth_enabled boolean,
    email_verification boolean,
    recovery_enabled boolean,
    log_retention_days integer,
    audit_level character varying(20),
    real_time_monitoring boolean,
    report_frequency character varying(20)
);


ALTER TABLE public.securitypolicies OWNER TO asm_prod_user;

--
-- TOC entry 273 (class 1259 OID 17579)
-- Name: securitypolicies_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.securitypolicies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.securitypolicies_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3983 (class 0 OID 0)
-- Dependencies: 273
-- Name: securitypolicies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.securitypolicies_id_seq OWNED BY public.securitypolicies.id;


--
-- TOC entry 274 (class 1259 OID 17580)
-- Name: sessions; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token_hash character varying(255) NOT NULL,
    ip_address character varying(45),
    user_agent text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    last_activity timestamp without time zone,
    is_active boolean DEFAULT true,
    device_type character varying(50),
    platform character varying(50),
    browser character varying(50),
    start_time timestamp without time zone,
    duration interval
);


ALTER TABLE public.sessions OWNER TO asm_prod_user;

--
-- TOC entry 275 (class 1259 OID 17587)
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sessions_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3984 (class 0 OID 0)
-- Dependencies: 275
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- TOC entry 276 (class 1259 OID 17588)
-- Name: tarea_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.tarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tarea_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 277 (class 1259 OID 17589)
-- Name: tareas; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.tareas (
    id integer DEFAULT nextval('public.tarea_id_seq'::regclass) NOT NULL,
    asesor_id integer NOT NULL,
    creado_por integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descripcion text,
    fecha date NOT NULL,
    hora_inicio time without time zone,
    hora_fin time without time zone,
    tipo character varying(50) NOT NULL,
    completada boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tareas OWNER TO asm_prod_user;

--
-- TOC entry 278 (class 1259 OID 17598)
-- Name: tb_actividades; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.tb_actividades (
    id bigint NOT NULL,
    actividades character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.tb_actividades OWNER TO asm_prod_user;

--
-- TOC entry 279 (class 1259 OID 17603)
-- Name: tb_actividades_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.tb_actividades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_actividades_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3985 (class 0 OID 0)
-- Dependencies: 279
-- Name: tb_actividades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.tb_actividades_id_seq OWNED BY public.tb_actividades.id;


--
-- TOC entry 280 (class 1259 OID 17604)
-- Name: tb_convenio; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.tb_convenio (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text,
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_convenio OWNER TO asm_prod_user;

--
-- TOC entry 281 (class 1259 OID 17610)
-- Name: tb_convenio_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.tb_convenio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_convenio_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3986 (class 0 OID 0)
-- Dependencies: 281
-- Name: tb_convenio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.tb_convenio_id_seq OWNED BY public.tb_convenio.id;


--
-- TOC entry 282 (class 1259 OID 17611)
-- Name: tb_interacciones; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.tb_interacciones (
    id bigint NOT NULL,
    id_asesor bigint NOT NULL,
    id_actividades bigint NOT NULL,
    defec_interaccion text,
    duracion character varying(15),
    notas character varying(255),
    created_by integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    id_lead bigint
);


ALTER TABLE public.tb_interacciones OWNER TO asm_prod_user;

--
-- TOC entry 283 (class 1259 OID 17618)
-- Name: tb_interacciones_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.tb_interacciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_interacciones_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3987 (class 0 OID 0)
-- Dependencies: 283
-- Name: tb_interacciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.tb_interacciones_id_seq OWNED BY public.tb_interacciones.id;


--
-- TOC entry 284 (class 1259 OID 17619)
-- Name: tb_periodo_programa; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.tb_periodo_programa (
    id bigint NOT NULL,
    periodo_id bigint NOT NULL,
    programa_id bigint NOT NULL
);


ALTER TABLE public.tb_periodo_programa OWNER TO asm_prod_user;

--
-- TOC entry 285 (class 1259 OID 17622)
-- Name: tb_periodo_programa_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.tb_periodo_programa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_periodo_programa_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 285
-- Name: tb_periodo_programa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.tb_periodo_programa_id_seq OWNED BY public.tb_periodo_programa.id;


--
-- TOC entry 286 (class 1259 OID 17623)
-- Name: tb_periodos_inscripcion; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.tb_periodos_inscripcion (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    codigo character varying(50) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    descripcion text,
    cupos_total integer DEFAULT 0 NOT NULL,
    descuento integer DEFAULT 0 NOT NULL,
    activo boolean DEFAULT false NOT NULL,
    visible boolean DEFAULT true NOT NULL,
    notificaciones boolean DEFAULT true NOT NULL,
    inscritos_count integer DEFAULT 0 NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_actualizacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tb_periodos_inscripcion OWNER TO asm_prod_user;

--
-- TOC entry 287 (class 1259 OID 17636)
-- Name: tb_periodos_inscripcion_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.tb_periodos_inscripcion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_periodos_inscripcion_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 287
-- Name: tb_periodos_inscripcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.tb_periodos_inscripcion_id_seq OWNED BY public.tb_periodos_inscripcion.id;


--
-- TOC entry 288 (class 1259 OID 17637)
-- Name: tb_precios_convenio_programa; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.tb_precios_convenio_programa (
    id bigint NOT NULL,
    convenio_id bigint NOT NULL,
    programa_id bigint NOT NULL,
    inscripcion numeric(12,2),
    cuota_mensual numeric(12,2) NOT NULL,
    meses integer NOT NULL
);


ALTER TABLE public.tb_precios_convenio_programa OWNER TO asm_prod_user;

--
-- TOC entry 289 (class 1259 OID 17640)
-- Name: tb_precios_convenio_programa_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.tb_precios_convenio_programa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_precios_convenio_programa_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3990 (class 0 OID 0)
-- Dependencies: 289
-- Name: tb_precios_convenio_programa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.tb_precios_convenio_programa_id_seq OWNED BY public.tb_precios_convenio_programa.id;


--
-- TOC entry 290 (class 1259 OID 17641)
-- Name: tb_precios_programa; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.tb_precios_programa (
    id bigint NOT NULL,
    programa_id bigint NOT NULL,
    inscripcion numeric(12,2) NOT NULL,
    cuota_mensual numeric(12,2) NOT NULL,
    meses integer NOT NULL
);


ALTER TABLE public.tb_precios_programa OWNER TO asm_prod_user;

--
-- TOC entry 291 (class 1259 OID 17644)
-- Name: tb_precios_programa_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.tb_precios_programa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_precios_programa_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3991 (class 0 OID 0)
-- Dependencies: 291
-- Name: tb_precios_programa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.tb_precios_programa_id_seq OWNED BY public.tb_precios_programa.id;


--
-- TOC entry 292 (class 1259 OID 17645)
-- Name: tb_programas; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.tb_programas (
    id bigint NOT NULL,
    abreviatura character varying(50),
    nombre_del_programa character varying(255) NOT NULL,
    meses integer DEFAULT 0 NOT NULL,
    area_comun integer DEFAULT 0 NOT NULL,
    cursos_de_bba integer DEFAULT 0 NOT NULL,
    area_de_especialidad integer DEFAULT 0 NOT NULL,
    seminario_de_gerencia integer DEFAULT 0 NOT NULL,
    capstone_project integer DEFAULT 0 NOT NULL,
    escritura_de_casos integer DEFAULT 0 NOT NULL,
    certificacion_internacional integer DEFAULT 0 NOT NULL,
    total_cursos integer DEFAULT 0 NOT NULL,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_programas OWNER TO asm_prod_user;

--
-- TOC entry 293 (class 1259 OID 17659)
-- Name: tb_programas_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.tb_programas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_programas_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 293
-- Name: tb_programas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.tb_programas_id_seq OWNED BY public.tb_programas.id;


--
-- TOC entry 294 (class 1259 OID 17660)
-- Name: tbcitas; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.tbcitas (
    id bigint NOT NULL,
    descricita character varying(255) NOT NULL,
    datecita date,
    createby bigint,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.tbcitas OWNER TO asm_prod_user;

--
-- TOC entry 295 (class 1259 OID 17665)
-- Name: tbcitas_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.tbcitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbcitas_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 295
-- Name: tbcitas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.tbcitas_id_seq OWNED BY public.tbcitas.id;


--
-- TOC entry 296 (class 1259 OID 17666)
-- Name: userpermissions; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.userpermissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    scope character varying(20) NOT NULL,
    CONSTRAINT userpermissions_scope_check CHECK (((scope)::text = ANY (ARRAY[('global'::character varying)::text, ('group'::character varying)::text, ('self'::character varying)::text])))
);


ALTER TABLE public.userpermissions OWNER TO asm_prod_user;

--
-- TOC entry 297 (class 1259 OID 17671)
-- Name: userpermissions_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.userpermissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.userpermissions_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 297
-- Name: userpermissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.userpermissions_id_seq OWNED BY public.userpermissions.id;


--
-- TOC entry 298 (class 1259 OID 17673)
-- Name: userroles; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.userroles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    expires_at timestamp without time zone
);


ALTER TABLE public.userroles OWNER TO asm_prod_user;

--
-- TOC entry 299 (class 1259 OID 17677)
-- Name: userroles_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.userroles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.userroles_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 299
-- Name: userroles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.userroles_id_seq OWNED BY public.userroles.id;


--
-- TOC entry 300 (class 1259 OID 17678)
-- Name: users; Type: TABLE; Schema: public; Owner: asm_prod_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password_hash character varying(255) NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    is_active boolean DEFAULT true,
    email_verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    last_login timestamp without time zone,
    mfa_enabled boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO asm_prod_user;

--
-- TOC entry 301 (class 1259 OID 17688)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: asm_prod_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO asm_prod_user;

--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 301
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: asm_prod_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3403 (class 2604 OID 18060)
-- Name: advisor_commission_rates id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.advisor_commission_rates ALTER COLUMN id SET DEFAULT nextval('public.advisor_commission_rates_id_seq'::regclass);


--
-- TOC entry 3405 (class 2604 OID 18061)
-- Name: approval_flows id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.approval_flows ALTER COLUMN id SET DEFAULT nextval('public.approval_flows_id_seq'::regclass);


--
-- TOC entry 3411 (class 2604 OID 18062)
-- Name: approval_stages id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.approval_stages ALTER COLUMN id SET DEFAULT nextval('public.approval_stages_id_seq'::regclass);


--
-- TOC entry 3417 (class 2604 OID 18063)
-- Name: auditlogs id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.auditlogs ALTER COLUMN id SET DEFAULT nextval('public.auditlogs_id_seq'::regclass);


--
-- TOC entry 3420 (class 2604 OID 18064)
-- Name: commission_configs id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.commission_configs ALTER COLUMN id SET DEFAULT nextval('public.commission_configs_id_seq'::regclass);


--
-- TOC entry 3426 (class 2604 OID 18065)
-- Name: commissions id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.commissions ALTER COLUMN id SET DEFAULT nextval('public.commissions_id_seq'::regclass);


--
-- TOC entry 3432 (class 2604 OID 18066)
-- Name: contactos_enviados id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.contactos_enviados ALTER COLUMN id SET DEFAULT nextval('public.contactos_enviados_id_seq'::regclass);


--
-- TOC entry 3435 (class 2604 OID 18067)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 3438 (class 2604 OID 18068)
-- Name: cuotas_programa_estudiante id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.cuotas_programa_estudiante ALTER COLUMN id SET DEFAULT nextval('public.cuotas_programa_estudiante_id_seq'::regclass);


--
-- TOC entry 3442 (class 2604 OID 18069)
-- Name: curso_prospecto id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.curso_prospecto ALTER COLUMN id SET DEFAULT nextval('public.curso_prospecto_id_seq'::regclass);


--
-- TOC entry 3443 (class 2604 OID 18070)
-- Name: departamentos id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN id SET DEFAULT nextval('public.departamentos_id_seq'::regclass);


--
-- TOC entry 3444 (class 2604 OID 18071)
-- Name: duplicate_records id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.duplicate_records ALTER COLUMN id SET DEFAULT nextval('public.duplicate_records_id_seq'::regclass);


--
-- TOC entry 3446 (class 2604 OID 18072)
-- Name: estudiante_programa id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.estudiante_programa ALTER COLUMN id SET DEFAULT nextval('public.estudiante_programa_id_seq'::regclass);


--
-- TOC entry 3449 (class 2604 OID 18073)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3452 (class 2604 OID 18074)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 3454 (class 2604 OID 18075)
-- Name: kardex_pagos id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.kardex_pagos ALTER COLUMN id SET DEFAULT nextval('public.kardex_pagos_id_seq'::regclass);


--
-- TOC entry 3457 (class 2604 OID 18076)
-- Name: mfaconfigurations id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.mfaconfigurations ALTER COLUMN id SET DEFAULT nextval('public.mfaconfigurations_id_seq'::regclass);


--
-- TOC entry 3460 (class 2604 OID 18077)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3461 (class 2604 OID 18078)
-- Name: modules id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.modules ALTER COLUMN id SET DEFAULT nextval('public.modules_id_seq'::regclass);


--
-- TOC entry 3464 (class 2604 OID 18079)
-- Name: moduleviews id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.moduleviews ALTER COLUMN id SET DEFAULT nextval('public.moduleviews_id_seq'::regclass);


--
-- TOC entry 3465 (class 2604 OID 18080)
-- Name: municipios id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.municipios ALTER COLUMN id SET DEFAULT nextval('public.municipios_id_seq'::regclass);


--
-- TOC entry 3469 (class 2604 OID 18081)
-- Name: paises id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.paises ALTER COLUMN id SET DEFAULT nextval('public.paises_id_seq'::regclass);


--
-- TOC entry 3470 (class 2604 OID 18082)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 3472 (class 2604 OID 18083)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3473 (class 2604 OID 18084)
-- Name: prospectos id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.prospectos ALTER COLUMN id SET DEFAULT nextval('public.prospectos_id_seq'::regclass);


--
-- TOC entry 3474 (class 2604 OID 18085)
-- Name: prospectos_documentos id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.prospectos_documentos ALTER COLUMN id SET DEFAULT nextval('public.prospectos_documentos_id_seq'::regclass);


--
-- TOC entry 3479 (class 2604 OID 18086)
-- Name: rolepermissions id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.rolepermissions ALTER COLUMN id SET DEFAULT nextval('public.rolepermissions_id_seq'::regclass);


--
-- TOC entry 3481 (class 2604 OID 18087)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3485 (class 2604 OID 18088)
-- Name: securitypolicies id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.securitypolicies ALTER COLUMN id SET DEFAULT nextval('public.securitypolicies_id_seq'::regclass);


--
-- TOC entry 3486 (class 2604 OID 18089)
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- TOC entry 3493 (class 2604 OID 18090)
-- Name: tb_actividades id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_actividades ALTER COLUMN id SET DEFAULT nextval('public.tb_actividades_id_seq'::regclass);


--
-- TOC entry 3496 (class 2604 OID 18091)
-- Name: tb_convenio id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_convenio ALTER COLUMN id SET DEFAULT nextval('public.tb_convenio_id_seq'::regclass);


--
-- TOC entry 3498 (class 2604 OID 18092)
-- Name: tb_interacciones id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_interacciones ALTER COLUMN id SET DEFAULT nextval('public.tb_interacciones_id_seq'::regclass);


--
-- TOC entry 3501 (class 2604 OID 18093)
-- Name: tb_periodo_programa id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_periodo_programa ALTER COLUMN id SET DEFAULT nextval('public.tb_periodo_programa_id_seq'::regclass);


--
-- TOC entry 3502 (class 2604 OID 18094)
-- Name: tb_periodos_inscripcion id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_periodos_inscripcion ALTER COLUMN id SET DEFAULT nextval('public.tb_periodos_inscripcion_id_seq'::regclass);


--
-- TOC entry 3511 (class 2604 OID 18095)
-- Name: tb_precios_convenio_programa id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_precios_convenio_programa ALTER COLUMN id SET DEFAULT nextval('public.tb_precios_convenio_programa_id_seq'::regclass);


--
-- TOC entry 3512 (class 2604 OID 18096)
-- Name: tb_precios_programa id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_precios_programa ALTER COLUMN id SET DEFAULT nextval('public.tb_precios_programa_id_seq'::regclass);


--
-- TOC entry 3513 (class 2604 OID 18097)
-- Name: tb_programas id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_programas ALTER COLUMN id SET DEFAULT nextval('public.tb_programas_id_seq'::regclass);


--
-- TOC entry 3525 (class 2604 OID 18098)
-- Name: tbcitas id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tbcitas ALTER COLUMN id SET DEFAULT nextval('public.tbcitas_id_seq'::regclass);


--
-- TOC entry 3528 (class 2604 OID 18099)
-- Name: userpermissions id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.userpermissions ALTER COLUMN id SET DEFAULT nextval('public.userpermissions_id_seq'::regclass);


--
-- TOC entry 3530 (class 2604 OID 18100)
-- Name: userroles id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.userroles ALTER COLUMN id SET DEFAULT nextval('public.userroles_id_seq'::regclass);


--
-- TOC entry 3532 (class 2604 OID 18101)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3855 (class 0 OID 17352)
-- Dependencies: 209
-- Data for Name: advisor_commission_rates; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3857 (class 0 OID 17357)
-- Dependencies: 211
-- Data for Name: approval_flows; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.approval_flows VALUES (1, 'Inscripción Estándar', 'FLUJO-EST', 'Flujo de aprobación estándar para todos los programas académicos. Incluye aprobaciones comercial, financiera y académica.', 'todos', true, false, false, '2025-05-14 05:39:10', '2025-05-14 05:39:10');


--
-- TOC entry 3859 (class 0 OID 17368)
-- Dependencies: 213
-- Data for Name: approval_stages; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3861 (class 0 OID 17377)
-- Dependencies: 215
-- Data for Name: auditlogs; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3864 (class 0 OID 17386)
-- Dependencies: 218
-- Data for Name: column_configurations; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.column_configurations VALUES (3, 1, 'telefono', 'Telefono', 2, '2025-04-10 16:09:36', '2025-04-10 16:09:36');
INSERT INTO public.column_configurations VALUES (9, 1, 'interes', 'Interes', 8, '2025-04-10 16:10:56', '2025-04-10 16:10:56');
INSERT INTO public.column_configurations VALUES (10, 1, 'status', 'Status', 9, '2025-04-10 16:11:05', '2025-04-10 16:11:05');
INSERT INTO public.column_configurations VALUES (14, 1, 'cierre', 'Cierre', 13, '2025-04-10 16:12:03', '2025-04-10 16:12:03');
INSERT INTO public.column_configurations VALUES (1, 1, 'fecha', 'fecha', 0, '2025-04-10 15:58:33', '2025-04-10 20:17:48');
INSERT INTO public.column_configurations VALUES (2, 1, 'nombre_completo', 'nombre_completo', 1, '2025-04-10 16:09:26', '2025-04-10 20:17:59');
INSERT INTO public.column_configurations VALUES (4, 1, 'correo_electronico', 'correo_electronico', 3, '2025-04-10 16:09:47', '2025-04-10 20:18:11');
INSERT INTO public.column_configurations VALUES (5, 1, 'empresa_donde_labora_actualmente', 'empresa_donde_labora_actualmente', 4, '2025-04-10 16:09:59', '2025-04-10 20:18:22');
INSERT INTO public.column_configurations VALUES (6, 1, 'puesto', 'puesto', 5, '2025-04-10 16:10:19', '2025-04-10 20:18:37');
INSERT INTO public.column_configurations VALUES (7, 1, 'notas_generales', 'notas_generales', 6, '2025-04-10 16:10:32', '2025-04-10 20:18:46');
INSERT INTO public.column_configurations VALUES (8, 1, 'observaciones', 'observaciones', 7, '2025-04-10 16:10:40', '2025-04-10 20:26:04');
INSERT INTO public.column_configurations VALUES (11, 1, 'nota1', 'nota1', 10, '2025-04-10 16:11:23', '2025-04-10 20:26:24');
INSERT INTO public.column_configurations VALUES (12, 1, 'nota2', 'nota2', 11, '2025-04-10 16:11:33', '2025-04-10 20:26:30');
INSERT INTO public.column_configurations VALUES (13, 1, 'nota3', 'nota3', 12, '2025-04-10 16:11:44', '2025-04-10 20:26:37');
INSERT INTO public.column_configurations VALUES (15, 1, 'asdf', 'asdf', 22, '2025-04-11 19:21:33', '2025-04-11 19:21:33');


--
-- TOC entry 3865 (class 0 OID 17390)
-- Dependencies: 219
-- Data for Name: commission_configs; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.commission_configs VALUES (1, 13.00, 10, 5.00, 'monthly', true, '2025-05-06 11:33:59', '2025-05-06 19:21:42');


--
-- TOC entry 3867 (class 0 OID 17400)
-- Dependencies: 221
-- Data for Name: commissions; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3869 (class 0 OID 17409)
-- Dependencies: 223
-- Data for Name: contactos_enviados; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3871 (class 0 OID 17417)
-- Dependencies: 225
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.courses VALUES (1, 'HAZEL  JOHANA GARCÍA  CHAMORRO', '102', 'common', 3, '2025-06-05', '2025-07-05', 'Lunes', '4 semanas', NULL, 'draft', 0, '2025-06-06 05:20:54', '2025-06-06 05:21:35', '2025-06-06 05:21:35');
INSERT INTO public.courses VALUES (2, 'MAGDALENA MARIELA IJOM CABA', '1028', 'specialty', 3, '2025-06-05', '2025-06-27', 'Lunes', '4 semanas', NULL, 'draft', 0, '2025-06-06 05:22:03', '2025-06-06 06:17:33', '2025-06-06 06:17:33');
INSERT INTO public.courses VALUES (3, 'Getsion de Proyectos', '1022', 'common', 4, '2025-06-06', '2025-06-06', 'Lunes', '1 year', NULL, 'draft', 0, '2025-06-06 13:17:09', '2025-06-06 13:17:09', NULL);
INSERT INTO public.courses VALUES (4, 'Analisis de Datos', '10223', 'common', 3, '2025-06-06', '2025-06-19', 'Lunes Y miercoles', '1 year', NULL, 'draft', 0, '2025-06-06 13:18:05', '2025-06-06 13:18:05', NULL);


--
-- TOC entry 3873 (class 0 OID 17427)
-- Dependencies: 227
-- Data for Name: cuotas_programa_estudiante; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3875 (class 0 OID 17434)
-- Dependencies: 229
-- Data for Name: curso_prospecto; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3877 (class 0 OID 17438)
-- Dependencies: 231
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.departamentos VALUES (1, 'Alta Verapaz', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (2, 'Baja Verapaz', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (3, 'Chimaltenango', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (4, 'Chiquimula', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (5, 'El Progreso', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (6, 'Escuintla', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (7, 'Guatemala', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (8, 'Huehuetenango', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (9, 'Izabal', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (10, 'Jalapa', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (11, 'Jutiapa', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (12, 'Petén', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (13, 'Quetzaltenango', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (14, 'Quiché', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (15, 'Retalhuleu', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (16, 'Sacatepéquez', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (17, 'San Marcos', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (18, 'Santa Rosa', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (19, 'Sololá', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (20, 'Suchitepéquez', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (21, 'Totonicapán', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');
INSERT INTO public.departamentos VALUES (22, 'Zacapa', 1, '2025-03-24 22:41:20', '2025-03-24 22:41:20');


--
-- TOC entry 3879 (class 0 OID 17442)
-- Dependencies: 233
-- Data for Name: duplicate_records; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3881 (class 0 OID 17448)
-- Dependencies: 235
-- Data for Name: estudiante_programa; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3883 (class 0 OID 17454)
-- Dependencies: 237
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3885 (class 0 OID 17461)
-- Dependencies: 239
-- Data for Name: flow_program; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3886 (class 0 OID 17464)
-- Dependencies: 240
-- Data for Name: groupmemberships; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3887 (class 0 OID 17469)
-- Dependencies: 241
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3889 (class 0 OID 17476)
-- Dependencies: 243
-- Data for Name: kardex_pagos; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3891 (class 0 OID 17484)
-- Dependencies: 245
-- Data for Name: mfaconfigurations; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3893 (class 0 OID 17491)
-- Dependencies: 247
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.migrations VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO public.migrations VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO public.migrations VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO public.migrations VALUES (5, '2025_03_23_153812_create_prospectos_table', 1);
INSERT INTO public.migrations VALUES (6, '2025_03_23_220612_create_paises_table', 2);
INSERT INTO public.migrations VALUES (7, '2025_03_23_220636_create_departamentos_table', 2);
INSERT INTO public.migrations VALUES (8, '2025_03_23_220651_create_municipios_table', 2);
INSERT INTO public.migrations VALUES (9, '2025_03_23_224109_create_tb_programas_table', 3);
INSERT INTO public.migrations VALUES (10, '2025_03_23_230855_add_status_to_prospectos_table', 4);
INSERT INTO public.migrations VALUES (11, '2025_05_06_044246_create_duplicate_records_table', 5);
INSERT INTO public.migrations VALUES (12, '2025_05_06_150714_create_advisor_commission_rates_table', 6);
INSERT INTO public.migrations VALUES (13, '2025_05_06_150714_create_commission_configs_table', 6);
INSERT INTO public.migrations VALUES (14, '2025_05_06_150715_create_commissions_table', 6);
INSERT INTO public.migrations VALUES (15, '2025_06_04_114713_create_courses_table', 7);
INSERT INTO public.migrations VALUES (16, '2025_06_06_150715_create_curso_prospecto_table', 8);


--
-- TOC entry 3895 (class 0 OID 17495)
-- Dependencies: 249
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.modules VALUES (2, 'Prospectos Y Asesores', 'Modulo de Prospectos Y Asesores', true, 19, 'Users', NULL);
INSERT INTO public.modules VALUES (3, 'Inscripccion', 'Modulo de Inscripccion', true, 8, 'FileText', NULL);
INSERT INTO public.modules VALUES (4, 'Academico', 'Modulo de Academico', true, 7, 'BookOpen', NULL);
INSERT INTO public.modules VALUES (5, 'Docentes', 'Modulo de Docentes', true, 10, 'GraduationCapIcon', NULL);
INSERT INTO public.modules VALUES (6, 'Estudiantes', 'Modulo de Estudiantes', true, 8, 'Users', NULL);
INSERT INTO public.modules VALUES (7, 'Finanzas y Pagos', 'Modulo de Finanzas y Pagos', true, 7, 'DollarSign', NULL);
INSERT INTO public.modules VALUES (8, 'Administración', 'Modulo de Administración General', true, 6, 'Settings', NULL);
INSERT INTO public.modules VALUES (9, 'Seguridad', 'Modulo de control de Acceso y seguridad', true, 8, 'Shield', NULL);


--
-- TOC entry 3897 (class 0 OID 17503)
-- Dependencies: 251
-- Data for Name: moduleviews; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.moduleviews VALUES (55, 7, 'Conciliación Bancaria', 'Conciliación Bancaria', '/finanzas/conciliacion', '1', 4, 'RefreshCw');
INSERT INTO public.moduleviews VALUES (56, 7, 'Seguimiento de Cobros', 'Seguimiento de Cobros', '/finanzas/seguimiento-cobros', '1', 5, 'Phone');
INSERT INTO public.moduleviews VALUES (57, 7, 'Reportes Financieros', 'Reportes Financieros', '/finanzas/reportes', '1', 6, 'BarChart');
INSERT INTO public.moduleviews VALUES (58, 7, 'Configuración', 'Configuración', '/finanzas/configuracion', '1', 7, 'Settings');
INSERT INTO public.moduleviews VALUES (19, 3, 'Ficha de Inscripción', 'Ficha de Inscripción', '/inscripcion/ficha', '1', 1, 'FileText');
INSERT INTO public.moduleviews VALUES (6, 2, 'Interacciones con Leads', 'Interacciones con Leads', '/interacciones-leads', '1', 6, 'FileText');
INSERT INTO public.moduleviews VALUES (7, 2, 'Tareas del Asesor', 'Tareas del Asesor', '/tareas-asesor', '1', 7, 'Users');
INSERT INTO public.moduleviews VALUES (8, 2, 'Correos', 'Correos', '/correos', '1', 8, 'ClipboardList');
INSERT INTO public.moduleviews VALUES (9, 2, 'Calendario', 'Calendario', '/calendario', '1', 9, 'Activities');
INSERT INTO public.moduleviews VALUES (10, 2, 'Formulario de Correos', 'Formulario de Correos', '/envio-correos', '1', 10, 'Mail');
INSERT INTO public.moduleviews VALUES (1, 2, 'Gestión de Prospectos', 'Gestión de Prospectos', '/gestion', '1', 1, 'Users');
INSERT INTO public.moduleviews VALUES (2, 2, 'Captura de Prospectos', 'Captura de Prospectos', '/captura', '1', 2, 'Plus');
INSERT INTO public.moduleviews VALUES (3, 2, 'Leads Asignados', 'Leads Asignados', '/leads-asignados', '1', 3, 'FileText');
INSERT INTO public.moduleviews VALUES (4, 2, 'Panel de Seguimiento', 'Panel de Seguimiento', '/seguimiento', '1', 4, 'FileText');
INSERT INTO public.moduleviews VALUES (20, 3, 'Revisión de Fichas', 'Revisión de Fichas', '/inscripcion/revision', '1', 2, 'FileText');
INSERT INTO public.moduleviews VALUES (21, 3, 'Firma Digital', 'Firma Digital', '/firma', '1', 3, 'FileSignature');
INSERT INTO public.moduleviews VALUES (22, 3, 'Documentos', 'Validación de Documentos', '/documentos', '1', 4, 'FileText');
INSERT INTO public.moduleviews VALUES (23, 3, 'Documentos', 'Gestión de Documentos', '/documentos/gestion', '1', 5, 'FileText');
INSERT INTO public.moduleviews VALUES (24, 3, 'Reportes', 'Reportes Avanzados', '/reportes-avanzados', '1', 6, 'BarChart');
INSERT INTO public.moduleviews VALUES (25, 3, 'Administración', 'Periodos de Inscripción', '/inscripcion/admin/periodos', '1', 7, 'Calendar');
INSERT INTO public.moduleviews VALUES (26, 3, 'Administración', 'Flujos de Aprobación', '/inscripcion/admin/flujos', '1', 8, 'Activity');
INSERT INTO public.moduleviews VALUES (27, 4, 'Programas Académicos', 'Programas Académicos', '/academico/programas', '1', 1, 'BookOpen');
INSERT INTO public.moduleviews VALUES (28, 4, 'Gestión de Usuarios', 'Gestión de Usuarios', '/academico/usuarios', '1', 2, 'Users');
INSERT INTO public.moduleviews VALUES (34, 5, 'Portal Docente', 'Portal Docente', '/docente', '1', 1, 'LayoutDashboard');
INSERT INTO public.moduleviews VALUES (39, 5, 'Medallero e Insignias', 'Medallero e Insignias', '/docente/medallero', '1', 6, 'Medal');
INSERT INTO public.moduleviews VALUES (40, 5, 'Mi Aprendizaje', 'Mi Aprendizaje', '/docente/mi-aprendizaje', '1', 7, 'BookOpen');
INSERT INTO public.moduleviews VALUES (41, 5, 'Calendario', 'Calendario', '/docente/calendario', '1', 8, 'Calendar');
INSERT INTO public.moduleviews VALUES (42, 5, 'Notificaciones', 'Notificaciones', '/docente/notificaciones', '1', 9, 'Bell');
INSERT INTO public.moduleviews VALUES (43, 5, 'Certificaciones', 'Certificaciones', '/docente/certificaciones', '1', 10, 'Award');
INSERT INTO public.moduleviews VALUES (44, 6, 'Dashboard Estudiantil', 'Dashboard Estudiantil', '/estudiantes', '1', 1, 'LayoutDashboard');
INSERT INTO public.moduleviews VALUES (45, 6, 'Documentos', 'Documentos', '/estudiantes/documentos', '1', 2, 'FileText');
INSERT INTO public.moduleviews VALUES (46, 6, 'Gestión de Pagos', 'Gestión de Pagos', '/estudiantes/pagos', '1', 3, 'DollarSign');
INSERT INTO public.moduleviews VALUES (47, 6, 'Ranking Estudiantil', 'Ranking Estudiantil', '/estudiantes/ranking', '1', 4, 'Award');
INSERT INTO public.moduleviews VALUES (48, 6, 'Calendario Académico', 'Calendario Académico', '/estudiantes/calendario', '1', 5, 'Calendar');
INSERT INTO public.moduleviews VALUES (49, 6, 'Notificaciones', 'Notificaciones', '/estudiantes/notificaciones', '1', 6, 'Bell');
INSERT INTO public.moduleviews VALUES (59, 8, 'Dashboard Administrativo', 'Dashboard Administrativo', '/admin/dashboard', '1', 1, 'LayoutDashboard');
INSERT INTO public.moduleviews VALUES (60, 8, 'Programación de Cursos', 'Programación de Cursos', '/admin/programacion-cursos', '1', 2, 'Calendar');
INSERT INTO public.moduleviews VALUES (61, 8, 'Reportes de Matrícula', 'Reportes de Matrícula', '/admin/reportes-matricula', '1', 3, 'FileCheck');
INSERT INTO public.moduleviews VALUES (62, 8, 'Reporte de Ingresos', 'Reporte de Ingresos', '/admin/reporte-graduaciones', '1', 4, 'DollarSign');
INSERT INTO public.moduleviews VALUES (63, 8, 'Plantillas y Mailing', 'Plantillas y Mailing', '/admin/plantillas-mailing', '1', 5, 'Send');
INSERT INTO public.moduleviews VALUES (64, 8, 'Configuración General', 'Configuración General', '/admin/configuracion', '1', 6, 'Settings');
INSERT INTO public.moduleviews VALUES (65, 9, 'Usuarios', 'Gestión de usuarios', '/seguridad/usuarios', '1', 1, 'UserCheck');
INSERT INTO public.moduleviews VALUES (66, 9, 'Roles', 'Gestión de roles', '/seguridad/role', '1', 2, 'Users');
INSERT INTO public.moduleviews VALUES (67, 9, 'Permisos', 'Asignación de permisos', '/seguridad/permisos', '1', 3, 'Shield');
INSERT INTO public.moduleviews VALUES (68, 9, 'Auditoría', 'Logs de auditoría', '/seguridad/auditoria', '1', 4, 'Activity');
INSERT INTO public.moduleviews VALUES (69, 9, 'Políticas', 'Políticas de seguridad', '/seguridad/politicas', '1', 5, 'FileText');
INSERT INTO public.moduleviews VALUES (5, 2, 'Importar Leads', 'Importar Leads', '/importar-leads', '1', 5, 'ClipboardList');
INSERT INTO public.moduleviews VALUES (11, 2, 'Programación de Tareas', 'Programación de Tareas', '/programacion-tareas', '1', 11, 'Calendar');
INSERT INTO public.moduleviews VALUES (12, 2, 'Gestión de Leads', 'Gestión de Leads', '/admin', '1', 12, 'Users');
INSERT INTO public.moduleviews VALUES (13, 2, 'Asesores', 'Asesores', '/admin?tab=advisors', '1', 13, 'UserCheck');
INSERT INTO public.moduleviews VALUES (14, 2, 'Rendimiento', 'Rendimiento', '/admin?tab=performance', '1', 14, 'BarChart2');
INSERT INTO public.moduleviews VALUES (15, 2, 'Reportes', 'Reportes', '/admin?tab=reports', '1', 15, 'BarChart2');
INSERT INTO public.moduleviews VALUES (16, 2, 'Actividad Diaria', 'Actividad Diaria', '/admin?tab=advisorActivity', '1', 16, 'Activity');
INSERT INTO public.moduleviews VALUES (17, 2, 'Duplicados', 'Duplicados', '/admin?tab=duplicates', '1', 17, 'Copy');
INSERT INTO public.moduleviews VALUES (18, 2, 'Configuración', 'Configuración', '/admin?tab=settings', '1', 18, 'Settings');
INSERT INTO public.moduleviews VALUES (29, 4, 'Programación de Cursos', 'Programación de Cursos', '/academico/programacion', '1', 3, 'Calendar');
INSERT INTO public.moduleviews VALUES (30, 4, 'Asignación de Cursos', 'Asignación de Cursos', '/academico/asignacion', '1', 4, 'ClipboardList');
INSERT INTO public.moduleviews VALUES (31, 4, 'Estatus Académico', 'Estatus Académico', '/academico/estatus-alumno', '1', 5, 'UserCheck');
INSERT INTO public.moduleviews VALUES (32, 4, 'Estatus General', 'Estatus General', '/academico/estado-sistema', '1', 6, 'Activity');
INSERT INTO public.moduleviews VALUES (33, 4, 'Ranking Académico', 'Ranking Académico', '/academico/ranking', '1', 7, 'BarChart2');
INSERT INTO public.moduleviews VALUES (35, 5, 'Mis Cursos', 'Mis Cursos', '/docente/cursos', '1', 2, 'BookOpen');
INSERT INTO public.moduleviews VALUES (36, 5, 'Alumnos', 'Alumnos', '/docente/alumnos', '1', 3, 'Users');
INSERT INTO public.moduleviews VALUES (37, 5, 'Material Didáctico', 'Material Didáctico', '/docente/material', '1', 4, 'FileText');
INSERT INTO public.moduleviews VALUES (38, 5, 'Mensajería e Invitaciones', 'Mensajería e Invitaciones', '/docente/mensajes', '1', 5, 'Mail');
INSERT INTO public.moduleviews VALUES (50, 6, 'Mi Perfil', 'Mi Perfil', '/estudiantes/perfil', '1', 7, 'UserCheck');
INSERT INTO public.moduleviews VALUES (51, 6, 'Estado de Cuenta', 'Estado de Cuenta', '/estudiantes/estado-cuenta', '1', 8, 'CreditCard');
INSERT INTO public.moduleviews VALUES (52, 7, 'Dashboard Financiero', 'Dashboard Financiero', '/finanzas/dashboard', '1', 1, 'PieChart');
INSERT INTO public.moduleviews VALUES (53, 7, 'Estado de Cuenta', 'Estado de Cuenta', '/finanzas/estado-cuenta', '1', 2, 'FileText');
INSERT INTO public.moduleviews VALUES (54, 7, 'Gestión de Pagos', 'Gestión de Pagos', '/finanzas/gestion-pagos', '1', 3, 'CreditCard');
INSERT INTO public.moduleviews VALUES (81, 6, 'Chat docente', 'Chat Docente', '/estudiantes/chat-docente', '1', 9, 'Mail');
INSERT INTO public.moduleviews VALUES (82, 9, 'Dashboard de Seguridad', 'Dashboard de Seguridad', '/seguridad/dashboard', '1', 6, 'LayoutDashboard');
INSERT INTO public.moduleviews VALUES (83, 9, 'Autenticación 2FA', 'Autenticación 2FA', '/seguridad/2fa', '1', 7, 'Key');
INSERT INTO public.moduleviews VALUES (84, 9, 'Accesos', 'Accesos', '/seguridad/accesos', '1', 8, 'LogIn');
INSERT INTO public.moduleviews VALUES (85, 9, 'Auditoria', 'Auditoria', '/seguridad/auditoria', '1', 9, 'Activity');


--
-- TOC entry 3899 (class 0 OID 17509)
-- Dependencies: 253
-- Data for Name: municipios; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.municipios VALUES (1, 'Cobán', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (2, 'Santa Cruz Verapaz', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (3, 'San Cristóbal Verapaz', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (4, 'Tactic', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (5, 'Tamahú', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (6, 'Tucurú', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (7, 'Panzós', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (8, 'Senahú', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (9, 'San Pedro Carchá', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (10, 'San Juan Chamelco', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (11, 'Lanquín', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (12, 'Cahabón', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (13, 'Chisec', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (14, 'Chahal', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (15, 'Fray Bartolomé de las Casas', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (16, 'Santa Catalina La Tinta', 1, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (17, 'Salamá', 2, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (18, 'San Miguel Chicaj', 2, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (19, 'Rabinal', 2, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (20, 'Cubulco', 2, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (21, 'Granados', 2, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (22, 'El Chol', 2, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (23, 'Purulhá', 2, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (24, 'Chimaltenango', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (25, 'San José Poaquil', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (26, 'San Martín Jilotepeque', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (27, 'San Juan Comalapa', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (28, 'Santa Apolonia', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (29, 'Tecpán Guatemala', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (30, 'Patzún', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (31, 'Pochuta', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (32, 'Patzicía', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (33, 'Santa Cruz Balanyá', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (34, 'Acatenango', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (35, 'Yepocapa', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (36, 'San Andrés Itzapa', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (37, 'Parramos', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (38, 'Zaragoza', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (39, 'El Tejar', 3, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (40, 'Chiquimula', 4, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (41, 'San José La Arada', 4, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (42, 'San Juan Ermita', 4, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (43, 'Jocotán', 4, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (44, 'Camotán', 4, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (45, 'Olopa', 4, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (46, 'Esquipulas', 4, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (47, 'Concepción Las Minas', 4, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (48, 'Quezaltepeque', 4, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (49, 'San Jacinto', 4, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (50, 'Ipala', 4, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (51, 'Guastatoya', 5, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (52, 'Morazán', 5, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (53, 'San Agustín Acasaguastlán', 5, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (54, 'San Cristóbal Acasaguastlán', 5, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (55, 'El Jícaro', 5, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (56, 'Sansare', 5, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (57, 'Sanarate', 5, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (58, 'San Antonio La Paz', 5, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (59, 'Escuintla', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (60, 'Santa Lucía Cotzumalguapa', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (61, 'La Democracia', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (62, 'Siquinalá', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (63, 'Masagua', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (64, 'Tiquisate', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (65, 'La Gomera', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (66, 'Guanagazapa', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (67, 'Puerto San José', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (68, 'Iztapa', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (69, 'Palín', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (70, 'San Vicente Pacaya', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (71, 'Nueva Concepción', 6, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (72, 'Guatemala', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (73, 'Santa Catarina Pinula', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (74, 'San José Pinula', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (75, 'San José del Golfo', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (76, 'Palencia', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (77, 'Chinautla', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (78, 'San Pedro Ayampuc', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (79, 'Mixco', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (80, 'San Pedro Sacatepéquez', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (81, 'San Juan Sacatepéquez', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (82, 'San Raymundo', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (83, 'Chuarrancho', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (84, 'Fraijanes', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (85, 'Amatitlán', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (86, 'Villa Nueva', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (87, 'Villa Canales', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (88, 'Petapa', 7, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (89, 'Huehuetenango', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (90, 'Chiantla', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (91, 'Malacatancito', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (92, 'Cuilco', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (93, 'Nentón', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (94, 'San Pedro Necta', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (95, 'Jacaltenango', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (96, 'Soloma', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (97, 'Ixtahuacán', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (98, 'Santa Bárbara', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (99, 'La Libertad', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (100, 'La Democracia', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (101, 'San Miguel Acatán', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (102, 'San Rafael La Independencia', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (103, 'Todos Santos Cuchumatán', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (104, 'San Juan Atitán', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (105, 'Santa Eulalia', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (106, 'San Mateo Ixtatán', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (107, 'Colotenango', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (108, 'San Sebastián Huehuetenango', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (109, 'Tectitán', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (110, 'Concepción Huista', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (111, 'San Juan Ixcoy', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (112, 'San Antonio Huista', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (113, 'San Sebastián Coatán', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (114, 'Barillas', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (115, 'Aguacatán', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (116, 'San Rafael Petzal', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (117, 'San Gaspar Ixchil', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (118, 'Santiago Chimaltenango', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (119, 'Santa Ana Huista', 8, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (120, 'Puerto Barrios', 9, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (121, 'Livingston', 9, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (122, 'El Estor', 9, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (123, 'Morales', 9, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (124, 'Los Amates', 9, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (125, 'Jalapa', 10, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (126, 'San Pedro Pinula', 10, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (127, 'San Luis Jilotepeque', 10, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (128, 'San Manuel Chaparrón', 10, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (129, 'San Carlos Alzatate', 10, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (130, 'Monjas', 10, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (131, 'Mataquescuintla', 10, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (132, 'Jutiapa', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (133, 'El Progreso', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (134, 'Santa Catarina Mita', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (135, 'Agua Blanca', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (136, 'Asunción Mita', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (137, 'Yupiltepeque', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (138, 'Atescatempa', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (139, 'Jerez', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (140, 'El Adelanto', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (141, 'Zapotitlán', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (142, 'Comapa', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (143, 'Jalpatagua', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (144, 'Conguaco', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (145, 'Moyuta', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (146, 'Pasaco', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (147, 'San José Acatempa', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (148, 'Quezada', 11, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (149, 'Flores', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (150, 'San José', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (151, 'San Benito', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (152, 'San Andrés', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (153, 'La Libertad', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (154, 'San Francisco', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (155, 'Santa Ana', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (156, 'Dolores', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (157, 'San Luis', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (158, 'Sayaxché', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (159, 'Melchor de Mencos', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (160, 'Poptún', 12, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (161, 'Quetzaltenango', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (162, 'Salcajá', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (163, 'Olintepeque', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (164, 'San Carlos Sija', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (165, 'Sibilia', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (166, 'Cabricán', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (167, 'Cajolá', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (168, 'San Miguel Sigüilá', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (169, 'San Juan Ostuncalco', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (170, 'San Mateo', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (171, 'Concepción Chiquirichapa', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (172, 'San Martín Sacatepéquez', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (173, 'Almolonga', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (174, 'Cantel', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (175, 'Huitán', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (176, 'Zunil', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (177, 'Colomba', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (178, 'San Francisco La Unión', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (179, 'El Palmar', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (180, 'Coatepeque', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (181, 'Génova', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (182, 'Flores Costa Cuca', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (183, 'La Esperanza', 13, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (184, 'Santa Cruz del Quiché', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (185, 'Chiché', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (186, 'Chinique', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (187, 'Zacualpa', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (188, 'Chajul', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (189, 'Chichicastenango', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (190, 'Patzité', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (191, 'San Antonio Ilotenango', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (192, 'San Pedro Jocopilas', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (193, 'Cunén', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (194, 'San Juan Cotzal', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (195, 'Joyabaj', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (196, 'Nebaj', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (197, 'San Andrés Sajcabajá', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (198, 'Uspantán', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (199, 'Sacapulas', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (200, 'San Bartolomé Jocotenango', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (201, 'Canillá', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (202, 'Chicaman', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (203, 'Ixcán', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (204, 'Pachalum', 14, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (205, 'Retalhuleu', 15, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (206, 'San Sebastián', 15, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (207, 'Santa Cruz Muluá', 15, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (208, 'San Martín Zapotitlán', 15, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (209, 'San Felipe', 15, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (210, 'San Andrés Villa Seca', 15, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (211, 'Champerico', 15, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (212, 'Nuevo San Carlos', 15, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (213, 'El Asintal', 15, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (214, 'Antigua Guatemala', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (215, 'Jocotenango', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (216, 'Pastores', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (217, 'Sumpango', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (218, 'Santo Domingo Xenacoj', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (219, 'Santiago Sacatepéquez', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (220, 'San Bartolomé Milpas Altas', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (221, 'San Lucas Sacatepéquez', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (222, 'Santa Lucía Milpas Altas', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (223, 'Magdalena Milpas Altas', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (224, 'Santa María de Jesús', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (225, 'Ciudad Vieja', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (226, 'San Miguel Dueñas', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (227, 'Alotenango', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (228, 'San Antonio Aguas Calientes', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (229, 'Santa Catarina Barahona', 16, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (230, 'San Marcos', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (231, 'San Pedro Sacatepéquez', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (232, 'San Antonio Sacatepéquez', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (233, 'Comitancillo', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (234, 'San Miguel Ixtahuacán', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (235, 'Concepción Tutuapa', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (236, 'Tacaná', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (237, 'Sibinal', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (238, 'Tajumulco', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (239, 'Tejutla', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (240, 'San Rafael Pie de la Cuesta', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (241, 'Nuevo Progreso', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (242, 'El Tumbador', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (243, 'El Rodeo', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (244, 'Malacatán', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (245, 'Catarina', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (246, 'Ayutla', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (247, 'Ocos', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (248, 'San Pablo', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (249, 'El Quetzal', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (250, 'La Reforma', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (251, 'Pajapita', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (252, 'Ixchiguán', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (253, 'San José Ojetenam', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (254, 'San Cristóbal Cucho', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (255, 'Sipacapa', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (256, 'Esquipulas Palo Gordo', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (257, 'Río Blanco', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (258, 'San Lorenzo', 17, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (259, 'Cuilapa', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (260, 'Barberena', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (261, 'Santa Rosa de Lima', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (262, 'Casillas', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (263, 'San Rafael Las Flores', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (264, 'Oratorio', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (265, 'San Juan Tecuaco', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (266, 'Chiquimulilla', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (267, 'Taxisco', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (268, 'Santa María Ixhuatán', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (269, 'Guazacapán', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (270, 'Santa Cruz Naranjo', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (271, 'Pueblo Nuevo Viñas', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (272, 'Nueva Santa Rosa', 18, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (273, 'Sololá', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (274, 'San José Chacayá', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (275, 'Santa María Visitación', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (276, 'Santa Lucía Utatlán', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (277, 'Nahualá', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (278, 'Santa Catarina Ixtahuacán', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (279, 'Santa Clara La Laguna', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (280, 'Concepción', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (281, 'San Andrés Semetabaj', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (282, 'Panajachel', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (283, 'Santa Catarina Palopó', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (284, 'San Antonio Palopó', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (285, 'San Lucas Tolimán', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (286, 'Santa Cruz La Laguna', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (287, 'San Pablo La Laguna', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (288, 'San Marcos La Laguna', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (289, 'San Juan La Laguna', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (290, 'San Pedro La Laguna', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (291, 'Santiago Atitlán', 19, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (292, 'Mazatenango', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (293, 'Cuyotenango', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (294, 'San Francisco Zapotitlán', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (295, 'San Bernardino', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (296, 'San José El Idolo', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (297, 'Santo Domingo Suchitepéquez', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (298, 'San Lorenzo', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (299, 'Samayac', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (300, 'San Pablo Jocopilas', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (301, 'San Antonio Suchitepéquez', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (302, 'San Miguel Panán', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (303, 'Zunilito', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (304, 'Pueblo Nuevo', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (305, 'Río Bravo', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (306, 'Santa Bárbara', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (307, 'San Gabriel', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (308, 'Chicacao', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (309, 'Patulul', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (310, 'Santa Lucía Cotzumalguapa', 20, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (311, 'Totonicapán', 21, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (312, 'San Cristóbal Totonicapán', 21, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (313, 'San Francisco El Alto', 21, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (314, 'San Andrés Xecul', 21, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (315, 'Momostenango', 21, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (316, 'Santa María Chiquimula', 21, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (317, 'Santa Lucía La Reforma', 21, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (318, 'Zacapa', 22, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (319, 'Estanzuela', 22, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (320, 'Río Hondo', 22, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (321, 'Gualán', 22, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (322, 'Teculután', 22, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (323, 'Usumatlán', 22, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (324, 'Cabañas', 22, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (325, 'San Diego', 22, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (326, 'La Unión', 22, '2025-04-22 13:02:31', '2025-04-22 13:02:31');
INSERT INTO public.municipios VALUES (327, 'Huité', 22, '2025-04-22 13:02:31', '2025-04-22 13:02:31');


--
-- TOC entry 3902 (class 0 OID 17516)
-- Dependencies: 256
-- Data for Name: nom; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.nom VALUES (1, 'Prospectos', NULL, NULL);


--
-- TOC entry 3903 (class 0 OID 17520)
-- Dependencies: 257
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.paises VALUES (1, 'Guatemala', '2025-03-24 22:39:20', '2025-03-24 22:39:20');
INSERT INTO public.paises VALUES (3, 'Estados Unidos', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (4, 'Canadá', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (5, 'México', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (6, 'España', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (7, 'Colombia', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (8, 'Guatemala', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (9, 'Costa Rica', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (10, 'Panamá', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (11, 'Perú', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (12, 'Chile', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (13, 'Argentina', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (14, 'Reino Unido', '2025-03-25 11:48:56', '2025-03-25 11:48:56');
INSERT INTO public.paises VALUES (15, 'Alemania', '2025-03-25 11:48:56', '2025-03-25 11:48:56');


--
-- TOC entry 3905 (class 0 OID 17524)
-- Dependencies: 259
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3906 (class 0 OID 17529)
-- Dependencies: 260
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3908 (class 0 OID 17538)
-- Dependencies: 262
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.personal_access_tokens VALUES (1, 'App\Models\User', 11, 'authToken', 'e2f339dc5c2bad7d2641a3b33adbb343d08416d21a7437571b1c7636515b5866', '["*"]', NULL, NULL, '2025-03-28 17:36:35', '2025-03-28 17:36:35');
INSERT INTO public.personal_access_tokens VALUES (2, 'App\Models\User', 10, 'authToken', 'ba8e2fe9ff525ee643ad0254359db1c48e81732b977c06d2593307d00bc9a51d', '["*"]', NULL, NULL, '2025-03-28 17:38:17', '2025-03-28 17:38:17');
INSERT INTO public.personal_access_tokens VALUES (3, 'App\Models\User', 10, 'authToken', 'b91bc159348344092fc6a6d8f005a38a0775d738ef060a2973137586bc8d4641', '["*"]', NULL, NULL, '2025-03-28 17:38:22', '2025-03-28 17:38:22');
INSERT INTO public.personal_access_tokens VALUES (4, 'App\Models\User', 10, 'authToken', '1b185694813e536345bc0efd132df98a715d22d377e8b1f673e3affc636c2f01', '["*"]', NULL, NULL, '2025-03-28 17:38:24', '2025-03-28 17:38:24');
INSERT INTO public.personal_access_tokens VALUES (5, 'App\Models\User', 10, 'authToken', 'c86d66be5f744a782bca1e67b36986bdcce7aac6d8611f64037072cde2502b03', '["*"]', NULL, NULL, '2025-03-28 17:38:25', '2025-03-28 17:38:25');
INSERT INTO public.personal_access_tokens VALUES (6, 'App\Models\User', 10, 'authToken', 'e845b2fb00a0922fb0f8c900514c1f777bbcaeafed8124b2fedcf6b2641f675c', '["*"]', NULL, NULL, '2025-03-28 17:38:27', '2025-03-28 17:38:27');
INSERT INTO public.personal_access_tokens VALUES (7, 'App\Models\User', 10, 'authToken', '80de52743a7e2ac791ec04c62ef2b6261c02413620108620e71f62eceea8f4d2', '["*"]', NULL, NULL, '2025-03-28 17:38:28', '2025-03-28 17:38:28');
INSERT INTO public.personal_access_tokens VALUES (8, 'App\Models\User', 10, 'authToken', 'fcad4eefbb501290a5a365cf44c1f5fe2530ed1c22f2a712071713b9e7619996', '["*"]', NULL, NULL, '2025-03-28 17:38:30', '2025-03-28 17:38:30');
INSERT INTO public.personal_access_tokens VALUES (9, 'App\Models\User', 10, 'authToken', '07c6a64db8fa53f2466321fb314144c33ef5a22a456f92801e8e5fe87db6d882', '["*"]', NULL, NULL, '2025-03-28 17:43:40', '2025-03-28 17:43:40');
INSERT INTO public.personal_access_tokens VALUES (10, 'App\Models\User', 10, 'authToken', '8f1dd0be2a71c81e8b11123d6ecd9750e72852b19c8681ab0232277c3ef411b8', '["*"]', NULL, NULL, '2025-03-28 17:43:41', '2025-03-28 17:43:41');
INSERT INTO public.personal_access_tokens VALUES (11, 'App\Models\User', 10, 'authToken', 'd0c3bb2a110fc78cdb7befaedb292815b53debb008113ccf405e4efb5df928ca', '["*"]', NULL, NULL, '2025-03-28 17:43:43', '2025-03-28 17:43:43');
INSERT INTO public.personal_access_tokens VALUES (12, 'App\Models\User', 10, 'authToken', '43c51cfbc6e5c0d055160ad695db6f8cc8af7c8aa33027cd83d9dae75323b3a6', '["*"]', NULL, NULL, '2025-03-28 17:46:11', '2025-03-28 17:46:11');
INSERT INTO public.personal_access_tokens VALUES (13, 'App\Models\User', 10, 'authToken', '38764b4263458f883fafcbb0a122deeb1ff356242c78396f8e4b8553551375c1', '["*"]', NULL, NULL, '2025-03-28 17:46:12', '2025-03-28 17:46:12');
INSERT INTO public.personal_access_tokens VALUES (14, 'App\Models\User', 10, 'authToken', '2b9987e41958e40cfd282413e95a7cfbbb0359a85a5dafa4c1cfb00120cd382d', '["*"]', NULL, NULL, '2025-03-28 17:46:14', '2025-03-28 17:46:14');
INSERT INTO public.personal_access_tokens VALUES (15, 'App\Models\User', 10, 'authToken', '1617797f9bc00a4e41be1ab57e007fb74e958f8a39872ae4f2e7562fc1ed7515', '["*"]', NULL, NULL, '2025-03-28 17:46:15', '2025-03-28 17:46:15');
INSERT INTO public.personal_access_tokens VALUES (16, 'App\Models\User', 10, 'authToken', '52c99078fc61bf473842bcae65d7fd6dd5e92dd13f2aab9b0c9f10f593efad75', '["*"]', NULL, NULL, '2025-03-28 17:48:27', '2025-03-28 17:48:27');
INSERT INTO public.personal_access_tokens VALUES (224, 'App\Models\User', 10, 'authToken', '33d00b233709bc827a3426bf7c3b46e33b437344a05fd2906c6a70d94c5d2083', '["*"]', NULL, NULL, '2025-06-05 20:02:02', '2025-06-05 20:02:02');
INSERT INTO public.personal_access_tokens VALUES (183, 'App\Models\User', 10, 'authToken', 'd03e907d7b829e5bf38bab341fc47087ab3fc19479ee5df8337a6b82ef13ba6a', '["*"]', NULL, NULL, '2025-05-08 17:06:29', '2025-05-08 17:06:29');
INSERT INTO public.personal_access_tokens VALUES (18, 'App\Models\User', 11, 'authToken', '63efaeb5627e292af1000d0c8b21466a4d7e9aee75a329a75d8a97fde293f9b2', '["*"]', NULL, NULL, '2025-03-28 19:27:47', '2025-03-28 19:27:47');
INSERT INTO public.personal_access_tokens VALUES (19, 'App\Models\User', 10, 'authToken', '133619890b79dea97569c758ae36e75a7a8d7a21bc744bbae3d704b20d867da0', '["*"]', NULL, NULL, '2025-03-28 19:36:12', '2025-03-28 19:36:12');
INSERT INTO public.personal_access_tokens VALUES (20, 'App\Models\User', 10, 'authToken', 'b74c5fdc8061c07f607651cfe219ac77e3eff2a3257c582df7597c17da4f6e04', '["*"]', NULL, NULL, '2025-03-28 19:36:14', '2025-03-28 19:36:14');
INSERT INTO public.personal_access_tokens VALUES (21, 'App\Models\User', 10, 'authToken', 'c0bddab9265acd217be944984626067e5dd089f5948e647627538bb68154b129', '["*"]', NULL, NULL, '2025-03-28 19:36:16', '2025-03-28 19:36:16');
INSERT INTO public.personal_access_tokens VALUES (22, 'App\Models\User', 10, 'authToken', '19628f547dfbd6cc7c9007b6bf2525f0a1ebbffad97c3ce05eba325095eccef4', '["*"]', NULL, NULL, '2025-03-28 19:36:18', '2025-03-28 19:36:18');
INSERT INTO public.personal_access_tokens VALUES (23, 'App\Models\User', 10, 'authToken', 'e79aec82fc53797db530b2f858f54f136ee09c1726448ed22648b472855ab7bd', '["*"]', NULL, NULL, '2025-03-28 19:36:19', '2025-03-28 19:36:19');
INSERT INTO public.personal_access_tokens VALUES (24, 'App\Models\User', 10, 'authToken', '8044f834114aa26275389cd72402640204ea82717a1a175e954b813981a32e5d', '["*"]', NULL, NULL, '2025-03-28 19:37:10', '2025-03-28 19:37:10');
INSERT INTO public.personal_access_tokens VALUES (25, 'App\Models\User', 10, 'authToken', 'f32bb531847a3e6fef8dc4d1e38c1aa4cf4285410addc05b670eb911ef325e68', '["*"]', NULL, NULL, '2025-03-28 19:37:12', '2025-03-28 19:37:12');
INSERT INTO public.personal_access_tokens VALUES (26, 'App\Models\User', 10, 'authToken', '8964f3f8b03b6192487d65206dda36b542aa5e8c080e2b67d0aba65f8b8cac71', '["*"]', NULL, NULL, '2025-03-28 19:38:13', '2025-03-28 19:38:13');
INSERT INTO public.personal_access_tokens VALUES (27, 'App\Models\User', 10, 'authToken', '624ab139e05a59dcd3bba7b5f9d8c217b1f739bb00674e8c71b332f27a93db08', '["*"]', NULL, NULL, '2025-03-28 19:38:24', '2025-03-28 19:38:24');
INSERT INTO public.personal_access_tokens VALUES (28, 'App\Models\User', 10, 'authToken', '021b1395ef6dba609926a41d6486584544002ac08d4f542aa0f0a30294558e96', '["*"]', NULL, NULL, '2025-03-28 19:38:25', '2025-03-28 19:38:25');
INSERT INTO public.personal_access_tokens VALUES (29, 'App\Models\User', 10, 'authToken', '8ad9737dfca1d2b9b249bdb6186c153e44963b7a3a2c51b7c0fe1ed8cf765643', '["*"]', NULL, NULL, '2025-03-28 19:38:27', '2025-03-28 19:38:27');
INSERT INTO public.personal_access_tokens VALUES (152, 'App\Models\User', 19, 'authToken', '96175d961113ca11201df595679c58d3a21d9ab2ef65b68f79cbeee8776a4be1', '["*"]', '2025-05-06 23:09:22', NULL, '2025-05-06 22:28:45', '2025-05-06 23:09:22');
INSERT INTO public.personal_access_tokens VALUES (154, 'App\Models\User', 19, 'authToken', 'bbd1044b9344ccfa5f2c5cb543b981138fa5040f193f4712ab6de7c4c0bce510', '["*"]', NULL, NULL, '2025-05-06 23:37:16', '2025-05-06 23:37:16');
INSERT INTO public.personal_access_tokens VALUES (39, 'App\Models\User', 10, 'authToken', 'a0b0c53ad6918600df01e84e34fc0e5a631dec8c62c4edfaed67ed95af93214d', '["*"]', NULL, NULL, '2025-03-31 14:08:25', '2025-03-31 14:08:25');
INSERT INTO public.personal_access_tokens VALUES (153, 'App\Models\User', 21, 'authToken', '83bdd80dc214590d5beccb27b6de4f05f47921176817798b939521158b468890', '["*"]', '2025-05-06 22:57:10', NULL, '2025-05-06 22:32:49', '2025-05-06 22:57:10');
INSERT INTO public.personal_access_tokens VALUES (36, 'App\Models\User', 11, 'authToken', 'c0cdb0137617aa6065c07543fac620120f9bb0c4a76ed493ca45523d543974b7', '["*"]', NULL, NULL, '2025-03-31 01:06:42', '2025-03-31 01:06:42');
INSERT INTO public.personal_access_tokens VALUES (158, 'App\Models\User', 13, 'authToken', 'e67713e345845f3ece49dc9ff23ecf208d47676c9023a1f7831d5be1edb36942', '["*"]', NULL, NULL, '2025-05-07 02:16:58', '2025-05-07 02:16:58');
INSERT INTO public.personal_access_tokens VALUES (96, 'App\Models\User', 10, 'authToken', '46d4a481ffa93a44465eb717831b04010fa1a20fd5409b077fd9f27098b3c36d', '["*"]', NULL, NULL, '2025-04-10 22:38:37', '2025-04-10 22:38:37');
INSERT INTO public.personal_access_tokens VALUES (106, 'App\Models\User', 10, 'authToken', '1089cf4ae7e5d39018d8ae948222502be86dc0ffbb71425f0428635a9a168a48', '["*"]', '2025-04-16 14:38:17', NULL, '2025-04-16 14:35:20', '2025-04-16 14:38:17');
INSERT INTO public.personal_access_tokens VALUES (120, 'App\Models\User', 10, 'authToken', '7876bef961b2cc81524b116f94aa6cbfb7084f7470acb9399f74517fc529c78e', '["*"]', NULL, NULL, '2025-04-24 20:17:17', '2025-04-24 20:17:17');
INSERT INTO public.personal_access_tokens VALUES (115, 'App\Models\User', 10, 'authToken', '61dd00ad938795696b8fb3617ee827a368efb4d3d72912b334a4f1a55986f817', '["*"]', '2025-04-23 21:49:28', NULL, '2025-04-23 14:59:58', '2025-04-23 21:49:28');
INSERT INTO public.personal_access_tokens VALUES (126, 'App\Models\User', 10, 'authToken', 'd321124592d04b59f3e32edd6dcff5767807b135bd4c935fe750fc54ca182b0e', '["*"]', '2025-04-30 15:50:03', NULL, '2025-04-30 14:33:21', '2025-04-30 15:50:03');
INSERT INTO public.personal_access_tokens VALUES (121, 'App\Models\User', 10, 'authToken', 'f3492b86a1925bae67f2c618081dca6da5ef8459267c539399c91d2dd0b7dbd3', '["*"]', '2025-04-25 21:33:03', NULL, '2025-04-24 21:31:21', '2025-04-25 21:33:03');
INSERT INTO public.personal_access_tokens VALUES (127, 'App\Models\User', 10, 'authToken', 'b2f484f6ef944dd2ec91a0c746c1337dfb008e4051c2e86802a161cfa5c732d9', '["*"]', '2025-05-06 01:00:55', NULL, '2025-04-30 15:18:34', '2025-05-06 01:00:55');
INSERT INTO public.personal_access_tokens VALUES (128, 'App\Models\User', 10, 'authToken', '1bb6d247f03205f56db62df6554c851d40092160a3192cca8c95fe0d3f833bc5', '["*"]', '2025-05-06 20:46:01', NULL, '2025-05-06 01:16:27', '2025-05-06 20:46:01');
INSERT INTO public.personal_access_tokens VALUES (144, 'App\Models\User', 10, 'authToken', '9472862e8cb455b7fa04de8580c04e866dcfe0047fae77033e9e08c19db43530', '["*"]', NULL, NULL, '2025-05-06 22:06:15', '2025-05-06 22:06:15');
INSERT INTO public.personal_access_tokens VALUES (214, 'App\Models\User', 10, 'authToken', '94655f78073854325d498004036efe64c498062e268ac309c13ecb0824bba7f3', '["*"]', NULL, NULL, '2025-05-29 16:18:11', '2025-05-29 16:18:11');
INSERT INTO public.personal_access_tokens VALUES (215, 'App\Models\User', 13, 'authToken', '6e30ba011e29502c820b400c9768d1b598dbef956dba3c0dcf573790f8de4e75', '["*"]', NULL, NULL, '2025-05-29 16:47:34', '2025-05-29 16:47:34');
INSERT INTO public.personal_access_tokens VALUES (223, 'App\Models\User', 13, 'authToken', '62024659715241a4d4abf56836e14b76c7fcb07e509f2cfdf847924a4faadb69', '["*"]', '2025-06-04 14:42:33', NULL, '2025-06-04 14:08:42', '2025-06-04 14:42:33');
INSERT INTO public.personal_access_tokens VALUES (222, 'App\Models\User', 10, 'authToken', 'fc83fa883be718a1c541e69b429d0916b5199c1ca25cd90066654092213f5641', '["*"]', '2025-06-04 15:15:22', NULL, '2025-06-04 14:05:06', '2025-06-04 15:15:22');
INSERT INTO public.personal_access_tokens VALUES (227, 'App\Models\User', 1, 'authToken', 'dd58453e697e9d16f637a51c1384446e2ea66a095ba6a4e476a7525a7755f427', '["*"]', NULL, NULL, '2025-06-08 11:29:56', '2025-06-08 11:29:56');
INSERT INTO public.personal_access_tokens VALUES (228, 'App\Models\User', 1, 'authToken', '835a0f779c08dccc61e3a93e423091f6f344b09943c5a708f8d46c482e132b8f', '["*"]', NULL, NULL, '2025-06-08 11:58:46', '2025-06-08 11:58:46');
INSERT INTO public.personal_access_tokens VALUES (218, 'App\Models\User', 10, 'authToken', 'a55ddd3ab95041656149cb722ef64c1c64783eea8f65c9db21319555b68455e6', '["*"]', '2025-06-04 00:34:30', NULL, '2025-06-04 00:09:04', '2025-06-04 00:34:30');
INSERT INTO public.personal_access_tokens VALUES (176, 'App\Models\User', 10, 'authToken', '48988c067341a9987abf4f51ee6785b76516429812cf2f53b9b0f36b4ec46c97', '["*"]', NULL, NULL, '2025-05-08 14:04:59', '2025-05-08 14:04:59');
INSERT INTO public.personal_access_tokens VALUES (186, 'App\Models\User', 10, 'authToken', '66876609adef12fb10ee68d574ac000ac08bd7e003662e4ad5dd4c9613c14b3c', '["*"]', '2025-05-09 23:42:56', NULL, '2025-05-08 23:16:05', '2025-05-09 23:42:56');
INSERT INTO public.personal_access_tokens VALUES (179, 'App\Models\User', 20, 'authToken', 'fffd15e84bcef91a9e33f0a1e3ff69f0081662019d91c8b89bbe7d621bd86dbd', '["*"]', '2025-05-08 14:54:10', NULL, '2025-05-08 14:36:36', '2025-05-08 14:54:10');
INSERT INTO public.personal_access_tokens VALUES (178, 'App\Models\User', 13, 'authToken', '173d36db46f2f6d66fb44547c47aa22e30d2ceec28cc2c1859ce0efbe1763ba0', '["*"]', '2025-05-08 14:39:08', NULL, '2025-05-08 14:15:04', '2025-05-08 14:39:08');
INSERT INTO public.personal_access_tokens VALUES (204, 'App\Models\User', 10, 'authToken', '08f30fda10d205998ba0a537cb910f086ee057451b6b2cd8f47a99a330e01efb', '["*"]', '2025-05-13 20:29:39', NULL, '2025-05-13 15:50:39', '2025-05-13 20:29:39');
INSERT INTO public.personal_access_tokens VALUES (212, 'App\Models\User', 10, 'authToken', '6f4fbac06f6f396189f8fae5f1debd7b23aef1c8cab2389ec934ef15f9dd30af', '["*"]', NULL, NULL, '2025-05-15 14:52:47', '2025-05-15 14:52:47');
INSERT INTO public.personal_access_tokens VALUES (245, 'App\Models\User', 10, 'authToken', '001e0b1f118d08ae410ddf7b73d776c3c2e936746e548463b9b5de2b279bb5d8', '["*"]', NULL, NULL, '2025-06-10 21:51:58', '2025-06-10 21:51:58');
INSERT INTO public.personal_access_tokens VALUES (241, 'App\Models\User', 10, 'authToken', 'aa615f040a8fb8aff05b3d9db82b14851610e4b185d476ed8620664bb05cb2fc', '["*"]', NULL, NULL, '2025-06-10 21:05:29', '2025-06-10 21:05:29');
INSERT INTO public.personal_access_tokens VALUES (242, 'App\Models\User', 10, 'authToken', '6aececf7a249bc870ef4d9826675949cc9ce8d8c3d147f724dcac9598168f620', '["*"]', NULL, NULL, '2025-06-10 21:43:09', '2025-06-10 21:43:09');
INSERT INTO public.personal_access_tokens VALUES (229, 'App\Models\User', 10, 'authToken', '0efe950d4c30f25196cd7f65a4362cddbc3cc60aa6077b9b4394e29e72b780b0', '["*"]', NULL, NULL, '2025-06-09 06:05:27', '2025-06-09 06:05:27');
INSERT INTO public.personal_access_tokens VALUES (230, 'App\Models\User', 10, 'authToken', '1d24c13326193d8a69b3ca41823c801c08087e6a231eb87bcd7929299cc05528', '["*"]', NULL, NULL, '2025-06-09 06:06:31', '2025-06-09 06:06:31');
INSERT INTO public.personal_access_tokens VALUES (231, 'App\Models\User', 10, 'authToken', '42b10dca16380f41385801bef892ae07ef07af61a4834e8c4dd0d4e7933fb178', '["*"]', NULL, NULL, '2025-06-09 06:08:05', '2025-06-09 06:08:05');
INSERT INTO public.personal_access_tokens VALUES (232, 'App\Models\User', 10, 'authToken', '552e10e7f7382594944bb5dff22f74682829414b6f1fd9f974f36fe8d16beb12', '["*"]', NULL, NULL, '2025-06-09 06:13:15', '2025-06-09 06:13:15');


--
-- TOC entry 3910 (class 0 OID 17544)
-- Dependencies: 264
-- Data for Name: prospectos; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3911 (class 0 OID 17549)
-- Dependencies: 265
-- Data for Name: prospectos_documentos; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3914 (class 0 OID 17561)
-- Dependencies: 268
-- Data for Name: rolepermissions; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3916 (class 0 OID 17567)
-- Dependencies: 270
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.roles VALUES (10, 'Marketing', 'Marketing', false, '2025-05-07 03:18:03', 0, NULL, '2025-05-07 03:18:03');
INSERT INTO public.roles VALUES (6, 'Seguridad', 'Acceso a módulos de seguridad', false, '2025-03-25 18:42:41.606234', 1, 'security', '2025-05-07 03:18:57');
INSERT INTO public.roles VALUES (5, 'Finanzas', 'Acceso a módulos financieros', false, '2025-03-25 18:42:41.606234', 1, 'financial', '2025-05-07 03:19:03');
INSERT INTO public.roles VALUES (7, 'Asesor', 'Acceso a Prospectos y asesores', false, '2025-03-25 18:42:41.606234', 5, 'Prospectos', '2025-05-08 14:07:15');
INSERT INTO public.roles VALUES (2, 'Docente', 'Acceso a módulos académicos y de docencia', false, '2025-03-25 18:42:41.606234', 3, 'academic', '2025-06-05 21:45:31');
INSERT INTO public.roles VALUES (1, 'Administrador', 'Acceso completo al sistema', false, '2025-03-25 18:42:41.606234', 9, 'system', '2025-06-05 21:46:28');
INSERT INTO public.roles VALUES (4, 'Administrativo', 'Acceso a módulos administrativos', false, '2025-03-25 18:42:41.606234', 1, 'operational', '2025-06-05 21:46:28');
INSERT INTO public.roles VALUES (3, 'Estudiante', 'Acceso a módulos estudiantiles', false, '2025-03-25 18:42:41.606234', 5, 'academic', '2025-06-06 03:38:56');
INSERT INTO public.roles VALUES (9, 'Roltest', 'Punto a Punto', false, '2025-04-24 21:40:05', 2, NULL, '2025-06-10 21:13:41');


--
-- TOC entry 3918 (class 0 OID 17576)
-- Dependencies: 272
-- Data for Name: securitypolicies; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3920 (class 0 OID 17580)
-- Dependencies: 274
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.sessions VALUES (1, 11, 'ad35990cf2f8de3e76cf4355cf6dc524711bf962f3054da88264cc410154b6da', '127.0.0.1', 'insomnia/10.2.0', '2025-03-28 17:27:34', '2025-03-28 17:27:34', true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (2, 11, 'f8f7ab00693d9ec24ef5bffc79d5cb15017071bf90ac89b766710f38558b9a15', '127.0.0.1', 'insomnia/10.2.0', '2025-03-28 17:34:13', '2025-03-28 17:34:13', true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (3, 11, '68e8c2c9b390a75c06b31bfcf93f0564c33b298dc1d8a10cfec9cb39f3e9f016', '127.0.0.1', 'insomnia/10.2.0', '2025-03-28 17:36:35', '2025-03-28 17:36:35', true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (154, 19, '76648765380d3a539e0ecf15045424d016dda9f51d26b65bf9d0e0ffc5470e78', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:28:45', '2025-05-06 22:28:45', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (116, 15, '56847d7c59779b90307887a62ee06217369eaf9b8dda8a24e286b12375a45a3e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-23 14:37:24', '2025-04-23 14:37:24', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (155, 21, '9467ab319a5b7bc408316951f8714b0b45bc662cc490f0039519a52259220160', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:32:49', '2025-05-06 22:32:49', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (176, 19, '27ac47cb8428aa6c290e92a5c85cd45cdb9a7a80e39f57bd0bd9fda56fac921e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 13:35:57', '2025-05-08 13:35:57', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (199, 19, 'db38ff7ea92c04cf5477a03f912c94821672a10d5203342628539cfbbbc259a7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 14:03:30', '2025-05-13 14:03:30', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (152, 20, '1fa073b5627784ac23199429a9ba64a4c459ab03e989ba379293f6ad8cad16f3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:27:24', '2025-05-06 22:27:24', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (242, 10, 'c358d9c28cc5f8a678fe8869aea80c8cf1525007221753362d6e93c12712f2fc', '190.143.185.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 20:53:40', '2025-06-10 20:53:40', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (240, 10, '2eca0d4efdc204637a832d7083a925eee1bd569af3ee95eafaeb3312917c5322', '190.143.185.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 20:26:43', '2025-06-10 20:26:43', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (213, 20, '6b7bc0fa3a4dce2e12e6394a3d0cb4bc1cd45206879b6f5a454480ab23ec2493', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-15 14:52:19', '2025-05-15 14:52:19', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (220, 10, 'de6da6ffb9fb9d07b4a56d76a5bbe82ba2b277736ce0f50bbbba8c89a31364d5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 00:09:04', '2025-06-04 00:09:04', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (179, 22, '1435d39d476e413fa3969d51b685cc096f6afc5439e3d200fa8e01ab4a8df839', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 14:09:11', '2025-05-08 14:09:11', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (20, 11, '7b4e1489c0f4c536127dee40711416a02299d877f0b044b69e66aabe21c2980a', '127.0.0.1', 'insomnia/10.2.0', '2025-03-28 19:27:47', '2025-03-28 19:27:47', true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (167, 10, '458968a67c882df34ea6ed72f7dd7ada8627bcd04145c1b2ab5ffceb465bce0a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-07 03:17:10', '2025-05-07 03:17:10', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (58, 10, '404b9e4af4a67d3db6993b9521284c08f5c19d562568a7d34a265d19bd4f3d19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-04 19:09:05', '2025-04-04 19:09:05', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (143, 10, 'a4d96243e30fb17cf0b76ac47d77054cfaf96e0dbc3357637cef6019cd95445c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:04:06', '2025-05-06 22:04:06', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (186, 10, 'e860f245d7307db63975398076f0ef8d8d531c20183766dd33abae7dac4b2544', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 17:06:36', '2025-05-08 17:06:36', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (217, 13, '4252adceecbd306f0e91197b7f9f9831ed60758c9679a46b8c8f507946897dcc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-05-29 16:47:34', '2025-05-29 16:47:34', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (190, 13, '7a15cbab8b5733ed96dd77dc6ae96cfd12d9a006c277a616aa4eb52eec71e35a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 23:23:05', '2025-05-08 23:23:05', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (82, 13, 'dbec401953d50d72c9cb99e30437caf14be9e940aedbe00fa45c4594b1a2065a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-08 20:41:42', '2025-04-08 20:41:42', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (147, 13, 'bf5f737a77d93f844b16bd58a1fcc7d14a9a91c7a4f0f606906cdab485cbd5ee', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:07:09', '2025-05-06 22:07:09', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (107, 13, 'abbb88285f69dac07166da35821508389bf22c0255b852959163e6f5cb0fab71', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-15 23:02:55', '2025-04-15 23:02:55', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (71, 13, '3a6e940846ad98f0d5e78e0cfb5f78d05f1da9295df2c130d10504add4f3579e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-07 03:01:01', '2025-04-07 03:01:01', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (142, 13, 'f9355f4c86ed77c471c15056671903302b831d225eb86fac02a7cfa484cadda9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:59:40', '2025-05-06 21:59:40', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (187, 13, 'c8f7c94f60f1e1f66cd0c3b9ed69e3d70bb1308199d7170e9dc9766ab01616b5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 18:25:36', '2025-05-08 18:25:36', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (215, 13, '3392224aafdf88a0f48e82a0393c2c7bede758c62580e1f9316cd09f1c700370', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-05-23 03:00:23', '2025-05-23 03:00:23', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (243, 10, '4c4d6dfe348d697a54719d74e05c0e88332772755fdfd59afab425bca3630990', '190.143.185.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 21:05:29', '2025-06-10 21:05:29', true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (229, 1, '75fc62de670a0a4b7feeca4bac7da8b0e4c31981bfdf801fa7ab465bbb4ee952', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-08 11:29:55', '2025-06-08 11:29:55', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (61, 10, 'b062b2f77352ea9d6bacdf61c7fcacce15d8b7fae1f0197a14eb1a0b40e1a90a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-06 20:10:28', '2025-04-06 20:10:28', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (200, 20, 'ef4107f2bd60f50942b018efa44f519a5c11046691d2a945d7d30d399a95c55d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 14:04:08', '2025-05-13 14:04:08', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (156, 19, 'cb39f2a9a3732ce220207b520f269fe7681c44e000278714d5137af627799790', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 23:37:16', '2025-05-06 23:37:16', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (38, 11, '0fb286a0a69ee705bec54d2dbf58122bf0b675b08ee27c6867eed970756f394b', '127.0.0.1', 'insomnia/10.2.0', '2025-03-31 01:06:42', '2025-03-31 01:06:42', true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (100, 10, '123821e0bd028cffda19d9efe977dcffe4d9d2877092d78e98ecd663ee60ef93', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 22:39:12', '2025-04-10 22:39:12', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (29, 10, '66f52e701a21bbd0323a681e45a9fe4fc28a9747876c565e685b3e3ecbded60c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 19:38:24', '2025-03-28 19:38:24', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (126, 10, 'e73d22ba50e362b569d5467a4060fcf8cdabaca69596f90f92478596458ff15c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-30 14:01:25', '2025-04-30 14:01:25', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (139, 10, '1b2ced1fd1a8e54033ebb6a8c7790039ca03c7b9b0721bf9204c3ac764bdabf2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:42:59', '2025-05-06 21:42:59', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (48, 10, '3a040832c385ff590fe087aae9f07dac1710d97f43d9798afefc037fa94bca5f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 15:52:30', '2025-04-03 15:52:30', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (43, 10, '89137eedea9825d4f397d584a6cd2fccbd6afc006dd1aa73cb0d4a19a814746a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 14:03:41', '2025-04-01 14:03:41', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (201, 19, '664a704bf12e33ba9bda775d8efb5ea62bd33701c4c7097fc5e9aa201cd5bbdb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 14:04:40', '2025-05-13 14:04:40', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (131, 10, '248f888e152e5fdbd0238be3b47710af1d80696d01a77dfaf5985f93fa903c58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:15:08', '2025-05-06 21:15:08', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (53, 10, '570cdbaf8923a96b5224453957e15fa37c27ef2b2899d064bc3ba14f33fc00d2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-04 00:40:25', '2025-04-04 00:40:25', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (99, 10, '566a622f071cad687cbeda9aaff04e113f8ace0530eb92bc86f370f74b6660e5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 22:38:55', '2025-04-10 22:38:55', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (74, 10, 'af8a4a930740bb2ac113d53b3b40d39b0d421226a82d17cf101ac8983701c027', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-07 04:26:08', '2025-04-07 04:26:08', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (181, 20, '5e24ee719d44a9347a210f94320900285268b5ca10105ee1bb327968af509ba8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 14:36:36', '2025-05-08 14:36:36', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (72, 10, '2191b0e1bf7b873d0d69c6aa582ba6cdd15d1841f82292023ef67f9095fd2b73', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-07 03:30:14', '2025-04-07 03:30:14', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (42, 10, 'b94d4269d56aa87cd88e089ebce3a13c4d424734d8c5d3b96dad4caab5d7c1ae', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 14:03:29', '2025-04-01 14:03:29', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (202, 19, '5f7b84583e8c0bd3b830950cad27f234aa0f7c136a298cf168ae662caa2ed658', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 14:08:23', '2025-05-13 14:08:23', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (219, 13, 'd30b7987c02667aa56545e201849a62cd6eb27faea5087bc0b9fea60d87b9fb2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 00:08:54', '2025-06-04 00:08:54', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (166, 13, '9b7f5433bbc475a09c5fc1c0d638195969b2341aa856997498574664b0a93b00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-07 03:16:53', '2025-05-07 03:16:53', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (101, 13, 'acfe782ae3c1087a748bbf6a6e72b9bc617dab7cf5365a9866586487362eb61a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 22:40:44', '2025-04-10 22:40:44', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (145, 13, '61cb6dc95370b172787986091daf4c9dd7309017e8e6fabb459d1bfe571c3832', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:05:45', '2025-05-06 22:05:45', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (197, 13, '2f6c26d6d57dede10c08761793c39ba291602e2f39c2c46e406620f96706e02a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 07:37:07', '2025-05-13 07:37:07', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (157, 13, '7adc58072400c43e834a3240e071d81b906faebabe0de1a14af75f6b9fda0a39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 23:37:21', '2025-05-06 23:37:21', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (78, 13, '236c9e47edf5af31596373190d2dceb182b6c85dd0ee6644246a8373cc4840da', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-08 14:30:46', '2025-04-08 14:30:46', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (141, 13, 'e797e9ef6d1586aafece8d6f831dd71fc00b1df4f8dbfdb39952bc4d93487c1e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:52:43', '2025-05-06 21:52:43', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (180, 13, 'a13531e5af6078f5df8a2e78c8f7ac6ad936e4779a1a39907b1f39b84f2a3b07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-05-08 14:15:04', '2025-05-08 14:15:04', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (170, 13, 'abcb1b7e111b67d833ba82c049f7c1a1b4c2122216a46cfaf02cf164d00c7b3b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-07 23:18:04', '2025-05-07 23:18:04', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (87, 13, '5f7b63b0b5ba2c1a31c0aaf32f2ae9b8d1db292617ea21ec3f7163bb3fb34c76', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-08 21:24:16', '2025-04-08 21:24:16', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (62, 10, '518b8a8788361e856d8c9dd498e57d12813a038934f8004518c9e7ce5a23ccb9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-06 20:27:53', '2025-04-06 20:27:53', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (51, 10, '410aa18e7135295474bcf9ecf4a7de2b56ebc150ef6a2e6463dce040c7bd1197', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-04 00:40:12', '2025-04-04 00:40:12', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (120, 10, 'cefe274fab4ece478d7b3139ba1b81a55dc1ccb6014a185204c62c68118c6a66', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-24 03:05:46', '2025-04-24 03:05:46', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (12, 10, '219bb353d581b7917c8249a6807feafb17be367e474d0f923fd8448ca90576c4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:43:41', '2025-03-28 17:43:41', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (206, 10, '37b0ff3ec75460afb0a44a8e4dde70a993f3369568c816960f17d7b7d72ecc88', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 15:50:39', '2025-05-13 15:50:39', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (65, 10, 'd277702ce35474c51ea262dbfdc81115edeecca3927d78b2f6df15def315c140', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-06 23:20:48', '2025-04-06 23:20:48', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (84, 10, 'cc2ac1edef1241fff499094bfb3b058ed0414a904ef188131535b40f8ac48a18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-08 21:13:20', '2025-04-08 21:13:20', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (106, 10, '029074c9bdcadfb1250aef324cd9cae5cc353da4bc41d47b18e43f215030d18e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-15 20:45:47', '2025-04-15 20:45:47', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (182, 21, 'ca9d4800dc2753ea2681577ba19cabd4fa52fb946c7939717d23208c6c66ec23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 15:07:54', '2025-05-08 15:07:54', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (46, 10, '14b33d6eab564e269e6d1422d2953235666733366f557d79fcd0066774e98a0b', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '2025-04-03 00:12:35', '2025-04-03 00:12:35', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (7, 10, '571ffcae578d75ef89530087c511ca29a75c0038e92e1a39959cc6b090604246', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:38:25', '2025-03-28 17:38:25', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (92, 10, 'c6fb4228fb117000c79909d537b02311d68a0e6b41f0f2e8a123c249c2995f58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 19:28:27', '2025-04-10 19:28:27', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (17, 10, '6e8e8c47df022b058b0c98f767c3a6d6da0fa06f2268e0b3cb67502dd684a9c6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:46:15', '2025-03-28 17:46:15', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (21, 10, '5977dab2bb6d178bcafe2a5d3464a6af3b16a2953b310eb18ab84e3384d716fc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 19:36:12', '2025-03-28 19:36:12', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (203, 20, '6ffbcb0b2ea56969eaa44fd8c023b808f1639a37b668a7833ea93a1085b0555a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 14:08:25', '2025-05-13 14:08:25', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (144, 10, '553403aa434b12f6843e15d19e64092a1ea7740933d880b384d5d4ba72bef67c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:05:18', '2025-05-06 22:05:18', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (165, 10, '34bd517d2254a90785c33aaaf0b2d7ba4cf4eb8f9531c67acb7752ef2cb78977', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-07 03:07:53', '2025-05-07 03:07:53', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (60, 10, 'e90d474a3fc2bcf664842d47d8c67b1d40ca16c1a4368556d7ec65605c39c499', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-06 03:57:34', '2025-04-06 03:57:34', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (63, 10, '009a919a58e7b92bc7b176f22dcee782715d3e1860845a4014dc0c21a5587200', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-06 20:32:05', '2025-04-06 20:32:05', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (146, 10, 'd9223342007ef46ceb6bfdf98e7f88767cdf9f1047a8f899586d82a6488c2e3a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:06:15', '2025-05-06 22:06:15', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (23, 10, 'c480b64a4afb177e3066187da925506d75df6fa6a43e8cf112634977bc0bfb64', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 19:36:16', '2025-03-28 19:36:16', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (24, 10, '1d81768cb4020a90525ce016e35c761dc8ff1d5f2a0b364e4b388a058eec0141', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 19:36:18', '2025-03-28 19:36:18', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (81, 10, 'e3ad3a6c60df6bf84c69af257fa6eef3034deb25d92139c05daf8704cb66fa53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-08 20:41:18', '2025-04-08 20:41:18', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (70, 10, 'df0725eb98c9bd233b3d335f469a824bbb09fbbe1a1821308b9583a6b9f3cb4b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-07 00:10:02', '2025-04-07 00:10:02', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (13, 10, '82f5d16b8b1c85e7b9b52246ae65e29a2065dde72f9eb520de19ea69b582a6cb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:43:43', '2025-03-28 17:43:43', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (172, 10, 'fad0ce1bc57dfcde116c90396491e6694b2ad0c9ba35fcfed2ce95eebb8d1abc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 02:20:59', '2025-05-08 02:20:59', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (93, 13, 'e320e365bf2f04da38507bb5566b5302c35ecefa395ff6af59c86f07a7651f60', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 21:47:14', '2025-04-10 21:47:14', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (104, 13, 'aa578802b718cfe555b0baff93b8847841a604f727f921979d63a964354c1d87', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-11 20:09:36', '2025-04-11 20:09:36', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (198, 13, '95d6b3966665e8150399e412eb92595abc84714fc4dbcb5b9f74f6f135cbf00c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 13:43:47', '2025-05-13 13:43:47', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (221, 13, 'e66a78d2bd8491748d22b62d6d7f81b9c2393c5753deea1a90fb22211d116cda', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 03:18:29', '2025-06-04 03:18:29', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (97, 13, 'c9a36980077291d1664bc0317e86507b5e69179686b2a953a2918f132bffd942', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 22:37:12', '2025-04-10 22:37:12', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (96, 10, '6fac719ac3ee433c39419cc8284bb30b57c173c8d9c78cae8ac2e85acf2e62b0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 22:36:23', '2025-04-10 22:36:23', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (8, 10, '6fa03bae93b1be016e7b46b4a969d5f8800d2f23e0ce41a92cd326c8bb31f245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:38:27', '2025-03-28 17:38:27', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (55, 10, '5c6eb8ebdc1ce38a3881c5c66e942fe9749e9fea81cf605522166e5d7ba5e4dc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-04 00:41:39', '2025-04-04 00:41:39', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (125, 10, 'ecd2328e08677e9ee0f0b0a085ecd306960986ab636419f6611ce0edf5ae4835', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-29 16:35:54', '2025-04-29 16:35:54', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (133, 10, '6ac21a2081cd0ccae653e2fab7a3203c1bb4f24f703cfd8b53333338d8bdc79a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:38:46', '2025-05-06 21:38:46', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (119, 10, 'b5cbb40f2a920084d20f3d70e93a0f1c6e28085e22cd2b71859c845d7f140d3f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-23 22:09:44', '2025-04-23 22:09:44', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (41, 10, 'de60f2ff95052439b0d262aaee038a83e5fe161a5d7a16da4317a7b16d0ac5d4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-31 14:08:24', '2025-03-31 14:08:24', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (10, 10, '52e68a8309ffba4d154ac397594c0b9b1730e4f313937f2e1e4494ec51148ed0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:38:30', '2025-03-28 17:38:30', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (148, 10, 'dea922918ae237508ffc0e44d08345842c8735c633ebad542fbf06abb7a0daed', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:08:08', '2025-05-06 22:08:08', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (49, 10, 'd2ae679090681d9042831515ddda00ccfc5d443e7ec516615b451e361db56be9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 15:52:52', '2025-04-03 15:52:52', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (32, 10, '0a07a2266d2d4e5d0e15b2e9dcfd1f077378193f2441afc90d8b732161ede231', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 20:10:20', '2025-03-28 20:10:20', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (122, 10, 'db98571fd00e992c871b4fc2f1cb2624a0892471875cb3ebf4e3d5d65e6f5840', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-24 20:17:17', '2025-04-24 20:17:17', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (185, 10, 'cbcc535a353583b4985e614287d16c386407d9ee0fc6b075bd796472849c0ea9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 17:06:29', '2025-05-08 17:06:29', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (77, 10, '461573a71f9c6bb7a9533d539a4356b77c76adeb7126c790fc42f2e54f2653f1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-08 04:27:46', '2025-04-08 04:27:46', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (19, 10, 'acf24c79bc32ac4b411f161e84195f5200ef2f888b52259ec341540e6ef8fb32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:48:29', '2025-03-28 17:48:29', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (158, 10, '955a0bdbd069d3edc7e7d0a814320a7357a15980928042ff610f1a5b8ae99a54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 23:37:35', '2025-05-06 23:37:35', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (103, 10, '37f1c1754ac13fec862775eb4d8760e8c00d9f31fbb2c18fabc9ec92d171b894', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-11 20:04:48', '2025-04-11 20:04:48', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (39, 10, '878b7cfbc83da26715fdad5ffe66a447617f348cce99e8ccb242a2e281f482b7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-31 02:48:42', '2025-03-31 02:48:42', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (75, 10, 'b9b9fb47215aecb1b143c1e067c48620f0f4533a04a5e5f1bf9f9d204f4d0341', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-07 04:46:39', '2025-04-07 04:46:39', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (207, 10, '1c210cb3153117e8a117eb34d36578e30587f4560d1980842e635ef157889c4c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 20:32:13', '2025-05-13 20:32:13', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (88, 10, 'be9ee5e25f00090a1f2adab0de23d3aaf39746845441c7c54d2e850073637238', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 03:59:40', '2025-04-10 03:59:40', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (123, 10, '1753a74bd623d895bc670b3004571137907009b0b9bc9aedd3c29e1f15486096', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-24 21:31:21', '2025-04-24 21:31:21', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (124, 10, '7277851dd0781bfcd127dde7747abcc870cc9a0f2f64b0ea63f57e7966bcd69a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-29 16:35:44', '2025-04-29 16:35:44', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (94, 10, '868f6cc8186303dae7d46894d581cf1fd15239a2c56a55106464898b2673d3a4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 21:48:19', '2025-04-10 21:48:19', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (91, 10, 'e0fc07d22e103ef479d1294a1180ef9adbb7cf02e91edbed06bac87460d38a4a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 18:28:20', '2025-04-10 18:28:20', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (86, 10, '9cc1716f7e2f0f1b7e183956f7fc4821158b1b600095e9a68c5dad24f8c18101', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-08 21:23:44', '2025-04-08 21:23:44', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (204, 13, '645c2d0386966aa3b3e5ef269d0fba722b4bdaacec8ab31d57c4c09275903978', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 15:50:20', '2025-05-13 15:50:20', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (183, 13, '978a6e5b38b810e04a7d4c673b87caa1c5776604e060ddd9fdbdff901e5f9775', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 15:52:29', '2025-05-08 15:52:29', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (149, 13, 'ea1fbf7a6331533c18d93bd869391a3d255aba2cb1248c97e95c493413164e3a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:14:06', '2025-05-06 22:14:06', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (160, 13, '8a60807ce3c9eb81d13b686f552a6675e5ac6031af8cd806069e5ef8e5f81d8b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-07 02:16:58', '2025-05-07 02:16:58', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (205, 13, '74948dbf535f2b344950afaccfef0686ca7f5cb8b35753767702bcb7b46be8e2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 15:50:30', '2025-05-13 15:50:30', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (57, 10, '15bc636b0178f996bae75ccb67e6a2309f2dac97868100db7e8746bafa7dafd8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-04 19:08:49', '2025-04-04 19:08:49', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (73, 10, '77368ac4254ba10ea1e91223b5d144d3b43274ef121445978a5846632225308a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-07 03:45:24', '2025-04-07 03:45:24', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (64, 10, '15b83686710b9967b252d3bfa9cfb9b8c061e6c87be1780859d14ad1a85864e6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-06 20:40:14', '2025-04-06 20:40:14', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (34, 10, 'b807e8cc46a547ef8293076197a9315d1216ea0606c21b6ca1890a0b7a2666be', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 20:10:39', '2025-03-28 20:10:39', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (18, 10, '379b6750794321f248efb44e37e5953007b314fa1b5cd2209965077cff1aea5d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:48:27', '2025-03-28 17:48:27', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (102, 10, '2481f2b462827ae9552563a1646f70e7f0c6417cc5dd2fdccab9713aec64fa42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-11 20:04:13', '2025-04-11 20:04:13', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (118, 10, '663f1fc8639fa7d3effa3930f4f3910f70008df3dbb08b2cad2f53fdcced30ef', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-23 22:04:18', '2025-04-23 22:04:18', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (164, 10, '4e15f23103ba0044d058c10584bdd0c959867b7e3b26436d9ce4f697da1aadc5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-07 03:03:07', '2025-05-07 03:03:07', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (83, 10, 'a28917e53e04fd15fa82532597c7ade84f6df30fefdbbdf5630e4e7e52c020b6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-08 21:11:43', '2025-04-08 21:11:43', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (44, 10, '10ee500ea1fe4865640dd0c4bd28deeaf84b525a9b46761d210e23b76888d285', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 17:53:13', '2025-04-01 17:53:13', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (115, 14, '38d9a8d721dd8b99ac113fdb35c56cd0380ad7573d3dde15eae8caf2429b9674', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-23 14:22:09', '2025-04-23 14:22:09', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (128, 10, 'a7275c9a1b6f3db7abee494397538837d5825884689af098421ce99448ef890c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-30 14:33:21', '2025-04-30 14:33:21', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (80, 10, '56cf197e34c2d43adc0205d2f958063f52eb65c531487be84053e86963f01623', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-08 14:32:44', '2025-04-08 14:32:44', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (130, 10, '5a82510c55daba9c8d604736e15c3076ff87796d364ff5d61cd81e878200017b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 01:16:27', '2025-05-06 01:16:27', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (35, 10, 'e5a5d70dd5325cbaa7b83b7d0c3b35da6a009b969e4af21612492c8474fa268f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 20:12:09', '2025-03-28 20:12:09', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (216, 10, '7ead45d61cfdea46c13f87fc0a0925a8310a548bfd0398035b6f0fa48ce83eda', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-05-29 16:18:11', '2025-05-29 16:18:11', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (235, 10, '8a3dad8f83ba30a6c9a4aca9238a2d931cd1df8cfb2cb42fd9e9a0775dd3a899', '190.143.185.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 12:39:31', '2025-06-09 12:39:31', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (236, 10, 'c7fe4f861b8625a4df7bd18260e4ab0f0dae51c1c023a815459eb6d28a1815a9', '190.143.185.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 12:54:58', '2025-06-09 12:54:58', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (178, 10, '9475768d5bc63ad2b6803e636e49abe31b96787a49c74c0b8f54e149d48f20b9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 14:04:59', '2025-05-08 14:04:59', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (169, 10, '716194fafa526dcf2da302a9070bd5e2a8b6a66869a749abf365e631d621901a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-07 22:46:08', '2025-05-07 22:46:08', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (224, 10, '54547b7a6a826f76f9417782fd67a9848d203297b57a0c1236543b0f1ba982c2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 14:05:06', '2025-06-04 14:05:06', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (218, 10, '44d98acf82bc1125479916da4834b0b4cc1bcb28b506288244ac150f935b85c5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-05-29 16:47:57', '2025-05-29 16:47:57', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (209, 10, '490561295a7a221b4ee3419db3ff8a9bff4e516e8b3d9cf105b9f8e5cfa62a42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-15 13:05:00', '2025-05-15 13:05:00', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (195, 10, 'ca6d326bebba859e29faf09f3b051bcac7455a0eb501c85287e66f55e30b53e3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-12 23:33:49', '2025-05-12 23:33:49', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (132, 13, '24b664f3bc0e027c4c34f8d5ac5fd14bed77f94cce55ec8bed7d9c93eb7885bc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:37:58', '2025-05-06 21:37:58', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (163, 13, 'd4eba7fa14a443eb67ce4dd92d90dcb80274ce31fff94c205439d163bec5ce06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-07 03:02:23', '2025-05-07 03:02:23', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (79, 13, '1e10efb67cc05d9778ac6f0591ef968b682714e2c731e8eb8dd4900f890be6c8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-08 14:32:32', '2025-04-08 14:32:32', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (85, 13, '2a36d991075e10cb666e65d69054529f2f9a6d4f581300a5ff55383797ea59fe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-08 21:23:13', '2025-04-08 21:23:13', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (90, 13, 'a754d65f220a98bdbdd9c30b182dddff0f817b739d0be08c7c1037ce6602806e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 04:00:32', '2025-04-10 04:00:32', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (112, 13, '371eff151623530da99a3a62712d1296b585e6d6d2a6058064660e451b5d9729', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-23 13:48:36', '2025-04-23 13:48:36', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (134, 13, 'cc7c71f853bafabcdd789f468305b38d7ed0c4f0abbaa21e46fb1c67c546748d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:41:36', '2025-05-06 21:41:36', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (231, 10, '988946a43dc628ccfd229c158925bff702fe017efc6521fa4583c2aeb0bf78e1', '127.0.0.1', 'curl/7.81.0', '2025-06-09 06:05:27', '2025-06-09 06:05:27', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (6, 10, '77a7768fbddd23528249293213fcd3ac0373d1713989b358b958def85d8b0200', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:38:24', '2025-03-28 17:38:24', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (27, 10, 'd553667cfcb3cc6240c39d5534d4d3c494efdde373d9c7b857b3aed8791ff15d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 19:37:12', '2025-03-28 19:37:12', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (239, 10, 'c1b4816ce46cc25384c79862e964a35d449e46770e91a765da4be21eaa4691e6', '190.143.185.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 20:26:03', '2025-06-10 20:26:03', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (114, 10, '92d43abc20b233843e3f95a692cd88377a849a6c1506ab640ae393afddd3da67', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-23 14:16:20', '2025-04-23 14:16:20', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (50, 10, '3ae86ab47a0f62dc153931f6b2d3c647e8dcc32daeda0c98c794f6f51c245c50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 16:27:06', '2025-04-03 16:27:06', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (16, 10, 'e742af40c52a9eff8672dd036e2dbbfabb9fd15bac7dc6886833e695ed38e020', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:46:14', '2025-03-28 17:46:14', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (59, 10, '9b3e7a81723b8d39464a5d92537d6dc260ed0ff18331235b4f9dba7413fd8da4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-04 19:17:03', '2025-04-04 19:17:03', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (14, 10, '5b51d32b396435c64e9af66b958b7316d509941c4acf7aa7e2b887f630e8de6b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:46:11', '2025-03-28 17:46:11', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (98, 10, 'e5cb940191642118d65d8f880470020ff5de50552e432f4a515238505c6cca48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 22:38:37', '2025-04-10 22:38:37', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (153, 10, '44f996b1057fa47d5254ac5cfa6dac1e7fe1387bbbe984bbaf92f8db81565c85', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:28:04', '2025-05-06 22:28:04', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (161, 10, 'a410e1cdd16c4631fc2f40773c4ee94295a5e73fb84a0f319f0e60f6d54cb31e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-07 02:17:05', '2025-05-07 02:17:05', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (89, 10, 'f8f9e47efd9260434effca7c24601d2e3001f3ebbf9a4f4078b79e6ad246a45f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 03:59:57', '2025-04-10 03:59:57', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (25, 10, '1a75777a396639de1655786b53e4015508c7414463fe98aeb1b881841b921ca7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 19:36:19', '2025-03-28 19:36:19', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (196, 10, '429e9a0e17013107aa028b0301a17eca8159e83cd708fa962c31cf7a0d4e5ae5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 06:41:00', '2025-05-13 06:41:00', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (151, 19, '96131daf7aa68785cda59a7d0aa391c132734affbc140b12c421124f8fccdb75', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:17:14', '2025-05-06 22:17:14', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (117, 10, '00422441f10b2f5cbe06785bff7d97e05ec3e401bf578e25fd7f7b82253e7a6c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-23 14:59:58', '2025-04-23 14:59:58', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (45, 10, '268972b885d0c8371afcfac2035e2f35ffe937073a1d8d09a17abdbe8d5e20d2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 21:49:26', '2025-04-01 21:49:26', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (11, 10, '3becc92f1e17381fa8754b664a55175b166ee48d4fcd006633e71cdc25962018', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:43:40', '2025-03-28 17:43:40', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (109, 10, '249c045af4d2b47500a21cd848111eb98ceb13c8b275dc923866fb311562405e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-16 17:15:15', '2025-04-16 17:15:15', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (105, 10, '1ec500d3f48b0d5a43e6856115b18906423e04483de3fa87b774fc8525040514', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-14 21:57:55', '2025-04-14 21:57:55', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (129, 10, '7edc85d8a7b81db26cfb04fe19e08e51560b746a33f53170e4595f002a756bcb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-30 15:18:34', '2025-04-30 15:18:34', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (127, 10, '3a3616479e684ae0ed68c520b335aaf486708905adeddd3ef5306b8313ade1f2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-30 14:07:15', '2025-04-30 14:07:15', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (214, 10, '99cfa1430e6072e76e208512bb2fec1ca8529ea70dd25562ea2d3bd1245b2058', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-15 14:52:47', '2025-05-15 14:52:47', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (121, 10, '63ecc8efeba1f866ec6196fef8b90667e97130ea8442a5b536629be9bf5aabfd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-24 14:38:30', '2025-04-24 14:38:30', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (135, 13, 'f921859fef97f6f9ea458a44c7317377486cdcd81a6dae0f7d4d4883dd18a3c3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:41:43', '2025-05-06 21:41:43', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (137, 13, '96d8f98aa0afbba0e29171c0bb9e22af8e902c301d2fcb737c9178b0121bae11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:41:53', '2025-05-06 21:41:53', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (138, 13, 'dfc6f1913680c89104c1e0cd7f74e540d599c998844a5be241ee4dfee64b2c2a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:41:58', '2025-05-06 21:41:58', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (159, 13, '901636f5f1a9942783c60e01f4d6b5ad56fb702fbb35e870bfc27b4742d2fad8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 23:43:23', '2025-05-06 23:43:23', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (168, 13, '3744c5685279368cfccc90901e5957275ab028eb2028def12b5e3f55efffcea8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-07 22:26:37', '2025-05-07 22:26:37', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (210, 13, 'bd3ff4ca6ee256cd99a7001f73e758d15666a3ae0543f687cb81cda2d4e7646b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-15 13:44:23', '2025-05-15 13:44:23', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (184, 10, '2cc48c2dbc187f057363c4896bc382f4e3b350cdae67e57b07c902cbb15d15ed', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 15:57:45', '2025-05-08 15:57:45', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (111, 10, 'c0c9fbf5bc411baa21558d08f3c159e152d71442c73f466268aa0ae8fdb9527b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-23 13:48:05', '2025-04-23 13:48:05', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (26, 10, '9cc10ad6307eae7ade9753ca12ef1c07e98d943ea2a8f7e10588a559904c37ee', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 19:37:10', '2025-03-28 19:37:10', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (66, 10, '51b31c8baddd864fb631e8ac01842502f16197e2bcdb5888470a2f847fd7d938', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-07 00:01:12', '2025-04-07 00:01:12', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (234, 10, '54b767a1d84c7efd1f4b0e9a46c598107ae888bcf67892720cae0525e5b08f36', '127.0.0.1', 'curl/7.81.0', '2025-06-09 06:13:15', '2025-06-09 06:13:15', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (173, 19, '89868f4993c6132c20a013971eb116a680f4718cc5cd33c8414750256ab3a8f3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 02:21:11', '2025-05-08 02:21:11', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (175, 19, '73e7f115ad0d2b0778c030fa1433ca2921bda0747686409a24da4441f779d17f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 03:36:01', '2025-05-08 03:36:01', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (238, 10, '77c8744fe4ff03bf48f39143e4ec1c0bbd3cdd0d6673b4ad61581d61fce7f77e', '190.104.121.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 17:59:59', '2025-06-09 17:59:59', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (241, 10, 'b98340d044127fdc7c8882eff612ed8294b2191cd44d10765bdd22dcb8dda853', '190.143.185.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 20:52:25', '2025-06-10 20:52:25', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (110, 10, '1d027273a5cba3e0db214935899e6eb45d4ece9b1580b171f0ef2ea6e741707b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-23 13:40:12', '2025-04-23 13:40:12', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (222, 10, '0b90792b6cb1d60d33a7631a30df34c763a47435603ab9202c7cbaa792c51d7b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 03:18:41', '2025-06-04 03:18:41', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (30, 10, '0028029aa5cecfc8ca2309197fb913cf71bbb689f5f90fb0a5ab2f228c930d0a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 19:38:25', '2025-03-28 19:38:25', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (193, 10, '644a9be1ca900b0ccf9b8b15392db3f3529261ae46d3ddd7bcd356d32e4acece', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-10 21:07:47', '2025-05-10 21:07:47', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (233, 10, '67e78651243893d3436e636cb59340d443ce3114e83d591bedf90ab68c8bf6ef', '127.0.0.1', 'curl/7.81.0', '2025-06-09 06:08:05', '2025-06-09 06:08:05', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (211, 20, '29f039272ad8f1338a1498690ae0a75593487f8db3c6fbd62f0df69eb1a72da8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-15 13:44:32', '2025-05-15 13:44:32', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (95, 10, 'bfbc183ec0bd9067a8f8884642f2721a7e8a4d357692c494dffa2fa610849d8a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-10 22:32:08', '2025-04-10 22:32:08', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (177, 10, '9ee58a666d378e101d9ca93e63bfc1bc33d7ce303b99cc423a169c06979010cf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-05-08 13:53:50', '2025-05-08 13:53:50', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (15, 10, 'bffa0cc8ebc6b17f868f12c3c6878764fe3f71eadb215b2cbd94ffafaf3b087b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:46:12', '2025-03-28 17:46:12', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (244, 10, '38afb32eedb50dc5ec109b201b6b8669e7d3b0b4344e2d16bc286445af0c3bd7', '190.143.185.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 21:43:09', '2025-06-10 21:43:09', true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (136, 13, 'b5febf4bf57d818f3b3becda4756e653b2d2614088e0cac8979361039dbcfc3f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:41:48', '2025-05-06 21:41:48', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (174, 13, 'c82260aebf2548e498d0da36652bc2faa8f6dbac2343f75b87cb37a1a627e621', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 02:21:19', '2025-05-08 02:21:19', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (208, 10, '03f91bebf100f7d425218b6ddcabfd4eced5ff267f75774429a5a65b889e33a8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-14 04:43:03', '2025-05-14 04:43:03', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (162, 10, '8fcd8df21ea701e442418f7723c31d2fa84f44225c86ea3dd14703c5f929f4b1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-07 02:59:12', '2025-05-07 02:59:12', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (150, 10, '63c21d25860f4dd8d693e9497d708034d5f0dbccb9e8304bea56e334f364a983', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 22:14:51', '2025-05-06 22:14:51', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (140, 10, '8a92311696dc6737c6dc02cffb17fe12ab55699b2457d1839af95ecb2311111c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-06 21:43:45', '2025-05-06 21:43:45', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (212, 10, '175bcb8d364fbbab26058774d89ed8563e58a6c9a48f9324c0c4120f01a2da5d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-15 13:44:41', '2025-05-15 13:44:41', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (113, 10, 'e9b635bd4822cfb92fbd702a88bcb6ef9344bcf5a3f030b6eb5b8d5b7aa26b72', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-23 14:04:44', '2025-04-23 14:04:44', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (37, 10, '23b20c4c859a0d191cdf931eab24e7e3608764e5cc86dc2ec5070bb08c9dc211', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-31 00:37:25', '2025-03-31 00:37:25', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (191, 10, 'd8933315c287cb5949c0ea77ee4eb7f7f282dcc565575c9df5643eac33b56c76', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-09 14:06:04', '2025-05-09 14:06:04', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (22, 10, '78b334fd21e16a5e2233747ad3c2d15c32f86ef99929d0ff830368b890c122f9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 19:36:14', '2025-03-28 19:36:14', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (40, 10, '83a97c792e75077c4c2c5276b7e626193ac721c0f1039e8000fa0d15742fd3d6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-31 02:53:32', '2025-03-31 02:53:32', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (4, 10, '5124de08bbaafe0b6e9a7d100db4a5d9dec59497d82c6bbc91ccdca28180f776', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:38:17', '2025-03-28 17:38:17', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (5, 10, '96bf96f6974bc152df9e9a8f4aeabe0b0710984c981135ff4a2890f5a423266c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:38:22', '2025-03-28 17:38:22', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (52, 10, '6c98ee4ad093a8d6d8304113646fc88dafd97968de2e40d54d7fac75bb6b8b68', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-04 00:40:19', '2025-04-04 00:40:19', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (245, 1, '8d8d307802e9e0dd01a384958f57b31481169a0abb94504d0f8b3f4f9d40e2e4', '190.143.185.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 21:45:05', '2025-06-10 21:45:05', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (230, 1, '9c1c5a1041a4245a818d069414cc963b7d1d0e6922a84eab7748f7dd6a8830c0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-08 11:58:46', '2025-06-08 11:58:46', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (232, 10, '74d6356d4fb6e3eeb3ec2f6087d40d6abc9fb5bf4aea7139a902171ae3188288', '127.0.0.1', 'curl/7.81.0', '2025-06-09 06:06:31', '2025-06-09 06:06:31', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (246, 1, 'ce5c456db77dc9dbe9df5cc1c68edfcef840086d65a427e5956a0b195128ba06', '190.143.185.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 21:47:19', '2025-06-10 21:47:19', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (247, 10, '5da21ed670d07e38ef1124678f492267cf619f193f9fb992357603b2128e32f6', '190.143.185.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 21:51:58', '2025-06-10 21:51:58', true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (225, 13, '5cbe1a755fd1b00914fa3bb5885fea901e690acaef263cbab49a2d4b7a57369a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 14:08:42', '2025-06-04 14:08:42', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (31, 10, 'f819b40ad2212ba117cf51c9fbbb99ee9947463e1132b260e331bb3190ad3c1a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 19:38:27', '2025-03-28 19:38:27', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (226, 10, '37244b6985bf0c94bf0ee763d8775e17b9dd49c112cfd6fe9be12b7193750993', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 20:02:02', '2025-06-05 20:02:02', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (67, 10, 'e09554f30f5b6508a6e5c92da01628c90ddd9b271257cdc2a567445a4df1841d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-07 00:04:52', '2025-04-07 00:04:52', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (68, 10, 'a8b6abc88a1a130c5c28cbfb496ae81f4cae449f20cf7f608737df698929fdf2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-07 00:08:09', '2025-04-07 00:08:09', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (36, 10, 'ce6a992100832c6de43151d26ebc2fd4f43db8c641248212334084a281f97182', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 03:16:02', '2025-03-29 03:16:02', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (56, 10, '0c5af2cf159bda156d5b4b6bd3508555fb6b08f9c0d503f4d679b7e6c34a9518', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-04 18:42:44', '2025-04-04 18:42:44', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (33, 10, '3524a79586ca887338cae1b906b97d2e1cbbb430b2f4873473ce5eebcce11d34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 20:10:28', '2025-03-28 20:10:28', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (228, 10, '0ee6ab2e63119d871d9f7f826653dd7e7db2e7f5710518850515f8a9ff2538cb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 21:52:00', '2025-06-05 21:52:00', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (223, 10, '40b799e331fd72b87a905a12744d5ce2a0ba855dfc738489c5b9fd69ddd2de2f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 13:27:31', '2025-06-04 13:27:31', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (188, 10, '499f79d296d757d79af70142a4b7f4e37e81910b5275b307a778ec43b20f1f31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 23:16:04', '2025-05-08 23:16:04', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (47, 10, '90cf235ad6a9afe168ab512cf9e6d2d7a4a1d7cdee01a04094a07d055757b004', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 15:50:55', '2025-04-03 15:50:55', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (69, 10, '9bf57737f67871c7dbb84d1084049ee5c37fdd64827d2300a40433a916732741', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-07 00:08:19', '2025-04-07 00:08:19', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (194, 10, '269580ae440ad9f7d0068319426fe392db411d064b06f068a6751f8c91d55b59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-11 23:05:02', '2025-05-11 23:05:02', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (237, 13, 'b2eb1ada8b88362262be1f949635f37d19a9d8b72d21355a11d62ef1bda23420', '190.104.121.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 17:59:49', '2025-06-09 17:59:49', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (227, 10, 'f6232975c4758a94b35483d8511b0ef51413cb02380ff7487625e5274b9bea0d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 20:07:18', '2025-06-05 20:07:18', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (192, 10, '99bfa64ada96261c33d4467fa97fcbb3282fcc1f5c0c4644d23925d14866e746', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-10 21:06:26', '2025-05-10 21:06:26', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (9, 10, 'fb129ff59499f6b87b4b48a19865874b96bf307bac62ca260c441a98a3896511', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 17:38:28', '2025-03-28 17:38:28', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (76, 10, 'b8bb5224cbba8c1d208dd7e03cb84ab051fc57e235476d8d3c82f8daf321d3bd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-08 03:21:25', '2025-04-08 03:21:25', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (54, 10, '75eb1bb93506b693522874d1080640e9e200ab5b2de39a0693fcb46574249575', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-04 00:40:46', '2025-04-04 00:40:46', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (108, 10, 'ce70c9166c4a35487ae4a20041935d2677dbc247f651122f16649601f5d62355', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-16 14:35:20', '2025-04-16 14:35:20', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (189, 10, 'e5c767c2ba3044da6e4818615cfb197a1b60c00698a8c88e6c90c61c1b842066', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 23:16:30', '2025-05-08 23:16:30', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (171, 10, '540432b0ca4e1d3dea3ae0d65c662b188d71a176e993d41a4ec68155be5d84e9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-08 01:46:50', '2025-05-08 01:46:50', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sessions VALUES (28, 10, '2d74e740b5ecc466ad1f428ccc1a39fba9bac8a71539a2758582a87f739371cf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 19:38:13', '2025-03-28 19:38:13', false, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 3923 (class 0 OID 17589)
-- Dependencies: 277
-- Data for Name: tareas; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.tareas VALUES (5, 10, 10, 'ASM Reunion', 'asdAS', '2025-04-19', '09:00:00', '10:00:00', 'reunion', true, '2025-04-15 23:02:28', '2025-06-10 04:38:33');


--
-- TOC entry 3924 (class 0 OID 17598)
-- Dependencies: 278
-- Data for Name: tb_actividades; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.tb_actividades VALUES (1, 'Llamada', '2025-04-08 22:49:45.811706', '2025-04-08 22:49:45.811706');
INSERT INTO public.tb_actividades VALUES (2, 'Correo', '2025-04-08 22:50:03.703897', '2025-04-08 22:50:03.703897');
INSERT INTO public.tb_actividades VALUES (3, 'Reunión', '2025-04-08 22:50:29.002353', '2025-04-08 22:50:29.002353');
INSERT INTO public.tb_actividades VALUES (4, 'WhatsApp', '2025-04-08 22:51:01.691245', '2025-04-08 22:51:01.691245');


--
-- TOC entry 3926 (class 0 OID 17604)
-- Dependencies: 280
-- Data for Name: tb_convenio; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.tb_convenio VALUES (1, 'HCL', NULL, true);
INSERT INTO public.tb_convenio VALUES (2, 'BAM', NULL, true);
INSERT INTO public.tb_convenio VALUES (3, 'CMI', NULL, true);
INSERT INTO public.tb_convenio VALUES (4, 'ASTEMSA', NULL, true);
INSERT INTO public.tb_convenio VALUES (5, 'G&T Continental', NULL, true);
INSERT INTO public.tb_convenio VALUES (6, 'Allied Global', NULL, true);
INSERT INTO public.tb_convenio VALUES (7, 'Distribuidora Maravilla', NULL, true);
INSERT INTO public.tb_convenio VALUES (8, 'Promerica', NULL, true);
INSERT INTO public.tb_convenio VALUES (9, 'VXI', NULL, true);
INSERT INTO public.tb_convenio VALUES (10, 'Distribuidora La Nueva', NULL, true);
INSERT INTO public.tb_convenio VALUES (11, 'Nearsol', NULL, true);
INSERT INTO public.tb_convenio VALUES (12, 'Tigo', NULL, true);
INSERT INTO public.tb_convenio VALUES (13, 'Rones de Guatemala', NULL, true);
INSERT INTO public.tb_convenio VALUES (14, 'Conduent', NULL, true);
INSERT INTO public.tb_convenio VALUES (15, 'Pollo Campero', NULL, true);
INSERT INTO public.tb_convenio VALUES (16, 'Atento', NULL, true);
INSERT INTO public.tb_convenio VALUES (17, 'Inprolacsa', NULL, true);
INSERT INTO public.tb_convenio VALUES (18, 'EVERIZE', NULL, true);
INSERT INTO public.tb_convenio VALUES (19, 'Intcomex', NULL, true);
INSERT INTO public.tb_convenio VALUES (20, 'Smartfit', NULL, true);
INSERT INTO public.tb_convenio VALUES (21, 'BANTRAB', NULL, true);
INSERT INTO public.tb_convenio VALUES (22, 'BAC', NULL, true);
INSERT INTO public.tb_convenio VALUES (23, 'Cayalá', NULL, true);
INSERT INTO public.tb_convenio VALUES (24, 'FORAGRO', NULL, true);
INSERT INTO public.tb_convenio VALUES (25, 'HONDA - ASEC', NULL, true);
INSERT INTO public.tb_convenio VALUES (26, 'CERVECERÍA HONDUREÑA', NULL, true);
INSERT INTO public.tb_convenio VALUES (27, 'Banco Industrial', NULL, true);
INSERT INTO public.tb_convenio VALUES (28, 'Corporación Lancasco', NULL, true);
INSERT INTO public.tb_convenio VALUES (29, 'Scentia', NULL, true);
INSERT INTO public.tb_convenio VALUES (30, 'Seguros G&T', NULL, true);
INSERT INTO public.tb_convenio VALUES (31, 'Bimbo', NULL, true);
INSERT INTO public.tb_convenio VALUES (32, 'Ideal', NULL, true);
INSERT INTO public.tb_convenio VALUES (34, 'Acme Corp (v2)', 'Descuento 25%', true);


--
-- TOC entry 3928 (class 0 OID 17611)
-- Dependencies: 282
-- Data for Name: tb_interacciones; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.tb_interacciones VALUES (1, 13, 1, NULL, 'asdf', 'asdf', 13, '2025-04-11 19:10:34', '2025-04-11 19:10:34', 1);
INSERT INTO public.tb_interacciones VALUES (2, 13, 1, NULL, '1', 'asdf', 13, '2025-04-11 20:14:27', '2025-04-11 20:14:27', 1);
INSERT INTO public.tb_interacciones VALUES (3, 15, 1, NULL, '10', 'Le interes la carrera', 15, '2025-04-23 14:42:42', '2025-04-23 14:42:42', 95);
INSERT INTO public.tb_interacciones VALUES (4, 10, 1, NULL, '10', 'Nota', 10, '2025-04-30 14:28:36', '2025-04-30 14:28:36', 112);
INSERT INTO public.tb_interacciones VALUES (5, 10, 2, NULL, '0', 'Nota', 10, '2025-04-30 15:40:37', '2025-04-30 15:40:37', 4);
INSERT INTO public.tb_interacciones VALUES (6, 20, 1, NULL, '10', 'Le intereso una carrera', 20, '2025-05-06 22:40:34', '2025-05-06 22:40:34', 2782);
INSERT INTO public.tb_interacciones VALUES (7, 21, 1, NULL, '10', '8 de mayo se llamo y se envio al ifnroacion de MBA', 21, '2025-05-08 15:17:59', '2025-05-08 15:17:59', 3259);
INSERT INTO public.tb_interacciones VALUES (8, 21, 1, NULL, '5', 'Confirmación de Inscripción', 21, '2025-05-08 15:20:51', '2025-05-08 15:20:51', 3259);
INSERT INTO public.tb_interacciones VALUES (9, 10, 1, NULL, '8', 'n1', 10, '2025-06-05 21:07:30', '2025-06-05 21:07:30', 3007);


--
-- TOC entry 3930 (class 0 OID 17619)
-- Dependencies: 284
-- Data for Name: tb_periodo_programa; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.tb_periodo_programa VALUES (1, 1, 1);
INSERT INTO public.tb_periodo_programa VALUES (2, 1, 2);
INSERT INTO public.tb_periodo_programa VALUES (3, 1, 3);
INSERT INTO public.tb_periodo_programa VALUES (4, 1, 4);
INSERT INTO public.tb_periodo_programa VALUES (5, 1, 5);
INSERT INTO public.tb_periodo_programa VALUES (6, 1, 6);
INSERT INTO public.tb_periodo_programa VALUES (7, 1, 7);
INSERT INTO public.tb_periodo_programa VALUES (8, 1, 8);
INSERT INTO public.tb_periodo_programa VALUES (9, 1, 9);
INSERT INTO public.tb_periodo_programa VALUES (10, 1, 10);
INSERT INTO public.tb_periodo_programa VALUES (11, 1, 11);
INSERT INTO public.tb_periodo_programa VALUES (12, 1, 12);
INSERT INTO public.tb_periodo_programa VALUES (13, 1, 13);
INSERT INTO public.tb_periodo_programa VALUES (14, 1, 14);
INSERT INTO public.tb_periodo_programa VALUES (15, 1, 15);
INSERT INTO public.tb_periodo_programa VALUES (16, 1, 16);
INSERT INTO public.tb_periodo_programa VALUES (17, 1, 17);
INSERT INTO public.tb_periodo_programa VALUES (18, 1, 18);
INSERT INTO public.tb_periodo_programa VALUES (19, 1, 19);
INSERT INTO public.tb_periodo_programa VALUES (20, 1, 20);
INSERT INTO public.tb_periodo_programa VALUES (21, 1, 21);
INSERT INTO public.tb_periodo_programa VALUES (22, 1, 22);
INSERT INTO public.tb_periodo_programa VALUES (23, 1, 23);
INSERT INTO public.tb_periodo_programa VALUES (24, 1, 24);
INSERT INTO public.tb_periodo_programa VALUES (25, 1, 25);
INSERT INTO public.tb_periodo_programa VALUES (26, 1, 26);
INSERT INTO public.tb_periodo_programa VALUES (27, 1, 27);
INSERT INTO public.tb_periodo_programa VALUES (28, 1, 28);
INSERT INTO public.tb_periodo_programa VALUES (29, 1, 29);
INSERT INTO public.tb_periodo_programa VALUES (30, 1, 30);
INSERT INTO public.tb_periodo_programa VALUES (31, 1, 31);
INSERT INTO public.tb_periodo_programa VALUES (32, 1, 32);
INSERT INTO public.tb_periodo_programa VALUES (33, 1, 33);
INSERT INTO public.tb_periodo_programa VALUES (34, 1, 34);
INSERT INTO public.tb_periodo_programa VALUES (35, 1, 35);
INSERT INTO public.tb_periodo_programa VALUES (36, 1, 36);
INSERT INTO public.tb_periodo_programa VALUES (37, 2, 1);
INSERT INTO public.tb_periodo_programa VALUES (38, 2, 2);
INSERT INTO public.tb_periodo_programa VALUES (39, 2, 3);
INSERT INTO public.tb_periodo_programa VALUES (40, 2, 4);
INSERT INTO public.tb_periodo_programa VALUES (41, 2, 5);
INSERT INTO public.tb_periodo_programa VALUES (42, 2, 6);
INSERT INTO public.tb_periodo_programa VALUES (43, 2, 7);
INSERT INTO public.tb_periodo_programa VALUES (44, 2, 8);
INSERT INTO public.tb_periodo_programa VALUES (45, 2, 9);
INSERT INTO public.tb_periodo_programa VALUES (46, 2, 10);
INSERT INTO public.tb_periodo_programa VALUES (47, 2, 11);
INSERT INTO public.tb_periodo_programa VALUES (48, 2, 12);
INSERT INTO public.tb_periodo_programa VALUES (49, 2, 13);
INSERT INTO public.tb_periodo_programa VALUES (50, 2, 14);
INSERT INTO public.tb_periodo_programa VALUES (51, 2, 15);
INSERT INTO public.tb_periodo_programa VALUES (52, 2, 16);
INSERT INTO public.tb_periodo_programa VALUES (53, 2, 17);
INSERT INTO public.tb_periodo_programa VALUES (54, 2, 18);
INSERT INTO public.tb_periodo_programa VALUES (55, 2, 19);
INSERT INTO public.tb_periodo_programa VALUES (56, 2, 20);
INSERT INTO public.tb_periodo_programa VALUES (57, 2, 21);
INSERT INTO public.tb_periodo_programa VALUES (58, 2, 22);
INSERT INTO public.tb_periodo_programa VALUES (59, 2, 23);
INSERT INTO public.tb_periodo_programa VALUES (60, 2, 24);
INSERT INTO public.tb_periodo_programa VALUES (61, 2, 25);
INSERT INTO public.tb_periodo_programa VALUES (62, 2, 26);
INSERT INTO public.tb_periodo_programa VALUES (63, 2, 27);
INSERT INTO public.tb_periodo_programa VALUES (64, 2, 28);
INSERT INTO public.tb_periodo_programa VALUES (65, 2, 29);
INSERT INTO public.tb_periodo_programa VALUES (66, 2, 30);
INSERT INTO public.tb_periodo_programa VALUES (67, 2, 31);
INSERT INTO public.tb_periodo_programa VALUES (68, 2, 32);
INSERT INTO public.tb_periodo_programa VALUES (69, 2, 33);
INSERT INTO public.tb_periodo_programa VALUES (70, 2, 34);
INSERT INTO public.tb_periodo_programa VALUES (71, 2, 35);
INSERT INTO public.tb_periodo_programa VALUES (72, 2, 36);
INSERT INTO public.tb_periodo_programa VALUES (73, 3, 1);
INSERT INTO public.tb_periodo_programa VALUES (74, 3, 2);
INSERT INTO public.tb_periodo_programa VALUES (75, 3, 3);
INSERT INTO public.tb_periodo_programa VALUES (76, 3, 4);
INSERT INTO public.tb_periodo_programa VALUES (77, 3, 5);
INSERT INTO public.tb_periodo_programa VALUES (78, 3, 6);
INSERT INTO public.tb_periodo_programa VALUES (79, 3, 7);
INSERT INTO public.tb_periodo_programa VALUES (80, 3, 8);
INSERT INTO public.tb_periodo_programa VALUES (81, 3, 9);
INSERT INTO public.tb_periodo_programa VALUES (82, 3, 10);
INSERT INTO public.tb_periodo_programa VALUES (83, 3, 11);
INSERT INTO public.tb_periodo_programa VALUES (84, 3, 12);
INSERT INTO public.tb_periodo_programa VALUES (85, 3, 13);
INSERT INTO public.tb_periodo_programa VALUES (86, 3, 14);
INSERT INTO public.tb_periodo_programa VALUES (87, 3, 15);
INSERT INTO public.tb_periodo_programa VALUES (88, 3, 16);
INSERT INTO public.tb_periodo_programa VALUES (89, 3, 17);
INSERT INTO public.tb_periodo_programa VALUES (90, 3, 18);
INSERT INTO public.tb_periodo_programa VALUES (91, 3, 19);
INSERT INTO public.tb_periodo_programa VALUES (92, 3, 20);
INSERT INTO public.tb_periodo_programa VALUES (93, 3, 21);
INSERT INTO public.tb_periodo_programa VALUES (94, 3, 22);
INSERT INTO public.tb_periodo_programa VALUES (95, 3, 23);
INSERT INTO public.tb_periodo_programa VALUES (96, 3, 24);
INSERT INTO public.tb_periodo_programa VALUES (97, 3, 25);
INSERT INTO public.tb_periodo_programa VALUES (98, 3, 26);
INSERT INTO public.tb_periodo_programa VALUES (99, 3, 27);
INSERT INTO public.tb_periodo_programa VALUES (100, 3, 28);
INSERT INTO public.tb_periodo_programa VALUES (101, 3, 29);
INSERT INTO public.tb_periodo_programa VALUES (102, 3, 30);
INSERT INTO public.tb_periodo_programa VALUES (103, 3, 31);
INSERT INTO public.tb_periodo_programa VALUES (104, 3, 32);
INSERT INTO public.tb_periodo_programa VALUES (105, 3, 33);
INSERT INTO public.tb_periodo_programa VALUES (106, 3, 34);
INSERT INTO public.tb_periodo_programa VALUES (107, 3, 35);
INSERT INTO public.tb_periodo_programa VALUES (108, 3, 36);
INSERT INTO public.tb_periodo_programa VALUES (109, 4, 1);
INSERT INTO public.tb_periodo_programa VALUES (110, 4, 2);
INSERT INTO public.tb_periodo_programa VALUES (111, 4, 3);
INSERT INTO public.tb_periodo_programa VALUES (112, 4, 4);
INSERT INTO public.tb_periodo_programa VALUES (113, 4, 5);
INSERT INTO public.tb_periodo_programa VALUES (114, 4, 6);
INSERT INTO public.tb_periodo_programa VALUES (115, 4, 7);
INSERT INTO public.tb_periodo_programa VALUES (116, 4, 8);
INSERT INTO public.tb_periodo_programa VALUES (117, 4, 9);
INSERT INTO public.tb_periodo_programa VALUES (118, 4, 10);
INSERT INTO public.tb_periodo_programa VALUES (119, 4, 11);
INSERT INTO public.tb_periodo_programa VALUES (120, 4, 12);
INSERT INTO public.tb_periodo_programa VALUES (121, 4, 13);
INSERT INTO public.tb_periodo_programa VALUES (122, 4, 14);
INSERT INTO public.tb_periodo_programa VALUES (123, 4, 15);
INSERT INTO public.tb_periodo_programa VALUES (124, 4, 16);
INSERT INTO public.tb_periodo_programa VALUES (125, 4, 17);
INSERT INTO public.tb_periodo_programa VALUES (126, 4, 18);
INSERT INTO public.tb_periodo_programa VALUES (127, 4, 19);
INSERT INTO public.tb_periodo_programa VALUES (128, 4, 20);
INSERT INTO public.tb_periodo_programa VALUES (129, 4, 21);
INSERT INTO public.tb_periodo_programa VALUES (130, 4, 22);
INSERT INTO public.tb_periodo_programa VALUES (131, 4, 23);
INSERT INTO public.tb_periodo_programa VALUES (132, 4, 24);
INSERT INTO public.tb_periodo_programa VALUES (133, 4, 25);
INSERT INTO public.tb_periodo_programa VALUES (134, 4, 26);
INSERT INTO public.tb_periodo_programa VALUES (135, 4, 27);
INSERT INTO public.tb_periodo_programa VALUES (136, 4, 28);
INSERT INTO public.tb_periodo_programa VALUES (137, 4, 29);
INSERT INTO public.tb_periodo_programa VALUES (138, 4, 30);
INSERT INTO public.tb_periodo_programa VALUES (139, 4, 31);
INSERT INTO public.tb_periodo_programa VALUES (140, 4, 32);
INSERT INTO public.tb_periodo_programa VALUES (141, 4, 33);
INSERT INTO public.tb_periodo_programa VALUES (142, 4, 34);
INSERT INTO public.tb_periodo_programa VALUES (143, 4, 35);
INSERT INTO public.tb_periodo_programa VALUES (144, 4, 36);


--
-- TOC entry 3932 (class 0 OID 17623)
-- Dependencies: 286
-- Data for Name: tb_periodos_inscripcion; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.tb_periodos_inscripcion VALUES (2, 'Verano 2025', 'VER-2025', '2025-05-01', '2025-07-31', 'Periodo de verano 2025', 0, 0, true, true, true, 0, '2025-05-13 22:52:52', '2025-05-13 22:52:52');
INSERT INTO public.tb_periodos_inscripcion VALUES (3, 'Otoño 2025', 'OTO-2025', '2025-08-01', '2025-10-31', 'Periodo de otoño 2025', 0, 0, true, true, true, 0, '2025-05-13 22:52:52', '2025-05-13 22:52:52');
INSERT INTO public.tb_periodos_inscripcion VALUES (4, 'Invierno 2025', 'INV-2025', '2025-11-01', '2025-12-31', 'Periodo de invierno 2025', 0, 0, true, true, true, 0, '2025-05-13 22:52:52', '2025-05-13 22:52:52');
INSERT INTO public.tb_periodos_inscripcion VALUES (1, 'Primavera 2025', 'PRIM-2025', '2025-02-01', '2025-04-30', 'Periodo de primavera 2025', 0, 0, true, true, true, 0, '2025-05-13 22:52:52', '2025-05-13 22:52:52');


--
-- TOC entry 3934 (class 0 OID 17637)
-- Dependencies: 288
-- Data for Name: tb_precios_convenio_programa; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.tb_precios_convenio_programa VALUES (1, 1, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (2, 2, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (3, 3, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (4, 4, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (5, 5, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (6, 6, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (7, 7, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (8, 8, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (9, 9, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (10, 10, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (11, 11, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (12, 12, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (13, 13, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (14, 14, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (15, 15, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (16, 16, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (17, 17, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (18, 18, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_convenio_programa VALUES (19, 1, 2, 1000.00, 1230.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (20, 2, 2, 1000.00, 975.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (21, 3, 2, 1000.00, 1025.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (22, 4, 2, 1000.00, 975.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (23, 5, 2, 1000.00, 925.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (24, 6, 2, 1000.00, 950.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (25, 7, 2, 1000.00, 1230.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (26, 8, 2, 1000.00, 975.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (27, 9, 2, 1000.00, 1025.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (28, 10, 2, 1000.00, 975.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (29, 11, 2, 1000.00, 925.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (30, 12, 2, 1000.00, 925.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (31, 13, 2, 1000.00, 1025.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (32, 14, 2, 1000.00, 950.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (33, 15, 2, 1000.00, 1072.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (34, 16, 2, 1000.00, 1230.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (35, 17, 2, 1000.00, 1230.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (36, 18, 2, 1000.00, 925.00, 12);
INSERT INTO public.tb_precios_convenio_programa VALUES (37, 1, 3, 1000.00, 1190.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (38, 2, 3, 1000.00, 925.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (39, 3, 3, 1000.00, 975.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (40, 4, 3, 1000.00, 925.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (41, 5, 3, 1000.00, 925.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (42, 6, 3, 1000.00, 900.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (43, 7, 3, 1000.00, 1190.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (44, 8, 3, 1000.00, 925.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (45, 9, 3, 1000.00, 975.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (46, 10, 3, 1000.00, 925.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (47, 11, 3, 1000.00, 925.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (48, 12, 3, 1000.00, 860.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (49, 13, 3, 1000.00, 975.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (50, 14, 3, 1000.00, 895.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (51, 15, 3, 1000.00, 1072.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (52, 16, 3, 1000.00, 1190.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (53, 17, 3, 1000.00, 1190.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (54, 18, 3, 1000.00, 860.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (55, 1, 4, 1000.00, 1170.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (56, 2, 4, 1000.00, 885.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (57, 3, 4, 1000.00, 925.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (58, 4, 4, 1000.00, 925.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (59, 5, 4, 1000.00, 885.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (60, 6, 4, 1000.00, 900.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (61, 7, 4, 1000.00, 1170.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (62, 8, 4, 1000.00, 885.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (63, 9, 4, 1000.00, 975.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (64, 10, 4, 1000.00, 925.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (65, 11, 4, 1000.00, 925.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (66, 12, 4, 1000.00, 830.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (67, 13, 4, 1000.00, 975.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (68, 14, 4, 1000.00, 895.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (69, 15, 4, 1000.00, 1072.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (70, 16, 4, 1000.00, 1170.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (71, 17, 4, 1000.00, 1170.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (72, 18, 4, 1000.00, 830.00, 24);
INSERT INTO public.tb_precios_convenio_programa VALUES (73, 1, 5, 1000.00, 1170.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (74, 2, 5, 1000.00, 850.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (75, 3, 5, 1000.00, 925.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (76, 4, 5, 1000.00, 850.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (77, 5, 5, 1000.00, 850.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (78, 6, 5, 1000.00, 850.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (79, 7, 5, 1000.00, 1170.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (80, 8, 5, 1000.00, 850.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (81, 9, 5, 1000.00, 925.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (82, 10, 5, 1000.00, 850.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (83, 11, 5, 1000.00, 830.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (84, 12, 5, 1000.00, 830.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (85, 13, 5, 1000.00, 850.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (86, 14, 5, 1000.00, 840.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (87, 15, 5, 1000.00, 1072.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (88, 16, 5, 1000.00, 1170.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (89, 17, 5, 1000.00, 1170.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (90, 18, 5, 1000.00, 830.00, 32);
INSERT INTO public.tb_precios_convenio_programa VALUES (91, 1, 16, 1000.00, 1925.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (92, 2, 16, 1000.00, 1460.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (93, 3, 16, 1000.00, 1525.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (94, 4, 16, 1000.00, 1285.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (95, 5, 16, 1000.00, 1250.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (96, 6, 16, 1000.00, 1470.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (97, 7, 16, 1000.00, 1725.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (98, 8, 16, 1000.00, 1460.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (99, 9, 16, 1000.00, 1525.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (100, 10, 16, 1000.00, 1285.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (101, 11, 16, 1000.00, 1250.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (102, 12, 16, 1000.00, 1450.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (103, 13, 16, 1000.00, 1479.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (104, 14, 16, 1000.00, 1250.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (105, 15, 16, 1000.00, 1479.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (106, 16, 16, 1000.00, 1725.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (107, 17, 16, 1000.00, 1725.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (108, 18, 16, 1000.00, 1450.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (109, 19, 16, 1000.00, 1460.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (110, 20, 16, 1000.00, 1460.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (111, 21, 16, 1000.00, 1460.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (112, 22, 16, 1000.00, 1460.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (113, 23, 16, 1000.00, 1460.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (114, 24, 16, 1000.00, 1460.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (115, 25, 16, 1000.00, 1460.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (116, 26, 16, 1000.00, 1460.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (117, 27, 16, 1000.00, 1285.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (118, 28, 16, 1000.00, 1470.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (119, 29, 16, 1000.00, 1470.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (120, 30, 16, 1000.00, 1400.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (121, 31, 16, 1000.00, 1650.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (122, 32, 16, 1000.00, 1250.00, 9);
INSERT INTO public.tb_precios_convenio_programa VALUES (123, 1, 17, 1000.00, 1725.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (124, 2, 17, 1000.00, 1285.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (125, 3, 17, 1000.00, 1345.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (126, 4, 17, 1000.00, 1285.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (127, 5, 17, 1000.00, 1250.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (128, 6, 17, 1000.00, 1290.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (129, 7, 17, 1000.00, 1725.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (130, 8, 17, 1000.00, 1285.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (131, 9, 17, 1000.00, 1345.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (132, 10, 17, 1000.00, 1285.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (133, 11, 17, 1000.00, 1250.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (134, 12, 17, 1000.00, 1250.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (135, 13, 17, 1000.00, 1345.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (136, 14, 17, 1000.00, 1290.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (137, 15, 17, 1000.00, 1479.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (138, 16, 17, 1000.00, 1725.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (139, 17, 17, 1000.00, 1725.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (140, 18, 17, 1000.00, 1250.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (141, 19, 17, 1000.00, 1345.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (142, 20, 17, 1000.00, 1345.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (143, 21, 17, 1000.00, 1345.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (144, 22, 17, 1000.00, 1345.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (145, 23, 17, 1000.00, 1345.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (146, 24, 17, 1000.00, 1345.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (147, 25, 17, 1000.00, 1345.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (148, 26, 17, 1000.00, 1345.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (149, 27, 17, 1000.00, 1285.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (150, 28, 17, 1000.00, 1290.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (151, 29, 17, 1000.00, 1290.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (152, 30, 17, 1000.00, 1400.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (153, 31, 17, 1000.00, 1479.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (154, 32, 17, 1000.00, 1250.00, 18);
INSERT INTO public.tb_precios_convenio_programa VALUES (155, 1, 18, 1000.00, 1725.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (156, 2, 18, 1000.00, 1460.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (157, 3, 18, 1000.00, 1525.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (158, 4, 18, 1000.00, 1285.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (159, 5, 18, 1000.00, 1250.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (160, 6, 18, 1000.00, 1470.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (161, 7, 18, 1000.00, 1925.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (162, 8, 18, 1000.00, 1460.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (163, 9, 18, 1000.00, 1525.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (164, 10, 18, 1000.00, 1285.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (165, 11, 18, 1000.00, 1250.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (166, 12, 18, 1000.00, 1350.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (167, 13, 18, 1000.00, 1479.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (168, 14, 18, 1000.00, 1290.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (169, 15, 18, 1000.00, 1650.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (170, 16, 18, 1000.00, 1725.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (171, 17, 18, 1000.00, 1725.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (172, 18, 18, 1000.00, 1350.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (173, 19, 18, 1000.00, 1525.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (174, 20, 18, 1000.00, 1525.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (175, 21, 18, 1000.00, 1525.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (176, 22, 18, 1000.00, 1525.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (177, 23, 18, 1000.00, 1525.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (178, 24, 18, 1000.00, 1525.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (179, 25, 18, 1000.00, 1525.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (180, 26, 18, 1000.00, 1525.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (181, 27, 18, 1000.00, 1285.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (182, 28, 18, 1000.00, 1470.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (183, 29, 18, 1000.00, 1470.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (184, 30, 18, 1000.00, 1400.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (185, 31, 18, 1000.00, 1650.00, 21);
INSERT INTO public.tb_precios_convenio_programa VALUES (186, 32, 18, 1000.00, 1250.00, 21);


--
-- TOC entry 3936 (class 0 OID 17641)
-- Dependencies: 290
-- Data for Name: tb_precios_programa; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.tb_precios_programa VALUES (1, 1, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_programa VALUES (2, 2, 1000.00, 1230.00, 12);
INSERT INTO public.tb_precios_programa VALUES (3, 3, 1000.00, 1210.00, 18);
INSERT INTO public.tb_precios_programa VALUES (4, 4, 1000.00, 1190.00, 24);
INSERT INTO public.tb_precios_programa VALUES (5, 5, 1000.00, 1170.00, 32);
INSERT INTO public.tb_precios_programa VALUES (6, 6, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_programa VALUES (7, 7, 1000.00, 1230.00, 12);
INSERT INTO public.tb_precios_programa VALUES (8, 8, 1000.00, 1210.00, 18);
INSERT INTO public.tb_precios_programa VALUES (9, 9, 1000.00, 1190.00, 24);
INSERT INTO public.tb_precios_programa VALUES (10, 10, 1000.00, 1170.00, 32);
INSERT INTO public.tb_precios_programa VALUES (11, 11, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_programa VALUES (12, 12, 1000.00, 1230.00, 12);
INSERT INTO public.tb_precios_programa VALUES (13, 13, 1000.00, 1210.00, 18);
INSERT INTO public.tb_precios_programa VALUES (14, 14, 1000.00, 1190.00, 24);
INSERT INTO public.tb_precios_programa VALUES (15, 15, 1000.00, 1170.00, 32);
INSERT INTO public.tb_precios_programa VALUES (16, 16, 1000.00, 1925.00, 9);
INSERT INTO public.tb_precios_programa VALUES (17, 17, 1000.00, 1725.00, 18);
INSERT INTO public.tb_precios_programa VALUES (18, 18, 1000.00, 1725.00, 21);
INSERT INTO public.tb_precios_programa VALUES (19, 19, 1000.00, 1925.00, 9);
INSERT INTO public.tb_precios_programa VALUES (20, 20, 1000.00, 1725.00, 18);
INSERT INTO public.tb_precios_programa VALUES (21, 21, 1000.00, 1725.00, 21);
INSERT INTO public.tb_precios_programa VALUES (22, 22, 1000.00, 1925.00, 9);
INSERT INTO public.tb_precios_programa VALUES (23, 23, 1000.00, 1725.00, 18);
INSERT INTO public.tb_precios_programa VALUES (24, 24, 1000.00, 1725.00, 21);
INSERT INTO public.tb_precios_programa VALUES (25, 25, 1000.00, 1925.00, 9);
INSERT INTO public.tb_precios_programa VALUES (26, 26, 1000.00, 1725.00, 18);
INSERT INTO public.tb_precios_programa VALUES (27, 27, 1000.00, 1725.00, 21);
INSERT INTO public.tb_precios_programa VALUES (28, 28, 1000.00, 1925.00, 9);
INSERT INTO public.tb_precios_programa VALUES (29, 29, 1000.00, 1725.00, 18);
INSERT INTO public.tb_precios_programa VALUES (30, 30, 1000.00, 1725.00, 21);
INSERT INTO public.tb_precios_programa VALUES (31, 31, 1000.00, 1925.00, 9);
INSERT INTO public.tb_precios_programa VALUES (32, 32, 1000.00, 1725.00, 18);
INSERT INTO public.tb_precios_programa VALUES (33, 33, 1000.00, 1725.00, 21);
INSERT INTO public.tb_precios_programa VALUES (34, 34, 1000.00, 1925.00, 9);
INSERT INTO public.tb_precios_programa VALUES (35, 35, 1000.00, 1725.00, 18);
INSERT INTO public.tb_precios_programa VALUES (36, 36, 1000.00, 1725.00, 21);
INSERT INTO public.tb_precios_programa VALUES (39, 39, 2.00, 2.00, 32);
INSERT INTO public.tb_precios_programa VALUES (40, 40, 1000.00, 1500.00, 8);
INSERT INTO public.tb_precios_programa VALUES (38, 38, 1500.00, 1230.00, 8);


--
-- TOC entry 3938 (class 0 OID 17645)
-- Dependencies: 292
-- Data for Name: tb_programas; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.tb_programas VALUES (5, 'BBA', 'Bachelor of Business Administration', 32, 29, 0, 0, 1, 2, 0, 1, 33, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (6, 'BBA CM', 'Bachelor of Business Administration in Commercial Management', 8, 0, 0, 6, 0, 2, 0, 1, 9, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (7, 'BBA CM', 'Bachelor of Business Administration in Commercial Management', 12, 4, 0, 6, 0, 2, 0, 1, 13, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (8, 'BBA CM', 'Bachelor of Business Administration in Commercial Management', 18, 9, 0, 6, 1, 2, 0, 1, 19, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (9, 'BBA CM', 'Bachelor of Business Administration in Commercial Management', 24, 15, 0, 6, 1, 2, 0, 1, 25, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (10, 'BBA CM', 'Bachelor of Business Administration in Commercial Management', 32, 23, 0, 6, 1, 2, 0, 1, 33, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (11, 'BBA BF', 'Bachelor of Business Administration in Banking and Fintech', 8, 1, 0, 5, 0, 2, 0, 1, 9, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (12, 'BBA BF', 'Bachelor of Business Administration in Banking and Fintech', 12, 5, 0, 5, 0, 2, 0, 1, 13, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (13, 'BBA BF', 'Bachelor of Business Administration in Banking and Fintech', 18, 10, 0, 5, 1, 2, 0, 1, 19, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (14, 'BBA BF', 'Bachelor of Business Administration in Banking and Fintech', 24, 16, 0, 5, 1, 2, 0, 1, 25, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (15, 'BBA BF', 'Bachelor of Business Administration in Banking and Fintech', 32, 24, 0, 5, 1, 2, 0, 1, 33, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (16, 'MBA', 'Master of Business Administration', 9, 7, 0, 0, 0, 2, 0, 1, 10, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (17, 'MBA', 'Master of Business Administration', 18, 14, 0, 0, 1, 2, 1, 1, 19, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (18, 'MBA', 'Master of Business Administration', 21, 14, 3, 0, 1, 2, 1, 1, 22, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (19, 'MPM', 'Master of Project Management', 9, 0, 0, 7, 0, 2, 0, 1, 10, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (20, 'MPM', 'Master of Project Management', 18, 7, 0, 7, 1, 2, 1, 1, 19, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (21, 'MPM', 'Master of Project Management', 21, 7, 3, 7, 1, 2, 1, 1, 22, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (22, 'MFIN', 'Master of Financial Management', 9, 0, 0, 7, 0, 2, 0, 1, 10, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (23, 'MFIN', 'Master of Financial Management', 18, 7, 0, 7, 1, 2, 1, 1, 19, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (24, 'MFIN', 'Master of Financial Management', 21, 7, 3, 7, 1, 2, 1, 1, 22, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (25, 'MMK', 'Master of Marketing in Commercial Management', 9, 0, 0, 7, 0, 2, 0, 1, 10, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (26, 'MMK', 'Master of Marketing in Commercial Management', 18, 7, 0, 7, 1, 2, 1, 1, 19, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (27, 'MMK', 'Master of Marketing in Commercial Management', 21, 7, 3, 7, 1, 2, 1, 1, 22, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (28, 'MMKD', 'Master of Digital Marketing', 9, 0, 0, 7, 0, 2, 0, 1, 10, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (29, 'MMKD', 'Master of Digital Marketing', 18, 7, 0, 7, 1, 2, 1, 1, 19, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (30, 'MMKD', 'Master of Digital Marketing', 21, 7, 3, 7, 1, 2, 1, 1, 22, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (31, 'MHTM', 'Master in Human Talent Management', 9, 0, 0, 7, 0, 2, 0, 1, 10, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (32, 'MHTM', 'Master in Human Talent Management', 18, 7, 0, 7, 1, 2, 1, 1, 19, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (33, 'MHTM', 'Master in Human Talent Management', 21, 7, 3, 7, 1, 2, 1, 1, 22, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (34, 'MLDO', 'Master of Logistics in Operations Management', 9, 0, 0, 7, 0, 2, 0, 1, 10, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (35, 'MLDO', 'Master of Logistics in Operations Management', 18, 7, 0, 7, 1, 2, 1, 1, 19, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (36, 'MLDO', 'Master of Logistics in Operations Management', 21, 7, 3, 7, 1, 2, 1, 1, 22, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (1, '"BBA"', '"Bachelor of Business Administration"', 8, 6, 0, 0, 0, 2, 0, 1, 9, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (2, '"BBA"', '"Bachelor of Business Administration"', 12, 10, 0, 0, 0, 2, 0, 1, 13, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (3, '"BBA"', '"Bachelor of Business Administration"', 18, 15, 0, 0, 1, 2, 0, 1, 19, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (4, '"BBA"', '"Bachelor of Business Administration"', 24, 21, 0, 0, 1, 2, 0, 1, 25, '2025-03-23 16:50:35', true);
INSERT INTO public.tb_programas VALUES (38, 'DMO', 'Demo Abreviatura', 8, 0, 0, 0, 0, 0, 0, 0, 0, '2025-06-04 08:47:36', true);
INSERT INTO public.tb_programas VALUES (39, 'Demoprog2', 'Test', 32, 0, 0, 0, 0, 0, 0, 0, 0, '2025-06-05 15:27:16', true);
INSERT INTO public.tb_programas VALUES (40, 'T01', 'TestDemoProgram', 8, 0, 0, 0, 0, 0, 0, 0, 0, '2025-06-06 10:12:06', true);


--
-- TOC entry 3940 (class 0 OID 17660)
-- Dependencies: 294
-- Data for Name: tbcitas; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--



--
-- TOC entry 3942 (class 0 OID 17666)
-- Dependencies: 296
-- Data for Name: userpermissions; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.userpermissions VALUES (517, 7, 1, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (518, 7, 2, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (519, 7, 3, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (520, 7, 4, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (521, 7, 5, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (522, 7, 6, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (523, 7, 7, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (524, 7, 8, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (525, 7, 9, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (526, 7, 10, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (527, 7, 11, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (528, 7, 12, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (529, 7, 13, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (530, 7, 14, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (531, 7, 15, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (532, 7, 16, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (533, 7, 17, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (534, 7, 18, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (535, 7, 19, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (536, 7, 20, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (537, 7, 21, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (538, 7, 22, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (539, 7, 23, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (540, 7, 24, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (541, 7, 25, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (542, 7, 26, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (543, 7, 27, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (544, 7, 28, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (545, 7, 29, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (546, 7, 30, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (547, 7, 31, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (548, 7, 32, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (549, 7, 33, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (550, 7, 34, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (551, 7, 35, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (552, 7, 36, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (553, 7, 37, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (554, 7, 38, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (555, 7, 39, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (556, 7, 40, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (557, 7, 41, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (558, 7, 42, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (559, 7, 43, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (560, 7, 44, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (561, 7, 45, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (562, 7, 46, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (563, 7, 47, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (564, 7, 48, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (565, 7, 49, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (566, 7, 50, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (567, 7, 51, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (568, 7, 81, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (569, 7, 52, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (570, 7, 53, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (571, 7, 54, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (572, 7, 55, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (382, 13, 2, '2025-04-04 15:45:11', 'self');
INSERT INTO public.userpermissions VALUES (383, 13, 3, '2025-04-04 15:45:11', 'self');
INSERT INTO public.userpermissions VALUES (384, 13, 4, '2025-04-04 15:45:11', 'self');
INSERT INTO public.userpermissions VALUES (385, 13, 5, '2025-04-04 15:45:11', 'self');
INSERT INTO public.userpermissions VALUES (386, 13, 6, '2025-04-04 15:45:11', 'self');
INSERT INTO public.userpermissions VALUES (387, 13, 7, '2025-04-04 15:45:11', 'self');
INSERT INTO public.userpermissions VALUES (388, 13, 8, '2025-04-04 15:45:11', 'self');
INSERT INTO public.userpermissions VALUES (389, 13, 9, '2025-04-04 15:45:11', 'self');
INSERT INTO public.userpermissions VALUES (390, 13, 1, '2025-04-04 15:45:11', 'self');
INSERT INTO public.userpermissions VALUES (391, 13, 17, '2025-04-04 15:45:11', 'self');
INSERT INTO public.userpermissions VALUES (392, 10, 65, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (393, 10, 66, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (394, 10, 67, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (395, 10, 68, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (396, 10, 69, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (397, 10, 82, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (398, 10, 83, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (399, 10, 84, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (400, 10, 85, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (401, 10, 1, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (402, 10, 2, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (403, 10, 3, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (404, 10, 4, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (405, 10, 5, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (406, 10, 6, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (407, 10, 7, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (408, 10, 8, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (409, 10, 9, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (410, 10, 10, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (411, 10, 11, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (412, 10, 12, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (413, 10, 13, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (414, 10, 14, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (415, 10, 15, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (416, 10, 16, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (417, 10, 17, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (418, 10, 18, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (419, 10, 19, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (420, 10, 20, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (421, 10, 21, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (422, 10, 22, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (423, 10, 23, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (424, 10, 24, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (425, 10, 25, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (426, 10, 26, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (427, 10, 34, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (428, 10, 35, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (429, 10, 36, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (430, 10, 37, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (431, 10, 38, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (432, 10, 39, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (433, 10, 40, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (434, 10, 41, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (435, 10, 42, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (436, 10, 43, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (437, 10, 27, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (438, 10, 28, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (439, 10, 29, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (440, 10, 30, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (441, 10, 31, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (442, 10, 32, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (443, 10, 33, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (444, 10, 44, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (445, 10, 45, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (446, 10, 46, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (447, 10, 47, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (448, 10, 48, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (449, 10, 49, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (450, 10, 50, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (451, 10, 51, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (452, 10, 81, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (453, 10, 52, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (454, 10, 53, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (455, 10, 54, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (456, 10, 55, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (457, 10, 56, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (458, 10, 57, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (459, 10, 58, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (460, 10, 59, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (461, 10, 60, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (462, 10, 61, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (463, 10, 62, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (464, 10, 63, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (465, 10, 64, '2025-04-04 16:05:13', 'self');
INSERT INTO public.userpermissions VALUES (573, 7, 56, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (574, 7, 57, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (575, 7, 58, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (576, 7, 59, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (577, 7, 60, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (578, 7, 61, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (579, 7, 62, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (580, 7, 63, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (581, 7, 64, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (582, 7, 65, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (583, 7, 66, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (584, 7, 67, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (585, 7, 68, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (586, 7, 69, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (587, 7, 82, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (588, 7, 83, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (589, 7, 84, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (590, 7, 85, '2025-04-23 23:51:54', 'self');
INSERT INTO public.userpermissions VALUES (591, 2, 27, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (592, 2, 28, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (593, 2, 29, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (594, 2, 30, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (595, 2, 31, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (596, 2, 32, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (597, 2, 33, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (598, 2, 34, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (599, 2, 35, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (600, 2, 36, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (601, 2, 37, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (602, 2, 38, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (603, 2, 39, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (604, 2, 40, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (605, 2, 41, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (606, 2, 42, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (607, 2, 43, '2025-04-24 21:43:23', 'self');
INSERT INTO public.userpermissions VALUES (608, 5, 1, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (609, 5, 2, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (610, 5, 3, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (611, 5, 4, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (612, 5, 5, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (613, 5, 6, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (614, 5, 7, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (615, 5, 8, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (616, 5, 9, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (617, 5, 10, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (618, 5, 11, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (619, 5, 12, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (620, 5, 13, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (621, 5, 14, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (622, 5, 15, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (623, 5, 16, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (624, 5, 17, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (625, 5, 18, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (626, 5, 19, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (627, 5, 20, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (628, 5, 21, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (629, 5, 22, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (630, 5, 23, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (631, 5, 24, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (632, 5, 25, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (633, 5, 26, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (634, 5, 27, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (635, 5, 28, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (636, 5, 29, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (637, 5, 30, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (638, 5, 31, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (639, 5, 32, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (640, 5, 33, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (641, 5, 34, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (642, 5, 35, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (643, 5, 36, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (644, 5, 37, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (645, 5, 38, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (646, 5, 39, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (647, 5, 40, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (648, 5, 41, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (649, 5, 42, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (650, 5, 43, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (651, 5, 45, '2025-04-30 14:15:56', 'self');
INSERT INTO public.userpermissions VALUES (652, 19, 1, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (653, 19, 2, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (654, 19, 3, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (655, 19, 4, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (656, 19, 5, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (657, 19, 6, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (658, 19, 7, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (659, 19, 8, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (660, 19, 9, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (661, 19, 10, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (662, 19, 11, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (663, 19, 12, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (664, 19, 13, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (665, 19, 14, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (666, 19, 15, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (667, 19, 16, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (668, 19, 17, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (669, 19, 18, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (670, 19, 19, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (671, 19, 20, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (672, 19, 21, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (673, 19, 22, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (674, 19, 23, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (675, 19, 24, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (676, 19, 25, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (677, 19, 26, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (678, 19, 27, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (679, 19, 28, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (680, 19, 29, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (681, 19, 30, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (682, 19, 31, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (683, 19, 32, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (684, 19, 33, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (685, 19, 34, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (686, 19, 35, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (687, 19, 36, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (688, 19, 37, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (689, 19, 38, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (690, 19, 39, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (691, 19, 40, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (692, 19, 41, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (693, 19, 42, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (694, 19, 43, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (695, 19, 44, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (696, 19, 45, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (697, 19, 46, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (698, 19, 47, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (699, 19, 48, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (700, 19, 49, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (701, 19, 50, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (702, 19, 51, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (703, 19, 81, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (704, 19, 52, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (705, 19, 53, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (706, 19, 54, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (707, 19, 55, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (708, 19, 56, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (709, 19, 57, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (710, 19, 58, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (711, 19, 59, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (712, 19, 60, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (713, 19, 61, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (714, 19, 62, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (715, 19, 63, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (716, 19, 64, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (717, 19, 65, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (718, 19, 66, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (719, 19, 67, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (720, 19, 68, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (721, 19, 69, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (722, 19, 82, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (723, 19, 83, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (724, 19, 84, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (725, 19, 85, '2025-05-06 22:16:56', 'self');
INSERT INTO public.userpermissions VALUES (726, 20, 1, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (727, 20, 2, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (728, 20, 3, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (729, 20, 4, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (730, 20, 5, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (731, 20, 6, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (732, 20, 7, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (733, 20, 8, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (734, 20, 9, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (735, 20, 10, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (736, 20, 11, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (737, 20, 12, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (738, 20, 13, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (739, 20, 14, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (740, 20, 15, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (741, 20, 16, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (742, 20, 17, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (743, 20, 18, '2025-05-06 22:24:38', 'self');
INSERT INTO public.userpermissions VALUES (744, 22, 1, '2025-05-08 14:08:21', 'self');
INSERT INTO public.userpermissions VALUES (745, 22, 2, '2025-05-08 14:08:21', 'self');
INSERT INTO public.userpermissions VALUES (746, 22, 3, '2025-05-08 14:08:21', 'self');
INSERT INTO public.userpermissions VALUES (747, 22, 4, '2025-05-08 14:08:21', 'self');
INSERT INTO public.userpermissions VALUES (748, 22, 5, '2025-05-08 14:08:21', 'self');
INSERT INTO public.userpermissions VALUES (749, 22, 6, '2025-05-08 14:08:21', 'self');
INSERT INTO public.userpermissions VALUES (750, 22, 8, '2025-05-08 14:08:21', 'self');
INSERT INTO public.userpermissions VALUES (751, 22, 9, '2025-05-08 14:08:21', 'self');
INSERT INTO public.userpermissions VALUES (752, 18, 1, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (753, 18, 2, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (754, 18, 3, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (755, 18, 4, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (756, 18, 5, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (757, 18, 6, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (758, 18, 7, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (759, 18, 8, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (760, 18, 9, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (761, 18, 10, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (762, 18, 11, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (763, 18, 12, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (764, 18, 13, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (765, 18, 14, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (766, 18, 15, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (767, 18, 16, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (768, 18, 17, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (769, 18, 18, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (770, 18, 19, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (771, 18, 20, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (772, 18, 21, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (773, 18, 22, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (774, 18, 23, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (775, 18, 24, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (776, 18, 25, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (777, 18, 26, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (778, 18, 27, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (779, 18, 28, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (780, 18, 29, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (781, 18, 30, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (782, 18, 31, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (783, 18, 32, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (784, 18, 33, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (785, 18, 34, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (786, 18, 35, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (787, 18, 36, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (788, 18, 37, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (789, 18, 38, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (790, 18, 39, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (791, 18, 40, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (792, 18, 41, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (793, 18, 42, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (794, 18, 43, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (795, 18, 44, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (796, 18, 45, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (797, 18, 46, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (798, 18, 47, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (799, 18, 48, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (800, 18, 49, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (801, 18, 50, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (802, 18, 51, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (803, 18, 81, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (804, 18, 52, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (805, 18, 53, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (806, 18, 54, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (807, 18, 55, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (808, 18, 56, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (809, 18, 57, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (810, 18, 58, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (811, 18, 59, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (812, 18, 60, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (813, 18, 61, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (814, 18, 62, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (815, 18, 63, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (816, 18, 64, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (817, 18, 65, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (818, 18, 66, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (819, 18, 67, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (820, 18, 68, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (821, 18, 69, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (822, 18, 82, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (823, 18, 83, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (824, 18, 84, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (825, 18, 85, '2025-06-05 20:59:22', 'self');
INSERT INTO public.userpermissions VALUES (826, 28, 1, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (827, 28, 2, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (828, 28, 3, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (829, 28, 4, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (830, 28, 5, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (831, 28, 6, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (832, 28, 7, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (833, 28, 8, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (834, 28, 9, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (835, 28, 10, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (836, 28, 11, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (837, 28, 12, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (838, 28, 13, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (839, 28, 14, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (840, 28, 15, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (841, 28, 16, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (842, 28, 17, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (843, 28, 18, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (844, 28, 19, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (845, 28, 20, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (846, 28, 21, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (847, 28, 22, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (848, 28, 23, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (849, 28, 24, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (850, 28, 25, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (851, 28, 26, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (852, 28, 27, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (853, 28, 28, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (854, 28, 29, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (855, 28, 30, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (856, 28, 31, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (857, 28, 32, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (858, 28, 33, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (859, 28, 34, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (860, 28, 35, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (861, 28, 36, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (862, 28, 37, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (863, 28, 38, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (864, 28, 39, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (865, 28, 40, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (866, 28, 41, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (867, 28, 42, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (868, 28, 43, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (869, 28, 44, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (870, 28, 45, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (871, 28, 46, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (872, 28, 47, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (873, 28, 48, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (874, 28, 49, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (875, 28, 50, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (876, 28, 51, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (877, 28, 81, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (878, 28, 52, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (879, 28, 53, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (880, 28, 54, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (881, 28, 55, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (882, 28, 56, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (883, 28, 57, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (884, 28, 58, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (885, 28, 59, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (886, 28, 60, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (887, 28, 61, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (888, 28, 62, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (889, 28, 63, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (890, 28, 64, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (891, 28, 65, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (892, 28, 66, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (893, 28, 67, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (894, 28, 68, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (895, 28, 69, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (896, 28, 82, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (897, 28, 83, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (898, 28, 84, '2025-06-10 21:15:25', 'self');
INSERT INTO public.userpermissions VALUES (899, 28, 85, '2025-06-10 21:15:25', 'self');


--
-- TOC entry 3944 (class 0 OID 17673)
-- Dependencies: 298
-- Data for Name: userroles; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.userroles VALUES (1, 1, 1, '2025-03-27 16:36:57', NULL);
INSERT INTO public.userroles VALUES (2, 2, 2, '2025-03-27 16:51:23', NULL);
INSERT INTO public.userroles VALUES (3, 3, 1, '2025-03-27 17:06:47', NULL);
INSERT INTO public.userroles VALUES (4, 4, 1, '2025-03-27 17:19:10', NULL);
INSERT INTO public.userroles VALUES (6, 6, 5, '2025-03-27 17:31:16', NULL);
INSERT INTO public.userroles VALUES (5, 5, 1, '2025-03-27 17:19:59', NULL);
INSERT INTO public.userroles VALUES (8, 8, 2, '2025-03-27 18:32:55', NULL);
INSERT INTO public.userroles VALUES (9, 9, 6, '2025-03-27 18:34:00', NULL);
INSERT INTO public.userroles VALUES (7, 7, 3, '2025-03-27 17:56:08', NULL);
INSERT INTO public.userroles VALUES (10, 10, 1, '2025-03-28 16:48:22', NULL);
INSERT INTO public.userroles VALUES (11, 11, 1, '2025-03-28 17:12:25', NULL);
INSERT INTO public.userroles VALUES (12, 12, 1, '2025-04-03 15:57:51', NULL);
INSERT INTO public.userroles VALUES (13, 13, 7, '2025-04-04 15:43:47', NULL);
INSERT INTO public.userroles VALUES (15, 15, 7, '2025-04-23 14:36:48', NULL);
INSERT INTO public.userroles VALUES (16, 16, 1, '2025-04-24 21:36:28', NULL);
INSERT INTO public.userroles VALUES (17, 17, 9, '2025-04-24 22:10:34', NULL);
INSERT INTO public.userroles VALUES (18, 18, 1, '2025-04-30 14:10:45', NULL);
INSERT INTO public.userroles VALUES (19, 19, 1, '2025-05-06 22:16:20', NULL);
INSERT INTO public.userroles VALUES (20, 20, 7, '2025-05-06 22:22:55', NULL);
INSERT INTO public.userroles VALUES (21, 21, 7, '2025-05-06 22:24:14', NULL);
INSERT INTO public.userroles VALUES (22, 22, 7, '2025-05-08 14:07:15', NULL);
INSERT INTO public.userroles VALUES (23, 23, 3, '2025-06-04 04:16:12', NULL);
INSERT INTO public.userroles VALUES (24, 24, 3, '2025-06-04 14:48:44', NULL);
INSERT INTO public.userroles VALUES (25, 25, 2, '2025-06-05 21:45:31', NULL);
INSERT INTO public.userroles VALUES (14, 14, 4, '2025-04-23 14:20:47', NULL);
INSERT INTO public.userroles VALUES (26, 26, 3, '2025-06-06 03:38:12', NULL);
INSERT INTO public.userroles VALUES (27, 27, 3, '2025-06-06 03:38:56', NULL);
INSERT INTO public.userroles VALUES (28, 28, 9, '2025-06-10 21:13:41', NULL);


--
-- TOC entry 3946 (class 0 OID 17678)
-- Dependencies: 300
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: asm_prod_user
--

INSERT INTO public.users VALUES (1, 'AndresSGonDev05', 'mlpdbz300@gmail.com', '$2y$12$MHYFPcOat2i4esZxFrs7IOAMNgThQn4Spk2L54n8YWF/9LRy9kr6.', 'Pablo', 'Santos', true, false, '2025-03-27 16:36:57', '2025-03-27 19:06:16', NULL, false, NULL);
INSERT INTO public.users VALUES (8, 'askdjhfljkashdf', 'asdfasdfasdf@gmail.com', '$2y$12$j4KF64srK3AgnrIk2WpcMeb8UryULwtAPwJ8IdCEuqCToDwix9ZD.', 'asdfasdf', 'asdfasdf', true, false, '2025-03-27 18:32:55', '2025-04-01 22:19:41', NULL, false, '2025-04-01 22:19:41');
INSERT INTO public.users VALUES (9, 'wretawgasdgasdggqerwghasdg', 'hadsfafhqhadsrfgawergh@hotmail.com', '$2y$12$lWJI5W2GUwKfzqvYOBUxauMXrolzes13LF6VgPATnQyyvxwk5.6aS', 'Pablo', 'Santos', true, false, '2025-03-27 18:34:00', '2025-04-01 22:19:47', NULL, false, '2025-04-01 22:19:47');
INSERT INTO public.users VALUES (3, 'sotecpro100', 'mlpdbz3010@gmail.com', '$2y$12$6lSinbkbsrQ1VLQ8uDw9R.PUYmtG2Hc8ue8EJI0IIp9fG6Qax8Hxu', 'Pablo', 'Santos', true, false, '2025-03-27 17:06:47', '2025-04-01 22:19:55', NULL, false, '2025-04-01 22:19:55');
INSERT INTO public.users VALUES (22, 'Asesor_AMERICAN', 'AsesorAmerican@gmail.com', '$2y$12$KiWKUh8NLITnniUmdw4Tg.4DXe/0G11jz68Oc/ds5iCmPWNlMP1LK', 'Juan', 'Gonzalez', true, false, '2025-05-08 14:07:15', '2025-05-08 14:07:15', NULL, false, NULL);
INSERT INTO public.users VALUES (15, 'AsesorBlueAtlas2', 'Asesor2BlueAtlas@gmail.com', '$2y$12$gprzlqTZT8WTg5U9dUd7yOXU/rb1vwdNidcqt9nng9r/wxRdOwF7W', 'Asesor2', 'Asesor2', true, false, '2025-04-23 14:36:48', '2025-04-23 14:37:07', NULL, false, NULL);
INSERT INTO public.users VALUES (18, 'adminadmin', 'Superadmin@gmail.com', '$2y$12$T9DcKXeuI5lDaLaOCMOUQOeOJUnBOapDD2cvLJZkkiv/XIzlSDxNa', 'Administrador Admin', 'Admin', true, false, '2025-04-30 14:10:45', '2025-06-05 21:01:24', NULL, false, NULL);
INSERT INTO public.users VALUES (25, 'saadssmin@blueatlas.com', 'mlpsssdbz300@gmail.com', '$2y$12$paUHDDdHyPvBkaNoiSMCH.AuQTwD53rgq/nraQwF90wcW2ouR9oe6', 'Pablo', 'Santos', true, false, '2025-06-05 21:45:31', '2025-06-05 21:45:31', NULL, false, NULL);
INSERT INTO public.users VALUES (17, 'admiggn@blueatlas.com', 'mlpggdbz300@gmail.com', '$2y$12$CWxFWgOJN/0F4mWsYC29dObg/d/MeAaog8i5FSLeb2RHXh.KIc3Jm', 'Pablo', 'Santos', true, false, '2025-04-24 22:10:34', '2025-06-10 21:43:39', NULL, false, '2025-06-10 21:43:39');
INSERT INTO public.users VALUES (14, 'Dra Karla de Conde Demo', 'ASMKarla@gmai.com', '$2y$12$X/xPHqtnQ4Rz3GgI8.v9Bu6ruuiTvYqEPEjWzoG8u98VvSCnFlhtK', 'Karla', 'de Conde', false, false, '2025-04-23 14:20:47', '2025-06-10 21:43:43', NULL, false, '2025-06-10 21:43:43');
INSERT INTO public.users VALUES (26, 'jose.villanueva', 'jose.villanueva@americanschool.edu.gt', '$2y$12$VSBSNvSjMFGDkKWCFe3o2ORNhPARXDev9vnWOuXszF5zs1kWE6LwS', 'Jose', 'VillaNueva', true, true, '2025-06-06 03:38:12', '2025-06-10 21:43:46', NULL, false, '2025-06-10 21:43:46');
INSERT INTO public.users VALUES (4, 'ByronCaal', 'Bcaal97@gmail.com', '$2y$12$ApqhwReCH7CZrYV5NmOEiuYI6PYEdpN3dmASkvsTQIZjKYn8dqpza', 'Pablo', 'Santos', true, false, '2025-03-27 17:19:10', '2025-06-10 21:43:59', NULL, false, '2025-06-10 21:43:59');
INSERT INTO public.users VALUES (23, 'lesly.garcia', 'lesly.garcia@americanschool.edu.gt', '$2y$12$g2W/Qk4T0SL1tGcqLWoSkua/pef7kT499gI/EJy2kPsuLf2jt4pcu', 'Lesly', 'Garcia', false, true, '2025-06-04 04:16:12', '2025-06-10 21:44:02', NULL, false, '2025-06-10 21:44:02');
INSERT INTO public.users VALUES (5, 'joel', 'joel29@gmail.com', '$2y$12$ghXgRQWMD7K/dAqNZ33irOplDYCM/SThZ3PtfVrD6EXXzUdulxamq', 'Pablo', 'Santos', false, false, '2025-03-27 17:19:59', '2025-06-10 21:44:04', NULL, false, '2025-06-10 21:44:04');
INSERT INTO public.users VALUES (13, 'Asesor', 'AsesorBlueAtlas@gmail.com', '$2y$12$xlBytYKP/ymQEzTyqsBVheXIfiG475ih/J53UBF/0dGNi9xx4I1Ay', 'Asesor', 'Asesor', true, false, '2025-04-04 15:43:47', '2025-06-10 21:44:07', NULL, false, '2025-06-10 21:44:07');
INSERT INTO public.users VALUES (24, 'silvia.arriaza', 'silvia.arriaza@americanschool.edu.gt', '$2y$12$kBi/zoDNgEEBdyn3dhNo7uhsvC.XrF/yoivJUw6.YseJ8wMq80mVS', 'Silvia', 'Arriaza', true, true, '2025-06-04 14:48:44', '2025-06-10 21:44:12', NULL, false, '2025-06-10 21:44:12');
INSERT INTO public.users VALUES (12, 'Byron caal', 'Bcaal87@gmail.com', '$2y$12$vz/dWL8gljovPJgJmWBZ7OdGHYOJ5RnppqUgm/DvLudfNPNeV.7Te', 'Byron', 'Caal', false, false, '2025-04-03 15:57:51', '2025-06-10 21:47:44', NULL, false, '2025-06-10 21:47:44');
INSERT INTO public.users VALUES (16, 'American 1', 'American@gmail.com', '$2y$12$VqD61WsrfDnCIEI3YMpkc.cVWWqDga1X6Z5yhOODZQOvP9da.aAxa', 'Juan', 'Perez', false, false, '2025-04-24 21:36:28', '2025-06-10 21:47:48', NULL, false, '2025-06-10 21:47:48');
INSERT INTO public.users VALUES (27, 'mariela.pacheco', 'mariela.pacheco@americanschool.edu.gt', '$2y$12$VDKOrUa.RBdGUz/a8inEDej2cFZ6x8MZXg1oYEbHVAVbRs6psdUuC', 'Mariela', 'Pacheco', true, true, '2025-06-06 03:38:56', '2025-06-10 21:47:52', NULL, false, '2025-06-10 21:47:52');
INSERT INTO public.users VALUES (19, 'Sharon Maldonado', 'sharondemo@admin.com', '$2y$12$3pn6M486w6DUHplYnU/y1eRWs.c.4EN2cvoZiKXaZVJ355fUD7iO6', 'Sharon', 'Maldonado', true, false, '2025-05-06 22:16:20', '2025-06-10 21:47:57', NULL, false, '2025-06-10 21:47:57');
INSERT INTO public.users VALUES (6, 'Juantopo', 'Juantopo@gmail.com', '$2y$12$WQl..ZAoYwlGmgwLCWxzueJ7Fyw60/aUyLMOefKL5hcI/yCKZEZ2O', 'juan', 'topo', true, false, '2025-03-27 17:31:16', '2025-06-10 21:48:04', NULL, false, '2025-06-10 21:48:04');
INSERT INTO public.users VALUES (11, 'testuser', 'usuario@ejemplo.com', '$2y$12$VXI/JN9BwdUbeycZCZl76evrlbxJE9ZzR21ZruqBh8jLzBgy.NYKi', 'Test', 'User', true, false, '2025-03-28 17:12:25', '2025-06-10 21:48:10', '2025-03-31 01:06:42', false, '2025-06-10 21:48:10');
INSERT INTO public.users VALUES (20, 'Juan Perez', 'Juan@asesor.com', '$2y$12$2furkPJSvcr0kH2/93s2Y.SQJQm0MzmPaywlWyLF9iEaY0l4ntXN2', 'juan', 'perez', true, false, '2025-05-06 22:22:55', '2025-06-10 21:48:14', NULL, false, '2025-06-10 21:48:14');
INSERT INTO public.users VALUES (21, 'pedro pazcal', 'pedro@admin.com', '$2y$12$XCjl9bklfvvsXDrkHNBTouy71BhrEXACCXC8krSa7jwVIpDnvsuAK', 'pedro', 'pazcal', false, false, '2025-05-06 22:24:14', '2025-06-10 21:48:20', NULL, false, '2025-06-10 21:48:20');
INSERT INTO public.users VALUES (2, 'CarolHerenadez', 'Carol2905@gmail.com', '$2y$12$PgHB6E9skuyWkw.lW9XNUObsgGzXYvWehIP0ts/Chp/7.5z/nsXq.', 'Carol', 'Hernazdez', true, false, '2025-03-27 16:51:23', '2025-06-10 21:48:23', NULL, false, '2025-06-10 21:48:23');
INSERT INTO public.users VALUES (10, 'PabloAdmin', 'admin@blueatlas.com', '$2y$12$P7KQKNvEzwzsJqh.Ik5RMekuvIm0iVmvqs.UfUOpzn71ywiAHLgsG', 'Pablo', 'Admin', true, false, '2025-03-28 16:48:22', '2025-06-10 21:44:10', '2025-04-04 18:42:44', false, NULL);
INSERT INTO public.users VALUES (7, 'BryanSoto', 'Jaime@gmail.com', '$2y$12$YCuMExzqYmsSp/9EAlbmg.Gbbog4EPVCJ0x35pSo9r8hvZ33KRMNG', 'Jame', 'Reyes', false, false, '2025-03-27 17:56:08', '2025-06-10 21:43:52', NULL, false, '2025-06-10 21:43:52');
INSERT INTO public.users VALUES (28, 'TestUserdemo21', 'Demo@demo.comn.gt', '$2y$12$hWK2.VRJPpcF7tPplA7GQusq6VcRj77UfV1OlGrDuGC3B0f77Vnfi', 'Demo', 'User', false, false, '2025-06-10 21:13:41', '2025-06-10 21:43:55', NULL, false, '2025-06-10 21:43:55');


--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 210
-- Name: advisor_commission_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.advisor_commission_rates_id_seq', 1, false);


--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 212
-- Name: approval_flows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.approval_flows_id_seq', 1, true);


--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 214
-- Name: approval_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.approval_stages_id_seq', 1, false);


--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 216
-- Name: auditlogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.auditlogs_id_seq', 4, true);


--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 217
-- Name: column_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.column_configurations_id_seq', 15, true);


--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 220
-- Name: commission_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.commission_configs_id_seq', 1, true);


--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 222
-- Name: commissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.commissions_id_seq', 1, false);


--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 224
-- Name: contactos_enviados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.contactos_enviados_id_seq', 14, true);


--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 226
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.courses_id_seq', 4, true);


--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 228
-- Name: cuotas_programa_estudiante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.cuotas_programa_estudiante_id_seq', 347, true);


--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 230
-- Name: curso_prospecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.curso_prospecto_id_seq', 1, false);


--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 232
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.departamentos_id_seq', 1, false);


--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 234
-- Name: duplicate_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.duplicate_records_id_seq', 142, true);


--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 236
-- Name: estudiante_programa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.estudiante_programa_id_seq', 33, true);


--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 238
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 242
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- TOC entry 4013 (class 0 OID 0)
-- Dependencies: 244
-- Name: kardex_pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.kardex_pagos_id_seq', 1, false);


--
-- TOC entry 4014 (class 0 OID 0)
-- Dependencies: 246
-- Name: mfaconfigurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.mfaconfigurations_id_seq', 1, false);


--
-- TOC entry 4015 (class 0 OID 0)
-- Dependencies: 248
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.migrations_id_seq', 16, true);


--
-- TOC entry 4016 (class 0 OID 0)
-- Dependencies: 250
-- Name: modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.modules_id_seq', 19, true);


--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 252
-- Name: moduleviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.moduleviews_id_seq', 89, true);


--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 254
-- Name: municipios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.municipios_id_seq', 1, false);


--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 255
-- Name: nom_id_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.nom_id_tipo_seq', 1, true);


--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 258
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.paises_id_seq', 15, true);


--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 261
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 263
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 245, true);


--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 266
-- Name: prospectos_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.prospectos_documentos_id_seq', 76, true);


--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 267
-- Name: prospectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.prospectos_id_seq', 3360, true);


--
-- TOC entry 4025 (class 0 OID 0)
-- Dependencies: 269
-- Name: rolepermissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.rolepermissions_id_seq', 1, false);


--
-- TOC entry 4026 (class 0 OID 0)
-- Dependencies: 271
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.roles_id_seq', 11, true);


--
-- TOC entry 4027 (class 0 OID 0)
-- Dependencies: 273
-- Name: securitypolicies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.securitypolicies_id_seq', 1, false);


--
-- TOC entry 4028 (class 0 OID 0)
-- Dependencies: 275
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.sessions_id_seq', 247, true);


--
-- TOC entry 4029 (class 0 OID 0)
-- Dependencies: 276
-- Name: tarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.tarea_id_seq', 9, true);


--
-- TOC entry 4030 (class 0 OID 0)
-- Dependencies: 279
-- Name: tb_actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.tb_actividades_id_seq', 4, true);


--
-- TOC entry 4031 (class 0 OID 0)
-- Dependencies: 281
-- Name: tb_convenio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.tb_convenio_id_seq', 34, true);


--
-- TOC entry 4032 (class 0 OID 0)
-- Dependencies: 283
-- Name: tb_interacciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.tb_interacciones_id_seq', 9, true);


--
-- TOC entry 4033 (class 0 OID 0)
-- Dependencies: 285
-- Name: tb_periodo_programa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.tb_periodo_programa_id_seq', 144, true);


--
-- TOC entry 4034 (class 0 OID 0)
-- Dependencies: 287
-- Name: tb_periodos_inscripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.tb_periodos_inscripcion_id_seq', 8, true);


--
-- TOC entry 4035 (class 0 OID 0)
-- Dependencies: 289
-- Name: tb_precios_convenio_programa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.tb_precios_convenio_programa_id_seq', 186, true);


--
-- TOC entry 4036 (class 0 OID 0)
-- Dependencies: 291
-- Name: tb_precios_programa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.tb_precios_programa_id_seq', 40, true);


--
-- TOC entry 4037 (class 0 OID 0)
-- Dependencies: 293
-- Name: tb_programas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.tb_programas_id_seq', 40, true);


--
-- TOC entry 4038 (class 0 OID 0)
-- Dependencies: 295
-- Name: tbcitas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.tbcitas_id_seq', 7, true);


--
-- TOC entry 4039 (class 0 OID 0)
-- Dependencies: 297
-- Name: userpermissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.userpermissions_id_seq', 899, true);


--
-- TOC entry 4040 (class 0 OID 0)
-- Dependencies: 299
-- Name: userroles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.userroles_id_seq', 28, true);


--
-- TOC entry 4041 (class 0 OID 0)
-- Dependencies: 301
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: asm_prod_user
--

SELECT pg_catalog.setval('public.users_id_seq', 28, true);


--
-- TOC entry 3551 (class 2606 OID 17732)
-- Name: advisor_commission_rates advisor_commission_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.advisor_commission_rates
    ADD CONSTRAINT advisor_commission_rates_pkey PRIMARY KEY (id);


--
-- TOC entry 3554 (class 2606 OID 17734)
-- Name: approval_flows approval_flows_code_key; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.approval_flows
    ADD CONSTRAINT approval_flows_code_key UNIQUE (code);


--
-- TOC entry 3556 (class 2606 OID 17736)
-- Name: approval_flows approval_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.approval_flows
    ADD CONSTRAINT approval_flows_pkey PRIMARY KEY (id);


--
-- TOC entry 3558 (class 2606 OID 17738)
-- Name: approval_stages approval_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.approval_stages
    ADD CONSTRAINT approval_stages_pkey PRIMARY KEY (id);


--
-- TOC entry 3560 (class 2606 OID 17740)
-- Name: auditlogs auditlogs_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.auditlogs
    ADD CONSTRAINT auditlogs_pkey PRIMARY KEY (id);


--
-- TOC entry 3562 (class 2606 OID 17742)
-- Name: column_configurations column_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.column_configurations
    ADD CONSTRAINT column_configurations_pkey PRIMARY KEY (id);


--
-- TOC entry 3564 (class 2606 OID 17744)
-- Name: commission_configs commission_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.commission_configs
    ADD CONSTRAINT commission_configs_pkey PRIMARY KEY (id);


--
-- TOC entry 3567 (class 2606 OID 17746)
-- Name: commissions commissions_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.commissions
    ADD CONSTRAINT commissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3570 (class 2606 OID 17748)
-- Name: contactos_enviados contactos_enviados_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.contactos_enviados
    ADD CONSTRAINT contactos_enviados_pkey PRIMARY KEY (id);


--
-- TOC entry 3575 (class 2606 OID 17750)
-- Name: courses courses_code_unique; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_code_unique UNIQUE (code);


--
-- TOC entry 3578 (class 2606 OID 17752)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 3582 (class 2606 OID 17754)
-- Name: cuotas_programa_estudiante cuotas_programa_estudiante_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.cuotas_programa_estudiante
    ADD CONSTRAINT cuotas_programa_estudiante_pkey PRIMARY KEY (id);


--
-- TOC entry 3584 (class 2606 OID 17756)
-- Name: curso_prospecto curso_prospecto_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.curso_prospecto
    ADD CONSTRAINT curso_prospecto_pkey PRIMARY KEY (id);


--
-- TOC entry 3586 (class 2606 OID 17758)
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);


--
-- TOC entry 3588 (class 2606 OID 17760)
-- Name: duplicate_records duplicate_records_original_prospect_id_duplicate_prospect_id_un; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.duplicate_records
    ADD CONSTRAINT duplicate_records_original_prospect_id_duplicate_prospect_id_un UNIQUE (original_prospect_id, duplicate_prospect_id);


--
-- TOC entry 3590 (class 2606 OID 17762)
-- Name: duplicate_records duplicate_records_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.duplicate_records
    ADD CONSTRAINT duplicate_records_pkey PRIMARY KEY (id);


--
-- TOC entry 3592 (class 2606 OID 17764)
-- Name: estudiante_programa estudiante_programa_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.estudiante_programa
    ADD CONSTRAINT estudiante_programa_pkey PRIMARY KEY (id);


--
-- TOC entry 3594 (class 2606 OID 17766)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3596 (class 2606 OID 17768)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3598 (class 2606 OID 17770)
-- Name: flow_program flow_program_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.flow_program
    ADD CONSTRAINT flow_program_pkey PRIMARY KEY (flow_id, program_id);


--
-- TOC entry 3600 (class 2606 OID 17772)
-- Name: groupmemberships groupmemberships_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.groupmemberships
    ADD CONSTRAINT groupmemberships_pkey PRIMARY KEY (group_id, member_id);


--
-- TOC entry 3602 (class 2606 OID 17774)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3604 (class 2606 OID 17776)
-- Name: kardex_pagos kardex_pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.kardex_pagos
    ADD CONSTRAINT kardex_pagos_pkey PRIMARY KEY (id);


--
-- TOC entry 3606 (class 2606 OID 17778)
-- Name: mfaconfigurations mfaconfigurations_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.mfaconfigurations
    ADD CONSTRAINT mfaconfigurations_pkey PRIMARY KEY (id);


--
-- TOC entry 3608 (class 2606 OID 17780)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3610 (class 2606 OID 17782)
-- Name: modules modules_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);


--
-- TOC entry 3612 (class 2606 OID 17784)
-- Name: moduleviews moduleviews_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.moduleviews
    ADD CONSTRAINT moduleviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3614 (class 2606 OID 17786)
-- Name: municipios municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id);


--
-- TOC entry 3616 (class 2606 OID 17788)
-- Name: nom nom_nombre_tipo_unique; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.nom
    ADD CONSTRAINT nom_nombre_tipo_unique UNIQUE (nombre_tipo);


--
-- TOC entry 3618 (class 2606 OID 17790)
-- Name: nom nom_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.nom
    ADD CONSTRAINT nom_pkey PRIMARY KEY (id_tipo);


--
-- TOC entry 3620 (class 2606 OID 17792)
-- Name: paises paises_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (id);


--
-- TOC entry 3622 (class 2606 OID 17794)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 3624 (class 2606 OID 17796)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3626 (class 2606 OID 17798)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3628 (class 2606 OID 17800)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3633 (class 2606 OID 17802)
-- Name: prospectos_documentos prospectos_documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.prospectos_documentos
    ADD CONSTRAINT prospectos_documentos_pkey PRIMARY KEY (id);


--
-- TOC entry 3631 (class 2606 OID 17804)
-- Name: prospectos prospectos_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.prospectos
    ADD CONSTRAINT prospectos_pkey PRIMARY KEY (id);


--
-- TOC entry 3635 (class 2606 OID 17806)
-- Name: rolepermissions rolepermissions_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.rolepermissions
    ADD CONSTRAINT rolepermissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3637 (class 2606 OID 17808)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3639 (class 2606 OID 17810)
-- Name: securitypolicies securitypolicies_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.securitypolicies
    ADD CONSTRAINT securitypolicies_pkey PRIMARY KEY (id);


--
-- TOC entry 3641 (class 2606 OID 17812)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3643 (class 2606 OID 17814)
-- Name: tareas tareas_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tareas
    ADD CONSTRAINT tareas_pkey PRIMARY KEY (id);


--
-- TOC entry 3645 (class 2606 OID 17816)
-- Name: tb_actividades tb_actividades_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_actividades
    ADD CONSTRAINT tb_actividades_pkey PRIMARY KEY (id);


--
-- TOC entry 3647 (class 2606 OID 17818)
-- Name: tb_convenio tb_convenio_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_convenio
    ADD CONSTRAINT tb_convenio_pkey PRIMARY KEY (id);


--
-- TOC entry 3649 (class 2606 OID 17820)
-- Name: tb_interacciones tb_interacciones_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_interacciones
    ADD CONSTRAINT tb_interacciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3651 (class 2606 OID 17822)
-- Name: tb_periodo_programa tb_periodo_programa_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_periodo_programa
    ADD CONSTRAINT tb_periodo_programa_pkey PRIMARY KEY (id);


--
-- TOC entry 3655 (class 2606 OID 17824)
-- Name: tb_periodos_inscripcion tb_periodos_inscripcion_codigo_key; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_periodos_inscripcion
    ADD CONSTRAINT tb_periodos_inscripcion_codigo_key UNIQUE (codigo);


--
-- TOC entry 3657 (class 2606 OID 17826)
-- Name: tb_periodos_inscripcion tb_periodos_inscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_periodos_inscripcion
    ADD CONSTRAINT tb_periodos_inscripcion_pkey PRIMARY KEY (id);


--
-- TOC entry 3659 (class 2606 OID 17828)
-- Name: tb_precios_convenio_programa tb_precios_convenio_programa_convenio_id_programa_id_key; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_precios_convenio_programa
    ADD CONSTRAINT tb_precios_convenio_programa_convenio_id_programa_id_key UNIQUE (convenio_id, programa_id);


--
-- TOC entry 3661 (class 2606 OID 17830)
-- Name: tb_precios_convenio_programa tb_precios_convenio_programa_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_precios_convenio_programa
    ADD CONSTRAINT tb_precios_convenio_programa_pkey PRIMARY KEY (id);


--
-- TOC entry 3663 (class 2606 OID 17832)
-- Name: tb_precios_programa tb_precios_programa_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_precios_programa
    ADD CONSTRAINT tb_precios_programa_pkey PRIMARY KEY (id);


--
-- TOC entry 3665 (class 2606 OID 17834)
-- Name: tb_programas tb_programas_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_programas
    ADD CONSTRAINT tb_programas_pkey PRIMARY KEY (id);


--
-- TOC entry 3667 (class 2606 OID 17836)
-- Name: tbcitas tbcitas_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tbcitas
    ADD CONSTRAINT tbcitas_pkey PRIMARY KEY (id);


--
-- TOC entry 3653 (class 2606 OID 17838)
-- Name: tb_periodo_programa uq_periodo_programa; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_periodo_programa
    ADD CONSTRAINT uq_periodo_programa UNIQUE (periodo_id, programa_id);


--
-- TOC entry 3669 (class 2606 OID 17840)
-- Name: userpermissions userpermissions_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.userpermissions
    ADD CONSTRAINT userpermissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3671 (class 2606 OID 17842)
-- Name: userroles userroles_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.userroles
    ADD CONSTRAINT userroles_pkey PRIMARY KEY (id);


--
-- TOC entry 3673 (class 2606 OID 17844)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3675 (class 2606 OID 17846)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3677 (class 2606 OID 17848)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3552 (class 1259 OID 17849)
-- Name: advisor_commission_rates_user_id_index; Type: INDEX; Schema: public; Owner: asm_prod_user
--

CREATE INDEX advisor_commission_rates_user_id_index ON public.advisor_commission_rates USING btree (user_id);


--
-- TOC entry 3565 (class 1259 OID 17850)
-- Name: commissions_config_id_index; Type: INDEX; Schema: public; Owner: asm_prod_user
--

CREATE INDEX commissions_config_id_index ON public.commissions USING btree (config_id);


--
-- TOC entry 3568 (class 1259 OID 17851)
-- Name: commissions_user_id_index; Type: INDEX; Schema: public; Owner: asm_prod_user
--

CREATE INDEX commissions_user_id_index ON public.commissions USING btree (user_id);


--
-- TOC entry 3573 (class 1259 OID 17852)
-- Name: courses_area_index; Type: INDEX; Schema: public; Owner: asm_prod_user
--

CREATE INDEX courses_area_index ON public.courses USING btree (area);


--
-- TOC entry 3576 (class 1259 OID 17853)
-- Name: courses_end_date_index; Type: INDEX; Schema: public; Owner: asm_prod_user
--

CREATE INDEX courses_end_date_index ON public.courses USING btree (end_date);


--
-- TOC entry 3579 (class 1259 OID 17854)
-- Name: courses_start_date_index; Type: INDEX; Schema: public; Owner: asm_prod_user
--

CREATE INDEX courses_start_date_index ON public.courses USING btree (start_date);


--
-- TOC entry 3580 (class 1259 OID 17855)
-- Name: courses_status_index; Type: INDEX; Schema: public; Owner: asm_prod_user
--

CREATE INDEX courses_status_index ON public.courses USING btree (status);


--
-- TOC entry 3571 (class 1259 OID 17856)
-- Name: idx_contactos_env_prosp; Type: INDEX; Schema: public; Owner: asm_prod_user
--

CREATE INDEX idx_contactos_env_prosp ON public.contactos_enviados USING btree (prospecto_id);


--
-- TOC entry 3629 (class 1259 OID 17857)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: asm_prod_user
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3572 (class 1259 OID 17858)
-- Name: ux_contactos_env_prosp_canal_dia; Type: INDEX; Schema: public; Owner: asm_prod_user
--

CREATE UNIQUE INDEX ux_contactos_env_prosp_canal_dia ON public.contactos_enviados USING btree (prospecto_id, canal, date_trunc('day'::text, fecha_envio));


--
-- TOC entry 3678 (class 2606 OID 17859)
-- Name: advisor_commission_rates advisor_commission_rates_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.advisor_commission_rates
    ADD CONSTRAINT advisor_commission_rates_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3679 (class 2606 OID 17864)
-- Name: approval_stages approval_stages_flow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.approval_stages
    ADD CONSTRAINT approval_stages_flow_id_fkey FOREIGN KEY (flow_id) REFERENCES public.approval_flows(id) ON DELETE CASCADE;


--
-- TOC entry 3680 (class 2606 OID 17869)
-- Name: auditlogs auditlogs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.auditlogs
    ADD CONSTRAINT auditlogs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3681 (class 2606 OID 17874)
-- Name: column_configurations column_configurations_id_tipo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.column_configurations
    ADD CONSTRAINT column_configurations_id_tipo_foreign FOREIGN KEY (id_tipo) REFERENCES public.nom(id_tipo) ON DELETE CASCADE;


--
-- TOC entry 3682 (class 2606 OID 17879)
-- Name: commissions commissions_config_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.commissions
    ADD CONSTRAINT commissions_config_id_foreign FOREIGN KEY (config_id) REFERENCES public.commission_configs(id) ON DELETE SET NULL;


--
-- TOC entry 3683 (class 2606 OID 17884)
-- Name: commissions commissions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.commissions
    ADD CONSTRAINT commissions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3684 (class 2606 OID 17889)
-- Name: contactos_enviados contactos_enviados_prospecto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.contactos_enviados
    ADD CONSTRAINT contactos_enviados_prospecto_id_fkey FOREIGN KEY (prospecto_id) REFERENCES public.prospectos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3685 (class 2606 OID 17894)
-- Name: courses courses_facilitator_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_facilitator_id_foreign FOREIGN KEY (facilitator_id) REFERENCES public.users(id);


--
-- TOC entry 3686 (class 2606 OID 17899)
-- Name: cuotas_programa_estudiante cuotas_programa_estudiante_estudiante_programa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.cuotas_programa_estudiante
    ADD CONSTRAINT cuotas_programa_estudiante_estudiante_programa_id_fkey FOREIGN KEY (estudiante_programa_id) REFERENCES public.estudiante_programa(id) ON DELETE CASCADE;


--
-- TOC entry 3687 (class 2606 OID 17904)
-- Name: curso_prospecto curso_prospecto_course_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.curso_prospecto
    ADD CONSTRAINT curso_prospecto_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 3688 (class 2606 OID 17909)
-- Name: curso_prospecto curso_prospecto_prospecto_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.curso_prospecto
    ADD CONSTRAINT curso_prospecto_prospecto_id_foreign FOREIGN KEY (prospecto_id) REFERENCES public.prospectos(id) ON DELETE CASCADE;


--
-- TOC entry 3689 (class 2606 OID 17914)
-- Name: departamentos departamentos_pais_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pais_id_foreign FOREIGN KEY (pais_id) REFERENCES public.paises(id) ON DELETE CASCADE;


--
-- TOC entry 3690 (class 2606 OID 17919)
-- Name: duplicate_records duplicate_records_duplicate_prospect_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.duplicate_records
    ADD CONSTRAINT duplicate_records_duplicate_prospect_id_foreign FOREIGN KEY (duplicate_prospect_id) REFERENCES public.prospectos(id) ON DELETE CASCADE;


--
-- TOC entry 3691 (class 2606 OID 17924)
-- Name: duplicate_records duplicate_records_original_prospect_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.duplicate_records
    ADD CONSTRAINT duplicate_records_original_prospect_id_foreign FOREIGN KEY (original_prospect_id) REFERENCES public.prospectos(id) ON DELETE CASCADE;


--
-- TOC entry 3692 (class 2606 OID 17929)
-- Name: estudiante_programa estudiante_programa_convenio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.estudiante_programa
    ADD CONSTRAINT estudiante_programa_convenio_id_fkey FOREIGN KEY (convenio_id) REFERENCES public.tb_convenio(id);


--
-- TOC entry 3693 (class 2606 OID 17934)
-- Name: estudiante_programa estudiante_programa_programa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.estudiante_programa
    ADD CONSTRAINT estudiante_programa_programa_id_fkey FOREIGN KEY (programa_id) REFERENCES public.tb_programas(id);


--
-- TOC entry 3694 (class 2606 OID 17939)
-- Name: estudiante_programa estudiante_programa_prospecto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.estudiante_programa
    ADD CONSTRAINT estudiante_programa_prospecto_id_fkey FOREIGN KEY (prospecto_id) REFERENCES public.prospectos(id);


--
-- TOC entry 3708 (class 2606 OID 17944)
-- Name: tb_interacciones fk_interacciones_actividades; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_interacciones
    ADD CONSTRAINT fk_interacciones_actividades FOREIGN KEY (id_actividades) REFERENCES public.tb_actividades(id) ON DELETE CASCADE;


--
-- TOC entry 3709 (class 2606 OID 17949)
-- Name: tb_periodo_programa fk_pp_periodo; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_periodo_programa
    ADD CONSTRAINT fk_pp_periodo FOREIGN KEY (periodo_id) REFERENCES public.tb_periodos_inscripcion(id) ON DELETE CASCADE;


--
-- TOC entry 3710 (class 2606 OID 17954)
-- Name: tb_periodo_programa fk_pp_programa; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_periodo_programa
    ADD CONSTRAINT fk_pp_programa FOREIGN KEY (programa_id) REFERENCES public.tb_programas(id) ON DELETE CASCADE;


--
-- TOC entry 3695 (class 2606 OID 17959)
-- Name: flow_program flow_program_flow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.flow_program
    ADD CONSTRAINT flow_program_flow_id_fkey FOREIGN KEY (flow_id) REFERENCES public.approval_flows(id) ON DELETE CASCADE;


--
-- TOC entry 3696 (class 2606 OID 17964)
-- Name: flow_program flow_program_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.flow_program
    ADD CONSTRAINT flow_program_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.tb_programas(id) ON DELETE CASCADE;


--
-- TOC entry 3697 (class 2606 OID 17969)
-- Name: groupmemberships groupmemberships_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.groupmemberships
    ADD CONSTRAINT groupmemberships_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 3698 (class 2606 OID 17974)
-- Name: groups groups_parent_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_parent_group_id_fkey FOREIGN KEY (parent_group_id) REFERENCES public.groups(id);


--
-- TOC entry 3699 (class 2606 OID 17979)
-- Name: kardex_pagos kardex_pagos_cuota_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.kardex_pagos
    ADD CONSTRAINT kardex_pagos_cuota_id_fkey FOREIGN KEY (cuota_id) REFERENCES public.cuotas_programa_estudiante(id);


--
-- TOC entry 3700 (class 2606 OID 17984)
-- Name: kardex_pagos kardex_pagos_estudiante_programa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.kardex_pagos
    ADD CONSTRAINT kardex_pagos_estudiante_programa_id_fkey FOREIGN KEY (estudiante_programa_id) REFERENCES public.estudiante_programa(id);


--
-- TOC entry 3701 (class 2606 OID 17989)
-- Name: mfaconfigurations mfaconfigurations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.mfaconfigurations
    ADD CONSTRAINT mfaconfigurations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3702 (class 2606 OID 17994)
-- Name: moduleviews moduleviews_module_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.moduleviews
    ADD CONSTRAINT moduleviews_module_id_fkey FOREIGN KEY (module_id) REFERENCES public.modules(id);


--
-- TOC entry 3703 (class 2606 OID 17999)
-- Name: municipios municipios_departamento_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT municipios_departamento_id_foreign FOREIGN KEY (departamento_id) REFERENCES public.departamentos(id) ON DELETE CASCADE;


--
-- TOC entry 3704 (class 2606 OID 18004)
-- Name: prospectos_documentos prospectos_documentos_prospecto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.prospectos_documentos
    ADD CONSTRAINT prospectos_documentos_prospecto_id_fkey FOREIGN KEY (prospecto_id) REFERENCES public.prospectos(id);


--
-- TOC entry 3705 (class 2606 OID 18009)
-- Name: rolepermissions rolepermissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.rolepermissions
    ADD CONSTRAINT rolepermissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- TOC entry 3706 (class 2606 OID 18014)
-- Name: rolepermissions rolepermissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.rolepermissions
    ADD CONSTRAINT rolepermissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3707 (class 2606 OID 18019)
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3711 (class 2606 OID 18024)
-- Name: tb_precios_convenio_programa tb_precios_convenio_programa_convenio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_precios_convenio_programa
    ADD CONSTRAINT tb_precios_convenio_programa_convenio_id_fkey FOREIGN KEY (convenio_id) REFERENCES public.tb_convenio(id) ON DELETE CASCADE;


--
-- TOC entry 3712 (class 2606 OID 18029)
-- Name: tb_precios_convenio_programa tb_precios_convenio_programa_programa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_precios_convenio_programa
    ADD CONSTRAINT tb_precios_convenio_programa_programa_id_fkey FOREIGN KEY (programa_id) REFERENCES public.tb_programas(id) ON DELETE CASCADE;


--
-- TOC entry 3713 (class 2606 OID 18034)
-- Name: tb_precios_programa tb_precios_programa_programa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.tb_precios_programa
    ADD CONSTRAINT tb_precios_programa_programa_id_fkey FOREIGN KEY (programa_id) REFERENCES public.tb_programas(id) ON DELETE CASCADE;


--
-- TOC entry 3714 (class 2606 OID 18039)
-- Name: userroles userroles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.userroles
    ADD CONSTRAINT userroles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3715 (class 2606 OID 18044)
-- Name: userroles userroles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: asm_prod_user
--

ALTER TABLE ONLY public.userroles
    ADD CONSTRAINT userroles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3954 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT ALL ON SCHEMA public TO asm_prod_user;


-- Completed on 2025-06-11 13:21:30

--
-- PostgreSQL database dump complete
--

