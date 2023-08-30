using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                Response.Redirect("WebForm8.aspx");
            }
        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());

---------------------------------------------------------------------------------------------------------------------
protected void btnlog_Click(object sender, EventArgs e)
        {
            string sql = "select * from login where email ='" + Txtuser.Text + "' and pass='" + Txtpass.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count.ToString() == "1")
            {
                Session["username"] = Txtuser.Text;
                Response.Redirect("WebForm8.aspx");

            }
        }
