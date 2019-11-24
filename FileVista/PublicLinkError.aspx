<%@ Page Language="C#" CodeBehind="PublicLinkError.aspx.cs" Inherits="GleamTech.FileVista.Web.PublicLinkErrorPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title></title>
    </head>
    <body id="bodyTag" runat="server" style="margin: 20px;">
        <form id="form1" runat="server" defaultbutton="ButtonOK" defaultfocus="Password">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
			<table border="0" cellpadding="0" cellspacing="10" class="gt-panel" style="width: 500px;" align="center">
				<tr>
					<td>
                        <asp:Label ID="LabelTitle" runat="server" style=" font-size: 16pt"></asp:Label>
                    </td>
				</tr>
				<tr>
				    <td><hr /></td>
				</tr>
				<tr>
					<td>
                        <asp:Label ID="LabelDescription" runat="server"></asp:Label>
                    </td>
				</tr>
<%if (PromptForPassword)
  {%>
				<tr>
				    <td align="center">
                        <table cellpadding="4" cellspacing="0" border="0">
                            <tr>
                                <td><asp:Label ID="LabelPassword" runat="server" AssociatedControlID="Password"><%=Language.GetEntry("503")%></asp:Label></td>
                                <td align="right">
                                    <asp:TextBox ID="Password" runat="server" style="width: 200px" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password">!</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <asp:Button ID="ButtonOK" runat="server" style="width: 80px" />&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
				</tr>
<%}
  else
  {%>
				<tr>
				    <td>
                        <asp:Label ID="LabelContact" runat="server"></asp:Label>
                        <br /><br />
                    </td>
				</tr>
<%}%>
            </table>
        </form>
    </body>
</html>
