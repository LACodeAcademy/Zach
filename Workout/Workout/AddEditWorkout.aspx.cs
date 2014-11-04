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
        }

        protected void Button1Create(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                lblCreate.Text = "Please enter a name for your workout.";
                return;
            }
            else
            {
                string wokroutName = TextBox1.Text;
                DataFunctions.InsertWorkout(wokroutName);
            }
        }
    }
}