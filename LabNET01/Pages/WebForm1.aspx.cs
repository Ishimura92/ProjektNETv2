using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabNET01.Pages
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Login Status - przycisk do wylogowywania! ff// 
            /* Eventy odnośnie logowania:
            
             * LoggedIn
             * Response.Redirect("~/pages/admin/Nazwa.aspx");
             * Klasa Roles
             * Roles.IsUserInRole(LoginInput.Name, "Admins") < LoginInput to nazwa kontrolki
             * Kontrolka LoginStatus
             * Kontrolka LoginView <asp:LoginView ID="NazwaKontrolkiLoginView" runat="server">..
             * <AnonymousTemplate> <LoggedInTemplate> <RoleGroups> 
             * ^ co się wyświetla dla danej grupy albo ról, dajemy to w Site.Master
             * 
            */


            // Cookies zawsze w PageLoad!
            HttpCookie cookie = Request.Cookies["CookieCookie1"];
            
            if (cookie == null)
            {
                cookie = new HttpCookie("CookieCookie1");
                cookie.Expires = DateTime.Now.AddDays(1d);
                Response.Cookies.Add(cookie);
                cookie["wartosc"] = "aaa";
                //cookie.Values.Add();
            }

            //Membership.CreateUser("bbb", "BBBB1234!", "bbb@op.pl");
            // ^ ta klasa ma wszystko do edycji danych użytkownika
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // ALT + SHIFT + F10 do importów
            // ręczne łączenie z bazą danych
            string connStr = ConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand command = new SqlCommand();
            //command.CommandText = "SELECT * FROM PRODUCTS";
            string choose = DropDownList1.SelectedValue;
            string item = TextBox2.Text;
            command.CommandText = "UPDATE PRODUCTS SET Name = "+item+" WHERE Id = "+choose;
            command.Connection = conn;

            //SqlDataReader reader;

            conn.Open();
            //reader = command.ExecuteReader();
            command.ExecuteNonQuery();

            /*if (reader.HasRows)
            {
                // jeśli byśmy nie mieli przypiętych danych do GridView:
                //GridView1.DataSource = reader;
                //GridView1.DataBind();

                while (reader.Read())
                {
                    System.Diagnostics.Debug.WriteLine(reader["Name"]);
                }
            }
            */
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Delete();
        }

        protected void ButtonInsert_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Insert();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Update();
        }
    }
}