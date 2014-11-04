using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WorkoutSite.Classes;
using WorkoutSite.DataAccess;


namespace WorkoutSite
{
    public partial class ListWorkout : System.Web.UI.Page
    {
        private string _connectionString = "Data Source=LorenAcademy.db.2610820.hostedresource.com; Initial Catalog=LorenAcademy; User ID=LorenAcademy; Password='gol13!Pass';";
        protected void Page_Load(object sender, EventArgs e)
        {

            //this line is breaking because you are trying to convert DataTable to List<WorkoutPage>
            //This is happening because you aren't declaring the variable correctly. Needs to be List<workouts> theData = ....

            List<Classes.Workout> theData = DataFunctions.GetTheWorouts();
            rptWorkouts.DataSource = theData;
            rptWorkouts.DataBind();

        }

        //trying to do this return... workoutList is what I have throughout, but it doesnt like that

        protected void RptWorkoutsDataBind(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if (item.ItemType == ListItemType.AlternatingItem || item.ItemType == ListItemType.Item)
            {
                Classes.Workout row = (Classes.Workout)e.Item.DataItem;
                HyperLink hlWorkouts = (HyperLink)item.FindControl("hlWorkouts");
                Label lblCreateStamp = (Label)item.FindControl("lblCreateStamp");
                hlWorkouts.NavigateUrl = "WorkoutPage.aspx?ID=" + row.WorkoutId;
                hlWorkouts.Text = row.WorkoutName;
                lblCreateStamp.Text = Convert.ToString(row.CreateStamp);
            }
        }
    }
}