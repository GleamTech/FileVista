<%@ Page Language="C#" CodeBehind="Update.aspx.cs" Inherits="GleamTech.FileVista.Web.UpdatePage" %>

<!DOCTYPE html>

<html>
    <head runat="server">
        <title>FileVista Update Wizard</title>
    </head>
    <body id="BodyTag" runat="server" style="margin: 100px;">
        <form id="form1" runat="server">
            <asp:HiddenField ID="ClientMessage" runat="server" />
            <asp:HiddenField ID="FieldUpdateStep" runat="server" />
            <asp:HiddenField ID="FieldFromVersion" runat="server" />
            <asp:HiddenField ID="UpdateLicenseKey" runat="server" />
			<table border="0" cellpadding="0" cellspacing="10" class="gt-panel" style="width: 500px;" align="center">
				<tr>
					<td>
                        <asp:Label ID="LabelSetupTitle" runat="server" style=" font-size: 16pt"></asp:Label>
                    </td>
					<td align="center" valign="top"><img width="48" height="48" style="border: none" src="<%=ConfigurationImageUrl%>" alt=""/></td>
				</tr>
				<tr>
				    <td colspan="2"><hr /></td>
				</tr>
				<tr>
				    <td colspan="2">
<%switch (UpdateStep) {%>
<%case 0:%>
				        <div id="divSetupStep0">
				            No update is required.
                        </div>
<%break;%>
<%case 1:%>
                        This wizard will guide you through the steps required to update this FileVista instance to a newer version.<br /><br />
                        <span style="font-weight: bold;">Information on update:</span>
                        <table border="0" cellpadding="0" cellspacing="10" >
                            <tr>
                                <td style="width: 200px">Database old version:</td>
                                <td><asp:Label ID="LabelOldVersion" runat="server" Font-Bold="true"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 200px">Database new version:</td>
                                <td><asp:Label ID="LabelNewVersion" runat="server" Font-Bold="true"></asp:Label></td>
                            </tr>
                        </table>
                        <%if (ShowPermissionInstructions)
                          { %>
                        <span style="font-weight: bold;">Important:</span>
                        <table border="0" cellpadding="0" cellspacing="10" >
                            <tr>
                                <td colspan="2" style="width: 450px">
                                Windows user which is used to run this web application, should have <i>Modify</i> permission on the <i>App_Data</i> folder and the permission should be inherited by its subfolders. 
                                The wizard can not continue if this permission is denied. Please refresh the page after you do a permission change. 
                                </td>
                            </tr>
                            <tr>
                                <td>User:</td>
                                <td><asp:Label ID="LabelIdentity" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>App_Data Physical Path:</td>
                                <td><asp:Label ID="LabelAppDataPath" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Permission:</td>
                                <td><asp:Label ID="LabelPermission" runat="server" style="font-weight:bold"></asp:Label></td>
                            </tr>
                        </table>
                        <% } %>
                                                
<%break;%>
<%case 2:%>
                        <span style="font-weight: bold;">Information on existing license:</span><br />
                        <asp:Literal ID="LiteralLicenceInfo" runat="server"></asp:Literal>
                        <asp:TextBox ID="TextBoxLicenceKey" runat="server" style="width: 350px; height: 50px; resize:none"  TextMode="MultiLine"></asp:TextBox>
<%break;%>
<%case 3:%>
                        <div id="divSetupStep3">
                        Full error details:
                        <br />
                        <asp:TextBox ID="TextBoxUpdateError" runat="server" style="width: 100%; height: 300px"  TextMode="MultiLine"></asp:TextBox>
                        <br />
                        </div>
<%break;%>
<%case 4:%>
                        <div id="divSetupStep4">
                        You can now run the new version of FileVista.
                        <br /><br />
                        </div>
<%break;%>
<%}%>
				    </td>
				</tr>
				<tr>
				    <td colspan="2"><hr /></td>
				</tr>
			
				<tr>
					<td colspan="2" align="right">
    					<asp:Button ID="ButtonNext" runat="server" style="width: 80px" text="Next >" OnClick="ButtonNext_Click" />
                        <asp:Button ID="ButtonFinish" runat="server" text="Run FileVista" OnClientClick="window.location='./'; return false" />
					</td>
				</tr>
			</table>
        </form>
    </body>
</html>
