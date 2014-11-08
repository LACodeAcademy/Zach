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
    public partial class WorkoutPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] == null)
            {
                lblTitle.Text = ("Sorry, there is no information to be displayed");
                return;
            }
            //get The data
            List<Workout> workouts = DataFunctions.GetTheWorkouts(Convert.ToInt32(Request.QueryString["ID"])); //There are 3 workouts... feel free to change this value in lines 24 & 26 to see them all
            SetWorkoutDetails(workouts[0]);
            List<Exercise> excerciseName = DataFunctions.GetTheExercises(Convert.ToInt32(Request.QueryString["ID"]));
            rptExercises.DataSource = excerciseName;
            rptExercises.DataBind();
            //display the data Convert.ToInt32(Request.QueryString["ID"]
        }

        protected void SetWorkoutDetails(Classes.Workout theWorkout)
        {
            lblTitle.Text = theWorkout.WorkoutName;
            lblDate.Text = theWorkout.CreateStamp.ToString();
        }

        protected void RptExerciseDataBind(object sender, RepeaterItemEventArgs e)
        {
            //You need to create an if statment here which basically makes the code below execute only if it's the code is cyclying for <ItemTemplate>
            //You don't want the code to do the below logic if it's for the <HeaderTemplate> or <FooterTemplate>.
            //In the example of the web page that is why they have the if statments at the start of the function.
            RepeaterItem item = e.Item;
            if (item.ItemType == ListItemType.AlternatingItem || item.ItemType == ListItemType.Item)
            {
                Exercise exercise = (Exercise)e.Item.DataItem;
                Label lblExercises = (Label)item.FindControl("lblExercises");
                lblExercises.Text = exercise.ExerciseName;
                Label lblRegionName = (Label)item.FindControl("lblRegionName");
                lblRegionName.Text = exercise.Region.RegionName;
                Label lblMuscleName = (Label)item.FindControl("lblMuscleName");
                lblMuscleName.Text = exercise.Muscle.MuscleName;
            }

            //This is good, except it will fail if you're iterating throug hthe header or footer because this control doesn't exist in the header or footer.
            //Which is why you should read the above comment.
        }
        protected void BtnEditWorkoutClick(object sennder, EventArgs e)
        {
            btnEditWorkout.Visible = false;
            lbExercises.Visible = true;
            foreach (Exercise currentExercise in DataFunctions.GetAllTheExercises())
            {
                string textLbExercises = currentExercise.ExerciseName + " - " + currentExercise.Region.RegionName + " - " + currentExercise.Muscle.MuscleName;
                ListItem currentListItem = new ListItem();
                currentListItem.Text = textLbExercises;
                currentListItem.Value = currentExercise.ExerciseId.ToString();
                lbExercises.Items.Add(currentListItem);
            }
        }
        protected void LbExerciseClick(object sender, EventArgs e)
        {
            btnInsertExercise.Visible = true;
            btnInsertExercise.Text = "Add Selected Exercise To Workout";
        }
        protected void BtnInsertExerciseClick(object sender, EventArgs e)
        {
            int workoutId = (Convert.ToInt32(Request.QueryString["ID"]));
            int exerciseId = (Convert.ToInt32(lbExercises.SelectedItem.Value));
            DataFunctions.InsertExercise(workoutId, exerciseId);
            List<Workout> workouts = DataFunctions.GetTheWorkouts(Convert.ToInt32(Request.QueryString["ID"])); //There are 3 workouts... feel free to change this value in lines 24 & 26 to see them all
            SetWorkoutDetails(workouts[0]);
            List<Exercise> excerciseName = DataFunctions.GetTheExercises(Convert.ToInt32(Request.QueryString["ID"]));
            rptExercises.DataSource = excerciseName;
            rptExercises.DataBind();
        }

    }
}