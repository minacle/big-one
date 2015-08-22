import java.io.FileOutputStream;
import java.io.IOException;

public class Main {

    public static void main(String[] args) {
        FileOutputStream fos = null;

        try {
            fos = new FileOutputStream("big");

            while (true) {
                fos.write(0);
            }
        } catch (IOException e) {
            // failed to create file or disk full
            // ignore
        } finally {
            if ( fos != null )
            {
                try {
                    fos.flush();
                    fos.close();
                } catch (IOException e) {
                    // failed to flush and close file stream, who cares?
                }
            }
        }
    }
}
