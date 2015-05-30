<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="LabNET01.Pages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="63px" Width="265px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="Producer" HeaderText="Producer" SortExpression="Producer" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" 
            DeleteCommand="DELETE FROM [Products] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [Products] ([Name], [Price], [Quantity], [Weight], [Producer]) VALUES (@Name, @Price, @Quantity, @Weight, @Producer)" 
            SelectCommand="SELECT * FROM [Products]" 
            UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Price] = @Price, [Quantity] = @Quantity, [Weight] = @Weight, [Producer] = @Producer WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox3"  Name="Name" Type="String" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox4"  Name="Price" Type="Double" PropertyName="Text"/>
                <asp:ControlParameter ControlID="TextBox5"  Name="Quantity" Type="Int32" PropertyName="Text"/>
                <asp:ControlParameter ControlID="TextBox6"  Name="Weight" Type="String" PropertyName="Text"/>
                <asp:ControlParameter ControlID="TextBox7"  Name="Producer" Type="String" PropertyName="Text"/>
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TextBox3"  Name="Name" Type="String" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox4"  Name="Price" Type="Double" PropertyName="Text"/>
                <asp:ControlParameter ControlID="TextBox5"  Name="Quantity" Type="Int32" PropertyName="Text"/>
                <asp:ControlParameter ControlID="TextBox6"  Name="Weight" Type="String" PropertyName="Text"/>
                <asp:ControlParameter ControlID="TextBox7"  Name="Producer" Type="String" PropertyName="Text"/>
                <asp:ControlParameter ControlID="DropDownList1" Name="Id" Type="Int32" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </h1>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SHOW" />
    &nbsp;<asp:Button ID="Button2" runat="server" Text="DELETE" OnClick="Button2_Click" />
    &nbsp;<asp:Button ID="ButtonUpdate" runat="server" Text="UPDATE" OnClick="ButtonUpdate_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Id" DataValueField="Id">
    </asp:DropDownList>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="ButtonInsert" runat="server" Text="INSERT" OnClick="ButtonInsert_Click" />
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
&nbsp;<h1>Strona1</h1>
</asp:Content>
