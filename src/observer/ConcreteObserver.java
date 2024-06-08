package observer;

public class ConcreteObserver implements Observer {
    @Override
    public void update(String message) {
        System.out.println("Observer received update: " + message);
    }
}
