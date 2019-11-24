<%@ Page Language="C#" CodeBehind="ManagePublicLinksDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.ManagePublicLinksDialogPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title></title>
    </head>
    <body>
        <script type="text/javascript"<%=Request.Browser.Browser == "IE"
                            && Request.Browser.MajorVersion <= 8 ? " defer" : "" %>>
            var managePublicLinksDialog = new GleamTech.FileVista.ManagePublicLinksDialog(<%=SerializedParameters%>);
        </script>
    </body>
</html>
