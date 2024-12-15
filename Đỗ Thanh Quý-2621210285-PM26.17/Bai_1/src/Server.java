
import java.io.*;
import java.net.*;

public class Server {
    public static void main(String[] args) {
        try {
            ServerSocket serverSocket = new ServerSocket(5000);
            System.out.println("Server is started.");

            while (true) {
                Socket socket = serverSocket.accept();
                new ClientHandler(socket).start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

class ClientHandler extends Thread {
    private Socket socket;

    public ClientHandler(Socket socket) {
        this.socket = socket;
    }

    @Override
    public void run() {
        try {
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);

            String receivedText = in.readLine();
            System.out.println("Received from client: " + receivedText);

            // Chuẩn hóa chuỗi
            String normalizedText = receivedText.trim().replaceAll("\\s+", " ");

            // Đếm số ký tự viết hoa
            long uppercaseCount = normalizedText.chars().filter(Character::isUpperCase).count();

            // Gửi kết quả lại cho Client
            out.println("Chuẩn hóa chuỗi: " + normalizedText);
            out.println("Số ký tự viết hoa: " + uppercaseCount);

            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
