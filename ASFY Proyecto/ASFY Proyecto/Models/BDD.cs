using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace ASFY_Proyecto.Models
{
    public static class BDD
    {
        private static string _connectionString = @"Server=A-CBO-01; Database=ASFY; Trusted_Connection=True";

        private static SqlConnection Conectar() 
        {
            SqlConnection con = new SqlConnection(_connectionString);
            con.Open();
            return con;
        }

        private static bool Desconectar(SqlConnection con)
        {
            bool pudoDesconectar;
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
                pudoDesconectar = true;
            }
            else
            {
                pudoDesconectar = false;
            }
            return pudoDesconectar;
        }

        public static List<Rutinas> ObtenerRutinas()
        {
            List<Rutinas> listaRutinas = new List<Rutinas>();
            SqlConnection con = BDD.Conectar();
            SqlCommand consulta = con.CreateCommand();
            consulta.CommandText = "Select * from Rutinas";
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                int Id= Convert.ToInt32(lector["Id"]);
                int IdProgrmas = Convert.ToInt32(lector["IdPrograma"]);
                string Nombre = lector["Nombre"].ToString();
                string Link = lector["Link"].ToString();


                Rutinas rutinas = new Rutinas(Id, Nombre, IdProgrmas, Link);
                listaRutinas.Add(rutinas);
            }
            BDD.Desconectar(con);
            return listaRutinas;
        }


        public static Rutinas ObtenerRutinaPorId(int intId)
        {
            Rutinas rutinas = new Rutinas();
            SqlConnection con = BDD.Conectar();
            SqlCommand consulta = con.CreateCommand();
            consulta.CommandText = "Select * from Rutinas WHERE id="+ intId.ToString();
            SqlDataReader lector = consulta.ExecuteReader();
            if (lector.Read())
            {
                int Id = Convert.ToInt32(lector["Id"]);
                int IdProgrmas = Convert.ToInt32(lector["IdPrograma"]);
                string Nombre = lector["Nombre"].ToString();
                string Link = lector["Link"].ToString();


                rutinas = new Rutinas(Id, Nombre, IdProgrmas, Link);
            }
            BDD.Desconectar(con);
            return rutinas;
        }

        public static List<Programas> ObtenerProgramas()
        {
            List<Programas> listaProgramas = new List<Programas>();
            SqlConnection con = BDD.Conectar();
            SqlCommand consulta = con.CreateCommand();
            consulta.CommandText = "Select * from Programas";
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                int Id = Convert.ToInt32(lector["Id"]);
                string Nombre = lector["Nombre"].ToString();
                string Descripcion = lector["Descripcion"].ToString();
                int IdCategoria = Convert.ToInt32(lector["IdCategoria"]);


                Programas programas = new Programas(Id, Nombre, Descripcion, IdCategoria);
                listaProgramas.Add(programas);
            }
            BDD.Desconectar(con);
            return listaProgramas;
        }

        public static List<Rutinas> ObtenerRutinasPorProgramas(int codigoProgramas)
        {
            List<Rutinas> listaRutinasPorProgramas = new List<Rutinas>();
            SqlConnection con = BDD.Conectar();
            SqlCommand consulta = con.CreateCommand();
            consulta.CommandText = "Select * from Rutinas where IdPrograma = @Id";
            consulta.Parameters.AddWithValue("@Id", codigoProgramas);
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                int Id = Convert.ToInt32(lector["Id"]);
                int IdProgrmas = Convert.ToInt32(lector["IdPrograma"]);
                string Nombre = lector["Nombre"].ToString();
                string Link = lector["Link"].ToString();

                Rutinas rutinas = new Rutinas(Id, Nombre, IdProgrmas, Link);
                listaRutinasPorProgramas.Add(rutinas);
            }
            BDD.Desconectar(con);
            return listaRutinasPorProgramas;
        }

        public static Usuarios ObtenerUsuarioPorId(int intId)
        {
            Usuarios usuarios = new Usuarios();
            SqlConnection con = BDD.Conectar();
            SqlCommand consulta = con.CreateCommand();
            consulta.CommandText = "Select * from Usuarios WHERE id=" + intId.ToString();
            SqlDataReader lector = consulta.ExecuteReader();
            if (lector.Read())
            {
                int Id = Convert.ToInt32(lector["Id"]);
                string Nombre = lector["Nombre"].ToString();
                string Apellido = lector["Apellido"].ToString();
                string Email = lector["Email"].ToString();
                int Altura = Convert.ToInt32(lector["Altura"]);
                float Peso = Convert.ToInt32(lector["Peso"]);
                string Contrasena = lector["Contrasena"].ToString();
                DateTime FechaDeNacimiento = Convert.ToDateTime(lector["FechaDeNacimiento"]);
                string URLFoto = lector["URLFoto"].ToString();
                string Direccion = lector["Direccion"].ToString();

                usuarios = new Usuarios(Id, Nombre, Apellido, Email, Altura, Peso, Contrasena,
                FechaDeNacimiento, URLFoto, Direccion);
            }
            BDD.Desconectar(con);
            return usuarios;
        }

    }
}
