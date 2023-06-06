--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-07 01:30:39 +08

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

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16841)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16840)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 217 (class 1259 OID 16848)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16847)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 219 (class 1259 OID 16855)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16854)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 221 (class 1259 OID 16862)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16861)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 223 (class 1259 OID 16871)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16881)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16880)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- TOC entry 222 (class 1259 OID 16870)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 3464 (class 2604 OID 16844)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3465 (class 2604 OID 16851)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3466 (class 2604 OID 16858)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3467 (class 2604 OID 16865)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3468 (class 2604 OID 16874)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3469 (class 2604 OID 16884)
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- TOC entry 3634 (class 0 OID 16841)
-- Dependencies: 215
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Мебель');
INSERT INTO public.category (id, name) VALUES (2, 'Одежда');
INSERT INTO public.category (id, name) VALUES (3, 'Бытовая техника');


--
-- TOC entry 3636 (class 0 OID 16848)
-- Dependencies: 217
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, '368ddf69-6479-4f2d-9c53-8309eb4d4aab.1.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, '160c7899-c5ca-4c96-bc4d-4b1ba453d4c4.4.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, '7589ea67-0d47-45f6-881c-d6fd9d5ab620.2.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, '1f1cfb1f-e10e-4d78-9c21-4b688f8ec438.5.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, '0bcffaf7-deb3-471c-966a-3f4ca2ba4ee6.3.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (6, '774ebcc3-1ce8-4cb1-b4a5-2be28dec6f57.1.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '41295469-2b63-44f2-a5b3-cccc81d2e0a4.4.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, 'c54cd317-0895-42bf-961c-5b1d5e89e235.2.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, '41973cbc-f59c-45a1-ae93-bf2bf8af0fe0.5.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, 'bf64f8eb-9a53-45a6-ba13-70e7d18dc8a4.3.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, 'c6f203b7-b372-4167-8e11-078277f80e12.1.jpeg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, '82b04619-e795-4cb1-be43-eb8d90e75b5f.4.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, 'b6800db3-1970-4203-8b97-3a3c6b20bef1.2.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, '75c9dc16-2911-4308-8586-2852f00f87e1.5.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, '70ee2b8a-0ae3-477f-8e2d-612b2d16e639.3.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, 'a98a48b6-735b-4ca6-87e9-fb57e8625e8f.1.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, 'b3f1f39c-91cf-4e7b-af60-009a71642aeb.4.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, '1edefddf-0b5f-435e-b433-48008b6571ab.2.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, 'a1e98eb5-e9c6-468d-9444-ae0b2122dc4e.5.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, 'c0c7ca1c-3f14-419b-8374-bac3c67123fe.3.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, '23730297-c293-40df-8bde-48f16fafe1f6.1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, 'e0be3957-8df4-4121-aefc-d409fe9196df.4.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '3608bc93-f0ed-412d-931d-333316b0a52f.2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '00c7adff-b71d-44c8-9a51-263fca2b805b.5.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, 'd4ec6695-a680-4622-87e4-2559ca61abcd.3.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, '54aeb669-bb31-4d35-a2d6-37f896dd4fa9.1 (1).jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '7d5795a3-d6cb-4872-9506-b2686e3232df.4.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, 'a4f32b34-5d3a-481e-ac25-2c5193ec7a3a.2.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '35f12f17-8083-4c5b-b1ce-5ddea48e4e4e.5.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '49b3ec9e-8a83-45d9-9571-3f7340360275.3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, 'd7265767-2981-45d9-bf15-369e60ab5cbd.1 .jpeg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, '03a47dc9-67b1-4e4f-9b04-c7beb51dfac0.4.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, 'c611e06c-6f03-4d75-827e-0ebc78b2b4aa.2.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, '0cff36a3-92b8-423b-8d54-bff23cb95e20.5.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, 'd133813a-faa4-45fe-ae0d-75cfd3b245e8.3.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, '38c1333f-8493-46b2-bf07-1c856affff76.1.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, '725b0cf7-d150-4188-b203-8cacd5c29aef.4.jpeg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '44f91361-d063-47e5-9188-721b2dfadcbc.2.jpeg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, '2d2ee418-c9bb-4971-9b2c-eebedb415c2d.5.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, '4e1db2fb-ad79-4d02-b1c1-589d97b0514d.3.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, 'a91d2d1c-9034-4729-848f-7b6eed0f6014.1.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, 'f8490358-f983-4f9c-852e-e3a3ce87a614.4.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, 'a5f29fe0-2243-406b-95e1-0a8e5e1d5e3c.2.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, '43b5f014-078d-4351-8eac-267a7046b293.5.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, '19a33a4a-219f-43e6-9287-b9870cfc0ded.3.jpg', 9);


--
-- TOC entry 3638 (class 0 OID 16855)
-- Dependencies: 219
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2023-06-06 16:23:25.620268', '3eb9941f-839b-4ba0-8128-71f3f9067437', 11249, 1, 1, 6);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2023-06-06 16:23:44.368456', '4d7c44d1-3476-4dbc-b9a3-e3f1694a6612', 338, 1, 1, 5);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2023-06-06 16:23:44.380305', '4d7c44d1-3476-4dbc-b9a3-e3f1694a6612', 3000, 1, 1, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2023-06-06 18:31:31.161834', '30ae6680-e18c-4368-965d-00cf6bc06c94', 3000, 1, 2, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (5, 1, '2023-06-06 18:31:31.189993', '30ae6680-e18c-4368-965d-00cf6bc06c94', 11249, 1, 2, 6);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (6, 1, '2023-06-07 00:33:01.050982', '0f5e8aa5-f965-4b4c-a64b-7ebddbcf7531', 2520, 1, 2, 2);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (7, 1, '2023-06-07 00:33:01.059627', '0f5e8aa5-f965-4b4c-a64b-7ebddbcf7531', 10999, 1, 2, 7);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (8, 1, '2023-06-07 00:48:42.583012', '91d01cc7-6ddd-4039-bf40-fc65da765f18', 17995, 1, 2, 8);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (9, 1, '2023-06-07 00:48:42.590505', '91d01cc7-6ddd-4039-bf40-fc65da765f18', 3000, 1, 2, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (10, 1, '2023-06-07 01:09:50.332649', '2015d965-44f8-4a7d-b19b-7c46dc7e8751', 1450, 1, 2, 4);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (11, 1, '2023-06-07 01:09:50.337989', '2015d965-44f8-4a7d-b19b-7c46dc7e8751', 10999, 1, 2, 7);


--
-- TOC entry 3640 (class 0 OID 16862)
-- Dependencies: 221
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (2, 'user1', '$2a$10$GUVB.VVVOjJBMMA/Apby6eEgJy9HtR73.ip7OlYy8U.w8olSJXa9G', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$SeKpQkuG/3jZDZVZ22s53u/sneDg/bRqJ6JK32FbOFZ/.bNl8YVwe', 'ROLE_ADMIN');


--
-- TOC entry 3642 (class 0 OID 16871)
-- Dependencies: 223
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (4, '2023-06-06 16:18:36.830636', 'Джинсы молодежные на лето и осень - незаменимая вещь современного модного базового мужского гардероба. Удобные и функциональные - эти штаны брюки используются в качестве рабочей одежды, для дома, для спорта, для бега. Разнообразие моделей джинсовых брюк широкое: трубы, бананы, бойфренды, джоггеры, slim, бриджи, мотоджинсы. Особой популярностью пользуются прямые и зауженные к низу классические джинсы со средней и высокой посадкой. В коллекции бренда EREMES представлены синие голубые джинсы для мужчин высокого роста ( до 190 см), отлично сочетаются с рубашкой, толстовкой, худи, пиджаком и водолазкой. Модель штанов классического прямого кроя, застежка молния и шарнирная пуговица, накладные карманы сзади, штаны не зауженные, без флиса. Идеальная посадка обеспечена за счет точных лекал с фабрик Турции. Штаны подойдут обладателям больших размеров и высоким мальчикам подросткам. В них удобно водить автомобиль и мотоцикл. Мужские брюки комфортно носить в летний период. Подарок любимому другу папе. Турецкие джинсы мужские прямые широкие штаны классика брюки для невысоких мужская одежда для мальчиков рваные американки брюки с карманами без утепления скинни осень зима casual слоучи момы из плотного денима skinny с потертостями спортивки оверсайз стрейч светлые узкие молодежные слим большие зимние потертые по бокам больших размеров летние брюки', 1450, 'EREMES', 'Eremes Джинсы мужские прямые классические', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (5, '2023-06-06 16:20:11.329146', 'Футболка мужская хлопок спортивная однотонная базовая модная свободная пляжная с коротким рукавом. Стильная хлопковая футболка классического кроя - это вещь унисекс, которая подойдет и мужчинам, и женщинам. СОСТАВ: ХЛОПОК 100% ПЛОТНОСТЬ 180 гр/мк в. Молодежная женская и мужская футболка выполнена из плотной хлопковой ткани и имеет круглый вырез горловины. Удлиненная футболка подходит для отдыха, туризма и занятий спортом: фитнеса, йоги, бега и тренировок в зале. В ней можно отправиться на прогулку в город. Базовая футболка вписывается в школьную форму и офисный стиль. Ее можно носить дома или надеть в школу и на работу в офис под пиджак. Трикотажная футболка оптимальна для носки летом. Она является базовой вещью и будет прекрасно сочетаться со всеми вещами в вашем гардеробе, в том числе в стиле оверсайз. Красивая футболка подойдет парням и девушкам любого роста - высоким и невысоким. Ее могут носить взрослые и подростки. В ассортименте большой выбор ярких цветов. Вы можете подарить ее на день рождения любимому мужу, маме, брату или папе. У нас есть акции и распродажи, вы можете купить наши товары в подарок со скидкой!', 338, 'UZcotton', 'UZcotton Футболка мужская хлопок спортивная однотонная базовая', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (2, NULL, 'Размеры (ШхГхВ): 60х25,6х75 смНаша обувница Джулия станет прекрасным решением для удобного хранения обуви в прихожей, создав комфорт и чистоту в Вашем доме. Основное преимущество данной модели - её компактные размеры, позволяющие сэкономить несколько квадратных метров пола прихожей даже небольшой квартиры, обувная полка подойдет для хранения мужской, женской и детской обуви. Благодаря классическому дизайну, универсальности и актуальным цветовым решениям этажерка для обуви отлично дополнит Ваш комплект мебели любого стиля. Обувница в прихожую или как ее еще называют, галошница оснащена изолированной полочкой под аксессуары, которая станет незаменимой для домашних мелочей, ключей, перчаток, шапок, шарфов или предметов по уходу за обувью. В закрытом состоянии используйте её, чтобы поставить сумочку или пакет, положить зонт. Обувница белая, как и другие цвета имеет три наклонные полки для обуви в прихожую общей вместимостью до 9 пар обуви. Обувница для обуви сделана из сертифицированных и высококачественных ЛДСП, поэтому она прослужит Вам не один год. Собрать полки для обуви легко в домашних условиях. К набору прилагается подробная инструкция по сборке. Габаритные размеры обувницы (ШхВхГ) 60х25,6х75 см. Так же предлагаем другие наши товары бренда Стендмебель: Вешалка Глория артикул 73452816, Обувница Дина артикул 73474145, Вешалка Грация-2 артикул 112396129', 2520, 'Стендмебель - фабрика мебели', 'Стендмебель Обувница Джулия, тумба для обуви', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (3, NULL, 'Размеры (ШхГхВ): 100х38,6х74,6 см Компьютерный стол Софи привлекает своей функциональностью, строгим дизайном и высоким уровнем прочности. Наш стол выполнен в трех цветах поэтому для него найдется место в любой комнате Вашего дома. Может использоваться как детский, компьютерный столик для учебы и отдыха или в кабинет и использовать его как рабочий стол. Вы можете расставить на него косметику и использовать как туалетный столик в спальню. В открытые полочки можно положить не только любимые книги и игрушки, но и различную мелочь для дома. Так же стол отлично впишется в любой офис и станет удобным рабочим местом для сотрудника. Модели обладают стандартной высотой, которая обеспечит вам и вашему ребенку комфортную посадку. Для стола используются сертифицированные, высококачественные ЛДСП, поэтому наша мебель прослужит вам не один год. К набору прилагается подробная инструкция по сборке', 3000, 'Стендмебель - фабрика мебели', 'Стендмебель Стол письменный Софи, компьютерный', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (6, '2023-06-06 16:22:17.490973', 'Мужская футбольная куртка для тренировок в прохладную погоду. Утепленная модель дополнена стегаными вставками на подкладке и рукавах. Застежка на молнию и глубокий прилегающий капюшон. Современный приталенный крой.', 11249, 'ВАЙЛДБЕРРИЗ', 'adidas Куртка', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (7, '2023-06-06 16:25:34.004817', '5 в 1: Планетарный миксер с 3-мя насадками, Блендер, Мясорубка. Технология SmartMIX - прибор автоматически подбирает оптимальную мощность работы для каждого вида и количества ингредиентов. Технология PROtect+ защита двигателя от перегрева.** Надёжная конструкция со стальными шестернями. Планетарное вращение насадок. Чаша из нержавеющей стали. Объем чаши 5 л. 6 скоростных режимов. Плавная регулировка скорости. Импульсивный режим. Венчик для взбивания. Насадка для смешивания. Крюк для замешивания теста. Крышка чаши для добавления ингредиентов. Мясорубка: 2 диска из нержавеющей стали (5 и 7 мм). Кувшин блендера из высокопрочного стекла объемом 1,5 л.Низкий уровень шума. Система безопасного включения. Защита двигателя от перегрева. Отсек для намотки сетевого шнура. Прорезиненные ножки. Мощность: 1100 Вт', 10999, 'ВАЙЛДБЕРРИЗ', 'Polaris Планетарный миксер / Кухонная машина PKM 1104, (POLARIS)', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (8, '2023-06-06 16:27:15.191301', 'Беспроводной ручной портативный пылесос отлично подойдет для уборки различных помещений. В комплекте присутствуют фильтр, вертикальный стакан или контейнер для воды, есть насадки, но набор идет без мешка. Присутствует 3 бака для воды. В одном вода очищается, в другом - хранится в чистом виде, а в третий - поступает грязная. Также есть функция самоочистки пылесоса. И сухая, и влажная уборка с ним станут намного проще и быстрее. Щетка имеет мощный аккумулятор и работает на батарейка. Компактный мобильный пылесос может использоваться как швабра. Моющий прибор хорошо подойдет для уборки шерсти с дивана, чистки ковров, для пыли и грязи, или просто для мытья полов. Мобильный аккумуляторный пылесос очень хороший помощник для дома', 17995, 'Официальный магазин Polaris', 'Redkey Вертикальный пылесос , моющий пылесос', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (9, '2023-06-06 16:28:23.078958', 'Новая стиральная машина ATLANT серии INTENSE EXPERT имеет уникальный дизайн, который прекрасно дополнит любой интерьер своим внешним видом. С помощью новых сенсорных технологий достаточно легкого касания для выбора функций и программ. Светодиодные индикаторы и сегментный дисплей машины размещены на панели управления под небольшим углом, что облегчает визуальное восприятие отображаемой информации о работе машины. Благодаря интеллектуальным программам она не только интуитивно понятна в управлении, но и обеспечивает превосходные результаты стирки при низком потреблении воды и электроэнергии. Кроме того, действует увеличенная гарантия 5 лет на двигатель', 33615, 'ВАЙЛДБЕРРИЗ', 'ATLANT Стиральная машина CMA-80 C 1214-01', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (1, NULL, 'Размеры (ШхГхВ): 75,2х43х75 см. Комод неотъемлемая часть мебели квартиры или дома. Комод деревянный Ксения станет надежным помощником в хранении вещей. Комод для хранения представлен в нескольких цветах: белый, крафт белый, серый, дуб сонома и бук, что позволит вписать в интерьер комнаты и сочетать с другой мебелью в доме. Комод для вещей идет в двух вариантах: с ручками и без них. Во втором варианте в комоде убраны ручки и удлинен фасад, за который и происходит открывание. Универсальность тумбы позволяет использовать ее, как детскую мебель в комнате вашего ребенка, в четырех больших ящиках поместятся игрушки и вещи. Поставьте его вместе с письменным столом Альянс арт. 100243145 в детской и он станет помощником в хранении учебников, тетрадей и канцелярии. В спальне он выступит как тумба для ТВ. А поставив в прихожей, комод Ксения будет сочетаться с обувницей Грация арт. 114272890 и настенной вешалкой Глория арт. 73452816. Мебельная фабрика «Стендмебель» использует только высококачественные материалы и фурнитуру, мы заботимся о наших покупателях и хотим, чтобы наша мебель прослужила Вам как можно дольше. Мы делаем все возможное, чтобы наша продукция доезжала даже в самые дальние уголки нашей страны целой и радовало Вас, для этого мы упаковываем нашу продукцию в картон, а по периметру укрепляем упаковку пенопластом. Для сборки Вам понадобится отвертка или шуроповерт, ключ шестигранник идет в комплекте. Гарантия: 12 месяцев', 39600, 'Стендмебель - фабрика мебели', 'Стендмебель Комод с ящиками Ксения СТМ для вещей', 'Коледино', 1);


--
-- TOC entry 3644 (class 0 OID 16881)
-- Dependencies: 225
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 45, true);


--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 11, true);


--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 2, true);


--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 15, true);


--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 9, true);


--
-- TOC entry 3472 (class 2606 OID 16846)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3474 (class 2606 OID 16853)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3476 (class 2606 OID 16860)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3478 (class 2606 OID 16869)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3484 (class 2606 OID 16886)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3480 (class 2606 OID 16879)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3482 (class 2606 OID 16888)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3486 (class 2606 OID 16894)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3488 (class 2606 OID 16904)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3487 (class 2606 OID 16899)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3485 (class 2606 OID 16889)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3489 (class 2606 OID 16914)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3490 (class 2606 OID 16909)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2023-06-07 01:30:39 +08

--
-- PostgreSQL database dump complete
--

