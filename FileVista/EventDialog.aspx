<%@ Page Language="C#" CodeBehind="EventDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.EventDialogPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title><%=Language.GetEntry("646")%></title>
    </head>
    <body>
        <form id="form1" runat="server">
			<table cellpadding="0" cellspacing="10" border="0" style="width: 100%">
                <tr>
                    <td style="width: 50px"><%=Language.GetEntry("616")%>:</td>
                    <td><asp:Label ID="LabelType" runat="server" Text="Label"></asp:Label></td>
                    <td style="width: 50px"><%=Language.GetEntry("617")%>:</td>
                    <td><asp:Label ID="LabelDate" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td><%=Language.GetEntry("619")%>:</td>
                    <td><asp:Label ID="LabelUser" runat="server" Text="Label"></asp:Label></td>
                    <td><%=Language.GetEntry("618")%>:</td>
                    <td><asp:Label ID="LabelTime" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <%=Language.GetEntry("557")%>:<br />
                        <asp:TextBox ID="TextBoxDescription" runat="server" style="width: 360px; height: 150px; resize:none" TextMode="MultiLine" ReadOnly="true" Wrap="false"></asp:TextBox>
                    </td>
                </tr>
            </table>
			<div class="gt-formBottom"><asp:Button ID="Button1" runat="server" Text="Button" style="width: 80px" OnClientClick="elementDialog.close(); return false;" /></div>
        </form>
    </body>
</html>
