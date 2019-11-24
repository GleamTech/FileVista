<%@ Page Language="C#" CodeBehind="Configuration.aspx.cs" Inherits="GleamTech.FileVista.Web.ConfigurationPage" %>

<!DOCTYPE html>

<html>
    <head runat="server">
		<title>FileVista Configuration Wizard</title>
    </head>
    <body id="BodyTag" runat="server" style="margin: 20px;">
        <form id="formSetup" runat="server">
            <asp:HiddenField ID="FieldSetupStep" runat="server" />
            <asp:HiddenField ID="FieldProvider" runat="server" />
            <asp:HiddenField ID="FieldConnectionString" runat="server" />
            <asp:HiddenField ID="ClientMessage" runat="server" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
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
<%switch (setupStep) {%>
<%case 0:%>
				        <div id="divSetupStep0" runat="server">
				            Configuration was already completed before so the wizard can not run again for security reasons.
				            If you need to rerun the wizard, then manually remove line with key <b>ConnectionString</b> in <b>App_Data\FileVista.config</b>
                        </div>
<%break;%>
<%case 1:%>
				        <div id="divSetupStep1" runat="server">
                            This wizard will guide you through the steps required to configure this FileVista instance.<br /><br />
				            <span style="font-weight: bold;">Information on this FileVista instance:</span>
                            <table border="0" cellpadding="0" cellspacing="10" >
                                <tr>
                                    <td style="width: 200px">Application Version:</td>
                                    <td><asp:Label ID="LabelAppVersion" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Application Path:</td>
                                    <td><asp:Label ID="LabelAppPath" runat="server"></asp:Label></td>
                                </tr>
                            </table>
				            <span style="font-weight: bold;">Information on the environment:</span>
                            <table border="0" cellpadding="0" cellspacing="10" >
                                <tr>
                                    <td style="width: 200px">Machine Name:</td>
                                    <td><asp:Label ID="LabelMachineName" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Operating System:</td>
                                    <td><asp:Label ID="LabelOperatingSystem" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Framework:</td>
                                    <td><asp:Label ID="LabelFramework" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Web Framework:</td>
                                    <td><asp:Label ID="LabelWebFramework" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Current Identity:</td>
                                    <td><asp:Label ID="LabelIdentity" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                            <span style="font-weight: bold;">Important:</span>
                            <table border="0" cellpadding="0" cellspacing="10" >
                                <tr>
                                    <td colspan="2" style="width: 450px">
                                    Current Identity, ie. the windows user which is used to run this web application, should have <i>Modify</i> permission on the <i>App_Data</i> folder and the permission should be inherited by its subfolders. 
                                    The wizard can not continue if this permission is denied. Please refresh the page after you do a permission change. 
                                    </td>
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
                        </div>
<%break;%>
<%case 2:%>
                        <div id="divSetupStep2" runat="server">
				            <table border="0" cellpadding="0" cellspacing="10" >
				                <tr>
				                    <td>
                                        <asp:RadioButton ID="RadioButtonVistaDB" runat="server" Text="VistaDB Database" GroupName="DatabaseType" />
                                        <table id="tableVistaDB" border="0" cellpadding="0" cellspacing="10"  style="margin-left: 10px;">
                                            <tr>
                                                <td colspan="2">
                                                It is recommended that you keep the VistaDB Database file (.vdb5 file) in the default location.
                                                Physical and virtual paths are allowed.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="white-space: nowrap">File Path:</td>
                                                <td><asp:TextBox ID="TextBoxVistaDBFilePath" runat="server" style="width: 300px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <b>Important:</b> Current Windows Identity should have <i>Modify</i> permission on the folder that contains the .vdb5 file.
                                                </td>
                                            </tr>
                                        </table>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <asp:RadioButton ID="RadioButtonSqlServer" runat="server" Text="SQL Server Database" GroupName="DatabaseType" />
                                        <table id="tableSqlServer" border="0" cellpadding="0" cellspacing="10"  style="margin-left: 10px;">
                                            <tr>
                                                <td colspan="2">Enter the information required to connect to the SQL Server.</td>
                                            </tr>
                                            <tr>
                                                <td style="white-space: nowrap">Server:</td>
                                                <td><asp:TextBox ID="TextBoxSqlServer" runat="server" style="width: 200px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td style="white-space: nowrap">Database:</td>
                                                <td><asp:TextBox ID="TextBoxSqlDatabase" runat="server" style="width: 200px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:CheckBox ID="CheckBoxSqlTrusted" runat="server" Text="Trusted connection" />
                                                    <table border="0" cellpadding="0" cellspacing="10"  style="margin-left: 10px;">
                                                        <tr>
                                                            <td style="width: 100px; white-space: nowrap">User:</td>
                                                            <td><asp:TextBox ID="TextBoxSqlUser" runat="server" style="width: 200px"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap">Password:</td>
                                                            <td><asp:TextBox ID="TextBoxSqlPassword" runat="server" style="width: 200px"></asp:TextBox></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <b>Instructions:</b> 
                                                    Please open SQL Server Management Studio and create an empty database named <i>FileVista</i>.
                                                    Then create a user with <i>db_owner</i> role for this database as follows:
                                                    <ul>
                                                        <li>
                                                            If <i>Trusted connection</i> is checked (Windows authentication mode), current windows identity (<%=LabelIdentity.Text%>) will be used to connect to the SQL Server.
                                                            So in SQL Server, create a new login and user with the same name and assign <i>db_owner</i> role for FileVista database.
                                                        </li>
                                                        <li>
                                                            If <i>Trusted connection</i> is unchecked (SQL Server authentication mode), you will need to enter the credentials of a SQL Server user.
                                                            So in SQL Server, create a new user and assign <i>db_owner</i> role for FileVista database.
                                                        </li>
                                                    </ul>
                                                </td>
                                            </tr>
                                        </table>				                        
				                    </td>
				                </tr>
				            </table>
                        </div>
<%break;%>
<%case 3:%>
                        <div id="divSetupStep3" runat="server">
                            <table border="0" cellpadding="0" cellspacing="10" >
                                <tr>
                                    <td colspan="2">Enter a name and password for the administrator account who will have access to the administration page.</td>
                                </tr>
                                <tr>
                                    <td style="width: 200px">Administrator Name:</td>
                                    <td>
                                        <asp:TextBox ID="TextBoxAdministrator" runat="server" style="width: 200px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxAdministrator">!</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td>
                                        <asp:TextBox ID="TextBoxPassword" runat="server" style="width: 200px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword">!</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Confirm Password:</td>
                                    <td>
                                        <asp:TextBox ID="TextBoxPasswordConfirm" runat="server" style="width: 200px" TextMode="Password"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPasswordConfirm" ControlToValidate="TextBoxPassword">!</asp:CompareValidator></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><hr /></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Choose the default display and format languages for the application. 
                                    Display language controls the user interface language and format language controls the number and date/time formats.
                                    Note that users will be able to override the default display and format languages with their own on the login page or user settings page.</td>
                                </tr>
                                <tr>
                                    <td>Display language:</td>
                                    <td><asp:DropDownList ID="DisplayLanguagesDropDownList" runat="server" style="width: 200px"></asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td>Format language:</td>
                                    <td><asp:DropDownList ID="FormatLanguagesDropDownList" runat="server" style="width: 200px"></asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><hr /></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Define a test root folder. You can later change/delete this root folder or add another one on the administration page. 
                                        The path can be a physical path (c:\some\folder), a virtual path (/some/folder) or a web application relative path (~/some/folder).
                                        Note that on the administration page, you can add other type of root folders (eg. Amazon S3) and not only physical ones.
                                    </td>
                                </tr>
                                <tr>
                                    <td>Root Folder Name:</td>
                                    <td>
                                        <asp:TextBox ID="TextBoxRFName" runat="server" style="width: 200px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxRFName">!</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Root Folder Path:</td>
                                    <td>
                                        <asp:TextBox ID="TextBoxRFPath" runat="server" style="width: 200px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxRFPath">!</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <b>Important:</b> Current Windows Identity should have <i>Modify</i> permission on the folder.
                                    </td>
                                </tr>
                            </table>
                        </div>
<%break;%>
<%case 4:%>
                        <div id="divSetupStep4" runat="server">
                        FileVista is now ready to run. You can login with the administrator user that was defined during setup.
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
                        <asp:Button ID="ButtonFinish" runat="server"  text="Run FileVista" OnClientClick="window.location='./'; return false" />
					</td>
				</tr>
			</table>
        </form>
    </body>
</html>
