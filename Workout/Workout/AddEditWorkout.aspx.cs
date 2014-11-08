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
    public partial class AddEditWorkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblInform.Text = "What would you like to call your workout?";
            if (!Page.IsPostBack)
            {
                DdlWorkouts();
            }
        }

        protected void BtnCreateClick(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                lblCreate.Text = "Please enter a name for your workout.";
                return;
            }
            else
            {
                string workoutName = TextBox1.Text;
                int newWorkoutId = DataFunctions.InsertWorkout(workoutName);
                Response.Redirect("WorkoutPage.aspx?Id=" + newWorkoutId);
            }
        }
        protected void DdlWorkouts()
        {
            ddlWorkouts.DataSource = DataFunctions.GetTheWorkouts();
            ddlWorkouts.DataTextField = "WorkoutName";
            ddlWorkouts.DataValueField = "WorkoutId";
            ddlWorkouts.DataBind();
            ddlWorkouts.Items.Insert(0, new ListItem("Select a workout to edit", "-1"));
        }

        protected void DdlWorkoutsUpdate(object sender, EventArgs e)
        {
            int workoutId = (Convert.ToInt32(ddlWorkouts.SelectedItem.Value));
            if (workoutId == -1)
            {
                lblCreate.Text = "Please select an actual workout to edit";
                return;
            }
            Workout listWorkout = DataFunctions.GetTheWorkouts(workoutId)[0];
            TextBox1.Text = listWorkout.WorkoutName;
            btnCreate.Visible = false;
            btnUpdate.Visible = true;
            btnCancelUpdate.Visible = true;
            lblCreate.Text = "";
        }
        protected void BtnCancelUpdateClick(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            btnCancelUpdate.Visible = false;
            btnCreate.Visible = true;
            btnUpdate.Visible = false;
            lblCreate.Text = "";
        }
        protected void BtnUpdateClick(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                lblCreate.Text = "Please enter a name for your workout.";
                return;
            }
            else if (TextBox1.Text == "Select a workout to edit")
            {
                lblCreate.Text = "Please select an actual workout.";
                return;
            }
            else
            {
                string workoutName = TextBox1.Text;
                int workoutId = (Convert.ToInt32(ddlWorkouts.SelectedItem.Value));
                DataFunctions.UpdateWorkout(workoutName, workoutId);
                DdlWorkouts();
            }
        }

    }
}