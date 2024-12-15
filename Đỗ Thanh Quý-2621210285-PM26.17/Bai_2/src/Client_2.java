import java.io.*;
import java.net.*;
import java.util.Scanner;

public class Client_2 {
    public static void main(String[] args) {
        DatagramSocket socket = null;
        try {
            socket = new DatagramSocket();
            InetAddress IPAddress = InetAddress.getByName("localhost");
            byte[] sendData;
            byte[] receiveData = new byte[1024];

            Scanner scanner = new Scanner(System.in);
            System.out.print("Nhập ngày tháng (dd/MM/yyyy): ");
            String inputText = scanner.nextLine();

            // Gửi dữ liệu sang Server
            sendData = inputText.getBytes();
            DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, IPAddress, 9876);
            socket.send(sendPacket);

            // Nhận kết quả từ Server
            DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
            socket.receive(receivePacket);
            String receivedText = new String(receivePacket.getData(), 0, receivePacket.getLength());
            System.out.println("Server trả về: " + receivedText);

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (socket != null && !socket.isClosed()) {
                socket.close();
            }
        }
    }
}
