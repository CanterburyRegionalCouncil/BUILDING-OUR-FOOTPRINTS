<%@ Page Title="" Language="C#" MasterPageFile="~/LINZ.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="Maps.Capture.BuildingFootprint.Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Results</h3>
    <p>This phase of the competition has now closed. The winning indivduals and schools were:</p>

    <div class="row">
        <div class="col-md-6">
            <h4>Winning Schools</h4>
            <ol>
                <li>Burnside High School</li>
                <li>Cashmere High School</li>
                <li>Middleton Grange</li>
            </ol>
        </div>
        <div class="col-md-6">
            <h4>Winning Individuals</h4>
            <ol>
                <li>Emma (Burnside High School)</li>
                <li>Ezra (Burnside High School)</li>
                <li>Spaceman (Burnside High School)</li>
            </ol>
        </div>
    </div>

    <p>The winning schools and indviduals have now been contacted about their prizes.</p>

    <p>The final counts as at 28 August 2014 at 11:59pm are listed below.</p>
    <div class="row">
        <div class="col-md-5">
            <h3 style="box-sizing: border-box; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 24px; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(166, 206, 57);">Schools</h3>
            <div style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(166, 206, 57);">
                <table id="MainContent_SchoolsLeaderGridView" border="1" cellspacing="0" class="table table-striped table-hover" rules="all" style="box-sizing: border-box; border-collapse: collapse; border-spacing: 0px; max-width: 100%; background-color: white; width: 328px; margin-bottom: 20px; border-style: none;">
                    <tbody style="box-sizing: border-box;">
                        <tr style="box-sizing: border-box;">
                            <th scope="col" style="box-sizing: border-box; padding: 8px; text-align: left; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">School Name</th>
                            <th scope="col" style="box-sizing: border-box; padding: 8px; text-align: left; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">&gt;75%</th>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">16755</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Cashmere High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">1046</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(245, 245, 245);">Middleton Grange School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(245, 245, 245);">731</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Clarkville School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">215</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">St Bedes College</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">24</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">St Margaret&#39;s College</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">17</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Unlimited Paenga Tawhiti</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">4</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-5">
            <h3 style="box-sizing: border-box; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 24px; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(166, 206, 57);">Individuals</h3>
            <div style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(166, 206, 57);">
                <table id="MainContent_IndividualsLeaderGridView" border="1" cellspacing="0" class="table table-striped table-hover" rules="all" style="box-sizing: border-box; border-collapse: collapse; border-spacing: 0px; max-width: 100%; background-color: white; width: 471px; margin-bottom: 20px; border-style: none;">
                    <tbody style="box-sizing: border-box;">
                        <tr style="box-sizing: border-box;">
                            <th scope="col" style="box-sizing: border-box; padding: 8px; text-align: left; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Nickname</th>
                            <th scope="col" style="box-sizing: border-box; padding: 8px; text-align: left; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">School Name</th>
                            <th scope="col" style="box-sizing: border-box; padding: 8px; text-align: left; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">&gt; 75%</th>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Emma</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">7430</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Ezra</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">6179</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Spaceman</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">1707</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">ferdinandfregger</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Cashmere High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">1046</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">fruss740</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">756</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">pizzathecat</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Middleton Grange School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">646</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Mitch Coles</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">449</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(245, 245, 245);">The MapMaster</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(245, 245, 245);">Clarkville School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(245, 245, 245);">126</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">yaz</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Clarkville School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">89</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Joshie</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Middleton Grange School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">81</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">kelvin</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">45</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">highunicorn</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">33</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">The Architect</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">30</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">yellowturtle</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">25</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Liza</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">17</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">rene</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">11</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">P-dawg</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">9</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">harrystyles</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">9</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">JNorthcoat</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">5</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">JoannaMM</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">St Margaret&#39;s College</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">5</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Ebibliophacky</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Unlimited Paenga Tawhiti</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">4</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Beyoncé</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">4</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">caryn</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">4</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">claudyc</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">4</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Rosalie</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">4</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">WolfCanada</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">4</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">thesexybeast69</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">3</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Bob the Builder</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">3</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">m-dawg</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">3</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Maike</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">2</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Faggins</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">2</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Rochelle</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">2</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">RobFromNZ</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Middleton Grange School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">2</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">john</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Middleton Grange School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">2</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">YHT</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">1</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(245, 245, 245);">Ed Rida</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(245, 245, 245);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(245, 245, 245);">1</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">matty boy</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">1</td>
                        </tr>
                        <tr style="box-sizing: border-box;">
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">jessie_stella</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">Burnside High School</td>
                            <td style="box-sizing: border-box; padding: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249);">1</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
