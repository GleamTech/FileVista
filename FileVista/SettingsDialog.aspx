<%@ Page Language="C#" CodeBehind="SettingsDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.SettingsDialogPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title><%=Language.GetEntry("636")%></title>
    </head>
    <body>
        <script type="text/javascript">
            eventSetTypes = <%=EventSetsJsonObject%>;
            eventTypes = <%=EventsJsonObject%>;
        </script>
        <form id="form1" runat="server">
            <asp:HiddenField ID="ClientMessage" runat="server" />
            <asp:HiddenField ID="OnLoadCommand" runat="server" />
            <asp:HiddenField ID="ConfirmMessage" runat="server" />
            <asp:HiddenField ID="FieldLogSize" runat="server" />
            <asp:HiddenField ID="FieldLogClearDays" runat="server" />          
            <asp:HiddenField ID="FieldMaxPasswordAge" runat="server" />
            <asp:HiddenField ID="FieldMaxAttempts" runat="server" />
            <asp:HiddenField ID="FieldMaxPublicLinkAge" runat="server" />
            <asp:HiddenField ID="FieldMaxPublicLinkHits" runat="server" />
            <asp:HiddenField ID="ActiveTab" runat="server" />
            <asp:HiddenField ID="TextGeneral" runat="server" />       
            <asp:HiddenField ID="TextFolderBrowsing" runat="server" />       
            <asp:HiddenField ID="TextLogging" runat="server" />       
            <asp:HiddenField ID="TextEmail" runat="server" />
            <asp:HiddenField ID="ResourceBasePath" runat="server" />     
            <asp:HiddenField ID="SelectedEventTypes" runat="server" />
            <asp:HiddenField ID="UploadMethods" runat="server" />
            <div id="tabPanel">
	            <div class="tab">
		    	    <table cellpadding="0" cellspacing="10" border="0" style="width: 100%;">
                        <tr>
                            <td><%=Language.GetEntry("Label.ApplicationTitle")%>:</td>
                            <td align="right"><asp:TextBox ID="ApplicationTitleTextBox" runat="server" style="width: 250px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><%=Language.GetEntry("Label.DisplayLanguage")%>:</td>
                            <td align="right"><asp:DropDownList ID="DisplayLanguagesDropDownList" runat="server" style="width: 250px"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td><%=Language.GetEntry("Label.FormatLanguage")%>:</td>
                            <td align="right"><asp:DropDownList ID="FormatLanguagesDropDownList" runat="server" style="width: 250px"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <%=Language.GetEntry("654", "<input id=\"TextBoxMaxPasswordAge\" type=\"text\" style=\"width: 30px; text-align: right\" maxLength= \"3\" value=\"" + maxPasswordAge + "\"/>")%>                    
                                <br /><br /><%=Language.GetEntry("655", "<input id=\"TextBoxMaxAttempts\" type=\"text\" style=\"width: 30px; text-align: right\" maxLength= \"3\" value=\"" + maxAttempts + "\"/>")%>      
                                <br /><br /><%=Language.GetEntry("Label.MaximumPublicLinkAge")%>: <%=Language.GetEntry("Label.Days", "<input id=\"TextBoxMaxPublicLinkAge\" type=\"text\" style=\"width: 30px; text-align: right\" maxLength= \"3\" value=\"" + maxPublicLinkAge + "\"/>")%>                    
                                <br /><br /><%=Language.GetEntry("Label.MaximumPublicLinkHits")%>: <input id="TextBoxMaxPublicLinkHits" type="text" style="width: 30px; text-align: right" maxLength="3" value="<%=maxPublicLinkHits%>"/>                    
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="CheckBoxBaseUrl" runat="server" /><br />
                                <div style="margin-top: 10px; margin-left: 20px">
                                    <asp:DropDownList ID="DropDownBaseUrl" runat="server" style="width: 70px">
                                        <asp:ListItem Text="http://"></asp:ListItem>
                                        <asp:ListItem Text="https://"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TextBoxBaseUrl" runat="server" style="width: 270px;"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="tab">
		    	    <table cellpadding="0" cellspacing="5" border="0" style="width: 100%;">
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="CheckBoxShowFileExtensions" runat="server" /><br />
                                <asp:CheckBox ID="CheckBoxShowSystemTypeDescriptions" runat="server" /><br />
                                <asp:CheckBox ID="CheckBoxShowHiddenFilesAndFolders" runat="server" /><br />
                                <asp:CheckBox ID="CheckBoxShowSystemFilesAndFolders" runat="server" /><br />
                                <asp:CheckBox ID="CheckBoxDownloadOnDoubleClick" runat="server" /><br />
                                <asp:CheckBox ID="CheckBoxCheckboxSelectionEnabled" runat="server" /><br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr /></td>
                        </tr>
                        <tr>
                            <td style="width:200px"><%=Language.GetEntry("Label.ViewLayout")%>:</td>
                            <td align="right">
                                <asp:DropDownList ID="DropDownViewLayout" runat="server" style="width:130px" />
                            </td>
                        </tr>
                        <tr>
                            <td><%=Language.GetEntry("Label.ExcludedExtensionsForPreview")%>:</td>
                            <td align="right"><asp:Textbox ID="TextboxExcludedExtensionsForPreview" runat="server" style="width:125px" /></td>
                        </tr>
                        <tr>
                            <td><%=Language.GetEntry("675")%>:</td>
                            <td align="right"><asp:Textbox ID="TextboxTemporaryFilesLocation" runat="server" style="width:125px" /></td>
                        </tr>
                        <tr>
                            <td><%=Language.GetEntry("674")%>:</td>
                            <td align="right">
                                <asp:TextBox ID="TextBoxMaxSizeToCompress" runat="server"  style="width: 75px; text-align: right" MaxLength="10"></asp:TextBox>
                                <asp:DropDownList ID="DropDownMaxSizeToCompress" runat="server">
                                    <asp:ListItem Text="KB"></asp:ListItem>
                                    <asp:ListItem Text="MB"></asp:ListItem>
                                    <asp:ListItem Text="GB"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td><%=Language.GetEntry("Label.DownloadWithChunkedTransferThreshold")%>:</td>
                            <td align="right">
                                <asp:TextBox ID="TextBoxDownloadWithChunkedTransferThreshold" runat="server"  style="width: 75px; text-align: right" MaxLength="10"></asp:TextBox>
                                <asp:DropDownList ID="DropDownDownloadWithChunkedTransferThreshold" runat="server">
                                    <asp:ListItem Text="KB"></asp:ListItem>
                                    <asp:ListItem Text="MB"></asp:ListItem>
                                    <asp:ListItem Text="GB"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td><%=Language.GetEntry("668")%>:</td>
                            <td align="right">
                                <asp:ListBox ID="ListBoxUploadMethod" runat="server" />
                                <input type="button" id="MoveUpButton" value="<%=Language.GetEntry("FileVista.Action.Up") %>" onclick="onUploadMethodMoveUp(this)" style="width: 80px; float:right" disabled/>
                                <input type="button" id="MoveDownButton" value="<%=Language.GetEntry("FileVista.Action.Down") %>" onclick="onUploadMethodMoveDown(this)" style="width: 80px; float:right" disabled/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="tab">
    		    	<table cellpadding="0" cellspacing="5" border="0" style="width: 100%;">
                        <tr>
                            <td colspan="2">
                                <fieldset style="padding: 0; margin-top: 0"><legend style="color:black; text-align:center"><%=Language.GetEntry("639")%></legend>
                                    <div style="width: 350px; margin-top: 10px; margin-bottom: 10px; margin-left: 10px">
                                        <% foreach (var kvp in EventSetNames)
                                           { %>
                                        <span style="float: left; width: 175px">
                                            <input id="EventSetCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onEventSetCheckBoxClick(this)">
                                            <label for="EventSetCheckBox.<%=kvp.Key%>"><%=kvp.Value%></label>
                                        </span>
                                        <% } %>
                                        <br style="clear: both" />
                                        <hr style="border: none; border-top: 1px dotted #ACA899;"/>
                                        <% foreach (var kvp in EventNames)
                                           { %>
                                        <span style="float: left; width: 175px">
                                            <input id="EventCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onEventCheckBoxClick(this)">
                                            <label for="EventCheckBox.<%=kvp.Key%>"><%=kvp.Value%></label>
                                        </span>
                                        <% } %>
                                        <br style="clear: both" />
                                    </div>
                                </fieldset>
                                <fieldset style="padding: 0; margin-top: 10px"><legend style="color:black; text-align:center"><%=Language.GetEntry("641")%></legend>
                                    <div style="margin-left: 10px; margin-top: 10px; margin-bottom: 10px">
                                        <%=Language.GetEntry("642")%>&nbsp;&nbsp;&nbsp;<%=Language.GetEntry("635", "<input id=\"TextBoxLogSize\" type=\"text\" style=\"width: 40px; text-align: right\" maxLength= \"10\" value=\"" + logSize + "\" />")%>
                                        <br /><br /><%=Language.GetEntry("643")%>
                                        <br /><br /><%=Language.GetEntry("644", "<input id=\"TextBoxLogClearDays\" type=\"text\" style=\"width: 30px; text-align: right\" maxLength= \"3\" value=\"" + logClearDays + "\"/>")%>
                                    </div>                        
                                </fieldset>                      
                            </td>                       
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: right">
                                <asp:Button ID="ButtonClearLog" runat="server" style="width: 100px" OnClick="ButtonClearLog_Click" OnClientClick="return onClearLog()" />                    
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="tab">
		    	    <table cellpadding="0" cellspacing="10" border="0" style="width: 100%;">
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="CheckBoxSendEmailNotifications" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr /></td>
                        </tr>
                        <tr>
                            <td><%=Language.GetEntry("682")%>:</td>
                            <td align="right"><asp:Textbox ID="TextboxFromEmailAddress" runat="server" style="width:180px" /></td>
                        </tr>
                        <tr>
                            <td valign="top"><%=Language.GetEntry("FileVista.Label.EmailDeliveryMethod")%>:</td>
                            <td align="right"><asp:DropDownList ID="DropDownEmailDeliveryMethod" runat="server" style="width:185px" /></td>
                        </tr>
                    </table> 
                    <hr style="border: none; border-top: 1px dotted #ACA899; margin-left: 10px; margin-right: 10px;"/>    
                    <table id="SmtpServerSettingsTable" cellpadding="0" cellspacing="10" border="0" style="width: 100%; display:none">
                        <tr>
                            <td><%=Language.GetEntry("FileVista.Label.SmtpHost")%>:</td>
                            <td align="right"><asp:Textbox ID="TextboxSmtpServer" runat="server" style="width:180px" /></td>
                        </tr>
                        <tr>
                            <td><%=Language.GetEntry("FileVista.Label.SmtpPort")%>:</td>
                            <td align="right"><asp:Textbox ID="TextboxSmtpServerPort" runat="server" style="width:50px; text-align: right" /></td>
                        </tr>
                        <tr>
                            <td valign="top"><%=Language.GetEntry("FileVista.Label.SmtpAuthentication")%>:</td>
                            <td align="right"><asp:DropDownList ID="DropDownSmtpAuthentication" runat="server" style="width:185px" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellpadding="4" cellspacing="0" border="0" style="margin-left: 20px; margin-top: 0px;">
                                    <tr>
                                        <td><label id="LabelSmtpUserName" for="TextboxSmtpUserName"><%=Language.GetEntry("502")%></label></td>
                                        <td align="right"><asp:Textbox ID="TextboxSmtpUserName" runat="server" style="width:120px" /></td>
                                    </tr>
                                    <tr>
                                        <td><label id="LabelSmtpPassword" for="TextboxSmtpPassword"><%=Language.GetEntry("503")%></label></td>
                                        <td align="right"><asp:Textbox ID="TextboxSmtpPassword" runat="server" style="width:120px" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="CheckBoxSmtpUseSsl" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <table id="SpecifiedPickupSettingsTable" cellpadding="0" cellspacing="10" border="0" style="width: 100%; display:none">
                        <tr>
                            <td align="left"><%=Language.GetEntry("FileVista.Label.PickupDirectoryLocation")%>:</td>
                            <td align="right"><asp:Textbox ID="TextboxPickupDirectoryLocation" runat="server" style="width:180px" /></td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="10" border="0" style="width: 100%;">
                        <tr>
                            <td colspan="2" style="text-align: right">
                                <asp:Button ID="ButtonTestSmtp" runat="server" style="width: 100px" OnClick="ButtonTestSmtp_Click" OnClientClick="onSubmit()"/>                    
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="gt-formBottom"><asp:Button ID="ButtonOK" runat="server" style="width: 80px" OnClick="ButtonOK_Click" OnClientClick="onSubmit()" />&nbsp;<asp:Button ID="ButtonCancel" runat="server" Text="Button" style="width: 80px" OnClientClick="elementDialog.close(); return false;" /></div>
        </form>
    </body>
</html>
