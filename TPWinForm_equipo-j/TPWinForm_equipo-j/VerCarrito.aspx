<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerCarrito.aspx.cs" Inherits="TPWinForm_equipo_j.VerCarrito" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .precio-total float-end{
            background-color: lightgrey;
            border: solid;
            border-color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="dgvCarrito" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
    <Columns>
        <asp:BoundField DataField="Articulo.Nombre" HeaderText="Nombre del Artículo" />
        <asp:BoundField DataField="Articulo.Descripcion" HeaderText="Descripción del Artículo" />
        <asp:BoundField DataField="Articulo.Precio" HeaderText="Precio" DataFormatString="${0:N2}" />
        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
        <asp:TemplateField HeaderText="Acción">
            <ItemTemplate>
                <asp:Button ID="btnEliminar" class="btn btn-secondary btn-sm" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("Articulo.Id") %>' OnClick="btnEliminar_Click"/>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
    <a href="Default.aspx" class="btn btn-secondary btn-sm">Volver al catálogo</a>
    <asp:Label ID="lblPrecioTotal" runat="server" CssClass="precio-total float-end" Text=""></asp:Label>
</asp:Content>
