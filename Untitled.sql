PGDMP                         {            nest-news-blog    15.2    15.2     #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    16398    nest-news-blog    DATABASE     r   CREATE DATABASE "nest-news-blog" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
     DROP DATABASE "nest-news-blog";
                postgres    false            �            1259    16502    comments    TABLE     	  CREATE TABLE public.comments (
    id integer NOT NULL,
    message text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "userId" integer,
    "newsId" integer
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    16501    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          postgres    false    215            '           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public          postgres    false    214            �            1259    16524    news    TABLE       CREATE TABLE public.news (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    cover text,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "userId" integer
);
    DROP TABLE public.news;
       public         heap    postgres    false            �            1259    16523    news_id_seq    SEQUENCE     �   CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.news_id_seq;
       public          postgres    false    219            (           0    0    news_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;
          public          postgres    false    218            �            1259    16513    users    TABLE     ,  CREATE TABLE public.users (
    id integer NOT NULL,
    "firstName" text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    roles text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16512    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217            )           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            {           2604    16505    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    16527    news id    DEFAULT     b   ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);
 6   ALTER TABLE public.news ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            ~           2604    16516    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217                      0    16502    comments 
   TABLE DATA           ]   COPY public.comments (id, message, "createdAt", "updatedAt", "userId", "newsId") FROM stdin;
    public          postgres    false    215   N                   0    16524    news 
   TABLE DATA           a   COPY public.news (id, title, description, cover, "createdAt", "updatedAt", "userId") FROM stdin;
    public          postgres    false    219   Y!                 0    16513    users 
   TABLE DATA           b   COPY public.users (id, "firstName", email, password, roles, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    217   b"       *           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 41, true);
          public          postgres    false    214            +           0    0    news_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.news_id_seq', 3, true);
          public          postgres    false    218            ,           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    216            �           2606    16533 #   news PK_39a43dfcb6007180f04aff2357e 
   CONSTRAINT     c   ALTER TABLE ONLY public.news
    ADD CONSTRAINT "PK_39a43dfcb6007180f04aff2357e" PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.news DROP CONSTRAINT "PK_39a43dfcb6007180f04aff2357e";
       public            postgres    false    219            �           2606    16511 '   comments PK_8bf68bc960f2b69e818bdb90dcb 
   CONSTRAINT     g   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "PK_8bf68bc960f2b69e818bdb90dcb" PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.comments DROP CONSTRAINT "PK_8bf68bc960f2b69e818bdb90dcb";
       public            postgres    false    215            �           2606    16522 $   users PK_a3ffb1c0c8416b9fc6f907b7433 
   CONSTRAINT     d   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433";
       public            postgres    false    217            �           2606    16534 '   comments FK_7e8d7c49f218ebb14314fdb3749    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "FK_7e8d7c49f218ebb14314fdb3749" FOREIGN KEY ("userId") REFERENCES public.users(id);
 S   ALTER TABLE ONLY public.comments DROP CONSTRAINT "FK_7e8d7c49f218ebb14314fdb3749";
       public          postgres    false    215    3463    217            �           2606    16539 '   comments FK_86fb3a1330e43f9767b3b6df238    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "FK_86fb3a1330e43f9767b3b6df238" FOREIGN KEY ("newsId") REFERENCES public.news(id);
 S   ALTER TABLE ONLY public.comments DROP CONSTRAINT "FK_86fb3a1330e43f9767b3b6df238";
       public          postgres    false    215    3465    219            �           2606    16544 #   news FK_9198b86c4c22bf6852c43f3b44e    FK CONSTRAINT     �   ALTER TABLE ONLY public.news
    ADD CONSTRAINT "FK_9198b86c4c22bf6852c43f3b44e" FOREIGN KEY ("userId") REFERENCES public.users(id);
 O   ALTER TABLE ONLY public.news DROP CONSTRAINT "FK_9198b86c4c22bf6852c43f3b44e";
       public          postgres    false    219    3463    217               �   x�}�;N�@E��*f����i#X%M���8�)��,�"���� ��^w�=�h��q_�]���<[�s1�7P�[��!�w^�ո�6�f�7���������u:N���t�t,jI��Ѭ%s��%w���;�9���OϻT�Z)�����2&\�y]2�ٗ8[䤔�u�E8� �H�8�:�j�&�|����F烈oQ��!?!"]G�$��(q	�l�%����"%�QY�������/w          �   x�}N1N�0��W�1���خtT�]�K�	��-��h�Bt"����͏�8�H'�f�3��Q�n�-o����W]�֛m���ۅ^]1�����q���A[�3��� �����Y�\^��5!hFe�pRJ��M����=?�@����B�B0z��D{�>P����4�+'���Ȍ�E����<v=+���}*�)RmQ�ΡO�&_#x�X�i�Kd����OR�+FU j��a�I�� �`{y         %  x�}��n�@ E��W�p[�'3�Jt�X)��
I7�jj���]41&mrwgqϽX����nj=��>����A)W�Z%눻Y�d��G�.�Y�'�+��0l�}�Wȍ����3b�o����H&t�`��=B\",!չ��kX�.�A��y2�򺹳��U�-��aAp�K�uh�1,�ɹ3����ʳ_����G�CT2,1�H0��h��W�U�B�r�j1��u�0��:k����?�֟�iNS'9CqAVd��3l@s�}�ۇ��x�$�:�dh����k���wp>     