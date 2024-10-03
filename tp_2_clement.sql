CREATE TABLE MONITEUR(
    noM NUMBER,
    nomM VARCHAR2(30),
    prenomM VARCHAR2(30),
    adresse VARCHAR2(100),
    dateNaiss DATE,
    
    CONSTRAINT ck_nomM CHECK(nomM IS NOT NULL),  
    CONSTRAINT ck_prenomM CHECK(prenomM IS NOT NULL),
    CONSTRAINT ck_adresse CHECK(adresse IS NOT NULL),
    CONSTRAINT ck_dateNaiss CHECK(dateNaiss IS NOT NULL),
    CONSTRAINT pk_noM PRIMARY KEY(noM)
    );
    
    
CREATE TABLE SPECIALITE(
    idSpecialite NUMBER(4,0),
    nomS VARCHAR2(35),
    
    CONSTRAINT pk_idSpecialite PRIMARY KEY(idSpecialite),
    CONSTRAINT ck_nomS CHECK (nomS IN('ski','snowboard','raquette','monoski'))
    
    );
    
    
    
    
    
CREATE TABLE COURS(
    codeC NUMBER(5,0),
    niveau VARCHAR2(30),
    nbPLaces NUMBER(5,0),
    dateCours DATE,
    noM NUMBER(5,0),
    idSpecialite NUMBER(4,0),
    
    
    CONSTRAINT ck_dateCours CHECK (dateCours IS NOT NULL),
    CONSTRAINT fk_COURS_MONITEUR FOREIGN KEY(noM) REFERENCES MONITEUR(noM),
    CONSTRAINT fk_COURS_SPECIALITE FOREIGN KEY(idSpecialite) REFERENCES SPECIALITE(idSpecialite),
    
    CONSTRAINT pk_codeC PRIMARY KEY (codeC),
    CONSTRAINT ck_niveau CHECK (niveau IN('debutant','moyen','confirm�','comp�tition')),
    CONSTRAINT ck_nbPlaces CHECK (nbPlaces IS NOT NULL)
    

    );
    



CREATE TABLE ADHERENT(
    noA NUMBER(4,0),
    nomA VARCHAR2(30),
    prenomA VARCHAR2(30),
    adresseA VARCHAR2(100),
    telA NUMBER(11,0),
    ageA NUMBER(3,0),
    
    CONSTRAINT pk_noA PRIMARY KEY (noA),

    CONSTRAINT ck_prenomA CHECK (prenomA IS NOT NULL),
    CONSTRAINT ck_telA CHECK (telA IS NOT NULL)

    
    );
    
    
    
    
    
    
    
CREATE TABLE MATERIEL(
    codeM NUMBER(2,0),
    type VARCHAR2(40),
    marque VARCHAR2(40),
    prix NUMBER(4,0),
    qteDispo NUMBER(3,0),
    
    CONSTRAINT pk_codeM PRIMARY KEY (codeM),
    CONSTRAINT ck_type CHECK (type IS NOT NULL),
    CONSTRAINT ck_qteDispo CHECK (qteDispo IS NOT NULL),
    CONSTRAINT ck_prix CHECK (prix IS NOT NULL)
    
);
    
    
CREATE TABLE SUIVRE(
    noA NUMBER,
    codeC NUMBER,
    CONSTRAINT pk_suivre PRIMARY KEY (noA,codeC),
    CONSTRAINT fk_suivre_adherent FOREIGN KEY(noA) REFERENCES ADHERENT(noA),
    CONSTRAINT fk_suivre_cours FOREIGN KEY(codeC) REFERENCES COURS(codeC)
    
    );
    
    
    
    
CREATE TABLE LOUER(
    noA NUMBER,
    codeM NUMBER,
    quantite NUMBER,
    CONSTRAINT pk_louer PRIMARY KEY(noA,codeM),
    CONSTRAINT fk_louer_adherent FOREIGN KEY(noA) REFERENCES ADHERENT(noA),
    CONSTRAINT fk_louer_materiel FOREIGN KEY(codeM) REFERENCES MATERIEL(codeM)
    
    
    
);