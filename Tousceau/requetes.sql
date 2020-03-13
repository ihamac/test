/* Quels sont les numeros des souscripteurs de Lyon ou Lille 
qui ont versé plus de 10 000 euros l'année précédente ?

R1 = SELECTION (souscrit, ville = "Lyon" ou ville = "Lille")
R2 = SELECTION (R1, Total > 10 000)
R3 = PROJECTION (R2, num)
*/

SELECT num FROM souscrit
WHERE total > 10000 and
(ville = "Lyon" or ville = "Lille");

+-----+
| num |
+-----+
|   2 |
|   5 |
+-----+

/* 1) Quelle est la somme totale des souscriptions ?
	
	R1 = SOMME (souscrit,total)
	R2 = PROJECTION (R1,total)
*/

SELECT sum(total) FROM souscrit;

+------------+
| sum(total) |
+------------+
|      90000 |
+------------+

/* 2) Combien y a-t-il de versements effectués ? 
	
	R1 = COMPTE (verse, num)
	R2 = PROJECTION (R1, COMPTE(*))
*/

SELECT count(*) FROM verse;

+----------+
| count(*) |
+----------+
|       10 |
+----------+

/* 3) Quel est le montant maximum de versements ? 

	R1 = MAXIMUM (verse, montant)
	R2 = PROJECTION (R1, montant)
*/

SELECT max(montant) FROM verse;

+--------------+
| max(montant) |
+--------------+
|         9000 |
+--------------+

/* 4) Quelle est la moyenne du prix d'une revue ?
	
	R1 = MOYENNE (revue, prix)
	R2 = PROJECTION (R1, moyenne)
*/

SELECT avg(prix) FROM revue;

+-----------+
| avg(prix) |
+-----------+
|  204.0000 |
+-----------+

/* 5) Quelles sont les sommes versées par mois en 2019 ?
	
	R1 = SELECTION (verse, ANNEE(datev)='2019')
	R2 = SOMME (R1, MOIS(datev), montant)
*/

SELECT sum(montant), MONTH(datev), datev FROM verse
WHERE YEAR(datev)='2019' GROUP BY MONTH(datev);

+--------------+--------------+------------+
| sum(montant) | MONTH(datev) | datev      |
+--------------+--------------+------------+
|           50 |            1 | 2019-01-31 |
|         8950 |            2 | 2019-02-28 |
+--------------+--------------+------------+

/* 6) Quel est le nom du souscripteur qui a versé la plus pettie somme ? 
	
	R1 = MINIMUM (verse, montant) -> Pour recupérer 30
	R2 = SELECTION (verse, montant = R1.mini)
	R3 = JOINTURE (R2, souscrit, R2.num = souscrit.num)
	R4 = PROJECTION (R3, nom)
*/

SELECT min(montant),nom FROM verse
INNER JOIN souscrit ON verse.nom = souscrit.nom 
GROUP BY nom;

/* 7) Quelssont les montants versés par souscripteur ?

	R1 = SOMME (verse, montant,num)
	R2 = PROJECTION (R1, num, somme)
*/

SELECT num, sum(montant) from verse 
GROUP BY num;

+-----+--------------+
| num | sum(montant) |
+-----+--------------+
|   1 |         1050 |
|   2 |          200 |
|   3 |         8830 |
|   4 |          800 |
|   5 |         1000 |
|   6 |           30 |
|   7 |         9000 |
+-----+--------------+

/* 8) Combien y a-t-il d'abonnés par revue ? 
	R1 = SOMME (abonne, num, coder)
	R2 = PROJECTION (R1, coder, compte)
*/

SELECT coder, count(num) as total from abonne
GROUP BY coder ORDER BY coder;

+-------+-------+
| coder | total |
+-------+-------+
| r10   |     2 |
| r20   |     1 |
| r30   |     3 |
| r40   |     2 |
+-------+-------+
