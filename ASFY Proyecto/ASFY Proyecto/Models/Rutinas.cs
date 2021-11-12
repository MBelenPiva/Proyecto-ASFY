using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASFY_Proyecto.Models
{
    public class Rutinas
    {
        private int _codigo;
        private string _Nombre;
        private int _codigoProgramas;
        private string _Link;
        private string _Descripcion;

        public Rutinas()
        {
            _codigo = 0;
            _Nombre = "";
            _codigoProgramas = 0;
            _Link = "";
            _Descripcion = "";
        }

        public Rutinas(int codigo, string Nombre, int codigoProgramas, string Link, string Descripcion)
        {
            _codigo = codigo;
            _Nombre = Nombre;
            _codigoProgramas = codigoProgramas;
            _Link = Link;
            _Descripcion = Descripcion;
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
        public int codigoProgramas
        {
            get
            {
                return _codigoProgramas;
            }

            set
            {
                _codigoProgramas = value;
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

        public string Descripcion
        {
            get
            {
                return _Descripcion;
            }

            set
            {
                _Descripcion = value;
            }
        }

    }

}