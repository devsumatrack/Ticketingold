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
    public partial class AjoutTicket : System.Web.UI.Page
    {

        private SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-FSVMCRR;Initial Catalog=TICKET;Integrated Security=True");

        private string ID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Class.DT.Modifier)
                {
                    Label1.Text = "MODIFIER";
                    foreach (var L in Class.DTT.InfosClient)
                    {
                        ID = L.ID;
                        GetInfos();
                    }
                    
                } else
                {
                    Label1.Text = "AJOUT";
                    SetDate();
                }
            }
            
        }

        private void SetDate()
        {
            string Day = DateTime.Now.Day.ToString();
            if (Day.Length <= 1)
            {
                Day = "0" + Day + "";
            }
            string Month = DateTime.Now.Month.ToString();
            if (Month.Length <= 1)
            {
                Month = "0" + Month + "";
            }
            string year = DateTime.Now.Year.ToString();

            BtnDTD.Text = "" + Day + "/" + Month + "/" + year + "";
            BtnDTF.Text = "" + Day + "/" + Month + "/" + year + "";


        }
        private void GetInfos()
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT* FROM Table_Client WHERE ID=@ID";
            cmd.Parameters.AddWithValue("@ID",ID);
            SqlDataReader reader = cmd.ExecuteReader();
            if(reader.Read())
            {
                while(reader.HasRows)
                {
                    string Categorie = reader.GetValue(2).ToString().Trim();
                    string Classification = reader.GetValue(3).ToString().Trim();
                    string Statut = reader.GetValue(4).ToString().Trim();
                    string Creation = reader.GetValue(5).ToString().Trim();
                    string Attribue = reader.GetValue(7).ToString().Trim();
                    string DateD = reader.GetValue(8).ToString().Trim();
                    string DateF = reader.GetValue(9).ToString().Trim();
                    string Dure = reader.GetValue(10).ToString().Trim();

                    TxtCategorie.Text = Categorie;
                    TxtClassification.Text = Classification;
                    DropDownListStatut.Text = Statut;
                    DropDownListAttribue.Text = Attribue;
                    BtnDTD.Text = DateD;
                    BtnDTF.Text = DateF;
                    Label1.Text = "ID";
                }
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CalendarDebut.Visible =true;
            CalendarFin.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            CalendarFin.Visible = true;
            CalendarDebut.Visible = false;

        }

        protected void CalendarDebut_SelectionChanged(object sender, EventArgs e)
        {
            string Day = CalendarDebut.SelectedDate.Day.ToString();
            if (Day.Length <= 1)
            {
                Day = "0" + Day + "";
            }
            string Month = CalendarDebut.SelectedDate.Month.ToString();
            if (Month.Length <= 1)
            {
                Month = "0" + Month + "";
            }
            string year = CalendarDebut.SelectedDate.Year.ToString();

            BtnDTD.Text = ""+Day+"/"+Month+"/"+year+"";
            CalendarDebut.Visible = false;
            LblDure.Text = (DateTime.Parse(BtnDTF.Text) - DateTime.Parse(BtnDTD.Text)).ToString();
        }

        protected void CalendarFin_SelectionChanged(object sender, EventArgs e)
        {
            string Day = CalendarFin.SelectedDate.Day.ToString();
            if (Day.Length <= 1)
            {
                Day = "0" + Day + "";
            }
            string Month = CalendarFin.SelectedDate.Month.ToString();
            if (Month.Length <= 1)
            {
                Month = "0" + Month + "";
            }
            string year = CalendarFin.SelectedDate.Year.ToString();

            BtnDTF.Text = "" + Day + "/" + Month + "/" + year + "";
            CalendarFin.Visible = false;
            LblDure.Text = (DateTime.Parse(BtnDTF.Text) - DateTime.Parse(BtnDTD.Text)).ToString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT INTO Table_Client VALUES(@ID,@Categorie,@Classification,@Statut,@Creation,@Groupe,@Attribue,@DateCreation,@DateFin,@Dure,@Commentaire)";
            foreach (var L in Class.Data.InfosClient)
            {
                cmd.Parameters.AddWithValue("@ID", L.ID);
            }
            cmd.Parameters.AddWithValue("@Categorie",TxtCategorie.Text);
            cmd.Parameters.AddWithValue("@Classification", TxtClassification.Text);
            cmd.Parameters.AddWithValue("@Statut", DropDownListStatut.Text);
            cmd.Parameters.AddWithValue("@Creation", "BBS");
            cmd.Parameters.AddWithValue("@Groupe", "BBS");
            cmd.Parameters.AddWithValue("@Attribue", DropDownListAttribue.Text);
            cmd.Parameters.AddWithValue("@DateCreation", BtnDTD.Text);
            cmd.Parameters.AddWithValue("@DateFin", BtnDTF.Text);
            cmd.Parameters.AddWithValue("@Dure", LblDure.Text);
            cmd.Parameters.AddWithValue("@Commentaire", TxtCommentaire.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("ListeTicket");
        }
    }
}