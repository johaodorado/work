package aspects;

import java.awt.event.ActionEvent;

public aspect ContadorAspect {
    private int clickCount = 0;

    // Pointcut para el método actionPerformed de ColorButtonListener
    pointcut buttonClicked(ActionEvent e): execution(void observer.MainWindow.ColorButtonListener.actionPerformed(..)) && args(e);

    // Advice para después de ejecutar el método actionPerformed
    after(ActionEvent e): buttonClicked(e) {
        clickCount++;
        System.out.println("Button clicked " + clickCount + " times.");
    }
}
