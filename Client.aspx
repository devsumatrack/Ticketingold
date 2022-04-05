


<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="Ticketing.Client" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    


      <fieldset class="text-light">
    <legend>Liste des client </legend>
    <div class="mb-3">
      <label for="disabledTextInput" class="form-label">Disabled input</label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="Disabled input">
    </div>
    <div class="mb-3">
      <label for="disabledSelect" class="form-label">Disabled select menu</label>
      <select id="disabledSelect" class="form-select">
        <option>Disabled select</option>
      </select>
    </div>
    <div class="mb-3">
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="disabledFieldsetCheck" disabled>
        <label class="form-check-label" for="disabledFieldsetCheck">
          Can't check this
        </label>
      </div>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </fieldset>














    <div class="listeClient ">

    <p class="text-center">
        &nbsp;</p>
<p class="text-center text-light" style="font-family: Arial; font-size: x-large">
    <strong>LISTE DES CLIENTS</strong></p>
    <p class="text-center" style="font-family: Arial; font-size: x-large">
        &nbsp;</p>
    <p class="text-center" style="font-family: Arial; font-size: x-large">
        &nbsp;</p>
   
       <table  style="Width:1252px"  class="nav-justified">
           <tr>
               <td style="width: 188px">&nbsp;</td>
               <td style="width: 41px">Nom</td>
               <td style="width: 242px">
                   <asp:TextBox ID="TxtNom" runat="server"></asp:TextBox>
               </td>
               <td style="width: 96px">Telephone</td>
               <td style="width: 186px">
                   <asp:TextBox ID="TxtTelephone" runat="server"></asp:TextBox>
               </td>
               <td style="width: 38px">Mail</td>
               <td style="width: 167px">
                   <asp:TextBox ID="TxtMail" runat="server" Width="145px"></asp:TextBox>
               </td>
               <td>
                   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Add.png" OnClick="ImageButton1_Click" />
               </td>
           </tr>
           <tr>
               <td style="width: 188px">&nbsp;</td>
               <td style="width: 41px">&nbsp;</td>
               <td style="width: 242px">
                   <br />
                   <br />
               </td>
               <td style="width: 96px">&nbsp;</td>
               <td style="width: 186px">&nbsp;</td>
               <td style="width: 38px">&nbsp;</td>
               <td style="width: 167px">&nbsp;</td>
               <td>&nbsp;</td>
           </tr>
       </table>
   </div>
            
    

    <table class="text-light" class="nav-justified">
        <tr>
            <td>&nbsp;</td>
            <td>
        <asp:GridView ID="GridViewListClient" runat="server" AutoGenerateColumns="False" Width="912px" OnRowEditing="GridViewListClient_RowEditing" DataKeyNames="ID" OnRowCancelingEdit="GridViewListClient_RowCancelingEdit" OnRowUpdating="GridViewListClient_RowUpdating" OnRowDeleting="GridViewListClient_RowDeleting" OnRowCommand="GridViewListClient_RowCommand" style="margin-left: 183px">
         
            <Columns>
                
                <asp:TemplateField AccessibleHeaderText="Nom" FooterText="Nom" HeaderText="Nom">
                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Nom") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtNom" Text='<%# Eval("Nom")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField AccessibleHeaderText="Telephone" FooterText="Telephone" HeaderText="Telephone">
                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Telephone") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtTel" Text='<%# Eval("Telephone") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField AccessibleHeaderText="Mail" FooterText="Mail" HeaderText="Mail">
                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Mail") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtMail" Text='<%# Eval("Mail") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/Images/Edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/Images/Delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />                 
                            <asp:ImageButton ImageUrl="~/Images/Ticket.png" runat="server" CommandName="Ticket" CommandArgument='<%# Eval("ID") %>' ToolTip="Assigner Ticket" Width="20px" Height="20px"/>                                                                   
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/Images/Save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                        <asp:ImageButton ImageUrl="~/Images/Close.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
           
            <RowStyle BorderStyle="None" />
           
        </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />

    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
</asp:Content>
