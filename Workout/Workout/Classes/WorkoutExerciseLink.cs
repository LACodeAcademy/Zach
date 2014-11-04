using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WorkoutSite.Classes
{
    public class WorkoutExerciseLink
    {
        public int WorkoutExerciseLinkId { get; set; }
        public int WorkoutId { get; set; }
        public int ExerciseId { get; set; }
        public DateTime CreateStamp { get; set; }
    }
}