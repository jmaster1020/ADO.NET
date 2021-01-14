<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmMemoList.aspx.cs" Inherits="DevADONET.FrmMemoList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>출력 패턴</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function openPopup() {

            window.open("FrmMemoWrite.aspx", "_blank", "width=600, height=600, scrollbars=no, menubar=no, resizable=yes, directories=no, location=no");

        }
    </script>
    <script type="text/javascript">
        function openWindow(Num) {
            window.open('FrmMemoDelete.aspx?Num=' + Num, 'open_window', ' width=640, height=480, left=0, top=0');
        }
    </script>
    <script type="text/javascript">
        function openWindow1(Num) {
            window.open('FrmMemoView.aspx?Num=' + Num, 'open_window1', ' width=640, height=480, left=0, top=0');
        }
    </script>

    <script>
        function showfunc() {
            $("#dialog").dialog({
                title: "GridView",
                width: 450,

                modal: true
            });

            return false;
        }
    </script>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <style>
        .layer_bg {
            position: fixed;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.7);
            left: 0;
            top: 0
        }

        .layer_wrap {
            position: absolute;
            width: 300px;
            height: 250px;
            background: #fff;
            text-align: center
        }
    </style>

    <script>
        $(function () {
            // 레이어 display none 상태
            $(".layer_bg, .layer_wrap").hide();
            //레이어팝업 위치 지정 function 만들기
            function layer_position() {
                var win_W = $(window).width();
                var win_H = $(window).height();
                $(".layer_wrap").css({ 'left': (win_W - 300) / 2, 'top': (win_H - 100) / 2 });
            };
            //레이어팝업 open 상태 function 만들기
            function layer_open(no) {
                $(".layer_wrap[layer=" + no + "]").fadeIn();
                $(".layer_bg").fadeIn();
                layer_position();
                //레이어 영역 외 바탕화면 클릭시 화면 닫기
                $(".layer_bg").click(function (e) {
                    if (!$(".layer_wrap").has(e.target).length) {
                        layer_close();
                    };
                });
            };
            //레이어팝업 close 상태 function 만들기
            function layer_close() {
                $(".layer_wrap, .layer_bg").fadeOut();
            };
            //링크 클릭시 해당 레이어팝업 호출
            $(".btn_layer").click(function () {
                var no = $(this).attr("layer");
                layer_open(no);
            });
            //닫기 버튼 클릭시 레이어 닫기
            $(".btn_close").click(function () {
                layer_close();
            });
            //반응형 대응 - 레이어 위치 잡기
            $(window).resize(function () {
                layer_position();
            });
        })
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>메모 리스트</h3>
            <asp:GridView ID="ctlMemoList" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="번호" DataField="Num" />
                    <asp:BoundField HeaderText="작성자" DataField="Name" />
                    <asp:HyperLinkField HeaderText="메모"
                        DataTextField="Title"
                        DataNavigateUrlFormatString="FrmMemoView.aspx?Num={0}"
                        DataNavigateUrlFields="Num" />
                    <asp:TemplateField HeaderText="작성일">
                        <ItemTemplate>
                            <%# Eval("PostDate") %>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="메모지">
                        <ItemTemplate>
                            <a href="#" onclick='openWindow1("<%# Eval("Num") %>");'>"Title"</a>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="삭제">
                        <ItemTemplate>
                            <a href="#" onclick='openWindow("<%# Eval("Num") %>");'>삭제</a>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="체크">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkDelete" runat="server" Text="Select" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <hr />
            <!--<asp:HyperLink ID="lnkMemoWrite" runat="server"
        NavigateUrl="~/FrmMemoWrite.aspx">글쓰기</asp:HyperLink>-->
            <asp:Button ID="btnpopup" runat="server" Text="글쓰기" OnClientClick="return openPopup()" />
                </div>
   
        <div class="wrap">
        <div class="layer_bg"></div>
        <button onclick="myFunction()">Click me</button>
                <a href="javascript:;" class="btn_layer" layer="1">글쓰기</a>
                <div class="layer_wrap" layer="1">
            <h3>데이터 입력</h3>
            이름: <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
            이메일: <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
            메모: <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnWrite" runat="server" Text="저장"
                OnClick="btnWrite_Click" />
            <hr />
            <asp:Label ID="lblDisplay" runat="server"></asp:Label><br />

                    <a href="javascript:;" class="btn_close">닫기</a>
                </div>

    </div>

    </form>
</body>
</html>
