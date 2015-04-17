<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>LoLMatchups</title>
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
        <asp:Table ID="infoTable" runat="server" Height="100px" Width="1000" EnableTheming="False"></asp:Table>
    </div>
    <div id="server_status">
         <asp:Label ID="status" runat="server" Text="Label"></asp:Label>
    </div>
    </form>

</body>
</html>
