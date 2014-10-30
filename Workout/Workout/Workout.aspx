<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true"
    CodeBehind="Workout.aspx.cs" Inherits="Workout.Workout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblTitle"></asp:Label>
    <asp:Label runat="server" ID="lblDate"></asp:Label>
    <asp:Repeater runat="server" ID="rptExercises">
        <HeaderTemplate>
            <table border="1" style="width: 100%">
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
                        <%# DataBinder.Eval(Container.DataItem, "exercise") %>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "regionname") %>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "musclename") %>
                    </td>
                </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
