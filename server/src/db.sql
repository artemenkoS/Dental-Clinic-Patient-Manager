

create TABLE patient (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    phone VARCHAR(255),

)

create TABLE doctor (
    id SERIAL PRIMARY KEY,
    surname VARCHAR(255),
   name VARCHAR(255),

)

create TABLE visit (
    id SERIAL PRIMARY KEY,
    "visitDate" TIMESTAMP,
    "doctorId" INTEGER,
    FOREIGN KEY ("doctorId") REFERENCES users(id),
    "patientId" INTEGER,
    FOREIGN KEY ("patientId") REFERENCES patient(id)
)

create TABLE role (
    id SERIAL PRIMARY KEY,
 role VARCHAR(255)
)

create TABLE procedure (
    id SERIAL PRIMARY KEY,
 procedure VARCHAR(255)
)

create TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    login VARCHAR(255),
    password VARCHAR(255),
    role INTEGER,
    FOREIGN KEY ("role") REFERENCES role(id)
)



ALTER TABLE visit
ADD COLUMN procedure INTEGER;


FOREIGN KEY ("procedure")
REFERENCES procedure(id)
