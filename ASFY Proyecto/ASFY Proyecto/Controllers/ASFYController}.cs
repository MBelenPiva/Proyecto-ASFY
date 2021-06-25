﻿using System;
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
           //ASFY.InicializarASFY();
            return View();
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
            return View();
        }

        public ActionResult Programas(int codigo)
        {
            ViewBag.Programas = BDD.ObtenerProgramas(codigo);
            return View();
        }
        public ActionResult MiPerfil()
        {
            return View();
        }
        public ActionResult QuienesSomos()
        {
            return View();
        }
    }
}