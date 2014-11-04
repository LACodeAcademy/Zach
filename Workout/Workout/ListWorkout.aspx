<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true"
    CodeBehind="ListWorkout.aspx.cs" Inherits="WorkoutSite.ListWorkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1 style="text-align: center">
        Workouts at Villa de Fitness
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblWorkoutName"></asp:Label>
    <asp:Repeater runat="server" ID="rptWorkouts" OnItemDataBound="RptWorkoutsDataBind">
        <HeaderTemplate>
            <table>
            </table>
        </HeaderTemplate>
        <ItemTemplate>
            <table>
                <tr>
                    <td>
                        <asp:HyperLink runat="server" ID="hlWorkouts"></asp:HyperLink>
                        <asp:Label runat="server" ID="lblCreateStamp"></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <FooterTemplate>
            <table>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
