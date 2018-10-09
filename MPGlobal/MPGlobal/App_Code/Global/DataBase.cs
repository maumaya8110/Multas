using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Reflection;
using System.Xml.Linq;

/// <summary>
/// Descripción breve de DataBase
/// </summary>
public class DataBase : IDisposable
{

    /// <summary>
    /// Identifica la acción que realizara el SP del Catálogo
    /// </summary>
    public enum TipoAccion
    {
        Consulta = 1,
        Insertar = 2,
        Eliminar = 3,
        Modificar = 4
    }

    /// <summary>
    /// Identifica el tipo de catálogo que se esta afectando
    /// </summary>
    public enum TipoCatalogo
    {
        [StringEnum.StringValue("Sp_Cat_Estados")]
        Estados = 1,
        [StringEnum.StringValue("Sp_Cat_Municipios")]
        Municipios = 2,
        [StringEnum.StringValue("Sp_Cat_Usuarios")]
        Usuarios = 3,
        [StringEnum.StringValue("Sp_Cat_BitacoraCatalogos")]
        BitacoraCatalogos = 4,
        [StringEnum.StringValue("Sp_Cat_Oficina")]
        Oficinas = 5,
        [StringEnum.StringValue("Sp_Cat_Ventanas")]
        Ventana = 6,
        [StringEnum.StringValue("Sp_Cat_Personas")]
        Personas = 7,

        [StringEnum.StringValue("Sp_Cat_TiposMultas")]
        TipoMulta = 8,
        [StringEnum.StringValue("Sp_Cat_Agentes")]
        Agentes = 9,
        [StringEnum.StringValue("Sp_Cat_Placas")]
        Placas = 10,
        [StringEnum.StringValue("Sp_Cat_Procesos")]
        Procesos = 11,
        [StringEnum.StringValue("Sp_Cat_Sistema")]
        Sistemas = 12,
        [StringEnum.StringValue("Sp_Cat_Funciones")]
        Funcion = 13,
        [StringEnum.StringValue("Sp_Cat_Cajeros")]
        Cajeros = 14,
        [StringEnum.StringValue("Sp_Reporte_MultasPagadas")]
         ReporteMultasPagadas = 15,
        [StringEnum.StringValue("Sp_ObtieneMultasSinPagar")]
        ReporteMultasSinPagar = 16,
        [StringEnum.StringValue("Sp_Reporte_Procesadas")]
        ReporteProcesadas = 17
    }

    public enum TipoError
    {
        ErrorConexion,
        Error
    }

    private SqlConnection conn { get; set; }
    public DataBase()
    {
        this.conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
    }

    /// <summary>
    /// Ejecuta el SP para Catalofgos
    /// </summary>
    /// <param name="tipo"></param>
    /// <param name="sp"></param>
    /// <param name="parametros"></param>
    /// <returns></returns>
    public DataSet EjecutaSPCatalogos(TipoAccion tipo, TipoCatalogo catalogo, SqlParameter[] parametros, bool guardaBitacora = true)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlCommand command = new SqlCommand(StringEnum.GetStringValue(catalogo), conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add(new SqlParameter("@TipoMovimiento", (int)tipo));
            if (parametros != null)
            {
                foreach (SqlParameter p in parametros)
                    command.Parameters.Add(p);
            }

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            if (guardaBitacora && tipo != TipoAccion.Consulta)
                guardaBitacoraCatalogo(tipo, catalogo);

            return ds;
        }
        catch (SqlException x)
        {
            throw x;
        }
        catch (Exception x)
        {
            throw x;
        }
    }

    private void guardaBitacoraCatalogo(TipoAccion accion, TipoCatalogo catalogo)
    {
        try
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idMovimiento", (int)accion));
            parametros.Add(new SqlParameter("@idCatalogo", (int)catalogo));
            parametros.Add(new SqlParameter("@usuario", Helper.GetUserID()));
            EjecutaSPCatalogos(TipoAccion.Insertar, TipoCatalogo.BitacoraCatalogos, parametros.ToArray(), false);
        }
        catch (Exception x)
        {
            throw x;
        }
    }

    /// <summary>
    /// Regresa resultados de un SP en DataSet
    /// </summary>
    /// <param name="sp"></param>
    /// <param name="parametros"></param>
    /// <returns></returns>
    public DataSet ObtieneDatos(string sp, SqlParameter[] parametros)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlCommand command = new SqlCommand(sp, conn);
            command.CommandType = CommandType.StoredProcedure;
            if (parametros != null)
                foreach (SqlParameter p in parametros)
                    command.Parameters.Add(p);

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            return ds;
        }
        catch (SqlException x)
        {
            int error = x.ErrorCode;
            throw x;
        }
        catch (Exception x)
        {
            throw x;
        }
    }

    /// <summary>
    /// Ejecuta el SP y regresa el primer valor de la columna que se regresa
    /// </summary>
    /// <param name="sp"></param>
    /// <param name="parametros"></param>
    /// <returns></returns>
    public object EjecutaProcedure(string sp, SqlParameter[] parametros)
    {
        try
        {
            conn.Open();
            SqlCommand command = new SqlCommand(sp, conn);
            command.CommandType = CommandType.StoredProcedure;
            if (parametros != null)
                foreach (SqlParameter p in parametros)
                    command.Parameters.Add(p);

            return command.ExecuteScalar();
        }
        catch (SqlException x)
        {
            throw x;
        }
        catch (Exception x)
        {
            throw x;
        }
        finally
        {
            conn.Close();
        }
    }

    /// <summary>
    /// Ejecuta el SP y regresa la cantidad de registros afectados en el SP
    /// </summary>
    /// <param name="sp"></param>
    /// <param name="parametros"></param>
    /// <returns></returns>
    public int EjecutaProcedureRegresaCountInsertados(string sp, SqlParameter[] parametros)
    {
        try
        {
            SqlCommand command = new SqlCommand(sp, conn);
            if (parametros != null)
                foreach (SqlParameter p in parametros)
                    command.Parameters.Add(p);

            return command.ExecuteNonQuery();
        }
        catch (SqlException x)
        {
            throw x;
        }
        catch (Exception x)
        {
            throw x;
        }
    }

    //private string RegresaCustomError(SqlException x)
    //{
    //    TipoError res = TipoError.Error;
    //    switch (x.Number)
    //    {
    //        case 1:
    //            {

    //            }break;
    //        default:
    //            {
    //                res = TipoError.Error;
    //            }break;
    //    }

    //    return res;
    //}

    public void Dispose() { }
}
