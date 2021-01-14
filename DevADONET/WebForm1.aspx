<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DevADONET.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
<%--    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
            height: 100px;
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
    </script>--%>
</head>
<body>
    <div class="wrap">
        <div class="layer_bg"></div>
        <ul>
            <li>
                <a href="javascript:;" class="btn_layer" layer="1">팝업 열기 1번</a>
                <div class="layer_wrap" layer="1">
                    <p>안녕하세요 레이어팝업 1번 창입니다.</p>
                    <a href="javascript:;" class="btn_close">닫기</a>
                </div>
            </li>
            <li>
                <a href="javascript:;" class="btn_layer" layer="2">팝업 열기 2번</a>
                <div class="layer_wrap" layer="2">
                    <p>안녕하세요 레이어팝업 2번 창입니다.</p>
                    <a href="javascript:;" class="btn_close">닫기</a>
                </div>
            </li>
            <li>
                <a href="javascript:;" class="btn_layer" layer="3">팝업 열기 3번</a>
                <div class="layer_wrap" layer="3">
                    <p>안녕하세요 레이어팝업 3번 창입니다.</p>
                    <a href="javascript:;" class="btn_close">닫기</a>
                </div>
            </li>
        </ul>
    </div>
</body>
</html>
