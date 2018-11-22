using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de cAltaMultas
/// </summary>
public class cAltaMultas
{
    public cAltaMultas()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    public string GuardaMulta(DataTable dtMultaDetalle, string cveEdo, string cveMpo, string idusuario, string placa, string folio, string calle1, string calle2, string crucero, string boleta,
string fecha, string idagente, string descripcion, string licencia, decimal monto, string edoPlaca)
    {



        try
        {

            string foliofinal = GeneraFolio( int.Parse(cveEdo), int.Parse(cveMpo));

            int idfolioE;
            int idfolioD;
            cStore sp = new cStore("spAltaMultaEncabezado", 1);

            sp.AddParameter("@idEstado", cveEdo);
            sp.AddParameter("@idMunicipio", cveMpo);
            sp.AddParameter("@idboleta", boleta);
            sp.AddParameter("@idplaca", placa);
            sp.AddParameter("@FolioMulta", foliofinal);
            sp.AddParameter("@fechaMulta", fecha);
            sp.AddParameter("@Calle1Multa", calle1);
            sp.AddParameter("@Calle2Multa", calle2);
            sp.AddParameter("@CRUCERO", crucero);
            sp.AddParameter("@Descripcion", descripcion);
            sp.AddParameter("@idAgente", idagente);
            sp.AddParameter("@Nolicencia", licencia);
            sp.AddParameter("@Capturista", idusuario);
            sp.AddParameter("@Monto", monto.ToString());
            sp.AddParameter("@idEstadoPlaca", edoPlaca);
            // sp.Ejecuta(idfolioE)
            string F = sp.ObtenDatos().Tables[0].Rows[0][0].ToString();


            if (Int32.Parse(F) > 0)
            {
                for (int x = 0; x <= dtMultaDetalle.Rows.Count - 1; x++)
                {
                    cStore spD = new cStore("spAltaDetalleMultas", 1);
                    spD.AddParameter("@id_multa", F);
                    spD.AddParameter("@idEstado", cveEdo);
                    spD.AddParameter("@idMunicipio", cveMpo);
                    spD.AddParameter("@idboleta", boleta);
                    spD.AddParameter("@FolioMulta", foliofinal);
                    spD.AddParameter("@idplaca", placa);
                    spD.AddParameter("@idmulta", dtMultaDetalle.Rows[x][0].ToString());
                    spD.AddParameter("@importemulta", dtMultaDetalle.Rows[x][2].ToString().Replace(",", ""));
                    DataSet dtx = spD.ObtenDatos();///.Tables[0];//spD.Ejecuta(  idfolioD);
                }


                return foliofinal;
                //"ok"
            }
            else
            {
                return "Error";
            }
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }

    }


    public string GeneraFolio( int cveEdo,  int cveMpo)
    {
        DataTable dt;
        cStore sp = new cStore("spDameCveMpo", 1);
        sp.AddParameter("@cveEdo", cveEdo);
        sp.AddParameter("@cveMpo", cveMpo);
        dt = sp.ObtenDatos().Tables[0];
        string sigla;
        if (dt.Rows.Count > 0)
        {
            sigla = dt.Rows[0]["Sigla"].ToString();
            // + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString()
        }
        else
        {
            sigla = "";
        }

        return sigla;
    }

    public DataTable catEstados()
    {
        DataTable dt;


        cStore sp = new cStore("catEstado", 1);

        // sp.AddParameter("@usuario", usuario)

        dt = sp.ObtenDatos().Tables[0];



        return dt;
    }


    public DataTable catMunicipiosXEdo( int cveEdo)
    {
        DataTable dt;

        cStore sp = new cStore("catMunicipioXEstado", 1);

        sp.AddParameter("@cveEdo", cveEdo);

        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }

    public DataTable catAgentes( int cveEdo,  int cveMpo)
    {
        DataTable dt;
        cStore sp = new cStore("catAgentes", 1);
        sp.AddParameter("@cveEdo", cveEdo);
        sp.AddParameter("@cveMpo", cveMpo);

        dt = sp.ObtenDatos().Tables[0];
        return dt;
    }

    public DataTable catTipoMulta( int cveEdo,  int cveMpo)
    {
        DataTable dt;
        cStore sp = new cStore("catTipoMulta", 1);
        sp.AddParameter("@cveEdo", cveEdo);
        sp.AddParameter("@cveMpo", cveMpo);

        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }


    public DataTable catTipoMultaMonto( int cveEdo,  int cveMpo,  int tipo)
    {
        DataTable dt;
        cStore sp = new cStore("catTipoMultaMonto", 1);
        sp.AddParameter("@cveEdo", cveEdo);
        sp.AddParameter("@cveMpo", cveMpo);
        sp.AddParameter("@cveTipoMulta", tipo);

        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }


}