<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddEditWorkout.aspx.cs" Inherits="WorkoutSite.AddEditWorkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblInform"></asp:Label>
    <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
    <asp:Button runat="server" ID="Button1" Text="Create Workout" OnClick="Button1Create"/>
    <asp:Label runat="server" ID="lblCreate"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
</asp:Content>
