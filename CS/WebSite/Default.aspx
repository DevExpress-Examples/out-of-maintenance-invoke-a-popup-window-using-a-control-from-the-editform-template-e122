<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Grid_Editing_PopupControlInEditForm_PopupControlInEditForm" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoke a popup window using a control from the EditForm template</title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID" AutoGenerateColumns="False" OnRowUpdating="grid_RowUpdating" Width="50%">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" ShowNewButton="True"/>
                <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1">
                    <EditFormSettings VisibleIndex="0" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataColumn FieldName="LastName" VisibleIndex="2">
                    <EditFormSettings VisibleIndex="1" />
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="Title" VisibleIndex="4">
                    <EditFormSettings VisibleIndex="2" ColumnSpan="2" />
                </dx:GridViewDataColumn>
                <dx:GridViewDataMemoColumn FieldName="Notes" Visible="False">
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataColumn FieldName="BirthDate" VisibleIndex="3">
                    <EditFormSettings VisibleIndex="3" />
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="HireDate" VisibleIndex="5">
                    <EditFormSettings VisibleIndex="4" />
                </dx:GridViewDataColumn>
            </Columns>
            <SettingsPager Mode="ShowAllRecords" />
            <Templates>
                <EditForm>
                    <dx:ASPxPopupControl HeaderText="Notes" EncodeHtml="False" ID="popup" runat="server" EnableViewState="False" AllowDragging="true" ClientInstanceName="popup"
                        PopupHorizontalAlign="OutsideRight" PopupHorizontalOffset="10" EnableClientSideAPI="true">
                        <ContentCollection>
                            <dx:PopupControlContentControl runat="server">
                                <dx:ASPxMemo runat="server" ID="notesEditor" Text='<%# Eval("Notes")%>' Width="200px" Height="150px"></dx:ASPxMemo>
                            </dx:PopupControlContentControl>
                        </ContentCollection>
                    </dx:ASPxPopupControl>
                    <div style="padding: 4px 4px 3px 4px">
                        <input type="button" value="Show Notes" onclick="popup.ShowAtElement(grid.GetMainElement());" />
                        <dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server"></dx:ASPxGridViewTemplateReplacement>
                    </div>
                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dx:ASPxGridViewTemplateReplacement>
                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dx:ASPxGridViewTemplateReplacement>
                    </div>
                </EditForm>
            </Templates>
        </dx:ASPxGridView>
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
    </form>
</body>
</html>
