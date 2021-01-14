<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmMemoList.aspx.cs" Inherits="DevADONET.FrmMemoList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>출력 패턴</title>
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
            <!-- <asp:HyperLink ID="lnkMemoWrite" runat="server"
                NavigateUrl="~/FrmMemoWrite.aspx">글쓰기</asp:HyperLink>-->
            <asp:Button ID="btnpopup" runat="server" Text="글쓰기" OnClientClick="return openPopup()" />
        </div>
    </form>
</body>
</html>
