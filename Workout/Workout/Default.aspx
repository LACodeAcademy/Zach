<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Workout.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/C#" runat="server">
        /*    
        Every .aspx page should have an associated .cs page. the .aspx page should hold the html markup, the .cs page holds the c# logic.
        It's possible to put c# code here on the .aspx page. This is not a good idea but you will run into it.
        1. It's mixes c# code and html markup. It's always a good idea to separate different types of code and markup.    
            that way if you ever hire an html guy and a seperate c# guy they won't be fudging with each other's code.
        2. Code that is not in its own .cs file doesn't get compiled. 
      */  
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server" ID="lblMessage" /> 
        <%--
        Above is a asp:label which is a .net control. Notice the runat=server property. That means this control will be rendered and turned into normal html by .net
        There are lots of .net controls. You'll learn all about them as we progress. A asp:Label is simple. It turns into a "span" html tag.
        --%>
        <div>
            <hr />
            <ul>
                <li>Leave this list on this page as you progress. As you complete the items in the list, alter the item's li here to have a class. The class should be named something like "FinishedTask" Any li with that class should have a style that "strikes" the text through to indiciate it's done. Something like <span style="text-decoration: line-through">this</span>.</li>
                <li>When making a new website is usually setting up the basic outline of
                    the site. </li>
                <li>Start by looking up master pages and implement one. This will give you an opportunity
                    to create a header and menu to share across all pages. </li>
            </ul>
        </div>
    </div>
    </form>
</body>
</html>
