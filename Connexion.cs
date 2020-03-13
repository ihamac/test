using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace LiaisonDonnees
{
    class Connexion
    {
        MySqlConnection cnx;
        /// <summary>
        /// accesseur sur cnx
        /// </summary>
        public MySqlConnection Cnx
        { get => cnx; set => cnx = value; }
        /// <summary>
        /// constructeur
        /// </summary>
        /// <param name="h">machine hôte</param>
        /// <param name="user">utilisateur</param>
        /// <param name="pwd">mot de passe utilisateur</param>
        /// <param name="bdd">nom de la base de données</param>
        public Connexion(string h, string user, string pwd, string bdd)
        {
            string sCnx;
            // chaîne de caractères de connexion
            sCnx = String.Format("server={0};uid={1};database={2};port=3306;pwd={3}", h, user, bdd, pwd);
            //création d'un objet connexion
            cnx = new MySqlConnection(sCnx);
        }
        public string ouvrir()
        {
            string message;
            try
            {
                cnx.Open();
                message = "connexion réussie";
            }
            catch (Exception e)
            {
                message = String.Format("echec de la connexion {0}", e.Message);
            }
            return message;
        }
        public void fermer()
        {
            cnx.Close();
        }
    }
}
