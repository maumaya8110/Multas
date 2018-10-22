using System.Data;

/// <summary>
/// Descripción breve de cMultas
/// </summary>
public class cMultas
{
    public cMultas()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    public DataSet reciboEdoCuentaMulta(string placa, string tipo)
    {
        DataSet ds;


        cStore sp = new cStore("spConsultaPlacaDetalles", 1);

        sp.AddParameter("@Placa", placa);
        sp.AddParameter("@tipo", int.Parse(tipo));

        ds = sp.ObtenDatos();



        return ds;
    }


    public DataSet reciboPagoMulta(string placa, string tipo)
    {
        DataSet ds;


        cStore sp = new cStore("spPagoRecibo", 1);

        sp.AddParameter("@Placa", placa);
        sp.AddParameter("@tipo", int.Parse(tipo));

        ds = sp.ObtenDatos();



        return ds;
    }
}