<%@ Page Language="C#" CodeBehind="LicenseDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.LicenseDialogPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title><%=Language.GetEntry("531")%></title>
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:HiddenField ID="ClientMessage" runat="server" />
            <asp:HiddenField ID="OnLoadCommand" runat="server" />
			<table cellpadding="0" cellspacing="0" border="0">
              <tr valign="top">
                    <td>
                        <table cellpadding="4" cellspacing="0" border="0" >
				            <tr>
				                <td style="width: 100px"><asp:Label ID="LabelLicenseType" runat="server"><%=Language.GetEntry("610")%></asp:Label></td>
				                <td align="left">
                                    <asp:Label ID="LicenseType" runat="server" Font-Bold="true"></asp:Label>
				                </td>
                            </tr>
				            <tr>
				                <td ><asp:Label ID="LabelLicenseFeatures" runat="server">License features:</asp:Label></td>
				                <td align="left">
                                    <asp:Label ID="LicenseFeatures" runat="server" Font-Bold="true"></asp:Label>
				                </td>
                            </tr>
				            <tr>
				                <td><asp:Label ID="LabelLicensedTo" runat="server"><%=Language.GetEntry("609")%></asp:Label></td>
				                <td align="left">
                                    <asp:Label ID="LicensedTo" runat="server" Font-Bold="true"></asp:Label>
			                   </td>
			                </tr>
				            <tr>
				                <td><asp:Label ID="LabelLicenseDate" runat="server"><%=Language.GetEntry("611")%></asp:Label></td>
				                <td align="left">
				                    <asp:Label ID="LicenseDate" runat="server" Font-Bold="true"></asp:Label>
				                </td>
			                </tr>
				            <tr>
				                <td>License version:</td>
				                <td align="left">
				                    <asp:Label ID="LicenseVersion" runat="server" Font-Bold="true"></asp:Label>
				                </td>
			                </tr>
                        </table>
                        <table cellpadding="4" cellspacing="0" border="0" >			            
				            <tr><td><hr /></td></tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButtonTrialLicenseMode" runat="server" GroupName="LicenseMode" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButtonPurchasedLicenseMode" runat="server" GroupName="LicenseMode" /><br />
                                    <div id="divLicenseKey" style="margin-left: 20px; margin-top: 10px">
                                        <asp:CheckBox ID="CheckBoxApplyLicenseKey" runat="server" />
                                        <asp:TextBox ID="LicenseKey" runat="server" style="width: 350px; height: 50px; margin-top: 10px; resize:none" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
				            <tr><td><hr /></td></tr>
                            <tr>
                                <td>
                                    <asp:Literal ID="LiteralLicenceAction" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
			</table>
			<div class="gt-formBottom"><asp:Button ID="ButtonOK" runat="server" style="width: 80px" OnClick="ButtonOK_Click" /></div>
        </form>
    </body>
</html>
