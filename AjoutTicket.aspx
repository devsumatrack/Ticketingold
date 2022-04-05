<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AjoutTicket.aspx.cs" Inherits="Ticketing.AjoutTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p class="text-center">
        <asp:Label ID="Label1" runat="server" style="font-family: Arial; font-weight: bold; font-size: x-large" Text="AJOUT CLIENT"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <table class="nav-justified">
        <tr>
            <td style="height: 20px; width: 82px">Categorie</td>
            <td style="height: 20px; width: 171px">
                <asp:TextBox ID="TxtCategorie" runat="server"></asp:TextBox>
            </td>
            <td style="height: 20px; width: 94px">Classification</td>
            <td style="height: 20px; width: 178px">
                <asp:TextBox ID="TxtClassification" runat="server"></asp:TextBox>
            </td>
            <td style="height: 20px; width: 55px">Statut</td>
            <td style="height: 20px; width: 182px">
                <asp:DropDownList ID="DropDownListStatut" runat="server">
                    <asp:ListItem>En cours</asp:ListItem>
                    <asp:ListItem>Suspendue</asp:ListItem>
                    <asp:ListItem>Close</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="height: 20px; width: 67px">Attribue</td>
            <td style="height: 20px">
                <asp:DropDownList ID="DropDownListAttribue" runat="server">
                    <asp:ListItem>BBS</asp:ListItem>
                    <asp:ListItem>Cient</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="height: 20px; width: 82px">
                <br />
            </td>
            <td style="height: 20px; width: 171px">&nbsp;</td>
            <td style="height: 20px; width: 94px">&nbsp;</td>
            <td style="height: 20px; width: 178px">&nbsp;</td>
            <td style="height: 20px; width: 55px">&nbsp;</td>
            <td style="height: 20px; width: 182px">&nbsp;</td>
            <td style="height: 20px; width: 67px">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px; width: 82px">Date debut</td>
            <td style="height: 20px; width: 171px">
                <asp:Button ID="BtnDTD" runat="server" OnClick="Button1_Click" Text="Selectionner" Width="152px" />
            </td>
            <td style="height: 20px; width: 94px">Date Fin</td>
            <td style="height: 20px; width: 178px">
                <asp:Button ID="BtnDTF" runat="server" OnClick="Button2_Click" Text="Selectionner" Width="152px" />
            </td>
            <td style="height: 20px; width: 55px">Dure</td>
            <td style="height: 20px; width: 182px">
                <asp:Label ID="LblDure" runat="server" Text="0"></asp:Label>
            </td>
            <td style="height: 20px; width: 67px">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px; width: 82px"></td>
            <td style="height: 20px; width: 171px">
                <asp:Calendar ID="CalendarDebut" runat="server" DayNameFormat="Shortest" OnSelectionChanged="CalendarDebut_SelectionChanged" Visible="False"></asp:Calendar>
            </td>
            <td style="height: 20px; width: 94px">&nbsp;</td>
            <td style="height: 20px; width: 178px">
                <asp:Calendar ID="CalendarFin" runat="server" DayNameFormat="Shortest" OnSelectionChanged="CalendarFin_SelectionChanged" Visible="False"></asp:Calendar>
            </td>
            <td style="height: 20px; width: 55px">&nbsp;</td>
            <td style="height: 20px; width: 182px">&nbsp;</td>
            <td style="height: 20px; width: 67px">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px; width: 82px">&nbsp;</td>
            <td colspan="5" style="height: 20px">Commentaire</td>
            <td style="height: 20px; width: 67px">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px; width: 82px">&nbsp;</td>
            <td colspan="5" style="height: 20px">
                <br />
                <asp:TextBox ID="TxtCommentaire" runat="server" Height="129px" Width="687px"></asp:TextBox>
            </td>
            <td style="height: 20px; width: 67px">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px; width: 82px">&nbsp;</td>
            <td colspan="5" style="height: 20px">&nbsp;</td>
            <td style="height: 20px; width: 67px">&nbsp;</td>
            <td style="height: 20px">
                <asp:Button ID="Button3" runat="server" BackColor="#FF9900" ForeColor="White" OnClick="Button3_Click" Text="ENREGISTRER" Width="152px" />
            </td>
        </tr>
    </table>
</asp:Content>
