-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "firstname" VARCHAR(200) NOT NULL,
    "lastname" VARCHAR(200) NOT NULL,
    "email" VARCHAR(200) NOT NULL,
    "emailVerified" TIMESTAMP(3),
    "image" TEXT,
    "address" TEXT DEFAULT '',
    "phone" TEXT DEFAULT '',
    "status" BOOLEAN NOT NULL DEFAULT true,
    "timeZone" TEXT,
    "stripe_customer_id" TEXT,
    "password" VARCHAR(200) NOT NULL,
    "inactive" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Account" (
    "userId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("provider","providerAccountId")
);

-- CreateTable
CREATE TABLE "Session" (
    "sessionToken" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VerificationToken_pkey" PRIMARY KEY ("identifier","token")
);

-- CreateTable
CREATE TABLE "Authenticator" (
    "credentialID" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "credentialPublicKey" TEXT NOT NULL,
    "counter" INTEGER NOT NULL,
    "credentialDeviceType" TEXT NOT NULL,
    "credentialBackedUp" BOOLEAN NOT NULL,
    "transports" TEXT,

    CONSTRAINT "Authenticator_pkey" PRIMARY KEY ("userId","credentialID")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "inactive" BOOLEAN NOT NULL DEFAULT false,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "departments" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "inactive" BOOLEAN NOT NULL DEFAULT false,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "departments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "companyroles" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "inactive" BOOLEAN NOT NULL DEFAULT false,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "companyroles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userdepartments" (
    "id" TEXT NOT NULL,
    "responsible" BOOLEAN NOT NULL DEFAULT false,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "department_id" TEXT NOT NULL,

    CONSTRAINT "userdepartments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usercompanyroles" (
    "id" TEXT NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "companyrole_id" TEXT NOT NULL,

    CONSTRAINT "usercompanyroles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userroles" (
    "id" TEXT NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "role_id" TEXT NOT NULL,

    CONSTRAINT "userroles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "states" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "uf" VARCHAR(2) NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "states_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "citys" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "codeibge" VARCHAR(10) NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "state_id" TEXT NOT NULL,

    CONSTRAINT "citys_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "typepersons" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "inactive" BOOLEAN NOT NULL DEFAULT false,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "typepersons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "persons" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "cpfcnpj" VARCHAR(20) NOT NULL,
    "stateregistration" VARCHAR(200) NOT NULL,
    "municipalregistration" VARCHAR(200) NOT NULL,
    "inactive" BOOLEAN NOT NULL DEFAULT false,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "typeperson_id" TEXT NOT NULL,

    CONSTRAINT "persons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "personcontacts" (
    "id" TEXT NOT NULL,
    "type" VARCHAR(20) NOT NULL,
    "contact" VARCHAR(200) NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "person_id" TEXT NOT NULL,

    CONSTRAINT "personcontacts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "personaddresss" (
    "id" TEXT NOT NULL,
    "type" VARCHAR(20) NOT NULL,
    "address" VARCHAR(200) NOT NULL,
    "number" VARCHAR(20) NOT NULL,
    "neighborhood" VARCHAR(200) NOT NULL,
    "cep" VARCHAR(20) NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "person_id" TEXT NOT NULL,
    "city_id" TEXT NOT NULL,

    CONSTRAINT "personaddresss_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "holidays" (
    "id" TEXT NOT NULL,
    "description" VARCHAR(200) NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "state_id" TEXT NOT NULL,

    CONSTRAINT "holidays_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "scales" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "inactive" BOOLEAN NOT NULL DEFAULT false,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "scales_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "scaledays" (
    "id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "starttime" VARCHAR(6) NOT NULL,
    "endtime" VARCHAR(6) NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "scale_id" TEXT NOT NULL,

    CONSTRAINT "scaledays_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userscales" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "user_id" TEXT NOT NULL,
    "scale_id" TEXT NOT NULL,

    CONSTRAINT "userscales_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "forms" (
    "id" TEXT NOT NULL,
    "description" VARCHAR(200) NOT NULL,
    "title" VARCHAR(200) NOT NULL,
    "descriptive_flow" TEXT NOT NULL,
    "descriptive_help" TEXT NOT NULL,
    "inactive" BOOLEAN NOT NULL DEFAULT false,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "companyrole_id" TEXT NOT NULL,

    CONSTRAINT "forms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "formusers" (
    "id" TEXT NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "form_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "formusers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "formroles" (
    "id" TEXT NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "form_id" TEXT NOT NULL,
    "role_id" TEXT NOT NULL,

    CONSTRAINT "formroles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "formdepartments" (
    "id" TEXT NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "form_id" TEXT NOT NULL,
    "department_id" TEXT NOT NULL,

    CONSTRAINT "formdepartments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "formsteps" (
    "id" TEXT NOT NULL,
    "description" VARCHAR(200) NOT NULL,
    "term" VARCHAR(20) NOT NULL,
    "inform_date" BOOLEAN NOT NULL DEFAULT false,
    "type_period" VARCHAR(2) NOT NULL,
    "term_supervisor" VARCHAR(20) NOT NULL,
    "type_period_supervisor" VARCHAR(2) NOT NULL,
    "term_manager" VARCHAR(20) NOT NULL,
    "type_period_manager" VARCHAR(2) NOT NULL,
    "type_user" VARCHAR(2) NOT NULL,
    "inactive" BOOLEAN NOT NULL DEFAULT false,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "form_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "formsteps_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "formstepfields" (
    "id" TEXT NOT NULL,
    "description" VARCHAR(200) NOT NULL,
    "type" VARCHAR(20) NOT NULL,
    "size" VARCHAR(20) NOT NULL,
    "options" TEXT NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "formstep_id" TEXT NOT NULL,

    CONSTRAINT "formstepfields_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "formstepemails" (
    "id" TEXT NOT NULL,
    "type" VARCHAR(50) NOT NULL,
    "type_registration" VARCHAR(50) NOT NULL,
    "code_registration" VARCHAR(50) NOT NULL,
    "email" VARCHAR(200) NOT NULL,
    "message" TEXT NOT NULL,
    "day_notice" VARCHAR(4) NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "formstep_id" TEXT NOT NULL,

    CONSTRAINT "formstepemails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "formstepextends" (
    "id" TEXT NOT NULL,
    "sequence" VARCHAR(4) NOT NULL,
    "term" VARCHAR(4) NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "formstep_id" TEXT NOT NULL,

    CONSTRAINT "formstepextends_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "processs" (
    "id" TEXT NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "form_id" TEXT NOT NULL,

    CONSTRAINT "processs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "processsteps" (
    "id" TEXT NOT NULL,
    "date_finished" TIMESTAMP(3),
    "status" VARCHAR(4) NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "process_id" TEXT NOT NULL,
    "formstep_id" TEXT NOT NULL,

    CONSTRAINT "processsteps_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "processstepuploads" (
    "id" TEXT NOT NULL,
    "description" VARCHAR(200) NOT NULL,
    "file_name" VARCHAR(200) NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "processstep_id" TEXT NOT NULL,

    CONSTRAINT "processstepuploads_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "processstepextends" (
    "id" TEXT NOT NULL,
    "date_extend" TIMESTAMP(3),
    "justify" VARCHAR(200) NOT NULL,
    "date_authorization" TIMESTAMP(3),
    "authorization" BOOLEAN NOT NULL DEFAULT false,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "processstep_id" TEXT NOT NULL,
    "formstepextend_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "processstepextends_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "processstepfields" (
    "id" TEXT NOT NULL,
    "value" VARCHAR(200) NOT NULL,
    "isdeleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "processstep_id" TEXT NOT NULL,
    "formstepfield_id" TEXT NOT NULL,

    CONSTRAINT "processstepfields_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "Authenticator_credentialID_key" ON "Authenticator"("credentialID");

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Authenticator" ADD CONSTRAINT "Authenticator_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userdepartments" ADD CONSTRAINT "userdepartments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userdepartments" ADD CONSTRAINT "userdepartments_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "departments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usercompanyroles" ADD CONSTRAINT "usercompanyroles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usercompanyroles" ADD CONSTRAINT "usercompanyroles_companyrole_id_fkey" FOREIGN KEY ("companyrole_id") REFERENCES "companyroles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userroles" ADD CONSTRAINT "userroles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userroles" ADD CONSTRAINT "userroles_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "citys" ADD CONSTRAINT "citys_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "persons" ADD CONSTRAINT "persons_typeperson_id_fkey" FOREIGN KEY ("typeperson_id") REFERENCES "typepersons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "personcontacts" ADD CONSTRAINT "personcontacts_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "persons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "personaddresss" ADD CONSTRAINT "personaddresss_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "persons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "personaddresss" ADD CONSTRAINT "personaddresss_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "citys"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "holidays" ADD CONSTRAINT "holidays_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scaledays" ADD CONSTRAINT "scaledays_scale_id_fkey" FOREIGN KEY ("scale_id") REFERENCES "scales"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userscales" ADD CONSTRAINT "userscales_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userscales" ADD CONSTRAINT "userscales_scale_id_fkey" FOREIGN KEY ("scale_id") REFERENCES "scales"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "forms" ADD CONSTRAINT "forms_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "forms" ADD CONSTRAINT "forms_companyrole_id_fkey" FOREIGN KEY ("companyrole_id") REFERENCES "companyroles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formusers" ADD CONSTRAINT "formusers_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "forms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formusers" ADD CONSTRAINT "formusers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formroles" ADD CONSTRAINT "formroles_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "forms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formroles" ADD CONSTRAINT "formroles_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formdepartments" ADD CONSTRAINT "formdepartments_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "forms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formdepartments" ADD CONSTRAINT "formdepartments_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "departments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formsteps" ADD CONSTRAINT "formsteps_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "forms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formsteps" ADD CONSTRAINT "formsteps_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formstepfields" ADD CONSTRAINT "formstepfields_formstep_id_fkey" FOREIGN KEY ("formstep_id") REFERENCES "formsteps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formstepemails" ADD CONSTRAINT "formstepemails_formstep_id_fkey" FOREIGN KEY ("formstep_id") REFERENCES "formsteps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formstepextends" ADD CONSTRAINT "formstepextends_formstep_id_fkey" FOREIGN KEY ("formstep_id") REFERENCES "formsteps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "processs" ADD CONSTRAINT "processs_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "forms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "processsteps" ADD CONSTRAINT "processsteps_process_id_fkey" FOREIGN KEY ("process_id") REFERENCES "processs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "processsteps" ADD CONSTRAINT "processsteps_formstep_id_fkey" FOREIGN KEY ("formstep_id") REFERENCES "formsteps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "processstepuploads" ADD CONSTRAINT "processstepuploads_processstep_id_fkey" FOREIGN KEY ("processstep_id") REFERENCES "processsteps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "processstepextends" ADD CONSTRAINT "processstepextends_processstep_id_fkey" FOREIGN KEY ("processstep_id") REFERENCES "processsteps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "processstepextends" ADD CONSTRAINT "processstepextends_formstepextend_id_fkey" FOREIGN KEY ("formstepextend_id") REFERENCES "formstepextends"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "processstepextends" ADD CONSTRAINT "processstepextends_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "processstepfields" ADD CONSTRAINT "processstepfields_processstep_id_fkey" FOREIGN KEY ("processstep_id") REFERENCES "processsteps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "processstepfields" ADD CONSTRAINT "processstepfields_formstepfield_id_fkey" FOREIGN KEY ("formstepfield_id") REFERENCES "formstepfields"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
