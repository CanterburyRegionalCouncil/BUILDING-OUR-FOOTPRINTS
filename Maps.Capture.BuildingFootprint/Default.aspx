<%@ Page Title="Canterbury Building Footprints Capture Project" Language="C#" MasterPageFile="~/LINZ.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Maps.Capture.BuildingFootprint._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--    <div class="jumbotron">
        <h1>Canterbury Building Footprints Capture Project</h1>
        <p class="lead">The <strong>Canterbury Building Footprints Capture Project</strong> is a <a href="http://en.wikipedia.org/wiki/Crowdsourcing" target="_blank">crowdsourcing project</a> for school students.  It aim is to learn about their local suroundings and aspects of geospatial technology, while at the same time improving the quality of spatial information available about buildings and other structures within the Canterbury region of New Zealand.</p>
        <p><a href="http://canterburymaps.govt.nz" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
    </div>--%>
    <h1>A mapping competition for school students!</h1>
    <h3> Help the Canterbury rebuild from the comfort of your PC or laptop, and be in to win PRIZES!</h3>
    <ul>
        <li>Cash prizes for schools</li>
        <li>Double movie passes</li>
        <li>iPad mini</li>
    </ul>

    <h3 style="background-color: white; padding: 10px;">This phase of the competition has now closed.  The winners of prizes will be notified by email in the very near future.</h3>

    <p>
        A building footprint is a 2D shape of where a building touches the ground. It is an essential part of managing property information, and can be used for many different tasks, including emergency services response and disaster recovery.
    </p>
    <p>
        By participating in this project, students will not only compete for a chance to win prizes for their school and themselves, but will also contribute vital information for our property management, and for our emergency response.
    </p>
    <p>
        To participate, simply sign up and start mapping! And be sure to read the <a href="about.aspx">rules</a> before you start!
    </p>
    <% if (!Context.User.Identity.IsAuthenticated)
       { %>
    <p>
        <a class="btn btn-primary" href="Account/Login.aspx">Log in</a>&nbsp;<a class="btn btn-info" href="Account/Register.aspx">Register</a>
    </p>
    <%}
       else
       { %>
    <p>
        Click the button below to start the capture process.
    </p>
    <p>
        <a class="btn btn-primary" href="CaptureMap.aspx">Start Mapping</a>
    </p>
    <%} %>

</asp:Content>
