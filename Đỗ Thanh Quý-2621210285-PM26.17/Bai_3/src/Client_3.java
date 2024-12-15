import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Scanner;

public class Client_3 {
    public static void main(String[] args) {
        DatagramSocket socket = null;
        try {
            socket = new DatagramSocket();
            InetAddress IPAddress = InetAddress.getByName("localhost");
            byte[] sendData;
            byte[] receiveData = new byte[1024];

            Scanner scanner = new Scanner(System.in);
            System.out.println("Nhập lựa chọn (1: Ngày hiện tại, 2: Tháng hiện tại, 3: Năm hiện tại): ");
            String inputChoice = scanner.nextLine();

            // Gửi lựa chọn sang Server
            sendData = inputChoice.getBytes();
            DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, IPAddress, 9877); // Sử dụng cổng 9877
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
