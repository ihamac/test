/* 1) Nom et prénom des employés du service 'Atelier A' qui possèdent plus de 2 diplômes*/
SELECT emp_nom, emp_prenom, ser_designation
FROM service s 
INNER JOIN employe e on s.ser_id = e.emp_service
INNER JOIN posseder p on e.emp_id = p.pos_employe
WHERE ser_designation = "Atelier A"
GROUP BY emp_nom, emp_prenom
HAVING count(pos_diplome) > 2;

+---------+------------+-----------------+
| emp_nom | emp_prenom | ser_designation |
+---------+------------+-----------------+
| Dupont  | Alain      | Atelier A       |
+---------+------------+-----------------+

/* 2) Liste des services qui ont des employés qui ne possèdent pas de diplôme */
SELECT emp_nom,emp_prenom,ser_designation 
FROM service s
INNER JOIN employe e on s.ser_id = e.emp_service 
WHERE emp_id 
NOT IN (SELECT pos_employe FROM posseder); 

+---------+------------+-----------------+
| emp_nom | emp_prenom | ser_designation |
+---------+------------+-----------------+
| Louvel  | Martine    | Atelier B       |
+---------+------------+-----------------+

/* 3) Liste des compétences (diplômes) des employés du service de M.Guerdon */
SELECT emp_nom, emp_prenom, dip_libelle
FROM diplome d 
INNER JOIN posseder p on d.dip_id = p.pos_diplome
INNER JOIN employe e on p.pos_employe = e.emp_id
WHERE emp_service = (SELECT emp_service FROM employe WHERE emp_nom = "Guerdon"); 

+---------+------------+-------------+
| emp_nom | emp_prenom | dip_libelle |
+---------+------------+-------------+
| Guerdon | Patrick    | Bac         |
| Poulard | Aline      | Licence     |
+---------+------------+-------------+

/* 4) Ecrire une procédure stockée qui permet d'augmenter le salaire d'un employé 
(paramètres en entrés : nom de l'employé, pourcentage d'augmentation) */
delimiter |
drop procedure if exists majSalaire |
Create procedure majSalaire(nom varchar(50), pourcentage decimal(3,2))
BEGIN 
	update employe set emp_salaire = emp_salaire * ((1+pourcentage)/100)
	where emp_nom = nom;
end |

/*mysql> delimiter |
mysql> drop procedure if exists majSalaire |
Query OK, 0 rows affected, 1 warning (0.10 sec)

mysql> Create procedure majSalaire(nom varchar(50), pourcentage decimal(3,2))
    -> BEGIN
    -> update employe set emp_salaire = emp_salaire * ((1+pourcentage)/100)
    -> where emp_nom = nom;
    -> end |
Query OK, 0 rows affected (0.22 sec)*/

