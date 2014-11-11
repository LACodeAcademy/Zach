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
            List<Classes.Workout> theData = DataFunctions.GetTheWorkouts();
            rptWorkouts.DataSource = theData;
            rptWorkouts.DataBind();
        }
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