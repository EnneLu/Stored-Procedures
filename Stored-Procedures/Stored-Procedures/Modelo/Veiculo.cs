using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Stored_Procedures.Modelo
{
    public class Veiculo
    {
        public int id { get; set; }
        public string fabricante { get; set; }
        public string modelo { get; set; }
        public int ano_fabricante { get; set; }
        public string placa { get; set; }
        public string uf { get; set; }

        public Veiculo()
        {
            this.id = 0;
            this.fabricante = "";
            this.modelo = "";
            this.ano_fabricante = 0;
            this.placa = "";
            this.uf = "";
        }

        public Veiculo(int id, string fabricante, string modelo, int ano_fabricante, string placa, string uf)
        {
            this.id = id;
            this.fabricante = fabricante;
            this.modelo = modelo;
            this.ano_fabricante = ano_fabricante;
            this.placa = placa;
            this.uf = uf;
        }
    }
}