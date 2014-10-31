using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Workout.Classes
{
    public class Exercises
    {
        public int ExerciseId { get; set; }
        public string Exercise { get; set; }
        public int TargetMuscleId { get; set; }
        public int RegionId { get; set; }
        public DateTime CreateStamp { get; set; }
        public List<Exercises> ExerciseList { get; set; } 
    }
}