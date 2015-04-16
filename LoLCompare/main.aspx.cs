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
    protected void Page_Load(object sender, EventArgs e)
    {
        summoner_id.Text = "";
        status.Text = "";
        champion_id.Text = "";
        played_as_total.Text = "";
    }

    protected void submit(object sender, EventArgs e)
    {
        status.Text = "Did not connect to the Database Server.";

        //connect to server
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["lolmatchupsDB"].ConnectionString;
        MySqlConnection connection = new MySqlConnection(connectionString);
        MySqlDataReader reader;

        //search for player
        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = "SELECT * FROM lolmatchups.player_champion_stat where summoner_id=" + box.Text;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;
        connection.Open();
        status.Text = "Connected to Database Server !!";

        try
        {
            reader = cmd.ExecuteReader();
            reader.Read();

            //print data
            summoner_id.Text = "Summoner: " + reader.GetInt16(0).ToString();
            champion_id.Text = "Champion: " + reader.GetInt16(1).ToString();
            played_as_total.Text = "Played as total: " + reader.GetInt16(3).ToString();
            //other data..
        }
        catch (Exception conException)
        {
            summoner_id.Text = "summoner id not found";
        }
        connection.Close();

        box.Text = "";
    }

}