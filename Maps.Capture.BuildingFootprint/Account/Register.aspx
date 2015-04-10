<%@ Page Title="Register" Language="C#" MasterPageFile="~/LINZ.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Maps.Capture.BuildingFootprint.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<h2><%: Title %>.</h2>
	<p class="text-danger">
		<asp:Literal runat="server" ID="ErrorMessage" />
	</p>

	<div class="form-horizontal">
		<h4>Create a new account.</h4>
		<hr />
		<asp:ValidationSummary runat="server" CssClass="text-danger" />
		<div class="form-group">
			<asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Email Address</asp:Label>
			<div class="col-md-10">
				<asp:TextBox runat="server" ID="UserName" CssClass="form-control" TextMode="Email" />
				<asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" 
					CssClass="text-danger" ErrorMessage="The email address field is required." ValidationGroup="CreateUserForm" />
				<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UserName"
					ErrorMessage="Not a Valid Email Address" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
					ValidationGroup="CreateUserForm" ></asp:RegularExpressionValidator>
			</div>
		</div>
		<div class="form-group">
			<asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
			<div class="col-md-10">
				<asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
				<asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
					CssClass="text-danger" ErrorMessage="The password field is required." />
			</div>
		</div>
		<div class="form-group">
			<asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
			<div class="col-md-10">
				<asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
				<asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
					CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
				<asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
					CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
			</div>
		</div>
		<div class="form-group">
			<asp:Label runat="server" AssociatedControlID="NickName" CssClass="col-md-2 control-label">Nick Name</asp:Label>
			<div class="col-md-10">
				<asp:TextBox runat="server" ID="NickName" CssClass="form-control" TextMode="SingleLine" />
				<asp:RequiredFieldValidator runat="server" ControlToValidate="NickName" 
					CssClass="text-danger" ErrorMessage="A nick name is required." ValidationGroup="CreateUserForm" />
			</div>
		</div>
		<div class="form-group">
			<asp:Label runat="server" AssociatedControlID="school" CssClass="col-md-2 control-label">School</asp:Label>
			<div class="col-md-10">
				<asp:DropDownList runat="server" ID="school" CssClass="form-control">
					<asp:ListItem Text="Akaroa Area School" Value="Akaroa Area School" />
					<asp:ListItem Text="Allenvale Special School & Res. Centre" Value="Allenvale Special School & Res. Centre" />
					<asp:ListItem Text="Aranui High School" Value="Aranui High School" />
					<asp:ListItem Text="Ashburton Borough School" Value="Ashburton Borough School" />
					<asp:ListItem Text="Ashburton College" Value="Ashburton College" />
					<asp:ListItem Text="Avonside Girls' High School" Value="Avonside Girls' High School" />
					<asp:ListItem Text="Burnside High School" Value="Burnside High School" />
					<asp:ListItem Text="Breens Intermediate" Value="Breens Intermediate" />
					<asp:ListItem Text="Canterbury Christian College" Value="Canterbury Christian College" />
					<asp:ListItem Text="Cashmere High School" Value="Cashmere High School" />
					<asp:ListItem Text="Catholic Cathedral College" Value="Catholic Cathedral College" />
					<asp:ListItem Text="Christchurch Adventist School" Value="Christchurch Adventist School" />
					<asp:ListItem Text="Christchurch Boys' High School" Value="Christchurch Boys' High School" />
					<asp:ListItem Text="Christchurch Girls' High School" Value="Christchurch Girls' High School" />
					<asp:ListItem Text="Christ's College" Value="Christ's College" />
					<asp:ListItem Text="Clarkville School" Value="Clarkville School" />
					<asp:ListItem Text="Darfield High School" Value="Darfield High School" />
					<asp:ListItem Text="Ellesmere College" Value="Ellesmere College" />
					<asp:ListItem Text="Ferndale School (Christchurch)" Value="Ferndale School (Christchurch)" />
					<asp:ListItem Text="Hagley Community College" Value="Hagley Community College" />
					<asp:ListItem Text="Halswell Residential College" Value="Halswell Residential College" />
					<asp:ListItem Text="Hillmorton High School" Value="Hillmorton High School" />
					<asp:ListItem Text="Hillview Christian School" Value="Hillview Christian School" />
					<asp:ListItem Text="Hornby High School" Value="Hornby High School" />
					<asp:ListItem Text="Jean Seabrook Memorial School" Value="Jean Seabrook Memorial School" />
					<asp:ListItem Text="Kaiapoi High School" Value="Kaiapoi High School" />
					<asp:ListItem Text="Karanga Mai Young Parents College" Value="Karanga Mai Young Parents College" />
					<asp:ListItem Text="Kimihia Parents' College" Value="Kimihia Parents' College" />
					<asp:ListItem Text="Kingslea School" Value="Kingslea School" />
					<asp:ListItem Text="Lincoln High School" Value="Lincoln High School" />
					<asp:ListItem Text="Linwood College" Value="Linwood College" />
					<asp:ListItem Text="Mairehau High School" Value="Mairehau High School" />
					<asp:ListItem Text="Marian College" Value="Marian College" />
					<asp:ListItem Text="McKenzie Residential School" Value="McKenzie Residential School" />
					<asp:ListItem Text="Middleton Grange School" Value="Middleton Grange School" />
					<asp:ListItem Text="Mount Hutt College" Value="Mount Hutt College" />
					<asp:ListItem Text="Oxford Area School" Value="Oxford Area School" />
					<asp:ListItem Text="Papanui High School" Value="Papanui High School" />
					<asp:ListItem Text="Rangi Ruru Girls' School" Value="Rangi Ruru Girls' School" />
					<asp:ListItem Text="Rangiora High School" Value="Rangiora High School" />
					<asp:ListItem Text="Rangiora New Life School" Value="Rangiora New Life School" />
					<asp:ListItem Text="Riccarton High School" Value="Riccarton High School" />
					<asp:ListItem Text="Rudolf Steiner School (Chch)" Value="Rudolf Steiner School (Chch)" />
					<asp:ListItem Text="Shirley Boys' High School" Value="Shirley Boys' High School" />
					<asp:ListItem Text="Southern Regional Health School" Value="Southern Regional Health School" />
					<asp:ListItem Text="St Andrew's College (Christchurch)" Value="St Andrew's College (Christchurch)" />
					<asp:ListItem Text="St Bedes College" Value="St Bedes College" />
					<asp:ListItem Text="St Margaret's College" Value="St Margaret's College" />
					<asp:ListItem Text="St Thomas of Canterbury College" Value="St Thomas of Canterbury College" />
					<asp:ListItem Text="Te Kura Kaupapa Maori O Te Whanau Tahi" Value="Te Kura Kaupapa Maori O Te Whanau Tahi" />
					<asp:ListItem Text="Te Kura Kaupapa Maori O Waitaha" Value="Te Kura Kaupapa Maori O Waitaha" />
					<asp:ListItem Text="Unlimited Paenga Tawhiti" Value="Unlimited Paenga Tawhiti" />
					<asp:ListItem Text="Van Asch Deaf Education Centre" Value="Van Asch Deaf Education Centre" />
					<asp:ListItem Text="Villa Maria College" Value="Villa Maria College" />
					<asp:ListItem Text="Waitaha Learning Centre" Value="Waitaha Learning Centre" />

				</asp:DropDownList>
			</div>
		</div>

		<div class="form-group">
			<asp:Label runat="server" AssociatedControlID="schoolYear" CssClass="col-md-2 control-label">School Year</asp:Label>
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
				<%--<asp:TextBox runat="server" ID="favouriteSubject" CssClass="form-control" />--%>
				<asp:DropDownList runat="server" ID="favouriteSubject" CssClass="form-control">
					<asp:ListItem Text="Accounting" Value="ACCOUNTING" />
					<asp:ListItem Text="Art" Value="ART" />
					<asp:ListItem Text="Biology" Value="BIOLOGY" />
					<asp:ListItem Text="Business Studies" Value="BUSINESS STUDIES" />
					<asp:ListItem Text="Calculus" Value="CALCULUS" />
					<asp:ListItem Text="Chemistry" Value="CHEMISTRY" />
					<asp:ListItem Text="Classics" Value="CLASSICS" />
					<asp:ListItem Text="Economics" Value="ECONOMICS" />
					<asp:ListItem Text="English" Value="ENGLISH" />
					<asp:ListItem Text="Geography" Value="GEOGRAPHY" />
					<asp:ListItem Text="Graphics" Value="GRAPHICS" />
					<asp:ListItem Text="History" Value="HISTORY" />
					<asp:ListItem Text="Languages" Value="LANGUAGES" />
					<asp:ListItem Text="Materials Technology" Value="MATERIALS TECHNOLOGY" />
					<asp:ListItem Text="Mathematics" Value="MATHEMATICS" />
					<asp:ListItem Text="Physics" Value="PHYSICS" />
					<asp:ListItem Text="Science" Value="SCIENCE" />
					<asp:ListItem Text="Social Studies" Value="SOCIALSTUDIES" />
					<asp:ListItem Text="Statistics" Value="STATISTICS" />
					<asp:ListItem Selected="True" Text="Other" Value="OTHER" />
				</asp:DropDownList>
			</div>
		</div>

		<div class="form-group">
			<asp:Label runat="server" AssociatedControlID="homeSuburb" CssClass="col-md-2 control-label">Home Suburb</asp:Label>
			<div class="col-md-10">
				<asp:DropDownList runat="server" ID="homeSuburb" CssClass="form-control">
					<asp:ListItem Text="ADDINGTON" Value="ADDINGTON" />
					<asp:ListItem Text="AIDANFIELD" Value="AIDANFIELD" />
					<asp:ListItem Text="AKAROA RURAL" Value="AKAROA RURAL" />
					<asp:ListItem Text="AKAROA TOWN" Value="AKAROA TOWN" />
					<asp:ListItem Text="ALLENTON" Value="ALLENTON" />
					<asp:ListItem Text="AMBERLEY RURAL" Value="AMBERLEY RURAL" />
					<asp:ListItem Text="AMBERLEY TOWN" Value="AMBERLEY TOWN" />
					<asp:ListItem Text="ARANUI" Value="ARANUI" />
					<asp:ListItem Text="ASHBURTON" Value="ASHBURTON" />
					<asp:ListItem Text="ASHBURTON COASTAL" Value="ASHBURTON COASTAL" />
					<asp:ListItem Text="ASHBURTON RURAL" Value="ASHBURTON RURAL" />
					<asp:ListItem Text="ASHBURTON RURAL2" Value="ASHBURTON RURAL2" />
					<asp:ListItem Text="AVONDALE" Value="AVONDALE" />
					<asp:ListItem Text="AVONHEAD" Value="AVONHEAD" />
					<asp:ListItem Text="AVONSIDE" Value="AVONSIDE" />
					<asp:ListItem Text="BECKENHAM" Value="BECKENHAM" />
					<asp:ListItem Text="BELFAST" Value="BELFAST" />
					<asp:ListItem Text="BISHOPDALE" Value="BISHOPDALE" />
					<asp:ListItem Text="BROMLEY" Value="BROMLEY" />
					<asp:ListItem Text="BROOKLANDS" Value="BROOKLANDS" />
					<asp:ListItem Text="BRYNDWR" Value="BRYNDWR" />
					<asp:ListItem Text="BURNHAM" Value="BURNHAM" />
					<asp:ListItem Text="BURNSIDE" Value="BURNSIDE" />
					<asp:ListItem Text="BURWOOD" Value="BURWOOD" />
					<asp:ListItem Text="CASEBROOK" Value="CASEBROOK" />
					<asp:ListItem Text="CASHMERE" Value="CASHMERE" />
					<asp:ListItem Text="CASHMERE HILLS" Value="CASHMERE HILLS" />
					<asp:ListItem Text="CHRISTCHURCH CENTRAL" Value="CHRISTCHURCH CENTRAL" />
					<asp:ListItem Text="COALGATE" Value="COALGATE" />
					<asp:ListItem Text="DALLINGTON" Value="DALLINGTON" />
					<asp:ListItem Text="DARFIELD" Value="DARFIELD" />
					<asp:ListItem Text="DARFIELD RURAL" Value="DARFIELD RURAL" />
					<asp:ListItem Text="DIAMOND HARBOUR" Value="DIAMOND HARBOUR" />
					<asp:ListItem Text="DUNSANDEL" Value="DUNSANDEL" />
					<asp:ListItem Text="EDGEWARE" Value="EDGEWARE" />
					<asp:ListItem Text="FENDALTON" Value="FENDALTON" />
					<asp:ListItem Text="FERNSIDE" Value="FERNSIDE" />
					<asp:ListItem Text="FERRYMEAD" Value="FERRYMEAD" />
					<asp:ListItem Text="GERALDINE" Value="GERALDINE" />
					<asp:ListItem Text="GOVERNORS BAY" Value="GOVERNORS BAY" />
					<asp:ListItem Text="GRETA VALLEY" Value="GRETA VALLEY" />
					<asp:ListItem Text="HALSWELL" Value="HALSWELL" />
					<asp:ListItem Text="HAREWOOD" Value="HAREWOOD" />
					<asp:ListItem Text="HAWARDEN" Value="HAWARDEN" />
					<asp:ListItem Text="HEI HEI" Value="HEI HEI" />
					<asp:ListItem Text="HILLMORTON" Value="HILLMORTON" />
					<asp:ListItem Text="HOKITIKA" Value="HOKITIKA" />
					<asp:ListItem Text="HOON HAY" Value="HOON HAY" />
					<asp:ListItem Text="HORNBY" Value="HORNBY" />
					<asp:ListItem Text="HUNTSBURY" Value="HUNTSBURY" />
					<asp:ListItem Text="ILAM" Value="ILAM" />
					<asp:ListItem Text="ISLINGTON" Value="ISLINGTON" />
					<asp:ListItem Text="KAIAPOI" Value="KAIAPOI" />
					<asp:ListItem Text="KAIAPOI NORTH" Value="KAIAPOI NORTH" />
					<asp:ListItem Text="KAIAPOI WEST" Value="KAIAPOI WEST" />
					<asp:ListItem Text="KIRWEE" Value="KIRWEE" />
					<asp:ListItem Text="KUMARA" Value="KUMARA" />
					<asp:ListItem Text="LEESTON" Value="LEESTON" />
					<asp:ListItem Text="LEESTON RURAL" Value="LEESTON RURAL" />
					<asp:ListItem Text="LEITHFIELD" Value="LEITHFIELD" />
					<asp:ListItem Text="LINCOLN" Value="LINCOLN" />
					<asp:ListItem Text="LINCOLN RURAL" Value="LINCOLN RURAL" />
					<asp:ListItem Text="LINWOOD" Value="LINWOOD" />
					<asp:ListItem Text="LITTLE RIVER" Value="LITTLE RIVER" />
					<asp:ListItem Text="LOBURN" Value="LOBURN" />
					<asp:ListItem Text="LYTTELTON" Value="LYTTELTON" />
					<asp:ListItem Text="MAIREHAU" Value="MAIREHAU" />
					<asp:ListItem Text="MERIVALE" Value="MERIVALE" />
					<asp:ListItem Text="METHVEN" Value="METHVEN" />
					<asp:ListItem Text="MIDDLETON" Value="MIDDLETON" />
					<asp:ListItem Text="MOUNT PLEASANT" Value="MOUNT PLEASANT" />
					<asp:ListItem Text="NEW BRIGHTON" Value="NEW BRIGHTON" />
					<asp:ListItem Text="NORTH NEW BRIGHTON" Value="NORTH NEW BRIGHTON" />
					<asp:ListItem Text="NORTHWOOD" Value="NORTHWOOD" />
					<asp:ListItem Text="OPAWA" Value="OPAWA" />
					<asp:ListItem Text="OXFORD" Value="OXFORD" />
					<asp:ListItem Text="OXFORD RURAL" Value="OXFORD RURAL" />
					<asp:ListItem Text="PAPANUI" Value="PAPANUI" />
					<asp:ListItem Text="PARKLANDS" Value="PARKLANDS" />
					<asp:ListItem Text="PHILLIPSTOWN" Value="PHILLIPSTOWN" />
					<asp:ListItem Text="PIGEON BAY" Value="PIGEON BAY" />
					<asp:ListItem Text="PREBBLETON" Value="PREBBLETON" />
					<asp:ListItem Text="RAKAIA" Value="RAKAIA" />
					<asp:ListItem Text="RAKAIA GORGE" Value="RAKAIA GORGE" />
					<asp:ListItem Text="RAKAIA RIVER MOUTH" Value="RAKAIA RIVER MOUTH" />
					<asp:ListItem Text="RAKAIA RURAL" Value="RAKAIA RURAL" />
					<asp:ListItem Text="RAKAIA UPPER" Value="RAKAIA UPPER" />
					<asp:ListItem Text="RANGIORA" Value="RANGIORA" />
					<asp:ListItem Text="RANGIORA RURAL" Value="RANGIORA RURAL" />
					<asp:ListItem Text="RANGITATA" Value="RANGITATA" />
					<asp:ListItem Text="REDCLIFFE" Value="REDCLIFFE" />
					<asp:ListItem Text="REDWOOD" Value="REDWOOD" />
					<asp:ListItem Text="RICCARTON" Value="RICCARTON" />
					<asp:ListItem Text="RICHMOND" Value="RICHMOND" />
					<asp:ListItem Text="ROLLESTON" Value="ROLLESTON" />
					<asp:ListItem Text="ROLLESTON RURAL" Value="ROLLESTON RURAL" />
					<asp:ListItem Text="RUSSLEY" Value="RUSSLEY" />
					<asp:ListItem Text="SAINT ALBANS" Value="SAINT ALBANS" />
					<asp:ListItem Text="SAINT MARTINS" Value="SAINT MARTINS" />
					<asp:ListItem Text="SEFTON" Value="SEFTON" />
					<asp:ListItem Text="SHEFFIELD" Value="SHEFFIELD" />
					<asp:ListItem Text="SHIRLEY" Value="SHIRLEY" />
					<asp:ListItem Text="SOMERFIELD" Value="SOMERFIELD" />
					<asp:ListItem Text="SOUTH NEW BRIGHTON" Value="SOUTH NEW BRIGHTON" />
					<asp:ListItem Text="SOUTHBRIDGE" Value="SOUTHBRIDGE" />
					<asp:ListItem Text="SOUTHBRIDGE RURAL" Value="SOUTHBRIDGE RURAL" />
					<asp:ListItem Text="SOUTHSHORE" Value="SOUTHSHORE" />
					<asp:ListItem Text="SPENCER PARK" Value="SPENCER PARK" />
					<asp:ListItem Text="SPREYDON" Value="SPREYDON" />
					<asp:ListItem Text="SPRINGFIELD" Value="SPRINGFIELD" />
					<asp:ListItem Text="SPRINGSTON" Value="SPRINGSTON" />
					<asp:ListItem Text="STROWAN" Value="STROWAN" />
					<asp:ListItem Text="SUMNER" Value="SUMNER" />
					<asp:ListItem Text="SWANNANOA" Value="SWANNANOA" />
					<asp:ListItem Text="SYDENHAM" Value="SYDENHAM" />
					<asp:ListItem Text="TAI TAPU" Value="TAI TAPU" />
					<asp:ListItem Text="TEMPLETON" Value="TEMPLETON" />
					<asp:ListItem Text="TEMUKA" Value="TEMUKA" />
					<asp:ListItem Text="TINWALD" Value="TINWALD" />
					<asp:ListItem Text="UPPER RICCARTON" Value="UPPER RICCARTON" />
					<asp:ListItem Text="WADDINGTON" Value="WADDINGTON" />
					<asp:ListItem Text="WAIKARI" Value="WAIKARI" />
					<asp:ListItem Text="WAIKUKU BEACH" Value="WAIKUKU BEACH" />
					<asp:ListItem Text="WAINONI" Value="WAINONI" />
					<asp:ListItem Text="WAINUI" Value="WAINUI" />
					<asp:ListItem Text="WAIPARA" Value="WAIPARA" />
					<asp:ListItem Text="WEST MELTON" Value="WEST MELTON" />
					<asp:ListItem Text="WESTMORLAND" Value="WESTMORLAND" />
					<asp:ListItem Text="WIGRAM" Value="WIGRAM" />
					<asp:ListItem Text="WINDWHISTLE" Value="WINDWHISTLE" />
					<asp:ListItem Text="WOODEND" Value="WOODEND" />
					<asp:ListItem Text="WOOLSTON" Value="WOOLSTON" />
					<asp:ListItem Text="YALDHURST" Value="YALDHURST" />

				</asp:DropDownList>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-offset-2 col-md-10">
				<asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary" />
			</div>
		</div>
		<hr />
				<div>
	<p>
	Every building footprint you enter into the Building Our Footprint platform is a digital art form - cool right?</p>
	<p>As a result, you own/hold the copyright. As part of your participation in this awesome online project, you agree to license your creations under the Creative Commons License: CC0. The Creative Commons Licenses deal with all the legal stuff associated with copyright.</p> 
	<p>The Building Our Footprints project is all about empowering and harnessing the crowd - that's you and your friends - to do some good for the community.</p> 
	<p>The CC0 license allows you to recognise this and waive all your copyrights to your digital art forms - the building footprints you create - so that everyone in the public domain can use and benefit from them freely.</p> 
	<p>Oh and by the way, the more giving away of copyright you do i.e. the more building footprints you create on Building Our Footprints, the more likely you are to win a prize.</p> 
	<p>End result: everyone wins.
	</p>
	<p>
	 <a rel="license"
	 href="http://creativecommons.org/publicdomain/zero/1.0/">
	<img src="http://i.creativecommons.org/p/zero/1.0/88x31.png" style="border-style: none;" alt="CC0" />
  Creative Commons License: CC0</a></p>
				</div>
	</div>
</asp:Content>
