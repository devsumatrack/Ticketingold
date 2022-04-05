<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListeTicket.aspx.cs" Inherits="Ticketing.ListeTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>

    <div class="d-flex justify-content-between">

  <div class="p-2 bd-highlight text-light"> <img src="Images/ticketing.png" />
        TICKETING</div>
  <div class="p-2 bd-highlight  text-light"> <img src="Images/orthologick.png" />
        ORTHOLOGICK</div>
  

</div>


    <!--
    <p class="text-center" style="font-family: Arial; font-weight: bold; font-size: x-large"> <img src="Images/ticketing.png" />
        TICKETING</p>
     <p class="text-center" style="font-family: Arial; font-weight: bold; font-size: x-large"> <img src="Images/ticketing.png" />
        TICKETING</p>
    -->
    <br />
    <div>

        
    <div class="d-flex justify-content-between">

  <div class="p-2 bd-highlight">
      <asp:Button class=" bg-primary" style=" border-radius:2px; border:none" ID="Button3" runat="server" Text="CREER" OnClick="Button1_Click" /></div>


  <div class="p-2 bd-highlight"> <asp:Button  class=" bg-primary" style=" border-radius:2px; border:none"  ID="Button4" runat="server" Text="EXPORTER" Width="91px" /> </div>
  

</div>

       

    </div>
    <br />
    <div class="text-light">
        <asp:GridView ID="GridViewTicket" runat="server" Width="1252px" AutoGenerateColumns="False" OnRowCommand="GridViewTicket_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                    </ItemTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CATEGORIE">
                     <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Categorie") %>'></asp:Label>
                    </ItemTemplate>                                     
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CLASSIFICATION">
                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                         <asp:Label runat="server" Text='<%# Eval("Classification") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="STATUT">
                     <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                         <asp:Label runat="server" Text='<%# Eval("Statut") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CREER PAR">
                     <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                         <asp:Label runat="server" Text='<%# Eval("Creation") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="GROUPE">
                     <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                         <asp:Label runat="server" Text='<%# Eval("Groupe") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ATTRIBUE">
                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                         <asp:Label runat="server" Text='<%# Eval("Attribue") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DATE CREATION">
                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                         <asp:Label runat="server" Text='<%# Eval("DateCreation") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DATE FIN">
                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                         <asp:Label runat="server" Text='<%# Eval("DateFin") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="DURE">
                     <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                         <asp:Label runat="server" Text='<%# Eval("Dure") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="TxtEdit" runat="server" ImageUrl="~/Images/Edit.png" CommandName="EditTicket" CommandArgument='<%# Eval("ID") %>' Width="20px" Height="20px"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
</div>
</asp:Content>

