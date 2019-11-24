<%@ Page Language="C#" CodeBehind="GroupDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.GroupDialogPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title><%=Language.GetEntry("546")%></title>
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:HiddenField ID="ClientMessage" runat="server" />
            <asp:HiddenField ID="OnLoadCommand" runat="server" />
            <asp:HiddenField ID="ActionBasePath" runat="server" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
			<table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                <tr valign="top">
                    <td>
                        <table cellpadding="4" cellspacing="0" border="0" >
				            <tr>
				                <td style="width: 100px"><%=Language.GetEntry("556")%></td>
				                <td>
				                    <asp:TextBox ID="GroupName" runat="server" style="width: 250px" MaxLength="50"></asp:TextBox>
				                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="GroupName">!</asp:RequiredFieldValidator>
			                   </td>
			                </tr>
				            <tr><td><%=Language.GetEntry("557")%>:</td><td><asp:TextBox ID="Description" runat="server" style="width: 250px" MaxLength="100"></asp:TextBox></td></tr>
                            <tr><td colspan="2"><hr /></td></tr>
                            <tr>
                                <td colspan="2">
                                    <div id="divMembers">
                                        <table cellpadding="0" cellspacing="0" border="0" >
                                            <tr>
                                                <td style="height: 180px;">
                                                    <%=Language.GetEntry("558")%>
                                                    <select id="MembersListBox" style="width: 160px; height: 125px;" size="2" onchange="onMembersListBoxChange()"></select>
                                                    <br /><asp:Button ID="Button3" runat="server" style="width: 80px" OnClientClick="showDivAddMembers(); return false;" />
                                                    <asp:Button ID="Button4" runat="server" style="width: 80px" OnClientClick="removeSelected(); return false;"/>
                                                    <asp:HiddenField ID="ListBoxValues" runat="server" />
                                                </td>
                                                <td style="width: 200px;" valign="top">
                                                    <br />
                                                    <fieldset><legend style="color:black; text-align:center"><%=Language.GetEntry("559")%><br /><span id="Legend1" style="font-weight:bold; width: 90px">&nbsp;</span></legend>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                                        <br /><br />
                                                    </fieldset>
                                                </td>
                                            </tr>
                                        </table>
                                        <br /><br /><br /><br /><br /><br /><br />
                                    </div>
                                    <div id="divAddMembers" style="display: none;">
                                        <fieldset><legend style="color:black; text-align:center"><%=Language.GetEntry("560")%></legend>
                                            <table cellpadding="4" cellspacing="0" border="0"  align="center">
                                                <tr>
                                                    <td><%=Language.GetEntry("561")%></td>
                                                    <td>
                                                        <input id="SearchCriteria" type="text" style="width: 160px" maxlength="50" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <asp:Button ID="Button7" runat="server" OnClientClick="searchUsers(); return false;" Style="width: 80px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"><%=Language.GetEntry("562")%></td>
                                                    <td>
                                                        <select id="SearchResults" size="2" style="width: 160px; height: 150px;" multiple onchange="onSRListBoxChange()"></select>
                                                        <br /><br /><asp:Button ID="Button5" runat="server" OnClientClick="addSelected(); return false;" Style="width: 80px" />&nbsp;<asp:Button ID="Button6" runat="server" OnClientClick="showDivMembers(); return false;" Style="width: 80px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </div>                                      
                               </td>
                            </tr>
				            <tr><td colspan="2"><hr /></td></tr>
				            <tr><td colspan="2">
                                <asp:CheckBox ID="CheckBoxMaxMembers" runat="server" />:&nbsp;<asp:TextBox ID="TextBoxMaxMembers" runat="server" style="width: 25px; text-align:right"></asp:TextBox>
                            </td></tr>
                        </table>
                    </td>                
                </tr>
			</table>
			<div class="gt-formBottom"><asp:Button ID="Button1" runat="server" style="width: 80px" OnClick="Button1_Click" OnClientClick="onPageSubmit()" />&nbsp;<asp:Button ID="Button2" runat="server" style="width: 80px" OnClientClick="elementDialog.close(); return false;" /></div>
        </form>
    </body>
</html>
