<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Grid_Editing_PopupControlInEditForm_PopupControlInEditForm" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.1" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>    

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Invoke a popup window using a control from the EditForm template</title>
</head>
<body>
    <form id="form1" runat="server">
    
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID" AutoGenerateColumns="False" OnRowUpdating="grid_RowUpdating" Width="50%">
        <%-- BeginRegion Columns --%>
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True" />
                <NewButton Visible="True" />
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1">
                <EditFormSettings VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataColumn FieldName="LastName" VisibleIndex="2">
                <EditFormSettings VisibleIndex="1" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Title" VisibleIndex="4">
                <EditFormSettings VisibleIndex="2" ColumnSpan="2" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataMemoColumn FieldName="Notes" Visible="False">
            </dxwgv:GridViewDataMemoColumn>
            <dxwgv:GridViewDataColumn FieldName="BirthDate" VisibleIndex="3">
                <EditFormSettings VisibleIndex="3" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="HireDate" VisibleIndex="5">
                <EditFormSettings VisibleIndex="4" />
            </dxwgv:GridViewDataColumn>
        </Columns>
        <%-- EndRegion --%>
        <SettingsPager Mode="ShowAllRecords"/>
        <Templates>
            <EditForm>
            <dxpc:ASPxPopupControl HeaderText="Notes" EncodeHtml="False" id="popup" runat="server" EnableViewState="False" AllowDragging="true" 
                PopupHorizontalAlign="OutsideRight" PopupHorizontalOffset="10" EnableClientSideAPI="true">
                <Controls>
                    <dxe:ASPxMemo runat="server" ID="notesEditor" Text='<%# Eval("Notes")%>' Width="200px" Height="150px"></dxe:ASPxMemo>
                </Controls>
            </dxpc:ASPxPopupControl>
            <div style="padding:4px 4px 3px 4px">
            <input type="button" value="Show Notes" onclick="<%# Container.UniqueID.Replace('$', '_') + "_popup.ShowAtElement(grid.GetMainElement());" %>" />
            <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
            </div>
            <div style="text-align:right; padding:2px 2px 2px 2px">
                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
            </div>
            </EditForm>
        </Templates>
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Photo], [Extension], [Notes] FROM [Employees]" 
        DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = ?" 
        InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [BirthDate], [HireDate], [Notes]) VALUES (?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Employees] SET [LastName] = ?, [FirstName] = ?, [Title] = ?, [BirthDate] = ?, [HireDate] = ?, [Notes] = ? WHERE [EmployeeID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="EmployeeID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="BirthDate" Type="DateTime" />
            <asp:Parameter Name="HireDate" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="BirthDate" Type="DateTime" />
            <asp:Parameter Name="HireDate" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
    <%-- EndRegion --%>
    </form>
</body>
</html>
