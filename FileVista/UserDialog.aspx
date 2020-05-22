<%@ Page Language="C#" CodeBehind="UserDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.UserDialogPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title><%=Language.GetEntry("545")%></title>
    </head>
    <body>
        <form id="form1" runat="server" autocomplete="off">
            <asp:HiddenField ID="ClientMessage" runat="server" />
            <asp:HiddenField ID="OnLoadCommand" runat="server" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
			<table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
              <tr valign="top">
                    <td>
                        <table cellpadding="4" cellspacing="0" border="0">
				            <tr>
				                <td style="width: 100px"><%=Language.GetEntry("593")%></td>
				                <td>
				                    <asp:TextBox ID="Username" runat="server" style="width: 250px" MaxLength="50"></asp:TextBox>
				                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Username">!</asp:RequiredFieldValidator>
			                   </td>
			                </tr>
				            <tr><td><%=Language.GetEntry("594")%></td><td><asp:TextBox ID="Fullname" runat="server" style="width: 250px" MaxLength="50"></asp:TextBox></td></tr>
				            <tr>
				                <td><%=Language.GetEntry("595")%></td>
				                <td>
				                    <asp:TextBox ID="Email" runat="server" style="width: 250px" MaxLength="50"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">!</asp:RegularExpressionValidator>
				                </td>
			                </tr>
				            <tr><td><%=Language.GetEntry("Label.Column.Description")%>:</td><td><asp:TextBox ID="Description" runat="server" style="width: 250px" MaxLength="100"></asp:TextBox></td></tr>
				            
                            <% if (IsApplicationUser){ %>
                            <tr><td colspan="2"><hr /></td></tr>
                            <tr><td colspan="2">
                                <asp:CheckBox ID="CheckBoxChangePassword" runat="server" />
                                <table cellpadding="4" cellspacing="0" border="0" style="margin-left: 20px; margin-top: 5px">
				                    <tr>
				                        <td><asp:Label ID="LabelPassword" runat="server" AssociatedControlID="Password"><%=Language.GetEntry("503")%></asp:Label></td>
				                        <td align="right">
				                            <asp:TextBox ID="Password" runat="server" style="width: 150px" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password">!</asp:RequiredFieldValidator>
                                        </td>
			                        </tr>
				                    <tr>
				                        <td><asp:Label ID="LabelPasswordConfirm" runat="server" AssociatedControlID="PasswordConfirm"><%=Language.GetEntry("596")%></asp:Label></td>
				                        <td align="right">
				                            <asp:TextBox ID="PasswordConfirm" runat="server" style="width: 150px" TextMode="Password"></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PasswordConfirm" ControlToValidate="Password">!</asp:CompareValidator>
                                        </td>
				                    </tr>
                                </table>
                             </td></tr>
                            <tr><td colspan="2">
                                <asp:CheckBox ID="CheckBox3" runat="server" />
                                <br /><asp:CheckBox ID="CheckBox2" runat="server" />
                                <br /><asp:CheckBox ID="CheckBox1" runat="server" />
                            </td></tr>
                            <% } %>

                            <tr><td colspan="2"><hr /></td></tr>
                            <tr><td colspan="2">
                                <asp:CheckBox ID="CheckBox4" runat="server" />
                                <br /><asp:CheckBox ID="CheckBox5" runat="server" />
                            </td></tr>
                        </table>
                    </td>
                </tr>
			</table>
			<div class="gt-formBottom"><asp:Button ID="Button1" runat="server" style="width: 80px" OnClick="Button1_Click" />&nbsp;<asp:Button ID="Button2" runat="server" Text="Button" style="width: 80px" OnClientClick="elementDialog.close(); return false;" /></div>
        </form>
    </body>
</html>
