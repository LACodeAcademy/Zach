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
                    through to indiciate it's done. Something like <span style="text-decoration: line-through">
                        this</span>.</li>
                <li>When making a new website is usually setting up the basic outline of the site.
                </li>
                <li>Start by looking up master pages and implement one. This will give you an opportunity
                    to create a header and menu to share across all pages. </li>
                    <li>Sql server connectionstring: 
                    
                    Data Source=LorenAcademy.db.2610820.hostedresource.com; Initial Catalog=LorenAcademy; User ID=LorenAcademy; Password='your password'; 
                    
                    </li>
            </ul>
        </div>
</asp:Content>