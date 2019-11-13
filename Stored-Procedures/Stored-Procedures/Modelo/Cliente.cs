using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Stored_Procedures.Modelo
{
    public class Cliente
    {
        public int id { get; set; }
        public string nome { get; set; }
        public DateTime data_nascimento { get; set; }
        public string cpf { get; set; }


        public Cliente()
        {
            this.id = 0;
            this.nome = "";
            this.data_nascimento = new DateTime();
            this.cpf = "";
        }


        public Cliente( string nome, DateTime data_nascimento, string cpf)
        {
           
            this.nome = nome;
            this.data_nascimento = data_nascimento;
            this.cpf = cpf;
            

        }
    }
}