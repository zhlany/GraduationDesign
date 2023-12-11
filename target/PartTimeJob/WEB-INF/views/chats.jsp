<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>在线聊天</title>
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jqPaginator.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<!-- 发送邮件 -->
<script type="text/javascript">
    //发送
    function sendEm() {

        if ($("#TYPE").val() == "1") {
            $("#CONTENT").val(getContentTxt());
        } else {
            $("#CONTENT").val(getContent());
        }
        if ($("#EMAIL").val() == "") {
            $("#EMAIL").tips({
                side: 3,
                msg: '请输入邮箱',
                bg: '#AE81FF',
                time: 2
            });
            $("#EMAIL").focus();
            return false;
        }
        if ($("#TITLE").val() == "") {
            $("#TITLE").tips({
                side: 3,
                msg: '请输入标题',
                bg: '#AE81FF',
                time: 2
            });
            $("#TITLE").focus();
            return false;
        }
        if ($("#CONTENT").val() == "") {

            $("#nr").tips({
                side: 1,
                msg: '请输入内容',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }

        var EMAIL = $("#EMAIL").val();
        var TYPE = $("#TYPE").val();
        var TITLE = $("#TITLE").val();
        var CONTENT = $("#CONTENT").val();

        $("#zhongxin").hide();
        $("#zhongxin2").show();

        $.ajax({
            type: "POST",
            url: 'sendEmail',
            data: {
                EMAIL: EMAIL,
                TITLE: TITLE,
                CONTENT: CONTENT
            },
            dataType: 'json',
            //beforeSend: validateData,
            cache: false,
            success: function(data) {
                if ("ok" == data.result) {
                    $("#msg").tips({
                        side: 3,
                        msg: '发送成功！',
                        bg: '#68B500',
                        time: 5
                    });
                    setTimeout("showdiv()", 1000);
                } else {
                    $("#msg").tips({
                        side: 3,
                        msg: '发送失败!',
                        bg: '#68B500',
                        time: 5
                    });
                }

            }
        });

    }
</script>
<body>
Welcome<br/><input id="text" type="text"/>
     <button onclick="send()">发送消息</button>
     <hr/>
    <button onclick="closeWebSocket()">关闭WebSocket连接</button>
    <hr/>
     <div id="message"></div>
 </body>

 <script type="text/javascript">
         var websocket = null;
         //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
                websocket = new WebSocket("ws://localhost:8089/websocket");
            }
       else {
               alert('当前浏览器不支持 websocket')
            }

        //连接发生错误的回调方法
        websocket.onerror = function () {
                setMessageInnerHTML("WebSocket连接发生错误");
             };

         //连接成功建立的回调方法
        websocket.onopen = function () {
                 setMessageInnerHTML("WebSocket连接成功");
             }

         //接收到消息的回调方法
         websocket.onmessage = function (event) {
                setMessageInnerHTML(event.data);
           }

       //连接关闭的回调方法
         websocket.onclose = function () {
                setMessageInnerHTML("WebSocket连接关闭");
            }

         //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
        window.onbeforeunload = function () {
                closeWebSocket();
          }

         //将消息显示在网页上
        function setMessageInnerHTML(innerHTML) {
            document.getElementById('message').innerHTML += innerHTML + '<br/>';
             }

         //关闭WebSocket连接
        function closeWebSocket() {
                websocket.close();
         }

       //发送消息
         function send() {
                var message = document.getElementById('text').value;
                websocket.send(message);
            }
</script>
</body>

</html>
