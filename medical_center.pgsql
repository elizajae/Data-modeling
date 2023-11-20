DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE Doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL,
    );

CREATE TABLE Patients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER NOT NULL ,
    insurance TEXT NOT NULL,
    );

CREATE TABLE Visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL REFERENCES Doctors(id),
    patient_id INTEGER NOT NULL REFERENCES Patients(id),
    date DATE NOT NULL,
    );

CREATE TABLE DIAGNOSES (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER NOT NULL REFERENCES Visits(id),
    doctor_id INTEGER NOT NULL REFERENCES Doctors(id),
    patient_id INTEGER NOT NULL REFERENCES Patients(id),
    description TEXT ,
    disease_id INTEGER NOT NULL REFERENCES Diseases(id),
    );

CREATE TABLE Diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    );

