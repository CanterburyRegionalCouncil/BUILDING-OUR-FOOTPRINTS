<%@ Page Title="Register an external login" Language="C#" MasterPageFile="~/LINZ.Master" AutoEventWireup="true" CodeBehind="RegisterExternalLogin.aspx.cs" Inherits="Maps.Capture.BuildingFootprint.Account.RegisterExternalLogin" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Register with your <%: ProviderName %> account</h3>

    <asp:PlaceHolder runat="server">
        <div class="form-horizontal">
            <h4>Association Form</h4>
            <hr />
            <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
            <p class="text-info">
                You've authenticated with <strong><%: ProviderName %></strong>. Please enter a user name below and the other details for the current site
                and click the Log in button.
            </p>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="userName" CssClass="col-md-2 control-label">User name</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="userName" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="userName"
                        Display="Dynamic" CssClass="text-danger" ErrorMessage="User name is required" />
                    <asp:ModelErrorMessage runat="server" ModelStateKey="UserName" CssClass="text-error" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="school" CssClass="col-md-2 control-label">School</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="school" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="school"
                        Display="Dynamic" CssClass="text-danger" ErrorMessage="School is required" />
                    <asp:ModelErrorMessage runat="server" ModelStateKey="School" CssClass="text-error" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="schoolYear" CssClass="col-md-2 control-label">School</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList runat="server" ID="schoolYear" CssClass="form-control">
                        <asp:ListItem Text="Other" Value="Other" />
                        <asp:ListItem Selected="True" Text="Year 7" Value="Year 7" />
                        <asp:ListItem Text="Year 8" Value="Year 8" />
                        <asp:ListItem Text="Year 9" Value="Year 9" />
                        <asp:ListItem Text="Year 10" Value="Year 10" />
                        <asp:ListItem Text="Year 11" Value="Year 11" />
                        <asp:ListItem Text="Year 12" Value="Year 12" />
                        <asp:ListItem Text="Year 13" Value="Year 13" />
                        <asp:ListItem Text="Staff" Value="Staff" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="favouriteSubject" CssClass="col-md-2 control-label">Favourite Subject</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="favouriteSubject" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" Text="Log in" CssClass="btn btn-info" OnClick="LogIn_Click" />
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Content>
