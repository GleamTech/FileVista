<%@ Page Language="C#" CodeBehind="UserSettingsDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.UserSettingsDialogPage" %>
<%@ Import Namespace="GleamTech.FileVista.Models" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title><%=Language.GetEntry("FileVista.Action.UserSettings")%></title>
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:HiddenField ID="ClientMessage" runat="server" />
            <asp:HiddenField ID="OnLoadCommand" runat="server" />
            <asp:HiddenField ID="CommandUrl" runat="server" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
			<table cellpadding="4" cellspacing="0" border="0" style="width: 100%;">
<%if (!ChangePasswordOnly){%>			
                <tr>
                    <td><%=Language.GetEntry("Label.DisplayLanguage")%>:</td>
                    <td><asp:DropDownList ID="DisplayLanguagesDropDownList" runat="server" style="width: 250px"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><%=Language.GetEntry("Label.FormatLanguage")%>:</td>
                    <td><asp:DropDownList ID="FormatLanguagesDropDownList" runat="server" style="width: 250px"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2"><hr /></td>
                </tr>
<%} %>
<%if (User.Type == UserType.Application) {%>                
                <tr>
                    <td colspan="2">
                        <asp:CheckBox ID="CheckBoxChangePassword" runat="server" />
                        <table cellpadding="4" cellspacing="0" border="0"  style="margin-left: 20px; margin-top: 5px">
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
                     </td>
                 </tr>
<%} %>
            </table>
			<div class="gt-formBottom"><asp:Button ID="Button1" runat="server" style="width: 80px" OnClick="Button1_Click" />&nbsp;<asp:Button ID="Button2" runat="server" Text="Button" style="width: 80px" OnClientClick="elementDialog.close(); return false;" /></div>
        </form>
    </body>
</html>
