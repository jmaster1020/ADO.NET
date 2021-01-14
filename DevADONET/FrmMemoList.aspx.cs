using DevADONET.Models;
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
    public partial class FrmMemoList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // [1] 커넥션
            SqlConnection con = new SqlConnection(ConfigurationManager
                .ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            // [2] 커맨드
            SqlCommand cmd = new SqlCommand("ListMemo", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // [3] 데이터어댑터
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            // [4] 데이터셋
            DataSet ds = new DataSet();
            da.Fill(ds, "Memos");
            // [5] 출력
            ctlMemoList.DataSource = ds;
            ctlMemoList.DataBind();
            // [6] 마무리
            con.Close();

        }
        protected void btnWrite_Click(object sender, EventArgs e)
        {
            // [0] 변수 선언부
            Memo memo = new Memo();
            memo.Name = txtName.Text;
            memo.Email = txtEmail.Text;
            memo.Title = txtTitle.Text;
            memo.PostDate = DateTime.Now;
            memo.PostIp = Request.UserHostAddress;
            // [1] 커넥션
            SqlConnection con = new SqlConnection(ConfigurationManager
                .ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            // [2] 커맨드
            SqlCommand cmd = new SqlCommand("WriteMemo", con);
            //cmd.Connection = con;
            //cmd.Connection = "WriteMemo";
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // [!] 파라미터 추가
            cmd.Parameters.AddWithValue(@"Name", memo.Name);
            cmd.Parameters.AddWithValue(@"Email", memo.Email);
            cmd.Parameters.AddWithValue(@"Title", memo.Title);
            cmd.Parameters.AddWithValue(@"PostIP", memo.PostIp);
            // [!] 실행
            cmd.ExecuteNonQuery();
            // [3] 마무리
            con.Close();
            lblDisplay.Text = "저장되었습니다.";
        }      
    }
}