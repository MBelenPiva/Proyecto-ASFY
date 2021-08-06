using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASFY_Proyecto.Models
{
    public class Usuarios
    {
        private int _codigo;
        private string _Nombre;
        private string _Apellido;
        private string _Email;
        private string _Contrasena;
        private DateTime _FechaDeNacimiento;
        private float _Altura;
        private float _Peso;
        private string _URLFoto;
        private string _Direccion;

        public Usuarios()
        {
            _codigo = 0;
            _Nombre = "";
            _Apellido = "";
            _Email = "";
            _Contrasena = "";
            _FechaDeNacimiento = ;
            _Altura = 0;
            _Peso = 0;
            _URLFoto = "";
            _Direccion = "";
        }


        public int codigo
        {
            get
            {
                return _codigo;
            }

            set
            {
                _codigo = value;
            }
        }

        public string Nombre
        {
            get
            {
                return _Nombre;
            }

            set
            {
                _Nombre = value;
            }
        }
        public string Apellido
        {
            get
            {
                return _Apellido;
            }

            set
            {
                _Apellido = value;
            }
        }
        public string Link
        {
            get
            {
                return _Link;
            }

            set
            {
                _Link = value;
            }
        }

    }

}


}