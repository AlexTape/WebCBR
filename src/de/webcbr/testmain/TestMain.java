package de.webcbr.testmain;

import java.util.ArrayList;
import java.util.List;

import de.dfki.mycbr.core.similarity.AmalgamationFct;
import de.webcbr.cbr.Recommender;
import de.webcbr.objects.Attribute;
import de.webcbr.objects.AttributeSet;

/**
 * The Class TestMain.
 */
public final class TestMain {

    /**
     * Instantiates a new test main.
     */
    private TestMain() {

    }

    /**
     * The main method.
     *
     * @param args
     *            the arguments
     */
    public static void main(final String[] args) {

        Recommender remy = new Recommender();
        remy.loadengine("Person");

        // String amaFunc = remy.displayAmalgamationFunctions();
        // System.out.println(amaFunc);

        List<AmalgamationFct> liste = remy.getMyConcept()
                .getAvailableAmalgamFcts();
        String inAma = remy.getMyConcept().getActiveAmalgamFct().getName();

        for (int i = 0; i < liste.size(); i++) {

            if ((liste.get(i).getName()).equals(inAma)) {

                remy.getMyConcept().setActiveAmalgamFct(liste.get(i));
            }
        }

        AttributeSet attributes = new AttributeSet();
        attributes.add(new Attribute("Similarity", "System"));
        attributes.add(new Attribute("Case", "System"));
        attributes.add(new Attribute("Nachname", "Symbol"));
        attributes.add(new Attribute("Vorname", "Symbol"));
        attributes.add(new Attribute("Geschlecht", "Symbol"));
        attributes.add(new Attribute("Geburtsdatum", "Symbol"));
        attributes.add(new Attribute("Geburtsjahr", "Integer"));
        attributes.add(new Attribute("Strasse", "Symbol"));
        attributes.add(new Attribute("Hausnummer", "Symbol"));
        attributes.add(new Attribute("Ort", "Symbol"));
        attributes.add(new Attribute("PLZ", "Integer"));
        attributes.add(new Attribute("Land", "Symbol"));
        attributes.add(new Attribute("Telefonnummer", "Symbol"));
        attributes.add(new Attribute("TelefonVorwahl", "Integer"));
        attributes.add(new Attribute("EmailAdresse", "Symbol"));
        attributes.add(new Attribute("Beziehungsstatus", "Symbol"));
        attributes.add(new Attribute("Kinder", "Symbol"));
        attributes.add(new Attribute("Religion", "Symbol"));
        attributes.add(new Attribute("PolitischeEinstellung", "Symbol"));
        attributes.add(new Attribute("SexuelleOrientierung", "Symbol"));
        attributes.add(new Attribute("Figur", "Symbol"));
        attributes.add(new Attribute("Raucher", "Symbol", "ja"));
        attributes.add(new Attribute("Alkohol", "Symbol", "ja"));
        attributes.add(new Attribute("AndereDrogen", "Symbol"));
        attributes.add(new Attribute("Beruf", "Symbol"));
        attributes.add(new Attribute("Einkommen", "Integer"));
        attributes.add(new Attribute("Interessen", "Symbol"));
        attributes.add(new Attribute("Musik", "Symbol"));

        final int five = 5;
        ArrayList<AttributeSet> resultSet = remy.retrieve(attributes,
                (int) five);
        StringBuilder htmlRecommendation = new StringBuilder();

        for (AttributeSet resultCase : resultSet) {

            StringBuilder htmlCase = new StringBuilder("<tr>");
            for (Attribute resultAttribute : resultCase) {

                htmlCase.append("<td>" + resultAttribute.getValue() + "</td>");
            }

            htmlCase.append("</tr>\n");
            htmlRecommendation.append(htmlCase.toString());
        }

        System.out.println(htmlRecommendation.toString());

    }

}
