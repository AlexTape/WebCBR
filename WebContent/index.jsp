<%@ page import="de.webcbr.*"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>WebCBR - a myCBR Interface</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="SHORTCUT ICON" href="images/logo_mycbr.ico"
	type="image/x-icon" />

<script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

</head>
<body class="index-body">
	<!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- 
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">WebCBR</a>
			</div>
			<div class="navbar-collapse collapse">
				<form class="navbar-form navbar-right" role="form">
					<div class="form-group">
						<input type="text" placeholder="Email" class="form-control">
					</div>
					<div class="form-group">
						<input type="password" placeholder="Password" class="form-control">
					</div>
					<button type="submit" class="btn btn-success">Sign in</button>
				</form>
			</div>
			<!--/.navbar-collapse -->
	<!-- 
	</div>
	</div>
	 -->

	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<h1>WebCBR Interface</h1>
			<p>A tiny Webservice upon the myCBR API.</p>
			<p>
				<a href="http://www.mycbr-project.net/"
					class="btn btn-primary btn-lg" role="button">Learn more about
					myCBR &raquo;</a>
			</p>
		</div>
	</div>

	<form action="/myCBR-Webservice/query" method="get" target="_blank">

		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<label for="Amalgam" id="Amalgam-ariaLabel">Schwerpunkt</label> <select
						id="Amalgam" name="Amalgam" aria-labelledby="Amalgam-ariaLabel">
						<option value="Person">Person</option>
						<option value="Gesundheit">Gesundheit</option>
						<option value="Wohnort">Wohnort</option>
						<option value="Gesellschaftlich">Gesellschaftlich</option>
						<option value="Finanziell">Finanziell</option>
					</select>
				</div>
				<div class="col-md-4">
					<label for="Casebase" id="Casebase-ariaLabel">Casebase</label> <select
						id="Casebase" name="Casebase" aria-labelledby="Casebase-ariaLabel">
						<option value="tiny">tiny (10) <10sec</option>
						<option value="small">small (110) <10sec</option>
						<option value="medium">medium (1.110) <10sec</option>
						<option value="big">big (11.110) >10min!!!</option>
					</select>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-4">
					<label for="Results" id="Results-ariaLabel">Results</label> <select
						id="Results" name="Results" aria-labelledby="Results-ariaLabel">
						<option value="5" selected>5</option>
						<option value="25">25</option>
						<option value="50">50</option>
						<option value="100">100</option>
					</select>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<div class="row">
						<h2>Person</h2>
					</div>
					<div class="row">
						<label for="Geschlecht" id="Geschlecht-ariaLabel">Geschlecht</label>
						<select id="Geschlecht" name="Geschlecht"
							aria-labelledby="Geschlecht-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="maennlich">maennlich</option>
							<option value="weiblich">weiblich</option>
						</select>
					</div>
					<div class="row">
						<label for="Geburtsjahr" id="Geburtsjahr-ariaLabel">Geburtsjahr</label>
						<select id="Geburtsjahr" name="Geburtsjahr"
							aria-labelledby="Geburtsjahr-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<%
							for (int i = 2014; i > 1920; i--) {
								out.println("<option>" + i + "</option>");
							}
						%>
						</select>
					</div>
					<div class="row">
						<label for="Beziehungsstatus" id="Beziehungsstatus-ariaLabel">Beziehungsstatus</label>
						<select id="Beziehungsstatus" name="Beziehungsstatus"
							aria-labelledby="Beziehungsstatus-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="verheiratet">verheiratet</option>
							<option value="ledig">ledig</option>
							<option value="geschieden">geschieden</option>
							<option value="eingetr.partnerschaft">eingetr.partnerschaft</option>
							<option value="beziehung">beziehung</option>
						</select>
					</div>
					<div class="row">
						<label for="Kinder" id="Kinder-ariaLabel">Kinder</label> <select
							id="Kinder" name="Kinder" aria-labelledby="Kinder-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
					<h2>Wohnort</h2>
					<div class="row">
						<label for="Ort" id="Ort-ariaLabel">Ort/Stadt</label> <input
							value="_undefined_" id="Ort" name="Ort" type="text"
							aria-labelledby="Ort-ariaLabel" />
					</div>
					<div class="row">
						<label for="PLZ" title="5 Zahlen" id="PLZ-ariaLabel">PLZ</label> <input
							value="_undefined_" id="PLZ" name="PLZ" type="text"
							aria-labelledby="PLZ-ariaLabel" />
					</div>
					<div class="row">
						<label for="Land" title="..Deutschland" id="Land-ariaLabel">Land</label> <input
							value="_undefined_" id="Land" name="Land" type="text"
							aria-labelledby="Land-ariaLabel" />
					</div>
					<div class="row">
						<label for="TelefonVorwahl" title="05121 eq 51210" id="TelefonVorwahl-ariaLabel">Tel.Vorwahl</label>
						<input value="_undefined_" id="TelefonVorwahl"
							name="TelefonVorwahl" type="text"
							aria-labelledby="TelefonVorwahl-ariaLabel" />
					</div>
					<div class="row">
						<label for="EmailProvider" title="max@muster.com eq muster.com" id="EmailProvider-ariaLabel">EmailProvider</label>
						<input value="_undefined_" id="EmailProvider" name="EmailProvider"
							type="text" aria-labelledby="EmailProvider-ariaLabel" />
					</div>
					<h2>Finanziell</h2>
					<div class="row">
						<label for="Einkommen" title="1-10000" id="Einkommen-ariaLabel">Einkommen</label>
						<input value="_undefined_" id="Einkommen" name="Einkommen"
							type="text" aria-labelledby="Einkommen-ariaLabel" />
					</div>
				</div>
				<div class="col-md-4">
					<div class="row">
						<h2>Gesundheit</h2>
					</div>
					<div class="row">
						<label for="Figur" id="Figur-ariaLabel">Figur</label> <select
							id="Figur" name="Figur" aria-labelledby="Figur-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="duerr">duerr</option>
							<option value="schlank">schlank</option>
							<option value="normal">normal</option>
							<option value="mollig">mollig</option>
							<option value="dick">dick</option>
						</select>
					</div>
					<div class="row">
						<label for="Raucher" id="Raucher-ariaLabel">Raucher</label> <select
							id="Raucher" name="Raucher" aria-labelledby="Raucher-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="ja">ja</option>
							<option value="nein">nein</option>
						</select>
					</div>
					<div class="row">
						<label for="Alkohol" id="Alkohol-ariaLabel">Alkohol</label> <select
							id="Alkohol" name="Alkohol" aria-labelledby="Alkohol-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="ja">ja</option>
							<option value="nein">nein</option>
						</select>
					</div>
					<div class="row">
						<label for="AndereDrogen" id="AndereDrogen-ariaLabel">AndereDrogen</label>
						<select id="AndereDrogen" name="AndereDrogen"
							aria-labelledby="AndereDrogen-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="ja">ja</option>
							<option value="nein">nein</option>
						</select>
					</div>
					<h2>Gesellschaftlich</h2>
					<div class="row">
						<label for="PolitischeEinstellung"
							id="PolitischeEinstellung-ariaLabel">PolitischeEinstellung</label>
						<select id="PolitischeEinstellung" name="PolitischeEinstellung"
							aria-labelledby="PolitischeEinstellung-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="links">links</option>
							<option value="liberal">liberal</option>
							<option value="rechts">rechts</option>
							<option value="konservativ">konservativ</option>
							<option value="gruen">gruen</option>
							<option value="Kommunist">Kommunist</option>
							<option value="unpolitisch">unpolitisch</option>
						</select>
					</div>
					<div class="row">
						<label for="Beruf" id="Beruf-ariaLabel">Beruf</label> <select
							id="Beruf" name="Beruf" aria-labelledby="Beruf-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="Abfallberater">Abfallberater</option>
							<option value="Abteilungsleiter">Abteilungsleiter</option>
							<option value="Abwassermeister">Abwassermeister</option>
							<option value="Aegyptologe">Aegyptologe</option>
							<option value="Aenderungsschneider">Aenderungsschneider</option>
							<option value="Akrobat">Akrobat</option>
							<option value="Angestellter">Angestellter</option>
							<option value="Anlagenmechaniker">Anlagenmechaniker</option>
							<option value="Apotheker">Apotheker</option>
							<option value="Apparatebauer">Apparatebauer</option>
							<option value="Arbeiter">Arbeiter</option>
							<option value="Archaeologe">Archaeologe</option>
							<option value="Architekt">Architekt</option>
							<option value="Arzt">Arzt</option>
							<option value="Assistenzarzt">Assistenzarzt</option>
							<option value="Astrologe">Astrologe</option>
							<option value="Auditor">Auditor</option>
							<option value="Aufzugmonteur">Aufzugmonteur</option>
							<option value="Augenoptiker">Augenoptiker</option>
							<option value="Ausbaufacharbeiter">Ausbaufacharbeiter</option>
							<option value="Ausbaufachwerker">Ausbaufachwerker</option>
							<option value="Aussenhandelskauffrau">Aussenhandelskauffrau</option>
							<option value="Aussenhandelskaufmann">Aussenhandelskaufmann</option>
							<option value="Autolackierer">Autolackierer</option>
							<option value="Autoverkaeufer">Autoverkaeufer</option>
							<option value="Autowaescher">Autowaescher</option>
							<option value="Backofenbauer">Backofenbauer</option>
							<option value="Bademeister">Bademeister</option>
							<option value="Baecker">Baecker</option>
							<option value="Bankettleiter">Bankettleiter</option>
							<option value="Bankettleiterassistent">Bankettleiterassistent</option>
							<option value="Barkellner">Barkellner</option>
							<option value="Barmeister">Barmeister</option>
							<option value="Baugeraetefuehrer">Baugeraetefuehrer</option>
							<option value="Baumeister">Baumeister</option>
							<option value="Bautenbeschichter">Bautenbeschichter</option>
							<option value="Bauzeichner">Bauzeichner</option>
							<option value="Beerdiger">Beerdiger</option>
							<option value="Berater">Berater</option>
							<option value="Berechnungsingenieur">Berechnungsingenieur</option>
							<option value="Berufsdetektiv">Berufsdetektiv</option>
							<option value="Berufskraftfahrer">Berufskraftfahrer</option>
							<option value="Bestattungsfachkraft">Bestattungsfachkraft</option>
							<option value="Betonbauer">Betonbauer</option>
							<option value="Betriebsleiter">Betriebsleiter</option>
							<option value="Betriebswirt">Betriebswirt</option>
							<option value="Bildhauer">Bildhauer</option>
							<option value="Bodenleger">Bodenleger</option>
							<option value="Boettcher">Boettcher</option>
							<option value="Bogenmacher">Bogenmacher</option>
							<option value="Bootsbauer">Bootsbauer</option>
							<option value="Brauer">Brauer</option>
							<option value="Brautechniker">Brautechniker</option>
							<option value="Brunnenbauer">Brunnenbauer</option>
							<option value="Buchbinder">Buchbinder</option>
							<option value="Buchhaendler">Buchhaendler</option>
							<option value="Buechsenmacher">Buechsenmacher</option>
							<option value="Buefettkraft">Buefettkraft</option>
							<option value="Buehnenmaler">Buehnenmaler</option>
							<option value="Buehnentaenzer">Buehnentaenzer</option>
							<option value="Buerokauffrau">Buerokauffrau</option>
							<option value="Buerokaufmann">Buerokaufmann</option>
							<option value="Bueromaschinenmechaniker">Bueromaschinenmechaniker</option>
							<option value="Chefarzt">Chefarzt</option>
							<option value="Chefportier">Chefportier</option>
							<option value="Chemielaborant">Chemielaborant</option>
							<option value="Chemikant">Chemikant</option>
							<option value="Chiefsteward">Chiefsteward</option>
							<option value="Chiefstewardess">Chiefstewardess</option>
							<option value="Chirurgiemechaniker">Chirurgiemechaniker</option>
							<option value="Choreograf">Choreograf</option>
							<option value="Computergrafiker">Computergrafiker</option>
							<option value="Dachdecker">Dachdecker</option>
							<option value="Damenmassschneider">Damenmassschneider</option>
							<option value="Dedektiv">Dedektiv</option>
							<option value="Dekorationsnaeher">Dekorationsnaeher</option>
							<option value="Demograf">Demograf</option>
							<option value="Designer">Designer</option>
							<option value="Diplomkrankenpfleger">Diplomkrankenpfleger</option>
							<option value="Diplomkrankenschwester">Diplomkrankenschwester</option>
							<option value="Disponent">Disponent</option>
							<option value="Dolmetscher">Dolmetscher</option>
							<option value="Drechsler">Drechsler</option>
							<option value="Dressman">Dressman</option>
							<option value="Drucker">Drucker</option>
							<option value="Edelsteingraveur">Edelsteingraveur</option>
							<option value="Edelsteinschleifer">Edelsteinschleifer</option>
							<option value="Edv-fachkraft">Edv-fachkraft</option>
							<option value="Edv-sachbearbeiter">Edv-sachbearbeiter</option>
							<option value="Eisenbahner">Eisenbahner</option>
							<option value="Elektriker">Elektriker</option>
							<option value="Elektromonteur">Elektromonteur</option>
							<option value="Elektroniker">Elektroniker</option>
							<option value="Elektrotechniker">Elektrotechniker</option>
							<option value="Empfangsassistent">Empfangsassistent</option>
							<option value="Empfangschef">Empfangschef</option>
							<option value="Empfangsmitarbeiter">Empfangsmitarbeiter</option>
							<option value="Energieberater">Energieberater</option>
							<option value="Ergotherapeut">Ergotherapeut</option>
							<option value="Ernaehrungsberater">Ernaehrungsberater</option>
							<option value="Erzieher">Erzieher</option>
							<option value="Estrichleger">Estrichleger</option>
							<option value="Etagenaufsicht">Etagenaufsicht</option>
							<option value="Etagenkellner">Etagenkellner</option>
							<option value="Etagenoberkellner">Etagenoberkellner</option>
							<option value="Fachassistent">Fachassistent</option>
							<option value="Fachinformatiker">Fachinformatiker</option>
							<option value="Fachkraft">Fachkraft</option>
							<option value="Fachkrankenschwester">Fachkrankenschwester</option>
							<option value="Fachkrankenspfleger">Fachkrankenspfleger</option>
							<option value="Fachlehrer">Fachlehrer</option>
							<option value="Fachunteroffizier">Fachunteroffizier</option>
							<option value="Fachverkaeufer">Fachverkaeufer</option>
							<option value="Faerber">Faerber</option>
							<option value="Fahrer">Fahrer</option>
							<option value="Fahrradmonteur">Fahrradmonteur</option>
							<option value="Fahrzeugbauer">Fahrzeugbauer</option>
							<option value="Fahrzeugbaumechaniker">Fahrzeugbaumechaniker</option>
							<option value="Fahrzeuglackierer">Fahrzeuglackierer</option>
							<option value="Fahrzeugpfleger">Fahrzeugpfleger</option>
							<option value="Falkner">Falkner</option>
							<option value="Fassadenreiniger">Fassadenreiniger</option>
							<option value="Feinoptiker">Feinoptiker</option>
							<option value="Feinoptikermeister">Feinoptikermeister</option>
							<option value="Feinwerkmechaniker">Feinwerkmechaniker</option>
							<option value="Feldwebel">Feldwebel</option>
							<option value="Fernsehmoderator">Fernsehmoderator</option>
							<option value="Festwirt">Festwirt</option>
							<option value="Feuerungsbauer">Feuerungsbauer</option>
							<option value="Feuerwehrmann">Feuerwehrmann</option>
							<option value="Fischer">Fischer</option>
							<option value="Fitnesstrainer">Fitnesstrainer</option>
							<option value="Flechtwerkgestalter">Flechtwerkgestalter</option>
							<option value="Fleischer">Fleischer</option>
							<option value="Fleischhauer">Fleischhauer</option>
							<option value="Flexograf">Flexograf</option>
							<option value="Fliesenleger">Fliesenleger</option>
							<option value="Flugbegleiter">Flugbegleiter</option>
							<option value="Fluggeraetmechaniker">Fluggeraetmechaniker</option>
							<option value="Flugzeugmechaniker">Flugzeugmechaniker</option>
							<option value="Flugzeugreiniger">Flugzeugreiniger</option>
							<option value="Foerster">Foerster</option>
							<option value="Forstarbeiter">Forstarbeiter</option>
							<option value="Forstwirt">Forstwirt</option>
							<option value="Fotomedienlaborant">Fotomedienlaborant</option>
							<option value="Fotomodell">Fotomodell</option>
							<option value="Fremdenfuehrer">Fremdenfuehrer</option>
							<option value="Friseur">Friseur</option>
							<option value="Gaertner">Gaertner</option>
							<option value="Gaestebetreuer">Gaestebetreuer</option>
							<option value="Galvaniseur">Galvaniseur</option>
							<option value="Galvaniseurmeister">Galvaniseurmeister</option>
							<option value="Gebaeudereiniger">Gebaeudereiniger</option>
							<option value="Gebaeudereinigermeister">Gebaeudereinigermeister</option>
							<option value="Geburtshelfer">Geburtshelfer</option>
							<option value="Geigenbauer">Geigenbauer</option>
							<option value="Genetiker">Genetiker</option>
							<option value="Geologe">Geologe</option>
							<option value="Gerichtsvollzieher">Gerichtsvollzieher</option>
							<option value="Germanist">Germanist</option>
							<option value="Geruestbauer">Geruestbauer</option>
							<option value="Glasapparatebauer">Glasapparatebauer</option>
							<option value="Glasblaeser">Glasblaeser</option>
							<option value="Glaser">Glaser</option>
							<option value="Glasmacher">Glasmacher</option>
							<option value="Glasmaler">Glasmaler</option>
							<option value="Glasschmelzer">Glasschmelzer</option>
							<option value="Glasveredler">Glasveredler</option>
							<option value="Glockengiesser">Glockengiesser</option>
							<option value="Goldschmied">Goldschmied</option>
							<option value="Grafiker">Grafiker</option>
							<option value="Graveur">Graveur</option>
							<option value="Grosshandelskauffrau">Grosshandelskauffrau</option>
							<option value="Grosshandelskaufmann">Grosshandelskaufmann</option>
							<option value="Guertler">Guertler</option>
							<option value="Gummiarbeiter">Gummiarbeiter</option>
							<option value="Haendler">Haendler</option>
							<option value="Hallenchef">Hallenchef</option>
							<option value="Handelsvertreter">Handelsvertreter</option>
							<option value="Handschuhmacher">Handschuhmacher</option>
							<option value="Handzuginstrumentenmacher">Handzuginstrumentenmacher</option>
							<option value="Hausdame">Hausdame</option>
							<option value="Hausmeister">Hausmeister</option>
							<option value="Haustechniker">Haustechniker</option>
							<option value="Hauswirtschaftsverwalter">Hauswirtschaftsverwalter</option>
							<option value="Hebamme">Hebamme</option>
							<option value="Heilpaedagoge">Heilpaedagoge</option>
							<option value="Herrenmassschneider">Herrenmassschneider</option>
							<option value="Historiker">Historiker</option>
							<option value="Hochbaufacharbeiter">Hochbaufacharbeiter</option>
							<option value="Hochbaufachwerker">Hochbaufachwerker</option>
							<option value="Hoerfunkmoderator">Hoerfunkmoderator</option>
							<option value="Hoergeraeteakustiker">Hoergeraeteakustiker</option>
							<option value="Holzbildhauer">Holzbildhauer</option>
							<option value="Holzblasinstrumentenmacher">Holzblasinstrumentenmacher</option>
							<option value="Holzmechaniker">Holzmechaniker</option>
							<option value="Holzspielzeugmacher">Holzspielzeugmacher</option>
							<option value="Hostess">Hostess</option>
							<option value="Hotelangestellte">Hotelangestellte</option>
							<option value="Hotelangestellter">Hotelangestellter</option>
							<option value="Hotelfachfrau">Hotelfachfrau</option>
							<option value="Hotelfachmann">Hotelfachmann</option>
							<option value="Hotelmeister">Hotelmeister</option>
							<option value="Housekeeper">Housekeeper</option>
							<option value="Imker">Imker</option>
							<option value="Informatiker">Informatiker</option>
							<option value="Informationselektroniker">Informationselektroniker</option>
							<option value="Ingenieur">Ingenieur</option>
							<option value="Innenausbautechniker">Innenausbautechniker</option>
							<option value="Installateur">Installateur</option>
							<option value="Isolierer">Isolierer</option>
							<option value="Jaeger">Jaeger</option>
							<option value="Journalist">Journalist</option>
							<option value="Jurist">Jurist</option>
							<option value="Justizbeamter">Justizbeamter</option>
							<option value="KFZ Mechaniker">KFZ Mechaniker</option>
							<option value="Kachelofenbauer">Kachelofenbauer</option>
							<option value="Kaelteanlagenbauer">Kaelteanlagenbauer</option>
							<option value="Kanalbauer">Kanalbauer</option>
							<option value="Kantinenangestellte">Kantinenangestellte</option>
							<option value="Kantinenangestellter">Kantinenangestellter</option>
							<option value="Kapitaen">Kapitaen</option>
							<option value="Karosseriebauer">Karosseriebauer</option>
							<option value="Karosseriemechaniker">Karosseriemechaniker</option>
							<option value="Kartonagenmacher">Kartonagenmacher</option>
							<option value="Kauffrau">Kauffrau</option>
							<option value="Kaufmann">Kaufmann</option>
							<option value="Kellermeister">Kellermeister</option>
							<option value="Keramiker">Keramiker</option>
							<option value="Kerammodelleinrichter">Kerammodelleinrichter</option>
							<option value="Kerammodelleur">Kerammodelleur</option>
							<option value="Kindergaertner">Kindergaertner</option>
							<option value="Klavierbauer">Klavierbauer</option>
							<option value="Klempner">Klempner</option>
							<option value="Knappe">Knappe</option>
							<option value="Komponist">Komponist</option>
							<option value="Konditor">Konditor</option>
							<option value="Konstrukteur">Konstrukteur</option>
							<option value="Konstruktionsmechaniker">Konstruktionsmechaniker</option>
							<option value="Kosmetiker">Kosmetiker</option>
							<option value="Kraftfahrzeugmechatroniker">Kraftfahrzeugmechatroniker</option>
							<option value="Krankenpfleger">Krankenpfleger</option>
							<option value="Krankenschwester">Krankenschwester</option>
							<option value="Kriminalbeamter">Kriminalbeamter</option>
							<option value="Kuechenchef">Kuechenchef</option>
							<option value="Kuerschner">Kuerschner</option>
							<option value="Kundendienstberater">Kundendienstberater</option>
							<option value="Kunstglasmacher">Kunstglasmacher</option>
							<option value="Kunsthaendler">Kunsthaendler</option>
							<option value="Kunstschmied">Kunstschmied</option>
							<option value="Kupferschmied">Kupferschmied</option>
							<option value="Lackierer">Lackierer</option>
							<option value="Landmaschinenmechaniker">Landmaschinenmechaniker</option>
							<option value="Landwirt">Landwirt</option>
							<option value="Lebensmitteltechniker">Lebensmitteltechniker</option>
							<option value="Lehrer">Lehrer</option>
							<option value="Linguist">Linguist</option>
							<option value="Logopaede">Logopaede</option>
							<option value="Logotherapeut">Logotherapeut</option>
							<option value="Lokfuehrer">Lokfuehrer</option>
							<option value="Lotse">Lotse</option>
							<option value="Luftheizungsbauer">Luftheizungsbauer</option>
							<option value="Makler">Makler</option>
							<option value="Maler">Maler</option>
							<option value="Manager">Manager</option>
							<option value="Marionettenspieler">Marionettenspieler</option>
							<option value="Maschinenglasmacher">Maschinenglasmacher</option>
							<option value="Maschinist">Maschinist</option>
							<option value="Maskenbildner">Maskenbildner</option>
							<option value="Masseur">Masseur</option>
							<option value="Massschneider">Massschneider</option>
							<option value="Matrose">Matrose</option>
							<option value="Maurer">Maurer</option>
							<option value="Mechaniker">Mechaniker</option>
							<option value="Mechatroniker">Mechatroniker</option>
							<option value="Mediengestalter">Mediengestalter</option>
							<option value="Metallbauer">Metallbauer</option>
							<option value="Metallbildner">Metallbildner</option>
							<option value="Metallblasinstrumentenmacher">Metallblasinstrumentenmacher</option>
							<option value="Metallgiesser">Metallgiesser</option>
							<option value="Metzger">Metzger</option>
							<option value="Mikrobiologe">Mikrobiologe</option>
							<option value="Modellbauer">Modellbauer</option>
							<option value="Moderator">Moderator</option>
							<option value="Molekularbiologe">Molekularbiologe</option>
							<option value="Motorradmechaniker">Motorradmechaniker</option>
							<option value="Mueller">Mueller</option>
							<option value="Musiker">Musiker</option>
							<option value="Nachtportier">Nachtportier</option>
							<option value="Naehmaschinenmechaniker">Naehmaschinenmechaniker</option>
							<option value="Nautiker">Nautiker</option>
							<option value="Niederlassungsleiter">Niederlassungsleiter</option>
							<option value="Night">Night</option>
							<option value="Notar">Notar</option>
							<option value="Notarzt">Notarzt</option>
							<option value="Oberflaechenbeschichter">Oberflaechenbeschichter</option>
							<option value="Oberkellner">Oberkellner</option>
							<option value="Objektbeschichter">Objektbeschichter</option>
							<option value="Oekonom">Oekonom</option>
							<option value="Oekotrophologe">Oekotrophologe</option>
							<option value="Ofenbauer">Ofenbauer</option>
							<option value="Offizier">Offizier</option>
							<option value="Optiker">Optiker</option>
							<option value="Orgelbauer">Orgelbauer</option>
							<option value="Orthopaediemechaniker">Orthopaediemechaniker</option>
							<option value="Orthopaedieschuhmacher">Orthopaedieschuhmacher</option>
							<option value="Page">Page</option>
							<option value="Papiermacher">Papiermacher</option>
							<option value="Parkettleger">Parkettleger</option>
							<option value="Patentanwalt">Patentanwalt</option>
							<option value="Perueckenmacher">Perueckenmacher</option>
							<option value="Pfarrer">Pfarrer</option>
							<option value="Pharmareferent">Pharmareferent</option>
							<option value="Physiotherapeut">Physiotherapeut</option>
							<option value="Pilot">Pilot</option>
							<option value="Polier">Polier</option>
							<option value="Polizeibeamter">Polizeibeamter</option>
							<option value="Polizist">Polizist</option>
							<option value="Portier">Portier</option>
							<option value="Porzellanmaler">Porzellanmaler</option>
							<option value="Postbeamter">Postbeamter</option>
							<option value="Postler">Postler</option>
							<option value="Praeparator">Praeparator</option>
							<option value="Programmierer">Programmierer</option>
							<option value="Psychologe">Psychologe</option>
							<option value="Psychotherapeut">Psychotherapeut</option>
							<option value="Putzfrau">Putzfrau</option>
							<option value="Pyrotechniker">Pyrotechniker</option>
							<option value="Qualitaetspruefer">Qualitaetspruefer</option>
							<option value="Rauchfangkehrer">Rauchfangkehrer</option>
							<option value="Raumausstatter">Raumausstatter</option>
							<option value="Raumpfleger">Raumpfleger</option>
							<option value="Rechtsanwalt">Rechtsanwalt</option>
							<option value="Reifenmacher">Reifenmacher</option>
							<option value="Reifenmonteur">Reifenmonteur</option>
							<option value="Reiseleiter">Reiseleiter</option>
							<option value="Reservierungssachbearbeiter">Reservierungssachbearbeiter</option>
							<option value="Restaurantfachfrau">Restaurantfachfrau</option>
							<option value="Restaurantfachmann">Restaurantfachmann</option>
							<option value="Restaurantmeister">Restaurantmeister</option>
							<option value="Rettungsschwimmer">Rettungsschwimmer</option>
							<option value="Richter">Richter</option>
							<option value="Roomboy">Roomboy</option>
							<option value="Saenger">Saenger</option>
							<option value="Sanitaeter">Sanitaeter</option>
							<option value="Sattler">Sattler</option>
							<option value="Schaedlingsbekaempfer">Schaedlingsbekaempfer</option>
							<option value="Schaffner">Schaffner</option>
							<option value="Schallschutzisolierer">Schallschutzisolierer</option>
							<option value="Schankanlagenreiniger">Schankanlagenreiniger</option>
							<option value="Schauspieler">Schauspieler</option>
							<option value="Schichtfuehrer">Schichtfuehrer</option>
							<option value="Schienenfahrzeugreiniger">Schienenfahrzeugreiniger</option>
							<option value="Schiffbauer">Schiffbauer</option>
							<option value="Schiffsreiniger">Schiffsreiniger</option>
							<option value="Schiffssteward">Schiffssteward</option>
							<option value="Schiffsstewardess">Schiffsstewardess</option>
							<option value="Schlachter">Schlachter</option>
							<option value="Schlafwagenschaffner">Schlafwagenschaffner</option>
							<option value="Schleifer">Schleifer</option>
							<option value="Schlosser">Schlosser</option>
							<option value="Schmied">Schmied</option>
							<option value="Schneider">Schneider</option>
							<option value="Schneidwerkzeugmechaniker">Schneidwerkzeugmechaniker</option>
							<option value="Schornsteinbauer">Schornsteinbauer</option>
							<option value="Schornsteinfeger">Schornsteinfeger</option>
							<option value="Schriftsetzermeister">Schriftsetzermeister</option>
							<option value="Schuhmacher">Schuhmacher</option>
							<option value="Schuster">Schuster</option>
							<option value="Schueler">Schueler</option>
							<option value="Schweinezuechter">Schweinezuechter</option>
							<option value="Schweisser">Schweisser</option>
							<option value="Segelmacher">Segelmacher</option>
							<option value="Seiler">Seiler</option>
							<option value="Sekretaer">Sekretaer</option>
							<option value="Servicetechniker">Servicetechniker</option>
							<option value="Servierer">Servierer</option>
							<option value="Siebdrucker">Siebdrucker</option>
							<option value="Silberschmied">Silberschmied</option>
							<option value="Skilehrer">Skilehrer</option>
							<option value="Soldat">Soldat</option>
							<option value="Sozialhelfer">Sozialhelfer</option>
							<option value="Sozialwirt">Sozialwirt</option>
							<option value="Soziologe">Soziologe</option>
							<option value="Spielzeugmacher">Spielzeugmacher</option>
							<option value="Sportlehrer">Sportlehrer</option>
							<option value="Sporttherapeut">Sporttherapeut</option>
							<option value="Sprachwissenschaftler">Sprachwissenschaftler</option>
							<option value="Sprengmeister">Sprengmeister</option>
							<option value="Staatsanwalt">Staatsanwalt</option>
							<option value="Stahlbauer">Stahlbauer</option>
							<option value="Stahlbetonbauer">Stahlbetonbauer</option>
							<option value="Steinbildhauer">Steinbildhauer</option>
							<option value="Steinmetz">Steinmetz</option>
							<option value="Stempelmacher">Stempelmacher</option>
							<option value="Steuerberater">Steuerberater</option>
							<option value="Sticker">Sticker</option>
							<option value="Strahlenschutzfachkraft">Strahlenschutzfachkraft</option>
							<option value="Strassenbauer">Strassenbauer</option>
							<option value="Strassenreiniger">Strassenreiniger</option>
							<option value="Stricker">Stricker</option>
							<option value="Stukkateur">Stukkateur</option>
							<option value="Systemelektroniker">Systemelektroniker</option>
							<option value="Systeminformatiker">Systeminformatiker</option>
							<option value="Taenzer">Taenzer</option>
							<option value="Taucher">Taucher</option>
							<option value="Taxifahrer">Taxifahrer</option>
							<option value="Techniker">Techniker</option>
							<option value="Technischer zeichner">Technischer
								zeichner</option>
							<option value="Textilreiniger">Textilreiniger</option>
							<option value="Theologe">Theologe</option>
							<option value="Therapeut">Therapeut</option>
							<option value="Tiefbaufacharbeiter">Tiefbaufacharbeiter</option>
							<option value="Tiefbaufachwerker">Tiefbaufachwerker</option>
							<option value="Tierarzt">Tierarzt</option>
							<option value="Tierpfleger">Tierpfleger</option>
							<option value="Tischler">Tischler</option>
							<option value="Toepfer">Toepfer</option>
							<option value="Totengraeber">Totengraeber</option>
							<option value="Touristikmanager">Touristikmanager</option>
							<option value="Trainer">Trainer</option>
							<option value="Trockenbaumonteur">Trockenbaumonteur</option>
							<option value="Uhrmacher">Uhrmacher</option>
							<option value="Umweltberater">Umweltberater</option>
							<option value="Umwelttechniker">Umwelttechniker</option>
							<option value="Unteroffizier">Unteroffizier</option>
							<option value="Veranstaltungscaterer">Veranstaltungscaterer</option>
							<option value="Verbraucherberater">Verbraucherberater</option>
							<option value="Vergolder">Vergolder</option>
							<option value="Verhaltensforscher">Verhaltensforscher</option>
							<option value="Verkaeufer">Verkaeufer</option>
							<option value="Vermessungsingenieur">Vermessungsingenieur</option>
							<option value="Verpflegungsbetriebswirt">Verpflegungsbetriebswirt</option>
							<option value="Versicherungmakler">Versicherungmakler</option>
							<option value="Versicherungsagent">Versicherungsagent</option>
							<option value="Vertreter">Vertreter</option>
							<option value="Volkswirt">Volkswirt</option>
							<option value="Vorarbeiter">Vorarbeiter</option>
							<option value="Vulkaniseur">Vulkaniseur</option>
							<option value="Wachszieher">Wachszieher</option>
							<option value="Waerter">Waerter</option>
							<option value="Waescher">Waescher</option>
							<option value="Wagenschmied">Wagenschmied</option>
							<option value="Wagner">Wagner</option>
							<option value="Waldarbeiter">Waldarbeiter</option>
							<option value="Wasserinstallateur">Wasserinstallateur</option>
							<option value="Webdesigner">Webdesigner</option>
							<option value="Weber">Weber</option>
							<option value="Weinkuefer">Weinkuefer</option>
							<option value="Werkschutzfachkraft">Werkschutzfachkraft</option>
							<option value="Winzer">Winzer</option>
							<option value="Wirt">Wirt</option>
							<option value="Wirtschaftsleiter">Wirtschaftsleiter</option>
							<option value="Wissenschaftler">Wissenschaftler</option>
							<option value="Zahlkellner">Zahlkellner</option>
							<option value="Zahnarzt">Zahnarzt</option>
							<option value="Zahntechniker">Zahntechniker</option>
							<option value="Zerspanungsmechaniker">Zerspanungsmechaniker</option>
							<option value="Zimmerer">Zimmerer</option>
							<option value="Zimmermaedchen">Zimmermaedchen</option>
							<option value="Zoologe">Zoologe</option>
							<option value="Zupfinstrumentenmacher">Zupfinstrumentenmacher</option>
							<option value="Zweiradmechaniker">Zweiradmechaniker</option>
						</select>
					</div>
					<div class="row">
						<label for="Religion" id="Religion-ariaLabel">Religion</label> <select
							id="Religion" name="Religion"
							aria-labelledby="Religion-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="Christ">Christ</option>
							<option value="Jude">Jude</option>
							<option value="Budhist">Budhist</option>
							<option value="Hinduist">Hinduist</option>
							<option value="Moslem">Moslem</option>
							<option value="keine">keine</option>
						</select>
					</div>
					<div class="row">
						<label for="Interessen" id="Interessen-ariaLabel">Interessen</label>
						<select id="Interessen" name="Interessen"
							aria-labelledby="Interessen-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="Achterbahnen">Achterbahnen</option>
							<option value="Amateurastronomie">Amateurastronomie</option>
							<option value="Amateurfunk">Amateurfunk</option>
							<option value="Angeln">Angeln</option>
							<option value="Badminton">Badminton</option>
							<option value="Bananenanbau">Bananenanbau</option>
							<option value="Bar">Bar</option>
							<option value="Basketball">Basketball</option>
							<option value="Basteln">Basteln</option>
							<option value="Billard">Billard</option>
							<option value="Bowling">Bowling</option>
							<option value="Briefmarken sammeln">Briefmarken sammeln</option>
							<option value="Brieftauben zuechten">Brieftauben
								zuechten</option>
							<option value="Camping">Camping</option>
							<option value="Computer">Computer</option>
							<option value="Computerspiele">Computerspiele</option>
							<option value="Darts">Darts</option>
							<option value="Disco">Disco</option>
							<option value="Entspannen">Entspannen</option>
							<option value="Fahrad fahren">Fahrad fahren</option>
							<option value="Fahrzeugtuning">Fahrzeugtuning</option>
							<option value="Fallschirmspringen">Fallschirmspringen</option>
							<option value="Fantasy">Fantasy</option>
							<option value="Fernsehen">Fernsehen</option>
							<option value="Festivals">Festivals</option>
							<option value="Feuerschlucken">Feuerschlucken</option>
							<option value="Filme sehen">Filme sehen</option>
							<option value="Fotografie">Fotografie</option>
							<option value="Free-Climbing">Free-Climbing</option>
							<option value="Freunde treffen">Freunde treffen</option>
							<option value="Fussball">Fussball</option>
							<option value="Gastronomie">Gastronomie</option>
							<option value="Gedichte schreiben">Gedichte schreiben</option>
							<option value="Geocaching">Geocaching</option>
							<option value="Geotrekking">Geotrekking</option>
							<option value="Geschichten schreiben">Geschichten
								schreiben</option>
							<option value="Gitarre spielen">Gitarre spielen</option>
							<option value="Golf">Golf</option>
							<option value="Handarbeiten">Handarbeiten</option>
							<option value="Heimwerken">Heimwerken</option>
							<option value="Hoerspiele">Hoerspiele</option>
							<option value="Internet">Internet</option>
							<option value="Internet trollen">Internet trollen</option>
							<option value="Judo">Judo</option>
							<option value="Karate">Karate</option>
							<option value="Kartenspiele">Kartenspiele</option>
							<option value="Kekse backen">Kekse backen</option>
							<option value="Kettensaegen">Kettensaegen</option>
							<option value="Kino">Kino</option>
							<option value="Kneipe">Kneipe</option>
							<option value="LARP">LARP</option>
							<option value="Literatur">Literatur</option>
							<option value="Lockpicking">Lockpicking</option>
							<option value="Malerei">Malerei</option>
							<option value="Mittelalterszene">Mittelalterszene</option>
							<option value="Modellautos">Modellautos</option>
							<option value="Modellbau">Modellbau</option>
							<option value="Mofatuning">Mofatuning</option>
							<option value="Musik hoeren">Musik hoeren</option>
							<option value="Musik machen">Musik machen</option>
							<option value="Muenzen sammeln">Muenzen sammeln</option>
							<option value="Open Source">Open Source</option>
							<option value="Party">Party</option>
							<option value="Pferde">Pferde</option>
							<option value="Philosophie">Philosophie</option>
							<option value="Poker">Poker</option>
							<option value="Programmieren">Programmieren</option>
							<option value="Puppen sammeln">Puppen sammeln</option>
							<option value="Raumfahrt">Raumfahrt</option>
							<option value="Rollenspiel">Rollenspiel</option>
							<option value="Raetsel">Raetsel</option>
							<option value="Sammeln">Sammeln</option>
							<option value="Sauna">Sauna</option>
							<option value="Schach">Schach</option>
							<option value="Schauspielerei">Schauspielerei</option>
							<option value="Schwertkampf">Schwertkampf</option>
							<option value="Science Fiction">Science Fiction</option>
							<option value="Selbstverteidigung">Selbstverteidigung</option>
							<option value="Skart">Skart</option>
							<option value="Socken stricken">Socken stricken</option>
							<option value="Sonnenstudio">Sonnenstudio</option>
							<option value="Soziale Netzwerke">Soziale Netzwerke</option>
							<option value="Spielkonsolen">Spielkonsolen</option>
							<option value="Sprache">Sprache</option>
							<option value="Stofftiere">Stofftiere</option>
							<option value="Surfen">Surfen</option>
							<option value="Swinger Club">Swinger Club</option>
							<option value="Tagebuch schreiben">Tagebuch schreiben</option>
							<option value="Tanzen">Tanzen</option>
							<option value="Tennis">Tennis</option>
							<option value="Theater">Theater</option>
							<option value="Tischtennis">Tischtennis</option>
							<option value="Urban Exploration">Urban Exploration</option>
							<option value="Videos machen">Videos machen</option>
							<option value="Videos schneiden">Videos schneiden</option>
							<option value="Webdesign">Webdesign</option>
							<option value="Wohnwagen">Wohnwagen</option>
							<option value="Wolkenkratzer-Klettern">Wolkenkratzer-Klettern</option>
							<option value="Wuerfelspiele">Wuerfelspiele</option>
							<option value="Youtube">Youtube</option>
							<option value="Zauberkunst">Zauberkunst</option>
							<option value="Zirkus">Zirkus</option>
							<option value="Zoo">Zoo</option>
							<option value="backen">backen</option>
							<option value="bloggen">bloggen</option>
							<option value="gammeln">gammeln</option>
							<option value="kochen">kochen</option>
							<option value="lesen">lesen</option>
							<option value="malen">malen</option>
							<option value="saufen">saufen</option>
							<option value="schlafen">schlafen</option>
							<option value="schwimmen">schwimmen</option>
							<option value="segeln">segeln</option>
							<option value="singen">singen</option>
							<option value="telefonieren">telefonieren</option>
							<option value="zeichnen">zeichnen</option>
						</select>
					</div>
					<div class="row">
						<label for="Musik" id="Musik-ariaLabel">Musik</label> <select
							id="Musik" name="Musik" aria-labelledby="Musik-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="Akustik">Akustik</option>
							<option value="Alternative">Alternative</option>
							<option value="Ambient">Ambient</option>
							<option value="Arabic">Arabic</option>
							<option value="Ballade">Ballade</option>
							<option value="Black Metal">Black Metal</option>
							<option value="Bluegrass">Bluegrass</option>
							<option value="Blues">Blues</option>
							<option value="British Rock">British Rock</option>
							<option value="Britpop">Britpop</option>
							<option value="Celtic">Celtic</option>
							<option value="Chanson">Chanson</option>
							<option value="Chillout">Chillout</option>
							<option value="Classic">Classic</option>
							<option value="Club">Club</option>
							<option value="Comedy">Comedy</option>
							<option value="Country">Country</option>
							<option value="Country Rock">Country Rock</option>
							<option value="Dance">Dance</option>
							<option value="Death Metal">Death Metal</option>
							<option value="Deathcore">Deathcore</option>
							<option value="Deep House">Deep House</option>
							<option value="Disco">Disco</option>
							<option value="Doom Metal">Doom Metal</option>
							<option value="Downtempo">Downtempo</option>
							<option value="Drum and Bass">Drum and Bass</option>
							<option value="Electro">Electro</option>
							<option value="Electronic">Electronic</option>
							<option value="Electropop">Electropop</option>
							<option value="Emo">Emo</option>
							<option value="Epic">Epic</option>
							<option value="Experimental">Experimental</option>
							<option value="Folk">Folk</option>
							<option value="Folk Metal">Folk Metal</option>
							<option value="Folk Rock">Folk Rock</option>
							<option value="Funk">Funk</option>
							<option value="Fusion">Fusion</option>
							<option value="Game Soundtrack">Game Soundtrack</option>
							<option value="Gospel">Gospel</option>
							<option value="Gothic">Gothic</option>
							<option value="Gothic Metal">Gothic Metal</option>
							<option value="Groove Metal">Groove Metal</option>
							<option value="Grunge">Grunge</option>
							<option value="Hard Rock">Hard Rock</option>
							<option value="Hardcore">Hardcore</option>
							<option value="Hardcore Punk">Hardcore Punk</option>
							<option value="Heavy Metal">Heavy Metal</option>
							<option value="Hiphop">Hiphop</option>
							<option value="House">House</option>
							<option value="Indie">Indie</option>
							<option value="Indie Pop">Indie Pop</option>
							<option value="Indie Rock">Indie Rock</option>
							<option value="Industrial Metal">Industrial Metal</option>
							<option value="Jazz">Jazz</option>
							<option value="Latin">Latin</option>
							<option value="Lo fi">Lo fi</option>
							<option value="Melodic Death">Melodic Death</option>
							<option value="Metal">Metal</option>
							<option value="Metalcore">Metalcore</option>
							<option value="Movie Soundtrack">Movie Soundtrack</option>
							<option value="Neoclassic">Neoclassic</option>
							<option value="New Age">New Age</option>
							<option value="New Wave">New Wave</option>
							<option value="Noise">Noise</option>
							<option value="Nu Jazz">Nu Jazz</option>
							<option value="Numetal">Numetal</option>
							<option value="Opera">Opera</option>
							<option value="Piano">Piano</option>
							<option value="Pop">Pop</option>
							<option value="Pop Rock">Pop Rock</option>
							<option value="Post Grunge">Post Grunge</option>
							<option value="Post-Hardcore">Post-Hardcore</option>
							<option value="Post-Metal">Post-Metal</option>
							<option value="Postrock">Postrock</option>
							<option value="Power Metal">Power Metal</option>
							<option value="Progressive">Progressive</option>
							<option value="Progressive Rock">Progressive Rock</option>
							<option value="Psychedelic">Psychedelic</option>
							<option value="Psychedelic Trance">Psychedelic Trance</option>
							<option value="Punk">Punk</option>
							<option value="Punk Rock">Punk Rock</option>
							<option value="Rap">Rap</option>
							<option value="Rave">Rave</option>
							<option value="Reggae">Reggae</option>
							<option value="RnB">RnB</option>
							<option value="Rock">Rock</option>
							<option value="Rock country">Rock country</option>
							<option value="Rock n Roll">Rock n Roll</option>
							<option value="Screamo">Screamo</option>
							<option value="Ska">Ska</option>
							<option value="Soul">Soul</option>
							<option value="Soundtrack">Soundtrack</option>
							<option value="Space">Space</option>
							<option value="Space Rock">Space Rock</option>
							<option value="Techno">Techno</option>
							<option value="Thrash">Thrash</option>
							<option value="Trance">Trance</option>
							<option value="Trip Hop">Trip Hop</option>
							<option value="Vocal">Vocal</option>
							<option value="Vocal Jazz">Vocal Jazz</option>
						</select>
					</div>
					<h2>Sonstiges</h2>
					<div class="row">
						<label for="SexuelleOrientierung"
							id="SexuelleOrientierung-ariaLabel">SexuelleOrientierung</label>
						<select id="SexuelleOrientierung" name="SexuelleOrientierung"
							aria-labelledby="SexuelleOrientierung-ariaLabel">
							<option value="_undefined_">_undefined_</option>
							<option value="heterosexuell">heterosexuell</option>
							<option value="homosexuell">homosexuell</option>
							<option value="bisexuell">bisexuell</option>
							<option value="asexuell">asexuell</option>
						</select>
					</div>
				</div>
				<div class="col-md-2"></div>

			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="row actionBtns">
						<p>
							<input class="btn btn-default leftBtn" type="reset" value="Reset" />
							<input class="btn btn-default rightBtn" type="submit"
								value="Query" />
						</p>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>

			<hr>

			<footer>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-2">
						<p>&copy; AlexTape 2014</p>
					</div>
					<div class="col-md-2"></div>
				</div>
			</footer>
		</div>

	</form>

	<!-- /container -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')
	</script>

	<script src="js/vendor/bootstrap.min.js"></script>

	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>

</body>
</html>