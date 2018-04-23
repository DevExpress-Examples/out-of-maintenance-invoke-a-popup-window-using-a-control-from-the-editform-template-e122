#region Using
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
using DevExpress.Web.ASPxTabControl;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxPopupControl;
#endregion
public partial class Grid_Editing_PopupControlInEditForm_PopupControlInEditForm : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if(!IsPostBack && !IsCallback) {
            grid.StartEdit(2);
        }
    }
    protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
        ASPxPopupControl popup = grid.FindEditFormTemplateControl("popup") as ASPxPopupControl;
        ASPxMemo memo = popup.FindControl("notesEditor") as ASPxMemo;
        e.NewValues["Notes"] = memo.Text;
        throw new InvalidOperationException("Data modifications are not allowed in the online demo");
    }
}
