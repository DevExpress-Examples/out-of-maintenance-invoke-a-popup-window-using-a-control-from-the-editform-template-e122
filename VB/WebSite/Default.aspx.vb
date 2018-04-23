' Developer Express Code Central Example:
' Invoke a popup window using a control from the EditForm template
' 
' This demo shows you how to use web page space more efficiently by editing a
' particular field's values in a popup window.  By default, the Edit Form doesn't
' display a particular field's value. End-users can click a special button within
' the Edit Form to invoke a popup window that shows this value in a memo editor.
' They can even edit this value by using the memo editor, and changes will be
' saved to the database if they press the Update button. The grid's RowUpdating
' event is handled to implement this.
' 
' You can find sample updates and versions for different programming languages here:
' http://www.devexpress.com/example=E122


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
Imports DevExpress.Web
Imports System.ComponentModel

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
