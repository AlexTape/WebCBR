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
<title>WebCBR - <%= (String) request.getAttribute("amalgam-name") %></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="SHORTCUT ICON" href="images/logo_mycbr.ico"
	type="image/x-icon" />
<link rel="stylesheet" href="css/jquery.dataTables.min.css">

<script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script type="text/javascript" src="js/vendor/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/vendor/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>

</head>

<body>
	<section>

		<table id="webCBRresults" class="display">
			<thead>
				<tr>
					<th>Similarity</th>
					<th>Case</th>
					<th>Nachname</th>
					<th>Vorname</th>
					<th>Geschlecht</th>
					<th>Geburtsdatum</th>
					<th>Geburtsjahr</th>
					<th>Strasse</th>
					<th>Hausnummer</th>
					<th>Ort</th>
					<th>PLZ</th>
					<th>Land</th>
					<th>Telefonnummer</th>
					<th>TelefonVorwahl</th>
					<th>PLZ</th>
					<th>EmailAdresse</th>
					<th>Beziehungsstatus</th>
					<th>Kinder</th>
					<th>Religion</th>
					<th>PolitischeEinstellung</th>
					<th>SexuelleOrientierung</th>
					<th>Figur</th>
					<th>Raucher</th>
					<th>Alkohol</th>
					<th>AndereDrogen</th>
					<th>Beruf</th>
					<th>Einkommen</th>
					<th>Interessen</th>
					<th>Musik</th>
				</tr>
			</thead>

			<tfoot>
				<tr>
					<th>Similarity</th>
					<th>Case</th>
					<th>Nachname</th>
					<th>Vorname</th>
					<th>Geschlecht</th>
					<th>Geburtsdatum</th>
					<th>Geburtsjahr</th>
					<th>Strasse</th>
					<th>Hausnummer</th>
					<th>Ort</th>
					<th>PLZ</th>
					<th>Land</th>
					<th>Telefonnummer</th>
					<th>TelefonVorwahl</th>
					<th>PLZ</th>
					<th>EmailAdresse</th>
					<th>Beziehungsstatus</th>
					<th>Kinder</th>
					<th>Religion</th>
					<th>PolitischeEinstellung</th>
					<th>SexuelleOrientierung</th>
					<th>Figur</th>
					<th>Raucher</th>
					<th>Alkohol</th>
					<th>AndereDrogen</th>
					<th>Beruf</th>
					<th>Einkommen</th>
					<th>Interessen</th>
					<th>Musik</th>
				</tr>
			</tfoot>

			<tbody>

				<%= (String) request.getAttribute("data") %>

			</tbody>
		</table>

		<div class="row">
			<div class="col-md-3">

				<h2>Dropped query:</h2>

				<%= (String) request.getAttribute("query") %>

			</div>
			<div class="col-md-9">

				<h2>Active Amalgam-Function: <%= (String) request.getAttribute("amalgam-name") %></h2>
				<h2>Execution/Query Time: <%= (String) request.getAttribute("execution-time") %>ms</h2>
			</div>
		</div>

	</section>

</body>
</html>