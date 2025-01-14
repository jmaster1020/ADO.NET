﻿using System;
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
    public partial class FrmMemoDelete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 넘어온 쿼리스트링 값이 없다면
            if (String.IsNullOrEmpty(Request["Num"]))
            {
                Response.Write("잘못된 요청입니다.");
                Response.End();
            }
            else
            {
                // 처음 로드 시만 읽어 오고, 수정 버튼 클릭 시에는 해당 기능만 구현
                if (!Page.IsPostBack)
                {
                    lblNum.Text = Request["Num"];
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager
                .ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            // [2] 커맨드
            SqlCommand cmd = new SqlCommand("DeleteMemo", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // [!] 파라미터 추가
            cmd.Parameters.Add("Num", SqlDbType.Int);
            cmd.Parameters["Num"].Value = Convert.ToInt32(Request["Num"]);
            // [!] 실행
            cmd.ExecuteNonQuery();
            // [3] 마무리
            con.Close();

            lblDisplay.Text = "삭제되었습니다.";

        }
    }
}