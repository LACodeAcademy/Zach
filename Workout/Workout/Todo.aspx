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
                    through to indiciate it's done. Something like <span style="text-decoration: line-through">this</span>. <span style="color:green; font-weight: bold;">Zach, fix this step by giving the "span" tags a class and set the strike through at the top of the page.</span></li>
            <li class="FinishedTask">When making a new website is usually setting up the basic outline of the site.
            </li>
            <li class="FinishedTask">Start by looking up master pages and implement one. This will give you an opportunity
                    to create a header and menu to share across all pages. </li>
            <li><b>SQL</b>
                <ul>
                    <li><span style="font-weight: bold">Ok, you can calm down with the inserts. For now, we only need some test data, not an encyclopedia of rows. Afterall, we're going to create a website that has a form for inserting these. Here's a couple notes on yesterday's work that you did:</span>
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
                            <li>Create other tables: Excersizes, Workouts</li>
                            <li>Fill in data in those tables.</li>
                            <li>Start making some cool sql statements for selecting data. Research "sql joins".</li>
                        </ol>
                    </li>
                    <li>Sql server connectionstring: 
                        Data Source=LorenAcademy.db.2610820.hostedresource.com; Initial Catalog=LorenAcademy; User ID=LorenAcademy; Password='gol13!Pass'; 
                    </li>

                </ul>
            </li>

        </ul>
    </div>
</asp:Content>
