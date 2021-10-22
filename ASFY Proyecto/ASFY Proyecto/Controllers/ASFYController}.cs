using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASFY_Proyecto.Models;

namespace ASFY_Proyecto.Controllers
{
    public class ASFYController : Controller
    {
        public ActionResult InicioSesion()
        {
           ASFY.InicializarASFY();
            return View();
        }


        public ActionResult Logout()
        {
            // Elimino el Usuario de la SESSION!
            Session["USUARIO"] = null;
            return View("InicioSesion");
        }

        [HttpPost]
        public ActionResult Login()
        {
            string email = Request["email"];
            string contrasena = Request["contrasena"];
            

            Usuarios user;
            user = BDD.ObtenerUsuario(email, contrasena);


            if (user.Codigo == 0)
            {
                // NO EXISTE!
                ViewBag.error = "usuario/contrasena incorrecto";
            }
            else
            {
                // Agrego el Usuario a la SESSION!
                Session["USUARIO"] = user;
                ViewBag.encontrado = "usuario encontrado";
            }

            return View("Home");
        }

        public ActionResult MiPerfil()
        {
            return View();
        }

        public ActionResult Registrarse()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Ingresar()
        {
            Usuarios nuevoUsuario;
            
            int intUltimoId;
            string nombre = Request["txtNombre"];
            string apellido = Request["txtApellido"];
            string email = Request["txtEmail"];
            DateTime FechaDeNacimiento = Convert.ToDateTime(Request["txtFechaDeNacimiento"]);
            string contrasena = Request["txtContrasena"];

            
            intUltimoId  = BDD.IngresarUsuario(nombre, apellido, email, FechaDeNacimiento, contrasena);
            nuevoUsuario = BDD.ObtenerUsuarioPorId(intUltimoId);


            return View("InicioSesion");
        }

        public ActionResult Home()
        {
            return View();
        }

        public ActionResult RutinasPorProgramas(int codigoProgramas)
        {
            ViewBag.RutinasMostrarProgramas = BDD.ObtenerRutinasPorProgramas(codigoProgramas);
            ViewBag.Programas = BDD.ObtenerProgramas();
            return View();
        }

        public ActionResult LinkVideo(int idRutina)
        {
            ViewBag.Rutina = BDD.ObtenerRutinaPorId(idRutina);
            return View();
        }

        public ActionResult Programas()
        {
            ViewBag.Programas = BDD.ObtenerProgramas();
            return View();
        }
        
        public ActionResult Calendario()
        {
            return View();
        }
        public ActionResult QuienesSomos()
        {
            return View();
        }
    }
}