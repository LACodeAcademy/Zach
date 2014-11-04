using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WorkoutSite.Classes
{
    public class Workout
    {
        public int WorkoutId { get; set; }
        public string WorkoutName { get; set; }
        public DateTime CreateStamp { get; set; }
        public List<WorkoutSite.WorkoutPage> WorkoutList { get; set; } 

    }
}