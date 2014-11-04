<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true"
    CodeBehind="Adding.aspx.cs" Inherits="WorkoutSite.Adding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblError" runat="server" />
    <asp:TextBox ID="TextBox1" runat="server" />
    <asp:TextBox ID="TextBox2" runat="server" />
    <asp:Button ID="Button1" runat="server" Text="Hit That Shit" OnClick="Button1Add"/>
    <asp:Label ID="lblAnswer" runat="server" />

</asp:Content>
