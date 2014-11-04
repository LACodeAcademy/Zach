using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WorkoutSite.Classes
{
    public class Exercise
    {
        public int ExerciseId { get; set; }
        public string ExerciseName { get; set; }
        public Muscle Muscle { get; set; }
        public Region Region { get; set; }
        public DateTime CreateStamp { get; set; }
        public List<Exercise> ExerciseList { get; set; } 
    }
}