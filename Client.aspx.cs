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
    public partial class Client : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-FSVMCRR;Initial Catalog=TICKET;Integrated Security=True");

        private Class.Data DataClient = new Class.Data();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ShowListeClient();
            }
        }
        private void ShowListeClient()
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT* FROM Client ";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridViewListClient.DataSource = dt;
            GridViewListClient.DataBind();
            con.Close();
        }

        protected void GridViewListClient_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewListClient.EditIndex = e.NewEditIndex;
        }

        protected void GridViewListClient_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewListClient.EditIndex = -1;
            ShowListeClient();
        }

        protected void GridViewListClient_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE Client SET Nom=@Nom,Telephone=@Tel,Mail=@Mail WHERE ID = @ID ";
            cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(GridViewListClient.DataKeys[e.RowIndex].Value.ToString()));
            cmd.Parameters.AddWithValue("@Nom", (GridViewListClient.Rows[e.RowIndex].FindControl("TxtNom") as TextBox).Text.Trim());
            cmd.Parameters.AddWithValue("@Tel", (GridViewListClient.Rows[e.RowIndex].FindControl("TxtTel") as TextBox).Text.Trim());
            cmd.Parameters.AddWithValue("@Mail", (GridViewListClient.Rows[e.RowIndex].FindControl("TxtMail") as TextBox).Text.Trim());
            cmd.ExecuteNonQuery();
            con.Close();
            GridViewListClient.EditIndex = -1;
            ShowListeClient();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT Client VALUES(@Nom,@Tel,@Mail) ";
            cmd.Parameters.AddWithValue("@Nom", TxtNom.Text);
            cmd.Parameters.AddWithValue("@Tel", TxtTelephone.Text);
            cmd.Parameters.AddWithValue("@Mail",TxtMail.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ShowListeClient();
            TxtNom.Text = "";
            TxtTelephone.Text = "";
            TxtMail.Text = "";
        }

        protected void GridViewListClient_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "DELETE FROM Client WHERE ID=@ID";
            cmd.Parameters.AddWithValue("@ID",GridViewListClient.DataKeys[e.RowIndex].Value.ToString());
            cmd.ExecuteNonQuery();         
            con.Close();
            ShowListeClient();
        }

        protected void GridViewListClient_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="Ticket")
            {
                //ScriptManager.RegisterStartupScript(this,this.GetType(),"alert","alert('ok');",true);
                int a = Convert.ToInt32(e.CommandArgument);
                Class.Data.InfosClient.Clear();
                DataClient = new Class.Data
                {

                    ID = a.ToString(),
                };
                Class.Data.InfosClient.Add(DataClient);
                Response.Redirect("ListeTicket");
            }
        }
    }
}