<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="../easyui/demo/demo.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
</head>
<body>

<table id="dg" title="Freight Orders" class="easyui-datagrid" style="width:100%;height:100%"
       toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="f_name" width="50">Product Name</th>
        <th field="f_name_code" width="50">Product Code</th>
        <th field="f_from_city" width="50">From</th>
        <th field="f_to_city" width="50">To</th>
        <th field="f_total" width="50">Is Total</th>
        <th field="f_truck_num" width="50">Truck Number</th>
        <th field="f_ton" width="50">Ton Number</th>
    </tr>
    </thead>
    <c:forEach items="${list}" var="item">
         <tr>
            <td>${item.f_name }</td>
            <td>${item.f_name_code }</td>
            <td>${item.f_from_city }</td>
            <td>${item.f_to_city }</td>   
            <td>${item.f_total }</td>
            <td>${item.f_truck_num }</td>
            <td>${item.f_ton }</td>        
        </tr>
    </c:forEach>
</table>

<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New Order</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit Order</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">Remove Order</a>
    <div >
        <form action="search.name" style="float:left">
            <input type="text"  name = "name" value =${hint}>
            <input type="submit" class="easyui-linkbutton" value = "Name Inquiry">
        </form>
        <form action="search.from" style="float:left">
            <input type="text"  name = "from" value =${hint1}>
            <input type="submit" class="easyui-linkbutton" value = "From Inquiry">
        </form>
        <form action="search.to" style="float:left width=300px">
            <input type="text" name = "to" value =${hint2}>
            <input type="submit" class="easyui-linkbutton" value = "To Inquiry">
        </form>
    </div>
</div>

<div id="dlg" class="easyui-dialog" style="width:400px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
        <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">Order Information</div>
        <div style="margin-bottom:10px">
            <input name="f_name" class="easyui-textbox" required="true" label="Product Name:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="f_name_code" class="easyui-textbox" required="true" label="Product Code:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="f_from_city" class="easyui-textbox" required="true" label="From:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="f_to_city" class="easyui-textbox" required="true" label="To:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="f_total" class="easyui-textbox" required="true" label="Is Total:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="f_truck_num" class="easyui-textbox" required="true" validType="number" label="TruckNumber:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="f_ton" class="easyui-textbox" required="true" label="TonNumber:" style="width:100%">
        </div>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>
<script type="text/javascript">
    var url;
    function newUser(){
        $('#dlg').dialog('open').dialog('center').dialog('setTitle','New Order');
        $('#fm').form('clear');
        url = 'insert';
    }
    function editUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit Order');
            $('#fm').form('load',row);
            url = ''+row.id;
        }
    }
    function saveUser(){
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
            	alert("Success to insert");
                return $(this).form('validate');
            },
            success: function(result){
                var result = eval('('+result+')');
                alert(result.success);
                alert(result.errorMsg);
                if (result.errorMsg){
                    $.messager.show({
                        title: 'Error',
                        msg: result.errorMsg
                    });
                } else {
                    $('#dlg').dialog('close');        // close the dialog
                    $('#dg').datagrid('reload');    // reload the user data
                }
            }
        });
    }
    function destroyUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $.messager.confirm('Confirm','Are you sure you want to destroy this order?',function(r){
                if (r){
                    $.post('',{id:row.id},function(result){
//                        alert('asdsasasd'+result);
                        if (result.success){
                            $('#dg').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: 'Error',
                                msg: result.errorMsg
                            });
                        }
                    },'json');
                }
            });
        }
    }
</script>
</body>
</html>