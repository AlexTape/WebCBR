package de.webcbr.objects;

import java.util.ArrayList;

/**
 * The Class AttributeSet.
 */
public class AttributeSet extends ArrayList<Attribute> {

    /** The Constant serialVersionUID. */
    private static final long serialVersionUID = -4672656564670738698L;

    /**
     * Gets the serialversionuid.
     *
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /*
     * (non-Javadoc)
     *
     * @see java.util.ArrayList#add(java.lang.Object)
     */
    @Override
    public final boolean add(final Attribute arg0) {
        return super.add(arg0);
    }

    /*
     * (non-Javadoc)
     *
     * @see java.util.ArrayList#add(int, java.lang.Object)
     */
    @Override
    public final void add(final int arg0, final Attribute arg1) {
        super.add(arg0, arg1);
    }

    /*
     * (non-Javadoc)
     *
     * @see java.util.ArrayList#get(int)
     */
    @Override
    public final Attribute get(final int arg0) {
        return super.get(arg0);
    }

    /**
     * Gets the.
     *
     * @param name
     *            the name
     * @return the attribute
     */
    public final Attribute get(final String name) {

        Attribute returnThis = null;
        for (Attribute attr : this) {

            if (attr.getName().contentEquals(name)) {
                returnThis = attr;
            }
        }
        return returnThis;
    }

    /*
     * (non-Javadoc)
     *
     * @see java.util.AbstractCollection#toString()
     */
    @Override
    public final String toString() {
        return "AttributeSet [size()=" + size() + ", toString()="
                + super.toString() + "]";
    }

}
