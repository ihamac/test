using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;


namespace CorrectionControle
{
    class Program
    {
        static void Main(string[] args)
        {
            int choix;
            string sCnx;
            decimal mtBudget;
            MySqlConnection Cnx;
            MySqlCommand Cmd;
            MySqlDataReader Rdr;
            // chaîne de caractères de connexion
            sCnx = "server=localhost;uid=root;database=gesper;port=3306;pwd=siojjr";

            //création d'un objet connexion
            Cnx = new MySqlConnection(sCnx);
            //ouverture de la connexion
            try
            {
                Cnx.Open();
                Console.WriteLine("connexion réussie");
            }
            catch (Exception e)
            {
                Console.WriteLine("erreur connexion " + e.Message.ToString());
            }
            do
            {
                do
                {
                    Console.WriteLine("1 - liste complète des employés (utiliser une requête)");
                    Console.WriteLine("2 - liste complète des services (utiliser la table, sans écrire de requête)");
                    Console.WriteLine("3 - budget moyen des services administratifs");
                    Console.WriteLine("4 - liste des employés ne possédant pas de diplome ");
                    Console.WriteLine("5 - fin du traitement");
                    Console.WriteLine();
                    choix = Int32.Parse(Console.ReadLine());
                } while (choix < 0 || choix > 5);
                switch (choix)
                {
                    case 1:
                        Console.WriteLine("1 - liste complète des employés (utiliser une requête)");
                        // la commande
                        Cmd = new MySqlCommand();
                        Cmd.Connection = Cnx;
                        Cmd.CommandType = CommandType.Text;
                        Cmd.CommandText = "select * from employe;";
                        try
                        {
                            Rdr = Cmd.ExecuteReader();
                            while (Rdr.Read())
                            {
                                // avec le numéro de la colonne                
                                Console.WriteLine(Rdr["emp_id"].ToString() + " " + Rdr["emp_nom"].ToString() + " " + Rdr["emp_prenom"].ToString() + " " + Rdr["emp_salaire"].ToString());
                            }
                            Rdr.Close();

                        }
                        catch (Exception e)
                        {
                            Console.WriteLine("{0} ", e.Message);
                        }
                        Console.WriteLine();
                        break;
                    case 2:
                        Console.WriteLine("2 - liste complète des services (utiliser la table, sans écrire de requête)");
                        // la commande 
                        Cmd = new MySqlCommand();
                        Cmd.CommandText = "service;";
                        Cmd.CommandType = CommandType.TableDirect;
                        try
                        {
                            Rdr = Cmd.ExecuteReader();
                            while (Rdr.Read())
                            {
                                Console.WriteLine(Rdr["ser_id"].ToString() + " " + Rdr["ser_designation"].ToString() + " " + Rdr["ser_type"].ToString());
                            }
                            Rdr.Close();
                        }
                        catch(Exception e)
                        {
                            Console.WriteLine("{0} ", e.Message);
                        }
                        Console.WriteLine();
                        break;

                    case 3:
                        Console.WriteLine("3 - budget moyen des services administratifs");
                        Cmd = new MySqlCommand();
                        Cmd.Connection = Cnx;
                        Cmd.CommandType = CommandType.Text;
                        Cmd.CommandText = "select ser_designation, avg(ser_budget) from service where ser_type = 'A';";

                        try
                        {
                            mtBudget = Cmd.ExecuteScalar();
                            Console.WriteLine(mtBudget["ser_designation"].toString() + " " + mtBudget["avg(ser_budget)"].toString());
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine("{0} ", e.Message);
                        }
                        Console.WriteLine();
                        break;

                    case 4:
                        Console.WriteLine("4 - liste des employés ne possédant pas de diplome");
                        Cmd = new MySqlCommand();
                        Cmd.Connection = Cnx;
                        Cmd.CommandType = CommandType.Text;
                        Cmd.CommandText = "SELECT emp_nom,emp_prenom,ser_designation FROM service s INNER JOIN employe e on s.ser_id = e.emp_service WHERE emp_id NOT IN(SELECT pos_employe FROM posseder); ";

                        MySqlDataReader pasDiplome;
                        pasDiplome = Cmd.ExecuteReader();
                        try
                        {
                            while (pasDiplome.Read())
                            {
                                Console.WriteLine(pasDiplome["emp_nom"].ToString() + " " + pasDiplome["emp_prenom"].ToString());
                            }

                        }

                        catch (Exception e)
                        {
                            Console.WriteLine("{0} ", e.Message);
                        }

                        pasDiplome.Close();
                        Console.WriteLine();
                        break;
                    case 5:

                        Console.WriteLine("Fin du traitement");
                        break;
                }
            }
            while (choix != 5);

            Console.ReadLine();

        }
        }
    }

