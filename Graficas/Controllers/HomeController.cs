using Graficas.Models;
using Graficas.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Graficas.Controllers
{
    public class HomeController : Controller
    {
        private readonly BdGraficosContext _bdcontext;

        public HomeController(BdGraficosContext context)
        {
            _bdcontext = context;           //Contexto por medio del constructor
        }

        //Metodos para mostrar los graficos
        public IActionResult resumenVenta()
        {
            DateTime FechaInicio = DateTime.Now;
            FechaInicio = FechaInicio.AddDays(-5);

            List<VMVentas> Lista = (from tbventa in _bdcontext.Venta
                                    where tbventa.FechaRegistro.Value.Date >= FechaInicio.Date  //Conseguir la fecha pero donde sea mayor a la fecha de Inicio
                                    group tbventa by tbventa.FechaRegistro.Value.Date into grupo    //Agrupar tbventa
                                    select new VMVentas
                                    {
                                        fecha = grupo.Key.ToString("dd/MM/yyyy"),
                                        cantidad = grupo.Count(),

                                    }).ToList();  

            return StatusCode(StatusCodes.Status200OK, Lista); //Retornamos la lista con una respuestas http 200
        }

        //Metodos para mostrar los graficos
        public IActionResult resumenProducto()
        {
            DateTime FechaInicio = DateTime.Now;
            FechaInicio = FechaInicio.AddDays(-5);

            List<VMProducto> Lista = (from tbdetalleventa in _bdcontext.DetalleVenta
                                    group tbdetalleventa by tbdetalleventa.NombreProducto into grupo    //Agrupar tbventa
                                    orderby grupo.Count() descending
                                    select new VMProducto
                                    {
                                        producto = grupo.Key,
                                        cantidad = grupo.Count(),

                                    }).Take(4).ToList();

            return StatusCode(StatusCodes.Status200OK, Lista); //Retornamos la lista con una respuestas http 200
        }






        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}