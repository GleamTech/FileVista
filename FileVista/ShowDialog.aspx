<%@ Page Language="C#" CodeBehind="ShowDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.ShowDialogPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title></title>
    </head>
    <body>
		<form id="formInfo" action="">
            <input type="hidden" name="dialog" value="<%=InsertDialog%>" />
            <input type="hidden" name="actionBasePath" value="<%=ActionBasePath%>" />
            <input type="hidden" name="fileUltimateResourceBasePath" value="<%=InsertFileUltimateResourceBasePath%>" />
            <input type="hidden" name="dialog1text" value="<%=Language.GetEntry("602")%>" />
            <input type="hidden" name="dialog2text" value="<%=Language.GetEntry("531")%>" />
		</form>
    </body>
</html>
