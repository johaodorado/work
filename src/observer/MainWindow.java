package observer;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainWindow extends JFrame {
    private JPanel panel;
    private Subject subject;

    public MainWindow() {
        subject = new Subject();

        setTitle("Observer Pattern with AspectJ");
        setSize(400, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        panel = new JPanel();
        add(panel);

        JButton redButton = new JButton("Red");
        JButton greenButton = new JButton("Green");
        JButton blueButton = new JButton("Blue");

        redButton.addActionListener(new ColorButtonListener(Color.RED));
        greenButton.addActionListener(new ColorButtonListener(Color.GREEN));
        blueButton.addActionListener(new ColorButtonListener(Color.BLUE));

        panel.add(redButton);
        panel.add(greenButton);
        panel.add(blueButton);

        // Añadir observadores
        subject.addObserver(new ConcreteObserver());
    }

    private class ColorButtonListener implements ActionListener {
        private Color color;

        public ColorButtonListener(Color color) {
            this.color = color;
        }

        @Override
        public void actionPerformed(ActionEvent e) {
            panel.setBackground(color);
            subject.notifyObservers("Color changed to: " + color.toString());
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            MainWindow window = new MainWindow();
            window.setVisible(true);
        });
    }
}

