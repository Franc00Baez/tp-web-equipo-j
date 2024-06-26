﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerCarrito.aspx.cs" Inherits="TPWinForm_equipo_j.VerCarrito" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .separador{
            margin-top: 407px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div>
        <asp:Label ID="lblVacio" runat="server" Text="Carrito: " CssClass="text font-weight-bold h3"></asp:Label>
    </div>
    <br />
    <asp:GridView ID="dgvCarrito" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
        <Columns>
            <asp:BoundField DataField="Articulo.Nombre" HeaderText="Nombre del Artículo" />
            <asp:BoundField DataField="Articulo.Descripcion" HeaderText="Descripción del Artículo" />
            <asp:BoundField DataField="Articulo.Precio" HeaderText="Precio" DataFormatString="${0:N2}" />
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
            <asp:TemplateField HeaderText="Acción">
                <ItemTemplate>
                    <asp:Button ID="btnEliminar" class="btn btn-secondary btn-sm" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("Articulo.Id") %>' OnClick="btnEliminar_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <a href="Default.aspx" class="btn btn-secondary btn-sm">Volver al catálogo</a>
    <asp:Label ID="lblPrecioTotal" runat="server" CssClass="precio-total float-end" Text=""></asp:Label>
    <div class="separador">
    </div>
</asp:Content>
