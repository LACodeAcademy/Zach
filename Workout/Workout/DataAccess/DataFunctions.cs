using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WorkoutSite.Classes;

namespace WorkoutSite.DataAccess
{
    public class DataFunctions
    {
        private static string _connectionString = "Data Source=LorenAcademy.db.2610820.hostedresource.com; Initial Catalog=LorenAcademy; User ID=LorenAcademy; Password='gol13!Pass';";


        // 
        /// <summary>
        /// Gets workouts from database
        /// </summary>
        /// <param name="workoutId">If this parameter is sent only 1 workout will be returned</param>
        public static List<Classes.Workout> GetTheWorkouts(int? workoutId = null)
        {
            DataTable table = new DataTable("table");
            List<Classes.Workout> workoutList = new List<Classes.Workout>();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = new SqlConnection(_connectionString);
                cmd.CommandText = "select workoutid, workoutname, createstamp from workouts";
                if (workoutId != null)
                {
                    cmd.CommandText = cmd.CommandText + " where workoutid = @workoutId";
                    cmd.Parameters.AddWithValue("@workoutId", workoutId);
                }
                cmd.Connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(table);
                cmd.Connection.Close();
            }

            //Below you gotta do table.Rows -- Done
            foreach (DataRow row in table.Rows)
            {
                Classes.Workout instance = new Classes.Workout();
                instance.WorkoutId = Convert.ToInt32(row["WorkoutId"]);
                instance.WorkoutName = Convert.ToString(row["WorkoutName"]);
                instance.CreateStamp = Convert.ToDateTime(row["CreateStamp"]);
                workoutList.Add(instance);
            }
            return workoutList;
        }

        // Gets exercises and info from database that corrospond with a WorkoutId
        public static List<Exercise> GetTheExercises(int workoutId)
        {
            DataTable dt2 = new DataTable();
            List<Exercise> exerciseList = new List<Exercise>();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = new SqlConnection(_connectionString);
                cmd.CommandText = @"
                    select exercise, regionname, musclename, e.createstamp from workoutexerciselink wel
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
            foreach (DataRow row in dt2.Rows)
            {
                Exercise instance = new Exercise();
                instance.ExerciseName = Convert.ToString(row["exercise"]);
                instance.Region = new Region();
                instance.Region.RegionName = Convert.ToString(row["regionname"]);
                instance.Muscle = new Muscle();
                instance.Muscle.MuscleName = Convert.ToString(row["musclename"]);
                instance.CreateStamp = Convert.ToDateTime(row["createstamp"]);
                exerciseList.Add(instance);
            }
            return exerciseList;
        }

        // Allows users to add a new workout to the database
        public static int InsertWorkout(string workoutName)
        {
            DataTable table = new DataTable();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = new SqlConnection(_connectionString);
                cmd.CommandText = "insert into Workouts (WorkoutName) values (@workoutname); select @@identity";
                cmd.Parameters.AddWithValue("@workoutname", workoutName);
                cmd.Connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(table);
                cmd.Connection.Close();
            }
            return Convert.ToInt32(table.Rows[0][0]);
        }

        /// <summary>
        /// Allows users to update a current WorkoutName in the database
        /// </summary>
        /// <param name="workoutName"></param>
        /// <param name="workoutId"></param>
        public static void UpdateWorkout(string workoutName, int workoutId)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = new SqlConnection(_connectionString);
                cmd.CommandText = "update workouts set workoutname = @workname where workoutid = @workoutid";
                cmd.Parameters.AddWithValue("@workname", workoutName);
                cmd.Parameters.AddWithValue("@workoutid", workoutId);
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
            }
        }
        // Gets all exercises from the database
        public static List<Exercise> GetAllTheExercises()
        {
            DataTable dt2 = new DataTable();
            List<Exercise> exerciseList = new List<Exercise>();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = new SqlConnection(_connectionString);
                cmd.CommandText = @"select ExerciseId, Exercise, RegionName, MuscleName from exercises e
                left outer join regions r
                on e.regionid=r.regionid
                left outer join muscles m
                on e.targetmuscleid=m.muscleid";
                cmd.Connection.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    dt2.Load(sdr);
                }
                cmd.Connection.Close();
            }
            foreach (DataRow row in dt2.Rows)
            {
                Exercise instance = new Exercise();
                instance.ExerciseName = Convert.ToString(row["exercise"]);
                instance.ExerciseId = Convert.ToInt32(row["exerciseid"]);
                instance.Region = new Region();
                instance.Region.RegionName = Convert.ToString(row["regionname"]);
                instance.Muscle = new Muscle();
                instance.Muscle.MuscleName = Convert.ToString(row["musclename"]);
                exerciseList.Add(instance);
            }
            return exerciseList;
        }

        // Adds an exercise to a workout
        public static void InsertExercise(int workoutId, int exerciseId)
        {
            {
                DataTable table = new DataTable();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = new SqlConnection(_connectionString);
                    cmd.CommandText = "insert into workoutexerciselink (workoutid, exerciseid) values (@workoutId, @exerciseId)";
                    cmd.Parameters.AddWithValue("@workoutId", workoutId);
                    cmd.Parameters.AddWithValue("@exerciseId", exerciseId);
                    cmd.Connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(table);
                    cmd.Connection.Close();
                }
            }
        }

    }
}