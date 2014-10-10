package de.webcbr.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import de.webcbr.cbr.Recommender;
import de.webcbr.objects.Attribute;
import de.webcbr.objects.AttributeSet;

/**
 * Servlet implementation class query.
 */
@WebServlet("/query")
public class Query extends HttpServlet {

    /** The Constant serialVersionUID. */
    private static final long serialVersionUID = 1L;

    /**
     * Instantiates a new query.
     *
     * @see HttpServlet#HttpServlet()
     */
    public Query() {
        super();
        // TODO Auto-generated constructor stub
    }

    /*
     * (non-Javadoc)
     *
     * @see javax.servlet.GenericServlet#init()
     */
    @Override
    public final void init() {
        System.out.println("TEST");
    }

    /**
     * Do get.
     *
     * @param request
     *            the request
     * @param response
     *            the response
     * @throws ServletException
     *             the servlet exception
     * @throws IOException
     *             Signals that an I/O exception has occurred.
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected final void doGet(final HttpServletRequest request,
            final HttpServletResponse response) throws ServletException,
            IOException {

        response.setContentType("text/html");

        // start benchmark
        final long startTime = System.currentTimeMillis();

        // get recommender
        Recommender remy = new Recommender();
        remy.getEngine().setDataFolder(request.getParameter("Casebase") + "\\");

        // load enginge with selected casebase
        remy.loadengine(request.getParameter("Amalgam"));

        // String amaFunc = remy.displayAmalgamationFunctions();
        // response.getWriter().write(amaFunc);
        // response.getWriter().write("<br><br><br>BBBB<br><br><br>");
        // CheckforAmalgamSelection();

        AttributeSet attributes = new AttributeSet();
        attributes.add(new Attribute("Similarity", "System", "_undefined_"));
        attributes.add(new Attribute("Case", "System", "_undefined_"));
        attributes.add(new Attribute("Nachname", "String", "_undefined_"));
        attributes.add(new Attribute("Vorname", "String", "_undefined_"));
        attributes.add(new Attribute("Geschlecht", "Symbol", request
                .getParameter("Geschlecht")));
        attributes.add(new Attribute("Geburtsdatum", "String", "_undefined_"));
        attributes.add(new Attribute("Geburtsjahr", "Integer", request
                .getParameter("Geburtsjahr")));
        attributes.add(new Attribute("Strasse", "String", "_undefined_"));
        attributes.add(new Attribute("Hausnummer", "Integer", "_undefined_"));
        attributes.add(new Attribute("Ort", "String", request
                .getParameter("Ort")));
        attributes.add(new Attribute("PLZ", "Integer", request
                .getParameter("PLZ")));
        attributes.add(new Attribute("Land", "Symbol", request
                .getParameter("Land")));
        attributes.add(new Attribute("Telefonnummer", "String", "_undefined_"));
        attributes.add(new Attribute("TelefonVorwahl", "Integer", request
                .getParameter("TelefonVorwahl")));
        attributes.add(new Attribute("EmailAdresse", "String", "_undefined_"));
        attributes.add(new Attribute("EmailProvider", "String", "_undefined_"));
        attributes.add(new Attribute("Beziehungsstatus", "Symbol", request
                .getParameter("Beziehungsstatus")));
        attributes.add(new Attribute("Kinder", "Symbol", request
                .getParameter("Kinder")));
        attributes.add(new Attribute("Religion", "Symbol", request
                .getParameter("Religion")));
        attributes.add(new Attribute("PolitischeEinstellung", "Symbol", request
                .getParameter("PolitischeEinstellung")));
        attributes.add(new Attribute("SexuelleOrientierung", "Symbol", request
                .getParameter("SexuelleOrientierung")));
        attributes.add(new Attribute("Figur", "Symbol", request
                .getParameter("Figur")));
        attributes.add(new Attribute("Raucher", "Symbol", request
                .getParameter("Raucher")));
        attributes.add(new Attribute("Alkohol", "Symbol", request
                .getParameter("Alkohol")));
        attributes.add(new Attribute("AndereDrogen", "Symbol", request
                .getParameter("AndereDrogen")));
        attributes.add(new Attribute("Beruf", "String", request
                .getParameter("Beruf")));
        attributes.add(new Attribute("Einkommen", "Integer", request
                .getParameter("Einkommen")));
        attributes.add(new Attribute("Interessen", "String", request
                .getParameter("Interessen")));
        attributes.add(new Attribute("Musik", "String", request
                .getParameter("Musik")));

        String resultSize = request.getParameter("Results");
        int resultNumber = Integer.parseInt(resultSize);

        ArrayList<AttributeSet> resultSet = remy.retrieve(attributes,
                resultNumber);

        // build table
        StringBuilder htmlRecommendation = new StringBuilder();
        for (AttributeSet resultCase : resultSet) {

            StringBuilder htmlCase = new StringBuilder("<tr>");
            for (Attribute resultAttribute : resultCase) {

                htmlCase.append("<td>" + resultAttribute.getValue() + "</td>");
            }

            htmlCase.append("</tr>\n");
            htmlRecommendation.append(htmlCase.toString());
        }
        request.setAttribute("data", htmlRecommendation.toString());

        // build query info
        StringBuilder queryData = new StringBuilder();
        queryData.append("<table class=\"table\">\n");
        queryData.append("<thead><tr><th>Attribute</th>"
                + "<th>Value</th></tr></thead>\n");
        queryData.append("<tbody>\n");
        for (Attribute resultAttribute : attributes) {

            queryData.append("<tr>");
            queryData.append("<td>" + resultAttribute.getName() + "</td>");
            queryData.append("<td>" + resultAttribute.getValue() + "</td>\n");
            queryData.append("</tr>");
        }

        queryData.append("</tbody>\n");
        queryData.append("</table>\n");
        request.setAttribute("query", queryData.toString());

        // get amalgam info
        request.setAttribute("amalgam-name", remy.getMyConcept()
                .getActiveAmalgamFct().getName());

        // end benchmark
        final long endTime = System.currentTimeMillis();

        // execution time
        final long executionTime = endTime - startTime;
        request.setAttribute("execution-time", executionTime + "");
        System.out.println("Total execution time: " + executionTime);

        // dispatch
        request.getRequestDispatcher("/datatable.jsp").forward(request,
                response);

    }

    /**
     * Do post.
     *
     * @param request
     *            the request
     * @param response
     *            the response
     * @throws ServletException
     *             the servlet exception
     * @throws IOException
     *             Signals that an I/O exception has occurred.
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doPost(final HttpServletRequest request,
            final HttpServletResponse response) throws ServletException,
            IOException {
        // TODO Auto-generated method stub
    }

    /**
     * Gets the serialversionuid.
     *
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
