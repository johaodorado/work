package aspects;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.awt.event.ActionEvent;

public aspect LoggingAspect {
    // Pointcut para el método actionPerformed de ColorButtonListener
    pointcut buttonClicked(ActionEvent e): execution(void observer.MainWindow.ColorButtonListener.actionPerformed(..)) && args(e);

    // Advice para después de ejecutar el método actionPerformed
    after(ActionEvent e): buttonClicked(e) {
        String color = e.getActionCommand();
        logToFile("Color changed to: " + color + " at " + LocalDateTime.now());
    }

    // Método para registrar el mensaje en un archivo de texto
    private void logToFile(String message) {
        try (FileWriter fw = new FileWriter("colorChangeLog.txt", true);
             PrintWriter pw = new PrintWriter(fw)) {
            pw.println(message);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
