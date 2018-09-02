using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MPGlobal;

public partial class AltaUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Asigna los titulos de la pagina
        MasterPage  master = (MasterPage)this.Master;
        master.setTitle("Alta Usuario");
    }
}