<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ToolshedWebServices.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
    <script>
        function SendWorkOrderReq()
        {
            $.post("WebForm1.aspx", 
                { name: 'xx', password: 'aaa' }, function (data) {
                    alert(data);
                } );
        }

    </script>
<body>
    <input type="button" onclick="SendWorkOrderReq()"  value="Click me!">
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
