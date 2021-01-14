using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DevADONET
{
    public partial class FrmMemoView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayData();

            // 넘어온 쿼리스트링 값이 없다면
           if (String.IsNullOrEmpty(Request["Num"]))
            {
                Response.Write("잘못된 요청입니다.");
                Response.End();
            }
            else
            {
                DisplayData();
                lnkMemoModify.NavigateUrl =
                    $"FrmMemoModify.aspx?Num={Request["Num"]}";
                lnkMemoDelete.NavigateUrl =
                    $"FrmMemoDelete.aspx?Num={Request["Num"]}";
            }
        }
        private void DisplayData()
          {
              // [1] 커넥션
              SqlConnection con = new SqlConnection(ConfigurationManager
                  .ConnectionStrings["ConnectionString"].ConnectionString);
              con.Open();
              // [2] 커맨드
              SqlCommand cmd = new SqlCommand("ViewMemo", con);
              cmd.CommandType = System.Data.CommandType.StoredProcedure;
              // [!] 파라미터 추가
              cmd.Parameters.Add("Num", SqlDbType.Int); // 정수형
              cmd.Parameters["Num"].Value = Convert.ToInt32(Request["Num"]);
              // [3] 데이터리더
              SqlDataReader dr = cmd.ExecuteReader();
              if (dr.Read())
              {
                  // [!] 각각의 컨트롤에 바인딩
                  this.lblNum.Text = Request["Num"];
                  this.lblName.Text = dr["Name"].ToString();
                  this.lblEmail.Text = dr[2].ToString();
                  this.lblTitle.Text = dr.GetString(3);
                  this.lblPostDate.Text = dr.GetDateTime(4).ToString();
                  this.lblPostIP.Text = dr.GetString(5);
              }
              else
              {
                  Response.Write("없는 데이터입니다.");
                  Response.End();
              }
              // [4] 마무리
              dr.Close();
              con.Close();
          }    
    }
}

/* private void DisplayData()
 {
     //DataTable 객체 생성 및 Table 이름 명명
     DataTable dt = new DataTable("soccer");

     //TableName에 Column(열) 지정
     DataColumn col1 = new DataColumn();
     col1.DataType = System.Type.GetType("System.String");
     col1.ColumnName = "Num";
     dt.Columns.Add(col1);
     DataColumn col2 = new DataColumn();
     col2.DataType = System.Type.GetType("System.String");
     col2.ColumnName = "Name";
     dt.Columns.Add(col2);
     DataColumn col3 = new DataColumn();
     col3.DataType = System.Type.GetType("System.String");
     col3.ColumnName = "Email";
     dt.Columns.Add(col3);
     DataColumn col4 = new DataColumn();
     col4.DataType = System.Type.GetType("System.String");
     col4.ColumnName = "Title";
     dt.Columns.Add(col4);
     DataColumn col5 = new DataColumn();
     col5.DataType = System.Type.GetType("System.DateTime");
     col5.ColumnName = "PostDate";
     dt.Columns.Add(col5);
     DataColumn col6 = new DataColumn();
     col6.DataType = System.Type.GetType("System.String");
     col6.ColumnName = "PostIp";
     dt.Columns.Add(col6);

     //Table에 값 넣기
     DataRow dr1 = dt.NewRow(); //Row 생성
     dr1["Num"] = "1";
     dr1["Name"] = "김석삼";
     dr1["Email"] = "jmaster1020@gmail.com";
     dr1["Title"] = "우와";
     dr1["PostDate"] = DateTime.Now.ToString("MM/dd/yyyy");
     dr1["PostIp"] = "34";


     dt.Rows.Add(dr1);

     string num = string.Empty;
     string name = string.Empty;
     string email = string.Empty;
     string title = string.Empty;
     string postdate = string.Empty;
     string postip = string.Empty;


     //Table 출력
     for (int row = 0; row < dt.Rows.Count; row++)
     {
         num = dt.Rows[row]["Num"].ToString();
         name = dt.Rows[row]["Name"].ToString();
         email = dt.Rows[row]["Email"].ToString();
         title = dt.Rows[row]["Title"].ToString();
         postdate = dt.Rows[row]["PostDate"].ToString();
         postip = dt.Rows[row]["PostIp"].ToString();

         this.lblNum.Text = num;
         this.lblName.Text = name;
         this.lblEmail.Text = email;
         this.lblTitle.Text = title;
         this.lblPostDate.Text = postdate;
         this.lblPostIP.Text = postip;
     }
 }*/
