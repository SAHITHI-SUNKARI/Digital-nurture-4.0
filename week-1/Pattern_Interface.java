package pack1;

// Interface
interface Pattern_Interface {
    void speak();
}

// Concrete class: Dog
class Dog implements Pattern_Interface {
    @Override
    public void speak() {
        System.out.println("Dog says: Bark!");
    }
}

// Concrete class: Cat
class Cat implements Pattern_Interface {
    @Override
    public void speak() {
        System.out.println("Cat says: Meow!");
    }
}

// Factory class
class PatternFactory {
    public Pattern_Interface getPattern(String type) {
        if (type == null) {
            return null;
        }
        if (type.equalsIgnoreCase("Dog")) {
            return new Dog();
        } else if (type.equalsIgnoreCase("Cat")) {
            return new Cat();
        }
        return null;
    }
}


