using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Workout
{
    public partial class ListWorkout : System.Web.UI.Page
    {
        private string _connectionString = "Data Source=LorenAcademy.db.2610820.hostedresource.com; Initial Catalog=LorenAcademy; User ID=LorenAcademy; Password='gol13!Pass';";                           
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                DataTable theData = SetTheData();
                rptWorkouts.DataSource = theData;
                rptWorkouts.DataBind();
            }
        }
        protected DataTable SetTheData()
        {
            DataTable workouts = new DataTable();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = new SqlConnection(_connectionString);
                cmd.CommandText = "select workoutid, workoutname from workouts";
                cmd.Connection.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    workouts.Load(sdr);
                }
                cmd.Connection.Close();
            }
            return workouts;
        }
        protected void RptWorkoutsDataBind(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if (item.ItemType == ListItemType.AlternatingItem || item.ItemType == ListItemType.Item)
            {
                DataRowView row = (DataRowView) e.Item.DataItem;
                HyperLink hlWorkouts = (HyperLink)item.FindControl("hlWorkouts");
                hlWorkouts.NavigateUrl = "Workout.aspx?ID=" + row["workoutid"].ToString();
                hlWorkouts.Text = row["workoutname"].ToString();
            }
        }
    }
}