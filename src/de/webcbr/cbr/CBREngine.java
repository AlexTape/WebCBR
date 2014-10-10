package de.webcbr.cbr;

import de.dfki.mycbr.core.Project;
import de.dfki.mycbr.core.model.Concept;
import de.dfki.mycbr.io.CSVImporter;

/**
 * The Class CBREngine.
 *
 * @author the cbr team
 */

public class CBREngine {

    // set path to myCBR projects
    // private static String data_path =
    // "C:\\Users\\bach\\IIS\\dev\\workspace\\myCBRWebDemo\\project\\";
    /** The data path. */
    private String dataPath = "D:\\Workspaces\\Java\\myCBR-Webservice\\CBR\\";

    /** The data folder. */
    private String dataFolder = "tiny\\";
    /* project specific: NewExampleProject */
    // name of the project file
    /** The project name. */
    private String projectName = "Personendaten.prj";
    // name of the central concept
    /** The concept name. */
    private String conceptName = "Personen";
    // name of the csv containing the instances
    /** The csv. */
    private String csv = "none.csv";
    // set the separators that are used in the csv file
    /** The columnseparator. */
    private String columnSeparator = ";";

    /** The multiplevalueseparator. */
    private String multipleValueSeparator = ",";
    // name of the case base that should be used; the default name in myCBR is
    // CB_csvImport
    /** The casebase. */
    private String casebase = "Personen";

    // Getter for the Project meta data

    /**
     * This methods creates a myCBR project and loads the project from a .prj
     * file.
     *
     * @return the project
     */
    public final Project createProjectFromPRJ() {

        System.out.println("Trying to load prj file with : " + dataPath + " "
                + projectName + " " + conceptName + " ");

        Project project = null;

        try {

            project = new Project(dataPath + dataFolder + projectName);

            // Sehr wichtig hier das Warten einzubauen, sonst gibts leere
            // Retrieval Results, weil die Faelle noch nicht geladen sind wenn
            // das
            // Erste Retrieval laueft
            while (project.isImporting()) {
                final int oneSecond = 1000;
                Thread.sleep(oneSecond);
                System.out.print(".");
            }
            System.out.print("\n"); // console pretty print
        } catch (Exception ex) {

            System.out.println("Fehler beim Laden des Projektes");
        }
        return project;
    }

    /**
     * Gets the data_path.
     *
     * @return the data_path
     */
    public final String getDataPath() {
        return dataPath;
    }

    /**
     * Sets the data_path.
     *
     * @param newDataPath
     *            the new data_path
     */
    public final void setDataPath(final String newDataPath) {
        this.dataPath = newDataPath;
    }

    /**
     * Gets the data_folder.
     *
     * @return the data_folder
     */
    public final String getDataFolder() {
        return dataFolder;
    }

    /**
     * Sets the data_folder.
     *
     * @param newDataFolder
     *            the new data_folder
     */
    public final void setDataFolder(final String newDataFolder) {
        this.dataFolder = newDataFolder;
    }

    /**
     * Gets the project name.
     *
     * @return the project name
     */
    public final String getProjectName() {
        return projectName;
    }

    /**
     * Sets the project name.
     *
     * @param newProjectName
     *            the new project name
     */
    public final void setProjectName(final String newProjectName) {
        this.projectName = newProjectName;
    }

    /**
     * Gets the concept name.
     *
     * @return the concept name
     */
    public final String getConceptName() {
        return conceptName;
    }

    /**
     * Sets the concept name.
     *
     * @param neConceptName
     *            the new concept name
     */
    public final void setConceptName(final String neConceptName) {
        this.conceptName = neConceptName;
    }

    /**
     * Gets the csv.
     *
     * @return the csv
     */
    public final String getCsv() {
        return csv;
    }

    /**
     * Sets the csv.
     *
     * @param newCsv
     *            the new csv
     */
    public final void setCsv(final String newCsv) {
        this.csv = newCsv;
    }

    /**
     * Gets the columnseparator.
     *
     * @return the columnseparator
     */
    public final String getColumnseparator() {
        return columnSeparator;
    }

    /**
     * Sets the columnseparator.
     *
     * @param newColumnSeparator
     *            the new columnseparator
     */
    public final void setColumnseparator(final String newColumnSeparator) {
        this.columnSeparator = newColumnSeparator;
    }

    /**
     * Gets the multiplevalueseparator.
     *
     * @return the multiplevalueseparator
     */
    public final String getMultiplevalueseparator() {
        return multipleValueSeparator;
    }

    /**
     * Sets the multiplevalueseparator.
     *
     * @param newMultipleValueSeparator
     *            the new multiplevalueseparator
     */
    public final void setMultipleValueSeparator(
            final String newMultipleValueSeparator) {
        this.multipleValueSeparator = newMultipleValueSeparator;
    }

    /**
     * Gets the casebase.
     *
     * @return the casebase
     */
    public final String getCasebase() {
        return casebase;
    }

    /**
     * Sets the casebase.
     *
     * @param newCasebase
     *            the new casebase
     */
    public final void setCasebase(final String newCasebase) {
        this.casebase = newCasebase;
    }

    /**
     * This methods creates a myCBR project and loads the cases in this project.
     * The specification of the project's location and according file names has
     * to be done at the beginning of this class.
     *
     * @return Project instance containing model, sims and cases (if available)
     */
    public final Project createCBRProject() {

        Project project = null;
        try {
            // load new project
            project = new Project(dataPath + projectName);
            // create a concept and get the main concept of the project;
            // the name has to be specified at the beginning of this class
            while (project.isImporting()) {
                final int oneSecond = 1000;
                Thread.sleep(oneSecond);
                System.out.print(".");
            }
            System.out.print("\n"); // console pretty print
            Concept concept = project.getConceptByID(conceptName);
            // Initialize CSV Import
            CSVImporter csvImporter = new CSVImporter(dataPath + csv, concept);
            // set the separators that are used in the csv file
            csvImporter.setSeparator(columnSeparator); // column separator
            csvImporter.setSeparatorMultiple(multipleValueSeparator);
            // prepare for import
            csvImporter.readData();
            csvImporter.checkData();
            csvImporter.addMissingValues();
            csvImporter.addMissingDescriptions();
            // do the import of the instances
            csvImporter.doImport();
            // wait until the import is done
            System.out.print("Importing ");
            while (csvImporter.isImporting()) {
                final int oneSecond = 1000;
                Thread.sleep(oneSecond);
                System.out.print(".");
            }
            System.out.print("\n"); // console pretty print
        } catch (Exception e) {
            e.printStackTrace();
        }
        return project;
    }

    /**
     * This methods creates an EMPTY myCBR project. The specification of the
     * project's location and according file names has to be done at the
     * beginning of this class.
     *
     * @return Project instance containing model, sims and cases (if available)
     */
    public final Project createemptyCBRProject() {

        Project project = null;
        try {
            // load new project
            project = new Project(dataPath + projectName);
            // create a concept and get the main concept of the project;
            // the name has to be specified at the beginning of this class
            while (project.isImporting()) {
                final int oneSecond = 1000;
                Thread.sleep(oneSecond);
                System.out.print(".");
            }
            System.out.print("\n"); // console pretty print
        } catch (Exception e) {
            e.printStackTrace();
        }
        return project;
    }
}
