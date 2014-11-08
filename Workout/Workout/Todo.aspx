<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Todo.aspx.cs" Inherits="WorkoutSite.Todo" MasterPageFile="Master1.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label runat="server" ID="lblMessage" />
    <%--
        Above is a asp:label which is a .net control. Notice the runat=server property. That means this control will be rendered and turned into normal html by .net
        There are lots of .net controls. You'll learn all about them as we progress. A asp:Label is simple. It turns into a "span" html tag.
    --%>
    <style>
        .FinishedTask {
            text-decoration: line-through;
        }
    </style>
    <div>
        <hr />
        <ul>
            <li class="FinishedTask">Leave this list on this page as you progress. As you complete the items in the list,
                    alter the item's li here to have a class. The class should be named something like
                    "FinishedTask" Any li with that class should have a style that "strikes" the text
                    through to indiciate it's done. Something like <span style="text-decoration: line-through">this</span>. <span style="color: green; font-weight: bold;">Zach, fix this step by giving the "span" tags a class and set the strike through at the top of the page.</span></li>
            <li class="FinishedTask">When making a new website is usually setting up the basic outline of the site.
            </li>
            <li class="FinishedTask">Start by looking up master pages and implement one. This will give you an opportunity
                    to create a header and menu to share across all pages. </li>
            <li>
                <div style="border: 1px solid black; background-color: coral">
                    <h2>SQL Practice</h2>
                    <ol>
                        <li>Put a decent amount of test data in. At least 4 different workouts with at least 5 different exercises in each.</li>
                        <li>Do a sql statement for each of the following:
                            <ul>
                                <li>All exercises in any single workout.</li>
                                <li>Create a query to give me the count of all exercises that are in the database.</li>
                                <li>I want to see a query which produces the name of each workout and then the second column should display the COUNT of the amount of exercises in each workout. Look up "count" and "group by".</li>
                                <li>List of all exercises which are NOT on a workout.</li>
                            </ul>
                        </li>
                    </ol>
                </div>
            </li>
            <li>
                <h2>Other</h2>
                <ul>
                    <li>In our programming you'll encouter lists a lot. Lists of exercises, lists of workouts, lists of items on an order. They're faily easy to deal with. The format is: 
                        <textarea>
                            List<Type> 
                        </textarea>
                       Where type is what the list is a list of. So a List of Exercises would be 
                        <textarea>
                            List<Exercise> exercises = new List<Exercise>();
                        </textarea>
                        You can then cycle through the list (foreach) or manipulate  the list ( exercises.OrderBy(x => x.ExerciseName) ).  You can also "bind" that list to shit. An example would be a ListBox. The problem that we had earlier this week was that you wanted to bind the list to the listbox, but you wanted to display the name of the exercise and also the exercise region.  Because of the complexity here, we need to cycle through the exercises and add them to the ListBox 1 at a time:<br />
                        foreach (Exercise thisExercise in ListOfExercises)<br />
                        {<br />
                            string textValueForListBox = thisExercise.ExerciseName + " " + thisExercise.Region.RegionName;<br />
                            ListItem theListItem = new ListItem();<br />
                            theListItem.Text = textValueForListBox;<br />
                            theListItem.Value = thisExercise.ExerciseId.ToString();<br />
                            lbExercises.Add(theListItem);<br />
                        }<br />
                    </li>
                </ul>
            </li>

        </ul>
    </div>
</asp:Content>
