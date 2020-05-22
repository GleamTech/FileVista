<%@ Page Language="C#" CodeBehind="Default.aspx.cs" Inherits="GleamTech.FileVista.Web.DefaultPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title></title>
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
        <link rel="icon" type="image/x-icon" href="favicon.ico" />
    </head>
    <body>
        <asp:Literal ID="HeaderConfig" runat="server"></asp:Literal>
        <asp:PlaceHolder ID="fileManagerPlaceHolder" runat="server" />
    </body>
</html>
