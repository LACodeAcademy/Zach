using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Workout.Classes;


namespace Workout
{
    public partial class ListWorkout : System.Web.UI.Page
    {
        private string _connectionString = "Data Source=LorenAcademy.db.2610820.hostedresource.com; Initial Catalog=LorenAcademy; User ID=LorenAcademy; Password='gol13!Pass';";                           
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                //this line is breaking because you are trying to convert DataTable to List<Workouts>
                //This is happening because you aren't declaring the variable correctly. Needs to be List<workouts> theData = ....
                DataTable theData = SetTheData();
                rptWorkouts.DataSource = theData;
                rptWorkouts.DataBind();
            }
        }
        protected List<Workouts> SetTheData()
        {
            DataTable table = new DataTable("table");
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = new SqlConnection(_connectionString);
                cmd.CommandText = "select workoutid, workoutname from workouts";
                cmd.Connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(table);
                List<Workouts> list = new List<Workouts>();
                
                
                //Below you gotta do table.Rows
                foreach (DataRow row in table)
                {
                    Workouts instance = new Workouts();
                    instance.WorkoutId = row["WorkoutId"];
                    list.Add(instance);
                }
            }

            //you'll want to return the list that you made above.   return list;
            return //some list<Workouts>;
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