CREATE DATABASE `The Grey-Sloan hospital system`

CREATE TABLE Consult
(
    ConsultID VARCHAR(5) NOT NULL,
    PatientSocialSecurityNumber VARCHAR(10),
    DoctorID VARCHAR(15),
    DateTime DATETIME,
    TypeOfConsult VARCHAR(30),
    PrescriptionID VARCHAR(4),
    DiagnosisID VARCHAR(5),
    TestID VARCHAR(7),
    PRIMARY KEY (ConsultID),
    FOREIGN KEY (PatientSocialSecurityNumber) REFERENCES patient(PatientSocialSecurityNumber),
    FOREIGN KEY (DoctorID) REFERENCES doctor (DoctorID),
    FOREIGN KEY (PrescriptionID) REFERENCES prescription (PrescriptionID),
    FOREIGN KEY (DiagnosisID) REFERENCES diagnosis (DiagnosisID),
    FOREIGN KEY (TestID) REFERENCES test (TestID)
);

CREATE TABLE Diagnosis
(
    DiagnosisID VARCHAR(5) NOT NULL,
    Description VARCHAR(30),
    PRIMARY KEY (DiagnosisID)
);

CREATE TABLE Doctor
(
    DoctorID VARCHAR(15) NOT NULL,
    FirstName VARCHAR(10),
    LastName VARCHAR(10),
    Contact INT(10),
    Address VARCHAR(35),
    DepartmentID VARCHAR(10),
    PRIMARY KEY (DoctorID),
    FOREIGN KEY (DepartmentID) REFERENCES department(DepartmentID)
);

CREATE TABLE Patient
(
    PatientSocialSecurityNumber VARCHAR(10) NOT NULL,
    FirstName VARCHAR(10),
    LastName VARCHAR(10),
    DateOfBirth DATE,
    Address VARCHAR(35),
    Gender VARCHAR(8),
    PRIMARY KEY (PatientSocialSecurityNumber)
);

CREATE TABLE prescription
(
    PrescriptionID VARCHAR(4) NOT NULL,
    Details VARCHAR(70),
    PRIMARY KEY (PrescriptionID)
);

CREATE TABLE Department
(
    DepartmentID VARCHAR(10) NOT NULL,
    DepartmentName VARCHAR(50),
    PRIMARY KEY (DepartmentID)
);

CREATE TABLE Test
(
    TestID VARCHAR(7) NOT NULL,
    Description VARCHAR(40),
    PRIMARY KEY (TestID)
);

INSERT INTO consult
(ConsultID,PatientSocialSecurityNumber,DoctorID,DateTime,TypeOfConsult,PrescriptionID,DiagnosisID,TestID)
VALUES
('cs01','AAGG8822','D123','2022-01-31 08:35:00','General Consultation','p01','D098','TS01'),
('cs02','pa03','DC556','2022-02-01 08:35:00','Ear Checkup','p02','D099','TS002'),
('cs03','pa24','DC124','2022-02-02 08:35:00','Emergency Treatment','p03','D100','TS003'),
('cs04','pa27','DC13335','2022-02-03 08:35:00','Routine Check UP','p04','D101','TS004'),
('cs05','pa28','D123','2022-02-04 08:35:00','Consult','p05','D102','TS005'),
('cs06','pa29','DC2234','2022-02-05 08:35:00','Consult','p06','D103','TS06'),
('cs07','pa30','DC3345','2022-02-06 08:35:00','Consult','p07','D104',NULL)
;

INSERT INTO department
(DepartmentID,DepartmentName)
VALUES
('DAC01','General Care and Surgery'),
('CAD02','Cardiology'),
('NRL01','Neurology'),
('CAD01','Emergency Treatment'),
('ECU01','Outpatient'),
('PED01','Pediatric'),
('OBGN01','Obstetrics,Gynecology&Neonatal'),
('OT01','Orthopedic'),
('ENT01','ENT')
;

INSERT INTO diagnosis
(DiagnosisID,Description)
VALUES
('D098','Noncardiac Chest Pain'),
('D099','TMJ syndrome'),
('D100','Pneumothorax'),
('D101','Vitamin Deficiency'),
('D102','Vitamin Deficiency'),
('D103','Minor concussion'),
('D104','Sleeping disorder')
;

INSERT INTO doctor
(DoctorID,FirstName,LastName,Contact,Address,DepartmentID)
VALUES
('D123','Miranda','Bailey',11234467,'12 Park Road, London','DAC01'),
('D1134','Maggie','Pierce',11234432,'33, Redwood Rd, Staffordshire','CAD02'),
('D334','Meredith','Grey',11234543,'22, Keele','DAC01'),
('D435','Derek','Shepherd',11234568,'12 Fairview, Mount Bay','NRL01'),
('D554','Christina','Yang',11234564,'33, Victoria Place','CAD01'),
('D665','Owen','Hunt',12344432,'55 Kwan Avenue Swiburne','CAD01'),
('DC124','April','Kepner',11234324,'34 East London','ECU01'),
('DC2234','Alex','Karev',11234543,'22 Redmond Street','PED01'),
('DC13335','Addison','Montgomery',11234563,'12 Park View Terrace','OBGN01'),
('DC3345','Callie','Torres',11234533,'14 Berrybell Avenue','OT01'),
('DC556','Mark','Sloan',11234567,'12 New Castle, London','ENT01')
;

INSERT INTO patient
(PatientSocialSecurityNumber,FirstName,LastName,DateOfBirth,Address,Gender)
VALUES
('AAGG8822','Sam','Smith','1998-12-09','71 Cherry Court, SOUTHAMPTON','Male'),
('pa03','Damien','Johnes','1978-05-01','60 Park Terrace, Girton','Male'),
('pa23','Noah','Williams','1985-04-01','56 Bootham Terrace, Redhill','Male'),
('pa24','Oliver','Brown','1994-03-06','5 Folkestone Road, Winskill','Male'),
('pa25','George','Evans','1990-02-06','5 Cunnery Rd, Maiden Green','Male'),
('pa26','Olivia','Stevens','1984-02-10','1 Carnaby Street, Sidcup','Female'),
('pa27','Octavia','Jenkins','1989-11-04','34 Downton Abbey, London','Female'),
('pa28','Anne','Pearson','1992-12-12','The Gables, London','Female'),
('pa29','Meryl','Murray','1995-05-09','15 Manchester Road, Doncaster','Female'),
('pa30','Leo','Cooke','1991-03-07','483 The Grove, HEMEL HEMPSTEAD','Male')
;

INSERT INTO prescription
(PrescriptionID,Details)
VALUES
('p01','500mg of Amoxicillin, three times a day for seven days.'),
('p02','phenoxymethyl penicillin 500mg b.d. for splenectomy prophylaxis'),
('p03','Esomeprazole 40 mg twice a day'),
('p04','Indomethacine 20 three times a day 5 days'),
('p05','Zaart 50 two times a day before meals one month'),
('p06',NULL),
('p07',NULL)
;

INSERT INTO test
(TestID,Description)
VALUES
('TS01','CBC'),
('TS002','Sn345'),
('TS003','DF 234 with urine Culture'),
('TS004','23CDD WBC with Urine culture'),
('TS005','FBC'),
('TS06',NULL)
;