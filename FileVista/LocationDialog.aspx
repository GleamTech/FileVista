<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocationDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.LocationDialog" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="5" cellspacing="0" border="0" style="width: 100%">
            <tr>
                <td>Type:</td>
                <td><asp:DropDownList ID="TypeDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="OnSelectedIndexChanged" style="width: 85%"/></td>
            </tr>
            <tr>
                <td style="width: 100px">Path:</td>
                <td>
                    <asp:TextBox ID="PathTextBox" runat="server" style="width: 85%" />
                    <img id="PathToolTipImage" src="<%=LocationTooltipImageSrc%>">
                </td>
            </tr>
            <tr>
                <td colspan="2"><hr /></td>
            </tr>

            <%if (TypeDropDownList.SelectedValue == "Physical") {%>
            <tr>
                <td>Connect as:</td>
                <td><asp:DropDownList ID="ConnectAsDropDownList" runat="server" style="width: 85%" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table id="ConnectAsOptions0" cellpadding="5" cellspacing="0" border="0" style="display: none; width: 85%; margin-left: 20px;">
                        <tr>
                            <td style="width: 100px">Current user:</td>
                            <td><asp:Label ID="CurrentUser0Label" runat="server" style="width: 85%" /></td>
                        </tr>
                    </table>
                    <table id="ConnectAsOptions1" cellpadding="5" cellspacing="0" border="0" style="display: none; width: 85%; margin-left: 20px;">
                        <tr>
                            <td style="width: 100px">User name:</td>
                            <td><asp:TextBox ID="UserNameTextBox" runat="server" style="width: 85%" /></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><asp:TextBox ID="PasswordTextBox" runat="server" style="width: 85%" /></td>
                        </tr>
                        <tr>
                            <td>Logon type:</td>
                            <td><asp:DropDownList ID="LogonTypeDropDownList" runat="server" style="width: 85%" /></td>
                        </tr>
                    </table>
                    <table id="ConnectAsOptions2" cellpadding="5" cellspacing="0" border="0" style="display: none; width: 85%; margin-left: 20px;">
                        <tr>
                            <td style="width: 100px">Current user:</td>
                            <td><asp:Label ID="CurrentUser2Label" runat="server" style="width: 85%" /></td>
                        </tr>
                    </table>
                    <table id="ConnectAsOptions3" cellpadding="5" cellspacing="0" border="0" style="display: none; width: 85%; margin-left: 20px;">
                        <tr>
                            <td style="width: 100px">Current user:</td>
                            <td><asp:Label ID="CurrentUser3Label" runat="server" style="width: 85%" /></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <%} else if (TypeDropDownList.SelectedValue == "AmazonS3") {%>
            <tr>
                <td style="width: 130px">Bucket name:</td>
                <td><asp:TextBox ID="BucketNameTextBox" runat="server" style="width: 85%" /></td>
            </tr>
            <tr>
                <td>Region:</td>
                <td><asp:DropDownList ID="RegionDropDownList" runat="server" style="width: 85%" /></td>
            </tr>
            <tr>
                <td>Access key ID:</td>
                <td><asp:TextBox ID="AccessKeyIdTextBox" runat="server" style="width: 85%" /></td>
            </tr>
            <tr>
                <td>Secret access key:</td>
                <td><asp:TextBox ID="SecretAccessKeyTextBox" runat="server" style="width: 85%" /></td>
            </tr>
            
            <%} else if (TypeDropDownList.SelectedValue == "AzureBlob") {%>
                <tr>
                    <td style="width: 130px">Container:</td>
                    <td><asp:TextBox ID="ContainerTextBox" runat="server" style="width: 85%" /></td>
                </tr>
                <tr>
                    <td>AccountName:</td>
                    <td><asp:TextBox ID="AccountNameTextBox" runat="server" style="width: 85%" /></td>
                </tr>
                <tr>
                    <td>AccountKey:</td>
                    <td><asp:TextBox ID="AccountKeyTextBox" runat="server" style="width: 85%" /></td>
                </tr>
                <tr>
                    <td>UseHttps:</td>
                    <td><asp:CheckBox ID="UseHttpsCheckBox" runat="server" /></td>
                </tr>
                <tr>
                    <td>EndpointSuffix:</td>
                    <td><asp:TextBox ID="EndpointSuffixTextBox" runat="server" style="width: 85%" /></td>
                </tr>
            <%} %>

        </table>
        <asp:HiddenField ID="OnLoadCommand" runat="server"/>
        <asp:HiddenField ID="ClientMessage" runat="server"/>
        <asp:HiddenField ID="SerializedLocation" runat="server"/>
        <asp:HiddenField ID="SerializedCensoredLocation" runat="server"/>
        <div class="gt-formBottom">
            <asp:Button ID="SubmitButton" runat="server" style="width: 80px" OnClick="OnSubmit"
            />&nbsp;<input type="button" id="CancelButton" value="<%=Language.GetEntry("552")%>" onclick="elementDialog.close()" style="width: 80px" />
        </div>

        <div id="PathToolTip" style="display:none; width: 350px; height: 400px; background-color:ivory; border: solid 1px gray; padding: 10px; z-index: 2000">
            <%if (TypeDropDownList.SelectedValue == "Physical") {%>
            <b>For physical location type:</b><br/>
            Path should be specified as one of the following:
            <ul>
                <li>
                    A local path: <b>d:\files</b>
                </li>
                <li>
                    A network path (UNC): <b>\\server\share</b>
                </li>
                <li>
                    An application-relative path: <b>~/App_Data/RootFolder1</b>
                </li>
                <li>
                    A virtual path: <b>/webfolder/test</b>
                </li>
            </ul>
            <%} else if (TypeDropDownList.SelectedValue == "AmazonS3") {%>
            <b>For Amazon S3 location type:</b><br/>
            Leave path empty to connect to the root of the bucket. For subfolders, path should be specified as
            a relative path without leading slash (eg. <b>some/folder</b>)
            <br/><br/>
            <%} else if (TypeDropDownList.SelectedValue == "AzureBlob") {%>
            <b>For Azure Blob location type:</b><br/>
            Leave path empty to connect to the root of the container. For subfolders, path should be specified as
            a relative path without leading slash (eg. <b>some/folder</b>)
            <br/><br/>
            <%}%>
            <b>For all location types:</b><br/>
            The path can contain the below variables which will be dynamically replaced according to the logged in user.
            These variables can also be used in root folder's name:
            <table cellpadding="0" cellspacing="5" border="0">
                <tr>
                    <td style="width: 100px;"><b>{User}</b></td>
                    <td>User name of the logged in user. This will not contain domain part even if it's in the original name.</td>
                </tr>
                <tr>
                    <td><b>{Domain}</b></td>
                    <td>This will be empty unless there is domain part in user's name</td>
                </tr>
                <tr>
                    <td><b>{UserWithDomain}</b></td>
                    <td>Original name of the user. May contain domain part if it's in the original name. This is same as {user.name} from previous versions.</td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
