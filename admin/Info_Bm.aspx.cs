using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;
using System.Configuration;
using System.IO;


namespace SCard.admin
{
    public partial class Info_Bm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {

            if (!IsPostBack)
            {
          
                //执行删除
                if (Request.Params["id"] != null)//Request.Params传递参数ID=0
                {

                    string sSql;
                    sSql = "delete   tblMode  where id=" + Request.Params["id"];
                    DBConn myDB1 = new DBConn();
                    myDB1.ExecuteNonQuery(sSql );
                    myDB1.Close();
                }
                //执行编辑
                if (Request.Params["Editid"] != null)
                {
                    AddButton.Visible = false;
                    EditButton.Visible = true;
                    EditButton.ToolTip = Request.Params["Editid"];
                    getFieldVaule();
                    getFieldVaule();
                }

                BindGrid();
                
            }
        }

        private Boolean CheckPut()
        {
            if (txtTitle.Text.Trim() == "" || this.txtRate.Text.Trim() == "")         
            {
                Response.Write("<script>alert(\"请输入完整资料!\");</script>");
                return false;
            }
            else 
            { return true; }
       　　 }


        protected void EditButton_Click(object sender, EventArgs e)
        {//修改记录
           
              
               if (CheckPut() )
          {
              string sSql = "Update tblMode set 名称= '" + txtTitle.Text.Trim() + "',备注='" + txtRate.Text.Trim() + "' where id=" + EditButton.ToolTip;
              DBConn myDB1 = new DBConn();
              myDB1.ExecuteNonQuery(sSql );
              myDB1.Close();
          }
            
            BindGrid();
            txtRate.Text = " ";
            txtTitle.Text = " ";
            AddButton.Visible = true;
            EditButton.Visible = false;
            
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
          if (CheckPut())
          {
              string sSql = "Insert into tblMode (名称,备注) values ( '" + txtTitle.Text.Trim() + "','" + txtRate.Text.Trim() + "')";
              DBConn myDB1 = new DBConn();
              myDB1.ExecuteNonQuery(sSql );
              myDB1.Close();
          }  
              BindGrid();
              txtTitle.Text = "";
              txtRate.Text = "";
        }

        void BindGrid()
        {
            string sql = "select * from tblMode";
            DBConn myDB1 = new DBConn();
            DataSet ds = new DataSet();
            DataGrid1.DataSource = myDB1.getDataSet(sql).Tables[0];
            DataGrid1.DataBind();
            lbl_count.Text = myDB1.getDataSet(sql).Tables[0].Rows.Count.ToString();
        }

      
        private void  getFieldVaule()
        {
            string strSql = "select * from tblMode where id=" + EditButton.ToolTip;
            DBConn myDB1 = new DBConn();
            SqlDataReader dr = myDB1 .getDataReader(strSql );
            if (dr.Read())
            {
                txtTitle.Text = dr["名称"].ToString ();
               
            }
            else 
            {
                txtRate.Text = dr["备注"].ToString ();
            }

        }
    }
}