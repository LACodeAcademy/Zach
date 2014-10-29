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
            //for (int i = 1; i < 100; i++)
            {
                DataTable theData = SetTheData(1);
                rptWorkouts.DataSource = theData;
                rptWorkouts.DataBind();
            }
        }
        protected DataTable SetTheData(int workoutId)
        {
            DataTable workouts = new DataTable();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = new SqlConnection(_connectionString);
                cmd.CommandText = "select workoutname from workouts = " + workoutId;
                cmd.Connection.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    workouts.Load(sdr);
                }
                cmd.Connection.Close();
            }
            return workouts;
        }
    }
}