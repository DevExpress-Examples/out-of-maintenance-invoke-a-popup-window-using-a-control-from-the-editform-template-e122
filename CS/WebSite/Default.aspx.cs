// Developer Express Code Central Example:
// Invoke a popup window using a control from the EditForm template
// 
// This demo shows you how to use web page space more efficiently by editing a
// particular field's values in a popup window.  By default, the Edit Form doesn't
// display a particular field's value. End-users can click a special button within
// the Edit Form to invoke a popup window that shows this value in a memo editor.
// They can even edit this value by using the memo editor, and changes will be
// saved to the database if they press the Update button. The grid's RowUpdating
// event is handled to implement this.
// 
// You can find sample updates and versions for different programming languages here:
// http://www.devexpress.com/example=E122

using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;
using System.ComponentModel;

public partial class Grid_Editing_PopupControlInEditForm_PopupControlInEditForm : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && !IsCallback)
        {
            grid.StartEdit(2);
        }
    }

    protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        ASPxPopupControl popup = grid.FindEditFormTemplateControl("popup") as ASPxPopupControl;
        ASPxMemo memo = popup.FindControl("notesEditor") as ASPxMemo;
        e.NewValues["Notes"] = memo.Text;
        throw new InvalidOperationException("Data modifications are not allowed in the online demo");
    }
}
