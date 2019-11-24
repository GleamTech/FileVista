<%@ Page Language="C#" CodeBehind="PublicLinkDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.PublicLinkDialogPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title></title>
    </head>
    <body>
        <form id="form1" runat="server" autocomplete="off">
            <asp:HiddenField ID="ClientMessage" runat="server" />
            <asp:HiddenField ID="OnLoadCommand" runat="server" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
            <asp:HiddenField ID="FieldPath" runat="server" />
            <asp:HiddenField ID="FieldExpirationDays" runat="server" />
            <asp:HiddenField ID="FieldHitLimit" runat="server" />
            <asp:HiddenField ID="PasswordTemplate" runat="server" />
            <asp:HiddenField ID="ResourceBasePath" runat="server" />
            <asp:HiddenField ID="NewPublicLinkId" runat="server" />
            <asp:HiddenField ID="ExistingPublicLink" runat="server" />
            <table cellpadding="4" cellspacing="0" border="0" style="width: 100%;">
                <tr>
                    <td><asp:Label ID="LabelCustomName" runat="server" AssociatedControlID="TextBoxName"><%=Language.GetEntry("FileVista.Label.NameInLink")%></asp:Label></td>
                    <td style="text-align: right">
                        <asp:TextBox ID="TextBoxName" runat="server" style="width: 270px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><asp:CheckBox ID="CheckBoxIncludePath" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: right"><input id="TextBoxPath" type="text" style="width: 350px" value="<%=HttpUtility.HtmlAttributeEncode(FieldPath.Value)%>"></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:CheckBox ID="CheckBoxDoNotForceSave" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:CheckBox ID="CheckBoxExpires" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:CheckBox ID="CheckBoxLimitHits" runat="server" /></td>
                </tr>
                <tr valign="top">
                    <td colspan="2">
                        <asp:CheckBox ID="CheckBoxPasswordProtect" runat="server" />
                        <table cellpadding="4" cellspacing="0" border="0"  style="margin-left: 20px; margin-top: 5px">
                            <tr>
                                <td><asp:Label ID="LabelPassword" runat="server" AssociatedControlID="Password"><%=Language.GetEntry("503")%></asp:Label></td>
                                <td align="right">
                                    <asp:TextBox ID="Password" runat="server" style="width: 150px" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" Enabled="False">!</asp:RequiredFieldValidator>
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
                <tr>
                    <td colspan="2" style="text-align: right">
                        <asp:Button ID="ButtonCreate" runat="server" style="width: 80px" OnClick="ButtonCreate_Click" OnClientClick="onSubmit()" />
                        <asp:Button ID="ButtonDelete" runat="server" style="width: 80px" OnClick="ButtonDelete_Click" OnClientClick="onSubmit()" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><hr/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <%=Language.GetEntry("FileVista.Label.PublicLink")%>:<br />
                        <div style="width: 374px; margin-top: 5px; white-space: nowrap; overflow-x: auto; overflow-y:hidden; background-color: White; border: 1px solid #919B9C;" >
                            <div style="padding:5px"><div ID="LabelPublicLink" runat="server"></div></div>
                        </div>
                    </td>
                </tr>
            </table>
            <div style="position: absolute; bottom: 10px; width: 384px;">
                <asp:Button ID="ButtonUpdate" runat="server" style="width: 80px; float: left; margin-right: 5px" OnClick="ButtonUpdate_Click" OnClientClick="onSubmit()" />
                <asp:Button ID="ButtonTest" runat="server" style="width: 80px; float:left; margin-right: 5px" OnClientClick="onButtonTestClick(); return false;" />
                <asp:Button ID="ButtonEmail" runat="server" style="width: 80px; float:left" OnClientClick="onButtonEmailClick(); return false;" />
                <asp:Button ID="ButtonClose" runat="server" style="width: 80px; float:right" OnClick="ButtonClose_Click" OnClientClick="onSubmit()" />
            </div>
        </form>
    </body>
</html>
