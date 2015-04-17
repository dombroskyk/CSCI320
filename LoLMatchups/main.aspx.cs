using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using MySql.Data.MySqlClient;

public partial class _Default : System.Web.UI.Page
{
    //todo case sensitivity
    private System.ComponentModel.IContainer components;
    private MySqlConnection connection;
    protected void Page_Load(object sender, EventArgs e)
    {
        summoner_id.Text = "";
        status.Text = "";
        connection = connectToServer();
    }

    protected void submit(object sender, EventArgs e)
    {

        MySqlDataReader reader;
        //search for summoner, Dynamic SQL
        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = "SELECT player.name, " +
            "player_champion_stat.champion_id," +
            "player_champion_stat.played_as_won," +
            "player_champion_stat.played_as_total," +
            "player_champion_stat.played_against_won," +
            "player_champion_stat.played_against_total," +
            "player_champion_stat.summoner_id," +
            "player.rank," +
            "player.level," +
            "player.last_update_match_id " +
            "FROM lolmatchups.player_champion_stat," +
                "lolmatchups.player where lolmatchups.player_champion_stat.summoner_id =" +
                " lolmatchups.player.summoner_id and lolmatchups.player.name = @name";
        cmd.Parameters.Add("@name", MySqlDbType.VarChar, 11);
        cmd.Parameters["@name"].Value = box.Text;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;

        //open connection
        try { connection.Open(); }
        catch (Exception conException) { status.Text = "Did not connect to the Database Server."; }

        //execute
        try
        {
            reader = cmd.ExecuteReader();

            //add custom header row
            TableRow arow = new TableRow();
            TableCell acell = new TableCell();
            acell.Text = "Summoner Name";
            arow.Cells.Add(acell);
            acell = new TableCell();
            acell.Text = "Champion Id";
            arow.Cells.Add(acell);
            acell = new TableCell();
            acell.Text = "Played as Won";
            arow.Cells.Add(acell);
            acell = new TableCell();
            acell.Text = "Played as Total";
            arow.Cells.Add(acell);
            acell = new TableCell();
            acell.Text = "Played vs Won";
            arow.Cells.Add(acell);
            acell = new TableCell();
            acell.Text = "Played vs Total";
            arow.Cells.Add(acell);
            acell = new TableCell();
            acell.Text = "Summoner Id";
            arow.Cells.Add(acell);
            acell = new TableCell();
            acell.Text = "Rank";
            arow.Cells.Add(acell);
            acell = new TableCell();
            acell.Text = "Level";
            arow.Cells.Add(acell);
            acell = new TableCell();
            acell.Text = "last_update_match_id";
            arow.Cells.Add(acell);

            infoTable.Rows.Add(arow);

            while (reader.Read())
            {
                arow = new TableRow();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {

                    acell = new TableCell();
                    acell.Text = reader.GetString(i);
                    arow.Cells.Add(acell);
                }
                infoTable.Rows.Add(arow);
            }
        }
        catch (Exception notFound)
        {
            summoner_id.Text = "Summoner not found";
        }

        //close connection
        connection.Close();

        //reset input box
        box.Text = "";
    }

    protected MySqlConnection connectToServer()
    {
        
        //connect to server
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["lolmatchupsDB"].ConnectionString;
        MySqlConnection connection = new MySqlConnection(connectionString);

        return connection;
    }


}