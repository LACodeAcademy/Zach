<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true"
    CodeBehind="redo.aspx.cs" Inherits="Workout.redo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Label ID="lblError" runat="server" />
<asp:TextBox ID="textBox1" runat="server" />
<asp:TextBox ID="textBox2" runat="server" />
<asp:Button ID="button1" runat="server" Text="Enter" OnClick="Button1Add"/>
<asp:Label ID="lblAnswer" runat="server" />
</asp:Content>
