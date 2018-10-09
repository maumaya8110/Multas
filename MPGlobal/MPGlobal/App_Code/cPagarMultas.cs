using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de cPagarMultas
/// </summary>
public class cPagarMultas
{
    public cPagarMultas()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    public DataSet ConsultaPlaca(string Placa)
    {
        DataSet ds;


        cStore sp = new cStore("spConsultaPlaca", 1);
        sp.AddParameter("@Placa", Placa);
        ds = sp.ObtenDatos();



        return ds;
    }

}