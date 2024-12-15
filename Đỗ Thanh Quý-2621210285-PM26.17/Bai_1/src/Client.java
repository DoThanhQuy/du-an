
import java.io.*;
import java.net.*;
import java.util.Scanner;

public class Client {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("localhost", 5000);
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

            Scanner scanner = new Scanner(System.in);

            System.out.print("Nhập chuỗi bất kỳ: ");
            String inputText = scanner.nextLine();

            // Gửi chuỗi sang Server
            out.println(inputText);

            // Nhận kết quả từ Server
            String normalizedText = in.readLine();
            String uppercaseCount = in.readLine();

            System.out.println(normalizedText);
            System.out.println(uppercaseCount);

            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
