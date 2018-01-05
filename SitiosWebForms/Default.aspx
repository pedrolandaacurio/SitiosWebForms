<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SitiosWebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        /*
    script to apply bootstrap pagination in asp.net gridview
    by Issam Ali 
    http://issamsoft.com
    Usage:
    ------
    set gridview property: PagerStyle-CssClass="bs-pagination" 
*/

        $(document).ready(function () {
            $('.bs-pagination td table').each(function (index, obj) {
                convertToPagination(obj)
            });
        });

        function convertToPagination(obj) {
            var liststring = '<ul class="pagination">';

            $(obj).find("tbody tr").each(function () {
                $(this).children().map(function () {
                    liststring = liststring + "<li>" + $(this).html() + "</li>";
                });
            });
            liststring = liststring + "</ul>";
            var list = $(liststring);
            list.find('span').parent().addClass('active');

            $(obj).replaceWith(list);
        }
    </script>
    <asp:LoginView runat="server">
        <AnonymousTemplate>
            <div class="jumbotron">
                <h1>¡Bienvenido!</h1>
                <br />
                <p class="lead"><a href="Account/Login.aspx">Loguéate</a> para comenzar a registrar</p>
            </div>
            <center>
                <p><small>Si deseas tener un usuario, contacta con <strong><a href="mailto:jmsalas@factotum-iis.org">jmsalas@factotum-iis.org</a></strong> para habilitar tu usuario.</small></p>
            </center>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <div class="container">
                <div class="jumbotron">
                    <h1>Comencemos.</h1>
                    <br />
                    <a href="Sitios/BusquedaCodigos.aspx" class="btn btn-block btn-lg btn-primary">Registro de sitios</a>
                </div>
                
            </div>
        </LoggedInTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="Administrador">
                <ContentTemplate>
                    
                    <hr />
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>

</asp:Content>
