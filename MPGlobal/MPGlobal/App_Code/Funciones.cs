using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for ClsGeneral
/// </summary>
public static class Funciones
{
    public static SqlConnection Con;

    #region Funcion Conexion

    public static Boolean Conectar()
    {
        Con = new SqlConnection();
        Con.ConnectionString = (ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());


        if (Con.State == ConnectionState.Open)
        {
            Con.Close();
        }

        try
        {
            Con.Open();
            return true;
        }
        catch
        {

            return false;

        }

    }

    #endregion

    #region Funcion Desconexion
    public static void Desconectar()
    {
        Con.Close();
    }

    #endregion


    #region ABC_Catalogos
    public static DataSet ABC_Catalogos(string TipoCatalogo,string TipoMovimiento, string IdEstado,string NomEstado  , string SiglasEstado , string Contacto , string Telefono , string Correo,
			                             string IdLicencia , string estatusEstado)
    {
        string error;
        if (Funciones.Conectar() == false)
        {
            return null;
        }
        else
        {
            DataSet xDS = new DataSet();
            SqlCommand Command = new SqlCommand();

            Command.Connection = Funciones.Con;
            Command.CommandType = CommandType.StoredProcedure;
            Command.CommandText = TipoCatalogo;
            Command.CommandTimeout = 50000;
            SqlDataAdapter Adapter;
            Adapter = new SqlDataAdapter(Command);


            if (TipoMovimiento == "")
            { Command.Parameters.Add(new SqlParameter("@TipoMovimiento", SqlDbType.VarChar)).Value = ""; }
            else
            { Command.Parameters.Add(new SqlParameter("@TipoMovimiento", SqlDbType.VarChar)).Value = TipoMovimiento; }


            if (IdEstado == "")
            { Command.Parameters.Add(new SqlParameter("@IdEstado", SqlDbType.VarChar)).Value = ""; }
            else
            { Command.Parameters.Add(new SqlParameter("@IdEstado", SqlDbType.VarChar)).Value = IdEstado; }


            if (NomEstado == "")
            { Command.Parameters.Add(new SqlParameter("@NomEstado", SqlDbType.VarChar)).Value = ""; }
            else
            { Command.Parameters.Add(new SqlParameter("@NomEstado", SqlDbType.VarChar)).Value = NomEstado; }


            if (SiglasEstado == "")
            { Command.Parameters.Add(new SqlParameter("@SiglasEstado", SqlDbType.VarChar)).Value = ""; }
            else
            { Command.Parameters.Add(new SqlParameter("@SiglasEstado", SqlDbType.VarChar)).Value = SiglasEstado; }


            if (Contacto == "")
            { Command.Parameters.Add(new SqlParameter("@Contacto", SqlDbType.VarChar)).Value = ""; }
            else
            { Command.Parameters.Add(new SqlParameter("@Contacto", SqlDbType.VarChar)).Value = Contacto; }


            if (Telefono == "")
            { Command.Parameters.Add(new SqlParameter("@Telefono", SqlDbType.VarChar)).Value = ""; }
            else
            { Command.Parameters.Add(new SqlParameter("@Telefono", SqlDbType.VarChar)).Value = Telefono; }


            if (Correo == "")
            { Command.Parameters.Add(new SqlParameter("@Correo", SqlDbType.VarChar)).Value = ""; }
            else
            { Command.Parameters.Add(new SqlParameter("@Correo", SqlDbType.VarChar)).Value = Correo; }


            if (IdLicencia == "")
            { Command.Parameters.Add(new SqlParameter("@IdLicencia", SqlDbType.VarChar)).Value = ""; }
            else
            { Command.Parameters.Add(new SqlParameter("@IdLicencia", SqlDbType.VarChar)).Value = IdLicencia; }


            if (estatusEstado == "")
            { Command.Parameters.Add(new SqlParameter("@estatusEstado", SqlDbType.VarChar)).Value = ""; }
            else
            { Command.Parameters.Add(new SqlParameter("@estatusEstado", SqlDbType.VarChar)).Value = estatusEstado; }

            try
            {
                Adapter.Fill(xDS, "Tabla");
                return xDS;
            }
            //catch (SqlException exc)
            catch (Exception ex)
            {
                error = ex.Message;
                return null;
            }
            finally { Funciones.Desconectar(); }

        }
    }
    #endregion

    

}
