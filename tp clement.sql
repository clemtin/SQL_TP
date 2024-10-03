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

    CONSTRAINT ck_prenomA CHECK (prenomA IS NOT NULL)
   /* CONSTRAINT ck_telA CHECK (telA IS NOT NULL) */
    
    );

DROP TABLE ADHERENT CASCADE CONSTRAINTS;    

    
    
    
    
    
    
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

INSERT INTO moniteur(nom,nomm,prenomm,adresse,datenaiss)
    VALUES (1,'DUPOND','Jean','12 route du col, Germ','01/01/1980');
INSERT INTO moniteur(nom,nomm,prenomm,adresse,datenaiss)    
    VALUES (2,'MARTIN','Sophie','Route du lac,Loudenvielle','13/05/1988');
    
    
INSERT INTO specialite(idspecialite,noms)
    VALUES (1,'ski');
INSERT INTO specialite(idspecialite,noms)
    VALUES (2,'snowboard');
INSERT INTO specialite(idspecialite,noms)
    VALUES (3,'raquette');
    
INSERT INTO cours (codeC,niveau,nbPlaces,dateCours,noM,idspecialite)
    VALUES (1,'debutant',1,'01/02/2013',1,2);
INSERT INTO cours (codeC,niveau,nbPlaces,dateCours,noM,idspecialite)
    VALUES (2,'moyen',1,'02/02/2013',1,2);
INSERT INTO cours (codeC,niveau,nbPlaces,dateCours,noM,idspecialite)
    VALUES (3,'debutant',5,'01/02/2013',2,1);
    
INSERT INTO adherent(noa,nomA,prenomA,adresseA,telA,ageA)
    VALUES(1,'Lars','Julien','12 rue principale, Muret',066666666,13);
INSERT INTO adherent(noa,nomA,prenomA,adresseA,telA,ageA)
    VALUES(2,'Salma','Louise','23 route de Tarbes, Pau',0777777777,26);
INSERT INTO adherent(noa,nomA,prenomA,adresseA,ageA)
    VALUES(3,'Jardin','Lucien','Route d Espagne, Tabes',52);
    
INSERT INTO materiel(codeM,type,marque,prix,qteDispo)
    VALUES(1,'ski','HyperGliss',10,2);
INSERT INTO materiel(codeM,type,marque,prix,qteDispo)
    VALUES(2,'snowboard','HyperGliss',11,3);
INSERT INTO materiel(codeM,type,marque,prix,qteDispo)
    VALUES(4,'raquette','Smash',8,2);
    
    
INSERT INTO suivre(codec,noa)
    VALUES(1,1);
INSERT INTO suivre(codec,noa)
    VALUES(1,2);
INSERT INTO suivre(codec,noa)
    VALUES(3,1);
INSERT INTO suivre(codec,noa)
    VALUES(2,3);
        
INSERT INTO louer(noa,codem,quantite)
    VALUES (3,1,1);
INSERT INTO louer(noa,codem,quantite)
    VALUES (2,1,2);

select * from adherent ;

select * from cours ;
select * from materiel ;
select * from moniteur ;
select * from specialite ;
select * from LOUER ;
select * from suivre ;


    