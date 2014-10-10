package de.webcbr.cloning;

import java.io.InputStream;

/**
 * ByteArrayInputStream implementation that does not synchronize methods.
 */
public class FastByteArrayInputStream extends InputStream {

    /** Our byte buffer. */
    private byte[] buf = null;

    /** Number of bytes that we can read from the buffer. */
    private int count = 0;

    /** Number of bytes that have been read from the buffer. */
    private int pos = 0;

    /**
     * Instantiates a new fast byte array input stream.
     *
     * @param newBuf
     *            the buf
     * @param newCount
     *            the count
     */
    public FastByteArrayInputStream(final byte[] newBuf, final int newCount) {
        this.buf = newBuf;
        this.count = newCount;
    }

    /*
     * (non-Javadoc)
     *
     * @see java.io.InputStream#available()
     */
    @Override
    public final int available() {
        return count - pos;
    }

    /*
     * (non-Javadoc)
     *
     * @see java.io.InputStream#read()
     */
    @Override
    public final int read() {
        final char sign = 0xff;
        if (pos < count) {
            return buf[pos++] & sign;
        } else {
            return -1;
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see java.io.InputStream#read(byte[], int, int)
     */
    @Override
    public final int read(final byte[] b, final int off, final int len) {
        int localLen = len;
        if (pos >= count) {
            return -1;
        }
        if ((pos + localLen) > count) {
            localLen = (count - pos);
        }
        System.arraycopy(buf, pos, b, off, localLen);
        pos += localLen;
        return localLen;
    }

    /*
     * (non-Javadoc)
     *
     * @see java.io.InputStream#skip(long)
     */
    @Override
    public final long skip(final long n) {
        long local = n;
        if ((pos + local) > count) {
            local = count - pos;
        }
        if (local < 0) {
            return 0;
        }
        pos += local;
        return local;
    }

}
