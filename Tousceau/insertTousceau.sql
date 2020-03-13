/* insertion des lignes */

delete from souscrit;




INSERT souscrit VALUES (1,  'Dupond'  , 'Paris',7000   );
INSERT souscrit VALUES (2,'Durand'  , 'Lyon',12000   );
INSERT souscrit VALUES (3,'Martin'  , 'Marseille',5000   );
INSERT souscrit VALUES (4,'Petit'  , 'Rouen',20000   );
INSERT souscrit VALUES (5,'Thomas'  , 'Lille',15000   );
INSERT souscrit VALUES (6,'Legendre'  , 'Metz',25000   );
INSERT souscrit VALUES (7,'Loisel'  , 'Lille',6000   );


SELECT * FROM souscrit;

delete from verse;

INSERT verse VALUES (  1,'2019/01/31',50   );
INSERT verse VALUES (  2,'2019/02/28',200   );
INSERT verse VALUES (  3,'2019/02/15',8750  );
INSERT verse VALUES (  4,'2018/08/28',800  );
INSERT verse VALUES (  5,'2018/05/03',1000  );
INSERT verse VALUES (  6,'2018/07/14',30  );
INSERT verse VALUES (  1,'2018/10/18',600);
INSERT verse VALUES (  1,'2018/12/24',400);
INSERT verse VALUES (  3,'2018/11/30',80);
INSERT verse VALUES (  7,'2018/09/20',9000);



SELECT * FROM verse;

delete from revue;

INSERT revue VALUES (  'r10','talypso',250 );
INSERT revue VALUES (  'r20','match',180 );
INSERT revue VALUES (  'r30','svm',200 );
INSERT revue VALUES (  'r40','01info',350 );
INSERT revue VALUES (  'r50','closer',40 );

SELECT * FROM revue;

delete from abonne;

INSERT abonne VALUES (  1,'r10','2019/01/01',12 );
INSERT abonne VALUES (  1,'r30','2018/03/01',6 );
INSERT abonne VALUES (  2,'r10','2018/06/01',6 );
INSERT abonne VALUES (  2,'r20','2018/08/01',18 );
INSERT abonne VALUES (  2,'r30','2018/10/01',12 );
INSERT abonne VALUES (  2,'r40','2019/02/01',12 );
INSERT abonne VALUES (  3,'r40','2018/03/01',6 );
INSERT abonne VALUES (  4,'r30','2018/09/15',6 );


SELECT * FROM abonne;
