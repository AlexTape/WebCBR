package de.webcbr.cloning;

import java.io.InputStream;
import java.io.OutputStream;

/**
 * ByteArrayOutputStream implementation that doesn't synchronize methods and
 * doesn't copy the data on toByteArray().
 */
public class FastByteArrayOutputStream extends OutputStream {
    /**
     * Buffer and size.
     */
    private byte[] buf = null;

    /** The size. */
    private int size = 0;

    /** The five. */
    private static final int FIVE = 5;

    /** The t24. */
    private static final int T24 = 1024;

    /**
     * Constructs a stream with buffer capacity size 5K.
     */
    public FastByteArrayOutputStream() {
        this(FIVE * T24);
    }

    /**
     * Constructs a stream with the given initial size.
     *
     * @param initSize
     *            the init size
     */
    public FastByteArrayOutputStream(final int initSize) {
        this.size = 0;
        this.buf = new byte[initSize];
    }

    /**
     * Ensures that we have a large enough buffer for the given size.
     *
     * @param sz
     *            the sz
     */
    private void verifyBufferSize(final int sz) {
        if (sz > buf.length) {
            byte[] old = buf;
            buf = new byte[Math.max(sz, 2 * buf.length)];
            System.arraycopy(old, 0, buf, 0, old.length);
            old = null;
        }
    }

    /**
     * Gets the size.
     *
     * @return the size
     */
    public final int getSize() {
        return size;
    }

    /**
     * Returns the byte array containing the written data. Note that this array
     * will almost always be larger than the amount of data actually written.
     *
     * @return the byte array
     */
    public final byte[] getByteArray() {
        return buf;
    }

    /*
     * (non-Javadoc)
     *
     * @see java.io.OutputStream#write(byte[])
     */
    @Override
    public final void write(final byte[] b) {
        verifyBufferSize(size + b.length);
        System.arraycopy(b, 0, buf, size, b.length);
        size += b.length;
    }

    /*
     * (non-Javadoc)
     *
     * @see java.io.OutputStream#write(byte[], int, int)
     */
    @Override
    public final void write(final byte[] b, final int off, final int len) {
        verifyBufferSize(size + len);
        System.arraycopy(b, off, buf, size, len);
        size += len;
    }

    /*
     * (non-Javadoc)
     *
     * @see java.io.OutputStream#write(int)
     */
    @Override
    public final void write(final int b) {
        verifyBufferSize(size + 1);
        buf[size++] = (byte) b;
    }

    /**
     * Reset.
     */
    public final void reset() {
        size = 0;
    }

    /**
     * Returns a ByteArrayInputStream for reading back the written data.
     *
     * @return the input stream
     */
    public final InputStream getInputStream() {
        return new FastByteArrayInputStream(buf, size);
    }

}
