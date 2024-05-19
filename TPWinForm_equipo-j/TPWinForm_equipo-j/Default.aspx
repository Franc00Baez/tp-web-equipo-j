﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWinForm_equipo_j.Default" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <asp:Label ID="lblBienvenido" runat="server" Text="Bienvenido" CssClass="text- font-weight-bold h1" ></asp:Label>
    </div>
    <div>
    <asp:Label ID="lblFiltrar" runat="server" Text="Filtra por lo que necesites" CssClass="text- font-weight-bold h3"></asp:Label>
    </div>
    <br />
    <div>
        <asp:DropDownList ID="ddlCampo" runat="server" CssClass="form-control-sm" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="Nombre">Nombre</asp:ListItem>
            <asp:ListItem Value="Marca">Marca</asp:ListItem>
            <asp:ListItem Value="Categoria">Categoría</asp:ListItem>
            <asp:ListItem Value="Precio">Precio</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="ddlCriterio" CssClass="form-control-sm" runat="server">
            <asp:ListItem Value="Comienza por">Comienza por</asp:ListItem>
            <asp:ListItem Value="Termina con">Termina con</asp:ListItem>
            <asp:ListItem Value="Igual a">Igual a</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtFiltro" runat="server" CssClass="form-control-sm" placeholder="Ingrese el filtro" type="text"></asp:TextBox>
        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="btn btn-secondary btn-sm" OnClick="btnFiltrar_Click" />
        <asp:Button ID="btnLimpiarFiltro" runat="server" CssClass="btn btn-secondary btn-sm" Text="Borrar filtro" OnClick="btnLimpiarFiltro_Click"/>
        <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label>
    </div>
    <div class="row">
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <asp:Repeater ID="Rep1" runat="server" OnItemDataBound="Rep1_ItemDataBound">
                <ItemTemplate>
                    <div class="col">
                        <div class="card">
                            <img src="<%#Eval("Imagen.URL") %>" class="card-img-top img-fluid w-50" onerror="this.src='https://t3.ftcdn.net/jpg/02/48/42/64/360_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg'" alt="Imagen">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                <p class="card-text"><%#Eval("Descripcion") %></p>
                                <p class="card-text">Precio: $<%# String.Format("{0:0.##}", Convert.ToDecimal(Eval("Precio")))%></p>
                                <asp:Button ID="btncarrito" runat="server" class="btn btn-secondary btn-sm" Text="Agregar al carrito" CommandName="AddtoCart" OnClick="btncarrito_Click" />
                                <a href="DetalleArticulo.aspx?id=<%#Eval("Id") %>" class="btn btn-secondary btn-sm">Ver detalles</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
