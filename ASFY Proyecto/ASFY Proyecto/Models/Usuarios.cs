using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASFY_Proyecto.Models
{
    public class Usuarios
    {
        public int Codigo{ get; set; }

        public string Nombre{ get; set; }
        public string Apellido{ get; set; }
        public string Email{ get; set; }
        public string Contrasena{ get; set; }
        public DateTime FechaDeNacimiento{ get; set; }
        public int Altura{ get; set; }
        public float Peso{ get; set; }
        public string URLFoto{ get; set; }
        public string Direccion{ get; set; }

        public string Sexo { get; set; }

        public Usuarios()
        {
            Codigo = 0;
            Nombre = "";
            Apellido = "";
            Email = "";
            Contrasena = "";
            FechaDeNacimiento = DateTime.MinValue;
            Altura = 0;
            Peso = 0;
            URLFoto = "";
            Direccion = "";
            Sexo = "";
        }


        public Usuarios(int codigo, string Nombre, string Apellido, string Email, string Contrasena,
            DateTime FechaDeNacimiento, int Altura, float Peso, string URLFoto, string Direccion)
        {
            this.Codigo = codigo;
            this.Nombre = Nombre;
            this.Apellido = Apellido;
            this.Email = Email;
            this.Contrasena = Contrasena;
            this.FechaDeNacimiento = FechaDeNacimiento;
            this.Altura = Altura;
            this.Peso = Peso;
            this.URLFoto = URLFoto;
            this.Direccion = Direccion;
            this.Sexo = Sexo;

        }
    }

}


