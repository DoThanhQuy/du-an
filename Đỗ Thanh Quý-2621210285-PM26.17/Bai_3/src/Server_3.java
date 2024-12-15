import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Server_3 {
    public static void main(String[] args) {
        DatagramSocket socket = null;
        try {
            socket = new DatagramSocket(9877); // Sử dụng cổng 9877
            byte[] receiveData = new byte[1024];
            byte[] sendData;

            while (true) {
                DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
                socket.receive(receivePacket);
                String receivedText = new String(receivePacket.getData(), 0, receivePacket.getLength());
                System.out.println("Received from client: " + receivedText);

                // Xử lý yêu cầu của Client
                String response = processRequest(receivedText);

                // Gửi kết quả lại cho Client
                sendData = response.getBytes();
                InetAddress clientAddress = receivePacket.getAddress();
                int clientPort = receivePacket.getPort();
                DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, clientAddress, clientPort);
                socket.send(sendPacket);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (socket != null && !socket.isClosed()) {
                socket.close();
            }
        }
    }

    private static String processRequest(String request) {
        LocalDate currentDate = LocalDate.now();
        switch (request.trim()) {
            case "1":
                return "Ngày hiện tại: " + currentDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
            case "2":
                return "Tháng hiện tại: " + currentDate.format(DateTimeFormatter.ofPattern("MM/yyyy"));
            case "3":
                return "Năm hiện tại: " + currentDate.format(DateTimeFormatter.ofPattern("yyyy"));
            default:
                return "Lựa chọn không hợp lệ";
        }
    }
}
