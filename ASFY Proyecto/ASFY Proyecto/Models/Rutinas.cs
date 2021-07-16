﻿using System;
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

        public Rutinas(int codigo, string Nombre, int codigoProgramas, string Link)
        {
            _codigo = codigo;
            _Nombre = Nombre;
            _codigoProgramas = codigoProgramas;
            _Link = Link;
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

    }

}