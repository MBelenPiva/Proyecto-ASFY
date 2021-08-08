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
        private int _Altura;
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


        public Usuarios(int codigo, string Nombre, string Apellido, string Email, string Contrasena,
            DateTime FechaDeNacimiento, int Altura, float Peso, string URLFoto, string Direccion)
        {
            _codigo = codigo;
            _Nombre = Nombre;
            _Apellido = Apellido;
            _Email = Email;
            _Contrasena = Contrasena;
            _FechaDeNacimiento = FechaDeNacimiento;
            _Altura = Altura;
            _Peso = Peso;
            _URLFoto = URLFoto;
            _Direccion = Direccion;

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
        public string Email
        {
            get
            {
                return _Email;
            }

            set
            {
                _Email = value;
            }
        }
        public string Contrasena
        {
            get
            {
                return _Contrasena;
            }

            set
            {
                _Contrasena = value;
            }
        }
        public DateTime FechaDeNacimiento
        {
            get
            {
                return _FechaDeNacimiento;
            }

            set
            {
                _FechaDeNacimiento = value;
            }
        }

        public int Altura
        {
            get
            {
                return _Altura;
            }

            set
            {
                _Altura = value;
            }
        }
        public float Peso
        {
            get
            {
                return _Peso;
            }

            set
            {
                _Peso = value;
            }
        }

        public string URLFoto
        {
            get
            {
                return _URLFoto;
            }

            set
            {
                _URLFoto = value;
            }
        }
        public string Direccion
        {
            get
            {
                return _Direccion;
            }

            set
            {
                _Direccion = value;
            }
        }

    }

}


