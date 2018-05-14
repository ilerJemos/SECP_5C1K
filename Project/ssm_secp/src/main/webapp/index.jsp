<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="/text/html; charset=UTF-8">
    <title>SECP</title>
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="images/login.js"></script>
    <link href="css/login2.css" rel="stylesheet" type="text/css" />
    <link href="images/favicon.ico" rel="shortcut icon" />
    <script language="javascript">
        function grey()
        {
            document.getElementById("send").setAttribute("disabled", true);
            document.getElementById("send").style.background="#BDBDBD";
            var id = $("#user").val();
            $.ajax({
                type: "post",
                url: "mail",
                data: {
                    id:id
                },
                statusCode: {
                    404: function() {
                        //alert("找不到该页面");
                    }
                },
                success: function(data,textStatus) {
                    alert("Code is sent");
                }
            })
        }
    </script>
</head>
<body>
<h1 style="margin-top:200px;">Freight Management and Presentation System<sup>V2018</sup></h1>

<div class="login" style="margin-top:100px;">

    <div class="header" >
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7"> &nbsp&nbsp&nbspLogin</a>
            <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">&nbsp&nbsp&nbspRegister</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>


    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">

        <!--登录-->
        <div class="web_login" id="web_login">


            <div class="login-box" style="margin-left:auto">


                <div class="login_form">
                    <form action="/login" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post"><input type="hidden" name="did" value="0"/>
                        <input type="hidden" name="to" value="log"/>
                        <div class="uinArea" id="uinArea">
                            <label class="input-tips" for="u">E-mail:</label>
                            <div class="inputOuter" id="uArea">

                                <input type="text" id="u" name="username" class="inputstyle"/>
                            </div>
                        </div>
                        <div class="pwdArea" id="pwdArea">
                            <label class="input-tips" for="p">Password:</label>
                            <div class="inputOuter" id="pArea">

                                <input type="password" id="p" name="p" class="inputstyle"/>
                            </div>
                        </div>

                        <div style="padding-left:40px;margin-top:20px;"><input type="submit" value="Login In" style="width:150px;" class="button_blue"/><a class="zcxy" target="_blank" href="">Forget?</a></div>
                    </form>
                </div>

            </div>

        </div>
        <!--登录end-->
    </div>

    <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">

        <div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8"  action="/register" method="post">
            <input type="hidden" name="to" value="reg"/>
            <input type="hidden" name="did" value="0"/>
            <ul class="reg_form" id="reg-ul">
                <div id="userCue" class="cue">Please note the format</div>
                <li>

                    <label for="user"  class="input-tips2">E-mail:</label>
                    <div class="inputOuter2">
                        <input type="text" id="user" name="user" maxlength="30" class="inputstyle2"/>
                    </div>

                </li>

                <li>
                    <label for="passwd" class="input-tips2">Password:</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd"  name="passwd" maxlength="16" class="inputstyle2"/>
                    </div>

                </li>
                <li>
                    <label for="passwd2" class="input-tips2">VerifyPwd:</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd2" name="" maxlength="16" class="inputstyle2" />
                    </div>

                </li>

                <li>
                    <label for="qq" class="input-tips2" >Code:</label>
                    <div class="inputOuter2" style="float:left">

                        <input type="text" id="qq" name="qq" maxlength="10" class="inputstyle2" style="width:120px"/>
                    </div>

                    <div style="float:left;margin-left:50px;margin-top:3px">

                        <input type="button" id="send"  name="Submit" style="width:70px" class="button_blue" value="Send" onClick="grey();"/>

                    </div>
                </li>
                <li>
                    <div class="inputArea" style="margin-left:50px">
                        <input type="button" id="reg"  style="margin-top:10px;margin-left:25px;width:180px" class="button_blue" value=" Agree and Register "/> <a href="#" class="zcxy" target="_blank">Agreement</a>
                    </div>

                </li><div class="cl"></div>
            </ul></form>
        </div>


    </div>
    <!--注册end-->
</div>
<div class="jianyi">*It is recommended to use IE8 or above IE browser or Chrome core browser to access this site</div>
</body>
</html>