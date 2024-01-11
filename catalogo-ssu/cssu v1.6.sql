CREATE TABLE "administrative_regime" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "id" varchar(255) NOT NULL,
  "version" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "max_gg_proc" int4,
  "max_gg_admissibility" int4,
  "max_gg_int_resp" int4,
  "max_gg_int_req" int4,
  "max_gg_concl_send" int4,
  "max_gg_cdss_req" int4,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date,
  "dt_validity_start_date" date,
  "dt_validity_end_date" date
);

CREATE TABLE "bo_system" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "id" varchar(255) NOT NULL,
  "version" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "dt_validity_start_date" date,
  "dt_validity_end_date" date,
  "dt_suspended_date" date,
  "dt_revoke_date" date,
  "state" varchar,
  "client_id" varchar,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date,
  "e_service_toet" varchar NOT NULL,
  "e_service_tofo" varchar NOT NULL,
  "e_service_tori" varchar NOT NULL
);

CREATE TABLE "competent_administration_work" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "fk_competent_administration" int4 NOT NULL,
  "fk_competent_administration_class" int4 NOT NULL,
  "dt_start" date,
  "dt_end" date
);

CREATE TABLE "competent_administration_territorial_scope" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "fk_competent_administration" int4 NOT NULL,
  "fk_territorial_scope" int4 NOT NULL,
  "dt_start" date,
  "dt_end" date
);

CREATE TABLE "competent_administration_class" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "description" varchar(255) NOT NULL
);

CREATE TABLE "fo_system" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "id" varchar(255) NOT NULL,
  "version" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "dt_validity_start_date" date,
  "dt_validity_end_date" date,
  "dt_suspended_date" date,
  "dt_revoke_date" date,
  "state" varchar,
  "client_id" varchar,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date,
  "e_service_tobo" varchar NOT NULL,
  "e_service_tocu" varchar NOT NULL
);

CREATE TABLE "life_event" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "description" varchar(255) NOT NULL,
  "id" varchar NOT NULL
);

CREATE TABLE "meta" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "type_meta" varchar(255) NOT NULL,
  "fk_entity" int4 NOT NULL
);

CREATE TABLE "news" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "title" varchar(255),
  "description" varchar(255),
  "subheading" varchar(255),
  "publishing_date" date,
  "published" bool NOT NULL
);

CREATE TABLE "notification" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "title" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "is_read" bool NOT NULL,
  "notification_date" date NOT NULL,
  "fk_meta" int4 NOT NULL,
  "fk_user" int4 NOT NULL
);

CREATE TABLE "role_authority" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "role" int4,
  "authority" int4
);

CREATE TABLE "schematron" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "id" varchar(255) NOT NULL,
  "name" varchar(255) NOT NULL,
  "version" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "resource" varchar(255),
  "status" varchar(255),
  "fk_territorial_scope" int4,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date,
  "object_type" varchar
);

CREATE TABLE "territorial_scope" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "municipality" varchar(255) NOT NULL,
  "istat" varchar(8),
  "level" varchar(255),
  "fk_parent" int4
);

CREATE TABLE "third_party_system" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "id" varchar(255) NOT NULL,
  "version" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "telematic_ref" varchar(255) NOT NULL,
  "dt_validity_start_date" date,
  "dt_validity_end_date" date,
  "dt_suspended_date" date,
  "dt_revoke_date" date,
  "state" varchar,
  "client_id" varchar,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date
);

CREATE TABLE "typology" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "description" varchar(255) NOT NULL,
  "id" varchar NOT NULL
);

CREATE TABLE "user_authority" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "name" varchar(255) NOT NULL
);

CREATE TABLE "user_role" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "name" varchar(255) NOT NULL
);

CREATE TABLE "xsd" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "id" varchar(255) NOT NULL,
  "name" varchar(255) NOT NULL,
  "version" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "resource" varchar(255),
  "status" varchar(255),
  "fk_territorial_scope" int4,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date,
  "object_type" varchar
);

CREATE TABLE "attachment" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "id" varchar(255) NOT NULL,
  "fk_schematron" int4,
  "fk_xsd" int4,
  "version" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "status" varchar(255),
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date,
  "structured" bool NOT NULL DEFAULT true,
  "fk_territorial_scope" int4,
  "title" varchar(255)
);

CREATE TABLE "competent_administration" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "ipacode" varchar(255) NOT NULL,
  "office_code" varchar(255),
  "fk_system_entity" int4 NOT NULL,
  "version" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "pec" varchar(255) NOT NULL,
  "dt_validity_start_date" date,
  "dt_validity_end_date" date,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date,
  "id" varchar(255)
);

CREATE TABLE "form" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "id" varchar(255) NOT NULL,
  "version" varchar(255) NOT NULL,
  "name" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "fk_schematron" int4,
  "fk_xsd" int4,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date,
  "structured" bool NOT NULL DEFAULT true,
  "state" varchar(255) NOT NULL,
  "fk_territorial_scope" int4,
  "title" varchar(255)
);

CREATE TABLE "proceeding" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "id" varchar(255) NOT NULL,
  "fk_typology" int4 NOT NULL,
  "fk_life_event" int4 NOT NULL,
  "fk_territorial_scope" int4 NOT NULL,
  "fk_form" int4 NOT NULL,
  "version" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "dt_validity_start_date" date,
  "dt_validity_end_date" date,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date,
  "normative_reference" varchar(255) NOT NULL,
  "fk_competent_administration_class" int4 NOT NULL,
  "title" varchar(255),
  "status" varchar(255)
);

CREATE TABLE "proceeding_attachment" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "fk_proceeding" int4 NOT NULL,
  "fk_attachment" int4 NOT NULL,
  "mandatory" bool NOT NULL
);

CREATE TABLE "single_desk" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "id" varchar(255) NOT NULL,
  "fk_bo_system" int4 NOT NULL,
  "fk_fo_system" int4 NOT NULL,
  "version" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "fk_territorial_scope" int4 NOT NULL,
  "dt_validity_start_date" date,
  "dt_validity_end_date" date,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date,
  "type" varchar(255)
);

CREATE TABLE "usecase_proceeding" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "id" varchar(255) NOT NULL,
  "fk_proceeding" int4 NOT NULL,
  "version" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "schematron_phase" varchar(255),
  "max_gg_proc" int4,
  "max_gg_admissibility" int4,
  "max_gg_int_resp" int4,
  "max_gg_int_req" int4,
  "max_gg_concl_send" int4,
  "max_gg_cdss_req" int4,
  "fk_administrative_regime" int4 NOT NULL,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date,
  "state" varchar(255) NOT NULL,
  "title" varchar(255)
);

CREATE TABLE "userinfo" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "name" varchar(255) NOT NULL,
  "surname" varchar(255) NOT NULL,
  "fiscal_code" varchar(16) NOT NULL,
  "role" varchar(255) NOT NULL,
  "dt_start" date,
  "dt_end" date,
  "dt_last_modified_date" date,
  "administration_employee" varchar(255),
  "fk_territorial_scope" int4,
  "creation_date" date,
  "last_modified_by" varchar(255),
  "created_by" varchar(255),
  "phone" varchar(255),
  "email" varchar(255)
);

CREATE TABLE "endoproceeding" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "fk_primary" int4 NOT NULL,
  "fk_secondary" int4 NOT NULL,
  "mandatory" bool NOT NULL,
  "created_by" int4,
  "last_modified_by" int4,
  "dt_last_modified_date" date
);

CREATE TABLE "belonging_schematron" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "fk_primary" int4 NOT NULL,
  "fk_secondary" int4
);

CREATE TABLE "belonging_xsd" (
  "k_id" serial4 PRIMARY KEY NOT NULL,
  "fk_primary" int4 NOT NULL,
  "fk_secondary" int4
);

ALTER TABLE "attachment" ADD CONSTRAINT "fk_schematron" FOREIGN KEY ("fk_schematron") REFERENCES "schematron" ("k_id");

ALTER TABLE "attachment" ADD CONSTRAINT "fk_xsd" FOREIGN KEY ("fk_xsd") REFERENCES "xsd" ("k_id");

ALTER TABLE "territorial_scope" ADD CONSTRAINT "fk_parent" FOREIGN KEY ("fk_parent") REFERENCES "territorial_scope" ("k_id");

ALTER TABLE "competent_administration_work" ADD CONSTRAINT "fk_competent_administration_class_adm" FOREIGN KEY ("fk_competent_administration") REFERENCES "competent_administration" ("k_id");

ALTER TABLE "competent_administration_work" ADD CONSTRAINT "fk_competent_administration_class_cls" FOREIGN KEY ("fk_competent_administration_class") REFERENCES "competent_administration_class" ("k_id");

ALTER TABLE "competent_administration_territorial_scope" ADD CONSTRAINT "fk_competent_administration_ref_adm" FOREIGN KEY ("fk_competent_administration") REFERENCES "competent_administration" ("k_id");

ALTER TABLE "competent_administration_territorial_scope" ADD CONSTRAINT "fk_competent_administration_ref" FOREIGN KEY ("fk_territorial_scope") REFERENCES "territorial_scope" ("k_id");

ALTER TABLE "competent_administration" ADD CONSTRAINT "fk_system_entity" FOREIGN KEY ("fk_system_entity") REFERENCES "third_party_system" ("k_id");

ALTER TABLE "form" ADD CONSTRAINT "fk_schematron" FOREIGN KEY ("fk_schematron") REFERENCES "schematron" ("k_id");

ALTER TABLE "form" ADD CONSTRAINT "fk_xsd" FOREIGN KEY ("fk_xsd") REFERENCES "xsd" ("k_id");

ALTER TABLE "proceeding" ADD CONSTRAINT "fk_tipology" FOREIGN KEY ("fk_typology") REFERENCES "typology" ("k_id");

ALTER TABLE "proceeding" ADD CONSTRAINT "fk_life_event" FOREIGN KEY ("fk_life_event") REFERENCES "life_event" ("k_id");

ALTER TABLE "proceeding" ADD CONSTRAINT "fk_territorial_scope" FOREIGN KEY ("fk_territorial_scope") REFERENCES "territorial_scope" ("k_id");

ALTER TABLE "proceeding" ADD CONSTRAINT "fk_form" FOREIGN KEY ("fk_form") REFERENCES "form" ("k_id");

ALTER TABLE "proceeding_attachment" ADD CONSTRAINT "fk_proceeding" FOREIGN KEY ("fk_proceeding") REFERENCES "proceeding" ("k_id");

ALTER TABLE "proceeding_attachment" ADD CONSTRAINT "fk_attachment" FOREIGN KEY ("fk_attachment") REFERENCES "attachment" ("k_id");

ALTER TABLE "single_desk" ADD CONSTRAINT "fk_bo_system" FOREIGN KEY ("fk_bo_system") REFERENCES "bo_system" ("k_id");

ALTER TABLE "single_desk" ADD CONSTRAINT "fk_fo_system" FOREIGN KEY ("fk_fo_system") REFERENCES "fo_system" ("k_id");

ALTER TABLE "usecase_proceeding" ADD CONSTRAINT "fk_proceeding" FOREIGN KEY ("fk_proceeding") REFERENCES "proceeding" ("k_id");

ALTER TABLE "usecase_proceeding" ADD CONSTRAINT "fk_administrative_regime" FOREIGN KEY ("fk_administrative_regime") REFERENCES "administrative_regime" ("k_id");

ALTER TABLE "userinfo" ADD CONSTRAINT "fk_territorial_scope" FOREIGN KEY ("fk_territorial_scope") REFERENCES "territorial_scope" ("k_id");

ALTER TABLE "endoproceeding" ADD CONSTRAINT "fk_primary" FOREIGN KEY ("fk_primary") REFERENCES "usecase_proceeding" ("k_id");

ALTER TABLE "endoproceeding" ADD CONSTRAINT "fk_secondary" FOREIGN KEY ("fk_secondary") REFERENCES "usecase_proceeding" ("k_id");

ALTER TABLE "belonging_schematron" ADD CONSTRAINT "belonging_schematron_fk" FOREIGN KEY ("fk_primary") REFERENCES "schematron" ("k_id");

ALTER TABLE "belonging_schematron" ADD CONSTRAINT "belonging_schematron_fk_1" FOREIGN KEY ("fk_secondary") REFERENCES "schematron" ("k_id");

ALTER TABLE "single_desk" ADD CONSTRAINT "fk_territorial_scope" FOREIGN KEY ("fk_territorial_scope") REFERENCES "territorial_scope" ("k_id");

ALTER TABLE "proceeding" ADD CONSTRAINT "fk_proceeding_class" FOREIGN KEY ("fk_competent_administration_class") REFERENCES "competent_administration_class" ("k_id");

ALTER TABLE "role_authority" ADD CONSTRAINT "role_authority_authority_fkey" FOREIGN KEY ("authority") REFERENCES "user_authority" ("k_id");

ALTER TABLE "role_authority" ADD CONSTRAINT "role_authority_role_fkey" FOREIGN KEY ("role") REFERENCES "user_role" ("k_id");

ALTER TABLE "notification" ADD CONSTRAINT "fk_notification_meta" FOREIGN KEY ("fk_meta") REFERENCES "meta" ("k_id");

ALTER TABLE "notification" ADD CONSTRAINT "fk_notification_user" FOREIGN KEY ("fk_user") REFERENCES "userinfo" ("k_id");
