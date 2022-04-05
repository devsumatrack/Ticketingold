using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Ticketing
{
    public partial class ListeTicket : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-FSVMCRR;Initial Catalog=TICKET;Integrated Security=True");

        private Class.DataIDTicket DataClient = new Class.DataIDTicket();

        private Class.DTT Data = new Class.DTT();

        private string ID;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                foreach (var L in Class.Data.InfosClient)
                {
                    ID = L.ID;
                    ShowTicket();
                }
                
            }
            
        }

        private void ShowTicket()
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT* FROM Table_Client WHERE IDClient=@ID ";          
            cmd.Parameters.AddWithValue("@ID",ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            GridViewTicket.DataSource = dt;
            GridViewTicket.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Class.DT.Modifier = false;
            Response.Redirect("AjoutTicket");
        }

        protected void GridViewTicket_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="EditTicket")
            {
               
                Class.DT.Modifier = true;
                Class.DTT.InfosClient.Clear();
                Data = new Class.DTT
                {
                    ID = e.CommandArgument.ToString(),
                };
                Class.DTT.InfosClient.Add(Data);
                Response.Redirect("AjoutTicket");
            }
        }
    }
}