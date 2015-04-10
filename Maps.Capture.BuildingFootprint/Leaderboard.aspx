<%@ Page Title="Leaderboards" Language="C#" MasterPageFile="~/LINZ.Master" AutoEventWireup="true" CodeBehind="Leaderboard.aspx.cs" Inherits="Maps.Capture.BuildingFootprint.Leaderboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="PersonLeaderboardDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="pCrowdsourceRankingPerson" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SchoolLeasderboardDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="pCrowdsourceRankingSchool" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <div class="row">
        <div class="col-md-12">
            <h1>Leaderboards</h1>
            <p>The following tables outline show the current scores for individuals and collective schools based on the total number of buildings added that have a trust rating of greater than 75%.</p>
        </div>
    </div>

    <% if (Context.User.Identity.IsAuthenticated)
       { %>

    <asp:SqlDataSource ID="PersonsSchoolLeaderboardSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="pCrowdsourceRankingPersonsSchool" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="Anonymous" Name="username" QueryStringField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="row">
        <div class="col-md-12">
            <h3>For Your School</h3>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" CssClass="table table-striped table-hover" DataSourceID="PersonsSchoolLeaderboardSqlDataSource" BorderStyle="None">
                <Columns>
                    <asp:BoundField DataField="Nickname" HeaderText="Nickname" SortExpression="Nickname" />
                    <asp:BoundField DataField="Ranking" HeaderText="&gt;75%" ReadOnly="True" SortExpression="Ranking" />
                </Columns>
                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
            </asp:GridView>
        </div>
    </div>

    <% } %>

    <div class="row">


        <div class="col-md-5">
            <h3>Schools</h3>
            <asp:GridView ID="SchoolsLeaderGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" CssClass="table table-striped table-hover" DataSourceID="SchoolLeasderboardDataSource" BorderStyle="None">
                <Columns>
                    <asp:BoundField DataField="School Name" HeaderText="School Name" SortExpression="School Name" />
                    <asp:BoundField DataField="Ranking" HeaderText="&gt;75%" ReadOnly="True" SortExpression="Ranking" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-7">
            <h3>Individuals</h3>
            <asp:GridView ID="IndividualsLeaderGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" CssClass="table table-striped table-hover" DataSourceID="PersonLeaderboardDataSource" BorderStyle="None">
                <Columns>
                    <asp:BoundField DataField="Nickname" HeaderText="Nickname" SortExpression="Nickname" />
                    <asp:BoundField DataField="School Name" HeaderText="School Name" SortExpression="School Name" />
                    <asp:BoundField DataField="Ranking" HeaderText="&gt; 75%" ReadOnly="True" SortExpression="Ranking" />
                </Columns>
                <PagerSettings Mode="NumericFirstLast" />
            </asp:GridView>
        </div>
    </div>

</asp:Content>
