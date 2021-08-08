using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASFY_Proyecto.Models
{
    public class login
    {
        public static bool inicioSesion(string nombre, string contrasena)
        {
            EntidadesDataContext context = new EntidadesDataContext();
            int usuarioId = 0; 
            var query = context.Usuario.Where()
        }

    }
}