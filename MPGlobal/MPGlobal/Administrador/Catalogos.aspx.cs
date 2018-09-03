using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Catalogos : System.Web.UI.Page
{

    public string TipoCatalogo = "";
    public string TipoMovimiento = "";

    protected void Page_Load(object sender, EventArgs e)
    {

    }



  

    protected void DropCatalogos_SelectedIndexChanged(object sender, EventArgs e)
    {

        TipoMovimiento = "CONSULTAR";

        LlenaGrid();


    }

    public void LlenaGrid()
    {
        //DropCatalogos.SelectedItem.ToString()

        TipoCatalogo = "Sp_Cat_Estados";

        DataSet SqlDS13;
        SqlDS13 = Funciones.ABC_Catalogos(TipoCatalogo, TipoMovimiento, "","","","","","","","");
        try
        {
            if (SqlDS13.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = SqlDS13.Tables[0];
                GridView1.DataBind();                

            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }
        catch
        {

        }

    }
}