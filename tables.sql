CREATE TABLE public."Student"
(
    id INTEGER GENERATED BY DEFAULT AS IDENTITY
        NOT NULL,

   PRIMARY KEY (id),
    username character varying COLLATE pg_catalog."default",
    password character varying COLLATE pg_catalog."default",
    firstname character varying COLLATE pg_catalog."default",
    lastname character varying COLLATE pg_catalog."default"

)

TABLESPACE pg_default;

ALTER TABLE public."Student"
    OWNER to postgres;

CREATE TABLE public."Teacher"
(
    id INTEGER GENERATED BY DEFAULT AS IDENTITY
        NOT NULL,

   PRIMARY KEY (id),
    username character varying COLLATE pg_catalog."default",
    password character varying COLLATE pg_catalog."default",
    firstname character varying COLLATE pg_catalog."default",
    lastname character varying COLLATE pg_catalog."default"

)

TABLESPACE pg_default;

ALTER TABLE public."Teacher"
    OWNER to postgres;

CREATE TABLE public."Course"
(
    id INTEGER GENERATED BY DEFAULT AS IDENTITY
        NOT NULL,

   PRIMARY KEY (id),
    title character varying COLLATE pg_catalog."default",
    filling character varying COLLATE pg_catalog."default",
    creator_id integer,

    CONSTRAINT "Course_creator_id_fkey" FOREIGN KEY (creator_id)
        REFERENCES public."Teacher" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Course"
    OWNER to postgres;

CREATE TABLE public."Request"
(
    id INTEGER GENERATED BY DEFAULT AS IDENTITY
        NOT NULL,

   PRIMARY KEY (id),
    course_id integer,
    student_id integer,
    teacher_id integer,

    CONSTRAINT "Request_course_id_fkey" FOREIGN KEY (course_id)
        REFERENCES public."Course" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Request_student_id_fkey" FOREIGN KEY (student_id)
        REFERENCES public."Student" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Request_teacher_id_fkey" FOREIGN KEY (teacher_id)
        REFERENCES public."Teacher" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Request"
    OWNER to postgres;

CREATE TABLE public.orders
(
    id INTEGER GENERATED BY DEFAULT AS IDENTITY
        NOT NULL,

   PRIMARY KEY (id),
    student_id integer,
    course_id integer,

    CONSTRAINT orders_course_id_fkey FOREIGN KEY (course_id)
        REFERENCES public."Course" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT orders_student_id_fkey FOREIGN KEY (student_id)
        REFERENCES public."Student" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.orders
    OWNER to postgres;