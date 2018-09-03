using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Descripción breve de DataBase
/// </summary>
public class DataBase: IDisposable
{
    public enum TipoAccion
    {
        Consulta = 1,
        Insertar = 2,
        Eliminar = 3,
        Modificar = 4
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
    public DataSet EjecutaSPCatalogos(TipoAccion tipo, string sp, SqlParameter[] parametros)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlCommand command = new SqlCommand(sp, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add(new SqlParameter("@TipoMovimiento", (int)tipo));
            if (parametros != null)
            {
                foreach (SqlParameter p in parametros)
                    command.Parameters.Add(p);
            }

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            return ds;
        }
        catch(SqlException x)
        {
            throw x;
        }
        catch(Exception x)
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
            if(parametros != null)
                foreach(SqlParameter p in parametros)
                    command.Parameters.Add(p);

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            return ds;
        }
        catch(SqlException x)
        {
            int error = x.ErrorCode;
            throw x;
        }
        catch(Exception x)
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
            SqlCommand command = new SqlCommand(sp, conn);
            if (parametros != null)
                foreach (SqlParameter p in parametros)
                    command.Parameters.Add(p);

            return command.ExecuteScalar();
        }
        catch(SqlException x)
        {
            throw x;
        }
        catch(Exception x)
        {
            throw x;
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