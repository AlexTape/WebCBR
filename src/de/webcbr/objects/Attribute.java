package de.webcbr.objects;

import java.io.Serializable;

/**
 * The Class Attribute.
 */
public class Attribute implements Serializable {

    /** The Constant serialVersionUID. */
    private static final long serialVersionUID = -1283445141251415954L;

    /** The name. */
    private String name;

    /** The type. */
    private String type;

    /** The value. */
    private String value;

    /** The position. */
    private int position;

    /**
     * Instantiates a new attribute.
     *
     * @param newName
     *            the name
     * @param newType
     *            the type
     */
    public Attribute(final String newName, final String newType) {
        this.name = newName;
        this.type = newType;
        this.value = "_undefined_";
    }

    /**
     * Instantiates a new attribute.
     *
     * @param newName
     *            the name
     * @param newType
     *            the type
     * @param newValue
     *            the value
     */
    public Attribute(final String newName,
            final String newType, final String newValue) {
        this.name = newName;
        this.type = newType;
        this.value = newValue;
    }

    /**
     * Gets the position.
     *
     * @return the position
     */
    public final int getPosition() {
        return position;
    }

    /**
     * Gets the name.
     *
     * @return the name
     */
    public final String getName() {
        return name;
    }

    /**
     * Gets the type.
     *
     * @return the type
     */
    public final String getType() {
        return type;
    }

    /**
     * Gets the value.
     *
     * @return the value
     */
    public final String getValue() {
        return value;
    }

    /**
     * Sets the value.
     *
     * @param newValue
     *            the new value
     */
    public final void setValue(final String newValue) {
        this.value = newValue;
    }

    /*
     * (non-Javadoc)
     *
     * @see java.lang.Object#toString()
     */
    @Override
    public final String toString() {
        return "Attribute [name=" + name + ", type=" + type + ", value="
                + value + ", position=" + position + "]";
    }

}
