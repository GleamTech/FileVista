<%@ Page Language="C#" CodeBehind="EventFilterDialog.aspx.cs" Inherits="GleamTech.FileVista.Web.EventFilterDialogPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title><%=Language.GetEntry("645")%></title>
    </head>
    <body>
        <script type="text/javascript">
            eventSetTypes = <%=EventSetsJsonObject%>;
            eventTypes = <%=EventsJsonObject%>;
            selectedEventTypes = <%=SelectedEventTypes%>;
        </script>
        <form id="form1" runat="server">
			<table cellpadding="0" cellspacing="5" border="0" style="width: 100%">
			    <tr>
			        <td colspan="2">
                        <fieldset style="padding: 0"><legend style="color:black; text-align:center"><%=Language.GetEntry("637")%></legend>
                            <div style="width: 270px; margin-top: 10px; margin-bottom: 10px; margin-left: 10px">
                                <% foreach (var kvp in EventSetNames)
                                   { %>
                                <span style="float: left; width: 135px">
                                    <input id="EventSetCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onEventSetCheckBoxClick(this)">
                                    <label for="EventSetCheckBox.<%=kvp.Key%>"><%=kvp.Value%></label>
                                </span>
                                <% } %>
                                <br style="clear: both" />
                                <hr style="border: none; border-top: 1px dotted #ACA899;"/>
                                <% foreach (var kvp in EventNames)
                                   { %>
                                <span style="float: left; width: 135px">
                                    <input id="EventCheckBox.<%=kvp.Key%>" type="checkbox" onclick="onEventCheckBoxClick(this)">
                                    <label for="EventCheckBox.<%=kvp.Key%>"><%=kvp.Value%></label>
                                </span>
                                <% } %>
                                <br style="clear: both" />
                            </div>
                        </fieldset>			        
			        </td>
			    </tr>
                <tr>
                    <td><%=Language.GetEntry("Label.Column.User")%>:</td>
                    <td align="right"><asp:TextBox ID="TextBoxUser" runat="server" style="width: 180px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><%=Language.GetEntry("647")%>:</td>
                    <td align="right"><asp:TextBox ID="TextBoxFromDate" runat="server" style="width: 80px; text-align: right"></asp:TextBox>&nbsp;-&nbsp;<asp:TextBox ID="TextBoxToDate" runat="server" style="width: 80px; text-align: right"></asp:TextBox></td>
                </tr>
            </table>
            <div class="gt-formBottom"><asp:Button ID="Button1" runat="server" style="width: 80px" OnClientClick="onSubmit(); return false;" />&nbsp;<asp:Button ID="Button2" runat="server" Text="Button" style="width: 80px" OnClientClick="elementDialog.close(); return false;" /></div>
        </form>
    </body>
</html>
