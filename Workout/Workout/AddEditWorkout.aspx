<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddEditWorkout.aspx.cs" Inherits="WorkoutSite.AddEditWorkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblInform"></asp:Label>
    <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
    <asp:Button runat="server" ID="btnCreate" Text="Create Workout" OnClick="BtnCreateClick"/>
    <asp:Button runat="server" ID="btnUpdate" Text="Edit Workout" OnClick="BtnUpdateClick" Visible="False"/>
    <asp:LinkButton runat="server" ID="btnCancelUpdate" Text="Cancel" OnClick="BtnCancelUpdateClick" Visible="False"></asp:LinkButton>
    <asp:Label runat="server" ID="lblCreate"></asp:Label>
    <asp:DropDownList runat="server" ID="ddlWorkouts" OnSelectedIndexChanged="DdlWorkoutsUpdate" AutoPostBack="True"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
</asp:Content>
