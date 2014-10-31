using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Workout.Classes
{
    public class Workouts
    {
        public int WorkoutId { get; set; }
        public string WorkoutName { get; set; }
        public DateTime CreateStamp { get; set; }
        public List<Workout> WorkoutList { get; set; } 

    }
}