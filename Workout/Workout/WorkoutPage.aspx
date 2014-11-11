<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true"
    CodeBehind="WorkoutPage.aspx.cs" Inherits="WorkoutSite.WorkoutPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .forAmerica 
        {
            margin-left: 510px;
            height: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1 style="text-align: center">
        <asp:Label runat="server" ID="lblTitle"></asp:Label>
        <asp:Label runat="server" ID="lblDate"></asp:Label>
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater runat="server" ID="rptExercises" OnItemDataBound="RptExerciseDataBind">
        <HeaderTemplate>
            <table border="1" style="width: 500px; float: left" >
                <tr bgcolor="red">
                    <th style="width: 200px">
                        Excercise
                    </th>
                    <th style="width: 200px">
                        Region
                    </th>
                    <th style="width: 200px">
                        Target Muscle
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr bgcolor="red">
                <td>
                    <asp:Label runat="server" ID="lblExercises"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblRegionname"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblMuscleName"></asp:Label>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <div class="forAmerica">
        <asp:LinkButton runat="server" ID="btnEditWorkout" OnClick="BtnEditWorkoutClick" Text="Click to Edit your Workout."></asp:LinkButton>
        <asp:ListBox runat="server" ID="lbExercises" OnSelectedIndexChanged="LbExerciseClick" Visible="False" AutoPostBack="True" Height="250px"/>
        <asp:LinkButton runat="server" ID="btnInsertExercise" OnClick="BtnInsertExerciseClick" Visible="False" Text="Add Selected Exercise To Workout"></asp:LinkButton>
    </div>
</asp:Content>
