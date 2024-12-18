PGDMP                  
    |            hoteldb    17.2    17.2 K               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16387    hoteldb    DATABASE     }   CREATE DATABASE hoteldb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE hoteldb;
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16713    acomodaciones    TABLE     �   CREATE TABLE public.acomodaciones (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 !   DROP TABLE public.acomodaciones;
       public         heap r       postgres    false    4            �            1259    16712    acomodaciones_id_seq    SEQUENCE     }   CREATE SEQUENCE public.acomodaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.acomodaciones_id_seq;
       public               postgres    false    231    4                       0    0    acomodaciones_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.acomodaciones_id_seq OWNED BY public.acomodaciones.id;
          public               postgres    false    230            �            1259    16669    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap r       postgres    false    4            �            1259    16668    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public               postgres    false    4    223                       0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public               postgres    false    222            �            1259    16722    habitaciones    TABLE       CREATE TABLE public.habitaciones (
    id bigint NOT NULL,
    hotel_id bigint NOT NULL,
    tipo_id bigint NOT NULL,
    acomodacion_id bigint NOT NULL,
    numero integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE public.habitaciones;
       public         heap r       postgres    false    4            �            1259    16721    habitaciones_id_seq    SEQUENCE     |   CREATE SEQUENCE public.habitaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.habitaciones_id_seq;
       public               postgres    false    233    4                       0    0    habitaciones_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.habitaciones_id_seq OWNED BY public.habitaciones.id;
          public               postgres    false    232            �            1259    16695    hoteles    TABLE     l  CREATE TABLE public.hoteles (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(100) NOT NULL,
    ciudad character varying(100) NOT NULL,
    nit character varying(20) NOT NULL,
    num_habitaciones integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.hoteles;
       public         heap r       postgres    false    4            �            1259    16694    hoteles_id_seq    SEQUENCE     w   CREATE SEQUENCE public.hoteles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.hoteles_id_seq;
       public               postgres    false    227    4                       0    0    hoteles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.hoteles_id_seq OWNED BY public.hoteles.id;
          public               postgres    false    226            �            1259    16389 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap r       postgres    false    4            �            1259    16388    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public               postgres    false    4    218                        0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public               postgres    false    217            �            1259    16661    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 #   DROP TABLE public.password_resets;
       public         heap r       postgres    false    4            �            1259    16681    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
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
 *   DROP TABLE public.personal_access_tokens;
       public         heap r       postgres    false    4            �            1259    16680    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public               postgres    false    225    4            !           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public               postgres    false    224            �            1259    16704    tipos_habitacion    TABLE     �   CREATE TABLE public.tipos_habitacion (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 $   DROP TABLE public.tipos_habitacion;
       public         heap r       postgres    false    4            �            1259    16703    tipos_habitacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipos_habitacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tipos_habitacion_id_seq;
       public               postgres    false    229    4            "           0    0    tipos_habitacion_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tipos_habitacion_id_seq OWNED BY public.tipos_habitacion.id;
          public               postgres    false    228            �            1259    16651    users    TABLE     x  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap r       postgres    false    4            �            1259    16650    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    220    4            #           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    219            O           2604    16716    acomodaciones id    DEFAULT     t   ALTER TABLE ONLY public.acomodaciones ALTER COLUMN id SET DEFAULT nextval('public.acomodaciones_id_seq'::regclass);
 ?   ALTER TABLE public.acomodaciones ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    231    230    231            J           2604    16672    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    223    223            P           2604    16725    habitaciones id    DEFAULT     r   ALTER TABLE ONLY public.habitaciones ALTER COLUMN id SET DEFAULT nextval('public.habitaciones_id_seq'::regclass);
 >   ALTER TABLE public.habitaciones ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    233    233            M           2604    16698 
   hoteles id    DEFAULT     h   ALTER TABLE ONLY public.hoteles ALTER COLUMN id SET DEFAULT nextval('public.hoteles_id_seq'::regclass);
 9   ALTER TABLE public.hoteles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    227    226    227            H           2604    16392    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            L           2604    16684    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    225    225            N           2604    16707    tipos_habitacion id    DEFAULT     z   ALTER TABLE ONLY public.tipos_habitacion ALTER COLUMN id SET DEFAULT nextval('public.tipos_habitacion_id_seq'::regclass);
 B   ALTER TABLE public.tipos_habitacion ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    228    229            I           2604    16654    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220                      0    16713    acomodaciones 
   TABLE DATA           K   COPY public.acomodaciones (id, nombre, created_at, updated_at) FROM stdin;
    public               postgres    false    231   �[       
          0    16669    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public               postgres    false    223   )\                 0    16722    habitaciones 
   TABLE DATA           m   COPY public.habitaciones (id, hotel_id, tipo_id, acomodacion_id, numero, created_at, updated_at) FROM stdin;
    public               postgres    false    233   F\                 0    16695    hoteles 
   TABLE DATA           o   COPY public.hoteles (id, nombre, direccion, ciudad, nit, num_habitaciones, created_at, updated_at) FROM stdin;
    public               postgres    false    227   �\                 0    16389 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public               postgres    false    218   h]                 0    16661    password_resets 
   TABLE DATA           C   COPY public.password_resets (email, token, created_at) FROM stdin;
    public               postgres    false    221   S^                 0    16681    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public               postgres    false    225   p^                 0    16704    tipos_habitacion 
   TABLE DATA           N   COPY public.tipos_habitacion (id, nombre, created_at, updated_at) FROM stdin;
    public               postgres    false    229   �^                 0    16651    users 
   TABLE DATA           u   COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
    public               postgres    false    220   �^       $           0    0    acomodaciones_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.acomodaciones_id_seq', 4, true);
          public               postgres    false    230            %           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public               postgres    false    222            &           0    0    habitaciones_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.habitaciones_id_seq', 10, true);
          public               postgres    false    232            '           0    0    hoteles_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.hoteles_id_seq', 2, true);
          public               postgres    false    226            (           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 34, true);
          public               postgres    false    217            )           0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);
          public               postgres    false    224            *           0    0    tipos_habitacion_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tipos_habitacion_id_seq', 4, true);
          public               postgres    false    228            +           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public               postgres    false    219            k           2606    16720 )   acomodaciones acomodaciones_nombre_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.acomodaciones
    ADD CONSTRAINT acomodaciones_nombre_unique UNIQUE (nombre);
 S   ALTER TABLE ONLY public.acomodaciones DROP CONSTRAINT acomodaciones_nombre_unique;
       public                 postgres    false    231            m           2606    16718     acomodaciones acomodaciones_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.acomodaciones
    ADD CONSTRAINT acomodaciones_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.acomodaciones DROP CONSTRAINT acomodaciones_pkey;
       public                 postgres    false    231            Z           2606    16677    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public                 postgres    false    223            \           2606    16679 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public                 postgres    false    223            o           2606    16727    habitaciones habitaciones_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT habitaciones_pkey;
       public                 postgres    false    233            c           2606    16702    hoteles hoteles_nit_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_nit_unique UNIQUE (nit);
 D   ALTER TABLE ONLY public.hoteles DROP CONSTRAINT hoteles_nit_unique;
       public                 postgres    false    227            e           2606    16700    hoteles hoteles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.hoteles DROP CONSTRAINT hoteles_pkey;
       public                 postgres    false    227            R           2606    16394    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public                 postgres    false    218            X           2606    16667 $   password_resets password_resets_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (email);
 N   ALTER TABLE ONLY public.password_resets DROP CONSTRAINT password_resets_pkey;
       public                 postgres    false    221            ^           2606    16688 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public                 postgres    false    225            `           2606    16691 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public                 postgres    false    225            g           2606    16711 /   tipos_habitacion tipos_habitacion_nombre_unique 
   CONSTRAINT     l   ALTER TABLE ONLY public.tipos_habitacion
    ADD CONSTRAINT tipos_habitacion_nombre_unique UNIQUE (nombre);
 Y   ALTER TABLE ONLY public.tipos_habitacion DROP CONSTRAINT tipos_habitacion_nombre_unique;
       public                 postgres    false    229            i           2606    16709 &   tipos_habitacion tipos_habitacion_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tipos_habitacion
    ADD CONSTRAINT tipos_habitacion_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.tipos_habitacion DROP CONSTRAINT tipos_habitacion_pkey;
       public                 postgres    false    229            T           2606    16660    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public                 postgres    false    220            V           2606    16658    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    220            a           1259    16689 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public                 postgres    false    225    225            p           2606    16738 0   habitaciones habitaciones_acomodacion_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_acomodacion_id_foreign FOREIGN KEY (acomodacion_id) REFERENCES public.acomodaciones(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT habitaciones_acomodacion_id_foreign;
       public               postgres    false    4717    233    231            q           2606    16728 *   habitaciones habitaciones_hotel_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_hotel_id_foreign FOREIGN KEY (hotel_id) REFERENCES public.hoteles(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT habitaciones_hotel_id_foreign;
       public               postgres    false    227    233    4709            r           2606    16733 )   habitaciones habitaciones_tipo_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_tipo_id_foreign FOREIGN KEY (tipo_id) REFERENCES public.tipos_habitacion(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT habitaciones_tipo_id_foreign;
       public               postgres    false    4713    233    229               8   x�3�N�K���I��".#N����T(Ϙ3�(� �5�t.=�0��!���� ���      
      x������ � �         t   x�m��� �V�@n� \K���8x�x൲ge��iJ*y�}�<U�1�?n٨w\��r!/��=m�Gմ��G,�P�0ԫז*ؘ��-�{ܜ5b}8zYrw��p� yW=�         �   x�m̿
�0�����)�3�[HC;Xұ��� ��ߩ�������ZK~���a��+�j��䶭�J�,��Ɗ�AG�l�j"��$#�Ƴ���>-��m�(òLح�>!�2�0~U�9�C��$1�;k�}QJ} �l.K         �   x�m�Mn�0��u|��3~|�J#��b�]��5M�	V�#�g{A�� �5Q���U\��Q���u�\�]��z����G?g=�=���q�>�vG���~( 6	@�Y�?;�	��%)l�N��B�����������[��'su�$��荾����?μ����9z	��/�3Z̥5U�����2�FX��ed
TS�bX	��B4�<�w�ߔR��p            x������ � �            x������ � �         /   x�3�t-.9�0/%��3����8�J�2�a\c���̒T(/F��� �	`            x������ � �     