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
    public partial class Workout : System.Web.UI.Page
    {
        private string _connectionString = "Data Source=LorenAcademy.db.2610820.hostedresource.com; Initial Catalog=LorenAcademy; User ID=LorenAcademy; Password='gol13!Pass';";
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["ID"] == null)
            //{
            //    lblTitle.Text = ("Sorry, there is no information to be displayed");
            //}
            //else
            {
                //get The data
                DataTable theData = GetTheData(2);
                SetWorkoutDetails(theData);
                DataTable excerciseName = GetTheExercise(2);
                rptExercises.DataSource = excerciseName;
                rptExercises.DataBind();
                //display the data Convert.ToInt32(Request.QueryString["ID"]
            }


        }
        protected DataTable GetTheData(int workoutId)
        {
            DataTable dt1 = new DataTable();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = new SqlConnection(_connectionString);
                cmd.CommandText = "select workoutid, workoutname, createstamp from workouts where workoutid = " + workoutId;
                cmd.Connection.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    dt1.Load(sdr);
                }
                cmd.Connection.Close();
            }
            return dt1;
        }

        protected DataTable GetTheExercise(int workoutId)
        {
            DataTable dt2 = new DataTable();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = new SqlConnection(_connectionString);
                cmd.CommandText = @"
                    select exercise, regionname, musclename from workoutexerciselink wel
                    left outer join exercises e
                    on wel.exerciseid=e.exerciseid
                    left outer join regions rn
                    on rn.regionid=e.regionid
                    left outer join muscles m
                    on m.muscleid=e.targetmuscleid
                    where workoutid = " + workoutId;
                cmd.Connection.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    dt2.Load(sdr);
                }
                cmd.Connection.Close();
            }
            return dt2;
        }


        protected void SetWorkoutDetails(DataTable dataTable)
        {
            lblTitle.Text = dataTable.Rows[0]["workoutname"].ToString();
            lblDate.Text = dataTable.Rows[0]["createstamp"].ToString();
        }
    }
}