using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace ASFY_Proyecto.Models
{
    public static class BDD
    {
        private static string _connectionString = @"Server=A-CRO-05; Database=ASFY; Trusted_Connection=True";

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
                string Descripcion = lector["Descripcion"].ToString();


                Rutinas rutinas = new Rutinas(Id, Nombre, IdProgrmas, Link, Descripcion);
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
                string Descripcion = lector["Descripcion"].ToString();

                rutinas = new Rutinas(Id, Nombre, IdProgrmas, Link, Descripcion);
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
                string Descripcion = lector["Descripcion"].ToString();

                Rutinas rutinas = new Rutinas(Id, Nombre, IdProgrmas, Link, Descripcion);
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
                usuarios.Codigo             = Convert.ToInt32(lector["Id"]);
                usuarios.Nombre             = (lector["Nombre"] == DBNull.Value) ? "" : Convert.ToString(lector["Nombre"]);
                usuarios.Apellido           = (lector["Apellido"] == DBNull.Value) ? "" : lector["Apellido"].ToString();
                usuarios.Email              = (lector["Email"] == DBNull.Value) ? "" : lector["Email"].ToString();
                usuarios.Altura             = (lector["Altura"] == DBNull.Value) ? 0 : Convert.ToInt32(lector["Altura"]);
                usuarios.Peso               = (lector["Peso"] == DBNull.Value) ? 0 : Convert.ToInt32(lector["Peso"]);
                usuarios.Contrasena         = (lector["Contrasena"] == DBNull.Value) ? "" : lector["Contrasena"].ToString();
                usuarios.FechaDeNacimiento  = (lector["FechaDeNacimiento"] == DBNull.Value) ? DateTime.MinValue : Convert.ToDateTime(lector["FechaDeNacimiento"]);
                usuarios.URLFoto            = (lector["URLFoto"] == DBNull.Value) ? "" : lector["URLFoto"].ToString();
                usuarios.Direccion          = (lector["Direccion"] == DBNull.Value) ? "" : lector["Direccion"].ToString();
                usuarios.Sexo               = (lector["Sexo"] == DBNull.Value) ? "" : lector["Sexo"].ToString();

            }
            BDD.Desconectar(con);
            return usuarios;
        }

        public static Usuarios ObtenerUsuario(string email, string contrasena)
        {
            Usuarios usuarios = new Usuarios();
            SqlConnection con = BDD.Conectar();
            SqlCommand consulta = con.CreateCommand();
            consulta.CommandText = "Select * from Usuarios WHERE email='" + email + "' AND contrasena='" + contrasena + "'";
            SqlDataReader lector = consulta.ExecuteReader();
            if (lector.Read())
            {
                usuarios.Codigo = Convert.ToInt32(lector["Id"]);
                usuarios.Nombre = (lector["Nombre"] == DBNull.Value) ? "" : Convert.ToString(lector["Nombre"]);
                usuarios.Apellido = (lector["Apellido"] == DBNull.Value) ? "" : lector["Apellido"].ToString();
                usuarios.Email = (lector["Email"] == DBNull.Value) ? "" : lector["Email"].ToString();
                usuarios.Altura = (lector["Altura"] == DBNull.Value) ? 0 : Convert.ToInt32(lector["Altura"]);
                usuarios.Peso = (lector["Peso"] == DBNull.Value) ? 0 : Convert.ToInt32(lector["Peso"]);
                usuarios.Contrasena = (lector["Contrasena"] == DBNull.Value) ? "" : lector["Contrasena"].ToString();
                usuarios.FechaDeNacimiento = (lector["FechaDeNacimiento"] == DBNull.Value) ? DateTime.MinValue : Convert.ToDateTime(lector["FechaDeNacimiento"]);
                usuarios.URLFoto = (lector["URLFoto"] == DBNull.Value) ? "" : lector["URLFoto"].ToString();
                usuarios.Direccion = (lector["Direccion"] == DBNull.Value) ? "" : lector["Direccion"].ToString();
                usuarios.Sexo = (lector["Sexo"] == DBNull.Value) ? "" : lector["Sexo"].ToString();

            }

            BDD.Desconectar(con);
            return usuarios;
        }

        public static int IngresarUsuario(string nombre, string apellido, string email, DateTime FechaDeNacimiento, string contrasena)
        {
            int     intUltimoId;
            object  returnObject;
            SqlConnection con = BDD.Conectar();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = "Usuarios_Insert";
            cmd.CommandType= CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Nombre", nombre);
            cmd.Parameters.AddWithValue("@Apellido", apellido);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@FechaDeNacimiento", FechaDeNacimiento);
            cmd.Parameters.AddWithValue("@Contrasena", contrasena);

            returnObject = cmd.ExecuteScalar();
            intUltimoId = Convert.ToInt32(returnObject);
           
            BDD.Desconectar(con);
            return intUltimoId;
        }

        public static int IngresarEdicionUsuario(string nombre, string email, DateTime FechaDeNacimiento, string sexo, string direccion) 
        {
            int intUltimoId;
            object returnObject;
            SqlConnection con = BDD.Conectar();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = "Usuarios_Insert";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Nombre", nombre);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@FechaDeNacimiento", FechaDeNacimiento);
            cmd.Parameters.AddWithValue("@Sexo", sexo);
            cmd.Parameters.AddWithValue("@Direccion", direccion);

            returnObject = cmd.ExecuteScalar();
            intUltimoId = Convert.ToInt32(returnObject);

            BDD.Desconectar(con);
            return intUltimoId;
        }

    }
}
