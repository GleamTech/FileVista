<%@ Page Language="C#" CodeBehind="UserImportDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.UserImportDialog" %>
<%@ Register TagPrefix="GleamTech" Namespace="GleamTech.FileVista.Web" Assembly="GleamTech.FileVista" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title>Import Users</title>
    </head>
    <body>
    <GleamTech:UserImportControl runat="server" 
        DisplayMode="Viewport"
        ProductInfoRendered="False" />
    </body>
</html>
