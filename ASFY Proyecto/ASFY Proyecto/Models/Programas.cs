    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASFY_Proyecto.Models
{
    public class Programas
    {
        private int _codigo;
        private string _Nombre;
        private string _Descripcion;
        private int _codigoCategoria;

        public Programas(int codigo, string Nombre, string Descripcion,int _codigoCategoria)
        {
            _codigo = codigo;
            _Nombre = Nombre;
            _Descripcion = Descripcion;
            _codigoCategoria = codigoCategoria;

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


        public int codigoCategoria
        {
            get
            {
                return _codigoCategoria;
            }

            set
            {
                _codigoCategoria = value;
            }
        }



    }
}