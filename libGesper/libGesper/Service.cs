using System;
using System.Collections.Generic;
using System.Text;

namespace TPGesper
{
    class Service
    {
        //données membre;
        private int id;
        private string designation;
        private char type;
        private string produit;
        private int capacite;
        private decimal budget;

        public Service(int id, string designation, char type, string produit, int capacite, decimal budget)
        {
            this.Id = id;
            this.Designation = designation;
            this.Type = type;
            this.Produit = produit;
            this.Capacite = capacite;
            this.Budget = budget;
        }

        public int Id {
            get => id; set => id = value;
        }
        public string Designation {
            get => designation; set => designation = value;
        }
        public char Type {
            get => type; set => type = value;
        }
        public string Produit {
            get => produit; set => produit = value;
        }
        public int Capacite {
            get => capacite; set => capacite = value;
        }
        public decimal Budget {
            get => budget; set => budget = value;
        }

        /// <summary>
        /// Méthode ToSrting 
        /// </summary>
        /// <returns> chaine de caractere </returns>
        public override string ToString()
        {
            string chaine;
            chaine = String.Format("Service {0} n°{1} de type :", designation, id);
            if (type == 'P')
            {
                chaine += String.Format("Production de {0} pour une capacité de {1}", produit, capacite);

            }
            if (type == 'A')
            {
                chaine += String.Format("Comptabilité pour un budget de {0}", budget);
            }
            return chaine;
        }
    }
}
