<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>hello title</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="search_box">
        <asp:TextBox id="box" runat="server" />
        <asp:Button ID="findSummoner" runat="server" OnClick="submit" Text="Find Summoner" />
    </div>
    <div id="summoner_info">
        <asp:Label ID="summoner_id" runat="server" Text="Label"></asp:Label>
        <br/>
        <asp:Label ID="champion_id" runat="server" Text="Label"></asp:Label>
        <br/>
        <asp:Label ID="played_as_total" runat="server" Text="Label"></asp:Label>
    </div>
    <div id="server_status">
         <asp:Label ID="status" runat="server" Text="Label"></asp:Label>
    </div>
    </form>

</body>
</html>
