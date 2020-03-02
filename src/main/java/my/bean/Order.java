package my.bean;

import java.util.ArrayList;
import java.util.Date;

public class Order {
    private int id;
    private ArrayList<Item> items;
    private ArrayList<Integer> nums;
    private Date date;
    private int cost;
    private int fin;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void addItem(Item item) {
        boolean find = false;
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getName().equals(item.getName())) {
                find = true;
                int num = nums.get(i);
                nums.set(i, num + 1);
            }
        }
        if (!find) {
            items.add(item);
            nums.add(1);
        }
    }

    public void addItems(Item item, int num) {
        items.add(item);
        nums.add(num);
    }

    public void rmItem(Item item) {
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getName().equals(item.getName())) {
                int num = nums.get(i);
                if (num == 1) {
                    items.remove(i);
                    nums.remove(i);
                } else {
                    nums.set(i, num - 1);
                }
            }
        }
    }

    public ArrayList<Item> getItems() {
        return this.items;
    }

    public ArrayList<Integer> getNums() {
        return this.nums;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return this.date;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getCost() {
        return this.cost;
    }

    public void setFin(int fin) {
        this.fin = fin;
    }

    public int getFin() {
        return this.fin;
    }

    @Override
    public String toString() {
        StringBuilder s = new StringBuilder();
        for (int i = 0; i < items.size(); i++) {
            s.append(items.get(i).toString());
            s.append("x");
            s.append(String.valueOf(nums.get(i)));
            s.append(" ");
        }
        return s.toString();
    }
}