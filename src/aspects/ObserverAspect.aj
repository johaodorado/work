package aspects;

import observer.Subject;
import observer.Observer;
import java.awt.event.ActionEvent;

public aspect ObserverAspect {
    private Subject subject = new Subject();

    // Pointcut para el método actionPerformed de ColorButtonListener
    pointcut buttonClicked(ActionEvent e): execution(void observer.MainWindow.ColorButtonListener.actionPerformed(..)) && args(e);

    // Advice para después de ejecutar el método actionPerformed
    after(ActionEvent e): buttonClicked(e) {
        String color = e.getActionCommand();
        subject.notifyObservers("Color changed to: " + color);
        System.out.println("Color changed to: " + color);
    }

    // Método para agregar observadores
    public void addObserver(Observer observer) {
        subject.addObserver(observer);
    }
}
