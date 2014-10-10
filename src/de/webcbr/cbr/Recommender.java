package de.webcbr.cbr;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import de.dfki.mycbr.core.DefaultCaseBase;
import de.dfki.mycbr.core.Project;
import de.dfki.mycbr.core.casebase.Instance;
import de.dfki.mycbr.core.model.AttributeDesc;
import de.dfki.mycbr.core.model.Concept;
import de.dfki.mycbr.core.model.IntegerDesc;
import de.dfki.mycbr.core.model.StringDesc;
import de.dfki.mycbr.core.model.SymbolDesc;
import de.dfki.mycbr.core.retrieval.Retrieval;
import de.dfki.mycbr.core.retrieval.Retrieval.RetrievalMethod;
import de.dfki.mycbr.core.similarity.AmalgamationFct;
import de.dfki.mycbr.core.similarity.Similarity;
import de.dfki.mycbr.util.Pair;
import de.webcbr.cloning.DeepCopy;
import de.webcbr.objects.Attribute;
import de.webcbr.objects.AttributeSet;

/**
 * The Class Recommender.
 *
 * @author the cbr team
 */

public class Recommender {

    /** The engine. */
    private CBREngine engine;

    /** The rec. */
    private Project project;

    /** The cb. */
    private DefaultCaseBase cb;

    /** The my concept. */
    private Concept myConcept;

    /** The amalgam. */
    private AmalgamationFct amalgam;

    /**
     * Instantiates a new recommender.
     */
    public Recommender() {
        this.setEngine(new CBREngine());
    }

    /**
     * Loadengine.
     *
     * @param amalString
     *            the amal string
     */
    public final void loadengine(final String amalString) {

        this.setProject(engine.createProjectFromPRJ());
        this.setCb((DefaultCaseBase) project.getCaseBases().get(
                this.getEngine().getCasebase()));
        this.setMyConcept(project.getConceptByID(engine.getConceptName()));

        List<AmalgamationFct> amalList = this.getMyConcept()
                .getAvailableAmalgamFcts();
        for (AmalgamationFct amalFct : amalList) {

            if (amalFct.getName().contentEquals(amalString)) {

                this.setAmalgam(amalFct);
            }
        }
        this.getMyConcept().setActiveAmalgamFct(amalgam);
    }

    /**
     * Retrieve.
     *
     * @param querySet
     *            the query set
     * @param numberOfCases
     *            the numberOfCases
     * @return the array list
     */
    public final ArrayList<AttributeSet> retrieve(final AttributeSet querySet,
            final Integer numberOfCases) {

        int localNumberOfCases = numberOfCases;

        // result data
        ArrayList<AttributeSet> resultData = new ArrayList<AttributeSet>();

        // create a new retrieval
        Retrieval ret = new Retrieval(this.getMyConcept(), this.getCb());
        // specify the retrieval method
        ret.setRetrievalMethod(RetrievalMethod.RETRIEVE_SORTED);
        // create a query instance
        Instance query = ret.getQueryInstance();

        // DEFINE QUERY
        for (Attribute attr : querySet) {

            if (attr.getType().contentEquals("String")) {

                StringDesc stringDesc = (StringDesc) myConcept
                        .getAllAttributeDescs().get(attr.getName());
                try {
                    query.addAttribute(stringDesc,
                            stringDesc.getAttribute(attr.getValue()));
                } catch (ParseException e) {
                    System.out.println("could not parse integer");
                    e.printStackTrace();
                }
            }

            if (attr.getType().contentEquals("Integer")) {

                IntegerDesc intDesc = (IntegerDesc) myConcept
                        .getAllAttributeDescs().get(attr.getName());
                try {
                    query.addAttribute(intDesc,
                            intDesc.getAttribute(attr.getValue()));
                } catch (ParseException e) {
                    System.out.println("could not parse integer");
                    e.printStackTrace();
                }
            }

            if (attr.getType().contentEquals("Symbol")) {

                System.out.println("Sym" + attr);

                SymbolDesc symDesc = (SymbolDesc) myConcept
                        .getAllAttributeDescs().get(attr.getName());
                query.addAttribute(symDesc,
                        symDesc.getAttribute(attr.getValue()));
            }
        }

        // perform retrieval
        ret.start();
        // get the retrieval result
        List<Pair<Instance, Similarity>> result = ret.getResult();
        // get the case name

        if (result.size() > 0) {

            ArrayList<Hashtable<String, String>> entityList =
                    new ArrayList<Hashtable<String, String>>();

            // if more case results are requested than we have in our case base
            // at all:
            if (localNumberOfCases >= cb.getCases().size()) {
                localNumberOfCases = cb.getCases().size();
            }

            for (int i = 0; i < localNumberOfCases; i++) {

                // clone attribute set
                Object cloneObject = DeepCopy.copy(querySet);
                AttributeSet resultSet = (AttributeSet) cloneObject;

                entityList.add(getAttributes(result.get(i),
                        project.getConceptByID(
                            this.getEngine().getConceptName())));

                String casename = result.get(i).getFirst().getName();
                Double similarity = round(result.get(i).getSecond().getValue(),
                        2);

                resultSet.get("Similarity").setValue(similarity.toString());
                resultSet.get("Case").setValue(casename);

                Iterator<Map.Entry<String, String>> resultIterator = entityList
                        .get(i).entrySet().iterator();
                while (resultIterator.hasNext()) {

                    Map.Entry<String, String> entry = resultIterator.next();

                    Attribute attr = resultSet.get(entry.getKey());

                    if (attr != null) {

                        attr.setValue(entry.getValue());
                    }
                }

                resultData.add(resultSet);

            }

        } else {
            System.out.println("Retrieval Result is empty");
        }

        return resultData;
    }

    /**
     * Round.
     *
     * @param value
     *            the value
     * @param places
     *            the places
     * @return the double
     */
    private double round(final double value, final int places) {
        if (places < 0) {
            throw new IllegalArgumentException();
        }
        final int ten = 10;
        long factor = (long) Math.pow(ten, places);
        long tmp = Math.round(value * factor);
        return (double) tmp / factor;
    }

    /**
     * This method delivers a Hashtable which contains the Attributs names
     * (Attributes of the case) combined with their respective values.
     *
     * @author weber,koehler,namuth
     * @param r
     *            = An Instance.
     * @param concept
     *            = A Concept
     * @return List = List containing the Attributes of a case with their
     *         values.
     */
    public static Hashtable<String, String> getAttributes(
            final Pair<Instance, Similarity> r, final Concept concept) {

        Hashtable<String, String> table = new Hashtable<String, String>();
        ArrayList<String> cats = getCategories(r);
        // Add the similarity of the case
        table.put("Sim", String.valueOf(r.getSecond().getValue()));
        for (String cat : cats) {
            // Add the Attribute name and its value into the Hashtable
            table.put(
                    cat,
                    r.getFirst()
                            .getAttForDesc(
                                    concept.getAllAttributeDescs().get(cat))
                            .getValueAsString());
        }
        return table;
    }

    /**
     * This Method generates an ArrayList, which contains all Categories of aa
     * Concept.
     *
     * @author weber,koehler,namuth
     * @param r
     *            = An Instance.
     * @return List = List containing the Attributes names.
     */
    public static ArrayList<String> getCategories(
            final Pair<Instance, Similarity> r) {

        ArrayList<String> cats = new ArrayList<String>();

        // Read all Attributes of a Concept
        Set<AttributeDesc> catlist = r.getFirst().getAttributes().keySet();

        for (AttributeDesc cat : catlist) {
            if (cat != null) {
                // Add the String literals for each Attribute into the ArrayList
                cats.add(cat.getName());
            }
        }
        return cats;
    }

    // @SuppressWarnings("unused")
    /**
     * Display amalgamation functions.
     *
     * @return the string
     */
    public final String displayAmalgamationFunctions() {

        String listoffunctions =
                "Currently available Amalgamationfunctions: <br /> <br />";
        AmalgamationFct current = myConcept.getActiveAmalgamFct();
        System.out.println("Amalgamation Function is used = "
                + current.getName());
        List<AmalgamationFct> liste = myConcept.getAvailableAmalgamFcts();

        for (int i = 0; i < liste.size(); i++) {
            System.out.println(liste.get(i).getName());
            listoffunctions = listoffunctions + liste.get(i).getName()
                    + "<br />";
        }

        listoffunctions = listoffunctions
                + (" <br /> <br /> Currently selected Amalgamationfunction: "
                        + current.getName() + "\n");
        listoffunctions = listoffunctions
                + (" <br /> <br /> Please type the name of the "
                        + "Amalgamationfunction to use in the "
                        + " Field \"Amalgamationfunction\" it will "
                        + "be automatically used during the next retrieval");
        System.out.println(listoffunctions);
        return listoffunctions;
    }

    /**
     * Gets the amalgam.
     *
     * @return the amalgam
     */
    public final AmalgamationFct getAmalgam() {
        return amalgam;
    }

    /**
     * Sets the amalgam.
     *
     * @param newAmalgam
     *            the new amalgam
     */
    public final void setAmalgam(final AmalgamationFct newAmalgam) {
        this.amalgam = newAmalgam;
    }

    /**
     * Gets the engine.
     *
     * @return the engine
     */
    public final CBREngine getEngine() {
        return engine;
    }

    /**
     * Sets the engine.
     *
     * @param newEngine
     *            the new engine
     */
    public final void setEngine(final CBREngine newEngine) {
        this.engine = newEngine;
    }

    /**
     * Gets the project.
     *
     * @return the project
     */
    public final Project getProject() {
        return project;
    }

    /**
     * Sets the project.
     *
     * @param newProject the new project
     */
    public final void setProject(final Project newProject) {
        this.project = newProject;
    }

    /**
     * Gets the cb.
     *
     * @return the cb
     */
    public final DefaultCaseBase getCb() {
        return cb;
    }

    /**
     * Sets the cb.
     *
     * @param newCb
     *            the new cb
     */
    public final void setCb(final DefaultCaseBase newCb) {
        this.cb = newCb;
    }

    /**
     * Gets the my concept.
     *
     * @return the my concept
     */
    public final Concept getMyConcept() {
        return myConcept;
    }

    /**
     * Sets the my concept.
     *
     * @param newConcept
     *            the new my concept
     */
    public final void setMyConcept(final Concept newConcept) {
        this.myConcept = newConcept;
    }

}
