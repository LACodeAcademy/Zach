<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Todo.aspx.cs" Inherits="Workout.Todo" MasterPageFile="Master1.Master" %>

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
            <li><b>SQL</b>
                <ul>
                    <li class="FinishedTask"><span style="font-weight: bold">Ok, you can calm down with the inserts. For now, we only need some test data, not an encyclopedia of rows. Afterall, we're going to create a website that has a form for inserting these. Here's a couple notes on yesterday's work that you did:</span>
                        <ul>
                            <li>Try to keep naming conventions consistent. This isn't a "law", but a best practice. Notice the first table is capitalized "Users". The next table isn't, "exercises". You did a good job with table names.</li>
                            <li>There are also naming conventions for when you get into c#. c# is caps sensitive, sql isn't.</li>
                            <li>This one is important: Whenever you find yourself typing the same text more than once, it probably means you need another table. An example is the muscle regions. What happens if we decided we want to change "Shoulders" to something else like "Upper Arms" or something weird, we'd need to update ALL records. The solution to to create another table called "MuscleRegions". That table would hold each muscle region and a unique id. Then back in the exercize table the column would be "MuscleRegionId". The Id would reference the unique Id from the new MuscleRegion table. This theory is called "Normalization". I am pretty sure you SQL book has some more good information on it.</li>
                            <li>The same goes for the TargetMuscle column. This could likely reference the same table mentioned in the step above. The final results of the exercises table would look like:<br />
                                <table border="1">
                                    <tr>
                                        <th>UserId</th>
                                        <th>Exercize</th>
                                        <th>TargetMuscleId</th>
                                        <th>RegionId</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Arnold Press</td>
                                        <td>4</td>
                                        <th>6</th>
                                    </tr>
                                </table>
                            </li>
                        </ul>
                    </li>
                    <li class="FinishedTask">To select, alter, or insert data in our database, open sql server management studio express. It's on the desktop. Login credentials should already be filled in, if they're not, they are below.</li>
                    <li class="FinishedTask">In the left pane navigate to a database called "LorenAcademy". A database is comprised of 1 or more "tables". If you expand the database node you will see a node for tables. Currently there is 1 table called "Users". A table is comprised of "records". I've inserted 1 already.</li>
                    <li class="FinishedTask">At the top of Sql manager there is a button for "New Query". Click that you the main pane will fill with a text area. Write this text then click "Execute Query": select * from users</li>
                    <li class="FinishedTask">Now the move is to do some reading on sql. Don't really worry about reading anything about creating or altering tables. Instead, you want to learn about normalized databases and select/insert/update statements.</li>
                    <li>The overall out look is:
                        <ol>
                            <li class="FinishedTask">Insert records in Users table for all people.</li>
                            <li class="FinishedTask">Create other tables: Excersizes, Workouts</li>
                            <li class="FinishedTask">Fill in data in those tables.</li>
                            <li class="FinishedTask">Start making some cool sql statements for selecting data. Research "sql joins".</li>
                        </ol>
                    </li>
                    <li>Sql server connectionstring: 
                        Data Source=LorenAcademy.db.2610820.hostedresource.com; Initial Catalog=LorenAcademy; User ID=LorenAcademy; Password='gol13!Pass'; 
                    </li>

                </ul>
            </li>
            <li>We need to do some practice with basic c# and .net controls. To do this we'll build a basic form that adds numbers together and displays the answer.<br />
                <div style="border: 1px solid black">
                    <h2>The Adding Tool</h2>
                    <ol>
                        <li>Create a new web form in this solution, use the master page.</li>
                        <li>Add two asp:textboxes, 2 labels (one to display an error if it occurs and one to display the answer), and add an asp:button.</li>
                        <li>When you click the button, the c# logic should take the numbers from the two textboxes, add them together, and display the answer in the label.</li>
                        <li>Don't forget to add validation (values must be present and numeric).</li>
                        <li>Ask loren if you need hints.</li>
                    </ol>
                </div>
            </li>
            <li>
                <div style="border: 1px solid black">
                    <h2>SQL Practice</h2>
                    <ol>
                        <li>Put a decent amount of test data in. At least 4 different workouts with at least 5 different exercises in each.</li>
                        <li>Do a sql statement for each of the following:
                            <ul>
                                <li>All exercises in any single workout.</li>
                                <li>Include the attributes on each exercise of the above query.</li>
                                <li>Create a query to give me the count of all exercises that are in the database.</li>
                                <li>I want to see a query which produces the name of each workout and then the second column should display the COUNT of the amount of exercises in each workout. Look up "count" and "group by".</li>
                            </ul>
                        </li>
                    </ol>
                </div>

            </li>
            <li>
                <div style="border: 1px solid black">
                    <h2>C# Workout Steps</h2>
                    <ol>
                        <li>First step is to create a basic report.</li>
                        <li>Let's start by making a page that displays details on a workout and each of the exercises in the workout.</li>
                        <li>Create a SQL statment that will display that. The WHERE clause should search on workouts.workoutid.</li>
                        <li>On the VS side you'll need to create a new web form. In the .aspx page you'll be using a .net repeater control asp:repeater</li>
                        <li>Research and create the repeater on the page.</li>
                        <li>In the .cs file you'll want to create a function which does the following:
                            <ol>
                                <li>
                                    Creates a string with the SQL statement you created above.
                                </li>
                                <li>Use a SqlCommand, provide it with the connection string from above and the sql statement.</li>
                                <li>Use the SqlCommand to fill a DataTable. The datatable is the a .net object that holds data.</li>
                                <li>The datatabl will then need to bind to the repeater.</li>
                                <li>Some reference: http://www.high-flying.co.uk/c-sharp/asp-net-repeater.html. You will want to follow this, except where it says: <br />
                                    DataTable newsDataTable = new Datatable();  that is the line where you pull data from the database. so your code will look like:<br />
                                    DataTable newsDataTable = ZachsFunctionWhichPullsFromDb();
                                </li>
                                <li>then create a function that pulls that data:<br />
                                    protected DataTable ZachsFunctionWhichPullsFromDb()<br />
                                    {<br />
                                        code here...<br />
                                    }<br />

                                </li>
                            </ol>
                        </li>

                    </ol>
                </div>

            </li>
        </ul>
    </div>
</asp:Content>
