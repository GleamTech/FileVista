<%@ Page Language="C#" CodeBehind="AboutDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.AboutDialogPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title><%=Language.GetEntry("Label.About")%></title>
    </head>
    <body class="selectable">
        <form id="form1" runat="server">
            <table cellpadding="0" cellspacing="0" border="0" >
				<tr>
				    <td style="vertical-align: top">
				        <img src="<%=LogoUrl%>" style="margin-right: 20px"/>
				    </td>
				    <td>
                        <h1><asp:Label ID="Product" runat="server"></asp:Label></h1>
                        <span style="font-weight: bold">Version <asp:Label ID="Version" runat="server"></asp:Label></span>
                        <br/><asp:Label ID="Copyright" runat="server"></asp:Label>
                        <br/>All rights reserved.
                        <br/><asp:Literal ID="ProductUrl" runat="server"></asp:Literal>
				    </td>
                </tr>
            </table>
            <hr style="margin-top: 20px; margin-bottom: 20px"/>
            <table cellpadding="0" cellspacing="0" border="0" >
				<tr>
				    <td style="width: 120px">Build Date:</td>
				    <td>
                        <asp:Label ID="BuildDate" runat="server"></asp:Label>
				    </td>
                </tr>
				<tr>
				    <td>Database Version:</td>
				    <td>
                        <asp:Label ID="DatabaseVersion" runat="server"></asp:Label>
				        <asp:Label ID="DatabaseTargetVersion" runat="server" ForeColor="Red" Font-Bold="True" Visible="False"></asp:Label>
				    </td>
                </tr>
				<tr>
				    <td>License Version:</td>
				    <td>
                        <asp:Label ID="LicenseVersion" runat="server"></asp:Label>
				    </td>
                </tr>
                <tr>
                    <td>Machine Name:</td>
                    <td><asp:Label ID="MachineName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Operating System:</td>
                    <td><asp:Label ID="OperatingSystem" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Process Memory:</td>
                    <td><asp:Label ID="ProcessMemory" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Framework:</td>
                    <td><asp:Label ID="Framework" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Web Framework:</td>
                    <td><asp:Label ID="WebFramework" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Current Identity:</td>
                    <td><asp:Label ID="CurrentIdentity" runat="server"></asp:Label></td>
                </tr>
            </table>
			<div class="gt-formBottom"><asp:Button ID="ButtonOK" runat="server" style="width: 80px" OnClientClick="elementDialog.close(); return false;" /></div>
        </form>
    </body>
</html>
