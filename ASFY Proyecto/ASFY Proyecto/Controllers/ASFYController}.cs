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
            }
            else
            {
                // SI EXISTE!
            }

            return View("InicioSesion");
        }

        public ActionResult Registrarse()
        {
            return View();
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
        public ActionResult MiPerfil(int idUsuario)
        {
            ViewBag.Usuario = BDD.ObtenerRutinaPorId(idUsuario);
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