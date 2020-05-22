<%@ Page Language="C#" CodeBehind="Administration.aspx.cs" Inherits="GleamTech.FileVista.Web.AdministrationPage" %>

<!DOCTYPE html>

<%=ApplicationInfo%>
<html>
    <head runat="server">
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=10, user-scalable=yes">
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
        <link rel="icon" type="image/x-icon" href="favicon.ico" />
	</head>
    <body>
        <div id="pageHeader" class="gt-pageHeader gt-nonSelectableText">
            <span style="float: left;"><%=Title%></span>
            <div id="userInfo" class="gt-textButton" style="float: right" title="<%=UserTitle%>">
                <span class="gt-user-image"></span><span><%=UserFullName%></span><span class="gt-menudown-image"></span>
            </div>
        </div>
        <script type="text/javascript"<%=Request.Browser.Browser == "IE"
                            && Request.Browser.MajorVersion <= 8 ? " defer" : "" %>>
            var administrationPage = new GleamTech.FileVista.AdministrationPage({
                ElementId: "administrationPage",
                Language: "<%=Language.Culture.Name%>",
                ResourceBasePath: "<%=ResourceBasePath%>",
                FileUltimateResourceBasePath: "<%=FileUltimateResourceBasePath%>",
                ActionBasePath: "<%=ActionBasePath%>",
                IsGroupManager: <%=IsGroupManager%>,
                Sections: <%=Sections%>,
                ManagedGroups: <%=ManagedGroups%>,
                EventNames: <%=EventNames%>,
                EventIcons: <%=EventIcons%>
            });
        </script>
	</body>
</html>
