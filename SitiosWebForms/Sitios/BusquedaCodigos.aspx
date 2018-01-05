<%@ Page Title="Edición de Sitios de Inhumación" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BusquedaCodigos.aspx.cs" Inherits="SitiosWebForms.Sitios.BusquedaCodigos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    
    <div class="container">
        <!--Formulario-->
        <asp:UpdatePanel runat="server" ID="UpdatePanelSitio">
            <ContentTemplate>
                <div class="panel panel-default">
                    <div class="panel-heading">Buscar por archivo</div>
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="BusquedaCaja" class="control-label col-md-1">Caja</label>
                                <div class="col-md-2">
                                    <asp:DropDownList runat="server" AutoPostBack="true" ID="BusquedaCaja" CssClass="form-control" DataSourceID="BusquedaCajaSQLSource" DataTextField="Caja" DataValueField="Caja"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="BusquedaCajaSQLSource" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT DISTINCT [Caja] FROM [Sitios] ORDER BY [Caja]"></asp:SqlDataSource>
                                </div>
                                <label for="BusquedaClasificacion" class="control-label col-md-1">Clasificación</label>
                                <div class="col-md-2">
                                    <asp:DropDownList runat="server" AutoPostBack="true" ID="BusquedaClasificacion" CssClass="form-control" DataSourceID="BusquedaClasificacionSQLSource" DataTextField="CodClasificacion" DataValueField="CodClasificacion"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="BusquedaClasificacionSQLSource" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT DISTINCT [CodClasificacion] FROM [Sitios] WHERE ([Caja] = @Caja) ORDER BY [CodClasificacion]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="BusquedaCaja" PropertyName="SelectedValue" Name="Caja" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-md-6">
                                    <div class="well">
                                        <p>
                                            Texto alternativo
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:GridView runat="server" ID="ListaSitiosSelect" AutoGenerateColumns="False" DataKeyNames="CodSitio" DataSourceID="GridViewListaSQLSource" AllowPaging="True" CssClass="table table-bordered table-condensed" PagerStyle-CssClass="bs-pagination">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Editar"></asp:CommandField>
                                <asp:BoundField DataField="CodSitio" HeaderText="Cod. Sitio" ReadOnly="True" SortExpression="CodSitio"></asp:BoundField>
                                <asp:BoundField DataField="Cod_Antiguo" HeaderText="Cod. Antiguo" SortExpression="Cod_Antiguo"></asp:BoundField>
                                <asp:BoundField DataField="FechaEvento" HeaderText="Fecha de evento" SortExpression="FechaEvento"></asp:BoundField>
                                <asp:BoundField DataField="FechaInhumacion" HeaderText="Fecha de Inhumacion" SortExpression="FechaInhumacion"></asp:BoundField>
                                <asp:BoundField DataField="Caja" HeaderText="Caja" SortExpression="Caja"></asp:BoundField>
                                <asp:BoundField DataField="CodClasificacion" HeaderText="Cod. Clasificacion" SortExpression="CodClasificacion"></asp:BoundField>
                                <asp:BoundField DataField="Carpeta" HeaderText="Carpeta" SortExpression="Carpeta"></asp:BoundField>
                                <asp:BoundField DataField="Folios" HeaderText="Folios" SortExpression="Folios"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                
                <asp:SqlDataSource runat="server" ID="GridViewListaSQLSource" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [CodSitio], [FechaEvento], [FechaInhumacion], [Caja], [CodClasificacion], [Carpeta], [Folios], [Cod_Antiguo] FROM [Sitios] WHERE (([Caja] = @Caja) AND ([CodClasificacion] = @CodClasificacion)) ORDER BY [CodSitio]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="BusquedaCaja" PropertyName="SelectedValue" Name="Caja" Type="String"></asp:ControlParameter>
                        <asp:ControlParameter ControlID="BusquedaClasificacion" PropertyName="SelectedValue" Name="CodClasificacion" Type="String"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <hr />
                <!--Aquí va el formulario-->
                <asp:FormView runat="server" ID="FormularioDeSitios" DataKeyNames="CodSitio" DataSourceID="SqlDataSource5" CssClass="form-horizontal">
                    <EditItemTemplate>
                        <div class="well">
                            <center>
                        <h1>
                            <asp:Label Text='<%# Eval("CodSitio") %>' runat="server" ID="CodSitioLabel1" />
                            <asp:TextBox Text='<%# Bind("Carpeta") %>' runat="server" ID="CarpetaTextBox" Visible="false"/>
                        </h1>
                        <p class="lead"><asp:Label Text='<%# Bind("Cod_Antiguo") %>' runat="server" ID="Cod_AntiguoTextBox" /></p>
                            <div class="table-reponsive">
                                <table class="table table-bordered table-condensed" style="width: 30%">
                                    <tr>
                                        <td style="text-align: center">
                                            Caja: <b>
                                                <asp:Label Text='<%# Bind("Caja") %>' runat="server" ID="CajaTextBox" /></b>
                                        </td>
                                        <td style="text-align: center">
                                            Clasificación: <b>
                                                <asp:Label Text='<%# Bind("CodClasificacion") %>' runat="server" ID="CodClasificacionTextBox" /></b>
                                        </td>
                                        <td style="text-align: center">
                                            Folios: <b>
                                                <asp:Label Text='<%# Bind("Folios") %>' runat="server" ID="FoliosTextBox" /></b>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            </center>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Ubicación
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label for="AltitudTextBox" class="control-label col-md-2">Altitud</label>
                                        <div class="col-md-4">
                                            <asp:TextBox Text='<%# Bind("Altitud") %>' runat="server" ID="AltitudTextBox" CssClass="form-control" TextMode="Number" />
                                        </div>
                                        <label for="PropiedadTextBox" class="control-label col-md-2">Propiedad</label>
                                        <div class="col-md-4">
                                            <asp:DropDownList Text='<%# Bind("Propiedad") %>' runat="server" ID="PropiedadTextBox" CssClass="form-control">
                                                <asp:ListItem Value="" Text="Sin especificar..."></asp:ListItem>
                                                <asp:ListItem Value="Privada" Text="Privada"></asp:ListItem>
                                                <asp:ListItem Value="Pública" Text="Pública"></asp:ListItem>
                                                <asp:ListItem Value="Comunal" Text="Comunal"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="well">
                                <div class="form-group">
                                    <label for="FechaEventoTextBox" class="control-label col-md-4">Fecha del evento</label>
                                    <div class="col-md-8">
                                        <asp:TextBox Text='<%# Bind("FechaEvento") %>' runat="server" ID="FechaEventoTextBox" CssClass="form-control" TextMode="Date" Visible="false" />
                                        <div class="col-md-4">
                                            <asp:DropDownList Text='<%# Bind("Evento_Ano") %>' runat="server" ID="Evento_AnoTextBox" CssClass="form-control">
                                                <asp:ListItem Text="Año" Value=""></asp:ListItem>
                                                <asp:ListItem Text="1960" Value="1960"></asp:ListItem>
                                                <asp:ListItem Text="1961" Value="1961"></asp:ListItem>
                                                <asp:ListItem Text="1962" Value="1962"></asp:ListItem>
                                                <asp:ListItem Text="1963" Value="1963"></asp:ListItem>
                                                <asp:ListItem Text="1964" Value="1964"></asp:ListItem>
                                                <asp:ListItem Text="1965" Value="1965"></asp:ListItem>
                                                <asp:ListItem Text="1966" Value="1966"></asp:ListItem>
                                                <asp:ListItem Text="1967" Value="1967"></asp:ListItem>
                                                <asp:ListItem Text="1968" Value="1968"></asp:ListItem>
                                                <asp:ListItem Text="1969" Value="1969"></asp:ListItem>
                                                <asp:ListItem Text="1970" Value="1970"></asp:ListItem>
                                                <asp:ListItem Text="1971" Value="1971"></asp:ListItem>
                                                <asp:ListItem Text="1972" Value="1972"></asp:ListItem>
                                                <asp:ListItem Text="1973" Value="1973"></asp:ListItem>
                                                <asp:ListItem Text="1974" Value="1974"></asp:ListItem>
                                                <asp:ListItem Text="1975" Value="1975"></asp:ListItem>
                                                <asp:ListItem Text="1976" Value="1976"></asp:ListItem>
                                                <asp:ListItem Text="1977" Value="1977"></asp:ListItem>
                                                <asp:ListItem Text="1978" Value="1978"></asp:ListItem>
                                                <asp:ListItem Text="1979" Value="1979"></asp:ListItem>
                                                <asp:ListItem Text="1980" Value="1980"></asp:ListItem>
                                                <asp:ListItem Text="1981" Value="1981"></asp:ListItem>
                                                <asp:ListItem Text="1982" Value="1982"></asp:ListItem>
                                                <asp:ListItem Text="1983" Value="1983"></asp:ListItem>
                                                <asp:ListItem Text="1984" Value="1984"></asp:ListItem>
                                                <asp:ListItem Text="1985" Value="1985"></asp:ListItem>
                                                <asp:ListItem Text="1986" Value="1986"></asp:ListItem>
                                                <asp:ListItem Text="1987" Value="1987"></asp:ListItem>
                                                <asp:ListItem Text="1988" Value="1988"></asp:ListItem>
                                                <asp:ListItem Text="1989" Value="1989"></asp:ListItem>
                                                <asp:ListItem Text="1990" Value="1990"></asp:ListItem>
                                                <asp:ListItem Text="1991" Value="1991"></asp:ListItem>
                                                <asp:ListItem Text="1992" Value="1992"></asp:ListItem>
                                                <asp:ListItem Text="1993" Value="1993"></asp:ListItem>
                                                <asp:ListItem Text="1994" Value="1994"></asp:ListItem>
                                                <asp:ListItem Text="1995" Value="1995"></asp:ListItem>
                                                <asp:ListItem Text="1996" Value="1996"></asp:ListItem>
                                                <asp:ListItem Text="1997" Value="1997"></asp:ListItem>
                                                <asp:ListItem Text="1998" Value="1998"></asp:ListItem>
                                                <asp:ListItem Text="1999" Value="1999"></asp:ListItem>
                                                <asp:ListItem Text="2000" Value="2000"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:DropDownList Text='<%# Bind("Evento_Mes") %>' runat="server" ID="Evento_MesTextBox" CssClass="form-control">
                                                <asp:ListItem Text="Mes" Value=""></asp:ListItem>
                                                <asp:ListItem Text="Enero" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Febrero" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Marzo" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="Abril" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="Mayo" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="Junio" Value="6"></asp:ListItem>
                                                <asp:ListItem Text="Julio" Value="7"></asp:ListItem>
                                                <asp:ListItem Text="Agosto" Value="8"></asp:ListItem>
                                                <asp:ListItem Text="Setiembre" Value="9"></asp:ListItem>
                                                <asp:ListItem Text="Octubre" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="Noviembre" Value="11"></asp:ListItem>
                                                <asp:ListItem Text="Diciembre" Value="12"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:DropDownList Text='<%# Bind("Evento_Dia") %>' runat="server" ID="Evento_DiaTextBox" CssClass="form-control">
                                                <asp:ListItem Text="Día" Value=""></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                                <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                                <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                                <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                                <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                                <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                                <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                                <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                                <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                                <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                                <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                                <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                <asp:ListItem Text="21" Value="21"></asp:ListItem>
                                                <asp:ListItem Text="22" Value="22"></asp:ListItem>
                                                <asp:ListItem Text="23" Value="23"></asp:ListItem>
                                                <asp:ListItem Text="24" Value="24"></asp:ListItem>
                                                <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                                <asp:ListItem Text="26" Value="26"></asp:ListItem>
                                                <asp:ListItem Text="27" Value="27"></asp:ListItem>
                                                <asp:ListItem Text="28" Value="28"></asp:ListItem>
                                                <asp:ListItem Text="29" Value="29"></asp:ListItem>
                                                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                <asp:ListItem Text="31" Value="31"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="FechaInhumacionTextBox" class="control-label col-md-4">Fecha de inhumación</label>
                                    <div class="col-md-8">
                                        <asp:TextBox Text='<%# Bind("FechaInhumacion") %>' runat="server" ID="FechaInhumacionTextBox" CssClass="form-control" TextMode="Date" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Condiciones de la inhumación
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="AntecedentesTextBox" class="control-label col-md-3">Antecedentes</label>
                                            <div class="col-md-9">
                                                <asp:TextBox Text='<%# Bind("Antecendentes") %>' runat="server" ID="AntecendentesTextBox" CssClass="form-control" TextMode="MultiLine" Rows="2" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="RelatoAcontecimientosTextBox" class="control-label col-md-3">Relato de los acontecimientos</label>
                                            <div class="col-md-9">
                                                <asp:TextBox Text='<%# Bind("RelatoAcontecimientos") %>' runat="server" ID="RelatoAcontecimientosTextBox" CssClass="form-control" TextMode="MultiLine" Rows="2" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="TestigosTextBox" class="control-label col-md-3">Testigos</label>
                                            <div class="col-md-9">
                                                <asp:TextBox Text='<%# Bind("Testigos") %>' runat="server" ID="TestigosTextBox" CssClass="form-control" TextMode="MultiLine" Rows="2" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="well">
                                            <div class="checkbox">
                                                <label>
                                                    <asp:CheckBox Checked='<%# Bind("ExhumacionAnterior") %>' runat="server" ID="ExhumacionAnteriorCheckBox" />
                                                    Enxhumación Anterior
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <asp:CheckBox Checked='<%# Bind("MaterialesAdicionales") %>' runat="server" ID="MaterialesAdicionalesCheckBox" />
                                                    Materiales adicionales
                                                </label>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                Coordenadas UTM
                                            </div>
                                            <div class="panel-body">
                                                <div class="col-md-6">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">E</span>
                                                        <asp:TextBox Text='<%# Bind("UTM_X") %>' runat="server" ID="UTM_XTextBox" CssClass="form-control" TextMode="Number" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">N</span>
                                                        <asp:TextBox Text='<%# Bind("UTM_Y") %>' runat="server" ID="UTM_YTextBox" CssClass="form-control" TextMode="Number" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="btn-group btn-group-justified">
                            <asp:LinkButton runat="server" Text="Actualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn btn-primary" />
                            <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn btn-default" />
                        </div>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div class="container">
                            <div class="well">
                                <center>
                        <h1>
                            <asp:Label Text='<%# Eval("CodSitio") %>' runat="server" ID="CodSitioLabel" />
                            <asp:Label Text='<%# Bind("Carpeta") %>' runat="server" ID="CarpetaLabel" Visible="false" />
                        </h1>
                        <p class="lead"><asp:Label Text='<%# Bind("Cod_Antiguo") %>' runat="server" ID="Cod_AntiguoTextBox" /></p>
                            <div class="table-reponsive">
                                <table class="table table-bordered table-condensed" style="width: 30%">
                                    <tr>
                                        <td style="text-align: center">
                                            Caja: <b>
                                                <asp:Label Text='<%# Bind("Caja") %>' runat="server" ID="CajaLabel" /></b>
                                        </td>
                                        <td style="text-align: center">
                                            Clasificación: <b>
                                                <asp:Label Text='<%# Bind("CodClasificacion") %>' runat="server" ID="CodClasificacionLabel" /></b>
                                        </td>
                                        <td style="text-align: center">
                                            Folios: <b>
                                                <asp:Label Text='<%# Bind("Folios") %>' runat="server" ID="FoliosLabel" /></b>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            </center>
                            </div>
                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Ubicación
                                    </div>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label for="AltitudLabel" class="control-label col-md-2">Altitud</label>
                                            <div class="col-md-4">
                                                <asp:Label Text='<%# Bind("Altitud") %>' runat="server" ID="AltitudLabel" CssClass="form-control" disabled="" />
                                            </div>
                                            <label for="PropiedadLabel" class="control-label col-md-2">Propiedad</label>
                                            <div class="col-md-4">
                                                <asp:Label Text='<%# Bind("Propiedad") %>' runat="server" ID="PropiedadLabel" CssClass="form-control" disabled="" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="well">
                                    <div class="form-group">
                                        <label for="FechaEventoLabel" class="control-label col-md-4">Fecha del evento</label>
                                        <div class="col-md-8">
                                            <asp:Label Text='<%# Bind("FechaEvento") %>' runat="server" ID="FechaEventoLabel" Visible="False" />
                                            <div class="col-md-4">
                                                <asp:Label Text='<%# Bind("Evento_Ano") %>' runat="server" ID="Evento_AnoLabel" CssClass="form-control" disabled="" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Label Text='<%# Bind("Evento_Mes") %>' runat="server" ID="Evento_MesLabel" CssClass="form-control" disabled="" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Label Text='<%# Bind("Evento_Dia") %>' runat="server" ID="Evento_DiaLabel" CssClass="form-control" disabled="" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="FechaInhumacionLabel" class="control-label col-md-4">Fecha de inhumación</label>
                                        <div class="col-md-8">
                                            <asp:Label Text='<%# Bind("FechaInhumacion") %>' runat="server" ID="FechaInhumacionLabel" CssClass="form-control" disabled="" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Condiciones de la inhumación
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="AntecendentesLabel" class="control-label col-md-3">Antecedentes</label>
                                                <div class="col-md-9">
                                                    <asp:Label Text='<%# Bind("Antecendentes") %>' runat="server" ID="AntecendentesLabel" CssClass="form-control" disabled="" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="RelatoAcontecimientosLabel" class="control-label col-md-3">Relato de los acontecimientos</label>
                                                <div class="col-md-9">
                                                    <asp:Label Text='<%# Bind("RelatoAcontecimientos") %>' runat="server" ID="RelatoAcontecimientosLabel" CssClass="form-control" disabled="" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="TestigosLabel" class="control-label col-md-3">Testigos</label>
                                                <div class="col-md-9">
                                                    <asp:Label Text='<%# Bind("Testigos") %>' runat="server" ID="TestigosLabel" CssClass="form-control" disabled="" />
                                                </div>
                                            </div>
                                            <div class="btn-group btn-group-justified">
                                                <a href="#" data-toggle="modal" data-target="#ModalAgregarVictimas" class="btn btn-primary">Agregar/Ver Víctimas</a>
                                                <a href="#" data-toggle="modal" data-target="#ModalAgregarInformante" class="btn btn-primary">Agregar/Ver informantes</a>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="well">
                                                <div class="checkbox">
                                                    <label>
                                                        <asp:CheckBox Checked='<%# Bind("ExhumacionAnterior") %>' runat="server" ID="ExhumacionAnteriorCheckBox" Enabled="false" disabled="" />
                                                        Enxhumación Anterior
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label>
                                                        <asp:CheckBox Checked='<%# Bind("MaterialesAdicionales") %>' runat="server" ID="MaterialesAdicionalesCheckBox" Enabled="false" disabled="" />
                                                        Materiales adicionales
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    Coordenadas UTM
                                                </div>
                                                <div class="panel-body">
                                                    <div class="col-md-6">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">E</span>
                                                            <asp:Label Text='<%# Bind("UTM_X") %>' runat="server" ID="UTM_XLabel" CssClass="form-control" disabled="" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">N</span>
                                                            <asp:Label Text='<%# Bind("UTM_Y") %>' runat="server" ID="UTM_YLabel" CssClass="form-control" disabled="" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-group btn-group-justified">
                                <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        No hay nada
                    </EmptyDataTemplate>
                </asp:FormView>

                <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' DeleteCommand="DELETE FROM [Sitios] WHERE [CodSitio] = @original_CodSitio AND (([Altitud] = @original_Altitud) OR ([Altitud] IS NULL AND @original_Altitud IS NULL)) AND (([Propiedad] = @original_Propiedad) OR ([Propiedad] IS NULL AND @original_Propiedad IS NULL)) AND (([Antecendentes] = @original_Antecendentes) OR ([Antecendentes] IS NULL AND @original_Antecendentes IS NULL)) AND (([RelatoAcontecimientos] = @original_RelatoAcontecimientos) OR ([RelatoAcontecimientos] IS NULL AND @original_RelatoAcontecimientos IS NULL)) AND (([FechaEvento] = @original_FechaEvento) OR ([FechaEvento] IS NULL AND @original_FechaEvento IS NULL)) AND (([FechaInhumacion] = @original_FechaInhumacion) OR ([FechaInhumacion] IS NULL AND @original_FechaInhumacion IS NULL)) AND (([ExhumacionAnterior] = @original_ExhumacionAnterior) OR ([ExhumacionAnterior] IS NULL AND @original_ExhumacionAnterior IS NULL)) AND (([MaterialesAdicionales] = @original_MaterialesAdicionales) OR ([MaterialesAdicionales] IS NULL AND @original_MaterialesAdicionales IS NULL)) AND (([Caja] = @original_Caja) OR ([Caja] IS NULL AND @original_Caja IS NULL)) AND (([CodClasificacion] = @original_CodClasificacion) OR ([CodClasificacion] IS NULL AND @original_CodClasificacion IS NULL)) AND (([Carpeta] = @original_Carpeta) OR ([Carpeta] IS NULL AND @original_Carpeta IS NULL)) AND (([Folios] = @original_Folios) OR ([Folios] IS NULL AND @original_Folios IS NULL)) AND (([Cod_Antiguo] = @original_Cod_Antiguo) OR ([Cod_Antiguo] IS NULL AND @original_Cod_Antiguo IS NULL)) AND (([Testigos] = @original_Testigos) OR ([Testigos] IS NULL AND @original_Testigos IS NULL)) AND (([Evento_Ano] = @original_Evento_Ano) OR ([Evento_Ano] IS NULL AND @original_Evento_Ano IS NULL)) AND (([Evento_Mes] = @original_Evento_Mes) OR ([Evento_Mes] IS NULL AND @original_Evento_Mes IS NULL)) AND (([Evento_Dia] = @original_Evento_Dia) OR ([Evento_Dia] IS NULL AND @original_Evento_Dia IS NULL)) AND (([UTM_X] = @original_UTM_X) OR ([UTM_X] IS NULL AND @original_UTM_X IS NULL)) AND (([UTM_Y] = @original_UTM_Y) OR ([UTM_Y] IS NULL AND @original_UTM_Y IS NULL))" InsertCommand="INSERT INTO [Sitios] ([CodSitio], [Altitud], [Propiedad], [Antecendentes], [RelatoAcontecimientos], [FechaEvento], [FechaInhumacion], [ExhumacionAnterior], [MaterialesAdicionales], [Caja], [CodClasificacion], [Carpeta], [Folios], [Cod_Antiguo], [Testigos], [Evento_Ano], [Evento_Mes], [Evento_Dia], [UTM_X], [UTM_Y]) VALUES (@CodSitio, @Altitud, @Propiedad, @Antecendentes, @RelatoAcontecimientos, @FechaEvento, @FechaInhumacion, @ExhumacionAnterior, @MaterialesAdicionales, @Caja, @CodClasificacion, @Carpeta, @Folios, @Cod_Antiguo, @Testigos, @Evento_Ano, @Evento_Mes, @Evento_Dia, @UTM_X, @UTM_Y)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Sitios] WHERE ([CodSitio] = @CodSitio)" UpdateCommand="UPDATE [Sitios] SET [Altitud] = @Altitud, [Propiedad] = @Propiedad, [Antecendentes] = @Antecendentes, [RelatoAcontecimientos] = @RelatoAcontecimientos, [FechaEvento] = @FechaEvento, [FechaInhumacion] = @FechaInhumacion, [ExhumacionAnterior] = @ExhumacionAnterior, [MaterialesAdicionales] = @MaterialesAdicionales, [Caja] = @Caja, [CodClasificacion] = @CodClasificacion, [Carpeta] = @Carpeta, [Folios] = @Folios, [Cod_Antiguo] = @Cod_Antiguo, [Testigos] = @Testigos, [Evento_Ano] = @Evento_Ano, [Evento_Mes] = @Evento_Mes, [Evento_Dia] = @Evento_Dia, [UTM_X] = @UTM_X, [UTM_Y] = @UTM_Y WHERE [CodSitio] = @original_CodSitio AND (([Altitud] = @original_Altitud) OR ([Altitud] IS NULL AND @original_Altitud IS NULL)) AND (([Propiedad] = @original_Propiedad) OR ([Propiedad] IS NULL AND @original_Propiedad IS NULL)) AND (([Antecendentes] = @original_Antecendentes) OR ([Antecendentes] IS NULL AND @original_Antecendentes IS NULL)) AND (([RelatoAcontecimientos] = @original_RelatoAcontecimientos) OR ([RelatoAcontecimientos] IS NULL AND @original_RelatoAcontecimientos IS NULL)) AND (([FechaEvento] = @original_FechaEvento) OR ([FechaEvento] IS NULL AND @original_FechaEvento IS NULL)) AND (([FechaInhumacion] = @original_FechaInhumacion) OR ([FechaInhumacion] IS NULL AND @original_FechaInhumacion IS NULL)) AND (([ExhumacionAnterior] = @original_ExhumacionAnterior) OR ([ExhumacionAnterior] IS NULL AND @original_ExhumacionAnterior IS NULL)) AND (([MaterialesAdicionales] = @original_MaterialesAdicionales) OR ([MaterialesAdicionales] IS NULL AND @original_MaterialesAdicionales IS NULL)) AND (([Caja] = @original_Caja) OR ([Caja] IS NULL AND @original_Caja IS NULL)) AND (([CodClasificacion] = @original_CodClasificacion) OR ([CodClasificacion] IS NULL AND @original_CodClasificacion IS NULL)) AND (([Carpeta] = @original_Carpeta) OR ([Carpeta] IS NULL AND @original_Carpeta IS NULL)) AND (([Folios] = @original_Folios) OR ([Folios] IS NULL AND @original_Folios IS NULL)) AND (([Cod_Antiguo] = @original_Cod_Antiguo) OR ([Cod_Antiguo] IS NULL AND @original_Cod_Antiguo IS NULL)) AND (([Testigos] = @original_Testigos) OR ([Testigos] IS NULL AND @original_Testigos IS NULL)) AND (([Evento_Ano] = @original_Evento_Ano) OR ([Evento_Ano] IS NULL AND @original_Evento_Ano IS NULL)) AND (([Evento_Mes] = @original_Evento_Mes) OR ([Evento_Mes] IS NULL AND @original_Evento_Mes IS NULL)) AND (([Evento_Dia] = @original_Evento_Dia) OR ([Evento_Dia] IS NULL AND @original_Evento_Dia IS NULL)) AND (([UTM_X] = @original_UTM_X) OR ([UTM_X] IS NULL AND @original_UTM_X IS NULL)) AND (([UTM_Y] = @original_UTM_Y) OR ([UTM_Y] IS NULL AND @original_UTM_Y IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Altitud" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="original_Propiedad" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Antecendentes" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_RelatoAcontecimientos" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="original_FechaEvento"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="original_FechaInhumacion"></asp:Parameter>
                        <asp:Parameter Name="original_ExhumacionAnterior" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="original_MaterialesAdicionales" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="original_Caja" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_CodClasificacion" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Carpeta" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Folios" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Cod_Antiguo" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Testigos" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Evento_Ano" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Evento_Mes" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Evento_Dia" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_UTM_X" Type="Single"></asp:Parameter>
                        <asp:Parameter Name="original_UTM_Y" Type="Single"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Altitud" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="Propiedad" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Antecendentes" Type="String"></asp:Parameter>
                        <asp:Parameter Name="RelatoAcontecimientos" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="FechaEvento"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="FechaInhumacion"></asp:Parameter>
                        <asp:Parameter Name="ExhumacionAnterior" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="MaterialesAdicionales" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Caja" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="CodClasificacion" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Carpeta" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Folios" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Cod_Antiguo" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Testigos" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Evento_Ano" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Evento_Mes" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Evento_Dia" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="UTM_X" Type="Single"></asp:Parameter>
                        <asp:Parameter Name="UTM_Y" Type="Single"></asp:Parameter>
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListaSitiosSelect" PropertyName="SelectedValue" Name="CodSitio" Type="String"></asp:ControlParameter>
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Altitud" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="Propiedad" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Antecendentes" Type="String"></asp:Parameter>
                        <asp:Parameter Name="RelatoAcontecimientos" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="FechaEvento"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="FechaInhumacion"></asp:Parameter>
                        <asp:Parameter Name="ExhumacionAnterior" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="MaterialesAdicionales" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Caja" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="CodClasificacion" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Carpeta" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Folios" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Cod_Antiguo" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Testigos" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Evento_Ano" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Evento_Mes" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Evento_Dia" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="UTM_X" Type="Single"></asp:Parameter>
                        <asp:Parameter Name="UTM_Y" Type="Single"></asp:Parameter>
                        <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Altitud" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="original_Propiedad" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Antecendentes" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_RelatoAcontecimientos" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="original_FechaEvento"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="original_FechaInhumacion"></asp:Parameter>
                        <asp:Parameter Name="original_ExhumacionAnterior" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="original_MaterialesAdicionales" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="original_Caja" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_CodClasificacion" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Carpeta" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Folios" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Cod_Antiguo" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Testigos" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Evento_Ano" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Evento_Mes" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Evento_Dia" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_UTM_X" Type="Single"></asp:Parameter>
                        <asp:Parameter Name="original_UTM_Y" Type="Single"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <hr />
        <!--Paneles-->
        
        <!--Modales-->
        <div class="modal fade bs-example-modal-lg" id="ModalAgregarVictimas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Agregar/Ver víctimas</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                <ContentTemplate>
                                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="IdVictima" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                                        <InsertItemTemplate>
                                            <div class="form-horizontal">

                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <asp:TextBox Text='<%# Bind("Nombres") %>' runat="server" CssClass="form-control" placeholder="Nombres" ID="NombresTextBox" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-6">
                                                        <asp:TextBox Text='<%# Bind("ApellidoPaterno") %>' runat="server" CssClass="form-control" placeholder="Apellido Paterno" ID="ApellidoPaternoTextBox" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox Text='<%# Bind("ApellidoMaterno") %>' runat="server" CssClass="form-control" placeholder="Apellido Materno" ID="ApellidoMaternoTextBox" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-6">
                                                        <asp:DropDownList Text='<%# Bind("Sexo") %>' runat="server" CssClass="form-control" ID="SexoTextBox">
                                                            <asp:ListItem Value="" Text="Seleccione un sexo..."></asp:ListItem>
                                                            <asp:ListItem Value="F" Text="Femenino"></asp:ListItem>
                                                            <asp:ListItem Value="M" Text="Masculino"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox Text='<%# Bind("Edad") %>' runat="server" CssClass="form-control" placeholder="Edad" TextMode="Number" ID="EdadTextBox" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <asp:TextBox Text='<%# Bind("Procedencia") %>' runat="server" CssClass="form-control" placeholder="Procedencia" ID="ProcedenciaTextBox" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <asp:TextBox Text='<%# Bind("Familia") %>' runat="server" CssClass="form-control" placeholder="Familiares" ID="FamiliaTextBox" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <asp:TextBox Text='<%# Bind("PresuntaAfiliacion") %>' runat="server" CssClass="form-control" placeholder="Presunta afiliación" ID="PresuntaAfiliacionTextBox" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <div class="btn-group btn-group-justified">
                                                            <asp:LinkButton runat="server" Text="Insertar" CommandName="Insert" ID="InsertButton" CssClass="btn btn-primary" CausesValidation="True" OnClick="InsertButton_Click" />
                                                            <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CssClass="btn btn-default" CausesValidation="False" data-dismiss="modal" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <asp:TextBox Text='<%# Bind("CodSitio") %>' runat="server" ID="CodSitioTextBox" Visible="false" /><br />
                                        </InsertItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' DeleteCommand="DELETE FROM [Victimas] WHERE [IdVictima] = @original_IdVictima AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL)) AND (([Sexo] = @original_Sexo) OR ([Sexo] IS NULL AND @original_Sexo IS NULL)) AND (([Edad] = @original_Edad) OR ([Edad] IS NULL AND @original_Edad IS NULL)) AND (([Procedencia] = @original_Procedencia) OR ([Procedencia] IS NULL AND @original_Procedencia IS NULL)) AND (([Familia] = @original_Familia) OR ([Familia] IS NULL AND @original_Familia IS NULL)) AND (([PresuntaAfiliacion] = @original_PresuntaAfiliacion) OR ([PresuntaAfiliacion] IS NULL AND @original_PresuntaAfiliacion IS NULL))" InsertCommand="INSERT INTO [Victimas] ([CodSitio], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Sexo], [Edad], [Procedencia], [Familia], [PresuntaAfiliacion]) VALUES (@CodSitio, @Nombres, @ApellidoPaterno, @ApellidoMaterno, @Sexo, @Edad, @Procedencia, @Familia, @PresuntaAfiliacion)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Victimas]" UpdateCommand="UPDATE [Victimas] SET [CodSitio] = @CodSitio, [Nombres] = @Nombres, [ApellidoPaterno] = @ApellidoPaterno, [ApellidoMaterno] = @ApellidoMaterno, [Sexo] = @Sexo, [Edad] = @Edad, [Procedencia] = @Procedencia, [Familia] = @Familia, [PresuntaAfiliacion] = @PresuntaAfiliacion WHERE [IdVictima] = @original_IdVictima AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL)) AND (([Sexo] = @original_Sexo) OR ([Sexo] IS NULL AND @original_Sexo IS NULL)) AND (([Edad] = @original_Edad) OR ([Edad] IS NULL AND @original_Edad IS NULL)) AND (([Procedencia] = @original_Procedencia) OR ([Procedencia] IS NULL AND @original_Procedencia IS NULL)) AND (([Familia] = @original_Familia) OR ([Familia] IS NULL AND @original_Familia IS NULL)) AND (([PresuntaAfiliacion] = @original_PresuntaAfiliacion) OR ([PresuntaAfiliacion] IS NULL AND @original_PresuntaAfiliacion IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_IdVictima" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Sexo" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Edad" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_Procedencia" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Familia" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_PresuntaAfiliacion" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Sexo" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Edad" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="Procedencia" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Familia" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="PresuntaAfiliacion" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Sexo" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Edad" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="Procedencia" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Familia" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="PresuntaAfiliacion" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_IdVictima" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Sexo" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Edad" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_Procedencia" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Familia" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_PresuntaAfiliacion" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <div class="table-responsive">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IdVictima" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" CssClass="table table-bordered table-striped table-condensed">
                                            <Columns>
                                                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                                                <asp:BoundField DataField="IdVictima" HeaderText="IdVictima" ReadOnly="True" InsertVisible="False" SortExpression="IdVictima"></asp:BoundField>

                                                <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres"></asp:BoundField>
                                                <asp:BoundField DataField="ApellidoPaterno" HeaderText="ApellidoPaterno" SortExpression="ApellidoPaterno"></asp:BoundField>
                                                <asp:BoundField DataField="ApellidoMaterno" HeaderText="ApellidoMaterno" SortExpression="ApellidoMaterno"></asp:BoundField>
                                                <asp:BoundField DataField="Sexo" HeaderText="Sexo" SortExpression="Sexo"></asp:BoundField>
                                                <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad"></asp:BoundField>
                                                <asp:BoundField DataField="CodSitio" HeaderText="CodSitio" SortExpression="CodSitio"></asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <div class="col-md-12">
                                                    <center>
                                                        <h4>No hay víctimas registradas</h4>
                                                        <br />
                                                        <p>Si hay problemas con la actualización, prueba <asp:LinkButton runat="server" OnClick="InsertButton_Click" >actualizar</asp:LinkButton> para verlos</p>
                                                    </center>
                                                </div>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </div>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [IdVictima], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Sexo], [Edad], [CodSitio] FROM [Victimas] WHERE ([CodSitio] = @CodSitio)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Victimas] WHERE [IdVictima] = @original_IdVictima AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL)) AND (([Sexo] = @original_Sexo) OR ([Sexo] IS NULL AND @original_Sexo IS NULL)) AND (([Edad] = @original_Edad) OR ([Edad] IS NULL AND @original_Edad IS NULL)) AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL))" InsertCommand="INSERT INTO [Victimas] ([Nombres], [ApellidoPaterno], [ApellidoMaterno], [Sexo], [Edad], [CodSitio]) VALUES (@Nombres, @ApellidoPaterno, @ApellidoMaterno, @Sexo, @Edad, @CodSitio)" UpdateCommand="UPDATE [Victimas] SET [Nombres] = @Nombres, [ApellidoPaterno] = @ApellidoPaterno, [ApellidoMaterno] = @ApellidoMaterno, [Sexo] = @Sexo, [Edad] = @Edad, [CodSitio] = @CodSitio WHERE [IdVictima] = @original_IdVictima AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL)) AND (([Sexo] = @original_Sexo) OR ([Sexo] IS NULL AND @original_Sexo IS NULL)) AND (([Edad] = @original_Edad) OR ([Edad] IS NULL AND @original_Edad IS NULL)) AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_IdVictima" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Sexo" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Edad" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Sexo" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Edad" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ListaSitiosSelect" PropertyName="SelectedValue" Name="CodSitio" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Sexo" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Edad" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_IdVictima" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Sexo" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Edad" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="ModalAgregarInformante" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel2">Agregar/Ver informantes</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                <ContentTemplate>
                                    <asp:FormView ID="FormView2" runat="server" DataKeyNames="IdInformante" DataSourceID="SqlDataSource3" DefaultMode="Insert">
                                        <InsertItemTemplate>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <asp:TextBox Text='<%# Bind("Nombres") %>' CssClass="form-control" placeholder="Nombres" runat="server" ID="NombresTextBox" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-6">
                                                    <asp:TextBox Text='<%# Bind("ApellidoPaterno") %>' CssClass="form-control" placeholder="Apellido Paterno" runat="server" ID="ApellidoPaternoTextBox" />
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:TextBox Text='<%# Bind("ApellidoMaterno") %>' CssClass="form-control" placeholder="Apellido Materno" runat="server" ID="ApellidoMaternoTextBox" />
                                                </div>
                                            </div>
                                            <asp:TextBox Text='<%# Bind("CodSitio") %>' runat="server" ID="CodSitioTextBox" Visible="false" />
                                            <div class="col-md-12">
                                                <div class="btn-group btn-group-justified">
                                                    <asp:LinkButton runat="server" Text="Insertar" CssClass="btn btn-primary" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                                                    <asp:LinkButton runat="server" Text="Cancelar" CssClass="btn btn-default" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" data-dismiss="true" />
                                                </div>
                                            </div>
                                        </InsertItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' DeleteCommand="DELETE FROM [Informantes] WHERE [IdInformante] = @original_IdInformante AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL))" InsertCommand="INSERT INTO [Informantes] ([CodSitio], [Nombres], [ApellidoPaterno], [ApellidoMaterno]) VALUES (@CodSitio, @Nombres, @ApellidoPaterno, @ApellidoMaterno)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Informantes]" UpdateCommand="UPDATE [Informantes] SET [CodSitio] = @CodSitio, [Nombres] = @Nombres, [ApellidoPaterno] = @ApellidoPaterno, [ApellidoMaterno] = @ApellidoMaterno WHERE [IdInformante] = @original_IdInformante AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_IdInformante" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_IdInformante" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <hr />
                                    <div class="table-responsive">
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="IdInformante" DataSourceID="SqlDataSource4" CssClass="table table-bordered table-striped table-condensed">
                                            <Columns>
                                                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                                                <asp:BoundField DataField="CodSitio" HeaderText="Cod. Sitio" SortExpression="CodSitio"></asp:BoundField>
                                                <asp:BoundField DataField="IdInformante" HeaderText="IdInformante" ReadOnly="True" Visible="false" InsertVisible="False" SortExpression="IdInformante"></asp:BoundField>
                                                <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres"></asp:BoundField>
                                                <asp:BoundField DataField="ApellidoPaterno" HeaderText="Apellido Paterno" SortExpression="ApellidoPaterno"></asp:BoundField>
                                                <asp:BoundField DataField="ApellidoMaterno" HeaderText="Apellido Materno" SortExpression="ApellidoMaterno"></asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <div class="col-md-12">
                                                    <center>
                                                    <h4>No hay informantes registrados</h4>
                                                    <br />
                                                    <p>Si hay problemas con la actualización, prueba <asp:LinkButton runat="server" OnClick="Unnamed_Click" >actualizar</asp:LinkButton> para verlos</p>
                                                </center>
                                                </div>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </div>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' DeleteCommand="DELETE FROM [Informantes] WHERE [IdInformante] = @original_IdInformante AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL))" InsertCommand="INSERT INTO [Informantes] ([CodSitio], [Nombres], [ApellidoPaterno], [ApellidoMaterno]) VALUES (@CodSitio, @Nombres, @ApellidoPaterno, @ApellidoMaterno)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Informantes] WHERE ([CodSitio] = @CodSitio)" UpdateCommand="UPDATE [Informantes] SET [CodSitio] = @CodSitio, [Nombres] = @Nombres, [ApellidoPaterno] = @ApellidoPaterno, [ApellidoMaterno] = @ApellidoMaterno WHERE [IdInformante] = @original_IdInformante AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_IdInformante" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ListaSitiosSelect" PropertyName="SelectedValue" Name="CodSitio" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_IdInformante" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Conexiones de Datos-->
    
</asp:Content>
