<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Todo.aspx.cs" Inherits="Workout.Todo" MasterPageFile="Master1.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label runat="server" ID="lblMessage" />
    <%--
        Above is a asp:label which is a .net control. Notice the runat=server property. That means this control will be rendered and turned into normal html by .net
        There are lots of .net controls. You'll learn all about them as we progress. A asp:Label is simple. It turns into a "span" html tag.
    --%>
    <div>
        <hr />
        <ul>
            <li>Leave this list on this page as you progress. As you complete the items in the list,
                    alter the item's li here to have a class. The class should be named something like
                    "FinishedTask" Any li with that class should have a style that "strikes" the text
                    through to indiciate it's done. Something like <span style="text-decoration: line-through">this</span>. <span style="color:yellow">Zach, you never did this step! (OOPS! Done.)</span></li>
            <li><span style="text-decoration: line-through">When making a new website is usually setting up the basic outline of the site.</span>
            </li>
            <li><span style="text-decoration: line-through">Start by looking up master pages and implement one. This will give you an opportunity
                    to create a header and menu to share across all pages. </span></li>
            <li><b>SQL</b>
                <ul>
                    <li>To select, alter, or insert data in our database, open sql server management studio express. It's on the desktop. Login credentials should already be filled in, if they're not, they are below.</li>
                    <li>In the left pane navigate to a database called "LorenAcademy". A database is comprised of 1 or more "tables". If you expand the database node you will see a node for tables. Currently there is 1 table called "Users". A table is comprised of "records". I've inserted 1 already.</li>
                    <li>At the top of Sql manager there is a button for "New Query". Click that you the main pane will fill with a text area. Write this text then click "Execute Query": select * from users</li>
                    <li>Now the move is to do some reading on sql. Don't really worry about reading anything about creating or altering tables. Instead, you want to learn about normalized databases and select/insert/update statements.</li>
                    <li>The overall out look is:
                        <ol>
                            <li>Insert records in Users table for all people.</li>
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
