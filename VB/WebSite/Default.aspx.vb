#Region "Using"

Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxTabControl
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxPopupControl
#End Region
Partial Public Class Grid_Editing_PopupControlInEditForm_PopupControlInEditForm
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) AndAlso (Not IsCallback) Then
			grid.StartEdit(2)
		End If
	End Sub
	Protected Sub grid_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		Dim popup As ASPxPopupControl = TryCast(grid.FindEditFormTemplateControl("popup"), ASPxPopupControl)
		Dim memo As ASPxMemo = TryCast(popup.FindControl("notesEditor"), ASPxMemo)
		e.NewValues("Notes") = memo.Text
		Throw New InvalidOperationException("Data modifications are not allowed in the online demo")
	End Sub
End Class
