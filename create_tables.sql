--Скрипты для создания таблиц в соответствии со структурой
CREATE TABLE IF NOT EXISTS igr.nomenclature
(
    id integer NOT NULL DEFAULT nextval('nomenclature_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    quantity integer,
    price numeric(10,2),
    category_id integer NOT NULL,
    CONSTRAINT nomenclature_pkey PRIMARY KEY (id),
    CONSTRAINT category FOREIGN KEY (category_id)
        REFERENCES igr.category (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS igr.client
(
    id integer NOT NULL DEFAULT nextval('client_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    address text COLLATE pg_catalog."default",
    CONSTRAINT client_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS igr.category
(
    id integer NOT NULL DEFAULT nextval('category_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    parent_id integer,
    CONSTRAINT category_pkey PRIMARY KEY (id),
    CONSTRAINT parent FOREIGN KEY (parent_id)
        REFERENCES igr.category (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS igr.orders
(
    id integer NOT NULL DEFAULT nextval('order_id_seq'::regclass),
    datetime date NOT NULL,
    client_id integer NOT NULL,
    CONSTRAINT order_pkey PRIMARY KEY (id),
    CONSTRAINT client FOREIGN KEY (client_id)
        REFERENCES igr.client (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS igr.order_content
(
    order_id integer NOT NULL,
    nomenclature_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT "order" FOREIGN KEY (order_id)
        REFERENCES igr.orders (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product FOREIGN KEY (nomenclature_id)
        REFERENCES igr.nomenclature (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
