using System.Data;

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

    //public DataTable ValidaSesionCaja(int idusuario)
    //{
    //    DataTable dt;


    //    cStore sp = new cStore("spValidaSesion", 1);
    //    sp.AddParameter("@idusuario", idusuario);
    //    dt = sp.ObtenDatos().Tables[0];



    //    return dt;
    //}

    public DataSet ConsultaPlaca(string Placa)
    {
        DataSet ds;


        cStore sp = new cStore("spConsultaPlaca", 1);
        sp.AddParameter("@Placa", Placa);
        ds = sp.ObtenDatos();



        return ds;
    }



    public DataSet PagoMultas(string montosolicitado, string montopagado, string idusuario, string placa, string folios, string nombre, string paterno, string materno, string calle,
        string colonia, string rfc, string celular, string correo, string idedo, string idmpo)
    {
        DataSet ds;


        cStore sp = new cStore("spRegistroPago", 1);
        sp.AddParameter("@MontoSolicitado", montosolicitado);
        sp.AddParameter("@MontoPagado", montopagado);
        sp.AddParameter("@idUsuario", idusuario);
        sp.AddParameter("@placa", placa);
        sp.AddParameter("@folios", folios);
        sp.AddParameter("@Nombre", nombre);
        sp.AddParameter("@appaterno", paterno);
        sp.AddParameter("@apmaterno", materno);
        sp.AddParameter("@calle", calle);
        sp.AddParameter("@colonia", colonia);
        sp.AddParameter("@rfc", rfc);
        sp.AddParameter("@celular", celular);
        sp.AddParameter("@correo", correo);
        sp.AddParameter("@idEdo", idedo);
        sp.AddParameter("@idMpo", idmpo);

        ds = sp.ObtenDatos();



        return ds;
    }

}