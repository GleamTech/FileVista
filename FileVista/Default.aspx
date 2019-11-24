<%@ Page Language="C#" CodeBehind="Default.aspx.cs" Inherits="GleamTech.FileVista.Web.DefaultPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title></title>
    </head>
    <body>
        <div id="pageHeader" class="gt-pageHeader gt-nonSelectableText x-hidden-display">
            <span style="float: left;">FileVista</span>
            <div id="userInfo" class="gt-textButton" style="float: right" title="<%=UserTitle%>">
                <span class="gt-user-image"></span><span><%=UserFullName%></span><span class="gt-menudown-image"></span>
            </div>
        </div>
        <script type="text/javascript">
            fileVistaParameters = {
                ResourceBasePath: "<%=ResourceBasePath%>",
                ActionBasePath: "<%=ActionBasePath%>",
                IsAdministrator: <%=IsAdministrator%>,
                IsGroupManager: <%=IsGroupManager%>,
                CanLogout: <%=CanLogout%>
            };
        </script>
        <asp:PlaceHolder ID="fileManagerPlaceHolder" runat="server" />
    </body>
</html>
