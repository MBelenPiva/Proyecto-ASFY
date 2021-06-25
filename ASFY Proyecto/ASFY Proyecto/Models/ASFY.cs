using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace ASFY_Proyecto.Models
{
    public class ASFY
    {
        private static List<Rutinas> _listaRutinas = new List<Rutinas>();
        private static List<RutinasPorProgramas> _listaRutinasPorProgramas = new List<RutinasPorProgramas>();
        private static List<RutinasPorProgramas> _listaProgramas = new List<RutinasPorProgramas>();


        public static List<Rutinas> listaRutinas
        {
            get
            {
                return _listaRutinas;
            }

            private set
            {
                _listaRutinas = value;
            }
        }
        public static List<RutinasPorProgramas> listaRutinasPorProgramas
        {
            get
            {
                return _listaRutinasPorProgramas;
            }

            private set
            {
                _listaRutinasPorProgramas = value;
            }
        }

        public static List<RutinasPorProgramas> listaProgramas
        {
            get
            {
                return _listaProgramas;
            }

            private set
            {
                _listaProgramas = value;
            }
        }

        //Metodos
        public static List<Rutinas> ListarRutinas()
        {
            return _listaRutinas;
        }

        public static List<RutinasPorProgramas> ListarProgramas()
        {
            return _listaProgramas;
        }

        public static List<Rutinas> ListarRutinas(int codigoProgramas)
        {
            List<Rutinas> devolver = new List<Rutinas>();
            for (int k = 0; k < _listaProgramas.Count; k++)
            {
                if (codigoProgramas == _listaRutinasPorProgramas[k].codigo)
                {
                    devolver.Add(_listaRutinas[k]);
                }
            }
            return devolver;
        }

        public static List<RutinasPorProgramas> ListarProgramas(int codigo)
        {
            List<RutinasPorProgramas> devolver = new List<RutinasPorProgramas>();
            for (int k = 0; k < _listaProgramas.Count; k++)
            {
                if (codigo == _listaProgramas[k].codigo)
                {
                    devolver.Add(_listaProgramas[k]);
                }
            }
            return devolver;
        }

        public static List<RutinasPorProgramas> ListaRutinasPorProgramas()
        {
            //Este metodo solo busca devolver la lista de programas
            return _listaRutinasPorProgramas;
        }

        public static void InicializarASFY()
        {

          _listaRutinas = BDD.ObtenerRutinas(); //Guardo la lista de rutinas invocando a obtener rutinas que accede a la base de datos
            //_listaProgramas = BDD.ObtenerProgramas();
        }

        public static Rutinas ObtenerRutinas(int codigo)
        {
            Rutinas rutinas = _listaRutinas.Find(x => x.codigo.Equals(codigo)); //Declaro y busco el rutinas
            return rutinas; //Devuelvo las rutinas 
        }

        public static RutinasPorProgramas Programas(int codigo)
        {
            RutinasPorProgramas programas = _listaProgramas.Find(x => x.codigo.Equals(codigo));
            return programas;  //Devuelve una lista de los programas
        }

    }

}