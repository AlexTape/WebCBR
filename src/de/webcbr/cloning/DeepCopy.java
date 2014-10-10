package de.webcbr.cloning;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/**
 * The Class DeepCopy.
 */
public final class DeepCopy {

    /**
     * Instantiates a new deep copy.
     */
    private DeepCopy() {

    }

    /**
     * Returns a copy of the object, or null if the object cannot be serialized.
     *
     * @param orig the orig
     * @return the object
     */
    public static Object copy(final Object orig) {
        Object obj = null;
        try {
            // Write the object out to a byte array
            FastByteArrayOutputStream fbos = new FastByteArrayOutputStream();
            ObjectOutputStream out = new ObjectOutputStream(fbos);
            out.writeObject(orig);
            out.flush();
            out.close();

            // Retrieve an input stream from the byte array and read
            // a copy of the object back in.
            ObjectInputStream in = new ObjectInputStream(fbos.getInputStream());
            obj = in.readObject();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
        return obj;
    }

}
