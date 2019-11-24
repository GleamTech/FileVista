<%@ Page Language="C#" CodeBehind="Expired.aspx.cs" Inherits="GleamTech.FileVista.Web.ExpiredPage" %>

<!DOCTYPE html>

<html>
    <head>
        <title>Session has expired</title>
        <script type="text/javascript">
            if (parent == self) {
                if (opener)
                    refreshPage(opener);
                window.close();
            } else if (parent)
                refreshPage(parent);

            function refreshPage(targetWin) {
                var win = targetWin || window;
                if (win.location.href.indexOf('#') == -1)
                    win.location.href = win.location.href;
                else
                    win.location.reload();
            };
        </script>        
    </head>
    <body>
    </body>
</html>
