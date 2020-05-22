<%@ Page Language="C#" CodeBehind="RootFolderDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.RootFolderDialogPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title><%=Language.GetEntry("547")%></title>
    </head>
    <body>
        <script type="text/javascript">
            permissionSetTypes = <%=PermissionSetsJsonObject%>;
            permissionTypes = <%=PermissionsJsonObject%>;
            notificationSetTypes = <%=NotificationSetsJsonObject%>;
            notificationTypes = <%=NotificationsJsonObject%>;
            tabNames = Array('<%=Language.GetEntry("559")%>', '<%=Language.GetEntry("665")%>', '<%=Language.GetEntry("571")%>', '<%=Language.GetEntry("658")%>');
            rootFolderId = <%=RootFolderId%>;
            serializedAccessControlLists = <%=SerializedAccessControlLists%>;
            serializedGroupAccessControlEntry = <%=SerializedGroupAccessControlEntry%>;
        </script>
        <form id="form1" runat="server">
            <asp:HiddenField ID="ClientMessage" runat="server" />
            <asp:HiddenField ID="OnLoadCommand" runat="server" />
            <asp:HiddenField ID="ActionBasePath" runat="server" />
            <asp:HiddenField ID="ResourceBasePath" runat="server" />
            <asp:HiddenField ID="FileUltimateResourceBasePath" runat="server" />
            <asp:HiddenField ID="NewRootFolderId" runat="server" />
            <asp:HiddenField ID="Location" runat="server"/>
            <input type="hidden" id="PostedAccessControlLists" name="PostedAccessControlLists" /> 
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
            <table cellpadding="4" cellspacing="0" border="0" style="width: 100%">
	            <tr>
	                <td style="width: 100px"><%=Language.GetEntry("556")%></td>
	                <td>
	                    <asp:TextBox ID="RFName" runat="server" style="width: 250px" MaxLength="50"></asp:TextBox>
	                    <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="RFName" ValidationGroup="RootFolderRequired" SetFocusOnError="true" ForeColor="red" Font-Bold="True">!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="NameValidator2" runat="server" ControlToValidate="RFName" ValidationGroup="RootFolderRequired" SetFocusOnError="true" ForeColor="red" Font-Bold="True" ValidationExpression="^((?!\]:).)*$">!</asp:RegularExpressionValidator>
                    </td>
                    <td><%=Language.GetEntry("Label.Column.Description")%>:</td>
                    <td><asp:TextBox ID="Description" runat="server" style="width: 250px" MaxLength="100"></asp:TextBox></td>
                </tr>
	            <tr>
                </tr>
                <%if (GroupId == 0)
                {%>
	            <tr>
	                <td><%=Language.GetEntry("569")%></td>
	                <td colspan="3">
	                    <asp:TextBox ID="CensoredLocation" runat="server" style="width: 480px" MaxLength="255"
                        /><asp:Button ID="ChooseLocationButton" runat="server" OnClientClick="onChooseLocationButtonClick(this); return false;"/>
	                    <asp:RequiredFieldValidator ID="LocationValidator" runat="server" ControlToValidate="CensoredLocation" ValidationGroup="RootFolderRequired" SetFocusOnError="true" ForeColor="red" Font-Bold="True">!</asp:RequiredFieldValidator>
	                </td>
                </tr>
                <%} %>
            </table> 
            <hr/>
            <div id="divMembers" style="width: 790px">
                <div id="divTree" style="float: left; width: 214px; height: 400px; background-color:white; border: #aca899 1px solid;" class="nonSelectableText"></div>
                <div style="float: left; width: 556px; margin-left: 10px;">
                    <fieldset style="padding: 10px; padding-top: 0px"><legend style="color:black; margin-bottom: 10px"><%=Language.GetEntry("656")%><br /><span id="Legend3" style="font-weight:bold">&nbsp;</span></legend>
                        <input id="InheritCheckBox" type="checkbox" onclick="onInheritCheckBoxClick(this)" /><label for="InheritCheckBox"><%=Language.GetEntry("657")%></label>                        
                        <hr />
                        <div style="float: left; width: 170px">
                            <%=Language.GetEntry("570")%>
                            <select id="MembersListBox" style="width: 160px; height: 265px;" size="2" onchange="onMembersListBoxChange(this)"></select>
                            <div style="white-space: nowrap; margin-top: 10px">
                                <input type="button" id="AddUserOrGroupButton" value="<%=Language.GetEntry("563")%>" onclick="showDivAddMembers()" style="width: 80px" />
                                <input type="button" id="RemoveUserOrGroupButton" value="<%=Language.GetEntry("564")%>" onclick="removeSelected()" style="width: 80px" />
                            </div>
                        </div>
                        <div style="float: left; width: 358px">
                            <div id="tabPanel">
                                <div class="tab">
                                    <span id="Legend2" style="font-weight:bold">&nbsp;</span><hr />
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td style="width: 140px"></td>
                                            <td style="width: 70px; text-align:center; white-space:nowrap"><%=Language.GetEntry("FileVista.Label.Allow")%></td>
                                            <td style="width: 70px; text-align:center; white-space:nowrap"><%=Language.GetEntry("FileVista.Label.Deny")%></td>
                                            <td style="width: 20px"></td>
                                        </tr>
                                    </table>
                                    <div style="height: 210px; overflow-y: auto; border: 1px solid #ACA899; margin: 2px; padding: 5px;">
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <% foreach (var kvp in PermissionSetNames)
                                               { %>
                                            <tr>
                                                <td style="width: 132px"><%=kvp.Value%></td>
                                                <td style="width: 70px; text-align:center"><input id="PermissionSetAllowCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onPermissionSetCheckBoxClick(this)"/></td>
                                                <td style="width: 70px; text-align:center"><input id="PermissionSetDenyCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onPermissionSetCheckBoxClick(this)"/></td>
                                            </tr>
                                            <% } %>
                                            <tr><td colspan="3"><hr style="border: none; border-top: 1px dotted #ACA899;"/></td></tr>
                                            <% foreach (var kvp in PermissionNames)
                                               { %>
                                            <tr>
                                                <td style="width: 132px"><%=kvp.Value%></td>
                                                <td style="width: 70px; text-align:center"><input id="PermissionAllowCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onPermissionCheckBoxClick(this)"/></td>
                                                <td style="width: 70px; text-align:center"><input id="PermissionDenyCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onPermissionCheckBoxClick(this)"/></td>
                                            </tr>
                                            <% } %>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab">
                                    <span id="Legend5" style="font-weight:bold">&nbsp;</span><hr />
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td style="width: 140px"></td>
                                            <td style="width: 70px; text-align:center; white-space:nowrap"><%=Language.GetEntry("FileVista.Label.Notify")%></td>
                                            <td style="width: 70px; text-align:center; white-space:nowrap"><%=Language.GetEntry("FileVista.Label.DoNotNotify")%></td>
                                            <td style="width: 20px"></td>
                                        </tr>
                                    </table>
                                    <div style="height: 210px; overflow-y: auto; border: 1px solid #ACA899; margin: 2px; padding: 5px;">
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <% foreach (var kvp in NotificationSetNames)
                                               { %>
                                            <tr>
                                                <td style="width: 132px"><%=kvp.Value%></td>
                                                <td style="width: 70px; text-align:center"><input id="NotificationSetSendCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onNotificationSetCheckBoxClick(this)"/></td>
                                                <td style="width: 70px; text-align:center"><input id="NotificationSetDoNotSendCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onNotificationSetCheckBoxClick(this)"/></td>
                                            </tr>
                                            <% } %>
                                            <tr><td colspan="3"><hr style="border: none; border-top: 1px dotted #ACA899;"/></td></tr>
                                            <% foreach (var kvp in NotificationNames)
                                               { %>
                                            <tr>
                                                <td style="width: 132px"><%=kvp.Value%></td>
                                                <td style="width: 70px; text-align:center"><input id="NotificationSendCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onNotificationCheckBoxClick(this)"/></td>
                                                <td style="width: 70px; text-align:center"><input id="NotificationDoNotSendCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onNotificationCheckBoxClick(this)"/></td>
                                            </tr>
                                            <% } %>
                                        </table>
                                     </div>
                                </div>
                                <div class="tab">
                                    <span id="Legend1" style="font-weight:bold">&nbsp;</span><hr />
                                    <input id="QuotaUnlimitedCheckBox" type="checkbox" onclick="onQuotaUnlimitedCheckBoxClick(this);" /><label for="QuotaUnlimitedCheckBox"><%=Language.GetEntry("588")%></label>
                                    <br />
                                    <input id="QuotaLimitedCheckBox" type="checkbox" onclick="onQuotaLimitedCheckBoxClick(this);" /><label for="QuotaLimitedCheckBox"><%=Language.GetEntry("589")%></label>
                                    <br />
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <input id="QuotaSize" type="text" maxlength="10" onchange="onQuotaSizeTextBoxChange(this)" onkeyup="onQuotaSizeTextBoxKeyUp(this)" style="width: 75px; text-align: right" />
                                    <select id="QuotaUnit" onchange="onQuotaUnitComboBoxChange(this)">
                                        <% foreach (var kvp in QuotaUnitNamesAndValues)
                                           { %>
                                        <option value="<%=kvp.Value%>"><%=kvp.Key%></option>
                                        <% } %>
                                    </select>                                                                        
                                </div>
                                <div class="tab">
                                    <span id="Legend4" style="font-weight:bold">&nbsp;</span><hr />
                                    <input id="UnrestrictedFileTypesCheckBox" type="checkbox" onclick="onUnrestrictedFileTypesCheckBoxClick(this);" /><label for="UnrestrictedFileTypesCheckBox"><%=Language.GetEntry("659")%></label>
                                    <br />
                                    <input id="RestrictedFileTypesCheckBox" type="checkbox" onclick="onRestrictedFileTypesCheckBoxClick(this);" /><label for="RestrictedFileTypesCheckBox"><%=Language.GetEntry("660")%></label>
                                    <div id="FileTypesForm">
                                        <table cellpadding="0" cellspacing="0" border="0" style="margin-left:20px; margin-top: 5px">
                                            <tr>
                                                <td style="width: 120px"></td>
                                                <td style="width: 70px; text-align:center; white-space:nowrap"><%=Language.GetEntry("FileVista.Label.Allow")%></td>
                                                <td style="width: 70px; text-align:center; white-space:nowrap"><%=Language.GetEntry("FileVista.Label.Deny")%></td>
                                                <td style="width: 20px"></td>
                                            </tr>
                                        </table>
                                        <div id="FileTypesTable" style="height: 130px; overflow-y: auto; border: 1px solid #ACA899; margin: 2px; padding: 5px;  margin-left:20px;">
                                        </div>
                                        <div style="white-space: nowrap; margin-top: 10px; text-align: right">
                                            <input type="button" id="AddFileTypeButton" value="<%=Language.GetEntry("563")%>" onclick="onAddFileTypeButtonClick(this)" style="width: 80px" />
                                            <input type="button" id="RemoveFileTypeButton" value="<%=Language.GetEntry("564")%>" onclick="onRemoveFileTypeButtonClick(this)" style="width: 80px" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="clear: both"></div>
                    </fieldset>
                </div>
            </div>
            <div id="divAddMembers" style="width: 740px; display: none;">
                <fieldset><legend style="color:black; text-align:center"><%=Language.GetEntry("572")%></legend>
                    <table cellpadding="4" cellspacing="0" border="0"  align="center">
                        <tr>
                            <td><%=Language.GetEntry("573")%></td>
                            <td>
                                <select id="SearchFor">
                            <%if (GroupId == 0)
                              {%>
                                    <option value="1"><%=Language.GetEntry("574")%></option>
                                    <option value="2"><%=Language.GetEntry("506")%></option>
                                    <option value="3"><%=Language.GetEntry("507")%></option>
                            <%}
                              else
                              { %>
                                    <option value="4"><%=Language.GetEntry("506")%></option>
                            <%} %>                                        
                                </select>    
                            </td>
                        </tr>
                        <tr>
                            <td><%=Language.GetEntry("561")%></td>
                            <td>
                                <input id="SearchCriteria" type="text" style="width: 160px" maxlength="50" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="button" id="SearchButton" value="<%=Language.GetEntry("566")%>" onclick="searchUsersAndGroups()" style="width: 80px" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top"><%=Language.GetEntry("562")%></td>
                            <td>
                                <select id="SearchResults" size="2" style="width: 160px; height: 200px;" multiple onchange="onSRListBoxChange()"></select>
                                <br /><br />
                                <input type="button" id="AddSelectedButton" value="<%=Language.GetEntry("565")%>" onclick="addSelected()" style="width: 80px" 
                                />&nbsp;<input type="button" id="CancelSearchButton" value="<%=Language.GetEntry("552")%>" onclick="showDivMembers()" style="width: 80px" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>                                      
            <div class="gt-formBottom">
                <asp:Button ID="SubmitButton" runat="server" style="width: 80px" OnClick="OnSubmit" OnClientClick="onPageSubmit()" ValidationGroup="RootFolderRequired" />&nbsp;<input type="button" id="CancelButton" value="<%=Language.GetEntry("552")%>" onclick="elementDialog.close()" style="width: 80px" />
            </div>
            <div id="AddFileTypeToolTip" style="display:none; width: 420px; height: 420px; background-color:ivory; border: solid 1px gray; padding: 10px; z-index: 2000">
                In a pattern, you can use these wildcards:<br/><br/>
                <table cellpadding="0" cellspacing="5" border="0">
                    <tr>
                        <td style="width: 100px;"><b>*</b></td>
                        <td>matches zero or more characters</td>
                    </tr>
                    <tr>
                        <td><b>?</b></td>
                        <td>matches exactly one character</td>
                    </tr>
                </table>
                 <br/>
                Some pattern examples:<br/><br/>
                <table cellpadding="0" cellspacing="5" border="0">
                    <tr>
                        <td style="width: 100px;"><b>*.*</b></td>
                        <td>matches files with any extension (does not match files without an extension)</td>
                    </tr>
                    <tr>
                        <td><b>*.jpg</b></td>
                        <td>matches files only with jpg extension</td>
                    </tr>
                    <tr>
                        <td><b>picture*.jpg</b></td>
                        <td>matches files only with jpg extension and which names start with 'picture'</td>
                    </tr>
                    <tr>
                        <td><b>picture.*</b></td>
                        <td>matches files with any extension and which names start with 'picture'</td>
                    </tr>
                    <tr>
                        <td><b>picture</b></td>
                        <td>matches files with no extension and which names are exactly 'picture'</td>
                    </tr>
                    <tr>
                        <td><b>*.jp*</b></td>
                        <td>matches files like 'picture.jpg', 'otherpicture.jpe', 'somepicture.jpeg' etc.</td>
                    </tr>
                    <tr>
                        <td><b>*.jp?</b></td>
                        <td>matches files like 'picture.jpg', 'otherpicture.jpe' etc.</td>
                    </tr>
                    <tr>
                        <td><b>picture?.jpg</b></td>
                        <td>matches files like 'picture1.jpg', 'picture2.jpg', 'pictures.jpg' etc.</td>
                    </tr>
                </table>
            </div>

        </form>
    </body>
</html>
