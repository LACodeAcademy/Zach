<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true"
    CodeBehind="ListWorkout.aspx.cs" Inherits="Workout.ListWorkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<%--                        Need to figure out how to hyperlink this new repeater method with the workout id into the query string
--%>                            <asp:HyperLink runat="server" ID="hlWorkouts"></asp:HyperLink>
                        </a>
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
